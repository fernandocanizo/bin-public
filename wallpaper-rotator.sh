#!/usr/bin/env bash

# Folder with lockscreen wallpapers
WALLDIR="$HOME/Dropbox/wallpapers"

# Find a random image (png/jpg/jpeg)
img="$(find "$WALLDIR" -maxdepth 1 -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)"

# If no image found, bail out
[ -n "$img" ] || exit 1

# Call i3lock with the selected image
# Tweak options to taste
i3lock \
  --image "$img" \
  --fill \
  --inside-color=00000000 \
  --ring-color=ffffffff \
  --line-color=00000000 \
  --keyhl-color=88c0d0ff \
  --bshl-color=bf616aff \
  --separator-color=00000000 \
  --insidever-color=00000000 \
  --insidewrong-color=00000000 \
  --ringver-color=88c0d0ff \
  --ringwrong-color=bf616aff \
  --indicator \
  --radius=120

