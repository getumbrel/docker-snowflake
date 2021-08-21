FROM alpine:3.14

RUN apk --no-cache add --update go wget tar \
    && wget https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/archive/v1.1.0/snowflake-v1.1.0.tar \
    && tar xvf snowflake-v1.1.0.tar \
    && cd snowflake-v1.1.0/proxy \
    && go get && GO111MODULE=on go build -o proxy . \
    && mv proxy /usr/local/bin/ \
    && go clean -r -x -cache -modcache \
    && cd ../.. \
    && rm -rf snowflake \
    && apk del go wget tar

ENTRYPOINT [ "proxy" , "--broker" , "https://snowflake-broker.torproject.net/" , "--relay" , "wss://snowflake.torproject.net/" ]
