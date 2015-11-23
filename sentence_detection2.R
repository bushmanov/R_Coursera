library(stylo); library(tm); library(qdap); library(data.table)
sam <- readLines("./final/en_US/sam")
(samB <- gsub("(^[A-Z0-9])", "<s> \\1", sam)) # BOS: Beginning of string
(samM <- gsub("([a-z0-9])[.!?:;]( [A-Z0-9])", "\\1 </s> <s>\\2", samB)) # BOS & EOS: middle of string
(corp <- gsub("([a-zA-Z0-9])[.!?:;]$", "\\1 </s>", samM)) # EOS: end of sentence
(vec <- strsplit(corp, " "))
tab <- sort(table(unlist(lapply(vec, make.ngrams, 2))), d=T)
tab1 <- tab[-1]
n <- names(tab1)
w <- strsplit(n, " ")
f <- sapply(w, "[", 1)
s <- sapply(w, "[", 2)
dt <- data.table(bigram=n, first=f, second=s, cnt=tab1)
setkey(dt, first)
dt
dt1 <- dt[ , list(bigram, second, cnt, sumfirst=sum(cnt)), by=first]
dt1$freq <- dt1[,cnt]/dt1[,sumfirst]
