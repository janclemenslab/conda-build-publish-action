FROM continuumio/miniconda3:4.7.10

LABEL "repository"="https://github.com/janclemenslab/conda-build-publish-action"
LABEL "maintainer"="Jan Clemens"

RUN conda install -n base conda-libmamba-solver
RUN conda config --set anaconda_upload yes --set always_yes yes --set changeps1 no --set solver libmamba
RUN conda install -y anaconda-client conda-build boa conda-verify pip git -c conda-forge
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
