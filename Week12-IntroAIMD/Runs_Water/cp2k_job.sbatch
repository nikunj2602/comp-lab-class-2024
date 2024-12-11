#!/bin/bash
#SBATCH --job-name=water_aimd
#SBATCH --output=water_aimd_out.log
#SBATCH --error=water_aimd_err.log
#SBATCH --time=06:00:00   # Wall time (hh:mm:ss)
#SBATCH --ntasks-per-node=12       # Total tasks
#SBATCH --cpus-per-task=1 # CPUs per task
#SBATCH --mem=20GB        # Memory per node

# Load the CP2K module
module load cp2k/openmpi/intel/20201212

# Run the simulation
mpirun -np 12 cp2k.popt -i water.inp -o water_aimd_1ps_every0.5fs.log