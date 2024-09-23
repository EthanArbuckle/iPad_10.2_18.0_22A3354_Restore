@implementation UIButtonLegacyVisualProvider

- (void)layoutSubviews
{
  unint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _UIButtonMaskAnimationView *maskAnimationView;
  void *v8;
  void *v9;
  int v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  CALayer *highlightLayer;
  CALayer *v19;

  v3 = -[UIControl state](self->_button, "state");
  -[UIButtonLegacyVisualProvider _floatingContentView](self, "_floatingContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_button, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[UIButtonLegacyVisualProvider _updateContentBackdropView](self, "_updateContentBackdropView");
  -[UIButtonLegacyVisualProvider _layoutContentBackdropView](self, "_layoutContentBackdropView");
  -[UIButtonLegacyVisualProvider _updateBackgroundImageView](self, "_updateBackgroundImageView");
  -[UIButtonLegacyVisualProvider _layoutBackgroundImageView](self, "_layoutBackgroundImageView");
  -[UIButtonLegacyVisualProvider _updateImageView](self, "_updateImageView");
  -[UIButtonLegacyVisualProvider _updateTitleView](self, "_updateTitleView");
  if (!self->_avoidDefaultTitleAndImageLayout)
    -[UIButtonLegacyVisualProvider _layoutImageAndTitleViews](self, "_layoutImageAndTitleViews");
  -[UIButtonLegacyVisualProvider _applyAppropriateTouchInsetsForButton](self, "_applyAppropriateTouchInsetsForButton");
  -[UIView viewWithTag:](self->_button, "viewWithTag:", 1886548836);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton pressFeedbackPosition](self->_button, "pressFeedbackPosition");
  objc_msgSend(v5, "setCenter:");
  objc_msgSend(v5, "setHidden:", (*(_QWORD *)&self->_button->_buttonFlags & 0x20) == 0);
  v6 = -[UIButton _hasDrawingStyle](self->_button, "_hasDrawingStyle");
  maskAnimationView = self->_maskAnimationView;
  if (v6)
  {
    -[UIView setHidden:](maskAnimationView, "setHidden:", 0);
    -[UIButtonLegacyVisualProvider _setupDrawingStyleForState:](self, "_setupDrawingStyleForState:", v3);
  }
  else if (maskAnimationView)
  {
    -[UIView setHidden:](maskAnimationView, "setHidden:", 1);
  }
  if (-[UIButtonLegacyVisualProvider _shouldUpdatePressedness](self, "_shouldUpdatePressedness"))
  {
    -[UIButtonLegacyVisualProvider _updateSelectionViewForState:](self, "_updateSelectionViewForState:", v3);
    -[UIButtonLegacyVisualProvider _setupPressednessForState:](self, "_setupPressednessForState:", v3);
  }

  self->_button->_lastDrawingControlState = v3;
  *(_QWORD *)&self->_button->_buttonFlags &= ~0x40000000uLL;
  -[UIControl _safeHoverStyle](self->_button);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_invalidateAutomaticHoverShape");

  +[_UIButtonSettingsDomain rootSettings](_UIButtonSettingsDomain, "rootSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "highlightMode");

  if (!v10)
    goto LABEL_16;
  NSClassFromString(CFSTR("_UIModernBarButton"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) == 0)
  {
    if (v12 != v13)
    {
      +[_UIButtonSettingsDomain rootSettings](_UIButtonSettingsDomain, "rootSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "highlightSubclasses");

      if (!v17)
        goto LABEL_16;
    }
LABEL_15:
    -[UIButtonLegacyVisualProvider _layoutHighlightLayer](self, "_layoutHighlightLayer");
    return;
  }
  +[_UIButtonSettingsDomain rootSettings](_UIButtonSettingsDomain, "rootSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "highlightIgnoresBars");

  if ((v15 & 1) == 0)
    goto LABEL_15;
LABEL_16:
  highlightLayer = self->_highlightLayer;
  if (highlightLayer)
  {
    -[CALayer removeFromSuperlayer](highlightLayer, "removeFromSuperlayer");
    v19 = self->_highlightLayer;
    self->_highlightLayer = 0;

  }
}

- (BOOL)_shouldUpdatePressedness
{
  if (-[UIButtonLegacyVisualProvider _isExternalRoundedRectButtonWithPressednessState](self, "_isExternalRoundedRectButtonWithPressednessState"))
  {
    return 1;
  }
  if (-[UIButton _hasDrawingStyle](self->_button, "_hasDrawingStyle"))
    return 0;
  return -[UIButton _isModernButton](self->_button, "_isModernButton");
}

- (BOOL)_isExternalRoundedRectButtonWithPressednessState
{
  return -[UIButton _isCarPlaySystemTypeButton](self->_button, "_isCarPlaySystemTypeButton")
      && !-[UIButton _isEffectivelyDisabledExternalButton](self->_button, "_isEffectivelyDisabledExternalButton")
      && -[UIControl isEnabled](self->_button, "isEnabled");
}

- (void)_applyAppropriateTouchInsetsForButton
{
  UIButton *button;
  $1CF1FC38577B636919C637EEED589224 buttonFlags;
  double v5;
  double v6;
  double v7;
  double v8;

  button = self->_button;
  buttonFlags = button->_buttonFlags;
  if (UIButtonTypeIsModernCircleButton((*(unint64_t *)&buttonFlags >> 6))
    || (*(_WORD *)&buttonFlags & 0x3FC0) == 0x1C0)
  {
    -[UIView bounds](button, "bounds");
    if (v5 + -44.0 <= 0.0)
      v7 = (v5 + -44.0) * 0.5;
    else
      v7 = 0.0;
    if (v6 + -44.0 <= 0.0)
      v8 = (v6 + -44.0) * 0.5;
    else
      v8 = 0.0;
    -[UIView _setTouchInsets:](self->_button, "_setTouchInsets:", v8, v7, v8, v7);
  }
}

- (void)_layoutImageAndTitleViews
{
  UIButton *button;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIImageView *imageView;
  int v13;
  UILabel *titleView;
  int v15;
  UIButton *v16;
  __int128 v17;
  UIImageView *v18;
  UILabel *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (!-[NSArray count](self->_contentConstraints, "count"))
  {
    button = self->_button;
    -[UIView bounds](button, "bounds");
    -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    imageView = self->_imageView;
    if (imageView)
      v13 = !-[UIView isHidden](imageView, "isHidden");
    else
      v13 = 0;
    titleView = self->_titleView;
    if (titleView)
      v15 = !-[UIView isHidden](titleView, "isHidden");
    else
      v15 = 0;
    v16 = self->_button;
    if ((*((_BYTE *)&v16->_buttonFlags + 4) & 4) != 0)
    {
      if (v13)
      {
        v18 = self->_imageView;
        -[UIButton imageRectForContentRect:](v16, "imageRectForContentRect:", v5, v7, v9, v11);
        -[UIImageView setFrame:](v18, "setFrame:");
      }
      if (v15)
      {
        v19 = self->_titleView;
        -[UIButton titleRectForContentRect:](self->_button, "titleRectForContentRect:", v5, v7, v9, v11);
        -[UILabel setFrame:](v19, "setFrame:");
      }
    }
    else if ((v13 | v15) == 1)
    {
      v17 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v22 = *MEMORY[0x1E0C9D648];
      v23 = v17;
      v20 = v22;
      v21 = v17;
      -[UIButtonLegacyVisualProvider _deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:](self, "_deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:", &v20, &v22, 0, v5, v7, v9, v11);
      if (v13)
        -[UIImageView setFrame:](self->_imageView, "setFrame:", v22, v23);
      if (v15)
        -[UILabel setFrame:](self->_titleView, "setFrame:", v20, v21);
    }
  }
}

- (void)_layoutBackgroundImageView
{
  UIImageView *backgroundView;
  UIButton *button;

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    if (!-[UIView isHidden](backgroundView, "isHidden"))
    {
      button = self->_button;
      -[UIView bounds](button, "bounds");
      -[UIButton backgroundRectForBounds:](button, "backgroundRectForBounds:");
      -[UIImageView setFrame:](self->_backgroundView, "setFrame:");
    }
  }
}

- (void)_setupPressednessForState:(unint64_t)a3
{
  UIButton *button;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *maskAnimationView;
  double v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  button = self->_button;
  if (button->_lastDrawingControlState == a3)
    return;
  v5 = a3;
  v6 = -[UIControl _touchHasHighlighted](button, "_touchHasHighlighted") ^ 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIButtonLegacyVisualProvider _isExternalRoundedRectButtonWithPressednessState](self, "_isExternalRoundedRectButtonWithPressednessState"))
  {
    maskAnimationView = self->_maskAnimationView;
    if (!maskAnimationView)
      goto LABEL_13;
  }
  else
  {
    if (self->_titleView
      && (((v5 & 4) != 0) & v5) == 0
      && (*(_QWORD *)&self->_button->_buttonFlags & 0x800000) == 0)
    {
      objc_msgSend(v7, "addObject:");
    }
    if (!self->_backgroundView
      || !-[UIButtonLegacyVisualProvider _highlightsBackgroundImage](self, "_highlightsBackgroundImage"))
    {
      goto LABEL_13;
    }
    maskAnimationView = self->_backgroundView;
  }
  objc_msgSend(v7, "addObject:", maskAnimationView);
LABEL_13:
  if (objc_msgSend(v7, "count"))
    objc_msgSend((id)objc_opt_class(), "_setVisuallyHighlighted:forViews:initialPress:", v5 & 1, v7, v6);
  if ((((v5 & 4) != 0) & v5) == 0 && self->_imageView)
  {
    if (((*(_QWORD *)&self->_button->_buttonFlags >> 4) & 1 & (v5 >> 1)) != 0)
      v9 = 0.25;
    else
      v9 = 1.0;
    v10 = (void *)objc_opt_class();
    v12[0] = self->_imageView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setVisuallyHighlighted:forViews:initialPress:baseAlpha:", v5 & 1, v11, v6, v9);

  }
  if ((v5 & 1) != 0)
    -[UIControl _setTouchHasHighlighted:](self->_button, "_setTouchHasHighlighted:", 1);

}

- (void)tintColorDidChange
{
  UILabel *titleView;
  void *v4;
  UIImageView *imageView;
  BOOL v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  id v10;

  if (-[UIButton _isModernButton](self->_button, "_isModernButton")
    || -[UIButton _isCarPlaySystemTypeButton](self->_button, "_isCarPlaySystemTypeButton"))
  {
    titleView = self->_titleView;
    if (titleView)
    {
      if (!-[UIView isHidden](titleView, "isHidden"))
        goto LABEL_11;
    }
    -[UIButton _imageForState:applyingConfiguration:usesImageForNormalState:](self->_button, "_imageForState:applyingConfiguration:usesImageForNormalState:", -[UIControl state](self->_button, "state"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4
      || (imageView = self->_imageView) == 0
      || (v10 = v4, v6 = -[UIView isHidden](imageView, "isHidden"), v4 = v10, v6)
      || (v7 = objc_msgSend(v10, "renderingMode"), v4 = v10, v7 == 1))
    {

      return;
    }
    v8 = -[UIImageView _defaultRenderingMode](self->_imageView, "_defaultRenderingMode");

    if (v8 == 2)
    {
LABEL_11:
      -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
      -[UIView window](self->_button, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[UIButtonLegacyVisualProvider _updateTitleView](self, "_updateTitleView");
        -[UIButtonLegacyVisualProvider _updateImageView](self, "_updateImageView");
      }
    }
  }
}

- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4;
  UILabel *titleView;
  UIImageView *imageView;
  UIImageView *backgroundView;
  void *v11;
  _BOOL4 IsModernCircleButton;
  id v13;

  v4 = a3;
  imageView = self->_imageView;
  titleView = self->_titleView;
  backgroundView = self->_backgroundView;
  if (titleView != v4 && imageView != v4 && backgroundView != v4)
    goto LABEL_28;
  v13 = v4;
  if (backgroundView == v4 || imageView == v4)
  {
    if (-[UIButton autosizesToFit](self->_button, "autosizesToFit"))
      goto LABEL_17;
    -[UIView traitCollection](self->_button, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "userInterfaceIdiom") != 3)
    {

      goto LABEL_19;
    }
    IsModernCircleButton = UIButtonTypeIsModernCircleButton(-[UIButton buttonType](self->_button, "buttonType"));

    if (IsModernCircleButton)
LABEL_17:
      -[UIView sizeToFit](self->_button, "sizeToFit");
LABEL_19:
    -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
  }
  if (-[UIControl effectiveContentHorizontalAlignment](self->_button, "effectiveContentHorizontalAlignment") == UIControlContentHorizontalAlignmentFill
    && (imageView == v13 && self->_titleView || titleView == v13 && self->_imageView))
  {
    -[UIButtonLegacyVisualProvider _invalidateContentConstraints](self, "_invalidateContentConstraints");
  }
  -[UIView invalidateIntrinsicContentSize](self->_button, "invalidateIntrinsicContentSize");
  v4 = v13;
LABEL_28:

}

uint64_t __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", 0.0);
}

