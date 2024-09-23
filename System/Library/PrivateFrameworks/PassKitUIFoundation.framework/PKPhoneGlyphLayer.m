@implementation PKPhoneGlyphLayer

- (PKPhoneGlyphLayer)init
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKPhoneGlyphLayer *v8;

  if (PKUserIntentIsAvailable())
  {
    if (PKFrontFaceCameraIsWithinScreen())
      v3 = CFSTR("Payment_glyph_phone-D73");
    else
      v3 = CFSTR("Payment_glyph_phone-D22");
  }
  else
  {
    v3 = CFSTR("Payment_glyph_phone");
  }
  v4 = (void *)MEMORY[0x24BDE5718];
  PKPassKitUIFoundationBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v3, CFSTR("caar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "packageWithContentsOfURL:type:options:error:", v6, *MEMORY[0x24BDE5D48], 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKPhoneGlyphLayer initWithFrame:package:](self, "initWithFrame:package:", v7, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  return v8;
}

- (PKPhoneGlyphLayer)initWithFrame:(CGRect)a3 package:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PKPhoneGlyphLayer *v10;
  uint64_t v11;
  CALayer *highlightLayer;
  CALayer *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat MidX;
  CGFloat MidY;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKPhoneGlyphLayer;
  v10 = -[PKMicaLayer initWithFrame:package:](&v29, sel_initWithFrame_package_, v9, x, y, width, height);
  if (v10)
  {
    objc_msgSend(v9, "publishedObjectWithName:", CFSTR("(shape:secondary_highlight)"));
    v11 = objc_claimAutoreleasedReturnValue();
    highlightLayer = v10->_highlightLayer;
    v10->_highlightLayer = (CALayer *)v11;

    v13 = v10->_highlightLayer;
    PKLayerNullActions();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v13, "setActions:", v14);

    -[CALayer position](v10->_highlightLayer, "position");
    v10->_highlightOffscreenPosition.x = v15;
    v10->_highlightOffscreenPosition.y = v16;
    -[CALayer superlayer](v10->_highlightLayer, "superlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v30.origin.x = v19;
    v30.origin.y = v21;
    v30.size.width = v23;
    v30.size.height = v25;
    MidX = CGRectGetMidX(v30);
    v31.origin.x = v19;
    v31.origin.y = v21;
    v31.size.width = v23;
    v31.size.height = v25;
    MidY = CGRectGetMidY(v31);
    v10->_highlightOnscreenPosition.x = MidX;
    v10->_highlightOnscreenPosition.y = MidY;
  }

  return v10;
}

