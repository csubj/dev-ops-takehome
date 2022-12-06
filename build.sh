#!/bin/bash

# build image for dev env. 
# TODO: if the image exists, dont rebuild. 
# TODO: check to see if the image is avaliable in a repo versus building local. 
docker build build/  -t ergatta-dev 
mkdir -p /tmp/build_output # seems to be required

# run dev environment
docker run -it \
  --name ergdev-$(date +%s) \
  -v "$(pwd)":/src/workspace \
  -v /tmp/ \ # required for mac, might not be for other 
  -v /tmp/build_output:/tmp/build_output \
  -w /src/workspace \
  ergatta-dev:latest bash

