@implementation PHAPrivateFederatedLearningRunnerResponse

- (PHAPrivateFederatedLearningRunnerResponse)initWithDataPackage:(id)a3 layersToTrain:(id)a4 trainingLossesPerEpoch:(id)a5 trainingAccuraciesPerEpoch:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *trainingMetrics;
  const __CFString *v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_dataPackage, a3);
  v11 = a3;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v20 = v13;
  v21[0] = CFSTR("TrainingLosses");
  v19 = CFSTR("losses");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  v22[1] = v12;
  v21[1] = CFSTR("TrainingAccuracies");
  v21[2] = CFSTR("UpdatedModelIndices");
  v22[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  trainingMetrics = self->_trainingMetrics;
  self->_trainingMetrics = v16;

  return self;
}

- (PHAPrivateFederatedLearningRunnerResponse)initWithDataPackage:(id)a3 trainingMetrics:(id)a4
{
  NSData *v6;
  NSDictionary *v7;
  NSData *dataPackage;
  NSData *v9;
  NSDictionary *trainingMetrics;

  v6 = (NSData *)a3;
  v7 = (NSDictionary *)a4;
  dataPackage = self->_dataPackage;
  self->_dataPackage = v6;
  v9 = v6;

  trainingMetrics = self->_trainingMetrics;
  self->_trainingMetrics = v7;

  return self;
}

- (NSData)dataPackage
{
  return self->_dataPackage;
}

- (void)setDataPackage:(id)a3
{
  objc_storeStrong((id *)&self->_dataPackage, a3);
}

- (NSDictionary)trainingMetrics
{
  return self->_trainingMetrics;
}

- (void)setTrainingMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_trainingMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingMetrics, 0);
  objc_storeStrong((id *)&self->_dataPackage, 0);
}

@end
