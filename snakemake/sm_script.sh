#!/bin/sh

# Snakemake Sbatch script
# Margaret Antonio

# Prefer to run this in an interactive session so
# can see the jobs running and when they fail
# Don't really see a reason to run it as sbatch


# Sometimes need to unlock the current directory
# If a previous run failed
#snakemake --unlock

snakemake --rerun-incomplete --timestamp --keep-going -j 500 \
	--cluster-config sm_slurm_config.json \
	--cluster "sbatch -p {cluster.queue} \
			--ntasks-per-node={cluster.tasks} \
			--job-name={cluster.name} \
			-o {cluster.error} \
			-e {cluster.error} \
			-t {cluster.time} \
			--nodes={cluster.nodes} \
			--mem={cluster.memory}"