- (id)_viewForBaselineLayout
{
  void *v3;

  -[UIButtonLegacyVisualProvider _titleOrImageViewForBaselineLayout](self, "_titleOrImageViewForBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UIButton _likelyToHaveTitle](self->_button, "_likelyToHaveTitle"))
    {
      -[UIButtonLegacyVisualProvider _setupTitleViewRequestingLayout:](self, "_setupTitleViewRequestingLayout:", 0);
      -[UIButton _titleView](self->_button, "_titleView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)_updateBackgroundImageView
{
  UIControlState v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  UIButton *button;
  UIImageView *backgroundView;
  void *v13;
  char v14;

  v3 = -[UIControl state](self->_button, "state");
  v14 = 0;
  -[UIButton _backgroundForState:usesBackgroundForNormalState:](self->_button, "_backgroundForState:usesBackgroundForNormalState:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIImageView _checkImageForAdaptation:hasAdapted:](self->_backgroundView, "_checkImageForAdaptation:hasAdapted:", v4, 0);
  if (!v4)
  {
    -[UIImageView setHidden:](self->_backgroundView, "setHidden:", 1);
    goto LABEL_18;
  }
  v6 = -[UIButtonLegacyVisualProvider _setupBackgroundView](self, "_setupBackgroundView");
  -[UIImageView setImage:](self->_backgroundView, "setImage:", v4);
  if (!v14 && UIButtonTypeIsModernCircleButton(-[UIButton buttonType](self->_button, "buttonType")))
  {
    -[UIView traitCollection](self->_button, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
      -[UIImageView traitCollectionDidChange:](self->_backgroundView, "traitCollectionDidChange:", 0);
  }
  -[UIImageView setHidden:](self->_backgroundView, "setHidden:", 0);
  if (!v14)
    goto LABEL_15;
  if (-[UIButton adjustsImageWhenHighlighted](self->_button, "adjustsImageWhenHighlighted")
    && !-[UIButton showsTouchWhenHighlighted](self->_button, "showsTouchWhenHighlighted")
    && -[UIControl isHighlighted](self->_button, "isHighlighted"))
  {
    v10 = 2;
    goto LABEL_16;
  }
  if (v14
    && -[UIButton adjustsImageWhenDisabled](self->_button, "adjustsImageWhenDisabled")
    && !-[UIControl isEnabled](self->_button, "isEnabled"))
  {
    v10 = 1;
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
LABEL_16:
  -[UIImageView setDrawMode:](self->_backgroundView, "setDrawMode:", v10);
  button = self->_button;
  if ((*((_BYTE *)&button->_buttonFlags + 3) & 2) != 0)
  {
    backgroundView = self->_backgroundView;
    -[UIView traitCollection](button, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView traitCollectionDidChange:](backgroundView, "traitCollectionDidChange:", v13);

    *(_QWORD *)&self->_button->_buttonFlags &= ~0x2000000uLL;
  }
LABEL_18:

}

- (void)_updateImageView
{
  UIControlState v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton *button;
  UIImageView *imageView;
  double v22;
  _BOOL4 v23;
  UIButton *v24;
  UIImageView *backgroundView;
  void *v26;
  UIButton *v27;
  UIImageView *v28;
  void *v29;
  __int16 v30;

  v3 = -[UIControl state](self->_button, "state");
  v30 = 0;
  -[UIButton _imageForState:applyingConfiguration:usesImageForNormalState:](self->_button, "_imageForState:applyingConfiguration:usesImageForNormalState:", v3, 0, (char *)&v30 + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIImageView _checkImageForAdaptation:hasAdapted:](self->_imageView, "_checkImageForAdaptation:hasAdapted:", v4, &v30);
  -[UIImageView image](self->_imageView, "image");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v7;
  if (v6 == v7)
  {
    v10 = 1;
  }
  else
  {
    if (v7)
      v9 = v6 == 0;
    else
      v9 = 1;
    if (v9)
      v10 = 0;
    else
      v10 = objc_msgSend(v6, "isEqual:", v7);
  }

  if (v8)
  {
    -[UIButtonLegacyVisualProvider _setupImageView](self, "_setupImageView");
    -[UIButton _preferredConfigurationForState:](self->_button, "_preferredConfigurationForState:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v11);

    if (!(_BYTE)v30)
    {
      -[UIImageView setImage:](self->_imageView, "setImage:", v8);
      if (!HIBYTE(v30) && UIButtonTypeIsModernCircleButton(-[UIButton buttonType](self->_button, "buttonType")))
      {
        -[UIView traitCollection](self->_button, "traitCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "traitCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if ((v14 & 1) == 0)
          -[UIImageView traitCollectionDidChange:](self->_imageView, "traitCollectionDidChange:", 0);
      }
    }
    -[UIImageView setHidden:](self->_imageView, "setHidden:", 0);
    if (!HIBYTE(v30))
      goto LABEL_25;
    if (-[UIButton adjustsImageWhenHighlighted](self->_button, "adjustsImageWhenHighlighted")
      && !-[UIButton showsTouchWhenHighlighted](self->_button, "showsTouchWhenHighlighted")
      && -[UIControl isHighlighted](self->_button, "isHighlighted"))
    {
      v15 = 2;
      goto LABEL_26;
    }
    if (HIBYTE(v30)
      && -[UIButton adjustsImageWhenDisabled](self->_button, "adjustsImageWhenDisabled")
      && !-[UIControl isEnabled](self->_button, "isEnabled"))
    {
      v15 = 1;
    }
    else
    {
LABEL_25:
      v15 = 0;
    }
LABEL_26:
    -[UIImageView setDrawMode:](self->_imageView, "setDrawMode:", v15);
    if (-[UIButton _isModernButton](self->_button, "_isModernButton")
      || -[UIButton _isCarPlaySystemTypeButton](self->_button, "_isCarPlaySystemTypeButton"))
    {
      -[UIButton _imageColorForState:](self->_button, "_imageColorForState:", v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView tintColor](self->_imageView, "tintColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 != v17 && (objc_msgSend(v18, "isEqual:", v17) & 1) == 0)
        -[UIView setTintColor:](self->_imageView, "setTintColor:", v17);

    }
    else
    {
      button = self->_button;
      imageView = self->_imageView;
      if ((*(_BYTE *)&button->_buttonFlags & 0x10) != 0)
      {
        v23 = -[UIControl isEnabled](button, "isEnabled");
        v22 = 0.25;
        if (v23)
          v22 = 1.0;
      }
      else
      {
        v22 = 1.0;
      }
      -[UIView setAlpha:](imageView, "setAlpha:", v22);
    }
    v24 = self->_button;
    if ((*((_BYTE *)&v24->_buttonFlags + 3) & 1) != 0)
    {
      backgroundView = self->_backgroundView;
      -[UIView traitCollection](v24, "traitCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView traitCollectionDidChange:](backgroundView, "traitCollectionDidChange:", v26);

      *(_QWORD *)&self->_button->_buttonFlags &= ~0x1000000uLL;
    }
    goto LABEL_39;
  }
  if (self->_imageView)
  {
    -[UIButton _preferredConfigurationForState:](self->_button, "_preferredConfigurationForState:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v16);

    -[UIImageView setHidden:](self->_imageView, "setHidden:", 1);
  }
LABEL_39:
  v27 = self->_button;
  if ((v10 & 1) == 0)
  {
    -[UIView invalidateIntrinsicContentSize](v27, "invalidateIntrinsicContentSize");
    v27 = self->_button;
  }
  if (-[UIControl _allowsSymbolAnimations](v27, "_allowsSymbolAnimations"))
  {
    v28 = self->_imageView;
    objc_msgSend(MEMORY[0x1E0CE8700], "scaleDownEffect");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 1) != 0)
      -[UIImageView addSymbolEffect:](v28, "addSymbolEffect:", v29);
    else
      -[UIImageView removeSymbolEffectOfType:](v28, "removeSymbolEffectOfType:", v29);

  }
}

- (id)titleViewCreateIfNeeded:(BOOL)a3
{
  UILabel *v4;

  if (!a3)
    goto LABEL_7;
  if (-[UIButton _canHaveTitle](self->_button, "_canHaveTitle"))
  {
    -[UIButtonLegacyVisualProvider _setupTitleView](self, "_setupTitleView");
    if (dyld_program_sdk_at_least())
      -[UIButtonLegacyVisualProvider _updateTitleView](self, "_updateTitleView");
    else
      -[UIView layoutBelowIfNeeded](self->_button, "layoutBelowIfNeeded");
LABEL_7:
    v4 = self->_titleView;
    return v4;
  }
  v4 = 0;
  return v4;
}

- (CGSize)intrinsicSizeWithinSize:(CGSize)a3
{
  UIControlState v4;
  uint64_t v5;
  void *v6;
  UIImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  UIImageView *backgroundView;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  CGSize result;

  -[UIButton _setInternalTitlePaddingInsets:](self->_button, "_setInternalTitlePaddingInsets:", 0.0, 0.0, 0.0, 0.0);
  v4 = -[UIControl state](self->_button, "state");
  -[UIButton _imageForState:applyingConfiguration:usesImageForNormalState:](self->_button, "_imageForState:applyingConfiguration:usesImageForNormalState:", v4, 1, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    imageView = self->_imageView;
    if (!imageView)
    {
      -[UIButtonLegacyVisualProvider _setupImageView](self, "_setupImageView");
      imageView = self->_imageView;
    }
    -[UIImageView _resolvedImageFromImage:](imageView, "_resolvedImageFromImage:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[UIButton _titleForState:](self->_button, "_titleForState:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _attributedTitleForState:](self->_button, "_attributedTitleForState:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _backgroundForState:usesBackgroundForNormalState:](self->_button, "_backgroundForState:usesBackgroundForNormalState:", v4, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    backgroundView = self->_backgroundView;
    if (!backgroundView)
    {
      v14 = -[UIButtonLegacyVisualProvider _setupBackgroundView](self, "_setupBackgroundView");
      backgroundView = self->_backgroundView;
    }
    -[UIImageView _resolvedImageFromImage:](backgroundView, "_resolvedImageFromImage:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  v22 = 0u;
  v23 = 0u;
  -[UIButtonLegacyVisualProvider _intrinsicSizeForTitle:attributedTitle:image:backgroundImage:titlePaddingInsets:](self, "_intrinsicSizeForTitle:attributedTitle:image:backgroundImage:titlePaddingInsets:", v9, v10, v8, v15, &v22);
  v17 = v16;
  v19 = v18;
  -[UIButton _setInternalTitlePaddingInsets:](self->_button, "_setInternalTitlePaddingInsets:", v22, v23);

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)_titleOrImageViewForBaselineLayout
{
  void *v2;
  UIControlState v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;

  v4 = -[UIControl state](self->_button, "state");
  -[UIButton _imageForState:applyingConfiguration:usesImageForNormalState:](self->_button, "_imageForState:applyingConfiguration:usesImageForNormalState:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIButton _canHaveTitle](self->_button, "_canHaveTitle") || objc_msgSend(v5, "hasBaseline"))
  {
    if (v5)
      -[UIButtonLegacyVisualProvider _setupImageView](self, "_setupImageView");
    -[UIButton titleForState:](self->_button, "titleForState:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (-[UIButton _attributedTitleForState:](self->_button, "_attributedTitleForState:", v4),
          (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[UIButton _titleView](self->_button, "_titleView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
LABEL_12:

        -[UIView contentCompressionResistancePriorityForAxis:](self->_button, "contentCompressionResistancePriorityForAxis:", 0);
        v9 = fmax(v8 + -0.5, 0.5);
        -[UIView contentCompressionResistancePriorityForAxis:](self->_button, "contentCompressionResistancePriorityForAxis:", 1);
        v11 = v10 + -0.5;
        v12 = fmax(v11, 0.5);
        *(float *)&v11 = v9;
        objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v11);
        *(float *)&v13 = v12;
        objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v13);
        goto LABEL_13;
      }
    }
    else
    {
      -[UIButton _imageView](self->_button, "_imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (void)_updateTitleView
{
  UIControlState v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  UILabel *titleView;
  void *v11;
  UILabel *v12;
  void *v13;
  id v14;

  v3 = -[UIControl state](self->_button, "state");
  -[UIButton _attributedTitleForState:](self->_button, "_attributedTitleForState:", v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton _titleForState:](self->_button, "_titleForState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && objc_msgSend(v14, "length"))
  {
    -[UILabel _content](self->_titleView, "_content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") >= 1)
    {
      objc_msgSend(v5, "contentWithAttributedString:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "differenceVersusContent:", v6);

      if (v7)
        -[UIButtonLegacyVisualProvider _beginTitleAnimation](self, "_beginTitleAnimation");
    }
    if ((*((_BYTE *)&self->_button->_buttonFlags + 2) & 0x80) == 0)
    {
      -[UIButtonLegacyVisualProvider _setupTitleViewRequestingLayout:](self, "_setupTitleViewRequestingLayout:", 0);
      -[UILabel setAttributedText:](self->_titleView, "setAttributedText:", v14);
      -[UIView setHidden:](self->_titleView, "setHidden:", 0);
    }

  }
  else if (v4 && objc_msgSend(v4, "length"))
  {
    -[UILabel text](self->_titleView, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "length") && (objc_msgSend(v4, "isEqualToString:", v9) & 1) == 0)
      -[UIButtonLegacyVisualProvider _beginTitleAnimation](self, "_beginTitleAnimation");
    if ((*((_BYTE *)&self->_button->_buttonFlags + 2) & 0x80) == 0)
    {
      -[UIButtonLegacyVisualProvider _setupTitleViewRequestingLayout:](self, "_setupTitleViewRequestingLayout:", 0);
      if ((objc_msgSend(v4, "isEqual:", v9) & 1) == 0)
        -[UILabel setText:](self->_titleView, "setText:", v4);
      titleView = self->_titleView;
      -[UIButton _titleColorForState:suppressTintColorFollowing:](self->_button, "_titleColorForState:suppressTintColorFollowing:", v3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleView, "setTextColor:", v11);

      v12 = self->_titleView;
      -[UIButton _shadowColorForState:](self->_button, "_shadowColorForState:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setShadowColor:](v12, "setShadowColor:", v13);

      -[UIView setHidden:](self->_titleView, "setHidden:", 0);
    }

  }
  else if ((*((_BYTE *)&self->_button->_buttonFlags + 2) & 0x80) == 0)
  {
    -[UIView setHidden:](self->_titleView, "setHidden:", 1);
  }

}

- (void)_setupImageView
{
  UIButton *button;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIView *selectionView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  void *v15;
  UIView *v16;

  if (self->_imageView)
    return;
  button = self->_button;
  -[UIView bounds](button, "bounds");
  -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
  -[UIButton imageRectForContentRect:](button, "imageRectForContentRect:");
  -[UIButtonLegacyVisualProvider _createPreparedImageViewWithFrame:](self, "_createPreparedImageViewWithFrame:");
  v4 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  self->_imageView = v4;

  -[UIImageView setSemanticContentAttribute:](self->_imageView, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->_button, "semanticContentAttribute"));
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", -[UIButton _imageContentMode](self->_button, "_imageContentMode"));
  -[UIButton _backgroundView](self->_button, "_backgroundView");
  v16 = (UIView *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = self->_imageView;
    selectionView = v16;
LABEL_6:
    objc_msgSend(v6, "insertSubview:aboveSubview:", v8, selectionView);
    goto LABEL_7;
  }
  if (self->_selectionView)
  {
    -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = self->_imageView;
    selectionView = self->_selectionView;
    goto LABEL_6;
  }
  -[UIButtonLegacyVisualProvider contentBackdropView](self, "contentBackdropView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v14 = self->_imageView;
  if (v12)
  {
    -[UIButtonLegacyVisualProvider contentBackdropView](self, "contentBackdropView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:above:", v14, v15);

  }
  else
  {
    objc_msgSend(v13, "insertSubview:atIndex:", self->_imageView, 0);
  }
LABEL_7:

  -[UIView viewWithTag:](self->_button, "viewWithTag:", 1886548836);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:belowSubview:", v10, self->_imageView);

  }
}

- (id)imageViewCreateIfNeeded:(BOOL)a3
{
  UIButton *button;
  UIImageView **p_imageView;
  UIButton *v6;
  UIImageView *v7;

  if (a3)
  {
    button = self->_button;
    if ((*(_WORD *)&button->_buttonFlags & 0x3FC0) != 0
      && !-[UIButton _isSystemProvidedButton](button, "_isSystemProvidedButton"))
    {
      v7 = 0;
      return v7;
    }
    p_imageView = &self->_imageView;
    if (!self->_imageView)
      -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
    -[UIButtonLegacyVisualProvider _setupImageView](self, "_setupImageView");
    v6 = self->_button;
    if ((*(_QWORD *)&v6->super.super._viewFlags & 0x200000000000000) == 0)
      -[UIView layoutIfNeeded](v6, "layoutIfNeeded");
  }
  else
  {
    p_imageView = &self->_imageView;
  }
  v7 = *p_imageView;
  return v7;
}

- (UIEdgeInsets)alignmentRectInsets
{
  UIButton *button;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  UIButton *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  button = self->_button;
  v4 = 0.0;
  if (UIButtonTypeIsModernCircleButton((*(_QWORD *)&button->_buttonFlags >> 6)))
  {
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    goto LABEL_18;
  }
  -[UIView traitCollection](button, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = self->_button;
  v11 = (*(_DWORD *)&v10->_buttonFlags >> 6);
  v5 = 1.0;
  v6 = 0.0;
  v7 = 0.0;
  if ((v11 - 3) < 2)
    goto LABEL_18;
  if (v11 == 5)
  {
    v6 = 3.0;
    v5 = 2.0;
    if (v9 == 5)
    {
      v4 = 2.0;
      goto LABEL_10;
    }
    v6 = 4.0;
    v4 = 3.0;
LABEL_15:
    v7 = 3.0;
    goto LABEL_18;
  }
  if (v11 == 2)
  {
    if (v9 == 5)
    {
      v4 = 2.0;
      v5 = 3.0;
      v6 = 3.0;
LABEL_10:
      v7 = 2.0;
      goto LABEL_18;
    }
    v4 = 3.0;
    v5 = 4.0;
    v6 = 4.0;
    goto LABEL_15;
  }
  -[UIButton backgroundImageForState:](v10, "backgroundImageForState:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "alignmentRectInsets");
    v5 = v14;
    v4 = v15;
    v6 = v16;
    v7 = v17;
  }
  else
  {
    v5 = 0.0;
  }

LABEL_18:
  v18 = v5;
  v19 = v4;
  v20 = v6;
  v21 = v7;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIButton backgroundImageForState:](self->_button, "backgroundImageForState:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIView alignmentRectForFrame:](self->_button, "alignmentRectForFrame:", x, y, width, height);
    x = v9;
    y = v10;
    width = v11;
    height = v12;
  }

  -[UIButton _combinedContentPaddingInsets](self->_button, "_combinedContentPaddingInsets");
  v17 = width - v14 - v16;
  v18 = v17 * 0.5;
  if (v17 >= 0.0)
    v18 = 0.0;
  v19 = fmax(v17, 0.0);
  v20 = height - v13 - v15;
  v21 = v20 * 0.5;
  if (v20 >= 0.0)
    v21 = 0.0;
  v22 = fmax(v20, 0.0);
  v23 = x + v14 + v18;
  v24 = y + v13 + v21;
  -[UIView _currentScreenScale](self->_button, "_currentScreenScale");
  v26 = UIRectIntegralWithScale(v23, v24, v19, v22, v25);
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_setupTitleViewRequestingLayout:(BOOL)a3
{
  _BOOL4 v4;
  UIButton *button;
  UILabel *v6;
  UILabel *titleView;
  void *v8;
  uint64_t v9;
  UILabel *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  if (!self->_titleView)
  {
    v4 = a3;
    button = self->_button;
    -[UIView bounds](button, "bounds");
    -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
    -[UIButton titleRectForContentRect:](button, "titleRectForContentRect:");
    v6 = -[UIButtonLegacyVisualProvider _newLabelWithFrame:](self, "_newLabelWithFrame:");
    titleView = self->_titleView;
    self->_titleView = v6;

    if (-[UIButton _shouldAdjustToTraitCollection](self->_button, "_shouldAdjustToTraitCollection"))
      -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleView, "setAdjustsFontForContentSizeCategory:", -[UIButton _isiOSSystemProvidedButton](self->_button, "_isiOSSystemProvidedButton"));
    v16 = 0;
    -[UIButton _lazyTitleViewFontIsDefaultForIdiom:](self->_button, "_lazyTitleViewFontIsDefaultForIdiom:", &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setFont:isDefaultForIdiom:](self->_titleView, "_setFont:isDefaultForIdiom:", v8, v16);
    -[UILabel setLineBreakMode:](self->_titleView, "setLineBreakMode:", 5);
    v9 = 0;
    v10 = self->_titleView;
    v11 = self->_button;
    if ((*(_BYTE *)&v11->_buttonFlags & 1) != 0)
      v9 = -[UIControl isHighlighted](v11, "isHighlighted", 0);
    -[UILabel setReverseShadow:](v10, "setReverseShadow:", v9);
    -[UILabel setTextAlignment:](self->_titleView, "setTextAlignment:", 2* (-[UIControl effectiveContentHorizontalAlignment](self->_button, "effectiveContentHorizontalAlignment") == UIControlContentHorizontalAlignmentRight));
    -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_titleView);

    if (v4)
      -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");

  }
  if ((*((_BYTE *)&self->_button->_buttonFlags + 3) & 0x80) != 0)
  {
    -[UILabel _defaultAttributes](self->_titleView, "_defaultAttributes", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    -[UIButton _titleColorForState:suppressTintColorFollowing:](self->_button, "_titleColorForState:suppressTintColorFollowing:", -[UIControl state](self->_button, "state"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *(_QWORD *)off_1E1678D98);

    -[UILabel _setDefaultAttributes:](self->_titleView, "_setDefaultAttributes:", v14);
    *(_QWORD *)&self->_button->_buttonFlags &= ~0x80000000uLL;

  }
}

+ (id)visualProviderForButton:(id)a3
{
  return (id)objc_opt_new();
}

- (id)_setupBackgroundView
{
  UIImageView *v2;
  UIButton *button;
  UIImageView *v5;
  UIImageView *backgroundView;
  UIView *selectionView;
  void *v8;
  void *v9;
  UIImageView *v10;

  if (self->_backgroundView)
  {
    v2 = 0;
  }
  else
  {
    button = self->_button;
    -[UIView bounds](button, "bounds");
    -[UIButton backgroundRectForBounds:](button, "backgroundRectForBounds:");
    v5 = -[UIButtonLegacyVisualProvider _newImageViewWithFrame:](self, "_newImageViewWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    -[UIButtonLegacyVisualProvider _updateEffectsForImageView:background:](self, "_updateEffectsForImageView:background:", self->_backgroundView, 1);
    selectionView = self->_selectionView;
    -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = self->_backgroundView;
    if (selectionView)
      objc_msgSend(v8, "insertSubview:aboveSubview:", v10, self->_selectionView);
    else
      objc_msgSend(v8, "insertSubview:atIndex:", v10, 0);

    v2 = self->_backgroundView;
  }
  return v2;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  CGRect result;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = v3;
  -[UIButtonLegacyVisualProvider _deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:](self, "_deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:", 0, &v8, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = *((double *)&v8 + 1);
  v4 = *(double *)&v8;
  v7 = *((double *)&v9 + 1);
  v6 = *(double *)&v9;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_setupTitleView
{
  -[UIButtonLegacyVisualProvider _setupTitleViewRequestingLayout:](self, "_setupTitleViewRequestingLayout:", 1);
}

+ (BOOL)requiresNewVisualProviderForChanges
{
  return 0;
}

- (void)_beginTitleAnimation
{
  UIButton *button;
  double v4;
  UIButton *v5;
  UIButton *v6;
  _QWORD v7[4];
  UIButton *v8;
  UIButtonLegacyVisualProvider *v9;
  _QWORD v10[5];

  button = self->_button;
  if ((*((_BYTE *)&button->_buttonFlags + 4) & 2) == 0)
  {
    if (-[UIButton _isModernButton](button, "_isModernButton"))
    {
      -[UIView alpha](self->_titleView, "alpha");
      if (v4 != 0.0)
      {
        if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
        {
          -[UIButton _setTitleFrozen:](self->_button, "_setTitleFrozen:", 1);
          v5 = self->_button;
          v9 = self;
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke;
          v10[3] = &unk_1E16B1B28;
          v10[4] = self;
          v7[0] = MEMORY[0x1E0C809B0];
          v7[1] = 3221225472;
          v7[2] = __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke_2;
          v7[3] = &unk_1E16B2218;
          v8 = v5;
          v6 = v5;
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v10, v7, 0.17, 0.0);

        }
      }
    }
  }
}

- (void)_deriveTitleRect:(CGRect *)a3 imageRect:(CGRect *)a4 fromContentRect:(CGRect)a5 calculatePositionForEmptyTitle:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  UIControlState v14;
  int64_t v15;
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
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
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
  double v63;
  void *v64;
  UILabel *v65;
  _BOOL4 v66;
  _BOOL4 v67;
  int v68;
  unint64_t v69;
  double *v70;
  double *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  int v76;
  UILabel *titleView;
  $1CF1FC38577B636919C637EEED589224 buttonFlags;
  void *v79;
  UILabel *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  uint64_t v90;
  _BOOL4 v91;
  _BOOL4 v92;
  int v93;
  unint64_t v94;
  double *v95;
  double *v96;
  double v97;
  __CFString *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  uint64_t v117;
  double v118;
  UIControlContentHorizontalAlignment v119;
  CGFloat v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  UIButton *button;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  CGFloat v149;
  double v150;
  double v151;
  CGFloat v152;
  void *v153;
  void *v154;
  uint64_t v155;
  CGRect *v156;
  CGRect *v157;
  int v158;
  void *rect;
  CGFloat recta;
  double rect_8;
  double rect_16;
  double rect_24;
  double v164;
  double v165;
  double v166;
  double v167;
  void *v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  _QWORD v176[2];
  _QWORD v177[4];
  CGRect v178;
  CGRect v179;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v177[2] = *MEMORY[0x1E0C80C00];
  v14 = -[UIControl state](self->_button, "state");
  v15 = -[UIControl effectiveContentVerticalAlignment](self->_button, "effectiveContentVerticalAlignment");
  -[UIButton imageEdgeInsets](self->_button, "imageEdgeInsets");
  v17 = x + v16;
  v19 = y + v18;
  v21 = width - (v16 + v20);
  v23 = height - (v18 + v22);
  -[UIView _currentScreenScale](self->_button, "_currentScreenScale");
  v25 = UIPointRoundToScale(v17, v19, v24);
  v172 = v26;
  v173 = v25;
  -[UIView _currentScreenScale](self->_button, "_currentScreenScale");
  v28 = UISizeRoundToScale(v21, v23, v27);
  v174 = v29;
  v31 = *MEMORY[0x1E0C9D820];
  v30 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UIButton _imageForState:applyingConfiguration:usesImageForNormalState:](self->_button, "_imageForState:applyingConfiguration:usesImageForNormalState:", v14, 1, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0.0;
  v34 = v30;
  v35 = v31;
  v164 = v28;
  if (v32)
  {
    -[UIButton _effectiveSizeForImage:](self->_button, "_effectiveSizeForImage:", v32, v31, 0.0);
    v34 = v36;
    if (self->_imageView)
    {
      v169 = v35;
      if (objc_msgSend(v32, "renderingMode") == 1)
      {
        v33 = 0.0;
      }
      else
      {
        v37 = a4;
        -[UIImageView _currentImage](self->_imageView, "_currentImage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView image](self->_imageView, "image");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_primitiveImageAsset");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v32, "isEqual:", v39) & 1) != 0
          || (objc_msgSend(v32, "isEqual:", v38) & 1) != 0
          || v40
          && (objc_msgSend(v39, "_primitiveImageAsset"),
              v168 = (void *)objc_claimAutoreleasedReturnValue(),
              v168,
              v40 == v168))
        {
          -[UIImageView _edgeInsetsForEffects](self->_imageView, "_edgeInsetsForEffects");
          v169 = v169 + v41 + v42;
          v34 = v34 + v43 + v44;
        }
        objc_msgSend(v32, "baselineOffsetFromBottom");
        v46 = v34 - v45;

        v33 = v46;
        a4 = v37;
        v28 = v164;
      }
      v35 = v169;
    }
    else
    {
      v33 = 0.0;
    }
  }
  rect_8 = v33;
  v47 = v15 & 0xFFFFFFFFFFFFFFFELL;
  v170 = v35;
  if (v35 < v28)
    v28 = v35;
  v48 = v174;
  if (v34 < v174)
    v48 = v34;
  rect_24 = v48;
  -[UIButton titleEdgeInsets](self->_button, "titleEdgeInsets");
  v50 = x + v49;
  v52 = y + v51;
  v54 = width - (v49 + v53);
  v56 = height - (v51 + v55);
  -[UIView _currentScreenScale](self->_button, "_currentScreenScale");
  v165 = UIPointRoundToScale(v50, v52, v57);
  v166 = v58;
  -[UIView _currentScreenScale](self->_button, "_currentScreenScale");
  v60 = UISizeRoundToScale(v54, v56, v59);
  v167 = v61;
  v175 = 0.0;
  v62 = v28;
  rect_16 = v60;
  if (v60 - v28 >= 0.0)
    v63 = v60 - v28;
  else
    v63 = 0.0;
  -[UIButton _attributedTitleForState:](self->_button, "_attributedTitleForState:", v14);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v64, "length"))
  {
    -[UIButton _titleForState:](self->_button, "_titleForState:", v14);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v6 && !objc_msgSend(v74, "length"))
    {
      v98 = CFSTR("X");

      v76 = 1;
      v75 = v98;
    }
    else
    {
      v76 = 0;
    }
    if (!objc_msgSend(v75, "length"))
      goto LABEL_87;
    v158 = v76;
    titleView = self->_titleView;
    v157 = a4;
    if (titleView)
    {
      buttonFlags = self->_button->_buttonFlags;
      v156 = a3;
      if ((*(_DWORD *)&buttonFlags & 0x800000) != 0)
      {
        v79 = 0;
        v80 = self->_titleView;
      }
      else
      {
        -[UILabel text](titleView, "text");
        rect = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(rect, "isEqualToString:", v75))
          v79 = 0;
        else
          v79 = v75;
        v80 = self->_titleView;
      }
      v91 = v47 != 4;
      v92 = v47 != 4 || v15 == 4;
      v93 = v15 != 4 || v91;
      v94 = -[UILabel numberOfLines](v80, "numberOfLines");
      if (v92)
        v95 = 0;
      else
        v95 = &v175;
      if (v93)
        v96 = 0;
      else
        v96 = &v175;
      v31 = _UIComputedSizeForLabel(titleView, v79, 0, v94, 0, v95, v96, v63, 1.79769313e308);
      v30 = v97;
      a3 = v156;
      a4 = v157;
      v76 = v158;
      if ((*(_DWORD *)&buttonFlags & 0x800000) != 0)
        goto LABEL_87;
    }
    else
    {
      v89 = (void *)objc_opt_new();
      objc_msgSend(v89, "setMaximumNumberOfLines:", 0);
      rect = v89;
      objc_msgSend(v89, "setWrapsForTruncationMode:", 1);
      if (v47 == 4)
        v90 = objc_msgSend(v32, "hasBaseline");
      else
        v90 = 0;
      v76 = v158;
      objc_msgSend(rect, "setWantsBaselineOffset:", v90);
      if ((*((_BYTE *)&self->_button->_buttonFlags + 2) & 0x80) != 0)
      {
        v103 = 0;
      }
      else
      {
        +[UILabel _defaultAttributes](UIButtonLabel, "_defaultAttributes");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = *(_QWORD *)off_1E1678F98;
        objc_msgSend(v153, "objectForKeyedSubscript:");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = (void *)objc_msgSend(v99, "mutableCopy");
        v101 = v100;
        if (v100)
          v102 = v100;
        else
          v102 = (id)objc_opt_new();
        v104 = v102;

        objc_msgSend(v104, "setLineBreakMode:", -[UIButton lineBreakMode](self->_button, "lineBreakMode"));
        v105 = objc_alloc(MEMORY[0x1E0CB3778]);
        v176[0] = *(_QWORD *)off_1E1678D90;
        -[UIButton _font](self->_button, "_font");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v176[1] = v155;
        v177[0] = v154;
        v177[1] = v104;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = (void *)objc_msgSend(v105, "initWithString:attributes:", v75, v106);

        v76 = v158;
      }
      objc_msgSend(v103, "boundingRectWithSize:options:context:", 1, rect, v63, 1.79769313e308);
      v31 = v107;
      v30 = v108;
      if (v47 == 4)
      {
        if (v15 == 4)
          objc_msgSend(rect, "firstBaselineOffset");
        else
          objc_msgSend(rect, "baselineOffset");
        v175 = v109;
      }

      a4 = v157;
    }

LABEL_87:
    if (v31 >= v63)
      v110 = v63;
    else
      v110 = v31;
    if (v76)
      v72 = 0.0;
    else
      v72 = v110;
LABEL_93:

    goto LABEL_94;
  }
  v65 = self->_titleView;
  if (!v65)
  {
    v75 = (void *)objc_opt_new();
    objc_msgSend(v75, "setMaximumNumberOfLines:", 0);
    objc_msgSend(v75, "setWrapsForTruncationMode:", 1);
    if (v47 == 4)
      v81 = objc_msgSend(v32, "hasBaseline");
    else
      v81 = 0;
    objc_msgSend(v75, "setWantsBaselineOffset:", v81);
    +[UILabel _defaultAttributes](UIButtonLabel, "_defaultAttributes");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)objc_msgSend(v82, "mutableCopy");

    -[UIButton _font](self->_button, "_font");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setObject:forKey:", v84, *(_QWORD *)off_1E1678D90);

    -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v64, 0, objc_msgSend(v64, "length"), v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "boundingRectWithSize:options:context:", 65, v75, v63, 1.79769313e308);
    v72 = v86;
    v30 = v87;
    if (v47 == 4)
    {
      if (v15 == 4)
        objc_msgSend(v75, "firstBaselineOffset");
      else
        objc_msgSend(v75, "baselineOffset");
      v175 = v88;
    }

    goto LABEL_93;
  }
  v66 = v47 != 4;
  v67 = v47 != 4 || v15 == 4;
  v68 = v15 != 4 || v66;
  v69 = -[UILabel numberOfLines](self->_titleView, "numberOfLines");
  if (v67)
    v70 = 0;
  else
    v70 = &v175;
  if (v68)
    v71 = 0;
  else
    v71 = &v175;
  v72 = _UIComputedSizeForLabel(v65, 0, v64, v69, 0, v70, v71, v63, 1.79769313e308);
  v30 = v73;
LABEL_94:
  v111 = (double *)MEMORY[0x1E0C9D648];
  v112 = v170;
  v171 = v34;
  -[UIButton _roundSize:](self->_button, "_roundSize:", v112, v34);
  -[UIButton _roundSize:](self->_button, "_roundSize:", v72, v30);
  v114 = v113;
  v116 = v115;
  v117 = MEMORY[0x1E0C9D538];
  v118 = *MEMORY[0x1E0C9D538];
  v119 = -[UIControl effectiveContentHorizontalAlignment](self->_button, "effectiveContentHorizontalAlignment");
  recta = v118;
  if (v119 != UIControlContentHorizontalAlignmentLeft)
  {
    v120 = v62;
    if (v119 == UIControlContentHorizontalAlignmentRight)
    {
      v127 = v173;
      v128 = v173 + v164;
      v123 = v166;
      if ((*((_DWORD *)&self->_button->super.super._viewFlags + 4) & 0x80000) != 0)
      {
        v124 = v165 + rect_16 - v114 - v62;
      }
      else
      {
        v128 = v128 - v114;
        v124 = v165 + rect_16 - v114;
      }
      v133 = v128 - v62;
      if (v133 >= v173)
        v127 = v133;
      v173 = v127;
    }
    else
    {
      if (v119 == UIControlContentHorizontalAlignmentFill)
      {
        v121 = v62 + v114;
        if (v62 + v114 == 0.0)
          v121 = 1.0;
        v122 = v62 * (v164 / v121);
        v114 = v114 * (rect_16 / v121);
        v123 = v166;
        v124 = *v111 + v165 + rect_16 - v114;
        goto LABEL_117;
      }
      button = self->_button;
      if ((*((_DWORD *)&button->super.super._viewFlags + 4) & 0x80000) != 0)
      {
        UIFloorToViewScale(button);
        v131 = fmax(v134, v118);
        UIRoundToViewScale(self->_button);
        v124 = v165 + v135 - v62;
      }
      else
      {
        UIFloorToViewScale(button);
        v131 = fmax(v130, v118);
        UIRoundToViewScale(self->_button);
        v124 = v62 + v165 + v132;
      }
      v123 = v166;
      v173 = v173 + v131;
    }
    v122 = v62;
    goto LABEL_117;
  }
  v123 = v166;
  v125 = -0.0;
  v120 = v62;
  if ((*((_DWORD *)&self->_button->super.super._viewFlags + 4) & 0x80000) != 0)
    v126 = -0.0;
  else
    v126 = v62;
  v124 = v165 + v126;
  if ((*((_DWORD *)&self->_button->super.super._viewFlags + 4) & 0x80000) != 0)
    v125 = v114;
  v173 = v173 + v125;
  v122 = v62;
LABEL_117:
  v136 = v111[1];
  v137 = *(double *)(v117 + 8);
  switch(v15)
  {
    case 1:
      v167 = v116;
      v174 = rect_24;
      break;
    case 2:
      v143 = v172;
      if (v172 + v174 - rect_24 >= v172)
        v143 = v172 + v174 - rect_24;
      v172 = v143;
      v123 = v123 + v167 - v116;
      v167 = v116;
      v174 = rect_24;
      break;
    case 3:
      break;
    case 4:
    case 5:
      if (objc_msgSend(v32, "hasBaseline") && v116 > 0.0)
      {
        v178.size.width = v120;
        v138 = rect_24;
        v178.origin.x = recta;
        v178.origin.y = v137;
        v178.size.height = rect_24;
        v179 = CGRectOffset(v178, 0.0, v175 - rect_8 * rect_24 / v171);
        if (v179.origin.y >= v137)
          v139 = v137;
        else
          v139 = v179.origin.y;
        v140 = fmin(v139, 0.0);
        v172 = v172 + v179.origin.y - v140;
        v123 = v136 + v123 - v140;
        goto LABEL_125;
      }
      UIFloorToViewScale(self->_button);
      v172 = v172 + fmax(v144, v137);
      UIRoundToViewScale(self->_button);
      v123 = v123 + v145;
      v167 = v116;
      v174 = rect_24;
      break;
    default:
      v138 = rect_24;
      UIFloorToViewScale(self->_button);
      v172 = v136 + v172 + fmax(v141, v137);
      UIRoundToViewScale(self->_button);
      v123 = v136 + v123 + v142;
LABEL_125:
      v167 = v116;
      v174 = v138;
      break;
  }
  -[UIView _currentScreenScale](self->_button, "_currentScreenScale");
  v147 = UIPointRoundToScale(v173, v172, v146);
  v149 = v148;
  -[UIView _currentScreenScale](self->_button, "_currentScreenScale");
  v151 = UIPointRoundToScale(v124, v123, v150);
  if (a4)
  {
    a4->origin.x = v147;
    a4->origin.y = v149;
    a4->size.width = v122;
    a4->size.height = v174;
  }
  if (a3)
  {
    a3->origin.x = v151;
    a3->origin.y = v152;
    a3->size.width = v114;
    a3->size.height = v167;
  }

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[UILabel adjustsFontForContentSizeCategory](self->_titleView, "adjustsFontForContentSizeCategory");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (!self->_imageView && -[UIButton _hasImageForProperty:](self->_button, "_hasImageForProperty:", CFSTR("image")))
    *(_QWORD *)&self->_button->_buttonFlags |= 0x1000000uLL;
  if (!self->_backgroundView
    && -[UIButton _hasImageForProperty:](self->_button, "_hasImageForProperty:", CFSTR("background")))
  {
    *(_QWORD *)&self->_button->_buttonFlags |= 0x2000000uLL;
  }
  -[UIView _focusSystem](self->_button, "_focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIView traitCollection](self->_button, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 2 || v6 == 8)
    {
      -[UIButtonLegacyVisualProvider _updateTitleView](self, "_updateTitleView");
    }
    else if (v6 == 3)
    {
      -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
    }
  }

}

- (BOOL)deferToLazyTitleFont
{
  return self->_titleView == 0;
}

- (id)font
{
  return -[UILabel font](self->_titleView, "font");
}

- (BOOL)fontIsDefaultForIdiom
{
  return -[UILabel _fontIsDefaultForIdiom](self->_titleView, "_fontIsDefaultForIdiom");
}

- (int64_t)lineBreakMode
{
  UILabel *titleView;

  titleView = self->_titleView;
  if (titleView)
    return -[UILabel lineBreakMode](titleView, "lineBreakMode");
  else
    return 5;
}

- (void)setButton:(id)a3
{
  self->_button = (UIButton *)a3;
}

- (void)setSelected:(BOOL)a3
{
  id v4;

  -[UIButtonLegacyVisualProvider _floatingContentView](self, "_floatingContentView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setControlState:animated:", -[UIControl state](self->_button, "state"), +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));

}

- (void)_layoutContentBackdropView
{
  void *v3;
  void *v4;
  char v5;
  UIButton *button;
  void *v7;

  -[UIButtonLegacyVisualProvider contentBackdropView](self, "contentBackdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "isHidden");
    v4 = v7;
    if ((v5 & 1) == 0)
    {
      button = self->_button;
      -[UIView bounds](button, "bounds");
      -[UIButton backgroundRectForBounds:](button, "backgroundRectForBounds:");
      objc_msgSend(v7, "setFrame:");
      v4 = v7;
    }
  }

}

- (id)contentBackdropView
{
  BOOL v3;
  UIVisualEffectView *v4;
  void *v5;
  __objc2_class **v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *contentBackdropView;
  UIVisualEffectView *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!self->_contentBackdropView)
  {
    if (-[UIButtonLegacyVisualProvider _wantsContentBackdropView](self, "_wantsContentBackdropView"))
    {
      if ((*(_QWORD *)&self->_button->_buttonFlags & 0x8000000) != 0)
        v6 = off_1E167A3C8;
      else
        v6 = off_1E167C9F0;
      -[__objc2_class _effectWithStyle:invertAutomaticStyle:](*v6, "_effectWithStyle:invertAutomaticStyle:", 5001, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v5);
      contentBackdropView = self->_contentBackdropView;
      self->_contentBackdropView = v7;

      -[UIVisualEffectView setAllowsDithering:](self->_contentBackdropView, "setAllowsDithering:", 0);
      v9 = self->_contentBackdropView;
      -[UIButtonLegacyVisualProvider _floatingContentView](self, "_floatingContentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cornerRadius");
      -[UIVisualEffectView _setCornerRadius:](v9, "_setCornerRadius:");

      -[UIButtonLegacyVisualProvider _floatingContentView](self, "_floatingContentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "visualEffectContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_contentBackdropView);

      goto LABEL_9;
    }
    if (!self->_contentBackdropView)
    {
      v4 = 0;
      return v4;
    }
  }
  v3 = -[UIButtonLegacyVisualProvider _wantsContentBackdropView](self, "_wantsContentBackdropView");
  v4 = self->_contentBackdropView;
  if (!v3)
  {
    -[UIView removeFromSuperview](v4, "removeFromSuperview");
    v5 = self->_contentBackdropView;
    self->_contentBackdropView = 0;
LABEL_9:

    v4 = self->_contentBackdropView;
  }
  return v4;
}

- (BOOL)_wantsContentBackdropView
{
  _BOOL4 v3;

  v3 = -[UIButton _shouldHaveFloatingAppearance](self->_button, "_shouldHaveFloatingAppearance");
  if (v3)
    return (*((unsigned __int8 *)&self->_button->_buttonFlags + 3) >> 4) & 1;
  return v3;
}

- (id)_floatingContentView
{
  _UIFloatingContentView *v3;
  _UIFloatingContentView *v4;
  _UIFloatingContentView *floatingContentView;
  _QWORD v7[5];

  if (-[UIButton _shouldHaveFloatingAppearance](self->_button, "_shouldHaveFloatingAppearance")
    && !self->_floatingContentView)
  {
    v3 = [_UIFloatingContentView alloc];
    v4 = -[_UIFloatingContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    floatingContentView = self->_floatingContentView;
    self->_floatingContentView = v4;

    -[_UIFloatingContentView setFloatingContentDelegate:](self->_floatingContentView, "setFloatingContentDelegate:", self);
    if (!_UIDeviceHasExternalTouchInput())
      -[UIView setUserInteractionEnabled:](self->_floatingContentView, "setUserInteractionEnabled:", 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__UIButtonLegacyVisualProvider__floatingContentView__block_invoke;
    v7[3] = &unk_1E16B1B28;
    v7[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v7);
    -[UIView addSubview:](self->_button, "addSubview:", self->_floatingContentView);
  }
  return self->_floatingContentView;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  id v6;

  -[UIButton _backgroundView](self->_button, "_backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

  -[UIButton _imageView](self->_button, "_imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSemanticContentAttribute:", a3);

}

- (id)backgroundViewCreateIfNeeded:(BOOL)a3
{
  return self->_backgroundView;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIButtonMaskAnimationView setDelegate:](self->_maskAnimationView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIButtonLegacyVisualProvider;
  -[UIButtonLegacyVisualProvider dealloc](&v3, sel_dealloc);
}

- (void)cleanupForVisualProvider:(id)a3
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  UIButton *button;
  id v14;
  void *v15;
  id *v16;

  v16 = (id *)a3;
  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_floatingContentView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_contentBackdropView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_titleView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_selectionView, "removeFromSuperview");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong(v16 + 2, self->_backgroundView);
    v4 = v16;
    objc_storeStrong(v4 + 3, self->_floatingContentView);
    objc_storeStrong(v4 + 4, self->_contentBackdropView);
    objc_storeStrong(v4 + 6, self->_titleView);
    objc_storeStrong(v4 + 5, self->_imageView);
    objc_storeStrong(v4 + 7, self->_selectionView);
    objc_storeStrong(v4 + 8, self->_highlightLayer);
    objc_storeStrong(v4 + 9, self->_maskAnimationView);
    WeakRetained = objc_loadWeakRetained((id *)&self->_effectiveContentView);
    objc_storeWeak(v4 + 10, WeakRetained);

    objc_msgSend(v4, "effectiveContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_backgroundView);

    objc_msgSend(v4, "effectiveContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_floatingContentView);

    objc_msgSend(v4, "effectiveContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_contentBackdropView);

    objc_msgSend(v4, "effectiveContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_titleView);

    objc_msgSend(v4, "effectiveContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_imageView);

    objc_msgSend(v4, "effectiveContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addSubview:", self->_selectionView);
  }
  -[CALayer removeFromSuperlayer](self->_highlightLayer, "removeFromSuperlayer");
  -[UIView removeFromSuperview](self->_maskAnimationView, "removeFromSuperview");
  v12 = (UIButton *)objc_loadWeakRetained((id *)&self->_effectiveContentView);
  button = self->_button;

  if (v12 != button)
  {
    v14 = objc_loadWeakRetained((id *)&self->_effectiveContentView);
    objc_msgSend(v14, "removeFromSuperview");

  }
  -[UIView viewWithTag:](self->_button, "viewWithTag:", 1886548836);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeFromSuperview");

}

- (void)willMoveToWindow:(id)a3
{
  _UIButtonMaskAnimationView *maskAnimationView;

  if (!a3)
  {
    -[_UIButtonMaskAnimationView setDelegate:](self->_maskAnimationView, "setDelegate:");
    -[UIView removeFromSuperview](self->_maskAnimationView, "removeFromSuperview");
    maskAnimationView = self->_maskAnimationView;
    self->_maskAnimationView = 0;

  }
}

- (CGSize)_intrinsicSizeForTitle:(id)a3 attributedTitle:(id)a4 image:(id)a5 backgroundImage:(id)a6 titlePaddingInsets:(UIEdgeInsets *)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double height;
  double v23;
  double v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  unint64_t v41;
  id v42;
  UIEdgeInsets *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  _BOOL4 v56;
  CGFloat x;
  CGFloat y;
  double v59;
  double v60;
  int v61;
  double v62;
  CGFloat v63;
  char v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  char v76;
  unint64_t v77;
  void *v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  int v87;
  unint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  _QWORD v92[2];
  CGSize result;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v92[1] = *MEMORY[0x1E0C80C00];
  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a5;
  v15 = a6;
  if (a7)
  {
    *(_OWORD *)&a7->top = 0u;
    *(_OWORD *)&a7->bottom = 0u;
  }
  v17 = *MEMORY[0x1E0C9D820];
  v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v18 = (double *)MEMORY[0x1E0C9D538];
  if (v14)
  {
    -[UIButton _effectiveSizeForImage:](self->_button, "_effectiveSizeForImage:", v14);
    v20 = v19;
    height = v21;
    if (-[UIButton _hasDrawingStyle](self->_button, "_hasDrawingStyle"))
    {
      -[UIButtonLegacyVisualProvider _highlightRectForImageRect:](self, "_highlightRectForImageRect:", *v18, v18[1], v20, height);
      if (v20 < v23)
        v20 = v23;
      if (height < v24)
        height = v24;
    }
    if (objc_msgSend(v14, "hasBaseline"))
    {
      objc_msgSend(v14, "size");
      objc_msgSend(v14, "baselineOffsetFromBottom");
      v25 = (void *)objc_opt_new();
      v26 = 1;
      objc_msgSend(v25, "setWantsBaselineOffset:", 1);
      if (!v13)
        goto LABEL_23;
    }
    else
    {
      v26 = 0;
      v25 = 0;
      if (!v13)
        goto LABEL_23;
    }
  }
  else
  {
    v26 = 0;
    v25 = 0;
    v20 = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (!v13)
      goto LABEL_23;
  }
  if (objc_msgSend((id)v13, "length"))
  {
    v88 = v12;
    v87 = v26;
    if (-[UILabel adjustsFontForContentSizeCategory](self->_titleView, "adjustsFontForContentSizeCategory")
      && -[UIButton _shouldAdjustToTraitCollection](self->_button, "_shouldAdjustToTraitCollection"))
    {
      -[UIView traitCollection](self->_button, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v13, "_ui_attributedStringAdjustedToTraitCollection:", v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v28)
        v30 = (void *)v28;
      else
        v30 = (void *)v13;
      v31 = v30;

      v13 = (unint64_t)v31;
      v18 = (double *)MEMORY[0x1E0C9D538];
    }
    +[UILabel _defaultAttributes](UIButtonLabel, "_defaultAttributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    -[UIButton _font](self->_button, "_font");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKey:", v34, *(_QWORD *)off_1E1678D90);

    -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:]((void *)v13, 0, objc_msgSend((id)v13, "length"), v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "boundingRectWithSize:options:context:", 65, v25, 3.40282347e38, 3.40282347e38);
    v37 = v36;
    v16 = v38;
    objc_msgSend(v25, "firstBaselineOffset");
    -[UIButton _roundSize:](self->_button, "_roundSize:", v37, v16);
    v17 = v39;

    goto LABEL_29;
  }
LABEL_23:
  if (v12 && objc_msgSend((id)v12, "length"))
  {
    v87 = v26;
    v91 = *(_QWORD *)off_1E1678D90;
    -[UIButton _font](self->_button, "_font");
    v40 = v14;
    v41 = v13;
    v42 = v15;
    v43 = a7;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, &v91, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v12;
    objc_msgSend((id)v12, "boundingRectWithSize:options:attributes:context:", 1, v45, v25, v17, v16);
    v47 = v46;
    v49 = v48;

    a7 = v43;
    v15 = v42;
    v13 = v41;
    v14 = v40;
  }
  else
  {
    if (!-[UIButton _likelyToHaveTitle](self->_button, "_likelyToHaveTitle"))
    {
      x = *v18;
      y = v18[1];
      v64 = 1;
      goto LABEL_41;
    }
    v88 = v12;
    v87 = v26;
    v89 = *(_QWORD *)off_1E1678D90;
    -[UIButton _font](self->_button, "_font");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_1E16EDF20, "boundingRectWithSize:options:attributes:context:", 1, v51, v25, v17, v16);
    v47 = v52;
    v49 = v53;

  }
  objc_msgSend(v25, "firstBaselineOffset");
  -[UIButton _roundSize:](self->_button, "_roundSize:", v47, v49);
  v17 = v54;
  v16 = v55;
LABEL_29:
  v56 = -[UIButton _hasDrawingStyle](self->_button, "_hasDrawingStyle");
  x = *v18;
  y = v18[1];
  if (v56)
  {
    -[UIButtonLegacyVisualProvider _highlightRectForTextRect:](self, "_highlightRectForTextRect:", *v18, v18[1], v17, v16);
    if (v17 < v59)
      v17 = v59;
    if (v16 < v60)
      v16 = v60;
  }
  v12 = v88;
  if (v16 > 0.0)
    v61 = v87;
  else
    v61 = 0;
  if (v61 != 1)
  {
    v64 = 0;
LABEL_41:
    v95.size.width = v20;
    goto LABEL_42;
  }
  UIRoundToViewScale(self->_button);
  v63 = v62;
  v94.origin.x = x;
  v94.origin.y = y;
  v94.size.width = v20;
  v94.size.height = height;
  v95 = CGRectOffset(v94, 0.0, v63);
  x = v95.origin.x;
  y = v95.origin.y;
  height = v95.size.height;
  v64 = 0;
LABEL_42:
  v97.origin.y = 0.0;
  v65 = x;
  v66 = y;
  v67 = height;
  v97.origin.x = v20;
  v97.size.width = v17;
  v97.size.height = v16;
  v96 = CGRectUnion(v95, v97);
  -[UIButton contentEdgeInsets](self->_button, "contentEdgeInsets", v96.origin.x, v96.origin.y);
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  if (v14 && (*(_QWORD *)&self->_button->super.super._viewFlags & 0x800000000000000) != 0 && v12 | v13)
  {
    objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
    -[UIButton imageEdgeInsets](self->_button, "imageEdgeInsets");
    -[UIButton titleEdgeInsets](self->_button, "titleEdgeInsets");
  }
  if (v15)
  {
    if (objc_msgSend(v15, "_isResizable"))
    {
      objc_msgSend(v15, "capInsets");
      objc_msgSend(v15, "alignmentRectInsets");
    }
    objc_msgSend(v15, "size");
  }
  else
  {
    if (v14)
      v76 = 1;
    else
      v76 = v64;
    if ((v76 & 1) == 0 && v71 == 0.0 && v69 == 0.0 && v75 == 0.0 && v73 == 0.0)
    {
      v77 = v12;
      -[UIView traitCollection](self->_button, "traitCollection");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "userInterfaceIdiom");

      if (v79 == 5)
        v80 = 5.0;
      else
        v80 = 6.0;
      if (a7)
      {
        a7->top = v80;
        a7->left = 0.0;
        a7->bottom = v80;
        a7->right = 0.0;
      }
      v12 = v77;
    }
  }
  UIRoundToViewScale(self->_button);
  v82 = v81;
  UIRoundToViewScale(self->_button);
  v84 = v83;

  v85 = v82;
  v86 = v84;
  result.height = v86;
  result.width = v85;
  return result;
}

- (id)_newImageViewWithFrame:(CGRect)a3
{
  UIImageView *v4;

  v4 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  -[UIView setOpaque:](v4, "setOpaque:", 0);
  -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  -[UIImageView setSemanticContentAttribute:](v4, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->_button, "semanticContentAttribute"));
  return v4;
}

uint64_t __75__UIButtonLegacyVisualProvider_setVisualEffectViewEnabled_backgroundColor___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = 0;
  else
    v1 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setBackgroundColor:forState:", v1, 0);
}

- (void)_updateSelectionViewForState:(unint64_t)a3
{
  char v3;
  void *v5;
  UIView *v6;
  UIView *selectionView;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
  void *v12;
  UIButton *v13;
  uint64_t v14;
  UIButton *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  _QWORD v26[6];
  _QWORD v27[5];
  UIButton *v28;

  v3 = a3;
  if ((a3 & 4) != 0 && !self->_selectionView)
  {
    objc_msgSend((id)objc_opt_class(), "_selectedIndicatorImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton _selectedIndicatorViewWithImage:](self->_button, "_selectedIndicatorViewWithImage:", v5);
    v6 = (UIView *)objc_claimAutoreleasedReturnValue();
    selectionView = self->_selectionView;
    self->_selectionView = v6;

    -[UIView setAlpha:](self->_selectionView, "setAlpha:", 0.0);
    -[UIView setUserInteractionEnabled:](self->_selectionView, "setUserInteractionEnabled:", 0);
    -[UIButtonLegacyVisualProvider contentBackdropView](self, "contentBackdropView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = self->_selectionView;
    if (v8)
    {
      -[UIButtonLegacyVisualProvider contentBackdropView](self, "contentBackdropView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:above:", v11, v12);

    }
    else
    {
      objc_msgSend(v9, "insertSubview:atIndex:", self->_selectionView, 0);
    }

  }
  if (self->_selectionView)
  {
    v13 = self->_button;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__UIButtonLegacyVisualProvider__updateSelectionViewForState___block_invoke;
    v27[3] = &unk_1E16B1B50;
    v27[4] = self;
    v15 = v13;
    v28 = v15;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v27);
    v16 = 0.0;
    if ((v3 & 4) != 0)
      -[UIButton _selectedIndicatorAlpha](self->_button, "_selectedIndicatorAlpha", 0.0);
    if ((v3 & 1) != 0)
      v17 = v16 * 0.8;
    else
      v17 = v16;
    -[UIView alpha](self->_selectionView, "alpha");
    if (v18 != v17)
    {
      v19 = dbl_18667D0D0[(v3 & 4) == 0];
      v26[0] = v14;
      v26[1] = 3221225472;
      v26[2] = __61__UIButtonLegacyVisualProvider__updateSelectionViewForState___block_invoke_2;
      v26[3] = &unk_1E16B1888;
      v26[4] = self;
      *(double *)&v26[5] = v17;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v26, 0, v19, 0.0);
    }

  }
  if ((v3 & 4) != 0
    && -[UIButtonLegacyVisualProvider _textNeedsCompositingModeWhenSelected](self, "_textNeedsCompositingModeWhenSelected"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 1;
  }
  else
  {
    v21 = 0;
    v20 = 0;
  }
  -[UIView layer](self->_titleView, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCompositingFilter:", v20);

  if (v21)
  if ((v3 & 4) != 0
    && -[UIButtonLegacyVisualProvider _imageNeedsCompositingModeWhenSelected](self, "_imageNeedsCompositingModeWhenSelected"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 1;
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  -[UIView layer](self->_imageView, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCompositingFilter:", v23);

  if (v24)
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)baselineOffsetsAtSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  UIImageView *v6;
  UIImageView *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIButton *button;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  UIButton *v20;
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
  CGFloat v32;
  double rect_8;
  double rect_16;
  CGFloat rect_24;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a3.height;
  width = a3.width;
  -[UIButtonLegacyVisualProvider _viewForBaselineLayout](self, "_viewForBaselineLayout");
  v6 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    rect_24 = width;
    if (v6 == (UIImageView *)self->_titleView)
    {
      -[UIButtonLegacyVisualProvider _updateTitleView](self, "_updateTitleView");
      button = self->_button;
      -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
      -[UIButton titleRectForContentRect:](button, "titleRectForContentRect:");
    }
    else
    {
      if (v6 != self->_imageView)
      {
        v8 = 0.0;
        v9 = 0.0;
        v10 = 0.0;
        -[UIImageView _baselineOffsetsAtSize:](v6, "_baselineOffsetsAtSize:", 0.0, 0.0, 0);
LABEL_9:
        v21 = v11;
        rect_16 = v12;
        -[UIImageView alignmentRectInsets](v7, "alignmentRectInsets");
        v23 = v22;
        rect_8 = v24;
        -[UIButton alignmentRectInsets](self->_button, "alignmentRectInsets");
        v26 = v25;
        v28 = v27;
        v37.origin.x = v10;
        v37.origin.y = v32;
        v37.size.width = v9;
        v37.size.height = v8;
        v13 = v21 + v23 + CGRectGetMinY(v37) - v26;
        v38.origin.x = 0.0;
        v38.origin.y = 0.0;
        v38.size.width = rect_24;
        v38.size.height = height;
        v29 = CGRectGetHeight(v38);
        v39.origin.x = v10;
        v39.origin.y = v32;
        v39.size.width = v9;
        v39.size.height = v8;
        v14 = rect_16 + rect_8 + v29 - CGRectGetMaxY(v39) - v28;
        goto LABEL_10;
      }
      -[UIButtonLegacyVisualProvider _updateImageView](self, "_updateImageView");
      v20 = self->_button;
      -[UIButton contentRectForBounds:](v20, "contentRectForBounds:");
      -[UIButton imageRectForContentRect:](v20, "imageRectForContentRect:");
    }
    v10 = v16;
    v9 = v18;
    v8 = v19;
    -[UIImageView _baselineOffsetsAtSize:](v7, "_baselineOffsetsAtSize:", v18, v19, v17);
    goto LABEL_9;
  }
  v13 = 2.22507386e-308;
  v14 = 2.22507386e-308;
LABEL_10:

  v30 = v13;
  v31 = v14;
  result.var1 = v31;
  result.var0 = v30;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIButtonLegacyVisualProvider _titleRectForContentRect:calculatePositionForEmptyTitle:](self, "_titleRectForContentRect:calculatePositionForEmptyTitle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_titleRectForContentRect:(CGRect)a3 calculatePositionForEmptyTitle:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  UIControlState v10;
  UIControlState v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[UIControl state](self->_button, "state");
  if (!v4)
  {
    v11 = v10;
    -[UIButton _titleForState:](self->_button, "_titleForState:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12 || !objc_msgSend(v12, "length"))
    {
      -[UIButton _attributedTitleForState:](self->_button, "_attributedTitleForState:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14 || !objc_msgSend(v14, "length"))
      {
        v21 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
        v22 = *MEMORY[0x1E0C9D648];
        v23 = v21;

        goto LABEL_9;
      }

    }
  }
  v16 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v22 = *MEMORY[0x1E0C9D648];
  v23 = v16;
  -[UIButtonLegacyVisualProvider _deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:](self, "_deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:", &v22, 0, v4, x, y, width, height);
LABEL_9:
  v18 = *((double *)&v22 + 1);
  v17 = *(double *)&v22;
  v20 = *((double *)&v23 + 1);
  v19 = *(double *)&v23;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  id v4;
  id v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  char v18;
  void *v19;
  UIControlContentHorizontalAlignment v20;
  void (**v21)(void *, uint64_t);
  uint64_t v22;
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
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  uint64_t v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  UIButton *button;
  double v79;
  void *v80;
  int64_t v81;
  const __CFString *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  char v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  uint64_t v98;
  void *v99;
  id firstValue;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  _QWORD aBlock[6];

  -[UIButtonLegacyVisualProvider _titleOrImageViewForBaselineLayout](self, "_titleOrImageViewForBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints") & 1) == 0 && !self->_contentConstraints)
  {
    -[UIButton _imageForState:applyingConfiguration:usesImageForNormalState:](self->_button, "_imageForState:applyingConfiguration:usesImageForNormalState:", -[UIControl state](self->_button, "state"), 0, 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      -[UIButton _imageView](self->_button, "_imageView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView contentHuggingPriorityForAxis:](self->_button, "contentHuggingPriorityForAxis:", 0);
    *(float *)&v7 = v6 + -1.0;
    objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    -[UIView contentHuggingPriorityForAxis:](self->_button, "contentHuggingPriorityForAxis:", 1);
    *(float *)&v9 = v8 + -1.0;
    objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    -[UIView contentCompressionResistancePriorityForAxis:](self->_button, "contentCompressionResistancePriorityForAxis:", 0);
    *(float *)&v11 = v10 + -1.0;
    objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v11);
    -[UIView contentCompressionResistancePriorityForAxis:](self->_button, "contentCompressionResistancePriorityForAxis:", 1);
    *(float *)&v13 = v12 + -1.0;
    objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 1, v13);
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0;
    v16 = 0;
    if (v5)
      v17 = v4 == v5;
    else
      v17 = 1;
    v18 = v17;
    v91 = v18;
    if (!v17)
    {
      v19 = v5;
      -[UIView viewWithTag:](self->_button, "viewWithTag:", 12000274);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[UIView viewWithTag:](self->_button, "viewWithTag:", -12000274);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      v20 = -[UIControl contentHorizontalAlignment](self->_button, "contentHorizontalAlignment");
      if (v16 || v20)
      {
        if (-[UIControl contentHorizontalAlignment](self->_button, "contentHorizontalAlignment"))
        {
          objc_msgSend(v16, "removeFromSuperview");

          objc_msgSend(v15, "removeFromSuperview");
          v15 = 0;
          v16 = 0;
        }
      }
      else
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __49__UIButtonLegacyVisualProvider_updateConstraints__block_invoke;
        aBlock[3] = &unk_1E16C9780;
        aBlock[4] = self;
        v21 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
        v21[2](v21, 12000274);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2](v21, -12000274);
        v22 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v22;
      }
      v5 = v19;
    }
    firstValue = v5;
    v101 = v16;
    v102 = v15;
    v103 = v14;
    v98 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
    -[UIButton _combinedContentPaddingInsets](self->_button, "_combinedContentPaddingInsets");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v95 = v29;
    -[UIButton imageEdgeInsets](self->_button, "imageEdgeInsets");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    -[UIButton titleEdgeInsets](self->_button, "titleEdgeInsets");
    v93 = v38;
    v96 = v39;
    v97 = v40;
    v42 = v41;
    v105 = (void *)MEMORY[0x1E0C99E08];
    v43 = v24 + v31;
    *(float *)&v43 = v24 + v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v26 + v33;
    v90 = v26 + v33;
    *(float *)&v44 = v26 + v33;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v28 + v35;
    v92 = v28 + v35;
    *(float *)&v46 = v28 + v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v95 + v37;
    *(float *)&v48 = v95 + v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v24 + v93;
    v94 = v50;
    *(float *)&v50 = v50;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v26 + v96;
    *(float *)&v53 = v52;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v55) = HIDWORD(v97);
    v56 = v28 + v97;
    *(float *)&v55 = v56;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v58 = v95 + v42;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v33 + v42;
    if (v98 != 1)
      v60 = v37 + v96;
    *(float *)&v60 = v60;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "dictionaryWithObjectsAndKeys:", v99, CFSTR("topImageInset"), v45, CFSTR("leftImageInset"), v47, CFSTR("bottomImageInset"), v49, CFSTR("rightImageInset"), v51, CFSTR("topTitleInset"), v54, CFSTR("leftTitleInset"), v57, CFSTR("bottomTitleInset"), v59, CFSTR("rightTitleInset"), v61,
      CFSTR("interImageTitleSpace"),
      0);
    v106 = objc_claimAutoreleasedReturnValue();

    _NSDictionaryOfVariableBindings(CFSTR("layoutView"), v4, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "mutableCopy");

    if (firstValue)
    {
      _NSDictionaryOfVariableBindings(CFSTR("imageView"), firstValue, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addEntriesFromDictionary:", v64);

    }
    if (v101)
    {
      _NSDictionaryOfVariableBindings(CFSTR("leftSpacer,rightSpacer"), v101, v102, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addEntriesFromDictionary:", v65);

    }
    v66 = (void *)v106;
    switch(-[UIControl effectiveContentHorizontalAlignment](self->_button, "effectiveContentHorizontalAlignment"))
    {
      case UIControlContentHorizontalAlignmentCenter:
        if (firstValue)
        {
          if (v4 != firstValue)
          {
            v67 = CFSTR("|-(leftImageInset)-[leftSpacer][imageView]-(interImageTitleSpace)-[layoutView][rightSpacer(>=leftSpacer,==leftSpacer@200)]-(rightTitleInset)-|");
            goto LABEL_42;
          }
          v77 = (void *)MEMORY[0x1E0D156E0];
          button = self->_button;
          v79 = v90 + (v95 + v37) * -0.5;
        }
        else
        {
          v77 = (void *)MEMORY[0x1E0D156E0];
          button = self->_button;
          v79 = (v52 - (v95 + v42)) * 0.5;
        }
        objc_msgSend(v77, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, button, 9, 1.0, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "addObject:", v80);

        goto LABEL_55;
      case UIControlContentHorizontalAlignmentLeft:
        v68 = CFSTR("|-(leftImageInset)-[imageView]-(interImageTitleSpace)-[layoutView]-(>=rightTitleInset)-|");
        if (v4 == firstValue)
          v68 = CFSTR("|-(leftImageInset)-[layoutView]-(>=rightImageInset)-|");
        v69 = CFSTR("|-(leftTitleInset)-[layoutView]-(>=rightTitleInset)-|");
        goto LABEL_39;
      case UIControlContentHorizontalAlignmentRight:
        v68 = CFSTR("|-(>=leftImageInset)-[imageView]-(interImageTitleSpace)-[layoutView]-(rightTitleInset)-|");
        if (v4 == firstValue)
          v68 = CFSTR("|-(>=leftImageInset)-[layoutView]-(rightImageInset)-|");
        v69 = CFSTR("|-(>=leftTitleInset)-[layoutView]-(rightTitleInset)-|");
LABEL_39:
        if (firstValue)
          v67 = v68;
        else
          v67 = v69;
        goto LABEL_42;
      case UIControlContentHorizontalAlignmentFill:
        if (firstValue)
          v67 = CFSTR("|-(leftImageInset)-[layoutView]-(rightImageInset)-|");
        else
          v67 = CFSTR("|-(leftTitleInset)-[layoutView]-(rightTitleInset)-|");
        if ((v91 & 1) == 0)
        {
          objc_msgSend(firstValue, "intrinsicContentSize");
          if (v72 == 0.0)
          {
            v76 = 1.0;
          }
          else
          {
            objc_msgSend(v4, "intrinsicContentSize");
            v74 = v73;
            objc_msgSend(firstValue, "intrinsicContentSize");
            v76 = v74 / v75;
          }
          objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, firstValue, 7, v76, 0.0);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "addObject:", v89);

          v67 = CFSTR("|-(leftImageInset)-[imageView]-(interImageTitleSpace)-[layoutView]-(rightTitleInset)-|");
        }
LABEL_42:
        if (dyld_program_sdk_at_least())
          v70 = 0x10000;
        else
          v70 = 0;
        objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", v67, v70, v106, v63);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "addObjectsFromArray:", v71);

        break;
      default:
LABEL_55:
        dyld_program_sdk_at_least();
        break;
    }
    v81 = -[UIControl effectiveContentVerticalAlignment](self->_button, "effectiveContentVerticalAlignment");
    v82 = CFSTR("V:|-(topTitleInset)-[layoutView]-(bottomTitleInset)-|");
    v83 = CFSTR("V:|-(topImageInset)-[imageView]-(bottomImageInset)-|");
    switch(v81)
    {
      case 0:
      case 4:
      case 5:
        if (firstValue)
        {
          objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", firstValue, 10, 0, self->_button, 10, 1.0, (v24 + v31 - v92) * 0.5);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "addObject:", v84);

        }
        if (v4 != firstValue)
        {
          objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 10, 0, self->_button, 10, 1.0, (v94 - v56) * 0.5);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "addObject:", v85);
          goto LABEL_67;
        }
        break;
      case 1:
        v82 = CFSTR("V:|-(topTitleInset)-[layoutView]-(>=bottomTitleInset)-|");
        v83 = CFSTR("V:|-(topImageInset)-[imageView]-(>=bottomImageInset)-|");
        goto LABEL_63;
      case 2:
        v82 = CFSTR("V:|-(>=topTitleInset)-[layoutView]-(bottomTitleInset)-|");
        v83 = CFSTR("V:|-(>=topImageInset)-[imageView]-(bottomImageInset)-|");
        goto LABEL_63;
      case 3:
LABEL_63:
        if (firstValue)
        {
          objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", v83, 0, v106, v63);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "addObjectsFromArray:", v86);

          v66 = (void *)v106;
        }
        if (v4 != firstValue)
        {
          objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", v82, 0, v66, v63);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "addObjectsFromArray:", v85);
LABEL_67:

        }
        break;
      default:
        break;
    }
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, -1, self->_button, 7, 1.0, 0.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "addObject:", v87);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, -1, self->_button, 8, 1.0, 0.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "addObject:", v88);

    -[UIView addConstraints:](self->_button, "addConstraints:", v103);
    -[UIButtonLegacyVisualProvider _setContentConstraints:](self, "_setContentConstraints:", v103);

  }
}

- (void)_setContentConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)_createPreparedImageViewWithFrame:(CGRect)a3
{
  id v4;

  v4 = -[UIButtonLegacyVisualProvider _newImageViewWithFrame:](self, "_newImageViewWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIButtonLegacyVisualProvider _updateEffectsForImageView:background:](self, "_updateEffectsForImageView:background:", v4, 0);
  return v4;
}

- (void)didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  -[UIButtonLegacyVisualProvider _updateEffectsForImageView:background:](self, "_updateEffectsForImageView:background:", self->_imageView, 0, a5);
  -[UIButtonLegacyVisualProvider _updateEffectsForImageView:background:](self, "_updateEffectsForImageView:background:", self->_backgroundView, 1);
}

- (void)_updateEffectsForImageView:(id)a3 background:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[UIButtonLegacyVisualProvider _shouldDefaultToTemplatesForImageViewBackground:](self, "_shouldDefaultToTemplatesForImageViewBackground:", v4))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v7, "_setDefaultRenderingMode:", v6);

}

