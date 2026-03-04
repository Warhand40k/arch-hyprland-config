#!/bin/bash

STATE_FILE="$HOME/.cache/nbfc_fan_state"

STATE=$(cat "$STATE_FILE")

if [ "$STATE" == "auto" ]; then
    nbfc set -s 30
    echo "manual" > "$STATE_FILE"
else
    nbfc set -a
    echo "auto" > "$STATE_FILE"
fi

