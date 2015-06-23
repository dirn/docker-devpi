FROM ubuntu:14.04
MAINTAINER Andy Dirnberger <andy@dirnberger.me>

ENV DEBIAN_FRONTEND noninteractive

VOLUME ["/data/devpi"]
EXPOSE 3141

RUN apt-get update -q && apt-get install -y python

ADD https://bootstrap.pypa.io/get-pip.py /get-pip.py
RUN python /get-pip.py
RUN pip install devpi-server

CMD ["devpi-server", "--host=0.0.0.0", "--serverdir=/data/devpi"]
