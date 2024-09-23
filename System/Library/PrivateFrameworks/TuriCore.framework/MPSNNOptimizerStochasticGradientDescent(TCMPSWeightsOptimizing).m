@implementation MPSNNOptimizerStochasticGradientDescent(TCMPSWeightsOptimizing)

- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing convolutionGradientState:convolutionWeights:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "weightMomentumVector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(v10, "biasMomentumVector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeToCommandBuffer:convolutionGradientState:convolutionSourceState:inputMomentumVectors:resultState:", v8, v9, v11, v14, v15);

}

- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing batchNormalizationState:batchNormData:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "gammaMomentumVector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(v10, "betaMomentumVector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gammaBetaState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeToCommandBuffer:batchNormalizationState:inputMomentumVectors:resultState:", v8, v9, v13, v14);

}

@end
