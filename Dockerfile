FROM alpine:latest

ARG TARGETPLATFORM

RUN echo $(echo $TARGETPLATFORM | sed 's/\//-/g')$(ls buildx* | sed -e 's/^buildx//')

RUN apk add --no-cache \
    -X http://dl-cdn.alpinelinux.org/alpine/edge/main \
    -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  libgcc \
  tzdata \
  gstreamer \
  gst-plugins-base \
  gst-plugins-good \
  gst-plugins-bad \
  gst-plugins-ugly \
  gst-rtsp-server

COPY docker/entrypoint.sh /entrypoint.sh

CMD ["/usr/local/bin/neolink", "rtsp", "--config", "/etc/neolink.toml"]
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 8554
