FROM alpine
MAINTAINER Dzmitry Akunevich, d_akunevich@adamantium.net

ARG GOR_VERSION

RUN apk add --update -t deps wget ca-certificates 
    
RUN wget https://github.com/buger/gor/releases/download/v${GOR_VERSION}/gor_v${GOR_VERSION}_x64.tar.gz \
    && tar zxvf gor_v${GOR_VERSION}_x64.tar.gz  \
    && rm -rf gor_v${GOR_VERSION}_x64.tar.gz \
    && chmod +x gor \
    && mv ./gor /usr/local/bin/gor \
    && apk del --purge deps \
    && rm /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/gor"]

