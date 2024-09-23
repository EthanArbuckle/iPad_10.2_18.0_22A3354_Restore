@implementation PTPyramid

- (PTPyramid)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 pixelFormat:(unint64_t)a5 skipFullSizeLayer:(BOOL)a6 doFirstLevelGaussianDownsample:(BOOL)a7 mipmapLevelCount:(int)a8
{
  _BOOL4 v10;
  double height;
  double width;
  id v16;
  PTPyramid *v17;
  PTPyramid *v18;
  id *p_metalContext;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  MTLTexture *mipmapTexture;
  void *v26;
  uint64_t v27;
  NSArray *mipmapLevels;
  float v29;
  uint64_t v30;
  _DWORD *v31;
  uint64_t v32;
  int v33;
  float v34;
  uint64_t i;
  NSObject *v46;
  uint64_t v47;
  MTLComputePipelineState *downscaleGaussian3x3;
  uint64_t v49;
  MTLComputePipelineState **updateLevel0Box2x2FromRGBA;
  MTLComputePipelineState **updateLevel0Box2x2FromYUV;
  MTLComputePipelineState **updateLevel0Gaussian3x3FromRGBA;
  MTLComputePipelineState **updateLevel0Gaussian3x3FromYUV;
  MTLComputePipelineState **updateLevel0and1Gaussian3x3FromRGBA;
  MTLComputePipelineState **updateLevel0and1Gaussian3x3FromYUV;
  uint64_t v56;
  MTLComputePipelineState *v57;
  uint64_t v58;
  MTLComputePipelineState *v59;
  uint64_t v60;
  MTLComputePipelineState *v61;
  uint64_t v62;
  MTLComputePipelineState *v63;
  uint64_t v64;
  MTLComputePipelineState *v65;
  uint64_t v66;
  MTLComputePipelineState *v67;
  NSObject *v68;
  PTPyramid *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id v135;
  unsigned int v136;
  _WORD v137[3];
  _WORD v138[3];
  objc_super v139;
  _DWORD v140[9];
  uint64_t v141;

  v10 = a6;
  height = a4.height;
  width = a4.width;
  v141 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v139.receiver = self;
  v139.super_class = (Class)PTPyramid;
  v17 = -[PTPyramid init](&v139, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_29;
  p_metalContext = (id *)&v17->_metalContext;
  objc_storeStrong((id *)&v17->_metalContext, a3);
  v18->_skipFullSizeLayer = v10;
  v18->_doFirstLevelGaussianDownsample = a7;
  -[PTMetalContext textureUtil](v18->_metalContext, "textureUtil");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v10)
  {
    v22 = (unint64_t)((width + 1.0) * 0.5);
    v23 = (unint64_t)((height + 1.0) * 0.5);
  }
  else
  {
    v22 = (unint64_t)width;
    v23 = (unint64_t)height;
  }
  objc_msgSend(v20, "createWithWidth:height:pixelFormat:mipmapLevelCount:", v22, v23, a5, a8);
  v24 = objc_claimAutoreleasedReturnValue();
  mipmapTexture = v18->_mipmapTexture;
  v18->_mipmapTexture = (MTLTexture *)v24;

  if (!v18->_mipmapTexture)
  {
    _PTLogSystem();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.1(v46, v70, v71, v72, v73, v74, v75, v76);
    goto LABEL_50;
  }
  -[PTMetalContext textureUtil](v18->_metalContext, "textureUtil");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "mipmapLevelsUsingTextureView:", v18->_mipmapTexture);
  v27 = objc_claimAutoreleasedReturnValue();
  mipmapLevels = v18->_mipmapLevels;
  v18->_mipmapLevels = (NSArray *)v27;

  if (!v18->_mipmapLevels)
  {
    _PTLogSystem();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.2(v46, v77, v78, v79, v80, v81, v82, v83);
LABEL_50:

    v69 = 0;
    goto LABEL_51;
  }
  v29 = 0.0;
  v30 = -1;
  v31 = v140;
  do
  {
    v32 = 0;
    v33 = -1;
    do
    {
      v34 = pow(2.71828183, (float)((float)((float)((float)v33 * (float)v33) + (float)((float)(int)v30 * (float)(int)v30)) * -0.5))* 0.159154943;
      v29 = v29 + v34;
      *(float *)&v31[v32] = v34;
      v32 += 3;
      ++v33;
    }
    while (v32 != 9);
    ++v30;
    ++v31;
  }
  while (v30 != 2);
  for (i = 0; i != 9; ++i)
    *(float *)&v140[i] = *(float *)&v140[i] / v29;
  _S0 = v140[0];
  _S1 = v140[1];
  __asm { FCVT            H0, S0 }
  v138[0] = _S0;
  __asm { FCVT            H0, S1 }
  v138[1] = _S0;
  _S0 = v140[2];
  _S1 = v140[3];
  __asm { FCVT            H0, S0 }
  v138[2] = _S0;
  __asm { FCVT            H0, S1 }
  v137[0] = _S0;
  _S0 = v140[4];
  _S1 = v140[5];
  __asm { FCVT            H0, S0 }
  v137[1] = _S0;
  __asm { FCVT            H0, S1 }
  v137[2] = _S0;
  v46 = objc_opt_new();
  -[NSObject setConstantHalf3:withName:](v46, "setConstantHalf3:withName:", v138, CFSTR("kWeights2DRow0_half3"));
  -[NSObject setConstantHalf3:withName:](v46, "setConstantHalf3:withName:", v137, CFSTR("kWeights2DRow1_half3"));
  -[PTMetalContext computePipelineStateFor:withConstants:](v18->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("downscaleGaussian3x3"), v46);
  v47 = objc_claimAutoreleasedReturnValue();
  downscaleGaussian3x3 = v18->_downscaleGaussian3x3;
  v18->_downscaleGaussian3x3 = (MTLComputePipelineState *)v47;

  if (!v18->_downscaleGaussian3x3)
  {
    _PTLogSystem();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.3(v84, v85, v86, v87, v88, v89, v90, v91);
LABEL_49:

    goto LABEL_50;
  }
  v135 = v16;
  v49 = 0;
  updateLevel0Box2x2FromRGBA = v18->_updateLevel0Box2x2FromRGBA;
  updateLevel0Box2x2FromYUV = v18->_updateLevel0Box2x2FromYUV;
  updateLevel0Gaussian3x3FromRGBA = v18->_updateLevel0Gaussian3x3FromRGBA;
  updateLevel0Gaussian3x3FromYUV = v18->_updateLevel0Gaussian3x3FromYUV;
  updateLevel0and1Gaussian3x3FromRGBA = v18->_updateLevel0and1Gaussian3x3FromRGBA;
  updateLevel0and1Gaussian3x3FromYUV = v18->_updateLevel0and1Gaussian3x3FromYUV;
  do
  {
    v136 = supportedColorTransferFunctions_1[v49];
    -[NSObject setConstantValue:type:withName:](v46, "setConstantValue:type:withName:", &v136, 29, CFSTR("kColorTransferFunctionToLinear"));
    objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("updateLevel0Box2x2FromRGBA"), v46);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = updateLevel0Box2x2FromRGBA[v136];
    updateLevel0Box2x2FromRGBA[v136] = (MTLComputePipelineState *)v56;

    if (!updateLevel0Box2x2FromRGBA[v136])
    {
      _PTLogSystem();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.4(v84, v92, v93, v94, v95, v96, v97, v98);
      goto LABEL_48;
    }
    objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("updateLevel0Box2x2FromYUV"), v46);
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = updateLevel0Box2x2FromYUV[v136];
    updateLevel0Box2x2FromYUV[v136] = (MTLComputePipelineState *)v58;

    if (!updateLevel0Box2x2FromYUV[v136])
    {
      _PTLogSystem();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.5(v84, v99, v100, v101, v102, v103, v104, v105);
      goto LABEL_48;
    }
    objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("updateLevel0Gaussian3x3FromRGBA"), v46);
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = updateLevel0Gaussian3x3FromRGBA[v136];
    updateLevel0Gaussian3x3FromRGBA[v136] = (MTLComputePipelineState *)v60;

    if (!updateLevel0Gaussian3x3FromRGBA[v136])
    {
      _PTLogSystem();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.6(v84, v106, v107, v108, v109, v110, v111, v112);
      goto LABEL_48;
    }
    objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("updateLevel0Gaussian3x3FromYUV"), v46);
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = updateLevel0Gaussian3x3FromYUV[v136];
    updateLevel0Gaussian3x3FromYUV[v136] = (MTLComputePipelineState *)v62;

    if (!updateLevel0Gaussian3x3FromYUV[v136])
    {
      _PTLogSystem();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.7(v84, v113, v114, v115, v116, v117, v118, v119);
      goto LABEL_48;
    }
    objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("updateLevel0and1Gaussian3x3FromRGBA"), v46);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = updateLevel0and1Gaussian3x3FromRGBA[v136];
    updateLevel0and1Gaussian3x3FromRGBA[v136] = (MTLComputePipelineState *)v64;

    if (!updateLevel0and1Gaussian3x3FromRGBA[v136])
    {
      _PTLogSystem();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.8(v84, v120, v121, v122, v123, v124, v125, v126);
      goto LABEL_48;
    }
    objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("updateLevel0and1Gaussian3x3FromYUV"), v46);
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = updateLevel0and1Gaussian3x3FromYUV[v136];
    updateLevel0and1Gaussian3x3FromYUV[v136] = (MTLComputePipelineState *)v66;

    if (!updateLevel0and1Gaussian3x3FromYUV[v136])
    {
      _PTLogSystem();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.9(v84, v127, v128, v129, v130, v131, v132, v133);
LABEL_48:
      v16 = v135;
      goto LABEL_49;
    }
    ++v49;
  }
  while (v49 != 5);
  v16 = v135;
  if (!v18->_mipmapTexture || !v18->_mipmapLevels || !v18->_downscaleGaussian3x3)
  {
    _PTLogSystem();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:].cold.10(v68);

  }
