FROM ubuntu:latest
MAINTAINER VIVEK SHWARUP <vivekshwarup@gmail.com>

RUN apt-get update -y \
    && apt-get install -y apt-utils tzdata net-tools iputils-ping wget 
    
RUN wget https://filebin.net/rbqgascu15lp2wde/Nessus-8.3.1-ubuntu1110_amd64.deb?t=qvjpzk96 \
    && mv Nessus-8.3.1-ubuntu1110_amd64.deb\?t\=qvjpzk96 Nessus-8.3.1-ubuntu1110_amd64.deb 

ADD nessus/Nessus-8.3.1-ubuntu1110_amd64.deb /tmp/Nessus-8.3.1-ubuntu1110_amd64.deb

RUN apt-get update -y

RUN && dpkg -i /tmp/Nessus-8.3.1-ubuntu1110_amd64.deb \
    && rm -r /tmp/Nessus-8.3.1-ubuntu1110_amd64.deb

EXPOSE 8834

CMD service nessusd start && tail -f /dev/null
