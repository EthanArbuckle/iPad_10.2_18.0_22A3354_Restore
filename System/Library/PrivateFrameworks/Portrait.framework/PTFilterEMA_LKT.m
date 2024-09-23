@implementation PTFilterEMA_LKT

- (PTFilterEMA_LKT)initWithMetalContext:(id)a3
{
  id v5;
  PTFilterEMA_LKT *v6;
  PTFilterEMA_LKT *v7;
  float v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;
  float v13;
  uint64_t i;
  void *v25;
  uint64_t v26;
  MTLComputePipelineState *temporalFilterEMA_LKT;
  uint64_t v28;
  MTLComputePipelineState *temporalFilterEMA_LKTDisparityNormal;
  uint64_t v30;
  MTLComputePipelineState *temporalFilterGaussEMA_LKTNormal;
  uint64_t v32;
  MTLComputePipelineState *temporalFilterGaussEMA_LKT;
  PTFilterEMA_LKT *v34;
  NSObject *v35;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  objc_super v69;
  _DWORD v70[9];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v69.receiver = self;
  v69.super_class = (Class)PTFilterEMA_LKT;
  v6 = -[PTFilterEMA_LKT init](&v69, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v67 = 0x408000003F800000;
    v68 = 0x3F8000003E6B851FLL;
    HIDWORD(v66) = 1069547520;
    v8 = 0.0;
    v9 = -1;
    v10 = v70;
    do
    {
      v11 = 0;
      v12 = -1;
      do
      {
        v13 = pow(2.71828183, (float)((float)((float)((float)v12 * (float)v12) + (float)((float)(int)v9 * (float)(int)v9)) * -0.5))* 0.159154943;
        v8 = v8 + v13;
        *(float *)&v10[v11] = v13;
        v11 += 3;
        ++v12;
      }
      while (v11 != 9);
      ++v9;
      ++v10;
    }
    while (v9 != 2);
    for (i = 0; i != 9; ++i)
      *(float *)&v70[i] = *(float *)&v70[i] / v8;
    _S0 = v70[0];
    _S1 = v70[1];
    __asm { FCVT            H0, S0 }
    HIWORD(v65) = _S0;
    __asm { FCVT            H0, S1 }
    LOWORD(v66) = _S0;
    _S0 = v70[2];
    _S1 = v70[3];
    __asm { FCVT            H0, S0 }
    WORD1(v66) = _S0;
    __asm { FCVT            H0, S1 }
    LOWORD(v65) = _S0;
    _S0 = v70[4];
    _S1 = v70[5];
    __asm { FCVT            H0, S0 }
    WORD1(v65) = _S0;
    __asm { FCVT            H0, S1 }
    WORD2(v65) = _S0;
    v25 = (void *)objc_opt_new();
    objc_msgSend(v25, "setConstantValue:type:withName:", &v68, 4, CFSTR("kIIRUpdateCoefficients"), v65, v66, v67);
    objc_msgSend(v25, "setConstantValue:type:withName:", &v67, 4, CFSTR("kMotionThresholdMinMax"));
    objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("temporalFilterEMA_LKT"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    temporalFilterEMA_LKT = v7->_temporalFilterEMA_LKT;
    v7->_temporalFilterEMA_LKT = (MTLComputePipelineState *)v26;

    if (v7->_temporalFilterEMA_LKT)
    {
      objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("temporalFilterEMA_LKTDisparityNormal"), v25);
      v28 = objc_claimAutoreleasedReturnValue();
      temporalFilterEMA_LKTDisparityNormal = v7->_temporalFilterEMA_LKTDisparityNormal;
      v7->_temporalFilterEMA_LKTDisparityNormal = (MTLComputePipelineState *)v28;

      if (v7->_temporalFilterEMA_LKTDisparityNormal)
      {
        objc_msgSend(v25, "setConstantValue:type:withName:", (char *)&v66 + 4, 3, CFSTR("kGaussianWidth"));
        objc_msgSend(v25, "setConstantValue:type:withName:", (char *)&v65 + 6, 18, CFSTR("kWeights2DRow0"));
        objc_msgSend(v25, "setConstantValue:type:withName:", &v65, 18, CFSTR("kWeights2DRow1"));
        objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("temporalFilterGaussEMA_LKTNormal"), v25);
        v30 = objc_claimAutoreleasedReturnValue();
        temporalFilterGaussEMA_LKTNormal = v7->_temporalFilterGaussEMA_LKTNormal;
        v7->_temporalFilterGaussEMA_LKTNormal = (MTLComputePipelineState *)v30;

        if (v7->_temporalFilterGaussEMA_LKTNormal)
        {
          objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("temporalFilterGaussEMA_LKT"), v25);
          v32 = objc_claimAutoreleasedReturnValue();
          temporalFilterGaussEMA_LKT = v7->_temporalFilterGaussEMA_LKT;
          v7->_temporalFilterGaussEMA_LKT = (MTLComputePipelineState *)v32;

          if (v7->_temporalFilterGaussEMA_LKT)
          {
            v34 = v7;
LABEL_23:

            goto LABEL_24;
          }
          _PTLogSystem();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[PTFilterEMA_LKT initWithMetalContext:].cold.4(v35, v57, v58, v59, v60, v61, v62, v63);
        }
        else
        {
          _PTLogSystem();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[PTFilterEMA_LKT initWithMetalContext:].cold.3(v35, v50, v51, v52, v53, v54, v55, v56);
        }
      }
      else
      {
        _PTLogSystem();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[PTFilterEMA_LKT initWithMetalContext:].cold.2(v35, v43, v44, v45, v46, v47, v48, v49);
      }
    }
    else
    {
      _PTLogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[PTFilterEMA_LKT initWithMetalContext:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
    }

    v34 = 0;
    goto LABEL_23;
  }
  v34 = 0;
