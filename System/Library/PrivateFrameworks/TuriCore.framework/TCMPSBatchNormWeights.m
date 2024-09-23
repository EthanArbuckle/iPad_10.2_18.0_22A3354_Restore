@implementation TCMPSBatchNormWeights

- (TCMPSBatchNormWeights)initWithChannels:(unint64_t)a3 kernelParamsBinaryName:(const char *)a4 device:(id)a5 cmd_queue:(id)a6 gamma:(float *)a7 beta:(float *)a8 moving_avg:(float *)a9 moving_var:(float *)a10 optimizerOptions:(OptimizerOptions *)a11 batchNormEpsilon:(float)a12
{
  id v19;
  TCMPSBatchNormWeights *v20;
  TCMPSBatchNormWeights *v21;
  __int128 v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  uint64_t v31;
  id v32;
  double v33;
  MPSCNNNormalizationGammaAndBetaState *gammaBetaState;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  double v40;
  uint64_t v41;
  MPSNNOptimizerStochasticGradientDescent *sgdGamma;
  id v43;
  double v44;
  uint64_t v45;
  MPSNNOptimizerStochasticGradientDescent *sgdBeta;
  uint64_t v47;
  MTLCommandQueue *cq;
  uint64_t v49;
  MTLBuffer *gammaMomentumBuffer;
  uint64_t v51;
  MTLBuffer *gammaVelocityBuffer;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  MTLBuffer *betaMomentumBuffer;
  uint64_t v57;
  MTLBuffer *betaVelocityBuffer;
  uint64_t v59;
  MTLBuffer *betaBuffer;
  uint64_t v61;
  MTLBuffer *gammaBuffer;
  uint64_t v63;
  MTLBuffer *movingMeanBuffer;
  uint64_t v65;
  NSString *label;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  MPSCNNNormalizationMeanAndVarianceState *meanVarianceState;
  uint64_t v71;
  MPSVector *gammaMomentumVector;
  uint64_t v73;
  TCMPSConvolutionWeightsOptimizing *optimizer;
  uint64_t v75;
  MPSVector *betaMomentumVector;
  uint64_t v77;
  MPSVector *gammaVelocityVector;
  uint64_t v79;
  MPSVector *betaVelocityVector;
  uint64_t v81;
  MTLBuffer *movingVarianceBuffer;
  TCMPSBatchNormWeights *v83;
  void *v85;
  id v86;
  int v87;
  void *__p[3];
  void *v89[3];
  objc_super v90;

  v19 = a5;
  v86 = a6;
  v90.receiver = self;
  v90.super_class = (Class)TCMPSBatchNormWeights;
  v20 = -[TCMPSBatchNormWeights init](&v90, sel_init);
  v21 = v20;
  if (v20)
  {
    v22 = *(_OWORD *)&a11->sgdMomentum;
    *(_OWORD *)&v20->_optimizerOptions.useSGD = *(_OWORD *)&a11->useSGD;
    *(_OWORD *)&v20->_optimizerOptions.sgdMomentum = v22;
    v20->_batchNormEpsilon = a12;
    objc_storeStrong((id *)&v20->mov_var_updater, a6);
    MEMORY[0x219A19390](&v21->_kernelParamsBinaryName, a4);
    LODWORD(__p[0]) = 0;
    std::vector<float>::vector(v89, a3, __p);
    v23 = v89[0];
    v87 = 1065353216;
    std::vector<float>::vector(__p, a3, &v87);
    v24 = __p[0];
    v21->t = 0.0;
    v21->_channels = a3;
    *(float *)&v25 = v21->_optimizerOptions.gradientClipping;
    *(float *)&v26 = v21->_optimizerOptions.learningRate;
    *(float *)&v27 = -*(float *)&v25;
    LODWORD(v28) = 1.0;
    objc_msgSend(MEMORY[0x24BDDE4C8], "optimizerDescriptorWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:", *(float *)&v25 > 0.0, 2 * (v21->_optimizerOptions.weightDecay != 0.0), v26, v28, v25, v27);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21->_optimizerOptions.useSGD)
    {
      v29 = objc_alloc(MEMORY[0x24BDDE4D0]);
      *(float *)&v30 = v21->_optimizerOptions.sgdMomentum;
      v31 = objc_msgSend(v29, "initWithDevice:momentumScale:useNestrovMomentum:optimizerDescriptor:", v19, 0, v85, v30);
    }
    else
    {
      v32 = objc_alloc(MEMORY[0x24BDDE4C0]);
      *(float *)&v33 = v21->_optimizerOptions.adamEpsilon;
      v31 = objc_msgSend(v32, "initWithDevice:beta1:beta2:epsilon:timeStep:optimizerDescriptor:", v19, 0, v85, v21->_optimizerOptions.adamBeta1, v21->_optimizerOptions.adamBeta2, v33);
    }
    gammaBetaState = v21->_gammaBetaState;
    v21->_gammaBetaState = (MPSCNNNormalizationGammaAndBetaState *)v31;

    LODWORD(v35) = -1110651696;
    LODWORD(v36) = 1.0;
    LODWORD(v37) = -1.0;
    objc_msgSend(MEMORY[0x24BDDE4C8], "optimizerDescriptorWithLearningRate:gradientRescale:regularizationType:regularizationScale:", 2, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc(MEMORY[0x24BDDE4D0]);
    LODWORD(v40) = 0;
    v41 = objc_msgSend(v39, "initWithDevice:momentumScale:useNestrovMomentum:optimizerDescriptor:", v19, 0, v38, v40);
    sgdGamma = v21->sgdGamma;
    v21->sgdGamma = (MPSNNOptimizerStochasticGradientDescent *)v41;

    v43 = objc_alloc(MEMORY[0x24BDDE4D0]);
    LODWORD(v44) = 0;
    v45 = objc_msgSend(v43, "initWithDevice:momentumScale:useNestrovMomentum:optimizerDescriptor:", v19, 0, v38, v44);
    sgdBeta = v21->sgdBeta;
    v21->sgdBeta = (MPSNNOptimizerStochasticGradientDescent *)v45;

    v47 = objc_msgSend(v19, "newBufferWithBytes:length:options:", v23, 4 * a3, 0);
    cq = v21->cq;
    v21->cq = (MTLCommandQueue *)v47;

    v49 = objc_msgSend(v19, "newBufferWithBytes:length:options:", v23, 4 * a3, 0);
    gammaMomentumBuffer = v21->gammaMomentumBuffer;
    v21->gammaMomentumBuffer = (MTLBuffer *)v49;

    if (a7)
      v51 = objc_msgSend(v19, "newBufferWithBytes:length:options:", a7, 4 * a3, 0);
    else
      v51 = objc_msgSend(v19, "newBufferWithBytes:length:options:", v24, 4 * a3, 0);
    gammaVelocityBuffer = v21->gammaVelocityBuffer;
    v21->gammaVelocityBuffer = (MTLBuffer *)v51;

    v53 = objc_msgSend(v19, "newBufferWithBytes:length:options:", v23, 4 * a3, 0);
    v54 = *(void **)&v21->use_sgd_opt;
    *(_QWORD *)&v21->use_sgd_opt = v53;

    v55 = objc_msgSend(v19, "newBufferWithBytes:length:options:", v23, 4 * a3, 0);
    betaMomentumBuffer = v21->betaMomentumBuffer;
    v21->betaMomentumBuffer = (MTLBuffer *)v55;

    if (a8)
      v57 = objc_msgSend(v19, "newBufferWithBytes:length:options:", a8, 4 * a3, 0);
    else
      v57 = objc_msgSend(v19, "newBufferWithBytes:length:options:", v23, 4 * a3, 0);
    betaVelocityBuffer = v21->betaVelocityBuffer;
    v21->betaVelocityBuffer = (MTLBuffer *)v57;

    if (a9)
      v59 = objc_msgSend(v19, "newBufferWithBytes:length:options:", a9, 4 * a3, 0);
    else
      v59 = objc_msgSend(v19, "newBufferWithBytes:length:options:", v23, 4 * a3, 0);
    betaBuffer = v21->betaBuffer;
    v21->betaBuffer = (MTLBuffer *)v59;

    if (a10)
      v61 = objc_msgSend(v19, "newBufferWithBytes:length:options:", a10, 4 * a3, 0);
    else
      v61 = objc_msgSend(v19, "newBufferWithBytes:length:options:", v24, 4 * a3, 0);
    gammaBuffer = v21->gammaBuffer;
    v21->gammaBuffer = (MTLBuffer *)v61;

    v63 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE2E8]), "initWithGamma:beta:", v21->gammaVelocityBuffer, v21->betaVelocityBuffer);
    movingMeanBuffer = v21->movingMeanBuffer;
    v21->movingMeanBuffer = (MTLBuffer *)v63;

    v65 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE2F0]), "initWithMean:variance:", v21->betaBuffer, v21->gammaBuffer);
    label = v21->_label;
    v21->_label = (NSString *)v65;

    v21->_betaMomentumPointer = (float *)objc_msgSend(*(id *)&v21->use_sgd_opt, "contents");
    v21->_betaVelocityPointer = (float *)-[MTLBuffer contents](v21->betaMomentumBuffer, "contents");
    v21->_betaPointer = (float *)-[MTLBuffer contents](v21->betaVelocityBuffer, "contents");
    v21->_gammaMomentumPointer = (float *)-[MTLCommandQueue contents](v21->cq, "contents");
    v21->_gammaVelocityPointer = (float *)-[MTLBuffer contents](v21->gammaMomentumBuffer, "contents");
    v21->_gammaPointer = (float *)-[MTLBuffer contents](v21->gammaVelocityBuffer, "contents");
    v21->_movingMeanPointer = (float *)-[MTLBuffer contents](v21->betaBuffer, "contents");
    v21->_movingVariancePointer = (float *)-[MTLBuffer contents](v21->gammaBuffer, "contents");
    objc_msgSend(MEMORY[0x24BDDE510], "vectorDescriptorWithLength:dataType:", a3, 268435488);
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = *(void **)&v21->_kernelParamsBinaryName.__r_.var0;
    *(_QWORD *)&v21->_kernelParamsBinaryName.__r_.var0 = v67;

    v69 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", v21->cq, *(_QWORD *)&v21->_kernelParamsBinaryName.__r_.var0);
    meanVarianceState = v21->_meanVarianceState;
    v21->_meanVarianceState = (MPSCNNNormalizationMeanAndVarianceState *)v69;

    v71 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", v21->gammaMomentumBuffer, *(_QWORD *)&v21->_kernelParamsBinaryName.__r_.var0);
    gammaMomentumVector = v21->_gammaMomentumVector;
    v21->_gammaMomentumVector = (MPSVector *)v71;

    v73 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", *(_QWORD *)&v21->use_sgd_opt, *(_QWORD *)&v21->_kernelParamsBinaryName.__r_.var0);
    optimizer = v21->_optimizer;
    v21->_optimizer = (TCMPSConvolutionWeightsOptimizing *)v73;

    v75 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", v21->betaMomentumBuffer, *(_QWORD *)&v21->_kernelParamsBinaryName.__r_.var0);
    betaMomentumVector = v21->_betaMomentumVector;
    v21->_betaMomentumVector = (MPSVector *)v75;

    v77 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", v21->betaBuffer, *(_QWORD *)&v21->_kernelParamsBinaryName.__r_.var0);
    gammaVelocityVector = v21->_gammaVelocityVector;
    v21->_gammaVelocityVector = (MPSVector *)v77;

    v79 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE508]), "initWithBuffer:descriptor:", v21->gammaBuffer, *(_QWORD *)&v21->_kernelParamsBinaryName.__r_.var0);
    betaVelocityVector = v21->_betaVelocityVector;
    v21->_betaVelocityVector = (MPSVector *)v79;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a4, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    v81 = objc_claimAutoreleasedReturnValue();
    movingVarianceBuffer = v21->movingVarianceBuffer;
    v21->movingVarianceBuffer = (MTLBuffer *)v81;

    v83 = v21;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v89[0])
    {
      v89[1] = v89[0];
      operator delete(v89[0]);
    }
  }

  return v21;
}

