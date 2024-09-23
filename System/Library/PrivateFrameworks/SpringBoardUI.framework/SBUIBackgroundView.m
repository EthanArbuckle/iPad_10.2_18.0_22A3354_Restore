@implementation SBUIBackgroundView

- (SBUIBackgroundView)initWithFrame:(CGRect)a3
{
  SBUIBackgroundView *v3;
  SBUIBackgroundView *v4;
  UIView *v5;
  UIView *reduceTransparencyView;
  void *v7;
  UIView *v8;
  UIView *reduceTransparencyTintingView;
  id v10;
  uint64_t v11;
  UIView *sourceOverView;
  void *v13;
  id v14;
  uint64_t v15;
  UIView *darkenSourceOverView;
  void *v17;
  id v18;
  uint64_t v19;
  BSUIBackdropView *backdropView;
  void *v21;
  void *v22;
  uint64_t v23;
  MTMaterialView *luminanceView;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  UIView *lightenSourceOverView;
  UIView *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  UIView *tintView;
  void *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)SBUIBackgroundView;
  v3 = -[SBUIBackgroundView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_transitionStyle = -1;
    v3->_isReducedTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    v5 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    reduceTransparencyView = v4->_reduceTransparencyView;
    v4->_reduceTransparencyView = v5;

    if (v4->_reduceTransparencyBackingColor)
    {
      -[SBUIBackgroundView setReduceTransparencyBackingColor:](v4, "setReduceTransparencyBackingColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIBackgroundView setReduceTransparencyBackingColor:](v4, "setReduceTransparencyBackingColor:", v7);

    }
    -[UIView setHidden:](v4->_reduceTransparencyView, "setHidden:", !v4->_isReducedTransparencyEnabled);
    -[SBUIBackgroundView addSubview:](v4, "addSubview:", v4->_reduceTransparencyView);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    reduceTransparencyTintingView = v4->_reduceTransparencyTintingView;
    v4->_reduceTransparencyTintingView = v8;

    -[UIView setHidden:](v4->_reduceTransparencyTintingView, "setHidden:", !v4->_isReducedTransparencyEnabled);
    -[SBUIBackgroundView addSubview:](v4, "addSubview:", v4->_reduceTransparencyTintingView);
    v10 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[BSUIBackdropView bounds](v4->_backdropView, "bounds");
    v11 = objc_msgSend(v10, "initWithFrame:");
    sourceOverView = v4->_sourceOverView;
    v4->_sourceOverView = (UIView *)v11;

    -[UIView layer](v4->_sourceOverView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", *MEMORY[0x24BDE5C10]);

    -[SBUIBackgroundView addSubview:](v4, "addSubview:", v4->_sourceOverView);
    v14 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[BSUIBackdropView bounds](v4->_backdropView, "bounds");
    v15 = objc_msgSend(v14, "initWithFrame:");
    darkenSourceOverView = v4->_darkenSourceOverView;
    v4->_darkenSourceOverView = (UIView *)v15;

    -[UIView layer](v4->_darkenSourceOverView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompositingFilter:", *MEMORY[0x24BDE5A30]);

    -[SBUIBackgroundView addSubview:](v4, "addSubview:", v4->_darkenSourceOverView);
    v18 = objc_alloc(MEMORY[0x24BE0BF10]);
    v19 = objc_msgSend(v18, "initWithFrame:privateStyle:", -2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    backdropView = v4->_backdropView;
    v4->_backdropView = (BSUIBackdropView *)v19;

    -[BSUIBackdropView setHidden:](v4->_backdropView, "setHidden:", v4->_isReducedTransparencyEnabled);
    -[SBUIBackgroundView addSubview:](v4, "addSubview:", v4->_backdropView);
    v21 = (void *)MEMORY[0x24BE64060];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("sbuiBackgroundViewLuminance"), v22, 0, 0, 1.0);
    v23 = objc_claimAutoreleasedReturnValue();
    luminanceView = v4->_luminanceView;
    v4->_luminanceView = (MTMaterialView *)v23;

    -[SBUIBackgroundView addSubview:](v4, "addSubview:", v4->_luminanceView);
    -[SBUIBackgroundView layer](v4, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowsGroupBlending:", 0);

    -[SBUIBackgroundView bounds](v4, "bounds");
    v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v26, v27, v28, v29);
    lightenSourceOverView = v4->_lightenSourceOverView;
    v4->_lightenSourceOverView = (UIView *)v30;

    -[UIView setAutoresizingMask:](v4->_lightenSourceOverView, "setAutoresizingMask:", 18);
    v32 = v4->_lightenSourceOverView;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.25);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v32, "setBackgroundColor:", v33);

    -[UIView layer](v4->_lightenSourceOverView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5B50]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCompositingFilter:", v35);

    -[SBUIBackgroundView addSubview:](v4, "addSubview:", v4->_lightenSourceOverView);
    v36 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[BSUIBackdropView bounds](v4->_backdropView, "bounds");
    v37 = objc_msgSend(v36, "initWithFrame:");
    tintView = v4->_tintView;
    v4->_tintView = (UIView *)v37;

    -[SBUIBackgroundView addSubview:](v4, "addSubview:", v4->_tintView);
    -[SBUIBackgroundView setBackgroundStyle:](v4, "setBackgroundStyle:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v4, sel__reduceTransparencyEnabledStateDidChange_, *MEMORY[0x24BDF7318], 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[8];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBUIBackgroundView;
  -[SBUIBackgroundView layoutSubviews](&v8, sel_layoutSubviews);
  -[SBUIBackgroundView bounds](self, "bounds");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__SBUIBackgroundView_layoutSubviews__block_invoke;
  v7[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  v7[4] = v3;
  v7[5] = v4;
  v7[6] = v5;
  v7[7] = v6;
  -[SBUIBackgroundView modifyAllViewsWithChanges:](self, "modifyAllViewsWithChanges:", v7);
}

uint64_t __36__SBUIBackgroundView_layoutSubviews__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__SBUIBackgroundView__setContinuousCornerRadius___block_invoke;
  v3[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&v3[4] = a3;
  -[SBUIBackgroundView modifyAllViewsWithChanges:](self, "modifyAllViewsWithChanges:", v3);
}

void __49__SBUIBackgroundView__setContinuousCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  v2 = *(double *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "_setContinuousCornerRadius:", v2);
  objc_msgSend(v3, "setClipsToBounds:", 1);

}

- (void)modifyAllViewsWithChanges:(id)a3
{
  void (**v4)(id, _QWORD);
  UIView *reduceTransparencyTintingView;
  MTMaterialView *luminanceView;
  BSUIBackdropView *backdropView;
  UIView *sourceOverView;
  UIView *darkenSourceOverView;
  UIView *tintView;
  UIView *lightenSourceOverView;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  reduceTransparencyTintingView = self->_reduceTransparencyTintingView;
  luminanceView = self->_luminanceView;
  backdropView = self->_backdropView;
  v21[0] = self->_reduceTransparencyView;
  v21[1] = reduceTransparencyTintingView;
  sourceOverView = self->_sourceOverView;
  v21[2] = luminanceView;
  v21[3] = backdropView;
  darkenSourceOverView = self->_darkenSourceOverView;
  v21[4] = sourceOverView;
  v21[5] = darkenSourceOverView;
  tintView = self->_tintView;
  lightenSourceOverView = self->_lightenSourceOverView;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21[6] = tintView;
  v21[7] = lightenSourceOverView;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        if (v4)
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v14);
  }

}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[SBUIBackgroundView beginTransitionToBackgroundStyle:](self, "beginTransitionToBackgroundStyle:");
  -[SBUIBackgroundView completeTransitionToBackgroundStyle:](self, "completeTransitionToBackgroundStyle:", a3);
}

