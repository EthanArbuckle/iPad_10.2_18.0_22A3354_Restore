@implementation state_estimation_modelOutput

- (state_estimation_modelOutput)initWithHealth_state_estimation:(id)a3
{
  id v5;
  state_estimation_modelOutput *v6;
  state_estimation_modelOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)state_estimation_modelOutput;
  v6 = -[state_estimation_modelOutput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_health_state_estimation, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F188);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("health_state_estimation")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[state_estimation_modelOutput health_state_estimation](self, "health_state_estimation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)health_state_estimation
{
  return self->_health_state_estimation;
}

- (void)setHealth_state_estimation:(id)a3
{
  objc_storeStrong((id *)&self->_health_state_estimation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_health_state_estimation, 0);
}

@end
