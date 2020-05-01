source("SupportVectorMachineUtils.R")

#reading SupportVectorMachine model
supportVectorMachineModel = readRDS("SupportVectorMachineModel.RDS")

#reading testing set data
supportVectorMachineTestingSet <- readRDS("SupportVectorMachineTestingSet.RDS")

#reading predicted values of the testing set
supportVectorMachinePredictedValuesForTestingSet <- readRDS("SupportVectorMachinePredictedValuesForTestingSet.RDS")

supportVectorMachineConfusionMatrix = table(supportVectorMachineTestingSet[, 3], supportVectorMachinePredictedValuesForTestingSet)

supportVectorMachineConfusionMatrix

#    0  1
# 0 59  5
# 1  9 27
