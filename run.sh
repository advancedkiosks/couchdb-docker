#!/bin/bash

for container in $(docker ps -a -q --filter name=couchdb --filter status=running)
do
  docker kill $container > /dev/null
done

for container in $(docker ps -a -q --filter name=couchdb --filter status=exited)
do
  docker rm $container > /dev/null
done

docker run -d --name couchdb -p 5984:5984 mikeyyuen/couchdb

