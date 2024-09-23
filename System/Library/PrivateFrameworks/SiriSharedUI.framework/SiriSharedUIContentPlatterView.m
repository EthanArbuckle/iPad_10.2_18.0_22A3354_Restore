@implementation SiriSharedUIContentPlatterView

- (SiriSharedUIContentPlatterView)initWithFrame:(CGRect)a3
{
  SiriSharedUIContentPlatterView *v3;
  SiriSharedUIContentPlatterScrollView *v4;
  SiriSharedUIContentPlatterScrollView *scrollView;
  SiriSharedUIContentPlatterDarkenMaskView *v6;
  SiriSharedUIContentPlatterDarkenMaskView *darkenMaskView;
  SiriSharedUIStandardView *v8;
  uint64_t v9;
  SiriSharedUIStandardView *contentHostingView;
  uint64_t v11;
  PLPlatterView *platterView;
  void *v13;
  void *v14;
  SiriSharedUIStandardView *v15;
  void *v16;
  SiriSharedUIContentPlatterScrollView *v17;
  SiriSharedUIContentPlatterDarkenMaskView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SiriSharedUIContentPlatterView;
  v3 = -[SiriSharedUIContentPlatterView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SiriSharedUIContentPlatterScrollView);
    scrollView = v3->_scrollView;
    v3->_scrollView = v4;

    -[SiriSharedUIContentPlatterScrollView setDelegate:](v3->_scrollView, "setDelegate:", v3);
    -[SiriSharedUIContentPlatterScrollView setPlatterDelegate:](v3->_scrollView, "setPlatterDelegate:", v3);
    v3->_supportsSAE = AFDeviceSupportsSystemAssistantExperience();
    -[SiriSharedUIContentPlatterScrollView setKeyboardDismissMode:](v3->_scrollView, "setKeyboardDismissMode:", 2);
    v3->_reducedOrbOpacity = 0;
    v6 = objc_alloc_init(SiriSharedUIContentPlatterDarkenMaskView);
    darkenMaskView = v3->_darkenMaskView;
    v3->_darkenMaskView = v6;

    v8 = [SiriSharedUIStandardView alloc];
    v9 = -[SiriSharedUIStandardView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    contentHostingView = v3->_contentHostingView;
    v3->_contentHostingView = (SiriSharedUIStandardView *)v9;

    objc_msgSend(MEMORY[0x1E0D7D3F0], "platterViewWithBlurEffectStyle:", 9);
    v11 = objc_claimAutoreleasedReturnValue();
    platterView = v3->_platterView;
    v3->_platterView = (PLPlatterView *)v11;

    -[PLPlatterView _setContinuousCornerRadius:](v3->_platterView, "_setContinuousCornerRadius:", 23.5);
    -[SiriSharedUIContentPlatterView platterView](v3, "platterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentPlatterView addSubview:](v3, "addSubview:", v13);

    -[SiriSharedUIContentPlatterView _contentHostingView](v3, "_contentHostingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentPlatterView addSubview:](v3, "addSubview:", v14);

    v15 = v3->_contentHostingView;
    -[SiriSharedUIContentPlatterView _scrollView](v3, "_scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIStandardView addSubview:](v15, "addSubview:", v16);

    v17 = v3->_scrollView;
    -[PLPlatterView _continuousCornerRadius](v3->_platterView, "_continuousCornerRadius");
    -[SiriSharedUIContentPlatterScrollView _setContinuousCornerRadius:](v17, "_setContinuousCornerRadius:");
    v18 = v3->_darkenMaskView;
    -[PLPlatterView _continuousCornerRadius](v3->_platterView, "_continuousCornerRadius");
    -[SiriSharedUIContentPlatterDarkenMaskView _setContinuousCornerRadius:](v18, "_setContinuousCornerRadius:");
    -[PLPlatterView customContentView](v3->_platterView, "customContentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v3->_darkenMaskView);

    -[SiriSharedUIContentPlatterView _scrollView](v3, "_scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v21);

    -[SiriSharedUIContentPlatterView _scrollView](v3, "_scrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShowsVerticalScrollIndicator:", 0);

    -[SiriSharedUIContentPlatterView _scrollView](v3, "_scrollView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentInsetAdjustmentBehavior:", 2);

    -[SiriSharedUIContentPlatterView setScrollEnabled:](v3, "setScrollEnabled:", 1);
  }
  return v3;
}

- (void)setBackgroundView:(id)a3
{
  id v4;
  void *v5;
  SiriSharedUIContentPlatterScrollView *scrollView;
  SiriSharedUIContentPlatterDarkenMaskView *darkenMaskView;

  v4 = a3;
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 23.5);

  -[PLPlatterView setBackgroundView:](self->_platterView, "setBackgroundView:", v4);
  scrollView = self->_scrollView;
  -[PLPlatterView _continuousCornerRadius](self->_platterView, "_continuousCornerRadius");
  -[SiriSharedUIContentPlatterScrollView _setContinuousCornerRadius:](scrollView, "_setContinuousCornerRadius:");
  darkenMaskView = self->_darkenMaskView;
  -[PLPlatterView _continuousCornerRadius](self->_platterView, "_continuousCornerRadius");
  -[SiriSharedUIContentPlatterDarkenMaskView _setContinuousCornerRadius:](darkenMaskView, "_setContinuousCornerRadius:");
  -[SiriSharedUIContentPlatterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNeedsLayout
{
  objc_super v3;

  -[SiriSharedUIContentPlatterView _setPlatterNeedsLayout:](self, "_setPlatterNeedsLayout:", 1);
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUIContentPlatterView;
  -[SiriSharedUIContentPlatterView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[SiriSharedUIContentPlatterView _updateContentScale](self, "_updateContentScale");
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SiriSharedUIContentPlatterView;
    v5 = -[SiriSharedUIContentPlatterView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_updateContentScale
{
  uint64_t *v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
  {
    if (self->_isInAmbientInteractivity)
      v3 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v3 = &SiriSharedUICompactAmbientContentScaleAmount;
    v4 = *(double *)v3;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v4 * v6;

    +[SiriSharedUIContentScaleFactorUtility siriSharedUIApplyContentScale:toView:](SiriSharedUIContentScaleFactorUtility, "siriSharedUIApplyContentScale:toView:", self->_contentHostingView, v7);
  }
}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL8 isNextLevelCard;

  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    if (a3)
    {
      -[PLPlatterView removeFromSuperview](self->_platterView, "removeFromSuperview");
      -[SiriSharedUIContentPlatterView setScrollEnabled:](self, "setScrollEnabled:", self->_isNextLevelCard);
      isNextLevelCard = self->_isNextLevelCard;
    }
    else
    {
      -[SiriSharedUIContentPlatterView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_platterView, self->_contentHostingView);
      isNextLevelCard = 1;
      -[SiriSharedUIContentPlatterView setScrollEnabled:](self, "setScrollEnabled:", 1);
    }
    -[SiriSharedUIContentPlatterScrollView setBounces:](self->_scrollView, "setBounces:", isNextLevelCard);
    -[SiriSharedUIContentPlatterView _updateContentViewTransformationForAmbientUpdate](self, "_updateContentViewTransformationForAmbientUpdate");
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  id v4;

  self->_isInAmbientInteractivity = a3;
  -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsInAmbientInteractivity:", self->_isInAmbientInteractivity);

}

- (void)setAllowAutomaticContentViewsScaling:(BOOL)a3
{
  if (self->_allowAutomaticContentViewsScaling != a3)
  {
    self->_allowAutomaticContentViewsScaling = a3;
    -[SiriSharedUIContentPlatterView _updateContentViewTransformationForAmbientUpdate](self, "_updateContentViewTransformationForAmbientUpdate");
  }
}

- (void)_updateContentViewTransformationForAmbientUpdate
{
  uint64_t *v2;
  SiriSharedUIStandardView *contentHostingView;
  CGAffineTransform *v4;
  SiriSharedUIStandardView *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;

  if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
  {
    if (self->_isInAmbientInteractivity)
      v2 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v2 = &SiriSharedUICompactAmbientContentScaleAmount;
    contentHostingView = self->_contentHostingView;
    CGAffineTransformMakeScale(&v10, *(CGFloat *)v2, *(CGFloat *)v2);
    v4 = &v10;
    v5 = contentHostingView;
  }
  else
  {
    v5 = self->_contentHostingView;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7 = *MEMORY[0x1E0C9BAA8];
    v8 = v6;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v4 = (CGAffineTransform *)&v7;
  }
  -[SiriSharedUIStandardView setTransform:](v5, "setTransform:", v4, v7, v8, v9);
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
  double v12;
  double v13;
  double v14;
  void *v15;
  _BOOL4 makeBackgroundPlatterTransparent;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGFloat v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)SiriSharedUIContentPlatterView;
  -[SiriSharedUIContentPlatterView layoutSubviews](&v28, sel_layoutSubviews);
  if (-[SiriSharedUIContentPlatterView _platterNeedsLayout](self, "_platterNeedsLayout"))
  {
    -[SiriSharedUIContentPlatterView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SiriSharedUIContentPlatterView platterView](self, "platterView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    if (self->_supportsSAE)
    {
      -[SiriSharedUIContentPlatterView safeAreaInsets](self, "safeAreaInsets");
      v13 = v12;
      v14 = v10 - v12;
      -[PLPlatterView backgroundMaterialView](self->_platterView, "backgroundMaterialView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        makeBackgroundPlatterTransparent = self->_makeBackgroundPlatterTransparent;

        if (makeBackgroundPlatterTransparent)
        {
          -[PLPlatterView backgroundMaterialView](self->_platterView, "backgroundMaterialView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAlpha:", 0.0);

          -[PLPlatterView backgroundView](self->_platterView, "backgroundView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setAlpha:", 0.0);

          -[PLPlatterView setHasShadow:](self->_platterView, "setHasShadow:", 0);
        }
      }
    }
    else
    {
      v14 = v10;
      v13 = v6;
    }
    -[SiriSharedUIContentPlatterView _contentHostingView](self, "_contentHostingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v4, v13, v8, v14);

    if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
    {
      -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29.origin.x = v4;
      v29.origin.y = v6;
      v29.size.width = v8;
      v29.size.height = v10;
      v21 = CGRectGetWidth(v29) * 0.5;
      v30.origin.x = v4;
      v30.origin.y = v6;
      v30.size.width = v8;
      v30.size.height = v10;
      objc_msgSend(v20, "setFrame:", 0.0, 0.0, v21, CGRectGetHeight(v30) * 0.5);
    }
    else
    {
      -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUIContentPlatterView _contentHostingView](self, "_contentHostingView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      objc_msgSend(v20, "setFrame:");

    }
    v23 = v14 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v8 == *MEMORY[0x1E0C9D820];
    -[SiriSharedUIContentPlatterView platterView](self, "platterView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", v23);

    -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNeedsLayout");

    -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutIfNeeded");

    -[SiriSharedUIContentPlatterView _updateContentFullyScrolled](self, "_updateContentFullyScrolled");
    -[SiriSharedUIContentPlatterView _darkenMaskView](self, "_darkenMaskView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v4, v6, v8, v10);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SiriSharedUIContentPlatterView contentViews](self, "contentViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "sizeThatFits:", width, height);
        v5 = v5 + v13;
        if (v6 <= v12)
          v6 = v12;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = v6;
  v15 = v5;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)heightForContentSeparators
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SiriSharedUIContentPlatterView contentViews](self, "contentViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "intrinsicContentSize");
          v6 = v6 + v9;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)prepareForDrillInAnimation
{
  self->_makeBackgroundPlatterTransparent = 1;
}

- (BOOL)isScrollEnabled
{
  void *v2;
  char v3;

  -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutomaticScrollingEnabled");

  return v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticScrollingEnabled:", v3);

}

- (void)setContentViews:(id)a3
{
  NSArray *v5;
  NSArray *contentViews;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  contentViews = self->_contentViews;
  if (contentViews != v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = contentViews;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "removeFromSuperview");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_contentViews, a3);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = self->_contentViews;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
          -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView", (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addSubview:", v17);

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

    -[SiriSharedUIContentPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets *p_contentInsets;
  void *v8;

  p_contentInsets = &self->_contentInsets;
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    p_contentInsets->top = a3.top;
    self->_contentInsets.left = a3.left;
    self->_contentInsets.bottom = a3.bottom;
    self->_contentInsets.right = a3.right;
    -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentInset:", p_contentInsets->top, p_contentInsets->left, p_contentInsets->bottom, p_contentInsets->right);

    -[SiriSharedUIContentPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDismissalGestureRecognizer:(id)a3
{
  SiriSharedUIPanDismissalGestureRecognizer *v5;

  v5 = (SiriSharedUIPanDismissalGestureRecognizer *)a3;
  if (self->_dismissalGestureRecognizer != v5)
  {
    objc_storeStrong((id *)&self->_dismissalGestureRecognizer, a3);
    -[SiriSharedUIContentPlatterView addGestureRecognizer:](self, "addGestureRecognizer:", v5);
  }

}

- (void)setDarkenIntensity:(double)a3
{
  double v5;
  id v6;

  -[SiriSharedUIContentPlatterView darkenIntensity](self, "darkenIntensity");
  if (v5 != a3)
  {
    -[SiriSharedUIContentPlatterView _darkenMaskView](self, "_darkenMaskView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", a3 * 0.3);

  }
}

- (double)darkenIntensity
{
  void *v2;
  double v3;
  double v4;

  -[SiriSharedUIContentPlatterView _darkenMaskView](self, "_darkenMaskView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 / 0.3;

  return v4;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  SiriSharedUIContentPlatterView *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
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
  double v30;
  double v31;
  double v32;
  double v33;
  PLPlatterView *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  float v40;
  float v41;
  _BOOL8 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double Height;
  PLPlatterView *platterView;
  double Width;
  void *v52;
  SiriSharedUIContentPlatterView *v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v53 = (SiriSharedUIContentPlatterView *)a3;
  -[SiriSharedUIContentPlatterView _contentOffsetForScrollView:](self, "_contentOffsetForScrollView:");
  v5 = v4;
  v7 = v6;
  -[SiriSharedUIContentPlatterView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentPlatterView:didScrollWithContentOffset:", self, v5, v7);

  -[SiriSharedUIContentPlatterView _currentContentOffset](self, "_currentContentOffset");
  v10 = v9;
  if (self->_supportsSAE)
    v11 = v53;
  else
    v11 = self;
  -[SiriSharedUIContentPlatterView bounds](v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SiriSharedUIContentPlatterView _contentInsetForScrollView:](self, "_contentInsetForScrollView:", v53);
  v21 = v20;
  v23 = v22;
  -[SiriSharedUIContentPlatterView _contentSizeForScrollView:](self, "_contentSizeForScrollView:", v53);
  v25 = v21 + v24;
  v54.origin.x = v13;
  v54.origin.y = v15;
  v54.size.width = v17;
  v54.size.height = v19;
  v26 = v25 - CGRectGetHeight(v54);
  if (v7 >= v10)
  {
    if (v7 > 0.0)
    {
      if (v7 < v26)
      {
        -[PLPlatterView bounds](self->_platterView, "bounds");
        Height = CGRectGetHeight(v59);
        -[SiriSharedUIContentPlatterView bounds](self, "bounds");
        if (Height != CGRectGetHeight(v60))
        {
          platterView = self->_platterView;
          -[SiriSharedUIContentPlatterView bounds](self, "bounds");
          Width = CGRectGetWidth(v61);
          -[SiriSharedUIContentPlatterView bounds](self, "bounds");
          -[PLPlatterView setFrame:](platterView, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v62));
        }
      }
    }
    else
    {
      -[SiriSharedUIContentPlatterView bounds](self, "bounds");
      v44 = v43;
      v46 = v45 - v7;
      v48 = v7 + v47;
      -[SiriSharedUIContentPlatterView _setPlatterNeedsLayout:](self, "_setPlatterNeedsLayout:", 0);
      -[PLPlatterView setFrame:](self->_platterView, "setFrame:", 0.0, v46, v44, v48);
    }
    if (v7 > v26)
      goto LABEL_12;
  }
  else
  {
    if (v7 < 0.0)
    {
      -[SiriSharedUIContentPlatterView bounds](self, "bounds");
      v28 = v27;
      v30 = v29 - v7;
      v32 = v7 + v31;
      -[SiriSharedUIContentPlatterView _setPlatterNeedsLayout:](self, "_setPlatterNeedsLayout:", 0);
      -[PLPlatterView setFrame:](self->_platterView, "setFrame:", 0.0, v30, v28, v32);
    }
    if (v7 > 0.0 && v7 < v26)
    {
      -[PLPlatterView bounds](self->_platterView, "bounds");
      v33 = CGRectGetHeight(v55);
      -[SiriSharedUIContentPlatterView bounds](self, "bounds");
      if (v33 != CGRectGetHeight(v56))
      {
        v34 = self->_platterView;
        -[SiriSharedUIContentPlatterView bounds](self, "bounds");
        v35 = CGRectGetWidth(v57);
        -[SiriSharedUIContentPlatterView bounds](self, "bounds");
        -[PLPlatterView setFrame:](v34, "setFrame:", 0.0, 0.0, v35, CGRectGetHeight(v58));
      }
    }
    if (v7 >= v26)
    {
LABEL_12:
      -[SiriSharedUIContentPlatterView bounds](self, "bounds");
      v37 = v36;
      v39 = v38 - (v7 - v26);
      -[SiriSharedUIContentPlatterView _setPlatterNeedsLayout:](self, "_setPlatterNeedsLayout:", 0);
      -[PLPlatterView setFrame:](self->_platterView, "setFrame:", 0.0, 0.0, v37, v39);
    }
  }
  v40 = v7;
  v41 = v23 + v26;
  v42 = floorf(v40) == floorf(v41);
  -[SiriSharedUIContentPlatterView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
    -[SiriSharedUIContentPlatterView _setShouldAllowDismissalWhileScrollable:](self, "_setShouldAllowDismissalWhileScrollable:", v42);
  -[SiriSharedUIContentPlatterView _setCurrentContentOffset:](self, "_setCurrentContentOffset:", v7);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;

  v23 = a3;
  if (self->_isInAmbient && !self->_reducedOrbOpacity && (SiriSharedUIIsTextInputEnabled() & 1) == 0)
  {
    -[SiriSharedUIContentPlatterView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentPlatterViewScrollDidBegin");

    self->_reducedOrbOpacity = 1;
  }
  -[SiriSharedUIContentPlatterView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v23, "contentSize");
    objc_msgSend(v23, "contentSize");
    v7 = v6;
    objc_msgSend(v23, "contentInset");
    v9 = v7 + v8;
    objc_msgSend(v23, "contentInset");
    v11 = v9 + v10;
    -[SiriSharedUIContentPlatterView bounds](self, "bounds");
    v12 = v11 - CGRectGetHeight(v24);
    objc_msgSend(v23, "panGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "velocityInView:", v14);
    v16 = v15;

    objc_msgSend(v23, "contentOffset");
    v18 = v17;
    *(float *)&v17 = v12;
    if (floorf(v18) == floorf(*(float *)&v17))
    {
      if (v16 < 0.0)
      {
        -[SiriSharedUIContentPlatterView _setShouldAllowDismissalWhileScrollable:](self, "_setShouldAllowDismissalWhileScrollable:", 1);
        -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setScrollEnabled:", 0);

        -[SiriSharedUIContentPlatterView _scrollView](self, "_scrollView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setScrollEnabled:", 1);

      }
      if (v16 > 0.0)
      {
        -[SiriSharedUIContentPlatterView _setShouldAllowDismissalWhileScrollable:](self, "_setShouldAllowDismissalWhileScrollable:", 1);
        -[SiriSharedUIContentPlatterView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setEnabled:", 0);

        -[SiriSharedUIContentPlatterView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setEnabled:", 1);

      }
    }
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_isInAmbient && !a4 && self->_reducedOrbOpacity && (SiriSharedUIIsTextInputEnabled() & 1) == 0)
  {
    -[SiriSharedUIContentPlatterView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentPlatterViewScrollDidEnd");

    self->_reducedOrbOpacity = 0;
  }
  -[SiriSharedUIContentPlatterView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIContentPlatterView _contentOffsetForScrollView:](self, "_contentOffsetForScrollView:", v8);
  objc_msgSend(v7, "contentPlatterViewScrolledToContentOffset:");

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_isInAmbient && self->_reducedOrbOpacity)
  {
    v8 = v4;
    v6 = SiriSharedUIIsTextInputEnabled();
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      -[SiriSharedUIContentPlatterView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentPlatterViewScrollDidEnd");

      v5 = v8;
      self->_reducedOrbOpacity = 0;
    }
  }

}

- (void)_updateContentFullyScrolled
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  CGRect v12;

  -[SiriSharedUIContentPlatterView _contentInsetForScrollView:](self, "_contentInsetForScrollView:", self->_scrollView);
  v4 = v3;
  v6 = v5;
  -[SiriSharedUIContentPlatterScrollView contentSize](self->_scrollView, "contentSize");
  v8 = v4 + v7;
  -[SiriSharedUIContentPlatterView bounds](self, "bounds");
  v9 = v8 - CGRectGetHeight(v12);
  -[SiriSharedUIContentPlatterView _contentOffsetForScrollView:](self, "_contentOffsetForScrollView:", self->_scrollView);
  v11 = v10;
  *(float *)&v10 = v6 + v9;
  -[SiriSharedUIContentPlatterView _setShouldAllowDismissalWhileScrollable:](self, "_setShouldAllowDismissalWhileScrollable:", floorf(v11) == floorf(*(float *)&v10));
}

- (CGPoint)_contentOffsetForScrollView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "contentOffset");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)_contentSizeForScrollView:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a3, "contentSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)_contentInsetForScrollView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  objc_msgSend(a3, "contentInset");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SiriSharedUIContentPlatterViewDelegate)delegate
{
  return (SiriSharedUIContentPlatterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)contentViews
{
  return self->_contentViews;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (SiriSharedUIPanDismissalGestureRecognizer)dismissalGestureRecognizer
{
  return self->_dismissalGestureRecognizer;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (BOOL)allowAutomaticContentViewsScaling
{
  return self->_allowAutomaticContentViewsScaling;
}

- (BOOL)isNextLevelCard
{
  return self->_isNextLevelCard;
}

- (void)setIsNextLevelCard:(BOOL)a3
{
  self->_isNextLevelCard = a3;
}

- (SiriSharedUIStandardView)_contentHostingView
{
  return self->_contentHostingView;
}

- (void)setContentHostingView:(id)a3
{
  objc_storeStrong((id *)&self->_contentHostingView, a3);
}

- (SiriSharedUIContentPlatterScrollView)_scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (SiriSharedUIContentPlatterDarkenMaskView)_darkenMaskView
{
  return self->_darkenMaskView;
}

- (void)setDarkenMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_darkenMaskView, a3);
}

- (BOOL)_platterNeedsLayout
{
  return self->_platterNeedsLayout;
}

- (void)_setPlatterNeedsLayout:(BOOL)a3
{
  self->_platterNeedsLayout = a3;
}

- (BOOL)_shouldAllowDismissalWhenScrollable
{
  return self->_shouldAllowDismissalWhileScrollable;
}

- (void)_setShouldAllowDismissalWhileScrollable:(BOOL)a3
{
  self->_shouldAllowDismissalWhileScrollable = a3;
}

- (double)_currentContentOffset
{
  return self->_currentContentOffset;
}

- (void)_setCurrentContentOffset:(double)a3
{
  self->_currentContentOffset = a3;
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_darkenMaskView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentHostingView, 0);
  objc_storeStrong((id *)&self->_dismissalGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
