#!/bin/bash
export gitproxy=http://github.opsp.eu.org/
export username=tom

xbps-remove -R grub-i386-efi grub-x86_64-efi grub efibootmgr libefivar lvm2 os-prober thin-provisioning-tools

xbps-install -S
xbps-install fuse vsv unzip xz curl wget p7zip-unrar
xbps-install linux-headers
xbps-install seatd elogind mate-polkit

xbps-install mesa mesa-dri # mesa-demos libva-utils
xbps-install vulkan-loader intel-media-driver mesa-vulkan-intel intel-video-accel # nvidia
xbps-install glfw glew libglvnd #  nvidia340-libs
xbps-install qt5-core gtk+3

# xorg
xbps-install xorg-minimal
xbps-install xf86-input-joystick
# sddm
xbps-install qt5-quickcontrols2 qt5-graphicaleffects qt5-svg sddm  numlockx
# qtile
xbps-install qtile picom glxinfo

# tools
xbps-install kitty rofi Thunar mpv # alacritty

# theme
xbps-install lxappearance qt5-svg qt5ct qt5-styleplugins papirus-icon-theme xsettingsd

# system tools
xbps-install dunst light
xbps-install pulseaudio pavucontrol #volctl light

# thunar-archive-plugin file-roller
##########################################################
# xbps-install xdg-utils

# xbps-install mako  # dunst # notification daemon

# grim wf-recorder grimshot 截图与录屏
# xdg-desktop-portal-wlr # screen sharing for wayland
# brightnessctl # brightness manager
# libappindicator # tray sway

# application
xbps-install libgpg-error # clash 客户端需要

# application apps
# nwg-bar #(Super+x). Presents the user with a choice of Lock, Logout, Reboot and Shutdown.
# xbps-install nwg-launchers
# xbps-install network-manager-applet

# xbps-install virtualbox-ose-guest

echo "ignorepkg=adwaita-icon-theme" >> /etc/xbps.d/99-ignore.conf
xbps-remove adwaita-icon-theme

ln -s /etc/sv/seatd     /var/service/
ln -s /etc/sv/dbus      /var/service/
ln -s /etc/sv/polkitd   /var/service/
# ln -s /etc/sv/elogind /var/service/

gpasswd -a $username _seatd
gpasswd -a $username dbus
gpasswd -a $username input

##########################################
# display manager
##########################################

ln -s /etc/sv/sddm /var/service/

sddm --example-config > /etc/sddm.conf
# sed -ri 's/^CursorTheme=+.*/CursorTheme="Graphite light Cursors"/' ~/.tmp/sddm.conf
sed -ri 's/^Current=+.*/Current=sddm-sugar-candy/' /etc/sddm.conf # maldives elarun maya sugar-light
sed -ri 's/^Numlock=+.*/Numlock=on/'               /etc/sddm.conf
sed -ri 's/^MinimumVT=+.*/MinimumVT=7/g'           /etc/sddm.conf
sed -ri 's/EnableHiDPI=false/EnableHiDPI=true/g'   /etc/sddm.conf

mkdir -p /usr/share/sddm/themes/
cp -r /home/$username/.config/0-root.tmp/sddm/themes/sddm-sugar-candy /usr/share/sddm/themes/

# set environment
##########################################
echo 'export QT_QPA_PLATFORMTHEME=qt5ct'    >> /etc/environment

# dir
echo 'export XDG_CACHE_HOME=~/.local/var/cache' >> /etc/environment
echo 'export XDG_CONFIG_HOME=~/.local/etc'      >> /etc/environment
echo 'export XDG_DATA_HOME=~/.local/share'      >> /etc/environment
echo 'export XDG_STATE_HOME=~/.local/var/lib'   >> /etc/environment

echo 'export XDG_DESKTOP_DIR=~/use-data/desktop'      >> /etc/environment
echo 'export XDG_DESKTOP_DIR=~/use-data/0-download'   >> /etc/environment

####################################################################################
# Install fonts
##########################################

mkdir -p ~/.tmp
cd       ~/.tmp

mkdir -p /usr/share/fonts/myfonts
Install_nerd_font() {
wget -U 'Mozilla/5.0' ${gitproxy}https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/${1}.zip

unzip -qq ${1}.zip -d ~/.tmp/${1}
rm ~/.tmp/${1}/*'Windows Compatible.ttf'
rm ~/.tmp/${1}/*'Windows Compatible.otf'
mv ~/.tmp/${1}/* /usr/share/fonts/myfonts/
}

# Install_nerd_font FiraCode
# Install_nerd_font FiraMono
Install_nerd_font CodeNewRoman
Install_nerd_font Hack
# Install_nerd_font Go-Mono

mkdir -p /usr/share/fonts/siyuan_cjk

Install_siyuan_font() {
wget -U 'Mozilla/5.0' ${gitproxy}https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/${1}.zip

unzip -qq ${1}.zip -d ~/.tmp/${1}
mv ~/.tmp/${1}/* /usr/share/fonts/siyuan_cjk/
}

Install_siyuan_font 06_NotoSansCJKjp
Install_siyuan_font 07_NotoSansCJKkr
Install_siyuan_font 08_NotoSansCJKsc
Install_siyuan_font 09_NotoSansCJKtc
Install_siyuan_font 13_NotoSansMonoCJKsc

chmod -R 755 /usr/share/fonts/

xbps-reconfigure -f fontconfig
rm -r ~/.tmp










# , ，分辨率，双屏，浏览器，图片查看，nnn，office，，   剪贴板 截图  vsv proton
# wofi --show=drun
# Thunar
#




# tory commend
##########################################
# network-manager-applet

# nm-applet --indicator &

# polkit






WAYLAND_DISPLAY=alacritty alacritty







# fcitx
##########################################


echo "GTK_IM_MODULE=fcitx" >> ~/.pam_environment
echo "QT_IM_MODULE=fcitx" >> ~/.pam_environment
echo "XMODIFIERS=@im=fcitx" >> ~/.pam_environment
##########################################

xbps-query -Rs tlp

pidof


jgmenu 类似于快速启动菜单
