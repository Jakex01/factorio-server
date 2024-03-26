
FROM  --platform=linux/x86_64 debian:stable



LABEL MAINTAINER='Jakub Sokół "kubasokol3001@gmail.com"'
SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN apt-get update -y -qq \
    && apt-get install -y -qq wget xz-utils libc6

COPY ./factorio ./factorio

EXPOSE 34197/udp

RUN mkdir ./factorio/saves
RUN mkdir ./factorio/mods

WORKDIR /factorio
ENTRYPOINT [ "./bin/x64/factorio", "--start-server", "./saves/save.zip" ]