- (void)beginTransitionToBackgroundStyle:(int64_t)a3
{
  uint64_t *p_style;
  _BOOL4 v6;
  uint64_t v7;

  if (self->_transitioning)
  {
    if (self->_transitionStyle == a3)
      return;
    p_style = &self->_style;
    if (self->_style == a3)
    {
      -[SBUIBackgroundView completeTransitionToBackgroundStyle:](self, "completeTransitionToBackgroundStyle:", a3);
      return;
    }
  }
  else
  {
    p_style = &self->_style;
    if (self->_style == a3)
      return;
  }
  -[SBUIBackgroundView _updateAppearanceForBackgroundStyle:transitionToSettings:](self, "_updateAppearanceForBackgroundStyle:transitionToSettings:");
  self->_transitionStyle = a3;
  self->_transitioning = 1;
  v6 = !SBUIHasBlurForBackgroundStyle(*p_style) && !SBUIHasBlurForBackgroundStyle(self->_transitionStyle);
  v7 = self->_isReducedTransparencyEnabled || v6;
  -[BSUIBackdropView setHidden:](self->_backdropView, "setHidden:", v7);
}

- (void)updateBackgroundStyleTransitionProgress:(double)a3
{
  BSUIBackdropView *backdropView;
  void *v6;

  if (self->_transitioning)
  {
    self->_progress = a3;
    if ((-[BSUIBackdropView isHidden](self->_backdropView, "isHidden") & 1) == 0)
    {
      backdropView = self->_backdropView;
      SBUIGetBackdropSettingsForBackgroundStyle(self->_transitionStyle);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIBackdropView transitionIncrementallyToSettings:weighting:](backdropView, "transitionIncrementallyToSettings:weighting:", v6, self->_progress);

    }
    -[SBUIBackgroundView _updateReduceTransparencyTintingWithProgressWeighting:](self, "_updateReduceTransparencyTintingWithProgressWeighting:", self->_progress);
    -[SBUIBackgroundView _updateAppearanceForTransitionFromStyle:toStyle:withProgress:](self, "_updateAppearanceForTransitionFromStyle:toStyle:withProgress:", self->_style, self->_transitionStyle, a3);
  }
}

