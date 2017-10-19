FROM resin/raspberrypi3-alpine
MAINTAINER Max Huang <maxh1981@gmail.com>

RUN apk update \
 && apk add --no-cache --virtual build-tools \
	git \
	go \
	musl-dev \
 && mkdir -p /gohome \
 && export GOPATH=/gohome \
 && go get github.com/jpillora/chisel \
 && apk del build-tools

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENV GOPATH=/gohome

ENTRYPOINT ["/entrypoint.sh"]

CMD ["chisel"]
