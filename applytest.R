##input your data
##first line should be headed as "x", the following columns headed with the genes/mutations of interest.
##ggplot2 is required 
setwd("C:\\Users\\Anran\\Documents\\R\\hyperglycemia genome")


genefile<- read.csv(file.choose())


##load oncocorrelation.R
source("oncocorrelation.R")


##if you want want to order the genes by the absolute correlation, add "orderbyabs = TRUE"
gene.cor.bar(genefile)



