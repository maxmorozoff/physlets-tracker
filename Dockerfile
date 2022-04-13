FROM openjdk:17.0.2-jdk-bullseye

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
COPY ./tracker-6.0.8.jar .
# COPY ./OSPXuggle-3.4.1012-linux-64bit-installer.run .
COPY ./Tracker-6.0.8-linux-64bit-installer.run .

# RUN [[ -e /home/Tracker-6.0.8-linux-64bit-installer.run ]] || \
#     wget https://physlets.org/tracker/installers/download.php?file=Tracker-6.0.8-linux-64bit-installer.run

# RUN chmod +x OSPXuggle-3.4.1012-linux-64bit-installer.run
RUN chmod +x Tracker-6.0.8-linux-64bit-installer.run

RUN chmod +x ./expect.exp && ./expect.exp
# RUN yes | ./OSPXuggle-3.4.1012-linux-64bit-installer.run
#  3> /dev/null 
# ; echo 'Ok'
# RUN yes | ./Tracker-6.0.8-linux-64bit-installer.run ; ls -la

# RUN 

CMD [ "java", "-jar", "/home/tracker-6.0.8.jar" ]

RUN echo -e '#!/bin/sh \n \
    java -jar /home/tracker-6.0.8.jar' > run.sh && \
    chmod +x run.sh

ENTRYPOINT ["/home/run.sh"]

# FROM alpine:edge
# ARG packageId

# COPY ${packageId} /opt/testcafe/${packageId}
# COPY docker/testcafe-docker.sh /opt/testcafe/docker/testcafe-docker.sh

# ENV ALPINE_REPOS="\
#  --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/\
#  --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
#  --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/\
#  --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/community/\
#  --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main/\
# "

# RUN apk --no-cache $ALPINE_REPOS upgrade && \
#  apk --no-cache $ALPINE_REPOS add \
#  libevent nodejs npm chromium firefox xwininfo xvfb dbus eudev ttf-freefont fluxbox procps tzdata

# RUN npm install -g /opt/testcafe/${packageId} && \
#  npm cache clean --force && \
#  rm -rf /tmp/* && \
#  chmod +x /opt/testcafe/docker/testcafe-docker.sh && \
#  adduser -D user && \
#  rm /opt/testcafe/${packageId}


# USER user
# EXPOSE 1337 1338
# ENTRYPOINT ["/opt/testcafe/docker/testcafe-docker.sh"]