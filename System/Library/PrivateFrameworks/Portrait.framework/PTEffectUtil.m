@implementation PTEffectUtil

- (void)clearTexture:(id)a3 outTex:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[3];

  v6 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComputePipelineState:", self->_clear);
  objc_msgSend(v7, "setTexture:atIndex:", v6, 0);
  v8 = objc_msgSend(v6, "width");
  v9 = objc_msgSend(v6, "height");

  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 1;
  v10 = xmmword_1C9322A40;
  v11 = 1;
  objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", v12, &v10);
  objc_msgSend(v7, "endEncoding");

}

- (PTEffectUtil)initWithMetalContext:(id)a3
{
  id v5;
  PTEffectUtil *v6;
  PTEffectUtil *v7;
  uint64_t v8;
  MTLComputePipelineState *updateFocusObject;
  uint64_t v10;
  MTLComputePipelineState *effectSampleFaceRects;
  uint64_t v12;
  MTLComputePipelineState *copySingleChannel;
  uint64_t v14;
  MTLComputePipelineState *clear;
  uint64_t v16;
  MTLComputePipelineState *updateDisparityWithScreenCaptureRect;
  PTEffectUtil *v18;
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
  objc_super v56;

  v5 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PTEffectUtil;
  v6 = -[PTEffectUtil init](&v56, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_19;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("updateFocusObject"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  updateFocusObject = v7->_updateFocusObject;
  v7->_updateFocusObject = (MTLComputePipelineState *)v8;

  if (!v7->_updateFocusObject)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTEffectUtil initWithMetalContext:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_18;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("effectSampleFaceRects"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  effectSampleFaceRects = v7->_effectSampleFaceRects;
  v7->_effectSampleFaceRects = (MTLComputePipelineState *)v10;

  if (!v7->_effectSampleFaceRects)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTEffectUtil initWithMetalContext:].cold.2(v19, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_18;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("copySingleChannel"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  copySingleChannel = v7->_copySingleChannel;
  v7->_copySingleChannel = (MTLComputePipelineState *)v12;

  if (!v7->_copySingleChannel)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTEffectUtil initWithMetalContext:].cold.3(v19, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_18;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("clear"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  clear = v7->_clear;
  v7->_clear = (MTLComputePipelineState *)v14;

  if (!v7->_clear)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTEffectUtil initWithMetalContext:].cold.4(v19, v41, v42, v43, v44, v45, v46, v47);
    goto LABEL_18;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("updateDisparityWithScreenCaptureRect"), 0);
  v16 = objc_claimAutoreleasedReturnValue();
  updateDisparityWithScreenCaptureRect = v7->_updateDisparityWithScreenCaptureRect;
  v7->_updateDisparityWithScreenCaptureRect = (MTLComputePipelineState *)v16;

  if (!v7->_updateDisparityWithScreenCaptureRect)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTEffectUtil initWithMetalContext:].cold.5(v19, v48, v49, v50, v51, v52, v53, v54);
LABEL_18:

LABEL_19:
    v18 = 0;
    goto LABEL_20;
  }
  v18 = v7;
LABEL_20:

  return v18;
}

+ (unint64_t)aspectRatio:(CGSize)a3
{
  double width;
  float v4;
  float v5;
  unint64_t v6;

  if (a3.width >= a3.height)
    width = a3.width;
  else
    width = a3.height;
  if (a3.width >= a3.height)
    a3.width = a3.height;
  v4 = a3.width;
  v5 = width / v4;
  v6 = 2 * (fabsf(v5 + -1.3333) < 0.05);
  if (fabsf(v5 + -1.7778) < 0.05)
    return 1;
  else
    return v6;
}

- (void)updateFocusObjectWithFaceRectCount:(int)a3 disparityFocusOffsetSDOF:(PTDisparityFocusOffset)a4 disparityFocusOffsetReactions:(PTDisparityFocusOffset)a5 disparityFocusOffsetStudioLight:(PTDisparityFocusOffset)a6 exponentialMovingAverageSDOF:(float)a7 exponentialMovingAverageStudioLight:(float)a8 faceRectsState:(int *)a9 isFirstFrame:(BOOL)a10 emitNewReaction:(BOOL)a11 focusOnAll:(BOOL)a12 lastFocus:(id)a13 inFaceDisparityArray:(id)a14 outDisparityModifiers:(id)a15 outDisparityFocus:(id)a16 outStudioLightEffectModifier:(id)a17 outUseDisparityBufferForReactions:(id)a18
{
  float v21;
  float v22;
  PTMetalContext *metalContext;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  PTDisparityFocusOffset v36[3];
  float v37;
  float v38;
  float v39;
  uint64_t v40;
  int v41;
  _OWORD v42[2];
  uint64_t v43;

  memset(v42, 0, sizeof(v42));
  v43 = 0;
  v36[0] = a4;
  v36[1] = a5;
  v36[2] = a6;
  v21 = 1.0;
  if (a10)
    v22 = 1.0;
  else
    v22 = a7;
  v37 = v22;
  v38 = v22;
  if (!a10)
    v21 = a8;
  v39 = v21;
  v40 = 0x3F00000000000000;
  v41 = 0;
  LOBYTE(v42[0]) = a12;
  DWORD1(v42[0]) = 1010174817;
  BYTE8(v42[0]) = a10;
  *(_QWORD *)((char *)v42 + 12) = 0x3F19999A3DCCCCCDLL;
  DWORD1(v42[1]) = 1053609165;
  *((_QWORD *)&v42[1] + 1) = 0x3F19999A3F000000;
  LODWORD(v43) = 1058642330;
  BYTE4(v43) = a11;
  metalContext = self->_metalContext;
  v24 = a18;
  v25 = a17;
  v26 = a16;
  v27 = a15;
  v28 = a14;
  v29 = a13;
  -[PTMetalContext commandBuffer](metalContext, "commandBuffer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "computeCommandEncoder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setComputePipelineState:", self->_updateFocusObject);
  objc_msgSend(v31, "setBytes:length:atIndex:", v36, 88, 0);
  objc_msgSend(v31, "setBuffer:offset:atIndex:", v28, 0, 1);

  objc_msgSend(v31, "setBuffer:offset:atIndex:", v29, 0, 2);
  objc_msgSend(v31, "setBuffer:offset:atIndex:", v27, 0, 3);

  objc_msgSend(v31, "setBuffer:offset:atIndex:", v26, 0, 4);
  objc_msgSend(v31, "setBytes:length:atIndex:", a9, 16, 5);
  objc_msgSend(v31, "setBuffer:offset:atIndex:", v25, 0, 6);

  objc_msgSend(v31, "setBuffer:offset:atIndex:", v24, 0, 7);
  v34 = xmmword_1C9323280;
  v35 = 1;
  v32 = xmmword_1C9322A40;
  v33 = 1;
  objc_msgSend(v31, "dispatchThreads:threadsPerThreadgroup:", &v34, &v32);
  objc_msgSend(v31, "endEncoding");

}

- (void)sampleFaceRectsWithMaxFaceRects:(int)a3 faceRects:faceRectsState:focusDisparityMax:inDisparity:outFaceDistanceArray:
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  PTMetalContext *metalContext;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  int64x2_t v22;
  int v23;

  v8 = v5;
  v9 = v4;
  v10 = v3;
  v23 = v7;
  v13 = a3;
  metalContext = self->_metalContext;
  v15 = v6;
  v16 = v8;
  -[PTMetalContext commandBuffer](metalContext, "commandBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setComputePipelineState:", self->_effectSampleFaceRects);
  objc_msgSend(v18, "setTexture:atIndex:", v16, 0);

  objc_msgSend(v18, "setBytes:length:atIndex:", v10, 16 * a3, 0);
  objc_msgSend(v18, "setBytes:length:atIndex:", v9, 4 * a3, 1);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", v15, 0, 2);

  objc_msgSend(v18, "setBytes:length:atIndex:", &v23, 4, 3);
  v21 = v13;
  v22 = vdupq_n_s64(1uLL);
  v19 = xmmword_1C93232C8;
  v20 = 1;
  objc_msgSend(v18, "dispatchThreads:threadsPerThreadgroup:", &v21, &v19);
  objc_msgSend(v18, "endEncoding");

}

- (void)copySingleChannelInTex:(id)a3 outTex:(id)a4
{
  PTMetalContext *metalContext;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];

  metalContext = self->_metalContext;
  v7 = a4;
  v8 = a3;
  -[PTMetalContext commandBuffer](metalContext, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setComputePipelineState:", self->_copySingleChannel);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v7, 1);
  v11 = objc_msgSend(v7, "width");
  v12 = objc_msgSend(v7, "height");

  v15[0] = v11;
  v15[1] = v12;
  v15[2] = 1;
  v13 = xmmword_1C9322A40;
  v14 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (void)updateDisparityWithScreenCaptureRect:(CGRect)a3 inDisparity:(id)a4 outDisparity:(id)a5 focalLenIn35mmFilm:(float)a6 fNumber:(float)a7
{
  float v9;
  float v10;
  id v11;
  id v12;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  float32x2_t v17;
  float64x2_t v18;
  int32x2_t v19;
  float64x2_t v20;
  __int32 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[3];
  float32x4_t v33;

  width = a3.size.width;
  height = a3.size.height;
  x = a3.origin.x;
  y = a3.origin.y;
  v9 = a6 / 1000.0;
  v10 = (float)(a6 / 1000.0) / (a7 + a7);
  v11 = a5;
  v12 = a4;
  +[PTRaytracingUtils frameWidth](PTRaytracingUtils, "frameWidth");
  v14 = v9 / v13;
  v15 = (float)(unint64_t)objc_msgSend(v11, "height");
  v16 = objc_msgSend(v11, "width");
  v17.f32[0] = v14 * v10;
  v18.f64[0] = x;
  *(float *)v19.i32 = x + (float)(v14 * v10);
  v18.f64[1] = y;
  v20.f64[0] = width;
  v20.f64[1] = height;
  *(float *)&v21 = y + (float)((float)((float)(v14 * v10) * v15) / (float)v16);
  v17.f32[1] = (float)((float)(v14 * v10) * v15) / (float)v16;
  v19.i32[1] = v21;
  v33 = vcvt_hight_f32_f64(v19, vsubq_f64(vaddq_f64(v18, v20), vcvtq_f64_f32(vadd_f32(v17, v17))));
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "computeCommandEncoder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setComputePipelineState:", self->_updateDisparityWithScreenCaptureRect);
  objc_msgSend(v23, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v23, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v23, "setBytes:length:atIndex:", &v33, 16, 0);
  v24 = objc_msgSend(v11, "width");
  v25 = objc_msgSend(v11, "height");

  v32[0] = v24;
  v32[1] = v25;
  v32[2] = 1;
  v30 = xmmword_1C9322A40;
  v31 = 1;
  objc_msgSend(v23, "dispatchThreads:threadsPerThreadgroup:", v32, &v30);
  objc_msgSend(v23, "endEncoding");

}

+ (CGRect)rotateNormalizedRect:(CGRect)a3 transform:(CGAffineTransform *)a4 inverse:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v10;
  int v11;
  __int128 v12;
  CGFloat v18;
  CGAffineTransform v19;
  CGRect v20;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v19.c = v10;
  *(_OWORD *)&v19.tx = *(_OWORD *)&a4->tx;
  v11 = +[PTUtil getRotationDegreesFromAffineTransform:](PTUtil, "getRotationDegreesFromAffineTransform:", &v19);
  if (v5)
  {
    if (v11 != 90)
    {
      if (v11 != 180)
      {
        if (v11 != 270)
          goto LABEL_12;
        goto LABEL_10;
      }
LABEL_9:
      v12 = xmmword_1C93232A0;
      __asm { FMOV            V0.2D, #1.0 }
LABEL_13:
      v18 = 0.0;
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (v11 != 90)
  {
    if (v11 != 270)
    {
      if (v11 != 180)
      {
LABEL_12:
        v12 = xmmword_1C9323290;
        _Q0 = 0uLL;
        goto LABEL_13;
      }
      goto LABEL_9;
    }
LABEL_11:
    _Q0 = xmmword_1C9322C10;
    v12 = xmmword_1C93232B0;
    v18 = 1.0;
    goto LABEL_14;
  }
LABEL_10:
  _Q0 = xmmword_1C9323290;
  v12 = xmmword_1C9322C10;
  v18 = -1.0;
LABEL_14:
  *(_OWORD *)&v19.a = v12;
  v19.c = v18;
  *(_QWORD *)&v19.d = v12;
  *(_OWORD *)&v19.tx = _Q0;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  return CGRectApplyAffineTransform(v20, &v19);
}

+ (id)faceRectsForVision:(id)a1 numberOfFaceRects:(SEL)a2 transform:
{
  uint64_t v2;
  int v3;
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  float *v10;
  double v11;
  double v12;
  float v13;
  float v14;
  __int128 v15;
  void *v16;
  _OWORD v18[3];

  v5 = v4;
  LODWORD(v6) = v3;
  v7 = v2;
  v9 = (void *)objc_opt_new();
  if ((int)v6 >= 1)
  {
    v6 = v6;
    v10 = (float *)(v7 + 8);
    do
    {
      v11 = *(v10 - 2);
      v12 = 1.0 - *(v10 - 1);
      v14 = *v10;
      v13 = v10[1];
      v10 += 4;
      v15 = v5[1];
      v18[0] = *v5;
      v18[1] = v15;
      v18[2] = v5[2];
      objc_msgSend(a1, "rotateNormalizedRect:transform:inverse:", v18, 0, v11, v12 - v13, v14);
      objc_msgSend(MEMORY[0x1E0CEDEE0], "observationWithBoundingBox:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v16);

      --v6;
    }
    while (v6);
  }
  return v9;
}

+ (unint64_t)closestAspectRatio:(CGSize)a3
{
  double width;
  float v4;
  float v5;

  if (a3.width >= a3.height)
    width = a3.width;
  else
    width = a3.height;
  if (a3.width >= a3.height)
    a3.width = a3.height;
  v4 = a3.width;
  v5 = width / v4;
  if (fabsf(v5 + -1.7778) < fabsf(v5 + -1.3333))
    return 1;
  else
    return 2;
}

+ (double)screenSpaceToCameraSpace:(float32x4_t)a3 zValue:(float32x4_t)a4 inverseProjection:(float32x4_t)a5
{
  float v6;
  float v7;
  float32x4_t v8;
  double result;

  v6 = *(float *)&a1 * 2.0 + -1.0;
  v7 = *((float *)&a1 + 1) * 2.0 + -1.0;
  v8 = vaddq_f32(a6, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a3, v6), a4, v7), a5, a2));
  *(_QWORD *)&result = vdivq_f32(v8, (float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 3)).u64[0];
  return result;
}

+ (double)inverseRectTransform:(float32x4_t)a1
{
  float32x4_t v1;
  double result;

  v1.i64[0] = vnegq_f32(a1).u64[0];
  __asm { FMOV            V2.4S, #1.0 }
  v1.i64[1] = *((_QWORD *)&_Q2 + 1);
  *(_QWORD *)&result = vdivq_f32(v1, (float32x4_t)vdupq_laneq_s64((int64x2_t)a1, 1)).u64[0];
  return result;
}

+ (double)transformRect:(float32x4_t)a1 intoCropCoordinates:(float32x4_t)a2
{
  float32x4_t v2;
  double result;

  v2.i64[0] = vsubq_f32(a1, a2).u64[0];
  v2.i64[1] = a1.i64[1];
  *(_QWORD *)&result = vdivq_f32(v2, (float32x4_t)vdupq_laneq_s64((int64x2_t)a2, 1)).u64[0];
  return result;
}

+ (float32x2_t)multiplyRectTransform:(float32x2_t)a1 withRectTransform:(int8x16_t)a2
{
  return vmla_f32(*(float32x2_t *)a2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL), a1);
}

+ (BOOL)currentProcessIsCameracaptured
{
  if (currentProcessIsCameracaptured_once != -1)
    dispatch_once(&currentProcessIsCameracaptured_once, &__block_literal_global_5);
  return currentProcessIsCameracaptured_answer != 0;
}

void __46__PTEffectUtil_currentProcessIsCameracaptured__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  __CFString *v2;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    v2 = (__CFString *)SecTaskCopySigningIdentifier(v0, 0);
    currentProcessIsCameracaptured_answer = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.cameracaptured"));
    CFRelease(v1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDisparityWithScreenCaptureRect, 0);
  objc_storeStrong((id *)&self->_clear, 0);
  objc_storeStrong((id *)&self->_copySingleChannel, 0);
  objc_storeStrong((id *)&self->_effectSampleFaceRects, 0);
  objc_storeStrong((id *)&self->_updateFocusObject, 0);
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

@end
