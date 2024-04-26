#!/bin/bash

# Function to check command success
check_command() {
    if [ $? -eq 0 ]; then
        echo "Command executed successfully"
    else
        echo "Command failed"
        exit 1  # Exit the script if a command fails
    fi
}

echo "Disabling home folder"
gsettings set org.gnome.shell.extensions.ding show-home false
check_command
echo ""

echo "Adding top panel battery percentage"
gsettings set org.gnome.desktop.interface show-battery-percentage true
check_command
echo ""

echo "Disabling top panel date"
gsettings set org.gnome.desktop.interface clock-show-date false
check_command
echo ""

echo "Adding weekdate to calender"
gsettings set org.gnome.desktop.calendar show-weekdate true
check_command
echo ""

echo "Tilix as default terminal"
gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'
check_command
echo ""

echo "Setting dark mode"
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-viridian-dark'
check_command
echo ""

echo "Setting viridian mode"
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-viridian'
check_command
echo ""

echo "Setting show applications to right"
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
check_command
echo ""

echo "Setting dock position to bottom"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
check_command
echo ""

echo "Setting dock icon size"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 80
check_command
echo ""

echo "Setting dock autohide"
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
check_command
echo ""

echo "Setting dock transparency to fixed"
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
check_command
echo ""

echo "Setting dock background opacity"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.1
check_command
echo ""

echo "Setting dock show trash to false"
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
check_command
echo ""

echo "Setting dock show mounts to false"
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
check_command
echo ""

echo "Setting dock running indicator dominant color"
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-dominant-color true
check_command
echo ""

echo "Setting dock panel mode"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
check_command
echo ""

echo "Setting workspace to false"
gsettings set org.gnome.mutter dynamic-workspaces false
check_command
echo ""

echo "Setting workspace to fixed number"
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
check_command
echo ""

echo "All changes applied successfully"
