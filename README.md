# SoybaseData
Formatted data from soybase  

**LinkageMap50k.csv**  
Linkage map from the 50k SNP chip from the [Williams 82 x PI479752 (WP) population](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4704267/)  
> SNP.ID.Simple: Shortened SNP name from the Glyma1 assembly  
> Glyma1.01.Chromosome: Chromosome from the Glyma1 assembly  
> Glyma1.01.Coordinate: BP position in the Glyma1 assembly  
> Wm82.a2.v1.Chromosome: Chromosome from the Wm82.a2 assembly  
> Wm82.a2.v1.Coordinate: BP Position from the Wm82.a2 assembly  
> WP.Linkage.Group: Linkage group in the linkage map from the Williams 82 x PI479752 (WP) population  
> WP.linkage.position: Position in the linkage map (cM) from the Williams 82 x PI479752 (WP) population  

**LinkageMap6K**  
Linkage map from the 6k SNP chip for a [Wyandot’ × PI 567301B population](https://link.springer.com/article/10.1007%2Fs11032-015-0209-5) 
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

**SNPChip50KMetaData.csv**  
Various quality statistics for SNPS, used in the [development of the 50K SNP chip](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0054985#).  

**SoySNPConcensus_LPmerge.csv**  
Concensus map created from the 50K and 6K linkage maps using the [LPmerge R package](https://academic.oup.com/bioinformatics/article/30/11/1623/284175)    
> SNP: SNP Name  
> LG: Linkage group/chromosome  
> Pos_BP: Base Pair position of the SNP within the linkage group  
> Pos_Bin1: cM position when a interval size of 1 cM is used between bins  
> Pos_Bin2: Interval size of 2 cM  
> Pos_Bin3: Interval size of 3 cM  
