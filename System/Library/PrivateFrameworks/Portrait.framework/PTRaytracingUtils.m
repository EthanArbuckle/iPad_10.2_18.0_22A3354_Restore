@implementation PTRaytracingUtils

+ (PTFocusEdge)createFocusEdge
{
  float v2;
  float v3;
  float v4;
  float v5;
  PTFocusEdge result;

  v2 = 0.1;
  v3 = 4.0;
  v4 = 0.125;
  v5 = 6.0;
  result.minMaxThreshold = v2;
  result.gradientWeight = v5;
  result.gradientThreshold = v4;
  result.width = v3;
  return result;
}

- (PTRaytracingUtils)initWithMetalContext:(id)a3
{
  id v5;
  PTRaytracingUtils *v6;
  PTRaytracingUtils *v7;
  uint64_t v8;
  MTLComputePipelineState *disparityApplyPostModifier;
  uint64_t v10;
  MTLComputePipelineState *disparityPortraitPreviewDeadzone;
  uint64_t v12;
  MTLComputePipelineState *disparityMinMaxApplyPostModifier;
  uint64_t v14;
  MTLComputePipelineState *sobelEdgeDetector;
  uint64_t v16;
  MTLComputePipelineState *edgeDilation;
  uint64_t v18;
  MTLComputePipelineState *focusEdgeMask;
  PTRaytracingUtils *v20;
  NSObject *v21;
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
  objc_super v65;

  v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PTRaytracingUtils;
  v6 = -[PTRaytracingUtils init](&v65, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_22;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("disparityApplyPostModifier"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  disparityApplyPostModifier = v7->_disparityApplyPostModifier;
  v7->_disparityApplyPostModifier = (MTLComputePipelineState *)v8;

  if (!v7->_disparityApplyPostModifier)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_21;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("disparityPortraitPreviewDeadzone"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  disparityPortraitPreviewDeadzone = v7->_disparityPortraitPreviewDeadzone;
  v7->_disparityPortraitPreviewDeadzone = (MTLComputePipelineState *)v10;

  if (!v7->_disparityPortraitPreviewDeadzone)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.2(v21, v29, v30, v31, v32, v33, v34, v35);
    goto LABEL_21;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("disparityMinMaxApplyPostModifier"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  disparityMinMaxApplyPostModifier = v7->_disparityMinMaxApplyPostModifier;
  v7->_disparityMinMaxApplyPostModifier = (MTLComputePipelineState *)v12;

  if (!v7->_disparityMinMaxApplyPostModifier)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.3(v21, v36, v37, v38, v39, v40, v41, v42);
    goto LABEL_21;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("sobelEdgeDetector"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  sobelEdgeDetector = v7->_sobelEdgeDetector;
  v7->_sobelEdgeDetector = (MTLComputePipelineState *)v14;

  if (!v7->_sobelEdgeDetector)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.4(v21, v43, v44, v45, v46, v47, v48, v49);
    goto LABEL_21;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("edgeDilation"), 0);
  v16 = objc_claimAutoreleasedReturnValue();
  edgeDilation = v7->_edgeDilation;
  v7->_edgeDilation = (MTLComputePipelineState *)v16;

  if (!v7->_edgeDilation)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.5(v21, v50, v51, v52, v53, v54, v55, v56);
    goto LABEL_21;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("focusEdgeMask"), 0);
  v18 = objc_claimAutoreleasedReturnValue();
  focusEdgeMask = v7->_focusEdgeMask;
  v7->_focusEdgeMask = (MTLComputePipelineState *)v18;

  if (!v7->_focusEdgeMask)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.6(v21, v57, v58, v59, v60, v61, v62, v63);
LABEL_21:

LABEL_22:
    v20 = 0;
    goto LABEL_23;
  }
  v20 = v7;
LABEL_23:

  return v20;
}

+ (float)focalLength
{
  return 0.032;
}

- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusEdge:(PTFocusEdge)a5 outFocusEdgeMask:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  PTFocusEdge v17;

  v17 = a5;
  v9 = a6;
  v10 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setComputePipelineState:", self->_focusEdgeMask);
  objc_msgSend(v11, "setTexture:atIndex:", v10, 0);

  objc_msgSend(v11, "setTexture:atIndex:", v9, 1);
  objc_msgSend(v11, "setBytes:length:atIndex:", &v17, 16, 0);
  v12 = objc_msgSend(v9, "width");
  v13 = objc_msgSend(v9, "height");

  v16[0] = v12;
  v16[1] = v13;
  v16[2] = 1;
  v14 = xmmword_1C9322A30;
  v15 = 1;
  objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v16, &v14);
  objc_msgSend(v11, "endEncoding");

}

