library(data.table)
DF = data.frame(x=rep(c("a","b","c"),each=3), y=c(1,3,6), v=1:9)
DT = data.table(x=rep(c("a","b","c"),each=3), y=c(1,3,6), v=1:9)
DF
DT
identical(dim(DT),dim(DF))
grpsize = ceiling(1e7/26^2) # 10 million rows, 676 groups
tt=system.time( DF <- data.frame(
        x=rep(LETTERS,each=26*grpsize),
        y=rep(letters,each=grpsize),
        v=runif(grpsize*26^2),
        stringsAsFactors=FALSE)
        )
tt
head(DF,3)
tail(DF)
dim(DF)
system.time(ans1 <- DF[DF$x=="R" & DF$y=="h",])
DT = as.data.table(DF)
system.time(setkey(DT,x,y))
head(DT[list("R")])
library(microbenchmark)
microbenchmark(tt <- tapply(DT$v,DT$x,sum),
                ss1 <- DT[,sum(v), by=x],
                ss2 <- DT[,sum(v), keyby=x])
DT
DT(,list(x,y))
setkey(DT, x,y)
microbenchmark(
DT[list("A","b"),],
DT[c("A","b"),],
DT[.("A","b"),],
DT[x=="A" & y=="b", ],
DF[DF$x=="A" & DF$y=="b", ]
)
microbenchmark(
        DT[,list(x,y)],
        DT[, c("x","y"), with=F],
        DT[, .(x,y)]
)

X = data.table(grp=c("a","a","b","b","b","c","c"), foo=1:7)
setkey(X,foo)
Y = data.table(c(1,2), bar=c(4,2))
tables()
X
Y
X[Y]
microbenchmark(
X[Y, .(sum(foo*bar))],
X[Y, sum(foo*bar)]
)
X[Y,sum(foo*bar),by=.EACHI]


microbenchmark(
        uniTable[,.N],
        nrow(uniTable)
        )
# Unit: microseconds
# expr     min       lq      mean   median       uq      max neval cld
# uniTable[, .N] 429.873 468.0765 538.10028 523.0415 556.3565 1732.482   100   b
# nrow(uniTable)  38.972  40.8230  46.21758  42.4295  43.6160  157.143   100  a
