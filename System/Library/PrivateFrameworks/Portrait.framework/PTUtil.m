@implementation PTUtil

- (PTUtil)initWithMetalContext:(id)a3
{
  id v5;
  PTUtil *v6;
  PTUtil *v7;
  uint64_t v8;
  MTLComputePipelineState *renderDisparity;
  uint64_t v10;
  MTLComputePipelineState *reciprocal;
  uint64_t v12;
  MTLComputePipelineState *sobelFilter;
  uint64_t v14;
  MTLComputePipelineState *gaussianNoise;
  uint64_t v16;
  MTLComputePipelineState *renderRect;
  uint64_t v18;
  MTLComputePipelineState *renderLine;
  uint64_t v20;
  MTLComputePipelineState *visualizeCircleUsingRect;
  uint64_t v22;
  MTLComputePipelineState *drawTurboLegend;
  uint64_t v24;
  MTLComputePipelineState *drawTurboLegendYUV;
  uint64_t v26;
  MTLComputePipelineState *rotateTexture;
  void *v38;
  uint64_t v39;
  MTLComputePipelineState *gaussianFilter3x3;
  PTUtil *v41;
  NSObject *v42;
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
  uint64_t v68;
  uint64_t v69;
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
  uint64_t v84;
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
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _WORD v122[3];
  _WORD v123[3];
  objc_super v124;
  _DWORD v125[9];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v124.receiver = self;
  v124.super_class = (Class)PTUtil;
  v6 = -[PTUtil init](&v124, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_35;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("renderDisparity"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  renderDisparity = v7->_renderDisparity;
  v7->_renderDisparity = (MTLComputePipelineState *)v8;

  if (!v7->_renderDisparity)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("reciprocal"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  reciprocal = v7->_reciprocal;
  v7->_reciprocal = (MTLComputePipelineState *)v10;

  if (!v7->_reciprocal)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.2(v42, v50, v51, v52, v53, v54, v55, v56);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("sobelFilter"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  sobelFilter = v7->_sobelFilter;
  v7->_sobelFilter = (MTLComputePipelineState *)v12;

  if (!v7->_sobelFilter)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.3(v42, v57, v58, v59, v60, v61, v62, v63);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("gaussianNoise"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  gaussianNoise = v7->_gaussianNoise;
  v7->_gaussianNoise = (MTLComputePipelineState *)v14;

  if (!v7->_gaussianNoise)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.4(v42, v64, v65, v66, v67, v68, v69, v70);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("renderRect"), 0);
  v16 = objc_claimAutoreleasedReturnValue();
  renderRect = v7->_renderRect;
  v7->_renderRect = (MTLComputePipelineState *)v16;

  if (!v7->_renderRect)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.5(v42, v71, v72, v73, v74, v75, v76, v77);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("renderLine"), 0);
  v18 = objc_claimAutoreleasedReturnValue();
  renderLine = v7->_renderLine;
  v7->_renderLine = (MTLComputePipelineState *)v18;

  if (!v7->_renderLine)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.6(v42, v78, v79, v80, v81, v82, v83, v84);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("visualizeCircleUsingRect"), 0);
  v20 = objc_claimAutoreleasedReturnValue();
  visualizeCircleUsingRect = v7->_visualizeCircleUsingRect;
  v7->_visualizeCircleUsingRect = (MTLComputePipelineState *)v20;

  if (!v7->_visualizeCircleUsingRect)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.7(v42, v85, v86, v87, v88, v89, v90, v91);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("drawTurboLegend"), 0);
  v22 = objc_claimAutoreleasedReturnValue();
  drawTurboLegend = v7->_drawTurboLegend;
  v7->_drawTurboLegend = (MTLComputePipelineState *)v22;

  if (!v7->_drawTurboLegend)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.8(v42, v92, v93, v94, v95, v96, v97, v98);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("drawTurboLegendYUV"), 0);
  v24 = objc_claimAutoreleasedReturnValue();
  drawTurboLegendYUV = v7->_drawTurboLegendYUV;
  v7->_drawTurboLegendYUV = (MTLComputePipelineState *)v24;

  if (!v7->_drawTurboLegendYUV)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.9(v42, v99, v100, v101, v102, v103, v104, v105);
    goto LABEL_34;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("rotateTexture"), 0);
  v26 = objc_claimAutoreleasedReturnValue();
  rotateTexture = v7->_rotateTexture;
  v7->_rotateTexture = (MTLComputePipelineState *)v26;

  if (!v7->_rotateTexture)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.10(v42, v106, v107, v108, v109, v110, v111, v112);
