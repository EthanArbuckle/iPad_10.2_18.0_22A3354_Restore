@implementation NCNotificationListSupplementaryHostingView

- (NCNotificationListSupplementaryHostingView)init
{
  NCNotificationListSupplementaryHostingView *v2;
  NCNotificationListSupplementaryHostingView *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSupplementaryHostingView;
  v2 = -[NCDimmableView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[NCNotificationListSupplementaryHostingView _setContinuousCornerRadius:](v2, "_setContinuousCornerRadius:", 23.5);
    v4 = objc_alloc_init(MEMORY[0x1E0DC3D80]);
    -[NCNotificationListSupplementaryHostingView addGestureRecognizer:](v3, "addGestureRecognizer:", v4);
    objc_msgSend(v4, "addTarget:action:", v3, sel__tapGestureRecognized_);
    objc_msgSend(v4, "setCancelsTouchesInView:", 0);
    objc_msgSend(v4, "setDelegate:", v3);
    v3->_adjustsFontForContentSizeCategory = 1;

  }
  return v3;
}

- (void)setHostedView:(id)a3
{
  UIView *v5;
  UIView **p_hostedView;
  UIView *hostedView;
  UIView *v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_hostedView = &self->_hostedView;
  hostedView = self->_hostedView;
  if (hostedView != v5)
  {
    v10 = v5;
    -[UIView removeFromSuperview](hostedView, "removeFromSuperview");
    v8 = *p_hostedView;
    *p_hostedView = 0;

    objc_storeStrong((id *)&self->_hostedView, a3);
    -[NCDimmableView setViewToFadeWhenDimming:](self, "setViewToFadeWhenDimming:", *p_hostedView);
    if (v10)
    {
      -[NCNotificationListSupplementaryHostingView _configurePlatterViewIfNecessary](self, "_configurePlatterViewIfNecessary");
      -[PLPlatterView customContentView](self->_platterView, "customContentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

    }
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSupplementaryHostingView;
  -[NCNotificationListSupplementaryHostingView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  v5 = v3 && self->_hostedViewUserInteractionEnabled;
  -[NCNotificationListSupplementaryHostingView _blockOutOfProcessUIInteractions:](self, "_blockOutOfProcessUIInteractions:", v5);
}

- (void)setHostedViewUserInteractionEnabled:(BOOL)a3
{
  self->_hostedViewUserInteractionEnabled = a3;
  -[NCNotificationListSupplementaryHostingView _blockOutOfProcessUIInteractions:](self, "_blockOutOfProcessUIInteractions:");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationListSupplementaryHostingView;
  -[NCNotificationListSupplementaryHostingView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[PLPlatterView _setContinuousCornerRadius:](self->_platterView, "_setContinuousCornerRadius:", a3);
  -[UIView _setContinuousCornerRadius:](self->_hostedView, "_setContinuousCornerRadius:", a3);
  -[NCNotificationListStackBackgroundDimmingView _setContinuousCornerRadius:](self->_backgroundTintView, "_setContinuousCornerRadius:", a3);
}

- (BOOL)auxiliaryOptionsVisible
{
  return -[NCAuxiliaryOptionsView auxiliaryOptionsVisible](self->_auxiliaryOptionsView, "auxiliaryOptionsVisible");
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[NCNotificationListSupplementaryHostingView auxiliaryOptionsVisible](self, "auxiliaryOptionsVisible") != a3)
  {
    -[NCNotificationListSupplementaryHostingView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__NCNotificationListSupplementaryHostingView_setAuxiliaryOptionsVisible___block_invoke;
    v5[3] = &unk_1E8D1B568;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
    -[NCAuxiliaryOptionsView setAuxiliaryOptionsVisible:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsVisible:", v3);
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __73__NCNotificationListSupplementaryHostingView_setAuxiliaryOptionsVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsSummaryText, a3);
    -[NCNotificationListSupplementaryHostingView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
    -[NCAuxiliaryOptionsView setAuxiliaryOptionsSummaryText:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsSummaryText:", v5);
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAuxiliaryOptionActions:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_auxiliaryOptionActions, a3);
  v5 = a3;
  -[NCNotificationListSupplementaryHostingView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
  -[NCAuxiliaryOptionsView setAuxiliaryOptionActions:](self->_auxiliaryOptionsView, "setAuxiliaryOptionActions:", v5);

  -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
}

- (NSArray)auxiliaryOptionButtons
{
  return -[NCAuxiliaryOptionsView auxiliaryOptionButtons](self->_auxiliaryOptionsView, "auxiliaryOptionButtons");
}

- (void)setAuxiliaryOptionsTextColor:(id)a3
{
  UIColor **p_auxiliaryOptionsTextColor;
  id v6;

  p_auxiliaryOptionsTextColor = &self->_auxiliaryOptionsTextColor;
  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsTextColor, a3);
    -[NCNotificationListSupplementaryHostingView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
    -[NCAuxiliaryOptionsView setAuxiliaryOptionsTextColor:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsTextColor:", *p_auxiliaryOptionsTextColor);
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAuxiliaryOptionsBackgroundColor:(id)a3
{
  UIColor **p_auxiliaryOptionsBackgroundColor;
  id v6;

  p_auxiliaryOptionsBackgroundColor = &self->_auxiliaryOptionsBackgroundColor;
  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, a3);
    -[NCNotificationListSupplementaryHostingView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
    -[NCAuxiliaryOptionsView setAuxiliaryOptionsBackgroundColor:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsBackgroundColor:", *p_auxiliaryOptionsBackgroundColor);
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAuxiliaryOptionsBackgroundCompositingFilter:(id)a3
{
  NSString **p_auxiliaryOptionsBackgroundCompositingFilter;
  id v6;

  p_auxiliaryOptionsBackgroundCompositingFilter = &self->_auxiliaryOptionsBackgroundCompositingFilter;
  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, a3);
    -[NCNotificationListSupplementaryHostingView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
    -[NCAuxiliaryOptionsView setAuxiliaryOptionsBackgroundCompositingFilter:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsBackgroundCompositingFilter:", *p_auxiliaryOptionsBackgroundCompositingFilter);
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)adjustForContentSizeCategoryChange
{
  int v3;
  int v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = -[PLPlatterView adjustForContentSizeCategoryChange](self->_platterView, "adjustForContentSizeCategoryChange");
  else
    v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[UIView adjustForContentSizeCategoryChange](self->_hostedView, "adjustForContentSizeCategoryChange") & 1) != 0)
  {
    v3 = 1;
  }
  v4 = -[NCAuxiliaryOptionsView adjustForContentSizeCategoryChange](self->_auxiliaryOptionsView, "adjustForContentSizeCategoryChange") | v3;
  if (v4 == 1)
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
  return v4;
}

- (void)setMaterialRecipe:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  UIView *hostedView;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_materialRecipe != a3)
  {
    self->_materialRecipe = a3;
    -[PLPlatterView setMaterialRecipe:](self->_platterView, "setMaterialRecipe:");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[UIView requiredVisualStyleCategories](self->_hostedView, "requiredVisualStyleCategories");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "integerValue");
            hostedView = self->_hostedView;
            -[PLPlatterView visualStylingProviderForCategory:](self->_platterView, "visualStylingProviderForCategory:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setVisualStylingProvider:forCategory:](hostedView, "setVisualStylingProvider:forCategory:", v11, v9);

          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v6);
      }

    }
    -[NCAuxiliaryOptionsView setMaterialRecipe:](self->_auxiliaryOptionsView, "setMaterialRecipe:", self->_materialRecipe);
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaterialTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((NCIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialTintColor, a3);
    -[NCNotificationListStackBackgroundDimmingView setBackgroundColor:](self->_backgroundTintView, "setBackgroundColor:", v5);
    -[NCAuxiliaryOptionsView setMaterialTintColor:](self->_auxiliaryOptionsView, "setMaterialTintColor:", v5);
    -[NCNotificationListSupplementaryHostingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  v5 = a3;
  -[PLPlatterView setMaterialGroupNameBase:](self->_platterView, "setMaterialGroupNameBase:", v5);
  -[NCAuxiliaryOptionsView setMaterialGroupNameBase:](self->_auxiliaryOptionsView, "setMaterialGroupNameBase:", v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  NCAuxiliaryOptionsView *auxiliaryOptionsView;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationListSupplementaryHostingView hostedView](self, "hostedView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;

  if (-[NCAuxiliaryOptionsView auxiliaryOptionsVisible](self->_auxiliaryOptionsView, "auxiliaryOptionsVisible"))
  {
    auxiliaryOptionsView = self->_auxiliaryOptionsView;
    if (auxiliaryOptionsView)
      -[NCAuxiliaryOptionsView sizeThatFits:](auxiliaryOptionsView, "sizeThatFits:", width, height);
    else
      v10 = 0.0;
    v8 = v8 + v10;
  }
  v11 = width;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSupplementaryHostingView;
  -[NCNotificationListSupplementaryHostingView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationListSupplementaryHostingView _configurePlatterViewIfNecessary](self, "_configurePlatterViewIfNecessary");
  -[NCNotificationListSupplementaryHostingView _configureBackgroundTintViewIfNecessary](self, "_configureBackgroundTintViewIfNecessary");
  -[NCNotificationListSupplementaryHostingView _layoutHostedView](self, "_layoutHostedView");
  -[NCNotificationListSupplementaryHostingView _layoutAuxiliaryOptionsView](self, "_layoutAuxiliaryOptionsView");
}

- (void)_configurePlatterViewIfNecessary
{
  PLPlatterView *v3;
  PLPlatterView *platterView;
  PLPlatterView *v5;
  PLPlatterView *v6;

  if (!self->_platterView)
  {
    v3 = (PLPlatterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", self->_materialRecipe);
    platterView = self->_platterView;
    self->_platterView = v3;

    -[PLPlatterView setMaterialGroupNameBase:](self->_platterView, "setMaterialGroupNameBase:", self->_materialGroupNameBase);
    -[NCNotificationListSupplementaryHostingView addSubview:](self, "addSubview:", self->_platterView);
    -[NCNotificationListSupplementaryHostingView sendSubviewToBack:](self, "sendSubviewToBack:", self->_platterView);
    v5 = self->_platterView;
    -[NCNotificationListSupplementaryHostingView _continuousCornerRadius](self, "_continuousCornerRadius");
    -[PLPlatterView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
    v6 = self->_platterView;
    -[NCNotificationListSupplementaryHostingView bounds](self, "bounds");
    -[PLPlatterView setFrame:](v6, "setFrame:");
    -[PLPlatterView setAutoresizingMask:](self->_platterView, "setAutoresizingMask:", 18);
  }
}

- (void)_configureBackgroundTintViewIfNecessary
{
  UIColor *materialTintColor;
  NCNotificationListStackBackgroundDimmingView *backgroundTintView;
  NCNotificationListStackBackgroundDimmingView *v5;
  NCNotificationListStackBackgroundDimmingView *v6;
  NCNotificationListStackBackgroundDimmingView *v7;
  void *v8;
  void *v9;
  NCNotificationListStackBackgroundDimmingView *v10;
  NCNotificationListStackBackgroundDimmingView *v11;
  NCNotificationListStackBackgroundDimmingView *v12;

  materialTintColor = self->_materialTintColor;
  backgroundTintView = self->_backgroundTintView;
  if (materialTintColor)
  {
    if (backgroundTintView)
      return;
    -[NCNotificationListSupplementaryHostingView _configurePlatterViewIfNecessary](self, "_configurePlatterViewIfNecessary");
    v5 = [NCNotificationListStackBackgroundDimmingView alloc];
    -[NCNotificationListSupplementaryHostingView bounds](self, "bounds");
    v6 = -[NCNotificationListStackBackgroundDimmingView initWithFrame:](v5, "initWithFrame:");
    v7 = self->_backgroundTintView;
    self->_backgroundTintView = v6;

    -[PLPlatterView customContentView](self->_platterView, "customContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_backgroundTintView);

    -[PLPlatterView customContentView](self->_platterView, "customContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSubviewToBack:", self->_backgroundTintView);

    -[NCNotificationListStackBackgroundDimmingView setBackgroundColor:](self->_backgroundTintView, "setBackgroundColor:", self->_materialTintColor);
    v10 = self->_backgroundTintView;
    -[NCNotificationListSupplementaryHostingView _continuousCornerRadius](self, "_continuousCornerRadius");
    -[NCNotificationListStackBackgroundDimmingView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:");
    v11 = self->_backgroundTintView;
  }
  else
  {
    if (!backgroundTintView)
      return;
    -[NCNotificationListStackBackgroundDimmingView removeFromSuperview](backgroundTintView, "removeFromSuperview");
    v12 = self->_backgroundTintView;
    self->_backgroundTintView = 0;

    v11 = 0;
  }
  -[NCDimmableView setBackgroundDimmingView:](self, "setBackgroundDimmingView:", v11);
}

- (void)_configureAuxiliaryOptionsViewIfNecessary
{
  NCAuxiliaryOptionsView *v3;
  NCAuxiliaryOptionsView *auxiliaryOptionsView;
  NCAuxiliaryOptionsView *v5;
  void *v6;
  _QWORD v7[5];

  if (!self->_auxiliaryOptionsView)
  {
    if (-[NCNotificationListSupplementaryHostingView hasContentForAuxiliaryOptions](self, "hasContentForAuxiliaryOptions"))
    {
      v3 = objc_alloc_init(NCAuxiliaryOptionsView);
      auxiliaryOptionsView = self->_auxiliaryOptionsView;
      self->_auxiliaryOptionsView = v3;

      -[NCAuxiliaryOptionsView setAdjustsFontForContentSizeCategory:](self->_auxiliaryOptionsView, "setAdjustsFontForContentSizeCategory:", -[NCNotificationListSupplementaryHostingView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
      -[NCAuxiliaryOptionsView setAuxiliaryOptionActions:](self->_auxiliaryOptionsView, "setAuxiliaryOptionActions:", self->_auxiliaryOptionActions);
      -[NCAuxiliaryOptionsView setAuxiliaryOptionsTextColor:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsTextColor:", self->_auxiliaryOptionsTextColor);
      -[NCAuxiliaryOptionsView setAuxiliaryOptionsSummaryText:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsSummaryText:", self->_auxiliaryOptionsSummaryText);
      -[NCAuxiliaryOptionsView setAuxiliaryOptionsBackgroundColor:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsBackgroundColor:", self->_auxiliaryOptionsBackgroundColor);
      -[NCAuxiliaryOptionsView setAuxiliaryOptionsBackgroundCompositingFilter:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsBackgroundCompositingFilter:", self->_auxiliaryOptionsBackgroundCompositingFilter);
      -[NCAuxiliaryOptionsView setMaterialRecipe:](self->_auxiliaryOptionsView, "setMaterialRecipe:", self->_materialRecipe);
      -[NCAuxiliaryOptionsView setMaterialTintColor:](self->_auxiliaryOptionsView, "setMaterialTintColor:", self->_materialTintColor);
      -[NCAuxiliaryOptionsView setMaterialGroupNameBase:](self->_auxiliaryOptionsView, "setMaterialGroupNameBase:", self->_materialGroupNameBase);
      v5 = self->_auxiliaryOptionsView;
      -[NCNotificationListSupplementaryHostingView _continuousCornerRadius](self, "_continuousCornerRadius");
      -[NCAuxiliaryOptionsView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
      -[PLPlatterView customContentView](self->_platterView, "customContentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", self->_auxiliaryOptionsView);

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __87__NCNotificationListSupplementaryHostingView__configureAuxiliaryOptionsViewIfNecessary__block_invoke;
      v7[3] = &unk_1E8D1B568;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
    }
  }
}

uint64_t __87__NCNotificationListSupplementaryHostingView__configureAuxiliaryOptionsViewIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "layoutIfNeeded");
}

- (void)_layoutHostedView
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

  -[NCNotificationListSupplementaryHostingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCNotificationListSupplementaryHostingView hostedView](self, "hostedView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  v13 = v12;

  -[NCNotificationListStackBackgroundDimmingView setFrame:](self->_backgroundTintView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_viewToBlockOutOfProcessUIInteractions, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_hostedView, "setFrame:", v4, v6, v8, v13);
}

- (void)_layoutAuxiliaryOptionsView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NCAuxiliaryOptionsView *auxiliaryOptionsView;
  CGRect v12;

  if (self->_auxiliaryOptionsView)
  {
    -[NCNotificationListSupplementaryHostingView bounds](self, "bounds");
    -[NCAuxiliaryOptionsView sizeThatFits:](self->_auxiliaryOptionsView, "sizeThatFits:", v3, v4);
    BSRectWithSize();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView frame](self->_hostedView, "frame");
    -[NCAuxiliaryOptionsView setFrame:](self->_auxiliaryOptionsView, "setFrame:", v6, CGRectGetMaxY(v12), v8, v10);
    auxiliaryOptionsView = self->_auxiliaryOptionsView;
    -[NCNotificationListSupplementaryHostingView _continuousCornerRadius](self, "_continuousCornerRadius");
    -[NCAuxiliaryOptionsView _setContinuousCornerRadius:](auxiliaryOptionsView, "_setContinuousCornerRadius:");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a4, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_blockOutOfProcessUIInteractions:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[NCNotificationListSupplementaryHostingView _configurePlatterViewIfNecessary](self, "_configurePlatterViewIfNecessary");
  -[NCNotificationListSupplementaryHostingView _configureViewToBlockOutOfProcessUIInteractionsIfNecessary](self, "_configureViewToBlockOutOfProcessUIInteractionsIfNecessary");
  -[UIView setHidden:](self->_viewToBlockOutOfProcessUIInteractions, "setHidden:", v3);
}

- (void)_configureViewToBlockOutOfProcessUIInteractionsIfNecessary
{
  UIView *v3;
  UIView *viewToBlockOutOfProcessUIInteractions;
  void *v5;
  void *v6;
  UIView *v7;
  void *v8;
  UIView *v9;

  if (!self->_viewToBlockOutOfProcessUIInteractions)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    viewToBlockOutOfProcessUIInteractions = self->_viewToBlockOutOfProcessUIInteractions;
    self->_viewToBlockOutOfProcessUIInteractions = v3;

    -[UIView layer](self->_viewToBlockOutOfProcessUIInteractions, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

    -[UIView layer](self->_viewToBlockOutOfProcessUIInteractions, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsHitTesting:", 1);

    -[UIView setHidden:](self->_viewToBlockOutOfProcessUIInteractions, "setHidden:", 1);
    v7 = self->_viewToBlockOutOfProcessUIInteractions;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = self->_viewToBlockOutOfProcessUIInteractions;
    -[NCNotificationListSupplementaryHostingView bounds](self, "bounds");
    -[UIView setFrame:](v9, "setFrame:");
    -[UIView setAutoresizingMask:](self->_viewToBlockOutOfProcessUIInteractions, "setAutoresizingMask:", 18);
    -[NCNotificationListSupplementaryHostingView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_viewToBlockOutOfProcessUIInteractions, self->_platterView);
  }
}

- (void)_tapGestureRecognized:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "supplementaryHostingViewWasTapped:", self);
      v5 = v7;
    }
  }

}

- (BOOL)hasContentForAuxiliaryOptions
{
  return -[NSArray count](self->_auxiliaryOptionActions, "count") != 0;
}

- (NSString)auxiliaryOptionsSummaryText
{
  return self->_auxiliaryOptionsSummaryText;
}

- (NSArray)auxiliaryOptionActions
{
  return self->_auxiliaryOptionActions;
}

- (UIColor)auxiliaryOptionsTextColor
{
  return self->_auxiliaryOptionsTextColor;
}

- (UIColor)auxiliaryOptionsBackgroundColor
{
  return self->_auxiliaryOptionsBackgroundColor;
}

- (NSString)auxiliaryOptionsBackgroundCompositingFilter
{
  return self->_auxiliaryOptionsBackgroundCompositingFilter;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (UIColor)materialTintColor
{
  return self->_materialTintColor;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (BOOL)isHostedViewUserInteractionEnabled
{
  return self->_hostedViewUserInteractionEnabled;
}

- (NCNotificationListSupplementaryHostingViewDelegate)delegate
{
  return (NCNotificationListSupplementaryHostingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (NCAuxiliaryOptionsView)auxiliaryOptionsView
{
  return self->_auxiliaryOptionsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryOptionsView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_materialTintColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsTextColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsSummaryText, 0);
  objc_storeStrong((id *)&self->_viewToBlockOutOfProcessUIInteractions, 0);
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
}

@end
