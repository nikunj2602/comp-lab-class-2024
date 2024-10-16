#!/bin/bash
#SBATCH --job-name=gmx_gpu_run    # Job name
#SBATCH --output=output_%j.txt    # Standard output file (%j = job ID)
#SBATCH --error=error_%j.txt      # Error file
#SBATCH --time=04:00:00           # Time limit (hh:mm:ss)
#SBATCH --nodes=1                 # Number of nodes
#SBATCH --ntasks=1                # Number of MPI tasks
#SBATCH --cpus-per-task=4         # Number of CPU cores per task (matching -ntomp)
#SBATCH --gres=gpu:1              # Request 1 GPU
#SBATCH --mem=16G                 # Memory per node
#SBATCH --partition=gpu           # Partition name

# Load GROMACS and CUDA modules

module load gromacs/2021.2        # Adjust to your GROMACS module version
module load cuda/11.2             # Adjust to your CUDA version

# Set environment variables for better GPU performance
export GMX_GPU_DD_COMMS=true      # Use GPU for domain decomposition communications
export GMX_GPU_PME_PP_COMMS=true  # Use GPU for PME-PP communications
export GMX_USE_GPU_BUFFERS=force  # Force use of GPU for non-bonded interactions

# Run GROMACS with GPU acceleration
gmx_mpi mdrun -deffnm md_0_1 -nb gpu -ntomp 4


