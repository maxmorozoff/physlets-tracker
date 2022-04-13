#!/bin/sh 
# script to be run by docker
# to execute jar bin

export HOME=/home
export TRACKER_HOME=/opt/tracker
$TRACKER_HOME/9.0.4-x64-jre/bin/java -jar $TRACKER_HOME/tracker.jar $*
# $TRACKER_HOME/9.0.4-x64-jre/bin/java -jar -verbose -disableassertions $TRACKER_HOME/tracker.jar $*
# $TRACKER_HOME/9.0.4-x64-jre/bin/java --help

# Don't run: tracker_starter.jar 
# it doesn't work
# $TRACKER_HOME/9.0.4-x64-jre/bin/java -jar -verbose -disableassertions $TRACKER_HOME/tracker_starter.jar $*

# env
