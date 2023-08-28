#!/bin/bash

# Run the netconfig script
/etc/network/netconfig.sh

# Start ignition
/usr/local/bin/docker-entrypoint.sh
