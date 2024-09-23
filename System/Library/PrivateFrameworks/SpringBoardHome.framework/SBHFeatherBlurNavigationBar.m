@implementation SBHFeatherBlurNavigationBar

- (SBHFeatherBlurNavigationBar)initWithFrame:(CGRect)a3
{
  SBHFeatherBlurNavigationBar *v3;
  uint64_t v4;
  SBFFeatherBlurView *featherBlurBackgroundView;
  uint64_t v6;
  UILabel *featherBlurTitleLabel;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBHFeatherBlurNavigationBar;
  v3 = -[SBHFeatherBlurNavigationBar initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E00]), "initWithRecipe:", 2);
    featherBlurBackgroundView = v3->_featherBlurBackgroundView;
    v3->_featherBlurBackgroundView = (SBFFeatherBlurView *)v4;

    -[SBHFeatherBlurNavigationBar _setBackgroundView:](v3, "_setBackgroundView:", v3->_featherBlurBackgroundView);
    v6 = objc_opt_new();
    featherBlurTitleLabel = v3->_featherBlurTitleLabel;
    v3->_featherBlurTitleLabel = (UILabel *)v6;

    -[UILabel setAlpha:](v3->_featherBlurTitleLabel, "setAlpha:", 0.0);
    -[SBHFeatherBlurNavigationBar addSubview:](v3, "addSubview:", v3->_featherBlurTitleLabel);
    -[SBHFeatherBlurNavigationBar setOverrideUserInterfaceStyle:](v3, "setOverrideUserInterfaceStyle:", 2);
    -[SBHFeatherBlurNavigationBar setPrefersLargeTitles:](v3, "setPrefersLargeTitles:", 1);
    -[SBHFeatherBlurNavigationBar _updateAppearance](v3, "_updateAppearance");
    -[SBHFeatherBlurNavigationBar _updateLabel](v3, "_updateLabel");
    -[SBHFeatherBlurNavigationBar _updateHeights](v3, "_updateHeights");
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[SBHFeatherBlurNavigationBar registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v9, sel__updateAppearanceAfterTraitChange);

  }
  return v3;
}

