#
# Build it like so:
#
#   root@host~# docker build -t=skxskx/wordpress .
#   1234
#
# Launch the generated image like so:
#
#   root@host~# id=$(docker run -d -p 8080:80 -p 2222:22 skxskx/wordpress)
#
# Connect like via SSH like so, with the username "user":
#
#   $ ssh -p 2222 user@localhost
#
# You can find the password by reading the output of the start-process via:
#
#   $ docker logs $id | grep -i passwo
#
# That same log-reading process will let you know the MySQL password for
# the wordpress user, which you will need when you visit:
#
#    http://127.0.0.1:8080/wordpress/
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
# Update apt
#
RUN echo 09-07-2014
RUN apt-get update -q -q

#
#  Install packages
#
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server apache2 libapache2-mod-php5 pwgen python-setuptools vim-tiny php5-mysql openssh-server sudo php5-ldap

#
#  Install supervisor
#
RUN easy_install supervisor

#
#  Add the scripts.
#
ADD ./scripts/start.sh /start.sh
ADD ./scripts/foreground.sh /etc/apache2/foreground.sh
ADD ./configs/supervisord.conf /etc/supervisord.conf
ADD ./configs/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers


#
#  Install wordpress
#
RUN rm -rf /var/www/
ADD http://wordpress.org/latest.tar.gz /wordpress.tar.gz
RUN tar xvzf /wordpress.tar.gz
RUN mkdir -p /var/www/html/
RUN mv /wordpress /var/www/html/

#
#  Fix permissions.
#
RUN chown -R www-data:www-data /var/www/
RUN chmod 755 /start.sh
RUN chmod 755 /etc/apache2/foreground.sh
RUN mkdir /var/log/supervisor/
RUN mkdir /var/run/sshd
EXPOSE 80
EXPOSE 22
CMD ["/bin/bash", "/start.sh"]
