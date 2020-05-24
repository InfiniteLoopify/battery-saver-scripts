#!/bin/bash

if [ $1 == 'reset' ]; then
    xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -s false
else
    isPresentation=$(xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -v)
    if [ $isPresentation == 'true' ]; then
        notify-send 'Presentation Mode Off' 'Screensaver and Suspend Mode Enabled.' --icon=gnome-mplayer
    else
        notify-send 'Presentation Mode On' 'Screensaver and Suspend Mode Disabled.' --icon=gnome-mplayer
    fi
    xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -T
fi
