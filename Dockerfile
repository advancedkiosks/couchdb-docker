FROM klaemo/couchdb:latest
MAINTAINER Michael Yuen <michael.yuen@mac.com>

EXPOSE 5984 5986 4369

COPY scripts/couchdb-register.sh /usr/bin/couchdb-register.sh

