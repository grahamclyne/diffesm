#!/bin/bash
#SBATCH --job-name=training     # job name
#SBATCH --nodes=1                 # number of MP tasks
#SBATCH --ntasks-per-node=1          # this needs to correspond with # of GPUS
#SBATCH --cpus-per-task=16           # number of cores per tasks, see how many GPUs per node and take proportional amount of CPUs
#SBATCH --hint=nomultithread         # we get physical cores not logical
#SBATCH --time=10:00:00              # maximum execution time (HH:MM:SS)
#SBATCH --account=mlr@v100
#SBATCH --partition=gpu_p2
#SBATCH --gpus=1

module load pytorch-gpu/py3/2.1.1
export PYTHONNOUSERSITE=1
export PYTHONPATH=/lustre/fswork/projects/rech/mlr/udy16au/.diffesm_libs:$PYTHONPATH
PYTHONNOUSERSITE=1 PYTHONPATH=/lustre/fswork/projects/rech/mlr/udy16au/.diffesm_libs:$PYTHONPATH python src/train.py
