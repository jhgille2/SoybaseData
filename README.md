# SoybaseData
Formatted data from soybase & other helper tables for oil mapping populations 201 and 202

**LinkageMap50k.csv**  
Linkage map from the 50k SNP chip from the [Williams 82 x PI479752 (WP) population](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4704267/)  
* SNP.ID.Simple: Shortened SNP name from the Glyma1 assembly  
* Glyma1.01.Chromosome: Chromosome from the Glyma1 assembly  
* Glyma1.01.Coordinate: BP position in the Glyma1 assembly  
* Wm82.a2.v1.Chromosome: Chromosome from the Wm82.a2 assembly  
* Wm82.a2.v1.Coordinate: BP Position from the Wm82.a2 assembly  
* WP.Linkage.Group: Linkage group in the linkage map from the Williams 82 x PI479752 (WP) population  
* WP.linkage.position: Position in the linkage map (cM) from the Williams 82 x PI479752 (WP) population  

**LinkageMap6K**  
Linkage map from the 6k SNP chip for a [Wyandot’ × PI 567301B population](https://link.springer.com/article/10.1007%2Fs11032-015-0209-5) 
* Reference.SNP.ID.rs:Reference SNP id    
* Submitted.SNP.ID.ss: Submitted SNP id  
* SNPName.Glyma.Wm82.a1: SNP name in the Glyma Wm82 version a1  
* SNPName.Glyma.Wm82.a1.short: Short SNP name in the Glyma Wm82 version a1  
* SNPName.Glyma.Wm82.a2: SNP name in the Glyma Wm82 version a2    
* SNPName.Glyma.Wm82.a2.short: Short SNP name in the Glyma Wm82 version a2    
* Chromosome: Chromosome label 
* Position.Glyma1: SNP position in the Glyma1 assembly    
* Position.Glyma2: SNP position in the Glyma2 assembly
* Genetic.position.cM: SNP position on the linkage map in cM  

**SNPChip50KData.csv**
Various descriptive and positional data for 50K SNPs from [two populations](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4704267/)   
* ss.ID: Submitted SNP ID
* SNP.ID: SNP Name in the Glyma1 assembly  
* Glyma1.01.Chromosome/Coordinate: Chromosome and BP position of the SNP in the Glyma1 assembly  
* WM82.a2.v1.Chromosome/Coordinate: Chromosome and BP position of the SNP inthe Wm81.a2.v1 assembly  
* Wm82.a2.v1.Gene.ID/Gene.Regions: Gene IDs for SNPs in the Wm82.a2.v1 assembly  
* WP/EW.Linkage.Group/Linkage.Position: Genetic linkage group of the SNP in the Williams 82 x PI479752 (WP)/ Essex x Williams (EW) populations  


**SNPChip50KMetaData.csv**  
Various quality statistics for SNPS, used in the [development of the 50K SNP chip](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0054985#).  
* SNP.ID: SNP name  
* Chromosome: SNP chromosome  
* Coordinate: BP Position within chromosome  
* Williams.82.allele: Primary allele  
* Alternative.allele: Alternative allele  
* sequence.flanking.SNP_60bp: SNP flanking sequence
* Bead.type.success.Y_N: Bead success? (Yes/no)
* Priority.group/SNP.score/Index.score: SNP quality measures    
* Polymorphism: Y/N indicator of polymrphism for a marker  
* Position.in.gene: Posision in a gene (if available)  
* MAF.Elite/G.Max/G.Soja/Landrace.Elite.and.G.Soja: MAF in elite, landrace, and wild soybean populations

**SoySNPConcensus_LPmerge.csv**  
Concensus map created from the 50K and 6K linkage maps using the [LPmerge R package](https://academic.oup.com/bioinformatics/article/30/11/1623/284175)    
* SNP: SNP Name  
* LG: Linkage group/chromosome  
* Pos_BP: Base Pair position of the SNP within the linkage group  
* Pos_Bin1: cM position when a interval size of 1 cM is used between bins  
* Pos_Bin2: Interval size of 2 cM  
* Pos_Bin3: Interval size of 3 cM 

**EntryPlantNumberConversion.csv**  
File to convert between plant numbers and entries for oil mapping populations 201 and 202  
* Population: WHich population does the line belong to  
* Row: Entry  
* Cross: Parent cross  
* PlantNo: Plant number  

**SoybaseQTL.csv**  
Positions of QTL on the GM Composite genetic linkage map from soybase.

**ExpectedLGSizes.csv**  
Expected LG sizes in cM from four linkage maps.  

**ConsensusMapWithPositions.csv**  
SNP markers from the GM Consensus 4.0 map along with physical positions on the Wm82.a2 assembly.  

**Wm82.a4.v1_to_Correspondence_Full.csv**  
Gene name lookup table to match gene names between v4 to v1 and v2 of the soybean genome. Downloaded from [this](https://soybase.org/correspondence/index.php) page on soybase.  

**SoybaseLGAssignments.csv**  
LG names to chromosome number conversion table from SoyBase.  

**sbSNPConversion.csv**  
A table to convert the names of SNPs on the beadchip to dbSNP ids.  

**PI_to_common_name_conversion.csv**  
PI numbers to common names from GRIN for many soybean accessions. File downloaded from [here](https://www.soybase.org/tools/gcvit/)  

**snp_ab_conversion_6k.csv**  
A table to convert SNP genotypes from the BARCSoySNP6K chip between forward and AB format.  

**snp_ab_conversion_6k_clean.csv**  
A cleaned up version of the table to convert SNP genotypes from the BARCSoySNP6K chip between forward and AB format.  
