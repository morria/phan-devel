#!/bin/sh
docker run \
  --interactive \
  --workdir /home/user/phan \
  --tty \
  --name phan-devel-n \
  --user user \
  --volume phan:/home/user/phan/shared \
  phan-devel \
  bash
