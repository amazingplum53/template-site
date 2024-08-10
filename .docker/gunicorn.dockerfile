FROM python:latest

WORKDIR /var/www

COPY gunicorn/wsgi.py ./

COPY gunicorn/gunicorn.config.py ./

EXPOSE 8001

ENTRYPOINT [ "gunicorn" ]

CMD ["wsgi:app", "--chdir", "/var/www/", "-c", "gunicorn.config.py"]
