@implementation TCMPSConvolutionWeights

- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 neuronA:(float)a8 neuronB:(float)a9 stride:(unint64_t)a10 kernelParamsBinaryName:(const char *)a11 device:(id)a12 cmd_queue:(id)a13 init_weight_ptr:(float *)a14 init_bias_ptr:(float *)a15 optimizerOptions:(OptimizerOptions *)a16
{
  __int128 v16;
  _OWORD v18[2];

  v16 = *(_OWORD *)&a16->sgdMomentum;
  v18[0] = *(_OWORD *)&a16->useSGD;
  v18[1] = v16;
  return -[TCMPSConvolutionWeights initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:init_weight_ptr:init_bias_ptr:optimizerOptions:](self, "initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:init_weight_ptr:init_bias_ptr:optimizerOptions:", a3, a4, a5, a6, *(_QWORD *)&a7, a10, a11, a12, a13, a14, a15, v18);
}

- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 strideX:(unint64_t)a8 strideY:(unint64_t)a9 neuronA:(float)a10 neuronB:(float)a11 kernelParamsBinaryName:(const char *)a12 device:(id)a13 cmd_queue:(id)a14 init_weight_ptr:(float *)a15 init_bias_ptr:(float *)a16 optimizerOptions:(OptimizerOptions *)a17
{
  __int128 v17;
  uint64_t v19;
  _OWORD v20[2];

  v17 = *(_OWORD *)&a17->sgdMomentum;
  v20[0] = *(_OWORD *)&a17->useSGD;
  v20[1] = v17;
  LOBYTE(v19) = 1;
  return -[TCMPSConvolutionWeights initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:](self, "initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:", a3, a4, a5, a6, *(_QWORD *)&a7, a8, a9, a12, a13, a14, v19, a15, a16, v20);
}

- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 strideX:(unint64_t)a8 strideY:(unint64_t)a9 neuronA:(float)a10 neuronB:(float)a11 kernelParamsBinaryName:(const char *)a12 device:(id)a13 cmd_queue:(id)a14 updateWeights:(BOOL)a15 init_weight_ptr:(float *)a16 init_bias_ptr:(float *)a17 optimizerOptions:(OptimizerOptions *)a18
{
  uint64_t v21;
  id v27;
  TCMPSConvolutionWeights *v28;
  TCMPSConvolutionWeights *v29;
  __int128 v30;
  uint64_t v31;
  MPSCNNConvolutionDescriptor *convDesc;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  double v44;
  uint64_t v45;
  id v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  MTLBuffer *weightMomentumBuffer;
  unint64_t v53;
  uint64_t v54;
  MTLBuffer *weightVelocityBuffer;
  unint64_t outputFeatureChannels;
  uint64_t v57;
  MTLBuffer *biasVelocityBuffer;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  MTLBuffer *biasMomentumBuffer;
  uint64_t v63;
  MTLCommandQueue *cq;
  void *v65;
  uint64_t v66;
  MPSCNNConvolutionWeightsAndBiasesState *state;
  uint64_t v68;
  TCMPSConvolutionWeightsOptimizing *optimizer;
  void *v70;
  uint64_t v71;
  MPSVector *weightMomentumVector;
  uint64_t v73;
  MPSVector *weightVelocityVector;
  TCMPSConvolutionWeights *v75;
  id v77;
  objc_super v78;

  v21 = *(_QWORD *)&a7;
  v27 = a13;
  v77 = a14;
  v78.receiver = self;
  v78.super_class = (Class)TCMPSConvolutionWeights;
  v28 = -[TCMPSConvolutionWeights init](&v78, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->weightBuffer, a14);
    v30 = *(_OWORD *)&a18->useSGD;
    *(_OWORD *)&v29->_optimizerOptions.useSGD = *(_OWORD *)&a18->sgdMomentum;
    *(_OWORD *)((char *)&v29->sizeBias + 4) = v30;
    LOBYTE(v29->biasBuffer) = a15;
    v29->_outputFeatureChannels = a6;
    v29->_inputFeatureChannels = a5;
    v29->_kernelHeight = a4;
    v29->_kernelWidth = a3;
    MEMORY[0x219A19390](&v29->_kernelParamsBinaryName, a12);
    objc_msgSend(MEMORY[0x24BDDE260], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", a3, a4, a5, a6);
    v31 = objc_claimAutoreleasedReturnValue();
    convDesc = v29->_convDesc;
    v29->_convDesc = (MPSCNNConvolutionDescriptor *)v31;

    -[MPSCNNConvolutionDescriptor setStrideInPixelsX:](v29->_convDesc, "setStrideInPixelsX:", a8);
    -[MPSCNNConvolutionDescriptor setStrideInPixelsY:](v29->_convDesc, "setStrideInPixelsY:", a9);
    *(float *)&v33 = a10;
    *(float *)&v34 = a11;
    objc_msgSend(MEMORY[0x24BDDE4B8], "cnnNeuronDescriptorWithType:a:b:", v21, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSCNNConvolutionDescriptor setFusedNeuronDescriptor:](v29->_convDesc, "setFusedNeuronDescriptor:", v35);
    v36 = 4 * v29->_outputFeatureChannels;
    v37 = v36 * v29->_inputFeatureChannels * v29->_kernelHeight * v29->_kernelWidth;
    *(_QWORD *)&v29->_kernelParamsBinaryName.__r_.var0 = v36;
    v29->_kernelParamsBinaryName.var0 = v37;
    LODWORD(v38) = HIDWORD(v29->sizeWeights);
    LODWORD(v39) = v29->sizeWeights;
    *(float *)&v40 = -*(float *)&v38;
    LODWORD(v41) = 1.0;
    objc_msgSend(MEMORY[0x24BDDE4C8], "optimizerDescriptorWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:", *(float *)&v38 > 0.0, 2 * (*(float *)&v29->_seed != 0.0), v39, v41, v38, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (BYTE4(v29->sizeBias))
    {
      v43 = objc_alloc(MEMORY[0x24BDDE4D0]);
      LODWORD(v44) = *(_DWORD *)&v29->_optimizerOptions.useSGD;
      v45 = objc_msgSend(v43, "initWithDevice:momentumScale:useNestrovMomentum:optimizerDescriptor:", v27, 0, v42, v44);
    }
    else
    {
      v46 = objc_alloc(MEMORY[0x24BDDE4C0]);
      *(float *)&v47 = v29->_optimizerOptions.weightDecay;
      v45 = objc_msgSend(v46, "initWithDevice:beta1:beta2:epsilon:timeStep:optimizerDescriptor:", v27, 0, v42, v29->_optimizerOptions.learningRate, v29->_optimizerOptions.gradientClipping, v47);
    }
    v48 = *(void **)&v29->_updateWeights;
    *(_QWORD *)&v29->_updateWeights = v45;

    v49 = objc_msgSend(v27, "newBufferWithLength:options:", 4 * v29->_inputFeatureChannels * v29->_kernelHeight * v29->_kernelWidth * v29->_outputFeatureChannels, 0);
    v50 = *(void **)&v29->_optimizerOptions.adamBeta1;
    *(_QWORD *)&v29->_optimizerOptions.adamBeta1 = v49;

    v51 = objc_msgSend(v27, "newBufferWithLength:options:", 4 * v29->_inputFeatureChannels * v29->_kernelHeight * v29->_kernelWidth * v29->_outputFeatureChannels, 0);
    weightMomentumBuffer = v29->weightMomentumBuffer;
    v29->weightMomentumBuffer = (MTLBuffer *)v51;

    v53 = v29->_inputFeatureChannels * v29->_kernelHeight * v29->_kernelWidth * v29->_outputFeatureChannels;
    if (a16)
      v54 = objc_msgSend(v27, "newBufferWithBytes:length:options:", a16, 4 * v53, 0);
    else
      v54 = objc_msgSend(v27, "newBufferWithLength:options:", 4 * v53, 0);
    weightVelocityBuffer = v29->weightVelocityBuffer;
    v29->weightVelocityBuffer = (MTLBuffer *)v54;

    outputFeatureChannels = v29->_outputFeatureChannels;
    if (a17)
      v57 = objc_msgSend(v27, "newBufferWithBytes:length:options:", a17, 4 * outputFeatureChannels, 0);
    else
      v57 = objc_msgSend(v27, "newBufferWithLength:options:", 4 * outputFeatureChannels, 0);
    biasVelocityBuffer = v29->biasVelocityBuffer;
    v29->biasVelocityBuffer = (MTLBuffer *)v57;

    v59 = objc_msgSend(v27, "newBufferWithLength:options:", 4 * v29->_outputFeatureChannels, 0);
    v60 = *(void **)&v29->_optimizerOptions.adamEpsilon;
    *(_QWORD *)&v29->_optimizerOptions.adamEpsilon = v59;

    v61 = objc_msgSend(v27, "newBufferWithLength:options:", 4 * v29->_outputFeatureChannels, 0);
    biasMomentumBuffer = v29->biasMomentumBuffer;
    v29->biasMomentumBuffer = (MTLBuffer *)v61;

    v63 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE278]), "initWithWeights:biases:", v29->weightVelocityBuffer, v29->biasVelocityBuffer);
    cq = v29->cq;
    v29->cq = (MTLCommandQueue *)v63;

    objc_msgSend(MEMORY[0x24BDDE510], "vectorDescriptorWithLength:dataType:", v29->_kernelHeight * v29->_inputFeatureChannels * v29->_kernelWidth * v29->_outputFeatureChannels, 268435488);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", *(_QWORD *)&v29->_optimizerOptions.adamBeta1, v65);
    state = v29->_state;
    v29->_state = (MPSCNNConvolutionWeightsAndBiasesState *)v66;

    v68 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", v29->weightMomentumBuffer, v65);
    optimizer = v29->_optimizer;
    v29->_optimizer = (TCMPSConvolutionWeightsOptimizing *)v68;

    objc_msgSend(MEMORY[0x24BDDE510], "vectorDescriptorWithLength:dataType:", v29->_outputFeatureChannels, 268435488);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", *(_QWORD *)&v29->_optimizerOptions.adamEpsilon, v70);
    weightMomentumVector = v29->_weightMomentumVector;
    v29->_weightMomentumVector = (MPSVector *)v71;

    v73 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", v29->biasMomentumBuffer, v70);
    weightVelocityVector = v29->_weightVelocityVector;
    v29->_weightVelocityVector = (MPSVector *)v73;

    v75 = v29;
  }

  return v29;
}