LABEL_34:

LABEL_35:
    v41 = 0;
    goto LABEL_36;
  }
  computeGaussianKernel2D((uint64_t)v125);
  _S0 = v125[0];
  _S1 = v125[1];
  __asm { FCVT            H0, S0 }
  v123[0] = _S0;
  __asm { FCVT            H0, S1 }
  v123[1] = _S0;
  _S0 = v125[2];
  _S1 = v125[3];
  __asm { FCVT            H0, S0 }
  v123[2] = _S0;
  __asm { FCVT            H0, S1 }
  v122[0] = _S0;
  _S0 = v125[4];
  _S1 = v125[5];
  __asm { FCVT            H0, S0 }
  v122[1] = _S0;
  __asm { FCVT            H0, S1 }
  v122[2] = _S0;
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "setConstantHalf3:withName:", v123, CFSTR("kWeights2DRow0_half3"));
  objc_msgSend(v38, "setConstantHalf3:withName:", v122, CFSTR("kWeights2DRow1_half3"));
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("gaussianFilter3x3"), v38);
  v39 = objc_claimAutoreleasedReturnValue();
  gaussianFilter3x3 = v7->_gaussianFilter3x3;
  v7->_gaussianFilter3x3 = (MTLComputePipelineState *)v39;

  if (v7->_gaussianFilter3x3)
  {
    v41 = v7;
  }
  else
  {
    _PTLogSystem();
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      -[PTUtil initWithMetalContext:].cold.11(v114, v115, v116, v117, v118, v119, v120, v121);

    v41 = 0;
  }

LABEL_36:
  return v41;
}

+ (id)findMipmapLevel:(id)a3 largerThan:(id *)a4 fromLevel:(int)a5
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t var1;
  void *v14;
  uint64_t v15;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v8 = a5;
    while (1)
    {
      v9 = v8;
      if (objc_msgSend(v7, "count") - 1 <= v8)
      {
        objc_msgSend(v7, "lastObject");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      ++v8;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9 + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "width") < a4->var0)
        break;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "height");
      var1 = a4->var1;

      if (v12 < var1)
        goto LABEL_10;
    }

LABEL_10:
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (void *)v15;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)findMipmapLevel:(id)a3 largerThan:(id *)a4
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;

  v5 = *a4;
  objc_msgSend(a1, "findMipmapLevel:largerThan:fromLevel:", a3, &v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int)getRotationDegreesFromAffineTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  unsigned int v5;
  int v6;
  NSObject *v8;
  _OWORD v9[3];

  v4 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v4;
  v9[2] = *(_OWORD *)&a3->tx;
  v5 = orientationForTransform((double *)v9);
  v6 = v5;
  if (v5 < 8)
    return dword_1C9343C10[v5];
  _PTLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[PTUtil getRotationDegreesFromAffineTransform:].cold.1((uint64_t *)a3, v6, v8);

  return 0;
}