LABEL_29:
  v69 = v18;
LABEL_51:

  return v69;
}

- (int)updatePyramidFromPTTexture:(id)a3 inPTTexture:(id)a4
{
  id v6;
  id v7;
  _BOOL4 skipFullSizeLayer;
  int v9;
  _BOOL8 doFirstLevelGaussianDownsample;
  int v11;
  int v12;

  v6 = a3;
  v7 = a4;
  skipFullSizeLayer = self->_skipFullSizeLayer;
  v9 = objc_msgSend(v7, "isRGB");
  if (skipFullSizeLayer)
  {
    doFirstLevelGaussianDownsample = self->_doFirstLevelGaussianDownsample;
    if (v9)
      v11 = -[PTPyramid updateLevel0FromPTTextureRGBA:inPTTextureRGBA:doFirstLevelGaussianDownsample:](self, "updateLevel0FromPTTextureRGBA:inPTTextureRGBA:doFirstLevelGaussianDownsample:", v6, v7, doFirstLevelGaussianDownsample);
    else
      v11 = -[PTPyramid updateLevel0FromPTTextureYUV:inPTTextureYUV:doFirstLevelGaussianDownsample:](self, "updateLevel0FromPTTextureYUV:inPTTextureYUV:doFirstLevelGaussianDownsample:", v6, v7, doFirstLevelGaussianDownsample);
  }
  else if (v9)
  {
    v11 = -[PTPyramid updateLevel0and1FromPTTextureRGBA:inPTTextureRGBA:](self, "updateLevel0and1FromPTTextureRGBA:inPTTextureRGBA:", v6, v7);
  }
  else
  {
    v11 = -[PTPyramid updateLevel0and1FromPTTextureYUV:inPTTextureYUV:](self, "updateLevel0and1FromPTTextureYUV:inPTTextureYUV:", v6, v7);
  }
  v12 = v11;
  -[PTPyramid updatePyramid:offset:](self, "updatePyramid:offset:", v6, !self->_skipFullSizeLayer);

  return v12;
}

