@implementation PKTexturedCardView

- (void)motionManager:(id)a3 didReceiveMotion:(id)a4
{
  float64_t v5;
  float64x2_t v6;
  float64_t v7;
  float64x2_t v8;
  id v9;

  objc_msgSend(a4, "attitude", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quaternion");
  v6.f64[1] = v5;
  v8.f64[1] = v7;
  -[PKTexturedCardView _setDeviceAttitude:]((uint64_t)self, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v6));

}

- (void)_setDeviceAttitude:(uint64_t)a1
{
  float32x4_t v3;
  int32x4_t v4;
  int8x16_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  int32x4_t v9;
  int8x16_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  int8x16_t v15;
  float32x4_t v16;
  float32x4_t v17;
  double v18;
  float v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float v23;
  float v24;
  float32x4_t v25;
  int8x16_t v26;
  float32x4_t v27;
  int8x16_t v28;
  float v29;
  float v30;
  BOOL v31;
  float v32;
  float v33;
  float32x2_t v34;
  float32x2_t v35;
  float v36;
  float32x4_t v37;
  float v38;
  float v39;
  float v40;
  float32x4_t v41;
  __n128 v42;
  float32x4_t v43;
  int8x16_t v44;
  float32x2_t v45;
  unsigned __int32 v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x4_t v49;
  float32x4_t v50;
  int8x16_t v51;
  float32x2_t v52;
  float32x2_t v53;
  float32x4_t v54;
  int32x4_t v55;
  int8x16_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float v61;
  float32x4_t v62;
  float v63;
  float v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;

  if (a1)
  {
    v3 = vmulq_f32(a2, (float32x4_t)xmmword_213A5D860);
    v4 = (int32x4_t)vnegq_f32(v3);
    v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v3, vtrn1q_s32((int32x4_t)v3, v4));
    v6 = (float32x4_t)vrev64q_s32((int32x4_t)v3);
    v6.i32[0] = v4.i32[1];
    v6.i32[3] = v4.i32[2];
    v7 = vaddq_f32(vmlaq_f32(vmulq_f32(v3, (float32x4_t)vdupq_n_s32(0x3F74C5EFu)), (float32x4_t)0, v6), vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL), (float32x4_t)0), (float32x4_t)vdupq_n_s32(0x3E95F619u), (float32x4_t)vextq_s8(v5, v5, 8uLL)));
    if (*(_BYTE *)(a1 + 464))
    {
      v8 = vmulq_f32(v7, (float32x4_t)xmmword_213A5D860);
      v9 = (int32x4_t)vnegq_f32(v8);
      v10 = (int8x16_t)vtrn2q_s32((int32x4_t)v8, vtrn1q_s32((int32x4_t)v8, v9));
      v11 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v8, (int8x16_t)v9, 8uLL), (float32x4_t)0);
      v12 = (float32x4_t)vrev64q_s32((int32x4_t)v8);
      v12.i32[0] = v9.i32[1];
      v12.i32[3] = v9.i32[2];
      v13 = vaddq_f32(v12, vmlaq_f32(v11, (float32x4_t)0, (float32x4_t)vextq_s8(v10, v10, 8uLL)));
      v14 = (int32x4_t)vnegq_f32(v13);
      v15 = (int8x16_t)vtrn2q_s32((int32x4_t)v13, vtrn1q_s32((int32x4_t)v13, v14));
      v16 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v13, (int8x16_t)v14, 8uLL), *(float32x2_t *)v7.f32, 1), (float32x4_t)vextq_s8(v15, v15, 8uLL), v7.f32[0]);
      v17 = (float32x4_t)vrev64q_s32((int32x4_t)v13);
      v17.i32[0] = v14.i32[1];
      v17.i32[3] = v14.i32[2];
      v66 = v7;
      v18 = acosf(COERCE_FLOAT(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v13, v7, 3), v17, v7, 2), v16).i32[2]));
      if (v18 <= 0.0785398163)
      {
        v42 = (__n128)v66;
      }
      else
      {
        v19 = 0.0785398163 / v18;
        v20 = vmulq_f32(v66, (float32x4_t)xmmword_213A5D820);
        v21 = (float32x4_t)vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL);
        *(float32x2_t *)v20.f32 = vadd_f32(*(float32x2_t *)v20.f32, *(float32x2_t *)v21.f32);
        v20.f32[0] = vaddv_f32(*(float32x2_t *)v20.f32);
        v21.i32[0] = 0;
        v22 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v20, v21)), 0), (int8x16_t)vnegq_f32(v66), (int8x16_t)v66);
        v23 = 1.0;
        v24 = 1.0 - v19;
        v25 = vsubq_f32((float32x4_t)xmmword_213A5D820, v22);
        v26 = (int8x16_t)vmulq_f32(v25, v25);
        v65 = v22;
        v27 = vaddq_f32(v22, (float32x4_t)xmmword_213A5D820);
        v28 = (int8x16_t)vmulq_f32(v27, v27);
        v29 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL)))));
        v30 = v29 + v29;
        v31 = (float)(v29 + v29) == 0.0;
        v32 = 1.0;
        if (!v31)
          v32 = sinf(v30) / v30;
        v33 = v32;
        v34 = vrecpe_f32((float32x2_t)LODWORD(v32));
        v35 = vmul_f32(v34, vrecps_f32((float32x2_t)LODWORD(v33), v34));
        LODWORD(v36) = vmul_f32(v35, vrecps_f32((float32x2_t)LODWORD(v33), v35)).u32[0];
        if ((float)(v24 * v30) != 0.0)
        {
          v63 = v36;
          v35.f32[0] = sinf(v24 * v30);
          v36 = v63;
          v23 = v35.f32[0] / (float)(v24 * v30);
        }
        v35.f32[0] = v24 * (float)(v36 * v23);
        v37 = (float32x4_t)vdupq_lane_s32((int32x2_t)v35, 0);
        v38 = v30 * v19;
        v39 = 1.0;
        if (v38 != 0.0)
        {
          v62 = v37;
          v64 = v36;
          v40 = sinf(v38);
          v37 = v62;
          v36 = v64;
          v39 = v40 / v38;
        }
        v41 = vmulq_n_f32(v65, (float)(v36 * v39) * v19);
        v42 = (__n128)xmmword_213A5D820;
        v43 = vmlaq_f32(v41, (float32x4_t)xmmword_213A5D820, v37);
        v44 = (int8x16_t)vmulq_f32(v43, v43);
        v45 = vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL));
        if (vaddv_f32(v45) != 0.0)
        {
          v46 = vadd_f32(v45, (float32x2_t)vdup_lane_s32((int32x2_t)v45, 1)).u32[0];
          v47 = vrsqrte_f32((float32x2_t)v46);
          v48 = vmul_f32(v47, vrsqrts_f32((float32x2_t)v46, vmul_f32(v47, v47)));
          v42 = (__n128)vmulq_n_f32(v43, vmul_f32(v48, vrsqrts_f32((float32x2_t)v46, vmul_f32(v48, v48))).f32[0]);
        }
      }
    }
    else
    {
      v42 = (__n128)v7;
    }
    v67 = (float32x4_t)v42;
    -[PKTexturedCardRenderer setRotation:](*(__n128 **)(a1 + 456), v42);
    v49 = *(float32x4_t *)(a1 + 432);
    v50 = vmulq_f32(v49, (float32x4_t)xmmword_213A5D860);
    v51 = (int8x16_t)vmulq_f32(v49, v49);
    *(float32x2_t *)v51.i8 = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
    v51.i32[0] = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v51.i8, 1)).u32[0];
    v52 = vrecpe_f32((float32x2_t)v51.u32[0]);
    v53 = vmul_f32(v52, vrecps_f32((float32x2_t)v51.u32[0], v52));
    v54 = vmulq_n_f32(v50, vmul_f32(v53, vrecps_f32((float32x2_t)v51.u32[0], v53)).f32[0]);
    v55 = (int32x4_t)vnegq_f32(v67);
    v56 = (int8x16_t)vtrn2q_s32((int32x4_t)v67, vtrn1q_s32((int32x4_t)v67, v55));
    v57 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v67, (int8x16_t)v55, 8uLL), *(float32x2_t *)v54.f32, 1), (float32x4_t)vextq_s8(v56, v56, 8uLL), v54.f32[0]);
    v58 = (float32x4_t)vrev64q_s32((int32x4_t)v67);
    v58.i32[0] = v55.i32[1];
    v58.i32[3] = v55.i32[2];
    v59 = vaddq_f32(v57, vmlaq_laneq_f32(vmulq_laneq_f32(v67, v54, 3), v58, v54, 2));
    v60 = vmulq_f32(v59, v59);
    v61 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2), vaddq_f32(v60, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v60.f32, 1))).f32[0]), v59.f32[3]);
    if (fabsf(v61 + v61) > 0.0008)
    {
      *(_BYTE *)(a1 + 425) = 1;
      -[PKTexturedCardView _updatePaused](a1);
    }
  }
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  char v5;
  char v6;
  __int128 v7;

  -[PKTexturedCardRenderer renderAtTime:]((uint64_t)self->_renderer);
  v6 = v5 ^ 1;
  if (!self->_draw)
    v6 = 0;
  self->_draw = v6;
  *(double *)&v7 = -[PKTexturedCardRenderer rotation]((uint64_t)self->_renderer);
  *(_OWORD *)&self->_anon_1b0[4] = v7;
  -[PKTexturedCardView _updatePaused]((uint64_t)self);
}