- (BOOL)_shouldDefaultToTemplatesForImageViewBackground:(BOOL)a3
{
  BOOL v5;

  v5 = -[UIButton _isModernButton](self->_button, "_isModernButton")
    || -[UIButton _isCarPlaySystemTypeButton](self->_button, "_isCarPlaySystemTypeButton");
  return v5 && !a3;
}

- (id)_newLabelWithFrame:(CGRect)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;

  v4 = -[UIButtonLabel _initWithFrame:button:]([UIButtonLabel alloc], "_initWithFrame:button:", self->_button, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v4, "setBackgroundColor:", 0);
  objc_msgSend(v4, "setBaselineAdjustment:", 1);
  objc_msgSend(v4, "setEnabled:", 1);
  objc_msgSend(v4, "setOpaque:", 0);
  objc_msgSend(v4, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[UILabel _setSupportMultiLineShrinkToFit:]((uint64_t)v4, 1);
  objc_msgSend(v4, "setContentMode:", 0);
  v5 = 0;
  if (-[UIButton _wantsAccessibilityUnderline](self->_button, "_wantsAccessibilityUnderline"))
  {
    -[UIButton backgroundImageForState:](self->_button, "backgroundImageForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == 0;

  }
  objc_msgSend(v4, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", v5);
  return v4;
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_titleView, "setTextAlignment:", +[UIButtonLegacyVisualProvider _NSTextAlignmentForUIControlContentHorizontalAlignment:](UIButtonLegacyVisualProvider, "_NSTextAlignmentForUIControlContentHorizontalAlignment:", -[UIControl effectiveContentHorizontalAlignment](self->_button, "effectiveContentHorizontalAlignment", a3)));
  -[UIButtonLegacyVisualProvider _invalidateContentConstraints](self, "_invalidateContentConstraints");
  -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
}

- (void)_invalidateContentConstraints
{
  if (self->_contentConstraints)
    -[UIView removeConstraints:](self->_button, "removeConstraints:");
  -[UIButtonLegacyVisualProvider _setContentConstraints:](self, "_setContentConstraints:", 0);
}

+ (int64_t)_NSTextAlignmentForUIControlContentHorizontalAlignment:(int64_t)a3
{
  return 2 * (a3 == 2);
}

- (void)setFont:(id)a3 isDefaultForIdiom:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  UILabel *titleView;
  uint64_t v8;
  UILabel *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a4;
  v6 = a3;
  titleView = self->_titleView;
  if (titleView)
  {
    v16 = (uint64_t)v6;
    -[UILabel font](titleView, "font");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = self->_titleView;
    if (v9)
      v10 = (v16 | v8) == 0;
    else
      v10 = 1;
    if (v10)
    {
      -[UILabel _setFont:isDefaultForIdiom:](v9, "_setFont:isDefaultForIdiom:");
    }
    else
    {
      v13 = objc_msgSend((id)v8, "isEqual:");
      -[UILabel _setFont:isDefaultForIdiom:](self->_titleView, "_setFont:isDefaultForIdiom:", v16, v4);
      if ((v13 & 1) == 0)
        -[UIView invalidateIntrinsicContentSize](self->_button, "invalidateIntrinsicContentSize");
    }

  }
  else
  {
    if (v6)
      goto LABEL_16;
    -[UIView traitCollection](self->_button, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 6)
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    else
      +[UILabel defaultFont](UIButtonLabel, "defaultFont");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_16:
      v16 = (uint64_t)v6;
      -[UIButton _setLazyTitleViewFont:isDefaultForIdiom:](self->_button, "_setLazyTitleViewFont:isDefaultForIdiom:", v6, v4);
    }
    else
    {
      -[UIButton _lazyTitleViewFontIsDefaultForIdiom:](self->_button, "_lazyTitleViewFontIsDefaultForIdiom:", 0);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v16, "fontName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v16, "pointSize");
      NSLog(CFSTR("nil passed to [UIButton setFont:] and [UIButtonLabel defaultFont] is also nil. Don't know what to do, so leaving font as %@ %f"), v14, v15);

    }
  }

}

