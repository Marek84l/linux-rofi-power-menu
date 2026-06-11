#!/bin/bash

echo "This will remove the Rofi power menu files."
read -rp "Continue? [y/N]: " confirm

if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

rm -f "$HOME/.local/bin/power-menu"
rm -f "$HOME/.config/rofi/power-menu.rasi"

echo "Rofi power menu removed."
