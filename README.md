### Django tutorial using Docker, Nginx, Gunicorn and PostgreSQL.

This is Django tutorial in steroids, I wanted to go through the tutorial using a configuration that is more close to production.

I am running the django app with gunicorn, using postgres as the database, the django app is behind nginx and everything is running out of Docker containers orchastrated with docker-compose.

#### Commits by tutorial parts

I've just finished going throught Django tutorial so the adventure on this repository is over, however have fun picking a start point:

[Commit at beggining of Part 2](https://github.com/andrecp/django-tutorial-docker-nginx-postgres/commit/24def5c2e962e74fd41132fb8caef5ef5d9a92f5)

[Commit at beggining of Part 3](https://github.com/andrecp/django-tutorial-docker-nginx-postgres/commit/3a9bb28648f7fe84675fba6e50c36968d5e22cf5)

[Commit at beggining of Part 4](https://github.com/andrecp/django-tutorial-docker-nginx-postgres/commit/fda3c34191574867cd07b8c5006f7d1ff6188f52)

[Commit at beggining of Part 5](https://github.com/andrecp/django-tutorial-docker-nginx-postgres/commit/186309a739908cd2b498aad540c95acf41230f93)

[Commit at beggining of Part 6](https://github.com/andrecp/django-tutorial-docker-nginx-postgres/commit/d8888f803a36ff862fc84faae87b34b726610f06)

[Branch with reusuable-apps advanced tutorial](https://github.com/andrecp/django-tutorial-docker-nginx-postgres/tree/reusable-apps)

#### Setup
I am running this on a Macbook air running Yosemite with boot2docker.

#### Running
1. git clone this repo
2. boot2docker up
3. sh rebuild_docker.sh
4. run migrations in your Django instance: ```docker-compose run django /bin/sh -c 'cd mysite;python manage.py migrate'```
5. access it in your browser! http://192.168.59.103/ for me, run boot2docker ip to know where it is running.

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

#### Running commands inside containers
use ```docker-compose run CONTAINER_NAME command``` for example:

* Testing polls app
  - docker-compose run django /bin/sh -c 'cd mysite;python manage.py test polls'

* Running ls
  - docker-compose run django /bin/sh -c 'ls'

* Running Python directly
  - docker-compose run django python

#### Checking logs
use ```docker-compose logs CONTAINER_NAME```

#### Important
This project first started as me following the awesome introduction from Andrew T. Baker at the PyCon US 2015 [link](http://docker.atbaker.me/)


