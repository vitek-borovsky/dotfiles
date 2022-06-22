#!/bin/sh

source ~/.profile

exec nitrogen --restore &
exec picom &

exit 0
