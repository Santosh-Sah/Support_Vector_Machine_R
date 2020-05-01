source("SupportVectorMachineUtils.R")
library(e1071)

#reading SupportVectorMachine model
supportVectorMachineModel = readRDS("SupportVectorMachineModel.RDS")

inputValue <- data.frame(Age = c(28,30), EstimatedSalary = c(43000,30000))
inputValue[, 1:2] = scale(inputValue[, 1:2])


#predicting testing set result.
y_pred = predict(supportVectorMachineModel, newdata = inputValue)

y_pred
