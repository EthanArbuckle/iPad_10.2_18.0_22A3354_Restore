@implementation PKCategoryVisualizationCardView

float32x4_t __68__PKCategoryVisualizationCardView_renderWithTextures_rendererState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  float64x2_t v5;
  float64x2_t v6;
  float32x4_t result;
  float64_t v8;
  float64_t v9;
  float64_t v10;
  float64_t v11;

  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(a2, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);
  v5.f64[0] = v11;
  v6.f64[0] = v9;
  v5.f64[1] = v10;
  v6.f64[1] = v8;
  result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v6);
  *(float32x4_t *)(*(_QWORD *)(a1 + 56) + 16 * a3) = result;
  return result;
}

- (void)setMagnitudes:(id)a3 withStyle:(int64_t)a4
{
  NSSet *v6;
  NSSet *magnitudes;
  unint64_t bucketCount;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
  BOOL v18;
  __n128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!self->_invalidated)
  {
    v6 = (NSSet *)objc_msgSend(a3, "copy");
    magnitudes = self->_magnitudes;
    self->_magnitudes = v6;

    bucketCount = self->_state.bucketCount;
    if (bucketCount)
      bzero(self->_state.magnitudeForBucket, 8 * bucketCount);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_magnitudes;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "magnitude", (_QWORD)v20);
          v16 = fmin(fmax(v15, 0.0), 1.0);
          v17 = objc_msgSend(v14, "bucket");
          v18 = v16 <= 0.0 || (uint64_t)v17 < 1;
          if (!v18 && v17 < self->_state.bucketCount)
            self->_state.magnitudeForBucket[v17] = fmin(fmax(v16 + self->_state.magnitudeForBucket[v17], 0.0), 1.0);
        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    self->_needsDraw = 1;
    -[PKCategoryVisualizationCardView _updatePausedState]((uint64_t)self);
    if (!self->_emptying)
    {
      if ((unint64_t)(a4 - 1) <= 1 && self->_effectivePaused)
      {
        self->_hasPendingUpdate = 1;
        self->_pendingUpdateStyle = a4;
        return;
      }
      self->_hasPendingUpdate = 0;
      if (a4 == 2)
      {
        -[PKCategoryVisualizationCardView _empty](self);
        return;
      }
      if (a4 == 1)
      {
        if (!self->_anon_278[10156])
        {
          self->_anon_278[10156] = 1;
          v19.n128_u64[0] = 0x4170000033D6BF95;
          *(_QWORD *)&self->_anon_278[172] = 0x4170000033D6BF95;
        }
      }
      else if (a4)
      {
        return;
      }
      -[PKCategoryVisualizationCardView _updateCircles]((uint64_t)self, v19);
    }
  }
}

- (void)_updateCircles
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  double v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  _QWORD *v12;
  float32x2_t v13;
  double v20;
  double v21;
  BOOL v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  float32x4_t v27;
  _QWORD *v28;
  float32x2_t v29;
  float32x4_t v30;
  float32x2_t v31;
  _BYTE *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __float2 v37;
  _BYTE *v38;
  float32x2_t v39;
  uint32_t v40;
  float v41;
  float v42;
  __int128 v43;
  __int128 v44;
  char v45;
  uint32_t v46;
  float v47;
  unint64_t v48;
  float v49;
  _BYTE v50[9856];
  _QWORD v51[2];
  float64x2_t v52;
  float v53;
  float v54;
  _BYTE *v55;
  _BYTE *v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  v3 = *(_QWORD *)(a1 + 896);
  v4 = *(_QWORD *)(a1 + 616);
  if (v4)
  {
    v5 = 0;
    v6 = *(double **)(a1 + 624);
    do
    {
      v7 = *v6++;
      a2.n128_f64[0] = v7;
      if (v7 > 0.0)
        ++v5;
      --v4;
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)(a1 + 10768) = v5;
  MEMORY[0x24BDAC7A8](a2);
  v8 = v50;
  v56 = v50;
  if (!v3)
  {
    v46 = arc4random();
    v8 = v56;
    v47 = (float)((float)v46 * 2.3283e-10) * 6.28318531;
    v54 = v47;
    v48 = *(_QWORD *)(a1 + 616);
    v49 = 6.28318531 / (double)v48;
    v53 = v49;
    if (v48)
      goto LABEL_11;
LABEL_43:
    v11 = 0;
    v45 = 1;
    goto LABEL_45;
  }
  v9 = *(_QWORD *)(a1 + 616);
  v54 = 0.0;
  v53 = 0.0;
  if (!v9)
    goto LABEL_43;
LABEL_11:
  v51[1] = v51;
  v10 = 0;
  v11 = 0;
  v12 = (_QWORD *)(a1 + 608);
  v55 = v8 + 28;
  v59 = (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL);
  v52 = (float64x2_t)vdupq_n_s64(0x3FD999999999999AuLL);
  v13 = (float32x2_t)vdup_n_s32(0x2F800000u);
  __asm { FMOV            V0.2D, #2.0 }
  v58 = _Q0;
  __asm { FMOV            V0.2D, #-1.0 }
  v57 = _Q0;
  do
  {
    v20 = *(double *)(v12[2] + 8 * v10);
    if (v20 <= 0.0)
      goto LABEL_39;
    v21 = v20 * 80.0;
    v22 = v21 > 1.0 || v21 <= 0.0;
    v23 = vcvtad_u64_f64(v21);
    if (!v22)
      v23 = 1;
    v24 = 88 - v11 >= v23 ? v23 : 88 - v11;
    if (!v24)
      goto LABEL_39;
    if (!v3)
    {
      v37 = __sincosf_stret(v54 + (float)((float)v10 * v53));
      v29 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32((float32x2_t)v37), v52));
      goto LABEL_34;
    }
    v25 = v12[36];
    if (!v25)
    {
      v29 = 0;
LABEL_34:
      v38 = &v55[112 * v11];
      do
      {
        v60 = *(_OWORD *)(*(_QWORD *)(a1 + 632) + 16 * v10);
        v39 = v29;
        if (v3)
        {
          v40 = arc4random();
          v39 = vadd_f32(v29, vcvt_f32_f64(vmulq_f64(vmlaq_f64(v57, v58, vcvtq_f64_f32(vmul_f32(vcvt_f32_u32((uint32x2_t)__PAIR64__(arc4random(), v40)), v13))), v59)));
        }
        v41 = (float)((float)((float)arc4random() * 2.3283e-10) * 0.12) + 0.04;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v42 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 608);
        *(float32x2_t *)(v38 - 28) = v39;
        *(_QWORD *)(v38 - 20) = 0;
        *((float *)v38 - 3) = v41;
        *((_QWORD *)v38 - 1) = 0x3F8000003DCCCCCDLL;
        *(float *)v38 = v42;
        *(_OWORD *)(v38 + 4) = v60;
        v43 = v62;
        *(_OWORD *)(v38 + 20) = v61;
        *(_OWORD *)(v38 + 36) = v43;
        v44 = v64;
        *(_OWORD *)(v38 + 52) = v63;
        *(_OWORD *)(v38 + 68) = v44;
        ++v11;
        v38 += 112;
        --v24;
      }
      while (v24);
      goto LABEL_38;
    }
    v26 = 0;
    v27 = *(float32x4_t *)(v12[3] + 16 * v10);
    v28 = v12 + 38;
    v29 = 0;
    do
    {
      v30 = *((float32x4_t *)v28 + 2);
      if ((vminvq_u32((uint32x4_t)vceqq_f32(v30, v27)) & 0x80000000) != 0)
      {
        v31 = *(float32x2_t *)v28;
        v32 = &v8[112 * v11];
        *(_QWORD *)v32 = *v28;
        v33 = v28[3];
        *(_OWORD *)(v32 + 8) = *(_OWORD *)(v28 + 1);
        *((_QWORD *)v32 + 3) = v33;
        *((float32x4_t *)v32 + 2) = v30;
        v34 = *((_OWORD *)v28 + 6);
        v36 = *((_OWORD *)v28 + 3);
        v35 = *((_OWORD *)v28 + 4);
        *((_OWORD *)v32 + 5) = *((_OWORD *)v28 + 5);
        *((_OWORD *)v32 + 6) = v34;
        *((_OWORD *)v32 + 3) = v36;
        *((_OWORD *)v32 + 4) = v35;
        ++v11;
        v29 = vadd_f32(v29, v31);
        if (++v26 >= v24)
          break;
      }
      v28 += 14;
      --v25;
    }
    while (v25);
    if (v26)
    {
      v27.f32[0] = (float)v26;
      v29 = vdiv_f32(v29, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.f32, 0));
    }
    v22 = v24 > v26;
    v24 -= v26;
    if (v22)
      goto LABEL_34;
