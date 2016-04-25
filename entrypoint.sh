#!/bin/bash

DIR="/znc-data"

if [ ! -f "${DIR}/configs/znc.conf" ]; then
	mkdir -p "${DIR}/configs"
	cp /znc.conf "${DIR}/configs/znc.conf"
fi

# Make sure znc owns the znc-data dir
chown -R znc:znc "$DIR"

# run znc as znc user
exec sudo -u znc znc --foreground --datadir="$DIR" $@
