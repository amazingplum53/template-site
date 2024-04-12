FROM certbot/certbot

WORKDIR /etc/letsencrypt/

COPY openssl.cnf ./

COPY renew.sh /var/

COPY ./compare.py /var/

RUN mkdir /etc/letsencrypt/live/ /etc/letsencrypt/live/matthewhill.click/ 

RUN /usr/bin/openssl req -x509 -newkey rsa:4096 \
    -keyout /etc/letsencrypt/live/matthewhill.click/privkey.pem \
    -out /etc/letsencrypt/live/matthewhill.click/fullchain.pem \
    -sha256 -days 365 -config openssl.cnf -nodes

RUN apk add bash python3

RUN echo "temp" > /etc/letsencrypt/state.txt

ENTRYPOINT [ "/bin/bash" ]

CMD [ "/var/renew.sh" ]
