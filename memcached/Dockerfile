#
# Build it:
#     sudo docker build -t skxskx/memcached .
#
# Then launch it:
#     sudo docker run   -d -p 11211:11211 skxskx/memcached
#

FROM ubuntu
MAINTAINER steve@steve.org.uk
ENV DEBIAN_FRONTEND noninteractive

#
#  Update this to force a cache refresh.
#
RUN echo 11-03-2014
RUN apt-get update

#
#  Install the package.
#
RUN apt-get install --yes --force-yes memcached

#
#  Make it listen globally.
#
RUN sed -i "/127.0.0.1/d" /etc/memcached.conf
EXPOSE 11211

#
#  Start it
#
CMD ["/usr/bin/memcached","-u","memcache"]
