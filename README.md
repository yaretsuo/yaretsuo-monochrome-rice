# yaretsuo-monochrome-rice

A minimalist pure black and white rice

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e61813e1-fd33-4d76-9815-ff270c64bd85" />

# Getting started

This rice implies black and white Hyprland theme for Arch Linux. Before installing, you need to make sure that several packages are preinstalled on your Arch Linux (including drivers on GPU)

```bash
sudo pacman -S base linux linux-firmware grub efibootmgr base-devel vim bash-completion networkmanager git alacritty
```

Required dependencies

```bash
sudo pacman -S qt5ct qt6ct kvantum kvantum-qt5 xdg-desktop-portal-hyprland xdg-desktop-portal-gtk nwg-look hyprland ttf-cascadia-code-nerd nm-connection-editor ttf-jetbrains-mono-nerd waybar rofi hyprcursor dunst qt5-declarative qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects papirus-icon-theme orchis-theme noto-fonts noto-fonts-cjk noto-fonts-emoji sddm fastfetch pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber grim slurp wl-clipboard nemo vlc vlc-plugins-all swww pavucontrol loupe
```

If you prefer other packages, you can replace them with your own (eg. nemo -> dolphin)

# Hyprland

| App | Bind |
|----------|----------|
| Terminal | SUPER + Q |
| File Manager | SUPER + E |
| Halt | SUPER + C |
| Screenshot | SUPER + S |
| App launcher | SUPER |

Cursor: [Bibata-Modern-Ice](https://github.com/ful1e5/Bibata_Cursor)

Folder icons: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

Theme: [Orchis](https://github.com/vinceliuice/Orchis-theme)

# Waybar

There are 5 workspaces in the left module, the clock is in the middle and the tray is in the right

<img width="1920" height="34" alt="image" src="https://github.com/user-attachments/assets/231d2a07-55af-4b02-8d12-5db9a9cfa149" />

# Rofi

<img width="609" height="490" alt="image" src="https://github.com/user-attachments/assets/10520683-f3ab-46af-a7e4-d08d1de78439" />

# Dunst

<img width="350" height="193" alt="image" src="https://github.com/user-attachments/assets/9e72392f-c6fc-4b86-b116-513f25eddd36" />

# SWWW

You can put any background into the ~/Pictures directory, but if you want to use the default [background](https://www.freepik.com/free-photo/black-white-dramatic-landscapes-with-forest_33417175.htm#fromView=search&page=1&position=9&uuid=5ed8f481-106c-40e1-a494-a12a3cd5e907&query=black+and+white+aesthetic+hills), go ahead

# Installation

```bash
git clone https://github.com/yaretsuo/yaretsuo-monochrome-rice.git
cd yaretsuo-monochrome-rice
chmod +x install.sh
./install.sh
```

It's highly recommended to reboot the PC after the installation is complete

# Troubleshooting

Q: My background didn't apply, what should I do?

A: Press SUPER + Q and paste:
```bash
pkill swww; swww-daemon & swww img ~/Pictures/yourwallpapername.extension
```
