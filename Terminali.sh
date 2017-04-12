#!/bin/sh
### BEGIN INIT INFO
# Provides:  Terminali
# Required-Start: $remote_fs $syslog
# Required-Stop:  $remote_fs $syslog
# Default-Start: 2 3 4 5 
# Default-Stop: 0 1 6
# Short-Description: Start daemon at boot time
# Description: Enable service provided by daemon
### END INIT INFO
export DISPLAY=":0"
### variabile per la cancellazione del file vlm ###
var=181

### lettura del file ip.txt, salvataggio in una variabile e output della var###
value=`cat /var/www/html/ip.txt`
echo "$value"

### apertura del terminale e lancio della rete telnet###
sleep 1
xdotool key ctrl+alt+t
sleep 7
xdotool type 'vlc -vvv --color -I telnet --telnet-password admin --rtsp-host 0.0.0.0 --rtsp-port 5554'
xdotool key KP_Enter
sleep 0.5

### apertura del terminale e modifica del file vlm
xdotool key ctrl+alt+t
sleep 1.5
xdotool type 'nano Scuola.vlm'
xdotool key KP_Enter
sleep 1

### cancellazione del file ### 
xdotool key ctrl+6
sleep 0.5
xdotool key alt+shift+t
sleep 0.5
xdotool key KP_Enter
### scrittura del file con l'ip preso dalla lettura iniziale ###
xdotool type '# VLC media player VLM command batch'
xdotool key KP_Enter
xdotool type '# http://www.videolan.org/vlc/'
xdotool key KP_Enter
xdotool key KP_Enter
xdotool type 'new Scuola vod enabled'
xdotool key KP_Enter
xdotool type 'setup Scuola input "tcp://'
xdotool type $value
xdotool type ':5000"' 
xdotool key KP_Enter
xdotool type 'setup Scuola option network-caching=1000'
sleep 2
### salvataggio del file ###
xdotool key ctrl+x
sleep 1
xdotool key y
sleep 1
xdotool key KP_Enter
sleep 1
xdotool key alt+F4
xdotool key ctrl+alt+t
sleep 2
### accesso alla rete telnet ###
xdotool type 'telnet localhost 4212'
xdotool key KP_Enter
sleep 1.5
xdotool type 'admin'
xdotool key KP_Enter
sleep 0.5
### caricamento del file vlm e avvio dello streaming ###
xdotool type 'load Scuola.vlm'
xdotool key KP_Enter
