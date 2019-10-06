#!/bin/bash

# This is the most ad-hoc approach: a single command will build
# a LaTeX document in the current folder, once, and remove the
# container again.

# build image with: 
#   docker build -t texlive-base-luatex --build-arg "profile=base-luatex" .

mkdir -p out

docker run -it --rm --name=tld-example \
    -v `pwd`:/work/src:ro \
    -v `pwd`/out:/work/out \
    texlive-base-luatex \
    work 'lualatex hello_world.tex'

mv out/* ./ && rm -rf out

# Nota bene: the output files now belong to root;
#            this is an unfortunate restriction of docker.
#            See `repeated-build.sh` for a way to avoid this.