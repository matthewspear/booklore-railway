# BookLore on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/YOUR_TEMPLATE_SLUG?referralCode=matt)

One-click deploy of [BookLore](https://booklore.org) — a self-hosted, multi-user digital library with smart shelves, auto metadata, built-in reader for EPUB/PDF/comics, Kobo & KOReader sync, and BookDrop auto-imports.

## What's Included

- **BookLore** — web app on port 6060
- **MySQL** — database (Railway managed)
- **Persistent volume** — all data, books, and imports stored under one mount

## Architecture

This template uses a thin Dockerfile wrapper around the official `booklore/booklore` image. A single Railway volume mounted at `/booklore-data` is symlinked to the three directories BookLore expects:

- `/app/data` → app configuration & state
- `/books` → your book library
- `/bookdrop` → auto-import watched folder

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `DATABASE_URL` | JDBC connection string | Wired to MySQL service |
| `DATABASE_USERNAME` | DB user | Wired to MySQL service |
| `DATABASE_PASSWORD` | DB password | Wired to MySQL service |
| `TZ` | Timezone | `Etc/UTC` |
| `USER_ID` | App user ID | `1000` |
| `GROUP_ID` | App group ID | `1000` |
| `DISK_TYPE` | Storage type | `LOCAL` |

## Post-Deploy

1. Visit your Railway public URL
2. Create your admin account
3. Start uploading books!

## Links

- [BookLore Docs](https://booklore.org/docs/getting-started)
- [BookLore GitHub](https://github.com/booklore-app/booklore)
- [Live Demo](https://demo.booklore.org) (user: `booklore`, pass: `9HC`)