- (void)layoutSublayers
{
  CALayer *QRCodeLayer;
  CGImage *v4;
  CGImage *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CALayer *v16;
  CALayer *v17;
  CGRect v18;
  CGRect slice;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)PKPhoneGlyphLayer;
  -[PKMicaLayer layoutSublayers](&v20, sel_layoutSublayers);
  QRCodeLayer = self->_QRCodeLayer;
  if (QRCodeLayer)
  {
    v4 = -[CALayer contents](QRCodeLayer, "contents");
    if (v4)
    {
      v5 = v4;
      CGImageRetain(v4);
      CGImageGetWidth(v5);
      CGImageGetHeight(v5);
      CGImageRelease(v5);
      -[PKPhoneGlyphLayer contentsScale](self, "contentsScale");
      -[PKPhoneGlyphLayer bounds](self, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      slice.origin.x = v6;
      slice.origin.y = v8;
      slice.size.width = v10;
      slice.size.height = v12;
      PKFloatRoundToPixelWithScale();
      PKSizeAspectFit();
      PKSizeRoundToPixelWithScale();
      memset(&v18, 0, sizeof(v18));
      PKFloatRoundToPixelWithScale();
      v15 = v14;
      v21.origin.x = v7;
      v21.origin.y = v9;
      v21.size.width = v11;
      v21.size.height = v13;
      CGRectDivide(v21, &slice, &v18, v15, CGRectMinYEdge);
      PKSizeAlignedInRectWithScale();
      v16 = self->_QRCodeLayer;
    }
    else
    {
      v17 = self->_QRCodeLayer;
      -[PKPhoneGlyphLayer bounds](self, "bounds");
      v16 = v17;
    }
    -[CALayer setFrame:](v16, "setFrame:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size, *(_QWORD *)&slice.origin.x, *(_QWORD *)&slice.origin.y, *(_QWORD *)&slice.size.width, *(_QWORD *)&slice.size.height);
  }
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_primaryColor);
  v3.receiver = self;
  v3.super_class = (Class)PKPhoneGlyphLayer;
  -[PKMicaLayer dealloc](&v3, sel_dealloc);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhoneGlyphLayer;
  -[PKPhoneGlyphLayer layerDidBecomeVisible:](&v5, sel_layerDidBecomeVisible_, a3);
  -[PKPhoneGlyphLayer context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PKPhoneGlyphLayer _restartPhoneWiggleIfNecessary](self, "_restartPhoneWiggleIfNecessary");
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  int *v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  v4 = a4;
  v5 = a3;
  v7 = &OBJC_IVAR___PKPhoneGlyphLayer__highlightOffscreenPosition;
  if (a3)
    v7 = &OBJC_IVAR___PKPhoneGlyphLayer__highlightOnscreenPosition;
  v8 = (double *)((char *)self + *v7);
  v9 = *v8;
  v10 = v8[1];
  -[CALayer position](self->_highlightLayer, "position");
  if (v9 != v11 || v10 != v12)
  {
    if (v4)
    {
      v14 = v11;
      v15 = v12;
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 1058642330;
      if (!v5)
        *(float *)&v20 = 0.75;
      LODWORD(v18) = *(_DWORD *)"ff&?";
      LODWORD(v17) = 0;
      LODWORD(v19) = 1.0;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v20, v17, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTimingFunction:", v21);

      objc_msgSend(v16, "setAdditive:", 1);
      objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v14, v15, v9, v10);
      objc_msgSend(v16, "setDuration:", 1.3);
      v22 = (id)-[CALayer pkui_addAdditiveAnimation:](self->_highlightLayer, "pkui_addAdditiveAnimation:", v16);

    }
    -[CALayer setPosition:](self->_highlightLayer, "setPosition:", v9, v10);
  }
}

- (void)setPrimaryColor:(CGColor *)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CGColor *primaryColor;
  _BOOL4 v8;

  v4 = a4;
  primaryColor = self->_primaryColor;
  if (a3 && primaryColor && (v8 = CGColorEqualToColor(primaryColor, a3), primaryColor = self->_primaryColor, !v8)
    || primaryColor != a3)
  {
    CGColorRelease(primaryColor);
    self->_primaryColor = CGColorRetain(a3);
    -[PKPhoneGlyphLayer _applyEffectivePrimaryColorToQRCodeAnimated:](self, "_applyEffectivePrimaryColorToQRCodeAnimated:", v4);
  }
}

- (void)setShowQRCode:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  CALayer *v7;
  CALayer *QRCodeLayer;
  double v9;
  CALayer *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  CALayer *v18;
  id v19;
  unint64_t v20;
  _QWORD v21[4];
  id v22;

  if (((!self->_showQRCode ^ a3) & 1) == 0)
  {
    self->_showQRCode = a3;
    v4 = 0.0;
    if (a3)
    {
      v4 = 1.0;
      if (!self->_QRCodeLayer)
      {
        -[PKPhoneGlyphLayer contentsScale](self, "contentsScale", 1.0);
        v6 = v5;
        v7 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
        QRCodeLayer = self->_QRCodeLayer;
        self->_QRCodeLayer = v7;

        LODWORD(v9) = 0;
        -[CALayer setOpacity:](self->_QRCodeLayer, "setOpacity:", v9);
        v10 = self->_QRCodeLayer;
        PKLayerNullActions();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CALayer setActions:](v10, "setActions:", v11);

        -[CALayer setContentsScale:](self->_QRCodeLayer, "setContentsScale:", v6);
        objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("qrcode"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "size");
        PKSizeScaleAspectFit();
        PKSizeRoundToPixelWithScale();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", v13, v14);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __35__PKPhoneGlyphLayer_setShowQRCode___block_invoke;
        v21[3] = &unk_24D0A1788;
        v22 = v12;
        v16 = v12;
        objc_msgSend(v15, "imageWithActions:", v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = self->_QRCodeLayer;
        v19 = objc_retainAutorelease(v17);
        -[CALayer setContents:](v18, "setContents:", objc_msgSend(v19, "CGImage"));
        -[PKPhoneGlyphLayer insertSublayer:below:](self, "insertSublayer:below:", self->_QRCodeLayer, self->_highlightLayer);
        -[PKPhoneGlyphLayer _applyEffectivePrimaryColorToQRCodeAnimated:](self, "_applyEffectivePrimaryColorToQRCodeAnimated:", 0);
        -[PKPhoneGlyphLayer setNeedsLayout](self, "setNeedsLayout");

        LOBYTE(v20) = self->_showQRCode;
        v4 = (double)v20;
      }
    }
    -[CALayer pkui_animateToOpacity:withCompletion:](self->_QRCodeLayer, "pkui_animateToOpacity:withCompletion:", 0, v4);
  }
}

