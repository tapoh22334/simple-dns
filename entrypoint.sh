#!/bin/sh
# Execute the provided command
avahi-daemon &
exec dnsmasq -k
