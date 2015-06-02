library(pryr)
load("/home/sergey/R_Capstone/bg_stylo_freq.RData")
load("/home/sergey/R_Capstone/tr_stylo_freq.RData")
object_size(bg_stylo_freq)
# 519 MB
rexp <- "^(.*)\\s((\\w+)\\.?)$"
nmb <- names(bg_stylo_freq)
nmt <- names(tr_stylo_freq)
library(data.table)
bigramDt <- data.table(string=sub(rexp,"\\1",nmb),
                    prediction =sub(rexp,"\\2",nmb),
                    freq=bg_stylo_freq)

trgramDt <- data.table(string=sub(rexp,"\\1",nmt),
                       prediction =sub(rexp,"\\2",nmt),
                       freq=tr_stylo_freq)
object_size(bigramDt)
# 217 MB !!!!!
bigramDf <- as.data.frame(bigramDt)
object_size(bigramDf)
# 217 MB
setkey(bigramDt, string)
bigramDt[J("i"),]
object_size(bigramDt)
object_size(bg_stylo_freq)
