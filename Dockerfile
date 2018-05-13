FROM ubuntu:17.10

RUN apt update && apt install -y vim w3m golang git tmux

ENV VERSION=0.0.3
RUN go get github.com/sh19910711/cfproxy
RUN go get github.com/sh19910711/cfurl
RUN echo 'cfw3m() {' >> $HOME/.bashrc && \
  echo '  HTTP_PROXY=http://localhost:8181 w3m $@' >> $HOME/.bashrc && \
  echo '}' >> $HOME/.bashrc

RUN mkdir -p $HOME/wrk
WORKDIR $HOME/wrk
RUN git clone https://github.com/sh19910711/dotfiles.git
RUN bash ./dotfiles/setup.bash

ENV PATH=/root/go/bin:$PATH

RUN mkdir -p /root/.contest
ADD ./template.cpp /root/.contest
