#!/usr/bin/env bash

WORK_DIR="${HOME}/JUPYTER_WORK_DIR"

IMAGE_REPO=brunoe
IMAGE_NAME=jupyter-base
IMAGE_TAG=develop

OUTPUT_DIR="/home/jovyan/work/nbartefacts/${PWD##*/}/book/"

docker run --rm \
  --name ${IMAGE_NAME}-book-${PWD##*/} \
  --volume ${PWD}:/home/jovyan/notebooks/ \
  --volume ${WORK_DIR}:/home/jovyan/work/ \
  --env OUTPUT_DIR=$OUTPUT_DIR \
  --env NB_UID=$UID \
  ${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG} \
    sh -c 'mkdir -p $OUTPUT_DIR && \
        cd /home/jovyan/notebooks/ && \
        jupyter-book clean $OUTPUT_DIR && \
        for builder in html singlehtml pdflatex; do \
            jupyter-book build \
                --path-output $OUTPUT_DIR \
                --toc /home/jovyan/notebooks/book/_toc.yml \
                --config /home/jovyan/notebooks/book/_config.yml \
                --builder $builder \
                .
        done'

# --user root \
#  --volume /var/run/docker.sock:/var/run/docker.sock \
