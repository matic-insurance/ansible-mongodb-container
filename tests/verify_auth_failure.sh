#!/usr/bin/env bash
set -e

DB=application
COMMAND="db.list.insert({test: 1}); print('records: '+db.list.count())"

#No authentication db
mongo ${DB} --host localhost --port 2701 --username "test" --password "test" --eval "${COMMAND}" && exit 1 || echo "works"

