#!/bin/bash
echo "Starting gunicorn"
 
# Activate the virtual environment
cd /home/{{ user }}
source venv/bin/activate
cd /home/{{ user }}/{{ repository_name }}/{{ repository_name }}

exec gunicorn \
    --name=django_project \
    --config /home/{{ user }}/gunicorn.conf.py \
    dgnest.wsgi:application
