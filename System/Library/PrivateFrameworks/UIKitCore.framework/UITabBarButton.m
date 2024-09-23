@implementation UITabBarButton

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITabBarButton;
  -[UIView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v5 != v7)
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarButton _setupSymbolConfigurationsForIdiom:](self, "_setupSymbolConfigurationsForIdiom:", objc_msgSend(v8, "userInterfaceIdiom"));

  }
  -[UIView traitCollection](self, "traitCollection");

  if (self->_vibrancyEffectView)
    -[UITabBarButton _updateVibrancyEffectView](self, "_updateVibrancyEffectView");
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "legibilityWeight");
  v11 = objc_msgSend(v4, "legibilityWeight");

  if (v10 != v11)
    -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBarButton;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[UIImageView setSemanticContentAttribute:](self->_imageView, "setSemanticContentAttribute:", a3);
  -[UILabel setSemanticContentAttribute:](self->_label, "setSemanticContentAttribute:", a3);
}

- (void)setLayoutStyle:(int64_t)a3
{
  UITabBarButtonLabel *label;
  void *v5;

  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    label = self->_label;
    if (label)
    {
      -[UIView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarButtonLabel _updateForFontChangeWithIdiom:](label, "_updateForFontChangeWithIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));

    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UITabBarButton)initWithImage:(id)a3 landscapeImage:(id)a4 selectedImage:(id)a5 landscapeSelectedImage:(id)a6 label:(id)a7 withInsets:(UIEdgeInsets)a8 landscapeInsets:(UIEdgeInsets)a9 tabBar:(id)a10
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UITabBarButtonLabel *v35;
  double v36;
  double v37;
  UITabBarButton *v38;
  UITabBarButton *v39;
  void *v40;
  UITabBarSwappableImageView *v41;
  UITabBarSwappableImageView *imageView;
  void *v43;
  id v44;
  UITabBarButton *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v53;
  id v55;
  _QWORD v56[4];
  UITabBarButton *v57;
  id v58;
  objc_super v59;

  right = a8.right;
  bottom = a8.bottom;
  left = a8.left;
  top = a8.top;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a10;
  if (v20)
  {
    objc_msgSend(v20, "size");
    v27 = v26;
    v29 = v28;
  }
  else
  {
    v27 = *MEMORY[0x1E0C9D820];
    v29 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v30 = (double *)MEMORY[0x1E0C9D538];
  if (v22)
  {
    objc_msgSend(v22, "size");
    if (v31 > v27)
      v27 = v31;
    if (v32 > v29)
      v29 = v32;
  }
  v33 = *v30;
  v34 = v30[1];
  if (v24)
  {
    v35 = objc_alloc_init(UITabBarButtonLabel);
    -[UIView setOpaque:](v35, "setOpaque:", 0);
    -[UITabBarButtonLabel updateTextColorsForState](v35, "updateTextColorsForState");
    -[UIView setBackgroundColor:](v35, "setBackgroundColor:", 0);
    -[UILabel setText:](v35, "setText:", v24);
    -[UILabel setAdjustsLetterSpacingToFitWidth:](v35, "setAdjustsLetterSpacingToFitWidth:", 1);
    -[UIView sizeToFit](v35, "sizeToFit");
    -[UIView frame](v35, "frame");
  }
  else
  {
    v35 = 0;
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  if (v36 + 2.0 <= v27)
    v37 = v27;
  else
    v37 = v36 + 2.0;
  v59.receiver = self;
  v59.super_class = (Class)UITabBarButton;
  v38 = -[UIControl initWithFrame:](&v59, sel_initWithFrame_, v33, v34, v37, v29);
  v39 = v38;
  if (v38)
  {
    v53 = v24;
    v55 = v23;
    v40 = v25;
    objc_storeWeak((id *)&v38->_tabBar, v25);
    if (v20)
    {
      v41 = -[UITabBarSwappableImageView initWithImage:alternateImage:landscapeImage:landscapeAlternateImage:]([UITabBarSwappableImageView alloc], "initWithImage:alternateImage:landscapeImage:landscapeAlternateImage:", v20, v22, v21, v23);
      imageView = v39->_imageView;
      v39->_imageView = v41;

      -[UIView setUserInteractionEnabled:](v39->_imageView, "setUserInteractionEnabled:", 0);
      -[UIView setOpaque:](v39->_imageView, "setOpaque:", 0);
      -[UIView traitCollection](v39, "traitCollection");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarButton _setupSymbolConfigurationsForIdiom:](v39, "_setupSymbolConfigurationsForIdiom:", objc_msgSend(v43, "userInterfaceIdiom"));

    }
    v44 = v21;
    objc_storeStrong((id *)&v39->_label, v35);
    -[UITabBarButtonLabel setTabBarButton:](v39->_label, "setTabBarButton:", v39);
    v39->_imageInsets.top = top;
    v39->_imageInsets.left = left;
    v39->_imageInsets.bottom = bottom;
    v39->_imageInsets.right = right;
    v39->_imageLandscapeInsets = a9;
    -[UIView setOpaque:](v39, "setOpaque:", 0);
    -[UIView addSubview:](v39, "addSubview:", v39->_imageView);
    -[UIView addSubview:](v39, "addSubview:", v39->_label);
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __124__UITabBarButton_initWithImage_landscapeImage_selectedImage_landscapeSelectedImage_label_withInsets_landscapeInsets_tabBar___block_invoke;
    v56[3] = &unk_1E16B1B50;
    v45 = v39;
    v57 = v45;
    v58 = v40;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v56);
    -[UIView addSubview:](v45, "addSubview:", v45->_vibrancyEffectView);
    -[UIView setNeedsLayout](v45, "setNeedsLayout");
    v46 = (void *)objc_opt_new();
    -[UIView _setIdleModeLayoutAttributes:](v45, "_setIdleModeLayoutAttributes:", v46);
    -[UIView traitCollection](v45, "traitCollection");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "userInterfaceIdiom");

    if (v48 == 3)
      -[UITabBarButton _setupCarplayConstraints](v45, "_setupCarplayConstraints");

    v21 = v44;
    v23 = v55;
    v25 = v40;
    v24 = v53;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObserver:selector:name:object:", v39, sel__accessibilityButtonShapesDidChangeNotification_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObserver:selector:name:object:", v39, sel__accessibilityHighContractFocusIndicatorDidChangeNotification_, CFSTR("UIAccessibilityHighContrastFocusIndicatorChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObserver:selector:name:object:", v39, sel__accessibilityGrayStatusDidChangeNotification_, CFSTR("UIAccessibilityGrayscaleStatusDidChangeNotification"), 0);

  v39->_accessibilityGrayStatusEnabled = _AXSGrayscaleEnabled() != 0;
  v39->_accessibilityHighContractFocusIndicatorEnabled = _AXSHighContrastFocusIndicatorsEnabled() != 0;
  v39->_accessibilityButtonShapesEnabled = _AXSButtonShapesEnabled() != 0;

  return v39;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  UITabBarButton *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  UIVisualEffectView *vibrancyEffectView;
  _BOOL8 v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UITabBarButton;
  -[UIView layoutSubviews](&v15, sel_layoutSubviews);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (self->_badge)
  {
    _UIBadgeGetTabBarVisualStyle(v4, self->_layoutStyle);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBadgeView setStyle:](self->_badge, "setStyle:", v5);

  }
  -[UITabBarButton _setupSymbolConfigurationsForIdiom:](self, "_setupSymbolConfigurationsForIdiom:", v4);
  switch(v4)
  {
    case 8:
      goto LABEL_6;
    case 3:
      break;
    case 2:
LABEL_6:
      -[UITabBarButton _appleTV_layoutSubviews](self, "_appleTV_layoutSubviews");
      break;
    default:
      -[UITabBarButton _ios_layoutSubviews](self, "_ios_layoutSubviews");
      break;
  }
  -[UITabBarButton _updateSelectedIndicatorFrame](self, "_updateSelectedIndicatorFrame");
  -[UITabBarButton _positionBadge](self, "_positionBadge");
  v6 = self;
  WeakRetained = objc_loadWeakRetained((id *)&v6->_tabBar);
  if (!v6->_itemVibrantEffect)
  {
    vibrancyEffectView = v6->_vibrancyEffectView;
    if (vibrancyEffectView)
    {
      -[UIView removeFromSuperview](vibrancyEffectView, "removeFromSuperview");
      v11 = v6->_vibrancyEffectView;
      v6->_vibrancyEffectView = 0;
      v9 = v6;
      v10 = v6;
      goto LABEL_15;
    }
    v9 = v6;
LABEL_17:
    v10 = v6;
    goto LABEL_18;
  }
  -[UITabBarButton _updateVibrancyEffectView](v6, "_updateVibrancyEffectView");
  -[UIView bounds](v6, "bounds");
  -[UIView setFrame:](v6->_vibrancyEffectView, "setFrame:");
  v8 = -[UITabBarButton _currentItemState](v6, "_currentItemState");
  v9 = v6;
  if (-[UITabBarButton labelShouldUseVibrancyForState:](v6, "labelShouldUseVibrancyForState:", v8))
  {
    -[UIVisualEffectView contentView](v6->_vibrancyEffectView, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!-[UITabBarButton iconShouldUseVibrancyForState:](v6, "iconShouldUseVibrancyForState:", v8))
    goto LABEL_17;
  -[UIVisualEffectView contentView](v6->_vibrancyEffectView, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
LABEL_15:

LABEL_18:
  v13 = v6->_vibrancyEffectView == 0;
  -[UIView layer](v6, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupOpacity:", v13);

  objc_msgSend(v10, "addSubview:", v6->_imageView);
  objc_msgSend(v9, "addSubview:", v6->_label);
  -[UIView bringSubviewToFront:](v6, "bringSubviewToFront:", self->_badge);

}

- (void)_updateToMatchCurrentState
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  double v9;
  double v10;
  int v11;
  int64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UITabBarSwappableImageView *v18;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (-[UITabBarButton _showsHighlightedState](self, "_showsHighlightedState"))
    v5 = -[UIControl isHighlighted](self, "isHighlighted");
  else
    v5 = 0;
  -[UITabBarButton _showsHighlightedState](self, "_showsHighlightedState");
  -[UITabBarButtonLabel setSelected:](self->_label, "setSelected:", self->_selected);
  -[UITabBarButtonLabel setHighlighted:](self->_label, "setHighlighted:", v5);
  if (self->_itemAppearanceData)
  {
    -[UITabBarButtonLabel updateTextColorsForState](self->_label, "updateTextColorsForState");
    -[UIView sizeToFit](self->_label, "sizeToFit");
  }
  v18 = self->_imageView;
  -[UITabBarSwappableImageView showAlternateImage:](v18, "showAlternateImage:", self->_selected);
  if (v18)
  {
    v6 = -[UITabBarButton _currentItemState](self, "_currentItemState");
    if (-[UITabBarButton iconShouldUseVibrancyForState:](self, "iconShouldUseVibrancyForState:", v6))
    {
      v7 = 0;
    }
    else
    {
      if (self->_layoutStyle == 3)
        -[UITabBarButton _contentTintColorForState:](self, "_contentTintColorForState:", v5 | (4 * self->_selected));
      else
        -[UITabBarButton iconColorForState:](self, "iconColorForState:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[UITabBarButton isDefaultTVLayout](self, "isDefaultTVLayout"))
    {
      if (-[UITabBarButton isDefaultColor:forState:](self, "isDefaultColor:forState:", v7, v6))
      {
        v8 = -[UITabBarButton defaultCompositingModeForState:](self, "defaultCompositingModeForState:", v6);
        -[UITabBarButton defaultAlphaForState:](self, "defaultAlphaForState:", v6);
        v10 = v9;
      }
      else
      {
        v8 = 0;
        v10 = 1.0;
      }
      v11 = _AXSEnhanceBackgroundContrastEnabled();
      if (v11)
        v12 = 0;
      else
        v12 = v8;
      if (v11)
        v13 = 1.0;
      else
        v13 = v10;
      -[UIView setAlpha:](v18, "setAlpha:", v13);
      -[UIView setCompositingMode:](v18, "setCompositingMode:", v12);
    }
    -[UIView setTintColor:](v18, "setTintColor:", v7);

  }
  -[UITabBarButton _buttonTintColorForState:](self, "_buttonTintColorForState:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self, "setTintColor:", v14);

  if (v4 == 3)
  {
    if (v5)
    {
      -[UIView tintColor](self, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarButton focusView](self, "focusView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBackgroundColor:", v15);

    }
    else
    {
      -[UITabBarButton focusView](self, "focusView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBackgroundColor:", 0);
    }

    goto LABEL_34;
  }
  if (!v5)
  {
LABEL_34:
    v17 = 0;
    goto LABEL_35;
  }
  v17 = 0;
  if (v4 != 2 && v4 != 8)
  {
    -[UIView tintColor](self, "tintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_35:
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v17);
  -[UITabBarButton _updateBadgeAppearanceAndLayoutNow:](self, "_updateBadgeAppearanceAndLayoutNow:", 0);
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)_showsHighlightedState
{
  return self->_showsHighlightedState;
}

- (BOOL)iconShouldUseVibrancyForState:(int64_t)a3
{
  id WeakRetained;
  int64_t layoutStyle;
  id v7;
  void *v8;
  UITabBarSwappableImageView *imageView;
  BOOL v10;
  void *v11;
  _UITabBarItemData *itemAppearanceData;

  if (!self->_itemVibrantEffect)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  layoutStyle = self->_layoutStyle;
  v7 = WeakRetained;
  v8 = v7;
  if (a3 == 2 || layoutStyle == 3 || layoutStyle == 4 && !objc_msgSend(v7, "_vibrantLabels"))
  {
    v10 = 0;
    v11 = v8;
  }
  else
  {

    imageView = self->_imageView;
    if (self->_layoutStyle == 2)
      -[UITabBarSwappableImageView _unselectedCompactImage](imageView, "_unselectedCompactImage");
    else
      -[UITabBarSwappableImageView _unselectedImage](imageView, "_unselectedImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "renderingMode") == 1)
    {
      v10 = 0;
      goto LABEL_10;
    }
    itemAppearanceData = self->_itemAppearanceData;
    if (!itemAppearanceData)
    {
      v10 = 1;
      goto LABEL_10;
    }
    -[_UITabBarItemData iconColorForState:](itemAppearanceData, "iconColorForState:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 == 0;
  }

LABEL_10:
  return v10;
}

uint64_t __53__UITabBarButton__updateBadgeAppearanceAndLayoutNow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_currentItemState");
  objc_msgSend(*(id *)(a1 + 32), "badgeBackgroundColorForState:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setBadgeColor:", v3);

  objc_msgSend(*(id *)(a1 + 32), "badgeTextAttributesForState:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setTextAttributes:", v4);

  objc_msgSend(*(id *)(a1 + 32), "badgeTitlePositionAdjustmentForState:", v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setTextOffset:");
}

- (int64_t)_currentItemState
{
  if (!-[UIControl isEnabled](self, "isEnabled"))
    return 3;
  if (-[UIView isFocused](self, "isFocused"))
    return 4;
  if (-[UIControl isHighlighted](self, "isHighlighted") && self->_showsHighlightedState)
    return 1;
  return 2 * self->_selected;
}

- (UIOffset)badgeTitlePositionAdjustmentForState:(int64_t)a3
{
  _UITabBarItemData *itemAppearanceData;
  double v4;
  double v5;
  UIOffset result;

  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData)
  {
    -[_UITabBarItemData badgeTitlePositionAdjustmentForState:](itemAppearanceData, "badgeTitlePositionAdjustmentForState:", a3);
  }
  else
  {
    v5 = 0.0;
    v4 = 0.0;
  }
  result.vertical = v5;
  result.horizontal = v4;
  return result;
}

- (id)badgeTextAttributesForState:(int64_t)a3
{
  _UITabBarItemData *itemAppearanceData;
  void *v6;
  void *v7;
  NSMutableDictionary *badgeTextAttributesForState;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData)
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabBarItemData badgeTextAttributesForState:compatibleWithTraitCollection:](itemAppearanceData, "badgeTextAttributesForState:compatibleWithTraitCollection:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    switch(a3)
    {
      case 0:
        -[NSMutableDictionary objectForKeyedSubscript:](self->_badgeTextAttributesForState, "objectForKeyedSubscript:", &unk_1E1A97020);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        return v7;
      case 1:
        badgeTextAttributesForState = self->_badgeTextAttributesForState;
        v9 = &unk_1E1A97038;
        goto LABEL_10;
      case 2:
        badgeTextAttributesForState = self->_badgeTextAttributesForState;
        v9 = &unk_1E1A97050;
        goto LABEL_10;
      case 3:
        badgeTextAttributesForState = self->_badgeTextAttributesForState;
        v9 = &unk_1E1A97068;
        goto LABEL_10;
      case 4:
        badgeTextAttributesForState = self->_badgeTextAttributesForState;
        v9 = &unk_1E1A97080;
LABEL_10:
        -[NSMutableDictionary objectForKeyedSubscript:](badgeTextAttributesForState, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_badgeTextAttributesForState, "objectForKeyedSubscript:", &unk_1E1A97020);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v7 = v12;

        break;
      default:
        v7 = 0;
        break;
    }
  }
  return v7;
}

- (id)badgeBackgroundColorForState:(int64_t)a3
{
  UIColor *v3;

  if (self->_itemAppearanceData)
  {
    -[_UITabBarItemData badgeBackgroundColorForState:](self->_itemAppearanceData, "badgeBackgroundColorForState:", a3);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_badgeColor;
  }
  return v3;
}

- (void)_updateBadgeAppearanceAndLayoutNow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UITabBarButton__updateBadgeAppearanceAndLayoutNow___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (v3)
    -[UITabBarButton _positionBadgeAfterChangesIfNecessary:](self, "_positionBadgeAfterChangesIfNecessary:", v5);
  else
    (*((void (**)(void *))v5 + 2))(v5);

}

- (id)_buttonTintColorForState:(unint64_t)a3
{
  NSMutableDictionary *buttonTintColorsForState;
  void *v4;
  void *v5;

  buttonTintColorsForState = self->_buttonTintColorsForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonTintColorsForState, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isDefaultTVLayout
{
  return 0;
}

- (UITabBar)tabBar
{
  return (UITabBar *)objc_loadWeakRetained((id *)&self->_tabBar);
}

- (id)iconColorForState:(int64_t)a3
{
  _UITabBarItemData *itemAppearanceData;
  void *v6;
  id v7;
  void *v8;
  NSMutableDictionary *contentTintColorsForState;
  void *v10;

  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData)
  {
    -[_UITabBarItemData iconColorForState:](itemAppearanceData, "iconColorForState:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[UITabBarButton defaultColorForState:](self, "defaultColorForState:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_7;
    }
    v7 = v6;
    v8 = v7;
  }
  else
  {
    contentTintColorsForState = self->_contentTintColorsForState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4 * (a3 == 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](contentTintColorsForState, "objectForKeyedSubscript:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;
LABEL_7:

  return v10;
}

- (UIColor)_defaultUnselectedLabelTintColor
{
  return self->_defaultUnselectedLabelTintColor;
}

- (void)_positionBadge
{
  _UIBadgeView *badge;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  void *imageView;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  int v33;
  int64_t layoutStyle;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat rect;
  void *rect_8;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  badge = self->_badge;
  if (badge)
  {
    -[_UIBadgeView style](badge, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _UIBadgeGetTabBarVisualStyle(objc_msgSend(v5, "userInterfaceIdiom"), self->_layoutStyle);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBadgeView setStyle:](self->_badge, "setStyle:", v6);

    }
    -[_UIBadgeView sizeThatFits:](self->_badge, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v8 = v7;
    v10 = v9;
    -[UIView frame](self->_badge, "frame");
    if (v8 != v12 || v10 != v11)
    {
      -[UIView sizeToFit](self->_badge, "sizeToFit");
      -[UIView setNeedsLayout](self->_badge, "setNeedsLayout");
      -[UIView layoutIfNeeded](self->_badge, "layoutIfNeeded");
    }
    -[UIView superview](self, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_23;
    rect_8 = v14;
    -[UIView frame](self->_badge, "frame");
    rect = v15;
    v17 = v16;
    v19 = v18;
    -[UITabBarButton badgePositionAdjustmentForState:](self, "badgePositionAdjustmentForState:", -[UITabBarButton _currentItemState](self, "_currentItemState"));
    v21 = v20;
    imageView = self->_imageView;
    if (!imageView)
      imageView = self->_label;
    objc_msgSend(imageView, "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", rect_8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v32 = v21 + v31;
    v33 = *((_DWORD *)&self->super.super._viewFlags + 4);
    UIRoundToViewScale(self);
    layoutStyle = self->_layoutStyle;
    if (layoutStyle && layoutStyle != 3)
    {
      v39 = v24;
      v40 = v26;
      v41 = v28;
      v42 = v30;
      if ((v33 & 0x80000) != 0)
      {
        CGRectGetMinX(*(CGRect *)&v39);
        goto LABEL_21;
      }
      CGRectGetMaxX(*(CGRect *)&v39);
      UIRoundToViewScale(self);
      v62.origin.x = rect;
      v62.origin.y = v32;
      v62.size.width = v17;
      v62.size.height = v19;
      CGRectGetWidth(v62);
    }
    else
    {
      v35 = v24;
      v36 = v26;
      v37 = v28;
      v38 = v30;
      if ((v33 & 0x80000) == 0)
      {
        CGRectGetMaxX(*(CGRect *)&v35);
LABEL_21:
        UIRoundToViewScale(self);
        goto LABEL_22;
      }
      CGRectGetMinX(*(CGRect *)&v35);
      UIRoundToViewScale(self);
      v61.origin.x = rect;
      v61.origin.y = v32;
      v61.size.width = v17;
      v61.size.height = v19;
      CGRectGetWidth(v61);
    }
LABEL_22:
    objc_msgSend(rect_8, "bounds");
    v64 = CGRectInset(v63, 6.0, 0.0);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", rect_8, v64.origin.x, v64.origin.y, v64.size.width, v64.size.height);
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    -[UIView bounds](self, "bounds");
    v69.origin.x = v51;
    v69.origin.y = v52;
    v69.size.width = v53;
    v69.size.height = v54;
    v65.origin.x = v44;
    v65.origin.y = v46;
    v65.size.width = v48;
    v65.size.height = v50;
    v66 = CGRectIntersection(v65, v69);
    x = v66.origin.x;
    y = v66.origin.y;
    width = v66.size.width;
    height = v66.size.height;
    CGRectGetMinX(v66);
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    CGRectGetMaxX(v67);
    v68.origin.x = rect;
    v68.origin.y = v32;
    v68.size.width = v17;
    v68.size.height = v19;
    CGRectGetWidth(v68);
    UIRoundToViewScale(self);
    -[UIView setFrame:](self->_badge, "setFrame:");
    v14 = rect_8;
LABEL_23:

  }
}

- (void)_updateSelectedIndicatorFrame
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  UIImage *customSelectedIndicatorImage;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id WeakRetained;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  if (self->_selectedIndicator)
  {
    -[UIView bounds](self, "bounds");
    v30 = CGRectInset(v29, 0.0, 2.0);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    -[UIView superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      customSelectedIndicatorImage = self->_customSelectedIndicatorImage;
      if (customSelectedIndicatorImage)
      {
        if (!-[UIImage _isResizable](customSelectedIndicatorImage, "_isResizable"))
        {

          goto LABEL_15;
        }
        -[UIImage capInsets](self->_customSelectedIndicatorImage, "capInsets");
        if (v9 == 0.0)
        {
          -[UIImage capInsets](self->_customSelectedIndicatorImage, "capInsets");
          v11 = v10;

          if (v11 != 0.0)
          {
LABEL_9:
            if (self->_customSelectedIndicatorImage
              || !-[UITabBarButton _areTabBarButtonAccessibilityButtonShapesEnabled](self, "_areTabBarButtonAccessibilityButtonShapesEnabled"))
            {
LABEL_21:
              -[UIImageView image](self->_selectedIndicator, "image");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v23;
              if (v23 && (objc_msgSend(v23, "_isResizable") & 1) == 0)
              {
                objc_msgSend(v28, "size");
                if (v25 != width || v26 != height)
                {
                  v24 = v26;
                  x = x + floor((width - v25) * 0.5);
                  y = y + floor((height - v26) * 0.5);
                  width = v25;
                  goto LABEL_31;
                }
              }
              else if (width < 48.0)
              {
                v31.origin.x = x;
                v31.origin.y = y;
                v31.size.width = width;
                v31.size.height = height;
                v32 = CGRectInset(v31, -round((48.0 - width) * 0.5), 0.0);
                x = v32.origin.x;
                y = v32.origin.y;
                width = v32.size.width;
                v24 = v32.size.height;
LABEL_31:
                -[UIImageView setFrame:](self->_selectedIndicator, "setFrame:", x, y, width, v24);
                -[UIView setFrame:](self->_highContrastFocusIndicator, "setFrame:", x, y, width, v24);

                return;
              }
              v24 = height;
              goto LABEL_31;
            }
            if (-[UITabBarButton isDefaultTVLayout](self, "isDefaultTVLayout"))
            {
              -[UIImageView setHidden:](self->_selectedIndicator, "setHidden:", 1);
              -[UIView setHidden:](self->_highContrastFocusIndicator, "setHidden:", 1);
              goto LABEL_21;
            }
            WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
            v14 = WeakRetained;
            if (WeakRetained)
            {
              width = width + 0.0;
              objc_msgSend(WeakRetained, "bounds");
              height = v21 + -4.0 - fmax(_UIBackgroundExtensionForBar(v14), 0.0);
              -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v14, 0.0, 2.0);
              y = v22;
            }
LABEL_20:

            goto LABEL_21;
          }
LABEL_15:
          -[UIImage size](self->_customSelectedIndicatorImage, "size");
          height = v12;
          -[UIView bounds](self, "bounds");
          if (height <= v13)
          {
            -[UIView bounds](self, "bounds");
            y = floor((v19 - height) * 0.5);
            goto LABEL_21;
          }
          v14 = objc_loadWeakRetained((id *)&self->_tabBar);
          objc_msgSend(v14, "bounds");
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v14, x, floor((v15 - height) * 0.5), width, height);
          y = v16;
          width = v17;
          height = v18;
          goto LABEL_20;
        }
      }
    }

    goto LABEL_9;
  }
}

- (void)_ios_layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  int64_t layoutStyle;
  double v12;
  double v13;
  double v14;
  UITabBarSwappableImageView *imageView;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  int64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UITabBarButtonLabel *label;
  UITabBarSwappableImageView *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  UITabBarButtonLabel *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  int v64;
  UITabBarButton *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double MidY;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  UITabBarButtonLabel *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  UITabBarSwappableImageView *v81;
  void *v82;
  int v83;
  double v84;
  uint64_t v85;
  double *v86;
  double v87;
  double top;
  double left;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGRect v99;
  CGRect v100;

  -[UIView bounds](self, "bounds");
  v92 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  layoutStyle = self->_layoutStyle;
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v98 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  imageView = self->_imageView;
  v16 = v14;
  v17 = v13;
  if (imageView)
  {
    -[UITabBarSwappableImageView setLandscape:](imageView, "setLandscape:", layoutStyle == 2);
    -[UITabBarSwappableImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v7, v9);
    v17 = v18;
    v16 = v19;
    -[UIImageView image](self->_imageView, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasBaseline");

    if (v21)
      -[UIImageView setFrame:](self->_imageView, "setFrame:", v98, v12, v17, v16);
  }
  v97 = v12;
  v96 = v14;
  -[UITabBarButton titlePositionAdjustmentForState:](self, "titlePositionAdjustmentForState:", -[UITabBarButton _currentItemState](self, "_currentItemState"));
  v22 = self->_layoutStyle;
  -[UIView window](self, "window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "windowScene");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _UITabBarMetricsForStyleAndScene(v22, v24);
  v26 = v25;

  v27 = 49.0;
  if (layoutStyle == 2)
    v27 = 32.0;
  v93 = v9;
  v28 = v9 - v27;
  v29 = v28 + v26;
  label = self->_label;
  if (!self->_layoutStyle)
  {
    -[UITabBarButtonLabel resizeToFitWidth:](label, "resizeToFitWidth:", v7);
    v46 = self->_label;
    if (v46)
    {
      -[UIView frame](v46, "frame");
      UIFloorToViewScale(self);
      v48 = v47;
      -[UILabel _firstBaselineOffsetFromTop](self->_label, "_firstBaselineOffsetFromTop");
      UIFloorToViewScale(self);
      v5 = v49;
      UICeilToViewScale(self);
      v7 = v50;
      UICeilToViewScale(self);
      v52 = v51;
      v53 = v48;
      v96 = v52;
      v13 = v7;
      v95 = v5;
      v40 = v48;
      v32 = v16;
    }
    else
    {
      v95 = v97;
      v32 = v16;
      v40 = v98;
      v53 = v92;
      v52 = v93;
    }
    v60 = v5;
    v61 = v7;
    CGRectGetMidX(*(CGRect *)&v53);
    if (self->_imageView)
    {
      UIFloorToViewScale(self);
      v45 = v62;
      -[UIImageView image](self->_imageView, "image");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "hasBaseline");

      if (v64)
      {
        v55 = _yOffsetForBaselinedImageView(self->_imageView, self);
        v65 = self;
        v66 = v45;
        v67 = v55;
        v68 = v17;
        v69 = v32;
        MidY = v29;
        v71 = 1;
      }
      else
      {
        UIFloorToViewScale(self);
        top = self->_imageInsets.top;
        left = self->_imageInsets.left;
        v45 = v45 + left;
        v55 = v90 + top;
        v17 = v17 - (left + self->_imageInsets.right);
        v32 = v32 - (top + self->_imageInsets.bottom);
        v100.origin.x = v45;
        v100.origin.y = v55;
        v100.size.width = v17;
        v100.size.height = v32;
        MidY = CGRectGetMidY(v100);
        v65 = self;
        v66 = v45;
        v67 = v55;
        v68 = v17;
        v69 = v32;
        v71 = 0;
      }
      -[UITabBarButton _showBoundsViewAt:alignmentViewAt:forSymbolImage:](v65, "_showBoundsViewAt:alignmentViewAt:forSymbolImage:", v71, v66, v67, v68, v69, MidY);
    }
    else
    {
      v45 = v98;
      v55 = v97;
    }
    v38 = v96;
    v78 = v95;
    goto LABEL_39;
  }
  v31 = self->_imageView;
  if (!label)
  {
    v32 = v16;
    if (!v31)
    {
      v40 = v98;
      v45 = v98;
      v38 = v96;
      v55 = v97;
      v78 = v97;
      goto LABEL_39;
    }
    v91 = v29;
    UIFloorToViewScale(self);
    v45 = v54;
    v38 = v14;
    v55 = v97;
    v94 = v97;
    v40 = v98;
    goto LABEL_26;
  }
  v91 = v28 + v26;
  v32 = v16;
  if (!v31)
  {
    -[UITabBarButtonLabel resizeToFitWidth:](label, "resizeToFitWidth:", v7);
    -[UIView frame](self->_label, "frame");
    v94 = v56;
    v13 = v57;
    v38 = v58;
    UIFloorToViewScale(self);
    v40 = v59;
    v45 = v98;
    goto LABEL_19;
  }
  if (_UIIsFourInch())
    v33 = 5.0;
  else
    v33 = 6.0;
  -[UITabBarButtonLabel resizeToFitWidth:](self->_label, "resizeToFitWidth:", v7 - v33 - v17);
  -[UIView frame](self->_label, "frame");
  v35 = v34;
  v13 = v36;
  v38 = v37;
  UIFloorToViewScale(self);
  v40 = v39;
  v94 = v35;
  if (v10)
  {
    v41 = v35;
    v42 = v13;
    v43 = v38;
    CGRectGetMaxX(*(CGRect *)&v39);
    UIFloorToViewScale(self);
    v45 = v44;
LABEL_19:
    v55 = v97;
    goto LABEL_26;
  }
  v55 = v97;
  v72 = v97;
  v73 = v17;
  v74 = v32;
  CGRectGetMaxX(*(CGRect *)&v39);
  UIFloorToViewScale(self);
  v45 = v40;
  v40 = v75;
LABEL_26:
  v76 = self->_label;
  if (v76)
  {
    -[UILabel _firstBaselineOffsetFromTop](v76, "_firstBaselineOffsetFromTop");
    UIFloorToViewScale(self);
    v78 = v77;
    UICeilToViewScale(self);
    v13 = v79;
    UICeilToViewScale(self);
    v38 = v80;
  }
  else
  {
    v78 = v94;
  }
  v81 = self->_imageView;
  if (v81)
  {
    -[UIImageView image](v81, "image");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "hasBaseline");

    if (v83)
    {
      v55 = _yOffsetForBaselinedImageView(self->_imageView, self);
      -[UITabBarButton _showBoundsViewAt:alignmentViewAt:forSymbolImage:](self, "_showBoundsViewAt:alignmentViewAt:forSymbolImage:", 1, v45, v55, v17, v32, v91);
    }
    else
    {
      UIFloorToViewScale(self);
      v85 = 25;
      if (layoutStyle == 2)
        v85 = 26;
      v86 = (double *)((char *)self + OBJC_IVAR___UITabBarSwappableImageView__value[v85]);
      v87 = v86[1];
      v45 = v45 + v87;
      v55 = v84 + *v86;
      v17 = v17 - (v87 + v86[3]);
      v32 = v32 - (*v86 + v86[2]);
      v99.origin.x = v45;
      v99.origin.y = v55;
      v99.size.width = v17;
      v99.size.height = v32;
      -[UITabBarButton _showBoundsViewAt:alignmentViewAt:forSymbolImage:](self, "_showBoundsViewAt:alignmentViewAt:forSymbolImage:", 0, v45, v55, v17, v32, CGRectGetMidY(v99));
    }
  }
LABEL_39:
  -[UILabel setFrame:](self->_label, "setFrame:", v40, v78, v13, v38);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v45, v55, v17, v32);
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3
{
  double horizontal;
  double vertical;
  UIOffset result;

  if (self->_itemAppearanceData)
  {
    -[_UITabBarItemData titlePositionAdjustmentForState:](self->_itemAppearanceData, "titlePositionAdjustmentForState:", a3);
  }
  else
  {
    horizontal = self->_labelOffset.horizontal;
    vertical = self->_labelOffset.vertical;
  }
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)_showBoundsViewAt:(CGRect)a3 alignmentViewAt:(double)a4 forSymbolImage:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id *p_imageView;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  UITabBarButton *v32;
  id v33;
  id v34;
  CGRect v35;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tabBarSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "showAlignmentGuides");

  if (v14)
  {
    _viewForKey(self, &_MergedGlobals_35_0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    _viewForKey(self, &unk_1ECD79651);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    p_imageView = (id *)&self->_imageView;
    -[UIView superview](self->_imageView, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toView:", self, x, y, width, height);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    if (a5)
      +[UIColor greenColor](UIColor, "greenColor");
    else
      +[UIColor blueColor](UIColor, "blueColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35.origin.x = v19;
    v35.origin.y = v21;
    v35.size.width = v23;
    v35.size.height = v25;
    v36 = CGRectInset(v35, -1.0, -1.0);
    objc_msgSend(v15, "setFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
    v28 = objc_retainAutorelease(v27);
    v29 = objc_msgSend(v28, "CGColor");
    objc_msgSend(v15, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBorderColor:", v29);

    objc_msgSend(v15, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBorderWidth:", 1.0);

    objc_msgSend(v34, "setFrame:", v19 + -5.0, a4, v23 + 10.0, 1.0);
    objc_msgSend(v34, "setBackgroundColor:", v28);
    objc_msgSend(*p_imageView, "superview");
    v32 = (UITabBarButton *)objc_claimAutoreleasedReturnValue();
    if (v32 != self)
      p_imageView = (id *)&self->_vibrancyEffectView;
    v33 = *p_imageView;

    -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v15, v33);
    -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v34, v15);

  }
  else
  {
    objc_getAssociatedObject(self, &_MergedGlobals_35_0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeFromSuperview");

    objc_getAssociatedObject(self, &unk_1ECD79651);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeFromSuperview");
  }

}

- (BOOL)labelShouldUseVibrancyForState:(int64_t)a3
{
  id WeakRetained;
  int64_t layoutStyle;
  id v7;
  void *v8;
  _UITabBarItemData *itemAppearanceData;

  if (!self->_itemVibrantEffect)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  layoutStyle = self->_layoutStyle;
  v7 = WeakRetained;
  v8 = v7;
  if (a3 == 2 || layoutStyle == 3 || layoutStyle == 4 && (objc_msgSend(v7, "_vibrantLabels") & 1) == 0)
  {

    return 0;
  }

  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData)
    return !-[_UITabBarItemData titleTextAttributesSpecifyColorForState:](itemAppearanceData, "titleTextAttributesSpecifyColorForState:", a3);
  else
    return 1;
}

- (id)_contentTintColorForState:(unint64_t)a3
{
  NSMutableDictionary *contentTintColorsForState;
  void *v4;
  void *v5;

  contentTintColorsForState = self->_contentTintColorsForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](contentTintColorsForState, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __124__UITabBarButton_initWithImage_landscapeImage_selectedImage_landscapeSelectedImage_label_withInsets_landscapeInsets_tabBar___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 40), "_effectiveUnselectedLabelTintColor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 640);
  *(_QWORD *)(v3 + 640) = v2;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_effectiveUnselectedTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContentTintColor:forState:", v6, 0);

  v7 = *(void **)(a1 + 32);
  +[UIColor blackColor](UIColor, "blackColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContentTintColor:forState:", v8, 1);

}

- (void)_setContentTintColor:(id)a3 forState:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *contentTintColorsForState;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  char v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v6 = a3;
  contentTintColorsForState = self->_contentTintColorsForState;
  v15 = v6;
  if (v6)
  {
    if (!contentTintColorsForState)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_contentTintColorsForState;
      self->_contentTintColorsForState = v8;

      contentTintColorsForState = self->_contentTintColorsForState;
    }
  }
  else if (!contentTintColorsForState)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](contentTintColorsForState, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v15, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = self->_contentTintColorsForState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v15, v14);
    else
      -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

    -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
    -[UITabBarButtonLabel updateTextColorsForState](self->_label, "updateTextColorsForState");
  }
LABEL_10:

}

- (_UITabBarItemData)itemAppearanceData
{
  return self->_itemAppearanceData;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (id)defaultColorForState:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    v3 = 0;
  }
  else if (-[UITabBarButton isDefaultTVLayout](self, "isDefaultTVLayout"))
  {
    if (a3 == 4)
      +[UIColor blackColor](UIColor, "blackColor");
    else
      -[UITabBarButton _defaultUnselectedLabelTintColor](self, "_defaultUnselectedLabelTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.57254902, 0.85);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  objc_super v7;

  v3 = a3;
  if (-[UIControl isEnabled](self, "isEnabled") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarButton;
    -[UIControl setEnabled:](&v7, sel_setEnabled_, v3);
    -[UIView alpha](self, "alpha");
    if (v5 > 0.0)
    {
      v6 = 0.25;
      if (v3)
        v6 = 1.0;
      -[UIView setAlpha:](self, "setAlpha:", v6);
    }
  }
}

- (void)_setShowsHighlightedState:(BOOL)a3
{
  if (self->_showsHighlightedState != a3)
  {
    self->_showsHighlightedState = a3;
    -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
  }
}

- (void)_setBadgeOffset:(UIOffset)a3
{
  self->_badgeOffset = a3;
  -[UITabBarButton _positionBadge](self, "_positionBadge");
}

- (void)_setAppearanceGuideClass:(Class)a3
{
  objc_storeStrong((id *)&self->_appearanceGuideClass, a3);
  -[UITabBarButtonLabel _setAppearanceGuideClass:](self->_label, "_setAppearanceGuideClass:", a3);
}

- (void)_applyTabBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a3;
  v6 = a4;
  if (v6)
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, v6, (void *)1);
  if (v8)
  {
    -[UITabBarButtonLabel _applyTabBarButtonAppearanceStorage:withTaggedSelectors:](self->_label, "_applyTabBarButtonAppearanceStorage:withTaggedSelectors:", v8, v6);
    objc_msgSend(v8, "titleOffset");
    -[UITabBarButton _setTitlePositionAdjustment:](self, "_setTitlePositionAdjustment:");
    objc_msgSend(v8, "badgeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarButton _setBadgeColor:](self, "_setBadgeColor:", v7);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__UITabBarButton__applyTabBarButtonAppearanceStorage_withTaggedSelectors___block_invoke;
    v9[3] = &unk_1E16B73A8;
    v9[4] = self;
    objc_msgSend(v8, "enumerateBadgeTextAttributesWithBlock:", v9);
  }

}

- (void)_showSelectedIndicator:(BOOL)a3 changeSelection:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id WeakRetained;
  void *v8;
  void *v9;
  BOOL v10;
  UIImageView *selectedIndicator;
  UIImageView *v12;
  UIView *highContrastFocusIndicator;

  v4 = a4;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  objc_msgSend(WeakRetained, "_appearanceStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionIndicatorImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    v10 = -[UITabBarButton _areTabBarButtonAccessibilityButtonShapesEnabled](self, "_areTabBarButtonAccessibilityButtonShapesEnabled");

    if (!v10)
    {
      selectedIndicator = self->_selectedIndicator;
      goto LABEL_12;
    }
  }
  selectedIndicator = self->_selectedIndicator;
  if (!v5)
  {
    if (!selectedIndicator)
    {
LABEL_9:
      if (!v4)
        return;
      goto LABEL_10;
    }
LABEL_12:
    -[UIView removeFromSuperview](selectedIndicator, "removeFromSuperview");
    v12 = self->_selectedIndicator;
    self->_selectedIndicator = 0;

    -[UIView removeFromSuperview](self->_highContrastFocusIndicator, "removeFromSuperview");
    highContrastFocusIndicator = self->_highContrastFocusIndicator;
    self->_highContrastFocusIndicator = 0;

    if (!v4)
      return;
LABEL_10:
    -[UITabBarButton _setSelected:](self, "_setSelected:", v5);
    return;
  }
  if (selectedIndicator)
    goto LABEL_9;
  -[UITabBarButton _updateSelectedIndicatorView](self, "_updateSelectedIndicatorView");
  -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_selectedIndicator, 0);
  -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_highContrastFocusIndicator, self->_selectedIndicator);
  if (v4)
    goto LABEL_10;
}

