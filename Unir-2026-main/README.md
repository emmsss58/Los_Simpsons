# Expresión diferencial de genes entre diferentes tipos de cáncer de pulmón

## Introducción
El cáncer de pulmón es el más frecuente en ambos sexos a nivel mundial. Diversos factores contribuyen a su aparición, destacando principalmente el consumo de tabaco; sin embargo, también se ha relacionado con aspectos genéticos, exposición a partículas, pesticidas, etc (1)

Al igual que muchos otros tipos de cáncer, el cáncer de pulmón presenta numerosas alteraciones en la secuencia de ADN y epigenéticas; que juntas resultan en una activación de oncogenes e inactivación de genes supresores de tumores y reparadores de ADN. La alteración genética más frecuente es la del gen EGFR, la cual permite a los tumores ser independientes de señales producidas por otros genes (1)

El cáncer de pulmón se clasifica en dos tipos principales: cáncer de pulmón de células no pequeñas y cáncer de pulmón de células pequeñas, dependiendo de cómo se vean estas en el microscopio. Cada tipo de cáncer de pulmón crece y se disemina de forma diferente y necesita diferente tratamiento. 

- Cáncer de pulmón de células no pequeñas: es el más frecuente. Se subdivide a su vez en tres tipos: carcinoma epidermoide, adenocarcinoma y carcinoma de células grandes.
- Cáncer de pulmón de células pequeñas: llamado también cáncer microcítico, cuyas células parecen granos de avena al verlas al microscopio; crece con rapidez y de igual forma se disemina a otros órganos.
  
Por tanto, podemos hablar de 4 subtipos: carcinoma epidermoide, adenocarcinoma, carcinoma de células grandes y cáncer de pulmón de células pequeñas o microcítico.

## Objetivos

- Objetivo principal: Analizar la expresión diferencial de genes entre los distinyos tipos de cáncer de pulmón para identificar diferencias moleculares relevantes.
- Objetivos específicos:
  - Procesar y normalizar los datos de expresión génica obtenidos de las muestras.
  - Comparar la expresión génica entre los subtipos tumorales (ADC, SCC, LCC y SCLC).
  - Identificar genes con expresión diferencial significativa entre los distintos tipos de cáncer.
  - Evaluar la relevancia biológica de los genes identificados en relación con el desarrollo del cáncer de pulmón.

## Carpetas
### DATA:
- Raw_Data, para los datos crudos, incluyendo una carpeta para el control y una para cada tipo de tumor: ADC (adenocarcinoma), SCC (carcinoma epidermoide), LCC (cáncer de pulmón de células grandes) y SCLC (cáncer de pulmón de células pequeñas). Dentro de cada uno hay 4 archivos que se corresponden a las dos lecturas de dos conjuntos de datos. 
- Processed_data, para los datos procesados. Estructura de carpetas igual que la anterior, pero con archivos diferentes, uno que hace referencia al conteo de la expresión genética y otro que normaliza los datos. Además, se incluyen las dos matrices que aúnan todos los datos, antes y después de normalizar.
- Metadata: contiene dos archivos, uno que da información sobre las muestras y otro sobre el proceso experimental.
- External_data: contiene el genoma de referencia y un archivo de anotaciones.

### Scripts:
Esta carpeta contiene los archivos necesarios para llevar a cabo el análisis completo de los datos de expresión génica: desde el procesamiento hasta la generación de resultados. El objetivo es garantizar la reproducibilidad del análisis y permitir reconstruir los resultados obtenidos.
- main: es el archivo principal del proyecto. Actúa como punto de entrada del pipeline y coordina la ejecución de los distintos módulos en el orden adecuado (lectura de datos, preprocesamiento, normalización, análisis diferencial y generación de resultados).
- preprocesamiento: aquí se encuentran los scripts para la limpieza, organización y preparación del raw data. Incluye la lectura de los datos y su manipulación inicial para prepararlos para el análisis. Se hace un control de calidad de los datos para descartar secuencias de baja calidad y eliminar datos duplicados, cómo detectar y corregir posibles errores. Incluye trimming (filtrado) de los datos. El preprocesamiento también incluye el formateo de los datos y la unión de los distintos datasets según el tipo de tumor. Por último, se realiza la identificación de genes altamente variables.
- normalizacion: incluye los scripts dedicados a la normalización de los datos de expresión génica, así como el escalado y la transformación de estos. Esto sirve para hacer comparables las muestras y reducir efectos técnicos.
expresion_diferencial: esta carpeta contiene los scripts para el análisis de expresión diferencial y la comparación entre los distintos tipos de cáncer de pulmón.
- estadistica: aquí se encuentran todos los scripts para el análisis estadístico de los datos. Esta carpeta contiene únicamente el código. Los resultados generados se encuentran en la carpeta “resultados”.
- graficos: al igual que en la carpeta “estadistica”, aquí se incluye únicamente el código necesario para generar las diferentes representaciones gráficas. Los gráficos finales se almacenan en la carpeta “resultados”.
- help_funciones: aquí se incluyen funciones reutilizables, que fueron utilizados en distintas partes del análisis. Ayuda a evitar duplicaciones, reducir posibles errores en el código y mejorar la organización general del proyecto.

