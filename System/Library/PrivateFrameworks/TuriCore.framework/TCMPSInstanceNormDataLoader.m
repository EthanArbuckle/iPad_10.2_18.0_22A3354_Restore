@implementation TCMPSInstanceNormDataLoader

- (TCMPSInstanceNormDataLoader)initWithParams:(id)a3 gammaWeights:(float *)a4 betaWeights:(float *)a5 numberFeatureChannels:(unint64_t)a6 styles:(unint64_t)a7 device:(id)a8 cmd_queue:(id)a9
{
  id v16;
  TCMPSInstanceNormDataLoader *v17;
  TCMPSInstanceNormDataLoader *v18;
  uint64_t v19;
  NSMutableData *gammaPlaceHolder;
  uint64_t v21;
  NSMutableData *betaPlaceHolder;
  unint64_t v23;
  uint64_t v24;
  NSMutableData *gamma_weights;
  uint64_t v26;
  NSMutableData *beta_weights;
  uint64_t v28;
  NSMutableData *v29;
  uint64_t v30;
  NSMutableData *v31;
  void *v32;
  unint64_t numberOfFeatureChannels;
  id v34;
  double v35;
  uint64_t v36;
  MPSNNOptimizerAdam *adamGamma;
  id v38;
  double v39;
  uint64_t v40;
  MPSNNOptimizerAdam *adamBeta;
  uint64_t v42;
  MPSVectorDescriptor *vDesc;
  NSMutableArray *v44;
  NSMutableArray *style_props;
  uint64_t v46;
  TCMPSInstanceNormDataLoaderProps *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v80;
  id v81;
  void *__b;

  v81 = a3;
  v16 = a8;
  v80 = a9;
  v17 = -[TCMPSInstanceNormDataLoader init](self, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    v18->_numberOfFeatureChannels = a6;
    v18->_styles = a7;
    v18->_styleIndex = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v19 = objc_claimAutoreleasedReturnValue();
    gammaPlaceHolder = v18->_gammaPlaceHolder;
    v18->_gammaPlaceHolder = (NSMutableData *)v19;

    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v21 = objc_claimAutoreleasedReturnValue();
    betaPlaceHolder = v18->_betaPlaceHolder;
    v18->_betaPlaceHolder = (NSMutableData *)v21;

    v23 = 4 * a6 * a7;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    gamma_weights = v18->_gamma_weights;
    v18->_gamma_weights = (NSMutableData *)v24;

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v23);
    v26 = objc_claimAutoreleasedReturnValue();
    beta_weights = v18->_beta_weights;
    v18->_beta_weights = (NSMutableData *)v26;

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", a4, v23);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v18->_gamma_weights;
    v18->_gamma_weights = (NSMutableData *)v28;

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", a5, v23);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v18->_beta_weights;
    v18->_beta_weights = (NSMutableData *)v30;

    objc_storeStrong((id *)&v18->_cq, a9);
    v32 = malloc_type_calloc(v18->_numberOfFeatureChannels, 4uLL, 0x100004052888210uLL);
    __b = malloc_type_malloc(4 * v18->_numberOfFeatureChannels, 0x100004052888210uLL);
    numberOfFeatureChannels = v18->_numberOfFeatureChannels;
    if (numberOfFeatureChannels)
      memset_pattern16(__b, &unk_2186C1810, 4 * numberOfFeatureChannels);
    v34 = objc_alloc(MEMORY[0x24BDDE4C0]);
    LODWORD(v35) = 981668463;
    v36 = objc_msgSend(v34, "initWithDevice:learningRate:", v16, v35);
    adamGamma = v18->_adamGamma;
    v18->_adamGamma = (MPSNNOptimizerAdam *)v36;

    v38 = objc_alloc(MEMORY[0x24BDDE4C0]);
    LODWORD(v39) = 981668463;
    v40 = objc_msgSend(v38, "initWithDevice:learningRate:", v16, v39);
    adamBeta = v18->_adamBeta;
    v18->_adamBeta = (MPSNNOptimizerAdam *)v40;

    objc_msgSend(MEMORY[0x24BDDE510], "vectorDescriptorWithLength:dataType:", v18->_numberOfFeatureChannels, 268435488);
    v42 = objc_claimAutoreleasedReturnValue();
    vDesc = v18->_vDesc;
    v18->_vDesc = (MPSVectorDescriptor *)v42;

    v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    style_props = v18->_style_props;
    v18->_style_props = v44;

    if (a7)
    {
      v46 = 0;
      do
      {
        v47 = objc_alloc_init(TCMPSInstanceNormDataLoaderProps);
        v48 = v46 * v18->_numberOfFeatureChannels;
        v49 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", -[NSMutableData bytes](v18->_gamma_weights, "bytes") + v48, 4 * v18->_numberOfFeatureChannels, 0);
        -[TCMPSInstanceNormDataLoaderProps setGammaBuffer:](v47, "setGammaBuffer:", v49);

        v50 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", -[NSMutableData bytes](v18->_beta_weights, "bytes") + v48, 4 * v18->_numberOfFeatureChannels, 0);
        -[TCMPSInstanceNormDataLoaderProps setBetaBuffer:](v47, "setBetaBuffer:", v50);

        v51 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", v32, 4 * v18->_numberOfFeatureChannels, 0);
        -[TCMPSInstanceNormDataLoaderProps setGammaMomentumBuffer:](v47, "setGammaMomentumBuffer:", v51);

        v52 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", v32, 4 * v18->_numberOfFeatureChannels, 0);
        -[TCMPSInstanceNormDataLoaderProps setGammaVelocityBuffer:](v47, "setGammaVelocityBuffer:", v52);

        v53 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", v32, 4 * v18->_numberOfFeatureChannels, 0);
        -[TCMPSInstanceNormDataLoaderProps setBetaMomentumBuffer:](v47, "setBetaMomentumBuffer:", v53);

        v54 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", v32, 4 * v18->_numberOfFeatureChannels, 0);
        -[TCMPSInstanceNormDataLoaderProps setBetaVelocityBuffer:](v47, "setBetaVelocityBuffer:", v54);

        v55 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", v32, 4 * v18->_numberOfFeatureChannels, 0);
        -[TCMPSInstanceNormDataLoaderProps setMovingMeanBuffer:](v47, "setMovingMeanBuffer:", v55);

        v56 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", __b, 4 * v18->_numberOfFeatureChannels, 0);
        -[TCMPSInstanceNormDataLoaderProps setMovingVarianceBuffer:](v47, "setMovingVarianceBuffer:", v56);

        v57 = objc_alloc(MEMORY[0x24BDDE508]);
        -[TCMPSInstanceNormDataLoaderProps gammaBuffer](v47, "gammaBuffer");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)objc_msgSend(v57, "initWithBuffer:descriptor:", v58, v18->_vDesc);
        -[TCMPSInstanceNormDataLoaderProps setGammaVector:](v47, "setGammaVector:", v59);

        v60 = objc_alloc(MEMORY[0x24BDDE508]);
        -[TCMPSInstanceNormDataLoaderProps gammaMomentumBuffer](v47, "gammaMomentumBuffer");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v60, "initWithBuffer:descriptor:", v61, v18->_vDesc);
        -[TCMPSInstanceNormDataLoaderProps setGammaMomentumVector:](v47, "setGammaMomentumVector:", v62);

        v63 = objc_alloc(MEMORY[0x24BDDE508]);
        -[TCMPSInstanceNormDataLoaderProps gammaVelocityBuffer](v47, "gammaVelocityBuffer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v63, "initWithBuffer:descriptor:", v64, v18->_vDesc);
        -[TCMPSInstanceNormDataLoaderProps setGammaVelocityVector:](v47, "setGammaVelocityVector:", v65);

        v66 = objc_alloc(MEMORY[0x24BDDE508]);
        -[TCMPSInstanceNormDataLoaderProps betaBuffer](v47, "betaBuffer");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)objc_msgSend(v66, "initWithBuffer:descriptor:", v67, v18->_vDesc);
        -[TCMPSInstanceNormDataLoaderProps setBetaVector:](v47, "setBetaVector:", v68);

        v69 = objc_alloc(MEMORY[0x24BDDE508]);
        -[TCMPSInstanceNormDataLoaderProps betaMomentumBuffer](v47, "betaMomentumBuffer");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)objc_msgSend(v69, "initWithBuffer:descriptor:", v70, v18->_vDesc);
        -[TCMPSInstanceNormDataLoaderProps setBetaMomentumVector:](v47, "setBetaMomentumVector:", v71);

        v72 = objc_alloc(MEMORY[0x24BDDE508]);
        -[TCMPSInstanceNormDataLoaderProps betaVelocityBuffer](v47, "betaVelocityBuffer");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)objc_msgSend(v72, "initWithBuffer:descriptor:", v73, v18->_vDesc);
        -[TCMPSInstanceNormDataLoaderProps setBetaVelocityVector:](v47, "setBetaVelocityVector:", v74);

        v75 = objc_alloc(MEMORY[0x24BDDE2E8]);
        -[TCMPSInstanceNormDataLoaderProps gammaBuffer](v47, "gammaBuffer");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[TCMPSInstanceNormDataLoaderProps betaBuffer](v47, "betaBuffer");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (void *)objc_msgSend(v75, "initWithGamma:beta:", v76, v77);
        -[TCMPSInstanceNormDataLoaderProps setState:](v47, "setState:", v78);

        -[NSMutableArray addObject:](v18->_style_props, "addObject:", v47);
        v46 += 4;
        --a7;
      }
      while (a7);
    }
    free(v32);
    free(__b);
  }

  return v18;
}

