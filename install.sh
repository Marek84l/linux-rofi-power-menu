#!/bin/bash

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

clear
echo "======================================"
echo " Linux Rofi Power Menu Installer"
echo "======================================"
echo

echo "This installer will:"
echo "  - install Rofi"
echo "  - copy power-menu to ~/.local/bin"
echo "  - copy power-menu.rasi to ~/.config/rofi"
echo "  - optionally install JetBrainsMono Nerd Font"
echo

echo "Choose your system:"
echo "1) Linux Mint / Ubuntu / Debian based"
echo "2) Arch / EndeavourOS based"
echo "3) Skip package installation"
echo

read -rp "Enter choice [1-3]: " choice

case "$choice" in
    1)
        sudo apt update
        sudo apt install -y rofi wget unzip
        if command -v cinnamon-session >/dev/null 2>&1 || [ -n "$CINNAMON_VERSION" ]; then
            sudo apt install -y cinnamon-screensaver || true
        fi
        ;;
    2)
        sudo pacman -Syu --needed rofi wget unzip
        ;;
    3)
        echo "Skipping package installation."
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config/rofi"

cp "$REPO_DIR/power-menu" "$HOME/.local/bin/power-menu"
cp "$REPO_DIR/power-menu.rasi" "$HOME/.config/rofi/power-menu.rasi"

chmod +x "$HOME/.local/bin/power-menu"

echo
read -rp "Install JetBrainsMono Nerd Font? [y/N]: " install_font

if [[ "$install_font" =~ ^[Yy]$ ]]; then
    FONT_DIR="$HOME/.local/share/fonts/JetBrainsMonoNerd"
    mkdir -p "$FONT_DIR"
    TMP_ZIP="/tmp/JetBrainsMono.zip"

    wget -O "$TMP_ZIP" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    unzip -o "$TMP_ZIP" -d "$FONT_DIR"
    rm -f "$TMP_ZIP"
    fc-cache -fv >/dev/null

    echo "JetBrainsMono Nerd Font installed."
else
    echo "Skipping font installation."
fi

echo
echo "Installation complete."
echo
echo "Test the menu with:"
echo "  ~/.local/bin/power-menu"
echo
echo "Linux Mint Cinnamon shortcut:"
echo "  Menu -> Keyboard -> Shortcuts -> Custom Shortcuts"
echo "  Command: $HOME/.local/bin/power-menu"
echo "  Suggested shortcut: Super + Shift + E"
echo
echo "i3 shortcut:"
echo "  bindsym \$mod+Shift+e exec --no-startup-id ~/.local/bin/power-menu"
echo