- (BOOL)_areTabBarButtonAccessibilityButtonShapesEnabled
{
  return (self->_accessibilityGrayStatusEnabled
       || self->_accessibilityButtonShapesEnabled
       || self->_accessibilityHighContractFocusIndicatorEnabled)
      && objc_msgSend(-[UIView _screen](self, "_screen"), "_userInterfaceIdiom") != 3;
}

- (void)_setupSymbolConfigurationsForIdiom:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 1)
  {
    if (a3 == 3)
    {
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:");

    }
    else
    {
      -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", 0);
    }
  }
  else
  {
    -[_UITabBarItemData preferredSymbolConfiguration](self->_itemAppearanceData, "preferredSymbolConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (self->_layoutStyle == 3)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            v11 = "pad";
            if (!a3)
              v11 = "phone";
            *(_DWORD *)buf = 136315138;
            v14 = v11;
            _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "LayoutStyle is CarPlay when on %s idiom. Substituting Stacked style.", buf, 0xCu);
          }

        }
        else
        {
          v7 = _setupSymbolConfigurationsForIdiom____s_category;
          if (!_setupSymbolConfigurationsForIdiom____s_category)
          {
            v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v7, (unint64_t *)&_setupSymbolConfigurationsForIdiom____s_category);
          }
          v8 = *(NSObject **)(v7 + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            v9 = "pad";
            if (!a3)
              v9 = "phone";
            *(_DWORD *)buf = 136315138;
            v14 = v9;
            _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "LayoutStyle is CarPlay when on %s idiom. Substituting Stacked style.", buf, 0xCu);
          }
        }
      }
      +[_UITabBarItemData standardItemDataForStyle:](_UITabBarItemData, "standardItemDataForStyle:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredSymbolConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v5);

  }
}

