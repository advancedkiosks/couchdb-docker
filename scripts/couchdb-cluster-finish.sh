#!/bin/bash

# Configure local node as a cluster node
SETUP_JSON="{ \"action\" : \"finish_cluster\" }"

curl -X POST http://localhost:5984/_cluster_setup -d "${SETUP_JSON}" -H "Content-Type: application/json" --user admin:password