void __35__PKPhoneGlyphLayer_setShowQRCode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFill");

  objc_msgSend(v13, "fillRect:blendMode:", 20, v5, v7, v9, v11);
}

- (void)_applyEffectivePrimaryColorToQRCodeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  CAFilter *v6;
  CAFilter *QRCodeColorFilter;
  CALayer *QRCodeLayer;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (self->_QRCodeLayer)
  {
    v3 = a3;
    if (!self->_QRCodeColorFilter)
    {
      v5 = objc_alloc(MEMORY[0x24BDE56B0]);
      v6 = (CAFilter *)objc_msgSend(v5, "initWithType:", *MEMORY[0x24BDE5BA8]);
      QRCodeColorFilter = self->_QRCodeColorFilter;
      self->_QRCodeColorFilter = v6;

      -[CAFilter setName:](self->_QRCodeColorFilter, "setName:", CFSTR("QRCodeColorFilter"));
      -[CAFilter setValue:forKey:](self->_QRCodeColorFilter, "setValue:forKey:", self->_primaryColor, CFSTR("inputColor"));
      QRCodeLayer = self->_QRCodeLayer;
      v15[0] = self->_QRCodeColorFilter;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setFilters:](QRCodeLayer, "setFilters:", v9);

    }
    v10 = (void *)MEMORY[0x24BDF6950];
    -[CALayer presentationLayer](self->_QRCodeLayer, "presentationLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "valueForKeyPath:", CFSTR("filters.QRCodeColorFilter.inputColor"));
    if (!v12)
      v12 = -[CALayer valueForKeyPath:](self->_QRCodeLayer, "valueForKeyPath:", CFSTR("filters.QRCodeColorFilter.inputColor"));
    objc_msgSend(v10, "colorWithCGColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CALayer setValue:forKeyPath:](self->_QRCodeLayer, "setValue:forKeyPath:", self->_primaryColor, CFSTR("filters.QRCodeColorFilter.inputColor"));
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("filters.QRCodeColorFilter.inputColor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDuration:", 0.15);
      objc_msgSend(v14, "setFillMode:", *MEMORY[0x24BDE5978]);
      objc_msgSend(v14, "setFromValue:", objc_msgSend(objc_retainAutorelease(v13), "CGColor"));
      objc_msgSend(v14, "setToValue:", self->_primaryColor);
      -[CALayer removeAnimationForKey:](self->_QRCodeLayer, "removeAnimationForKey:", CFSTR("QRCodeColorAnimationKey"));
      -[CALayer addAnimation:forKey:](self->_QRCodeLayer, "addAnimation:forKey:", v14, CFSTR("QRCodeColorAnimationKey"));

    }
  }
}

- (void)_restartPhoneWiggleIfNecessary
{
  void *v3;
  NSString *phoneWiggleAnimationKey;

  if (self->_phoneWiggleAnimationKey)
  {
    -[CALayer animationForKey:](self->_highlightLayer, "animationForKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      phoneWiggleAnimationKey = self->_phoneWiggleAnimationKey;
      self->_phoneWiggleAnimationKey = 0;

      -[PKPhoneGlyphLayer _startPhoneWiggle](self, "_startPhoneWiggle");
    }
  }
}

