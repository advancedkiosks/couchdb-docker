#!/bin/bash

HOSTNAME=$(hostname)
LOCAL_IP=$(grep ${HOSTNAME} /etc/hosts | cut -f1)

curl -X PUT "http://couchdb-primary:5986/_nodes/${HOSTNAME}@${LOCAL_IP}" -d {}
