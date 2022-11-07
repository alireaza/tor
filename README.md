# TOR

## Build
Via GitHub repository
```bash
$ docker build --tag alireaza/tor:$(date -u +%Y%m%d) --tag alireaza/tor:latest https://github.com/alireaza/tor.git
```

## Run
Only SOCKS5:9050
```bash
$ docker run --interactive --tty --rm --publish="9050:9050" --name="tor" alireaza/tor
```

SOCKS5:9050 and HTTP:9051
```bash
$ docker run --interactive --tty --rm --publish="9050:9050" --publish="9051:9051" --name="tor" alireaza/tor HTTPTunnelPort 0.0.0.0:9051
```

### Some useful commands

#### Force New Identity
```bash
docker exec tor killall -HUP tor
```

