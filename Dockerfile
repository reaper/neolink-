FROM debian:stable-slim

ARG TARGETPLATFORM

RUN apt-get update
RUN apt-get -y install \
  wget \
  unzip \
  libgstrtspserver-1.0-0 \
  libgstreamer1.0-0 \
  libgstreamer-plugins-bad1.0-0 \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad

RUN mkdir -p /usr/local/bin
RUN mkdir -p /tmp/neolink

COPY download.sh /tmp/neolink/download.sh
WORKDIR /tmp/neolink

RUN bash download.sh $TARGETPLATFORM neolink.zip
RUN unzip -p neolink.zip neolink >/usr/local/bin/neolink
RUN chmod +x /usr/local/bin/neolink

WORKDIR /
RUN rm -rf /tmp/neolink

COPY docker/entrypoint.sh /entrypoint.sh

CMD ["/usr/local/bin/neolink", "rtsp", "--config", "/etc/neolink.toml"]
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 8554
