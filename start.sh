#!/bin/bash
echo "127.0.0.1 $(hostname)" >> /etc/hosts

# تشغيل Acunetix مباشرة بدون systemctl
sudo -u acunetix /home/acunetix/.acunetix/supervisor -c /home/acunetix/.acunetix/supervisor.yaml &

# تشغيل ttyd في الخلفية
ttyd -p 7681 bash &

# إبقاء الـ container شغّال
tail -f /dev/null
