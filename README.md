# Custom Docker Images (Caddy)

[![Build Status](https://github.com/HaraldSilva/caddy/actions/workflows/build-caddy.yml/badge.svg)](https://github.com/HaraldSilva/caddy/actions)
[![Registry](https://img.shields.io/badge/registry-ghcr.io-blue)](https://github.com/HaraldSilva?tab=packages)

This repository contains automated Docker builds for our customized **Caddy Web Server** production environments, hosted on the GitHub Container Registry (`ghcr.io`).

---

## 🔄 Automated Update & Build Schedule

To ensure all images remain secure and up-to-date with the latest upstream security patches without unnecessary rebuilds, this repository uses a **Smart Digest Check** via GitHub Actions:

* **Check Interval:** Every **12 hours** (`00:00` and `12:00` UTC).
* **Smart Trigger:** The workflow inspects the SHA256 manifest digest of the official upstream images on Docker Hub (`caddy:2`).
* **Conditional Build:** A new build and push to `ghcr.io` is **only triggered if the upstream base image has changed** or if changes are pushed directly to the `main` branch of this repository.

---

## 📦 1. Custom Caddy Image (`ghcr.io/haraldsilva/caddy`)

Built using a clean multi-stage build based on the official `caddy:2-builder` and `caddy:2` Alpine images.

### Included Modules (via `xcaddy`)
* [`github.com/caddy-dns/cloudflare`](https://github.com/caddy-dns/cloudflare) – Enables ACME DNS-01 challenges via Cloudflare DNS.
* [`github.com/caddy-dns/rfc2136`](https://github.com/caddy-dns/rfc2136) – Enables ACME DNS-01 challenges via RFC2136 dynamic DNS updates.

### Usage
```bash
docker pull ghcr.io/haraldsilva/caddy:latest