- (int64_t)barPosition
{
  return 2;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  SBFFeatherBlurView *featherBlurBackgroundView;
  void *v13;
  void *v14;
  UILabel *featherBlurTitleLabel;
  id WeakRetained;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBHFeatherBlurNavigationBar;
  -[SBHFeatherBlurNavigationBar layoutSubviews](&v18, sel_layoutSubviews);
  -[SBHFeatherBlurNavigationBar _updateHeights](self, "_updateHeights");
  -[SBHFeatherBlurNavigationBar _updateLabel](self, "_updateLabel");
  -[SBHFeatherBlurNavigationBar _calculateCompactNavBarFrame](self, "_calculateCompactNavBarFrame");
  -[SBHFeatherBlurNavigationBar _calculateFeatherBlurBackgroundViewFrame](self, "_calculateFeatherBlurBackgroundViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFFeatherBlurView setFrame:](self->_featherBlurBackgroundView, "setFrame:");
  -[SBFFeatherBlurView window](self->_featherBlurBackgroundView, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  featherBlurBackgroundView = self->_featherBlurBackgroundView;
  if (v11)
  {
    -[SBFFeatherBlurView bounds](self->_featherBlurBackgroundView, "bounds");
    -[SBFFeatherBlurView convertRect:toCoordinateSpace:](featherBlurBackgroundView, "convertRect:toCoordinateSpace:", v11);
    objc_msgSend(MEMORY[0x1E0DA9E00], "matchMoveAnimationForFrame:relativeToView:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFFeatherBlurView layer](self->_featherBlurBackgroundView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAnimation:forKey:", v13, CFSTR("SBHFeatherBlurNavigationBarMatchMoveAnimation"));

  }
  else
  {
    -[SBFFeatherBlurView layer](self->_featherBlurBackgroundView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAnimationForKey:", CFSTR("SBHFeatherBlurNavigationBarMatchMoveAnimation"));
  }

  featherBlurTitleLabel = self->_featherBlurTitleLabel;
  -[UILabel frame](featherBlurTitleLabel, "frame");
  UIRectCenteredRect();
  -[UILabel setFrame:](featherBlurTitleLabel, "setFrame:");
  -[SBHFeatherBlurNavigationBar bringSubviewToFront:](self, "bringSubviewToFront:", self->_featherBlurBackgroundView);
  -[SBHFeatherBlurNavigationBar bringSubviewToFront:](self, "bringSubviewToFront:", self->_featherBlurTitleLabel);
  self->_gradientMaskFrame.origin.x = v4;
  self->_gradientMaskFrame.origin.y = v6;
  self->_gradientMaskFrame.size.width = v8;
  self->_gradientMaskFrame.size.height = v10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_capturedTinyTextLabelContainerView);
  objc_msgSend(WeakRetained, "setHidden:", 1);
  v17 = objc_loadWeakRetained((id *)&self->_capturedLargeTextLabelContainerView);
  objc_msgSend(v17, "setClipsToBounds:", 0);
  -[SBHFeatherBlurNavigationBar _updateLabelAlphas](self, "_updateLabelAlphas");

}

- (void)setHidesFeatherBlur:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if (self->_hidesFeatherBlur != a3)
  {
    self->_hidesFeatherBlur = a3;
    -[SBHFeatherBlurNavigationBar superview](self, "superview");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[SBHFeatherBlurNavigationBar window](self, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        -[SBHFeatherBlurNavigationBar _updateAppearanceAfterTraitChange](self, "_updateAppearanceAfterTraitChange");
    }
  }
}

- (id)_capturedTinyTextLabelContainerView
{
  void *v3;
  void *v4;

  if (_capturedTinyTextLabelContainerView_onceToken != -1)
    dispatch_once(&_capturedTinyTextLabelContainerView_onceToken, &__block_literal_global_44);
  -[SBHFeatherBlurNavigationBar subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_firstObjectOfClass:", _capturedTinyTextLabelContainerView_tinyTextClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

Class __66__SBHFeatherBlurNavigationBar__capturedTinyTextLabelContainerView__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("_UINavigationBarContentView"));
  _capturedTinyTextLabelContainerView_tinyTextClass = (uint64_t)result;
  return result;
}

- (id)_capturedLargeTextLabelContainerView
{
  void *v3;
  void *v4;

  if (_capturedLargeTextLabelContainerView_onceToken != -1)
    dispatch_once(&_capturedLargeTextLabelContainerView_onceToken, &__block_literal_global_11_2);
  -[SBHFeatherBlurNavigationBar subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_firstObjectOfClass:", _capturedLargeTextLabelContainerView_largeTextClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

Class __67__SBHFeatherBlurNavigationBar__capturedLargeTextLabelContainerView__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("_UINavigationBarLargeTitleView"));
  _capturedLargeTextLabelContainerView_largeTextClass = (uint64_t)result;
  return result;
}

- (CGRect)_calculateFeatherBlurBackgroundViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[SBHFeatherBlurNavigationBar _topMargin](self, "_topMargin");
  v4 = v3;
  -[SBHFeatherBlurNavigationBar bounds](self, "bounds");
  v6 = -v4;
  v7 = v4 + self->_sb_minimumNavbarHeight + 10.0;
  v8 = 0.0;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v8;
  return result;
}

- (CGRect)_calculateCompactNavBarFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[SBHFeatherBlurNavigationBar bounds](self, "bounds");
  v4 = v3;
  -[SBHFeatherBlurNavigationBar _defaultHeightForMetrics](self, "_defaultHeightForMetrics");
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)_updateHeights
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;

  -[SBHFeatherBlurNavigationBar _defaultHeightForMetrics](self, "_defaultHeightForMetrics");
  self->_sb_minimumNavbarHeight = v3;
  if (!self->_configuredForItem)
  {
    -[SBHFeatherBlurNavigationBar items](self, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[SBHFeatherBlurNavigationBar _updateAppearance](self, "_updateAppearance");
      -[SBHFeatherBlurNavigationBar _updateLabel](self, "_updateLabel");
    }
  }
  self->_sb_maximumNavbarHeight = self->_sb_minimumNavbarHeight + self->_largeTextHeight;
  -[SBHFeatherBlurNavigationBar _topMargin](self, "_topMargin");
  self->_sb_maximumNavbarHeight = v6 + self->_sb_maximumNavbarHeight;
  self->_sb_minimumNavbarHeight = v6 + self->_sb_minimumNavbarHeight;
}

