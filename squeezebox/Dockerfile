#
# Build it like so:
#
#   root@host~# docker build -t=skxskx/stream .
#
# Before launching you need to have your music on your host machine,
# I store mine in /srv/media, and we need to map that to /media in this
# image
#
#   # docker run -d -v /srv/music:/media -p 9000:9000 -p 3483:3483/udp -p 3483:3483 skxskx/stream
#
# Once launched point your browser at http://localhost:9000/ and configure
# the server to load from /media.
#
# Steve
# --
#



#
#  From this base-image / starting-point
#
FROM ubuntu

#
#  Authorship
#
MAINTAINER steve@steve.org.uk

#
# Install the source-entry
#
RUN echo 'deb http://debian.slimdevices.com stable main' > /etc/apt/sources.list.d/slim.list

#
# Update apt
#
RUN apt-get update -q -q

#
# Install the damn thing
#
RUN apt-get install  --yes --force-yes logitechmediaserver

#
# Make sure we have /media
#
RUN mkdir /media || true

#
# Expose the ports
#
EXPOSE 9000
EXPOSE 3483
EXPOSE 3483/udp

#
#  Expose the media directory.
#
VOLUME [ "/media" ]

#
# Finally launch the thing on-startup.
#
ENTRYPOINT "/bin/sh" "-c" "/etc/init.d/logitechmediaserver start; tail -F /var/log/squeezeboxserver/server.log"