- (void)set_cq:(id)a3
{
  objc_storeStrong((id *)&self->mov_var_updater, a3);
}

- (unint64_t)numberOfFeatureChannels
{
  return self->_channels;
}

- (float)gamma
{
  return self->_gammaPointer;
}

- (float)beta
{
  return self->_betaPointer;
}

- (float)mean
{
  return self->_movingMeanPointer;
}

- (float)variance
{
  return self->_movingVariancePointer;
}

- (float)epsilon
{
  return self->_batchNormEpsilon;
}

- (BOOL)load
{
  -[TCMPSBatchNormWeights checkpointWithCommandQueue:](self, "checkpointWithCommandQueue:", self->mov_var_updater);
  return 1;
}

- (id)label
{
  return self->movingVarianceBuffer;
}

- (void)setLearningRate:(float)a3
{
  -[MPSCNNNormalizationGammaAndBetaState setLearningRate:](self->_gammaBetaState, "setLearningRate:");
  self->_optimizerOptions.learningRate = a3;
}

- (BOOL)updateGammaAndBetaWithBatchNormalizationState:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  float adamBeta1;
  float adamBeta2;
  float v15;
  unint64_t channels;
  float v17;
  float v18;
  uint64_t v19;
  float v20;
  float v21;
  float *betaMomentumPointer;
  float *betaVelocityPointer;
  float v24;
  float v25;
  float *gammaMomentumPointer;
  float *gammaVelocityPointer;
  float *betaPointer;
  float *gammaPointer;
  float *movingMeanPointer;
  float *movingVariancePointer;
  float v32;
  float v33;

  v4 = a3;
  objc_msgSend(v4, "gradientForBeta");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "contents");

  objc_msgSend(v4, "gradientForGamma");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "contents");

  objc_msgSend(v4, "mean");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "contents");

  objc_msgSend(v4, "variance");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "contents");

  adamBeta1 = self->_optimizerOptions.adamBeta1;
  adamBeta2 = self->_optimizerOptions.adamBeta2;
  v15 = self->t + 1.0;
  self->t = v15;
  channels = self->_channels;
  if (channels)
  {
    v17 = 1.0 - powf(adamBeta1, v15);
    v18 = powf(adamBeta2, v15);
    v19 = 0;
    v20 = sqrtf(1.0 - v18);
    v21 = 1.0 - adamBeta1;
    betaMomentumPointer = self->_betaMomentumPointer;
    betaVelocityPointer = self->_betaVelocityPointer;
    v24 = 1.0 - adamBeta2;
    v25 = (float)-(float)(self->_optimizerOptions.learningRate * v20) / v17;
    gammaVelocityPointer = self->_gammaVelocityPointer;
    gammaMomentumPointer = self->_gammaMomentumPointer;
    betaPointer = self->_betaPointer;
    gammaPointer = self->_gammaPointer;
    movingVariancePointer = self->_movingVariancePointer;
    movingMeanPointer = self->_movingMeanPointer;
    do
    {
      betaMomentumPointer[v19] = (float)(v21 * *(float *)(v6 + 4 * v19)) + (float)(adamBeta1 * betaMomentumPointer[v19]);
      v32 = (float)(*(float *)(v6 + 4 * v19) * (float)(v24 * *(float *)(v6 + 4 * v19)))
          + (float)(adamBeta2 * betaVelocityPointer[v19]);
      betaVelocityPointer[v19] = v32;
      betaPointer[v19] = betaPointer[v19]
                       + (float)(v25
                               * (float)(betaMomentumPointer[v19]
                                       / (float)(self->_optimizerOptions.adamEpsilon + sqrtf(v32))));
      gammaMomentumPointer[v19] = (float)(v21 * *(float *)(v8 + 4 * v19))
                                + (float)(adamBeta1 * gammaMomentumPointer[v19]);
      v33 = (float)(*(float *)(v8 + 4 * v19) * (float)(v24 * *(float *)(v8 + 4 * v19)))
          + (float)(adamBeta2 * gammaVelocityPointer[v19]);
      gammaVelocityPointer[v19] = v33;
      gammaPointer[v19] = gammaPointer[v19]
                        + (float)(v25
                                * (float)(gammaMomentumPointer[v19]
                                        / (float)(self->_optimizerOptions.adamEpsilon + sqrtf(v33))));
      movingMeanPointer[v19] = movingMeanPointer[v19]
                             - (float)((float)(movingMeanPointer[v19] - *(float *)(v10 + 4 * v19)) * v24);
      movingVariancePointer[v19] = movingVariancePointer[v19]
                                 - (float)((float)(movingVariancePointer[v19] - *(float *)(v12 + 4 * v19)) * v24);
      ++v19;
    }
    while (channels != v19);
  }

  return 1;
}

