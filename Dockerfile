FROM ubuntu:14.04
MAINTAINER Andy Dirnberger <andy@dirnberger.me>

ENV DEBIAN_FRONTEND noninteractive

VOLUME ["/data/devpi"]
EXPOSE 3141

RUN apt-get update -q && apt-get install -y python3

ADD https://bootstrap.pypa.io/get-pip.py /get-pip.py
RUN python3 /get-pip.py
RUN pip3 install devpi-server==2.1.3

CMD ["devpi-server", "--host=0.0.0.0", "--serverdir=/data/devpi"]
