source("SupportVectorMachineUtils.R")
library(e1071)

#reading training set 
supportVectorMachineTrainingSet <- readRDS("SupportVectorMachineTrainingSet.RDS")

#feature scaling
supportVectorMachineTrainingSet[-3] = scale(supportVectorMachineTrainingSet[-3])

# Fitting SupportVectorMachine to the Training set
supportVectorMachine = svm(formula = Purchased ~ .,
                           data = supportVectorMachineTrainingSet,
                           type = 'C-classification',
                           kernel = 'linear')

#saving SupportVectorMachine model
saveSupportVectorMachineModel(supportVectorMachine)