- (void)completeTransitionToBackgroundStyle:(int64_t)a3
{
  if (self->_transitioning)
  {
    self->_progress = 0.0;
    self->_transitioning = 0;
    self->_style = a3;
    self->_transitionStyle = -1;
    -[SBUIBackgroundView _updateAppearanceForBackgroundStyle:transitionToSettings:](self, "_updateAppearanceForBackgroundStyle:transitionToSettings:");
  }
}

- (NSString)groupName
{
  return (NSString *)-[BSUIBackdropView groupName](self->_backdropView, "groupName");
}

- (void)setGroupName:(id)a3
{
  -[BSUIBackdropView setGroupName:](self->_backdropView, "setGroupName:", a3);
}

- (id)backdropView
{
  return self->_backdropView;
}

- (void)setReduceTransparencyBackingColor:(id)a3
{
  UIColor *v5;
  UIColor **p_reduceTransparencyBackingColor;
  UIView *reduceTransparencyView;
  void *v8;
  UIColor *v9;

  v5 = (UIColor *)a3;
  p_reduceTransparencyBackingColor = &self->_reduceTransparencyBackingColor;
  if (self->_reduceTransparencyBackingColor != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, a3);
    reduceTransparencyView = self->_reduceTransparencyView;
    if (*p_reduceTransparencyBackingColor)
    {
      -[UIView setBackgroundColor:](reduceTransparencyView, "setBackgroundColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](reduceTransparencyView, "setBackgroundColor:", v8);

    }
    v5 = v9;
  }

}

