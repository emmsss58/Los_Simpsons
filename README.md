# Preprocesamiento y control de calidad
El preprocesamiento de los FASTQs se hizo con fastp. Se generaron reportes de calidad en formato HTML y JSON.
Se hizo un control de calidad de los archivos RNA-seq FASTQ utilizando FastQC. Los resultados se resumieron con MultiQC para comparar más facilmente. FastQC se ejecutó por separado para cada personaje. El output son reportes HTML y archivos .zip por muestra

fastqc.filtered/ → reportes individuales de FastQC para cada personaje

multiqc/ → reporte resumen generado por MultiQC

# Gráficos para la visualización de los resultados

## PCA

El análisis de componentes principales (PCA) mostró una separación clara entre las muestras pertenecientes a Obeso1 y Obeso2.
El componente principal 1 (PC1) explica el 89% de la variabilidad total, indicando que la principal fuente de variación en los datos corresponde a 
diferencias biológicas entre ambos perfiles obesos. Las muestras Abraham Simpson y Homer Simpson (Obeso1) se agrupan conjuntamente en un extremo del gráfico, 
mientras que Marge Simpson, Patty Bouvier y Selma Bouvier (Obeso2) se localizan claramente separadas en el lado opuesto.
El componente principal 2 (PC2) explica únicamente el 7% de la variabilidad, reflejando pequeñas diferencias internas entre muestras de un mismo grupo.

Estos resultados indican que las muestras presentan perfiles transcriptómicos diferenciados y que los genes analizados permiten 
discriminar correctamente ambos grupos obesos.

## Volcano plot

El volcano plot permite visualizar simultáneamente la magnitud del cambio de expresión (log2FoldChange) y la significación estadística corregida (padj) de cada gen analizado.
Los genes situados a la derecha del gráfico presentan mayor expresión en Obeso1, mientras que los genes localizados a la izquierda muestran mayor expresión en Obeso2. 
Los genes más alejados horizontalmente representan cambios de expresión más marcados, mientras que los genes situados en posiciones más altas 
del gráfico presentan mayor significación estadística.

En general, el volcano plot muestra un patrón de expresión diferencial moderado, coherente con el reducido número de muestras y la baja variabilidad 
global observada en el conjunto de datos. Aun así, se identificaron varios genes con potencial relevancia biológica asociados a regulación energética y obesidad.

## Heatmap

El heatmap de los genes más diferencialmente expresados muestra patrones de expresión claramente diferenciados entre Obeso1 y Obeso2. 
Las muestras pertenecientes al mismo grupo presentan perfiles de expresión similares entre sí, lo que refuerza la coherencia biológica de los resultados.
Los colores cálidos (rojo/naranja) indican mayor expresión relativa, mientras que los colores fríos (azul) representan menor expresión relativa.
Se observa que genes como LEPR, SH2B1, POMC, PCSK1 y TMEM18 presentan una mayor expresión relativa en Obeso1. Por el contrario, genes como MC4R, SIM1, FTO, KSR2 y LEP muestran una mayor expresión en Obeso2.

El agrupamiento jerárquico separa correctamente ambos grupos, indicando que los perfiles de expresión génica son suficientemente distintos como para discriminar ambos perfiles obesos mediante clustering no supervisado.

# Interpretación biológica de los resultados 

## Obesidad

Según la Organización Mundial de la Salud (OMS), la obesidad es una enfermedad crónica, caracterizada por un aumento de grasa corporal y asociada a un mayor riesgo para la salud.

La clasificación actual de Obesidad propuesta por la OMS está basada en el Índice de Masa Corporal (IMC), el cual corresponde a la relación entre el peso expresado en kilos y el cuadrado de la altura, expresada en metros. De esta manera, las personas cuyo cálculo de IMC sea igual o superior a 30kg/m2 se consideran obesas.

Los análisis realizados indican que existen diferencias moleculares entre los grupos comparados, especialmente en genes relacionados con la regulación del apetito, la señalización lipídica y el balance energético. Esto sugiere que los grupos podrían presenar diferentes subtipos de obesidad. 

El grupo Obeso1 presenta una mayor expresión de los genes LEPR, SH2B1, POMC, PCSK1 y TMEM18, los cuales están relacionados con la vía leptina-melanocortina, uno de los sistemas más importantes de regulación del apetito y gasto energético. Sin embargo, los pacientes del grupo Obeso2 presentan una mayor expresión de los genes MC4R, SIM1, FTO, KSR2 y LEP.

## Grupo Obeso1

### LEPR

Este gen codifica para el receptor de la leptina (hormona sintetizada por los adipocitos que regula eel balance etre la ingesta y el gasto de energía, mediante la supresión del apetito induciendo saciedad e incrementando el gasto energético). Según el análisis de los datos, los pacientes con Obesidad tipo 1 muestran una mayor expresión de este, por lo tanto una mayor cantidad de receptor de leptina. 

Esto puede interpretarse como un intento por compensar la resistencia a la leptina, donde a pesar de existir la hormona y su receptor, la señal de saciedad no se procesa y por lo tanto se contribuye al desarrollo de obesidad. 











