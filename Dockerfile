# Build image
FROM busybox AS builder

RUN wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb \
  -o /tmp/percona-release.deb

# Container image
FROM debian:buster

#RUN echo "deb http://mirrors.aliyun.com/debian buster main" > /etc/apt/sources.list
COPY --from=builder /tmp/percona-release.deb /tmp/percona-release.deb

RUN set -ex \
  ; dpkg -i /tmp/percona-release.deb \
  ; apt-get update \
  ; apt-get install percona-xtrabackup-24 -y --no-install-recommends \
  ; rm -rf /var/lib/apt/lists/*
