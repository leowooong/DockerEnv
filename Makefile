# Makefile
usr ?= me

name_base ?= base
hostname_args_base = $(if $(name_base),--hostname $(name_base),)
containername_args_base = $(if $(name_base),--name $(name_base),)

build_base:
	docker build \
	-t ubuntu:base \
	-f Dockerfile.base \
	--build-arg USRNAME=$(usr) \
	.

run_base: build_base
	docker run \
	-it \
	--rm \
	$(hostname_args_base) \
	$(containername_args_base) \
	-v $(HOME)/Documents:/home/$(usr)/Documents \
	-v $(HOME)/Downloads:/home/$(usr)/Downloads \
	ubuntu:base

exec_base: 
	docker exec -it $(name_base) /usr/bin/zsh
##########################################################################################
##########################################################################################
name_python ?= python
hostname_args_python = $(if $(name_python),--hostname $(name_python),)
containername_args_python = $(if $(name_python),--name $(name_python),)

build_python: build_base
	docker build \
	-t ubuntu:python \
	-f Dockerfile.python \
	.

run_python: build_python
	docker run \
	-it \
	--rm \
	$(hostname_args_python) \
	$(containername_args_python) \
	-v $(HOME)/Documents:/home/$(usr)/Documents \
	-v $(HOME)/Downloads:/home/$(usr)/Downloads \
	ubuntu:python
##########################################################################################
##########################################################################################
name_cpp ?= cpp
hostname_args_cpp = $(if $(name_cpp),--hostname $(name_cpp),)
containername_args_cpp = $(if $(name_cpp),--name $(name_cpp),)

build_cpp: build_base
	docker build \
	-t ubuntu:cpp \
	-f Dockerfile.cpp \
	.

run_cpp: build_cpp
	docker run \
	-it \
	--rm \
	$(hostname_args_cpp) \
	$(containername_args_cpp) \
	-v $(HOME)/Documents:/home/$(usr)/Documents \
	-v $(HOME)/Downloads:/home/$(usr)/Downloads \
	ubuntu:cpp