- (unsigned)dataType
{
  return 268435488;
}

- (void)setLearningRate:(float)a3
{
  objc_msgSend(*(id *)&self->_updateWeights, "setLearningRate:");
  *(float *)&self->sizeWeights = a3;
}

- (unint64_t)weightSize
{
  return (unint64_t)self->_kernelParamsBinaryName.var0 >> 2;
}

- (id)weightShape
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_outputFeatureChannels);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_kernelHeight);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_kernelWidth);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_inputFeatureChannels);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)biasSize
{
  return *(_QWORD *)&self->_kernelParamsBinaryName.__r_.var0 >> 2;
}

- (id)descriptor
{
  return self->_convDesc;
}

- (void)weights
{
  return (void *)-[MTLBuffer contents](self->weightVelocityBuffer, "contents");
}

- (float)biasTerms
{
  return (float *)-[MTLBuffer contents](self->biasVelocityBuffer, "contents");
}

- (BOOL)load
{
  -[TCMPSConvolutionWeights checkpointWithCommandQueue:](self, "checkpointWithCommandQueue:", self->weightBuffer);
  return 1;
}

- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (LOBYTE(self->biasBuffer))
  {
    -[TCMPSConvolutionWeights optimizer](self, "optimizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeToCommandBuffer:convolutionGradientState:convolutionWeights:", v6, v7, self);

  }
  -[TCMPSConvolutionWeights state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4 sourceState:(id)a5
{
  -[TCMPSConvolutionWeights updateWithCommandBuffer:gradientState:](self, "updateWithCommandBuffer:gradientState:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)set_cq:(id)a3
{
  objc_storeStrong((id *)&self->weightBuffer, a3);
}

- (void)checkpointWithCommandQueue:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "commandBuffer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blitCommandEncoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEncoding");
  objc_msgSend(v4, "commit");
  objc_msgSend(v4, "waitUntilCompleted");

}

- (void)loadWeight:(float *)a3
{
  memcpy((void *)-[MTLBuffer contents](self->weightVelocityBuffer, "contents"), a3, self->_kernelParamsBinaryName.var0);
}

- (void)loadBias:(float *)a3
{
  memcpy((void *)-[MTLBuffer contents](self->biasVelocityBuffer, "contents"), a3, *(_QWORD *)&self->_kernelParamsBinaryName.__r_.var0);
}

- (id)label
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_kernelParamsBinaryName;

  p_kernelParamsBinaryName = &self->_kernelParamsBinaryName;
  if (*((char *)&self->_kernelParamsBinaryName.__r_.__value_.var0.__l + 23) < 0)
    p_kernelParamsBinaryName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_kernelParamsBinaryName->__r_.__value_.var0.__l.__data_;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_kernelParamsBinaryName);
}

