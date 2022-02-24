library(tercen)
library(dplyr)
library(tidyr)

options("tercen.workflowId" = "19975e0adc3267c4665f02d347003604")
options("tercen.stepId"     = "c5f084df-dd2a-449b-8630-00e5b9007f9c")

ctx = tercenCtx()

if (length(ctx$rnames) != 1) stop("One and only one row factor is required.") 

type <- "all"
if(!is.null(ctx$op.value('type'))) type <- ctx$op.value('type')
what <- 'var'
if(!is.null(ctx$op.value('what'))) type <- ctx$op.value('what')
by <- "value"
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