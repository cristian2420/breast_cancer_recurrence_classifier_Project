library(org.Hs.eg.db)
library(EnsDb.Hsapiens.v99)
library(data.table)
library(ggplot2)
library(DESeq2)

counts_normal <- data.table::fread("data/inputfiles/pnas_normal_readcounts.txt")
counts_cancer <- data.table::fread("data/inputfiles/pnas_readcounts_96_nodup.txt")
metadata <- data.table::fread("data/inputfiles/GSE131512_metaData.csv")
names(metadata) <- gsub(" ", ".", names(metadata))

all_donors <- merge(counts_normal, counts_cancer, by = "V1")
data.table::setnames(all_donors, "V1", "gene")
names(all_donors)[34:129] <- paste0("C", 1:96)
pc <- prcomp(all_donors[, 2:ncol(all_donors)])

ggplot(data.frame(pc$rotation), aes(PC1, PC2)) +
            geom_point(color = c(rep("red", 32), rep("blue", 96)))

##### differential express genes cancer vs normal
metadata$status <- c(rep("cancer", 96), rep("healthy", 32))
# all_donors <- data.frame(all_donors)
# rownames(all_donors) <- all_donors$gene
# all_donors$gene <- NULL
dds <- DESeqDataSetFromMatrix(countData = as.data.frame(all_donors),
                              colData = as.data.frame(metadata),
                              design = ~ status + Age + Gender, tidy = TRUE)

dds <- DESeq(dds)
res <- results(dds)
res$gene <- rownames(res)
res <- data.table::as.data.table(res)

write.csv(res_r, "DEgenes_table.csv")
writeLines(res[abs(log2FoldChange) > 2]$gene, "DEgenes.txt")
##### differential express genes recurrent cancer vs non recurrent cancer
recurrent_cancer <- all_donors[, c(1, 34:ncol(all_donors)), with = F]
recurrent_cancer <- as.data.frame(recurrent_cancer)
### all donors female, maybe remove sex driven genes
dds_r <- DESeqDataSetFromMatrix(countData = recurrent_cancer,
colData = metadata[recurStatus %in% c("R", "N")],
design = ~ recurStatus + Age + cancertype + cancerstage_cat + chemo,
tidy = TRUE)

dds_r <- DESeq(dds_r)
res_r <- results(dds_r)
res_r$gene <- rownames(res_r)
res_r <- data.table::as.data.table(res_r)
write.csv(res_r, "DEgenes_recurrent_table.csv")
writeLines(res_r[abs(log2FoldChange) > 3]$gene, "DEgenes_recurrent.txt")
#####
# add gene annotation
edb <- EnsDb.Hsapiens.v86
geneannot <- genes(edb, columns=c("gene_name", "gene_biotype", "symbol"))
geneannot <- as.data.frame(txtypes)

