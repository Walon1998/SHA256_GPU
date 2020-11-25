#!/bin/bash

module load cuda
module load gcc
nvcc main.cu -O3 -std=c++11 -gencode arch=compute_70,code=sm_70
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_1_1.txt ./a.out 1 1
