#!/usr/bin/env bash

WORK_DIR="${HOME}/JUPYTER_WORK_DIR"

IMAGE_REPO=brunoe
IMAGE_NAME=jupyter-base
IMAGE_TAG=develop

OUTPUT_DIR="/home/jovyan/work/nbartefacts/${PWD##*/}"


docker run --rm \
  --name ${IMAGE_NAME}-book-${PWD##*/} \
  --volume ${PWD}:/home/jovyan/notebooks/ \
  --volume ${WORK_DIR}:/home/jovyan/work/ \
  --env NB_UID=$UID \
  --env OUTPUT_DIR=$OUTPUT_DIR \
  ${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG} \
    sh -c 'cd /home/jovyan/notebooks/ && \
	   mkdir -p $OUTPUT_DIR && \
           jupyter nbconvert --to notebook --execute --inplace *.ipynb
	   for format in html pdf slides; do
           	jupyter nbconvert --output $OUTPUT_DIR --to $format *.ipynb;
	   done'
# --user root \
#  --volume /var/run/docker.sock:/var/run/docker.sock \
