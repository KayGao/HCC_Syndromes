
# +++++++++++++++++++++++++++++++++ Enrichment Analysis of Multiple Gene Sets +++++++++++++++++++++++++++++++++

library(clusterProfiler)
library(enrichplot)
library(forcats)
library(ggplot2)
library(DOSE)


df1 = read.table("C:\\Users\\KEGG\\compare_3full.csv", 
                 sep = ",", header=T)
head(df1)

# +++++++++++++++++++++++++++++++enrichKEGG+++++++++++++++++++++++++++++++

xx <- compareCluster(Gene~SetType+DiseaseType, data=df1, fun="enrichKEGG",
                     organism="hsa", pvalueCutoff=0.05,
                     pAdjustMethod = "BH",
                     qvalueCutoff = 0.2
                     )

result23 = as.data.frame(xx)

convert_ratio_to_decimal <- function(ratio_str) {
  # Use strsplit to split the string, and then parse it into numerical values
  parts <- as.numeric(unlist(strsplit(ratio_str, "/")))
  # Calculate the ratio
  if (length(parts) == 2) {
    return(parts[1] / parts[2])
  } else {
    return(NA)
  }
}

# Apply a function to the 'GeneRatio' column using sapply
result23$GeneRatio <- sapply(result23$GeneRatio, convert_ratio_to_decimal)

heat_enrichment = reshape2::dcast(result23, Description~Cluster, value.var = 'GeneRatio')

