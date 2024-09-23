@implementation PXPeopleBadgeView

- (void)_createLegacyEnabledFavoriteBadgeWithDisplayScale:(double)a3
{
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *legacyFavoriteBackground;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  UIButton *legacyFavoriteButton;
  UIButton *v16;
  void *v17;
  void *v18;
  double v19;

  if (!self->_legacyFavoriteBackground)
  {
    v5 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemButtonWithImage:target:action:", v6, 0, 0);
    v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
    legacyFavoriteBackground = self->_legacyFavoriteBackground;
    self->_legacyFavoriteBackground = v7;

    v9 = self->_legacyFavoriteBackground;
    -[PXPeopleBadgeView _largeConfiguration](self, "_largeConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v9, "setPreferredSymbolConfiguration:forImageInState:", v10, 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_legacyFavoriteBackground, "setTintColor:", v11);

    -[PXPeopleBadgeView addSubview:](self, "addSubview:", self->_legacyFavoriteBackground);
  }
  if (!self->_legacyFavoriteButton)
  {
    v12 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("heart.circle.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "systemButtonWithImage:target:action:", v13, self, sel_favoriteTapped_);
    v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
    legacyFavoriteButton = self->_legacyFavoriteButton;
    self->_legacyFavoriteButton = v14;

    v16 = self->_legacyFavoriteButton;
    -[PXPeopleBadgeView _favoriteConfiguration](self, "_favoriteConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v16, "setPreferredSymbolConfiguration:forImageInState:", v17, 0);

    -[UIButton layer](self->_legacyFavoriteButton, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1045220557;
    objc_msgSend(v18, "setShadowOpacity:", v19);
    objc_msgSend(v18, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(v18, "setShadowRadius:", 3.0);
    objc_msgSend(v18, "setShouldRasterize:", 1);
    objc_msgSend(v18, "setRasterizationScale:", a3);
    -[PXPeopleBadgeView addSubview:](self, "addSubview:", self->_legacyFavoriteButton);

  }
  -[UIButton setHidden:](self->_legacyFavoriteBackground, "setHidden:", 0);
  -[UIButton setHidden:](self->_legacyFavoriteButton, "setHidden:", 0);
  -[UIButton setAlpha:](self->_legacyFavoriteButton, "setAlpha:", 1.0);
  -[UIButton setUserInteractionEnabled:](self->_legacyFavoriteButton, "setUserInteractionEnabled:", 1);
}

- (void)_createLegacyDisabledFavoriteBadgeWithDisplayScale:(double)a3
{
  -[PXPeopleBadgeView _createLegacyEnabledFavoriteBadgeWithDisplayScale:](self, "_createLegacyEnabledFavoriteBadgeWithDisplayScale:", a3);
  -[UIButton setAlpha:](self->_legacyFavoriteButton, "setAlpha:", 0.4);
  -[UIButton setUserInteractionEnabled:](self->_legacyFavoriteButton, "setUserInteractionEnabled:", 0);
}

- (void)_createLegacyEnabledUnfavoriteBadgeWithDisplayScale:(double)a3
{
  UIButton *legacyUnfavoriteButton;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  double v13;

  legacyUnfavoriteButton = self->_legacyUnfavoriteButton;
  if (!legacyUnfavoriteButton)
  {
    v6 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("heart.circle.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemButtonWithImage:target:action:", v7, self, sel_unfavoriteTapped_);
    v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v9 = self->_legacyUnfavoriteButton;
    self->_legacyUnfavoriteButton = v8;

    v10 = self->_legacyUnfavoriteButton;
    -[PXPeopleBadgeView _unfavoriteConfiguration](self, "_unfavoriteConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v10, "setPreferredSymbolConfiguration:forImageInState:", v11, 0);

    -[UIButton layer](self->_legacyUnfavoriteButton, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1045220557;
    objc_msgSend(v12, "setShadowOpacity:", v13);
    objc_msgSend(v12, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(v12, "setShadowRadius:", 3.0);
    objc_msgSend(v12, "setShouldRasterize:", 1);
    objc_msgSend(v12, "setRasterizationScale:", a3);
    -[PXPeopleBadgeView addSubview:](self, "addSubview:", self->_legacyUnfavoriteButton);

    legacyUnfavoriteButton = self->_legacyUnfavoriteButton;
  }
  -[UIButton setHidden:](legacyUnfavoriteButton, "setHidden:", 0, a3);
  -[UIButton setUserInteractionEnabled:](self->_legacyUnfavoriteButton, "setUserInteractionEnabled:", 1);
}

- (void)_createLegacyDisabledUnfavoriteBadgeWithDisplayScale:(double)a3
{
  -[PXPeopleBadgeView _createLegacyEnabledUnfavoriteBadgeWithDisplayScale:](self, "_createLegacyEnabledUnfavoriteBadgeWithDisplayScale:", a3);
  -[UIButton setUserInteractionEnabled:](self->_legacyUnfavoriteButton, "setUserInteractionEnabled:", 0);
}

- (void)_createCheckmarkBadgeWithDisplayScale:(double)a3
{
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *checkmarkView;
  UIButton *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  UIButton *v15;
  UIButton *checkmarkCircle;
  UIButton *v17;
  void *v18;
  void *v19;

  if (!self->_checkmarkView)
  {
    v5 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemButtonWithImage:target:action:", v6, 0, 0);
    v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
    checkmarkView = self->_checkmarkView;
    self->_checkmarkView = v7;

    v9 = self->_checkmarkView;
    -[PXPeopleBadgeView _checkmarkConfiguration](self, "_checkmarkConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v9, "setPreferredSymbolConfiguration:forImageInState:", v10, 0);

    -[UIButton layer](self->_checkmarkView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1045220557;
    objc_msgSend(v11, "setShadowOpacity:", v12);
    objc_msgSend(v11, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(v11, "setShadowRadius:", 3.0);
    objc_msgSend(v11, "setShouldRasterize:", 1);
    objc_msgSend(v11, "setRasterizationScale:", a3);
    -[PXPeopleBadgeView addSubview:](self, "addSubview:", self->_checkmarkView);

  }
  if (!self->_checkmarkCircle)
  {
    v13 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemButtonWithImage:target:action:", v14, 0, 0);
    v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
    checkmarkCircle = self->_checkmarkCircle;
    self->_checkmarkCircle = v15;

    v17 = self->_checkmarkCircle;
    -[PXPeopleBadgeView _largeConfiguration](self, "_largeConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v17, "setPreferredSymbolConfiguration:forImageInState:", v18, 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_checkmarkCircle, "setTintColor:", v19);

    -[PXPeopleBadgeView addSubview:](self, "addSubview:", self->_checkmarkCircle);
  }
  -[UIButton setHidden:](self->_checkmarkView, "setHidden:", 0, a3);
  -[UIButton setHidden:](self->_checkmarkCircle, "setHidden:", 0);
}

- (void)_createFavoriteBadgeWithDisplayScale:(double)a3
{
  UIButton *favoriteButton;
  UIButton *v5;
  UIButton *v6;

  favoriteButton = self->_favoriteButton;
  if (!favoriteButton)
  {
    -[PXPeopleBadgeView _createHeartBadgeWithDisplayScale:isFavorite:](self, "_createHeartBadgeWithDisplayScale:isFavorite:", 1, a3);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v6 = self->_favoriteButton;
    self->_favoriteButton = v5;

    -[PXPeopleBadgeView addSubview:](self, "addSubview:", self->_favoriteButton);
    favoriteButton = self->_favoriteButton;
  }
  -[UIButton setHidden:](favoriteButton, "setHidden:", 0, a3);
  -[UIButton setUserInteractionEnabled:](self->_favoriteButton, "setUserInteractionEnabled:", 1);
}

- (void)_createUnfavoriteBadgeWithDisplayScale:(double)a3
{
  UIButton *unfavoriteButton;
  UIButton *v5;
  UIButton *v6;

  unfavoriteButton = self->_unfavoriteButton;
  if (!unfavoriteButton)
  {
    -[PXPeopleBadgeView _createHeartBadgeWithDisplayScale:isFavorite:](self, "_createHeartBadgeWithDisplayScale:isFavorite:", 0, a3);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v6 = self->_unfavoriteButton;
    self->_unfavoriteButton = v5;

    -[PXPeopleBadgeView addSubview:](self, "addSubview:", self->_unfavoriteButton);
    unfavoriteButton = self->_unfavoriteButton;
  }
  -[UIButton setHidden:](unfavoriteButton, "setHidden:", 0, a3);
  -[UIButton setUserInteractionEnabled:](self->_unfavoriteButton, "setUserInteractionEnabled:", 1);
}

- (id)_createHeartBadgeWithDisplayScale:(double)a3 isFavorite:(BOOL)a4
{
  BOOL v6;
  const __CFString *v7;
  char **v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = !a4;
  if (a4)
    v7 = CFSTR("heart.fill");
  else
    v7 = CFSTR("heart");
  v8 = &selRef_favoriteTapped_;
  if (v6)
    v8 = &selRef_unfavoriteTapped_;
  v9 = *v8;
  v10 = (void *)MEMORY[0x1E0DC3518];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemButtonWithImage:target:action:", v11, self, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleBadgeView _smallConfiguration](self, "_smallConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPreferredSymbolConfiguration:forImageInState:", v13, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v14);

  objc_msgSend(v12, "setContentHorizontalAlignment:", 5);
  objc_msgSend(v12, "setContentVerticalAlignment:", 1);
  objc_msgSend(v12, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRasterizationScale:", a3);

  return v12;
}

- (void)_hideAllViews
{
  -[UIButton setHidden:](self->_legacyFavoriteButton, "setHidden:", 1);
  -[UIButton setHidden:](self->_legacyFavoriteBackground, "setHidden:", 1);
  -[UIButton setHidden:](self->_legacyUnfavoriteButton, "setHidden:", 1);
  -[UIButton setHidden:](self->_checkmarkView, "setHidden:", 1);
  -[UIButton setHidden:](self->_checkmarkCircle, "setHidden:", 1);
  -[UIButton setHidden:](self->_favoriteButton, "setHidden:", 1);
  -[UIButton setHidden:](self->_unfavoriteButton, "setHidden:", 1);
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
  void (**v11)(void *, UIButton *);
  _QWORD v12[8];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXPeopleBadgeView;
  -[PXPeopleBadgeView layoutSubviews](&v13, sel_layoutSubviews);
  -[PXPeopleBadgeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton setFrame:](self->_legacyFavoriteBackground, "setFrame:");
  -[UIButton setFrame:](self->_legacyFavoriteButton, "setFrame:", v4, v6, v8, v10);
  -[UIButton setFrame:](self->_legacyUnfavoriteButton, "setFrame:", v4, v6, v8, v10);
  -[UIButton setFrame:](self->_checkmarkView, "setFrame:", v4, v6, v8, v10);
  -[UIButton setFrame:](self->_checkmarkCircle, "setFrame:", v4, v6, v8, v10);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__PXPeopleBadgeView_layoutSubviews__block_invoke;
  v12[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  *(double *)&v12[4] = v4;
  *(double *)&v12[5] = v6;
  *(double *)&v12[6] = v8;
  *(double *)&v12[7] = v10;
  v11 = (void (**)(void *, UIButton *))_Block_copy(v12);
  v11[2](v11, self->_favoriteButton);
  v11[2](v11, self->_unfavoriteButton);

}

- (void)favoriteTapped:(id)a3
{
  id v4;

  -[PXPeopleBadgeView badgeViewDelegate](self, "badgeViewDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "favoriteTappedForBadgeView:", self);

}

- (void)unfavoriteTapped:(id)a3
{
  id v4;

  -[PXPeopleBadgeView badgeViewDelegate](self, "badgeViewDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unfavoriteTappedForBadgeView:", self);

}

- (void)setUserData:(id)a3
{
  PXPeopleBadgeViewConfiguration *v5;
  PXPeopleBadgeViewConfiguration *v6;
  char v7;
  void *v8;
  PXPeopleBadgeViewConfiguration *v9;

  v9 = (PXPeopleBadgeViewConfiguration *)a3;
  v5 = self->_userData;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXPeopleBadgeViewConfiguration isEqual:](v5, "isEqual:", v9);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_userData, a3);
      -[PXPeopleBadgeViewConfiguration badgeViewDelegate](v9, "badgeViewDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleBadgeView setBadgeViewDelegate:](self, "setBadgeViewDelegate:", v8);

      -[PXPeopleBadgeView _hideAllViews](self, "_hideAllViews");
      switch(-[PXPeopleBadgeViewConfiguration state](v9, "state"))
      {
        case 1:
          -[PXPeopleBadgeViewConfiguration displayScale](v9, "displayScale");
          -[PXPeopleBadgeView _createLegacyEnabledFavoriteBadgeWithDisplayScale:](self, "_createLegacyEnabledFavoriteBadgeWithDisplayScale:");
          break;
        case 2:
          -[PXPeopleBadgeViewConfiguration displayScale](v9, "displayScale");
          -[PXPeopleBadgeView _createLegacyDisabledFavoriteBadgeWithDisplayScale:](self, "_createLegacyDisabledFavoriteBadgeWithDisplayScale:");
          break;
        case 3:
          -[PXPeopleBadgeViewConfiguration displayScale](v9, "displayScale");
          -[PXPeopleBadgeView _createLegacyEnabledUnfavoriteBadgeWithDisplayScale:](self, "_createLegacyEnabledUnfavoriteBadgeWithDisplayScale:");
          break;
        case 4:
          -[PXPeopleBadgeViewConfiguration displayScale](v9, "displayScale");
          -[PXPeopleBadgeView _createLegacyDisabledUnfavoriteBadgeWithDisplayScale:](self, "_createLegacyDisabledUnfavoriteBadgeWithDisplayScale:");
          break;
        case 5:
          -[PXPeopleBadgeViewConfiguration displayScale](v9, "displayScale");
          -[PXPeopleBadgeView _createCheckmarkBadgeWithDisplayScale:](self, "_createCheckmarkBadgeWithDisplayScale:");
          break;
        case 6:
          -[PXPeopleBadgeViewConfiguration displayScale](v9, "displayScale");
          -[PXPeopleBadgeView _createFavoriteBadgeWithDisplayScale:](self, "_createFavoriteBadgeWithDisplayScale:");
          break;
        case 7:
          -[PXPeopleBadgeViewConfiguration displayScale](v9, "displayScale");
          -[PXPeopleBadgeView _createUnfavoriteBadgeWithDisplayScale:](self, "_createUnfavoriteBadgeWithDisplayScale:");
          break;
        default:
          break;
      }
    }
  }

}

- (void)setClippingRect:(CGRect)a3
{
  id v5;

  if (!CGRectEqualToRect(a3, *MEMORY[0x1E0C9D5E0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBadgeView.m"), 221, CFSTR("Clipping isn't supported"));

  }
}

- (id)_currentTintColor
{
  UIColor *currentTintColor;
  void *v4;
  UIColor *v5;
  UIColor *v6;
  _QWORD v8[4];
  id v9;
  id location;

  currentTintColor = self->_currentTintColor;
  if (!currentTintColor)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3658];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__PXPeopleBadgeView__currentTintColor__block_invoke;
    v8[3] = &unk_1E5131FF0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "colorWithDynamicProvider:", v8);
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentTintColor;
    self->_currentTintColor = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    currentTintColor = self->_currentTintColor;
  }
  return currentTintColor;
}

- (id)_smallConfiguration
{
  UIImageSymbolConfiguration *smallConfiguration;
  UIImageSymbolConfiguration *v4;
  UIImageSymbolConfiguration *v5;

  smallConfiguration = self->_smallConfiguration;
  if (!smallConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 29.0);
    v4 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v5 = self->_smallConfiguration;
    self->_smallConfiguration = v4;

    smallConfiguration = self->_smallConfiguration;
  }
  return smallConfiguration;
}

- (id)_largeConfiguration
{
  UIImageSymbolConfiguration *largeConfiguration;
  UIImageSymbolConfiguration *v4;
  UIImageSymbolConfiguration *v5;

  largeConfiguration = self->_largeConfiguration;
  if (!largeConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 3, 29.0);
    v4 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v5 = self->_largeConfiguration;
    self->_largeConfiguration = v4;

    largeConfiguration = self->_largeConfiguration;
  }
  return largeConfiguration;
}

- (id)_favoriteConfiguration
{
  UIImageSymbolConfiguration *favoriteConfiguration;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageSymbolConfiguration *v10;
  UIImageSymbolConfiguration *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  favoriteConfiguration = self->_favoriteConfiguration;
  if (!favoriteConfiguration)
  {
    v4 = (void *)MEMORY[0x1E0DC3888];
    -[PXPeopleBadgeView _currentTintColor](self, "_currentTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithPaletteColors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleBadgeView _largeConfiguration](self, "_largeConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationByApplyingConfiguration:", v8);
    v10 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v11 = self->_favoriteConfiguration;
    self->_favoriteConfiguration = v10;

    favoriteConfiguration = self->_favoriteConfiguration;
  }
  return favoriteConfiguration;
}

- (id)_unfavoriteConfiguration
{
  UIImageSymbolConfiguration *unfavoriteConfiguration;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageSymbolConfiguration *v10;
  UIImageSymbolConfiguration *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  unfavoriteConfiguration = self->_unfavoriteConfiguration;
  if (!unfavoriteConfiguration)
  {
    v4 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithPaletteColors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleBadgeView _smallConfiguration](self, "_smallConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationByApplyingConfiguration:", v8);
    v10 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v11 = self->_unfavoriteConfiguration;
    self->_unfavoriteConfiguration = v10;

    unfavoriteConfiguration = self->_unfavoriteConfiguration;
  }
  return unfavoriteConfiguration;
}

- (id)_checkmarkConfiguration
{
  UIImageSymbolConfiguration *checkmarkConfiguration;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageSymbolConfiguration *v10;
  UIImageSymbolConfiguration *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  checkmarkConfiguration = self->_checkmarkConfiguration;
  if (!checkmarkConfiguration)
  {
    v4 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    -[PXPeopleBadgeView _currentTintColor](self, "_currentTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithPaletteColors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleBadgeView _largeConfiguration](self, "_largeConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationByApplyingConfiguration:", v8);
    v10 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v11 = self->_checkmarkConfiguration;
    self->_checkmarkConfiguration = v10;

    checkmarkConfiguration = self->_checkmarkConfiguration;
  }
  return checkmarkConfiguration;
}

- (PXPeopleBadgeViewDelegate)badgeViewDelegate
{
  return (PXPeopleBadgeViewDelegate *)objc_loadWeakRetained((id *)&self->_badgeViewDelegate);
}

- (void)setBadgeViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_badgeViewDelegate, a3);
}

- (PXPeopleBadgeViewConfiguration)userData
{
  return self->_userData;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIButton)legacyFavoriteButton
{
  return self->_legacyFavoriteButton;
}

- (UIButton)legacyFavoriteBackground
{
  return self->_legacyFavoriteBackground;
}

- (UIButton)legacyUnfavoriteButton
{
  return self->_legacyUnfavoriteButton;
}

- (UIButton)checkmarkView
{
  return self->_checkmarkView;
}

- (UIButton)checkmarkCircle
{
  return self->_checkmarkCircle;
}

- (UIButton)favoriteButton
{
  return self->_favoriteButton;
}

- (UIButton)unfavoriteButton
{
  return self->_unfavoriteButton;
}

- (UIColor)currentTintColor
{
  return self->_currentTintColor;
}

- (UIImageSymbolConfiguration)smallConfiguration
{
  return self->_smallConfiguration;
}

- (UIImageSymbolConfiguration)largeConfiguration
{
  return self->_largeConfiguration;
}

- (UIImageSymbolConfiguration)favoriteConfiguration
{
  return self->_favoriteConfiguration;
}

- (UIImageSymbolConfiguration)unfavoriteConfiguration
{
  return self->_unfavoriteConfiguration;
}

- (UIImageSymbolConfiguration)checkmarkConfiguration
{
  return self->_checkmarkConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkConfiguration, 0);
  objc_storeStrong((id *)&self->_unfavoriteConfiguration, 0);
  objc_storeStrong((id *)&self->_favoriteConfiguration, 0);
  objc_storeStrong((id *)&self->_largeConfiguration, 0);
  objc_storeStrong((id *)&self->_smallConfiguration, 0);
  objc_storeStrong((id *)&self->_currentTintColor, 0);
  objc_storeStrong((id *)&self->_unfavoriteButton, 0);
  objc_storeStrong((id *)&self->_favoriteButton, 0);
  objc_storeStrong((id *)&self->_checkmarkCircle, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_legacyUnfavoriteButton, 0);
  objc_storeStrong((id *)&self->_legacyFavoriteBackground, 0);
  objc_storeStrong((id *)&self->_legacyFavoriteButton, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_destroyWeak((id *)&self->_badgeViewDelegate);
}

id __38__PXPeopleBadgeView__currentTintColor__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __35__PXPeopleBadgeView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  id v4;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "sizeThatFits:", v2, v3);
  PXSizeGetAspectRatio();
  PXRectWithAspectRatioFittingRect();
  PXRectScaleFromCenter();
  objc_msgSend(v4, "setFrame:");

}

@end
