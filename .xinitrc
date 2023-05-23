#!/bin/sh

$HOME/dev/dwm-bar/dwm_bar.sh &
picom &
$HOME/dev/dotfiles/i3/shs/restoreWlp.sh &
    exec dwm

