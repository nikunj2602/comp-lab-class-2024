#!/bin/bash

#SBATCH --job-name=proton_aimd    # Job name
#SBATCH --output=proton_aimd.log  # Output log file
#SBATCH --error=proton_aimd.err   # Error log file
#SBATCH --nodes=1                # Number of nodes
#SBATCH --ntasks-per-node=12     # Number of tasks per node
#SBATCH --cpus-per-task=1        # CPUs per task
#SBATCH --mem=20GB               # Total memory
#SBATCH --time=07:00:00          # Wall time (6 hours)

# Load CP2K module
module purge
module load cp2k/openmpi/intel/20201212

# Run CP2K job
mpirun -np 12 cp2k.popt -i proton.inp -o proton_aimd_output.log