+ (id)temporaryDirectory:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  id v16;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("/")))
  {
    if ((objc_msgSend(v3, "hasSuffix:", CFSTR("/")) & 1) == 0)
    {
      objc_msgSend(v3, "stringByAppendingString:", CFSTR("/"));
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v4;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "fileExistsAtPath:", v3) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v16 = 0;
      objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v16);
      v6 = v16;
    }
    v3 = v3;
    v9 = (void *)temporaryDirectory__res;
    temporaryDirectory__res = (uint64_t)v3;
    goto LABEL_10;
  }
  if (!temporaryDirectory__res)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)temporaryDirectory__res;
    temporaryDirectory__res = v7;

    v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v6, "setDateFormat:", CFSTR("dd-MM-yyyy_HHmmss"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)temporaryDirectory__res, "stringByAppendingFormat:", CFSTR("%@/"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)temporaryDirectory__res;
    temporaryDirectory__res = v11;

    v15 = 0;
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", temporaryDirectory__res, 1, 0, &v15);

LABEL_10:
  }
  v13 = (id)temporaryDirectory__res;

  return v13;
}

- (int)reciprocalTex:(id)a3 inTex:(id)a4 outTex:(id)a5 epsilon:(float)a6
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
  objc_msgSend(v11, "setComputePipelineState:", self->_reciprocal);
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

- (int)_drawTurboLegendTick:(id)a3 outTexture:(id)a4 rect:(id *)a5 maxValue:(float)a6
{
  uint64_t v11;
  double v17;
  __int128 v19;

  if (a6 >= 0.0)
  {
    v11 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v19 = _Q0;
    do
    {
      LODWORD(v17) = (int)(float)((float)(a5->var1.var0 * v11) / a6) + LODWORD(a5->var0.var0);
      HIDWORD(v17) = a5->var0.var1;
      -[PTUtil renderRect:rect:color:fill:outTexture:](self, "renderRect:rect:color:fill:outTexture:", a3, 0, a4, v17, *(double *)&v19, v19);
      ++v11;
    }
    while ((float)(int)v11 <= a6);
  }
  return 0;
}

- (int)drawTurboLegend:(id)a3 outLuma:(id)a4 outChroma:(id)a5 rect:(id *)a6 maxValue:(float)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int32x2_t v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  int32x2_t v31;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    _PTLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  }
  objc_msgSend(v15, "setComputePipelineState:", self->_drawTurboLegendYUV);
  objc_msgSend(v15, "setTexture:atIndex:", v13, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v12, 1);

  v24 = vmovn_s64(*(int64x2_t *)&a6->var0.var0);
  v24.i16[1] = v24.i16[2];
  v24.i16[2] = a6->var1.var0;
  v24.i16[3] = LOWORD(a6->var1.var1) - 20;
  v31 = v24;
  objc_msgSend(v15, "setBytes:length:atIndex:", &v31, 8, 0);
  v30[0] = v31.u16[2];
  v30[1] = v31.u16[3];
  v30[2] = 1;
  v27 = xmmword_1C9322A40;
  *(_QWORD *)&v28 = 1;
  objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v30, &v27);
  objc_msgSend(v15, "endEncoding");
  a6->var0.var1 = a6->var1.var1 + a6->var0.var1 - 20;
  a6->var1.var1 = 20;
  v25 = *(_OWORD *)&a6->var0.var2;
  v27 = *(_OWORD *)&a6->var0.var0;
  v28 = v25;
  v29 = *(_OWORD *)&a6->var1.var1;
  -[PTUtil _drawTurboLegendTick:outTexture:rect:maxValue:](self, "_drawTurboLegendTick:outTexture:rect:maxValue:", v14, v13, &v27, COERCE_DOUBLE(__PAIR64__(DWORD1(v29), LODWORD(a7))));

  return 0;
}

