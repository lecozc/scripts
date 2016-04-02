#!/bin/bash

let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`
# OLD uptime
# $(uptime | awk '{ print $3}' | sed -e 's/,//')
# OLD loadavg
# (1min) $(uptime | awk '{ print $8}' | sed -e 's/,//') (5min) $(uptime | awk '{ print $9}' | sed -e 's/,//') (15min) $(uptime | awk '{ print $10}' | sed -e 's/,//')

# get the load averages
read one five fifteen rest < /proc/loadavg

URL="http://www.accuweather.com/en/fr/rennes/132537/weather-forecast/132537"

echo "$(tput setaf 2)
   .~~.   .~~.    $(tput sgr0) Running Processes = `ps ax | wc -l | tr -d " "`  $(tput setaf 2)
  '. \ ' ' / .'   $(tput sgr0) Rennes=`wget -q -O- "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $2": "$16", "$12"°" }'| head -1|awk -F"," '{print $2}'`C $(tput setaf 1)
   .~ .~~~..~.    $(tput sgr0) `sudo /opt/vc/bin/vcgencmd measure_temp | sed -e 's/temp=/Temp = /'`  $(tput setaf 1)
  : .~.'~'.~. :   $(tput sgr0) Dispo = $(df -Ph $PWD | tail -1 | awk '{ print $2}') $(tput setaf 1)
 ~ (   ) (   ) ~  $(tput sgr0) Mem = $(free | grep Mem | awk '{print $3/$2 * 100.0}') % (used) $(tput setaf 1)
( : '~'.~.'~' : ) $(tput sgr0) Load = ${one}, ${five}, ${fifteen} (1, 5, 15 min) $(tput setaf 1)
 ~ .~ (   ) ~. ~  $(tput sgr0) Uptime = ${UPTIME} $(tput setaf 1)
  (  : '~' :  )   $(tput sgr0) Lastlog = $(lastlog | grep "`whoami`" | awk '{ print $1" "$3" "$4" "$5" "$6" "$7}') $(tput setaf 1)
   '~ .~~~. ~'    $(tput sgr0) (CPU: $(sudo vcgencmd get_config arm_freq|awk -F'=' '{ print $2}')MHz / RAM: $(sudo vcgencmd get_config sdram_freq|awk -F'=' '{ print $2}')MHz / Core : $(sudo vcgencmd get_config core_freq|awk -F'=' '{ print $2}')MHz / OvervVoltage:  $(sudo vcgencmd get_config over_voltage|awk -F'=' '{ print $2}') )  $(tput setaf 1)
       '~'        $(tput sgr0) IP eth0 ($(/sbin/ifconfig eth0|grep "inet addr" | cut -d ":" -f 2 | cut -d " " -f 1 )) / wlan0 ($(/sbin/ifconfig wlan0|grep "inet addr" | cut -d ":" -f 2 | cut -d " " -f 1 ))  $(tput setaf 1)
$(tput sgr0)"





