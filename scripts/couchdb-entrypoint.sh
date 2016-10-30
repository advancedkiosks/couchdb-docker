#!/bin/bash

set -e

if [ "$1" = '/opt/couchdb/bin/couchdb' ]; then
  # configure name of the instance
  LOCAL_IP=$(grep ${HOSTNAME} /etc/hosts | cut -f1)
  sed -e "s/ip_address_replace/${LOCAL_IP}/" /opt/couchdb/etc/vm.args.template > /opt/couchdb/etc/vm.args

	# we need to set the permissions here because docker mounts volumes as root - modified from https://hub.docker.com/r/klaemo/couchdb/
	chown -R couchdb:couchdb /opt/couchdb

	chmod -R 0770 /opt/couchdb/data

	chmod 664 /opt/couchdb/etc/*.ini
	chmod 775 /opt/couchdb/etc/*.d

	exec gosu couchdb "$@"
fi

exec "$@"
