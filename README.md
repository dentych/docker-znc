# ZNC Docker #
This is a Dockerfile for running ZNC in a docker container.

## Usage ##
**Build**
```
$ docker build -t dentych/znc .
```

**Run**
```
$ docker run --name znc -d -p 60000:60000 -p 60001:60001 -v /srv/znc:/znc-data dentych/znc
```
