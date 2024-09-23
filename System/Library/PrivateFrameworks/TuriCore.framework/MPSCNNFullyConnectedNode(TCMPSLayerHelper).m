@implementation MPSCNNFullyConnectedNode(TCMPSLayerHelper)

- (void)setTc_weightsData:()TCMPSLayerHelper
{
  objc_setAssociatedObject(a1, &kWeightsKey, a3, (void *)0x301);
}

- (id)tc_weightsData
{
  return objc_getAssociatedObject(a1, &kWeightsKey);
}

+ (id)createFullyConnected:()TCMPSLayerHelper inputFeatureChannels:outputFeatureChannels:inputHeight:inputWidth:weights:biases:label:updateWeights:device:cmdQueue:
{
  id v15;
  id v16;
  TCMPSConvolutionWeights *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  double v24;
  TCMPSConvolutionWeights *v25;
  void *v26;
  uint64_t v28;
  id v32;
  id v33;
  id v34;
  id v35;
  _BYTE v36[4];
  __int128 v37;
  uint64_t v38;
  int v39;

  v32 = a3;
  v34 = a8;
  v33 = a9;
  v35 = a10;
  v15 = a12;
  v16 = a13;
  v17 = [TCMPSConvolutionWeights alloc];
  v18 = objc_retainAutorelease(v35);
  v19 = objc_msgSend(v18, "UTF8String");
  v20 = objc_retainAutorelease(v34);
  v21 = objc_msgSend(v20, "bytes");
  v22 = objc_retainAutorelease(v33);
  v23 = objc_msgSend(v22, "bytes");
  v36[0] = 0;
  v37 = xmmword_2186C17F0;
  v38 = 0x3F7FBE773F666666;
  v39 = 841731191;
  LOBYTE(v28) = a11;
  LODWORD(v24) = 0;
  v25 = -[TCMPSConvolutionWeights initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:](v17, "initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:", a7, a6, a4, a5, 0, 1, 0.0077500008, v24, 1, v19, v15, v16, v28, v21, v23, v36);
  objc_msgSend(MEMORY[0x24BDDE290], "nodeWithSource:weights:", v32, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTc_weightsData:", v25);

  return v26;
}

@end