- (void)disparityApplyPostModifier:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 postModfier:(PTPostModifier)a6
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
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];
  PTPostModifier v25;

  v25 = a6;
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
  objc_msgSend(v11, "setComputePipelineState:", self->_disparityApplyPostModifier);
  objc_msgSend(v11, "setTexture:atIndex:", v10, 0);

  objc_msgSend(v11, "setTexture:atIndex:", v9, 1);
  objc_msgSend(v11, "setBytes:length:atIndex:", &v25, 12, 0);
  v20 = objc_msgSend(v9, "width");
  v21 = objc_msgSend(v9, "height");

  v24[0] = v20;
  v24[1] = v21;
  v24[2] = 1;
  v22 = xmmword_1C9322A40;
  v23 = 1;
  objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v24, &v22);
  objc_msgSend(v11, "endEncoding");

}

- (void)disparityPortraitPreviewDeadzone:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 postModfier:(PTPostModifier)a6
{
  float v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  float v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[3];
  float v31;
  float v32;
  PTPostModifier v33;

  v33 = a6;
  v9 = 1.0 / (float)(0.1 - (float)(1.0 / a6.var0));
  v10 = -0.100000001 - 1.0 / a6.var0;
  v11 = 1.0 / v10;
  v12 = v10 <= 0.05;
  v13 = 20.0;
  if (!v12)
    v13 = v11;
  v14 = v13;
  v31 = v14;
  v32 = v9;
  v15 = a5;
  v16 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    _PTLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

  }
  objc_msgSend(v17, "setComputePipelineState:", self->_disparityPortraitPreviewDeadzone);
  objc_msgSend(v17, "setTexture:atIndex:", v16, 0);

  objc_msgSend(v17, "setTexture:atIndex:", v15, 1);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v33, 12, 0);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v32, 4, 1);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v31, 4, 2);
  v26 = objc_msgSend(v15, "width");
  v27 = objc_msgSend(v15, "height");

  v30[0] = v26;
  v30[1] = v27;
  v30[2] = 1;
  v28 = xmmword_1C9322A40;
  v29 = 1;
  objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", v30, &v28);
  objc_msgSend(v17, "endEncoding");

}

- (void)disparityMinMaxApplyPostModifier:(id)a3 disparityMinMaxBuffer:(id)a4 postModfier:(PTPostModifier)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t v20;
  PTPostModifier v21;

  v21 = a5;
  v7 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  objc_msgSend(v8, "setComputePipelineState:", self->_disparityMinMaxApplyPostModifier);
  objc_msgSend(v8, "setBuffer:offset:atIndex:", v7, 0, 0);

  objc_msgSend(v8, "setBytes:length:atIndex:", &v21, 12, 1);
  v19 = vdupq_n_s64(1uLL);
  v20 = 1;
  v17 = xmmword_1C9322A40;
  v18 = 1;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", &v19, &v17);
  objc_msgSend(v8, "endEncoding");

}

- (int)sobelEdgeDetection:(id)a3 inImage:(id)a4 outEdges:(id)a5 edgeTolerance:(float)a6
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
  objc_msgSend(v11, "setComputePipelineState:", self->_sobelEdgeDetector);
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

- (int)detectDilatedEdges:(id)a3 inDisparity:(id)a4 tempEdges:(id)a5 outEdges:(id)a6 focusObject:(PTFocus *)a7 disparityDiffMinMax:(id)a8 edgeTolerance:(float)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float var3;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[3];
  __int128 v36;
  uint64_t v37;
  _QWORD v38[3];
  char v39;
  float v40;

  v16 = a4;
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  *(float *)&v21 = a9;
  -[PTRaytracingUtils sobelEdgeDetection:inImage:outEdges:edgeTolerance:](self, "sobelEdgeDetection:inImage:outEdges:edgeTolerance:", v20, v16, v18, v21);
  objc_msgSend(v20, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    _PTLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

  }
  var3 = a7->var3;
  v40 = var3 * (float)(unint64_t)objc_msgSend(v16, "width");
  v39 = 1;
  objc_msgSend(v22, "setComputePipelineState:", self->_edgeDilation);
  objc_msgSend(v22, "setTexture:atIndex:", v18, 0);
  objc_msgSend(v22, "setTexture:atIndex:", v19, 1);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v39, 1, 0);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v40, 4, 1);
  objc_msgSend(v22, "setBuffer:offset:atIndex:", v17, 0, 2);

  v38[0] = objc_msgSend(v18, "width");
  v38[1] = objc_msgSend(v18, "height");
  v38[2] = 1;
  v36 = xmmword_1C9322A40;
  v37 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v38, &v36);
  v39 = 0;
  objc_msgSend(v22, "setTexture:atIndex:", v19, 0);

  objc_msgSend(v22, "setTexture:atIndex:", v18, 1);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v39, 1, 0);
  v32 = objc_msgSend(v18, "width");
  v33 = objc_msgSend(v18, "height");

  v35[0] = v32;
  v35[1] = v33;
  v35[2] = 1;
  v36 = xmmword_1C9322A40;
  v37 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v35, &v36);
  objc_msgSend(v22, "endEncoding");

  return 0;
}

