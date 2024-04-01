#!/bin/bash

#sudo apt update && sudo apt upgrade -y

apt update
apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev terminator mpv wget zsh polybar net-tools kitty

mkdir -p ~/.local/share/fonts/

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/RobotoMono.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.tar.xz

tar -xvf Iosevka.tar.xz -C ~/.local/share/fonts/
tar -xvf RobotoMono.tar.xz -C ~/.local/share/fonts/
tar -xvf Hack.tar.xz -C ~/.local/share/fonts/

rm Iosevka.tar.xz
rm RobotoMono.tar.xz
rm Hack.tar.xz

fc-cache -fv

cargo install alacritty
# wget https://github.com/barnumbirr/alacritty-debian/releases/download/v0.10.0-rc4-1/alacritty_0.10.0-rc4-1_amd64_bullseye.deb
# sudo dpkg -i alacritty_0.10.0-rc4-1_amd64_bullseye.deb
# sudo apt install -f

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..

pip3 install pywal

mkdir -p ~/.config/i3
mkdir -p ~/.config/compton
mkdir -p ~/.config/rofi
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/polybar
mkdir -p ~/.config/terminator
cp config/kitty ~/.config/kitty
cp config/terminator/config ~/.config/terminator/
cp config/polybar/* ~/.config/polybar/
cp -r config/bin ~/.config/
cp config/i3/config ~/.config/i3/config
cp config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
cp config/compton/compton.conf ~/.config/compton/compton.conf
cp config/rofi/config ~/.config/rofi/config
cp fehbg ~/.fehbg
cp config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh

chmod +x ~/.config/bin/*
chmod +x ~/.config/polybar/launch.sh

wget https://raw.githubusercontent.com/undiabler/nord-rofi-theme/master/nord.rasi
mv nord.rasi /usr/share/rofi/themes/
#echo "Done! Grab some wallpaper and run pywal -i filename to set your color scheme. To have the wallpaper set on every boot edit ~.fehbg"
#echo "After reboot: Select i3 on login, run lxappearance and select arc-dark"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
