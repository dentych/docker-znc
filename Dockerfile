FROM ubuntu
MAINTAINER dentych

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
	&& apt-get install -y -q \
		python-software-properties \
		software-properties-common \
	&& add-apt-repository -y \
		ppa:teward/znc \
	&& apt-get update -y \
	&& apt-get install -y -q \
		znc \
		znc-dbg \
		znc-dev \
		znc-perl \
		znc-python \
		znc-tcl \
	&& apt-get purge -y -q \
		python-software-properties \
		software-properties-common \
	&& apt-get autoremove -y -q --purge \
	&& apt-get clean -y \
	&& apt-get autoclean -y

RUN useradd znc \
	&& mkdir /znc-data

COPY entrypoint.sh /entrypoint.sh
COPY znc.conf /znc.conf

WORKDIR /znc-data

ENTRYPOINT ["/entrypoint.sh"]
