FROM inductiveautomation/ignition:8.1.30
 
COPY *.modl /usr/local/bin/ignition/user-lib/modules/
COPY scripts/entrypoint.sh /entrypoint.sh
COPY scripts/netconfig.sh /netconfig.sh

RUN chmod +x /entrypoint.sh /netconfig.sh

ENTRYPOINT ["/entrypoint.sh"]
