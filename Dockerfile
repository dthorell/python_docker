FROM ubuntu:22.04

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8
RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN adduser --system --no-create-home app

RUN apt-get install -yq python3.10 python3.10-dev python3.10-venv python3-pip libmysqlclient21 libmysqlclient-dev libssl-dev build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install pipenv

WORKDIR /srv
