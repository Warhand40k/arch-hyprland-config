#!/bin/bash

HOUR=$(date +%H)

if [ "$HOUR" -ge 5 ] && [ "$HOUR" -lt 9 ]; then
  ICON=" " # sunrise
elif [ "$HOUR" -ge 9 ] && [ "$HOUR" -lt 17 ]; then
  ICON=" " # day
elif [ "$HOUR" -ge 17 ] && [ "$HOUR" -lt 20 ]; then
  ICON="󰖚 " # sunset
else
  ICON="󰖔 " # night
fi

echo $ICON

