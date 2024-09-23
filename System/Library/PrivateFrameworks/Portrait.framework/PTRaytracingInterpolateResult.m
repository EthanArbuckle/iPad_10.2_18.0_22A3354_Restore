@implementation PTRaytracingInterpolateResult

- (PTRaytracingInterpolateResult)initWithMetalContext:(id)a3 useExportQualityNoise:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PTRaytracingInterpolateResult *v8;
  PTRaytracingInterpolateResult *v9;
  id *p_metalContext;
  int v11;
  uint64_t v12;
  MTLTexture *precomputedGaussian;
  void *v14;
  double v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  MTLComputePipelineState **interpolateRGBWeightSourceYUVDestRGBA;
  MTLComputePipelineState **interpolateRGBWeightSourceYUVDestYUV;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  MTLComputePipelineState *v26;
  id v27;
  void *v28;
  uint64_t v29;
  MTLComputePipelineState *v30;
  id v31;
  void *v32;
  uint64_t v33;
  MTLComputePipelineState *v34;
  id v35;
  void *v36;
  uint64_t v37;
  MTLComputePipelineState *v38;
  id v39;
  void *v40;
  uint64_t v41;
  MTLComputePipelineState *v42;
  uint64_t v43;
  MTLComputePipelineState *v44;
  PTRaytracingInterpolateResult *v45;
  NSObject *v46;
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
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  PTRaytracingInterpolateResult *v90;
  MTLComputePipelineState **interpolateRGBWeightSourceYUVDestYUVPostProcess;
  MTLComputePipelineState **interpolateRGBWeightRGBALinearDestYUV;
  MTLComputePipelineState **interpolateRGBWeightRGBALinearDestRGBA;
  MTLComputePipelineState **interpolateRGBWeightSourceRGBADestRGBA;
  unsigned int v95;
  int v96;
  objc_super v97;

  v4 = a4;
  v7 = a3;
  v97.receiver = self;
  v97.super_class = (Class)PTRaytracingInterpolateResult;
  v8 = -[PTRaytracingInterpolateResult init](&v97, sel_init);
  v9 = v8;
  if (!v8)
  {
    v45 = 0;
    goto LABEL_30;
  }
  p_metalContext = (id *)&v8->_metalContext;
  objc_storeStrong((id *)&v8->_metalContext, a3);
  if (v4)
    v11 = 512;
  else
    v11 = 256;
  v96 = v11;
  +[PTPrecomputeRandom computeGaussian:sideLength:](PTPrecomputeRandom, "computeGaussian:sideLength:", v9->_metalContext);
  v12 = objc_claimAutoreleasedReturnValue();
  precomputedGaussian = v9->_precomputedGaussian;
  v9->_precomputedGaussian = (MTLTexture *)v12;

  v9->_precomputedGaussianOffsetMaxValue = 0x7FFF;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setConstantValue:type:withName:", &v96, 29, CFSTR("kSizePrecomputedGaussian"));
  LODWORD(v15) = 2.0;
  objc_msgSend(v14, "setConstantFloat:withName:", CFSTR("kSizeNoiseGrain_float"), v15);
  v16 = objc_msgSend(v7, "imageblocksSupported");
  v17 = CFSTR("NoImageblocks");
  if (v16)
    v17 = &stru_1E822B200;
  v18 = v17;
  v19 = 0;
  interpolateRGBWeightSourceYUVDestRGBA = v9->_interpolateRGBWeightSourceYUVDestRGBA;
  interpolateRGBWeightSourceYUVDestYUV = v9->_interpolateRGBWeightSourceYUVDestYUV;
  interpolateRGBWeightRGBALinearDestRGBA = v9->_interpolateRGBWeightRGBALinearDestRGBA;
  interpolateRGBWeightSourceRGBADestRGBA = v9->_interpolateRGBWeightSourceRGBADestRGBA;
  v90 = v9;
  interpolateRGBWeightSourceYUVDestYUVPostProcess = v9->_interpolateRGBWeightSourceYUVDestYUVPostProcess;
  interpolateRGBWeightRGBALinearDestYUV = v9->_interpolateRGBWeightRGBALinearDestYUV;
  while (1)
  {
    v22 = v7;
    v95 = supportedColorTransferFunctions_2[v19];
    objc_msgSend(v14, "setConstantValue:type:withName:", &v95, 29, CFSTR("kColorTransferFunctionToLinear"));
    v23 = *p_metalContext;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interpolateRGBWeightSourceYUVDestRGBA%@"), v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "computePipelineStateFor:withConstants:", v24, v14);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = interpolateRGBWeightSourceYUVDestRGBA[v95];
    interpolateRGBWeightSourceYUVDestRGBA[v95] = (MTLComputePipelineState *)v25;

    if (!interpolateRGBWeightSourceYUVDestRGBA[v95])
    {
      _PTLogSystem();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.1(v46, v47, v48, v49, v50, v51, v52, v53);
      goto LABEL_26;
    }
    v27 = *p_metalContext;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interpolateRGBWeightSourceYUVDestYUV%@"), v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "computePipelineStateFor:withConstants:", v28, v14);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = interpolateRGBWeightSourceYUVDestYUV[v95];
    interpolateRGBWeightSourceYUVDestYUV[v95] = (MTLComputePipelineState *)v29;

    if (!interpolateRGBWeightSourceYUVDestYUV[v95])
    {
      _PTLogSystem();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.2(v46, v54, v55, v56, v57, v58, v59, v60);
      goto LABEL_26;
    }
    v31 = *p_metalContext;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interpolateRGBWeightSourceRGBADestRGBA%@"), v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "computePipelineStateFor:withConstants:", v32, v14);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = interpolateRGBWeightSourceRGBADestRGBA[v95];
    interpolateRGBWeightSourceRGBADestRGBA[v95] = (MTLComputePipelineState *)v33;

    if (!interpolateRGBWeightSourceRGBADestRGBA[v95])
    {
      _PTLogSystem();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.3(v46, v61, v62, v63, v64, v65, v66, v67);
      goto LABEL_26;
    }
    v35 = *p_metalContext;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interpolateRGBWeightRGBALinearDestRGBA%@"), v18);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "computePipelineStateFor:withConstants:", v36, v14);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = interpolateRGBWeightRGBALinearDestRGBA[v95];
    interpolateRGBWeightRGBALinearDestRGBA[v95] = (MTLComputePipelineState *)v37;

    if (!interpolateRGBWeightRGBALinearDestRGBA[v95])
    {
      _PTLogSystem();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.4(v46, v68, v69, v70, v71, v72, v73, v74);
LABEL_26:
      v7 = v22;
LABEL_27:
      v9 = v90;
      goto LABEL_28;
    }
    v39 = *p_metalContext;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interpolateRGBWeightRGBALinearDestYUV%@"), v18);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "computePipelineStateFor:withConstants:", v40, v14);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = interpolateRGBWeightRGBALinearDestYUV[v95];
    interpolateRGBWeightRGBALinearDestYUV[v95] = (MTLComputePipelineState *)v41;

    if (!interpolateRGBWeightRGBALinearDestYUV[v95])
    {
      _PTLogSystem();
      v46 = objc_claimAutoreleasedReturnValue();
      v7 = v22;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.5(v46, v76, v77, v78, v79, v80, v81, v82);
      goto LABEL_27;
    }
    v7 = v22;
    if (objc_msgSend(v22, "imageblocksSupported"))
    {
      objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBWeightSourceYUVDestYUVPostModify"), v14);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = interpolateRGBWeightSourceYUVDestYUVPostProcess[v95];
      interpolateRGBWeightSourceYUVDestYUVPostProcess[v95] = (MTLComputePipelineState *)v43;

      if (!interpolateRGBWeightSourceYUVDestYUVPostProcess[v95])
        break;
    }
    if (++v19 == 5)
    {
      v9 = v90;
      v45 = v90;
      goto LABEL_29;
    }
  }
  _PTLogSystem();
  v46 = objc_claimAutoreleasedReturnValue();
  v9 = v90;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.6(v46, v83, v84, v85, v86, v87, v88, v89);
