#!/bin/sh

export PATH=/home/$USER/.local/bin:$PATH

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

export DISPLAY=:0.0

sudo sysctl -w abi.vsyscall32=0
flameshot &
# mouse speed 9 is my mouse at least for now
xinput set-prop 9 "Coordinate Transformation Matrix" .6 0 0 0 .6 0 0 0 1.9

sudo localectl set-x11-keymap us
