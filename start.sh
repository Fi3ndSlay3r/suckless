slstatus &
#xrandr --output LVDS-1 --off --output VGA-1 --primary
#xrandr --output LVDS-1 --auto
twmnd &
setxkbmap pl
syncthing serve --no-browser &
exec dwm
