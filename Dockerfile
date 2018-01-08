FROM ubuntu:17.10

RUN sed -i 's;http://archive.ubuntu.com/ubuntu;http://ftp.jaist.ac.jp/pub/Linux/ubuntu/;' /etc/apt/sources.list
RUN apt update && apt install -y vim w3m golang
RUN apt install -y git
RUN apt install -y tmux

ENV VERSION=0.0.1
RUN go get github.com/sh19910711/cfproxy
RUN go get github.com/sh19910711/cfurl

RUN mkdir -p $HOME/wrk
WORKDIR $HOME/wrk
RUN git clone https://github.com/sh19910711/dotfiles.git
RUN bash ./dotfiles/setup.bash

ENV HTTP_PROXY=http://localhost:8181
ENV PATH=/root/go/bin:$PATH

RUN mkdir -p /root/.contest
ADD ./template.cpp /root/.contest
