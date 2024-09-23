@implementation PTDisparityFilterDEMA_LKT

- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v13;
  PTDisparityFilterDEMA_LKT *v14;
  PTDisparityFilterDEMA_LKT *v15;
  __int128 v16;
  __int128 v17;
  PTOpticalFlow *v18;
  _BOOL8 v19;
  uint64_t v20;
  PTOpticalFlow *opticalFlow;
  PTGlobalReduction *v22;
  PTGlobalReduction *globalReduction;
  void *v24;
  uint64_t v25;
  MTLBuffer *avgDisplacement;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v57;
  unint64_t var2;

  v13 = a3;
  v14 = -[PTDisparityFilterDEMA_LKT initWithMetalContext:sensorPort:](self, "initWithMetalContext:sensorPort:", v13, a9);
  v15 = v14;
  if (v14)
  {
    v14->_frameCount = 0;
    v16 = *(_OWORD *)&a4->var0;
    v14->_disparitySize.depth = a4->var2;
    *(_OWORD *)&v14->_disparitySize.width = v16;
    v17 = *(_OWORD *)&a5->var0;
    v14->_disparityFilteredSize.depth = a5->var2;
    *(_OWORD *)&v14->_disparityFilteredSize.width = v17;
    v18 = [PTOpticalFlow alloc];
    v19 = v15->_direction == 1.0;
    v57 = *(_OWORD *)&a7->var0;
    var2 = a7->var2;
    v20 = -[PTOpticalFlow initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:](v18, "initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:", v13, &v57, 1, 0, 0, v19);
    opticalFlow = v15->_opticalFlow;
    v15->_opticalFlow = (PTOpticalFlow *)v20;

    if (!v15->_opticalFlow)
    {
      _PTLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PTDisparityFilterDEMA_LKT initWithMetalContext:disparitySize:disparityFilteredSize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:].cold.1(v27, v35, v36, v37, v38, v39, v40, v41);
      goto LABEL_14;
    }
    v22 = -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:pixelFormat:", v13, 65, (double)a4->var0, (double)a4->var1);
    globalReduction = v15->_globalReduction;
    v15->_globalReduction = v22;

    if (!v15->_globalReduction)
    {
      _PTLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v27, v42, v43, v44, v45, v46, v47, v48);
      goto LABEL_14;
    }
    objc_msgSend(v13, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "newBufferWithLength:options:", 16, 0);
    avgDisplacement = v15->_avgDisplacement;
    v15->_avgDisplacement = (MTLBuffer *)v25;

    if (!v15->_avgDisplacement)
    {
      _PTLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PTDisparityFilterDEMA_LKT initWithMetalContext:disparitySize:disparityFilteredSize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:].cold.3(v27, v49, v50, v51, v52, v53, v54, v55);
      goto LABEL_14;
    }
    if (!v15->_globalReduction)
    {
      _PTLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PTDisparityFilterDEMA_LKT initWithMetalContext:disparitySize:disparityFilteredSize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:].cold.4(v27, v28, v29, v30, v31, v32, v33, v34);
LABEL_14:

      v15 = 0;
    }
  }

  return v15;
}

- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3 sensorPort:(id)a4
{
  id v7;
  id v8;
  PTDisparityFilterDEMA_LKT *v9;
  PTDisparityFilterDEMA_LKT *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MTLSamplerState *samplerState;
  void *v15;
  double v16;
  uint64_t v17;
  MTLComputePipelineState *temporalFilterDEMA_LKT;
  uint64_t v19;
  MTLComputePipelineState *temporalFilterDEMA_LKT_VisualizeMotion;
  uint64_t v21;
  MTLComputePipelineState *resampleDisparity;
  PTDisparityFilterDEMA_LKT *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v47;
  objc_super v48;

  v7 = a3;
  v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)PTDisparityFilterDEMA_LKT;
  v9 = -[PTDisparityFilterDEMA_LKT init](&v48, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metalContext, a3);
    v10->_direction = -1.0;
    if ((objc_msgSend(CFSTR("PortTypeFrontInfrared"), "isEqual:", v8) & 1) == 0
      && (objc_msgSend(CFSTR("PortTypeFront"), "isEqual:", v8) & 1) == 0
      && (objc_msgSend(CFSTR("PortTypeBackTelephoto"), "isEqual:", v8) & 1) == 0)
    {
      objc_msgSend(CFSTR("PortTypeBack"), "isEqual:", v8);
    }
    v47 = 0;
    v10->_motionVisualization = 0;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setNormalizedCoordinates:", 1);
    objc_msgSend(v11, "setMinFilter:", 1);
    objc_msgSend(v11, "setMagFilter:", 1);
    objc_msgSend(v7, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "newSamplerStateWithDescriptor:", v11);
    samplerState = v10->_samplerState;
    v10->_samplerState = (MTLSamplerState *)v13;

    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setConstantFloat2:withName:", CFSTR("kIIRUpdateCoefficients_float2"), 0.00029296876);
    objc_msgSend(v15, "setConstantFloat2:withName:", CFSTR("kMotionThresholdMinMax_float2"), 524288.125);
    *(float *)&v16 = v10->_direction;
    objc_msgSend(v15, "setConstantFloat:withName:", CFSTR("kDirection_float"), v16);
    objc_msgSend(v15, "setConstantValue:type:withName:", &v47, 29, CFSTR("kMotionCorrectionFunction"));
    objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("temporalFilterDEMA_LKT"), v15);
    v17 = objc_claimAutoreleasedReturnValue();
    temporalFilterDEMA_LKT = v10->_temporalFilterDEMA_LKT;
    v10->_temporalFilterDEMA_LKT = (MTLComputePipelineState *)v17;

    if (v10->_temporalFilterDEMA_LKT)
    {
      objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("temporalFilterDEMA_LKT_VisualizeMotion"), v15);
      v19 = objc_claimAutoreleasedReturnValue();
      temporalFilterDEMA_LKT_VisualizeMotion = v10->_temporalFilterDEMA_LKT_VisualizeMotion;
      v10->_temporalFilterDEMA_LKT_VisualizeMotion = (MTLComputePipelineState *)v19;

      if (v10->_temporalFilterDEMA_LKT_VisualizeMotion)
      {
        objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("resampleDisparity"), v15);
        v21 = objc_claimAutoreleasedReturnValue();
        resampleDisparity = v10->_resampleDisparity;
        v10->_resampleDisparity = (MTLComputePipelineState *)v21;

        if (v10->_resampleDisparity)
        {
          v23 = v10;
LABEL_18:

          goto LABEL_19;
        }
        _PTLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[PTDisparityFilterDEMA_LKT initWithMetalContext:sensorPort:].cold.3(v24, v39, v40, v41, v42, v43, v44, v45);
      }
      else
      {
        _PTLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[PTDisparityFilterDEMA_LKT initWithMetalContext:sensorPort:].cold.2(v24, v32, v33, v34, v35, v36, v37, v38);
      }
    }
    else
    {
      _PTLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PTDisparityFilterDEMA_LKT initWithMetalContext:sensorPort:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    v23 = 0;
    goto LABEL_18;
  }
  v23 = 0;
LABEL_19:

  return v23;
}

- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3
{
  return -[PTDisparityFilterDEMA_LKT initWithMetalContext:sensorPort:](self, "initWithMetalContext:sensorPort:", a3, CFSTR("PortTypeBack"));
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  return -[PTOpticalFlow estimateDisplacementStream:destRGBA:outDisplacement:](self->_opticalFlow, "estimateDisplacementStream:destRGBA:outDisplacement:", a3, a4, a5);
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v16 == v18)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PTDisparityFilterDEMA_LKT temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

    v20 = -10;
  }
  else
  {
    if (self->_frameCount)
    {
      v20 = -[PTDisparityFilterDEMA_LKT exponentialMovingAverageFilter:inDisplacement:inDemaPrev:inDisparity:outDisparity:outDEMA:](self, "exponentialMovingAverageFilter:inDisplacement:inDemaPrev:inDisparity:outDisparity:outDEMA:", v14, v15, v16, v17, v18, v19);
    }
    else
    {
      -[PTDisparityFilterDEMA_LKT copyDisparity:inDisparity:outDisparity:](self, "copyDisparity:inDisparity:outDisparity:", v14, v17, v18);
      -[PTDisparityFilterDEMA_LKT copyDisparity:inDisparity:outDisparity:](self, "copyDisparity:inDisparity:outDisparity:", v14, v17, v19);
      v20 = 0;
    }
    ++self->_frameCount;
  }

  return v20;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSArray *demaStates;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  NSArray *v34;
  int v35;
  void *v36;
  int frameCount;
  BOOL v38;
  char v39;
  int v40;
  void *v41;
  void *v43;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (a8 == 0.0)
  {
    demaStates = self->_demaStates;
    if (!demaStates)
    {
      v43 = (void *)MEMORY[0x1E0C99D20];
      -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "createWithWidth:height:pixelFormat:", self->_disparityFilteredSize.width, self->_disparityFilteredSize.height, 65);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "createWithWidth:height:pixelFormat:", self->_disparityFilteredSize.width, self->_disparityFilteredSize.height, 65);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "arrayWithObjects:", v30, v32, 0);
      v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v34 = self->_demaStates;
      self->_demaStates = v33;

      demaStates = self->_demaStates;
    }
    if (self->_frameCount >= 0)
      v35 = self->_frameCount & 1;
    else
      v35 = -(self->_frameCount & 1);
    -[NSArray objectAtIndexedSubscript:](demaStates, "objectAtIndexedSubscript:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    frameCount = self->_frameCount;
    v38 = __OFADD__(frameCount++, 1);
    v39 = (frameCount < 0) ^ v38;
    v40 = frameCount & 1;
    if (v39)
      v40 = -v40;
    -[NSArray objectAtIndexedSubscript:](self->_demaStates, "objectAtIndexedSubscript:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PTDisparityFilterDEMA_LKT temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:](self, "temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:", v14, v15, v36, v17, v18, v41);

  }
  else
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTDisparityFilterDEMA_LKT temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    v27 = -10;
  }

  return v27;
}

