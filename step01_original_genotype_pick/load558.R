#!/usr/local/bin/Rscript
args<-commandArgs(T)
load(args[1])
varlist <- read.table("558.list",header=F,stringsAsFactors=F)
data <- chr[,varlist$V1]
ag <- strsplit(args[1],split=".",fixed=T)
rdata <- paste0(ag[[1]][1],"_558.Rdata")
outfile <- paste0(ag[[1]][1],"_558.txt")
write.table(data,file=outfile,quote=FALSE,sep = "\t")
save(data,file=rdata)
