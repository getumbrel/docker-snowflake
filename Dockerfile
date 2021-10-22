FROM golang:1.15 AS builder

ARG VERSION=v1.1.0

WORKDIR /builder
RUN git clone -b ${VERSION} https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/

WORKDIR /builder/snowflake/proxy
RUN CGO_ENABLED=0 go build -o proxy -ldflags '-extldflags "-static"'  .

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /builder/snowflake/proxy/proxy /bin/proxy

ENTRYPOINT [ "/bin/proxy" ]
