

rule all:
    input:
        "cpu_short.txt",
        "cpu.txt",
        "cpu_highmem.txt",
        "cpu_preemptible.txt"

rule cooljob:
    output:
        "cpu_short.txt"
    threads: 1
    resources:
        mem_mb = 1024 * 1,
        runtime = 30

    shell: "sleep 5 && echo $SLURM_JOB_PARTITION >  {output}"

use rule cooljob as cooljob_highmem with:
    resources:
        mem_mb = 65 * 1024
    output: "cpu_highmem.txt"

use rule cooljob as cooljob_cpu with:
    resources:
        mem_mb = 5 * 1024,
        runtime = 130
    output: "cpu.txt"

use rule cooljob as cooljob_preempt with:
    resources:
        mem_mb = 1 * 1024,
        runtime = 5
    output: "cpu_preemptible.txt"
