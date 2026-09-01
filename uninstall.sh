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

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

echo -e "${BOLD}=== Yaretsuo Monochrome Rice Uninstaller ===${RESET}\n"

log_info "Removing deployed config directories from $CONFIG_DIR..."
CONFIGS=("mako" "hypr" "kitty" "mpv" "swayimg" "qt5ct" "qt6ct" "rofi" "waybar" "yazi")

for cfg in "${CONFIGS[@]}"; do
    if [ -d "$CONFIG_DIR/$cfg" ]; then
        log_warn "Removing $CONFIG_DIR/$cfg"
        rm -rf "$CONFIG_DIR/$cfg"
    fi
done

if [ -d "$HOME/.icons/default" ]; then
    log_warn "Removing $HOME/.icons/default"
    rm -rf "$HOME/.icons/default"
fi

log_info "Removing system assets and SDDM configurations..."

if [ -d "/usr/share/icons/Bibata-Modern-Ice" ]; then
    log_warn "Removing /usr/share/icons/Bibata-Modern-Ice"
    sudo rm -rf "/usr/share/icons/Bibata-Modern-Ice"
fi

if [ -d "/usr/share/sddm/themes/yaretsuo-monochrome-theme" ]; then
    log_warn "Removing /usr/share/sddm/themes/yaretsuo-monochrome-theme"
    sudo rm -rf "/usr/share/sddm/themes/yaretsuo-monochrome-theme"
fi

if [ -f "/etc/sddm.conf.d/yaretsuo-monochrome.conf" ]; then
    log_warn "Removing /etc/sddm.conf.d/yaretsuo-monochrome.conf"
    sudo rm -f "/etc/sddm.conf.d/yaretsuo-monochrome.conf"
fi

BASHRC="$HOME/.bashrc"
if [ -f "$BASHRC" ]; then
    log_info "Cleaning up aliases from $BASHRC..."
    sed -i "/alias sudo='sudo '/d" "$BASHRC"
    sed -i "/alias cp=/d" "$BASHRC"
    sed -i "/alias mv=/d" "$BASHRC"
    sed -i "/export EDITOR='vim'/d" "$BASHRC"
    sed -i "/export VISUAL='vim'/d" "$BASHRC"
fi

echo ""
log_success "All rice files and configurations have been successfully removed!"
