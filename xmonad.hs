import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import XMonad.Actions.TopicSpace
import XMonad.Actions.SpawnOn
import System.IO
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import XMonad.Util.CustomKeys
import XMonad.Prompt
import XMonad.Prompt.Workspace


myTerminal :: String
myTerminal = "urxvt" 

browserCmd="firefox"
scc4Cmd="scc4Start \"tmux\""
tmuxCmd=myTerminal ++ "-e tmux"

spawnShell :: X ()
spawnShell = currentTopicDir myTopicConfig >>= spawnShellIn

spawnShellIn :: Dir -> X ()
spawnShellIn dir = spawn $ myTerminal ++ "'(cd ''" ++ dir ++ "'' && " ++ myTerminal ++ " )'"



goto :: Topic -> X ()
goto = switchTopic myTopicConfig

myXPConfig =greenXPConfig { font = "xft:Profont:pixelsize=15:autohint=true" }

promptedGoto :: X ()
--promptedGoto = workspacePrompt myXPConfig goto
promptedGoto = topicActionWithPrompt myXPConfig myTopicConfig

promptedShift :: X ()
promptedShift = workspacePrompt myXPConfig $ windows . W.shift


myTopics::[Topic]
myTopics = 
     [ "aimless" --the first one 
     , "web" -- web
     , "scc4" -- scc4 
     , "programming" -- programming 
     ]


myTopicConfig :: TopicConfig
myTopicConfig = defaultTopicConfig 
       { topicDirs = M.fromList $
           [ ("web", "/home/anp4r")
           , ("aimless", ".")
           , ("scc4", ".")
           , ("programming", ".")
           ]
        , defaultTopicAction = const $ spawnShell >*> 2
        , defaultTopic = "aimless"
        , topicActions = M.fromList $
            [ ("web", spawnOn "web" browserCmd)
            , ("scc4", spawnOn "scc4" scc4Cmd )
            , ("programming", spawnOn "programming" tmuxCmd)
            ]
        } 
              
       
        


main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/anp4r/.xmobarrc"
    xmonad $ defaultConfig
	{ modMask = mod4Mask,
	  terminal = myTerminal,
          borderWidth = 2,
          focusedBorderColor = "#7fff00",
          normalBorderColor = "#5a6351",
          manageHook = manageDocks <+> manageHook defaultConfig,
          layoutHook = avoidStruts $ layoutHook defaultConfig,
          logHook = dynamicLogWithPP xmobarPP
                               { ppOutput = hPutStrLn xmproc,
                                 ppTitle = xmobarColor "green" "". shorten 50
                               }
        } `additionalKeysP` 
        [ ("M-g", promptedGoto)
         ,("M-S-g", promptedShift)
         ,("M-a", currentTopicAction myTopicConfig) ]
