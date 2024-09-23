@implementation SBHWidgetContainerView

- (SBHWidgetContainerView)initWithGridSizeClass:(id)a3 applicationName:(id)a4
{
  id v6;
  id v7;
  SBHWidgetContainerView *v8;
  uint64_t v9;
  NSString *gridSizeClass;
  uint64_t v11;
  NSString *applicationName;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBHWidgetContainerView;
  v8 = -[SBHWidgetContainerView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    gridSizeClass = v8->_gridSizeClass;
    v8->_gridSizeClass = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    applicationName = v8->_applicationName;
    v8->_applicationName = (NSString *)v11;

    v8->_lastRequestedClipToBoundsValue = 0;
    -[SBHWidgetContainerView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[SBHWidgetContainerView setAutoresizesSubviews:](v8, "setAutoresizesSubviews:", 1);
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[SBHWidgetContainerView registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", v14, sel__reloadScreenTimeExpirationUI);

  }
  return v8;
}

- (void)setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  self->_lastRequestedClipToBoundsValue = a3;
  v3 = a3 || self->_requiresClippingToBounds || self->_blockedForScreenTimeExpiration;
  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetContainerView;
  -[SBHWidgetContainerView setClipsToBounds:](&v4, sel_setClipsToBounds_, v3);
}

- (void)layoutSubviews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__SBHWidgetContainerView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E8D84C50;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void *__40__SBHWidgetContainerView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *result;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = *(id *)(a1 + 32);
  v22.super_class = (Class)SBHWidgetContainerView;
  objc_msgSendSuper2(&v22, sel_layoutSubviews);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(WeakRetained, "setFrame:", v3, v5, v7, v9);

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 456);
  if (v12)
  {
    UIRectGetCenter();
    objc_msgSend(v12, "setCenter:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setBounds:", v3, v5, v7, v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);

    if (v13 != v14)
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));
    objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));
    v11 = *(_QWORD *)(a1 + 32);
  }
  result = *(void **)(v11 + 448);
  if (result)
  {
    objc_msgSend(result, "setFrame:", v3, v5, v7, v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "bounds");
    UIRectInsetEdges();
    v17 = v16;
    v19 = v18;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "sizeThatFits:", v16, v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "sizeThatFits:", v17, v19);
    BSRectWithSize();
    UIRectCenteredRect();
    UIRectContainInRect();
    BSRectWithSize();
    UIRectCenteredRect();
    UIRectContainInRect();
    v20 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
    UIRectIntegralWithScale();
    objc_msgSend(v20, "setFrame:");
    v21 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
    UIRectIntegralWithScale();
    objc_msgSend(v21, "setFrame:");
    return (void *)objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));
  }
  return result;
}

- (void)setBlockedForScreenTimeExpiration:(BOOL)a3
{
  NSObject *v5;
  _BOOL4 blockedForScreenTimeExpiration;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_blockedForScreenTimeExpiration != a3)
  {
    SBLogWidgets();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      blockedForScreenTimeExpiration = self->_blockedForScreenTimeExpiration;
      v7[0] = 67109120;
      v7[1] = blockedForScreenTimeExpiration;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Updating blockedForScreenTimeExpiration to %{BOOL}u", (uint8_t *)v7, 8u);
    }

  }
  self->_blockedForScreenTimeExpiration = a3;
  -[SBHWidgetContainerView _updateScreenTimeLockoutView](self, "_updateScreenTimeLockoutView");
  -[SBHWidgetContainerView setClipsToBounds:](self, "setClipsToBounds:", self->_lastRequestedClipToBoundsValue);
}

- (void)setRequiresClippingToBounds:(BOOL)a3
{
  self->_requiresClippingToBounds = a3;
  -[SBHWidgetContainerView setClipsToBounds:](self, "setClipsToBounds:", self->_lastRequestedClipToBoundsValue);
}

