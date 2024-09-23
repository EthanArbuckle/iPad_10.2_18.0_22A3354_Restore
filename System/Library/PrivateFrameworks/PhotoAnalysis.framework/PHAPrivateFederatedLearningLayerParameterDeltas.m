@implementation PHAPrivateFederatedLearningLayerParameterDeltas

- (PHAPrivateFederatedLearningLayerParameterDeltas)initWithWeightDeltas:(id)a3 biasDeltas:(id)a4
{
  id v7;
  id v8;
  PHAPrivateFederatedLearningLayerParameterDeltas *v9;
  PHAPrivateFederatedLearningLayerParameterDeltas *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningLayerParameterDeltas;
  v9 = -[PHAPrivateFederatedLearningLayerParameterDeltas init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weightDeltas, a3);
    objc_storeStrong((id *)&v10->_biasDeltas, a4);
  }

  return v10;
}

- (MAFloatVector)weightDeltas
{
  return self->_weightDeltas;
}

- (void)setWeightDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_weightDeltas, a3);
}

- (MAFloatVector)biasDeltas
{
  return self->_biasDeltas;
}

- (void)setBiasDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_biasDeltas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasDeltas, 0);
  objc_storeStrong((id *)&self->_weightDeltas, 0);
}

+ (id)deltasFromLayerParameters:(id)a3 toLayerParameters:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  objc_msgSend(v7, "weights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vectorBySubtractingVector:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bias");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bias");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "vectorBySubtractingVector:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v8, "initWithWeightDeltas:biasDeltas:", v11, v14);

  return v15;
}

@end