- (void)_updateReduceTransparencyTintingWithProgressWeighting:(double)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  UIView *reduceTransparencyTintingView;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  UIView *v22;
  uint64_t v23;
  double v24;
  __int128 v25;
  __int128 v26;

  SBUIGetBackdropSettingsForBackgroundStyle(self->_transitionStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBUIGetBackdropSettingsForBackgroundStyle(self->_style);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBUIBackgroundView _shouldApplyReducedTransparencyTintForBackgroundStyle:](self, "_shouldApplyReducedTransparencyTintForBackgroundStyle:", self->_style);
  if (v6 == -[SBUIBackgroundView _shouldApplyReducedTransparencyTintForBackgroundStyle:](self, "_shouldApplyReducedTransparencyTintForBackgroundStyle:", self->_transitionStyle))
  {
    if (!v6)
    {
      -[UIView setBackgroundColor:](self->_reduceTransparencyTintingView, "setBackgroundColor:", 0);
      goto LABEL_10;
    }
    objc_msgSend(v5, "grayscaleTintLevel");
    objc_msgSend(v4, "grayscaleTintLevel");
    objc_msgSend(v5, "grayscaleTintAlpha");
    v13 = v12;
    objc_msgSend(v4, "grayscaleTintAlpha");
    v15 = v14;
    reduceTransparencyTintingView = self->_reduceTransparencyTintingView;
    v17 = (void *)MEMORY[0x24BDF6950];
    BSIntervalValueForFraction();
    v19 = v18;
    BSIntervalValueForFraction();
    objc_msgSend(v17, "colorWithWhite:alpha:", v19, v20, v13, 1, v15, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = reduceTransparencyTintingView;
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v5, "grayscaleTintAlpha");
      v8 = v7;
      v9 = (void *)MEMORY[0x24BDF6950];
      objc_msgSend(v5, "grayscaleTintLevel");
    }
    else
    {
      objc_msgSend(v4, "grayscaleTintAlpha");
      v8 = v23;
      v9 = (void *)MEMORY[0x24BDF6950];
      objc_msgSend(v4, "grayscaleTintLevel");
    }
    v11 = v10;
    LOBYTE(v25) = 1;
    *(_QWORD *)((char *)&v25 + 1) = 0;
    LOBYTE(v26) = 1;
    *(_DWORD *)((char *)&v26 + 1) = 0;
    DWORD1(v26) = 0;
    BSIntervalValueForFraction();
    objc_msgSend(v9, "colorWithWhite:alpha:", v11, v24, v8, (_QWORD)v25, 0, (_QWORD)v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_reduceTransparencyTintingView;
  }
  -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v21);

LABEL_10:
}

- (void)_updateReduceTransparencyTinting
{
  _BOOL4 v3;
  UIView *reduceTransparencyTintingView;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  SBUIGetBackdropSettingsForBackgroundStyle(self->_style);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUIBackgroundView _shouldApplyReducedTransparencyTintForBackgroundStyle:](self, "_shouldApplyReducedTransparencyTintForBackgroundStyle:", self->_style);
  reduceTransparencyTintingView = self->_reduceTransparencyTintingView;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(v10, "grayscaleTintLevel");
    v7 = v6;
    objc_msgSend(v10, "grayscaleTintAlpha");
    objc_msgSend(v5, "colorWithWhite:alpha:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](reduceTransparencyTintingView, "setBackgroundColor:", v9);

  }
  else
  {
    -[UIView setBackgroundColor:](reduceTransparencyTintingView, "setBackgroundColor:", 0);
  }

}

- (void)_reduceTransparencyEnabledStateDidChange:(id)a3
{
  _BOOL4 IsReduceTransparencyEnabled;
  double v5;
  double v6;
  double v7;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  self->_isReducedTransparencyEnabled = IsReduceTransparencyEnabled;
  -[UIView setHidden:](self->_reduceTransparencyView, "setHidden:", !IsReduceTransparencyEnabled);
  -[UIView setHidden:](self->_reduceTransparencyTintingView, "setHidden:", !self->_isReducedTransparencyEnabled);
  -[SBUIBackgroundView _reducedTransparencyValueForBackgroundStyle:](self, "_reducedTransparencyValueForBackgroundStyle:", self->_style);
  v6 = v5;
  -[UIView setAlpha:](self->_reduceTransparencyView, "setAlpha:");
  -[UIView setAlpha:](self->_reduceTransparencyTintingView, "setAlpha:", v6);
  v7 = 0.0;
  if (!self->_isReducedTransparencyEnabled)
    v7 = 1.0;
  -[BSUIBackdropView setAlpha:](self->_backdropView, "setAlpha:", v7);
}

