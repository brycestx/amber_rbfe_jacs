#!/bin/bash
#SBATCH -o post_atom_mapping.out 
#SBATCH -N 1
#SBATCH -n 1
##SBATCH -p cpu 
#SBATCH -p project 
#SBATCH -c 2
#SBATCH -J post_map
#SBATCH --time 12:00:00
##SBATCH --qos=cpuonly
#SBATCH --qos=maxjobs
#SBATCH --oversubscribe

echo "Hostname is $HOSTNAME" 
srun post_atom_mapping.py -i /projects4/zhixiong/work/2FEP/19.09.17_atom_mapping_jacs_dataset/Bace -o /projects4/zhixiong/work/2FEP/19.09.17_atom_mapping_jacs_dataset/Bace