- (int)drawTurboLegend:(id)a3 outRGBA:(id)a4 rect:(id *)a5 maxValue:(float)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int32x2_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[3];
  int32x2_t v29;

  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  objc_msgSend(v12, "setComputePipelineState:", self->_drawTurboLegend);
  objc_msgSend(v12, "setTexture:atIndex:", v10, 0);
  v21 = vmovn_s64(*(int64x2_t *)&a5->var0.var0);
  v21.i16[1] = v21.i16[2];
  v21.i16[2] = a5->var1.var0;
  v21.i16[3] = LOWORD(a5->var1.var1) - 20;
  v29 = v21;
  objc_msgSend(v12, "setBytes:length:atIndex:", &v29, 8, 0);
  v22 = a5->var1.var1 - 20;
  v28[0] = a5->var1.var0;
  v28[1] = v22;
  v28[2] = 1;
  v25 = xmmword_1C9322A40;
  *(_QWORD *)&v26 = 1;
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v28, &v25);
  objc_msgSend(v12, "endEncoding");
  a5->var0.var1 = a5->var1.var1 + a5->var0.var1 - 20;
  a5->var1.var1 = 20;
  v23 = *(_OWORD *)&a5->var0.var2;
  v25 = *(_OWORD *)&a5->var0.var0;
  v26 = v23;
  v27 = *(_OWORD *)&a5->var1.var1;
  -[PTUtil _drawTurboLegendTick:outTexture:rect:maxValue:](self, "_drawTurboLegendTick:outTexture:rect:maxValue:", v11, v10, &v25, COERCE_DOUBLE(__PAIR64__(DWORD1(v27), LODWORD(a6))));

  return 0;
}

- (int)gaussianNoise:(id)a3 inNoise:(id)a4 outTex:(id)a5
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
  objc_msgSend(v10, "setComputePipelineState:", self->_gaussianNoise);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
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

- (int)sobelFilterSingleChannelColor:(id)a3 input:(id)a4 output:(id)a5 scale:(float)a6
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
  objc_msgSend(v11, "setComputePipelineState:", self->_sobelFilter);
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

- (int)renderDisparity:(id)a3 inDisparity:(id)a4 outYUV:(id)a5 region:(PTRegion)a6 drawLegend:(BOOL)a7
{
  _BOOL4 v7;
  unint64_t v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[3];
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;

  v7 = a7;
  v8 = *(_QWORD *)&a6.var0.var0;
  v32 = *(_QWORD *)&a6.var0.var0;
  v12 = a3;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setNormalizedCoordinates:", 1);
  objc_msgSend(v15, "setMinFilter:", 0);
  objc_msgSend(v15, "setMagFilter:", 0);
  -[PTMetalContext device](self->_metalContext, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "newSamplerStateWithDescriptor:", v15);

  v18 = WORD2(v8);
  v19 = HIWORD(v8);
  objc_msgSend(v12, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setComputePipelineState:", self->_renderDisparity);
  objc_msgSend(v20, "setTexture:atIndex:", v14, 0);

  objc_msgSend(v13, "texLuma");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTexture:atIndex:", v21, 1);

  objc_msgSend(v13, "texChroma");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTexture:atIndex:", v22, 2);

  objc_msgSend(v20, "setBytes:length:atIndex:", &v32, 8, 0);
  objc_msgSend(v20, "setSamplerState:atIndex:", v17, 0);
  v31[0] = v18;
  v31[1] = v19;
  v31[2] = 1;
  v29 = xmmword_1C9322A40;
  v30 = 1;
  objc_msgSend(v20, "dispatchThreads:threadsPerThreadgroup:", v31, &v29);
  objc_msgSend(v20, "endEncoding");
  if (v7)
  {
    objc_msgSend(v13, "texLuma");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "texChroma");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v26, 0, sizeof(v26));
    v27 = xmmword_1C9343A00;
    v28 = 1;
    -[PTUtil drawTurboLegend:outLuma:outChroma:rect:maxValue:](self, "drawTurboLegend:outLuma:outChroma:rect:maxValue:", v12, v23, v24, v26, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(3.5)));

  }
  return 0;
}