LABEL_38:
    v8 = v56;
    if (v11 > 0x57)
      goto LABEL_41;
LABEL_39:
    ++v10;
    v12 = (_QWORD *)(a1 + 608);
  }
  while (v10 < *(_QWORD *)(a1 + 616));
  if (v11)
  {
LABEL_41:
    qsort(v8, v11, 0x70uLL, (int (__cdecl *)(const void *, const void *))PKCompareCircleDataByCreated);
    v8 = v56;
    v45 = 0;
    goto LABEL_45;
  }
  v45 = 1;
LABEL_45:
  memcpy((void *)(a1 + 912), v8, 112 * v11);
  *(_QWORD *)(a1 + 896) = v11;
  if (!v3 && (v45 & 1) == 0)
  {
    *(_DWORD *)(a1 + 10784) += 210;
    -[PKCategoryVisualizationCardView _updatePausedState](a1);
  }
}

- (void)motionManager:(id)a3 didReceiveMotion:(id)a4
{
  void *v5;
  float64_t v6;
  float64x2_t v7;
  float64_t v8;
  float64x2_t v9;
  float32x4_t v10;
  int32x4_t v11;
  int8x16_t v12;
  float32x4_t v13;
  float32x4_t v14;
  int8x16_t v15;
  float32x2_t v16;
  float32x4_t v17;
  unsigned __int32 v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  $E677626826CA12538C84A96611BF9C17 *p_state;
  float32x4_t v26;
  int8x16_t v27;
  float32x2_t v28;
  float32x4_t v29;
  unsigned __int32 v30;
  float32x2_t v31;
  float32x2_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;

  objc_msgSend(a4, "attitude", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quaternion");
  v7.f64[1] = v6;
  v9.f64[1] = v8;
  v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7);

  v10 = vmulq_f32(v40, (float32x4_t)xmmword_213A5D860);
  v11 = (int32x4_t)vnegq_f32(v10);
  v12 = (int8x16_t)vtrn2q_s32((int32x4_t)v10, vtrn1q_s32((int32x4_t)v10, v11));
  v39 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v10, (int8x16_t)v11, 8uLL), (float32x4_t)0);
  v13 = (float32x4_t)vrev64q_s32((int32x4_t)v10);
  v13.i32[0] = v11.i32[1];
  v13.i32[3] = v11.i32[2];
  v38 = (float32x4_t)vextq_s8(v12, v12, 8uLL);
  v41 = v10;
  v37 = v13;
  v14 = vaddq_f32(vmlaq_f32(v10, (float32x4_t)0, v13), vmlaq_f32(v39, (float32x4_t)0, v38));
  v15 = (int8x16_t)vmulq_f32(v14, v14);
  v16 = vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
  v17 = (float32x4_t)xmmword_213A5D820;
  if (vaddv_f32(v16) != 0.0)
  {
    v18 = vadd_f32(v16, (float32x2_t)vdup_lane_s32((int32x2_t)v16, 1)).u32[0];
    v19 = vrsqrte_f32((float32x2_t)v18);
    v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18, vmul_f32(v19, v19)));
    v17 = vmulq_n_f32(v14, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18, vmul_f32(v20, v20))).f32[0]);
  }
  *(double *)v21.i64 = simd_matrix4x4(v17);
  p_state = &self->_state;
  p_state[423].magnitudeForBucket = (double *)vneg_f32((float32x2_t)*(_OWORD *)&vmlaq_f32(vaddq_f32(v23, vmlaq_f32(vmulq_f32(v21, (float32x4_t)0), (float32x4_t)0, v22)), (float32x4_t)0, v24));
  v26 = vaddq_f32(vmlaq_f32(vmulq_f32(v41, (float32x4_t)vdupq_n_s32(0x3F74C5EFu)), (float32x4_t)0, v37), vmlaq_f32(v39, (float32x4_t)vdupq_n_s32(0x3E95F619u), v38));
  v27 = (int8x16_t)vmulq_f32(v26, v26);
  v28 = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL));
  v29 = (float32x4_t)xmmword_213A5D820;
  if (vaddv_f32(v28) != 0.0)
  {
    v30 = vadd_f32(v28, (float32x2_t)vdup_lane_s32((int32x2_t)v28, 1)).u32[0];
    v31 = vrsqrte_f32((float32x2_t)v30);
    v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30, vmul_f32(v31, v31)));
    v29 = vmulq_n_f32(v26, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30, vmul_f32(v32, v32))).f32[0]);
  }
  *(double *)&v33 = simd_matrix4x4(v29);
  *(_OWORD *)&p_state[4].startTime = v33;
  *(_OWORD *)&p_state[4].magnitudeForBucket = v34;
  *(_OWORD *)&p_state[5].bucketCount = v35;
  *(_OWORD *)&p_state[6].startTime = v36;
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  void *v5;
  float v6;
  double v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  PKTextureLoader *overlayTextureLoader;
  uint64_t v25;
  PKTextureLoader *v26;
  PKTextureLoader *overlayNormalTextureLoader;
  PKTextureLoader *v28;
  void *v29;
  MPSUnaryImageKernel *blurShader;
  MTLTexture *texture;
  void *v32;
  void *v33;
  int v34;
  int v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;

  if (!-[PKMetalRenderLoop isDrawableAvailable](self->_renderLoop, "isDrawableAvailable", a3, a4))
  {

    return;
  }
  -[PKMetalRenderLoop currentDrawable](self->_renderLoop, "currentDrawable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v36 = v5;
    if (!-[PKCategoryVisualizationCardView _updateRenderPassDescriptorWithDrawable:](self, v5))
    {
LABEL_27:
      v5 = v36;
      goto LABEL_28;
    }
    *(float *)&v7 = -[PKCategoryVisualizationCardView _calculateNewCirclePositions]((uint64_t)self, v6);
    v8 = (_OWORD *)-[MTLBuffer contents](self->_circleUniformsBuffer, "contents", v7);
    *v8 = *(_OWORD *)&self->_anon_278[8];
    v9 = *(_OWORD *)&self->_anon_278[72];
    v11 = *(_OWORD *)&self->_anon_278[24];
    v10 = *(_OWORD *)&self->_anon_278[40];
    v8[3] = *(_OWORD *)&self->_anon_278[56];
    v8[4] = v9;
    v8[1] = v11;
    v8[2] = v10;
    v12 = *(_OWORD *)&self->_anon_278[136];
    v14 = *(_OWORD *)&self->_anon_278[88];
    v13 = *(_OWORD *)&self->_anon_278[104];
    v8[7] = *(_OWORD *)&self->_anon_278[120];
    v8[8] = v12;
    v8[5] = v14;
    v8[6] = v13;
    memcpy((void *)-[MTLBuffer contents](self->_circleDataBuffer, "contents"), &self->_anon_278[280], 112 * *(_QWORD *)&self->_anon_278[264]);
    v15 = (_OWORD *)-[MTLBuffer contents](self->_singleCircleDataBuffer, "contents");
    v17 = *(_OWORD *)&self->_anon_278[168];
    v16 = *(_OWORD *)&self->_anon_278[184];
    *v15 = *(_OWORD *)&self->_anon_278[152];
    v15[1] = v17;
    v15[2] = v16;
    v18 = *(_OWORD *)&self->_anon_278[248];
    v20 = *(_OWORD *)&self->_anon_278[200];
    v19 = *(_OWORD *)&self->_anon_278[216];
    v15[5] = *(_OWORD *)&self->_anon_278[232];
    v15[6] = v18;
    v15[3] = v20;
    v15[4] = v19;
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_overlayTextureLoader || self->_overlayNormalTextureLoader)
    {
      -[PKMetalRenderLoop device](self->_renderLoop, "device");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "blitCommandEncoder");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      overlayTextureLoader = self->_overlayTextureLoader;
      v25 = MEMORY[0x24BDAC760];
      if (overlayTextureLoader)
      {
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __57__PKCategoryVisualizationCardView_renderLoop_drawAtTime___block_invoke;
        v40[3] = &unk_24D0A0E38;
        v40[4] = self;
        v41 = v22;
        v42 = v23;
        -[PKTextureLoader read:](overlayTextureLoader, "read:", v40);
        v26 = self->_overlayTextureLoader;
        self->_overlayTextureLoader = 0;

      }
      overlayNormalTextureLoader = self->_overlayNormalTextureLoader;
      if (overlayNormalTextureLoader)
      {
        v37[0] = v25;
        v37[1] = 3221225472;
        v37[2] = __57__PKCategoryVisualizationCardView_renderLoop_drawAtTime___block_invoke_34;
        v37[3] = &unk_24D0A0E38;
        v37[4] = self;
        v38 = v22;
        v39 = v23;
        -[PKTextureLoader read:](overlayNormalTextureLoader, "read:", v37);
        v28 = self->_overlayNormalTextureLoader;
        self->_overlayNormalTextureLoader = 0;

      }
      objc_msgSend(v23, "endEncoding");

    }
    if (!self->_overlayTexture || !self->_overlayNormalTexture)
    {
      -[PKCategoryVisualizationCardView invalidate](self, "invalidate");
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v21, "renderCommandEncoderWithDescriptor:", self->_renderPassDescriptor);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setRenderPipelineState:", self->_circlePipelineState);
    objc_msgSend(v29, "setVertexBuffer:offset:atIndex:", self->_vertexCoordsBuffer, 0, 0);
    objc_msgSend(v29, "setVertexBuffer:offset:atIndex:", self->_textureCoordsBuffer, 0, 1);
    objc_msgSend(v29, "setVertexBuffer:offset:atIndex:", self->_circleUniformsBuffer, 0, 2);
    objc_msgSend(v29, "setVertexBuffer:offset:atIndex:", self->_circleDataBuffer, 0, 3);
    if (*(_QWORD *)&self->_anon_278[264])
      objc_msgSend(v29, "drawPrimitives:vertexStart:vertexCount:instanceCount:", 4, 0, 4);
    if (*(float *)&self->_anon_278[172] != *(float *)&self->_anon_278[176])
    {
      objc_msgSend(v29, "setRenderPipelineState:", self->_circleOutlinePipelineState);
      objc_msgSend(v29, "setVertexBuffer:offset:atIndex:", self->_singleCircleDataBuffer, 0, 3);
      objc_msgSend(v29, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    }
    objc_msgSend(v29, "endEncoding");

    blurShader = self->_blurShader;
    texture = self->_texture;
    objc_msgSend(v36, "texture");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSUnaryImageKernel encodeToCommandBuffer:sourceTexture:destinationTexture:](blurShader, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v21, texture, v32);

    objc_msgSend(v21, "renderCommandEncoderWithDescriptor:", self->_secondRenderPassDescriptor);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRenderPipelineState:", self->_overlayPipelineState);
    objc_msgSend(v33, "setVertexBuffer:offset:atIndex:", self->_vertexCoordsBuffer, 0, 0);
    objc_msgSend(v33, "setVertexBuffer:offset:atIndex:", self->_textureCoordsBuffer, 0, 1);
    objc_msgSend(v33, "setFragmentBuffer:offset:atIndex:", self->_circleUniformsBuffer, 0, 0);
    objc_msgSend(v33, "setFragmentTexture:atIndex:", self->_overlayTexture, 0);
    objc_msgSend(v33, "setFragmentTexture:atIndex:", self->_overlayNormalTexture, 1);
    objc_msgSend(v33, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v33, "endEncoding");
    objc_msgSend(v21, "presentDrawable:", v36);
    objc_msgSend(v21, "commit");
    if (self->_needsDraw)
    {
      self->_needsDraw = 0;
      v34 = *(_DWORD *)&self->_anon_278[10152];
      if (!v34)
        goto LABEL_24;
    }
    else
    {
      v34 = *(_DWORD *)&self->_anon_278[10152];
      if (!v34)
        goto LABEL_25;
    }
    v35 = v34 - 1;
    *(_DWORD *)&self->_anon_278[10152] = v35;
    if (!v35)
