FROM ubuntu:18.10

ENV go_download_url https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz

RUN echo deb http://mirror.genesisadaptive.com/ubuntu/ cosmic main >> /etc/apt/source.list \
    && apt-get -qq update 1>/dev/null \
    && apt-get -qq install -y gcc g++ 1>/dev/null \
    && apt-get -qq install -y make libtool git wget 1>/dev/null \
    && echo \
    && cc -v \
    && echo \
    && cpp -v \
    && wget -q $go_download_url -O go.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz \
    && export PATH $PATH:/usr/local/go/bin \
    && echo \
    && go version
