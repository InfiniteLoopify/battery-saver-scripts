#!/bin/bash

# low and critical battery level.
# at low battery level, notification will be sent to inform the user.
# at critcal battery level, urgent notification will be sent and if user does not plugin within the given Backup time (mentioned below), system will perform critical level action
# range = 0 - 100
# default: low=10, critcal=5
low=10
critical=5

# the time (in seconds) given to user to backup or plugin power, after critical level is reached
# default: backup=20
backupTime=20


# Select the critical Action which will be performed when battery is critical
# Values: suspend, poweroff, hibernate, hybrid-sleep
# default: criticalAction="suspend"
criticalAction="suspend"

# variable (boolean) stored in file to check if user has previously been notified or not.
notified=$(/usr/bin/cat $HOME/.script/CriticalBatterySleep.txt)

# get battery-level(0-100%) and state(discharging/charging)
battery=$(/usr/bin/cat /sys/class/power_supply/BAT0/capacity)
state=$(/usr/bin/cat /sys/class/power_supply/BAT0/status)

echo $battery
echo $state
echo $notified
if [ "$state" = "Discharging" ] ; then
    # if battery discharging and below low level then send notification
    if [ $battery -gt $critical ] && [ $battery -le $low ] && [ $notified -eq 0 ] ; then
        /usr/bin/notify-send 'Battery Low' 'Plugin to Recharge' --icon=battery-low
        let notified=1
    # if battery discharging and below critical level then send notification and wait for user action
    elif [ $battery -le $critical ] ; then
        tempTime=$(( $backupTime*1000 ))
        /usr/bin/notify-send "Turning off system in $backupTime sec(s)" 'Backup Data or Plugin to Recharge' --icon=battery-low --urgency=critical --expire-time=$tempTime
        /usr/bin/sleep $backupTime
        tempState=$(/usr/bin/cat /sys/class/power_supply/BAT0/status)
        # if battery still discharging, then perform critical action
        if [ "$tempState" = "Discharging" ] ; then
            executionCommand="/usr/bin/systemctl $criticalAction"
            eval $executionCommand
        # if battery is now pluged in, then do not perform critical action
        else
            let notified=0
        fi
    fi
else
    let notified=0
fi
echo $notified > $HOME/.script/CriticalBatterySleep.txt

exit 0




