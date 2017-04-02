FROM alpine

RUN apk add --update libtool automake autoconf linux-headers alpine-sdk git && \
    git clone https://github.com/statsite/statsite && cd statsite && \
    ./autogen.sh && ./configure && make && mv statsite /sbin/ && \
    cd - && rm -rf statsite && apk del linux-headers libtool automake autoconf alpine-sdk git && \
    rm -rf /var/cache/apk/*

EXPOSE 8125 8125/udp

CMD ["/sbin/statsite"]
