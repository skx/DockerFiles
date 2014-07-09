#
#  The prefix for our images
#
PREFIX=skxskx


#
# Prefer the docker executable in the current directory, if it exists,
# but work with the system version if not.
#
DOCKER := $(shell if [ -x ./docker ]; then echo ./docker ; fi )
ifeq ($(DOCKER),)
DOCKER := $(shell which docker)
endif




#
# Rebuild all the images.
#
build-all:
	for i in */Dockerfile ; do \
		nm=$$(dirname $$i) ;\
		${DOCKER} build -t ${PREFIX}/$$nm $$nm/ ;\
	done



#
# Clean all images.  Every single image.
#
clean-all:
	${DOCKER} rm  `${DOCKER} ps --no-trunc -a -q` || true
	${DOCKER} rmi `${DOCKER} images -q`           || true



#
# Push all images - skipping *.local/
#
push-all:
	for i in */Dockerfile ; do \
		nm=$$(dirname $$i) ;\
		if ( ! echo $nm | grep local >/dev/null 2>/dev/null ) ; then \
			${DOCKER} push ${PREFIX}/$$nm ;\
		fi ; \
	done


#
# Show the version of docker.
#
version:
	${DOCKER} --version
