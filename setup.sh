#!/bin/bash

# Collect static files
python manage.py collectstatic --noinput --clear

# Make migrations
python manage.py makemigrations

# Apply migrations
python manage.py migrate

# Create superuser if it doesn't exist
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'admin123') if not User.objects.filter(username='admin').exists() else None" | python manage.py shell 