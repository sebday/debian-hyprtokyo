#!/bin/bash

# Read the wallpaper path from stdin
read -r wallpaper

if [ -z "$wallpaper" ]; then
    echo "Error: No wallpaper path provided" >&2
    exit 1
fi

if [ ! -f "$wallpaper" ]; then
    echo "Error: File not found: $wallpaper" >&2
    exit 1
fi

# Check if the wallpaper is in the Widescreen directory
if [[ "$wallpaper" == *"/Widescreen/"* ]]; then
    # Extract the base filename and extension
    filename=$(basename -- "$wallpaper")
    base_filename="${filename%.*}"
    extension="${filename##*.}"
    
    # Remove the last digit from the base filename
    base_filename="${base_filename%?}"
    
    # Construct the full paths for the three wallpapers
    WALLPAPER_DIR=$(dirname "$wallpaper")
    FULL_PATH_1="$WALLPAPER_DIR/${base_filename}1.$extension"
    FULL_PATH_2="$WALLPAPER_DIR/${base_filename}2.$extension"
    FULL_PATH_3="$WALLPAPER_DIR/${base_filename}3.$extension"

    # Check if all three files exist
    if [ ! -f "$FULL_PATH_1" ] || [ ! -f "$FULL_PATH_2" ] || [ ! -f "$FULL_PATH_3" ]; then
        echo "Error: One or more wallpaper files not found" >&2
        exit 1
    fi

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$FULL_PATH_1"
    hyprctl hyprpaper preload "$FULL_PATH_2"
    hyprctl hyprpaper preload "$FULL_PATH_3"
    hyprctl hyprpaper wallpaper "HDMI-A-2,$FULL_PATH_1"
    hyprctl hyprpaper wallpaper "DP-2,$FULL_PATH_2"
    hyprctl hyprpaper wallpaper "DP-1,$FULL_PATH_3"
    hyprctl hyprpaper wallpaper "HDMI-A-1,$FULL_PATH_2"
    echo "Widescreen wallpapers set successfully"
else
    # Set regular wallpaper
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$wallpaper"
    hyprctl hyprpaper wallpaper "HDMI-A-2,$wallpaper"
    hyprctl hyprpaper wallpaper "DP-2,$wallpaper"
    hyprctl hyprpaper wallpaper "DP-1,$wallpaper"
    hyprctl hyprpaper wallpaper "HDMI-A-1,$wallpaper"
    echo "Regular wallpaper set successfully"
fi