FROM ubuntu:18.10

COPY deps.sh /

RUN /deps.sh||rm /deps.sh
