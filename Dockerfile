FROM ubuntu:18.10

ENV go_download_url https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz

RUN bash -c 'set -x ;\
    echo deb http://mirror.genesisadaptive.com/ubuntu/ cosmic main >> /etc/apt/source.list ;\
    apt-get -qq update 1>/dev/null ;\
    apt-get -qq install -y gcc g++ 1>/dev/null ;\
    apt-get -qq install -y gcc-mingw-w64 g++-mingw-w64 1>/dev/null ;\
    apt-get -qq install -y gcc-arm-linux-gnueabi gcc-arm-linux-gnueabihf gcc-arm-none-eabi 1>/dev/null ;\
    apt-get -qq install -y g++-arm-linux-gnueabi g++-arm-linux-gnueabihf  1>/dev/null ;\
    apt-get -qq install -y make libtool git wget pkg-config 1>/dev/null ;
    wget -q $go_download_url -O go.tar.gz ;\
    tar -C /usr/local -xzf go.tar.gz ;\
    export PATH=$PATH:/usr/local/go/bin ;\
    go version ;\
    cc --version ;\
    cpp --version ;\'
