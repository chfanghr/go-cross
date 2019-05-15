FROM ubuntu:latest

RUN apt update \
    & apt install -y gcc g++ \
    & apt install -y make libtool git