- (int)exponentialMovingAverageFilter:(id)a3 inDisplacement:(id)a4 inDemaPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outDEMA:(id)a8
{
  PTGlobalReduction *globalReduction;
  MTLBuffer *avgDisplacement;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  uint64_t v36;
  _QWORD v37[3];

  globalReduction = self->_globalReduction;
  avgDisplacement = self->_avgDisplacement;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[PTGlobalReduction parallelReductionAverage:inTexture:outGlobalAverage:](globalReduction, "parallelReductionAverage:inTexture:outGlobalAverage:", v21, v20, avgDisplacement);
  objc_msgSend(v21, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    _PTLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

  }
  v31 = 24;
  if (!self->_motionVisualization)
    v31 = 16;
  objc_msgSend(v22, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v31));
  objc_msgSend(v22, "setTexture:atIndex:", v20, 0);

  objc_msgSend(v22, "setTexture:atIndex:", v19, 1);
  objc_msgSend(v22, "setTexture:atIndex:", v18, 2);

  objc_msgSend(v22, "setTexture:atIndex:", v17, 3);
  objc_msgSend(v22, "setTexture:atIndex:", v16, 4);

  objc_msgSend(v22, "setBuffer:offset:atIndex:", self->_avgDisplacement, 0, 0);
  objc_msgSend(v22, "setSamplerState:atIndex:", self->_samplerState, 0);
  v32 = objc_msgSend(v17, "width");
  v33 = objc_msgSend(v17, "height");

  v37[0] = v32;
  v37[1] = v33;
  v37[2] = 1;
  v35 = xmmword_1C9322A40;
  v36 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v37, &v35);
  objc_msgSend(v22, "endEncoding");

  return 0;
}

- (int)copyDisparity:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  objc_msgSend(v10, "setComputePipelineState:", self->_resampleDisparity);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  objc_msgSend(v10, "setSamplerState:atIndex:", self->_samplerState, 0);
  v19 = objc_msgSend(v8, "width");
  v20 = objc_msgSend(v8, "height");

  v24[0] = v19;
  v24[1] = v20;
  v24[2] = 1;
  v22 = xmmword_1C9322A40;
  v23 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v24, &v22);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (void)reset
{
  self->_frameCount = 0;
  -[PTOpticalFlow reset](self->_opticalFlow, "reset");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplerState, 0);
  objc_storeStrong((id *)&self->_demaStates, 0);
  objc_storeStrong((id *)&self->_dumpInputOutputFolder, 0);
  objc_storeStrong((id *)&self->_avgDisplacement, 0);
  objc_storeStrong((id *)&self->_globalReduction, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_resampleDisparity, 0);
  objc_storeStrong((id *)&self->_temporalFilterDEMA_LKT_VisualizeMotion, 0);
  objc_storeStrong((id *)&self->_temporalFilterDEMA_LKT, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 sensorPort:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 sensorPort:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 sensorPort:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 disparityFilteredSize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 disparityFilteredSize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 disparityFilteredSize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "PTDisparityFilterDEMA_LKT init failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)temporalDisparityFilter:(uint64_t)a3 inDisplacement:(uint64_t)a4 inStatePrev:(uint64_t)a5 inDisparity:(uint64_t)a6 outDisparity:(uint64_t)a7 outState:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Invalid filtered prev size", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)temporalDisparityFilter:(uint64_t)a3 inDisplacement:(uint64_t)a4 inDisparityPrev:(uint64_t)a5 inDisparity:(uint64_t)a6 outDisparity:(uint64_t)a7 disparityBias:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Bias is no longer supported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

@end
