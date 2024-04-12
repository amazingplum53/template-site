FROM python:latest

RUN pip install gunicorn gevent

WORKDIR /var/www

COPY ./wsgi.py ./

COPY ./gunicorn.config.py ./

