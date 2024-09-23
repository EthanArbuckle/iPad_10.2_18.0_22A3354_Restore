@implementation PHAPrivateFederatedLearningLayerParameters

- (PHAPrivateFederatedLearningLayerParameters)initWithWeights:(id)a3 bias:(id)a4
{
  id v7;
  id v8;
  PHAPrivateFederatedLearningLayerParameters *v9;
  PHAPrivateFederatedLearningLayerParameters *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningLayerParameters;
  v9 = -[PHAPrivateFederatedLearningLayerParameters init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weights, a3);
    objc_storeStrong((id *)&v10->_bias, a4);
  }

  return v10;
}

- (MAFloatVector)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (MAFloatVector)bias
{
  return self->_bias;
}

- (void)setBias:(id)a3
{
  objc_storeStrong((id *)&self->_bias, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bias, 0);
  objc_storeStrong((id *)&self->_weights, 0);
}

@end
