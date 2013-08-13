execute pathogen#infect()
set nocompatible
filetype plugin on
filetype indent on
syntax on
set shiftwidth=4
set expandtab
set ofu=syntaxcomplete#Complete
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set background=dark
let vimrplugin_tmux=0
let vimrplugin_screenplugin=0
let vimrplugin_term="rxvt"

let noweb_fold_code=2
let noweb_language="python"
au BufReadPost *.nw set filetype=noweb 
"Screen options
let g:ScreenShellExternal=1
let g:ScreenShellTerminal='urxvt'
let g:ScreenShellQuitOnVimExit=0
vnoremap <leader>se :ScreenSend<cr>
nnoremap <leader>ls <esc>0v$:ScreenSend<cr> 
"new mapping
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap <leader>date :r !date <return>
"Status bar
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"New abbreviations
iabbrev @@ anp4r@virginia.edu
au FileType cpp set makeprg=g++\ %
au FileType haskell set makeprg=ghc\ %
