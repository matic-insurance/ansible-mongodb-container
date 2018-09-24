#!/usr/bin/env bash

DOCKER_CONTAINER='mongo_no_auth'
MONGO_PORT=2701
MONGO_DB=application

mongo ${MONGO_DB} --host localhost --port ${MONGO_PORT} --eval "db.runCommand( { connectionStatus: 1, showPrivileges: true } )" | grep -q '"ok" : 1'