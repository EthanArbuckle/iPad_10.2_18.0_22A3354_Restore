@implementation PTRaytracingUtilsV2

- (PTRaytracingUtilsV2)initWithMetalContext:(id)a3
{
  id v5;
  PTRaytracingUtilsV2 *v6;
  PTRaytracingUtilsV2 *v7;
  uint64_t v8;
  MTLComputePipelineState *centerDisparityOnFocus;
  uint64_t v10;
  MTLComputePipelineState *sobelEdgeDetector;
  uint64_t v12;
  MTLComputePipelineState *edgeDilation;
  uint64_t v14;
  MTLComputePipelineState *focusEdgeMask;
  PTRaytracingUtilsV2 *v16;
  NSObject *v17;
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
  objc_super v47;

  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PTRaytracingUtilsV2;
  v6 = -[PTRaytracingUtilsV2 init](&v47, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_16;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("centerDisparityOnFocusV2"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  centerDisparityOnFocus = v7->_centerDisparityOnFocus;
  v7->_centerDisparityOnFocus = (MTLComputePipelineState *)v8;

  if (!v7->_centerDisparityOnFocus)
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtilsV2 initWithMetalContext:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_15;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("sobelEdgeDetectorV2"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  sobelEdgeDetector = v7->_sobelEdgeDetector;
  v7->_sobelEdgeDetector = (MTLComputePipelineState *)v10;

  if (!v7->_sobelEdgeDetector)
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.4(v17, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_15;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("edgeDilationV2"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  edgeDilation = v7->_edgeDilation;
  v7->_edgeDilation = (MTLComputePipelineState *)v12;

  if (!v7->_edgeDilation)
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.5(v17, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_15;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("focusEdgeMaskV2"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  focusEdgeMask = v7->_focusEdgeMask;
  v7->_focusEdgeMask = (MTLComputePipelineState *)v14;

  if (!v7->_focusEdgeMask)
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils initWithMetalContext:].cold.6(v17, v39, v40, v41, v42, v43, v44, v45);
LABEL_15:

LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  v16 = v7;
LABEL_17:

  return v16;
}

- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusObject:(PTFocus *)a5 focusEdge:(PTFocusEdge)a6 outFocusEdgeMask:(id)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];
  PTFocusEdge v19;

  v19 = a6;
  v11 = a7;
  v12 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", self->_focusEdgeMask);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setBytes:length:atIndex:", a5, 40, 0);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v19, 16, 1);
  v14 = objc_msgSend(v11, "width");
  v15 = objc_msgSend(v11, "height");

  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  v16 = xmmword_1C9322A30;
  v17 = 1;
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v13, "endEncoding");

}

- (void)centerDisparityOnFocus:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 focusObject:(PTFocus *)a6 foregroundBlurLimitingFactor:(float)a7
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[3];
  float v27;
  float v28;

  v28 = a7;
  v27 = *(float *)&dword_1C9322B98[(float)(a6->var2 * 1000.0) > 70.0] / a6->var0;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  objc_msgSend(v13, "setComputePipelineState:", self->_centerDisparityOnFocus);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setBytes:length:atIndex:", &a6->var1, 4, 0);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v27, 4, 1);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v28, 4, 2);
  v22 = objc_msgSend(v11, "width");
  v23 = objc_msgSend(v11, "height");

  v26[0] = v22;
  v26[1] = v23;
  v26[2] = 1;
  v24 = xmmword_1C9322A40;
  v25 = 1;
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v26, &v24);
  objc_msgSend(v13, "endEncoding");

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
  float var2;
  float v32;
  float v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[3];
  __int128 v39;
  uint64_t v40;
  _QWORD v41[3];
  char v42;
  float v43;

  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  *(float *)&v21 = a9;
  -[PTRaytracingUtilsV2 sobelEdgeDetection:inImage:outEdges:edgeTolerance:](self, "sobelEdgeDetection:inImage:outEdges:edgeTolerance:", v20, v19, v17, v21);
  objc_msgSend(v20, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    _PTLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

  }
  var2 = a7->var2;
  +[PTRaytracingUtilsV2 frameWidth](PTRaytracingUtilsV2, "frameWidth");
  v33 = (float)(var2 / v32) * a7->var0;
  v34 = objc_msgSend(v19, "width");

  v43 = v33 * (float)v34;
  v42 = 1;
  objc_msgSend(v22, "setComputePipelineState:", self->_edgeDilation);
  objc_msgSend(v22, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v22, "setTexture:atIndex:", v18, 1);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v42, 1, 0);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v43, 4, 1);
  objc_msgSend(v22, "setBuffer:offset:atIndex:", v16, 0, 2);

  v41[0] = objc_msgSend(v17, "width");
  v41[1] = objc_msgSend(v17, "height");
  v41[2] = 1;
  v39 = xmmword_1C9322A40;
  v40 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v41, &v39);
  v42 = 0;
  objc_msgSend(v22, "setTexture:atIndex:", v18, 0);

  objc_msgSend(v22, "setTexture:atIndex:", v17, 1);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v42, 1, 0);
  v35 = objc_msgSend(v17, "width");
  v36 = objc_msgSend(v17, "height");

  v38[0] = v35;
  v38[1] = v36;
  v38[2] = 1;
  v39 = xmmword_1C9322A40;
  v40 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v38, &v39);
  objc_msgSend(v22, "endEncoding");

  return 0;
}

