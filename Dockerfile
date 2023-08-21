FROM inductiveautomation/ignition:8.1.30

COPY *.modl /usr/local/bin/ignition/user-lib/modules/

EXPOSE 8088

