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

export _JAVA_AWT_WM_NONREPARENTING=1

setlaptopcaps.sh
set-backlight.sh
monitor-backlight.sh &
xset s 0
dunst &
unclutter &
numlockx &
# pasystray &
picom -b
xdg-mime default org-protocol.desktop x-scheme-handler/org-protocol
xhost +
emacs -f exwm-enable

#exec startxfce4

#exec herbstluftwm

#export DESKTOP_SESSION=plasma
#exec startplasma-x11
