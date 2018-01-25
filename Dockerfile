FROM alpine:3.7

RUN apk add --no-cache python3 \
    && pip3 install pyyaml requests

# RUN pip3 install nsone
COPY nsone /nsone

ADD dynamic-dns.py /dynamic-dns.py
ADD config.yml /config.yml

COPY crontab /etc/crontabs/root
CMD ["crond", "-f", "-d", "8"]
