FROM tutum/curl

RUN apt-get update && apt-get install -yq build-essential libcurl3 libboost-dev libboost-program-options-dev libboost-serialization-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://downloads.powerdns.com/releases/pdns-3.4.3.tar.bz2 | tar xjf - -C . && \
	cd pdns-* && ./configure --with-modules="remote" && make && make install && \
	cd .. && rm -fr pdns-*
EXPOSE 53/udp 53/tcp
ENTRYPOINT ["/usr/local/sbin/pdns_server"]
