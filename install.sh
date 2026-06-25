sudo mkdir -p /usr/share/icons/
sudo cp -rf Bibata-Modern-Ice/ /usr/share/icons/

mkdir -p ~/.config/
cp -rf mako/ hypr/ kitty/ mpv/ qt5ct/ qt6ct/ rofi/ waybar/ yazi/ ~/.config/

mkdir -p ~/Pictures/
cp -rf tux.png ~/Pictures/

awww-daemon & sleep 0.5 && awww img ~/Pictures/tux.png

sudo mkdir -p /usr/share/sddm/themes/
sudo cp -rf yaretsuo-monochrome-theme/ /usr/share/sddm/themes/
sudo cp -rf sddm.conf /etc/sddm.conf

mkdir -p ~/.icons/
cp -rf default/ ~/.icons/

clear
echo "It's highly recommended to reboot the PC"
