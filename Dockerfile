FROM alpine:3.7

RUN apk add --no-cache python3 git \
    && pip3 install pyyaml requests 'git+https://github.com/ns1/ns1-python.git' \
    && apk del --no-cache git

# Once the new ns1-python is complete, uncomment this and remove the
# manual installation from the above
#RUN pip3 install ns1-python

ADD dynamic-dns.py /dynamic-dns.py

COPY crontab /etc/crontabs/root
CMD ["crond", "-f", "-d", "8"]
