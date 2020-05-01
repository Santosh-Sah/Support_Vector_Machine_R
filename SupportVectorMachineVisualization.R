source("SupportVectorMachineUtils.R")
library(ggplot2)
library(ElemStatLearn)

#reading training set 
supportVectorMachineTrainingSet <- readRDS("SupportVectorMachineTrainingSet.RDS")

#reading testing set data
supportVectorMachineTestingSet <- readRDS("SupportVectorMachineTestingSet.RDS")

#reading SupportVectorMachine model
supportVectorMachineModel = readRDS("SupportVectorMachineModel.RDS")

#visualizing training set result
#It will take huge memory. If the system is not advance it will give memory error
visualisingTrainingSetResult <- function(supportVectorMachineTrainingSet, supportVectorMachineModel){
  
  set = supportVectorMachineTrainingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.5)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.5)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  prob_set = predict(supportVectorMachineModel, newdata = grid_set)
  y_grid = ifelse(prob_set > 0.5, 1, 0)
  plot(set[, -3],
       main = 'Support Vector Machine (Training set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  ggsave("SupportVectorMachineTrainingsetResult.png")
  
}

#visualizing testing set result
visualisingTestingSetResult <- function(supportVectorMachineTestingSet, supportVectorMachineModel){
  
  set = linearRegressionTestingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  prob_set = predict(supportVectorMachineModel, newdata = grid_set)
  y_grid = ifelse(prob_set > 0.5, 1, 0)
  plot(set[, -3],
       main = 'Support Vector Machine (Test set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  ggsave("SupportVectorMachineTestingsetResult.png")
  
}

visualisingTrainingSetResult(supportVectorMachineTrainingSet, supportVectorMachineModel)
visualisingTestingSetResult(supportVectorMachineTestingSet, supportVectorMachineModel)