- (void)didMoveToWindow
{
  void *v3;
  PKMetalRenderLoop *renderLoop;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTexturedCardView;
  -[PKTexturedCardView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[PKTexturedCardView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  renderLoop = self->_renderLoop;
  objc_msgSend(v3, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRenderLoop attachToWindowScene:](renderLoop, "attachToWindowScene:", v5);

  -[PKTexturedCardView _updateDrawableSize]((id *)&self->super.super.super.isa);
}

- (void)_updateMotionEnabled
{
  int v2;
  int v3;
  id v4;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 466);
    if (*(_BYTE *)(a1 + 466))
      v2 = !*(_BYTE *)(a1 + 465)
        && objc_msgSend(*(id *)(a1 + 448), "isRunnable")
        && *(_BYTE *)(a1 + 424) == 0;
    if (*(unsigned __int8 *)(a1 + 427) != v2)
    {
      *(_BYTE *)(a1 + 427) = v2;
      v3 = *(unsigned __int8 *)(a1 + 427);
      +[PKMotionManager sharedManager](PKMotionManager, "sharedManager");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (v3)
        objc_msgSend(v4, "registerClient:", a1);
      else
        objc_msgSend(v4, "unregisterClient:", a1);

    }
  }
}

- (id)_initWithPixelFormat:(void *)a3 renderer:
{
  void (**v5)(id, _QWORD);
  id v6;
  PKMetalRenderLoop *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PKTexturedCardView;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    if (a1)
    {
      v6 = MTLCreateSystemDefaultDevice();
      if (!v6)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("could not create metal device"));
      v7 = -[PKMetalRenderLoop initWithPixelFormat:forDevice:]([PKMetalRenderLoop alloc], "initWithPixelFormat:forDevice:", a2, v6);
      v8 = a1[56];
      a1[56] = v7;

      v9 = a1[56];
      if (v9)
      {
        objc_msgSend(v9, "setDelegate:", a1);
        if (v5)
        {
          ((void (**)(id, id))v5)[2](v5, a1[56]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        objc_storeStrong(a1 + 57, v10);
        if (v5)

        v11 = a1[56];
        if (a1[57])
        {
          objc_msgSend(v11, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setOpaque:", 0);
          objc_msgSend(a1, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addSublayer:", v12);

          *((_OWORD *)a1 + 27) = xmmword_213A5D820;
          -[PKTexturedCardView _setDeviceAttitude:]((uint64_t)a1, (float32x4_t)_PromotedConst);
          *((_BYTE *)a1 + 425) = 1;
          *((_BYTE *)a1 + 426) = objc_msgSend(a1[56], "isPaused");
          -[PKTexturedCardView _updatePaused]((uint64_t)a1);
LABEL_15:

          goto LABEL_16;
        }
        objc_msgSend(v11, "invalidate");
      }
      v12 = v6;
      v6 = a1;
      a1 = 0;
      goto LABEL_15;
    }
  }
LABEL_16:

  return a1;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTexturedCardView;
  -[PKTexturedCardView layoutSubviews](&v4, sel_layoutSubviews);
  -[PKMetalRenderLoop layer](self->_renderLoop, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTexturedCardView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[PKTexturedCardView _updateDrawableSize]((id *)&self->super.super.super.isa);
}

- (void)_updateDrawableSize
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "bounds");
    objc_msgSend(a1[56], "screen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      objc_msgSend(v2, "scale");
    PKSizeRoundToPixelWithScale();
    objc_msgSend(a1[56], "setDrawableSize:");

  }
}

- (uint64_t)_updatePaused
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 425) && !*(_BYTE *)(result + 424))
    {
      result = -[PKPayLaterCardRenderer isInvalidated](*(_QWORD *)(result + 456));
      v2 = result;
    }
    else
    {
      v2 = 1;
    }
    if (*(unsigned __int8 *)(v1 + 426) != v2)
    {
      *(_BYTE *)(v1 + 426) = v2;
      return objc_msgSend(*(id *)(v1 + 448), "setPaused:");
    }
  }
  return result;
}

- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4
{
  self->_draw = 1;
  -[PKTexturedCardView _updatePaused]((uint64_t)self);
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (self->_motionEnabled != a3)
  {
    self->_motionEnabled = a3;
    -[PKTexturedCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (PKTexturedCardView)init
{

  return 0;
}

- (PKTexturedCardView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKTexturedCardView)initWithCoder:(id)a3
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[PKTexturedCardView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKTexturedCardView;
  -[PKTexturedCardView dealloc](&v3, sel_dealloc);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  PKMetalRenderLoop *renderLoop;
  PKTexturedCardRenderer *renderer;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_effectiveMotionEnabled)
    {
      +[PKMotionManager sharedManager](PKMotionManager, "sharedManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unregisterClient:", self);

    }
    -[PKRenderLoop invalidate](self->_renderLoop, "invalidate");
    -[PKRenderLoop setDelegate:](self->_renderLoop, "setDelegate:", 0);
    -[PKMetalRenderLoop layer](self->_renderLoop, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperlayer");

    renderLoop = self->_renderLoop;
    self->_renderLoop = 0;

    -[PKTexturedCardRenderer invalidate]((uint64_t)self->_renderer);
    renderer = self->_renderer;
    self->_renderer = 0;

  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKTexturedCardView _updatePaused]((uint64_t)self);
    -[PKTexturedCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isMotionEnabled
{
  return self->_motionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_renderLoop, 0);
}

@end
