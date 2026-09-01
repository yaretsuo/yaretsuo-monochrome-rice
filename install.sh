#!/usr/bin/env bash
set -euo pipefail

BOLD="\033[1m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
RESET="\033[0m"

log_info()    { echo -e "${BLUE}${BOLD}[INFO]${RESET} $1"; }
log_success() { echo -e "${GREEN}${BOLD}[OK]${RESET} $1"; }
log_warn()    { echo -e "${YELLOW}${BOLD}[WARN]${RESET} $1"; }
log_error()   { echo -e "${RED}${BOLD}[ERROR]${RESET} $1"; }

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
BACKUP_DIR="$HOME/.config-backup/backup_$(date +%Y%m%d_%H%M%S)"

echo -e "${BOLD}=== Yaretsuo Monochrome Rice Installer ===${RESET}\n"

command -v sudo >/dev/null 2>&1 || { log_error "sudo is required but not installed. Aborting."; exit 1; }
command -v pacman >/dev/null 2>&1 || { log_error "pacman is required but not found. This rice is intended for Arch Linux. Aborting."; exit 1; }

log_info "Installing required packages via pacman..."
DEPENDENCIES=(
    base linux linux-firmware grub efibootmgr base-devel vim bash-completion networkmanager git
    kitty qt5ct qt6ct xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprland
    ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd mpv woff2-font-awesome orchis-theme gnome-themes-extra
    waybar rofi hyprcursor mako qt5-declarative qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects
    papirus-icon-theme noto-fonts noto-fonts-cjk noto-fonts-emoji btop sddm fastfetch
    pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber grim slurp wl-clipboard cliphist
    awww imagemagick pulsemixer swayimg unzip 7zip yazi zoxide ripgrep fd fzf libnotify
    udiskie udisks2 rsync
)

sudo pacman -S --needed "${DEPENDENCIES[@]}"

log_info "Checking for existing user configurations..."
CONFIGS=("mako" "hypr" "kitty" "mpv" "swayimg" "qt5ct" "qt6ct" "rofi" "waybar" "yazi")
BACKUP_CREATED=false

for cfg in "${CONFIGS[@]}"; do
    if [ -d "$CONFIG_DIR/$cfg" ]; then
        if [ "$BACKUP_CREATED" = false ]; then
            mkdir -p "$BACKUP_DIR"
            BACKUP_CREATED=true
        fi
        log_warn "Backing up existing $CONFIG_DIR/$cfg -> $BACKUP_DIR/"
        mv "$CONFIG_DIR/$cfg" "$BACKUP_DIR/"
    fi
done

if [ "$BACKUP_CREATED" = true ]; then
    log_success "Existing configurations were backed up to: $BACKUP_DIR"
fi

log_info "Deploying configuration files to $CONFIG_DIR..."
mkdir -p "$CONFIG_DIR"
for cfg in "${CONFIGS[@]}"; do
    if [ -d "$REPO_ROOT/$cfg" ]; then
        cp -rf "$REPO_ROOT/$cfg" "$CONFIG_DIR/"
    fi
done

if [ -d "$CONFIG_DIR/hypr/scripts" ]; then
    chmod +x "$CONFIG_DIR/hypr/scripts/"*.sh 2>/dev/null || true
fi

if [ -f "$CONFIG_DIR/qt5ct/qt5ct.conf" ]; then
    sed -i "s|^color_scheme_path=.*|color_scheme_path=$CONFIG_DIR/qt5ct/colors/Blackout.conf|" "$CONFIG_DIR/qt5ct/qt5ct.conf"
fi
if [ -f "$CONFIG_DIR/qt6ct/qt6ct.conf" ]; then
    sed -i "s|^color_scheme_path=.*|color_scheme_path=$CONFIG_DIR/qt6ct/colors/Blackout.conf|" "$CONFIG_DIR/qt6ct/qt6ct.conf"
fi

log_info "Configuring bash environment (~/.bashrc)..."
BASHRC="$HOME/.bashrc"
touch "$BASHRC"

ALIASES=(
    "alias sudo='sudo '"
    "alias cp='rsync -ah --info=progress2 --no-inc-recursive --fsync'"
    "alias mv='rsync -ah --info=progress2 --no-inc-recursive --fsync --remove-source-files'"
    "export EDITOR='vim'"
    "export VISUAL='vim'"
)

for entry in "${ALIASES[@]}"; do
    if ! grep -Fxq "$entry" "$BASHRC"; then
        echo "$entry" >> "$BASHRC"
    fi
done

log_info "Deploying wallpapers and icons..."
mkdir -p "$HOME/Pictures"
if [ -d "$REPO_ROOT/Pictures" ]; then
    cp -rf "$REPO_ROOT/Pictures/." "$HOME/Pictures/"
fi

if [ -d "$REPO_ROOT/default" ]; then
    mkdir -p "$HOME/.icons"
    cp -rf "$REPO_ROOT/default" "$HOME/.icons/"
fi

log_info "Installing system assets (requires sudo)..."

if [ -d "$REPO_ROOT/Bibata-Modern-Ice" ]; then
    sudo mkdir -p /usr/share/icons/
    sudo cp -rf "$REPO_ROOT/Bibata-Modern-Ice" /usr/share/icons/
fi

if [ -d "$REPO_ROOT/yaretsuo-monochrome-theme" ]; then
    sudo mkdir -p /usr/share/sddm/themes/
    sudo cp -rf "$REPO_ROOT/yaretsuo-monochrome-theme" /usr/share/sddm/themes/
fi

if [ -f "$REPO_ROOT/sddm.conf" ]; then
    sudo mkdir -p /etc/sddm.conf.d/
    sudo cp -f "$REPO_ROOT/sddm.conf" /etc/sddm.conf.d/yaretsuo-monochrome.conf
fi

echo ""
log_success "Installation finished successfully!"
echo -e "${BOLD}Recommendation:${RESET} Reboot or log out of your session to apply all settings cleanly.\n"
