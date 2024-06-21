#!/bin/bash

# FuNOCOLORtion to check command success
check_command() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Command executed successfully.${NOCOLOR}"
    else
        echo -e "${YELLOW}Command failed.${NOCOLOR}"
    fi
}

# ANSI color codes
GREEN='\033[0;32m'  # Green color
YELLOW='\033[1;33m' # Yellow color
NOCOLOR='\033[0m'   # No color / reset ANSI code

# The commands settings for gnome
echo -e "${YELLOW}Disabling home folder${NOCOLOR}"
gsettings set org.gnome.shell.extensions.ding show-home false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Adding top panel battery percentage${NOCOLOR}"
gsettings set org.gnome.desktop.interface show-battery-percentage true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Disabling top panel date${NOCOLOR}"
gsettings set org.gnome.desktop.interface clock-show-date false
check_command
echo ""

sleep 1


echo -e "${YELLOW}Adding weekdate to calender${NOCOLOR}"
gsettings set org.gnome.desktop.calendar show-weekdate true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Tilix as default terminal${NOCOLOR}"
gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dark mode${NOCOLOR}"
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-viridian-dark'
#gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-viridian-white'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting viridian mode${NOCOLOR}"
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-viridian'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting show applications to right${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock position to bottom${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock icon size${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock autohide${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock transpareNOCOLORy to fixed${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock background opacity${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.1
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock show trash to false${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock show mounts to false${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock running indicator dominant color${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-dominant-color true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock panel mode${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting workspace to false${NOCOLOR}"
gsettings set org.gnome.mutter dynamic-workspaces false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting workspace to fixed number${NOCOLOR}"
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting Files keyboard shortcut${NOCOLOR}"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>E']"
check_command
echo ""

sleep 1

curl -o ~/Downloads/ubuntu_wallpaper.jpg https://raw.githubusercontent.com/acolgecen/wallpaper/main/ubuntu/ubuntu_wallpaper.jpg
#curl -o ~/Downloads/ubuntu_wallpaper.jpg https://raw.githubusercontent.com/acolgecen/wallpaper/main/ubuntu/ubuntu_wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Downloads/ubuntu_wallpaper.jpg"
check_command
echo ""

sleep 1

echo -e "${YELLOW}All changes applied successfully${NOCOLOR}"

# Enable fractional scale setting
#gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
#Edit font size in org.gnome.desktop.interface
#gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/gnome/adwaita-night.jpg"