- (int)visualizeCircleUsingRect:(id)a3 center:(float)a4 radius:(id)a5 outTexture:
{
  float v5;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[3];
  float v23;
  uint64_t v24;

  v24 = *(_QWORD *)&a4;
  v23 = v5;
  v8 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  objc_msgSend(v9, "setComputePipelineState:", self->_visualizeCircleUsingRect);
  objc_msgSend(v9, "setTexture:atIndex:", v8, 0);

  objc_msgSend(v9, "setBytes:length:atIndex:", &v24, 8, 0);
  objc_msgSend(v9, "setBytes:length:atIndex:", &v23, 4, 1);
  v18 = ceilf(v23);
  v22[0] = (unint64_t)(float)(v18 + v18);
  v22[1] = v22[0];
  v22[2] = 1;
  v20 = xmmword_1C9322A40;
  v21 = 1;
  objc_msgSend(v9, "dispatchThreads:threadsPerThreadgroup:", v22, &v20);
  objc_msgSend(v9, "endEncoding");

  return 0;
}

- (int)renderRect:(PTUtil *)self rect:(SEL)a2 color:(id)a3 fill:(BOOL)a4 outTexture:(id)a5
{
  int8x16_t v5;
  __int128 v6;
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
  __int128 v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  BOOL v25;
  __int128 v26;
  int8x16_t v27;

  v26 = v6;
  v25 = a4;
  v5.u64[1] = (unint64_t)vmax_s32((int32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL), (int32x2_t)0x100000001);
  v27 = v5;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  objc_msgSend(v10, "setComputePipelineState:", self->_renderRect);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setBytes:length:atIndex:", &v27, 16, 0);
  objc_msgSend(v10, "setBytes:length:atIndex:", &v26, 16, 1);
  objc_msgSend(v10, "setBytes:length:atIndex:", &v25, 1, 2);
  *(_QWORD *)&v19 = v27.i32[2];
  *((_QWORD *)&v19 + 1) = v27.i32[3];
  v23 = v19;
  v24 = 1;
  v21 = xmmword_1C9322A40;
  v22 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", &v23, &v21);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)renderLine:(PTUtil *)self line:(SEL)a2 color:(id)a3 outTexture:(id)a4
{
  int32x4_t v4;
  __int128 v5;
  int v6;
  int v7;
  int v8;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  int64x2_t v25;
  __int128 v26;
  int32x4_t v27;

  v26 = v5;
  v27 = v4;
  v6 = vsubq_s32(v4, vdupq_laneq_s32(v4, 2)).u32[0];
  if (v6 < 0)
    v6 = -v6;
  v7 = vsubq_s32(v4, vdupq_laneq_s32(v4, 3)).i32[1];
  if (v7 < 0)
    v7 = -v7;
  if (v6 <= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8)
  {
    v11 = a4;
    objc_msgSend(a3, "computeCommandEncoder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      _PTLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    }
    objc_msgSend(v12, "setComputePipelineState:", self->_renderLine);
    objc_msgSend(v12, "setTexture:atIndex:", v11, 0);

    objc_msgSend(v12, "setBytes:length:atIndex:", &v27, 16, 0);
    objc_msgSend(v12, "setBytes:length:atIndex:", &v26, 16, 1);
    v23 = 1;
    v24 = (v8 + 1);
    v25 = vdupq_n_s64(1uLL);
    v22 = xmmword_1C9322A40;
    objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", &v24, &v22);
    objc_msgSend(v12, "endEncoding");

  }
  return 0;
}

- (int)gaussianFilter3x3:(id)a3 inRGB:(id)a4 outRGB:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_gaussianFilter3x3);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  v11 = objc_msgSend(v8, "width");
  v12 = objc_msgSend(v8, "height");

  v16[0] = v11;
  v16[1] = v12;
  v16[2] = 1;
  v14 = xmmword_1C9323050;
  v15 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v16, &v14);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (void)rotateTexture:(id)a3 inTex:(id)a4 outTex:(id)a5 rotationDegrees:(int)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  int v17;

  v17 = (a6 + 360) % 360;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setComputePipelineState:", self->_rotateTexture);
  objc_msgSend(v11, "setTexture:atIndex:", v10, 0);

  objc_msgSend(v11, "setTexture:atIndex:", v9, 1);
  objc_msgSend(v11, "setBytes:length:atIndex:", &v17, 4, 0);
  v12 = objc_msgSend(v9, "width");
  v13 = objc_msgSend(v9, "height");

  v16[0] = v12;
  v16[1] = v13;
  v16[2] = 1;
  v14 = xmmword_1C9322A40;
  v15 = 1;
  objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v16, &v14);
  objc_msgSend(v11, "endEncoding");

}

