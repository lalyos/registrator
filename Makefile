NAME=registrator
HARDWARE=$(shell uname -m)
VERSION=0.4.0

build:
	docker build -t registrator .

release:
	rm -rf release
	mkdir release
	GOOS=linux godep go build -o release/$(NAME)
	cd release && tar -zcf $(NAME)_linux_$(HARDWARE).tgz $(NAME)
	rm release/$(NAME)
	echo "$(VERSION)" > release/version
	echo "progrium/$(NAME)" > release/repo

.PHONY: release