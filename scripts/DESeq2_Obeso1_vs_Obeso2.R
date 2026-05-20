# ============================================================
# ANÁLISIS DE EXPRESIÓN DIFERENCIAL
# Obeso1 vs Obeso2
# ============================================================

# ============================================================
# 0. Instalación de paquetes
# ============================================================

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

paquetes_cran <- c("ggplot2", "pheatmap", "ggrepel", "dplyr")

for (pkg in paquetes_cran) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
}

paquetes_bioc <- c("DESeq2")

for (pkg in paquetes_bioc) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    BiocManager::install(pkg)
  }
}

# ============================================================
# 1. Cargar librerías
# ============================================================

library(DESeq2)
library(ggplot2)
library(pheatmap)
library(ggrepel)
library(dplyr)

# ============================================================
# 2. Comprobar directorio de trabajo
# ============================================================

getwd()
list.files()

# ============================================================
# 3. Crear carpetas de resultados
# ============================================================

dir.create("results", showWarnings = FALSE)
dir.create("results/figuras_poster", showWarnings = FALSE)

# ============================================================
# 4. Cargar datos
# ============================================================

counts <- read.csv("counts_matrix.csv", row.names = 1)
samples <- read.csv("Design_Obeso1_vs_Obeso2.csv")

# ============================================================
# 5. Comprobar nombres de muestras
# ============================================================

print(colnames(counts))
print(samples$Sample)

if (!all(colnames(counts) == samples$Sample)) {
  stop("ERROR: Los nombres de las muestras no coinciden entre counts_matrix y Design.")
}

# ============================================================
# 6. Preparar diseño experimental
# ============================================================

rownames(samples) <- samples$Sample

samples$grupo <- ifelse(samples$Condition == "Sobrepeso/Obeso1",
                        "Obeso1",
                        "Obeso2")

samples$grupo <- factor(samples$grupo,
                        levels = c("Obeso2", "Obeso1"))

# ============================================================
# 7. Crear objeto DESeq2
# ============================================================

dds <- DESeqDataSetFromMatrix(
  countData = round(counts),
  colData = samples,
  design = ~ grupo
)

# ============================================================
# 8. Filtrar genes poco expresados
# ============================================================

dds <- dds[rowSums(counts(dds)) > 10, ]

# ============================================================
# 9. Ejecutar análisis DESeq2
# ============================================================

dds <- DESeq(dds)

# ============================================================
# 10. Obtener resultados Obeso1 vs Obeso2
# ============================================================

res <- results(dds,
               contrast = c("grupo", "Obeso1", "Obeso2"))

res <- res[order(res$padj), ]

write.csv(as.data.frame(res),
          "results/deseq2_Obeso1_vs_Obeso2.csv")

# ============================================================
# 11. Guardar genes significativos
# ============================================================

sig <- res[which(res$padj < 0.05), ]

sig_fc <- res[which(res$padj < 0.05 &
                      abs(res$log2FoldChange) > 1), ]

write.csv(as.data.frame(sig),
          "results/genes_significativos_padj005.csv")

write.csv(as.data.frame(sig_fc),
          "results/genes_significativos_padj005_log2FC1.csv")

# ============================================================
# 12. Transformación de varianza
# ============================================================

vsd <- varianceStabilizingTransformation(dds, blind = FALSE)

# ============================================================
# 13. Colores para las figuras
# ============================================================

colores_grupo <- c("Obeso1" = "#F8766D",
                   "Obeso2" = "#00BFC4")

# ============================================================
# 14. PCA
# ============================================================

pca_data <- plotPCA(vsd,
                    intgroup = "grupo",
                    returnData = TRUE)

percentVar <- round(100 * attr(pca_data, "percentVar"))

pca_data$Sample <- rownames(pca_data)

pca_poster <- ggplot(pca_data,
                     aes(x = PC1,
                         y = PC2,
                         color = grupo)) +
  
  geom_point(size = 6, alpha = 0.9) +
  
  scale_color_manual(values = colores_grupo) +
  
  labs(title = "PCA de expresión génica",
       subtitle = "Comparación Obeso1 vs Obeso2",
       x = paste0("PC1: ", percentVar[1], "% de varianza"),
       y = paste0("PC2: ", percentVar[2], "% de varianza"),
       color = "Grupo") +
  
  theme_minimal(base_size = 16) +
  
  theme(
    plot.title = element_text(face = "bold", size = 22),
    plot.subtitle = element_text(size = 16),
    legend.position = "right",
    panel.grid.minor = element_blank()
  )

