FROM ubuntu:latest

RUN apt update && apt upgrade -y

#Version control of the libraries used
RUN apt install -y -q build-essential python3-pip python3-dev

#Upadate and install the stuff that we need,
#firt we're going to upgrade our depdencies things
# MANAGES INSTALLING STUFF
RUN pip3 install -U pip setuptools wheel
RUN pip3 install gunicorn uvloop httptools

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

COPY service/ /app

ENV ACCESS_LOG=${ACCESS_LOG:-/proc/1/fd/1}
ENV ERROR_LOG=${ERROR_LOG:-/proc/1/fd/2}
ENTRYPOINT /usr/local/bin/gunicorn \
  -b 0.0.0.0:80 \
  -w 4 \
  -k uvicorn.workers.UvicornWorker main:app \
  --chdir /app \
  --access-logfile "$ACCESS_LOG" \
  --error-logfile "$ERROR_LOG"