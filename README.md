# SoybaseData
Formatted data from soybase  

**LinkageMap50k.csv**  
Linkage map from the 50k SNP chip  

**LinkageMap6K**  
Linkage map from the 6k SNP chip  
> Reference.SNP.ID.rs:Reference SNP id    
> Submitted.SNP.ID.ss: Submitted SNP id  
> SNPName.Glyma.Wm82.a1: SNP name in the Glyma Wm82 version a1  
> SNPName.Glyma.Wm82.a1.short: Short SNP name in the Glyma Wm82 version a1  
> SNPName.Glyma.Wm82.a2: SNP name in the Glyma Wm82 version a2    
> SNPName.Glyma.Wm82.a2.short: Short SNP name in the Glyma Wm82 version a2    
> Chromosome: Chromosome label 
> Position.Glyma1: SNP position in the Glyma1 assembly    
> Position.Glyma2: SNP position in the Glyma2 assembly
> Genetic.position.cM: SNP position on the linkage map in cM  

**SNPChip50KData.csv**  
Extended data for SNPs from the 50K SNP chip. SNPs of the 6k chip are derived from the 50k chip.  

**SoySNPConcensus_LPmerge.csv**  
Concensus map created from the 50K and 6K linkage maps using the [LPmerge R package](https://academic.oup.com/bioinformatics/article/30/11/1623/284175)    
> SNP: SNP Name  
> LG: Linkage group/chromosome  
> Pos_BP: Base Pair position of the SNP within the linkage group  
> Pos_Bin1: cM position when a interval size of 1 cM is used between bins  
> Pos_Bin2: Interval size of 2 cM  
> Pos_Bin3: Interval size of 3 cM  