LABEL_24:

  return v34;
}

- (PTFilterEMA_LKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v13;
  PTFilterEMA_LKT *v14;
  PTFilterEMA_LKT *v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *dumpInputOutputFolder;
  void *v22;
  uint64_t v23;
  PTOpticalFlow *v24;
  uint64_t v25;
  PTOpticalFlow *opticalFlow;
  PTFilterEMA_LKT *v27;
  __int128 v29;
  unint64_t var2;

  v13 = a3;
  v14 = -[PTFilterEMA_LKT initWithMetalContext:](self, "initWithMetalContext:", v13);
  v15 = v14;
  if (v14)
  {
    v14->_frameIndex = 0;
    v16 = *(_OWORD *)&a4->var0;
    v14->_disparitySize.depth = a4->var2;
    *(_OWORD *)&v14->_disparitySize.width = v16;
    v17 = *(_OWORD *)&a5->var0;
    v14->_disparityFilteredSize.depth = a5->var2;
    *(_OWORD *)&v14->_disparityFilteredSize.width = v17;
    PTDefaultsGetDictionary();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PortraitDump"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      +[PTUtil temporaryDirectory:](PTUtil, "temporaryDirectory:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      dumpInputOutputFolder = v15->_dumpInputOutputFolder;
      v15->_dumpInputOutputFolder = (NSString *)v20;

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PTDisparityFilterLKTQuality"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      v23 = (int)objc_msgSend(v22, "intValue");
    else
      v23 = 1;
    v24 = [PTOpticalFlow alloc];
    v29 = *(_OWORD *)&a7->var0;
    var2 = a7->var2;
    v25 = -[PTOpticalFlow initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:](v24, "initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:", v13, &v29, v23, 0, 0, 1);
    opticalFlow = v15->_opticalFlow;
    v15->_opticalFlow = (PTOpticalFlow *)v25;

    v27 = v15;
  }

  return v15;
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  return -[PTOpticalFlow estimateDisplacementStream:destRGBA:outDisplacement:](self->_opticalFlow, "estimateDisplacementStream:destRGBA:outDisplacement:", a3, a4, a5);
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  _PTLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[PTFilterEMA_LKT temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  return -1;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  double v9;
  int result;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a5 == a7)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTFilterEMA_LKT temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    return -1;
  }
  else
  {
    LODWORD(v9) = 1.0;
    result = -[PTFilterEMA_LKT emaFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:scale:](self, "emaFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:scale:", a3, a4, a5, a6, v9);
    ++self->_frameIndex;
  }
  return result;
}

