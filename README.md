# emby2jelly-docker

Easy to use emby 2 jelly docker (use at own risk)

run docker with the following env variables:

```
   EMBY_APIKEY=aaaabbbbbbbcccccccccccccdddddddd
   EMBY_URLBASE=http://127.0.0.1:8096/
   JELLY_APIKEY=eeeeeeeeeeeeeeeffffffffffffffffggggggggg
   JELLY_URLBASE=http://127.0.0.2:8096/
   NEW_USER_PWD=pls_change_your_pwd_user_123afed

```   

or simple run command

```  
docker run -e EMBY_APIKEY=aaaabbbbbbbcccccccccccccdddddddd \
           -e EMBY_URLBASE=http://127.0.0.1:8096/ \
           -e JELLY_APIKEY=eeeeeeeeeeeeeeeffffffffffffffffggggggggg \
           -e JELLY_URLBASE=http://127.0.0.2:8096/ \
           -e NEW_USER_PWD=pls_change_your_pwd_user_123afed \
		   makarai/emby2jelly-docker

```
