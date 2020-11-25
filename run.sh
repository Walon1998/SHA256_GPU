#!/bin/bash

module load cuda
module load gcc
nvcc main.cu -O3 -std=c++11 -gencode arch=compute_70,code=sm_70
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_1_1.txt ./a.out 1 1
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_64_80.txt ./a.out 64 80
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_64_160.txt ./a.out 64 160
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_64_240.txt ./a.out 64 240
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_128_80.txt ./a.out 128 80
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_128_160.txt ./a.out 128 160
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_128_240.txt ./a.out 128 240
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_256_80.txt ./a.out 256 80
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_256_160.txt ./a.out 256 160
nvprof --concurrent-kernels off --csv --profile-from-start off --print-gpu-trace --log-file Result/GPU_256_240.txt ./a.out 256 240
