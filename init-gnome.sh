#!/bin/bash

# Function to check command success
check_command() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Command executed successfully.${NOCOLOR}"
    else
        echo -e "${YELLOW}Command failed.${NOCOLOR}"
    fi
}

# ANSI color codes
GREEN='\033[0;32m'  # Green color for success messages
YELLOW='\033[1;33m' # Yellow color for informational messages
NOCOLOR='\033[0m'   # No color / reset ANSI code

# Ask the user to choose a wallpaper color
echo -e "${YELLOW}Which color do you want for your wallpaper?${NOCOLOR}"
echo -e "${YELLOW}- black${NOCOLOR}"
echo -e "${YELLOW}- white${NOCOLOR}"
echo -e "${YELLOW}- orange${NOCOLOR}"
echo -e "${YELLOW}- blue${NOCOLOR}"
echo -e "${YELLOW}- none${NOCOLOR}"
read -p "Enter colour: " input_colour

# Ensure the input is valid
if [[ "$input_colour" != "black" && "$input_colour" != "white" && "$input_colour" != "orange" && "$input_colour" != "blue" && "$input_colour" != "none" ]]; then
    echo -e "${YELLOW}Invalid color choice. Defaulting to orange.${NOCOLOR}"
    wallpaper="orange"
else
    wallpaper="$input_colour"
fi

echo -e "${YELLOW}Setting wallpaper color to ${wallpaper}${NOCOLOR}"

# Disable home folder icon on the desktop
echo -e "${YELLOW}Disabling home folder${NOCOLOR}"
gsettings set org.gnome.shell.extensions.ding show-home false
check_command
echo ""

# Add battery percentage to the top panel
echo -e "${YELLOW}Adding top panel battery percentage${NOCOLOR}"
gsettings set org.gnome.desktop.interface show-battery-percentage true
check_command
echo ""

# Disable date in the top panel clock
echo -e "${YELLOW}Disabling top panel date${NOCOLOR}"
gsettings set org.gnome.desktop.interface clock-show-date false
check_command
echo ""

# Add week number to the calendar
echo -e "${YELLOW}Adding weekdate to calendar${NOCOLOR}"
gsettings set org.gnome.desktop.calendar show-weekdate true
check_command
echo ""

# Set warp as the default terminal
echo -e "${YELLOW}Setting warp as default terminal${NOCOLOR}"
gsettings set org.gnome.desktop.default-applications.terminal exec 'warp-terminal'
check_command
echo ""

# Set dark mode theme
echo -e "${YELLOW}Setting dark mode${NOCOLOR}"
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-viridian-dark'
check_command
echo ""

# Set Viridian icon theme
echo -e "${YELLOW}Setting viridian mode${NOCOLOR}"
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-viridian'
check_command
echo ""

# Move the "Show Applications" button to the top of the dock
echo -e "${YELLOW}Setting show applications to top${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
check_command
echo ""

# Set the dock position to the bottom
echo -e "${YELLOW}Setting dock position to bottom${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
check_command
echo ""

# Set the dock icon size (Edit to wish)
echo -e "${YELLOW}Setting dock icon size${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
check_command
echo ""

# Enable dock autohide
echo -e "${YELLOW}Setting dock autohide${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
check_command
echo ""

# Set dock transparency mode to fixed
echo -e "${YELLOW}Setting dock transparency to fixed${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
check_command
echo ""

# Set dock background opacity (Edit to wish)
echo -e "${YELLOW}Setting dock background opacity${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.1
check_command
echo ""

# Hide the trash icon from the dock
echo -e "${YELLOW}Setting dock show trash to false${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
check_command
echo ""

# Hide mounted drives from the dock
echo -e "${YELLOW}Setting dock show mounts to false${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
check_command
echo ""

# Set dock running indicator color to dominant color
echo -e "${YELLOW}Setting dock running indicator dominant color${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-dominant-color true
check_command
echo ""

# Set dock panel mode to extend height
echo -e "${YELLOW}Setting dock panel mode${NOCOLOR}"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
check_command
echo ""

# Disable dynamic workspaces
echo -e "${YELLOW}Setting workspace to false${NOCOLOR}"
gsettings set org.gnome.mutter dynamic-workspaces false
check_command
echo ""

# Set the number of workspaces to 1
echo -e "${YELLOW}Setting workspace to fixed number${NOCOLOR}"
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
check_command
echo ""

# Set keyboard shortcut for opening the Files application
echo -e "${YELLOW}Setting Files keyboard shortcut${NOCOLOR}"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>E']"
check_command
echo ""

# Download and set wallpaper based on the selected color, unless "none" is selected
if [[ "$wallpaper" != "none" ]]; then
    mkdir -p ~/Pictures/Wallpapers/
    curl -o ~/Pictures/Wallpapers/ubuntu_wallpaper.jpg "https://raw.githubusercontent.com/acolgecen/wallpaper/main/ubuntu/ubuntu_${wallpaper}.jpg"
    gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Pictures/Wallpapers/ubuntu_wallpaper.jpg"
    check_command
    echo ""
else
    echo -e "${YELLOW}No changes made to the wallpaper.${NOCOLOR}"
fi
