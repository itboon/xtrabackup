FROM debian:buster

#RUN echo "deb http://mirrors.aliyun.com/debian buster main" > /etc/apt/sources.list

RUN set -ex; \
    wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb; \
	dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb; \
    apt-get update; \
	apt-get install percona-xtrabackup-24 -y --no-install-recommends; \
	rm -rf /var/lib/apt/lists/*
