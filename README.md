# Sherlock notes

## Lab-specific notes

### Overview of resources

1. SCG3 -> SCG4. Run by Genetics department
	- ssh username@scg.login.stanford.edu
	- get access by emailing support with PI cc'd
	- Storage costs $$$ but paid ahead of time
	- Compute also costs money but for every job run
	- Has storage, backed up and encrypted. Can also access Oak from SCG
	- Approved for data access for Protected data but not PHI/PII data (e.g. indivual level info like zip codes and DOB). 
	- Nasa proposes turning machine in lab into PHI data - safe one. Once fully anonymized data can go into SCG
2. Oak
	- We have access to 330 TB of storage on Oak
	- Accessible from SCG and Sherlock
	- Supposedly can have protected data (not PHI) as with SCG4
3. Sherlock
	- 60 TB of scratch space. Going away in December. Need to move and backup everything on scratch
	- No PHI or protected information
	- 1 TB /home/groups/pritch || /share/PI/pritch. Where we store shared stuff like software. Nothing big. /share is backed up, but there is not much space so only config files and scripts
	- 56 nodes with 20-24 cpus
4. Gdrive for backup
	- Unlimited storage
	- Not PHI safe
	- To get started: on sherlock: module load system gdrive; gdrive help upload
5. BOX for backup
	- Unlimited storage
	- PHI safe

### Migration to Oak

#### Proposed file structure

`scratch-sherlock` and `scratch-scg` are data that will be moved back to their respective clusters
`users` is just for data that will be kept on oak

```
/oak/stanford/groups/pritch/
	scratch-sherlock/
		user1/
		user2/
		user3/
		usern/
	scratch-scg/
		user1/
		user2/
		usern/
	users/
		user1/
		user2/
		usern/
	shared/
		scripts/
		data/
		sumstats/
	projects/
		rmpr/
```


1. Harold will make a schedule. Each person will have a set week to move their data
2. 350 TB on oak is shared among all. Have to email to get user  quotas

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