- (void)setItemVibrantEffect:(id)a3
{
  UIVibrancyEffect *v5;
  UIVibrancyEffect *v6;

  v5 = (UIVibrancyEffect *)a3;
  if (self->_itemVibrantEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_itemVibrantEffect, a3);
    -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
    v5 = v6;
  }

}

- (void)setItemAppearanceData:(id)a3
{
  id v5;
  _UITabBarItemData *v6;
  _UITabBarItemData *v7;
  BOOL v8;
  _UITabBarItemData *v9;

  v5 = a3;
  v6 = self->_itemAppearanceData;
  v7 = (_UITabBarItemData *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_itemAppearanceData, a3);
    -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
  }
LABEL_9:

}

- (void)_setTabBarHitRect:(CGRect)a3
{
  self->_hitRect = a3;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITabBarButton;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v8, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 3)
    -[UITabBarButton _setupCarplayConstraints](self, "_setupCarplayConstraints");
  else
    -[UITabBarButton _removeCarplayConstraints](self, "_removeCarplayConstraints");
}

- (void)setCarplayConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_carplayConstraints, a3);
}

- (void)_removeCarplayConstraints
{
  void *v3;
  void *v4;
  void *v5;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 4);
  -[UITabBarButton focusView](self, "focusView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)MEMORY[0x1E0D156E0];
  -[UITabBarButton carplayConstraints](self, "carplayConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  -[UITabBarButton setCarplayConstraints:](self, "setCarplayConstraints:", 0);
}

- (UIView)focusView
{
  UIView *focusView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  focusView = self->_focusView;
  if (!focusView)
  {
    v4 = [UIView alloc];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_focusView;
    self->_focusView = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_focusView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](self->_focusView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 8.0);

    v8 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](self->_focusView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerCurve:", v8);

    -[UIView setUserInteractionEnabled:](self->_focusView, "setUserInteractionEnabled:", 0);
    focusView = self->_focusView;
  }
  return focusView;
}

