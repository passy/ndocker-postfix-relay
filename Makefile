include env_make

NS = passy
VERSION ?= latest

REPO = ndocker-postfix-relay
NAME = postfix-relay
INSTANCE = default

.PHONY: build run

build:
	docker build \
		--rm \
		--tag $(NS)/$(REPO):$(VERSION) .

clean:
	docker rmi \
		--force \
		$(NS)/$(REPO):$(VERSION)

shell:
	docker run \
		-it \
		$(PORTS) \
		$(VOLUMES) \
		$(ENV) \
		$(NS)/$(REPO) \
		sh

run:
	docker run \
		--rm \
		-it \
		--name $(NAME)-$(INSTANCE) \
		$(PORTS) \
		$(VOLUMES) \
		$(ENV) \
		$(NS)/$(REPO):$(VERSION) \
		sh

stop:
	docker stop \
		$(NAME)-$(INSTANCE)

push:
	docker push \
		$(NS)/$(REPO):$(VERSION)

default: build