LABEL_24:
      -[PKCategoryVisualizationCardView _updatePausedState]((uint64_t)self);
LABEL_25:

    goto LABEL_26;
  }
LABEL_28:

}

- (float)_calculateNewCirclePositions
{
  float32x2_t v2;
  float32x2_t *v3;
  unint64_t v4;
  unint64_t v5;
  float v6;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  uint64_t v16;
  float32x2_t *v17;
  float32x2_t *v18;
  float32x2_t v19;
  float32x2_t v20;
  float v21;
  float v22;
  float v23;
  float32x4_t v24;
  float32x4_t *v25;
  float32x2_t v26;
  float v27;
  unsigned int v28;
  float32x2_t v29;
  float v30;
  double v31;
  float v32;
  float v33;
  double v34;
  float v35;
  float32x2_t v36;
  double v37;
  double v38;
  double v39;
  float32_t v40;
  unsigned int v41;
  float v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  float v46;
  __int128 v47;
  float v48;
  float v49;
  unint64_t v50;
  double v51;

  if (!a1)
    return result;
  v3 = (float32x2_t *)(a1 + 608);
  v4 = *(_QWORD *)(a1 + 896);
  if (!v4)
    goto LABEL_23;
  v5 = 0;
  v6 = (float)*(unint64_t *)(a1 + 10768) * -0.14 + 1.5;
  __asm { FMOV            V3.2S, #-4.0 }
  v12 = (float32x2_t)vdup_n_s32(0x3D4CCCCDu);
  v13 = (float32x2_t)vdup_n_s32(0x3A83126Fu);
  v14 = (float32x2_t)vdup_n_s32(0x3F5C28F6u);
  v15 = (float32x2_t)vdup_n_s32(0xBE4CCCCD);
  do
  {
    v16 = 0;
    v17 = &v3[14 * v5];
    v18 = v17 + 38;
    v19 = v17[38];
    v20 = v17[39];
    v21 = v17[40].f32[0];
    v22 = v17[40].f32[1];
    v23 = v17[41].f32[0];
    v24 = *(float32x4_t *)v17[42].f32;
    v2.f32[0] = (float)(v21 * v22) * v6;
    v25 = (float32x4_t *)&v3[42];
    v26 = 0;
    do
    {
      if (v5 == v16)
        goto LABEL_16;
      v27 = v25[-1].f32[0] * v25[-1].f32[1];
      v28 = vminvq_u32((uint32x4_t)vceqq_f32(v24, *v25));
      v29 = vsub_f32(v19, *(float32x2_t *)v25[-2].f32);
      v30 = sqrtf(vaddv_f32(vmul_f32(v29, v29))) - (float)(v2.f32[0] + v27);
      v31 = v30;
      if ((v28 & 0x80000000) != 0 && v31 > 0.1)
      {
        v26 = vmla_f32(v26, v15, vmul_n_f32(v29, (float)(v2.f32[0] * v27) / (float)(v30 * v30)));
        goto LABEL_16;
      }
      if ((v28 & 0x80000000) != 0 && v30 < 0.0)
      {
        v32 = v30 * v30;
LABEL_15:
        v26 = vmla_f32(v26, (float32x2_t)0x3F0000003F000000, vmul_n_f32(v29, v32 * 600.0));
        goto LABEL_16;
      }
      if ((v28 & 0x80000000) == 0 && v31 < 0.08)
      {
        v33 = v31 + -0.08;
        v32 = v33 * v33;
        goto LABEL_15;
      }
LABEL_16:
      ++v16;
      v25 += 7;
    }
    while (v4 != v16);
    v34 = vaddv_f32(vmul_f32(v19, v19));
    if (v34 > 0.3)
    {
      v35 = v34 + -0.3;
      v26 = vmla_f32(v26, _D3, vmul_n_f32(v19, v35));
    }
    v2 = vmla_f32(vdiv_f32(vmul_f32(vmla_f32(v26, v12, v3[1271]), v13), (float32x2_t)vdup_lane_s32((int32x2_t)v2, 0)), v14, v20);
    v36 = vadd_f32(v19, v2);
    v37 = v22;
    v38 = (float)(v23 - v22);
    if (v23 == 1.0)
      v39 = 0.04;
    else
      v39 = 0.125;
    v40 = v37 + v38 * v39;
    *(float *)&v41 = (float)(v21 * v40) * 0.85;
    v42 = *(float *)&v41;
    LODWORD(v43) = 0;
    HIDWORD(v43) = v41;
    *(_QWORD *)&v44 = 0;
    *((_QWORD *)&v44 + 1) = v41;
    *(float32x2_t *)&v45 = v36;
    *((_QWORD *)&v45 + 1) = 0x3F80000000000000;
    *v18 = v36;
    v18[1] = v2;
    v18[2].f32[1] = v40;
    *(_OWORD *)v18[6].f32 = LODWORD(v42);
    *(_OWORD *)v18[8].f32 = v43;
    *(_OWORD *)v18[10].f32 = v44;
    *(_OWORD *)v18[12].f32 = v45;
    ++v5;
    v3 = (float32x2_t *)(a1 + 608);
    v4 = *(_QWORD *)(a1 + 896);
  }
  while (v5 < v4);
LABEL_23:
  v46 = v3[24].f32[1] + 0.075;
  v3[24].f32[1] = fminf(v46, v3[25].f32[0]);
  *(_QWORD *)&v47 = 0;
  v48 = *(float *)(a1 + 804);
  v49 = *(float *)(a1 + 808);
  LODWORD(v50) = 0;
  *((float *)&v50 + 1) = v48;
  *((_QWORD *)&v47 + 1) = LODWORD(v48);
  *(_OWORD *)(a1 + 832) = LODWORD(v48);
  *(_OWORD *)(a1 + 848) = v50;
  *(_OWORD *)(a1 + 864) = v47;
  *(_OWORD *)(a1 + 880) = xmmword_213A5D820;
  if (v48 == v49)
    *(_BYTE *)(a1 + 10788) = 0;
  v51 = 0.75;
  if (!*(_QWORD *)(a1 + 10768))
    v51 = 0.5;
  result = *(float *)(a1 + 768) * 0.95 + v51 * 0.05;
  *(float *)(a1 + 768) = result;
  return result;
}

- (unint64_t)_updateRenderPassDescriptorWithDrawable:(_QWORD *)a1
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = (unint64_t)a1;
  if (a1)
  {
    objc_msgSend(a2, "texture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "width");
    v5 = objc_msgSend(v3, "height");
    if (*(_QWORD *)(v2 + 448) != v4 || *(_QWORD *)(v2 + 456) != v5)
    {
      *(_QWORD *)(v2 + 448) = v4;
      *(_QWORD *)(v2 + 456) = v5;
      v6 = *(void **)(v2 + 432);
      *(_QWORD *)(v2 + 432) = 0;

      v7 = *(void **)(v2 + 440);
      *(_QWORD *)(v2 + 440) = 0;

      v4 = *(_QWORD *)(v2 + 448);
    }
    if (!v4 || !*(_QWORD *)(v2 + 456))
      goto LABEL_17;
    v8 = *(void **)(v2 + 440);
    v9 = v8;
    if (!v8)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDDD690]);
      v11 = *(void **)(v2 + 440);
      *(_QWORD *)(v2 + 440) = v10;

      v9 = *(void **)(v2 + 440);
    }
    objc_msgSend(v9, "colorAttachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v8)
    {
      objc_msgSend(v13, "setLoadAction:", 1);
      objc_msgSend(v14, "setStoreAction:", 1);
    }
    objc_msgSend(v14, "setTexture:", v3);
    v15 = *(_QWORD *)(v2 + 440);

    if (v15)
    {
      v16 = *(void **)(v2 + 432);
      v17 = v16;
      if (!v16)
      {
        v18 = objc_alloc_init(MEMORY[0x24BDDD690]);
        v19 = *(void **)(v2 + 432);
        *(_QWORD *)(v2 + 432) = v18;

        v17 = *(void **)(v2 + 432);
      }
      objc_msgSend(v17, "colorAttachments");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v16)
      {
        objc_msgSend(v21, "setLoadAction:", 2);
        objc_msgSend(v22, "setClearColor:", 1.0, 1.0, 1.0, 1.0);
        objc_msgSend(v22, "setStoreAction:", 1);
      }
      objc_msgSend(v22, "setTexture:", *(_QWORD *)(v2 + 488));
      v2 = *(_QWORD *)(v2 + 432) != 0;

    }
    else
    {
LABEL_17:
      v2 = 0;
    }

  }
  return v2;
}

