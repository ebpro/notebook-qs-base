#!/usr/bin/env bash

WORK_DIR="${HOME}/JUPYTER_WORK_DIR"

IMAGE_REPO=brunoe
IMAGE_NAME=jupyter-base
IMAGE_TAG=develop


docker run --rm -it\
  --name ${IMAGE_NAME}-${PWD##*/} \
  --user root \
  --volume JUPYTER_WORKDIR:/home/jovyan/work/ \
  --volume ${PWD}:/home/jovyan/work/local/ \
  --publish 8888:8888 \
  ${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG}

#  --volume /var/run/docker.sock:/var/run/docker.sock \
