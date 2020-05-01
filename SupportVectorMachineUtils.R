importSupportVectorMachineDataset <- function(supportVectorMachineDatasetFileName) {
  
  #importing dataset
  supportVectorMachineDataset = read.csv(supportVectorMachineDatasetFileName)
  
  #getting the required columns
  supportVectorMachineDataset = supportVectorMachineDataset[3:5]
  
  #encoding target feature as factor
  supportVectorMachineDataset$Purchased = factor(supportVectorMachineDataset$Purchased, levels = c(0, 1))
  
  #splitting the dataset into training set and testing set
  library(caTools)
  set.seed(1234)
  
  supportVectorMachineDatasetSlpit = sample.split(supportVectorMachineDataset$Purchased, SplitRatio = 0.75)
  
  supportVectorMachineTrainingSet = subset(supportVectorMachineDataset, supportVectorMachineDatasetSlpit == TRUE)
  
  supportVectorMachineTestingSet = subset(supportVectorMachineDataset, supportVectorMachineDatasetSlpit == FALSE)
  
  
  returnList <- list(supportVectorMachineTrainingSet, supportVectorMachineTestingSet)
  
  return (returnList)
  
}

#saving training and testing set
saveTrainingAndTestingDataset <- function(supportVectorMachineTrainingSet, supportVectorMachineTestingSet){
  
  saveRDS(supportVectorMachineTrainingSet, file = "SupportVectorMachineTrainingSet.RDS")
  saveRDS(supportVectorMachineTestingSet, file = "SupportVectorMachineTestingSet.RDS")
  
}

#Save SupportVectorMachine Model
saveSupportVectorMachineModel <- function(supportVectorMachineModel) {
  
  saveRDS(supportVectorMachineModel, file = "SupportVectorMachineModel.RDS")
}

#Save prediced values for testing set
saveSupportVectorMachinePredictedValuesForTestingSet <- function(supportVectorMachinePredictedValuesForTestingSet) {
  
  saveRDS(supportVectorMachinePredictedValuesForTestingSet, file = "SupportVectorMachinePredictedValuesForTestingSet.RDS")
}