- (void)setImageContentMode:(int64_t)a3
{
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", a3);
}

- (void)setShowsTouchWhenHighlighted:(BOOL)a3
{
  UIImageView *v4;
  $1CF1FC38577B636919C637EEED589224 buttonFlags;
  UIImageView *v6;
  void *v7;
  _BOOL4 v8;
  double v9;
  UIImageView *imageView;
  void *v11;
  void *v12;
  UIImageView *v13;

  -[UIView viewWithTag:](self->_button, "viewWithTag:", 1886548836);
  v4 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  buttonFlags = self->_button->_buttonFlags;
  if (!v4)
  {
    if ((*(_BYTE *)&buttonFlags & 0x20) == 0)
    {

      return;
    }
    v6 = [UIImageView alloc];
    _UIImageWithName(CFSTR("UIButtonBarPressedIndicator.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIImageView initWithImage:](v6, "initWithImage:", v7);

    -[UIView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    -[UIView setOpaque:](v13, "setOpaque:", 0);
    -[UIView setTag:](v13, "setTag:", 1886548836);
    v8 = -[UIControl isHighlighted](self->_button, "isHighlighted");
    v9 = 0.0;
    if (v8)
      v9 = 1.0;
    -[UIView setAlpha:](v13, "setAlpha:", v9);
    -[UIButton pressFeedbackPosition](self->_button, "pressFeedbackPosition");
    -[UIImageView setCenter:](v13, "setCenter:");
    imageView = self->_imageView;
    -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (imageView)
      objc_msgSend(v11, "insertSubview:belowSubview:", v13, self->_imageView);
    else
      objc_msgSend(v11, "addSubview:", v13);

    -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
    goto LABEL_12;
  }
  if ((*(_BYTE *)&buttonFlags & 0x20) == 0)
  {
    v13 = v4;
    -[UIView removeFromSuperview](v4, "removeFromSuperview");
LABEL_12:
    v4 = v13;
  }

}

- (id)effectiveContentView
{
  UIView **p_effectiveContentView;
  UIButton *WeakRetained;
  void *v5;

  p_effectiveContentView = &self->_effectiveContentView;
  WeakRetained = (UIButton *)objc_loadWeakRetained((id *)&self->_effectiveContentView);
  if (!WeakRetained)
  {
    if (-[UIButton _shouldHaveFloatingAppearance](self->_button, "_shouldHaveFloatingAppearance"))
    {
      -[UIButtonLegacyVisualProvider _floatingContentView](self, "_floatingContentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentView");
      WeakRetained = (UIButton *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WeakRetained = self->_button;
    }
    objc_storeWeak((id *)p_effectiveContentView, WeakRetained);
  }
  return WeakRetained;
}

- (void)setContentHuggingPriorities:(CGSize)a3
{
  id v3;

  v3 = -[UIButtonLegacyVisualProvider _titleOrImageViewForBaselineLayout](self, "_titleOrImageViewForBaselineLayout", a3.width, a3.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_destroyWeak((id *)&self->_effectiveContentView);
  objc_storeStrong((id *)&self->_maskAnimationView, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentBackdropView, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

+ (BOOL)shouldUpdateContextMenuEnabledOnMenuChanges
{
  return 1;
}

- (double)_intrinsicWidthForAttributedTitle:(id)a3
{
  double result;

  -[UIButtonLegacyVisualProvider _intrinsicSizeForTitle:attributedTitle:image:backgroundImage:titlePaddingInsets:](self, "_intrinsicSizeForTitle:attributedTitle:image:backgroundImage:titlePaddingInsets:", 0, a3, 0, 0, 0);
  return result;
}

- (void)setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  UIButtonLegacyVisualProvider *v10;
  BOOL v11;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__UIButtonLegacyVisualProvider_setVisualEffectViewEnabled_backgroundColor___block_invoke;
  v8[3] = &unk_1E16B4008;
  v11 = a3;
  v9 = v6;
  v10 = self;
  v7 = v6;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v8);
  -[UIButtonLegacyVisualProvider _updateContentBackdropView](self, "_updateContentBackdropView");

}

- (void)setLineBreakMode:(int64_t)a3
{
  UILabel *titleView;
  uint64_t v6;
  UILabel *v7;
  BOOL v8;

  titleView = self->_titleView;
  if (a3 != 5 && !titleView)
  {
    -[UIButtonLegacyVisualProvider _setupTitleView](self, "_setupTitleView");
    titleView = self->_titleView;
  }
  v6 = -[UILabel lineBreakMode](titleView, "lineBreakMode");
  v7 = self->_titleView;
  -[UILabel setLineBreakMode:](v7, "setLineBreakMode:", a3);
  if (v7)
    v8 = v6 == a3;
  else
    v8 = 1;
  if (!v8)
    -[UIView invalidateIntrinsicContentSize](self->_button, "invalidateIntrinsicContentSize");
}

uint64_t __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", 1.0);
}

uint64_t __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke_2(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  _QWORD v15[5];
  CGRect v16;
  CGRect v17;

  objc_msgSend(*(id *)(a1 + 32), "_setTitleFrozen:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "frame");
  v17.origin.x = v10;
  v17.origin.y = v11;
  v17.size.width = v12;
  v17.size.height = v13;
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  if (!CGRectEqualToRect(v16, v17))
    objc_msgSend(*(id *)(a1 + 32), "_sendSetNeedsLayoutToSuperviewOnTitleAnimationCompletionIfNecessary");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke_3;
  v15[3] = &unk_1E16B1B28;
  v15[4] = *(_QWORD *)(a1 + 40);
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v15, 0, 0.3, 0.0);
}

- (void)setReversesTitleShadowWhenHighlighted:(BOOL)a3
{
  UILabel *titleView;

  titleView = self->_titleView;
  if (a3)
    *(_QWORD *)&a3 = -[UIControl isHighlighted](self->_button, "isHighlighted");
  -[UILabel setReverseShadow:](titleView, "setReverseShadow:", a3);
}

- (void)populateArchivedSubviews:(id)a3
{
  id v4;
  UIVisualEffectView *v5;
  uint64_t v6;
  uint64_t i;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView viewWithTag:](self->_button, "viewWithTag:", 1886548836, self->_titleView, self->_imageView, self->_backgroundView, self->_maskAnimationView, self->_selectionView);
  v8[5] = objc_claimAutoreleasedReturnValue();
  v5 = self->_contentBackdropView;
  v6 = 0;
  v8[6] = v5;
  do
  {
    if (v8[v6])
      objc_msgSend(v4, "removeObject:");
    ++v6;
  }
  while (v6 != 7);
  for (i = 6; i != -1; --i)

}

- (id)encodableSubviews
{
  void *v2;
  void *v3;

  -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)titleShadowOffset
{
  UILabel *titleView;
  double v3;
  double v4;
  CGSize result;

  titleView = self->_titleView;
  if (titleView)
  {
    -[UILabel shadowOffset](titleView, "shadowOffset");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setTitleShadowOffset:(CGSize)a3
{
  double height;
  double width;
  UILabel *titleView;
  double v8;
  double v9;
  UILabel *v10;
  double v11;
  double v12;

  height = a3.height;
  width = a3.width;
  titleView = self->_titleView;
  if (!titleView)
  {
    if (a3.width == *MEMORY[0x1E0C9D820] && a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      titleView = 0;
    }
    else
    {
      -[UIButtonLegacyVisualProvider _setupTitleView](self, "_setupTitleView");
      titleView = self->_titleView;
    }
  }
  -[UILabel shadowOffset](titleView, "shadowOffset");
  v10 = self->_titleView;
  if (v10)
  {
    v11 = v8;
    v12 = v9;
    -[UILabel setShadowOffset:](v10, "setShadowOffset:", width, height);
    if (width != v11 || height != v12)
      -[UIView invalidateIntrinsicContentSize](self->_button, "invalidateIntrinsicContentSize");
  }
  else
  {
    objc_msgSend(0, "setShadowOffset:", width, height);
  }
}

- (CGRect)highlightBounds
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
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
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect result;
  CGRect v47;
  CGRect v48;

  -[UIView bounds](self->_button, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (!-[UIButton _isCarPlaySystemTypeButton](self->_button, "_isCarPlaySystemTypeButton"))
  {
    -[UIButton titleRectForContentRect:](self->_button, "titleRectForContentRect:", x, y, width, height);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[UIButton imageRectForContentRect:](self->_button, "imageRectForContentRect:", x, y, width, height);
    v37 = v20;
    v38 = v19;
    v35 = v22;
    v36 = v21;
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v39.origin.x = v12;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v18;
    if (!CGRectIsEmpty(v39))
    {
      -[UIButtonLegacyVisualProvider _highlightRectForTextRect:](self, "_highlightRectForTextRect:", v12, v14, v16, v18);
      v47.origin.x = v23;
      v47.origin.y = v24;
      v47.size.width = v25;
      v47.size.height = v26;
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      v41 = CGRectUnion(v40, v47);
      x = v41.origin.x;
      y = v41.origin.y;
      width = v41.size.width;
      height = v41.size.height;
    }
    v42.origin.x = v38;
    v42.origin.y = v37;
    v42.size.width = v36;
    v42.size.height = v35;
    if (!CGRectIsEmpty(v42))
    {
      -[UIButtonLegacyVisualProvider _highlightRectForImageRect:](self, "_highlightRectForImageRect:", v38, v37, v36, v35);
      v48.origin.x = v27;
      v48.origin.y = v28;
      v48.size.width = v29;
      v48.size.height = v30;
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v44 = CGRectUnion(v43, v48);
      x = v44.origin.x;
      y = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
    }
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    if (CGRectIsEmpty(v45))
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIButton *button;
  $1CF1FC38577B636919C637EEED589224 buttonFlags;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  button = self->_button;
  buttonFlags = button->_buttonFlags;
  if ((*(_BYTE *)&buttonFlags & 0x20) != 0)
  {
    -[UIView viewWithTag:](button, "viewWithTag:", 1886548836, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
    {
      objc_msgSend(v8, "setAlpha:", 1.0);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __56__UIButtonLegacyVisualProvider_setHighlighted_animated___block_invoke;
      v10[3] = &unk_1E16B1B28;
      v11 = v8;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, 0, 0.25);

    }
    buttonFlags = self->_button->_buttonFlags;
  }
  -[UILabel setReverseShadow:](self->_titleView, "setReverseShadow:", *(_DWORD *)&buttonFlags & v4, a4);
  -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
}

uint64_t __56__UIButtonLegacyVisualProvider_setHighlighted_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (BOOL)isOn
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  UIButton *v5;
  UIButton *v6;
  void *v7;
  _QWORD v9[4];
  UIButton *v10;
  UIButtonLegacyVisualProvider *v11;

  v5 = self->_button;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__UIButtonLegacyVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E16B2BC0;
  v10 = v5;
  v11 = self;
  v6 = v5;
  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __86__UIButtonLegacyVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_menuProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_menuProvider");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, *(_QWORD *)(a1 + 40), v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
    if (!v7)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "showsMenuAsPrimaryAction"))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            v17 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v25 = v17;
            _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Client configured a button (%@) with a menuProvider and contextMenuIsPrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
          }

        }
        else
        {
          v9 = _UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category;
          if (!_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category)
          {
            v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v9, (unint64_t *)&_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category);
          }
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v11 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v25 = v11;
            _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Client configured a button (%@) with a menuProvider and contextMenuIsPrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "titleForState:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "imageForState:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x1E0C809B0];
        v19 = 3221225472;
        v20 = __86__UIButtonLegacyVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_16;
        v21 = &unk_1E16B2C10;
        v22 = *(id *)(a1 + 32);
        +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v12, v13, 0, &v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1, v18, v19, v20, v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v15);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }
    }
  }

  return v4;
}

