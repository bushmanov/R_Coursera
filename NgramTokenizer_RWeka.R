tst.tm <-  function() {
        BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2, delimiters = " \\r\\n\\t.,;:\"()?!"))
        ap.tdm <- TermDocumentMatrix(tm_map(crps.news, PlainTextDocument), control = list(tokenize = BigramTokenizer, removePunctuation=FALSE, wordLengths=c(0, Inf)))
        ap.tdm <- as.matrix(ap.tdm)
        ngram2 <- data.frame(word = rownames(ap.tdm), freq=(ap.tdm[,c(1)]), stringsAsFactors = FALSE)
        ngram2 <- ngram2[order(-ngram2$freq),]
        return(ngram2)
}

tst.stylo <-  function() {
        txt <- strsplit(crps.news[[1]], " ")
        ngr <- unlist(lapply(txt, make.ngrams, ngram.size = 2))
        ngram2.alt <- as.data.frame(table(ngr))
        ngram2.alt <- ngram2.alt[order(-ngram2.alt$Freq),]
        return(ngram2.alt)
}
