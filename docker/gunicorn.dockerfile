FROM python:latest

RUN pip install gunicorn gevent

WORKDIR /var/www

COPY gunicorn/wsgi.py ./

COPY gunicorn/gunicorn.config.py ./