- (void)setBackgroundView:(id)a3
{
  UIView **p_backgroundView;
  id v6;

  p_backgroundView = &self->_backgroundView;
  v6 = a3;
  if ((-[UIView isEqual:](*p_backgroundView, "isEqual:") & 1) == 0)
  {
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setAutoresizingMask:", 0);
    -[UIView removeFromSuperview](*p_backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[SBHWidgetContainerView bounds](self, "bounds");
    objc_msgSend(v6, "setFrame:");
    -[SBHWidgetContainerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateScreenTimeLockoutView
{
  _BOOL4 blockedForScreenTimeExpiration;
  MTMaterialView *screenTimeLockoutView;
  MTMaterialView *v5;
  MTMaterialView *v6;
  void *v7;
  id v8;
  __CFString *gridSizeClass;
  id v10;
  UILabel *v11;
  UILabel *titleLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  SBHIconGridSizeClassSet *v18;
  void *v19;
  SBHIconGridSizeClassSet *v20;
  UILabel *descriptionLabel;
  UILabel *v22;
  UILabel *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UILabel *v30;
  MTMaterialView *v31;
  UILabel *v32;

  blockedForScreenTimeExpiration = self->_blockedForScreenTimeExpiration;
  screenTimeLockoutView = self->_screenTimeLockoutView;
  if (blockedForScreenTimeExpiration)
  {
    if (!screenTimeLockoutView)
    {
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 51);
      v5 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
      v6 = self->_screenTimeLockoutView;
      self->_screenTimeLockoutView = v5;

      -[MTMaterialView setUserInteractionEnabled:](self->_screenTimeLockoutView, "setUserInteractionEnabled:", 1);
      -[SBHWidgetContainerView addSubview:](self, "addSubview:", self->_screenTimeLockoutView);
      screenTimeLockoutView = self->_screenTimeLockoutView;
    }
    -[MTMaterialView visualStylingProviderForCategory:](screenTimeLockoutView, "visualStylingProviderForCategory:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)*MEMORY[0x1E0DC48C0];
    gridSizeClass = (__CFString *)self->_gridSizeClass;
    if (gridSizeClass == CFSTR("SBHIconGridSizeClassMedium")
      || -[__CFString isEqualToString:](gridSizeClass, "isEqualToString:", CFSTR("SBHIconGridSizeClassMedium")))
    {
      v10 = (id)*MEMORY[0x1E0DC48D0];

      v8 = v10;
    }
    if (!self->_titleLabel)
    {
      v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      titleLabel = self->_titleLabel;
      self->_titleLabel = v11;

      v13 = self->_titleLabel;
      -[SBHWidgetContainerView _fontWithTextStyle:symbolicTraits:maxSizeCategory:](self, "_fontWithTextStyle:symbolicTraits:maxSizeCategory:", *MEMORY[0x1E0DC4A88], 2, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v13, "setFont:", v14);

      v15 = self->_titleLabel;
      SBHBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("WIDGET_SCREENTIME_TIME_LIMIT_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v15, "setText:", v17);

      -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.5);
      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
      objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_titleLabel, 0);
      -[MTMaterialView addSubview:](self->_screenTimeLockoutView, "addSubview:", self->_titleLabel);
    }
    v18 = [SBHIconGridSizeClassSet alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), CFSTR("SBHIconGridSizeClassExtraLarge"), CFSTR("SBHIconGridSizeClassNewsLargeTall"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v18, "initWithGridSizeClasses:", v19);

    if (-[SBHIconGridSizeClassSet containsGridSizeClass:](v20, "containsGridSizeClass:", self->_gridSizeClass)
      && -[NSString length](self->_applicationName, "length"))
    {
      descriptionLabel = self->_descriptionLabel;
      if (!descriptionLabel)
      {
        v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v23 = self->_descriptionLabel;
        self->_descriptionLabel = v22;

        v24 = self->_descriptionLabel;
        -[SBHWidgetContainerView _fontWithTextStyle:symbolicTraits:maxSizeCategory:](self, "_fontWithTextStyle:symbolicTraits:maxSizeCategory:", *MEMORY[0x1E0DC4AB8], 0, v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v24, "setFont:", v25);

        -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
        -[UILabel setAdjustsFontSizeToFitWidth:](self->_descriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
        -[UILabel setMinimumScaleFactor:](self->_descriptionLabel, "setMinimumScaleFactor:", 0.5);
        -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 3);
        -[MTMaterialView addSubview:](self->_screenTimeLockoutView, "addSubview:", self->_descriptionLabel);
        descriptionLabel = self->_descriptionLabel;
      }
      v26 = (void *)MEMORY[0x1E0CB3940];
      SBHBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("WIDGET_SCREENTIME_TIME_LIMIT_DESCRIPTION"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v28, self->_applicationName);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](descriptionLabel, "setText:", v29);

    }
    else
    {
      -[UILabel removeFromSuperview](self->_descriptionLabel, "removeFromSuperview");
      v30 = self->_descriptionLabel;
      self->_descriptionLabel = 0;

      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
    }

  }
  else
  {
    -[MTMaterialView removeFromSuperview](screenTimeLockoutView, "removeFromSuperview");
    v31 = self->_screenTimeLockoutView;
    self->_screenTimeLockoutView = 0;

    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    v32 = self->_titleLabel;
    self->_titleLabel = 0;

    -[UILabel removeFromSuperview](self->_descriptionLabel, "removeFromSuperview");
    v7 = self->_descriptionLabel;
    self->_descriptionLabel = 0;
  }

  -[SBHWidgetContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_fontWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 maxSizeCategory:(id)a5
{
  uint64_t v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = *(_QWORD *)&a4;
  v8 = (void *)MEMORY[0x1E0DC3E88];
  v9 = a5;
  v10 = a3;
  -[SBHWidgetContainerView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBHContentSizeCategoryClip(v12, (void *)*MEMORY[0x1E0DC4908], v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "traitCollectionWithPreferredContentSizeCategory:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v16, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)_reloadScreenTimeExpirationUI
{
  if (self->_blockedForScreenTimeExpiration)
  {
    -[SBHWidgetContainerView setBlockedForScreenTimeExpiration:](self, "setBlockedForScreenTimeExpiration:", 0);
    -[SBHWidgetContainerView setBlockedForScreenTimeExpiration:](self, "setBlockedForScreenTimeExpiration:", 1);
  }
}

- (UIView)widgetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_widgetView);
}

- (void)setWidgetView:(id)a3
{
  objc_storeWeak((id *)&self->_widgetView, a3);
}

- (MTMaterialView)screenTimeLockoutView
{
  return self->_screenTimeLockoutView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (BOOL)isBlockedForScreenTimeExpiration
{
  return self->_blockedForScreenTimeExpiration;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (void)setGridSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (BOOL)requiresClippingToBounds
{
  return self->_requiresClippingToBounds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_screenTimeLockoutView, 0);
  objc_destroyWeak((id *)&self->_widgetView);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
