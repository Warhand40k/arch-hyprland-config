#!/bin/bash

# Get current controller power state
STATE=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$STATE" = "yes" ]; then
    # Controller is ON → check connected devices
    CONNECTED_DEVICES=$(bluetoothctl info | grep "Connected: yes" | wc -l)

    if [ "$CONNECTED_DEVICES" -gt 0 ]; then
        notify-send "🔌 Connected device(s) found. Disconnecting..."
        DEVICES=$(bluetoothctl devices Connected | awk '{print $2}')
        for MAC in $DEVICES; do
            bluetoothctl disconnect "$MAC"
        done
    else
        notify-send " ❎ No devices connected. Turning Bluetooth OFF..."
        bluetoothctl power off
    fi

else
    notify-send "⚡ Bluetooth is OFF. Turning ON..."
    bluetoothctl power on
fi

