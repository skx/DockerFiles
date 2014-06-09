#
# Build it:
#     docker build -t skxskx/apache2 .
#
# Then launch it:
#     id=$(docker run -d -p 80 skxskx/apache2)
#
# By default Apache2 will serve content from beneath /var/www so you
# should map that to a persistent location such that you can actually
# serve content:
#
#     docker run -d -p 80:80 -v ~/htdocs:/var/www skxskx/apache2
#
# Steve
# --
#

FROM ubuntu
MAINTAINER steve@steve.org.uk

#
# Update this to trigger a rebuild.
#
RUN echo 09-05-2014
RUN apt-get update

#
#  Install apache2 + PHP5
#
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libapache2-mod-php5 apache2

#
#  Install runit to launch apache
#
RUN apt-get install runit --yes --force-yes


#
#  Add a test-file.
#
ADD index.php /var/www/html/index.php


#
#  Expose the server-port
#
EXPOSE 80


#
#  Expose the root directory.
#
VOLUME [ "/var/www/html" ]


#
#  Configure runit to launch apache2
#
RUN mkdir -p /etc/service/apache2
RUN echo  '#!/bin/sh\n. /etc/apache2/envvars \n /usr/sbin/apache2 -D FOREGROUND' > /etc/service/apache2/run
RUN chmod 755 /etc/service/apache2/run

#
#  Launch runit
#
ENTRYPOINT ["/usr/sbin/runsvdir-start"]


