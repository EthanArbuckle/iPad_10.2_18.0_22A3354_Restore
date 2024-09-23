@implementation RangeBiasEstimatorInput

- (RangeBiasEstimatorInput)initWithData:(id)a3
{
  id v5;

  v5 = a3;
  if (self)
    objc_storeStrong((id *)&self->_data, a3);

  return self;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10082BE00);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("input")))
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", self->_data));
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
