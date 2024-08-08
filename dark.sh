#!/bin/bash

# Check if the user is running X11 or Wayland
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
    # Check if GNOME is the current desktop environment
    if [[ "$XDG_CURRENT_DESKTOP" = "GNOME" ]]; then
        # Activate dark mode in GNOME
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
        gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
        gsettings set org.gnome.desktop.wm.preferences theme 'Adwaita-dark'
    elif [[ "$XDG_CURRENT_DESKTOP" = "Deepin" ]]; then
        # Activate dark mode in Deepin
        mkdir -p ~/.config/deepin/deepin-wm
        echo -e "[global]\ncolor_scheme=dark" > ~/.config/deepin/deepin-wm/config
        deepin-wm --replace
    elif [[ "$XDG_CURRENT_DESKTOP" = "XFCE" ]]; then
        # Activate dark mode in XFCE
        xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
        xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"
    else
        echo "Dark mode configuration not supported for the current desktop environment."
    fi
elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # Check if GNOME is the current desktop environment
    if [[ "$XDG_CURRENT_DESKTOP" = "GNOME" ]]; then
        # Activate dark mode in GNOME
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
        gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
        gsettings set org.gnome.desktop.wm.preferences theme 'Adwaita-dark'
    elif [[ "$XDG_CURRENT_DESKTOP" = "Deepin" ]]; then
        # Activate dark mode in Deepin
        mkdir -p ~/.config/deepin/deepin-kwin
        echo -e "[General]\ncolorScheme=dark" > ~/.config/deepin/deepin-kwin/deepin-kwin.conf
        killall deepin-kwin
    elif [[ "$XDG_CURRENT_DESKTOP" = "XFCE" ]]; then
        # Activate dark mode in XFCE
        xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
        xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"
    else
        echo "Dark mode configuration not supported for the current desktop environment."
    fi
else
    echo "Unknown session type. Unable to activate dark mode."
fi