LABEL_28:

  v45 = 0;
LABEL_29:

LABEL_30:
  return v45;
}

- (void)interpolateRGBWeightUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int16 v11;
  __int16 v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  PTImageblockConfig *v18;
  void *v19;
  PTImageblockConfig *v20;
  __int16 v21;
  __int16 v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;
  _WORD v71[2];
  _OWORD v72[2];
  _DWORD v73[3];
  _WORD v74[6];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTRandom nextUshort2:seed:](PTRandom, "nextUshort2:seed:", self->_precomputedGaussianOffsetMaxValue, objc_msgSend(v8, "frameId"));
  v74[1] = v11;
  v74[0] = v12;
  +[PTRaytracingInterpolateResult calculateVarReadNoise:](PTRaytracingInterpolateResult, "calculateVarReadNoise:", v8);
  v73[0] = v13;
  v73[1] = v14;
  objc_msgSend(v8, "sourceColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transferFunction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v16, 1);

  v18 = [PTImageblockConfig alloc];
  objc_msgSend(v8, "destinationColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v8, "scissorRect");
  else
    memset(v72, 0, sizeof(v72));
  v20 = -[PTImageblockConfig initWithPTTexture:scissorRect:](v18, "initWithPTTexture:scissorRect:", v19, v72);

  -[PTImageblockConfig scissorRectOffset](v20, "scissorRectOffset");
  v71[1] = v21;
  v71[0] = v22;
  if (-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported"))
    objc_msgSend(v10, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v20, "imageblockSize"), -[PTImageblockConfig imageblockSize](v20, "imageblockSize"));
  objc_msgSend(v8, "sourceColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isRGB") & 1) != 0)
  {
    objc_msgSend(v8, "destinationColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isRGB");

    if (v25)
    {
      objc_msgSend(v10, "setComputePipelineState:", self->_interpolateRGBWeightSourceRGBADestRGBA[v17]);
      objc_msgSend(v8, "sourceColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "texRGBA");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTexture:atIndex:", v27, 0);

      objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
      objc_msgSend(v10, "setTexture:atIndex:", self->_precomputedGaussian, 2);
      objc_msgSend(v8, "destinationColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "texRGBA");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTexture:atIndex:", v29, 3);

      objc_msgSend(v10, "setBytes:length:atIndex:", v73, 8, 0);
      objc_msgSend(v10, "setBytes:length:atIndex:", v74, 4, 1);
      v30 = v10;
      v31 = 2;
      goto LABEL_18;
    }
  }
  else
  {

  }
  v63 = v9;
  v68 = 0;
  v69 = 0;
  v70 = 0;
  objc_msgSend(v8, "sourceColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v32, 1);

  objc_msgSend(v8, "sourceColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "texLuma");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "texChroma");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (unsigned __int16)+[PTColorConversion getChromaSubsampledFromLuma:texChroma:](PTColorConversion, "getChromaSubsampledFromLuma:texChroma:", v34, v36);

  objc_msgSend(v8, "destinationColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isRGB");

  if (!v38)
  {
    memset(v66, 0, sizeof(v66));
    objc_msgSend(v8, "sourceColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v50, 0);

    objc_msgSend(v8, "integratedStyleCoefficientsTextureArray");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {

    }
    else
    {
      objc_msgSend(v8, "colorCube");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
        objc_msgSend(v10, "setComputePipelineState:", self->_interpolateRGBWeightSourceYUVDestYUV[v17]);
        goto LABEL_16;
      }
    }
    objc_msgSend(v10, "setComputePipelineState:", self->_interpolateRGBWeightSourceYUVDestYUVPostProcess[v17]);
    objc_msgSend(v8, "integratedStyleCoefficientsTextureArray");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v53, 6);

    objc_msgSend(v8, "colorCube");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v54, 7);

LABEL_16:
    v9 = v63;
    objc_msgSend(v8, "sourceColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "texLuma");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v56, 0);

    objc_msgSend(v8, "sourceColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "texChroma");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v58, 1);

    objc_msgSend(v10, "setTexture:atIndex:", v63, 2);
    objc_msgSend(v10, "setTexture:atIndex:", self->_precomputedGaussian, 3);
    objc_msgSend(v8, "destinationColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "texLuma");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v60, 4);

    objc_msgSend(v8, "destinationColor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "texChroma");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTexture:atIndex:", v62, 5);

    objc_msgSend(v10, "setBytes:length:atIndex:", v73, 8, 0);
    objc_msgSend(v10, "setBytes:length:atIndex:", v74, 4, 1);
    objc_msgSend(v10, "setBytes:length:atIndex:", (char *)&v67 + 2, 24, 2);
    objc_msgSend(v10, "setBytes:length:atIndex:", v66, 24, 3);
    v47 = &v67;
    v48 = v10;
    v49 = 2;
    goto LABEL_17;
  }
  objc_msgSend(v10, "setComputePipelineState:", self->_interpolateRGBWeightSourceYUVDestRGBA[v17]);
  objc_msgSend(v8, "sourceColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "texLuma");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:atIndex:", v40, 0);

  objc_msgSend(v8, "sourceColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "texChroma");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:atIndex:", v42, 1);

  v9 = v63;
  objc_msgSend(v10, "setTexture:atIndex:", v63, 2);
  objc_msgSend(v10, "setTexture:atIndex:", self->_precomputedGaussian, 3);
  objc_msgSend(v8, "destinationColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "texRGBA");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:atIndex:", v44, 4);

  objc_msgSend(v10, "setBytes:length:atIndex:", v73, 8, 0);
  objc_msgSend(v10, "setBytes:length:atIndex:", v74, 4, 1);
  objc_msgSend(v10, "setBytes:length:atIndex:", (char *)&v67 + 2, 24, 2);
  objc_msgSend(v10, "setBytes:length:atIndex:", &v67, 2, 3);
  objc_msgSend(v8, "destinationColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "transferFunction");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v43) = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v46, 1);

  LODWORD(v66[0]) = (_DWORD)v43;
  v47 = v66;
  v48 = v10;
  v49 = 4;
LABEL_17:
  objc_msgSend(v48, "setBytes:length:atIndex:", v47, v49, 4);
  v30 = v10;
  v31 = 5;
LABEL_18:
  objc_msgSend(v30, "setBytes:length:atIndex:", v71, 4, v31);
  if (v20)
  {
    -[PTImageblockConfig threads](v20, "threads");
    -[PTImageblockConfig threadsPerGroup](v20, "threadsPerGroup");
  }
  else
  {
    memset(v65, 0, sizeof(v65));
    memset(v64, 0, sizeof(v64));
  }
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v65, v64);
  objc_msgSend(v10, "endEncoding");

}

- (void)interpolateRGBWeightUsingRGBALinearToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5 inRGBA:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __int16 v14;
  __int16 v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  PTImageblockConfig *v21;
  void *v22;
  PTImageblockConfig *v23;
  __int16 v24;
  __int16 v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  Class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PTImageblockConfig *v44;
  id v45;
  _QWORD v46[3];
  _QWORD v47[3];
  BOOL2 v48;
  _QWORD v49[3];
  _WORD v50[2];
  _OWORD v51[2];
  _DWORD v52[3];
  _WORD v53[6];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTRandom nextUshort2:seed:](PTRandom, "nextUshort2:seed:", self->_precomputedGaussianOffsetMaxValue, objc_msgSend(v10, "frameId"));
  v53[1] = v14;
  v53[0] = v15;
  +[PTRaytracingInterpolateResult calculateVarReadNoise:](PTRaytracingInterpolateResult, "calculateVarReadNoise:", v10);
  v52[0] = v16;
  v52[1] = v17;
  objc_msgSend(v10, "sourceColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transferFunction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v19, 1);

  v21 = [PTImageblockConfig alloc];
  objc_msgSend(v10, "destinationColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v10, "scissorRect");
  else
    memset(v51, 0, sizeof(v51));
  v23 = -[PTImageblockConfig initWithPTTexture:scissorRect:](v21, "initWithPTTexture:scissorRect:", v22, v51);

  -[PTImageblockConfig scissorRectOffset](v23, "scissorRectOffset");
  v50[1] = v24;
  v50[0] = v25;
  if (-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported"))
    objc_msgSend(v13, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v23, "imageblockSize"), -[PTImageblockConfig imageblockSize](v23, "imageblockSize"));
  objc_msgSend(v10, "destinationColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isRGB");

  if (v27)
  {
    objc_msgSend(v13, "setComputePipelineState:", self->_interpolateRGBWeightRGBALinearDestRGBA[v20]);
    objc_msgSend(v13, "setTexture:atIndex:", v12, 0);
    objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
    objc_msgSend(v13, "setTexture:atIndex:", self->_precomputedGaussian, 2);
    objc_msgSend(v10, "destinationColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "texRGBA");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTexture:atIndex:", v29, 3);

    objc_msgSend(v13, "setBytes:length:atIndex:", v52, 8, 0);
    objc_msgSend(v13, "setBytes:length:atIndex:", v53, 4, 1);
    v30 = v13;
    v31 = 2;
  }
  else
  {
    memset(v49, 0, sizeof(v49));
    objc_msgSend(v10, "sourceColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v32, 0);

    objc_msgSend(v10, "sourceColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "texLuma");
    v44 = v23;
    v34 = v20;
    v35 = v11;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "texChroma");
    v45 = v12;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (BOOL2)+[PTColorConversion getChromaSubsampledFromLuma:texChroma:](PTColorConversion, "getChromaSubsampledFromLuma:texChroma:", v36, v38);

    v11 = v35;
    v39 = &self->super.isa + v34;
    v23 = v44;
    objc_msgSend(v13, "setComputePipelineState:", v39[37]);
    objc_msgSend(v13, "setTexture:atIndex:", v45, 0);
    objc_msgSend(v13, "setTexture:atIndex:", v35, 1);
    objc_msgSend(v13, "setTexture:atIndex:", self->_precomputedGaussian, 2);
    objc_msgSend(v10, "destinationColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "texLuma");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTexture:atIndex:", v41, 3);

    objc_msgSend(v10, "destinationColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "texChroma");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTexture:atIndex:", v43, 4);

    v12 = v45;
    objc_msgSend(v13, "setBytes:length:atIndex:", v52, 8, 0);
    objc_msgSend(v13, "setBytes:length:atIndex:", v53, 4, 1);
    objc_msgSend(v13, "setBytes:length:atIndex:", v49, 24, 2);
    objc_msgSend(v13, "setBytes:length:atIndex:", &v48, 2, 3);
    v30 = v13;
    v31 = 4;
  }
  objc_msgSend(v30, "setBytes:length:atIndex:", v50, 4, v31);
  if (v23)
  {
    -[PTImageblockConfig threads](v23, "threads");
    -[PTImageblockConfig threadsPerGroup](v23, "threadsPerGroup");
  }
  else
  {
    memset(v47, 0, sizeof(v47));
    memset(v46, 0, sizeof(v46));
  }
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v47, v46);
  objc_msgSend(v13, "endEncoding");

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
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  float v24;
  float32x2_t v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float32x2_t v34;
  PTNoiseValues result;

  v3 = a3;
  v4 = objc_msgSend(v3, "AGC");
  v5 = objc_msgSend(v3, "conversionGain");
  v6 = objc_msgSend(v3, "readNoise_1x");
  v7 = objc_msgSend(v3, "readNoise_8x");
  objc_msgSend(v3, "renderState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTTuningParameters noiseScaleFactorForHwModelID:sensorID:](PTTuningParameters, "noiseScaleFactorForHwModelID:sensorID:", objc_msgSend(v8, "hwModelID"), objc_msgSend(v3, "sensorID"));
  v10 = v9;

  objc_msgSend(v3, "renderState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sourceColorBitDepth");

  objc_msgSend(v3, "renderState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = v10;
  objc_msgSend(v13, "setNoiseScaleFactor:", v14);

  objc_msgSend(v3, "totalSensorCropRectSize");
  v16 = v15;
  objc_msgSend(v3, "sourceColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (float)(unint64_t)objc_msgSend(v17, "width");
  objc_msgSend(v3, "visCropFactor");
  v20 = v16 / (float)(v18 * v19);
  objc_msgSend(v3, "totalSensorCropRectSize");
  v22 = v21 * v20;
  objc_msgSend(v3, "sourceColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (float)(unint64_t)objc_msgSend(v23, "height");
  objc_msgSend(v3, "visCropFactor");
  v34 = v25;

  v26 = v10 / (v22 / vmuls_lane_f32(v24, v34, 1));
  v27 = v26 / 1023.0;
  if (v12 == 10)
    v27 = (float)(v26 / 1023.0) * 12.0;
  v28 = (float)v4 / 255.0;
  v29 = (float)((float)v5 / 65535.0) * v27;
  v30 = (float)((float)v6 / 65535.0) * (float)((float)v6 / 65535.0);
  v31 = (float)(v30 - (float)((float)((float)v7 / 65535.0) * (float)((float)v7 / 65535.0))) / 0.98438;
  v32 = v29 * (float)((float)(v31 + (float)((float)(v28 * (float)(v30 - v31)) * v28)) * v29);
  v33 = v28 * v29;
  result.var1 = v33;
  result.var0 = v32;
  return result;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;

  objc_storeStrong((id *)&self->_precomputedGaussian, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  for (i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_interpolateRGBWeightSourceYUVDestYUVPostProcess[i + 8], 0);
  for (j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_interpolateRGBWeightRGBALinearDestYUV[j + 8], 0);
  for (k = 0; k != -9; --k)
    objc_storeStrong((id *)&self->_interpolateRGBWeightRGBALinearDestRGBA[k + 8], 0);
  for (m = 0; m != -9; --m)
    objc_storeStrong((id *)&self->_interpolateRGBWeightSourceRGBADestRGBA[m + 8], 0);
  for (n = 144; n != 72; n -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
    n -= 8;
  }
  while (n);
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

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