+ (unsigned)orientationFromTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  return objc_msgSend(a1, "orientationFromTransform:inverse:", v5, 0);
}

+ (unsigned)orientationFromTransform:(CGAffineTransform *)a3 inverse:(BOOL)a4
{
  __int128 v4;
  unsigned int v5;
  NSObject *v7;
  _OWORD v8[3];

  v4 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->tx;
  v5 = orientationForTransform((double *)v8);
  if (v5 < 4)
    return dword_1C9343A20[v5];
  _PTLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[PTUtil orientationFromTransform:inverse:].cold.1(v7);

  return -1;
}

+ (int)orientationForTransform:(CGAffineTransform *)a3 size:(id *)a4
{
  __int128 v5;
  int v6;
  unint64_t var1;
  unsigned int v8;
  int result;
  _DWORD *v10;
  _OWORD v11[3];

  v5 = *(_OWORD *)&a3->c;
  v11[0] = *(_OWORD *)&a3->a;
  v11[1] = v5;
  v11[2] = *(_OWORD *)&a3->tx;
  v6 = orientationForTransform((double *)v11);
  var1 = a4->var1;
  v8 = v6 - 1;
  if (a4->var0 < var1)
    result = 1;
  else
    result = 3;
  if (v8 <= 6)
  {
    if (a4->var0 >= var1)
      v10 = &unk_1C9343BD8;
    else
      v10 = &unk_1C9343BF4;
    return v10[v8];
  }
  return result;
}

+ (float)adjustIntrinsics:(double)a3 fromImageSize:(double)a4 toViewPortSize:(double)a5
{
  double v8;
  BOOL v9;
  double v10;
  double v11;
  float32x2_t v12;

  if (a4 != a6 || a5 != a7)
  {
    HIDWORD(a1) = HIDWORD(a2);
    v8 = a6 / a7;
    v9 = a6 / a7 < a4 / a5;
    *(float *)&v8 = a7 / a5;
    v10 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v8, 0));
    *(float *)&a6 = a6 / a4;
    v11 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a6, 0));
    if (v9)
      *(double *)&v12 = v10;
    else
      *(double *)&v12 = v11;
    LODWORD(a1) = vmul_f32(*(float32x2_t *)&a1, v12).u32[0];
  }
  return *(float *)&a1;
}

