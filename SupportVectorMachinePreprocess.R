source("SupportVectorMachineUtils.R")

supportVectorMachineDatasetList <- importSupportVectorMachineDataset("Support_Vector_Machine_Social_Network_Ads.csv")

saveTrainingAndTestingDataset(supportVectorMachineDatasetList[[1]], supportVectorMachineDatasetList[[2]])
