# builder container
FROM golang:1.17-alpine3.14 AS builder
RUN apk update && apk add --no-cache git make

WORKDIR /build
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN make build

#####################
FROM alpine:3.14

# install SSL root certificates
RUN apk update && apk add ca-certificates && \
	rm -rf /var/cache/apk/* && \
	update-ca-certificates

RUN adduser -S -H -u 3939 u u
USER 3939
WORKDIR /opt
COPY --from=builder /build/bin/* /opt

CMD ["/opt/server"]
