# Introducción
Identificación de genes diferencialmente expresados para comprender la base genética de la heterogeneidad metabólica en modelos simulados de obesidad entre las familias Simpson (Obeso 1) y Bouvier (Obeso 2).  Se plantea la hipótesis de que existen diferentes patrones de transcriptómica entre los grupos, explicando así sus diferentes perfiles metabólicos. 

# Metodología
Se realizó el preprocesamiento de los datos RNA-seq utilizando fastp para el control de calidad de los FASTQs, complementado con FastQC y la visualización global de resultados mediante MultiQC. Posteriormente, se llevaron a cabo análisis exploratorios y estadísticos, incluyendo un PCA que mostró una clara separación entre los grupos Obeso1 y Obeso2. Además, se generó un volcano plot para la identificación de genes diferencialmente expresados y heatmaps que evidenciaron patrones consistentes de expresión y permitieron el agrupamiento jerárquico de las muestras según su perfil transcriptómico. Finalmente se hizo una interpretación biológica. 

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

La clasificación actual de Obesidad propuesta por la OMS está basada en el Índice de Masa Corporal (IMC), el cual corresponde a la relación entre el peso expresado en kilos y el cuadrado de la altura, expresada en metros. De esta manera, las personas cuyo IMC sea igual o superior a 30kg/m2 se consideran obesas.

Los análisis realizados indican que existen diferencias moleculares entre los grupos comparados, especialmente en genes relacionados con la regulación del apetito, la señalización lipídica y el balance energético. Esto sugiere que los grupos podrían presenar diferentes subtipos de obesidad. 

El grupo Obeso1 presenta una mayor expresión de los genes LEPR, SH2B1, POMC, PCSK1 y TMEM18, los cuales están relacionados con la vía leptina-melanocortina, uno de los sistemas más importantes de regulación del apetito y gasto energético. Sin embargo, los pacientes del grupo Obeso2 presentan una mayor expresión de los genes MC4R, SIM1, FTO, KSR2 y LEP.

La vía leptina-melanocortina resulta esencial en la comprensión de los elementos que actúan sobre la regulación de la ingesta. La producción de leptina se produce en el tejido adiposo blanco y circula en el plasma, atravesando la barrera hematoencefálica e interactuando con su receptor (LEPR), actuando como señal de reserva energética. En situaciones de exceso de leptina, se promueve la expresión de POMC, que se escinde en péptidos denominados melanocortinas (alfa-MSH, fi-MSH) que actúan como ligando al receptor 4 de melanocortina (MC4R).

## Grupo Obeso1

### LEPR

Este gen codifica para el receptor de la leptina, su mayor expresión sugiere una mayor sensibilidad a la señal de saciedad. 

### SH2B1

Se trata de un regulador intracelular clave en la señalización de la leptina e insulina. Potencia la vía activada por el gen mencionado anteriormente, LEPR, y participa en la regulación del metabolismo energético y la termogénesis. 

### POMC

Gen de importancia en el control de la saciedad; produce alfa-MSH, un péptido que activa la vía MC4R e inhibe la ingesta alimentaria. Una mayor expresión de este podría significar una activación de vías anorexigénicas (circuitos neurológicos y hormonales del cuerpo que suprimen el apetito e inducen la sensación de saciedad).

### PCSK1

Gen que codifica una enzima responsable del procesamieo del POMC y por lo tanto de la producción de alfa-MSH. Su incremento en el grupo Obeso1 puede significar una activación funcional del eje principal y del procesamiento relacionado con la saciedad. 

### TMEM18

El gen TMEM18 se expresa principalmente en el hipotálamo, la región del cerebro encargada de regular el hambre, la saciedad y el gasto energético. Un aumento en su expresión está relacionada, según estudios de GWAS, con una susceptibilidad genética a la obesidad.

### Conclusiones

Los resultados sugieren que este grupo presenta una activación aumentada de la vía leptina-melanocortina frente al exceso de energía. Aunque se sobreexpresan numerosos genes relacionados con la sensación de saciedad y la regulación energética, esta respuesta parece ser insuficiente por lo que podrían encontrarse en estado de resistencia a la leptina. 

## Grupo Obeso2

### MC4R

