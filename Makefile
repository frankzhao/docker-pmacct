ROOT	:= $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
NAME	:= pmacct
TAG 	:= chickenmaru/$(NAME)

.PHONY: all build

all: build

build:
	@docker build -t $(TAG) $(ROOT)

run:
	@docker run -it -d -p 6343:6343 -p 5678:5678 --name $(NAME) $(TAG)

client:
	@docker exec -it $(NAME) /root/initclient.sh

shell:
	@docker exec -it $(NAME) bash

clean:
	@docker stop $(NAME)
	@docker rm -v $(NAME)
	@docker rmi -f $(TAG)
