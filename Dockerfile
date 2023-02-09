FROM continuumio/miniconda3:4.7.10

LABEL "repository"="https://github.com/janclemenslab/conda-build-publish-action"
LABEL "maintainer"="Jan Clemens"

RUN conda install -y anaconda-client conda-build boa conda-verify pip git conda mamba -c conda-forge
RUN conda --set anaconda_upload yes --set always_yes yes --set changeps1 no
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
