### Django tutorial using Docker, Nginx, Gunicorn and PostgreSQL.

Trying to learn Django, Gunicorn, Docker and Nginx all at the same time?
This is the right repo!

At the moment I am in the [Part 2 of Django tutorial](https://docs.djangoproject.com/en/1.8/intro/tutorial02/), will continue the quest and update the git repo accordingly. (Getting docker-compose and nginx right took some time)

#### Setup
I am running this on a Macbook air running Yosemite with boot2docker.

#### Running
1. git clone this repo
2. create a dir called logs for nginx, e.g: mkdir logs
3. boot2docker up
4. sh rebuild_docker.sh
5. run migrations in your Django instance: ```docker-compose run django /bin/sh -c 'cd mysite;python manage.py migrate'```
6. access it in your browser! http://192.168.59.103/ for me, run boot2docker ip to know where it is running.

#### [docker-compose.yml](https://github.com/andrecp/django-tutorial-docker-nginx-postgres/blob/master/docker-compose.yml)
Compose is a tool for defining and running multi-container applications with Docker. With Compose, you define a multi-container application in a single file, then spin your application up in a single command which does everything that needs to be done to get it running.

https://docs.docker.com/compose/

We have three containers: Nginx, Postgres and a Django App.

* django
 
  - Built from ./Dockerfile, running gunicorn to serve our django app.

* postgres
    - Just the basic image from DockerRegistry.

* nginx
    - We are building it from nginx/Dockerfile. In our nginx/nginx.conf we are basically proxying django to gunicorn and serving static files which gunicorn doesn't do for us.

#### rebuild_docker.sh
Created to make life easier:

1. Build your docker-compose file.
  - docker-compose build

2. Runs your containers on detached mode.
  - docker-compose up -d

3. Check if they are all running.
  - docker-compose ps

#### Important
This project first started as me following the awesome introduction from Andrew T. Baker at the PyCon US 2015 [link](http://docker.atbaker.me/)


