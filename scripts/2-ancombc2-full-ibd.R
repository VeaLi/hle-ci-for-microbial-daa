#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("ANCOMBC")
#BiocManager::install("TreeSummarizedExperiment")
#install.packages("S4Vectors")

library(ANCOMBC)
library(glue)


data_file <- glue("prodata/test3/ancomb_counts.tsv")
meta_file <- glue("prodata/test3/ancomb_meta.tsv")
results_file <- glue("prodata/test3/ancomb_results_bh.csv")

data <- read.table(data_file)
meta_data <- read.table(meta_file)

output = ancombc2(
  data = data,
  aggregate_data = data,
  meta_data = meta_data,
  fix_formula = 'Group',
  group = 'Group',
  taxa_are_rows = FALSE,
  p_adj_method = "BH"
)


write.csv(output$res, results_file)

##################################################

data_file <- glue("prodata/test3/ancomb_counts.tsv")
meta_file <- glue("prodata/test3/ancomb_meta.tsv")
results_file <- glue("prodata/test3/ancomb_results_holm.csv")

data <- read.table(data_file)
meta_data <- read.table(meta_file)

output = ancombc2(
  data = data,
  aggregate_data = data,
  meta_data = meta_data,
  fix_formula = 'Group',
  group = 'Group',
  taxa_are_rows = FALSE,
  p_adj_method = "holm"
)


write.csv(output$res, results_file)


##################################################

data_file <- glue("prodata/test3/ancomb_counts.tsv")
meta_file <- glue("prodata/test3/ancomb_meta.tsv")
results_file <- glue("prodata/test3/ancomb_results_na.csv")

data <- read.table(data_file)
meta_data <- read.table(meta_file)

output = ancombc2(
  data = data,
  aggregate_data = data,
  meta_data = meta_data,
  fix_formula = 'Group',
  group = 'Group',
  taxa_are_rows = FALSE,
  p_adj_method = "none"
)


write.csv(output$res, results_file)