- (int)updateLevel0FromPTTextureRGBA:(id)a3 inPTTextureRGBA:(id)a4 doFirstLevelGaussianDownsample:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  int64x2_t v27;
  uint64_t v28;
  _QWORD v29[3];

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "transferFunction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v10, 1);

  objc_msgSend(v9, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  v21 = 312;
  if (v5)
    v21 = 24;
  objc_msgSend(v12, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + 8 * v11 + v21));
  objc_msgSend(v8, "texRGBA");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTexture:atIndex:", v22, 0);

  -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTexture:atIndex:", v23, 1);

  v24 = (unint64_t)objc_msgSend(v8, "width") >> 1;
  v25 = objc_msgSend(v8, "height");

  v29[0] = v24;
  v29[1] = v25 >> 1;
  v29[2] = 1;
  v27 = vdupq_n_s64(8uLL);
  v28 = 1;
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v29, &v27);
  objc_msgSend(v12, "endEncoding");

  return 0;
}

- (int)updateLevel0FromPTTextureYUV:(id)a3 inPTTextureYUV:(id)a4 doFirstLevelGaussianDownsample:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int64x2_t v30;
  uint64_t v31;
  _QWORD v32[3];
  uint64_t v33;
  _QWORD v34[3];

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "transferFunction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v10, 1);

  memset(v34, 0, sizeof(v34));
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v8, 1);
  objc_msgSend(v8, "texLuma");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "texChroma");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTColorConversion getChromaOffsetFromLuma:texChroma:](PTColorConversion, "getChromaOffsetFromLuma:texChroma:", v12, v13);
  v15 = v14;

  v33 = v15;
  objc_msgSend(v9, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  }
  v25 = 384;
  if (v5)
    v25 = 96;
  objc_msgSend(v16, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + 8 * v11 + v25));
  objc_msgSend(v8, "texLuma");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTexture:atIndex:", v26, 0);

  objc_msgSend(v8, "texChroma");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTexture:atIndex:", v27, 1);

  -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTexture:atIndex:", v28, 2);

  objc_msgSend(v16, "setBytes:length:atIndex:", v34, 24, 0);
  objc_msgSend(v16, "setBytes:length:atIndex:", &v33, 8, 1);
  v32[0] = (unint64_t)objc_msgSend(v8, "width") >> 1;
  v32[1] = (unint64_t)objc_msgSend(v8, "height") >> 1;
  v32[2] = 1;
  v30 = vdupq_n_s64(8uLL);
  v31 = 1;
  objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", v32, &v30);
  objc_msgSend(v16, "endEncoding");

  return 0;
}