print(pca_poster)

ggsave("results/figuras_poster/PCA_poster_Obeso1_vs_Obeso2.png",
       plot = pca_poster,
       width = 11,
       height = 7,
       dpi = 300)

# ============================================================
# 15. Volcano plot
# ============================================================

res_volcano <- as.data.frame(res)
res_volcano$Gen <- rownames(res_volcano)

res_volcano <- res_volcano %>%
  mutate(
    padj_plot = ifelse(is.na(padj), 1, padj),
    Significativo = case_when(
      padj < 0.05 & log2FoldChange > 1  ~ "Mayor expresión en Obeso1",
      padj < 0.05 & log2FoldChange < -1 ~ "Mayor expresión en Obeso2",
      TRUE ~ "No significativo"
    )
  )

genes_label <- res_volcano %>%
  filter(Significativo != "No significativo") %>%
  arrange(padj) %>%
  head(10)

volcano_poster <- ggplot(res_volcano,
                         aes(x = log2FoldChange,
                             y = -log10(padj_plot),
                             color = Significativo)) +
  geom_point(size = 3, alpha = 0.85) +
  geom_vline(xintercept = c(-1, 1),
             linetype = "dashed",
             color = "grey40") +
  geom_hline(yintercept = -log10(0.05),
             linetype = "dashed",
             color = "grey40") +
  geom_text_repel(data = genes_label,
                  aes(label = Gen),
                  size = 4,
                  max.overlaps = 20,
                  show.legend = FALSE) +
  scale_color_manual(values = c("Mayor expresión en Obeso1" = "#F8766D",
                                "Mayor expresión en Obeso2" = "#00BFC4",
                                "No significativo" = "grey70")) +
  labs(title = "Volcano plot",
       subtitle = "Genes diferencialmente expresados entre Obeso1 y Obeso2",
       x = "Log2 Fold Change",
       y = "-log10(padj)",
       color = "") +
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(face = "bold", size = 22),
    plot.subtitle = element_text(size = 15),
    legend.position = "right",
    panel.grid.minor = element_blank()
  )

print(volcano_poster)

ggsave("results/figuras_poster/Volcano_poster_Obeso1_vs_Obeso2.png",
       plot = volcano_poster,
       width = 11,
       height = 7,
       dpi = 300)

# ============================================================
# 16. Heatmap
# ============================================================

res_df_heatmap <- as.data.frame(res)
res_df_heatmap$Gen <- rownames(res_df_heatmap)

res_df_heatmap <- res_df_heatmap[!is.na(res_df_heatmap$padj), ]

topgenes <- head(res_df_heatmap$Gen[order(res_df_heatmap$padj)], 20)

mat <- assay(vsd)[topgenes, ]

mat <- mat[apply(mat, 1, function(x) all(is.finite(x))), ]
mat <- mat[apply(mat, 1, var) > 0, ]

annotation_col <- data.frame(
  grupo = samples$grupo
)

rownames(annotation_col) <- rownames(samples)

annotation_colors <- list(
  grupo = colores_grupo
)

png("results/figuras_poster/Heatmap_Obeso1_vs_Obeso2.png",
    width = 3200,
    height = 2400,
    res = 300)

pheatmap(mat,
         scale = "row",
         annotation_col = annotation_col,
         annotation_colors = annotation_colors,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         main = "Genes más diferencialmente expresados en Obeso1 vs Obeso2",
         fontsize = 12,
         fontsize_row = 12,
         fontsize_col = 12,
         border_color = "grey70")

dev.off()

# ============================================================
# 17. Tabla interpretada
# ============================================================

res_df <- as.data.frame(res)
res_df$Gen <- rownames(res_df)

res_df$Interpretacion <- ifelse(
  res_df$log2FoldChange > 0,
  "Mayor expresión en Obeso1",
  "Mayor expresión en Obeso2"
)

res_df <- res_df[, c("Gen",
                     "baseMean",
                     "log2FoldChange",
                     "pvalue",
                     "padj",
                     "Interpretacion")]

write.csv(res_df,
          "results/tabla_resultados_interpretada.csv",
          row.names = FALSE)
