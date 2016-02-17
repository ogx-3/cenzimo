#!/bin/sh
cd /var/app/cenzimo && python manage.py migrate --noinput
supervisord -n -c /etc/supervisor/supervisord.conf
