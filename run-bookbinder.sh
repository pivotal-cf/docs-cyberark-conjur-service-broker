#!/bin/bash -ex

docker build . -t pivotal-docs-site:latest

docker run --rm -it \
  -p 4567:4567 \
  -v $PWD:/docs/ \
  pivotal-docs-site
