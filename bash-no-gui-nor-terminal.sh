#!/bin/bash
## Author: Giedrius Tuminauskas <giedrius@tuminauskas.lt>

if [ -t 0 ] && [ -z ${DISPLAY+X} ];then echo "OK, Shell script runs in a shell";
elif [ ! -t 0 ] && [ -z ${DISPLAY+X} ];then echo "ERROR: Crontab execution is not allowed";
else /usr/bin/zenity --error --title="ERROR: Script running from GUI not allowed!" --no-wrap \
--text="Script running from GUI is not allowed! Please run script in a shell/terminal"; exit; fi

