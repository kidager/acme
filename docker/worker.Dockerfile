FROM base-php-image

RUN apt-get update \
    && apt-get install -y --no-install-recommends supervisor \
    && rm -rf /var/lib/apt/lists/*

COPY --link docker/supervisor/sample-shell.sh /usr/local/bin/sample-shell.sh
COPY --link docker/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY --link docker/supervisor/conf.d/* /etc/supervisor/conf.d/

ENTRYPOINT ["/usr/bin/supervisord", "--configuration=/etc/supervisor/supervisord.conf", "--nodaemon"]
