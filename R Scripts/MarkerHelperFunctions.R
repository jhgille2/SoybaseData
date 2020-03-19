# Various helper functions for handling marker names/marker data.
# Specifically for preparing data for genetic map creation or qtl mapping

library(dplyr)
library(data.table)
library(gdmp)
library(tidyr)
library(qtl)


# 50K SNP data
SNP50K <- read.csv("https://raw.githubusercontent.com/jhgille2/SoybaseData/master/SNPChip50KData.csv", header = TRUE, stringsAsFactors = FALSE)

# A function to convert SNP names to short names w/out allele calls
# Input names should be in the format [Chromosome]_[Number]_[Allele1]_[Allele2]
SNPName_Short <- function(longNames){
  
  # Split the marker name based on underscore seperators and merge the first two eleements
  # The last two elements are major/minor alleles for each marker
  sapply(strsplit(longNames, "_"), function(x) paste(x[[1]], x[[2]], sep = "_"))
}

# A function whch returns the linkage group, given a SNP name (needs the 50K SNP data to work)
# SNPnames should be in a short format ([Chromosome]_[Number])
SNPName_ToLG_Reference <- function(SNPNames, SNP50KData = SNP50K){
  
  # Match short names to the short names in the 50K dataset, pull chromosome assignments for each marker
  ChrNames <- SNP50K$Glyma1.01.Chromosome[match(SNPNames, SNP50K$SNP.ID.Simple)]
  
  # Convert chromosome names to a numeric index and return
  LGNames  <- as.numeric(gsub("Gm", "", ChrNames))
  LGNames
  
}
         
# Extract chromosome number directly from SNP names
SNPName_ToLG <- function(SNPNames){
  Chr <- str_extract(SNPs, "Gm(\\d{2})")
  Chr_num <- as.numeric(gsub("Gm", "", Chr))
  Chr_num
}

# A function which takes as an argument a SNP matrix where the column names are markers, row names are
# individuals, and outputs a dataframe ready for input into r/qtl (without positional data)
Matrix_toRQTL_noPos <- function(SNPmatrix){

  CHRNums   <- SNPName_ToLG(colnames(SNPmatrix))
  
  FirstRow  <- c("Ind", as.character(colnames(SNPmatrix)))
  SecondRow <- c("", as.character(CHRNums))
  ThirdRow  <- c("", unlist(sapply(table(CHRNums), function(x) 1:x)))
  SNPmatrix <- cbind(rownames(SNPmatrix), SNPmatrix)
  Header    <- rbind(FirstRow, rbind(SecondRow, ThirdRow))
  Outfile   <- rbind(Header, SNPmatrix)
  Outfile
  
}

# Function to write rqtl ready matrices
write.rqtl <- function(rqtlMatrix, fileName = "RQTLFile.csv"){
  write.table(rqtlMatrix, fileName, row.names = F, col.names = F, sep = ",")
}

EntryConversion <- read.csv("https://raw.githubusercontent.com/jhgille2/SoybaseData/master/EntryPlantNumberConversion.csv", header = TRUE)
EntryConversion <- EntryConversion[, 1:4]
# A function to convert plant numbers to entries for oil mapping populations 201 and 202
PlantNumber_toEntry <- function(PlantNumbers){
  EntryConversion$Row[match(rownames(ExpArray.201.r), EntryConversion$PlantNo)]
}

# Read in a r/qtl file that was exported from a matrix which used gdmp's allele coding scheme
#
# 0 : Homozygote genotype 1
# 1 : Heterozygote genotype
# 2: Homozygote genotype 2
# 5: Error/missing
read.cross.gdmp <- function(gdmpQTLdata.dir, gdmpQTLdata.filepath){
  read.cross(format     = "csv",
             dir        = gdmpQTLdata.dir,
             file       = gdmpQTLdata.filepath,
             genotypes  = c("0", "1", "2", "999", "999"),
             crosstype  = "riself",
             na.strings = "5")
}

read.cross.gdmp("I:\\Soybean Data\\Oil MP\\Mapping Data\\", "test.csv")
