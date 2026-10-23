# Custom Caddy Web Server (with Cloudflare & RFC2136 DNS)

[![Docker Pulls](https://img.shields.io/docker/pulls/haraldsilva/caddy.svg)](https://hub.docker.com/r/haraldsilva/caddy)
[![GitHub Registry](https://img.shields.io/badge/registry-ghcr.io-blue)](https://github.com/HaraldSilva?tab=packages)

This repository provides an automated, lightweight, multi-stage build of the **[Caddy Web Server](https://caddyserver.com/)**, bundling essential DNS provider plugins for automated ACME DNS-01 SSL/TLS certificate validation.

Published concurrently to **Docker Hub** and **GitHub Container Registry (GHCR)**.

---

## 🔌 Included DNS Modules

Built with `xcaddy` using an Alpine production base:
* **[`caddy-dns/cloudflare`](https://github.com/caddy-dns/cloudflare)**: Enables DNS-01 ACME challenges for domains managed by Cloudflare.
* **[`caddy-dns/rfc2136`](https://github.com/caddy-dns/rfc2136)**: Enables DNS-01 ACME challenges via standard dynamic DNS updates (BIND9, PowerDNS, Knot, etc.).

---

## 🔄 Automated Update Schedule

* **Interval:** Every **6 hours** (`00:00`, `06:00`, `12:00`, `18:00` UTC).
* **Smart Digest Check:** The GitHub Action compares upstream Alpine/Caddy base image digests before triggering compilation.
* **Minimal Footprint:** Uses a two-stage build where the Go build environment is discarded, leaving a clean production runtime image (~45 MB).

---

## 📦 Pulling the Image

### From Docker Hub
```bash
docker pull haraldsilva/caddy:latest
```

### From GitHub Container Registry (GHCR)
```bash
docker pull ghcr.io/haraldsilva/caddy:latest
```

---

## 🚀 Docker Compose Example

```yaml
services:
  caddy:
    image: haraldsilva/caddy:latest
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp" # HTTP/3 QUIC
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile:ro
      - caddy_data:/data
      - caddy_config:/config

volumes:
  caddy_data:
  caddy_config:
```

---

## 🔗 Registry Links
* **Docker Hub:** [https://hub.docker.com/r/haraldsilva/caddy](https://hub.docker.com/r/haraldsilva/caddy)
* **GitHub Container Registry:** [https://github.com/HaraldSilva/caddy/pkgs/container/caddy](https://github.com/HaraldSilva/caddy/pkgs/container/caddy)