void __57__PKCategoryVisualizationCardView_renderLoop_drawAtTime___block_invoke(uint64_t a1, uint64_t a2)
{
  void *DefaultPrivate2DTexture;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 496);
  *(_QWORD *)(v4 + 496) = DefaultPrivate2DTexture;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 496))
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213A36000, v6, OS_LOG_TYPE_DEFAULT, "PKCategoryVisualizationCardView: could not load overlay texture.", v7, 2u);
    }

  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKCategoryVisualizationCardView _updatePausedState]((uint64_t)self);
  }
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (self->_motionEnabled != a3)
  {
    self->_motionEnabled = a3;
    -[PKCategoryVisualizationCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (void)renderWithTextures:(id)a3 rendererState:(id)a4
{
  char *v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double Current;
  unint64_t v13;
  void *v14;
  void *v15;
  NSArray *bucketColors;
  int32x2_t v17;
  _QWORD v18[8];
  _QWORD v19[1268];
  __int128 v20;
  _BYTE v21[10192];
  _BYTE v22[10192];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a4;
  if (!self->_invalidated)
  {
    v7 = a3;
    PKCategoryVisualizationRendererStateDestroy((uint64_t)&self->_state);
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = *(_OWORD *)&self->_anon_278[24];
      v23 = *(_OWORD *)&self->_anon_278[8];
      v24 = v8;
      v9 = *(_OWORD *)&self->_anon_278[56];
      v25 = *(_OWORD *)&self->_anon_278[40];
      v26 = v9;
      memcpy(v21, v6 + 16, sizeof(v21));
      PKCategoryVisualizationRendererStateCopy((uint64_t)v21, (uint64_t)v22);
      memcpy(&self->_state, v22, 0x27D0uLL);
      v10 = v24;
      *(_OWORD *)&self->_anon_278[8] = v23;
      *(_OWORD *)&self->_anon_278[24] = v10;
      v11 = v26;
      *(_OWORD *)&self->_anon_278[40] = v25;
      *(_OWORD *)&self->_anon_278[56] = v11;
    }
    else
    {
      Current = CFAbsoluteTimeGetCurrent();
      v13 = -[NSArray count](self->_bucketColors, "count");
      v14 = malloc_type_malloc(8 * v13, 0xB464822DuLL);
      bzero(v14, 8 * v13);
      v15 = malloc_type_malloc(16 * v13, 0x1000040451B5BE8uLL);
      bucketColors = self->_bucketColors;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __68__PKCategoryVisualizationCardView_renderWithTextures_rendererState___block_invoke;
      v18[3] = &__block_descriptor_10224_e24_v32__0__UIColor_8Q16_B24l;
      *(double *)&v18[4] = Current;
      v18[5] = v13;
      v18[6] = v14;
      v18[7] = v15;
      bzero(v19, 0x2798uLL);
      v17 = vdup_n_s32(0xBBA3D70A);
      v19[1267] = v17;
      v20 = 0u;
      -[NSArray enumerateObjectsUsingBlock:](bucketColors, "enumerateObjectsUsingBlock:", v18);
      self->_state.startTime = Current;
      self->_state.bucketCount = v13;
      self->_state.magnitudeForBucket = (double *)v14;
      *(_QWORD *)self->_anon_278 = v15;
      bzero(&self->_anon_278[8], 0x2798uLL);
      *(int32x2_t *)&self->_anon_278[10144] = v17;
      *(_OWORD *)&self->_anon_278[10152] = 0u;
    }
    -[PKCategoryVisualizationCardView _createMetalResourcesWithTextures:]((uint64_t)self, v7);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  PKMetalRenderLoop *renderLoop;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCategoryVisualizationCardView;
  -[PKCategoryVisualizationCardView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[PKCategoryVisualizationCardView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  renderLoop = self->_renderLoop;
  objc_msgSend(v3, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRenderLoop attachToWindowScene:](renderLoop, "attachToWindowScene:", v5);

  -[PKCategoryVisualizationCardView _updateMotionEnabled]((uint64_t)self);
}

- (void)_updateMotionEnabled
{
  int v2;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 10800);
    if (*(_BYTE *)(a1 + 10800))
    {
      if (*(_BYTE *)(a1 + 601))
        v2 = 0;
      else
        v2 = objc_msgSend(*(id *)(a1 + 424), "effectiveIsPaused") ^ 1;
    }
    if (*(unsigned __int8 *)(a1 + 602) != v2)
    {
      *(_BYTE *)(a1 + 602) = v2;
      if (*(_BYTE *)(a1 + 602))
        -[PKCategoryVisualizationCardView _startMotionUpdates](a1);
      else
        -[PKCategoryVisualizationCardView _stopMotionUpdates](a1);
    }
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKCategoryVisualizationCardView;
  -[PKCategoryVisualizationCardView layoutSubviews](&v20, sel_layoutSubviews);
  -[PKCategoryVisualizationCardView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKMetalRenderLoop layer](self->_renderLoop, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");

  PKSizeRoundToPixelWithScale();
  v14 = v13;
  v16 = v15;
  -[PKMetalRenderLoop drawableSize](self->_renderLoop, "drawableSize");
  if (v18 != v14 || v17 != v16)
    -[PKMetalRenderLoop setDrawableSize:](self->_renderLoop, "setDrawableSize:", v14, v16);
}

- (void)_createMetalResourcesWithTextures:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  PKMetalRenderLoop *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  char v57;

  v3 = a2;
  if (a1 && !*(_BYTE *)(a1 + 600))
  {
    v4 = *(void **)(a1 + 424);
    if (v4)
    {
      objc_msgSend(v4, "device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = MTLCreateSystemDefaultDevice();
      if (!v5)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("could not create metal device"));
      v6 = -[PKMetalRenderLoop initWithPixelFormat:forDevice:]([PKMetalRenderLoop alloc], "initWithPixelFormat:forDevice:", 80, v5);
      v7 = *(void **)(a1 + 424);
      *(_QWORD *)(a1 + 424) = v6;

      objc_msgSend(*(id *)(a1 + 424), "setColorSpace:", PKColorSpaceStandardRGB());
      objc_msgSend(*(id *)(a1 + 424), "setFramebufferOnly:", 0);
      LODWORD(v8) = 30.0;
      LODWORD(v9) = 30.0;
      LODWORD(v10) = 30.0;
      objc_msgSend(*(id *)(a1 + 424), "setPreferredFrameRateRange:", v8, v9, v10);
      objc_msgSend(*(id *)(a1 + 424), "setDelegate:", a1);
      objc_msgSend(*(id *)(a1 + 424), "setPaused:", *(unsigned __int8 *)(a1 + 601));
      v11 = objc_msgSend(v5, "newCommandQueue");
      v12 = *(void **)(a1 + 464);
      *(_QWORD *)(a1 + 464) = v11;

      objc_msgSend(*(id *)(a1 + 424), "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setOpaque:", 0);
      objc_msgSend((id)a1, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSublayer:", v13);

      objc_msgSend((id)a1, "setNeedsLayout");
    }
    v15 = objc_msgSend(v5, "newBufferWithBytes:length:options:", &textureCoords, 32, 0);
    v16 = *(void **)(a1 + 544);
    *(_QWORD *)(a1 + 544) = v15;

    v17 = objc_msgSend(v5, "newBufferWithBytes:length:options:", &vertexCoords, 64, 0);
    v18 = *(void **)(a1 + 536);
    *(_QWORD *)(a1 + 536) = v17;

    v19 = objc_msgSend(v5, "newBufferWithLength:options:", 144, 0);
    v20 = *(void **)(a1 + 552);
    *(_QWORD *)(a1 + 552) = v19;

    v21 = objc_msgSend(v5, "newBufferWithLength:options:", 9856, 0);
    v22 = *(void **)(a1 + 560);
    *(_QWORD *)(a1 + 560) = v21;

    v23 = objc_msgSend(v5, "newBufferWithLength:options:", 112, 0);
    v24 = *(void **)(a1 + 568);
    *(_QWORD *)(a1 + 568) = v23;

    PKPassKitUIFoundationBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v5, "newDefaultLibraryWithBundle:error:", v25, 0);
    objc_msgSend(v25, "pathForResource:ofType:", CFSTR("CategoryVisualizationCardView"), CFSTR("pipelinelib"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      v28 = objc_msgSend(v5, "newPipelineLibraryWithFilePath:error:", v27, 0);
    else
      v28 = 0;
    v51 = (void *)v28;
    v29 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
    objc_msgSend(v29, "setPipelineLibrary:", v28);
    v30 = objc_alloc_init(MEMORY[0x24BDDD5A0]);
    v57 = 0;
    objc_msgSend(v30, "setConstantValue:type:atIndex:", &v57, 53, 0);
    objc_msgSend(v29, "colorAttachments");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPixelFormat:", objc_msgSend(*(id *)(a1 + 424), "pixelFormat"));
    objc_msgSend(v32, "setBlendingEnabled:", 1);
    objc_msgSend(v32, "setRgbBlendOperation:", 0);
    objc_msgSend(v32, "setSourceRGBBlendFactor:", 4);
    objc_msgSend(v32, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v32, "setAlphaBlendOperation:", 0);
    objc_msgSend(v32, "setSourceAlphaBlendFactor:", 4);
    objc_msgSend(v32, "setDestinationAlphaBlendFactor:", 5);

    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __69__PKCategoryVisualizationCardView__createMetalResourcesWithTextures___block_invoke;
    v52[3] = &unk_24D0A1760;
    v53 = v29;
    v54 = v26;
    v55 = v30;
    v56 = v5;
    v33 = v5;
    v50 = v30;
    v34 = v26;
    v35 = v29;
    v36 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199BB0CC](v52);
    ((void (**)(_QWORD, const __CFString *, const __CFString *))v36)[2](v36, CFSTR("circleVertex"), CFSTR("circleFragment"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = *(void **)(a1 + 520);
    *(_QWORD *)(a1 + 520) = v37;

    ((void (**)(_QWORD, const __CFString *, const __CFString *))v36)[2](v36, CFSTR("circleOutlineVertex"), CFSTR("circleOutlineFragment"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = *(void **)(a1 + 528);
    *(_QWORD *)(a1 + 528) = v39;

    ((void (**)(_QWORD, const __CFString *, const __CFString *))v36)[2](v36, CFSTR("overlayVertex"), CFSTR("overlayFragment"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = *(void **)(a1 + 512);
    *(_QWORD *)(a1 + 512) = v41;

    v43 = -[PKTextureLoadDescriptor initForDevice:]([PKTextureLoadDescriptor alloc], "initForDevice:", v33);
    objc_msgSend(v3, "overlayMaterialPropertyImage");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v45 = objc_msgSend(v43, "createLoaderForCGImage:", objc_msgSend(v44, "imageRef"));
    v46 = *(void **)(a1 + 472);
    *(_QWORD *)(a1 + 472) = v45;

    objc_msgSend(v3, "normalMaterialPropertyImage");
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v48 = objc_msgSend(v43, "createLoaderForCGImage:", objc_msgSend(v47, "imageRef"));
    v49 = *(void **)(a1 + 480);
    *(_QWORD *)(a1 + 480) = v48;

    -[PKCategoryVisualizationCardView _updateTextureAndBlurShader](a1);
    *(_BYTE *)(a1 + 603) = 1;
    -[PKCategoryVisualizationCardView _updatePausedState](a1);

  }
}

- (void)_updatePausedState
{
  int v2;
  uint64_t v3;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 600))
      v2 = 1;
    else
      v2 = !*(_BYTE *)(a1 + 603) && !*(_DWORD *)(a1 + 10784) && *(_BYTE *)(a1 + 10801) != 0;
    if (*(unsigned __int8 *)(a1 + 601) != v2)
    {
      *(_BYTE *)(a1 + 601) = v2;
      objc_msgSend(*(id *)(a1 + 424), "setPaused:", *(unsigned __int8 *)(a1 + 601));
      -[PKCategoryVisualizationCardView _updateMotionEnabled](a1);
      if (!*(_BYTE *)(a1 + 601))
      {
        if (*(_BYTE *)(a1 + 584))
        {
          *(_BYTE *)(a1 + 584) = 0;
          v3 = *(_QWORD *)(a1 + 592);
          switch(v3)
          {
            case 2:
              -[PKCategoryVisualizationCardView _empty]((_BYTE *)a1);
              return;
            case 1:
              if (!*(_BYTE *)(a1 + 10788))
              {
                *(_BYTE *)(a1 + 10788) = 1;
                *(_DWORD *)(a1 + 804) = 869711765;
                *(_DWORD *)(a1 + 808) = 1097859072;
              }
              goto LABEL_19;
            case 0:
LABEL_19:
              -[PKCategoryVisualizationCardView _updateCircles](a1);
              break;
          }
        }
      }
    }
  }
}

id __69__PKCategoryVisualizationCardView__createMetalResourcesWithTextures___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = (void *)objc_msgSend(v6, "newFunctionWithName:", a2);
  objc_msgSend(v5, "setVertexFunction:", v8);

  v9 = *(void **)(a1 + 32);
  v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "newFunctionWithName:constantValues:error:", v7, *(_QWORD *)(a1 + 48), 0);

  objc_msgSend(v9, "setFragmentFunction:", v10);
  return (id)objc_msgSend(*(id *)(a1 + 56), "newRenderPipelineStateWithDescriptor:error:", *(_QWORD *)(a1 + 32), 0);
}

- (void)_updateTextureAndBlurShader
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  float v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  float v27;
  double v28;
  id v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[3];

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 600))
    {
      v2 = *(void **)(a1 + 424);
      if (v2)
      {
        objc_msgSend(v2, "drawableSize");
        v5 = v3;
        v6 = v4;
        if (v3 <= 0.0 || v4 <= 0.0)
          v8 = 1.0;
        else
          v8 = v4 / v3;
        v9 = 1.0 / v8;
        LODWORD(v10) = 0;
        *((float *)&v10 + 1) = v9;
        *(_OWORD *)(a1 + 640) = xmmword_213A5D810;
        *(_OWORD *)(a1 + 656) = v10;
        *(_OWORD *)(a1 + 672) = xmmword_213A5D9D0;
        *(_OWORD *)(a1 + 688) = xmmword_213A5D820;
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scale");
        v13 = v12 * 50.0;

        v14 = (double)(uint64_t)v13;
        v15 = v14 / v8;
        v16 = (double)(uint64_t)(v14 / v8);
        v17 = (unint64_t)(v5 + v16 * 2.0);
        v18 = (unint64_t)(v6 + v14 * 2.0);
        objc_msgSend(*(id *)(a1 + 424), "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 488);
        if (!v20 || objc_msgSend(v20, "width") != v17 || objc_msgSend(*(id *)(a1 + 488), "height") != v18)
        {
          objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(*(id *)(a1 + 424), "pixelFormat"), v17, v18, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setUsage:", 5);
          v22 = objc_msgSend(v19, "newTextureWithDescriptor:", v21);
          v23 = *(void **)(a1 + 488);
          *(_QWORD *)(a1 + 488) = v22;

        }
        if (*(_BYTE *)(a1 + 10802))
          v24 = 0.0;
        else
          v24 = v13;
        v25 = *(void **)(a1 + 576);
        if (v25)
        {
          objc_msgSend(v25, "device");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26 == v19)
          {
            objc_msgSend(*(id *)(a1 + 576), "sigma");
            v28 = v27;

            if (v24 == v28)
            {
LABEL_22:
              objc_msgSend(*(id *)(a1 + 576), "setEdgeMode:", 1);
              v33 = *(void **)(a1 + 576);
              v36[0] = (uint64_t)v15;
              v36[1] = (uint64_t)v13;
              v36[2] = 0;
              objc_msgSend(v33, "setOffset:", v36);
              v34 = *(void **)(a1 + 576);
              memset(v35, 0, 24);
              v35[3] = (unint64_t)((double)v17 - v16 * 2.0);
              v35[4] = (unint64_t)((double)v18 - v14 * 2.0);
              v35[5] = 1;
              objc_msgSend(v34, "setClipRect:", v35);

              return;
            }
          }
          else
          {

          }
        }
        v29 = objc_alloc(MEMORY[0x24BDDE3C8]);
        *(float *)&v30 = v24;
        v31 = objc_msgSend(v29, "initWithDevice:sigma:", v19, v30);
        v32 = *(void **)(a1 + 576);
        *(_QWORD *)(a1 + 576) = v31;

        goto LABEL_22;
      }
    }
  }
}

- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4
{
  -[PKCategoryVisualizationCardView _updateTextureAndBlurShader]((uint64_t)self);
  self->_needsDraw = 1;
  -[PKCategoryVisualizationCardView _updatePausedState]((uint64_t)self);
}

- (void)_startMotionUpdates
{
  id v2;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 600))
    {
      +[PKMotionManager sharedManager](PKMotionManager, "sharedManager");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "registerClient:", a1);

    }
  }
}

