# Docker NS1 Dynamic DNS
This updates DNS records in NS1 with the current IP (from [ipify.org](https://www.ipify.org)) every 5 minutes. The script runs under `cron` inside a lightweight Alpine-based Docker container.

[NS1](https://ns1.com) is a DNS provider that offers a generous free plan (500k queries/month, 50 records) and an API.

## Usage
### docker run
```
docker run -d \
    -v /your/config.yml:/config.yml:ro \
    microbug/ns1-dynamic-dns:latest
```

### docker-compose
```yaml
services:
  dynamic-dns:
    image: microbug/ns1-dynamic-dns:latest
    volumes:
      - /your/config.yml:/config.yml:ro
    restart: unless-stopped
```

## Config file
A `config.yml` file **must** be passed or the container won't be able to do anything. The format for the config file can be seen in `example-config.yml`.

## Why are you using an `nsone/` directory instead of `pip3 install nsone`
There's a bug with `nsone-python` that breaks compatibility with the current latest version of Python 3 (v3.6.4). I've [submitted a pull request to fix it](https://github.com/ns1/nsone-python/pull/38) but until it's accepted I've put the fixed version here so the container will work.
