#!/bin/bash

set -ex
set -o pipefail

go_to_build_dir() {
    if [ ! -z $INPUT_RECIPE_DIRECTORY ]; then
        cd $INPUT_RECIPE_DIRECTORY
    fi
}

check_if_meta_yaml_file_exists() {
    if [ ! -f meta.yaml ]; then
        echo "meta.yaml must exist in the directory that is being packaged and published."
        exit 1
    fi
}

build_package(){
    conda build . -c conda-forge -c ncb -c anaconda --python $INPUT_PYTHON_VERSION --user $INPUT_ANACONDA_USER --token $INPUT_ANACONDA_TOKEN
}

go_to_build_dir
check_if_meta_yaml_file_exists
build_package
