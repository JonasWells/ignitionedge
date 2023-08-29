#!/bin/sh

# Network manipulation command
/netconfig.sh

# Start the original entrypoint
/usr/local/bin/docker-entrypoint.sh

exec ./ignition-gateway "$@"