- (void)setLearningRate:(float)a3
{
  double v5;

  -[MPSNNOptimizerAdam setLearningRate:](self->_adamGamma, "setLearningRate:");
  *(float *)&v5 = a3;
  -[MPSNNOptimizerAdam setLearningRate:](self->_adamBeta, "setLearningRate:", v5);
}

- (void)loadBeta:(float *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "betaVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (void *)objc_msgSend(v7, "contents");

  memcpy(v8, a3, 4 * self->_numberOfFeatureChannels * self->_styles);
}

- (float)beta
{
  void *v3;
  id v4;
  float *v5;

  -[TCMPSInstanceNormDataLoader checkpointWithCommandQueue:](self, "checkpointWithCommandQueue:", self->_cq);
  -[NSMutableArray objectAtIndexedSubscript:](self->_style_props, "objectAtIndexedSubscript:", self->_styleIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "betaBuffer");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (float *)objc_msgSend(v4, "contents");

  return v5;
}

- (float)betaWeights
{
  unint64_t styleIndex;
  unint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;

  styleIndex = self->_styleIndex;
  -[NSMutableData setLength:](self->_betaPlaceHolder, "setLength:", 0);
  if (self->_styles)
  {
    v4 = 0;
    do
    {
      self->_styleIndex = v4;
      -[TCMPSInstanceNormDataLoader checkpointWithCommandQueue:](self, "checkpointWithCommandQueue:", self->_cq);
      -[NSMutableArray objectAtIndexedSubscript:](self->_style_props, "objectAtIndexedSubscript:", self->_styleIndex);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "betaBuffer");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "contents");

      -[NSMutableData appendBytes:length:](self->_betaPlaceHolder, "appendBytes:length:", v7, 4 * self->_numberOfFeatureChannels);
      ++v4;
    }
    while (v4 < self->_styles);
  }
  self->_styleIndex = styleIndex;
  return (float *)-[NSMutableData bytes](self->_betaPlaceHolder, "bytes");
}

