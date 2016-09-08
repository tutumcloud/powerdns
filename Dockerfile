FROM alpine:latest

ENV VERSION 4.0.1
RUN apk --update add curl build-base wget boost-dev mariadb-dev git autoconf automake bison flex g++ libtool make ragel \
	mysql-client musl bash boost-program_options boost-serialization mariadb-libs libstdc++
RUN curl -sS https://downloads.powerdns.com/releases/pdns-$VERSION.tar.bz2 | tar xjf - -C . && \
	cd pdns-* && ./configure --with-modules="remote" && make && make install && \
	cd .. && rm -fr pdns-*
EXPOSE 53/udp 53/tcp
ENTRYPOINT ["/usr/local/sbin/pdns_server"]
