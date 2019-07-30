# Sherlock notes

## Configuration notes

#### Multi-threaded jobs

For conventional software with multi-threading optional, use `--cpus-per-task` to specify number of threads/cpus and `--nodes` to specify number of nodes to use.
If only `--cpus-per-task` is specified, the requested number of cpus could be split across several nodes. Information can't be shared across nodes, only within, which is what most multi-threaded jobs assume.
So request the necessary number of cpus with `--cpus-per-task` all on one node (`--nodes 1`)

#### Partitions

Access to pritch,hns,normal,owners.
Jobs on owners use unused nodes from other labs. Can get kicked off. In practice, hardly ever get kicked off. Have successfully run >15 20+ hour jobs with up to 8 cpus per job on owners.
hns and normal are difficult to get on...long wait
Apparently the order in which the partitions are listed matters. Always do pritch first.

## One liners and shortcuts

#### Submit a simple job that could be run on the commandline

Very useful in a loop -- something too simple for snakemake

`sbatch --partition "pritch,hns,normal" --nodes=1 --cpus-per-task=1 --mem="5G" --time="10:00" --job-name="test" --wrap="echo testrun"`

#### Update PENDING jobs already submitted, but not yet scheduled

Change the partitions, time limit, and other resource configurations
```
for i in $(squeue -u antmarge -h -t PD -o %i); do
	scontrol update jobid=$i partition=pritch,owners 
done
````

#### Submit an sbatch script

See example.sbatch

`sbatch example.sbatch`

