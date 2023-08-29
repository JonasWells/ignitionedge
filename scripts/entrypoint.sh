#!/bin/sh

# Network manipulation command
/usr/local/bin/netconfig.sh

# Start the original entrypoint
/usr/local/bin/docker-entrypoint.sh

exec ./ignition-gateway "$@"
