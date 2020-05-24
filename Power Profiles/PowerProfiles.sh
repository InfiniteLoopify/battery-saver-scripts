#!/bin/bash

if [ $1 == 'reset' ]
then
    #to Default Mode
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -s 10
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-battery -s 10

        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-ac -s 60
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-battery -s 20
else
    blank=$(xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-battery -v)
    sleep=$(xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-battery -v)
    if [ $blank == 10 ] && [ $sleep == 20 ] 
    then
    #to Movie Mode
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -s 55
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-battery -s 55
        
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-ac -s 60
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-battery -s 60
        
        notify-send 'Power Profile: Movie' 'ScreenSaver time Increased' --icon=preferences-system-power
    elif [ $blank == 55 ] && [ $sleep == 60 ]
    then
    #to Installation Mode
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -s 10
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-battery -s 10

        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-ac -s 60
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-battery -s 60
        
        notify-send 'Power Profile: Installation' 'Sleep time Increased' --icon=preferences-system-power
    else
    #to Default Mode
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -s 10
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-battery -s 10

        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-ac -s 60
        xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-battery -s 20
        
        notify-send 'Power Profile: Default' 'Blank and Sleep time set to Default' --icon=preferences-system-power
    fi       
fi

# Default - 10+20 / 10+60
# Movie - 55+60 / 55+60
# Installation - 10+60 / 10+60