### Resultados:
Esta carpeta contendrá todos los análisis de los datos obtenidos y almacenados en la carpeta **Data**. Su objetivo es organizar los resultados en diferentes niveles, facilitando la trazabilidad y la interpretación del estudio.
#### Tablas
Esta carpeta contiene los datos organizados de forma tabular tras el preprocesamiento. Incluye: matrices de expresión génica, tablas con las muestras clasificadas según el tipo tumoral, datos preparado para el posterior análisis estadístico, etc. 
Representan la base del análisis ya que permiten trabajar con los datos de forma ordenada, asegurando una correcta clasificación.
#### Estadísticos
Contiene los resultados de los análisis estadísticos, como por ejemplo: p-value de comparaciones entre grupos, valores ajustados, anova, t-test, etc. 
Permite evaluar de forma significativa las diferencias observadas en la expresión de los diferentes genes en los diferentes tipos de cáncer del estudio, asegurando así que los resultados no son debidos al azar.
#### Comparaciones
Contiene los resultados de las comparaciones entre los diferentes tipos tumorales. incluye: análisis entre pares de grupos y resúmenes de genes con los cambios más relevantes.
Permite analizar contrastes directos e identificar diferencias moleculares entre los tipos de cancer. 
#### Finales
Contiene los resultados finales tras filtrado, validación e integración de los resultados anteriores. 
Incluye lista definitiva de los genes con expresión diferencial, resultados depurados y relevantes; además de tablas finales para su inlusión en informes o artículos para publicación.
En esta sección se recogen únicamente los resultados más relevantes y significativos para la correcta interpretación biológica. 


### Documentación adicional

Esta carpeta reúne materiales complementarios que apoyan el desarrollo del proyecto, organizados en cuatro grandes bloques: bibliografía, control de calidad, cronograma y protección de datos. Su objetivo es centralizar toda la información de referencia, resultados técnicos, planificación y documentos éticos utilizados por el equipo.

#### Bibliografía

Esta carpeta contiene documentación de referencia utilizada para comprender el contexto biológico del proyecto. Incluye archivos sobre distintos tipos de cáncer:
- **Adenocarcinoma**
- **Carcinoma de células grandes**
- **Carcinoma epidermoide**
- **Cáncer microcítico**
Estos documentos sirven como base teórica para interpretar los resultados y justificar decisiones metodológicas.

#### Control de calidad

En esta sección se almacena todo el material relacionado con la evaluación de la calidad de los datos, desde los análisis iniciales de las lecturas crudas hasta controles posteriores más específicos.

##### Archivos FASTQC
Reportes generados mediante FASTQC para evaluar la calidad de las secuencias crudas. Estos documentos permiten revisar métricas clave como calidad por base, contenido GC, sobre-representación de secuencias, entre otras. Cada archivo corresponde a una muestra:
- **ADC_fastqc.html**
- **LCC_fastqc.html**
- **SCC_fastqc.html**
- **SCLC_fastqc.html**

##### Informes
Incluye diversos documentos descriptivos que complementan el análisis técnico:
- **Normalización** – Proceso de normalización aplicado a los datos.
- **QC Alineamiento** – Evaluación del alineamiento de lecturas.
- **QC Biológico** – Revisión de consistencia desde un punto de vista biológico.
- **QC Datos crudos** – Control de calidad previo a cualquier procesamiento.
- **Conclusión QC.md** – Síntesis general de los resultados del control de calidad.
- **Indicadores.md** – Resumen de métricas empleadas para evaluar la calidad.

#### Cronograma
Carpeta destinada a la planificación y seguimiento del proyecto. Incluye:
- **Entregables.md** – Listado y descripción de entregables.
- **Planificación general.md** – Cronograma global del proyecto.
- **Seguimiento.md** – Registro del progreso y actividades realizadas.
- **Tareas.md** – Distribución del trabajo entre integrantes.

#### Protección de datos

Contiene documentos relacionados con aspectos éticos y legales del proyecto, entre ellos el **Consentimiento informado.md**.

## Bibliografía
1. Kajatt EA. Cáncer de pulmón, una revisión sobre el conocimiento actual, métodos diagnósticos y perspectivas terapéuticas. Revista Peruana de Medicina Experimental y Salud Pública [Internet]. 7 de febrero de 2014;30(1). Disponible en: https://doi.org/10.17843/rpmesp.2013.301.163