- (id)updateGammaAndBetaWithCommandBuffer:(id)a3 batchNormalizationState:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  MPSNNOptimizerStochasticGradientDescent *sgdGamma;
  void *v15;
  void *v16;
  MPSNNOptimizerStochasticGradientDescent *sgdBeta;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDDE508]);
  objc_msgSend(v7, "mean");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithBuffer:descriptor:", v9, *(_QWORD *)&self->_kernelParamsBinaryName.__r_.var0);

  v11 = objc_alloc(MEMORY[0x24BDDE508]);
  objc_msgSend(v7, "variance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithBuffer:descriptor:", v12, *(_QWORD *)&self->_kernelParamsBinaryName.__r_.var0);

  sgdGamma = self->sgdGamma;
  -[TCMPSBatchNormWeights movingMeanVector](self, "movingMeanVector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSBatchNormWeights movingMeanVector](self, "movingMeanVector");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSNNOptimizerStochasticGradientDescent encodeToCommandBuffer:inputGradientVector:inputValuesVector:inputMomentumVector:resultValuesVector:](sgdGamma, "encodeToCommandBuffer:inputGradientVector:inputValuesVector:inputMomentumVector:resultValuesVector:", v6, v10, v15, 0, v16);

  sgdBeta = self->sgdBeta;
  -[TCMPSBatchNormWeights movingVarianceVector](self, "movingVarianceVector");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSBatchNormWeights movingVarianceVector](self, "movingVarianceVector");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSNNOptimizerStochasticGradientDescent encodeToCommandBuffer:inputGradientVector:inputValuesVector:inputMomentumVector:resultValuesVector:](sgdBeta, "encodeToCommandBuffer:inputGradientVector:inputValuesVector:inputMomentumVector:resultValuesVector:", v6, v13, v18, 0, v19);

  -[MPSCNNNormalizationGammaAndBetaState encodeToCommandBuffer:batchNormalizationState:batchNormData:](self->_gammaBetaState, "encodeToCommandBuffer:batchNormalizationState:batchNormData:", v6, v7, self);
  -[TCMPSBatchNormWeights gammaBetaState](self, "gammaBetaState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)loadBeta:(float *)a3
{
  memcpy(self->_betaPointer, a3, 4 * self->_channels);
}

- (void)loadGamma:(float *)a3
{
  memcpy(self->_gammaPointer, a3, 4 * self->_channels);
}

- (void)loadMovingAvg:(float *)a3
{
  memcpy(self->_movingMeanPointer, a3, 4 * self->_channels);
}

- (void)loadMovingVar:(float *)a3
{
  memcpy(self->_movingVariancePointer, a3, 4 * self->_channels);
}

- (NSString)internalLabel
{
  return (NSString *)self->movingVarianceBuffer;
}

- (void)setInternalLabel:(id)a3
{
  objc_storeStrong((id *)&self->movingVarianceBuffer, a3);
}

- (MPSCNNNormalizationGammaAndBetaState)gammaBetaState
{
  return (MPSCNNNormalizationGammaAndBetaState *)self->movingMeanBuffer;
}

- (MPSCNNNormalizationMeanAndVarianceState)meanVarianceState
{
  return (MPSCNNNormalizationMeanAndVarianceState *)self->_label;
}

- (TCMPSConvolutionWeightsOptimizing)optimizer
{
  return (TCMPSConvolutionWeightsOptimizing *)self->_gammaBetaState;
}

- (MPSVector)gammaMomentumVector
{
  return (MPSVector *)self->_meanVarianceState;
}

- (MPSVector)betaMomentumVector
{
  return (MPSVector *)self->_optimizer;
}

- (MPSVector)gammaVelocityVector
{
  return self->_gammaMomentumVector;
}

- (MPSVector)betaVelocityVector
{
  return self->_betaMomentumVector;
}

- (MPSVector)movingMeanVector
{
  return self->_gammaVelocityVector;
}

- (MPSVector)movingVarianceVector
{
  return self->_betaVelocityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betaVelocityVector, 0);
  objc_storeStrong((id *)&self->_gammaVelocityVector, 0);
  objc_storeStrong((id *)&self->_betaMomentumVector, 0);
  objc_storeStrong((id *)&self->_gammaMomentumVector, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_meanVarianceState, 0);
  objc_storeStrong((id *)&self->_gammaBetaState, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->movingMeanBuffer, 0);
  objc_storeStrong((id *)&self->movingVarianceBuffer, 0);
  objc_storeStrong((id *)&self->betaBuffer, 0);
  objc_storeStrong((id *)&self->gammaBuffer, 0);
  objc_storeStrong((id *)&self->betaVelocityBuffer, 0);
  objc_storeStrong((id *)&self->gammaVelocityBuffer, 0);
  objc_storeStrong((id *)&self->betaMomentumBuffer, 0);
  objc_storeStrong((id *)&self->gammaMomentumBuffer, 0);
  objc_storeStrong((id *)&self->use_sgd_opt, 0);
  objc_storeStrong((id *)&self->cq, 0);
  objc_storeStrong((id *)&self->mov_var_updater, 0);
  objc_storeStrong((id *)&self->mov_avg_updater, 0);
  objc_storeStrong((id *)&self->sgdBeta, 0);
  objc_storeStrong((id *)&self->sgdGamma, 0);
  objc_storeStrong((id *)&self->adamBeta, 0);
  objc_storeStrong((id *)&self->adamGamma, 0);
  objc_storeStrong((id *)&self->vDesc, 0);
  objc_storeStrong((id *)&self->_kernelParamsBinaryName.var0, 0);
  objc_storeStrong((id *)&self->_kernelParamsBinaryName.__r_.var0, 0);
  if (*((char *)&self->_kernelParamsBinaryName.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_kernelParamsBinaryName.__r_.__value_.var0.__l.__data_);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 80) = 0;
  *(_OWORD *)((char *)self + 84) = xmmword_2186C17F0;
  *(_QWORD *)((char *)self + 100) = 0x3F7FBE773F666666;
  *((_DWORD *)self + 27) = 841731191;
  *((_OWORD *)self + 8) = 0uLL;
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end
