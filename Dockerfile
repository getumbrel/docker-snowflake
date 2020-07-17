FROM golang:1.13

WORKDIR /go/src/
RUN export GO111MODULE=on && go install git.torproject.org/pluggable-transports/snowflake.git/proxy

ENTRYPOINT [ "proxy" , "--broker" , "https://snowflake-broker.torproject.net/" , "--stun" , "stun:stun.l.google.com:19302" , "--relay" , "wss://snowflake.torproject.net/" ]