#!/bin/sh
echo "write settings "


touch $EMBY2JELLY_HOME/settings.ini
printf  "[Emby]\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "EMBY_APIKEY = $EMBY_APIKEY\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "EMBY_URLBASE = $EMBY_URLBASE\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "[Jelly] \n" >> $EMBY2JELLY_HOME/settings.ini
printf  "JELLY_APIKEY = $JELLY_APIKEY\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "JELLY_URLBASE = $JELLY_URLBASE\n" >> $EMBY2JELLY_HOME/settings.ini

echo " begin watchstatus migration"

/usr/bin/nohup python $EMBY2JELLY_HOME/APImain.py 
#--newuserpwd $NEW_USER_PWD 
sleep 0.5
tee "/root/.config/Emby2Jelly/nohup.out > /proc/1/fd/1 2>/proc/1/fd/2
