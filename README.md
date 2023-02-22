# vdb LSF Snakemake profile

> Dev branch

The dev branch has a profile with fewer jobs/cores, no restart times, and includes one's home directory in the singularity bind arguments.  Why? Fewer core means higher priority and faster development.  Fewer jobs means less chance of accidentlly flooding the cluster. Removing restart times allows us to see errors sooner when developing, as we don't want to wait for the same task to fail multiple times when we are introducing changes that very likely caused a true error.  Adding home to the bind path allows easier usage of test data in the pipeline repos without having to overrride the profile.