- (NSArray)carplayConstraints
{
  return self->_carplayConstraints;
}

- (void)_setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
}

- (void)setSpringLoaded:(BOOL)a3
{
  -[UIView _setSpringLoaded:interactionInitializer:](self, a3, &__block_literal_global_74);
}

- (void)_setBadgeValue:(id)a3
{
  id v4;
  _UIBadgeView *badge;
  _UIBadgeView *v6;
  _UIBadgeView *v7;
  _UIBadgeView *v8;
  id v9;
  _QWORD v10[5];
  _UIBadgeView *v11;

  v4 = a3;
  badge = self->_badge;
  v9 = v4;
  if (v4)
  {
    if (!badge)
    {
      v7 = -[_UIBadgeView initWithText:]([_UIBadgeView alloc], "initWithText:", v4);
      v8 = self->_badge;
      self->_badge = v7;

      -[UIView addSubview:](self, "addSubview:", self->_badge);
      -[UITabBarButton _updateBadgeAppearanceAndLayoutNow:](self, "_updateBadgeAppearanceAndLayoutNow:", 1);
      goto LABEL_7;
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__UITabBarButton__setBadgeValue___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v10[4] = self;
    v11 = (_UIBadgeView *)v4;
    -[UITabBarButton _positionBadgeAfterChangesIfNecessary:](self, "_positionBadgeAfterChangesIfNecessary:", v10);
    v6 = v11;
  }
  else
  {
    -[UIView removeFromSuperview](badge, "removeFromSuperview");
    v6 = self->_badge;
    self->_badge = 0;
  }

LABEL_7:
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIAccessibilityHighContrastFocusIndicatorChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIAccessibilityGrayscaleStatusDidChangeNotification"), 0);

  v6.receiver = self;
  v6.super_class = (Class)UITabBarButton;
  -[UIView dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carplayConstraints, 0);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_itemVibrantEffect, 0);
  objc_storeStrong((id *)&self->_itemAppearanceData, 0);
  objc_storeStrong((id *)&self->_appearanceGuideClass, 0);
  objc_storeStrong((id *)&self->_focusView, 0);
  objc_storeStrong((id *)&self->_highContrastFocusIndicator, 0);
  objc_storeStrong((id *)&self->_badgeTextAttributesForState, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_defaultUnselectedLabelTintColor, 0);
  objc_storeStrong((id *)&self->_contentTintColorsForState, 0);
  objc_storeStrong((id *)&self->_buttonTintColorsForState, 0);
  objc_storeStrong((id *)&self->_customSelectedIndicatorImage, 0);
  objc_storeStrong((id *)&self->_selectedIndicator, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)_updateVibrancyEffectView
{
  UIVibrancyEffect *itemVibrantEffect;
  UIVisualEffectView *vibrancyEffectView;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;
  void *v7;
  UIVibrancyEffect *v8;

  itemVibrantEffect = self->_itemVibrantEffect;
  vibrancyEffectView = self->_vibrancyEffectView;
  v8 = itemVibrantEffect;
  if (vibrancyEffectView)
  {
    -[UIVisualEffectView setEffect:](vibrancyEffectView, "setEffect:", itemVibrantEffect);
  }
  else
  {
    v5 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", itemVibrantEffect);
    v6 = self->_vibrancyEffectView;
    self->_vibrancyEffectView = v5;

    -[UIVisualEffectView _setAllowsGroupFiltering:](self->_vibrancyEffectView, "_setAllowsGroupFiltering:", 0);
    -[UIVisualEffectView contentView](self->_vibrancyEffectView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 0);

    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_vibrancyEffectView, "setFrame:");
    -[UIView setUserInteractionEnabled:](self->_vibrancyEffectView, "setUserInteractionEnabled:", 0);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_vibrancyEffectView, 0);
  }

}

