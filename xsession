# загрузим окружение
. ~/.env

xrandr --output HDMI2 --right-of HDMI1
xrandr --output HDMI1 --rotate left
xrandr --output HDMI2 --rotate left

# перечитать конфигурацию икс-сервера
xrdb ~/.Xdefaults

# раскладка
setxkbmap us,ru dvp,typewriter grp:switch,compose:menu,grp_led:caps

# модмап
xmodmap ~/.Xmodmap

# шрифты
xset +fp ~/.fonts
xset fp rehash

# иксскринсейвер
xscreensaver -no-splash &

# xwrits
xwrits typetime=55 breaktime=5 +breakclock +idle=7 +clock +lock canceltime=5 after=10 breaktime=8 +finger=russian &

# xxkb
xxkb &

#
#xneur&

# манагер буфера обмена
parcellite &

#gkrellm&

xset m 3 4

exec i3
