@implementation MPSCNNConvolutionNode(TCMPSLayerHelper)

- (void)setTc_weightsData:()TCMPSLayerHelper
{
  objc_setAssociatedObject(a1, &kWeightsKey, a3, (void *)0x301);
}

- (id)tc_weightsData
{
  return objc_getAssociatedObject(a1, &kWeightsKey);
}

+ (id)createConvolutional:()TCMPSLayerHelper kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:
{
  id v18;
  TCMPSConvolutionWeights *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  double v26;
  TCMPSConvolutionWeights *v27;
  void *v28;
  TCMPSConvolutionPadding *v29;
  uint64_t v31;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _BYTE v41[4];
  __int128 v42;
  uint64_t v43;
  int v44;

  v36 = a3;
  v38 = a12;
  v37 = a13;
  v39 = a14;
  v40 = a16;
  v18 = a17;
  v19 = [TCMPSConvolutionWeights alloc];
  v20 = objc_retainAutorelease(v39);
  v21 = objc_msgSend(v20, "UTF8String");
  v22 = objc_retainAutorelease(v38);
  v23 = objc_msgSend(v22, "bytes");
  v24 = objc_retainAutorelease(v37);
  v25 = objc_msgSend(v24, "bytes");
  v41[0] = 0;
  v42 = xmmword_2186C17F0;
  v43 = 0x3F7FBE773F666666;
  v44 = 841731191;
  LOBYTE(v31) = a15;
  LODWORD(v26) = 0;
  v27 = -[TCMPSConvolutionWeights initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:](v19, "initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:", a4, a5, a6, a7, 0, a8, 0.0077500008, v26, a9, v21, v40, v18, v31, v23, v25, v41);
  objc_msgSend(MEMORY[0x24BDDE270], "nodeWithSource:weights:", v36, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[TCMPSConvolutionPadding initWithParams:paddingHeight:strideWidth:strideHeight:]([TCMPSConvolutionPadding alloc], "initWithParams:paddingHeight:strideWidth:strideHeight:", a10, a11, a8, a9);
  objc_msgSend(v28, "setPaddingPolicy:", v29);
  objc_msgSend(v28, "setTc_weightsData:", v27);

  return v28;
}

@end
