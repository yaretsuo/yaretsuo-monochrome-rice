#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/Pictures"

[ ! -d "$WALLPAPER_DIR" ] && exit 1

SELECTED=$(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | sort | while IFS= read -r img; do
        filename=$(basename "$img")
        printf "%s\0icon\x1f%s\n" "$filename" "$img"
    done | rofi -dmenu -p " "
)

if [ -n "$SELECTED" ]; then
    awww img "$WALLPAPER_DIR/$SELECTED" \
        --transition-type fade \
        --transition-duration 1.5 \
        --transition-fps 60 \
        --transition-bezier 0.16,1,0.3,1
fi