- (void)_startPhoneWiggle
{
  float64x2_t v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  NSString *v8;
  NSString *phoneWiggleAnimationKey;
  id v10[2];

  if (!self->_phoneWiggleAnimationKey
    || (-[PKPhoneGlyphLayer _endPhoneWiggle](self, "_endPhoneWiggle"), !self->_phoneWiggleAnimationKey))
  {
    v3.f64[0] = self->_highlightOnscreenPosition.x;
    v3.f64[1] = self->_highlightOffscreenPosition.y;
    *(float64x2_t *)v10 = vsubq_f64(vmlaq_f64(vmulq_f64((float64x2_t)self->_highlightOffscreenPosition, (float64x2_t)vdupq_n_s64(0x3FE4CCCCCCCCCCCDuLL)), (float64x2_t)vdupq_n_s64(0x3FD6666666666666uLL), v3), (float64x2_t)self->_highlightOnscreenPosition);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v10[0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", *(_OWORD *)v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __38__PKPhoneGlyphLayer__startPhoneWiggle__block_invoke((uint64_t)v5, (uint64_t)CFSTR("position"), v4, v5);
    v10[0] = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10[0], "setDuration:", 2.6);
    LODWORD(v6) = 2139095040;
    objc_msgSend(v10[0], "setRepeatCount:", v6);
    -[CALayer pkui_addAdditiveAnimation:](self->_highlightLayer, "pkui_addAdditiveAnimation:", v10[0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    phoneWiggleAnimationKey = self->_phoneWiggleAnimationKey;
    self->_phoneWiggleAnimationKey = v8;

  }
}

id __38__PKPhoneGlyphLayer__startPhoneWiggle__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDE56C0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "animationWithKeyPath:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdditive:", 1);
  objc_msgSend(v9, "setKeyTimes:", &unk_24D0AA130);
  v24[0] = v8;
  v24[1] = v7;
  v24[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValues:", v10);

  LODWORD(v11) = 0.75;
  LODWORD(v12) = 0;
  LODWORD(v13) = 1.0;
  LODWORD(v14) = *(_DWORD *)"ff&?";
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v11, v12, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1058642330;
  LODWORD(v17) = 0;
  LODWORD(v18) = 1.0;
  LODWORD(v19) = *(_DWORD *)"ff&?";
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v16, v17, v19, v18, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTimingFunctions:", v21);
  objc_msgSend(v9, "setDuration:", 2.6);
  return v9;
}

- (void)_endPhoneWiggle
{
  NSString *phoneWiggleAnimationKey;
  NSString *v4;
  void *v5;
  NSString *v6;
  double v7;
  long double v8;
  long double v9;
  int64_t v10;
  dispatch_time_t v11;
  _QWORD block[4];
  NSString *v13;
  id v14;
  id location;

  phoneWiggleAnimationKey = self->_phoneWiggleAnimationKey;
  if (phoneWiggleAnimationKey)
  {
    v4 = phoneWiggleAnimationKey;
    -[CALayer animationForKey:](self->_highlightLayer, "animationForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_phoneWiggleAnimationKey;
    self->_phoneWiggleAnimationKey = 0;

    -[CALayer pkui_elapsedDurationForAnimationWithKey:](self->_highlightLayer, "pkui_elapsedDurationForAnimationWithKey:", v4);
    if (v7 <= 0.0)
    {
      -[CALayer removeAnimationForKey:](self->_highlightLayer, "removeAnimationForKey:", v4);
    }
    else
    {
      v8 = v7;
      objc_msgSend(v5, "duration");
      v10 = (uint64_t)((v9 - fmod(v8, v9)) * 1000000000.0);
      objc_initWeak(&location, self);
      v11 = dispatch_time(0, v10);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__PKPhoneGlyphLayer__endPhoneWiggle__block_invoke;
      block[3] = &unk_24D0A0F90;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      v4 = v4;
      dispatch_after(v11, MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

  }
}

void __36__PKPhoneGlyphLayer__endPhoneWiggle__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[9], "removeAnimationForKey:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (BOOL)showQRCode
{
  return self->_showQRCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneWiggleAnimationKey, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_QRCodeColorFilter, 0);
  objc_storeStrong((id *)&self->_QRCodeLayer, 0);
}

@end
