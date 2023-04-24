FROM ubuntu:latest
EXPOSE 443
USER root

RUN apt-get update && apt-get install -y wget git bash

RUN wget -N https://github.com/SagerNet/sing-box/releases/download/v1.3-beta8/sing-box-1.3-beta8-linux-amd64.tar.gz && \
    tar -xf sing-box*.tar.gz && rm -f sing-box*.tar.gz && \
    mv sing-box* sing-box

COPY config.json /sing-box/config.json
RUN chmod +x /sing-box

COPY entrypoint.sh ./
RUN chmod a+x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
