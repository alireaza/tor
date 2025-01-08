FROM alpine:3.21

RUN apk update \ 
&& apk add --no-cache \
tor

RUN touch /torrc
RUN echo "SocksPort 0.0.0.0:9050" >> /torrc

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

ENTRYPOINT ["/usr/bin/tor", "-f", "/torrc"]

