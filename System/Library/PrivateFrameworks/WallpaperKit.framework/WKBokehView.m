@implementation WKBokehView

- (WKBokehView)initWithBokehWallpaperInput:(id)a3
{
  id v4;
  WKBokehView *v5;
  uint64_t v6;
  WKBokehWallpaperInput *bokehWallpaperInput;
  WKBokehMotionFilter *v8;
  WKBokehMotionFilter *motionFilter;
  CAGradientLayer *v10;
  CAGradientLayer *contentLayer;
  void *v12;
  CADisplayLink *displayLink;
  double v14;
  CGFloat v15;
  uint64_t v16;
  NSMutableArray *v17;
  NSMutableArray *bubbles;
  void *v19;
  void *v20;
  CATransform3D v22;
  CATransform3D v23;
  unsigned int v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WKBokehView;
  v5 = -[WKBokehView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bokehWallpaperInput = v5->_bokehWallpaperInput;
    v5->_bokehWallpaperInput = (WKBokehWallpaperInput *)v6;

    v8 = objc_alloc_init(WKBokehMotionFilter);
    motionFilter = v5->_motionFilter;
    v5->_motionFilter = v8;

    v10 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    contentLayer = v5->_contentLayer;
    v5->_contentLayer = v10;

    -[WKBokehView layer](v5, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", v5->_contentLayer);

    displayLink = v5->_displayLink;
    v5->_displayLink = 0;

    -[WKBokehView _disableAnimation]((uint64_t)v5);
    -[WKBokehView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    v24 = -[WKBokehWallpaperInput thumbnailSeed](v5->_bokehWallpaperInput, "thumbnailSeed");
    -[WKBokehWallpaperInput bubbleScale](v5->_bokehWallpaperInput, "bubbleScale");
    v15 = v14;
    v16 = -[WKBokehWallpaperInput bubbleCount](v5->_bokehWallpaperInput, "bubbleCount");
    memset(&v23, 0, sizeof(v23));
    CATransform3DMakeScale(&v23, v15, v15, 1.0);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bubbles = v5->_bubbles;
    v5->_bubbles = v17;

    for (; v16; --v16)
    {
      v19 = -[WKBokehBubble initWithSeed:]([WKBokehBubble alloc], &v24);
      v22 = v23;
      objc_msgSend(v19, "setTransform:", &v22);
      -[CAGradientLayer addSublayer:](v5->_contentLayer, "addSublayer:", v19);
      -[NSMutableArray addObject:](v5->_bubbles, "addObject:", v19);

    }
    -[WKBokehView _updateRenderForCurrentBokehWallpaperInput]((id *)&v5->super.super.super.isa);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKBokehView setBackgroundColor:](v5, "setBackgroundColor:", v20);

  }
  return v5;
}

- (void)_disableAnimation
{
  NSObject *v2;
  void *v3;
  double v4;
  double v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WKLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446210;
      v7 = "-[WKBokehView _disableAnimation]";
      _os_log_impl(&dword_1B8C64000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 440), "invalidate");
    v3 = *(void **)(a1 + 440);
    *(_QWORD *)(a1 + 440) = 0;

    -[WKBokehMotionFilter pauseDeviceMotionUpdates](*(_QWORD **)(a1 + 416));
    objc_msgSend(*(id *)(a1 + 424), "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v5 = v4;
    LODWORD(v4) = 0;
    objc_msgSend(*(id *)(a1 + 424), "setSpeed:", v4);
    objc_msgSend(*(id *)(a1 + 424), "setTimeOffset:", v5);
    __32__WKBokehView__disableAnimation__block_invoke();
  }
}

- (void)_updateRenderForCurrentBokehWallpaperInput
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unsigned int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "bokehWallpaperInput");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_map:", &__block_literal_global_9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[53], "setColors:", v4);
    objc_msgSend(a1, "bokehWallpaperInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bubbleColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "bokehWallpaperInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "thumbnailSeed");

    v20 = v8;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = a1[54];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
          objc_msgSend(v6, "objectAtIndex:", vcvtms_u32_f32((float)((float)((float)rand_r(&v20) * 4.6566e-10)* (float)(unint64_t)objc_msgSend(v6, "count", (_QWORD)v16))+ 0.0));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setContentsMultiplyColor:", objc_msgSend(v15, "cgColor"));

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v11);
    }

  }
}

