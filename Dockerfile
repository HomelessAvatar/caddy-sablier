ARG CADDY_VERSION=2.11.7
ARG SABLIER_PLUGIN_VERSION=v1.0.2

FROM caddy:${CADDY_VERSION}-builder AS builder

ARG SABLIER_PLUGIN_VERSION

RUN xcaddy build \
    --with github.com/sablierapp/sablier-caddy-plugin@${SABLIER_PLUGIN_VERSION}

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
