FROM nginx:latest

WORKDIR /etc/nginx/

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY nginx/handshake.sh /var/

RUN chmod +x /var/handshake.sh
