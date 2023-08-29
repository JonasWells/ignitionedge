#!/bin/sh

# Network manipulation command
/entrypoint.sh

# Start the original entrypoint
/usr/local/bin/docker-entrypoint.sh

exec ./ignition-gateway "$@"
