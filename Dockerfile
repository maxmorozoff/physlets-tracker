FROM debian:bullseye

ENV DISPLAY=:0
ENV XDG_RUNTIME_DIR=/run/user/1000

VOLUME [ "/tmp/.X11-unix" ]  
VOLUME [ "/run/user/1000/" ]  
VOLUME [ "/home/" ]  

WORKDIR /home/

RUN apt-get -y update && \
    apt-get -y install \
    libxss1 libxrender1 libxext6 libxtst6 \
    xdg-user-dirs xdg-utils\
    expect 

COPY ./expect.exp .
COPY ./Tracker-6.0.8-linux-64bit-installer.run .

RUN chmod +x Tracker-6.0.8-linux-64bit-installer.run && \
    chmod +x ./expect.exp && ./expect.exp

COPY ./run.sh .

RUN chmod +x run.sh

ENTRYPOINT ["/home/run.sh"]
