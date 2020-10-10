library(tercen)
library(dplyr)
library(tidyr)

ctx = tercenCtx()

if (length(ctx$rnames) != 1) stop("One and only one row factor is required.") 

type <- "all"
if(!is.null(ctx$op.value('type'))) type <- ctx$op.value('type')
what <- ' '
if(!is.null(ctx$op.value('what'))) what <- ctx$op.value('what')
by <- ""
if(!is.null(ctx$op.value('by'))) by <- ctx$op.value('by')

if(type == "first") {
  string <- sub(what, by, ctx$rselect()[[1]])
} else {
  string <- gsub(what, by, ctx$rselect()[[1]])
}

data.frame(string) %>% 
  mutate(.ri = seq_len(nrow(.))-1) %>%
  ctx$addNamespace() %>%
  ctx$save()
