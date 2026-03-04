#!/usr/bin/env bash

# CONFIG
WALL_DIR="$HOME/Pictures/Wallpaper"
TRANSITION="center"
DURATION=1

pgrep -x swww-daemon >/dev/null || swww init

# Step 1: Use Rofi to choose an image
selected=$(find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.gif' \) | sort | rofi -dmenu -i -p "󰸉 Choose wallpaper")

[ -z "$selected" ] && exit

# Step 2: Preview using qimgv (non-blocking)
qimgv "$selected" &

# Wait a moment so qimgv has time to launch
sleep 0.5

# Step 3: Ask confirmation using rofi
choice=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "Apply this wallpaper?")

# Step 4: Kill qimgv if still running
pkill -f "qimgv $selected"

# Step 5: If confirmed, apply wallpaper
if [[ "$choice" == "Yes" ]]; then
    swww img $selected --transition-type "$TRANSITION" --transition-duration "$DURATION" && wal -i $selected
    notify-send "Wallpaper changed" "$(basename "$selected")"
else
    notify-send "Wallpaper not changed"
fi

