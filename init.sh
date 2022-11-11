#!/bin/sh

# set revolution



chmod +x ~/.config/rofi/*.sh

#──────────────────────────────────────────────
mkdir -p ~/.local/share
# font & theme ─────────────────────────────────
rm -rf ~/.local/share/fonts
ln -s ~/.config/.local/share/fonts ~/.local/share/fonts

rm -rf ~/.local/share/themes
ln -s ~/.config/.local/share/themes ~/.local/share/themes

cd ~/.local/share/themes
tar -xf Orchis.tar.xz
tar -xf Orchis-Purple.tar.xz
# sudo
# cursors  ─────────────────────────────────
mkdir ~/.tmp
unzip -q -d ~/.tmp/Graphite-cursors              ~/.config/0-root.tmp/icon/Graphite-cursors.zip
sudo cp -r  ~/.tmp/Graphite-cursors/*/dist-light /usr/share/icons/Graphite-light-cursors
sudo cp -r  ~/.tmp/Graphite-cursors/*/dist-dark  /usr/share/icons/Graphite-dark-cursors
# echo 'export XCURSOR_PATH=/usr/share/icons:~/.local/share/icons' >> /etc/environment


# Desktop Entry  ─────────────────────────────────
# [Desktop Entry]
# Name=Wayfire
# Exec=wayfire
# TryExec=/opt/wayfire-start.sh
# Icon=
# Type=Application
# DesktopNames=Wayfire
