source("SupportVectorMachineUtils.R")
library(e1071)

#reading testing set data
supportVectorMachineTestingSet <- readRDS("SupportVectorMachineTestingSet.RDS")

#feature scaling
supportVectorMachineTestingSet[-3] = scale(supportVectorMachineTestingSet[-3])

#reading SupportVectorMachine model
supportVectorMachineModel = readRDS("SupportVectorMachineModel.RDS")

#predicting testing set result.
y_pred = predict(supportVectorMachineModel ,newdata = supportVectorMachineTestingSet[-3])

#Saving prediced values for testing set
saveSupportVectorMachinePredictedValuesForTestingSet(y_pred)

