size4 <- unlist(lapply(dataset[grep("[^ ]* [^ ]* [^ ]* [^ ]*", dataset)], function(x) make.ngrams(txt.to.words(x), ngram.size = 4)))

tinytestdata <- c("How are you", " Btw thanks for the RT", " You gonna be in DC anytime soon")
ngramify(tinytestdata)
make.ngrams(unlist(strsplit("How are you Btw thanks for the RT You gonna be in DC anytime soon", " ")), ngram.size = 4)

