@implementation PTColorTemperatureCorrection

- (PTColorTemperatureCorrection)initWithMetalContext:(id)a3
{
  id v5;
  PTColorTemperatureCorrection *v6;
  id *p_metalContext;
  uint64_t v8;
  MTLComputePipelineState *colorTemperatureCorrectionYUVCube;
  uint64_t v10;
  MTLComputePipelineState *colorTemperatureHistogram;
  uint64_t v12;
  MTLComputePipelineState *colorTemperatureClear;
  uint64_t v14;
  MTLComputePipelineState *colorTemperatureFromHistogram;
  void *v16;
  uint64_t v17;
  MTLBuffer *colorTemperatureHistogramBuffer;
  PTColorTemperatureCorrection *v19;
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
  objc_super v50;

  v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTColorTemperatureCorrection;
  v6 = -[PTColorTemperatureCorrection init](&v50, sel_init);
  p_metalContext = (id *)&v6->_metalContext;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  -[PTMetalContext computePipelineStateFor:withConstants:](v6->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("colorTemperatureCorrectionYUVCube"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  colorTemperatureCorrectionYUVCube = v6->_colorTemperatureCorrectionYUVCube;
  v6->_colorTemperatureCorrectionYUVCube = (MTLComputePipelineState *)v8;

  if (!v6->_colorTemperatureCorrectionYUVCube)
  {
    _PTLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PTColorTemperatureCorrection initWithMetalContext:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_14;
  }
  objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("colorTemperatureHistogram"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  colorTemperatureHistogram = v6->_colorTemperatureHistogram;
  v6->_colorTemperatureHistogram = (MTLComputePipelineState *)v10;

  if (!v6->_colorTemperatureHistogram)
  {
    _PTLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PTColorTemperatureCorrection initWithMetalContext:].cold.2(v20, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_14;
  }
  objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("colorTemperatureClear"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  colorTemperatureClear = v6->_colorTemperatureClear;
  v6->_colorTemperatureClear = (MTLComputePipelineState *)v12;

  if (!v6->_colorTemperatureClear)
  {
    _PTLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PTColorTemperatureCorrection initWithMetalContext:].cold.3(v20, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_14;
  }
  objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("colorTemperatureFromHistogram"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  colorTemperatureFromHistogram = v6->_colorTemperatureFromHistogram;
  v6->_colorTemperatureFromHistogram = (MTLComputePipelineState *)v14;

  if (!v6->_colorTemperatureFromHistogram)
  {
    _PTLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PTColorTemperatureCorrection initWithMetalContext:].cold.4(v20, v42, v43, v44, v45, v46, v47, v48);
LABEL_14:

    v19 = 0;
    goto LABEL_15;
  }
  objc_msgSend(*p_metalContext, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "newBufferWithLength:options:", 44, 0);
  colorTemperatureHistogramBuffer = v6->_colorTemperatureHistogramBuffer;
  v6->_colorTemperatureHistogramBuffer = (MTLBuffer *)v17;

  v19 = v6;
LABEL_15:

  return v19;
}

- (void)colorTemperatureCorrectionYUVCube:(id)a3 inYUV:(id)a4 outColorTemperatureCorrectionCube:(id)a5 colorTemperatureRGB:(id)a6 colorCorrectionIntensity:(float)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  int64x2_t v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  int v24;
  float v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v25 = a7;
  objc_msgSend(v13, "transferFunction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v16, 1);

  v24 = v17;
  memset(v23, 0, sizeof(v23));
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v13, 0);
  memset(v22, 0, sizeof(v22));
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v13, 1);
  objc_msgSend(v12, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setComputePipelineState:", self->_colorTemperatureCorrectionYUVCube);
  objc_msgSend(v18, "setTexture:atIndex:", v14, 0);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", v15, 0, 0);
  objc_msgSend(v18, "setBytes:length:atIndex:", v22, 24, 1);
  objc_msgSend(v18, "setBytes:length:atIndex:", &v24, 4, 2);
  objc_msgSend(v18, "setBytes:length:atIndex:", v23, 24, 3);
  objc_msgSend(v18, "setBytes:length:atIndex:", &v25, 4, 4);
  v21[0] = objc_msgSend(v14, "width");
  v21[1] = objc_msgSend(v14, "height");
  v21[2] = objc_msgSend(v14, "depth");
  v19 = vdupq_n_s64(0x10uLL);
  v20 = 1;
  objc_msgSend(v18, "dispatchThreads:threadsPerThreadgroup:", v21, &v19);
  objc_msgSend(v18, "endEncoding");

}

- (void)estimateColorTemperatureFromBackground:(id)a3 inYUV:(id)a4 inBackgroundLuma:(id)a5 inBackgroundChroma:(id)a6 outColorTemperatureBuffer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  id v26;
  __int128 v27;
  uint64_t v28;
  int64x2_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[3];
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  _QWORD v41[3];
  int v42[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26 = a7;
  objc_msgSend(v13, "transferFunction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v16, 0);

  v42[0] = v17;
  memset(v41, 0, sizeof(v41));
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v13, 1);
  objc_msgSend(v12, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setComputePipelineState:", self->_colorTemperatureClear);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", self->_colorTemperatureHistogramBuffer, 0, 0);
  v39 = xmmword_1C9323440;
  v40 = 1;
  v37 = xmmword_1C9323450;
  v38 = 1;
  objc_msgSend(v18, "dispatchThreads:threadsPerThreadgroup:", &v39, &v37);
  objc_msgSend(v18, "endEncoding");
  v19 = objc_msgSend(v14, "width");
  v20 = objc_msgSend(v14, "height");
  +[PTColorConversion getChromaOffsetFromLuma:texChroma:](PTColorConversion, "getChromaOffsetFromLuma:texChroma:", v14, v15);
  v36 = v21;
  objc_msgSend(v12, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setComputePipelineState:", self->_colorTemperatureHistogram);
  objc_msgSend(v22, "setTexture:atIndex:", v14, 0);
  objc_msgSend(v22, "setTexture:atIndex:", v15, 1);
  objc_msgSend(v22, "setBytes:length:atIndex:", v41, 24, 0);
  objc_msgSend(v22, "setBytes:length:atIndex:", v42, 4, 1);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v36, 8, 2);
  objc_msgSend(v22, "setBuffer:offset:atIndex:", self->_colorTemperatureHistogramBuffer, 0, 3);
  v23 = (float)v19 / (float)v20;
  v24 = sqrtf(2048.0 / v23);
  v35[0] = (int)((int)(float)(v23 * v24) & 0xFFFFFFF8);
  v35[1] = (int)((int)v24 & 0xFFFFFFFC);
  v35[2] = 1;
  v33 = xmmword_1C9323090;
  v34 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v35, &v33);
  objc_msgSend(v22, "endEncoding");
  v31 = xmmword_1C9323470;
  v32 = xmmword_1C9323460;
  objc_msgSend(v12, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setComputePipelineState:", self->_colorTemperatureFromHistogram);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", self->_colorTemperatureHistogramBuffer, 0, 0);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v26, 0, 1);
  objc_msgSend(v25, "setBytes:length:atIndex:", &v32, 16, 2);
  objc_msgSend(v25, "setBytes:length:atIndex:", &v31, 16, 3);
  v29 = vdupq_n_s64(1uLL);
  v30 = 1;
  v27 = xmmword_1C9323480;
  v28 = 1;
  objc_msgSend(v25, "dispatchThreads:threadsPerThreadgroup:", &v29, &v27);
  objc_msgSend(v25, "endEncoding");

}

- (id)description
{
  unsigned int *v2;
  void *v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int *v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;
  unsigned int *v21;
  uint64_t v22;

  v2 = (unsigned int *)-[MTLBuffer contents](self->_colorTemperatureHistogramBuffer, "contents");
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = atomic_load(v2);
  v5 = v2 + 1;
  v6 = atomic_load(v2 + 1);
  v7 = v2 + 2;
  v8 = atomic_load(v2 + 2);
  v9 = v2 + 3;
  v10 = atomic_load(v2 + 3);
  v11 = v2 + 4;
  v12 = atomic_load(v2 + 4);
  v13 = v2 + 5;
  v14 = atomic_load(v2 + 5);
  v15 = v2 + 6;
  v16 = atomic_load(v2 + 6);
  v17 = v2 + 7;
  v18 = atomic_load(v2 + 7);
  v19 = v2 + 8;
  v20 = atomic_load(v2 + 8);
  v21 = v2 + 9;
  v22 = atomic_load(v2 + 9);
  LODWORD(v2) = atomic_load(v2);
  LODWORD(v5) = atomic_load(v5);
  LODWORD(v2) = (_DWORD)v5 + (_DWORD)v2;
  LODWORD(v5) = atomic_load(v7);
  LODWORD(v7) = atomic_load(v9);
  LODWORD(v2) = (_DWORD)v2 + (_DWORD)v5 + (_DWORD)v7;
  LODWORD(v5) = atomic_load(v11);
  LODWORD(v7) = atomic_load(v13);
  LODWORD(v5) = (_DWORD)v5 + (_DWORD)v7;
  LODWORD(v7) = atomic_load(v15);
  LODWORD(v2) = (_DWORD)v2 + (_DWORD)v5 + (_DWORD)v7;
  LODWORD(v5) = atomic_load(v17);
  LODWORD(v7) = atomic_load(v19);
  LODWORD(v5) = (_DWORD)v5 + (_DWORD)v7;
  LODWORD(v7) = atomic_load(v21);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Histogram\t%i\t%i\t%i\t%i\t%i\t%i\t%i\t%i\t%i\t%i\t(sum: %i)"), v4, v6, v8, v10, v12, v14, v16, v18, v20, v22, ((_DWORD)v2 + (_DWORD)v5 + (_DWORD)v7));
}

- (float)debugColorTemperature
{
  return *(float *)(-[MTLBuffer contents](self->_colorTemperatureHistogramBuffer, "contents") + 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorTemperatureHistogramBuffer, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_colorTemperatureFromHistogram, 0);
  objc_storeStrong((id *)&self->_colorTemperatureClear, 0);
  objc_storeStrong((id *)&self->_colorTemperatureHistogram, 0);
  objc_storeStrong((id *)&self->_colorTemperatureCorrectionYUVCube, 0);
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

@end
