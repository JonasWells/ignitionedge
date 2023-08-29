FROM inductiveautomation/ignition:8.1.30

USER root

COPY *.modl /usr/local/bin/ignition/user-lib/modules/
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY scripts/netconfig.sh /usr/local/bin/netconfig.sh

RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/netconfig.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
