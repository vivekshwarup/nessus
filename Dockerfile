FROM ubuntu:latest
MAINTAINER VIVEK SHWARUP <vivekshwarup@gmail.com>
ADD Nessus-8.3.1-ubuntu1110_amd64.deb /tmp/Nessus-8.3.1-ubuntu1110_amd64.deb
RUN apt-get update -y \
    && apt-get install -y apt-utils tzdata net-tools iputils-ping \
    && dpkg -i /tmp/Nessus-8.3.1-ubuntu1110_amd64.deb \
    && rm -r /tmp/Nessus-8.3.1-ubuntu1110_amd64.deb
EXPOSE 8834
CMD service nessusd start && tail -f /dev/null
