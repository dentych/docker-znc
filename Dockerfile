FROM alpine
MAINTAINER dentych

RUN apk update \
	&& apk add \
		znc \
		znc-extra \
		znc-modperl \
		znc-modpython \
		znc-modtcl \
		ca-certificates \
		sudo \
	&& mkdir /znc-data
	
COPY entrypoint.sh /entrypoint.sh
COPY znc.conf /znc.conf

RUN chmod +x /entrypoint.sh

WORKDIR /znc-data

ENTRYPOINT ["/entrypoint.sh"]
