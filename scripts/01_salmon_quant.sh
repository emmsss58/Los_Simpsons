for sample in AbrahamSimpson HomerSimpson MargeSimpson PattyBouvier SelmaBouvier
do 
 salmon quant \
 -i salmon_index \
 -l A \
 --validateMappings \
 -1 raw_data/${sample}_R1.fastq.gz \
 -2 raw_data/${sample}_R2.fastq.gz \
 -o salmon_quant/${sample}
 done
