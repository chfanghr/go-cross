FROM ubuntu:18.10

RUN echo deb http://mirror.genesisadaptive.com/ubuntu/ cosmic main >> /etc/apt/source.list \
    && apt update \
    && apt install -y gcc g++ \
    && apt install -y make libtool git
