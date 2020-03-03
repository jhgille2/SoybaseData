# LPMerge of soy50K and soy6K linkage maps

library(LPmerge)
library(dplyr)
library(tidyr)

Linkage_6k  <- read.csv("https://raw.githubusercontent.com/jhgille2/SoybaseData/master/LinkageMap6k.csv", header = TRUE, stringsAsFactors = FALSE)
Linkage_50k <- read.csv("https://raw.githubusercontent.com/jhgille2/SoybaseData/master/LinkageMap50k.csv", header = TRUE, stringsAsFactors = FALSE)



Linkage_6k$LG  <- as.factor(as.numeric(gsub("Gm","", as.character(Linkage_6k$Chromosome))))
Linkage_6k     <- Linkage_6k %>% select(SNPName.Glyma.Wm82.a1.short, LG, Genetic.position.cM)
Linkage_50k$LG <- as.factor(as.numeric(gsub("Chr", "", as.character(Linkage_50k$Wm82.a2.v1.Chromosome))))
Linkage_50k    <- Linkage_50k %>% select(SNP.ID.Simple, LG, WP.linkage.position)
Linkage_50k    <- Linkage_50k %>% filter(!is.na(LG))

colnames(Linkage_50k) <- colnames(Linkage_6k) <- c("SNP", "LG", "POS")

Linkage_All <- bind_rows(Linkage_50k, Linkage_6k)


Linkage_50k <- split(Linkage_50k, Linkage_50k$LG)
Linkage_6k  <- split(Linkage_6k, Linkage_6k$LG)

ConcensusMaps <- vector("list", length = length(Linkage_6k))

for(i in 1:20){
  Linkage_50k[[i]]$LG <- NULL
  Linkage_6k[[i]]$LG <- NULL
}


for(i in 1:length(ConcensusMaps)){
  ConcensusMaps[[i]] <- LPmerge(list(Linkage_6k[[i]], Linkage_50k[[i]]))
}

# Maps for different bin sizes
ConcensusMaps_Bin1 <- do.call(bind_rows, lapply(ConcensusMaps, function(x) x[[1]][, 1:2]))
ConcensusMaps_Bin2 <- do.call(bind_rows, lapply(ConcensusMaps, function(x) x[[2]][, 1:2]))
ConcensusMaps_Bin3 <- do.call(bind_rows, lapply(ConcensusMaps, function(x) x[[3]][, 1:2]))

colnames(ConcensusMaps_Bin1) <- c("SNP", "Pos_Bin1")
colnames(ConcensusMaps_Bin2) <- c("SNP", "Pos_Bin2")
colnames(ConcensusMaps_Bin3) <- c("SNP", "Pos_Bin3")

ConcensusMaps_All            <- left_join(ConcensusMaps_Bin1, left_join(ConcensusMaps_Bin2, ConcensusMaps_Bin3))
ConcensusMaps_All            <- left_join(ConcensusMaps_All, Linkage_All)
ConcensusMaps_All_sep        <- ConcensusMaps_All %>% separate(SNP, "_", into = c("Chr", "Pos"))
ConcensusMaps_All_sep$Pos_BP <- ConcensusMaps_All_sep$Pos
ConcensusMaps_All_sep        <- ConcensusMaps_All_sep %>% unite("SNP", Chr:Pos)
ConcensusMaps_All_sep$Pos_BP <- as.numeric(ConcensusMaps_All_sep$Pos_BP)
ConcensusMaps_All_sep        <- ConcensusMaps_All_sep %>% select(SNP, LG, Pos_BP, Pos_Bin1, Pos_Bin2, Pos_Bin3) %>% arrange(LG, Pos_BP)


write.csv(ConcensusMaps_All_sep, "I:\\Soybean Data\\Oil MP\\Mapping Data\\SoySNPConcensus_LPmerge.csv", row.names = FALSE)

