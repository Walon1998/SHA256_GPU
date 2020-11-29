#!/bin/bash

module load cuda
module load gcc
export CUDA_AUTO_BOOST=0
nvcc main.cu -O3 -std=c++11 -gencode arch=compute_70,code=sm_70
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_${1}_${2}.csv ./a.out $1 $2
