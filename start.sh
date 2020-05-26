#!/bin/bash
echo "write settings "


touch $EMBY2JELLY_HOME/settings.ini
printf  "[Emby]\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "EMBY_APIKEY = $EMBY_APIKEY\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "EMBY_URLBASE = $EMBY_URLBASE\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "[Jelly] \n" >> $EMBY2JELLY_HOME/settings.ini
printf  "JELLY_APIKEY = $JELLY_APIKEY\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "JELLY_URLBASE = $JELLY_URLBASE\n" >> $EMBY2JELLY_HOME/settings.ini

touch /root/.config/Emby2Jelly/nohup.out

echo "-----------------------------"
echo "$EMBY2JELLY_HOME"
echo "$EMBY_APIKEY"
echo "$JELLY_APIKEY"
echo "$JELLY_URLBASE"
echo "$NEW_USER_PWD"
echo "-----------------------------"
echo "start process manually with"
echo "docker exec -it emby-to-jelly python3 $EMBY2JELLY_HOME/APImain.py --new-user-pw $NEW_USER_PWD "
echo "-----------------------------"

#/usr/bin/nohup -u python $EMBY2JELLY_HOME/APImain.py --new-user-pw $NEW_USER_PWD 2>&1  

#echo "end of process"


#2>&1
#--new-user-pw $NEW_USER_PWD 
#sleep 0.5
#tee "/root/.config/Emby2Jelly/nohup.out > /proc/1/fd/1 2>/proc/1/fd/2
