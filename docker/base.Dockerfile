FROM php:8.3-cli

ENV MLOCATI_DOCKER_PHP_EXTENSION_INSTALLER_VERSION=2.2.17
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/download/${MLOCATI_DOCKER_PHP_EXTENSION_INSTALLER_VERSION}/install-php-extensions /usr/local/bin/

# Install some extensions
RUN install-php-extensions \
    bcmath \
    curl \
    intl \
    mbstring \
    opcache \
    pdo \
    pcntl \
    zip

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
