FROM ubuntu:16.04

MAINTAINER Tim Tawan "tim@tawan.me"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev && \
    apt-get install -y nginx uwsgi uwsgi-plugin-python3

COPY ./requirements.txt /requirements.txt
# COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /

RUN pip3 install -r requirements.txt

COPY . /
 
EXPOSE  5000
CMD ["python3", "/app/app.py"]


