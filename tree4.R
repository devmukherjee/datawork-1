library(rpart)
library(tidyverse)
library(caret)
library(dslabs)
data("tissue_gene_expression")
test_index <- createDataPartition(y = tissue_gene_expression$y,times = 1,p= 0.5,list = FALSE)

x1 <- tissue_gene_expression$x[-test_index,]
y1 <- tissue_gene_expression$y[-test_index]
x2 <- tissue_gene_expression$x[test_index,]
y2 <- tissue_gene_expression$y[test_index]
fit_1 <- train(x1, y1, method = "rpart", tuneGrid = data.frame(cp =seq(0, 0.1, 0.01)))
ggplot(fit_1)
#y_hat = predict(fit_1,data=x2,type = "raw")
cm <- confusionMatrix(predict(fit_1,x2,type = "raw"),reference = y2)
print(cm)

#dat %>% 
  #mutate(y_hat = predict(fit_rf)) %>% 
  #ggplot() +
  #geom_point(aes(x, y)) +
  #geom_step(aes(x, y_hat), col = 2)
#plot(fit_rf)