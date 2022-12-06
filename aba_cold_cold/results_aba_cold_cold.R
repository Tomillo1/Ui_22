library(DESeq2)
library(tidyverse)
library(airway)

counts_data <- read.csv('aba_cold_cold.csv', row.names=1)

col_Data <- read.csv('sample_info_ACC.csv',row.names=1)

all(colnames(counts_data) %in% rownames(col_Data))

rounded_count_data = round(counts_data)

write

dds <- DESeqDataSetFromMatrix(countData = rounded_count_data,
                              colData = col_Data,
                              design = ~ group)
dds

keep <- rowSums(counts(dds)) >= 10

dds <- dds[keep,]

dds

ddsN<- estimateSizeFactors(dds)
ddsN<- estimateDispersions(ddsN)

ddsN

ddsDE<- DESeq(ddsN)
Ndds<- counts(ddsDE, normalized=T)

write.csv(Ndds, "normalizado_aba_cold_cold.csv")

res <- results(ddsDE, alpha = 0.05)
res
write.csv(res, "results_aba_cold_cold.csv")
