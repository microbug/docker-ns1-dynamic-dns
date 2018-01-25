# Docker NS1 Dynamic DNS
This updates DNS records in NS1 with the current IP (from [ipify.org](https://www.ipify.org)) every 5 minutes. The script runs under `cron` inside a lightweight Alpine-based Docker container.

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
