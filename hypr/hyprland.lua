local hl = require("hyprland")

local terminal = "kitty"
local fileManager = "kitty -e yazi"
local menu = "rofi -show drun -theme ~/.config/rofi/config.rasi"
local screenshot = 'grim -g "$(slurp)" - | magick - -shave 3x3 - | wl-copy'

hl.settings = {
    monitor = "preferred,auto,0x0,1",
    
    exec_once = {
        "waybar",
        "awww-daemon && sleep 0.5 && awww img ~/Pictures/tux.png",
        "dunst",
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME",
        "hyprctl setcursor Bibata-Modern-Ice 24",
        "gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-Dark'",
        "gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'",
        "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'",
        "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'",
        "cliphist wipe",
        "wl-paste --type text --watch cliphist store",
        "wl-paste --type image --watch cliphist store"
    },
    
    env = {
        "GDK_BACKEND,wayland,x11,*",
        "QT_QPA_PLATFORMTHEME,qt5ct",
        "QT_QPA_PLATFORMTHEME,qt6ct",
        "QT_QPA_PLATFORM,wayland;xcb",
        "XDG_CURRENT_DESKTOP,Hyprland",
        "XDG_SESSION_TYPE,wayland",
        "XDG_SESSION_DESKTOP,Hyprland",
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1",
        "QT_AUTO_SCREEN_SCALE_FACTOR,1",
        "XCURSOR_THEME,Bibata-Modern-Ice",
        "XCURSOR_SIZE,24",
        "ADW_DISABLE_PORTAL,1",
        "GTK_THEME,Orchis-Dark"
    },
    
    input = {
        kb_layout = "us",
        kb_options = "grp:alt_shift_toggle",
        follow_mouse = 1,
        sensitivity = 0.2,
        accel_profile = "flat",
        repeat_rate = 50,
        repeat_delay = 250
    },
    
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col_active_border = "rgba(ffffffff)",
        col_inactive_border = "rgba(00000000)",
        layout = "dwindle"
    },
    
    decoration = {
        rounding = 10,
        shadow = {
            enabled = false
        },
        blur = {
            enabled = true
        }
    },
    
    animations = {
        enabled = true,
        bezier = {
            "myBezier, 0.05, 0.9, 0.1, 1.05",
            "easeOutExpo, 0.16, 1, 0.3, 1"
        },
        animation = {
            "windows, 1, 7, myBezier, popin 80%",
            "windowsIn, 1, 7, myBezier, popin 80%",
            "windowsOut, 1, 5, myBezier, popin 80%",
            "fade, 1, 7, myBezier",
            "workspaces, 1, 7, easeOutExpo, slide",
            "specialWorkspace, 1, 6, myBezier, fade"
        }
    }
}

local mainMod = "SUPER"

hl.bind = {
    { mod = mainMod, key = "Q", action = hl.dsp.exec_cmd(terminal) },
    { mod = mainMod, key = "C", action = hl.dsp.killactive },
    { mod = mainMod, key = "E", action = hl.dsp.exec_cmd(fileManager) },
    { mod = mainMod, key = "S", action = hl.dsp.exec_cmd(screenshot) },
    { mod = "SUPER", key = "V", action = hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy") },
    
    { mod = mainMod, key = "SUPER_L", action = hl.dsp.exec_cmd("pkill rofi || " .. menu), is_release = true },
    
    { mod = mainMod, key = "1", action = hl.dsp.workspace(1) },
    { mod = mainMod, key = "2", action = hl.dsp.workspace(2) },
    { mod = mainMod, key = "3", action = hl.dsp.workspace(3) },
    { mod = mainMod, key = "4", action = hl.dsp.workspace(4) },
    { mod = mainMod, key = "5", action = hl.dsp.workspace(5) },
    
    { mod = mainMod, key = "mouse:272", action = hl.dsp.movewindow, is_mouse = true },
    { mod = mainMod, key = "mouse:273", action = hl.dsp.resizewindow, is_mouse = true }
}

hl.windowrule = {
    "float, class:mpv",
    "center, class:mpv",
    "size 1200 720, class:mpv"
}