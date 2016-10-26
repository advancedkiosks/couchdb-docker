#!/bin/bash

# couchdb-primary
MASTER=${1}

if [[ -z "${MASTER}" ]]
then
  echo "Usage : ${0} <master>"
  exit 1
fi

HOSTNAME=$(hostname)
LOCAL_IP=$(grep ${HOSTNAME} /etc/hosts | cut -f1)

curl -X PUT "http://${MASTER}:5984/_nodes/${HOSTNAME}@${LOCAL_IP}" -d {}



