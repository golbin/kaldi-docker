FROM ubuntu:16.04
MAINTAINER Jin Kim <golbin@gmail.com>

RUN apt-get update
RUN apt-get install -y git zlib1g-dev make automake autoconf bzip2 wget libtool subversion libatlas3-base python python3 g++

WORKDIR /home
RUN git clone https://github.com/kaldi-asr/kaldi.git

WORKDIR /home/kaldi/tools
RUN extras/check_dependencies.sh && \
	make && \
	extras/install_irstlm.sh

WORKDIR /home/kaldi/src
RUN ./configure --shared && \
	make depend && \
	make

