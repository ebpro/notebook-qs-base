FROM  brunoe/jupyter-base:develop
COPY . ${HOME}/work
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
