#!/bin/bash

service elasticsearch start
service logstash start

counter=0
while [ $counter -lt 10 ] && [[ -z $(curl localhost:9200 2> /dev/null) ]]; do
  sleep 1
  ((counter++))
  echo "kibana: wait for elasticsearch to start up, $counter seconds elapsed..."
done

if [[ -n $(curl localhost:9200 2> /dev/null) ]]; then
  echo "kibana started"
  /opt/kibana/bin/kibana >> /var/log/kibana/kibana.log 2>&1
else
  echo "kibana could not be started, please check elasticsearch configuration."
  exit 1
fi
