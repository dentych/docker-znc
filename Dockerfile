FROM ubuntu
MAINTAINER dentych

RUN apt-get update && apt-get install -y python-software-properties software-properties-common \
	&& add-apt-repository -y ppa:teward/znc && apt-get update \
	&& apt-get install -y znc znc-dbg znc-dev znc-perl znc-python znc-tcl

RUN useradd znc && mkdir /znc-data

COPY entrypoint.sh /entrypoint.sh
COPY znc.conf /znc.conf

WORKDIR /znc-data

ENTRYPOINT ["/entrypoint.sh"]
