# Stage 1: Builder (with Go & xcaddy)
FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/rfc2136

# Stage 2: Slim Production-Image
FROM caddy:2

# Replace the default Caddy binary with our custom binary, including DNS plugins.
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