- (void)_updateAppearanceForBackgroundStyle:(int64_t)a3 transitionToSettings:(BOOL)a4
{
  BSUIBackdropView *backdropView;
  void *v7;
  double v8;
  double v9;
  double v10;

  if (a4)
  {
    backdropView = self->_backdropView;
    SBUIGetBackdropSettingsForBackgroundStyle(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIBackdropView transitionToSettings:](backdropView, "transitionToSettings:", v7);

  }
  -[SBUIBackgroundView _darkenValueForBackgroundStyle:](self, "_darkenValueForBackgroundStyle:", a3);
  -[SBUIBackgroundView _darkenWithProgress:](self, "_darkenWithProgress:");
  -[SBUIBackgroundView _tintValueForBackgroundStyle:](self, "_tintValueForBackgroundStyle:", a3);
  v9 = v8;
  -[SBUIBackgroundView _tintColorAlphaForBackgroundStyle:](self, "_tintColorAlphaForBackgroundStyle:", a3);
  -[SBUIBackgroundView _tintWithProgress:backgroundColorAlpha:](self, "_tintWithProgress:backgroundColorAlpha:", v9, v10);
  -[SBUIBackgroundView _reducedTransparencyValueForBackgroundStyle:](self, "_reducedTransparencyValueForBackgroundStyle:", a3);
  -[SBUIBackgroundView _reduceTransparencyWithProgress:](self, "_reduceTransparencyWithProgress:");
  -[SBUIBackgroundView _updateReduceTransparencyTinting](self, "_updateReduceTransparencyTinting");
  -[SBUIBackgroundView _luminanceValueForBackgroundStyle:](self, "_luminanceValueForBackgroundStyle:", a3);
  -[SBUIBackgroundView _luminanceWithProgress:](self, "_luminanceWithProgress:");
  -[SBUIBackgroundView _lightenSourceOverValueForBackgroundStyle:](self, "_lightenSourceOverValueForBackgroundStyle:", a3);
  -[SBUIBackgroundView _lightenSourceOverWithProgress:](self, "_lightenSourceOverWithProgress:");
}

- (void)_updateAppearanceForTransitionFromStyle:(int64_t)a3 toStyle:(int64_t)a4 withProgress:(double)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  -[SBUIBackgroundView _tintValueForBackgroundStyle:](self, "_tintValueForBackgroundStyle:");
  v10 = v9;
  -[SBUIBackgroundView _tintValueForBackgroundStyle:](self, "_tintValueForBackgroundStyle:", a4);
  -[SBUIBackgroundView _valueFromStart:toEnd:withFraction:](self, "_valueFromStart:toEnd:withFraction:", v10, v11, a5);
  v13 = v12;
  -[SBUIBackgroundView _tintColorAlphaForBackgroundStyle:](self, "_tintColorAlphaForBackgroundStyle:", a3);
  v15 = v14;
  -[SBUIBackgroundView _tintColorAlphaForBackgroundStyle:](self, "_tintColorAlphaForBackgroundStyle:", a4);
  if (v15 >= v16)
    v17 = v15;
  else
    v17 = v16;
  -[SBUIBackgroundView _tintWithProgress:backgroundColorAlpha:](self, "_tintWithProgress:backgroundColorAlpha:", v13, v17);
  -[SBUIBackgroundView _darkenValueForBackgroundStyle:](self, "_darkenValueForBackgroundStyle:", a3);
  v19 = v18;
  -[SBUIBackgroundView _darkenValueForBackgroundStyle:](self, "_darkenValueForBackgroundStyle:", a4);
  -[SBUIBackgroundView _valueFromStart:toEnd:withFraction:](self, "_valueFromStart:toEnd:withFraction:", v19, v20, a5);
  -[SBUIBackgroundView _darkenWithProgress:](self, "_darkenWithProgress:");
  -[SBUIBackgroundView _reducedTransparencyValueForBackgroundStyle:](self, "_reducedTransparencyValueForBackgroundStyle:", a3);
  v22 = v21;
  -[SBUIBackgroundView _reducedTransparencyValueForBackgroundStyle:](self, "_reducedTransparencyValueForBackgroundStyle:", a4);
  -[SBUIBackgroundView _valueFromStart:toEnd:withFraction:](self, "_valueFromStart:toEnd:withFraction:", v22, v23, a5);
  -[SBUIBackgroundView _reduceTransparencyWithProgress:](self, "_reduceTransparencyWithProgress:");
  -[SBUIBackgroundView _luminanceValueForBackgroundStyle:](self, "_luminanceValueForBackgroundStyle:", a3);
  v25 = v24;
  -[SBUIBackgroundView _luminanceValueForBackgroundStyle:](self, "_luminanceValueForBackgroundStyle:", a4);
  -[SBUIBackgroundView _valueFromStart:toEnd:withFraction:](self, "_valueFromStart:toEnd:withFraction:", v25, v26, a5);
  -[SBUIBackgroundView _luminanceWithProgress:](self, "_luminanceWithProgress:");
  -[SBUIBackgroundView _lightenSourceOverValueForBackgroundStyle:](self, "_lightenSourceOverValueForBackgroundStyle:", a3);
  v28 = v27;
  -[SBUIBackgroundView _lightenSourceOverValueForBackgroundStyle:](self, "_lightenSourceOverValueForBackgroundStyle:", a4);
  -[SBUIBackgroundView _valueFromStart:toEnd:withFraction:](self, "_valueFromStart:toEnd:withFraction:", v28, v29, a5);
  -[SBUIBackgroundView _lightenSourceOverWithProgress:](self, "_lightenSourceOverWithProgress:");
}

