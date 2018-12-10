FROM golang:1.11.2 AS go-build-env
RUN go get -u github.com/take-cheeze/dep-dl

FROM alpine:3.8
COPY --from=go-build-env /go/bin/dep-dl /usr/local/bin/
RUN \
    apk --update add --no-cache ca-certificates git && \
    mkdir /lib64 && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
    rm -rf /var/cache/apk/*
