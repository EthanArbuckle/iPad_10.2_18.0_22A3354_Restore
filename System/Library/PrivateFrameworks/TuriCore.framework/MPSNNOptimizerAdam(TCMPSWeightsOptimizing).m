@implementation MPSNNOptimizerAdam(TCMPSWeightsOptimizing)

- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing convolutionGradientState:convolutionWeights:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v8 = a5;
  objc_msgSend(v8, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "weightMomentumVector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(v8, "biasMomentumVector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "weightVelocityVector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(v8, "biasVelocityVector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeToCommandBuffer:convolutionGradientState:convolutionSourceState:inputMomentumVectors:inputVelocityVectors:resultState:", v17, v18, v9, v12, v15, v16);

}

- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing batchNormalizationState:batchNormData:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "gammaMomentumVector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(v9, "betaMomentumVector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gammaVelocityVector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  objc_msgSend(v9, "betaVelocityVector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gammaBetaState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeToCommandBuffer:batchNormalizationState:inputMomentumVectors:inputVelocityVectors:resultState:", v17, v8, v12, v15, v16);

}

@end
