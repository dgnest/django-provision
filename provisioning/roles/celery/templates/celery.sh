#!/bin/bash
echo "Starting celery"
 
# Activate the virtual environment
cd /home/{{ user }}
source venv/bin/activate
# Go to the main level of manage.py of your django project
cd /home/{{ user }}/{{ repository_name }}/{{ repository_name }}

# Change repository_name for the celery app instantiaded
exec celery -A {{ repository_name }} worker --loglevel=info
