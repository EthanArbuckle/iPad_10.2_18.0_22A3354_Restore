@implementation PKPayLaterCardView

- (PKPayLaterCardView)init
{

  return 0;
}

- (PKPayLaterCardView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKPayLaterCardView)initWithCoder:(id)a3
{

  return 0;
}

- (PKPayLaterCardView)initWithOverlay:(CGImage *)a3 magnitudesProvider:(id)a4
{
  PKPayLaterCardView *v4;

  if (a3)
  {
    self = (PKPayLaterCardView *)-[PKPayLaterCardView _initWithOverlay:magnitudesProvider:](self, (uint64_t)a3, a4);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_initWithOverlay:(void *)a3 magnitudesProvider:
{
  id v6;
  id v7;
  PKMetalRenderLoop *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v6 = a3;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)PKPayLaterCardView;
    a1 = objc_msgSendSuper2(&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    if (a1)
    {
      v7 = MTLCreateSystemDefaultDevice();
      if (!v7)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("could not create metal device"));
      v8 = -[PKMetalRenderLoop initWithPixelFormat:forDevice:]([PKMetalRenderLoop alloc], "initWithPixelFormat:forDevice:", 115, v7);
      v9 = (void *)*((_QWORD *)a1 + 57);
      *((_QWORD *)a1 + 57) = v8;

      v10 = (void *)*((_QWORD *)a1 + 57);
      if (v10)
      {
        objc_msgSend(v10, "setDelegate:", a1);
        v11 = -[PKPayLaterCardRenderer initWithRenderLoop:overlay:]((id *)[PKPayLaterCardRenderer alloc], *((void **)a1 + 57), a2);
        v12 = (void *)*((_QWORD *)a1 + 58);
        *((_QWORD *)a1 + 58) = v11;

        v13 = (void *)*((_QWORD *)a1 + 57);
        if (*((_QWORD *)a1 + 58))
        {
          objc_msgSend(v13, "layer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setOpaque:", 1);
          objc_msgSend(a1, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addSublayer:", v14);

          *((_OWORD *)a1 + 27) = RestingQuaternion;
          -[PKPayLaterCardRenderer setRotation:](*((__n128 **)a1 + 58), (__n128)_PromotedConst_0);
          *((_BYTE *)a1 + 425) = 1;
          *((_BYTE *)a1 + 426) = objc_msgSend(*((id *)a1 + 57), "isPaused");
          -[PKPayLaterCardView _updatePaused]((uint64_t)a1);
          objc_storeStrong((id *)a1 + 60, a3);
          objc_initWeak(&location, a1);
          v16 = (void *)*((_QWORD *)a1 + 60);
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __58__PKPayLaterCardView__initWithOverlay_magnitudesProvider___block_invoke;
          v18[3] = &unk_24D0A0FB8;
          objc_copyWeak(&v19, &location);
          objc_msgSend(v16, "setUpdateHandler:", v18);
          objc_destroyWeak(&v19);
          objc_destroyWeak(&location);
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v13, "invalidate");
      }
      v14 = v7;
      v7 = a1;
      a1 = 0;
      goto LABEL_10;
    }
  }
LABEL_11:

  return a1;
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
      result = -[PKPayLaterCardRenderer isInvalidated](*(_QWORD *)(result + 464));
      v2 = result;
    }
    else
    {
      v2 = 1;
    }
    if (*(unsigned __int8 *)(v1 + 426) != v2)
    {
      *(_BYTE *)(v1 + 426) = v2;
      return objc_msgSend(*(id *)(v1 + 456), "setPaused:");
    }
  }
  return result;
}

