#!/bin/sh

# this env var is for GLSL support for alacritty
export LIBGL_ALWAYS_SOFTWARE=1

# updates db for locate command
# exec updatedb

exec udiskie -f "" &

# undo league brikule
cp ~/.config/qtile/config.py.bak ~/.config/qtile/config.py

exec qtile start

