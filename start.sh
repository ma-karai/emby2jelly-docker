#!/bin/bash
echo "write settings"

touch $EMBY2JELLY_HOME/settings.ini


printf  "[Emby]\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "EMBY_APIKEY = $EMBY_APIKEY\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "EMBY_URLBASE = $EMBY_URLBASE\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "[Jelly] \n" >> $EMBY2JELLY_HOME/settings.ini
printf  "JELLY_APIKEY = $JELLY_APIKEY\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "JELLY_URLBASE = $JELLY_URLBASE\n" >> $EMBY2JELLY_HOME/settings.ini

touch /root/.config/Emby2Jelly/nohup.out


echo "---------SET VARS------------"
echo "-----------------------------"
echo "$EMBY_URLBASE"
echo "$EMBY_APIKEY"
echo "$JELLY_APIKEY"
echo "$JELLY_URLBASE"
echo "$NEW_USER_PWD"
echo "-----------------------------"


/usr/bin/nohup python -u $EMBY2JELLY_HOME/APImain.py --new-user-pw $NEW_USER_PWD 2>&1
sleep 0.5
tee /root/.config/Emby2Jelly/nohup.out > /proc/1/fd/1 2>/proc/1/fd/2
