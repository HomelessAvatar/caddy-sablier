# caddy-sablier

Automated multi-architecture (`linux/amd64`, `linux/arm64`) Docker image for **Caddy v2** bundled with the **[Sablier](https://github.com/sablierapp/sablier-caddy-plugin)** on-demand container scaling plugin.

Built and published to GitHub Container Registry (`ghcr.io`):
`ghcr.io/homelessavatar/caddy-sablier:latest`

## Features

- **Official Caddy 2 Base:** Clean, secure, multi-stage Alpine build.
- **Sablier Integration:** Built-in `sablier` directive for scale-to-zero container orchestration.
- **Automated Upstream Tracking:** GitHub Actions checks for new Caddy releases daily and triggers automated builds.
- **SemVer Tagging:** Full compatibility with **What's Up Docker (WUD)** and Renovate for automatic update notifications.

## Quick Start (Docker Compose)

```yaml
services:
  caddy:
    image: ghcr.io/homelessavatar/caddy-sablier:2.11.7
    container_name: caddy
    restart: unless-stopped
    ports:
      - '80:80'
      - '443:443'
      - '443:443/udp'
    volumes:
      - /opt/data/caddy/Caddyfile:/etc/caddy/Caddyfile
      - /opt/data/caddy/certs:/etc/caddy/certs
      - /opt/data/caddy/data:/data
      - /opt/data/caddy/config:/config
    labels:
      - "wud.tag.include=^2(\\..*)?$"
      - "wud.link.template=https://github.com/caddyserver/caddy/releases/tag/v$${remote}"
    environment:
      - TZ=Europe/Istanbul
```
