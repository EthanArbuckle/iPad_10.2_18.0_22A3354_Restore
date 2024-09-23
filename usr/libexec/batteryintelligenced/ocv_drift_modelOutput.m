@implementation ocv_drift_modelOutput

- (ocv_drift_modelOutput)initWithPrediction:(id)a3
{
  id v5;
  ocv_drift_modelOutput *v6;
  ocv_drift_modelOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ocv_drift_modelOutput;
  v6 = -[ocv_drift_modelOutput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_Prediction, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F1B8);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Prediction")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ocv_drift_modelOutput Prediction](self, "Prediction"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)Prediction
{
  return self->_Prediction;
}

- (void)setPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_Prediction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Prediction, 0);
}

@end
