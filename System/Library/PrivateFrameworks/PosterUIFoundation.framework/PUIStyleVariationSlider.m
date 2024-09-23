@implementation PUIStyleVariationSlider

+ (double)defaultHeight
{
  return 34.0;
}

+ (double)defaultTrackMultiplier
{
  return 0.444444444;
}

+ (double)defaultTrackInnerShadowBorderWidth
{
  return 2.0;
}

+ (double)defaultTrackHeight
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "defaultHeight");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "defaultTrackMultiplier");
  return v3 * v4;
}

+ (CGColor)defaultTrackBorderColor
{
  id v2;
  CGColor *v3;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (CGColor *)objc_msgSend(v2, "CGColor");

  return v3;
}

- (PUIStyleVariationSlider)initWithStyleCoordinator:(id)a3 contextIdentifier:(id)a4
{
  id v6;
  id v7;
  PUIStyleVariationSlider *v8;
  PUIStyleVariationSlider *v9;
  uint64_t v10;
  UIPanGestureRecognizer *panGesture;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUIStyleVariationSlider;
  v8 = -[PUIStyleVariationSlider initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contextIdentifier, a4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", v9, sel_thumbViewDidPan_);
    panGesture = v9->_panGesture;
    v9->_panGesture = (UIPanGestureRecognizer *)v10;

    -[UIPanGestureRecognizer setCancelsTouchesInView:](v9->_panGesture, "setCancelsTouchesInView:", 0);
    -[PUIStyleVariationSlider addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_panGesture);
    -[PUIStyleVariationSlider setClipsToBounds:](v9, "setClipsToBounds:", 0);
    -[PUIStyleVariationSlider setStyleCoordinator:](v9, "setStyleCoordinator:", v6);
  }

  return v9;
}

- (UIGestureRecognizer)sliderGestureRecognizer
{
  return (UIGestureRecognizer *)self->_panGesture;
}

- (void)setPressed:(BOOL)a3
{
  -[PUIStyleVariationSlider setPressed:animated:](self, "setPressed:animated:", a3, 0);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  double v6;
  void *v7;
  _QWORD v8[6];

  if (self->_isPressed != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_isPressed = a3;
    v6 = 0.9;
    if (!a3)
      v6 = 1.0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__PUIStyleVariationSlider_setPressed_animated___block_invoke;
    v8[3] = &unk_25154C910;
    v8[4] = self;
    *(double *)&v8[5] = v6;
    v7 = (void *)MEMORY[0x2495151FC](v8, a2);
    if (v4)
      objc_msgSend(MEMORY[0x24BDF6F90], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", v5, v7, 0, 1.0, 0.1, 0.0, 0.0, 0.0, 0.0);
    else
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v7);

  }
}

void __47__PUIStyleVariationSlider_setPressed_animated___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 744), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  objc_msgSend(v2, "setAffineTransform:", &v3);

}

- (void)layoutSubviews
{
  _OWORD v3[11];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUIStyleVariationSlider;
  -[PUIStyleVariationSlider layoutSubviews](&v15, sel_layoutSubviews);
  -[PUIStyleVariationSlider _setupViewsIfNeeded](self, "_setupViewsIfNeeded");
  -[PUIStyleVariationSlider bounds](self, "bounds");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  -[PUIStyleVariationSlider _metricsForBounds:](self, "_metricsForBounds:");
  v3[8] = v12;
  v3[9] = v13;
  v3[10] = v14;
  v3[4] = v8;
  v3[5] = v9;
  v3[6] = v10;
  v3[7] = v11;
  v3[0] = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  -[PUIStyleVariationSlider _applyMetrics:](self, "_applyMetrics:", v3);
}

- (void)setStyleCoordinator:(id)a3
{
  -[PUIStyleVariationSlider setStyleCoordinator:animated:](self, "setStyleCoordinator:animated:", a3, 0);
}