void __58__PKPayLaterCardView__initWithOverlay_magnitudesProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__PKPayLaterCardView__initWithOverlay_magnitudesProvider___block_invoke_2;
  v5[3] = &unk_24D0A0F90;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __58__PKPayLaterCardView__initWithOverlay_magnitudesProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (!objc_msgSend(WeakRetained, "isPresented"))
    {
      objc_storeStrong((id *)v3 + 59, *(id *)(a1 + 32));
      goto LABEL_6;
    }
    -[PKPayLaterCardRenderer setMagnitudes:](*((_QWORD *)v3 + 58), *(void **)(a1 + 32));
    WeakRetained = v3;
    if (*((_QWORD *)v3 + 56) != 210)
    {
      *((_QWORD *)v3 + 56) = 210;
      *((_BYTE *)v3 + 425) = 1;
      -[PKPayLaterCardView _updatePaused]((uint64_t)v3);
LABEL_6:
      WeakRetained = v3;
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[PKPayLaterCardView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterCardView;
  -[PKPayLaterCardView dealloc](&v3, sel_dealloc);
}

- (void)refreshMagnitudes
{
  -[PKPayLaterCardMagnitudesProvider refreshMagnitudes](self->_magnitudesProvider, "refreshMagnitudes");
}

- (void)setPresented:(BOOL)a3
{
  PKPayLaterCardMagnitudes *pendingMagnitudes;
  PKPayLaterCardMagnitudes *v5;

  -[PKPayLaterCardRenderer setPresented:]((uint64_t)self->_renderer, a3);
  pendingMagnitudes = self->_pendingMagnitudes;
  if (pendingMagnitudes)
  {
    -[PKPayLaterCardRenderer setMagnitudes:]((uint64_t)self->_renderer, pendingMagnitudes);
    v5 = self->_pendingMagnitudes;
    self->_pendingMagnitudes = 0;

  }
  if (self->_framesToRender != 210)
  {
    self->_framesToRender = 210;
    self->_draw = 1;
    -[PKPayLaterCardView _updatePaused]((uint64_t)self);
  }
}

- (BOOL)isPresented
{
  return -[PKPayLaterCardRenderer isPresented]((_BOOL8)self->_renderer);
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
  PKPayLaterCardRenderer *renderer;

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

    -[PKPayLaterCardRenderer invalidate]((uint64_t)self->_renderer);
    renderer = self->_renderer;
    self->_renderer = 0;

  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterCardView;
  -[PKPayLaterCardView layoutSubviews](&v4, sel_layoutSubviews);
  -[PKMetalRenderLoop layer](self->_renderLoop, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterCardView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[PKPayLaterCardView _updateDrawableSize]((id *)&self->super.super.super.isa);
}

- (void)_updateDrawableSize
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "bounds");
    objc_msgSend(a1[57], "screen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      objc_msgSend(v2, "scale");
    PKSizeRoundToPixelWithScale();
    objc_msgSend(a1[57], "setDrawableSize:");

  }
}

- (void)didMoveToWindow
{
  void *v3;
  PKMetalRenderLoop *renderLoop;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterCardView;
  -[PKPayLaterCardView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[PKPayLaterCardView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  renderLoop = self->_renderLoop;
  objc_msgSend(v3, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRenderLoop attachToWindowScene:](renderLoop, "attachToWindowScene:", v5);

  -[PKPayLaterCardView _updateDrawableSize]((id *)&self->super.super.super.isa);
}

- (void)_updateMotionEnabled
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float64_t v8;
  float64x2_t v9;
  float64_t v10;
  float64x2_t v11;
  void *v12;
  id v13;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 489);
    if (*(_BYTE *)(a1 + 489))
      v2 = !*(_BYTE *)(a1 + 488)
        && objc_msgSend(*(id *)(a1 + 456), "isRunnable")
        && *(_BYTE *)(a1 + 424) == 0;
    if (*(unsigned __int8 *)(a1 + 427) != v2)
    {
      *(_BYTE *)(a1 + 427) = v2;
      v3 = *(unsigned __int8 *)(a1 + 427);
      +[PKMotionManager sharedManager](PKMotionManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v4;
      if (v3)
      {
        if (objc_msgSend(v4, "isMonitoring"))
        {
          objc_msgSend(v13, "motion");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          if (v5)
          {
            objc_msgSend(v5, "attitude");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "quaternion");
            v9.f64[1] = v8;
            v11.f64[1] = v10;
            -[PKPayLaterCardView _setDeviceAttitude:](a1, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v9));

          }
        }
        +[PKMotionManager sharedManager](PKMotionManager, "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "registerClient:", a1);

      }
      else
      {
        objc_msgSend(v4, "unregisterClient:", a1);
      }

    }
  }
}