- (void)setBucketColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 10808);
}

- (void)setBlurDisabled:(BOOL)a3
{
  if (self->_blurDisabled != a3)
  {
    self->_blurDisabled = a3;
    -[PKCategoryVisualizationCardView _updateTextureAndBlurShader]((uint64_t)self);
  }
}

- (PKCategoryVisualizationCardView)initWithFrame:(CGRect)a3
{
  PKCategoryVisualizationCardView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCategoryVisualizationCardView;
  result = -[PKCategoryVisualizationCardView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_needsDraw = 1;
  return result;
}

- (PKCategoryVisualizationCardView)init
{
  return -[PKCategoryVisualizationCardView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)dealloc
{
  objc_super v3;

  PKCategoryVisualizationRendererStateDestroy((uint64_t)&self->_state);
  -[PKCategoryVisualizationCardView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKCategoryVisualizationCardView;
  -[PKCategoryVisualizationCardView dealloc](&v3, sel_dealloc);
}

- (id)rendererState
{
  PKPassFaceViewCategoryVisualizationRendererState *v3;
  _BYTE v5[10192];

  v3 = [PKPassFaceViewCategoryVisualizationRendererState alloc];
  memcpy(v5, &self->_state, sizeof(v5));
  return -[PKPassFaceViewCategoryVisualizationRendererState initWithCurrentRendererState:](v3, v5);
}

- (void)invalidate
{
  void *v3;
  PKMetalRenderLoop *renderLoop;
  MTLCommandQueue *commandQueue;
  PKTextureLoader *overlayTextureLoader;
  PKTextureLoader *overlayNormalTextureLoader;
  MTLTexture *texture;
  MTLTexture *overlayTexture;
  MTLTexture *overlayNormalTexture;
  MTLRenderPipelineState *overlayPipelineState;
  MTLRenderPipelineState *circlePipelineState;
  MTLRenderPipelineState *circleOutlinePipelineState;
  MTLBuffer *vertexCoordsBuffer;
  MTLBuffer *textureCoordsBuffer;
  MTLBuffer *circleUniformsBuffer;
  MTLBuffer *circleDataBuffer;
  MTLBuffer *singleCircleDataBuffer;
  MPSUnaryImageKernel *blurShader;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKRenderLoop setDelegate:](self->_renderLoop, "setDelegate:", 0);
    -[PKRenderLoop invalidate](self->_renderLoop, "invalidate");
    -[PKMetalRenderLoop layer](self->_renderLoop, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperlayer");

    renderLoop = self->_renderLoop;
    self->_renderLoop = 0;

    commandQueue = self->_commandQueue;
    self->_commandQueue = 0;

    overlayTextureLoader = self->_overlayTextureLoader;
    self->_overlayTextureLoader = 0;

    overlayNormalTextureLoader = self->_overlayNormalTextureLoader;
    self->_overlayNormalTextureLoader = 0;

    texture = self->_texture;
    self->_texture = 0;

    overlayTexture = self->_overlayTexture;
    self->_overlayTexture = 0;

    overlayNormalTexture = self->_overlayNormalTexture;
    self->_overlayNormalTexture = 0;

    overlayPipelineState = self->_overlayPipelineState;
    self->_overlayPipelineState = 0;

    circlePipelineState = self->_circlePipelineState;
    self->_circlePipelineState = 0;

    circleOutlinePipelineState = self->_circleOutlinePipelineState;
    self->_circleOutlinePipelineState = 0;

    vertexCoordsBuffer = self->_vertexCoordsBuffer;
    self->_vertexCoordsBuffer = 0;

    textureCoordsBuffer = self->_textureCoordsBuffer;
    self->_textureCoordsBuffer = 0;

    circleUniformsBuffer = self->_circleUniformsBuffer;
    self->_circleUniformsBuffer = 0;

    circleDataBuffer = self->_circleDataBuffer;
    self->_circleDataBuffer = 0;

    singleCircleDataBuffer = self->_singleCircleDataBuffer;
    self->_singleCircleDataBuffer = 0;

    blurShader = self->_blurShader;
    self->_blurShader = 0;

    if (self->_effectiveMotionEnabled)
      -[PKCategoryVisualizationCardView _stopMotionUpdates]((uint64_t)self);
  }
}

- (void)_stopMotionUpdates
{
  id v2;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 600))
    {
      +[PKMotionManager sharedManager](PKMotionManager, "sharedManager");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "unregisterClient:", a1);

    }
  }
}

