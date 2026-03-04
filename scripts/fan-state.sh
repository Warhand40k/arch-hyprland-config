#!/bin/bash

STATE_FILE="$HOME/.cache/nbfc_fan_state"

# Initialize state
if [ ! -f "$STATE_FILE" ]; then
    echo "auto" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" == "auto" ]; then
    echo '󰈸'   # example icon for manual
else
    echo '󰈹'   # example icon for auto
fi
