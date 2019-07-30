#!/bin/env bash
#SBATCH -J mySlurmJob
#SBATCH -o mySlurmJob_%j.out
#SBATCH -e mySlurmJob_%j.err
#SBATCH --partition pritch,hns,normal
#SBATCH --mem 5G
#SBATCH --cpus-per-task 1
#SBATCH --nodes 1
#SBATCH --time 2:00


# multi-threading: use --cpus-per-task, all on one node: nodes 1

# Some job command here
