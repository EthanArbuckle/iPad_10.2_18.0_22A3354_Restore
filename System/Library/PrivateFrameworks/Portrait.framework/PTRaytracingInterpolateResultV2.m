@implementation PTRaytracingInterpolateResultV2

- (PTRaytracingInterpolateResultV2)initWithMetalContext:(id)a3 useExportQualityNoise:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PTRaytracingInterpolateResultV2 *v8;
  PTRaytracingInterpolateResultV2 *v9;
  id *p_metalContext;
  uint64_t v11;
  uint64_t v12;
  MTLTexture *precomputedGaussian;
  void *v14;
  uint64_t v15;
  MTLComputePipelineState **interpolateRGBWeightSourceYUVDestRGBA;
  MTLComputePipelineState **interpolateRGBWeightSourceYUVDestYUV;
  MTLComputePipelineState **interpolateRGBWeightSourceRGBADestRGBA;
  MTLComputePipelineState **interpolateRGBWeightRGBALinearDestRGBA;
  MTLComputePipelineState **interpolateRGBWeightRGBALinearDestYUV;
  uint64_t v21;
  MTLComputePipelineState *v22;
  uint64_t v23;
  MTLComputePipelineState *v24;
  uint64_t v25;
  MTLComputePipelineState *v26;
  uint64_t v27;
  MTLComputePipelineState *v28;
  uint64_t v29;
  MTLComputePipelineState *v30;
  PTRaytracingInterpolateResultV2 *v31;
  NSObject *v32;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v69;
  unsigned int v70;
  objc_super v71;

  v4 = a4;
  v7 = a3;
  v71.receiver = self;
  v71.super_class = (Class)PTRaytracingInterpolateResultV2;
  v8 = -[PTRaytracingInterpolateResultV2 init](&v71, sel_init);
  v9 = v8;
  if (v8)
  {
    p_metalContext = (id *)&v8->_metalContext;
    objc_storeStrong((id *)&v8->_metalContext, a3);
    if (v4)
      v11 = 512;
    else
      v11 = 256;
    +[PTPrecomputeRandom computeGaussian:sideLength:](PTPrecomputeRandom, "computeGaussian:sideLength:", v9->_metalContext, v11, v7);
    v12 = objc_claimAutoreleasedReturnValue();
    precomputedGaussian = v9->_precomputedGaussian;
    v9->_precomputedGaussian = (MTLTexture *)v12;

    v9->_precomputedGaussianOffsetMaxValue = v11 - 1;
    v14 = (void *)objc_opt_new();
    v15 = 0;
    interpolateRGBWeightSourceYUVDestRGBA = v9->_interpolateRGBWeightSourceYUVDestRGBA;
    interpolateRGBWeightSourceYUVDestYUV = v9->_interpolateRGBWeightSourceYUVDestYUV;
    interpolateRGBWeightSourceRGBADestRGBA = v9->_interpolateRGBWeightSourceRGBADestRGBA;
    interpolateRGBWeightRGBALinearDestRGBA = v9->_interpolateRGBWeightRGBALinearDestRGBA;
    interpolateRGBWeightRGBALinearDestYUV = v9->_interpolateRGBWeightRGBALinearDestYUV;
    while (1)
    {
      v70 = supportedColorTransferFunctions_0[v15];
      objc_msgSend(v14, "reset");
      objc_msgSend(v14, "setConstantValue:type:withName:", &v70, 29, CFSTR("kColorTransferFunctionToLinear"));
      objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBWeightSourceYUVDestRGBA_V2"), v14);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = interpolateRGBWeightSourceYUVDestRGBA[v70];
      interpolateRGBWeightSourceYUVDestRGBA[v70] = (MTLComputePipelineState *)v21;

      if (!interpolateRGBWeightSourceYUVDestRGBA[v70])
        break;
      objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBWeightSourceYUVDestYUV_V2"), v14);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = interpolateRGBWeightSourceYUVDestYUV[v70];
      interpolateRGBWeightSourceYUVDestYUV[v70] = (MTLComputePipelineState *)v23;

      if (!interpolateRGBWeightSourceYUVDestYUV[v70])
      {
        _PTLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:].cold.2(v32, v40, v41, v42, v43, v44, v45, v46);
        goto LABEL_24;
      }
      objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBWeightSourceRGBADestRGBA_V2"), v14);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = interpolateRGBWeightSourceRGBADestRGBA[v70];
      interpolateRGBWeightSourceRGBADestRGBA[v70] = (MTLComputePipelineState *)v25;

      if (!interpolateRGBWeightSourceRGBADestRGBA[v70])
      {
        _PTLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:].cold.3(v32, v47, v48, v49, v50, v51, v52, v53);
        goto LABEL_24;
      }
      objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBWeightRGBALinearDestRGBA_V2"), v14);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = interpolateRGBWeightRGBALinearDestRGBA[v70];
      interpolateRGBWeightRGBALinearDestRGBA[v70] = (MTLComputePipelineState *)v27;

      if (!interpolateRGBWeightRGBALinearDestRGBA[v70])
      {
        _PTLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:].cold.4(v32, v54, v55, v56, v57, v58, v59, v60);
        goto LABEL_24;
      }
      objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBWeightRGBALinearDestYUV_V2"), v14);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = interpolateRGBWeightRGBALinearDestYUV[v70];
      interpolateRGBWeightRGBALinearDestYUV[v70] = (MTLComputePipelineState *)v29;

      if (!interpolateRGBWeightRGBALinearDestYUV[v70])
      {
        _PTLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:].cold.5(v32, v61, v62, v63, v64, v65, v66, v67);
        goto LABEL_24;
      }
      if (++v15 == 5)
      {
        v31 = v9;
        v7 = v69;
        goto LABEL_25;
      }
    }
    _PTLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);
