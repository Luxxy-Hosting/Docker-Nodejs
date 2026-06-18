FROM        node:20-buster-slim

RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
 && sed -i '/security.debian.org/d' /etc/apt/sources.list \
 && apt-get update \
 && apt-get -y install --no-install-recommends \
    ffmpeg iproute2 git sqlite3 python3 tzdata ca-certificates dnsutils build-essential make gcc g++ curl unzip \
 && curl -fsSL https://bun.sh/install -o /tmp/bun-install.sh \
 && BUN_INSTALL=/usr/local bash /tmp/bun-install.sh \
 && rm /tmp/bun-install.sh \
 && npm -g install pnpm \
 && useradd -m -d /home/container container \
 && rm -rf /var/lib/apt/lists/*

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
COPY        --chmod=777 ./start.sh /start.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