uint64_t __86__UIButtonLegacyVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  UIButton *button;
  UILabel *titleView;
  UIImageView *imageView;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGPoint result;

  button = self->_button;
  imageView = self->_imageView;
  titleView = self->_titleView;
  v6 = a3;
  _UIControlMenuSupportTargetedPreviewOverViews(button, titleView, imageView);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v7, "target");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "center");
  v17 = round(v16 - v14 * 0.5);
  v19 = round(v18 - v12 * 0.5);
  objc_msgSend(v9, "_window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v20, v19, v17, v12, v14);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  LODWORD(v10) = objc_msgSend(v6, "prefersHorizontalAttachment");
  objc_msgSend(v9, "_window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if ((_DWORD)v10)
    v31 = _UIControlMenuAttachmentPointForRectInContainerForHorizontalAttachment(v29, v22, v24, v26, v28);
  else
    v31 = _UIControlMenuAttachmentPointForRectInContainer(v29, v22, v24, v26, v28);
  v33 = v31;
  v34 = v32;

  v35 = v33;
  v36 = v34;
  result.y = v36;
  result.x = v35;
  return result;
}

- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5
{
  id v7;
  UIButton *button;
  UILabel *titleView;
  UIImageView *imageView;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v7 = a5;
  if (v7)
  {
    v18 = v7;
    button = self->_button;
    imageView = self->_imageView;
    titleView = self->_titleView;
    v11 = a4;
    _UIControlMenuSupportTargetedPreviewOverViews(button, titleView, imageView);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton menuAttachmentPointForConfiguration:](self->_button, "menuAttachmentPointForConfiguration:", v11);
    v14 = v13;
    v16 = v15;
    LODWORD(button) = objc_msgSend(v11, "prefersHorizontalAttachment");

    -[UIButtonLegacyVisualProvider button](self, "button");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)button)
      _UIControlMenuSupportUpdateStyleWithHorizontalPreference(v18, v17, v12, v14, v16);
    else
      _UIControlMenuSupportUpdateStyle(v18, v17, v12, v14, v16);

    v7 = v18;
  }

}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleView, self->_imageView);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleView, self->_imageView);
}

