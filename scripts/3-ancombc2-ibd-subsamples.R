#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("ANCOMBC")
#BiocManager::install("TreeSummarizedExperiment")
#install.packages("S4Vectors")

library(ANCOMBC)
library(glue)


sizes <- c(15, 25, 50, 100)
seeds <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,
                24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,
                45,46,47,48,49)


for (SIZE in sizes) {
  for (SEED in seeds) {

    
    data_file <- glue("prodata/test5/ancomb_counts_{SIZE}_{SEED}.tsv")
    meta_file <- glue("prodata/test5/ancomb_meta_{SIZE}_{SEED}.tsv")
    results_file <- glue("prodata/test5/ancomb_results_{SIZE}_{SEED}_BH.tsv")
    
    data <- read.table(data_file)
    meta_data <- read.table(meta_file)
    
    output = ancombc2(
      data = data,
      aggregate_data = data,
      meta_data = meta_data,
      fix_formula = 'Group',
      group = 'Group',
      taxa_are_rows = FALSE,
      p_adj_method = "BH",
      n_cl=8
    )
    
    
    write.csv(output$res, results_file)
  }
}

####


sizes <- c(15, 25, 50, 100)
seeds <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,
           24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,
           45,46,47,48,49)


for (SIZE in sizes) {
  for (SEED in seeds) {
    
    
    data_file <- glue("prodata/test5/ancomb_counts_{SIZE}_{SEED}.tsv")
    meta_file <- glue("prodata/test5/ancomb_meta_{SIZE}_{SEED}.tsv")
    results_file <- glue("prodata/test5/ancomb_results_{SIZE}_{SEED}_HOLM.tsv")
    
    data <- read.table(data_file)
    meta_data <- read.table(meta_file)
    
    output = ancombc2(
      data = data,
      aggregate_data = data,
      meta_data = meta_data,
      fix_formula = 'Group',
      group = 'Group',
      taxa_are_rows = FALSE,
      p_adj_method = "holm",
      n_cl=8
    )
    
    
    write.csv(output$res, results_file)
  }
}


sizes <- c(15, 25, 50, 100)
seeds <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,
           24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,
           45,46,47,48,49)


for (SIZE in sizes) {
  for (SEED in seeds) {
    
    
    data_file <- glue("prodata/test5/ancomb_counts_{SIZE}_{SEED}.tsv")
    meta_file <- glue("prodata/test5/ancomb_meta_{SIZE}_{SEED}.tsv")
    results_file <- glue("prodata/test5/ancomb_results_{SIZE}_{SEED}_NA.tsv")
    
    data <- read.table(data_file)
    meta_data <- read.table(meta_file)
    
    output = ancombc2(
      data = data,
      aggregate_data = data,
      meta_data = meta_data,
      fix_formula = 'Group',
      group = 'Group',
      taxa_are_rows = FALSE,
      p_adj_method = "none",
      n_cl=8
    )
    
    
    write.csv(output$res, results_file)
  }
}