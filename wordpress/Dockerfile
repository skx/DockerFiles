#
# Build it:
#     docker build -t skxskx/wordpress .
#
# Then launch it:
#     id=$(docker run -d -p 80 -p 22 skxskx/wordpress)
#
# Once launched you need to learn the password(s):
#
#    docker logs $id | grep password
#
# Finally you'll find the port(s) by running:
#
#    docker port $id 80
#    docker port $id 22
#

FROM ubuntu
MAINTAINER steve@steve.org.uk
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server apache2 libapache2-mod-php5 pwgen python-setuptools vim-tiny php5-mysql openssh-server sudo php5-ldap
RUN easy_install supervisor
ADD ./start.sh /start.sh
ADD ./foreground.sh /etc/apache2/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf
RUN echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers
RUN rm -rf /var/www/
ADD http://wordpress.org/latest.tar.gz /wordpress
RUN mv /wordpress/wordpress /var/www/
RUN chown -R www-data:www-data /var/www/
RUN chmod 755 /start.sh
RUN chmod 755 /etc/apache2/foreground.sh
RUN mkdir /var/log/supervisor/
RUN mkdir /var/run/sshd
EXPOSE 80
EXPOSE 22
CMD ["/bin/bash", "/start.sh"]