FROM alpine:3.7

RUN apk add --no-cache python3 git \
    && pip3 install pyyaml requests ns1-python \
    && apk del --no-cache git

ADD dynamic-dns.py /dynamic-dns.py

COPY crontab /etc/crontabs/root
CMD ["crond", "-f", "-d", "8"]
