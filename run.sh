#!/usr/bin/env bash

WORK_DIR="${HOME}/JUPYTER_WORK_DIR"

IMAGE_REPO=brunoe
IMAGE_NAME=jupyter-base
IMAGE_TAG=develop


docker run --rm \
  --name ${IMAGE_NAME}-${PWD##*/} \
  --user root \
  --volume ${PWD}:/home/jovyan/notebooks/ \
  --volume ${WORK_DIR}:/home/jovyan/works/ \
  --publish 8888:8888 \
  --env NB_UID=$UID \
  ${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG} \
	start-notebook.sh --notebook-dir=/home/jovyan/notebooks/


#  --volume /var/run/docker.sock:/var/run/docker.sock \
