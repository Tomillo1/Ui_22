# Cargar librerias
library(DESeq2)
library(tidyverse)
library(airway)

# Paso 1: preparación de los datos de recuento 

counts_data <- read.csv('rc_control_aba_cold.csv', row.names=1)
head(counts_data)

# leer en la información de la muestra
col_Data <- read.csv('sample_info.csv',row.names=1)


# asegurándose de que los nombres de las filas en colData coinciden con los nombres de las columnas en counts_data
all(colnames(counts_data) %in% rownames(colData))



# Paso 2: construir un objeto DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData = counts_data,
                              colData = col_Data,
                              design = ~ group)

dds

# pre-filtrado: eliminación de filas con bajo número de genes
# manteniendo las filas que tienen al menos 10 lecturas en total
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]

dds

# Establecer el estimado
ddsN<- estimateSizeFactors(dds)
ddsN<- estimateDispersions(ddsN)

ddsDE<- DESeq(ddsN)
Ndds<- counts(ddsDE, normalized=T)

write.csv(Ndds, "normalizado_control_aba_cold.csv")
res <- results(ddsDE, alpha = 0.05)

write.csv(res, "results_control_aba_cold.csv")

##############Heatmap###############################

library(ggplot2)
library(pheatmap)

  normCount <- read.csv('normalizado_control_aba_cold.csv', row.names = 1)
  normCount

deSeqRes <- read.csv('results_control_aba_cold.csv', row.names =1)

deSeqResUp <-subset(deSeqRes, log2FoldChange >= 1)

deSeqResDown <-subset(deSeqRes, log2FoldChange <=-1)

deSeqREsCon<-rbind(deSeqResDown, deSeqResUp)

deSeqResSigni <- subset(deSeqREsCon, padj <= 0.05)

allsig <- merge(normCount, deSeqResSigni, by = 0)

write.csv(allsig, 'allsig_control_aba_cold.csv')

signifiCount <- allsig[,2:5]

row.names(signifiCount) <-allsig$Row.names

pheatmap(log2(signifiCount+1), scale ='row', show_rownames = F)

deSeqResDown_ <-subset(deSeqResSigni, log2FoldChange <=-1)
deSeqResUp_ <-subset(deSeqResSigni, log2FoldChange >= 1)

deSeqResDown_merge<-merge(normCount, deSeqResDown_, by = 0)

write.csv(deSeqResDown_merge,'deseq_control_aba_cold_down_sig.csv')

######## PARA GENES SOBREEXPRESADOS
#Se unen por filas hacia abajo
deSeqResUp_merge <-merge(normCount, deSeqResUp_, by = 0)
#La dataframe de genes SOBREEXPRESADOS es guardada como csv
write.csv(deSeqResUp_merge, 'deseq_control_aba_cold_up_sig.csv')


