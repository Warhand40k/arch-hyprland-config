#!/bin/bash

# Get the default sink
SINK=$(pactl get-default-sink)

# Get the current volume of that sink (first channel)
CURRENT_VOLUME=$(pactl get-sink-volume "$SINK" | grep -oP '\d+%' | head -1 | tr -d '%')

# Toggle between 0 and 100
if [ "$CURRENT_VOLUME" -eq 0 ]; then
    pactl set-sink-volume "$SINK" 100%
else
    pactl set-sink-volume "$SINK" 0%
fi

