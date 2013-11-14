#!/bin/bash

_index=logstash-`date +%Y.%m.%d`
_type=memo
logdate=`date +%Y-%m-%d`

i=1
while [ $i -le 100 ];
do
  echo "$i"
  i=`expr $i + 1`
  timestamp=`date +%H:%M:%S`
  sleep 1
  curl -XPUT "http://localhost:9200/$_index/$_type/$i" -d \
  '{"name" : "kappa","message" : "test" ,"v" : '$i' ,"@log_name" : "test", "@timestamp" : "'$logdate'T'$timestamp'+09:00"}'
done