Este gen codifica para el receptor 4 de melacortina, clave en la regulación del apetito y gasto energético. Su activación tiene un efecto anorexigénico (inhibición del apetito). Una mayor activación de la expresión del gen está relacionada con un intento de compensación de incrementar la señl de saciedad.

### SIM1

Factor de transcripción implicado en el desarrollo y función de núcleos hipotalámicos que regulan el apetito.

### FTO

Gen  asociado a predisposición a obesidad; influye en regulación del apetito y preferencia energética.

### KSR2

Implicado en la regulación del metabolismo energético y eficiencia energética celular; su alteración se asocia a menor gasto energético y a una mayor tendencia de acumulación de energía (grasa).

### LEP

Codifica leptina, hormona principal en la señalización del estado energético. Su mayor expresión puede reflejar mayor masa adiposa, pero también puede asociarse a resistencia a leptina.

### Conclusiones

Este grupo sugiere una respuesta compleja a la regulación del balance energético, existiendo activación de vías relacionadas con la inhibición del apetito, con genes que demuestran predisposición a obesidad. esto puede indicar una desregulación general del gasto energético. 

## Comparación Obeso1 con Obeso2

Como principal diferencia destaca una activación de la vía leptina-melanocortina en el grupo Obeso1, lo que puede interpretarse como una respuesta biológica ante la acumulación de energía; pero resultando ineficaz. Por otro lado, en el grupo Obeso2 podemos ver una predisposición genética, lo que sugiere que ocurre una descompensación más compleja.

Ambos grupos muestran alteraciones en el mismo eje, aunque uno se debe a mecanismos fallidos y otro a múltiples factores, destacando predisposición genética. 

# Bibliografía

1. LEPR leptin receptor [ Homo sapiens (human) ] [Internet]. NCBI. 2026. Disponible en: https://www.ncbi.nlm.nih.gov/datasets/gene/3953/
2. Obesidad por deficiencia del gen receptor de leptina [Internet]. National Organization For Rare Disorders. 2023. Disponible en: https://rarediseases.org/es/rare-diseases/obesidad-por-deficiencia-del-gen-receptor-de-leptina/
3. Next-generation sequencing of the monogenic obesity genes LEP, LEPR, MC4R, PCSK1 and POMC in a Norwegian cohort of patients with morbid obesity and normal weight controls [Internet]. NIH. 2017. Disponible en: https://pubmed.ncbi.nlm.nih.gov/28377240/
4. Jiang L, Su H, Wu X, Shen H, Kim MH, Li Y, et al. Leptin receptor-expressing neuron Sh2b1 supports sympathetic nervous system and protects against obesity and metabolic disease. Nature Communications [Internet]. 23 de marzo de 2020;11(1):1517. Disponible en: https://doi.org/10.1038/s41467-020-15328-3
5. Moreno GM. Definición y clasificación de la obesidad. Revista Médica Clínica las Condes [Internet]. 1 de marzo de 2012;23(2):124-8. Disponible en: https://doi.org/10.1016/s0716-8640(12)70288-2
6. Rui L. SH2B1 regulation of energy balance, body weight, and glucose metabolism. World Journal Of Diabetes [Internet]. 1 de enero de 2014;5(4):511. Disponible en: https://pmc.ncbi.nlm.nih.gov/articles/PMC4127586/
7. Recepcion. OBESIDAD y GENÉTICA: CÓMO INFLUYEN TUS GENES EN EL PESO CORPORAL, EL METABOLISMO y LA RESPUESTA a LA DIETA [Internet]. Lorgen. 2025. Disponible en: https://www.lorgen.com/diagnostico-enfermedades-geneticas/obesidad-y-genetica-como-influyen-tus-genes-en-el-peso-corporal-el-metabolismo-y-la-respuesta-a-la-dieta/
8. Wabitsch M, Farooqi S, Flück CE, Bratina N, Mallya UG, Stewart M, et al. Natural History of Obesity Due to POMC, PCSK1, and LEPR Deficiency and the Impact of Setmelanotide. Journal Of The Endocrine Society [Internet]. 15 de abril de 2022;6(6):bvac057. Disponible en: https://doi.org/10.1210/jendso/bvac057
9. M JLS. Sistema leptina-melanocortinas en la regulación de la ingesta y el peso corporal. Revista Médica de Chile [Internet]. 1 de septiembre de 2009;137(9):1225-34. Disponible en: https://doi.org/10.4067/s0034-98872009000900014