- (int)updateLevel0and1FromPTTextureRGBA:(id)a3 inPTTextureRGBA:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  int64x2_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "transferFunction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v8, 1);

  objc_msgSend(v7, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  objc_msgSend(v10, "setComputePipelineState:", self->_updateLevel0and1Gaussian3x3FromRGBA[v9]);
  objc_msgSend(v6, "texRGBA");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:atIndex:", v19, 0);

  -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:atIndex:", v20, 1);

  -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:atIndex:", v21, 2);

  v22 = (unint64_t)objc_msgSend(v6, "width") >> 1;
  v23 = objc_msgSend(v6, "height");

  v27[0] = v22;
  v27[1] = v23 >> 1;
  v27[2] = 1;
  v25 = vdupq_n_s64(8uLL);
  v26 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v27, &v25);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)updateLevel0and1FromPTTextureYUV:(id)a3 inPTTextureYUV:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64x2_t v28;
  uint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  _QWORD v32[3];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "transferFunction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v8, 1);

  memset(v32, 0, sizeof(v32));
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v6, 1);
  objc_msgSend(v6, "texLuma");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "texChroma");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTColorConversion getChromaOffsetFromLuma:texChroma:](PTColorConversion, "getChromaOffsetFromLuma:texChroma:", v10, v11);
  v13 = v12;

  v31 = v13;
  objc_msgSend(v7, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  objc_msgSend(v14, "setComputePipelineState:", self->_updateLevel0and1Gaussian3x3FromYUV[v9]);
  objc_msgSend(v6, "texLuma");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTexture:atIndex:", v23, 0);

  objc_msgSend(v6, "texChroma");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTexture:atIndex:", v24, 1);

  -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTexture:atIndex:", v25, 2);

  -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTexture:atIndex:", v26, 3);

  objc_msgSend(v14, "setBytes:length:atIndex:", v32, 24, 0);
  objc_msgSend(v14, "setBytes:length:atIndex:", &v31, 8, 1);
  v30[0] = (unint64_t)objc_msgSend(v6, "width") >> 1;
  v30[1] = (unint64_t)objc_msgSend(v6, "height") >> 1;
  v30[2] = 1;
  v28 = vdupq_n_s64(8uLL);
  v29 = 1;
  objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", v30, &v28);
  objc_msgSend(v14, "endEncoding");

  return 0;
}

