# Stage 1. Build the binary
FROM golang:1.11

# add a non-privileged user, because by default container user is root
RUN useradd -u 10001 myapp

RUN mkdir -p /go/src/github.com/silazare/go-k8s-workshop
ADD . /go/src/github.com/silazare/go-k8s-workshop
WORKDIR /go/src/github.com/silazare/go-k8s-workshop

# build the binary with go build
RUN CGO_ENABLED=0 go build \
	-o bin/go-server github.com/silazare/go-k8s-workshop/cmd/go-server

# Stage 2. Run the binary
FROM scratch

ENV PORT 8080

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=0 /etc/passwd /etc/passwd
USER myapp

COPY --from=0 /go/src/github.com/silazare/go-k8s-workshop/bin/go-server /go-server
EXPOSE $PORT

CMD ["/go-server"]
