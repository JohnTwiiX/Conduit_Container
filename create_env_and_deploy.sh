#!/bin/bash

# Umgebungsvariablen aus den GitHub Actions Secrets lesen
DJANGO_SUPERUSER_USERNAME=${DJANGO_SUPERUSER_USERNAME}
DJANGO_SUPERUSER_PASSWORD=${DJANGO_SUPERUSER_PASSWORD}
DJANGO_SUPERUSER_EMAIL=${DJANGO_SUPERUSER_EMAIL}
API_URL=${API_URL}

# .env-Datei erstellen oder überschreiben
cat <<EOT > .env
DJANGO_SUPERUSER_USERNAME=${DJANGO_SUPERUSER_USERNAME}
DJANGO_SUPERUSER_PASSWORD=${DJANGO_SUPERUSER_PASSWORD}
DJANGO_SUPERUSER_EMAIL=${DJANGO_SUPERUSER_EMAIL}
API_URL=${API_URL}
EOT

# Docker-Container stoppen, entfernen, System aufräumen und neu starten
docker stop conduit-frontend conduit-backend || echo "Containers not running"
docker rm conduit-frontend conduit-backend || echo "Containers not found"
docker system prune -a -f || { echo "Failed to prune Docker"; exit 1; }
docker compose up -d || { echo "Failed to start Docker containers"; exit 1; }