UISpringLoadedInteraction *__49__UITabBarButton_SpringLoading__setSpringLoaded___block_invoke()
{
  return -[UISpringLoadedInteraction initWithActivationHandler:]([UISpringLoadedInteraction alloc], "initWithActivationHandler:", &__block_literal_global_369);
}

- (id)titleTextAttributesForState:(int64_t)a3
{
  _UITabBarItemData *itemAppearanceData;
  void *v6;
  void *v7;
  void *v10;

  itemAppearanceData = self->_itemAppearanceData;
  if (!itemAppearanceData)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabBarButton.m"), 2222, CFSTR("This method should only be called when a UITabBarAppearance has been set"));

    itemAppearanceData = self->_itemAppearanceData;
  }
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabBarItemData titleTextAttributesForState:compatibleWithTraitCollection:](itemAppearanceData, "titleTextAttributesForState:compatibleWithTraitCollection:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_positionBadgeAfterChangesIfNecessary:(id)a3
{
  if (self->_badge)
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    -[UITabBarButton _positionBadge](self, "_positionBadge");
  }
}

- (UIOffset)badgePositionAdjustmentForState:(int64_t)a3
{
  _UITabBarItemData *itemAppearanceData;
  double v5;
  double horizontal;
  int64_t layoutStyle;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIOffset result;

  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData)
  {
    -[_UITabBarItemData badgePositionAdjustmentForState:](itemAppearanceData, "badgePositionAdjustmentForState:", a3);
    horizontal = v5;
  }
  else
  {
    horizontal = self->_badgeOffset.horizontal;
  }
  layoutStyle = self->_layoutStyle;
  -[UIView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _UITabBarAdjustBadgePositionForStyleAndScene(layoutStyle, v9, horizontal);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.vertical = v14;
  result.horizontal = v13;
  return result;
}

