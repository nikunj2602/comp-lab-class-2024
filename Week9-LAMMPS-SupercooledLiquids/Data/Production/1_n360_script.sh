#!/bin/bash
#SBATCH --job-name=kalj_anneal
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --output=output_anneal.log

# Load the LAMMPS module (if needed)
source /scratch/work/courses/CHEM-GA-2671-2024fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

# Directory setup
mkdir -p Data
cp kalj.lmp kalj_particles.lmp Data/

# Move to the Data directory
cd Data

# System creation
mpirun lmp -var configfile ../n360/kalj_n360_create.lmp -var id 1 -in ../create_3d_binary.lmp

# Equilibration temperatures array
temperatures=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475)

# Loop over temperatures to run equilibration
for T in "${temperatures[@]}"; do
    mpirun lmp -var configfile ../n360/kalj_n360_T$T.lmp -var id 1 -in ../anneal_3d_binary.lmp
done