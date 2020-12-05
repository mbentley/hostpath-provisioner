FROM golang:1-alpine as build

RUN apk add --no-cache git glide
RUN mkdir -p /go/src/github.com/mbentley/hostpath-provisioner
WORKDIR /go/src/github.com/mbentley/hostpath-provisioner
COPY hostpath-provisioner.go .
COPY glide.yaml .
RUN glide install -v
RUN CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o hostpath-provisioner .

FROM scratch
COPY --from=build /go/src/github.com/mbentley/hostpath-provisioner/hostpath-provisioner /
CMD ["/hostpath-provisioner"]
