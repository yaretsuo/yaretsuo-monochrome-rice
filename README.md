# yaretsuo-monochrome-rice

Pure minimalist black and white Hyprland rice that uses only cli versions of the apps.

<img width="1914" height="1074" alt="image" src="https://github.com/user-attachments/assets/401cd141-f140-4f31-805f-6e192b2db005" />

# Getting started

This rice implies black and white Hyprland theme for Arch Linux. Before installing, you need to make sure that several packages are preinstalled on your machine (including drivers on GPU):

```bash
pacstrap /mnt base linux linux-firmware grub efibootmgr base-devel vim bash-completion networkmanager git kitty
```

Required dependencies:

```bash
sudo pacman -S --needed qt5ct qt6ct xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprland ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd mpv woff2-font-awesome orchis-theme gnome-themes-extra waybar rofi hyprcursor mako qt5-declarative qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects papirus-icon-theme noto-fonts noto-fonts-cjk noto-fonts-emoji btop sddm fastfetch pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber grim slurp wl-clipboard cliphist awww imagemagick pulsemixer swayimg unzip 7zip yazi zoxide ripgrep fd fzf libnotify
```

# Hyprland

| App | Bind |
|----------|----------|
| Terminal | SUPER + Q |
| File Manager | SUPER + E |
| Process viewer | SUPER + Z |
| Close app | SUPER + C |
| Screenshot | SUPER + S |
| Clipboard history | SUPER + V |
| App launcher | SUPER |

Cursor: [Bibata-Modern-Ice](https://github.com/ful1e5/Bibata_Cursor)

GTK theme: [Orchis](https://github.com/vinceliuice/Orchis-theme)

Icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

# Waybar

There are 5 workspaces in the left module, the clock is in the middle and the tray is in the right:

<img width="1914" height="26" alt="image" src="https://github.com/user-attachments/assets/3504d0ac-e6db-4021-9a55-fc527c02abde" />

# Rofi

<img width="644" height="361" alt="image" src="https://github.com/user-attachments/assets/6690d671-4d44-4f21-8da2-5114281e5fbe" />

# Yazi

<img width="1914" height="1037" alt="image" src="https://github.com/user-attachments/assets/6f86316f-fe98-4e7b-86a9-23bed18483ec" />

| Action | Bind |
|----------|----------|
| Moving between folders | ← → |
| Unzip an archive | Enter |
| Trash file | D |
| Delete file permanently | SHIFT + D |
| Select multiple files | V |
| Global search | S |

# MPV

<img width="1253" height="744" alt="image" src="https://github.com/user-attachments/assets/bb1b4fce-ee60-4ae3-80aa-22ab06701026" />

# Mako

<img width="320" height="98" alt="image_2026-06-25_18-30-33" src="https://github.com/user-attachments/assets/885b1e73-e144-440b-b53f-d9a66b0088f2" />


# AWWW

You can put any background into the ~/Pictures directory

# SDDM login theme

<img width="1914" height="1074" alt="image" src="https://github.com/user-attachments/assets/e3930afb-5ad7-46cd-9720-bad6dfd3a090" />

# Firefox theme

<img width="1914" height="1038" alt="image" src="https://github.com/user-attachments/assets/e0f08d0f-38a6-42e4-9ba1-111ad291c43e" />

Beautiful animated [theme](https://addons.mozilla.org/en-US/firefox/addon/nicothin-space/) for firefox

# Installation

```bash
git clone https://github.com/yaretsuo/yaretsuo-monochrome-rice.git
cd yaretsuo-monochrome-rice
bash install.sh
```

It's highly recommended to reboot the PC after the installation is complete

# Troubleshooting background issues

Q: My background didn't apply, what should I do?

A: Press SUPER + Q and paste:
```bash
pkill awww; awww-daemon & sleep 1 && awww img ~/Pictures/wallpaper.extension
```
Reboot a computer

# Troubleshooting resolution issues

Q: How to set my resolution and refresh rate?

A: Press SUPER + Q and write:
```bash
hyprctl monitors
```
The terminal will print DP-1, HDMI-1 etc.

```bash
vim .config/hypr/hyprland.conf
```
You need to modify the first line of this file. If you got 1920x1080 resolution with 144 refresh rate connected via DisplayPort, paste this:
```bash
hl.monitor({ output = "DP-1", mode = "1920x1080@144", position = "auto", scale = 1 })
```
