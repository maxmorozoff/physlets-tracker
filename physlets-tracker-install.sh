#!/bin/bash
# Run video tracker in docker to not install java
# https://physlets.org/tracker/

# [[ -e Tracker-6.0.8-linux-64bit-installer.run ]] || \
#     wget -O Tracker-6.0.8-linux-64bit-installer.run \
#     https://physlets.org/tracker/installers/download.php?file=Tracker-6.0.8-linux-64bit-installer.run 

# chmod +x Tracker-6.0.8-linux-64bit-installer.run

[[ -e ./tracker-6.0.8.jar ]] || wget https://physlets.org/tracker/archives/tracker-6.0.8.jar

# [[ -e OSPXuggle-3.4.1012-linux-64bit-installer.run ]] || \
#     wget -O OSPXuggle-3.4.1012-linux-64bit-installer.run \
#     http://www.compadre.org/osp/images/tracker/OSPXuggle-3.4.1012-linux-64bit-installer.run

# chmod +x OSPXuggle-3.4.1012-linux-64bit-installer.run

[[ $1 == "build" ]] && docker build -t tracker-6.0.8 . && exit 0 
# exit 0

sudo xhost +
    # --security-opt label=disable --ipc host \
# --network host \
docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=/run/user/1000 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /run/user/1000/:/run/user/1000/ \
    -v ${PWD}:/home:Z tracker-6.0.8:latest /bin/bash #\
    # --ipc host
    # --volume="$HOME/.Xauthority:/root/.Xauthority:rw"
    # -v ${PWD}:${PWD} \

sudo xhost -





exit 0

[[ -e ./tracker-6.0.8.jar ]] || wget https://physlets.org/tracker/archives/tracker-6.0.8.jar
pwd
sudo xhost +
docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=/run/user/1000 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /run/user/1000/:/run/user/1000/ \
    -v $(pwd):/home:Z openjdk:17.0.2-jdk-bullseye /bin/sh \
    -c 'apt-get -y update ; apt-get -y install libxss1 libxrender1 libxext6 libxtst6; \
    env ; ls /usr/local/openjdk-17/lib/ ; java -jar /home/tracker-6.0.8.jar'\
    --security-opt label=disable \
    --ipc host 
    # --volume="$HOME/.Xauthority:/root/.Xauthority:rw"
    # -v ${PWD}:${PWD} \

sudo xhost -

    # -v $(pwd):/home:Z jachinte/oracle-jdk-1.6.0_23 /bin/sh \
    # -c 'env ; /usr/bin/java -Djava.awt.headless=true -jar /home/tracker-6.0.8.jar'\


    # Disable SELinux label to enable mounting runtime socket 
    # --security-opt label=disable \
    # Enable legacy X11
    # -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    # -e DISPLAY=:0 \
    # Enable xdg runtime for wayland and pulseaudio socket  
    # -v /run/user/1000/:/run/user/1000/ \
    # -e XDG_RUNTIME_DIR=/run/user/1000 \
    # -e PULSE_SERVER=/run/user/1000/pulse/native \
    # fix XError bad access
    # --ipc host