- (int)emaFilter:(id)a3 inDisplacement:(id)a4 inTexPrev:(id)a5 inTex:(id)a6 outTex:(id)a7 frameIndex:(int)a8 scale:(float)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[3];
  float v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v36 = a9;
  if (a8)
  {
    objc_msgSend(v16, "computeCommandEncoder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      _PTLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    }
    objc_msgSend(v21, "setComputePipelineState:", self->_temporalFilterEMA_LKT);
    objc_msgSend(v21, "setTexture:atIndex:", v17, 0);
    objc_msgSend(v21, "setTexture:atIndex:", v18, 1);
    objc_msgSend(v21, "setTexture:atIndex:", v19, 2);
    objc_msgSend(v21, "setTexture:atIndex:", v20, 3);
    objc_msgSend(v21, "setBytes:length:atIndex:", &v36, 4, 0);
    v35[0] = objc_msgSend(v20, "width");
    v35[1] = objc_msgSend(v20, "height");
    v35[2] = 1;
    v33 = xmmword_1C9322A40;
    v34 = 1;
    objc_msgSend(v21, "dispatchThreads:threadsPerThreadgroup:", v35, &v33);
    objc_msgSend(v21, "endEncoding");
  }
  else
  {
    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v30;
    if (a9 == 1.0)
    {
      objc_msgSend(v30, "copy:inTex:outTex:", v16, v19, v20);
    }
    else
    {
      *(float *)&v31 = a9;
      objc_msgSend(v30, "multiply:inTex:outTex:multiplier:", v16, v19, v20, v31);
    }
  }

  return 0;
}

- (int)gaussEMAFilter:(id)a3 inDisplacement:(id)a4 inTexPrev:(id)a5 inTex:(id)a6 outTex:(id)a7 frameIndex:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  PTMetalContext *metalContext;
  id v31;
  id v32;
  id v33;
  void *v34;
  __int128 v36;
  uint64_t v37;
  _QWORD v38[3];

  v14 = a4;
  v15 = a5;
  if (a8)
  {
    v16 = a7;
    v17 = a6;
    v18 = a3;
    objc_msgSend(v18, "computeCommandEncoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      _PTLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    }
    objc_msgSend(v19, "setComputePipelineState:", self->_temporalFilterGaussEMA_LKT);
    objc_msgSend(v19, "setTexture:atIndex:", v14, 0);
    objc_msgSend(v19, "setTexture:atIndex:", v15, 1);
    objc_msgSend(v19, "setTexture:atIndex:", v17, 2);

    objc_msgSend(v19, "setTexture:atIndex:", v16, 3);
    v28 = objc_msgSend(v16, "width");
    v29 = objc_msgSend(v16, "height");

    v38[0] = v28;
    v38[1] = v29;
    v38[2] = 1;
    v36 = xmmword_1C9322A40;
    v37 = 1;
    objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v38, &v36);
    objc_msgSend(v19, "endEncoding");

  }
  else
  {
    metalContext = self->_metalContext;
    v31 = a7;
    v32 = a6;
    v33 = a3;
    -[PTMetalContext textureUtil](metalContext, "textureUtil");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "copy:inTex:outTex:", v33, v32, v31);

  }
  return 0;
}

