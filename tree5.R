library(devtools)
#devtools::install_bioc("genefilter")
library(dplyr)
library(genefilter)
library(caret)
library(rpart)
library(dslabs)
data("tissue_gene_expression")
set.seed(1991)
data("tissue_gene_expression")

fit_rpart <- with(tissue_gene_expression, 
                  train(x, y, method = "rpart",
                        tuneGrid = data.frame(cp = seq(0, 0.10, 0.01)),
                        control = rpart.control(minsplit = 0)))
ggplot(fit_rpart)
confusionMatrix(fit_rpart)
plot(fit_rpart$finalModel,margin= 0.1)
text(fit_rpart$finalModel,cex=0.75)