+ (PTFocus)createFocusObject:(SEL)a3 pyramidSamplingFraction:(id)a4 anamorphicFactor:(float)a5 rayCount:(float)a6 colorSize:(int)a7 doMacroApertureLimit:(BOOL)a8
{
  float32x2_t v8;
  _BOOL4 v9;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  float v38;
  double v39;
  int32x2_t v40;
  float32x2_t v41;
  int32x2_t v42;
  float32x2_t v43;
  float v44;
  PTFocus *result;
  float v46;
  float v47;
  float32x2_t v49;
  id v50;

  v9 = a8;
  v49 = v8;
  v50 = a4;
  objc_msgSend(v50, "focusDisparity");
  v14 = v13;
  objc_msgSend(v50, "fNumber");
  v16 = v15;
  objc_msgSend(v50, "alphaLowLight");
  v18 = v17;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_QWORD *)&retstr[1].var2 = 0;
  v19 = v14;
  if (v14 < 0.025)
    v19 = 0.025;
  v20 = fmin(v19, 10.0);
  retstr->var1 = v20;
  if (v9)
  {
    if (objc_msgSend(v50, "sensorID") == 19)
    {
      v21 = 6.6;
      v22 = 0.4;
    }
    else
    {
      v21 = 2.8;
      v22 = 1.3333;
    }
    objc_msgSend(v50, "focusDisparity");
    v24 = v23;
    objc_msgSend(v50, "networkBias");
    v26 = (float)((float)((float)(v21 * (float)(v24 - v25)) / v22) * 0.33333) + v16 * 0.666666657;
    if (v26 >= v16)
    {
      v27 = v26;
      v16 = v27;
    }
  }
  v28 = v16;
  if (v16 < 1.0)
    v28 = 1.0;
  v29 = (float)(1.0 - v18) * 22.0 + v28 * v18;
  objc_msgSend(v50, "visCropFactor");
  v46 = v30;
  objc_msgSend(v50, "visCropFactor");
  if (v46 >= v31)
    v32 = v31;
  else
    v32 = v46;
  objc_msgSend(v50, "visCropFactorPreview");
  v47 = v33;
  objc_msgSend(v50, "visCropFactorPreview");
  if (v47 >= v34)
    v35 = v34;
  else
    v35 = v47;
  objc_msgSend(v50, "focalLenIn35mmFilm");
  v37 = v32;
  *(float *)&v37 = v36 / 1000.0 * v32;
  retstr->var2 = *(float *)&v37;
  v39 = v35;
  v38 = *(float *)&v37 / (v29 + v29) * v35;
  retstr->var0 = v38;
  LODWORD(v39) = v49.i32[1];
  v40.i32[0] = 1024685244;
  if (v49.f32[1] <= v49.f32[0])
  {
    v41.i32[0] = vdup_lane_s32(v40, 0).u32[0];
    v41.f32[1] = vmuls_lane_f32(0.036, v49, 1) / v49.f32[0];
  }
  else
  {
    v41 = (float32x2_t)vdup_lane_s32(v40, 0);
    v41.f32[0] = (float)(v49.f32[0] * 0.036) / v49.f32[1];
  }
  *(float *)v42.i32 = 1.0 / a6;
  *(float *)&v42.i32[1] = a6;
  v43 = vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v37, 0), v41);
  *(float32x2_t *)&retstr[1].var0 = vmul_n_f32(vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&v39, v49), 0), (int8x8_t)vrev64_s32(v42), (int8x8_t)v42), v43), v38);
  v44 = 1.0 / sqrt((double)a7 / 3.14159265) * a5;
  retstr->var3 = (float)(v49.f32[0] * (float)(v38 * v43.f32[0])) * v44;
  retstr->var4 = v44;
  retstr[1].var2 = 0.02 / v44;

  return result;
}

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

+ (float)focalLength
{
  return 0.032;
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
  objc_storeStrong((id *)&self->_centerDisparityOnFocus, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
