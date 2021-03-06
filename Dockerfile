FROM alpine:3.9
LABEL author="LibreHealth Infrastructure Team <infrastructure@librehealth.io>"
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/bin/bash" , "/usr/local/bin/cron-backup.sh"]

RUN apk add --update --no-progress --no-cache --quiet bash dumb-init dcron wget rsync ca-certificates \
&& mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d

COPY . /usr/local/bin
