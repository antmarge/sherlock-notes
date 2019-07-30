# Running Snakemake on slurm cluster manager

#### Set up

Snakefile contains rules to be run
snakemake_variables.py contains variables included from Snakefile
sm_slurm_config.json contains cluster configurations for rules in Snakfile
sm_script.sh oneliner to run snakemake 

#### Misc

`snakemake -np` performs dry-run of snakemake
`snakemake --unlock` unlocks the working dir 

#### Running it

1. Do a dry run first
2. Start an interactive session inside of a screen
3. Run the one liner from sm_script.sh to start the pipeline
4. Return to screen to monitor jobs

#### Stopping the pipeline

1. Stop it in the interactive session
2. Cancel all jobs already submitted - do in for loop by job name
