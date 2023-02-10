FROM condaforge/mambaforge:22.9.0-3

LABEL "repository"="https://github.com/janclemenslab/conda-build-publish-action"
LABEL "maintainer"="Jan Clemens"

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN conda install -n base conda-libmamba-solver -y -c conda-forge
RUN conda config --set anaconda_upload yes --set always_yes yes --set changeps1 no --set solver libmamba
RUN conda install  -n base anaconda-client conda-build boa conda-verify pip git -y -c conda-forge
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
