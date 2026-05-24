sudo cp -rf Bibata-Modern-Ice/ /usr/share/icons/
cp -rf dunst/ hypr/ kitty/ mpv/ qt5ct/ qt6ct/ rofi/ waybar/ yazi/ ~/.config/
mkdir -p ~/Pictures/ && cp -rf tux.png ~/Pictures/
awww-daemon && awww img ~/Pictures/tux.png
sudo cp -rf yaretsuo-monochrome-theme/ /usr/share/sddm/themes/
sudo cp -rf sddm.conf /etc/sddm.conf
cp -rf default/ ~/.icons/
clear
echo "It's highly recommended to reboot the PC"
