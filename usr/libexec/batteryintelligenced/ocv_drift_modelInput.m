@implementation ocv_drift_modelInput

- (ocv_drift_modelInput)initWithInput:(id)a3
{
  id v5;
  ocv_drift_modelInput *v6;
  ocv_drift_modelInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ocv_drift_modelInput;
  v6 = -[ocv_drift_modelInput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_Input, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F1A0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Input")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ocv_drift_modelInput Input](self, "Input"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)Input
{
  return self->_Input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_Input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Input, 0);
}

@end
