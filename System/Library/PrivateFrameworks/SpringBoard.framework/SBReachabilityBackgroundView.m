@implementation SBReachabilityBackgroundView

- (SBReachabilityBackgroundView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4
{
  SBReachabilityBackgroundView *v5;
  SBReachabilityBackgroundView *v6;
  void *v7;
  _QWORD v9[4];
  SBReachabilityBackgroundView *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBReachabilityBackgroundView;
  v5 = -[SBReachabilityBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_wallpaperVariant = a4;
    -[SBReachabilityBackgroundView _updateWallpaperViewAnimated:](v5, "_updateWallpaperViewAnimated:", 0);
    -[SBReachabilityBackgroundView _setupChevron](v6, "_setupChevron");
    -[SBReachabilityBackgroundView _setupHomeGrabberView](v6, "_setupHomeGrabberView");
    -[SBReachabilityBackgroundView _setupHitTestBlockerView](v6, "_setupHitTestBlockerView");
    -[SBReachabilityBackgroundView _setupColorInvertObservation](v6, "_setupColorInvertObservation");
    -[SBReachabilityBackgroundView setHomeGrabberAlpha:](v6, "setHomeGrabberAlpha:", 0.0);
    -[SBReachabilityBackgroundView setChevronAlpha:](v6, "setChevronAlpha:", 0.0);
    -[SBReachabilityBackgroundView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("reachability-window"));
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__SBReachabilityBackgroundView_initWithFrame_wallpaperVariant___block_invoke;
    v9[3] = &unk_1E8E9DED8;
    v10 = v6;
    objc_msgSend(v7, "_performWithoutRetargetingAnimations:", v9);

  }
  return v6;
}

uint64_t __63__SBReachabilityBackgroundView_initWithFrame_wallpaperVariant___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
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
  UIView *topWallpaperView;
  double v12;
  CGFloat v13;
  UIView *bottomWallpaperView;
  double v15;
  CGFloat v16;
  SBHomeGrabberView *homeGrabberView;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v24.receiver = self;
  v24.super_class = (Class)SBReachabilityBackgroundView;
  -[SBReachabilityBackgroundView layoutSubviews](&v24, sel_layoutSubviews);
  -[SBReachabilityBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_wallpaperContainerView, "setFrame:");
  -[_SBAdaptiveColorMatrixView setFrame:](self->_colorMatrixView, "setFrame:", v4, v6, v8, v10);
  topWallpaperView = self->_topWallpaperView;
  -[SBReachabilityBackgroundView _displayCornerRadius](self, "_displayCornerRadius");
  v13 = -(v10 - v12 * 2.0);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v26 = CGRectOffset(v25, 0.0, v13);
  -[UIView setFrame:](topWallpaperView, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  bottomWallpaperView = self->_bottomWallpaperView;
  -[SBReachabilityBackgroundView _displayCornerRadius](self, "_displayCornerRadius");
  v16 = v10 - v15 * 2.0;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v28 = CGRectOffset(v27, 0.0, v16);
  -[UIView setFrame:](bottomWallpaperView, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  homeGrabberView = self->_homeGrabberView;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  v30 = CGRectOffset(v29, 0.0, -self->_containerViewYOffset);
  -[SBHomeGrabberView setFrame:](homeGrabberView, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  -[UIView setFrame:](self->_hitTestBlockerView, "setFrame:", 0.0, -self->_containerViewYOffset, v8);
  -[CAShapeLayer setPosition:](self->_chevronLayer, "setPosition:", v8 * 0.5, -27.0);
  +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "yOffset");
  v20 = v19;
  v22 = *MEMORY[0x1E0D013B0];
  v23 = *(_OWORD *)(MEMORY[0x1E0D013B0] + 16);
  BSUIConstrainValueToIntervalWithRubberBand();
  -[UIViewFloatAnimatableProperty setValue:](self->_chevronShapeAnimatableProperty, "setValue:", v22, v23);
  v21 = SBFEffectiveArtworkSubtype();
  if (v21 <= 2795)
  {
    if (v21 != 2556 && v21 != 2622)
      goto LABEL_8;
LABEL_7:
    -[UIViewFloatAnimatableProperty setValue:](self->_colorMatrixOpacityAnimatableProperty, "setValue:", fmax(fmin(self->_containerViewYOffset / v20 + 0.0, v20), 0.0));
    goto LABEL_8;
  }
  if (v21 == 2868 || v21 == 2796)
    goto LABEL_7;
LABEL_8:

}

- (void)setWallpaperVariant:(int64_t)a3
{
  if (self->_wallpaperVariant != a3)
  {
    self->_wallpaperVariant = a3;
    -[SBReachabilityBackgroundView _updateWallpaperViewAnimated:](self, "_updateWallpaperViewAnimated:", 1);
  }
}

- (void)setContainerViewYOffset:(double)a3
{
  if (self->_containerViewYOffset != a3)
  {
    self->_containerViewYOffset = a3;
    -[SBReachabilityBackgroundView setNeedsLayout](self, "setNeedsLayout");
    -[SBReachabilityBackgroundView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setHomeGrabberAdditionalOffset:(double)a3
{
  if (self->_homeGrabberAdditionalOffset != a3)
  {
    self->_homeGrabberAdditionalOffset = a3;
    -[SBHomeGrabberView setNeedsLayout](self->_homeGrabberView, "setNeedsLayout");
    -[SBHomeGrabberView layoutIfNeeded](self->_homeGrabberView, "layoutIfNeeded");
  }
}

- (void)setHomeGrabberAlpha:(double)a3
{
  -[SBHomeGrabberView setAlpha:](self->_homeGrabberView, "setAlpha:", a3);
}

- (void)setChevronAlpha:(double)a3
{
  *(float *)&a3 = a3;
  -[CAShapeLayer setOpacity:](self->_chevronLayer, "setOpacity:", a3);
}

- (double)homeGrabberAlpha
{
  double result;

  -[SBHomeGrabberView alpha](self->_homeGrabberView, "alpha");
  return result;
}

- (double)chevronAlpha
{
  float v2;

  -[CAShapeLayer opacity](self->_chevronLayer, "opacity");
  return v2;
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  return self->_homeGrabberAdditionalOffset;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return 0;
}

- (id)_newWallpaperViewForVariant:(int64_t)a3
{
  uint64_t v4;
  id v5;
  SBWallpaperEffectView *v6;
  void *v7;

  v4 = SBFEffectiveArtworkSubtype();
  if (v4 > 2795)
  {
    if (v4 != 2796 && v4 != 2868)
      goto LABEL_8;
  }
  else if (v4 != 2556 && v4 != 2622)
  {
LABEL_8:
    v6 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", self->_wallpaperVariant);
    -[PBUIWallpaperEffectViewBase setForcesOpaque:](v6, "setForcesOpaque:", 1);
    -[SBReachabilityBackgroundView bounds](self, "bounds");
    -[SBWallpaperEffectView setFrame:](v6, "setFrame:");
    -[PBUIWallpaperEffectViewBase setStyle:](v6, "setStyle:", 15);
    return v6;
  }
  v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[SBReachabilityBackgroundView bounds](self, "bounds");
  v6 = (SBWallpaperEffectView *)objc_msgSend(v5, "initWithFrame:");
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWallpaperEffectView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  return v6;
}

- (void)_updateWallpaperViewAnimated:(BOOL)a3
{
  id v4;
  UIView *v5;
  UIView *wallpaperContainerView;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  UIView *topWallpaperView;
  UIView *v11;
  UIView *bottomWallpaperView;
  uint64_t v13;
  _SBAdaptiveColorMatrixView *v14;
  _SBAdaptiveColorMatrixView *v15;
  _SBAdaptiveColorMatrixView *colorMatrixView;
  _SBAdaptiveColorMatrixView *v17;
  UIViewFloatAnimatableProperty *v18;
  UIViewFloatAnimatableProperty *colorMatrixOpacityAnimatableProperty;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  _QWORD v24[4];
  UIView *v25;
  UIView *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id location;
  _QWORD v32[3];

  v23 = a3;
  v32[1] = *MEMORY[0x1E0C80C00];
  if (!self->_wallpaperContainerView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBReachabilityBackgroundView bounds](self, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    wallpaperContainerView = self->_wallpaperContainerView;
    self->_wallpaperContainerView = v5;

    -[UIView bs_setHitTestingDisabled:](self->_wallpaperContainerView, "bs_setHitTestingDisabled:", 1);
    -[SBReachabilityBackgroundView addSubview:](self, "addSubview:", self->_wallpaperContainerView);
  }
  v7 = self->_topWallpaperView;
  v8 = self->_bottomWallpaperView;
  v9 = -[SBReachabilityBackgroundView _newWallpaperViewForVariant:](self, "_newWallpaperViewForVariant:", self->_wallpaperVariant);
  topWallpaperView = self->_topWallpaperView;
  self->_topWallpaperView = v9;

  v11 = -[SBReachabilityBackgroundView _newWallpaperViewForVariant:](self, "_newWallpaperViewForVariant:", self->_wallpaperVariant);
  bottomWallpaperView = self->_bottomWallpaperView;
  self->_bottomWallpaperView = v11;

  -[UIView addSubview:](self->_wallpaperContainerView, "addSubview:", self->_topWallpaperView);
  -[UIView addSubview:](self->_wallpaperContainerView, "addSubview:", self->_bottomWallpaperView);
  if (!self->_colorMatrixView)
  {
    v13 = SBFEffectiveArtworkSubtype();
    if (v13 <= 2795)
    {
      if (v13 != 2556 && v13 != 2622)
        goto LABEL_11;
LABEL_10:
      v14 = [_SBAdaptiveColorMatrixView alloc];
      -[SBReachabilityBackgroundView bounds](self, "bounds");
      v15 = -[_SBAdaptiveColorMatrixView initWithFrame:](v14, "initWithFrame:");
      colorMatrixView = self->_colorMatrixView;
      self->_colorMatrixView = v15;

      v17 = self->_colorMatrixView;
      -[SBReachabilityBackgroundView _displayCornerRadius](self, "_displayCornerRadius");
      -[_SBAdaptiveColorMatrixView _setCornerRadius:](v17, "_setCornerRadius:");
      -[SBReachabilityBackgroundView _updateColorMatrixFilters](self, "_updateColorMatrixFilters");
      -[SBReachabilityBackgroundView _updateColorMatrixAlpha:](self, "_updateColorMatrixAlpha:", 0.0);
      objc_initWeak(&location, self);
      v18 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
      colorMatrixOpacityAnimatableProperty = self->_colorMatrixOpacityAnimatableProperty;
      self->_colorMatrixOpacityAnimatableProperty = v18;

      v20 = (void *)MEMORY[0x1E0CEABB0];
      v32[0] = self->_colorMatrixOpacityAnimatableProperty;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke;
      v29[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v20, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v21, v29);

      -[UIView addSubview:](self->_wallpaperContainerView, "addSubview:", self->_colorMatrixView);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
    if (v13 == 2868 || v13 == 2796)
      goto LABEL_10;
  }
LABEL_11:
  -[SBReachabilityBackgroundView _setupCornerContentsImageForWallpaperView:](self, "_setupCornerContentsImageForWallpaperView:", self->_topWallpaperView);
  -[SBReachabilityBackgroundView _setupCornerContentsImageForWallpaperView:](self, "_setupCornerContentsImageForWallpaperView:", self->_bottomWallpaperView);
  -[SBReachabilityBackgroundView _updateWallpaperViewFilters](self, "_updateWallpaperViewFilters");
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_2;
  v28[3] = &unk_1E8E9DED8;
  v28[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v28);
  if (v7 && v23)
  {
    -[UIView setAlpha:](self->_topWallpaperView, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->_bottomWallpaperView, "setAlpha:", 0.0);
    v22 = (void *)MEMORY[0x1E0CEABB0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_3;
    v27[3] = &unk_1E8E9DED8;
    v27[4] = self;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_4;
    v24[3] = &unk_1E8E9DEB0;
    v25 = v7;
    v26 = v8;
    objc_msgSend(v22, "animateWithDuration:animations:completion:", v27, v24, 0.3);

  }
  else
  {
    -[UIView removeFromSuperview](v7, "removeFromSuperview");
    -[UIView removeFromSuperview](v8, "removeFromSuperview");
  }

}

void __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 54);
    if (v3)
    {
      v4 = v2;
      objc_msgSend(v3, "presentationValue");
      objc_msgSend(v4, "_updateColorMatrixAlpha:");
      v2 = v4;
    }
  }

}

uint64_t __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 1.0);
}

uint64_t __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (void)_setupCornerContentsImageForWallpaperView:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[9];

  v24 = a3;
  -[SBReachabilityBackgroundView _displayCornerRadius](self, "_displayCornerRadius");
  v5 = v4;
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_msgSend(v24, "bounds");
    v7 = v6;
    BSRectWithSize();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = objc_alloc(MEMORY[0x1E0CEA610]);
    objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithBounds:format:", v17, v9, v11, v13, v15);

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__SBReachabilityBackgroundView__setupCornerContentsImageForWallpaperView___block_invoke;
    v25[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v25[4] = v9;
    *(double *)&v25[5] = v11;
    *(double *)&v25[6] = v13;
    *(double *)&v25[7] = v15;
    v25[8] = v5;
    objc_msgSend(v18, "imageWithActions:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", v7 * 0.5);

    objc_msgSend(v24, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_retainAutorelease(v19);
    objc_msgSend(v21, "setCornerContents:", objc_msgSend(v22, "CGImage"));

    objc_msgSend(v24, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);

  }
}

void __74__SBReachabilityBackgroundView__setupCornerContentsImageForWallpaperView___block_invoke(double *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", a1[4], a1[5], a1[6], a1[7]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CEA390];
  v10 = *(CGRect *)((_BYTE *)a1 + 1);
  v11 = CGRectOffset(v10, 0.0, v10.size.height - a1[8] * 2.0);
  objc_msgSend(v2, "bezierPathWithRoundedRect:cornerRadius:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height, a1[8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bezierPathByReversingPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPath:", v4);

  v5 = (void *)MEMORY[0x1E0CEA390];
  v12 = *(CGRect *)((_BYTE *)a1 + 1);
  v13 = CGRectOffset(v12, 0.0, -(v12.size.height - a1[8] * 2.0));
  objc_msgSend(v5, "bezierPathWithRoundedRect:cornerRadius:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height, a1[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bezierPathByReversingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPath:", v7);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFill");

  objc_msgSend(v9, "fill");
}

- (void)_setupChevron
{
  CAShapeLayer *v3;
  CAShapeLayer *chevronLayer;
  CAShapeLayer *v5;
  id v6;
  CAShapeLayer *v7;
  id v8;
  void *v9;
  void *v10;
  UIViewFloatAnimatableProperty *v11;
  UIViewFloatAnimatableProperty **p_chevronShapeAnimatableProperty;
  UIViewFloatAnimatableProperty *chevronShapeAnimatableProperty;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  chevronLayer = self->_chevronLayer;
  self->_chevronLayer = v3;

  -[CAShapeLayer setAnchorPoint:](self->_chevronLayer, "setAnchorPoint:", 0.5, 1.0);
  -[CAShapeLayer setCompositingFilter:](self->_chevronLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);
  v5 = self->_chevronLayer;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  v7 = self->_chevronLayer;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](v7, "setFillColor:", objc_msgSend(v8, "CGColor"));

  -[CAShapeLayer setLineWidth:](self->_chevronLayer, "setLineWidth:", 5.0);
  -[CAShapeLayer setLineCap:](self->_chevronLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
  -[CAShapeLayer setLineJoin:](self->_chevronLayer, "setLineJoin:", *MEMORY[0x1E0CD3030]);
  -[CAShapeLayer setAllowsGroupBlending:](self->_chevronLayer, "setAllowsGroupBlending:", 0);
  -[SBReachabilityBackgroundView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsGroupBlending:", 0);

  -[SBReachabilityBackgroundView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSublayer:", self->_chevronLayer);

  objc_initWeak(&location, self);
  v11 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  p_chevronShapeAnimatableProperty = &self->_chevronShapeAnimatableProperty;
  chevronShapeAnimatableProperty = self->_chevronShapeAnimatableProperty;
  self->_chevronShapeAnimatableProperty = v11;

  v14 = (void *)MEMORY[0x1E0CEABB0];
  v19[0] = *p_chevronShapeAnimatableProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__SBReachabilityBackgroundView__setupChevron__block_invoke;
  v16[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v14, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __45__SBReachabilityBackgroundView__setupChevron__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 61);
    if (v3)
    {
      v4 = v2;
      objc_msgSend(v3, "presentationValue");
      objc_msgSend(v4, "_updateChevronPathForUpFraction:");
      v2 = v4;
    }
  }

}

- (void)_updateChevronPathForUpFraction:(double)a3
{
  double v4;
  id v5;
  CAShapeLayer *chevronLayer;
  id v7;

  v4 = a3 * 9.0;
  v5 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  objc_msgSend(v5, "moveToPoint:", -20.0, v4 * 0.5);
  objc_msgSend(v5, "addCurveToPoint:controlPoint1:controlPoint2:", 20.0, v4 * 0.5, 6.66666667, v4 * -0.5, -6.66666667, v4 * -0.5);
  chevronLayer = self->_chevronLayer;
  v7 = objc_retainAutorelease(v5);
  -[CAShapeLayer setPath:](chevronLayer, "setPath:", objc_msgSend(v7, "CGPath"));

}

- (void)_setupHomeGrabberView
{
  SBHomeGrabberView *v3;
  SBHomeGrabberView *v4;
  SBHomeGrabberView *homeGrabberView;

  if (SBFEffectiveHomeButtonType() == 2)
  {
    v3 = [SBHomeGrabberView alloc];
    -[SBReachabilityBackgroundView bounds](self, "bounds");
    v4 = -[SBHomeGrabberView initWithFrame:](v3, "initWithFrame:");
    homeGrabberView = self->_homeGrabberView;
    self->_homeGrabberView = v4;

    -[SBHomeGrabberView setDelegate:](self->_homeGrabberView, "setDelegate:", self);
    -[SBHomeGrabberView setHomeAffordanceInteractionEnabled:](self->_homeGrabberView, "setHomeAffordanceInteractionEnabled:", 0);
    -[SBReachabilityBackgroundView addSubview:](self, "addSubview:", self->_homeGrabberView);
  }
}

- (void)_setupHitTestBlockerView
{
  id v3;
  UIView *v4;
  UIView *hitTestBlockerView;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[SBReachabilityBackgroundView bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  hitTestBlockerView = self->_hitTestBlockerView;
  self->_hitTestBlockerView = v4;

  v6 = self->_hitTestBlockerView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UIView layer](self->_hitTestBlockerView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

  -[UIView layer](self->_hitTestBlockerView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsHitTesting:", 1);

  -[SBReachabilityBackgroundView addSubview:](self, "addSubview:", self->_hitTestBlockerView);
}

- (void)_setupColorInvertObservation
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__invertColorsChanged_, *MEMORY[0x1E0CEB018], 0);

}

- (void)_updateColorMatrixAlpha:(double)a3
{
  uint64_t v5;

  v5 = SBFEffectiveArtworkSubtype();
  if (v5 <= 2795)
  {
    if (v5 != 2556 && v5 != 2622)
      return;
LABEL_7:
    -[_SBAdaptiveColorMatrixView setAlpha:](self->_colorMatrixView, "setAlpha:", a3);
    return;
  }
  if (v5 == 2868 || v5 == 2796)
    goto LABEL_7;
}

- (BOOL)_invertColorsIsEnabled
{
  return _AXSClassicInvertColorsEnabled() || _AXSInvertColorsEnabled() != 0;
}

- (void)_updateColorMatrixFilters
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _OWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2868 && v3 != 2796)
      return;
  }
  else if (v3 != 2556 && v3 != 2622)
  {
    return;
  }
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jindoTintColorMatrixSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "colorMatrix");
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }

  v15[2] = v18;
  v15[3] = v19;
  v15[4] = v20;
  v15[0] = v16;
  v15[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v15, "{CAColorMatrix=ffffffffffffffffffff}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("inputColorMatrix"));

  v22[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBReachabilityBackgroundView _invertColorsIsEnabled](self, "_invertColorsIsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BE0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  -[_SBAdaptiveColorMatrixView backdropLayer](self->_colorMatrixView, "backdropLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsInPlaceFiltering:", 1);

  -[_SBAdaptiveColorMatrixView layer](self->_colorMatrixView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFilters:", v9);

}

- (void)_updateWallpaperViewFilters
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = SBFEffectiveArtworkSubtype();
  if (v3 <= 2795)
  {
    if (v3 != 2556 && v3 != 2622)
      return;
LABEL_7:
    v4 = -[SBReachabilityBackgroundView _invertColorsIsEnabled](self, "_invertColorsIsEnabled");
    -[UIView layer](self->_topWallpaperView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      v7 = *MEMORY[0x1E0CD2BE0];
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BE0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFilters:", v9);

      -[UIView layer](self->_bottomWallpaperView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFilters:", v12);

    }
    else
    {
      v13 = MEMORY[0x1E0C9AA60];
      objc_msgSend(v5, "setFilters:", MEMORY[0x1E0C9AA60]);

      -[UIView layer](self->_bottomWallpaperView, "layer");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilters:", v13);

    }
    return;
  }
  if (v3 == 2868 || v3 == 2796)
    goto LABEL_7;
}

- (void)_invertColorsChanged:(id)a3
{
  -[SBReachabilityBackgroundView _updateColorMatrixFilters](self, "_updateColorMatrixFilters", a3);
  -[SBReachabilityBackgroundView _updateWallpaperViewFilters](self, "_updateWallpaperViewFilters");
}

- (int64_t)wallpaperVariant
{
  return self->_wallpaperVariant;
}

- (double)containerViewYOffset
{
  return self->_containerViewYOffset;
}

- (double)homeGrabberAdditionalOffset
{
  return self->_homeGrabberAdditionalOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronShapeAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_chevronLayer, 0);
  objc_storeStrong((id *)&self->_homeGrabberView, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerView, 0);
  objc_storeStrong((id *)&self->_bottomWallpaperView, 0);
  objc_storeStrong((id *)&self->_topWallpaperView, 0);
  objc_storeStrong((id *)&self->_colorMatrixOpacityAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_colorMatrixView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
}

@end
