#!/bin/bash

apt_deps="gcc g++ gcc-mingw-w64 g++-mingw-w64 gcc-arm-linux-gnueabi gcc-arm-linux-gnueabihf gcc-arm-none-eabi g++-arm-linux-gnueabi g++-arm-linux-gnueabihf  make libtool git wget pkg-config"
go_download_url="https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz"

function set_trace(){
    set -e
    set -x
}

function execute(){(set_trace;$@)}

function silent(){(set_trace ;$@ 1>/dev/null 2>&1)}

function init(){
    execute echo deb http://mirror.genesisadaptive.com/ubuntu/ cosmic main >> /etc/apt/source.list
}

function main(){
    echo "installing dependencies"

    silent apt update
    silent apt install -y apt-utils
    silent apt install -y $apt_deps

    execute wget -q $go_download_url -O go.tar.gz
    execute silent tar -C /usr/local -xf go.tar.gz
    execute silent rm go.tar.gz

    export PATH=$PATH:/usr/local/go/bin

    execute go version
    execute cc version
    execute cpp version

    echo "done"
}

set -e
if ! init||main;then echo failed;exit 1;fi