- (void)setStyleCoordinator:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  PUIStyleVariationSlider *v17;
  id v18;

  v4 = a4;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "allowsVariation") & 1) != 0)
    {
      v10 = -[PUIStyleUICoordinator isEqual:](self->_styleCoordinator, "isEqual:", v8);

      if ((v10 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_styleCoordinator, a3);
        -[PUIStyleVariationSlider _updateTrackAnimated:](self, "_updateTrackAnimated:", v4);
        -[PUIStyleVariationSlider _updateThumbContentViewAnimated:](self, "_updateThumbContentViewAnimated:", v4);
        v13 = MEMORY[0x24BDAC760];
        v14 = 3221225472;
        v15 = __56__PUIStyleVariationSlider_setStyleCoordinator_animated___block_invoke;
        v16 = &unk_25154BFC0;
        v17 = self;
        v18 = v8;
        v11 = MEMORY[0x2495151FC](&v13);
        v12 = (void *)v11;
        if (v4)
          objc_msgSend(MEMORY[0x24BDF6F90], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v11, 0, 0.9, 0.4, 0.0, 0.0, 0.0, 0.0, v13, v14, v15, v16, v17);
        else
          (*(void (**)(uint64_t))(v11 + 16))(v11);

      }
    }
    else
    {

    }
  }

}

void __56__PUIStyleVariationSlider_setStyleCoordinator_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "variation");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSliderValue:layout:fireActions:", v5 != 0, 0, v4);

}

- (void)_layoutDirectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  CATransform3D v15;
  CATransform3D v16;

  v6 = a4;
  objc_msgSend(a3, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutDirection");

  v9 = objc_msgSend(v6, "layoutDirection");
  if (v8 != v9)
  {
    v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    *(_OWORD *)&v16.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    *(_OWORD *)&v16.m33 = v10;
    v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    *(_OWORD *)&v16.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    *(_OWORD *)&v16.m43 = v11;
    v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v16.m11 = *MEMORY[0x24BDE5598];
    *(_OWORD *)&v16.m13 = v12;
    v13 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v16.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    *(_OWORD *)&v16.m23 = v13;
    if (v8 == 1)
      CATransform3DMakeRotation(&v16, 3.14159265, 0.0, 1.0, 0.0);
    -[UIView layer](self->_trackView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    objc_msgSend(v14, "setTransform:", &v15);

  }
}

- (void)thumbViewDidPan:(id)a3
{
  id v4;
  double v5;
  PUIStyleVariationSlider *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MidX;
  double v15;
  double v16;
  double v17;
  _QWORD v18[6];
  CGRect v19;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[UIView center](self->_thumbContainerView, "center");
    self->_startPanOffset = v5;
    -[PUIStyleVariationSlider bringSubviewToFront:](self, "bringSubviewToFront:", self->_thumbContainerView);
    v6 = self;
    v7 = 0x10000;
LABEL_12:
    -[PUIStyleVariationSlider sendActionsForControlEvents:](v6, "sendActionsForControlEvents:", v7);
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "state") == 2 || objc_msgSend(v4, "state") == 3)
  {
    -[PUIStyleVariationSlider bounds](self, "bounds");
    v9 = v8;
    -[UIView bounds](self->_thumbContainerView, "bounds");
    v11 = v10;
    objc_msgSend(v4, "translationInView:", self);
    v13 = v12 + self->_startPanOffset;
    -[UIView bounds](self->_thumbContainerView, "bounds");
    MidX = CGRectGetMidX(v19);
    v15 = v13 >= MidX ? v13 : MidX;
    v16 = v9 - MidX;
    if (v15 < v16)
      v16 = v15;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__PUIStyleVariationSlider_thumbViewDidPan___block_invoke;
    v18[3] = &unk_25154C910;
    v18[4] = self;
    *(double *)&v18[5] = v16;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v18, 0.0);
    -[UIView frame](self->_thumbContainerView, "frame");
    -[PUIStyleVariationSlider _setSliderValue:layout:fireActions:](self, "_setSliderValue:layout:fireActions:", 0, 1, v17 / (v9 - v11) - (1.0 - v17 / (v9 - v11)));
    if (objc_msgSend(v4, "state") == 3)
    {
      v6 = self;
      v7 = 0x40000;
      goto LABEL_12;
    }
  }
