#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#xss-lock -l -- ~/bin/transfer-sleep-lock-generic-delay.sh &
xrandr --output HDMI-1 --off \
       --output DP-0 --scale 2x2 --pos 0x0 \
       --output DP-2 --primary --scale 1.5x1.5 --pos 3840x0

export _JAVA_AWT_WM_NONREPARENTING=1

monitor-backlight.sh &
MultipleDropboxInstances.sh &
xset s 0
dunst &
udiskie --tray &
unclutter &
numlockx &
birdtray &
# pasystray &
xcompmgr &
xdg-mime default org-protocol.desktop x-scheme-handler/org-protocol
xhost +
emacs -f exwm-enable