- (double)_darkenValueForBackgroundStyle:(int64_t)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 5 || a3 == 2;
  result = 0.0;
  if (v3)
    return 1.0;
  return result;
}

- (double)_tintColorAlphaForBackgroundStyle:(int64_t)a3
{
  double result;

  result = 0.2;
  if (a3 != 8)
    result = 0.0;
  if (a3 == 5)
    return 0.35;
  return result;
}

- (double)_tintValueForBackgroundStyle:(int64_t)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 8 || a3 == 5;
  result = 0.0;
  if (v3)
    return 1.0;
  return result;
}

- (double)_luminanceValueForBackgroundStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 9)
    return 1.0;
  return result;
}

- (double)_lightenSourceOverValueForBackgroundStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 8)
    return 1.0;
  return result;
}

- (BOOL)_shouldApplyReducedTransparencyTintForBackgroundStyle:(int64_t)a3
{
  return a3 == 7;
}

- (double)_reducedTransparencyValueForBackgroundStyle:(int64_t)a3
{
  double result;
  double v4;

  result = 0.0;
  v4 = 1.0;
  if ((unint64_t)(a3 - 2) >= 7)
    v4 = 0.0;
  if (self->_isReducedTransparencyEnabled)
    return v4;
  return result;
}

- (void)_darkenWithProgress:(double)a3
{
  id v4;

  -[SBUIBackgroundView _backgroundColorForDarkenAlpha:andProgress:](self, "_backgroundColorForDarkenAlpha:andProgress:", 0.07, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_sourceOverView, "setBackgroundColor:", v4);
  -[UIView setBackgroundColor:](self->_darkenSourceOverView, "setBackgroundColor:", v4);

}

- (void)_tintWithProgress:(double)a3 backgroundColorAlpha:(double)a4
{
  id v5;

  -[SBUIBackgroundView _backgroundColorForDarkenAlpha:andProgress:](self, "_backgroundColorForDarkenAlpha:andProgress:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_tintView, "setBackgroundColor:", v5);

}

- (void)_reduceTransparencyWithProgress:(double)a3
{
  -[UIView setAlpha:](self->_reduceTransparencyView, "setAlpha:");
  -[UIView setAlpha:](self->_reduceTransparencyTintingView, "setAlpha:", a3);
}

- (void)_lightenSourceOverWithProgress:(double)a3
{
  -[UIView setAlpha:](self->_lightenSourceOverView, "setAlpha:", a3);
}

- (void)_luminanceWithProgress:(double)a3
{
  -[MTMaterialView setAlpha:](self->_luminanceView, "setAlpha:", a3);
}

- (id)_backgroundColorForDarkenAlpha:(double)a3 andProgress:(double)a4
{
  double v4;
  double v5;
  void *v6;
  void *v7;

  -[SBUIBackgroundView _valueFromStart:toEnd:withFraction:](self, "_valueFromStart:toEnd:withFraction:", 0.0, a3, a4);
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)_valueFromStart:(double)a3 toEnd:(double)a4 withFraction:(double)a5
{
  double result;

  BSIntervalValueForFraction();
  return result;
}

- (int64_t)backgroundStyle
{
  return self->_style;
}

- (BOOL)isTransitioningBackgroundStyle
{
  return self->_transitioning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_luminanceView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, 0);
  objc_storeStrong((id *)&self->_lightenSourceOverView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_darkenSourceOverView, 0);
  objc_storeStrong((id *)&self->_sourceOverView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyTintingView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
