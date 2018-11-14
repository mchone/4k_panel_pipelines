#!/usr/local/bin/Rscript
args<-commandArgs(T)
load(args[1])
ag <- strsplit(args[1],split=".",fixed=T)
outfile <- paste0(ag[[1]][1],"_4k.txt")
write.table(chr,file=outfile,quote=FALSE,sep = "\t")
