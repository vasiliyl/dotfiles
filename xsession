# загрузим окружение
. ~/.env

xrandr --output HDMI2 --left-of HDMI1
xrandr --output HDMI1 --rotate left
xrandr --output HDMI2 --rotate left

eval $(gpg-agent --daemon)

# перечитать конфигурацию икс-сервера
xrdb ~/.Xdefaults

# раскладка
setxkbmap us,ru dvp,typewriter grp:switch,compose:menu,grp_led:caps

# модмап
xmodmap ~/.Xmodmap

# установим валпепер
hsetroot -fill $(ls -1 ~/Pix/Wallpaper/*1920* | sort -R | head -n 1)

# шрифты
xset +fp ~/.fonts
xset fp rehash

# иксскринсейвер
xscreensaver -no-splash &

# xwrits
xwrits typetime=55 breaktime=5 +breakclock +idle=7 +clock +lock canceltime=5 after=10 breaktime=8 +finger=russian &

# xxkb
xxkb &

keynav

#
#xneur&

# манагер буфера обмена
parcellite &

#gkrellm&

xset m 3 4

exec i3
