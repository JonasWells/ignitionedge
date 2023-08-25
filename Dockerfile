FROM inductiveautomation/ignition:8.1.30

COPY modules/ /usr/local/bin/ignition/user-lib/modules/
COPY configurations/ignition.conf /usr/local/bin/ignition/data/
COPY backups/Ignition-e8dbf30aad2d_Ignition-backup-edge20230825-1913.gwbk /restore.gwbk

ENV ACCEPT_IGNITION_EULA=Y
ENV IGNITION_EDITION=edge
ENV GATEWAY_HTTP_PORT=8088
ENV GATEWAY_HTTPS_PORT=8043

ENV GATEWAY_ADMIN_USERNAME ''
ENV GATEWAY_ADMIN_PASSWORD ''
ENV IGNITION_LICENSE_KEY ''
ENV TZ ''

EXPOSE 8088
EXPOSE 8043
EXPOSE 883
EXPOSE 44818

# Prepare Execution Settings
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "./ignition-gateway" ]