- (void)loadGamma:(float *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gammaVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (void *)objc_msgSend(v7, "contents");

  memcpy(v8, a3, 4 * self->_numberOfFeatureChannels * self->_styles);
}

- (float)gamma
{
  void *v3;
  id v4;
  float *v5;

  -[TCMPSInstanceNormDataLoader checkpointWithCommandQueue:](self, "checkpointWithCommandQueue:", self->_cq);
  -[NSMutableArray objectAtIndexedSubscript:](self->_style_props, "objectAtIndexedSubscript:", self->_styleIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gammaBuffer");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (float *)objc_msgSend(v4, "contents");

  return v5;
}

- (float)gammaWeights
{
  unint64_t styleIndex;
  unint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;

  styleIndex = self->_styleIndex;
  -[NSMutableData setLength:](self->_gammaPlaceHolder, "setLength:", 0);
  if (self->_styles)
  {
    v4 = 0;
    do
    {
      self->_styleIndex = v4;
      -[TCMPSInstanceNormDataLoader checkpointWithCommandQueue:](self, "checkpointWithCommandQueue:", self->_cq);
      -[NSMutableArray objectAtIndexedSubscript:](self->_style_props, "objectAtIndexedSubscript:", self->_styleIndex);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gammaBuffer");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "contents");

      -[NSMutableData appendBytes:length:](self->_gammaPlaceHolder, "appendBytes:length:", v7, 4 * self->_numberOfFeatureChannels);
      ++v4;
    }
    while (v4 < self->_styles);
  }
  self->_styleIndex = styleIndex;
  return (float *)-[NSMutableData bytes](self->_gammaPlaceHolder, "bytes");
}

- (id)updateGammaAndBetaWithCommandBuffer:(id)a3 instanceNormalizationStateBatch:(id)a4
{
  void *v6;
  MPSCNNInstanceNormalization *v7;
  MPSCNNInstanceNormalization *instanceNormFilter;
  void *v9;
  id v10;
  void *v11;
  MPSNNOptimizerAdam *adamGamma;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  MPSNNOptimizerAdam *adamBeta;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id obj;
  uint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v34 = a4;
  v38 = -[MPSNNOptimizerAdam timeStep](self->_adamGamma, "timeStep");
  v37 = -[MPSNNOptimizerAdam timeStep](self->_adamBeta, "timeStep");
  objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceNormalization");
  v7 = (MPSCNNInstanceNormalization *)objc_claimAutoreleasedReturnValue();
  instanceNormFilter = self->_instanceNormFilter;
  self->_instanceNormFilter = v7;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v34;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v39)
  {
    v36 = *(_QWORD *)v46;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v44);
        v10 = objc_alloc(MEMORY[0x24BDDE508]);
        objc_msgSend(v9, "gradientForGamma");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v10, "initWithBuffer:descriptor:", v11, self->_vDesc);

        -[MPSNNOptimizerAdam setTimeStep:](self->_adamGamma, "setTimeStep:", v38);
        adamGamma = self->_adamGamma;
        -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "gammaVector");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "gammaMomentumVector");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "gammaVelocityVector");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "gammaVector");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSNNOptimizerAdam encodeToCommandBuffer:inputGradientVector:inputValuesVector:inputMomentumVector:inputVelocityVector:resultValuesVector:](adamGamma, "encodeToCommandBuffer:inputGradientVector:inputValuesVector:inputMomentumVector:inputVelocityVector:resultValuesVector:", v40, v43, v13, v15, v17, v19);

        v20 = objc_alloc(MEMORY[0x24BDDE508]);
        objc_msgSend(v9, "gradientForBeta");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v20, "initWithBuffer:descriptor:", v21, self->_vDesc);

        -[MPSNNOptimizerAdam setTimeStep:](self->_adamBeta, "setTimeStep:", v37);
        adamBeta = self->_adamBeta;
        -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "betaVector");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "betaMomentumVector");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "betaVelocityVector");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "betaVector");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSNNOptimizerAdam encodeToCommandBuffer:inputGradientVector:inputValuesVector:inputMomentumVector:inputVelocityVector:resultValuesVector:](adamBeta, "encodeToCommandBuffer:inputGradientVector:inputValuesVector:inputMomentumVector:inputVelocityVector:resultValuesVector:", v40, v42, v24, v26, v28, v30);

        ++v44;
      }
      while (v39 != v44);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v39);
  }

  -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "state");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void)checkpoint
{
  MPSCNNInstanceNormalization *instanceNormFilter;
  void *v4;
  void *v5;
  id v6;

  if (self->_instanceNormFilter)
  {
    -[MTLCommandQueue commandBuffer](self->_cq, "commandBuffer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    instanceNormFilter = self->_instanceNormFilter;
    -[NSMutableArray objectAtIndex:](self->_style_props, "objectAtIndex:", self->_styleIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSCNNInstanceNormalization reloadGammaAndBetaWithCommandBuffer:gammaAndBetaState:](instanceNormFilter, "reloadGammaAndBetaWithCommandBuffer:gammaAndBetaState:", v6, v5);

    objc_msgSend(v6, "commit");
  }
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

- (id)label
{
  return self->_name;
}

- (unint64_t)numberOfFeatureChannels
{
  return self->_numberOfFeatureChannels;
}

- (void)setNumberOfFeatureChannels:(unint64_t)a3
{
  self->_numberOfFeatureChannels = a3;
}

- (unint64_t)styleIndex
{
  return self->_styleIndex;
}

- (void)setStyleIndex:(unint64_t)a3
{
  self->_styleIndex = a3;
}

- (unint64_t)styles
{
  return self->_styles;
}

- (void)setStyles:(unint64_t)a3
{
  self->_styles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamBeta, 0);
  objc_storeStrong((id *)&self->_adamGamma, 0);
  objc_storeStrong((id *)&self->_cq, 0);
  objc_storeStrong((id *)&self->_instanceNormFilter, 0);
  objc_storeStrong((id *)&self->_vDesc, 0);
  objc_storeStrong((id *)&self->_betaPlaceHolder, 0);
  objc_storeStrong((id *)&self->_gammaPlaceHolder, 0);
  objc_storeStrong((id *)&self->_style_props, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_beta_weights, 0);
  objc_storeStrong((id *)&self->_gamma_weights, 0);
}

@end
