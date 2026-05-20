# Una vez se ha realizado el mapeo, los archivos quant.sf generados por salmon, 
# se pasan a R mediante tximportque combina todas las muestras y resume los 
# transcritos a nivel de gen, para convertilos en una matriz de expresión
# génica para poder realizar los pasos posteriores.

BiocManager::install("tximport")
library(tximport) # importa los resultados de Salmon
library(readr) # lee los archivos

# A continuación, se lee el CSV con la información experimenta. Aquí es
# importante la columna sample, que se usará para detectar las carpertas de 
# salmon.

samples <- read.csv("reference/Design_Obeso1_vs_Obeso2.csv")

# Lo siguiente será generar rutas a cada archivo, que se puede hacer automáticamente
# mediante la siguiente ruta:

files <- file.path("salmon_quant", samples$Sample, "quant.sf")

# Se nombrarán los archivos para asociarlos cada uno a su muestra para facilitar
# su manejo posterior

names(files) <- samples$Sample

# Para leer la relación de cada transcrito con su gen se debe utilizar el tsv 
# Transcrito_a_gen.tsv, ya que sin eso tximport no puede agrupar trasncritos a 
# genes

tx2gene <-read.delim("reference/Transcrito_a_Gen.tsv", header = FALSE)

# Una vez hecho esto, se comienza a trabajar con tximport, que abrirá todos los
# quant.sf para juntar las muestras, sumar los transcritos por gen y crear la 
# matriz de datos. 

txi <- tximport(files,
                type = "salmon",
                tx2gene = tx2gene)

# Con esto se consigue que el objeto txi contenga: counts, TPM y longitudes
# efectivas. El resultado interno será una matriz de counts estimados (txi$counts)
# mientas que en txi¢abundance se contendrá la matriz TPM normalizada.

# Para guardar los resultados en un csv se realizará lo siguiente:

write.csv(txi$counts,
          file = "results/counts_matrix.csv")

write.csv(txi$abundance,
          file = "results/tpm_matrix.csv")

# Esto generará los csv en la carpeta results. Lo próximo será guardar todo el 
# objeto txi de R en un archivo .rds para que sea más fácil recuperarlo todo
# sin volver a ejecutar tximport.

saveRDS(txi,
        file = "results/txi_salmon_gene_level.rds")
