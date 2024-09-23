@implementation PHACurareShadowEvaluationRecipeOptions

- (PHACurareShadowEvaluationRecipeOptions)init
{
  PHACurareShadowEvaluationRecipeOptions *v2;
  PHACurareShadowEvaluationRecipeOptions *v3;
  NSString *trialDeploymentID;
  NSString *trialExperimentID;
  NSString *trialTreatmentID;
  NSArray *v7;
  NSArray *modelInfoArray;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHACurareShadowEvaluationRecipeOptions;
  v2 = -[PHAPrivateFederatedLearningRecipeOptions init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    trialDeploymentID = v2->_trialDeploymentID;
    v2->_trialDeploymentID = 0;

    trialExperimentID = v3->_trialExperimentID;
    v3->_trialExperimentID = 0;

    trialTreatmentID = v3->_trialTreatmentID;
    v3->_trialTreatmentID = 0;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    modelInfoArray = v3->_modelInfoArray;
    v3->_modelInfoArray = v7;

  }
  return v3;
}

- (NSString)trialDeploymentID
{
  return self->_trialDeploymentID;
}

- (void)setTrialDeploymentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialDeploymentID, a3);
}

- (NSString)trialExperimentID
{
  return self->_trialExperimentID;
}

- (void)setTrialExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperimentID, a3);
}

- (NSString)trialTreatmentID
{
  return self->_trialTreatmentID;
}

- (void)setTrialTreatmentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentID, a3);
}

- (NSArray)modelInfoArray
{
  return self->_modelInfoArray;
}

- (void)setModelInfoArray:(id)a3
{
  objc_storeStrong((id *)&self->_modelInfoArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelInfoArray, 0);
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialDeploymentID, 0);
}

@end