+ (PTFocus)createFocusObject:(SEL)a3 anamorphicFactor:(id)a4 colorSize:(float)a5 circleOfConfusionReference:(float)a6 fNumberLimitWeight:(float)a7
{
  float v7;
  float v8;
  id v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int32x2_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  double v25;
  float v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  PTFocus *result;
  float v33;
  double v34;
  int32x2_t v35;
  float32x2_t v36;
  int32x2_t v37;
  float32x2_t v38;
  __int128 v39;
  float32x2_t v40;
  float v42;
  float v43;
  int32x2_t v44;

  v8 = v7;
  v39 = *(_OWORD *)&a6;
  v11 = a4;
  objc_msgSend(v11, "visCropFactor");
  v42 = v12;
  objc_msgSend(v11, "visCropFactor");
  if (v42 >= v13)
    v14 = v13;
  else
    v14 = v42;
  objc_msgSend(v11, "visCropFactorPreview", v39);
  v43 = v15;
  objc_msgSend(v11, "visCropFactorPreview");
  if (v43 >= v16)
    v17 = v16;
  else
    v17 = v43;
  objc_msgSend(v11, "focalLenIn35mmFilm");
  *(double *)&v19 = v18 / 1000.0 * v14;
  *(float *)v19.i32 = *(double *)v19.i32;
  v44 = v19;
  objc_msgSend(v11, "fNumber");
  v21 = v20 / v17;
  objc_msgSend(v11, "focusDisparity");
  v23 = v22;
  objc_msgSend(v11, "networkBias");
  v25 = (float)((float)((float)((float)(v23 - v24) * (float)(*(float *)v44.i32 * *(float *)v44.i32)) / a7) * v8)
      + v21 * (1.0 - v8);
  if (v25 >= v21)
    v26 = v25;
  else
    v26 = v21;
  objc_msgSend(v11, "alphaLowLight");
  v28 = v26;
  if (v26 < 1.0)
    v28 = 1.0;
  v29 = (float)(1.0 - v27) * 22.0 + v28 * v27;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_QWORD *)&retstr[1].var2 = 0;
  objc_msgSend(v11, "focusDisparity");
  v31 = v30;

  retstr->var1 = v31;
  LODWORD(retstr->var2) = v44.i32[0];
  v34 = v29 + v29;
  v33 = *(float *)v44.i32 / v34;
  retstr->var0 = v33;
  LODWORD(v34) = v40.i32[1];
  v35.i32[0] = 1024685244;
  if (v40.f32[1] <= v40.f32[0])
  {
    v36.i32[0] = vdup_lane_s32(v35, 0).u32[0];
    v36.f32[1] = vmuls_lane_f32(0.036, v40, 1) / v40.f32[0];
  }
  else
  {
    v36 = (float32x2_t)vdup_lane_s32(v35, 0);
    v36.f32[0] = (float)(v40.f32[0] * 0.036) / v40.f32[1];
  }
  *(float *)v37.i32 = 1.0 / a5;
  *(float *)&v37.i32[1] = a5;
  v38 = vmul_n_f32(vdiv_f32((float32x2_t)vdup_lane_s32(v44, 0), v36), v33);
  *(float32x2_t *)&retstr[1].var0 = vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&v34, v40), 0), (int8x8_t)vrev64_s32(v37), (int8x8_t)v37), v38);
  LODWORD(retstr->var3) = v38.i32[0];
  return result;
}

+ (float)frameWidth
{
  return 0.036;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_edgeDilation, 0);
  objc_storeStrong((id *)&self->_sobelEdgeDetector, 0);
  objc_storeStrong((id *)&self->_disparityMinMaxApplyPostModifier, 0);
  objc_storeStrong((id *)&self->_disparityPortraitPreviewDeadzone, 0);
  objc_storeStrong((id *)&self->_disparityApplyPostModifier, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
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

- (void)disparityApplyPostModifier:(uint64_t)a3 inDisparity:(uint64_t)a4 outDisparity:(uint64_t)a5 postModfier:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
