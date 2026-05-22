#!/bin/bash
#SBATCH --job-name=prepare_data    
#SBATCH --nodes=1              
#SBATCH --ntasks-per-node=1        
#SBATCH --cpus-per-task=30          # put this to 30 if need to do r1/r2 again
#SBATCH --hint=nomultithread    
#SBATCH --time=1:00:00             
#SBATCH --account=mlr@cpu
# SBATCH --constraint=v100-32g

# SBATCH --partition=gpu_p2
# SBATCH --gpus=2

module load pytorch-gpu/py3/2.1.1
PYTHONNOUSERSITE=1 PYTHONPATH=/lustre/fswork/projects/rech/mlr/udy16au/.diffesm_libs:$PYTHONPATH srun python src/prepare_data.py