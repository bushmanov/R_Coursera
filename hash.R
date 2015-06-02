library(digest)
library(pryr)
s <- "I go to a club tonight and went back very late"
h <- digest(s, algo=c("crc32"))
h
object_size(s)
object_size(h)
object_size(digest("s", algo="crc32", serialize=T, ascii=T, raw=T, skip=T))


DT <- data.table(keY="word1 word2 word3", val="pred")
setkey(DT, keY)
object_size(DT)
h <- hash("word1 word2 word3", "pred")
object.size(h)

library(microbenchmark)
microbenchmark(
        DT[.("word1 word2 word3")],
        values(h, "word1 word2 word3", USE.NAMES=F)
        )
object.size(triTop3)
# 67729624 bytes
triHash <- hash(triTop3$key, triTop3$value)
sum(sapply(ls(triHash), function(x) object.size(get(x,triHash))))
# [1] 67876920
setkey(triTop3, key)
microbenchmark(
        triHash[["</s> <s>"]],
        triTop3["</s> <s>"]
)
# Unit: microseconds
#                  expr      min        lq      mean   median       uq      max neval cld
# triHash[["</s> <s>"]]   51.963   54.3725  151.4711   62.020  250.626  353.048   100  a
# triTop3[.("</s> <s>")] 6896.120 7070.2695 7171.8379 7141.577 7252.484 7609.198   100   b
