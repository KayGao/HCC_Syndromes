# Disease Separation and Proximity Analysis

## Overview
This repository contains code for analyzing the separation of disease/syndromes and their proximity to specific drug/formula modules within biological networks.

### Disease Separation
- **Code**: `Separation.ipynb`
- **Description**: Calculates the network separation `$S_{AB}` between syndromes and the Hepatocellular Carcinoma (HCC) module.

### Input Data for Disease Separation
- **Protein-Protein Interaction (PPI) Data**: `PPI_Dataset.csv`
- **HCC Genes Data**: `HCC_Dataset.csv`
- **Syndrome-Associated Genes Data**: `TCM_Syndrome_5.tsv`

## Proximity Analysis
- **Code**: `Proximity.py`
- **Description**: Computes the topological distance between drugs and the disease module to assess their proximity.

### Inputs and Parameters for Proximity Analysis
- **Disease Gene List**: A list of genes associated with the disease in Entrez IDs.
- **Drug Target File**: A tab-delimited file with the drug name first, followed by the Entrez IDs of its targets.
- **Interactome File**: A tab-delimited file containing node pairs in their Entrez IDs.
- **Number of Simulations**: `-nsims` parameter specifies the number of randomizations for the proximity algorithm.

### Running the Proximity Code

python Proximity.py -i_disease data/HCC_Dataset.csv -i_drug data/drug_cancer_approved.txt -i_interactome data/PPI_Dataset.csv -nsims 100
Note: The initial lines of the sample output are from previous code segments and should be disregarded.

Output
Output Files: Located in the output/proximity directory, which is created automatically if it does not exist. Each .txt file corresponds to a drug-disease pair, named as <Drug_ID>_<Disease_genes_input_filename>.txt.
File Format: Each .txt file contains six tab-delimited entries:
Drug name
Disease file name
Proximity distance, d
Proximity Z-score, z
Mean proximity distance d from random simulations
Standard deviation of proximity distance d from random simulations

Notes
The proximity computation for many drug-disease pairs can be resource-intensive; parallel computing is advised.
Parallel computing is implemented in the code but not utilized in the provided demo. For details, refer to Proximity.py.
The proximity algorithm's randomization is stochastic, meaning that re-running the code will not yield an identical Z-Score. For more information, see the referenced Guney (2016) paper.


Citations
Guney, E., Menche, J., Vidal, M. et al. "Network-based in silico drug efficacy screening." Nat Commun 7, 10331 (2016). DOI: 10.1038/ncomms10331
Menche J, Sharma A, Kitsak M, et al. "Disease networks. Uncovering disease-disease relationships through the incomplete interactome." Science 347(6224):1257601 (2015). DOI: 10.1126/science.1257601


### Combining Output Files
After running the proximity code, all .txt files can be combined into a single file using the following command:

cat *.txt >> output.txt