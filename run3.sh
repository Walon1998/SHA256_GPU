#!/bin/bash

module load cuda
module load gcc
export CUDA_AUTO_BOOST=0
nvcc main.cu -O3 -std=c++11 -gencode arch=compute_70,code=sm_70
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 64 320
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 128 320
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 256 320
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 512 80
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 512 160
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 512 240
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 512 320
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 1024 80
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 1024 160
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 1024 240
sbatch --partition=intelv100 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 ./run_single.sh 1024 320
