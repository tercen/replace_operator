library(tercen)
library(dplyr)
library(tidyr)

options("tercen.workflowId" = "a77770c3923fad0ca99b77fa8905471d")
options("tercen.stepId"     = "4bfb04a0-e639-43b7-9b3b-56302fd921ea")

ctx = tercenCtx()

if (length(ctx$rnames) != 1) stop("One and only one row factor is required.") 

type <- "all"
if(!is.null(ctx$op.value('type'))) type <- ctx$op.value('type')
what <- '([.][0-9])[.][0-9]'
if(!is.null(ctx$op.value('what'))) type <- ctx$op.value('what')
by <- "\\1"
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