#!/bin/bash

# Configure local node as a cluster node
SETUP_JSON="{ \"action\" : \"enable_cluster\", \"bind_address\" : \"0.0.0.0\", \"username\" : \"admin\", \"password\" : \"password\" }"

curl -X POST http://localhost:5984/_cluster_setup -d "${SETUP_JSON}" -H "Content-Type: application/json"


