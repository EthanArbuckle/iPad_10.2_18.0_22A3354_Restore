@implementation PHAPrivateFederatedLearningModelTrainerResponse

- (PHAPrivateFederatedLearningModelTrainerResponse)initWithParameterDeltas:(id)a3 trainingLossesPerEpoch:(id)a4 trainingAccuraciesPerEpoch:(id)a5 trainingEpochs:(unint64_t)a6 numberOfTrainingSamples:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  PHAPrivateFederatedLearningModelTrainerResponse *v16;
  PHAPrivateFederatedLearningModelTrainerResponse *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHAPrivateFederatedLearningModelTrainerResponse;
  v16 = -[PHAPrivateFederatedLearningModelTrainerResponse init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parameterDeltas, a3);
    objc_storeStrong((id *)&v17->_trainingLossesPerEpoch, a4);
    objc_storeStrong((id *)&v17->_trainingAccuraciesPerEpoch, a5);
    v17->_trainingEpochs = a6;
    v17->_numberOfTrainingSamples = a7;
  }

  return v17;
}

- (NSArray)parameterDeltas
{
  return self->_parameterDeltas;
}

- (void)setParameterDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_parameterDeltas, a3);
}

- (NSArray)trainingLossesPerEpoch
{
  return self->_trainingLossesPerEpoch;
}

- (void)setTrainingLossesPerEpoch:(id)a3
{
  objc_storeStrong((id *)&self->_trainingLossesPerEpoch, a3);
}

- (NSArray)trainingAccuraciesPerEpoch
{
  return self->_trainingAccuraciesPerEpoch;
}

- (void)setTrainingAccuraciesPerEpoch:(id)a3
{
  objc_storeStrong((id *)&self->_trainingAccuraciesPerEpoch, a3);
}

- (unint64_t)trainingEpochs
{
  return self->_trainingEpochs;
}

- (void)setTrainingEpochs:(unint64_t)a3
{
  self->_trainingEpochs = a3;
}

- (unint64_t)numberOfTrainingSamples
{
  return self->_numberOfTrainingSamples;
}

- (void)setNumberOfTrainingSamples:(unint64_t)a3
{
  self->_numberOfTrainingSamples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingAccuraciesPerEpoch, 0);
  objc_storeStrong((id *)&self->_trainingLossesPerEpoch, 0);
  objc_storeStrong((id *)&self->_parameterDeltas, 0);
}

@end
