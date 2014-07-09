#
# Build it:
#     sudo docker build -t skxskx/redis .
#
# Then launch it:
#     sudo docker run -d -p 6379:6379 skxskx/redis
#
# NOTE: There is no local-storage setup.
#

FROM ubuntu
MAINTAINER steve@steve.org.uk
ENV DEBIAN_FRONTEND noninteractive

#
#  Update this to force a cache refresh.
#
RUN echo 09-07-2014
RUN apt-get update

#
#  Install the package.
#
RUN apt-get install --yes --force-yes redis-server

#
#  Make it listen globally.
#
RUN sed -i "/bind 127.0.0.1/d" /etc/redis/redis.conf
RUN perl -pi -e "s/daemonize yes/daemonize no/g" /etc/redis/redis.conf

#
#  Expose the port and start it.
#
EXPOSE 6379
CMD /usr/bin/redis-server /etc/redis/redis.conf