uint64_t __33__UITabBarButton__setBadgeValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setText:", *(_QWORD *)(a1 + 40));
}

- (CGRect)_contentRect
{
  UITabBarSwappableImageView *imageView;
  UITabBarButtonLabel *v4;
  UITabBarSwappableImageView *v5;
  UITabBarSwappableImageView *v6;
  BOOL v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  int64_t layoutStyle;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;
  CGRect v55;

  imageView = self->_imageView;
  v4 = self->_label;
  v5 = imageView;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    -[UIView frame](v4, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[UIView frame](v6, "frame");
    v55.origin.x = v16;
    v55.origin.y = v17;
    v55.size.width = v18;
    v55.size.height = v19;
    v51.origin.x = v9;
    v51.origin.y = v11;
    v51.size.width = v13;
    v51.size.height = v15;
    v52 = CGRectUnion(v51, v55);
LABEL_10:
    x = v52.origin.x;
    y = v52.origin.y;
    width = v52.size.width;
    height = v52.size.height;
    goto LABEL_11;
  }
  if (v4)
  {
    v5 = (UITabBarSwappableImageView *)v4;
LABEL_9:
    -[UIView frame](v5, "frame");
    goto LABEL_10;
  }
  if (v5)
    goto LABEL_9;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_11:

  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  if (!CGRectIsNull(v53))
  {
    -[UIView bounds](self, "bounds");
    v25 = v24;
    v27 = v26;
    +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tabBarSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    layoutStyle = self->_layoutStyle;
    if ((unint64_t)(layoutStyle - 1) >= 2)
    {
      v36 = 0.0;
      v34 = 0.0;
      v38 = 0.0;
      v32 = 0.0;
      if (layoutStyle)
      {
LABEL_24:
        x = x + v36;
        y = v25 + v32;
        width = width - (v36 + v38);
        height = v27 - (v34 + v32);

        goto LABEL_25;
      }
      objc_msgSend(v29, "stackedTopInset", 0.0);
      v32 = v39;
      objc_msgSend(v29, "stackedBottomInset");
      v41 = v40;
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      if (v41 >= v42)
      {
        objc_msgSend(v29, "stackedBottomInset");
        v34 = v43;
      }
      if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        objc_msgSend(v29, "stackedTrailingPadding");
        v36 = -v44;
        objc_msgSend(v29, "stackedLeadingPadding");
      }
      else
      {
        objc_msgSend(v29, "stackedLeadingPadding");
        v36 = -v46;
        objc_msgSend(v29, "stackedTrailingPadding");
      }
    }
    else
    {
      objc_msgSend(v29, "inlineTopInset");
      v32 = v31;
      objc_msgSend(v29, "inlineBottomInset");
      v34 = v33;
      if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        objc_msgSend(v29, "inlineTrailingPadding");
        v36 = -v35;
        objc_msgSend(v29, "inlineLeadingPadding");
      }
      else
      {
        objc_msgSend(v29, "inlineLeadingPadding");
        v36 = -v45;
        objc_msgSend(v29, "inlineTrailingPadding");
      }
    }
    v38 = -v37;
    goto LABEL_24;
  }
LABEL_25:
  v47 = x;
  v48 = y;
  v49 = width;
  v50 = height;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

- (id)_selectedIndicatorView
{
  return self->_selectedIndicator;
}

+ (id)_defaultLabelColor
{
  void *v2;
  UIColor *v3;
  void *v4;

  v2 = (void *)_defaultLabelColor___labelColor_0;
  if (!_defaultLabelColor___labelColor_0)
  {
    v3 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.57254902, 1.0);
    v4 = (void *)_defaultLabelColor___labelColor_0;
    _defaultLabelColor___labelColor_0 = (uint64_t)v3;

    v2 = (void *)_defaultLabelColor___labelColor_0;
  }
  return v2;
}

- (UITabBarButton)initWithImage:(id)a3 selectedImage:(id)a4 label:(id)a5 withInsets:(UIEdgeInsets)a6 tabBar:(id)a7
{
  return -[UITabBarButton initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:](self, "initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:", a3, 0, a4, 0, a5, a7, a6.top, a6.left, a6.bottom, a6.right, 0.0, 0.0, 0.0, 0.0);
}

- (void)_updateAfterTraitCollectionOrAccessibilityDidChangeTV
{
  _QWORD v3[5];

  if (self->_vibrancyEffectView)
  {
    -[UITabBarButton _updateVibrancyEffectView](self, "_updateVibrancyEffectView");
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __71__UITabBarButton__updateAfterTraitCollectionOrAccessibilityDidChangeTV__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v3);
    -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
    -[UITabBarButtonLabel updateTextColorsForState](self->_label, "updateTextColorsForState");
  }
}

void __71__UITabBarButton__updateAfterTraitCollectionOrAccessibilityDidChangeTV__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "tabBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveUnselectedLabelTintColor");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 640);
  *(_QWORD *)(v4 + 640) = v3;

  v6 = *(id **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6 + 92);
  objc_msgSend(WeakRetained, "_effectiveUnselectedTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContentTintColor:forState:", v8, 0);

  v9 = *(void **)(a1 + 32);
  +[UIColor blackColor](UIColor, "blackColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setContentTintColor:forState:", v10, 1);

}

- (void)setImage:(id)a3
{
  -[UIView _setContentImage:]((uint64_t)self->_imageView, a3);
}

- (CGRect)_tabBarHitRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_hitRect.origin.x;
  y = self->_hitRect.origin.y;
  width = self->_hitRect.size.width;
  height = self->_hitRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_accessibilityGrayStatusDidChangeNotification:(id)a3
{
  self->_accessibilityGrayStatusEnabled = _AXSGrayscaleEnabled() != 0;
  -[UITabBarButton _showSelectedIndicator:changeSelection:](self, "_showSelectedIndicator:changeSelection:", -[UITabBarButton _isSelected](self, "_isSelected"), 0);
}

- (void)_accessibilityHighContractFocusIndicatorDidChangeNotification:(id)a3
{
  self->_accessibilityHighContractFocusIndicatorEnabled = _AXSHighContrastFocusIndicatorsEnabled() != 0;
  -[UITabBarButton _showSelectedIndicator:changeSelection:](self, "_showSelectedIndicator:changeSelection:", -[UITabBarButton _isSelected](self, "_isSelected"), 0);
}

- (void)_accessibilityButtonShapesDidChangeNotification:(id)a3
{
  self->_accessibilityButtonShapesEnabled = _AXSButtonShapesEnabled() != 0;
  -[UITabBarButton _showSelectedIndicator:changeSelection:](self, "_showSelectedIndicator:changeSelection:", -[UITabBarButton _isSelected](self, "_isSelected"), 0);
}