- (void)setBokehWallpaperInput:(id)a3
{
  WKBokehWallpaperInput *v4;
  WKBokehWallpaperInput *bokehWallpaperInput;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_bokehWallpaperInput) & 1) == 0)
  {
    v4 = (WKBokehWallpaperInput *)objc_msgSend(v6, "copy");
    bokehWallpaperInput = self->_bokehWallpaperInput;
    self->_bokehWallpaperInput = v4;

    -[WKBokehView _updateRenderForCurrentBokehWallpaperInput]((id *)&self->super.super.super.isa);
  }

}

uint64_t __57__WKBokehView__updateRenderForCurrentBokehWallpaperInput__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cgColor");
}

- (void)setAnimationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void (**v6)(_QWORD);
  _QWORD aBlock[4];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[WKBokehView setAnimationEnabled:]";
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1B8C64000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: start %d.", buf, 0x12u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__WKBokehView_setAnimationEnabled___block_invoke;
  aBlock[3] = &__block_descriptor_33_e5_v8__0l;
  v8 = v3;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((((self->_displayLink == 0) ^ v3) & 1) == 0)
  {
    if (v3)
      -[WKBokehView _enableAnimation]((uint64_t)self);
    else
      -[WKBokehView _disableAnimation]((uint64_t)self);
  }
  v6[2](v6);

}

void __35__WKBokehView_setAnimationEnabled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 32);
    v4 = 136446466;
    v5 = "-[WKBokehView setAnimationEnabled:]_block_invoke";
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_1B8C64000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: complete %d.", (uint8_t *)&v4, 0x12u);
  }

}

- (void)_enableAnimation
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  int v11;
  const char *v12;
  uint64_t v13;
  CAFrameRateRange v14;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WKLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446210;
      v12 = "-[WKBokehView _enableAnimation]";
      _os_log_impl(&dword_1B8C64000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", a1, sel__screenDidUpdate_);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 440);
    *(_QWORD *)(a1 + 440) = v3;

    v5 = *(void **)(a1 + 440);
    v14 = CAFrameRateRangeMake(30.0, 120.0, 40.0);
    objc_msgSend(v5, "setPreferredFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
    v6 = *(void **)(a1 + 440);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

    -[WKBokehMotionFilter startDeviceMotionUpdates](*(_QWORD *)(a1 + 416));
    objc_msgSend(*(id *)(a1 + 424), "timeOffset");
    v9 = v8;
    LODWORD(v8) = 1.0;
    objc_msgSend(*(id *)(a1 + 424), "setSpeed:", v8);
    objc_msgSend(*(id *)(a1 + 424), "setTimeOffset:", 0.0);
    objc_msgSend(*(id *)(a1 + 424), "setBeginTime:", 0.0);
    objc_msgSend(*(id *)(a1 + 424), "convertTime:fromLayer:", 0, CACurrentMediaTime());
    objc_msgSend(*(id *)(a1 + 424), "setBeginTime:", v10 - v9);
    __31__WKBokehView__enableAnimation__block_invoke();
  }
}

void __31__WKBokehView__enableAnimation__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446210;
    v2 = "-[WKBokehView _enableAnimation]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

void __32__WKBokehView__disableAnimation__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446210;
    v2 = "-[WKBokehView _disableAnimation]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_screenDidUpdate:(id)a3
{
  -[WKBokehView setNeedsLayout](self, "setNeedsLayout", -[WKBokehMotionFilter updatePosition]((uint64_t)self->_motionFilter).f64[0]);
}

