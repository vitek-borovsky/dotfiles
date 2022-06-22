#!/bin/sh

# this env var is for GLSL support for alacritty
export LIBGL_ALWAYS_SOFTWARE=1

# updates db for locate command
# exec updatedb

exec udiskie -f "" &

exec qtile start

