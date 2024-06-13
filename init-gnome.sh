#!/bin/bash

# Function to check command success
check_command() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Command executed successfully.${NC}"
    else
        echo -e "${YELLOW}Command failed.${NC}"
    fi
}

# ANSI color codes
GREEN='\033[0;32m'  # Green color
YELLOW='\033[1;33m' # Yellow color
NC='\033[0m'        # No color / reset ANSI code

echo -e "${YELLOW}Disabling home folder${NC}"
gsettings set org.gnome.shell.extensions.ding show-home false
check_command
echo ""

sleep 1


echo -e "${YELLOW}Adding top panel battery percentage${NC}"
gsettings set org.gnome.desktop.interface show-battery-percentage true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Disabling top panel date${NC}"
gsettings set org.gnome.desktop.interface clock-show-date false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Adding weekdate to calender${NC}"
gsettings set org.gnome.desktop.calendar show-weekdate true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Tilix as default terminal${NC}"
gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dark mode${NC}"
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-viridian-dark'
#gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-viridian-white'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting viridian mode${NC}"
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-viridian'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting show applications to right${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock position to bottom${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock icon size${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock autohide${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock transparency to fixed${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock background opacity${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.1
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock show trash to false${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock show mounts to false${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock running indicator dominant color${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-dominant-color true
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting dock panel mode${NC}"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting workspace to false${NC}"
gsettings set org.gnome.mutter dynamic-workspaces false
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting workspace to fixed number${NC}"
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
check_command
echo ""

sleep 1

echo -e "${YELLOW}Setting Files keyboard shortcut${NC}"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>E']"
check command
echo ""

sleep 1

echo -e "${YELLOW}All changes applied successfully${NC}"

# Enable fractional scale setting
#gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
#Edit font size in org.gnome.desktop.interface

