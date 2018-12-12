FROM ubuntu:18.04

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

WORKDIR /srv

RUN apt-get update && apt-get install -y gnupg2 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8C718D3B5072E1F5 && echo "deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-apt-config" >> /etc/apt/sources.list && echo "deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-8.0" >> /etc/apt/sources.list && echo "deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-tools" >> /etc/apt/sources.list && apt-get update && apt-get install -y python3.7 python3.7-dev python3.7-venv python3-pip libmysqlclient21 libmysqlclient-dev libssl-dev build-essential git && apt-get clean

RUN pip3 install pipenv

ONBUILD COPY Pipfile Pipfile.lock /srv/
ONBUILD RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --python python3.7 --deploy --dev

ONBUILD COPY . .