+ (float)projectionMatrixForOrientation:(double)a3 intrinsics:(double)a4 fromImageSize:(double)a5 viewportSize:(float64_t)a6 reverseZ:(float64_t)a7 depthNearFar:
{
  double v7;
  float v8;
  float v10;
  float v15;

  *(float *)&v7 = *(float *)&a3 + 0.5;
  v8 = a5 - (float)(*((float *)&a3 + 1) + 0.5);
  *((float *)&v7 + 1) = v8;
  +[PTUtil adjustIntrinsics:fromImageSize:toViewPortSize:](PTUtil, "adjustIntrinsics:fromImageSize:toViewPortSize:", a1, a2, v7);
  _Q6.f64[0] = a6;
  _Q6.f64[1] = a7;
  v10 = vcvt_f32_f64(_Q6).f32[0];
  __asm { FMOV            V6.2S, #1.0 }
  return (float)(v15 + v15) / v10;
}

+ (float)perspectiveProjectionFieldOfView:(float)a1 aspectRatio:(float)a2 depthNearFar:reverseZ:
{
  return 1.0 / (float)(tanf(a1 * 0.5) * a2);
}

+ (float)perspectiveProjectionFromIntrinsics:(float)a1 colorSize:(uint64_t)a2 depthNearFar:(uint64_t)a3 reverseZ:(unint64_t *)a4
{
  return (float)(a1 + a1) / (float)*a4;
}

+ (double)transformFromRotation:(__n128)a3 translation:(__n128)a4
{
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  double result;

  v4.i64[0] = vzip1q_s32(a1, a2).u64[0];
  v4.i64[1] = __PAIR64__(a4.n128_u32[0], a3.n128_u32[0]);
  v5.i64[0] = vtrn2q_s32(a1, a2).u64[0];
  v5.i64[1] = __PAIR64__(a4.n128_u32[1], a3.n128_u32[1]);
  v6.i64[0] = vzip2q_s32(a1, a2).u64[0];
  v6.i64[1] = __PAIR64__(a4.n128_u32[2], a3.n128_u32[2]);
  *(_QWORD *)&result = vzip1q_s32(vzip1q_s32(v4, v6), vzip1q_s32(v5, (int32x4_t)0)).u64[0];
  return result;
}

+ (double)mirrorMatrix4x4OverX:(__n128)a3
{
  uint64_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  uint64_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  __int128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;

  v4 = 0;
  v5 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
  v6 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
  v7 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v18 + v4) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1C9322B70, COERCE_FLOAT(*(__int128 *)((char *)&v14 + v4))), v5, *(float32x2_t *)((char *)&v14 + v4), 1), v6, *(float32x4_t *)((char *)&v14 + v4), 2), v7, *(float32x4_t *)((char *)&v14 + v4), 3);
    v4 += 16;
  }
  while (v4 != 64);
  v8 = 0;
  v9 = v18;
  v10 = v19;
  v11 = v20;
  v12 = v21;
  v14 = xmmword_1C9322B70;
  v15 = (__n128)v5;
  v16 = (__n128)v6;
  v17 = (__n128)v7;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v18 + v8) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(__int128 *)((char *)&v14 + v8))), v10, *(float32x2_t *)((char *)&v14 + v8), 1), v11, *(float32x4_t *)((char *)&v14 + v8), 2), v12, *(float32x4_t *)((char *)&v14 + v8), 3);
    v8 += 16;
  }
  while (v8 != 64);
  return *(double *)v18.i64;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotateTexture, 0);
  objc_storeStrong((id *)&self->_gaussianFilter3x3, 0);
  objc_storeStrong((id *)&self->_visualizeCircleUsingRect, 0);
  objc_storeStrong((id *)&self->_renderLine, 0);
  objc_storeStrong((id *)&self->_renderRect, 0);
  objc_storeStrong((id *)&self->_sobelFilter, 0);
  objc_storeStrong((id *)&self->_gaussianNoise, 0);
  objc_storeStrong((id *)&self->_drawTurboLegendYUV, 0);
  objc_storeStrong((id *)&self->_drawTurboLegend, 0);
  objc_storeStrong((id *)&self->_reciprocal, 0);
  objc_storeStrong((id *)&self->_renderDisparity, 0);
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

- (void)initWithMetalContext:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)orientationFromTransform:(os_log_t)log inverse:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Mirror Unsupported", v1, 2u);
}

+ (void)getRotationDegreesFromAffineTransform:(os_log_t)log .cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9[0] = 67110656;
  v9[1] = a2;
  v10 = 2048;
  v11 = v3;
  v12 = 2048;
  v13 = v4;
  v14 = 2048;
  v15 = v5;
  v16 = 2048;
  v17 = v6;
  v18 = 2048;
  v19 = v7;
  v20 = 2048;
  v21 = v8;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Unexpected rotation %i for transform (%f %f %f %f) (%f %f)", (uint8_t *)v9, 0x44u);
}

@end
