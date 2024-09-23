@implementation PTDisparityFilterExponentialMovingAverageLKT

- (PTDisparityFilterExponentialMovingAverageLKT)initWithMetalContext:(id)a3
{
  id v5;
  PTDisparityFilterExponentialMovingAverageLKT *v6;
  PTDisparityFilterExponentialMovingAverageLKT *v7;
  uint64_t v8;
  MTLComputePipelineState *temporalFilterExponentialMovingAverageLKT;
  uint64_t v10;
  MTLComputePipelineState *copyDisparityWithBias;
  PTDisparityFilterExponentialMovingAverageLKT *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PTDisparityFilterExponentialMovingAverageLKT;
  v6 = -[PTDisparityFilterExponentialMovingAverageLKT init](&v29, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  *(_WORD *)v7->_iirUpdateCoefficient = 13312;
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("temporalFilterExponentialMovingAverageLKT"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  temporalFilterExponentialMovingAverageLKT = v7->_temporalFilterExponentialMovingAverageLKT;
  v7->_temporalFilterExponentialMovingAverageLKT = (MTLComputePipelineState *)v8;

  if (!v7->_temporalFilterExponentialMovingAverageLKT)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTDisparityFilterExponentialMovingAverageLKT initWithMetalContext:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_9;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("copyDisparityWithBias"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  copyDisparityWithBias = v7->_copyDisparityWithBias;
  v7->_copyDisparityWithBias = (MTLComputePipelineState *)v10;

  if (!v7->_copyDisparityWithBias)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTDisparityFilterExponentialMovingAverageLKT initWithMetalContext:].cold.2(v13, v21, v22, v23, v24, v25, v26, v27);
LABEL_9:

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v12 = v7;
LABEL_11:

  return v12;
}

- (PTDisparityFilterExponentialMovingAverageLKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v13;
  PTDisparityFilterExponentialMovingAverageLKT *v14;
  PTDisparityFilterExponentialMovingAverageLKT *v15;
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
  PTDisparityFilterExponentialMovingAverageLKT *v27;
  __int128 v29;
  unint64_t var2;

  v13 = a3;
  v14 = -[PTDisparityFilterExponentialMovingAverageLKT initWithMetalContext:](self, "initWithMetalContext:", v13);
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
    v25 = -[PTOpticalFlow initWithMetalContext:colorSize:lktPreset:](v24, "initWithMetalContext:colorSize:lktPreset:", v13, &v29, v23);
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
  id v14;
  id v15;
  id v16;
  double v17;
  void *v18;

  v14 = a8;
  v15 = a7;
  v16 = a3;
  LODWORD(v17) = 0;
  LODWORD(a6) = -[PTDisparityFilterExponentialMovingAverageLKT temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:](self, "temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:", v16, a4, a5, a6, v15, v17);
  -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v18, "copy:inTex:outTex:", v16, v15, v14);

  return a4 | a6;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  int v21;
  NSObject *v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v16 == v18)
  {
    _PTLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PTDisparityFilterExponentialMovingAverageLKT temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:].cold.1(v22);

    v21 = -1;
  }
  else
  {
    if (self->_frameCount)
    {
      LOWORD(v19) = *(_WORD *)self->_iirUpdateCoefficient;
      *(float *)&v20 = a8;
      v21 = -[PTDisparityFilterExponentialMovingAverageLKT exponentialMovingAverageFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:updateCoefficient:disparityBias:](self, "exponentialMovingAverageFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:updateCoefficient:disparityBias:", v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      *(float *)&v19 = a8;
      -[PTDisparityFilterExponentialMovingAverageLKT copyDisparityWithBias:inDisparity:outDisparity:disparityBias:](self, "copyDisparityWithBias:inDisparity:outDisparity:disparityBias:", v14, v17, v18, v19);
      v21 = 0;
    }
    ++self->_frameCount;
  }

  return v21;
}

- (int)exponentialMovingAverageFilter:(PTDisparityFilterExponentialMovingAverageLKT *)self inDisplacement:(SEL)a2 inDisparityPrev:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 updateCoefficient:(id)a6 disparityBias:(id)a7
{
  __int16 v7;
  int v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[3];
  int v33;
  __int16 v34;

  v34 = v7;
  v33 = v8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

  }
  objc_msgSend(v18, "setComputePipelineState:", self->_temporalFilterExponentialMovingAverageLKT);
  objc_msgSend(v18, "setTexture:atIndex:", v17, 0);

  objc_msgSend(v18, "setTexture:atIndex:", v16, 1);
  objc_msgSend(v18, "setTexture:atIndex:", v15, 2);

  objc_msgSend(v18, "setTexture:atIndex:", v14, 3);
  objc_msgSend(v18, "setBytes:length:atIndex:", &v34, 2, 0);
  objc_msgSend(v18, "setBytes:length:atIndex:", &v33, 4, 1);
  v27 = objc_msgSend(v14, "width");
  v28 = objc_msgSend(v14, "height");

  v32[0] = v27;
  v32[1] = v28;
  v32[2] = 1;
  v30 = xmmword_1C9322A40;
  v31 = 1;
  objc_msgSend(v18, "dispatchThreads:threadsPerThreadgroup:", v32, &v30);
  objc_msgSend(v18, "endEncoding");

  return 0;
}

- (int)copyDisparityWithBias:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 disparityBias:(float)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  float v26;

  v26 = a6;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  objc_msgSend(v11, "setComputePipelineState:", self->_copyDisparityWithBias);
  objc_msgSend(v11, "setTexture:atIndex:", v10, 0);

  objc_msgSend(v11, "setTexture:atIndex:", v9, 1);
  objc_msgSend(v11, "setBytes:length:atIndex:", &v26, 4, 0);
  v20 = objc_msgSend(v9, "width");
  v21 = objc_msgSend(v9, "height");

  v25[0] = v20;
  v25[1] = v21;
  v25[2] = 1;
  v23 = xmmword_1C9322A40;
  v24 = 1;
  objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v25, &v23);
  objc_msgSend(v11, "endEncoding");

  return 0;
}

- (void)reset
{
  self->_frameCount = 0;
  -[PTOpticalFlow reset](self->_opticalFlow, "reset");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dumpInputOutputFolder, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_copyDisparityWithBias, 0);
  objc_storeStrong((id *)&self->_temporalFilterExponentialMovingAverageLKT, 0);
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

- (void)temporalDisparityFilter:(os_log_t)log inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Invalid filtered prev size", v1, 2u);
}

@end