- (id)pointerEffectPreviewParameters
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  if (-[UIButton buttonType](self->_button, "buttonType") == UIButtonTypeClose)
  {
    -[UIView bounds](self->_button, "bounds");
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    objc_msgSend(v3, "setShadowPath:", v4);

    return v3;
  }
  if (-[UIControl isSelected](self->_button, "isSelected"))
  {
    -[UIView layer](self->_button, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cornerRadius");

    -[UIButton _selectedIndicatorBounds](self->_button, "_selectedIndicatorBounds");
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v3;
}

- (id)pointerEffectWithPreview:(id)a3
{
  id v4;
  UIButtonType v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[UIButton buttonType](self->_button, "buttonType");
  v6 = objc_opt_class();
  if (v5 == UIButtonTypeClose
    || ((v7 = (void *)v6, -[UIButton _isiOSSystemProvidedButton](self->_button, "_isiOSSystemProvidedButton"))
     || v5 == UIButtonTypeCustom)
    && (-[UIButton _hasVisibleDefaultSelectionIndicator](self->_button, "_hasVisibleDefaultSelectionIndicator")
     || _buttonBackgroundColorIndicatesLiftEffect(self->_button)))
  {
    v7 = (void *)objc_opt_class();
  }
  objc_msgSend(v7, "effectWithPreview:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)_visualBoundsWithCornerRadius:(double *)a3 hasProposal:(BOOL)a4 shouldUseProposal:(BOOL *)a5
{
  _BOOL4 v6;
  void *v10;
  void *v11;
  UIButtonType v12;
  UIButton *button;
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
  UIButton *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  UIButton *v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  UIButton *v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL IsEmpty;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  BOOL v61;
  uint64_t v62;
  _BOOL4 v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  int v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  _BOOL4 v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  CGFloat v108;
  double v109;
  double v110;
  double v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect result;
  CGRect v117;

  v6 = a4;
  v111 = -1.0;
  if (a5)
    *a5 = 0;
  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buttonSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[UIButton buttonType](self->_button, "buttonType");
  if (v12 <= 117)
  {
    if ((unint64_t)(v12 - 2) >= 4)
    {
      if ((unint64_t)v12 < UIButtonTypeDetailDisclosure)
        goto LABEL_15;
      if (v12 != UIButtonTypeClose)
      {
LABEL_25:
        -[UIView bounds](self->_button, "bounds");
        goto LABEL_10;
      }
      button = self->_button;
      objc_msgSend(v11, "closeButtonOutset");
      v15 = v38;
      objc_msgSend(v11, "closeButtonMinSize");
LABEL_9:
      __roundCursorForBounds(button, &v111, v15, v16);
LABEL_10:
      v21 = v17;
      v22 = v18;
      v23 = v19;
      v24 = v20;
      goto LABEL_11;
    }
LABEL_8:
    button = self->_button;
    objc_msgSend(v11, "roundButtonOutset");
    v15 = v14;
    objc_msgSend(v11, "roundButtonMinSize");
    goto LABEL_9;
  }
  if ((unint64_t)(v12 - 118) < 6)
    goto LABEL_8;
  if ((unint64_t)(v12 - 124) >= 2)
    goto LABEL_25;
LABEL_15:
  if (-[UIButton _hasVisibleDefaultSelectionIndicator](self->_button, "_hasVisibleDefaultSelectionIndicator"))
  {
    v29 = self->_button;
    -[UIButton _selectedIndicatorBounds](v29, "_selectedIndicatorBounds");
    v21 = v30;
    v22 = v31;
    v23 = v32;
    v24 = v33;
    -[UIView layer](v29, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "cornerRadius");
    v36 = v35;

    v111 = fmax(v36, 4.0);
    goto LABEL_11;
  }
  if (v6)
  {
    if (!a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButtonLegacyVisualProvider.m"), 792, CFSTR("When hasProposal is YES, shouldUseProposal has to be defined."));

    }
    *a5 = 1;
    v37 = self->_button;
    goto LABEL_24;
  }
  -[UIView backgroundColor](self->_button, "backgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "alphaComponent");
  v41 = v40;

  v37 = self->_button;
  if (v41 > 0.0)
  {
LABEL_24:
    v17 = __boundingPointerShapeInContainer(v37, &v111);
    goto LABEL_10;
  }
  v42 = v37;
  v43 = v11;
  -[UIView bounds](v42, "bounds");
  -[UIButton contentRectForBounds:](v42, "contentRectForBounds:");
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[UIButton titleRectForContentRect:](v42, "titleRectForContentRect:");
  x = v112.origin.x;
  y = v112.origin.y;
  width = v112.size.width;
  height = v112.size.height;
  IsEmpty = CGRectIsEmpty(v112);
  -[UIButton imageRectForContentRect:](v42, "imageRectForContentRect:", v45, v47, v49, v51);
  v57 = v113.origin.x;
  v58 = v113.origin.y;
  v59 = v113.size.width;
  v60 = v113.size.height;
  v61 = CGRectIsEmpty(v113);
  v62 = -[UIView effectiveUserInterfaceLayoutDirection](v42, "effectiveUserInterfaceLayoutDirection");
  if (!v61 && !IsEmpty)
  {
    v63 = v62 == 1;
    v114.origin.x = x;
    v114.origin.y = y;
    v114.size.width = width;
    v114.size.height = height;
    v117.origin.x = v57;
    v117.origin.y = v58;
    v117.size.width = v59;
    v117.size.height = v60;
    v115 = CGRectUnion(v114, v117);
    v108 = v115.origin.x;
    v64 = v115.origin.y;
    v65 = v115.size.width;
    v66 = v115.size.height;
    objc_msgSend(v43, "mixedButtonOutsetLeading");
    v68 = v67;
    objc_msgSend(v43, "mixedButtonOutsetTrailing");
    v70 = v69;
    objc_msgSend(v43, "mixedButtonOutsetTop");
    v72 = v71;
    objc_msgSend(v43, "mixedButtonOutsetBottom");
    v74 = v73;
    objc_msgSend(v43, "mixedButtonMinWidth");
    v76 = v75;
    objc_msgSend(v43, "mixedButtonMinHeight");
    v107 = v76;
    v77 = v108;
    v78 = v64;
    v79 = v65;
    v80 = v66;
    v81 = v68;
LABEL_29:
    v82 = v70;
    v83 = v63;
    v84 = v72;
    v85 = v74;
LABEL_34:
    v86 = __outsetRectWithMinimumSize(v83, 0, v77, v78, v79, v80, v81, v82, v84, v85, v107);
    goto LABEL_35;
  }
  if (!v61)
  {
    v90 = v62 == 1;
    objc_msgSend(v43, "imageButtonOutsetLeading");
    v109 = v91;
    objc_msgSend(v43, "imageButtonOutsetTrailing");
    v93 = v92;
    objc_msgSend(v43, "imageButtonOutsetTop");
    v95 = v94;
    objc_msgSend(v43, "imageButtonOutsetBottom");
    v97 = v96;
    objc_msgSend(v43, "imageButtonMinWidth");
    v99 = v98;
    objc_msgSend(v43, "imageButtonMinHeight");
    v107 = v99;
    v77 = v57;
    v78 = v58;
    v79 = v59;
    v80 = v60;
    v81 = v109;
    v82 = v93;
    v83 = v90;
    v84 = v95;
    v85 = v97;
    goto LABEL_34;
  }
  if (!IsEmpty)
  {
    v63 = v62 == 1;
    objc_msgSend(v43, "textButtonOutsetLeading");
    v110 = v100;
    objc_msgSend(v43, "textButtonOutsetTrailing");
    v70 = v101;
    objc_msgSend(v43, "textButtonOutsetTop");
    v72 = v102;
    objc_msgSend(v43, "textButtonOutsetBottom");
    v74 = v103;
    objc_msgSend(v43, "textButtonMinWidth");
    v105 = v104;
    objc_msgSend(v43, "textButtonMinHeight");
    v107 = v105;
    v77 = x;
    v78 = y;
    v79 = width;
    v80 = height;
    v81 = v110;
    goto LABEL_29;
  }
  v86 = __boundingPointerShapeInContainer(v42, &v111);
LABEL_35:
  v21 = v86;
  v22 = v87;
  v23 = v88;
  v24 = v89;

LABEL_11:
  if (a3)
    *a3 = v111;

  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)visualBoundsWithCornerRadius:(double *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIButtonLegacyVisualProvider _visualBoundsWithCornerRadius:hasProposal:shouldUseProposal:](self, "_visualBoundsWithCornerRadius:hasProposal:shouldUseProposal:", a3, 0, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)pointerShapeInContainer:(id)a3 proposal:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  id v18;
  double v20;
  char v21;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v21 = 0;
  v20 = 0.0;
  -[UIButtonLegacyVisualProvider _visualBoundsWithCornerRadius:hasProposal:shouldUseProposal:](self, "_visualBoundsWithCornerRadius:hasProposal:shouldUseProposal:", &v20, v7 != 0, &v21);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (!v21 || (v7[2](v7), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17 = v20;
    -[UIView convertRect:toView:](self->_button, "convertRect:toView:", v6, v9, v11, v13, v15, *(_QWORD *)&v20);
    if (v17 >= 0.0)
      +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
    else
      +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v16;

  return v18;
}

- (id)preferredHoverEffect
{
  UIButtonType v3;
  UIButtonType v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  void *v9;

  v3 = -[UIButton buttonType](self->_button, "buttonType");
  if (v3 != UIButtonTypeClose)
  {
    v4 = v3;
    -[UIView traitCollection](self->_button, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = -[UIButton _isiOSSystemProvidedButton](self->_button, "_isiOSSystemProvidedButton");
    if (v6 == 6)
    {
      if (!v7)
      {
LABEL_11:
        v9 = 0;
        return v9;
      }
    }
    else
    {
      v8 = !v7;
      if (v4 == UIButtonTypeCustom)
        v8 = 0;
      if (v8
        || !-[UIButton _hasVisibleDefaultSelectionIndicator](self->_button, "_hasVisibleDefaultSelectionIndicator")
        && !_buttonBackgroundColorIndicatesLiftEffect(self->_button))
      {
        goto LABEL_11;
      }
    }
  }
  +[UIHoverLiftEffect effect](UIHoverLiftEffect, "effect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)preferredHoverShape
{
  return -[UIView _outlineShape](self->_button, "_outlineShape");
}

- (id)defaultFocusEffect
{
  return 0;
}

- (double)focusSizeIncrease
{
  double result;

  -[_UIFloatingContentView focusedSizeIncrease](self->_floatingContentView, "focusedSizeIncrease");
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
  -[_UIFloatingContentView setFocusedSizeIncrease:](self->_floatingContentView, "setFocusedSizeIncrease:", a3);
}

- (CGRect)backgroundRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIButton *button;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  button = self->_button;
  if (UIButtonTypeIsModernCircleButton((*(_QWORD *)&button->_buttonFlags >> 6)))
  {
    -[UIButton imageRectForContentRect:](button, "imageRectForContentRect:", x, y, width, height);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)useTitleForSelectedIndicatorBounds
{
  UILabel *titleView;

  titleView = self->_titleView;
  if (titleView)
    LOBYTE(titleView) = !-[UIView isHidden](titleView, "isHidden");
  return (char)titleView;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return (unint64_t)(-[UIButton _buttonType](self->_button, "_buttonType") - 2) < 4;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return (unint64_t)(-[UIButton _buttonType](self->_button, "_buttonType") - 2) < 4;
}

_UIButtonContentCenteringSpacer *__49__UIButtonLegacyVisualProvider_updateConstraints__block_invoke(uint64_t a1, uint64_t a2)
{
  _UIButtonContentCenteringSpacer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(_UIButtonContentCenteringSpacer);
  -[UIView setTag:](v4, "setTag:", a2);
  -[UIView setHidden:](v4, "setHidden:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "effectiveContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = (void *)MEMORY[0x1E0D156E0];
  _NSDictionaryOfVariableBindings(CFSTR("spacer"), v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[spacer(0)]"), 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v9);

  return v4;
}

- (CGRect)_highlightRectForTextRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v8 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[UIButton _pathTitleEdgeInsets](self->_button, "_pathTitleEdgeInsets");
    v13 = v12;
    v15 = v14;
    v17 = -v16;
    v8 = x - v14;
    v9 = y - v13;
    v10 = width - (-v18 - v15);
    v11 = height - (v17 - v13);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_highlightRectForImageRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v8 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[UIButton _pathImageEdgeInsets](self->_button, "_pathImageEdgeInsets");
    v8 = x - v14;
    v9 = y - v15;
    v10 = width - (-v13 - v14);
    v11 = height - (-v12 - v15);
  }
  if (UIButtonTypeIsModernCircleButton(-[UIButton _buttonType](self->_button, "_buttonType")))
  {
    -[UIButton imageRectForContentRect:](self->_button, "imageRectForContentRect:", x, y, width, height);
    v8 = v16;
    v9 = v17;
    v10 = v18;
    v11 = v19;
  }
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)currentImageWithResolvedConfiguration
{
  return -[UIImageView _currentImage](self->_imageView, "_currentImage");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIButton _intrinsicSizeWithinSize:](self->_button, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_layoutHighlightLayer
{
  CALayer *v3;
  CALayer *highlightLayer;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CALayer *v22;
  uint64_t v23;
  id v24;

  if (!self->_highlightLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
    highlightLayer = self->_highlightLayer;
    self->_highlightLayer = v3;

  }
  -[UIView layer](self->_button, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[CALayer setFrame:](self->_highlightLayer, "setFrame:");

  +[_UIButtonSettingsDomain rootSettings](_UIButtonSettingsDomain, "rootSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "highlightAlternateColor") & 1) != 0)
  {
    v7 = 0.0;
    v8 = 1.0;
  }
  else
  {
    v7 = 1.0;
    v8 = 0.0;
  }
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v7, v8, 1.0, 1.0);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  +[_UIButtonSettingsDomain rootSettings](_UIButtonSettingsDomain, "rootSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "highlightBelow");

  if (v10)
  {
    -[CALayer setBackgroundColor:](self->_highlightLayer, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v24), "CGColor"));
    -[CALayer setBorderColor:](self->_highlightLayer, "setBorderColor:", 0);
    -[CALayer setBorderWidth:](self->_highlightLayer, "setBorderWidth:", 0.0);
    -[UIView subviews](self->_button, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (-[UIView _hasTransparentBackground](v12) & 1) != 0)
      goto LABEL_11;
    -[UIView bounds](self->_button, "bounds");
    v15 = v14;
    objc_msgSend(v12, "bounds");
    v13 = v15 - v16;
    if (v15 - v16 > 0.0)
      goto LABEL_11;
    -[UIView bounds](self->_button, "bounds", v13);
    v18 = v17;
    objc_msgSend(v12, "bounds");
    v13 = v18 - v19;
    if (v18 - v19 <= 0.0)
    {
      -[UIView layer](self->_button, "layer", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = self->_highlightLayer;
      v23 = 1;
    }
    else
    {
LABEL_11:
      -[UIView layer](self->_button, "layer", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = self->_highlightLayer;
      v23 = 0;
    }
    objc_msgSend(v20, "insertSublayer:atIndex:", v22, v23);

  }
  else
  {
    -[CALayer setBackgroundColor:](self->_highlightLayer, "setBackgroundColor:", 0);
    -[CALayer setBorderColor:](self->_highlightLayer, "setBorderColor:", objc_msgSend(objc_retainAutorelease(v24), "CGColor"));
    -[CALayer setBorderWidth:](self->_highlightLayer, "setBorderWidth:", 2.0);
    -[UIView layer](self->_button, "layer");
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", self->_highlightLayer);
  }

}

+ (id)_selectedIndicatorImage
{
  if (qword_1ECD7E168 != -1)
    dispatch_once(&qword_1ECD7E168, &__block_literal_global_270);
  return (id)_MergedGlobals_1081;
}

void __55__UIButtonLegacyVisualProvider__selectedIndicatorImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  double v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[UITraitCollection _fallbackTraitCollection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 5)
    v2 = 3.0;
  else
    v2 = 4.0;
  v3 = v2 + v2;
  _UIGraphicsBeginImageContextWithOptions(0, 0, v3 + v3 + 1.0, v3 + v3 + 1.0, 0.0);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3 + v3 + 1.0, v3 + v3 + 1.0, v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fill");
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resizableImageWithCapInsets:", v2 + v2, v2 + v2, v2 + v2, v2 + v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  v7 = (void *)_MergedGlobals_1081;
  _MergedGlobals_1081 = v6;

}

- (BOOL)_imageNeedsCompositingModeWhenSelected
{
  void *v2;
  uint64_t v3;

  -[UIButton imageForState:](self->_button, "imageForState:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "renderingMode");

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)_textNeedsCompositingModeWhenSelected
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UIButton attributedTitleForState:](self->_button, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[UIButton _titleColorForState:](self->_button, "_titleColorForState:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v5 == 0;
  }

  return v4;
}

- (BOOL)_highlightsBackgroundImage
{
  return (*(_QWORD *)&self->_button->_buttonFlags & 0x3FC0) != 448;
}

- (CGRect)_selectedIndicatorBounds
{
  void *v3;
  uint64_t v4;
  UIButton *button;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UILabel *titleView;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  -[UIView traitCollection](self->_button, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  button = self->_button;
  -[UIView bounds](button, "bounds");
  -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  titleView = self->_titleView;
  if (titleView && !-[UIView isHidden](titleView, "isHidden"))
  {
    -[UIButton titleRectForContentRect:](self->_button, "titleRectForContentRect:", v7, v9, v11, v13);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[UILabel font](self->_titleView, "font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pointSize");

    UIRoundToViewScale(self->_button);
    v31 = v30;
    UIRoundToViewScale(self->_button);
    v19 = -v32;
    v20 = -v31;
    v15 = v22;
    v16 = v24;
    v17 = v26;
    v18 = v28;
  }
  else
  {
    -[UIButton imageRectForContentRect:](self->_button, "imageRectForContentRect:", v7, v9, v11, v13);
    if (v4 == 5)
    {
      v19 = -4.0;
      v20 = -6.0;
    }
    else
    {
      v19 = -5.0;
      v20 = -8.0;
    }
  }
  result = CGRectInset(*(CGRect *)&v15, v19, v20);
  v33 = result.size.height + 1.0;
  result.size.height = v33;
  return result;
}

uint64_t __61__UIButtonLegacyVisualProvider__updateSelectionViewForState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_selectedIndicatorBounds");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setFrame:");
}

uint64_t __61__UIButtonLegacyVisualProvider__updateSelectionViewForState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_updateMaskState
{
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL8 v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  if (!-[UIButton _hasDrawingStyle](self->_button, "_hasDrawingStyle"))
    goto LABEL_8;
  -[UIView layer](self->_maskAnimationView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("borderWidth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[_UIButtonMaskAnimationView borderWidth](self->_maskAnimationView, "borderWidth");
    if (v5 <= 1.0)
    {

LABEL_8:
      -[UIImageView _setMasksTemplateImages:](self->_imageView, "_setMasksTemplateImages:", 0);
      -[UIImageView _setMasksTemplateImages:](self->_backgroundView, "_setMasksTemplateImages:", 0);
LABEL_9:
      v9 = 0;
      goto LABEL_10;
    }
  }
  v6 = -[UIButton _isCarPlaySystemTypeButton](self->_button, "_isCarPlaySystemTypeButton");
  v7 = v6;
  v8 = !v6;

  -[UIImageView _setMasksTemplateImages:](self->_imageView, "_setMasksTemplateImages:", v8);
  -[UIImageView _setMasksTemplateImages:](self->_backgroundView, "_setMasksTemplateImages:", v8);
  if (v7 || -[UIButton _hasHighlightColor](self->_button, "_hasHighlightColor"))
    goto LABEL_9;
  v9 = !-[UIButton _isCarPlaySystemTypeButton](self->_button, "_isCarPlaySystemTypeButton");
LABEL_10:
  -[UIView layer](self->_titleView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "compositingFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_titleView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCompositingFilter:", v14);

LABEL_18:
    return;
  }
  if (v11)
    v13 = v9;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
  {
    -[UIView layer](self->_titleView, "layer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCompositingFilter:", 0);
    goto LABEL_18;
  }
}

- (void)_prepareMaskAnimationViewIfNecessary
{
  _UIButtonMaskAnimationView *v3;
  _UIButtonMaskAnimationView *maskAnimationView;
  id v5;

  if (!self->_maskAnimationView)
  {
    v3 = objc_alloc_init(_UIButtonMaskAnimationView);
    maskAnimationView = self->_maskAnimationView;
    self->_maskAnimationView = v3;

    -[_UIButtonMaskAnimationView setDelegate:](self->_maskAnimationView, "setDelegate:", self);
    -[UIView setUserInteractionEnabled:](self->_maskAnimationView, "setUserInteractionEnabled:", 0);
    -[_UIButtonMaskAnimationView setHardEdge:](self->_maskAnimationView, "setHardEdge:", -[UIButton _externalFlatEdge](self->_button, "_externalFlatEdge"));
    -[UIButtonLegacyVisualProvider effectiveContentView](self, "effectiveContentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:atIndex:", self->_maskAnimationView, 0);

  }
}

- (CGRect)_highlightBoundsForDrawingStyle
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[UIButton _clippedHighlightBounds](self->_button, "_clippedHighlightBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UIButton _externalFlatEdge](self->_button, "_externalFlatEdge");
  -[UIButton _highlightCornerRadius](self->_button, "_highlightCornerRadius");
  switch(v11)
  {
    case 1uLL:
      v6 = v6 - v12;
      goto LABEL_3;
    case 2uLL:
      v4 = v4 - v12;
      goto LABEL_5;
    case 4uLL:
LABEL_3:
      v10 = v10 + v12;
      break;
    case 8uLL:
LABEL_5:
      v8 = v8 + v12;
      break;
    default:
      break;
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

- (id)_transitionAnimationWithKeyPath:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  float v9;
  float v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1041812769;
  LODWORD(v5) = 1043018044;
  LODWORD(v6) = 1044413908;
  LODWORD(v7) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v8);

  objc_msgSend(v3, "setDuration:", 0.2625);
  v9 = UIAnimationDragCoefficient();
  objc_msgSend(v3, "speed");
  *(float *)&v11 = v10 / v9;
  objc_msgSend(v3, "setSpeed:", v11);
  return v3;
}

- (id)_fadeOutAnimationWithKeyPath:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  float v9;
  float v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1050136617;
  LODWORD(v5) = 988616002;
  LODWORD(v6) = 0.25;
  LODWORD(v7) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v8);

  objc_msgSend(v3, "setBeginTime:", UIAnimationDragCoefficient() * 0.785);
  objc_msgSend(v3, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  objc_msgSend(v3, "setDuration:", 0.71);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  v9 = UIAnimationDragCoefficient();
  objc_msgSend(v3, "speed");
  *(float *)&v11 = v10 / v9;
  objc_msgSend(v3, "setSpeed:", v11);
  return v3;
}

- (double)_borderWidthForState:(unint64_t)a3 bounds:(CGRect)a4
{
  double result;

  -[UIButton _drawingStrokeForState:](self->_button, "_drawingStrokeForState:", a3, a4.origin.x, a4.origin.y);
  UIRoundToViewScale(self->_button);
  return result;
}

- (void)_setupDrawingStyleForState:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _UIButtonMaskAnimationView *maskAnimationView;
  int v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double MidX;
  double MidY;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  float v54;
  float v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  _BOOL4 v62;
  _BOOL4 v63;
  double v64;
  int v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  _QWORD v84[5];
  id v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  -[UIButtonLegacyVisualProvider _highlightBoundsForDrawingStyle](self, "_highlightBoundsForDrawingStyle");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIButton _borderColorForState:](self->_button, "_borderColorForState:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  maskAnimationView = self->_maskAnimationView;
  if (maskAnimationView
    && (-[UIView frame](maskAnimationView, "frame"), !CGRectIsEmpty(v86))
    && +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    v15 = !-[UIButton _isCarPlaySystemTypeButton](self->_button, "_isCarPlaySystemTypeButton");
  }
  else
  {
    v15 = 0;
  }
  -[UIButtonLegacyVisualProvider _prepareMaskAnimationViewIfNecessary](self, "_prepareMaskAnimationViewIfNecessary");
  -[_UIButtonMaskAnimationView setBorderColor:](self->_maskAnimationView, "setBorderColor:", v13);
  -[UIView layer](self->_maskAnimationView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentationLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView frame](self->_maskAnimationView, "frame");
  v90.origin.x = v18;
  v90.origin.y = v19;
  v90.size.width = v20;
  v90.size.height = v21;
  v87.origin.x = v6;
  v87.origin.y = v8;
  v87.size.width = v10;
  v87.size.height = v12;
  if (!CGRectEqualToRect(v87, v90))
  {
    if (v15)
    {
      objc_msgSend(v17, "bounds");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v82 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v83 = *MEMORY[0x1E0C9D538];
      -[UIButtonLegacyVisualProvider _transitionAnimationWithKeyPath:](self, "_transitionAnimationWithKeyPath:", CFSTR("bounds"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v23, v25, v27, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFromValue:", v31);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v83, v82, v10, v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setToValue:", v32);

      -[UIView layer](self->_maskAnimationView, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addAnimation:forKey:", v30, CFSTR("bounds"));

      objc_msgSend(v17, "position");
      v35 = v34;
      v37 = v36;
      v88.origin.x = v6;
      v88.origin.y = v8;
      v88.size.width = v10;
      v88.size.height = v12;
      MidX = CGRectGetMidX(v88);
      v89.origin.x = v6;
      v89.origin.y = v8;
      v89.size.width = v10;
      v89.size.height = v12;
      MidY = CGRectGetMidY(v89);
      -[UIButtonLegacyVisualProvider _transitionAnimationWithKeyPath:](self, "_transitionAnimationWithKeyPath:", CFSTR("position"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v35, v37);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFromValue:", v41);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", MidX, MidY);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setToValue:", v42);

      -[UIView layer](self->_maskAnimationView, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAnimation:forKey:", v40, CFSTR("position"));

    }
    -[UIView setFrame:](self->_maskAnimationView, "setFrame:", v6, v8, v10, v12);
  }
  -[UIButton _highlightCornerRadius](self->_button, "_highlightCornerRadius");
  v45 = v44;
  -[UIView layer](self->_maskAnimationView, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCornerRadius:", v45);

  -[_UIButtonMaskAnimationView borderWidth](self->_maskAnimationView, "borderWidth");
  v48 = v47;
  -[UIButtonLegacyVisualProvider _borderWidthForState:bounds:](self, "_borderWidthForState:bounds:", a3, v6, v8, v10, v12);
  v50 = v49;
  objc_msgSend(v17, "borderWidth");
  v52 = v51;
  -[_UIButtonMaskAnimationView setBorderWidth:](self->_maskAnimationView, "setBorderWidth:", v50);
  if (v15)
  {
    if (v50 <= v48)
    {
      if (v50 < v48)
      {
        -[UIButtonLegacyVisualProvider _transitionAnimationWithKeyPath:](self, "_transitionAnimationWithKeyPath:", CFSTR("borderWidth"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[UIControl _wasLastHighlightSuccessful](self->_button, "_wasLastHighlightSuccessful");
        v63 = fabs(v50) < 2.22044605e-16 && v62;
        if (v63)
        {
          objc_msgSend(v53, "setRemovedOnCompletion:", 0);
          v50 = 0.75;
          v64 = 0.49;
        }
        else
        {
          v64 = 0.245;
        }
        objc_msgSend(v53, "setDuration:", v64);
        v65 = 1;
LABEL_25:
        -[_UIButtonMaskAnimationView borderColor](self->_maskAnimationView, "borderColor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "isEqual:", v13);

        if ((v67 & 1) == 0)
        {
          if (!v65)
          {
            -[UIView layer](self->_maskAnimationView, "layer");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "removeAnimationForKey:", CFSTR("borderColor"));

            v84[0] = MEMORY[0x1E0C809B0];
            v84[1] = 3221225472;
            v84[2] = __59__UIButtonLegacyVisualProvider__setupDrawingStyleForState___block_invoke;
            v84[3] = &unk_1E16B1B50;
            v84[4] = self;
            v85 = v13;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v84, 0, 0.1, 0.0);

            if (!v53)
            {
LABEL_35:

              goto LABEL_36;
            }
LABEL_31:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setFromValue:", v73);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setToValue:", v74);

            objc_msgSend(v53, "setFillMode:", *MEMORY[0x1E0CD2B60]);
            objc_msgSend(v53, "setDelegate:", self->_maskAnimationView);
            -[UIView layer](self->_maskAnimationView, "layer");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "addAnimation:forKey:", v53, CFSTR("borderWidth"));

            if (v63)
            {
              -[UIButtonLegacyVisualProvider _fadeOutAnimationWithKeyPath:](self, "_fadeOutAnimationWithKeyPath:", CFSTR("opacity"));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIView layer](self->_maskAnimationView, "layer");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "presentationLayer");
              v78 = (void *)objc_claimAutoreleasedReturnValue();

              v79 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v78, "opacity");
              objc_msgSend(v79, "numberWithFloat:");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "setFromValue:", v80);

              objc_msgSend(v76, "setToValue:", &unk_1E1A958B0);
              objc_msgSend(v76, "setDelegate:", self->_maskAnimationView);
              -[UIView layer](self->_maskAnimationView, "layer");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "addAnimation:forKey:", v76, CFSTR("opacity"));

            }
            else
            {
              -[UIView layer](self->_maskAnimationView, "layer");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "removeAnimationForKey:", CFSTR("opacity"));
            }

            goto LABEL_35;
          }
          -[UIButtonLegacyVisualProvider _fadeOutAnimationWithKeyPath:](self, "_fadeOutAnimationWithKeyPath:", CFSTR("borderColor"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView layer](self->_maskAnimationView, "layer");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "presentationLayer");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setFromValue:", objc_msgSend(v70, "borderColor"));

          objc_msgSend(v68, "setToValue:", v13);
          -[UIView layer](self->_maskAnimationView, "layer");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addAnimation:forKey:", v68, CFSTR("borderColor"));

          -[_UIButtonMaskAnimationView setBorderColor:](self->_maskAnimationView, "setBorderColor:", v13);
        }
        if (!v53)
          goto LABEL_35;
        goto LABEL_31;
      }
      v53 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("borderWidth"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setMass:", 1.2);
      objc_msgSend(v53, "setStiffness:", 300.0);
      objc_msgSend(v53, "setDamping:", 30.0);
      objc_msgSend(v53, "setVelocity:", 0.0);
      objc_msgSend(v53, "setDuration:", 0.3);
      v54 = UIAnimationDragCoefficient();
      objc_msgSend(v53, "speed");
      *(float *)&v56 = v55 / v54;
      objc_msgSend(v53, "setSpeed:", v56);
    }
    v65 = 0;
    v63 = 0;
    goto LABEL_25;
  }
  -[UIView layer](self->_maskAnimationView, "layer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "removeAnimationForKey:", CFSTR("borderWidth"));

  -[UIView layer](self->_maskAnimationView, "layer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "removeAnimationForKey:", CFSTR("borderColor"));

  -[UIView layer](self->_maskAnimationView, "layer");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "removeAnimationForKey:", CFSTR("opacity"));

  -[_UIButtonMaskAnimationView borderColor](self->_maskAnimationView, "borderColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v13, "isEqual:", v60);

  if ((v61 & 1) == 0)
    -[_UIButtonMaskAnimationView setBorderColor:](self->_maskAnimationView, "setBorderColor:", v13);
LABEL_36:
  -[UIButtonLegacyVisualProvider _updateMaskState](self, "_updateMaskState");

}

uint64_t __59__UIButtonLegacyVisualProvider__setupDrawingStyleForState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setBorderColor:", *(_QWORD *)(a1 + 40));
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  -[UIButton setNeedsLayout](self->_button, "setNeedsLayout", a3, a4);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[UIButtonLegacyVisualProvider _floatingContentView](self, "_floatingContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIButtonLegacyVisualProvider _floatingContentView](self, "_floatingContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_preferredConfigurationForFocusAnimation:inContext:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __52__UIButtonLegacyVisualProvider__floatingContentView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFocusAnimationConfiguration:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setShadowOpacity:", 0.2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setShadowRadius:", 16.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setShadowVerticalOffset:", 25.0);
}

- (id)imageEffectContainerView
{
  return self->_imageView;
}

- (id)selectionIndicatorView
{
  UIView *selectionView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    selectionView = self->_selectionView;
  else
    selectionView = 0;
  return selectionView;
}

- (void)setExternalFlatEdge:(unint64_t)a3
{
  -[UIButtonLegacyVisualProvider _prepareMaskAnimationViewIfNecessary](self, "_prepareMaskAnimationViewIfNecessary");
  -[_UIButtonMaskAnimationView setHardEdge:](self->_maskAnimationView, "setHardEdge:", a3);
}

- (void)setDrawingStroke:(double)a3 forState:(unint64_t)a4
{
  -[UIButtonLegacyVisualProvider _updateEffectsForImageView:background:](self, "_updateEffectsForImageView:background:", self->_imageView, 0, a3);
  -[UIButtonLegacyVisualProvider _updateEffectsForImageView:background:](self, "_updateEffectsForImageView:background:", self->_backgroundView, 1);
  -[UIButtonLegacyVisualProvider _updateMaskState](self, "_updateMaskState");
}

- (UIButton)button
{
  return self->_button;
}

- (NSArray)_contentConstraints
{
  return self->_contentConstraints;
}

- (BOOL)avoidDefaultTitleAndImageLayout
{
  return self->_avoidDefaultTitleAndImageLayout;
}

- (void)setAvoidDefaultTitleAndImageLayout:(BOOL)a3
{
  self->_avoidDefaultTitleAndImageLayout = a3;
}

@end
