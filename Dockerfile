FROM ubuntu
MAINTAINER dentych

RUN apt-get update -y &&\
	DEBIAN_FRONTEND=noninteractive &&\
	apt-get install -y python-software-properties software-properties-common &&\
	add-apt-repository -y ppa:teward/znc &&\
	apt-get update &&\
	apt-get install -y znc znc-dbg znc-dev znc-perl znc-python znc-tcl &&\
	apt-get clean &&\
	apt-get autoclean

RUN useradd znc && mkdir /znc-data

COPY entrypoint.sh /entrypoint.sh
COPY znc.conf /znc.conf

WORKDIR /znc-data

ENTRYPOINT ["/entrypoint.sh"]
