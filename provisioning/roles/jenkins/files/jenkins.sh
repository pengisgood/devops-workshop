#!/bin/sh

DESC="Jenkins CI Server"
NAME=jenkins
PIDFILE=/var/run/$NAME.pid
RUN_AS=jenkins
COMMAND="/usr/bin/java -- -jar /opt/jenkins.war"

d_start() {
  start-stop-daemon --start --quiet --background --make-pidfile --pidfile $PIDFILE --chuid $RUN_AS --exec $COMMAND
}

d_stop() {
  start-stop-daemon --stop --quiet --pidfile $PIDFILE
  if [ -e $PIDFILE ]
    then rm $PIDFILE
  fi
}

case $1 in
  start)
  echo -n "Starting $DESC: $NAME"
  d_start
  echo "."
  ;;
  stop)
  echo -n "Stopping $DESC: $NAME"
  d_stop
  echo "."
  ;;
  restart)
  echo -n "Restarting $DESC: $NAME"
  d_stop
  sleep 1
  d_start
  echo "."
  ;;
  *)
  echo "usage: $NAME {start|stop|restart}"
  exit 1
  ;;
esac

exit 0
