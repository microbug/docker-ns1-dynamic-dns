# Docker NS1 Dynamic DNS
This updates DNS records in NS1 with the current IP every 5 minutes, running inside a Docker container.

## Usage
```
docker run -d \
    -v /your/config.yml:/config.yml:ro \
    microbug/ns1-dynamic-dns:latest
```
