@implementation SBFolderScrollAccessoryView

void __46__SBFolderScrollAccessoryView__setUpAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateForModePropertyChanged");

}

- (void)_updateForModePropertyChanged
{
  void *v3;
  __int128 v4;
  float64x2_t v5;
  double v11;
  double v12;
  double v13;
  double v14;
  float64x2_t v15;
  float64x2_t v16;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  float64x2_t sx;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  -[SBFolderScrollAccessoryView modeAnimatableProperty](self, "modeAnimatableProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationValue");
  v25 = v4;

  if (-[SBFolderScrollAccessoryView mode](self, "mode"))
  {
    v5.f64[0] = *(double *)&v25 * 0.02;
    *(_QWORD *)&v5.f64[1] = v25;
    __asm { FMOV            V1.2D, #1.0 }
    sx = vminnmq_f64(vmaxnmq_f64(vaddq_f64(vdivq_f64(v5, (float64x2_t)vdupq_n_s64(0xBFD6666666666666)), _Q1), (float64x2_t)xmmword_1D0191150), _Q1);
    v11 = *(double *)&v25 + -0.3;
    v12 = 0.7;
    v13 = (*(double *)&v25 + -0.3) / 0.7 + 0.0;
    v14 = 0.98;
  }
  else
  {
    v15.f64[0] = (*(double *)&v25 + -0.7) * 0.02;
    v15.f64[1] = *(double *)&v25 + -0.7;
    v16 = vmaxnmq_f64(vaddq_f64(vdivq_f64(v15, (float64x2_t)vdupq_n_s64(0xBFE6666666666666)), (float64x2_t)xmmword_1D0191150), (float64x2_t)xmmword_1D0191150);
    __asm { FMOV            V1.2D, #1.0 }
    sx = vminnmq_f64(v16, _Q1);
    v11 = *(double *)&v25 + -1.0;
    v12 = 0.35;
    v14 = 1.0;
    v13 = (*(double *)&v25 + -1.0) / 0.35 + 1.0;
  }
  v18 = fmin(fmax(v13, 0.0), 1.0);
  v19 = fmin(fmax(v11 * 0.02 / v12 + v14, 0.98), 1.0);
  -[SBFolderScrollAccessoryView pageControl](self, "pageControl", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setIndicatorOpacity:", sx.f64[1]);
  memset(&v29, 0, sizeof(v29));
  if (BSFloatEqualToFloat())
  {
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v29.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v29.c = v21;
    *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v29, sx.f64[0], sx.f64[0]);
  }
  -[SBFolderScrollAccessoryView _pageIndicatorsView](self, "_pageIndicatorsView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v29;
  objc_msgSend(v22, "setTransform:", &v28);

  -[SBFolderScrollAccessoryView auxiliaryView](self, "auxiliaryView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", v18);
  memset(&v28, 0, sizeof(v28));
  if (BSFloatEqualToFloat())
  {
    v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v28.c = v24;
    *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v28, v19, v19);
  }
  v27 = v28;
  objc_msgSend(v23, "setTransform:", &v27);

}

- (int64_t)mode
{
  return self->_mode;
}

- (UIViewFloatAnimatableProperty)modeAnimatableProperty
{
  return self->_modeAnimatableProperty;
}

- (id)_pageIndicatorsView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[SBFolderScrollAccessoryView pageControl](self, "pageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "subviews"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 >= 2))
  {
    objc_msgSend(v4, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  CGSize result;

  -[SBFolderScrollAccessoryView auxiliaryView](self, "auxiliaryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;
    -[SBFolderScrollAccessoryView folder](self, "folder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBFolderScrollAccessoryView _numberOfPagesForWidth:maxPageCount:](self, "_numberOfPagesForWidth:maxPageCount:", objc_msgSend(v9, "maxListCount"), v6);

    -[SBFolderScrollAccessoryView pageControl](self, "pageControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfPages");

    v22 = 0.0;
    v23 = 0.0;
    if (v12 >= v10)
      v13 = v10;
    else
      v13 = v12;
    v21 = 0;
    -[SBFolderScrollAccessoryView _getCustomPaddingForNumberOfPages:backgroundViewSize:horizontalPadding:verticalPadding:layoutPageControl:](self, "_getCustomPaddingForNumberOfPages:backgroundViewSize:horizontalPadding:verticalPadding:layoutPageControl:", v13, &v23, &v22, &v21, v6, v8);
    v14 = v21;
    objc_msgSend(v14, "_setCustomHorizontalPadding:", v23);
    objc_msgSend(v14, "_setCustomVerticalPadding:", v22);
    objc_msgSend(v14, "sizeForNumberOfPages:", v13);
  }
  else
  {
    -[SBFolderScrollAccessoryView pageControl](self, "pageControl");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "intrinsicContentSize");
  }
  v17 = v15;
  v18 = v16;

  v19 = v17;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (SBIconListPageControl)pageControl
{
  return self->_pageControl;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (int64_t)_numberOfPagesForWidth:(double)a3 maxPageCount:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;

  -[SBFolderScrollAccessoryView auxiliaryView](self, "auxiliaryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return a4;
  -[SBFolderScrollAccessoryView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  BSFloatRoundForScale();
  v10 = v9;

  v11 = vcvtmd_s64_f64((a3 - v10 - v10 + 7.5) / 14.0);
  if (v11 >= a4)
    return a4;
  else
    return v11;
}

- (UIView)auxiliaryView
{
  return self->_auxiliaryView;
}

- (void)_getCustomPaddingForNumberOfPages:(unint64_t)a3 backgroundViewSize:(CGSize)a4 horizontalPadding:(double *)a5 verticalPadding:(double *)a6 layoutPageControl:(id *)a7
{
  double height;
  double width;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a4.height;
  width = a4.width;
  -[SBFolderScrollAccessoryView _layoutPageControlConfiguredForNumberOfPages:](self, "_layoutPageControlConfiguredForNumberOfPages:");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_indicatorFrameForPage:", 0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v26, "_indicatorFrameForPage:", a3 - 1);
  v29.origin.x = v21;
  v29.origin.y = v22;
  v29.size.width = v23;
  v29.size.height = v24;
  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  v28 = CGRectUnion(v27, v29);
  if (a5)
    *a5 = (width - v28.size.width) * 0.5;
  if (a6)
    *a6 = (height - v28.size.height) * 0.5;
  v25 = v26;
  if (a7)
  {
    *a7 = objc_retainAutorelease(v26);
    v25 = v26;
  }

}

- (id)_layoutPageControlConfiguredForNumberOfPages:(int64_t)a3
{
  void *v4;

  -[SBFolderScrollAccessoryView layoutPageControl](self, "layoutPageControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfPages") != a3
    || (objc_msgSend(v4, "_customHorizontalPadding"), !BSFloatIsZero())
    || (objc_msgSend(v4, "_customVerticalPadding"), (BSFloatIsZero() & 1) == 0))
  {
    objc_msgSend(v4, "setNumberOfPages:", a3);
    objc_msgSend(v4, "_setCustomIndicatorSpacing:", 6.0);
    objc_msgSend(v4, "_setCustomHorizontalPadding:", 0.0);
    objc_msgSend(v4, "_setCustomVerticalPadding:", 0.0);
    objc_msgSend(v4, "intrinsicContentSize");
    BSRectWithSize();
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "setNeedsLayout");
    objc_msgSend(v4, "layoutIfNeeded");
  }
  return v4;
}

- (UIPageControl)layoutPageControl
{
  return self->_layoutPageControl;
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
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int64_t v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SBFolderScrollAccessoryView;
  -[SBFolderScrollAccessoryView layoutSubviews](&v33, sel_layoutSubviews);
  -[SBFolderScrollAccessoryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFolderScrollAccessoryView pageControl](self, "pageControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderScrollAccessoryView auxiliaryView](self, "auxiliaryView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderScrollAccessoryView folder](self, "folder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "maxListCount");

  -[SBFolderScrollAccessoryView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = v16;

  if (v12)
  {
    objc_msgSend(v12, "intrinsicContentSize");
    v19 = v18;
    v21 = v20;
    v22 = -[SBFolderScrollAccessoryView _numberOfPagesForWidth:maxPageCount:](self, "_numberOfPagesForWidth:maxPageCount:", v14);
    objc_msgSend(v12, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");

    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    BSRectWithSize();
    objc_msgSend(v12, "setBounds:", v17);
    UIRectGetCenter();
    objc_msgSend(v12, "setCenter:");
    objc_msgSend(v11, "_setCustomIndicatorSpacing:", 6.0);
    objc_msgSend(v11, "_setPreferredNumberOfVisibleIndicators:", v22);
    v24 = objc_msgSend(v11, "numberOfPages");
    if (v24 < v22)
      v22 = v24;
    v31 = 0.0;
    v32 = 0.0;
    -[SBFolderScrollAccessoryView _getCustomPaddingForNumberOfPages:backgroundViewSize:horizontalPadding:verticalPadding:layoutPageControl:](self, "_getCustomPaddingForNumberOfPages:backgroundViewSize:horizontalPadding:verticalPadding:layoutPageControl:", v22, &v32, &v31, 0, v19, v21);
    objc_msgSend(v11, "_setCustomHorizontalPadding:", v32);
    objc_msgSend(v11, "_setCustomVerticalPadding:", v31);
    objc_msgSend(v11, "sizeForNumberOfPages:", v22);
    BSRectWithSize();
    v30 = v17;
    UIRectCenteredIntegralRectScale();
    v29 = v11;
  }
  else
  {
    objc_msgSend(v11, "_setPreferredNumberOfVisibleIndicators:", v14);
    v29 = v11;
    v25 = v4;
    v26 = v6;
    v27 = v8;
    v28 = v10;
  }
  objc_msgSend(v29, "setFrame:", v25, v26, v27, v28, v30);

}

- (SBFolderScrollAccessoryView)initWithFolder:(id)a3 pageControl:(id)a4
{
  id v7;
  id v8;
  SBFolderScrollAccessoryView *v9;
  SBFolderScrollAccessoryView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFolderScrollAccessoryView;
  v9 = -[SBFolderScrollAccessoryView init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    objc_storeStrong((id *)&v10->_pageControl, a4);
    -[SBFolderScrollAccessoryView addSubview:](v10, "addSubview:", v8);
    -[SBFolderScrollAccessoryView _setUpAnimation](v10, "_setUpAnimation");
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBFolderScrollAccessoryView modeAnimatableProperty](self, "modeAnimatableProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SBFolderScrollAccessoryView;
  -[SBFolderScrollAccessoryView dealloc](&v4, sel_dealloc);
}

- (void)setAuxiliaryView:(id)a3
{
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;

  v5 = (UIView *)a3;
  if (self->_auxiliaryView != v5)
  {
    v14 = v5;
    -[SBFolderScrollAccessoryView _clearMatchingAnimationsForAuxiliaryView](self, "_clearMatchingAnimationsForAuxiliaryView");
    -[UIView removeFromSuperview](self->_auxiliaryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_auxiliaryView, a3);
    -[SBFolderScrollAccessoryView pageControl](self, "pageControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v14)
    {
      -[SBFolderScrollAccessoryView addSubview:](self, "addSubview:");
      v8 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 11.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "systemImageNamed:withConfiguration:", CFSTR("circlebadge.fill"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setPreferredIndicatorImage:", v10);
      objc_msgSend(v7, "subviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        -[SBFolderScrollAccessoryView _applyMatchingAnimationsForAuxiliaryViewMatchingContentView:](self, "_applyMatchingAnimationsForAuxiliaryViewMatchingContentView:", v12);
      -[UIView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
      -[SBFolderScrollAccessoryView _updateForModePropertyChanged](self, "_updateForModePropertyChanged");
      -[SBFolderScrollAccessoryView _layoutPageControlMatchingPageControl:](self, "_layoutPageControlMatchingPageControl:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderScrollAccessoryView setLayoutPageControl:](self, "setLayoutPageControl:", v13);

    }
    else
    {
      objc_msgSend(v6, "setPreferredIndicatorImage:");
      -[SBFolderScrollAccessoryView setLayoutPageControl:](self, "setLayoutPageControl:", 0);
    }

    v5 = v14;
  }

}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundView;
  char v7;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v7 = objc_msgSend(MEMORY[0x1E0DA9F10], "isRunningXCTest");
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      -[SBFolderScrollAccessoryView pageControl](self, "pageControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setPlatterBackgroundView:", *p_backgroundView);

      v5 = v9;
    }
  }

}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[SBFolderScrollAccessoryView _applyCurrentMode](self, "_applyCurrentMode");
  }
}

- (void)_setUpAnimation
{
  SBFFluidBehaviorSettings *v3;
  SBFFluidBehaviorSettings *pageControlFadeInSettings;
  SBFFluidBehaviorSettings *v5;
  SBFFluidBehaviorSettings *v6;
  SBFFluidBehaviorSettings *auxiliaryViewFadeInSettings;
  SBFFluidBehaviorSettings *v8;
  UIViewFloatAnimatableProperty *v9;
  UIViewFloatAnimatableProperty **p_modeAnimatableProperty;
  UIViewFloatAnimatableProperty *modeAnimatableProperty;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD v17[2];
  CAFrameRateRange v18;
  CAFrameRateRange v19;

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E0DA9E08]);
  pageControlFadeInSettings = self->_pageControlFadeInSettings;
  self->_pageControlFadeInSettings = v3;

  -[SBFFluidBehaviorSettings setDampingRatio:](self->_pageControlFadeInSettings, "setDampingRatio:", 0.6529);
  -[SBFFluidBehaviorSettings setResponse:](self->_pageControlFadeInSettings, "setResponse:", 0.4558);
  v5 = self->_pageControlFadeInSettings;
  v18 = CAFrameRateRangeMake(20.0, 120.0, 30.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v5, "setFrameRateRange:highFrameRateReason:", 1114139, *(double *)&v18.minimum, *(double *)&v18.maximum, *(double *)&v18.preferred);
  v6 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E0DA9E08]);
  auxiliaryViewFadeInSettings = self->_auxiliaryViewFadeInSettings;
  self->_auxiliaryViewFadeInSettings = v6;

  -[SBFFluidBehaviorSettings setDampingRatio:](self->_auxiliaryViewFadeInSettings, "setDampingRatio:", 1.2883);
  -[SBFFluidBehaviorSettings setResponse:](self->_auxiliaryViewFadeInSettings, "setResponse:", 0.3598);
  v8 = self->_auxiliaryViewFadeInSettings;
  v19 = CAFrameRateRangeMake(20.0, 120.0, 30.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v8, "setFrameRateRange:highFrameRateReason:", 1114139, *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
  v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0DC3F30]);
  p_modeAnimatableProperty = &self->_modeAnimatableProperty;
  modeAnimatableProperty = self->_modeAnimatableProperty;
  self->_modeAnimatableProperty = v9;

  -[UIViewFloatAnimatableProperty setValue:](self->_modeAnimatableProperty, "setValue:", 0.0);
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v17[0] = *p_modeAnimatableProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__SBFolderScrollAccessoryView__setUpAnimation__block_invoke;
  v14[3] = &unk_1E8D88B98;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v12, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_applyCurrentMode
{
  int64_t v3;
  void *v4;
  _QWORD v5[5];
  BOOL v6;

  v3 = -[SBFolderScrollAccessoryView mode](self, "mode");
  if (v3)
    -[SBFolderScrollAccessoryView auxiliaryViewFadeInSettings](self, "auxiliaryViewFadeInSettings");
  else
    -[SBFolderScrollAccessoryView pageControlFadeInSettings](self, "pageControlFadeInSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SBFolderScrollAccessoryView__applyCurrentMode__block_invoke;
  v5[3] = &unk_1E8D85BB8;
  v6 = v3 == 0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "sb_animateWithSettings:mode:animations:completion:", v4, 3, v5, 0);

}

void __48__SBFolderScrollAccessoryView__applyCurrentMode__block_invoke(uint64_t a1)
{
  int v1;
  void *v2;
  double v3;
  id v4;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "modeAnimatableProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 0.0;
  if (!v1)
    v3 = 1.0;
  objc_msgSend(v2, "setValue:", v3);

}

- (id)_layoutPageControlMatchingPageControl:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = (objc_class *)MEMORY[0x1E0DC3A88];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setHidden:", 1);
  objc_msgSend(v4, "preferredIndicatorImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredIndicatorImage:", v6);

  v7 = objc_msgSend(v4, "backgroundStyle");
  objc_msgSend(v5, "setBackgroundStyle:", v7);
  objc_msgSend(v5, "_setCustomHorizontalPadding:", 0.0);
  objc_msgSend(v5, "_setCustomVerticalPadding:", 0.0);
  return v5;
}

- (void)_clearMatchingAnimationsForAuxiliaryView
{
  void *v2;
  id v3;

  -[SBFolderScrollAccessoryView auxiliaryView](self, "auxiliaryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("SBFolderScrollAccessoryAuxiliaryViewMatchMoveAnimation"));
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("SBFolderScrollAccessoryAuxiliaryViewScaleAnimation"));

}

- (void)_applyMatchingAnimationsForAuxiliaryViewMatchingContentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFolderScrollAccessoryView auxiliaryView](self, "auxiliaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0CD27C0]);
  objc_msgSend(v8, "setSourceLayer:", v7);
  objc_msgSend(v8, "setUsesNormalizedCoordinates:", 1);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.5, 0.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourcePoints:", v10);

  objc_msgSend(v8, "setDuration:", INFINITY);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "addAnimation:forKey:", v8, CFSTR("SBFolderScrollAccessoryAuxiliaryViewMatchMoveAnimation"));
  v11 = objc_alloc_init(MEMORY[0x1E0CD27C8]);
  objc_msgSend(v11, "setSourceLayer:", v7);
  objc_msgSend(v11, "setKeyPath:", CFSTR("transform"));
  objc_msgSend(v11, "setAdditive:", 1);
  objc_msgSend(v11, "setDuration:", INFINITY);
  objc_msgSend(v11, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "addAnimation:forKey:", v11, CFSTR("SBFolderScrollAccessoryAuxiliaryViewScaleAnimation"));

}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setLayoutPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_layoutPageControl, a3);
}

- (SBFFluidBehaviorSettings)pageControlFadeInSettings
{
  return self->_pageControlFadeInSettings;
}

- (SBFFluidBehaviorSettings)auxiliaryViewFadeInSettings
{
  return self->_auxiliaryViewFadeInSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryViewFadeInSettings, 0);
  objc_storeStrong((id *)&self->_pageControlFadeInSettings, 0);
  objc_storeStrong((id *)&self->_modeAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_layoutPageControl, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_auxiliaryView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
