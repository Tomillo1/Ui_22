library(ggplot2)
library(pheatmap)

normCount <- read.csv('normalizado_aba_cold.csv', row.names = 1)

deSeqRes <- read.csv('results_aba_cold.csv', row.names =1)

deSeqResUp <-subset(deSeqRes, log2FoldChange >= 1)

deSeqResDown <-subset(deSeqRes, log2FoldChange <=-1)

deSeqREsCon<-rbind(deSeqResDown, deSeqResUp)

deSeqResSigni <- subset(deSeqREsCon, padj <= 0.05)

allsig <- merge(normCount, deSeqResSigni, by = 0)

write.csv(allsig, 'allsig_aba_cold.csv')

signifiCount <- allsig[,2:5]

row.names(signifiCount) <-allsig$Row.names

pheatmap(log2(signifiCount+1), scale ='row', show_rownames = F, color=colorRampPalette(c("navy","white","red"))(50))

xdeSeqResDown_ <-subset(deSeqResSigni, log2FoldChange <=-1)
deSeqResUp_ <-subset(deSeqResSigni, log2FoldChange >= 1)

deSeqResDown_merge<-merge(normCount, deSeqResDown_, by = 0)

write.csv(deSeqResDown_merge,'deseq_aba_cold_down_sig.csv')

######## PARA GENES SOBREEXPRESADOS
#Se unen por filas hacia abajo
deSeqResUp_merge <-merge(normCount, deSeqResUp_, by = 0)
#La dataframe de genes SOBREEXPRESADOS es guardada como csv
write.csv(deSeqResUp_merge, 'deseq_aba_cold_up_sig.csv')

