# G1034_NCBI_dataset
A clean up version of the G1034 Actinomycetota genomes from NCBI

## Description
This repository contains a workflow to fetch the 1034 genbank files of the NBC Collection from NCBI.

List of samples are taken from [the supplementary materials of the publication](https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/nar/52/13/10.1093_nar_gkae523/1/gkae523_supplemental_files.zip?Expires=1734483543&Signature=RtjJA1uIADWqeAlk~IBPjcLq5lx0I2CnOlh0yV~o81zmfl6ma80G9F9BdvU0zo-Ou37L9rgn8fKv3lOmfoJFldOVLD8rRbM-Ks5ZfzTy~2yhhGg-LUuMO2jC3dTIK~OIWYNuDnbjF2IfhKp2NPL5Vyg3L~Q4~OdCEThI3Kn8rsRdazwirYkEdNbKdaHIuyZgepzAn0py4osZuYhhkVtldsMndlat3APH8CvgR-mUMrNZF7xSfkeIr2ycc4jd2cS82fnevfr0IIpcW~W35weXUzzpi7nioCQOArsT4hJvcWVqi0XPP81aGw9a1l3AfA-c~yMSNFU-yllYM9eW8taUJw__&Key-Pair-Id=APKAIE5G5CRDK6RD3PGA) and matched with the BioProject.

`[TO DO]` The folder structure is designed to be compatible with BGCFlow.

## Pre-requisite
1. You need mamba installed. We recommend installing [miniforge](https://github.com/conda-forge/miniforge).
2. Install BGCFlow

    Skip this if you already have BGCFlow installed
    ```bash
    # create and activate a new conda environment
    mamba create -n bgcflow -c conda-forge python=3.11 pip openjdk -y # also install java for metabase
    conda activate bgcflow

    # install `BGCFlow` wrapper
    pip install bgcflow_wrapper

    # make sure to use bgcflow_wrapper version >= 0.2.7
    bgcflow --version

    # Set conda channel priorities to flexible
    conda config --set channel_priority disabled
    conda config --describe channel_priority

    # Deploy and test run BGCFlow
    bgcflow clone bgcflow # clone `BGCFlow` a directory named bgcflow
    (cd bgcflow && bgcflow init) # initiate `BGCFlow` config and examples from template
    (cd bgcflow && bgcflow run -n) # do a dry run, remove the flag "-n" to run the example dataset
    ```

## Usage

1. Clone the repo
    ```bash
    git clone git@github.com:NBChub/G1034_NCBI_dataset.git
    cd G1034_NCBI_dataset
    ```

2. Install the conda environment

    ```bash
    mamba env create -f env.yaml
    ```

3. Run the workflow to fetch the genbanks from NCBI

    Run the command as it is or modify the snakemake parameters to your liking

    ```bash
    conda activate g1034
    (cd config/G1034_20241115/ && snakemake --use-conda -c 8 -n) # remove the -n to execute
    conda deactivate
    ```

    _**PS:** Depending on the network traffic, some downloads might fail. Re-run the command again to retry downloading_.

4. Remove manually curated problematic genes using jupyter notebook:
    ```bash
    conda activate g1034
    (cd config/G1034_20241115/notebooks && jupyter notebook 01_manual_curation.ipynb)
    conda deactivate
    ```

5. Create a symlink to existing BGCFlow clone.

    ```bash
    BGCFLOW_PATH="../bgcflow" # CHANGE THIS ACCORDINGLY
    ln -s $BGCFLOW_PATH/.snakemake/ .snakemake
    ln -s $BGCFLOW_PATH/workflow/ workflow
    ln -s $BGCFLOW_PATH/resources/ resources
    ```

## Output
The downloaded genbanks will be located in `config/G1034_20241115/input_files`

## Notes
The notebooks to prepare the list of downloads is available at `config/G1034_20241115/notebooks/00_clean_up.ipynb`
