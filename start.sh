#!/bin/bash
# إضافة hostname لـ /etc/hosts
echo "127.0.0.1 $(hostname)" >> /etc/hosts

# تشغيل Acunetix
sudo -u acunetix /home/acunetix/.acunetix/acunetix start &

# تشغيل ttyd
ttyd -p 8080 bash