- (void)_empty
{
  uint64_t v2;
  char *v3;
  NSObject *v4;
  dispatch_time_t v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10[2];
  id location;

  if (val && !val[604] && *((_QWORD *)val + 112) && !val[600])
  {
    val[604] = 1;
    objc_initWeak(&location, val);
    v2 = MEMORY[0x24BDAC760];
    if (*((_QWORD *)val + 112))
    {
      v3 = 0;
      v4 = MEMORY[0x24BDAC9B8];
      do
      {
        v5 = dispatch_time(0, (uint64_t)(((double)(unint64_t)v3 * 1.5 / -80.0 + 1.5) * 1000000000.0));
        block[0] = v2;
        block[1] = 3221225472;
        block[2] = __41__PKCategoryVisualizationCardView__empty__block_invoke;
        block[3] = &unk_24D0A1580;
        objc_copyWeak(v10, &location);
        v10[1] = v3;
        dispatch_after(v5, v4, block);
        objc_destroyWeak(v10);
        ++v3;
      }
      while ((unint64_t)v3 < *((_QWORD *)val + 112));
    }
    v6 = dispatch_time(0, 3000000000);
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __41__PKCategoryVisualizationCardView__empty__block_invoke_2;
    v7[3] = &unk_24D0A12E0;
    objc_copyWeak(&v8, &location);
    dispatch_after(v6, MEMORY[0x24BDAC9B8], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __57__PKCategoryVisualizationCardView_renderLoop_drawAtTime___block_invoke_34(uint64_t a1, uint64_t a2)
{
  void *DefaultPrivate2DTexture;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 504);
  *(_QWORD *)(v4 + 504) = DefaultPrivate2DTexture;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 504))
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213A36000, v6, OS_LOG_TYPE_DEFAULT, "PKCategoryVisualizationCardView: could not load overlay normal texture.", v7, 2u);
    }

  }
}

