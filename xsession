#!/usr/bin/env bash 

# Load resources
xrdb -merge .Xresources

# Set up an icon tray --tint 0x191970
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

#set the background color
xsetroot -solid midnightblue

# start nm-applet
if [ -x /usr/bin/nm-applet ]; then
   nm-applet&
fi

exec xmonad
