@implementation PTDisparityFilterColorSimilarity

- (PTDisparityFilterColorSimilarity)initWithMetalContext:(id)a3
{
  id v4;
  PTDisparityFilterColorSimilarity *v5;
  float v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  int v10;
  float v11;
  uint64_t i;
  void *v23;
  uint64_t v24;
  MTLComputePipelineState *temporalFilterExponentialMovingAverageColorSimilarities;
  PTDisparityFilterColorSimilarity *v26;
  NSObject *v27;
  _WORD v29[3];
  _WORD v30[3];
  objc_super v31;
  _DWORD v32[9];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PTDisparityFilterColorSimilarity;
  v5 = -[PTDisparityFilterColorSimilarity init](&v31, sel_init);
  if (v5)
  {
    v6 = 0.0;
    v7 = -1;
    v8 = v32;
    do
    {
      v9 = 0;
      v10 = -1;
      do
      {
        v11 = pow(2.71828183, (float)((float)((float)((float)v10 * (float)v10) + (float)((float)(int)v7 * (float)(int)v7)) * -0.5))* 0.159154943;
        v6 = v6 + v11;
        *(float *)&v8[v9] = v11;
        v9 += 3;
        ++v10;
      }
      while (v9 != 9);
      ++v7;
      ++v8;
    }
    while (v7 != 2);
    for (i = 0; i != 9; ++i)
      *(float *)&v32[i] = *(float *)&v32[i] / v6;
    _S0 = v32[0];
    _S1 = v32[1];
    __asm { FCVT            H0, S0 }
    v30[0] = _S0;
    __asm { FCVT            H0, S1 }
    v30[1] = _S0;
    _S0 = v32[2];
    _S1 = v32[3];
    __asm { FCVT            H0, S0 }
    v30[2] = _S0;
    __asm { FCVT            H0, S1 }
    v29[0] = _S0;
    _S0 = v32[4];
    _S1 = v32[5];
    __asm { FCVT            H0, S0 }
    v29[1] = _S0;
    __asm { FCVT            H0, S1 }
    v29[2] = _S0;
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setConstantHalf3:withName:", v30, CFSTR("kWeights2DRow0_half3"));
    objc_msgSend(v23, "setConstantHalf3:withName:", v29, CFSTR("kWeights2DRow1_half3"));
    objc_msgSend(v4, "computePipelineStateFor:withConstants:", CFSTR("temporalFilterExponentialMovingAverageColorSimilarities"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    temporalFilterExponentialMovingAverageColorSimilarities = v5->_temporalFilterExponentialMovingAverageColorSimilarities;
    v5->_temporalFilterExponentialMovingAverageColorSimilarities = (MTLComputePipelineState *)v24;

    if (v5->_temporalFilterExponentialMovingAverageColorSimilarities)
    {
      v5->_frameIndex = 0;
      v26 = v5;
    }
    else
    {
      _PTLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PTDisparityFilterColorSimilarity initWithMetalContext:].cold.1(v27);

      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  objc_storeStrong((id *)&self->_inputRGB, a4);
  return 0;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];
  __int16 v25;
  __int16 v26;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setComputePipelineState:", self->_temporalFilterExponentialMovingAverageColorSimilarities);
  objc_msgSend(v17, "setTexture:atIndex:", self->_inputRGB, 0);
  if (self->_frameIndex)
    v18 = v16;
  else
    v18 = 0;
  objc_msgSend(v17, "setTexture:atIndex:", v18, 1);

  objc_msgSend(v17, "setTexture:atIndex:", v15, 2);
  objc_msgSend(v17, "setTexture:atIndex:", v14, 3);
  objc_msgSend(v17, "setTexture:atIndex:", v13, 4);

  v26 = 12902;
  v25 = 19712;
  objc_msgSend(v17, "setBytes:length:atIndex:", &v26, 2, 0);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v25, 2, 1);
  v19 = objc_msgSend(v14, "width");
  v20 = objc_msgSend(v14, "height");

  v24[0] = v19;
  v24[1] = v20;
  v24[2] = 1;
  v22 = xmmword_1C9322A40;
  v23 = 1;
  objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", v24, &v22);
  objc_msgSend(v17, "endEncoding");
  ++self->_frameIndex;

  return 0;
}

- (void)reset
{
  self->_frameIndex = 0;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  NSObject *v8;

  _PTLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[PTDisparityFilterColorSimilarity temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:].cold.1(v8);

  return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputRGB, 0);
  objc_storeStrong((id *)&self->_temporalFilterExponentialMovingAverageColorSimilarities, 0);
}

- (void)initWithMetalContext:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_temporalFilterExponentialMovingAverageColorSimilarities";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)temporalDisparityFilter:(os_log_t)log inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Not supported", v1, 2u);
}

@end
