FROM alpine:edge
RUN apk add --update avahi dnsmasq && \
    sed -i 's/#enable-dbus=yes/enable-dbus=no/g' /etc/avahi/avahi-daemon.conf && \
    rm -rf /var/cache/apk/*

# dns
EXPOSE 53 53/udp

# mDns
EXPOSE 5353/udp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh", "-k"]
