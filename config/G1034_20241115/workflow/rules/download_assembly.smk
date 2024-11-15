rule download_assembly:
    output:
        zip = temp("input_files/{assemblies}.zip"),
        directory = temp(directory("input_files/{assemblies}"))
    conda:
        "../envs/ncbi-datasets.yaml"
    log:
        "logs/download_assembly/{assemblies}_download_assembly.log"
    params:
        assembly_acc = lambda wildcards: df.loc[wildcards.assemblies, "Assembly"]
    shell:
        """
        if [ -e {output.zip} ]; then rm -rf {output.zip}; fi
        if [ -e {output.directory} ]; then rm -rf {output.directory}; fi
        datasets download genome accession {params.assembly_acc} --include gbff,seq-report --dehydrated --filename {output.zip} 2>> {log}
        unzip {output.zip} -d {output.directory} &>> {log}
        datasets rehydrate --directory {output.directory} &>> {log}
        """

rule rename_assembly:
    input:
        directory = "input_files/{assemblies}"
    output:
        gbk = "input_files/{assemblies}.gbk",
    conda:
        "../envs/ncbi-datasets.yaml"
    log:
        "logs/download_assembly/{assemblies}_rename_assembly.log"
    params:
        assembly_acc = lambda wildcards: df.loc[wildcards.assemblies, "Assembly"]
    shell:
        """
        mv {input.directory}/ncbi_dataset/data/{params.assembly_acc}/genomic.gbff {output.gbk} 2>> {log}
        """