LABEL_24:
    v7 = v69;

    v31 = 0;
LABEL_25:

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)interpolateRGBWeightUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5
{
  id v8;
  id v9;
  id v10;
  int32x2_t v11;
  uint64_t v12;
  unsigned __int128 v13;
  __int16 v14;
  __int16 v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  _BYTE v56[10];
  uint64_t v57;
  uint64_t v58;
  _DWORD v59[2];
  _WORD v60[2];
  _WORD v61[2];
  int64x2_t v62;
  unsigned __int128 v63;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11.i16[0] = 0;
  v11.i16[2] = 0;
  v62 = 0u;
  v63 = 0u;
  if (v9)
  {
    objc_msgSend(v9, "scissorRect");
    v13 = v63;
    v53 = v13 >> 64;
    v12 = v13;
    v11 = vmovn_s64(v62);
  }
  else
  {
    v53 = 0;
    v12 = 0;
  }
  v61[1] = v11.i16[2];
  v61[0] = v11.i16[0];
  +[PTRandom nextUshort2:seed:](PTRandom, "nextUshort2:seed:", self->_precomputedGaussianOffsetMaxValue, objc_msgSend(v9, "frameId"));
  v60[1] = v14;
  v60[0] = v15;
  +[PTRaytracingInterpolateResultV2 calculateVarReadNoise:](PTRaytracingInterpolateResultV2, "calculateVarReadNoise:", v9);
  v59[0] = v16;
  v59[1] = v17;
  objc_msgSend(v9, "sourceColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transferFunction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v19, 1);

  objc_msgSend(v9, "sourceColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isRGB") & 1) != 0)
  {
    objc_msgSend(v9, "destinationColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isRGB");

    if (v23)
    {
      objc_msgSend(v8, "setComputePipelineState:", self->_interpolateRGBWeightSourceRGBADestRGBA[v20]);
      objc_msgSend(v9, "sourceColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "texRGBA");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTexture:atIndex:", v25, 0);

      objc_msgSend(v8, "setTexture:atIndex:", v10, 1);
      objc_msgSend(v8, "setTexture:atIndex:", self->_precomputedGaussian, 2);
      objc_msgSend(v9, "destinationColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "texRGBA");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTexture:atIndex:", v27, 3);

      objc_msgSend(v8, "setBytes:length:atIndex:", v59, 8, 0);
      objc_msgSend(v8, "setBytes:length:atIndex:", v60, 4, 1);
      objc_msgSend(v8, "setBytes:length:atIndex:", v61, 4, 2);
      goto LABEL_12;
    }
  }
  else
  {

  }
  v51 = v12;
  v52 = v10;
  *(_WORD *)&v56[8] = 0;
  v57 = 0;
  v58 = 0;
  objc_msgSend(v9, "sourceColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v28, 1);

  objc_msgSend(v9, "sourceColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "texLuma");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "texChroma");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v56 = (unsigned __int16)+[PTColorConversion getChromaSubsampledFromLuma:texChroma:](PTColorConversion, "getChromaSubsampledFromLuma:texChroma:", v30, v32);

  objc_msgSend(v9, "destinationColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = objc_msgSend(v33, "isRGB");

  if ((_DWORD)v29)
  {
    objc_msgSend(v8, "setComputePipelineState:", self->_interpolateRGBWeightSourceYUVDestRGBA[v20]);
    objc_msgSend(v9, "sourceColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "texLuma");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTexture:atIndex:", v35, 0);

    objc_msgSend(v9, "sourceColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "texChroma");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTexture:atIndex:", v37, 1);

    v10 = v52;
    objc_msgSend(v8, "setTexture:atIndex:", v52, 2);
    objc_msgSend(v8, "setTexture:atIndex:", self->_precomputedGaussian, 3);
    objc_msgSend(v9, "destinationColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "texRGBA");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTexture:atIndex:", v39, 4);

    objc_msgSend(v8, "setBytes:length:atIndex:", v59, 8, 0);
    objc_msgSend(v8, "setBytes:length:atIndex:", v60, 4, 1);
    objc_msgSend(v8, "setBytes:length:atIndex:", &v56[2], 24, 2);
    objc_msgSend(v8, "setBytes:length:atIndex:", v56, 2, 3);
    v40 = v8;
    v41 = 4;
  }
  else
  {
    v54 = 0uLL;
    v55 = 0;
    objc_msgSend(v9, "destinationColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v42, 0);

    objc_msgSend(v8, "setComputePipelineState:", self->_interpolateRGBWeightSourceYUVDestYUV[v20]);
    objc_msgSend(v9, "sourceColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "texLuma");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTexture:atIndex:", v44, 0);

    objc_msgSend(v9, "sourceColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "texChroma");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTexture:atIndex:", v46, 1);

    v10 = v52;
    objc_msgSend(v8, "setTexture:atIndex:", v52, 2);
    objc_msgSend(v8, "setTexture:atIndex:", self->_precomputedGaussian, 3);
    objc_msgSend(v9, "destinationColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "texLuma");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTexture:atIndex:", v48, 4);

    objc_msgSend(v9, "destinationColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "texChroma");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTexture:atIndex:", v50, 5);

    objc_msgSend(v8, "setBytes:length:atIndex:", v59, 8, 0);
    objc_msgSend(v8, "setBytes:length:atIndex:", v60, 4, 1);
    objc_msgSend(v8, "setBytes:length:atIndex:", &v56[2], 24, 2);
    objc_msgSend(v8, "setBytes:length:atIndex:", &v54, 24, 3);
    objc_msgSend(v8, "setBytes:length:atIndex:", v56, 2, 4);
    v40 = v8;
    v41 = 5;
  }
  objc_msgSend(v40, "setBytes:length:atIndex:", v61, 4, v41);
  v12 = v51;
LABEL_12:
  *(_QWORD *)&v56[2] = v12;
  v57 = v53;
  v58 = 1;
  v54 = xmmword_1C9322A30;
  v55 = 1;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", &v56[2], &v54);

}

- (void)interpolateRGBWeightUsingRGBALinearToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5 inRGBA:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int32x2_t v14;
  uint64_t v15;
  __int16 v16;
  __int16 v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _DWORD v47[2];
  _WORD v48[2];
  _WORD v49[2];
  int64x2_t v50;
  __int128 v51;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14.i16[0] = 0;
  v14.i16[2] = 0;
  v50 = 0u;
  v51 = 0u;
  if (v11)
  {
    objc_msgSend(v11, "scissorRect");
    v15 = *((_QWORD *)&v51 + 1);
    v41 = v51;
    v14 = vmovn_s64(v50);
  }
  else
  {
    v15 = 0;
    v41 = 0;
  }
  v49[1] = v14.i16[2];
  v49[0] = v14.i16[0];
  +[PTRandom nextUshort2:seed:](PTRandom, "nextUshort2:seed:", self->_precomputedGaussianOffsetMaxValue, objc_msgSend(v11, "frameId"));
  v48[1] = v16;
  v48[0] = v17;
  +[PTRaytracingInterpolateResultV2 calculateVarReadNoise:](PTRaytracingInterpolateResultV2, "calculateVarReadNoise:", v11);
  v47[0] = v18;
  v47[1] = v19;
  objc_msgSend(v11, "sourceColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transferFunction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v21, 1);

  objc_msgSend(v11, "destinationColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v23, "isRGB");

  if ((_DWORD)v21)
  {
    objc_msgSend(v10, "setComputePipelineState:", self->_interpolateRGBWeightRGBALinearDestRGBA[v22]);
    objc_msgSend(v10, "setTexture:atIndex:", v13, 0);
    objc_msgSend(v10, "setTexture:atIndex:", v12, 1);
    objc_msgSend(v10, "setTexture:atIndex:", self->_precomputedGaussian, 2);
    objc_msgSend(v11, "destinationColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "texRGBA");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v25, 3);

    objc_msgSend(v10, "setBytes:length:atIndex:", v47, 8, 0);
    objc_msgSend(v10, "setBytes:length:atIndex:", v48, 4, 1);
    v26 = v10;
    v27 = 2;
  }
  else
  {
    v44 = 0;
    v45 = 0;
    v46 = 0;
    objc_msgSend(v11, "sourceColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v28, 0);

    objc_msgSend(v11, "sourceColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "texLuma");
    v40 = v15;
    v39 = v22;
    v30 = v13;
    v31 = v12;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "texChroma");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v42) = +[PTColorConversion getChromaSubsampledFromLuma:texChroma:](PTColorConversion, "getChromaSubsampledFromLuma:texChroma:", v32, v34);

    v12 = v31;
    v13 = v30;

    objc_msgSend(v10, "setComputePipelineState:", self->_interpolateRGBWeightRGBALinearDestYUV[v39]);
    objc_msgSend(v10, "setTexture:atIndex:", v30, 0);
    objc_msgSend(v10, "setTexture:atIndex:", v12, 1);
    objc_msgSend(v10, "setTexture:atIndex:", self->_precomputedGaussian, 2);
    objc_msgSend(v11, "destinationColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "texLuma");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v36, 3);

    objc_msgSend(v11, "destinationColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "texChroma");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v38, 4);

    v15 = v40;
    objc_msgSend(v10, "setBytes:length:atIndex:", v47, 8, 0);
    objc_msgSend(v10, "setBytes:length:atIndex:", v48, 4, 1);
    objc_msgSend(v10, "setBytes:length:atIndex:", &v44, 24, 2);
    objc_msgSend(v10, "setBytes:length:atIndex:", &v42, 2, 3);
    v26 = v10;
    v27 = 4;
  }
  objc_msgSend(v26, "setBytes:length:atIndex:", v49, 4, v27);
  v44 = v41;
  v45 = v15;
  v46 = 1;
  v42 = xmmword_1C9322A30;
  v43 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", &v44, &v42);

}

+ (PTNoiseValues)calculateVarReadNoise:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  PTNoiseValues result;

  v3 = a3;
  v4 = objc_msgSend(v3, "AGC");
  v5 = objc_msgSend(v3, "conversionGain");
  v6 = objc_msgSend(v3, "readNoise_1x");
  v7 = objc_msgSend(v3, "readNoise_8x");
  objc_msgSend(v3, "renderState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "noiseScaleFactor");
  v10 = v9;

  objc_msgSend(v3, "renderState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sourceColorBitDepth");

  objc_msgSend(v3, "totalSensorCropRectSize");
  v14 = v13;
  objc_msgSend(v3, "sourceColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 / (double)(unint64_t)objc_msgSend(v15, "width");
  objc_msgSend(v3, "totalSensorCropRectSize");
  v18 = v16 * v17;
  objc_msgSend(v3, "sourceColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10 / (v18 / (double)(unint64_t)objc_msgSend(v19, "height"));

  v21 = v20 / 1023.0;
  if (v12 == 10)
    v21 = (float)(v20 / 1023.0) * 12.0;
  v22 = (float)v4 / 255.0;
  v23 = (float)((float)v5 / 65535.0) * v21;
  v24 = (float)((float)v6 / 65535.0) * (float)((float)v6 / 65535.0);
  v25 = (float)(v24 - (float)((float)((float)v7 / 65535.0) * (float)((float)v7 / 65535.0))) / 0.98438;
  v26 = v23 * (float)((float)(v25 + (float)((float)(v22 * (float)(v24 - v25)) * v22)) * v23);
  v27 = v22 * v23;

  v28 = v26;
  v29 = v27;
  result.var1 = v29;
  result.var0 = v28;
  return result;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;

  objc_storeStrong((id *)&self->_precomputedGaussian, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  for (i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_interpolateRGBWeightRGBALinearDestYUV[i + 8], 0);
  for (j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_interpolateRGBWeightRGBALinearDestRGBA[j + 8], 0);
  for (k = 0; k != -9; --k)
    objc_storeStrong((id *)&self->_interpolateRGBWeightSourceRGBADestRGBA[k + 8], 0);
  for (m = 144; m != 72; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
    m -= 8;
  }
  while (m);
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