- (double)_topMargin
{
  double v3;
  void *v4;
  double v5;

  v3 = 20.0;
  if (!SBHIsHomeButtonDevice())
  {
    -[SBHFeatherBlurNavigationBar window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeAreaInsets");
    v3 = v5;

  }
  return v3;
}

- (void)_updateAppearance
{
  UINavigationBarAppearance *v3;
  UINavigationBarAppearance *barAppearance;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v3 = (UINavigationBarAppearance *)objc_alloc_init(MEMORY[0x1E0DC3A30]);
  barAppearance = self->_barAppearance;
  self->_barAppearance = v3;

  -[UINavigationBarAppearance configureWithTransparentBackground](self->_barAppearance, "configureWithTransparentBackground");
  -[UINavigationBarAppearance largeTitleTextAttributes](self->_barAppearance, "largeTitleTextAttributes");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationBarAppearance titleTextAttributes](self->_barAppearance, "titleTextAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHFeatherBlurNavigationBar traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48B8]);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC48C0]);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v6);
    v16 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v6);
    v17 = v15;

    v18 = v16;
    -[UINavigationBarAppearance setTitleTextAttributes:](self->_barAppearance, "setTitleTextAttributes:", v18);

    -[UINavigationBarAppearance setLargeTitleTextAttributes:](self->_barAppearance, "setLargeTitleTextAttributes:", v17);
    v7 = (void *)v13;
    v8 = (void *)v14;
    v9 = (void *)v12;
    v5 = v18;
    v19 = v17;
  }
  -[SBHFeatherBlurNavigationBar setScrollEdgeAppearance:](self, "setScrollEdgeAppearance:", self->_barAppearance);
  -[SBHFeatherBlurNavigationBar setStandardAppearance:](self, "setStandardAppearance:", self->_barAppearance);
  -[SBHFeatherBlurNavigationBar setCompactAppearance:](self, "setCompactAppearance:", self->_barAppearance);
  -[SBFFeatherBlurView setHidden:](self->_featherBlurBackgroundView, "setHidden:", self->_hidesFeatherBlur);

}

