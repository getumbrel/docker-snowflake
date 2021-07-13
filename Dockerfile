FROM golang:1.15

RUN GO111MODULE=on go get git.torproject.org/pluggable-transports/snowflake.git/proxy@v1.1.0

ENTRYPOINT [ "proxy" , "--broker" , "https://snowflake-broker.torproject.net/" , "--relay" , "wss://snowflake.torproject.net/" ]
