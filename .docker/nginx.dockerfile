FROM nginx:latest

WORKDIR /etc/nginx/

COPY nginx/http.conf /etc/nginx/

ENTRYPOINT ["bash", "-c"]

CMD ["nginx -c /etc/nginx/http.conf -g 'daemon off;'"]
