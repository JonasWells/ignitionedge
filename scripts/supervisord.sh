[supervisord]
nodaemon=true
logfile=/var/log/supervisor/supervisord.log

[program:losant-edge-agent]
user=root
command=/usr/local/bin/ignition/ignition-gateway
startsecs=10
autostart=true
autorestart=true
startretries=5
stderr_logfile=/dev/stderr
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes = 0
stderr_logfile_maxbytes = 0

[program:netconfig]
command=/etc/network/netconfig.sh
startsecs=5
autostart=true
autorestart=unexpected
startretries=0
exitcodes=0
stderr_logfile=/dev/stderr
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes = 0
stderr_logfile_maxbytes = 0