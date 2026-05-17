FROM debian:bookworm-slim

COPY install.sh /app/install.sh

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash git curl wget unzip tzdata openssl ca-certificates supervisor \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x /app/install.sh && /app/install.sh

COPY config.json /etc/config.json

RUN echo 'echo -e "\n✅ VLESS LINK:\nvless://550e8400-e29b-41d4-a716-446655440000@94.130.50.12:443?encryption=none&security=tls&type=xhttp&mode=packet-up&sni=${CODESPACE_NAME}-443.app.github.dev&path=%2F#ghtun"' >> /etc/bash.bashrc

RUN mkdir -p /etc/supervisor/conf.d

RUN echo '[program:xray]\ncommand=/usr/local/bin/xray -c /etc/config.json\nautostart=true\nautorestart=true\nstderr_logfile=/var/log/xray.err.log\nstdout_logfile=/var/log/xray.out.log' > /etc/supervisor/conf.d/xray.conf

CMD ["/usr/bin/supervisord", "-n"]
