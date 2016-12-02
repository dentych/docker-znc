FROM alpine
MAINTAINER dentych

RUN apk add --update --no-cache \
		znc \
		znc-extra \
		znc-modperl \
		znc-modpython \
		znc-modtcl \
		ca-certificates \
	&& mkdir /znc-data \
	&& chown -R znc:znc /znc-data

USER znc

WORKDIR /znc-data

ENTRYPOINT ["znc", "--datadir=/znc-data"]
CMD ["--foreground"]
