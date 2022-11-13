FROM ubuntu:22.04

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

WORKDIR /srv

RUN apt-get update && apt-get install -y python3.10 python3.10-dev python3.10-venv python3-pip libmysqlclient21 libmysqlclient-dev libssl-dev build-essential git && apt-get clean

RUN pip3 install pipenv

#ONBUILD COPY Pipfile Pipfile.lock /srv/
ONBUILD COPY . .
ONBUILD RUN pipenv install --system --deploy
