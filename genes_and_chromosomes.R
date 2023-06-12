library(data.table)
library(biomaRt)
library(ggplot2)

setwd("/home/echarvel/Desktop/CSE283_class_proj/breast_cancer_recurrence_classifier_Project")

# Preprocessing deseq data
table = fread("./DEgenes_recurrent_table.csv")
new_table = subset(table, log2FoldChange >= 3 | log2FoldChange <= -3)   
genes = new_table[,gene]

# Prepping biomaRt Database
mart <- useMart(biomart = "ensembl", dataset = "hsapiens_gene_ensembl")
results <- getBM(attributes = c("external_gene_name", "chromosome_name", "gene_biotype","phenotype_description", "description","ensembl_gene_id", "ensembl_transcript_id", "ensembl_peptide_id"),
                 filters = "ensembl_gene_id", values = genes,
                 mart = mart)

# z = unique(results[,"external_gene_name"])
# x = listAttributes(mart=mart)

# top genes
gene_names = data.table(table(results["external_gene_name"]))
top_12 = names(sort(table(results["external_gene_name"]), decreasing=T))[1:20]
final_gene_names = gene_names[gene_names[,V1 %in% top_12]]
final_gene_names_sorted = final_gene_names[order(final_gene_names$N)]
final_gene_names_sorted = final_gene_names_sorted[!final_gene_names_sorted$V1 == ""]

ggplot(data = final_gene_names_sorted, aes(x=reorder(V1, -N), y = N)) + geom_bar(stat = "identity", fill = "blue")


# top chromosomes 
gene_names = data.table(table(results["chromosome_name"]))
chrom_sorted = data.frame(sort(table(results["chromosome_name"]), decreasing=T))

ggplot(data = chrom_sorted, aes(x=Var1, y = Freq)) + geom_bar(stat = "identity", fill  = "forestgreen")