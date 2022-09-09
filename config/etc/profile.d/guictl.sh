#!/bin/sh

startgui() {
    for f in /data/data/com.termux/files/home/.vnc/localhost.*.pid; do
        if [ ! -f "/data/data/com.termux/files/home/.vnc/localhost.$f.pid" ]
        then
            export DISPLAY=:$f && vncserver && xfce4-session &
        else
            vncserver -kill :$f && export DISPLAY=:$f && vncserver && xfce4-session &
        fi
    done
}