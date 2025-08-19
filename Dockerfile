FROM alpine:latest

RUN apk add --no-cache tor curl
RUN mkdir -p /var/lib/tor && chmod 777 /var/lib/tor
CMD ["sh", "-c", "\
if [ ! -f /var/lib/tor/torrc ]; then \
  cp /etc/tor/torrc.sample /var/lib/tor/torrc; \
fi && exec tor -f /var/lib/tor/torrc"]
