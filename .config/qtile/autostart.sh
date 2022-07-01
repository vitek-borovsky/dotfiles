#!/bin/sh

source ~/.profile
source ~/.screenlayout/vitekPC.sh
exec nitrogen --restore &
exec picom &
imwheel
