FROM php:8.3-cli

# And tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        bash \
        ca-certificates \
        curl \
        lsb-release \
        unzip \
        zip \
    && rm -rf /var/lib/apt/lists/*
