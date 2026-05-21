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
Se observa que genes como LEPR, SH2B1, POMC, PCSK1 y TMEM18 presentan una mayor expresión relativa en Obeso1. Por el contrario, genes como MC4R, 
SIM1, FTO, KSR2 y LEP muestran una mayor expresión en Obeso2.

El agrupamiento jerárquico separa correctamente ambos grupos, indicando que los perfiles de expresión génica son suficientemente distintos 
como para discriminar ambos perfiles obesos mediante clustering no supervisado.
