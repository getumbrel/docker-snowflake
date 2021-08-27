FROM alpine:3.14 AS builder
RUN apk add --update go git
WORKDIR /builder
RUN git clone -b v1.1.0 https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/ 
WORKDIR /builder/snowflake/proxy
RUN go get 
RUN go build -o proxy .

FROM alpine:3.14
COPY --from=builder /builder/snowflake/proxy/proxy /proxy
ENTRYPOINT [ "/proxy" ]
