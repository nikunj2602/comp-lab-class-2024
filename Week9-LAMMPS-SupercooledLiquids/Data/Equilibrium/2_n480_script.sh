#!/bin/bash
#SBATCH --job-name=kalj_production
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=00:20:00
#SBATCH --output=output_production.log

# Load the LAMMPS module (if needed)
source /scratch/work/courses/CHEM-GA-2671-2024fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

# Directory setup
mkdir -p Data
cd Data

# Production run temperatures array
temperatures=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475)

# Loop over temperatures to run production
for T in "${temperatures[@]}"; do
    mpirun lmp -var configfile ../n480/kalj_n480_T$T.lmp -var id 1 -in ../production_3d_binary.lmp
done