#!/bin/bash
# Run video tracker in docker
# https://physlets.org/tracker/


if [[ ! -e Tracker-6.0.8-linux-64bit-installer.run ]] 
then
    wget -O Tracker-6.0.8-linux-64bit-installer.run \
        https://physlets.org/tracker/installers/download.php?file=Tracker-6.0.8-linux-64bit-installer.run 

    # chmod +x Tracker-6.0.8-linux-64bit-installer.run
fi

if [[ $1 == "build" ]] 
then 
    docker build -t tracker-6.0.8 . 
    exit 0
fi 

sudo xhost +

docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=/run/user/1000 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /run/user/1000/:/run/user/1000/ \
    -v ${PWD}:/home:Z tracker-6.0.8:latest /bin/bash 

    # -v ${PWD}:${PWD} \

sudo xhost -

exit 0
