FROM certbot/certbot

WORKDIR /etc/letsencrypt/

COPY certbot/renew.sh /var/

COPY certbot/compare.py /var/

RUN apk add bash python3

RUN chmod +x /var/renew.sh

