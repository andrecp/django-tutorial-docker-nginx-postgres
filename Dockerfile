# Dockerfile for sample Django application

FROM python:2.7-onbuild

ENV DJANGO_CONFIGURATION Docker

WORKDIR django-polls

RUN python setup.py install

WORKDIR ..

CMD ["gunicorn", "-c", "gunicorn_conf.py", "--chdir", "mysite", "mysite.wsgi:application", "--reload"]
