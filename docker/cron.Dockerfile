FROM base-php-image

ENV SUPERCRONIC_VERSION="v0.2.33"
RUN arch="$(uname -m)" \
    && case "$arch" in \
        armhf) _cronic_fname='supercronic-linux-arm' ;; \
        aarch64) _cronic_fname='supercronic-linux-arm64' ;; \
        x86_64) _cronic_fname='supercronic-linux-amd64' ;; \
        x86) _cronic_fname='supercronic-linux-386' ;; \
        *) echo >&2 "error: unsupported architecture: $arch"; exit 1 ;; \
    esac \
    && curl -qsSL "https://github.com/aptible/supercronic/releases/download/${SUPERCRONIC_VERSION}/${_cronic_fname}" -o /usr/bin/supercronic \
    && chmod +x /usr/bin/supercronic


COPY --chown=www-data:www-data docker/cron/crontab /etc/custom-crontab

RUN echo "XTYPE=CRON" >> /etc/environment

USER www-data

ENTRYPOINT ["/usr/bin/supercronic", "-overlapping", "/etc/custom-crontab"]
