library(devtools)
#devtools::install_bioc("genefilter")
library(dplyr)
library(genefilter)
library(caret)
library(rpart)
library(dslabs)
library(randomForest)

data("tissue_gene_expression")
set.seed(1991)
data("tissue_gene_expression")

fit_rpart <- with(tissue_gene_expression, 
                  train(x, y, method = "rf",
                        tuneGrid = data.frame(mtry = seq(50, 200, 25)),method.args = list(nodesize = 1)))

#ggplot(fit_rpart)
#confusionMatrix(fit_rpart)
imp <- varImp(fit_rpart)
imp
tree_terms <- as.character(unique(fit_rpart$finalModel$frame$var[!(fit_rpart$finalModel$frame$var == "<leaf>")]))
tree_terms



