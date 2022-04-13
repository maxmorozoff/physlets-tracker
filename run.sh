#!/bin/sh 

ls -la /home
ls -la /opt/tracker/9.0.4-x64-jre/lib/
# apt-get -y install c
# wget google.com
cat /opt/tracker/tracker.sh
echo
# unzip -p /opt/tracker/tracker_starter.jar  | cat

cat /opt/tracker/tracker.desktop
# echo "search lan" > /etc/resolv.conf
# echo "nameserver 1.1.1.1" >> /etc/resolv.conf
# cat /etc/resolv.conf 
# ls /etc/docker/
# systemctl restart network-manager
export HOME=/home
# /opt/tracker/tracker.sh --help

export TRACKER_HOME=/opt/tracker
# $TRACKER_HOME/9.0.4-x64-jre/bin/java --help
# /opt/tracker/tracker.sh/java.base
$TRACKER_HOME/9.0.4-x64-jre/bin/java -jar $TRACKER_HOME/tracker.jar $*
# $TRACKER_HOME/9.0.4-x64-jre/bin/java -jar -verbose -disableassertions $TRACKER_HOME/tracker.jar $*
# $TRACKER_HOME/9.0.4-x64-jre/bin/java -jar -verbose -disableassertions $TRACKER_HOME/tracker_starter.jar $*

# cat /opt/tracker/tracker.prefs.default
# ls -la .config/OSP/Cache


# env

# java -jar /home/tracker-6.0.8.jar
