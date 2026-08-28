# yaretsuo-monochrome-rice

Pure minimalist black and white Hyprland rice that uses only cli versions of the apps.

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/3c234c2b-5f65-4578-9164-607fa438bd80" />

# Getting started

This rice implies black and white Hyprland theme for Arch Linux. Before installing, you need to make sure that several packages are preinstalled on your machine (including drivers on GPU):

```bash
sudo pacman -S --needed base linux linux-firmware grub efibootmgr base-devel vim bash-completion networkmanager git kitty qt5ct qt6ct xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprland ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd mpv woff2-font-awesome orchis-theme gnome-themes-extra waybar rofi hyprcursor mako qt5-declarative qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects papirus-icon-theme noto-fonts noto-fonts-cjk noto-fonts-emoji btop sddm fastfetch pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber grim slurp wl-clipboard cliphist awww imagemagick pulsemixer swayimg unzip 7zip yazi zoxide ripgrep fd fzf libnotify udisks2 udiskie rsync
```

# Hyprland

| App | Bind |
|----------|----------|
| Terminal | SUPER + Q |
| File Manager | SUPER + E |
| Process viewer | SUPER + Z |
| Close app | SUPER + C |
| Screenshot | SUPER + S |
| Fullscreen | SUPER + F |
| Clipboard history | SUPER + V |
| Wallpaper selector | SUPER + W |
| App launcher | SUPER |

Cursor: [Bibata-Modern-Ice](https://github.com/ful1e5/Bibata_Cursor)

GTK theme: [Orchis](https://github.com/vinceliuice/Orchis-theme)

Icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

# Waybar

There are 5 workspaces in the left module, the clock is in the middle and the tray is in the right:

<img width="1914" height="26" alt="image" src="https://github.com/user-attachments/assets/3504d0ac-e6db-4021-9a55-fc527c02abde" />

# Rofi

<img width="621" height="413" alt="image" src="https://github.com/user-attachments/assets/229666c5-6a13-4480-9909-4e50ad6afeaf" />

# Yazi

<img width="1920" height="1044" alt="image" src="https://github.com/user-attachments/assets/6b247af8-0403-45e7-9fcb-dd6008045441" />

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

Any background can be added to the ~/Pictures directory. To change the background you want, press SUPER + W

<img width="631" height="421" alt="image" src="https://github.com/user-attachments/assets/bff07871-904a-402b-913e-4451bf1c85d1" />

# SDDM login theme

<img width="1914" height="1074" alt="image" src="https://github.com/user-attachments/assets/e3930afb-5ad7-46cd-9720-bad6dfd3a090" />

# Firefox theme

<img width="1914" height="1038" alt="image" src="https://github.com/user-attachments/assets/e0f08d0f-38a6-42e4-9ba1-111ad291c43e" />

Beautiful animated [theme](https://addons.mozilla.org/en-US/firefox/addon/nicothin-space/) for firefox

# Installation

```bash
git clone https://github.com/yaretsuo/yaretsuo-monochrome-rice.git
cd yaretsuo-monochrome-rice
./install.sh
```

It's highly recommended to reboot the PC after the installation is complete

# Troubleshooting background issues

Q: My background didn't apply, what should I do?

A: Press SUPER + Q and paste:
```bash
pkill awww; awww-daemon & disown; awww img ~/Pictures/archlinux.png
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
vim .config/hypr/hyprland.lua
```
You need to modify the first line of this file. If you got 1920x1080 resolution with 144 refresh rate connected via DisplayPort, paste this:
```bash
hl.monitor({ output = "DP-1", mode = "1920x1080@144", position = "auto", scale = 1 })
```
