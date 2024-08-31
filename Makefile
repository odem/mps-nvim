# Default targets
.PHONY: default build restart start stop kill exec clean
default: usage

# Makefile setup
SHELL:=/bin/bash
IMGNAME := testimg
CONTNAME := testcont
INSTALLERS_LOCAL := $(shell pwd)/installers
INSTALLERS_REMOTE := /root/installers
DOTFILES_LOCAL := $(shell pwd)/dotfiles
DOTFILES_REMOTE := /root/dotfiles
BUILD_OPTS ?=
EXEC ?= bash
# Help
usage:
	@echo "make TARGET"
	@echo "   TARGETS: "
	@echo "     build: Build the Container"
	@echo "     start: Start the container"
	@echo "     stop : Stop the container"
	@echo "     kill : Kill the container"
	@echo "     exec : Exec bash"
	@echo "     clean: Remove container and image"
	@echo "     usage: Help message"
	@echo ""

# Targets
build:
	docker build $(BUILD_OPTS) -t $(IMGNAME) .
start: build
	docker run \
		-d \
		--rm \
		--name $(CONTNAME) \
		$(IMGNAME) \
		tail -f /dev/null
		# -v $(INSTALLERS_LOCAL):$(INSTALLERS_REMOTE) 
		# -v $(DOTFILES_LOCAL):$(DOTFILES_REMOTE) \

restart: kill build start

stop:
	-docker stop $(CONTNAME)
kill:
	-docker kill $(CONTNAME)
exec:
	docker exec -it $(CONTNAME) $(EXEC)
clean:
	-docker kill $(CONTNAME)
	-docker rm $(CONTNAME)
	-docker rmi $(IMGNAME)