- (CATransform3D)_contentTransform
{
  double v3;
  double v4;
  __int128 *v5;
  double v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CATransform3D v27;
  CATransform3D v28;

  if (result)
  {
    -[CATransform3D bounds](result, "bounds");
    v5 = (__int128 *)MEMORY[0x1E0CD2610];
    if (v3 >= v4)
      v6 = v3;
    else
      v6 = v4;
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    a2[4] = v7;
    a2[5] = v8;
    v9 = v5[6];
    v10 = v5[7];
    a2[6] = v9;
    a2[7] = v10;
    v11 = *v5;
    v12 = v5[1];
    *a2 = *v5;
    a2[1] = v12;
    v13 = v5[2];
    v14 = v5[3];
    a2[2] = v13;
    a2[3] = v14;
    *(_OWORD *)&v27.m31 = v7;
    *(_OWORD *)&v27.m33 = v8;
    *(_OWORD *)&v27.m41 = v9;
    *(_OWORD *)&v27.m43 = v10;
    *(_OWORD *)&v27.m11 = v11;
    *(_OWORD *)&v27.m13 = v12;
    *(_OWORD *)&v27.m21 = v13;
    *(_OWORD *)&v27.m23 = v14;
    CATransform3DTranslate(&v28, &v27, v3 * 0.5, v4 * 0.5, 0.0);
    v15 = *(_OWORD *)&v28.m33;
    a2[4] = *(_OWORD *)&v28.m31;
    a2[5] = v15;
    v16 = *(_OWORD *)&v28.m43;
    a2[6] = *(_OWORD *)&v28.m41;
    a2[7] = v16;
    v17 = *(_OWORD *)&v28.m13;
    *a2 = *(_OWORD *)&v28.m11;
    a2[1] = v17;
    v18 = *(_OWORD *)&v28.m23;
    a2[2] = *(_OWORD *)&v28.m21;
    a2[3] = v18;
    v19 = a2[5];
    *(_OWORD *)&v27.m31 = a2[4];
    *(_OWORD *)&v27.m33 = v19;
    v20 = a2[7];
    *(_OWORD *)&v27.m41 = a2[6];
    *(_OWORD *)&v27.m43 = v20;
    v21 = a2[1];
    *(_OWORD *)&v27.m11 = *a2;
    *(_OWORD *)&v27.m13 = v21;
    v22 = a2[3];
    *(_OWORD *)&v27.m21 = a2[2];
    *(_OWORD *)&v27.m23 = v22;
    result = CATransform3DScale(&v28, &v27, v6 * 0.5, v6 * 0.5, 1.0);
    v23 = *(_OWORD *)&v28.m33;
    a2[4] = *(_OWORD *)&v28.m31;
    a2[5] = v23;
    v24 = *(_OWORD *)&v28.m43;
    a2[6] = *(_OWORD *)&v28.m41;
    a2[7] = v24;
    v25 = *(_OWORD *)&v28.m13;
    *a2 = *(_OWORD *)&v28.m11;
    a2[1] = v25;
    v26 = *(_OWORD *)&v28.m23;
    a2[2] = *(_OWORD *)&v28.m21;
    a2[3] = v26;
  }
  else
  {
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

- (double)_parallaxTransform
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  double result;

  if (a1)
  {
    v2 = (_OWORD *)MEMORY[0x1E0CD2610];
    v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *a2 = *MEMORY[0x1E0CD2610];
    a2[1] = v4;
    v6 = v2[3];
    v5 = v2[4];
    a2[2] = v2[2];
    a2[3] = v6;
    a2[4] = v5;
    a2[5] = xmmword_1B8CE3BE0;
    result = 0.375;
    a2[6] = v3;
    a2[7] = xmmword_1B8CE3BF0;
  }
  else
  {
    result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

- (void)layoutSubviews
{
  CAGradientLayer *contentLayer;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CAGradientLayer *v12;
  CATransform3D v13;
  __int128 v14;
  CATransform3D v15;
  CATransform3D v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WKBokehView;
  -[WKBokehView layoutSubviews](&v17, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  memset(&v16, 0, sizeof(v16));
  -[WKBokehView _contentTransform]((CATransform3D *)self, (__int128 *)&v16);
  -[CAGradientLayer setBounds:](self->_contentLayer, "setBounds:", -1.0, -1.0, 2.0, 2.0);
  contentLayer = self->_contentLayer;
  v15 = v16;
  -[CAGradientLayer setTransform:](contentLayer, "setTransform:", &v15);
  -[WKBokehView bokehWallpaperInput](self, "bokehWallpaperInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parallaxMultiplier");
  v6 = v5;

  v7 = -[WKBokehMotionFilter position]((uint64_t)self->_motionFilter);
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v13.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v13.m23 = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v13.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v13.m13 = v11;
  *(_OWORD *)&v13.m31 = v10;
  *(_OWORD *)&v13.m33 = xmmword_1B8CE3BE0;
  *(_OWORD *)&v13.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v13.m43 = xmmword_1B8CE3BF0;
  CATransform3DTranslate(&v15, &v13, v6 * v7, v6 * v8, 0.0);
  *(_OWORD *)&v13.m21 = *(_OWORD *)&v15.m21;
  *(_OWORD *)&v13.m23 = *(_OWORD *)&v15.m23;
  *(_OWORD *)&v13.m31 = *(_OWORD *)&v15.m31;
  *(_OWORD *)&v13.m11 = *(_OWORD *)&v15.m11;
  *(_OWORD *)&v13.m13 = *(_OWORD *)&v15.m13;
  v12 = self->_contentLayer;
  v14 = *(_OWORD *)&v15.m41;
  -[CAGradientLayer setSublayerTransform:](v12, "setSublayerTransform:", &v15, *(_QWORD *)&v15.m11, *(_QWORD *)&v15.m12, *(_QWORD *)&v15.m13, *(_QWORD *)&v15.m14, *(_QWORD *)&v15.m21, *(_QWORD *)&v15.m22, *(_QWORD *)&v15.m23, *(_QWORD *)&v15.m24, *(_QWORD *)&v15.m31, *(_QWORD *)&v15.m32);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

+ (id)thumbnailImageWithBokehInput:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  WKBokehView *v11;
  id *p_isa;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  void *v34;
  id *v35;
  void *v36;
  double v38;
  double v39;
  _QWORD v40[4];
  id *v41;
  CATransform3D v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  CATransform3D buf;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  WKLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.m11) = 136446210;
    *(_QWORD *)((char *)&buf.m11 + 4) = "+[WKBokehView thumbnailImageWithBokehInput:]";
    _os_log_impl(&dword_1B8C64000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fixedCoordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = -[WKBokehView initWithBokehWallpaperInput:]([WKBokehView alloc], "initWithBokehWallpaperInput:", v3);
  p_isa = (id *)&v11->super.super.super.isa;
  v38 = v10 / 3.0;
  v39 = v8 / 3.0;
  if (v8 / 3.0 >= v10 / 3.0)
    v13 = v8 / 3.0;
  else
    v13 = v10 / 3.0;
  -[WKBokehView setFrame:](v11, "setFrame:", 0.0, 0.0, v13, v13);
  if (p_isa)
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v16 = *MEMORY[0x1E0CD2610];
    v49 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v50 = v14;
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v51 = v15;
    v52 = v17;
    v18 = 0.375;
    v19 = -1.0;
    v47 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v48 = v16;
    v20 = -0.25;
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v48 = 0u;
    v20 = 0.0;
    v19 = 0.0;
    v18 = 0.0;
    v47 = 0uLL;
  }
  v21 = p_isa[53];
  v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&buf.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&buf.m33 = v22;
  v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&buf.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&buf.m43 = v23;
  v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&buf.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&buf.m13 = v24;
  v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&buf.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&buf.m23 = v25;
  objc_msgSend(v21, "setSublayerTransform:", &buf);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(p_isa[53], "sublayers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v30, "zPosition");
        v32 = v31;
        objc_msgSend(v30, "frame");
        *(_OWORD *)&v42.m21 = v50;
        *(_OWORD *)&v42.m23 = v51;
        *(_OWORD *)&v42.m31 = v52;
        *(_OWORD *)&v42.m11 = v48;
        *(_OWORD *)&v42.m13 = v49;
        memset(&buf, 0, sizeof(buf));
        v42.m33 = v20;
        v42.m34 = v19;
        *(_OWORD *)&v42.m41 = v47;
        v42.m43 = v18;
        v42.m44 = 0.0;
        CATransform3DTranslate(&buf, &v42, 0.0, 0.0, v32);
        v42 = buf;
        CA_CGRectApplyTransform();
        objc_msgSend(v30, "setFrame:");
        LODWORD(v33) = 1.0;
        objc_msgSend(v30, "setOpacity:", v33);
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v27);
  }

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v39, v38);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __44__WKBokehView_thumbnailImageWithBokehInput___block_invoke_19;
  v40[3] = &unk_1E6EF9AB8;
  v35 = p_isa;
  v41 = v35;
  objc_msgSend(v34, "imageWithActions:", v40);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  __44__WKBokehView_thumbnailImageWithBokehInput___block_invoke();
  return v36;
}

void __44__WKBokehView_thumbnailImageWithBokehInput___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446210;
    v2 = "+[WKBokehView thumbnailImageWithBokehInput:]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

void __44__WKBokehView_thumbnailImageWithBokehInput___block_invoke_19(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

- (WKBokehWallpaperInput)bokehWallpaperInput
{
  return self->_bokehWallpaperInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bokehWallpaperInput, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_bubbles, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_motionFilter, 0);
}

@end
