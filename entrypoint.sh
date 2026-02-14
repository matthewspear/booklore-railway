#!/bin/sh
# Railway single-volume workaround.
# Volume mounted at /booklore-data. App expects /app/data, /books, /bookdrop.

set -e

# Ensure volume subdirs exist and are writable by the app user
mkdir -p /booklore-data/app-data /booklore-data/books
chown -R ${USER_ID:-1000}:${GROUP_ID:-1000} /booklore-data

# Remove any build-time symlinks or dirs
rm -rf /app/data /books /bookdrop

# Symlinks to volume-backed dirs
ln -sf /booklore-data/app-data /app/data
ln -sf /booklore-data/books /books

# bookdrop is ephemeral
mkdir -p /bookdrop
chown ${USER_ID:-1000}:${GROUP_ID:-1000} /bookdrop

# Hand off to original entrypoint
exec /__cacert_entrypoint.sh /start.sh
