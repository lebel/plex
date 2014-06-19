FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
#Based on the work of Eric Schultz <eric@startuperic.com>
#Thanks to Tim Haak <tim@haak.co.uk>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update
RUN apt-get install -qy curl

RUN echo "deb http://shell.ninthgate.se/packages/debian plexpass main" > /etc/apt/sources.list.d/plexmediaserver.list

RUN curl http://shell.ninthgate.se/packages/shell-ninthgate-se-keyring.key | apt-key add -

RUN apt-get -q update
RUN apt-get install -qy plexmediaserver

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh

EXPOSE 32400

CMD ["/bin/bash", "/start.sh"]