void __41__PKCategoryVisualizationCardView__empty__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(_DWORD *)&WeakRetained[112 * *(_QWORD *)(a1 + 40) + 936] = 0x40000000;
    WeakRetained[603] = 1;
    v3 = WeakRetained;
    -[PKCategoryVisualizationCardView _updatePausedState]();
    WeakRetained = v3;
  }

}

void __41__PKCategoryVisualizationCardView__empty__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[604] = 0;
    *((_QWORD *)WeakRetained + 112) = 0;
    v2 = WeakRetained;
    -[PKCategoryVisualizationCardView _updateCircles]();
    v2[603] = 1;
    -[PKCategoryVisualizationCardView _updatePausedState](v2);
    WeakRetained = v2;
  }

}

- (NSArray)bucketColors
{
  return self->_bucketColors;
}

- (NSSet)magnitudes
{
  return self->_magnitudes;
}

- (BOOL)isMotionEnabled
{
  return self->_motionEnabled;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isBlurDisabled
{
  return self->_blurDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnitudes, 0);
  objc_storeStrong((id *)&self->_bucketColors, 0);
  objc_storeStrong((id *)&self->_blurShader, 0);
  objc_storeStrong((id *)&self->_singleCircleDataBuffer, 0);
  objc_storeStrong((id *)&self->_circleDataBuffer, 0);
  objc_storeStrong((id *)&self->_circleUniformsBuffer, 0);
  objc_storeStrong((id *)&self->_textureCoordsBuffer, 0);
  objc_storeStrong((id *)&self->_vertexCoordsBuffer, 0);
  objc_storeStrong((id *)&self->_circleOutlinePipelineState, 0);
  objc_storeStrong((id *)&self->_circlePipelineState, 0);
  objc_storeStrong((id *)&self->_overlayPipelineState, 0);
  objc_storeStrong((id *)&self->_overlayNormalTexture, 0);
  objc_storeStrong((id *)&self->_overlayTexture, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_overlayNormalTextureLoader, 0);
  objc_storeStrong((id *)&self->_overlayTextureLoader, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_secondRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_renderLoop, 0);
}

@end
