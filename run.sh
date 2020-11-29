#!/bin/bash

module load cuda
module load gcc
export CUDA_AUTO_BOOST=0
nvcc main.cu -O3 -std=c++11 -gencode arch=compute_70,code=sm_70
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=1_out.tx ./run_single.sh 1 1
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=2_out.txt  ./run_single.sh 64 80
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=3_out.txt ./run_single.sh 64 160
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=4_out.txt ./run_single.sh 64 240
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=5_out.txt ./run_single.sh 128 320
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=6_out.txt ./run_single.sh 128 80
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=7_out.txt ./run_single.sh 128 160
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=8_out.txt ./run_single.sh 128 240
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=9_out.txt ./run_single.sh 128 320
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=10_out.txt ./run_single.sh 256 80
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=11_out.txt ./run_single.sh 256 160
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=12_out.txt ./run_single.sh 256 240
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=13_out.txt ./run_single.sh 256 320
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=14_out.txt ./run_single.sh 512 80
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=15_out.txt ./run_single.sh 512 160
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=16_out.txt ./run_single.sh 512 240
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=17_out.txt ./run_single.sh 512 320
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=18_out.txt ./run_single.sh 1024 80
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=19_out.txt ./run_single.sh 1024 160
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=20_out.txt ./run_single.sh 1024 240
sbatch --partition=intelv100 --exclude=ault24 --time=04:00:00 --gres=gpu:1 -n1  --cpus-per-task=8  --mem-per-cpu=4096 --output=21_out.txt ./run_single.sh 1024 320