- (MPSCNNConvolutionWeightsAndBiasesState)state
{
  return (MPSCNNConvolutionWeightsAndBiasesState *)self->cq;
}

- (TCMPSConvolutionWeightsOptimizing)optimizer
{
  return *(TCMPSConvolutionWeightsOptimizing **)&self->_updateWeights;
}

- (MPSVector)weightMomentumVector
{
  return (MPSVector *)self->_state;
}

- (MPSVector)weightVelocityVector
{
  return (MPSVector *)self->_optimizer;
}

- (MPSVector)biasMomentumVector
{
  return self->_weightMomentumVector;
}

- (MPSVector)biasVelocityVector
{
  return self->_weightVelocityVector;
}

- (BOOL)updateWeights
{
  return (BOOL)self->biasBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightVelocityVector, 0);
  objc_storeStrong((id *)&self->_weightMomentumVector, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_updateWeights, 0);
  objc_storeStrong((id *)&self->cq, 0);
  objc_storeStrong((id *)&self->weightBuffer, 0);
  objc_storeStrong((id *)&self->biasVelocityBuffer, 0);
  objc_storeStrong((id *)&self->weightVelocityBuffer, 0);
  objc_storeStrong((id *)&self->biasMomentumBuffer, 0);
  objc_storeStrong((id *)&self->weightMomentumBuffer, 0);
  objc_storeStrong((id *)&self->_optimizerOptions.adamEpsilon, 0);
  objc_storeStrong((id *)&self->_optimizerOptions.adamBeta1, 0);
  if (*((char *)&self->_kernelParamsBinaryName.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_kernelParamsBinaryName.__r_.__value_.var0.__l.__data_);
  objc_storeStrong((id *)&self->_convDesc, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0uLL;
  *((_QWORD *)self + 8) = 0;
  *((_BYTE *)self + 92) = 0;
  *((_OWORD *)self + 6) = xmmword_2186C17F0;
  *((_QWORD *)self + 14) = 0x3F7FBE773F666666;
  *((_DWORD *)self + 30) = 841731191;
  return self;
}

@end
