Dockerfile Collection
=====================

A small collection of `Dockerfile`s, used to build docker images.

Each image in this repository has been tested with Docker version 1.0.0, build 63fe64c


* apache2-php5
    * An image which launches a webserver.
* beanstalkd
    * The in-memory work-queue.
* graphite
    * A graphing/storage/stats system.
* memcached
    * The in-memory cache.
* prosody
    * The XMPP chat-server.
* redis
    * The in-memory database.
* sshd
    * An openssh server.
* wordpress
    * A popular blogging engine.

TODO:

* squeezebox




Notes
-----

As of Docker release 0.9 you should launch the deamon like so:

       # docker -d -e lxc

(The "`-e lxc`" addition is new, and will force the backend to use `lxc`,
which was previously the default.  See this [docker blog entry](http://blog.docker.io/2014/03/docker-0-9-introducing-execution-drivers-and-libcontainer/) for details.)



Binary Images
-------------

Binary images can be pulled from my docker profile:

* https://index.docker.io/u/skxskx/


Steve
--
