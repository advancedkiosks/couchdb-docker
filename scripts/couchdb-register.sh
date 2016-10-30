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

# Configure local node as a cluster node
SETUP_JSON="{ \"action\" : \"enable_cluster\", \"bind_address\" : \"0.0.0.0\", \"username\" : \"admin\", \"password\" : \"password\" }"

curl -X POST http://localhost:5984/_cluster_setup -d "${SETUP_JSON}" -H "Content-Type: application/json"

# Configure the local node on the replicant
JSON="{ \"action\" : \"add_node\", \"host\" : \"${LOCAL_IP}\", \"port\" : 5984, \"username\" : \"admin\", \"password\" : \"password\" }"

curl -X POST http://${MASTER}:5984/_cluster_setup -d "${JSON}" -H "Content-Type: application/json" --user admin:password


