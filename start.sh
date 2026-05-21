#!/bin/bash
echo "127.0.0.1 $(hostname)" >> /etc/hosts
ttyd -p 8080 bash &
tail -f /dev/null