- (int)updatePyramid:(id)a3 offset:(int)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  return -[PTPyramid updatePyramid:offset:samplingRadius:](self, "updatePyramid:offset:samplingRadius:", a3, *(_QWORD *)&a4, v4);
}

- (int)updatePyramid:(id)a3 offset:(int)a4 samplingRadius:(float)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[3];
  float v31;

  v8 = a3;
  v31 = a5;
  -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject pixelFormat](v9, "pixelFormat") != 70)
  {
    -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "pixelFormat") == 115)
    {

    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "pixelFormat");

      if (v12 == 555)
        goto LABEL_8;
      _PTLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PTPyramid updatePyramid:offset:samplingRadius:].cold.1(v9, v13, v14, v15, v16, v17, v18, v19);
    }
  }

LABEL_8:
  objc_msgSend(v8, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setComputePipelineState:", self->_downscaleGaussian3x3);
  objc_msgSend(v20, "setBytes:length:atIndex:", &v31, 4, 0);
  LODWORD(v21) = a4 + 1;
  if (-[NSArray count](self->_mipmapLevels, "count") > (int)v21)
  {
    v21 = (int)v21;
    v27 = xmmword_1C9323050;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", v21 - 1, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTexture:atIndex:", v22, 0);
      objc_msgSend(v20, "setTexture:atIndex:", v23, 1);
      v24 = objc_msgSend(v23, "width");
      v25 = objc_msgSend(v23, "height");
      v30[0] = v24;
      v30[1] = v25;
      v30[2] = 1;
      v28 = v27;
      v29 = 1;
      objc_msgSend(v20, "dispatchThreads:threadsPerThreadgroup:", v30, &v28);

      ++v21;
    }
    while (v21 < -[NSArray count](self->_mipmapLevels, "count"));
  }
  objc_msgSend(v20, "endEncoding");

  return 0;
}

- (id)findMipmapLevelLargerThan:(id *)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v4;

  v4 = *a3;
  -[PTPyramid findMipmapLevelLargerThan:fromLevel:](self, "findMipmapLevelLargerThan:fromLevel:", &v4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)findMipmapLevelLargerThan:(id *)a3 fromLevel:(int)a4
{
  NSArray *mipmapLevels;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  mipmapLevels = self->_mipmapLevels;
  v6 = *a3;
  +[PTUtil findMipmapLevel:largerThan:fromLevel:](PTUtil, "findMipmapLevel:largerThan:fromLevel:", mipmapLevels, &v6, *(_QWORD *)&a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTLTexture)mipmapTexture
{
  return self->_mipmapTexture;
}

- (void)setMipmapTexture:(id)a3
{
  objc_storeStrong((id *)&self->_mipmapTexture, a3);
}

- (NSArray)mipmapLevels
{
  return self->_mipmapLevels;
}

- (void)setMipmapLevels:(id)a3
{
  objc_storeStrong((id *)&self->_mipmapLevels, a3);
}

- (BOOL)bicubic
{
  return self->_bicubic;
}

- (void)setBicubic:(BOOL)a3
{
  self->_bicubic = a3;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;

  objc_storeStrong((id *)&self->_mipmapLevels, 0);
  objc_storeStrong((id *)&self->_mipmapTexture, 0);
  for (i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_updateLevel0Box2x2FromYUV[i + 8], 0);
  for (j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_updateLevel0Box2x2FromRGBA[j + 8], 0);
  for (k = 0; k != -9; --k)
    objc_storeStrong((id *)&self->_updateLevel0and1Gaussian3x3FromYUV[k + 8], 0);
  for (m = 0; m != -9; --m)
    objc_storeStrong((id *)&self->_updateLevel0and1Gaussian3x3FromRGBA[m + 8], 0);
  for (n = 160; n != 88; n -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
    n -= 8;
  }
  while (n != 16);
  objc_storeStrong((id *)&self->_downscaleGaussian3x3, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(os_log_t)log colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:.cold.10(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "PTPyramidRGB init failed", v1, 2u);
}

- (void)updatePyramid:(uint64_t)a3 offset:(uint64_t)a4 samplingRadius:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
