. ~/.env

xrdb ~/.Xdefaults

inputplug -0 -c $HOME/.bin/handle_inputplug

xset +fp ~/.fonts
xset fp rehash

xscreensaver -no-splash &

xset -dpms
xset s noblank

xwrits typetime=55 breaktime=5 +breakclock +idle=7 +clock +lock canceltime=5 after=10 breaktime=8 +finger=russian &

xxkb &

parcellite &

xset m 3 4

exec i3
