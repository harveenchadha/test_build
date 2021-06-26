#!/bin/bash

git clone https://github.com/Open-Speech-EkStep/fairseq -b v2-hydra
cd fairseq
pip install -e .
cd ..

git clone https://github.com/kpu/kenlm.git
cd kenlm
mkdir -p build && cd build
cmake .. 
make -j 16
cd ..
export KENLM_ROOT=$PWD
export USE_CUDA=0 ## for cpu
cd ..

git clone https://github.com/flashlight/flashlight.git
cd flashlight/bindings/python
export USE_MKL=0
python setup.py install
