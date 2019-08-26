#!/bin/bas
trap "exit" SIGINT
while true
do
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
	discharging=$(acpi -b | grep  Discharging)
    if [[ $battery_level -le 15 && "$discharging" ]] ; then
       notify-send "Battery is lower 15%!" "Charging: ${battery_level}%" && paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga    
	   echo ping
    fi

    
done
