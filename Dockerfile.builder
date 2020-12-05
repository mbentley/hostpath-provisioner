FROM golang:1-alpine

RUN apk add --no-cache git glide
ENTRYPOINT ["/bin/sh"]
CMD ["-l"]
