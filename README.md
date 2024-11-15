# G1034_NCBI_dataset
A clean up version of the G1034 Actinomycetota genomes from NCBI

## Description
This repository contains a workflow to fetch the 1034 genbank files of the NBC Collection from NCBI.

List of samples are taken from [the supplementary materials of the publication](https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/nar/52/13/10.1093_nar_gkae523/1/gkae523_supplemental_files.zip?Expires=1734483543&Signature=RtjJA1uIADWqeAlk~IBPjcLq5lx0I2CnOlh0yV~o81zmfl6ma80G9F9BdvU0zo-Ou37L9rgn8fKv3lOmfoJFldOVLD8rRbM-Ks5ZfzTy~2yhhGg-LUuMO2jC3dTIK~OIWYNuDnbjF2IfhKp2NPL5Vyg3L~Q4~OdCEThI3Kn8rsRdazwirYkEdNbKdaHIuyZgepzAn0py4osZuYhhkVtldsMndlat3APH8CvgR-mUMrNZF7xSfkeIr2ycc4jd2cS82fnevfr0IIpcW~W35weXUzzpi7nioCQOArsT4hJvcWVqi0XPP81aGw9a1l3AfA-c~yMSNFU-yllYM9eW8taUJw__&Key-Pair-Id=APKAIE5G5CRDK6RD3PGA) and matched with the BioProject.

## Usage
1. Install the conda environment
```bash
mamba env create -f env.yaml
```
2. Run the workflow
Run the command as it is or modify the snakemake parameters to your liking
```bash
(cd config/G1034_20241115/ && snakemake --use-conda -c 8 -n)
```

## Output
The downloaded genbanks will be located in `config/G1034_20241115/input_files`
