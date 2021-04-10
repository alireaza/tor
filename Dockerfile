FROM alpine:3.13.4

RUN apk update \ 
&& apk add --no-cache \
tor

RUN apk add obfs4proxy --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

RUN touch /torrc
RUN echo "SocksPort 0.0.0.0:9050" >> /torrc
RUN echo "HTTPTunnelPort 0.0.0.0:8118" >> /torrc

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

ENTRYPOINT ["/usr/bin/tor", "-f", "/torrc"]
