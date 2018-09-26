#!/usr/bin/env bash
set -e

DB=application
COMMAND="db.list.insert({test: 1}); print('records: '+db.list.count())"

#No authentication db
mongo ${DB} --host localhost --port 2701 --eval "${COMMAND}"
#Admin only db
mongo ${DB} --host localhost --port 2702 --username "admin" --password "admin_pass" --authenticationDatabase "admin" --eval "${COMMAND}"
#Admin && User db
mongo ${DB} --host localhost --port 2703 --username "admin" --password "admin_pass" --authenticationDatabase "admin" --eval "${COMMAND}"
mongo ${DB} --host localhost --port 2703 --username "app" --password "app_pass" --eval "${COMMAND}"

