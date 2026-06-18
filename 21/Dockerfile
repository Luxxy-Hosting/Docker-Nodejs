FROM        node:21-bookworm-slim

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 python3 tzdata ca-certificates dnsutils build-essential make gcc g++ curl unzip \
            && curl -fsSL https://bun.sh/install -o /tmp/bun-install.sh \
            && BUN_INSTALL=/usr/local bash /tmp/bun-install.sh \
            && rm /tmp/bun-install.sh \
            && npm -g install pnpm \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
COPY        --chmod=777 ./start.sh /start.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
