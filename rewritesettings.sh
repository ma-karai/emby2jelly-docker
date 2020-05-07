#!/bin/sh
echo "execute rewrite settings and begin watchstatus migration"

rm $EMBY2JELLY_HOME/settings.ini

printf  "[Emby]\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "EMBY_APIKEY = $EMBY_APIKEY\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "EMBY_URLBASE = $EMBY_URLBASE\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "[Jelly] \n" >> $EMBY2JELLY_HOME/settings.ini
printf  "JELLY_APIKEY = $JELLY_APIKEY\n" >> $EMBY2JELLY_HOME/settings.ini
printf  "JELLY_URLBASE = $JELLY_URLBASE\n" >> $EMBY2JELLY_HOME/settings.ini



/usr/bin/nohup python $EMBY2JELLY_HOME/APImain.py --new-user-pw $NEW_USER_PWD

