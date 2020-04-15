build:
	docker build -t openbts-umts-docker .

run:
	docker run --rm -ti --privileged -v $$PWD:/data -v /dev:/dev openbts-umts-docker /bin/bash
