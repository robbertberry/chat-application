#!/bin/sh
set -e

rm -f /api/tmp/pids/server.pid

rails server -b "0.0.0.0"

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"