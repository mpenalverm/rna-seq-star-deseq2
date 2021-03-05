rule align:
    input:
        fq1 = get_fq,
    output:
        # see STAR manual for additional output files
        "star/{sample}-{unit}/Aligned.out.bam",
        "star/{sample}-{unit}/ReadsPerGene.out.tab",
    log:
        "logs/star/{sample}-{unit}.log",
    params:
        # path to STAR reference genome index
        index=config["ref"]["index"],
        # optional parameters
        extra="--quantMode GeneCounts --sjdbGTFfile {} {}".format(
            config["ref"]["annotation"], config["params"]["star"]
        ),
    threads: 6
    wrapper:
        "0.72.0/bio/star/align"
