@implementation PHAPrivateFederatedLearningCoreModelTrainerResponse

- (PHAPrivateFederatedLearningCoreModelTrainerResponse)initWithDataPackage:(id)a3 trainingMetrics:(id)a4
{
  id v7;
  id v8;
  PHAPrivateFederatedLearningCoreModelTrainerResponse *v9;
  PHAPrivateFederatedLearningCoreModelTrainerResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningCoreModelTrainerResponse;
  v9 = -[PHAPrivateFederatedLearningCoreModelTrainerResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataPackage, a3);
    objc_storeStrong((id *)&v10->_trainingMetrics, a4);
  }

  return v10;
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
