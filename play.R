library(tm)
library(RWeka)
library(SnowballC)
library(Snowball)
library(RWekajars)
options(mc.cores=1)
one <- "The guy in front of me just bought a pound of bacon, a bouquet, and a case of"
two <- "You're the reason why I smile everyday. Can you follow me please? It would mean the"
three <- "Hey sunshine, can you follow me and make me the"
release_corpus <- VCorpus(VectorSource(list(one, two, three)),
               readerControl = list(language = "english"))
class(release_corpus[[1]])
release_corpus <- tm_map(tmp, removeNumbers)
release_corpus <- tm_map(release_corpus, content_transformer(tolower))
release_corpus <- tm_map(release_corpus, stemDocument)
release_corpus <- tm_map(release_corpus, removePunctuation)
inspect(release_corpus)
tdm <- TermDocumentMatrix(release_corpus)
findFreqTerms(tdm, 2)
findAssocs(tdm, "follow",.9)
BigramTokenizer <- function(x){NGramTokenizer(x, Weka_control(min = 2, max = 2))}
tdm_bigram <- TermDocumentMatrix(release_corpus,
                                 control = list(tokenize = BigramTokenizer))
findFreqTerms(tdm_bigram, 2)
