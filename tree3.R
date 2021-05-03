library(rpart)
library(tidyverse)
library(caret)
library(Rborist)

n <- 1000
sigma <- 0.25
set.seed(1)
x <- rnorm(n, 0, 1)
y <- 0.75 * x + rnorm(n, 0, sigma)
dat <- data.frame(x = x, y = y)
grid <- expand.grid(minNode = seq(25, 100, 25),predFixed = 1)
#library(randomForest)
fit_rf <- train(y ~ x,method = "Rborist",tuneGrid= grid,data = dat)
dat %>% 
  mutate(y_hat = predict(fit_rf)) %>% 
  ggplot() +
  geom_point(aes(x, y)) +
  geom_step(aes(x, y_hat), col = 2)
plot(fit_rf)