#!/bin/sh

run_as_user() {
    sudo -u $target_user bash -c "$1";
}


if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with sudo (sudo -i)" 
   exit 1
fi

read -p "Please enter your username: " target_user;

if id -u "$target_user" >/dev/null 2>&1; then
    echo "User $target_user exists! Proceeding.. ";
else
    echo 'The username you entered does not seem to exist.';
    exit 1;
fi

usermod -aG wheel,video,audio,users,storage $target_user

pacman -S \
    neovim git alacritty rofi man qtile xorg-xinit xorg-server xf86-video-vmware xf86-video-fbdev \
    xf86-video-vesa xf86-input-libinput nitrogen noto-fonts curl dpkg zsh lua tmux udiskie neofetch htop locate picom htop jq \
    dbus discord reflector cmatrix nemo ranger arandr python-pip cmatrix pavucontrol pulseaudio pass rofi-pass\
    gimp flameshot xorg-xinput cmus ripgrep  \
    --noconfirm

run as user "pip install psutil dbus-next debugpy"

run_as_user "mkdir ~/Pictures"
run_as_user "mkdir ~/Videos"
run_as_user "mkdir ~/Music"
run_as_user "mkdir ~/Downloads"
run_as_user "mkdir ~/Desktop"
run_as_user "mkdir ~/.fonts"

run_as_user "cp -f .rc ~/.rc"
run_as_user "cp -f .zshrc ~/.zshrc"
run_as_user "cp -f .profile ~/.profile"
run_as_user "cp -f .p10k.zsh ~/.p10k.zsh"
run_as_user "cp -f .xinitrc ~/.xinitrc"
run_as_user "cp -rf .oh-my-zsh ~/.oh-my-zsh"
run_as_user "cp -f wallpaper.jpg ~/Pictures/wallpaper.jpg"
run_as_user "cp -f wall.jpg ~/Pictures/wall.jpg"

run_as_user "cp -rf nerd-fonts/* ~/.fonts/"
run_as_user "cp -rf powerline-fonts/* ~/.fonts/"
run_as_user "cp -rf .config ~/.config"

# yay
cd /opt
git clone https://aur.archlinux.org/yay.git
cd yay
chown -R $target_user:users .
run_as_user "makepkg -si --noconfirm"

# brave
run_as_user "yay -S brave-bin brave-beta-bin brave-nightly-bin --noconfirm"


localectl set-x11-keymap us

run_as_user "systemctl enable pulseaudio.socket"

run_as_user "rm -rf ../dotfiles"

