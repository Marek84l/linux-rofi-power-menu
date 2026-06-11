# Linux Rofi Power Menu

A simple Rofi-based power menu for Linux desktops.

This setup was created for Linux Mint Cinnamon, but it can also be adapted for EndeavourOS, Arch Linux, i3, XFCE, GNOME and other Linux desktop environments.

It gives you a clean power menu with options for:

- Lock
- Suspend
- Logout
- Restart
- Shutdown

The menu can be launched with a custom keyboard shortcut, for example:

```text
Super + Shift + E
```

The style is inspired by minimalist Linux rice setups, EndeavourOS/i3 workflows and Tokyo Night colours.

## Screenshots

Add your screenshots here.

### Power Menu

![Power Menu](screenshots/power-menu.png)

## Features

- Simple Rofi menu
- Keyboard shortcut support
- Tokyo Night inspired theme
- Works well on Linux Mint Cinnamon
- Can be adapted for i3, EndeavourOS and other desktop environments
- Uses JetBrainsMono Nerd Font icons
- Lightweight and easy to modify

## Repository Structure

```text
linux-rofi-power-menu/
├── README.md
├── install.sh
├── uninstall.sh
├── power-menu
├── power-menu.rasi
├── LICENSE
└── screenshots/
    └── power-menu.png
```

## Installation Options

There are two ways to install this setup:

- **Option 1 — Automatic installation**: recommended for most users.
- **Option 2 — Manual installation**: useful if you want to understand each step.

---

## Option 1 — Automatic Installation

Clone the repository:

```bash
git clone https://github.com/YOUR-USERNAME/linux-rofi-power-menu.git
cd linux-rofi-power-menu
```

Make the installer executable:

```bash
chmod +x install.sh
```

Run the installer:

```bash
./install.sh
```

The installer will ask which type of system you use:

```text
1) Linux Mint / Ubuntu / Debian based
2) Arch / EndeavourOS based
3) Skip package installation
```

Choose:

- `1` for Linux Mint, Ubuntu, Debian and Ubuntu-based distributions
- `2` for EndeavourOS, Arch Linux and Arch-based distributions
- `3` if you already installed the required packages manually

The automatic installer will:

- install Rofi
- create the required folders
- copy `power-menu` to `~/.local/bin/power-menu`
- copy `power-menu.rasi` to `~/.config/rofi/power-menu.rasi`
- optionally install JetBrainsMono Nerd Font

After installation, test the menu:

```bash
~/.local/bin/power-menu
```

---

## Option 2 — Manual Installation

Use this option if you want to install everything yourself step by step.

### Install Rofi on Linux Mint / Ubuntu / Debian based systems

```bash
sudo apt update
sudo apt install rofi wget unzip
```

Optional for Linux Mint Cinnamon lock support:

```bash
sudo apt install cinnamon-screensaver
```

### Install Rofi on EndeavourOS / Arch based systems

```bash
sudo pacman -Syu
sudo pacman -S rofi wget unzip
```

### Install JetBrainsMono Nerd Font

```bash
mkdir -p ~/.local/share/fonts
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMonoNerd
fc-cache -fv
```

Check if the font is installed:

```bash
fc-list | grep -i "JetBrains"
```

### Create local folders

```bash
mkdir -p ~/.local/bin
mkdir -p ~/.config/rofi
```

### Copy files manually

From inside the cloned repository folder:

```bash
cp power-menu ~/.local/bin/power-menu
cp power-menu.rasi ~/.config/rofi/power-menu.rasi
chmod +x ~/.local/bin/power-menu
```

### Test the menu

```bash
~/.local/bin/power-menu
```

---

## Add Keyboard Shortcut on Linux Mint Cinnamon

Open:

```text
Menu → Keyboard → Shortcuts → Custom Shortcuts
```

Click:

```text
Add custom shortcut
```

Use:

```text
Name: Power Menu
Command: /home/YOUR-USERNAME/.local/bin/power-menu
```

Replace `YOUR-USERNAME` with your real Linux username.

You can check your home path with:

```bash
echo $HOME
```

Example:

```text
Command: /home/marek/.local/bin/power-menu
```

Then assign the shortcut:

```text
Super + Shift + E
```

If Cinnamon says this shortcut is already used, either replace the existing shortcut or choose another one, for example:

```text
Super + Shift + Q
```

## Alternative Shortcut Command

Some desktop environments allow this command:

```bash
bash -c "$HOME/.local/bin/power-menu"
```

If the direct `/home/username/...` path does not work, try this version in the custom shortcut command field.

## Adapting for EndeavourOS / i3

For i3, the script can use:

- `i3lock` for lock
- `i3-msg exit` for logout
- `systemctl suspend`
- `systemctl reboot`
- `systemctl poweroff`

Install `i3lock` if needed:

```bash
sudo pacman -S i3lock
```

Add this to your i3 config:

```bash
bindsym $mod+Shift+e exec --no-startup-id ~/.local/bin/power-menu
```

Reload i3:

```text
Mod + Shift + R
```

## Uninstall

Run:

```bash
chmod +x uninstall.sh
./uninstall.sh
```

The uninstall script removes:

```text
~/.local/bin/power-menu
~/.config/rofi/power-menu.rasi
```

## Troubleshooting

### Icons show as squares

Install a Nerd Font, for example JetBrainsMono Nerd Font, and make sure the Rofi theme uses:

```css
font: "JetBrainsMono Nerd Font 12";
```

### Lock does not work on Cinnamon

Test:

```bash
cinnamon-screensaver-command -l
```

If it does not work, install Cinnamon screensaver:

```bash
sudo apt install cinnamon-screensaver
```

### Logout does not work on Cinnamon

Test:

```bash
cinnamon-session-quit --logout
```

### Menu does not open with shortcut

Test the script manually:

```bash
~/.local/bin/power-menu
```

If it works manually but not from the shortcut, use the full path:

```bash
/home/YOUR-USERNAME/.local/bin/power-menu
```

or:

```bash
bash -c "$HOME/.local/bin/power-menu"
```

### Rofi opens but looks unstyled

Check if the theme file exists:

```bash
ls ~/.config/rofi/power-menu.rasi
```

If it does not exist, copy it again:

```bash
cp power-menu.rasi ~/.config/rofi/power-menu.rasi
```

## Licence

MIT Licence.

Use it, modify it, share it and enjoy Linux.
