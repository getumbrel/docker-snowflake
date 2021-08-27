FROM golang:1.17 AS builder
WORKDIR /builder
RUN git clone -b v1.1.0 https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/ 
WORKDIR /builder/snowflake/proxy
RUN go get 
RUN go build -ldflags "-linkmode external -extldflags -static" -o proxy .

FROM alpine:3.14
COPY --from=builder /builder/snowflake/proxy/proxy /proxy
ENTRYPOINT [ "/proxy" ]