- (int)gaussEMAFilterNormal:(id)a3 inDisplacement:(id)a4 inNormalPrev:(id)a5 inNormal:(id)a6 outNormal:(id)a7 frameIndex:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  PTMetalContext *metalContext;
  id v31;
  id v32;
  id v33;
  void *v34;
  __int128 v36;
  uint64_t v37;
  _QWORD v38[3];

  v14 = a4;
  v15 = a5;
  if (a8)
  {
    v16 = a7;
    v17 = a6;
    v18 = a3;
    objc_msgSend(v18, "computeCommandEncoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      _PTLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    }
    objc_msgSend(v19, "setComputePipelineState:", self->_temporalFilterGaussEMA_LKTNormal);
    objc_msgSend(v19, "setTexture:atIndex:", v14, 0);
    objc_msgSend(v19, "setTexture:atIndex:", v15, 1);
    objc_msgSend(v19, "setTexture:atIndex:", v17, 2);

    objc_msgSend(v19, "setTexture:atIndex:", v16, 3);
    v28 = objc_msgSend(v16, "width");
    v29 = objc_msgSend(v16, "height");

    v38[0] = v28;
    v38[1] = v29;
    v38[2] = 1;
    v36 = xmmword_1C9322A40;
    v37 = 1;
    objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v38, &v36);
    objc_msgSend(v19, "endEncoding");

  }
  else
  {
    metalContext = self->_metalContext;
    v31 = a7;
    v32 = a6;
    v33 = a3;
    -[PTMetalContext textureUtil](metalContext, "textureUtil");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "copy:inTex:outTex:", v33, v32, v31);

  }
  return 0;
}

- (int)emaFilterDisparityNormal:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 inNormalPrev:(id)a8 inNormal:(id)a9 outNormal:(id)a10 frameIndex:(int)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  PTMetalContext *metalContext;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[3];

  v17 = a4;
  v18 = a5;
  v19 = a8;
  if (a11)
  {
    v20 = a10;
    v21 = a9;
    v22 = a7;
    v23 = a6;
    v24 = a3;
    objc_msgSend(v24, "computeCommandEncoder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      _PTLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

    }
    objc_msgSend(v25, "setComputePipelineState:", self->_temporalFilterEMA_LKTDisparityNormal);
    objc_msgSend(v25, "setTexture:atIndex:", v17, 0);
    objc_msgSend(v25, "setTexture:atIndex:", v18, 1);
    objc_msgSend(v25, "setTexture:atIndex:", v23, 2);

    objc_msgSend(v25, "setTexture:atIndex:", v19, 3);
    objc_msgSend(v25, "setTexture:atIndex:", v21, 4);

    objc_msgSend(v25, "setTexture:atIndex:", v22, 5);
    objc_msgSend(v25, "setTexture:atIndex:", v20, 6);

    v34 = objc_msgSend(v22, "width");
    v35 = objc_msgSend(v22, "height");

    v47[0] = v34;
    v47[1] = v35;
    v47[2] = 1;
    v45 = xmmword_1C9322A40;
    v46 = 1;
    objc_msgSend(v25, "dispatchThreads:threadsPerThreadgroup:", v47, &v45);
    objc_msgSend(v25, "endEncoding");

  }
  else
  {
    metalContext = self->_metalContext;
    v37 = a10;
    v38 = a9;
    v39 = a7;
    v40 = a6;
    v41 = a3;
    -[PTMetalContext textureUtil](metalContext, "textureUtil");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "copy:inTex:outTex:", v41, v40, v39);

    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "copy:inTex:outTex:", v41, v38, v37);

  }
  return 0;
}

- (void)reset
{
  self->_frameIndex = 0;
  -[PTOpticalFlow reset](self->_opticalFlow, "reset");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dumpInputOutputFolder, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_temporalFilterEMA_LKTDisparityNormal, 0);
  objc_storeStrong((id *)&self->_temporalFilterGaussEMA_LKTNormal, 0);
  objc_storeStrong((id *)&self->_temporalFilterGaussEMA_LKT, 0);
  objc_storeStrong((id *)&self->_temporalFilterEMA_LKT, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)temporalDisparityFilter:(uint64_t)a3 inDisplacement:(uint64_t)a4 inStatePrev:(uint64_t)a5 inDisparity:(uint64_t)a6 outDisparity:(uint64_t)a7 outState:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Unsupported", a5, a6, a7, a8, 0);
}

- (void)temporalDisparityFilter:(uint64_t)a3 inDisplacement:(uint64_t)a4 inDisparityPrev:(uint64_t)a5 inDisparity:(uint64_t)a6 outDisparity:(uint64_t)a7 disparityBias:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Invalid filtered prev size", a5, a6, a7, a8, 0);
}

@end
