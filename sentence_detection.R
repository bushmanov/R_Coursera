library(qdap)

txt <- "I don’t know. Maybe they’re getting too much sun. I think I’m going to cut them way back. I replied. I won 30.000 USD in a lottery. The notification came at 5 p.m.. Where is the Y.M.C.A. building?"
sent_detect(txt)

tm_map(crps , sent_detect, endmarks = c("?", ".", "!", "|", ":", "\n","\r\n"))