- (void)_setDeviceAttitude:(uint64_t)a1
{
  float32x4_t v3;
  int32x4_t v4;
  int8x16_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int8x16_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x4_t v14;
  int32x4_t v15;
  int8x16_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float v21;
  __n128 v22;

  if (a1)
  {
    v3 = vmulq_f32(a2, (float32x4_t)xmmword_213A5D860);
    v4 = (int32x4_t)vnegq_f32(v3);
    v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v3, vtrn1q_s32((int32x4_t)v3, v4));
    v6 = (float32x4_t)vextq_s8(v5, v5, 8uLL);
    v7 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL), (float32x4_t)0);
    v8 = (float32x4_t)vrev64q_s32((int32x4_t)v3);
    v8.i32[0] = v4.i32[1];
    v8.i32[3] = v4.i32[2];
    v22 = (__n128)vaddq_f32(vmlaq_f32(vmulq_f32(v3, (float32x4_t)vdupq_n_s32(0x3F74C5EFu)), (float32x4_t)0, v8), vmlaq_f32(v7, (float32x4_t)vdupq_n_s32(0x3E95F619u), v6));
    -[PKPayLaterCardRenderer setGravity:](*(__n128 **)(a1 + 464), (__n128)vaddq_f32(vmlaq_f32(v3, (float32x4_t)0, v8), vmlaq_f32(v7, (float32x4_t)0, v6)));
    -[PKPayLaterCardRenderer setRotation:](*(__n128 **)(a1 + 464), v22);
    v9 = *(float32x4_t *)(a1 + 432);
    v10 = vmulq_f32(v9, (float32x4_t)xmmword_213A5D860);
    v11 = (int8x16_t)vmulq_f32(v9, v9);
    *(float32x2_t *)v11.i8 = vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
    v11.i32[0] = vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1)).u32[0];
    v12 = vrecpe_f32((float32x2_t)v11.u32[0]);
    v13 = vmul_f32(v12, vrecps_f32((float32x2_t)v11.u32[0], v12));
    v14 = vmulq_n_f32(v10, vmul_f32(v13, vrecps_f32((float32x2_t)v11.u32[0], v13)).f32[0]);
    v15 = (int32x4_t)vnegq_f32((float32x4_t)v22);
    v16 = (int8x16_t)vtrn2q_s32((int32x4_t)v22, vtrn1q_s32((int32x4_t)v22, v15));
    v17 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v22, (int8x16_t)v15, 8uLL), *(float32x2_t *)v14.f32, 1), (float32x4_t)vextq_s8(v16, v16, 8uLL), v14.f32[0]);
    v18 = (float32x4_t)vrev64q_s32((int32x4_t)v22);
    v18.i32[0] = v15.i32[1];
    v18.i32[3] = v15.i32[2];
    v19 = vaddq_f32(v17, vmlaq_laneq_f32(vmulq_laneq_f32((float32x4_t)v22, v14, 3), v18, v14, 2));
    v20 = vmulq_f32(v19, v19);
    v21 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0]), v19.f32[3]);
    if (fabsf(v21 + v21) > 0.0008)
    {
      *(_BYTE *)(a1 + 425) = 1;
      -[PKPayLaterCardView _updatePaused](a1);
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKPayLaterCardView _updatePaused]((uint64_t)self);
    -[PKPayLaterCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (self->_motionEnabled != a3)
  {
    self->_motionEnabled = a3;
    -[PKPayLaterCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4
{
  self->_draw = 1;
  -[PKPayLaterCardView _updatePaused]((uint64_t)self);
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  unint64_t framesToRender;
  unint64_t v6;
  BOOL v7;
  __int128 v8;

  if (-[PKPayLaterCardRenderer renderAtTime:]((uint64_t)self->_renderer))
  {
    framesToRender = self->_framesToRender;
    if (framesToRender)
    {
      v6 = framesToRender - 1;
      self->_framesToRender = v6;
      v7 = v6 != 0;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }
  self->_draw = v7;
  *(double *)&v8 = -[PKPayLaterCardRenderer rotation]((uint64_t)self->_renderer);
  *(_OWORD *)&self->_anon_1b0[4] = v8;
  -[PKPayLaterCardView _updatePaused]((uint64_t)self);
}

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
  -[PKPayLaterCardView _setDeviceAttitude:]((uint64_t)self, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v6));

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
  objc_storeStrong((id *)&self->_magnitudesProvider, 0);
  objc_storeStrong((id *)&self->_pendingMagnitudes, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_renderLoop, 0);
}

@end
