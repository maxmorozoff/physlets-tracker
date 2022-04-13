.PHONY: *

install-docker:
	sudo ./docker-install.sh

build-image:
	sudo ./physlets-tracker-install.sh build

run:
	sudo ./physlets-tracker-install.sh