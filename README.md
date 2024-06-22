# l4d2server-docker

## Usage

First, prepare the `server.cfg` file, `host.txt` file and `motd.txt` file.

The `addons` folder is used to store mods and plugins and can be empty.

Run the container by using Docker Command
Notice! This is just an example, you should change the path to your own in `volumes`.

```bash
docker run -it -d \
--name l4d2server \
--restart unless-stopped \
-p 27088:27015 \
-p 27088:27015/udp \
-v ${your_path_here}/addons/:/home/steam/l4d2server/left4dead2/addons/ \
-v ${your_path_here}/server.cfg:/home/steam/l4d2server/left4dead2/cfg/server.cfg:ro \
-v ${your_path_here}/host.txt:/home/steam/l4d2server/left4dead2/host.txt:ro \
-v ${your_path_here}/motd.txt:/home/steam/l4d2server/left4dead2/motd.txt:ro \
shinnasuka/l4d2server:latest \
"-secure +exec server.cfg +map c1m1_hotel -port 27015"
```

Join the game by typing in below command via L4D2 console
```bash
connect ${ip}:27088
```
