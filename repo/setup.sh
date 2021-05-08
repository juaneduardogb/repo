
apt update && apt upgrade -y

#Version control of the libraries used
apt install -y -q build.essential python3-pip python3-dev

#Upadate and install the stuff that we need,
#firt we're going to upgrade our depdencies things
# MANAGES INSTALLING STUFF
pip3 install -U pip setuptools wheel

pip3 install gunicorn uvloop httptools

cp .requirements.txt /app/requirements.txt

pip3 install -r  /app/requirements.txt

cp ./service/ /app

ENTRYPOINT /usr/local/bin/gunicorn \
  -b 0.0.0.0:80 \
  -w 4 \
  -k uvicorn.workers.UvicornWorker main:app \
  --chdir /app