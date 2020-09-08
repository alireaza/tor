FROM alpine:3.12.0

RUN apk update \ 
&& apk add --no-cache \
tor

ARG UNAME=udocker
ARG UID=1000
ARG GNAME=$UNAME
ARG GID=1000
ARG GROUPS=$GNAME

RUN addgroup -S -g $GID $GNAME \
&& adduser -S -h /home/$UNAME -G $GNAME -u $UID $UNAME
USER $UNAME
WORKDIR /home/$UNAME

EXPOSE 9050
EXPOSE 8118

ENTRYPOINT ["/usr/bin/tor", "SocksPort", "0.0.0.0:9050", "HTTPTunnelPort", "0.0.0.0:8118"]