- (void)_updateLabel
{
  double width;
  void *v4;
  UILabel *featherBlurTitleLabel;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  float v19;
  id WeakRetained;
  void *v21;
  UIView **p_capturedLargeTextLabelContainerView;
  id v23;
  void *v24;
  UINavigationItem *obj;
  CGRect v26;

  -[SBHFeatherBlurNavigationBar bounds](self, "bounds");
  width = v26.size.width;
  if (!CGRectIsEmpty(v26))
  {
    -[SBHFeatherBlurNavigationBar items](self, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    obj = (UINavigationItem *)objc_claimAutoreleasedReturnValue();

    if (obj && self->_configuredForItem != obj)
    {
      featherBlurTitleLabel = self->_featherBlurTitleLabel;
      v6 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[UINavigationItem title](obj, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationBarAppearance titleTextAttributes](self->_barAppearance, "titleTextAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v8);
      -[UILabel setAttributedText:](featherBlurTitleLabel, "setAttributedText:", v9);

      -[UILabel sizeToFit](self->_featherBlurTitleLabel, "sizeToFit");
      objc_storeStrong((id *)&self->_configuredForItem, obj);
      -[UINavigationBarAppearance largeTitleTextAttributes](self->_barAppearance, "largeTitleTextAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descender");
      v13 = v12;
      objc_msgSend(v11, "lineHeight");
      v15 = v13 + v14;
      -[UINavigationItem title](obj, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, width, 1.79769313e308);
      v18 = v17;

      v19 = v18 / v15;
      self->_largeTextHeight = v15 * (double)vcvtps_u32_f32(v19);
      objc_storeWeak((id *)&self->_capturedTinyTextLabelContainerView, 0);
      objc_storeWeak((id *)&self->_capturedLargeTextLabelContainerView, 0);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_capturedTinyTextLabelContainerView);
    if (!WeakRetained)
    {
      -[SBHFeatherBlurNavigationBar _capturedTinyTextLabelContainerView](self, "_capturedTinyTextLabelContainerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_capturedTinyTextLabelContainerView, v21);

    }
    p_capturedLargeTextLabelContainerView = &self->_capturedLargeTextLabelContainerView;
    v23 = objc_loadWeakRetained((id *)&self->_capturedLargeTextLabelContainerView);
    if (!v23)
    {
      -[SBHFeatherBlurNavigationBar _capturedLargeTextLabelContainerView](self, "_capturedLargeTextLabelContainerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)p_capturedLargeTextLabelContainerView, v24);

    }
  }
}

- (void)_updateAppearanceAfterTraitChange
{
  -[SBHFeatherBlurNavigationBar _updateAppearance](self, "_updateAppearance");
  -[SBHFeatherBlurNavigationBar _updateLabel](self, "_updateLabel");
  -[SBHFeatherBlurNavigationBar _updateHeights](self, "_updateHeights");
  -[SBHFeatherBlurNavigationBar setNeedsLayout](self, "setNeedsLayout");
  -[SBHFeatherBlurNavigationBar layoutIfNeeded](self, "layoutIfNeeded");
}

- (double)_defaultHeightForMetrics
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHFeatherBlurNavigationBar;
  -[SBHFeatherBlurNavigationBar defaultHeightForMetrics:](&v3, sel_defaultHeightForMetrics_, 0);
  return result;
}

- (void)_updateLabelAlphas
{
  UIView **p_capturedLargeTextLabelContainerView;
  id WeakRetained;
  double v5;
  double v6;
  double sb_minimumNavbarHeight;
  double v8;
  double v9;
  void *v10;
  void *v11;
  BOOL v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD aBlock[5];
  id v17;
  BOOL v18;

  p_capturedLargeTextLabelContainerView = &self->_capturedLargeTextLabelContainerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_capturedLargeTextLabelContainerView);
  if (WeakRetained
    || (-[SBHFeatherBlurNavigationBar _updateLabel](self, "_updateLabel"),
        (WeakRetained = objc_loadWeakRetained((id *)p_capturedLargeTextLabelContainerView)) != 0))
  {
    objc_msgSend(WeakRetained, "frame");
    v6 = v5;
    sb_minimumNavbarHeight = self->_sb_minimumNavbarHeight;
    -[SBHFeatherBlurNavigationBar _topMargin](self, "_topMargin");
    v9 = v8;
    -[SBHFeatherBlurNavigationBar superview](self, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SBHFeatherBlurNavigationBar window](self, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6 <= sb_minimumNavbarHeight - v9 && v11 != 0;

    }
    else
    {
      v13 = 0;
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__SBHFeatherBlurNavigationBar__updateLabelAlphas__block_invoke;
    aBlock[3] = &unk_1E8D89918;
    aBlock[4] = self;
    v18 = v13;
    v14 = WeakRetained;
    v17 = v14;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled") && self->_allowsAnimatedUpdating)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v15, 0, 0.2, 0.0);
    else
      v15[2](v15);

  }
}

uint64_t __49__SBHFeatherBlurNavigationBar__updateLabelAlphas__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 648);
  if (*(_BYTE *)(a1 + 48))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);
  if (*(_BYTE *)(a1 + 48))
    v4 = 0.0;
  else
    v4 = 1.0;
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v4);
}

- (SBFFeatherBlurView)featherBlurBackgroundView
{
  return self->_featherBlurBackgroundView;
}

- (void)setFeatherBlurBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_featherBlurBackgroundView, a3);
}

- (CGRect)gradientMaskFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gradientMaskFrame.origin.x;
  y = self->_gradientMaskFrame.origin.y;
  width = self->_gradientMaskFrame.size.width;
  height = self->_gradientMaskFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)sb_minimumNavbarHeight
{
  return self->_sb_minimumNavbarHeight;
}

- (double)sb_maximumNavbarHeight
{
  return self->_sb_maximumNavbarHeight;
}

- (BOOL)allowsAnimatedUpdating
{
  return self->_allowsAnimatedUpdating;
}

- (void)setAllowsAnimatedUpdating:(BOOL)a3
{
  self->_allowsAnimatedUpdating = a3;
}

- (BOOL)hidesFeatherBlur
{
  return self->_hidesFeatherBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featherBlurBackgroundView, 0);
  objc_destroyWeak((id *)&self->_capturedTinyTextLabelContainerView);
  objc_destroyWeak((id *)&self->_capturedLargeTextLabelContainerView);
  objc_storeStrong((id *)&self->_maskLayers, 0);
  objc_storeStrong((id *)&self->_configuredForItem, 0);
  objc_storeStrong((id *)&self->_featherBlurTitleLabel, 0);
  objc_storeStrong((id *)&self->_barAppearance, 0);
}

@end
