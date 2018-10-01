#!/usr/bin/env bash
set -e

DB=application
COMMAND="db.list.insert({test: 1}); print('records: '+db.list.count())"

#No authentication db
mongo ${DB} --host localhost --port 2701 -u "test" -p "test" --eval "${COMMAND}" && exit 1 || echo "works"
#Admin only db
mongo ${DB} --host localhost --port 2702 --eval "${COMMAND}" && exit 1 || echo "works"
mongo ${DB} --host localhost --port 2702 -u "test" -p "test" --eval "${COMMAND}" && exit 1 || echo "works"
#Admin && User db
mongo ${DB} --host localhost --port 2703 --eval "${COMMAND}" && exit 1 || echo "works"
mongo ${DB} --host localhost --port 2703 -u "test" -p "test" --eval "${COMMAND}" && exit 1 || echo "works"

