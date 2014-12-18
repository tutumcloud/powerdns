FROM tutum/curl

RUN curl -s https://downloads.powerdns.com/releases/deb/pdns-static_3.4.1-1_amd64.deb -o /tmp/pdns.deb && dpkg -i /tmp/pdns.deb && rm -f /tmp/pdns.deb
EXPOSE 53/udp
ENTRYPOINT ["/usr/sbin/pdns_server"]
