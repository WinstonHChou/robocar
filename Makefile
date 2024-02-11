.ONESHELL:
SHELL := /bin/bash
.DEFAULT_GOAL := build

.PHONY: build
build:
	colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

.PHONY: rosdep-install
rosdep-install:
	sudo apt update
	rosdep update
	rosdep install -y -r --rosdistro foxy --ignore-src --from-paths src

.PHONY: rosdep-install-eol
rosdep-install-eol:
	sudo apt update
	rosdep update --include-eol-distros
	rosdep install -y -r --rosdistro foxy --ignore-src --from-paths src
	
.PHONY: livox-driver
livox-driver:
	./scripts/livox_driver.sh