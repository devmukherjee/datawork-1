library(rpart)
library(tidyverse)
n <- 1000
sigma <- 0.25
set.seed(1)
x <- rnorm(n, 0, 1)
y <- 0.75 * x + rnorm(n, 0, sigma)
dat <- data.frame(x = x, y = y)
library(randomForest)
fit <- randomForest(y ~ x, data = dat)
  dat %>% 
  mutate(y_hat = predict(fit)) %>% 
  ggplot() +
  geom_point(aes(x, y)) +
  geom_step(aes(x, y_hat), col = 2)
plot(fit)
