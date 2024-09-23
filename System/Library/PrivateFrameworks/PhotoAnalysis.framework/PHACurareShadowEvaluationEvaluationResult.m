@implementation PHACurareShadowEvaluationEvaluationResult

- (PHACurareShadowEvaluationEvaluationResult)initWithModelPath:(id)a3 isPositiveData:(BOOL)a4 numberOfTotalSamples:(id)a5 numberOfCorrectSamples:(id)a6 meanPredictionValue:(id)a7 stddevPredictionValue:(id)a8
{
  id v14;
  id v15;
  PHACurareShadowEvaluationEvaluationResult *v16;
  void *v17;
  uint64_t v18;
  NSString *modelName;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v14 = a3;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v15 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PHACurareShadowEvaluationEvaluationResult;
  v16 = -[PHACurareShadowEvaluationEvaluationResult init](&v24, sel_init);
  if (v16)
  {
    objc_msgSend(v14, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByDeletingPathExtension");
    v18 = objc_claimAutoreleasedReturnValue();
    modelName = v16->_modelName;
    v16->_modelName = (NSString *)v18;

    v16->_isPositiveData = a4;
    objc_storeStrong((id *)&v16->_numberOfTotalSamples, a5);
    objc_storeStrong((id *)&v16->_numberOfCorrectSamples, a6);
    objc_storeStrong((id *)&v16->_meanPredictionValue, a7);
    objc_storeStrong((id *)&v16->_stddevPredictionValue, a8);
  }

  return v16;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (BOOL)isPositiveData
{
  return self->_isPositiveData;
}

- (void)setIsPositiveData:(BOOL)a3
{
  self->_isPositiveData = a3;
}

- (NSNumber)numberOfTotalSamples
{
  return self->_numberOfTotalSamples;
}

- (void)setNumberOfTotalSamples:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfTotalSamples, a3);
}

- (NSNumber)numberOfCorrectSamples
{
  return self->_numberOfCorrectSamples;
}

- (void)setNumberOfCorrectSamples:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfCorrectSamples, a3);
}

- (NSNumber)meanPredictionValue
{
  return self->_meanPredictionValue;
}

- (void)setMeanPredictionValue:(id)a3
{
  objc_storeStrong((id *)&self->_meanPredictionValue, a3);
}

- (NSNumber)stddevPredictionValue
{
  return self->_stddevPredictionValue;
}

- (void)setStddevPredictionValue:(id)a3
{
  objc_storeStrong((id *)&self->_stddevPredictionValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stddevPredictionValue, 0);
  objc_storeStrong((id *)&self->_meanPredictionValue, 0);
  objc_storeStrong((id *)&self->_numberOfCorrectSamples, 0);
  objc_storeStrong((id *)&self->_numberOfTotalSamples, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end
