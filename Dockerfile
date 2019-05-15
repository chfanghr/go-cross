FROM ubuntu:18.10

ENV go_download_url https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz

RUN echo deb http://mirror.genesisadaptive.com/ubuntu/ cosmic main >> /etc/apt/source.list \
    && apt update \
    && apt install -y gcc g++ \
    && apt install -y make libtool git wget \
    && cc -v && cpp -v \
    && wget $go_download_url -O go.tar.gz
