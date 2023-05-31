# notebook-qs-base

A notebook to present a precofigured Jupyter image for bachelor of science teaching (Python, LaTeX and Git).

## Usage
Clone this repository, cd in it and launch the image in a container (see https://github.com/ebpro/jupyter-base for détails). 

```bash
docker run --rm --name jupyter-base-${PWD##*/} \
  --user root
  --volume $PWD:/home/jovyan/work/${PWD##*/} \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --publish 8888:8888 \
  --env NB_UID=$UID \
  brunoe/jupyter-base:develop start-notebook.sh --notebook-dir=work/${PWD##*/}
```
