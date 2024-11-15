rule download_non_assembly:
    output:
        accession_gbk = temp(directory("input_files/{non_assemblies}")),
    conda:
        "../envs/ncbi-datasets.yaml"
    log:
        "logs/download_assembly/{non_assemblies}_download_assembly.log"
    params:
        accessions = lambda wildcards: df.loc[wildcards.non_assemblies, "accession_numbers_all"].split(",")
    shell:
        """
        mkdir -p {output.accession_gbk}
        for accession in {params.accessions}; do
            ncbi-acc-download $accession -o {output.accession_gbk}/$accession.gb &>> {log}
        done
        """

rule concatenate_non_assembly:
    input:
        accession_gbk = "input_files/{non_assemblies}",
    output:
        genbank = "input_files/{non_assemblies}.gbk"
    log:
        "logs/download_assembly/{non_assemblies}_concatenate_non_assembly.log"
    conda:
        "../envs/ncbi-datasets.yaml"
    params:
        accessions = lambda wildcards: df.loc[wildcards.non_assemblies, "accession_numbers_all"].split(",")
    shell:
        """
        # Concatenate all downloaded GenBank files into one file
        cat $(for accession in {params.accessions}; do echo input_files/{wildcards.non_assemblies}/$accession.gb; done) > {output.genbank}
        """
