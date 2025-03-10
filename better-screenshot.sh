#!/usr/bin/env bash

# Usage:
#
#   $ better-screenshot
#
# Then, either:
#   - drag and release the mouse to select an area to screenshot
#   - press spacebar and click the mouse to select the current window

# Construct a unique-ish filename like:
# ~/Desktop/screenshot-2024-03-16-16h43m48s.png
isoTime=$(date +"%Y-%m-%d-%Hh%Mm%Ss")
fileName="/Users/matt/Library/CloudStorage/Dropbox/Capture/screenshot-$isoTime.png"

# The -i will put the Screenshot app into interactive mode (like cmd-shift-4)
screencapture -i "$fileName"

if [ -f "$fileName" ]; then
  # This gnarly "«class PNGf»" incantation is for some reason necessary to copy the file
  osascript -e "set the clipboard to (read (POSIX file \"${fileName}\") as «class PNGf»)"
fi