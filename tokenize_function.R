require(compiler)
.tokenize <- function(x) {
        y <- gsub("^(.)", "<s> \\1", x) # BOS: Beginning of string
        y <- gsub("([a-z0-9])\\.\\s([A-Za-z0-9])", "\\1 </s> <s> \\2", y) # BOS & EOS: middle of string
        y <- gsub("\\.?$", "\\1 </s>", y) # EOS: end of string
        y <- tolower(y)
        return(unlist(strsplit(y, " ")))
}
.tokenize <- cmpfun(.tokenize)