LABEL_13:

}

uint64_t __43__PUIStyleVariationSlider_thumbViewDidPan___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[6];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__PUIStyleVariationSlider_thumbViewDidPan___block_invoke_2;
  v4[3] = &unk_25154C910;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2490371, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __43__PUIStyleVariationSlider_thumbViewDidPan___block_invoke_2(uint64_t a1)
{
  void *v1;
  double v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 736);
  v2 = *(double *)(a1 + 40);
  objc_msgSend(v1, "center");
  return objc_msgSend(v1, "setCenter:", v2);
}

- (double)variation
{
  return self->_value;
}

- (void)_setSliderValue:(double)a3 layout:(BOOL)a4 fireActions:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;

  v5 = a5;
  v6 = a4;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_value = a3;
    -[PUIStyleUICoordinator variation](self->_styleCoordinator, "variation");
    if ((BSFloatEqualToFloat() & 1) != 0)
    {
      if (!v5)
        goto LABEL_4;
    }
    else
    {
      -[PUIStyleUICoordinator setVariation:](self->_styleCoordinator, "setVariation:", a3);
      if (!v5)
      {
LABEL_4:
        if (!v6)
          return;
        goto LABEL_5;
      }
    }
    -[PUIStyleVariationSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    if (v6)
    {
LABEL_5:
      -[PUIStyleVariationSlider setNeedsLayout](self, "setNeedsLayout");
      -[PUIStyleVariationSlider layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)_setupViewsIfNeeded
{
  UIView *v3;
  UIView *thumbContainerView;
  UIView *v5;
  void *v6;
  void *v7;
  double v8;
  CALayer *v9;
  CALayer *thumbSoftShadowLayer;
  double v11;
  void *v12;
  CAShapeLayer *v13;
  CAShapeLayer *thumbBorderLayer;
  CAShapeLayer *v15;
  id v16;
  CAShapeLayer *v17;
  id v18;
  void *v19;
  CAShapeLayer *v20;
  CAShapeLayer *thumbClippingLayer;
  void *v22;
  UITraitChangeRegistration *v23;
  UITraitChangeRegistration *traitChangeRegistration;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_thumbContainerView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    thumbContainerView = self->_thumbContainerView;
    self->_thumbContainerView = v3;

    -[PUIStyleVariationSlider addSubview:](self, "addSubview:", self->_thumbContainerView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_thumbContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_thumbContainerView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView setContentMode:](self->_thumbContainerView, "setContentMode:", 2);
    -[UIView setClipsToBounds:](self->_thumbContainerView, "setClipsToBounds:", 0);
    -[UIView setUserInteractionEnabled:](self->_thumbContainerView, "setUserInteractionEnabled:", 0);
    -[UIView layer](self->_thumbContainerView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1042536202;
    objc_msgSend(v7, "setShadowOpacity:", v8);
    objc_msgSend(v7, "setShadowOffset:", 1.0, 5.5);
    objc_msgSend(v7, "setShadowRadius:", 3.5);

  }
  if (!self->_thumbSoftShadowLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v9 = (CALayer *)objc_claimAutoreleasedReturnValue();
    thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
    self->_thumbSoftShadowLayer = v9;

    LODWORD(v11) = 1042536202;
    -[CALayer setShadowOpacity:](self->_thumbSoftShadowLayer, "setShadowOpacity:", v11);
    -[CALayer setShadowOffset:](self->_thumbSoftShadowLayer, "setShadowOffset:", 0.0, 0.0);
    -[CALayer setShadowRadius:](self->_thumbSoftShadowLayer, "setShadowRadius:", 6.5);
    -[UIView layer](self->_thumbContainerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", self->_thumbSoftShadowLayer);

  }
  if (!self->_thumbBorderLayer)
  {
    v13 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    thumbBorderLayer = self->_thumbBorderLayer;
    self->_thumbBorderLayer = v13;

    v15 = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

    v17 = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v17, "setStrokeColor:", objc_msgSend(v18, "CGColor"));

    -[UIView layer](self->_thumbContainerView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", self->_thumbBorderLayer);

  }
  if (!self->_thumbClippingLayer)
  {
    v20 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    thumbClippingLayer = self->_thumbClippingLayer;
    self->_thumbClippingLayer = v20;

    -[CAShapeLayer setFillRule:](self->_thumbClippingLayer, "setFillRule:", *MEMORY[0x24BDE5988]);
  }
  if (!self->_traitChangeRegistration)
  {
    v25[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleVariationSlider registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v22, sel__layoutDirectionDidChange_previousTraitCollection_);
    v23 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = self->_traitChangeRegistration;
    self->_traitChangeRegistration = v23;

  }
}

- (void)_updateTrackAnimated:(BOOL)a3
{
  _BOOL4 v3;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  UIView *v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[4];
  UIView *v18;
  _QWORD v19[4];
  UIView *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v3 = a3;
  -[PUIStyleUICoordinator variationSliderTrackView](self->_styleCoordinator, "variationSliderTrackView");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  if (v5 != self->_trackView)
  {
    -[PUIStyleVariationSlider _setupViewsIfNeeded](self, "_setupViewsIfNeeded");
    v6 = self->_trackView;
    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultTrackInnerShadowBorderWidth");
    objc_msgSend(v7, "setBorderWidth:");

    -[UIView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", objc_msgSend((id)objc_opt_class(), "defaultTrackBorderColor"));

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v3)
      -[UIView setAlpha:](v5, "setAlpha:", 0.0);
    if (v6)
      -[PUIStyleVariationSlider insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, v6);
    else
      -[PUIStyleVariationSlider insertSubview:atIndex:](self, "insertSubview:atIndex:", v5, 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    -[PUIStyleVariationSlider bounds](self, "bounds");
    -[PUIStyleVariationSlider _metricsForBounds:](self, "_metricsForBounds:");
    -[UIView setFrame:](v5, "setFrame:", v25, v26);
    -[UIView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:", *(double *)&v31);
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke;
    v19[3] = &unk_25154BB88;
    v20 = v5;
    v10 = (void (**)(_QWORD))MEMORY[0x2495151FC](v19);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke_2;
    v17[3] = &unk_25154BB88;
    v11 = v6;
    v18 = v11;
    v12 = (void (**)(_QWORD))MEMORY[0x2495151FC](v17);
    v13 = v12;
    if (v3)
    {
      v14 = (void *)MEMORY[0x24BDF6F90];
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke_3;
      v15[3] = &unk_25154C938;
      v16 = v12;
      objc_msgSend(v14, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v10, v15, 0.9, 0.4, 0.0, 0.0, 0.0, 0.0);

    }
    else
    {
      v10[2](v10);
      v13[2](v13);
    }
    objc_storeStrong((id *)&self->_trackView, v5);
    -[PUIStyleVariationSlider setNeedsLayout](self, "setNeedsLayout");

  }
}

uint64_t __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateThumbContentViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  UIView *v5;
  UIView *thumbContentView;
  UIView *v7;
  UIView *thumbContainerView;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  UIView *v14;
  void (**v15)(_QWORD);
  UIView *v16;
  void (**v17)(_QWORD);
  void (**v18)(_QWORD);
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[4];
  UIView *v23;
  _QWORD v24[4];
  UIView *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v3 = a3;
  -[PUIStyleUICoordinator variationSliderThumbView](self->_styleCoordinator, "variationSliderThumbView");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  thumbContentView = self->_thumbContentView;
  if (v5 != thumbContentView)
  {
    v7 = thumbContentView;
    -[PUIStyleVariationSlider _setupViewsIfNeeded](self, "_setupViewsIfNeeded");
    objc_storeStrong((id *)&self->_thumbContentView, v5);
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[UIView setContentMode:](v5, "setContentMode:", 2);
    -[UIView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    thumbContainerView = self->_thumbContainerView;
    if (v7)
      -[UIView insertSubview:belowSubview:](thumbContainerView, "insertSubview:belowSubview:", v5, v7);
    else
      -[UIView addSubview:](thumbContainerView, "addSubview:", v5);
    -[UIView layer](v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMask:", self->_thumbClippingLayer);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    -[PUIStyleVariationSlider bounds](self, "bounds");
    -[PUIStyleVariationSlider _metricsForBounds:](self, "_metricsForBounds:");
    -[UIView setFrame:](v5, "setFrame:", (unsigned __int128)0, 0.0, 0.0);
    if (v7 && v3)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDE5758]);
      objc_msgSend(v10, "setFillRule:", *MEMORY[0x24BDE5988]);
      objc_msgSend(v10, "setFrame:", v26, v27);
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", v32, v33);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
      -[UIView layer](v7, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMask:", v10);

    }
    v13 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke;
    v24[3] = &unk_25154BB88;
    v14 = v7;
    v25 = v14;
    v15 = (void (**)(_QWORD))MEMORY[0x2495151FC](v24);
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke_2;
    v22[3] = &unk_25154BB88;
    v16 = v14;
    v23 = v16;
    v17 = (void (**)(_QWORD))MEMORY[0x2495151FC](v22);
    v18 = v17;
    if (v3)
    {
      v19 = (void *)MEMORY[0x24BDF6F90];
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke_3;
      v20[3] = &unk_25154C938;
      v21 = v17;
      objc_msgSend(v19, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v15, v20, 0.9, 0.4, 0.0, 0.0, 0.0, 0.0);

    }
    else
    {
      v15[2](v15);
      v18[2](v18);
    }
    -[PUIStyleVariationSlider setNeedsLayout](self, "setNeedsLayout");

  }
}

uint64_t __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIStyleVariationSlider;
  -[PUIStyleVariationSlider touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[PUIStyleVariationSlider setPressed:animated:](self, "setPressed:animated:", 1, 1);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIStyleVariationSlider;
  -[PUIStyleVariationSlider touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[PUIStyleVariationSlider setPressed:animated:](self, "setPressed:animated:", 0, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIStyleVariationSlider;
  -[PUIStyleVariationSlider touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[PUIStyleVariationSlider setPressed:animated:](self, "setPressed:animated:", 0, 1);
}

- ($B5991C4CE9FA8B35561AD36CC4E88915)_metricsForBounds:(SEL)a3
{
  double height;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat width;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat v21;
  CGFloat v22;
  $B5991C4CE9FA8B35561AD36CC4E88915 *result;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a4.size.height;
  -[PUIStyleVariationSlider traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  objc_msgSend((id)objc_opt_class(), "defaultTrackMultiplier");
  v29 = height * v9 * 0.5;
  UIRectCenteredYInRectScale();
  v27 = v11;
  v28 = v10;
  v26 = v12;
  v14 = v13;
  UIRectCenteredYInRectScale();
  v24 = v16;
  v25 = v15;
  width = v30.size.width;
  v18 = v30.size.height;
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v31 = CGRectInset(v30, 3.0, 3.0);
  x = v31.origin.x;
  y = v31.origin.y;
  v21 = v31.size.width;
  v22 = v31.size.height;
  v32 = CGRectInset(v31, v8 * -4.0, v8 * -4.0);
  retstr->var0.origin.x = 0.0;
  retstr->var0.origin.y = 0.0;
  retstr->var0.size.width = width;
  retstr->var0.size.height = v18;
  retstr->var1.origin.x = v25;
  retstr->var1.origin.y = v24;
  retstr->var1.size.width = width;
  retstr->var1.size.height = v18;
  retstr->var2.origin.x = v28;
  retstr->var2.origin.y = v27;
  retstr->var2.size.width = v26;
  retstr->var2.size.height = v14;
  retstr->var3.origin.x = x;
  retstr->var3.origin.y = y;
  retstr->var3.size.width = v21;
  retstr->var3.size.height = v22;
  retstr->var4 = v32;
  retstr->var5 = v29;
  retstr->var6 = 6.0;
  return result;
}

- (void)_applyMetrics:(id *)a3
{
  void *v5;
  CAShapeLayer *thumbBorderLayer;
  id v7;
  CAShapeLayer *thumbClippingLayer;
  id v9;
  void *v10;
  id v11;
  CALayer *thumbSoftShadowLayer;
  id v13;

  -[CAShapeLayer setLineWidth:](self->_thumbBorderLayer, "setLineWidth:", a3->var6);
  -[UIView setFrame:](self->_trackView, "setFrame:", a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, a3->var2.size.height);
  -[UIView _setContinuousCornerRadius:](self->_trackView, "_setContinuousCornerRadius:", a3->var5);
  -[UIView setFrame:](self->_thumbContainerView, "setFrame:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height);
  -[CAShapeLayer setFrame:](self->_thumbBorderLayer, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  -[CAShapeLayer setFrame:](self->_thumbClippingLayer, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  -[CALayer setFrame:](self->_thumbSoftShadowLayer, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  -[UIView setFrame:](self->_thumbContentView, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", a3->var3.origin.x, a3->var3.origin.y, a3->var3.size.width, a3->var3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  thumbBorderLayer = self->_thumbBorderLayer;
  v7 = objc_retainAutorelease(v5);
  -[CAShapeLayer setPath:](thumbBorderLayer, "setPath:", objc_msgSend(v7, "CGPath"));
  thumbClippingLayer = self->_thumbClippingLayer;
  v9 = objc_retainAutorelease(v7);
  -[CAShapeLayer setPath:](thumbClippingLayer, "setPath:", objc_msgSend(v9, "CGPath"));
  -[UIView layer](self->_thumbContainerView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setShadowPath:", objc_msgSend(v11, "CGPath"));

  thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
  v13 = objc_retainAutorelease(v11);
  -[CALayer setShadowPath:](thumbSoftShadowLayer, "setShadowPath:", objc_msgSend(v13, "CGPath"));

}

- (void)setVariation:(double)a3
{
  self->_variation = a3;
}

- (PUIStyleUICoordinator)styleCoordinator
{
  return self->_styleCoordinator;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (double)startPanOffset
{
  return self->_startPanOffset;
}

- (void)setStartPanOffset:(double)a3
{
  self->_startPanOffset = a3;
}

- (UIView)trackView
{
  return self->_trackView;
}

- (void)setTrackView:(id)a3
{
  objc_storeStrong((id *)&self->_trackView, a3);
}

- (CAShapeLayer)thumbClippingLayer
{
  return self->_thumbClippingLayer;
}

- (void)setThumbClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbClippingLayer, a3);
}

- (CALayer)thumbSoftShadowLayer
{
  return self->_thumbSoftShadowLayer;
}

- (void)setThumbSoftShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, a3);
}

- (CAShapeLayer)thumbBorderLayer
{
  return self->_thumbBorderLayer;
}

- (void)setThumbBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbBorderLayer, a3);
}

- (UIView)thumbContainerView
{
  return self->_thumbContainerView;
}

- (void)setThumbContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbContainerView, a3);
}

- (UIView)thumbContentView
{
  return self->_thumbContentView;
}

- (void)setThumbContentView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbContentView, a3);
}

- (BOOL)isPressed
{
  return self->_isPressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbContentView, 0);
  objc_storeStrong((id *)&self->_thumbContainerView, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_styleCoordinator, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
}

@end