- (id)_selectedIndicatorImage
{
  UIImage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int *ContextStack;

  v3 = self->_customSelectedIndicatorImage;
  if (!v3)
  {
    if (-[UITabBarButton _areTabBarButtonAccessibilityButtonShapesEnabled](self, "_areTabBarButtonAccessibilityButtonShapesEnabled"))
    {
      v4 = (void *)AccessibilitySelectedImageIndicatorMask_maskImage;
      if (!AccessibilitySelectedImageIndicatorMask_maskImage)
      {
        _UIGraphicsBeginImageContextWithOptions(0, 0, 11.0, 11.0, 1.0);
        +[UIColor blackColor](UIColor, "blackColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "set");

        +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 11.0, 11.0, 5.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fill");

        _UIGraphicsGetImageFromCurrentImageContext(0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "resizableImageWithCapInsets:resizingMode:", 1, 5.0, 5.0, 5.0, 5.0);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)AccessibilitySelectedImageIndicatorMask_maskImage;
        AccessibilitySelectedImageIndicatorMask_maskImage = v8;

        ContextStack = (int *)GetContextStack(0);
        PopContextFromStack(ContextStack);
        v4 = (void *)AccessibilitySelectedImageIndicatorMask_maskImage;
      }
      v3 = v4;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)_updateSelectedIndicatorView
{
  UIImage *v3;
  UIImageView *selectedIndicator;
  UIImageView *v5;
  UIImageView *v6;
  id WeakRetained;
  double v8;
  uint64_t v9;
  UIImageView *v10;
  double v11;
  double x;
  double v13;
  double y;
  double v15;
  double width;
  double v17;
  double height;
  uint64_t v19;
  double v20;
  double v21;
  UIImage *v22;
  CGRect v23;
  CGRect v24;

  -[UITabBarButton _selectedIndicatorImage](self, "_selectedIndicatorImage");
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  selectedIndicator = self->_selectedIndicator;
  v22 = v3;
  if (v3)
  {
    if (!selectedIndicator)
    {
      v5 = objc_alloc_init(UIImageView);
      v6 = self->_selectedIndicator;
      self->_selectedIndicator = v5;

      v3 = v22;
    }
    if (v3 == self->_customSelectedIndicatorImage)
    {
      v8 = 1.0;
      v9 = 1;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
      if (objc_msgSend(WeakRetained, "barStyle"))
        v8 = 0.25;
      else
        v8 = 0.15;

      v9 = 2;
    }
    -[UIView setAlpha:](self->_selectedIndicator, "setAlpha:", v8);
    -[UIImageView _setDefaultRenderingMode:](self->_selectedIndicator, "_setDefaultRenderingMode:", v9);
    -[UIView bounds](self, "bounds");
    x = v11;
    y = v13;
    width = v15;
    height = v17;
    if (-[UIImage _isResizable](v22, "_isResizable"))
    {
      if (width < 48.0)
      {
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        v24 = CGRectInset(v23, -round((48.0 - width) * 0.5), 0.0);
        x = v24.origin.x;
        y = v24.origin.y;
        width = v24.size.width;
        height = v24.size.height;
      }
      v19 = 0;
    }
    else
    {
      -[UIImage size](v22, "size");
      if (v20 == width && v21 == height)
      {
        v19 = 4;
      }
      else
      {
        x = x + floor((width - v20) * 0.5);
        y = y + floor((height - v21) * 0.5);
        v19 = 4;
        height = v21;
        width = v20;
      }
    }
    -[UIImageView setContentMode:](self->_selectedIndicator, "setContentMode:", v19);
    -[UIImageView setFrame:](self->_selectedIndicator, "setFrame:", x, y, width, height);
    -[UIImageView setImage:](self->_selectedIndicator, "setImage:", v22);
  }
  else
  {
    -[UIView removeFromSuperview](selectedIndicator, "removeFromSuperview");
    v10 = self->_selectedIndicator;
    self->_selectedIndicator = 0;

  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITabBarButton;
  -[UIControl setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
}

- (UIColor)_unselectedTintColor
{
  return (UIColor *)-[UITabBarButton _contentTintColorForState:](self, "_contentTintColorForState:", 0);
}

- (void)_setUnselectedTintColor:(id)a3
{
  id v4;

  v4 = a3;
  -[UITabBarButton _setContentTintColor:forState:](self, "_setContentTintColor:forState:", v4, 0);
  -[UITabBarButtonLabel setUnselectedTintColor:](self->_label, "setUnselectedTintColor:", v4);

  -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
}

- (BOOL)_isSelected
{
  return self->_selected;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return CGRectContainsPoint(self->_hitRect, a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return CGRectContainsPoint(self->_hitRect, a3);
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  v8 = CGRectInset(self->_hitRect, -15.0, -15.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (CGSize)_appleTV_sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  UITabBarSwappableImageView *imageView;
  UITabBarButtonLabel *label;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView bounds](self, "bounds");
  imageView = self->_imageView;
  if (imageView)
    -[UITabBarSwappableImageView sizeThatFits:](imageView, "sizeThatFits:", width, height);
  label = self->_label;
  if (label)
  {
    -[UILabel sizeThatFits:](label, "sizeThatFits:", width, height);
    if (self->_label)
      -[UITabBarButton titlePositionAdjustmentForState:](self, "titlePositionAdjustmentForState:", -[UITabBarButton _currentItemState](self, "_currentItemState"));
  }
  UICeilToViewScale(self);
  v9 = v8;
  UICeilToViewScale(self);
  v11 = v10;
  v12 = v9;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)_setupCarplayConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UITabBarSwappableImageView *imageView;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UITabBarSwappableImageView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UITabBarButtonLabel *label;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[3];
  _QWORD v62[2];
  _QWORD v63[8];

  v63[6] = *MEMORY[0x1E0C80C00];
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v60 = (void *)objc_opt_new();
  -[UITabBarButton focusView](self, "focusView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v3);

  -[UITabBarButton focusView](self, "focusView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintLessThanOrEqualToConstant:", 76.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = 1148846080;
  objc_msgSend(v59, "setPriority:", v6);
  -[UITabBarButton focusView](self, "focusView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v9, 2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITabBarButton focusView](self, "focusView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:constant:", v13, -2.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v15) = 1144750080;
  objc_msgSend(v10, "setPriority:", v15);
  LODWORD(v16) = 1144750080;
  objc_msgSend(v14, "setPriority:", v16);
  -[UITabBarButton focusView](self, "focusView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v50, 2.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v49;
  -[UITabBarButton focusView](self, "focusView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -3.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v19;
  -[UITabBarButton focusView](self, "focusView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v23;
  v63[3] = v59;
  v58 = v10;
  v63[4] = v10;
  v63[5] = v14;
  v57 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObjectsFromArray:", v24);

  imageView = self->_imageView;
  if (imageView)
  {
    -[UIView centerXAnchor](imageView, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObject:", v28);

    -[UIImageView image](self->_imageView, "image");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = objc_msgSend(v29, "hasBaseline");

    v30 = self->_imageView;
    if ((_DWORD)v27)
    {
      -[UIView lastBaselineAnchor](v30, "lastBaselineAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 20.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addObject:", v33);
    }
    else
    {
      -[UIView centerYAnchor](v30, "centerYAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 13.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v33;
      -[UIView heightAnchor](self->_imageView, "heightAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintLessThanOrEqualToConstant:", 21.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v62[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addObjectsFromArray:", v36);

    }
  }
  label = self->_label;
  if (label)
  {
    -[UILabel setTextAlignment:](label, "setTextAlignment:", 1);
    -[UIView leadingAnchor](self->_label, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarButton focusView](self, "focusView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v53, 2.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v51;
    -[UIView trailingAnchor](self->_label, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarButton focusView](self, "focusView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, -2.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v41;
    -[UIView lastBaselineAnchor](self->_label, "lastBaselineAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 36.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObjectsFromArray:", v45);

  }
  -[UITabBarButton setCarplayConstraints:](self, "setCarplayConstraints:", v60);
  v46 = (void *)MEMORY[0x1E0D156E0];
  -[UITabBarButton carplayConstraints](self, "carplayConstraints");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "activateConstraints:", v47);

}

- (void)_appleTV_layoutSubviews
{
  double v4;
  double v5;
  UITabBarSwappableImageView *imageView;
  UITabBarSwappableImageView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  UITabBarButtonLabel *label;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CGRect v27;

  -[UIView bounds](self, "bounds");
  v5 = v4;
  imageView = self->_imageView;
  if (imageView)
  {
    -[UIView frame](imageView, "frame");
    v7 = self->_imageView;
    -[UIView bounds](self, "bounds");
    -[UITabBarSwappableImageView sizeThatFits:](v7, "sizeThatFits:", v8, v9);
    if (v5 != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabBarButton.m"), 1744, CFSTR("huh?"));

    }
    UIFloorToViewScale(self);
    UIFloorToViewScale(self);
    v11 = v10;
    UIFloorToViewScale(self);
    v13 = v12;
    UICeilToViewScale(self);
    v15 = v14;
    UICeilToViewScale(self);
    v17 = v16;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v11, v13, v15, v16);
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  label = self->_label;
  if (label)
  {
    -[UIView frame](label, "frame");
    if (self->_imageView)
    {
      v27.origin.x = v11;
      v27.origin.y = v13;
      v27.size.width = v15;
      v27.size.height = v17;
      CGRectGetMaxX(v27);
    }
    -[UITabBarButton titlePositionAdjustmentForState:](self, "titlePositionAdjustmentForState:", -[UITabBarButton _currentItemState](self, "_currentItemState"));
    UIFloorToViewScale(self);
    v20 = v19;
    UIFloorToViewScale(self);
    v22 = v21;
    UICeilToViewScale(self);
    v24 = v23;
    UICeilToViewScale(self);
    -[UILabel setFrame:](self->_label, "setFrame:", v20, v22, v24, v25);
  }
  -[UITabBarButton _updateSelectedIndicatorFrame](self, "_updateSelectedIndicatorFrame");
}

- (CGSize)_horizontalLayout_sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[UIView bounds](self, "bounds", a3.width, a3.height);
  v5 = v4;
  -[UIView bounds](self->_label, "bounds");
  v7 = v6;
  v8 = _UIIsFourInch();
  v9 = 6.0;
  if (v8)
    v9 = 5.0;
  v10 = v7 + v9;
  -[UIView bounds](self->_imageView, "bounds");
  v12 = v10 + v11;
  v13 = v5;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  if (self->_layoutStyle)
  {
    -[UITabBarButton _horizontalLayout_sizeThatFits:](self, "_horizontalLayout_sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBarButton;
    -[UIView sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_setCustomSelectedIndicatorImage:(id)a3
{
  UIImage *v5;
  UIImageView *selectedIndicator;
  _BOOL4 v7;
  UIImageView *v8;
  UIImage *v9;

  v5 = (UIImage *)a3;
  if (self->_customSelectedIndicatorImage != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_customSelectedIndicatorImage, a3);
    selectedIndicator = self->_selectedIndicator;
    if (selectedIndicator)
    {
LABEL_5:
      -[UIView removeFromSuperview](selectedIndicator, "removeFromSuperview");
      v8 = self->_selectedIndicator;
      self->_selectedIndicator = 0;

      -[UITabBarButton _showSelectedIndicator:changeSelection:](self, "_showSelectedIndicator:changeSelection:", 1, 0);
      v5 = v9;
      goto LABEL_6;
    }
    v7 = -[UITabBarButton _isSelected](self, "_isSelected");
    v5 = v9;
    if (v7)
    {
      selectedIndicator = self->_selectedIndicator;
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x20) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarButton;
    -[UIControl _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)canBecomeFocused
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[UIControl isEnabled](self, "isEnabled");
  if (v3)
  {
    -[UIView _focusBehavior](self, "_focusBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "tabBarButtonCanBecomeFocused");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 1;
}

- (void)_sendFocusAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UITabBarButton _tabBar](self, "_tabBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPendingFocusAction:", 0);

  if (-[UIView isFocused](self, "isFocused") || objc_msgSend(v5, "BOOLValue"))
    -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  UITabBarButton *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UITabBarButton;
  v6 = a3;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView", v11.receiver, v11.super_class);
  v7 = (UITabBarButton *)objc_claimAutoreleasedReturnValue();

  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 3)
  {
    v10 = v7 == self || -[UITabBarButton canBecomeFocused](self, "canBecomeFocused");
    -[UITabBarButton _setShowsHighlightedState:](self, "_setShowsHighlightedState:", v10);
    -[UITabBarButton setHighlighted:](self, "setHighlighted:", v7 == self);
  }
  -[UITabBarButtonLabel updateTextColorsForState](self->_label, "updateTextColorsForState");
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "focusHeading") == 2 || objc_msgSend(v4, "focusHeading") == 1)
  {
    -[UITabBarButton _tabBar](self, "_tabBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(self) = objc_msgSend(v5, "_pendingFocusAction") ^ 1;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarButton;
    LOBYTE(self) = -[UIView shouldUpdateFocusInContext:](&v7, sel_shouldUpdateFocusInContext_, v4);
  }

  return (char)self;
}

- (id)_tabBar
{
  UITabBarButton *v2;
  UITabBarButton *v3;
  UITabBarButton *v4;

  v2 = self;
  while (1)
  {
    v3 = v2;
    -[UIView superview](v2, "superview");
    v2 = (UITabBarButton *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v2;
      break;
    }
  }

  return v2;
}

- (CGRect)_responderSelectionRectForWindow:(id)a3
{
  id v4;
  double v5;
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
  double v16;
  CGRect result;

  v4 = a3;
  -[UITabBarButton _responderSelectionRect](self, "_responderSelectionRect");
  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_responderSelectionRect
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double MaxY;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[UITabBarButton isDefaultTVLayout](self, "isDefaultTVLayout"))
  {
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    MaxY = CGRectGetMaxY(v17);
    -[UIView frame](self, "frame");
    v6 = v6 - v12;
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    v10 = v10 + MaxY - CGRectGetMaxY(v18);
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int64_t)_focusTouchSensitivityStyle
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITabBarButton *v8;
  void *v9;
  _BOOL4 v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_msgSend(v7, "_lastPreparedPress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "type") != 4)
  {

    goto LABEL_5;
  }
  v10 = -[UIControl isEnabled](v8, "isEnabled");

  if (!v10)
  {
LABEL_5:
    v11.receiver = v8;
    v11.super_class = (Class)UITabBarButton;
    -[UIResponder pressesBegan:withEvent:](&v11, sel_pressesBegan_withEvent_, v6, v7);
    goto LABEL_6;
  }
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", v8, sel__sendFocusAction, 0);
  -[UITabBarButton _sendFocusAction:](v8, "_sendFocusAction:", MEMORY[0x1E0C9AAA0]);
LABEL_6:

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITabBarButton *v8;
  void *v9;
  BOOL v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_msgSend(v7, "_lastPreparedPress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "type") == 4)
  {
    v10 = -[UIControl isEnabled](v8, "isEnabled");

    if (v10)
      goto LABEL_6;
  }
  else
  {

  }
  v11.receiver = v8;
  v11.super_class = (Class)UITabBarButton;
  -[UIResponder pressesChanged:withEvent:](&v11, sel_pressesChanged_withEvent_, v6, v7);
LABEL_6:

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITabBarButton *v8;
  void *v9;
  BOOL v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_msgSend(v7, "_lastPreparedPress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "type") == 4)
  {
    v10 = -[UIControl isEnabled](v8, "isEnabled");

    if (v10)
      goto LABEL_6;
  }
  else
  {

  }
  v11.receiver = v8;
  v11.super_class = (Class)UITabBarButton;
  -[UIResponder pressesEnded:withEvent:](&v11, sel_pressesEnded_withEvent_, v6, v7);
LABEL_6:

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITabBarButton *v8;
  void *v9;
  BOOL v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_msgSend(v7, "_lastPreparedPress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "type") == 4)
  {
    v10 = -[UIControl isEnabled](v8, "isEnabled");

    if (v10)
      goto LABEL_6;
  }
  else
  {

  }
  v11.receiver = v8;
  v11.super_class = (Class)UITabBarButton;
  -[UIResponder pressesCancelled:withEvent:](&v11, sel_pressesCancelled_withEvent_, v6, v7);
LABEL_6:

}

- (double)defaultAlphaForState:(int64_t)a3
{
  return 1.0;
}

- (int64_t)defaultCompositingModeForState:(int64_t)a3
{
  return 0;
}

- (BOOL)isDefaultColor:(id)a3 forState:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v6 = a3;
  -[UITabBarButton defaultColorForState:](self, "defaultColorForState:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = v9;
  if (v9 == v8)
  {
    v11 = 1;
  }
  else
  {
    v11 = 0;
    if (v8 && v9)
      v11 = objc_msgSend(v8, "isEqual:", v9);
  }

  return v11;
}

- (void)_UIAppearance_setBadgeColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_badgeColor != v5)
    objc_storeStrong((id *)&self->_badgeColor, a3);
  -[UITabBarButton _updateBadgeAppearanceAndLayoutNow:](self, "_updateBadgeAppearanceAndLayoutNow:", 0);

}

- (void)_UIAppearance_setBadgeTextAttributes:(id)a3 forState:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSMutableDictionary *badgeTextAttributesForState;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_badgeTextAttributesForState, "objectForKeyedSubscript:", v6), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    badgeTextAttributesForState = self->_badgeTextAttributesForState;
    if (!badgeTextAttributesForState)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v10 = self->_badgeTextAttributesForState;
      self->_badgeTextAttributesForState = v9;

      badgeTextAttributesForState = self->_badgeTextAttributesForState;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](badgeTextAttributesForState, "objectForKeyedSubscript:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != v13 && (objc_msgSend(v13, "isEqual:", v11) & 1) == 0)
    {
      v12 = (void *)objc_msgSend(v13, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_badgeTextAttributesForState, "setObject:forKeyedSubscript:", v12, v6);

    }
    -[UITabBarButton _updateBadgeAppearanceAndLayoutNow:](self, "_updateBadgeAppearanceAndLayoutNow:", 1);

  }
}

- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3
{
  if (self->_labelOffset.horizontal != a3.horizontal || self->_labelOffset.vertical != a3.vertical)
  {
    self->_labelOffset = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIOffset)_titlePositionAdjustment
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_labelOffset.horizontal;
  vertical = self->_labelOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

uint64_t __74__UITabBarButton__applyTabBarButtonAppearanceStorage_withTaggedSelectors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBadgeTextAttributes:forState:", a3, a2);
}

- (void)_setButtonTintColor:(id)a3 forState:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *buttonTintColorsForState;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  char v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v6 = a3;
  buttonTintColorsForState = self->_buttonTintColorsForState;
  v15 = v6;
  if (v6)
  {
    if (!buttonTintColorsForState)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_buttonTintColorsForState;
      self->_buttonTintColorsForState = v8;

      buttonTintColorsForState = self->_buttonTintColorsForState;
    }
  }
  else if (!buttonTintColorsForState)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonTintColorsForState, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v15, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = self->_buttonTintColorsForState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v15, v14);
    else
      -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

    -[UITabBarButton _updateToMatchCurrentState](self, "_updateToMatchCurrentState");
  }
LABEL_10:

}

- (id)_info
{
  UIKVCAccessProhibited((uint64_t)CFSTR("_info"), (uint64_t)CFSTR("_UITabBarButton"));
  return 0;
}

- (void)set_info:(id)a3
{
  UIKVCAccessProhibited((uint64_t)CFSTR("_info"), (uint64_t)CFSTR("_UITabBarButton"));
}

- (UIVibrancyEffect)itemVibrantEffect
{
  return self->_itemVibrantEffect;
}

void __49__UITabBarButton_SpringLoading__setSpringLoaded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActionsForControlEvents:", 64);

}

@end
