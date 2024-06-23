## Disease Separation

-   Code: `01_Disease_Separation.ipynb`
-   Description: Calculation of the network separation $S_{AB}$ between diseases and the COVID-19 module (data presented in Figures S1 and S2).

### Input

-   Protein-Protein Interaction (PPI): `DatasetS2.csv`
-   SARS-CoV-2 Targets: `DatasetS1.csv`
-   Disease-Associated Genes: `Guney2016_GenesDisease.tsv`


### Proximity

-   Code: `04_DR_Proximity.py`

-   Description: Calculates the Drug Repurpusing Candidates for pipelines P1-P3.

#### Input files and parameter

1.  disease gene list: a list of disease genes in entrez ID
2.  drug target file: a tab-delimited file with first entry being the drug, and the following entries being entrez IDs of targets
3.  interactome file: tab-delimited node pairs in their entrez ID. The 3rd column in the sample interactome is not being used
4.  -nsims specifies the number of randomizations in the proximity algorithm

#### Running the code

`> python 04_DR_Proximity.py -i_disease data/DatasetS1.csv -i_drug data/drug_targets_test.txt -i_interactome data/DatasetS2.csv -nsims 1000`

-   Sample Output display: (Note the beginning (first four lines) of this output are imported from previous code and are not relevant, please pay no attention to them).


#### Output files

The output of the code are .txt files in the `output/proximity` folder. If the \``output/proximity` folder is not present, it will automatically be created. Each `.txt` file is named with drug-disease input pair, e.g. `<Drug_ID>_<Disease_genes_input_filename>.txt` in the toy example. The output file consists of six tab-delimited entries. The entries are (respectively):

(1) drug,
(2) disease file,
(3) proximity distance, d,
(4) proximity Z-score, z,
(5) mean of proximity distance d in random simulation,
(6) standard deviation of proximity distance d in random simulation

#### Notes [Fix names, add P3]

1. 

2.  computations with many drug-disease pairs are heavy. Parallel computing is recommended. This code has implementation of parallel computing, but it is not used in the demo above. Please check out the source code in `04_DR_Proximity.py`.

3.  The randomization of proximity algorithm is, by its mathematical nature, stochastic, i.e. re-running it does NOT generate exactly the same result for its Z-Score. Details can be found in ref 1. Guney(2016) paper.

The code here uses the code cite in：

1.  Guney, E., Menche, J., Vidal, M. et al. Network-based in silico drug efficacy screening. Nat Commun 7, 10331 (2016). <https://doi.org/10.1038/ncomms10331>

2.  Menche J, Sharma A, Kitsak M, et al. Disease networks. Uncovering disease-disease relationships through the incomplete interactome. Science. 2015;347(6224):1257601. <doi:10.1126/science.1257601>


After the proximity code is run, you have to combine all `txt` files, they can be easily combined by `cat *.txt >> output.txt `.
