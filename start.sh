#!/bin/bash

if [ $# = 0 ]
then
    map_to_start=c1m1_hotel
else
    map_to_start=$1
fi

ip=$(curl ifconfig.me)
port=27088

echo "Stopping l4d2 server..."
docker rm -f l4d2server

echo "Starting l4d2server with map ${map_to_start} on port ${port}..."
echo "Using 'connect ${ip}:${port}' to join the game..."

docker run -it -d \
--name l4d2server \
--restart unless-stopped \
-p ${port}:27015 \
-p ${port}:27015/udp \
-v /var/www/l4d2server/addons/:/home/steam/l4d2server/left4dead2/addons/ \
-v /var/www/l4d2server/server.cfg:/home/steam/l4d2server/left4dead2/cfg/server.cfg:ro \
-v /var/www/l4d2server/host.txt:/home/steam/l4d2server/left4dead2/host.txt:ro \
-v /var/www/l4d2server/motd.txt:/home/steam/l4d2server/left4dead2/motd.txt:ro \
-v /var/www/l4d2server/steamclient.so:/home/steam/.steam/sdk32/steamclient.so:ro \
shinnasuka/l4d2server:latest \
"-debug -secure +exec server.cfg +map ${map_to_start} -port 27015"
#-v /var/www/l4d2server/steam.inf:/home/steam/l4d2server/left4dead2/steam.inf \
# hoshinorei/l4d2server:edge \
