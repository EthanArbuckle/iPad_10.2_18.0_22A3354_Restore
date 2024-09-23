@implementation UINavigationButton

- (int64_t)buttonType
{
  objc_super v4;

  if (-[UINavigationButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UINavigationButton;
  return -[UIButton buttonType](&v4, sel_buttonType);
}

- (void)_setFontScaleAdjustment:(double)a3
{
  if (self->_fontScaleAdjustment != a3)
  {
    self->_isFontScaleInvalid = 1;
    self->_fontScaleAdjustment = a3;
  }
}

- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3
{
  _BOOL8 v4;
  int64_t barStyle;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_wantsBlendModeForAccessibilityBackgrounds != a3)
  {
    self->_wantsBlendModeForAccessibilityBackgrounds = a3;
    -[UIButton _backgroundView](self, "_backgroundView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[UIControl isEnabled](self, "isEnabled");
    if (v10)
    {
      barStyle = self->_barStyle;
      v6 = -[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");
      v7 = -[UINavigationButton _wantsBlendModeForAccessibilityBackgrounds](self, "_wantsBlendModeForAccessibilityBackgrounds");
      -[UINavigationButton _accessibilityBackgroundTintColor](self, "_accessibilityBackgroundTintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UINavigationButton _resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:](UINavigationButton, "_resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:", v10, barStyle, v4, v6, v7, v8);

    }
    if (!v4)
    {
      -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](self, "setTitleColor:forState:", v9, 2);

    }
  }
}

- (void)_setAccessibilityBackgroundTintColor:(id)a3
{
  UIColor *v5;
  void *v6;
  int64_t barStyle;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  UIColor *v12;

  v5 = (UIColor *)a3;
  if (self->_accessibilityBackgroundTintColor != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_accessibilityBackgroundTintColor, a3);
    -[UIButton _backgroundView](self, "_backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      barStyle = self->_barStyle;
      v8 = -[UIControl isEnabled](self, "isEnabled");
      v9 = -[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");
      v10 = -[UINavigationButton _wantsBlendModeForAccessibilityBackgrounds](self, "_wantsBlendModeForAccessibilityBackgrounds");
      -[UINavigationButton _accessibilityBackgroundTintColor](self, "_accessibilityBackgroundTintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[UINavigationButton _resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:](UINavigationButton, "_resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:", v6, barStyle, v8, v9, v10, v11);

    }
    v5 = v12;
  }

}

- (void)setMinimumWidth:(double)a3
{
  double maximumWidth;

  self->_minimumWidth = a3;
  maximumWidth = self->_maximumWidth;
  if (maximumWidth > 0.0 && maximumWidth < a3)
    self->_maximumWidth = a3;
}

- (void)setMaximumWidth:(double)a3
{
  double minimumWidth;

  self->_maximumWidth = a3;
  if (a3 > 0.0)
  {
    minimumWidth = self->_minimumWidth;
    if (minimumWidth > a3)
      self->_maximumWidth = minimumWidth;
  }
}

+ (id)defaultFont
{
  void *v2;
  void *v3;

  +[UINavigationBar _defaultVisualStyleForOrientation:](UINavigationBar, "_defaultVisualStyleForOrientation:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonFontForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UINavigationButton;
  -[UIButton _didMoveFromWindow:toWindow:](&v9, sel__didMoveFromWindow_toWindow_, a3, a4);
  if (-[UINavigationButton _showsAccessibilityBackgroundWhenEnabled](self, "_showsAccessibilityBackgroundWhenEnabled"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_graphicsQuality");

    if (v6 == 100)
    {
      -[UINavigationButton _accessibilityBackgroundTintColor](self, "_accessibilityBackgroundTintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[UINavigationButton _setWantsBlendModeForAccessibilityBackgrounds:](self, "_setWantsBlendModeForAccessibilityBackgrounds:", 0);
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
        -[UINavigationButton _setWantsBlendModeForAccessibilityBackgrounds:](self, "_setWantsBlendModeForAccessibilityBackgrounds:", _UIBarBlurAcceptsBlendModeOnBackground(WeakRetained));

      }
    }
    else
    {
      -[UINavigationButton _setWantsBlendModeForAccessibilityBackgrounds:](self, "_setWantsBlendModeForAccessibilityBackgrounds:", 0);
    }
    if (-[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes"))
      -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_showsAccessibilityBackgroundWhenEnabled
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!self->_createdByBarButtonItem)
    return 0;
  -[_UIBarButtonItemAppearanceStorage anyBackgroundImage](self->_appearanceStorage, "anyBackgroundImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[UIButton titleForState:](self, "titleForState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (BOOL)_wantsAccessibilityButtonShapes
{
  int v3;

  v3 = -[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self);
  if (v3)
    LOBYTE(v3) = -[UINavigationButton _showsAccessibilityBackgroundWhenEnabled](self, "_showsAccessibilityBackgroundWhenEnabled");
  return v3;
}

- (id)_defaultTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4
{
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  if (!-[UIButton _isInCarPlay](self, "_isInCarPlay"))
  {
    if (-[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes"))
    {
      if ((unint64_t)(self->_barStyle - 1) <= 1)
      {
        if (a3 == 2)
        {
          if (-[UINavigationButton _wantsBlendModeForAccessibilityBackgrounds](self, "_wantsBlendModeForAccessibilityBackgrounds"))
          {
            v8 = 0.2;
          }
          else
          {
            v8 = 0.3;
          }
          +[UIColor whiteColor](UIColor, "whiteColor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          v11 = v8;
LABEL_12:
          objc_msgSend(v9, "colorWithAlphaComponent:", v11);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (!a4)
            return v7;
          goto LABEL_15;
        }
        +[UIColor whiteColor](UIColor, "whiteColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a4)
          return v7;
LABEL_15:
        *a4 = 0;
        return v7;
      }
      if (a3 == 2)
      {
        +[UIColor blackColor](UIColor, "blackColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = 0.2;
        goto LABEL_12;
      }
    }
    v7 = 0;
    if (!a4)
      return v7;
    goto LABEL_15;
  }
  -[UINavigationButton _externalTitleColorForState:isTintColor:](self, "_externalTitleColorForState:isTintColor:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)_externalTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4
{
  BOOL v7;
  BOOL v8;
  void *v9;

  if (-[UINavigationButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton"))
  {
    v7 = a3 == 8;
    v8 = a3 != 8;
    if (v7)
    {
      -[UIButton _externalFocusedTitleColor](self, "_externalFocusedTitleColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
        return v9;
    }
    else
    {
      -[UIView tintColor](self, "tintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
        return v9;
    }
    goto LABEL_6;
  }
  v8 = 0;
  v9 = 0;
  if (a4)
LABEL_6:
    *a4 = v8;
  return v9;
}

- (id)_defaultTitleShadowColorForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
  {
    v5 = 0;
  }
  else
  {
    +[UIButton _defaultNormalTitleShadowColor](UINavigationButton, "_defaultNormalTitleShadowColor", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (CGSize)_defaultTitleShadowOffsetForState:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateShadowOffsetWithAttributes:(id)a3 forState:(unint64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(a3, "objectForKey:", *(_QWORD *)off_1E1679048);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "shadowOffset");
  else
    -[UINavigationButton _defaultTitleShadowOffsetForState:](self, "_defaultTitleShadowOffsetForState:", a4);
  -[UIButton _setTitleShadowOffset:](self, "_setTitleShadowOffset:");

}

+ (void)_resetRenderingModesForBackgroundImageView:(id)a3 inBarStyle:(int64_t)a4 isEnabled:(BOOL)a5 withAccessibilityBackground:(BOOL)a6 wantsBlendModeForAccessibilityBackgrounds:(BOOL)a7 accessibilityBackgroundTintColor:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v9 = a7;
  v10 = a6;
  v19 = a3;
  v13 = a8;
  if (v10)
    v14 = 2;
  else
    v14 = 1;
  objc_msgSend(v19, "_setDefaultRenderingMode:", v14);
  if (!v10)
  {
    v18 = 0;
    goto LABEL_15;
  }
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    if (v9)
    {
      if (!a4)
      {
        +[UIColor _accessibilityButtonShapesBackgroundColorOnLight](UIColor, "_accessibilityButtonShapesBackgroundColorOnLight");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      if (a5)
        +[UIColor _accessibilityButtonShapesBackgroundColorOnDark](UIColor, "_accessibilityButtonShapesBackgroundColorOnDark");
      else
        +[UIColor _accessibilityButtonShapesDisabledBackgroundColorOnDark](UIColor, "_accessibilityButtonShapesDisabledBackgroundColorOnDark");
    }
    else if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      +[UIColor _accessibilityButtonShapesNoBlendModeBackgroundColorOnDark](UIColor, "_accessibilityButtonShapesNoBlendModeBackgroundColorOnDark");
    }
    else
    {
      +[UIColor _accessibilityButtonShapesNoBlendModeBackgroundColorOnLight](UIColor, "_accessibilityButtonShapesNoBlendModeBackgroundColorOnLight");
    }
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  v16 = v15;
  objc_msgSend(v19, "setTintColor:", v15);

  v17 = 100;
  if (a4)
    v17 = 101;
  if (!v9)
    v17 = 0;
  if (v13)
    v18 = 0;
  else
    v18 = v17;
LABEL_15:
  objc_msgSend(v19, "_setDrawsAsBackdropOverlayWithBlendMode:", v18);

}

- (void)_sendSetNeedsLayoutToSuperviewOnTitleAnimationCompletionIfNecessary
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (CGRect)_selectedIndicatorBounds
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v13.receiver = self;
  v13.super_class = (Class)UINavigationButton;
  -[UIButton _selectedIndicatorBounds](&v13, sel__selectedIndicatorBounds);
  top = self->__additionalSelectionInsets.top;
  left = self->__additionalSelectionInsets.left;
  v6 = v5 + left;
  v8 = v7 - (self->__additionalSelectionInsets.right + left);
  v10 = v9 + top;
  v12 = v11 - (top + self->__additionalSelectionInsets.bottom);
  result.size.height = v12;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  int64_t barStyle;
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UINavigationButton;
  -[UIButton layoutSubviews](&v10, sel_layoutSubviews);
  if (-[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes"))
  {
    -[UIButton _titleView](self, "_titleView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    objc_msgSend(v3, "setFrame:");
    -[UIButton _backgroundView](self, "_backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      barStyle = self->_barStyle;
      v6 = -[UIControl isEnabled](self, "isEnabled");
      v7 = -[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");
      v8 = -[UINavigationButton _wantsBlendModeForAccessibilityBackgrounds](self, "_wantsBlendModeForAccessibilityBackgrounds");
      -[UINavigationButton _accessibilityBackgroundTintColor](self, "_accessibilityBackgroundTintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[UINavigationButton _resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:](UINavigationButton, "_resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:", v4, barStyle, v6, v7, v8, v9);

    }
  }
}

- (void)_updateTitleColorsForState:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;

  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  if (v5)
  {
    if (a3)
    {
      -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", a3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v5;
    }
    v11 = v6;
    objc_msgSend(v6, "objectForKey:", *(_QWORD *)off_1E1678D98);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", a3, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    -[UIButton setTitleColor:forState:](self, "setTitleColor:forState:", v15, a3);
    objc_msgSend(v11, "objectForKey:", *(_QWORD *)off_1E1679048);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "shadowColor");
    else
      -[UINavigationButton _defaultTitleShadowColorForState:](self, "_defaultTitleShadowColorForState:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleShadowColor:forState:](self, "setTitleShadowColor:forState:", v18, a3);
    v19 = -[UIControl isEnabled](self, "isEnabled");
    v20 = 2;
    if (v19)
      v20 = 0;
    if (v20 == a3)
      -[UINavigationButton _updateShadowOffsetWithAttributes:forState:](self, "_updateShadowOffsetWithAttributes:forState:", v11, a3);

  }
  else
  {
    -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forStates:](self, "setTitleColor:forStates:", v7, 0);

    -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forStates:](self, "setTitleColor:forStates:", v8, 2);

    -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forStates:](self, "setTitleColor:forStates:", v9, 8);

    -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forStates:](self, "setTitleColor:forStates:", v10, 1);

    -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forStates:](self, "setTitleColor:forStates:", v11, 4);
  }

}

- (int64_t)_barButtonItemStyle
{
  int v3;
  int style;
  int64_t v5;

  v3 = dyld_program_sdk_at_least();
  style = self->_style;
  v5 = v3 ^ 1u;
  if (style == 5)
    v5 = 7;
  if (style == 2)
    return 2;
  else
    return v5;
}

- (UIEdgeInsets)_buttonTitleEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  if (self->_barStyle)
    v3 = 1.0;
  else
    v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v2;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)_pathTitleEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_pathImageEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_adjustedDefaultTitleFont
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;

  -[UINavigationButton _activeVisualStyle](self, "_activeVisualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonFontForStyle:", -[UINavigationButton _barButtonItemStyle](self, "_barButtonItemStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_fontScaleAdjustment != 0.0)
  {
    objc_msgSend(v4, "pointSize");
    objc_msgSend(v5, "fontWithSize:", v6 * self->_fontScaleAdjustment);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

- (id)_customOrAccessibilityBackgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;

  v5 = a5;
  -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](self->_appearanceStorage, "backgroundImageForState:style:isMini:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");
  if (!a3 && v9)
  {
    _UINavigationButtonAccessibilityBackground(0, v5);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  return v8;
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  if (-[UINavigationButton _showsAccessibilityBackgroundWhenEnabled](self, "_showsAccessibilityBackgroundWhenEnabled"))
  {
    -[UINavigationButton _updateStyle](self, "_updateStyle");
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UINavigationButton;
  -[UIButton _didChangeFromIdiom:onScreen:traverseHierarchy:](&v9, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  -[UIView _screen](self, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_userInterfaceIdiom");

  if (v8 != a3 && (a3 == 3 || v8 == 3))
  {
    -[UINavigationButton _accessibilityButtonShapesParametersDidChange](self, "_accessibilityButtonShapesParametersDidChange");
    -[UINavigationButton _updateStyle](self, "_updateStyle");
  }
}

- (void)_updateStyle
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v18;
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
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  -[UINavigationButton _tintColor](self, "_tintColor");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[UINavigationButton _barButtonItemStyle](self, "_barButtonItemStyle");
  -[UINavigationButton _activeVisualStyle](self, "_activeVisualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 0, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UINavigationButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 0, v3, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (*((_BYTE *)self + 816) & 3) == 1;
    v9 = v6 != 0;
    v10 = v8 & v9;
    if (v8 && v9)
      v11 = (void *)v6;
    else
      v11 = v5;
    -[UIButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v11, 0);
    -[UINavigationButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 1, v3, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 2, v3, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v12, 1);
    -[UIButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v13, 2);
    -[UIButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", v12 == 0);
    -[UIButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", 0);

  }
  else
  {
    -[UIButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
    -[UIButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", 0);
    -[UIButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", 0, 0);
    -[UIButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", 0, 1);
    -[UIButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", 0, 2);
  }
  -[UIButton setTintColor:](self, "setTintColor:", v35);
  -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _setImageColor:forState:](self, "_setImageColor:forState:", v14, 0);

  -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _setImageColor:forState:](self, "_setImageColor:forState:", v15, 2);

  -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _setImageColor:forState:](self, "_setImageColor:forState:", v16, 8);

  appearanceStorage = self->_appearanceStorage;
  if ((*((_BYTE *)self + 816) & 3) == 1)
    -[_UIBarButtonItemAppearanceStorage miniTitlePositionOffset](appearanceStorage, "miniTitlePositionOffset");
  else
    -[_UIBarButtonItemAppearanceStorage titlePositionOffset](appearanceStorage, "titlePositionOffset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[UINavigationButton _buttonTitleEdgeInsets](self, "_buttonTitleEdgeInsets");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(v18, "UIOffsetValue");
    -[UIButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", v20 + v28, v22 + v27, v24 - v28, v26 - v27);
  }
  -[UINavigationButton _updateContentInsets](self, "_updateContentInsets");
  if (!-[UIButton _isTitleFrozen](self, "_isTitleFrozen"))
  {
    -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", *(_QWORD *)off_1E1678D90);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v30, "pointSize");
      if (v31 == 0.0)
      {
        objc_msgSend(v4, "_legacyButtonFontSize");
        objc_msgSend(v30, "fontWithSize:");
        v32 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v32;
      }
      -[UIButton _setFont:](self, "_setFont:", v30);

    }
    else
    {
      -[UINavigationButton _adjustedDefaultTitleFont](self, "_adjustedDefaultTitleFont");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton _setFont:](self, "_setFont:", v33);

      self->_isFontScaleInvalid = 0;
    }
  }
  -[UINavigationButton _defaultTitleColorForState:isTintColor:](self, "_defaultTitleColorForState:isTintColor:", 2, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](self, "setTitleColor:forState:", v34, 2);

  -[UINavigationButton _updateTitleColorsForState:](self, "_updateTitleColorsForState:", 0);
  -[UINavigationButton _updateTitleColorsForState:](self, "_updateTitleColorsForState:", 1);
  -[UINavigationButton _updateTitleColorsForState:](self, "_updateTitleColorsForState:", 2);
  -[UINavigationButton _updateTitleColorsForState:](self, "_updateTitleColorsForState:", 8);
  if (self->_minimumWidth > 0.0 || self->_maximumWidth > 0.0)
  {
    -[UIView frame](self, "frame");
    -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    -[UIView frameForAlignmentRect:](self, "frameForAlignmentRect:");
    -[UIButton setFrame:](self, "setFrame:");
  }
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)_setTitleFrozen:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UINavigationButton;
  -[UIButton _setTitleFrozen:](&v5, sel__setTitleFrozen_);
  if (!a3)
    -[UINavigationButton _updateStyle](self, "_updateStyle");
}

- (UINavigationButton)initWithValue:(id)a3 width:(double)a4 style:(int)a5 barStyle:(int64_t)a6 possibleTitles:(id)a7 possibleSystemItems:(id)a8 tintColor:(id)a9 applyBezel:(BOOL)a10 forButtonItemStyle:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  UIColor *v21;
  void *v22;
  UINavigationButton *v23;
  UINavigationButton *v24;
  void *v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  uint64_t v29;
  NSSet *possibleTitles;
  uint64_t v31;
  NSSet *possibleSystemItems;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  objc_super v40;

  v17 = a3;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (a6
    && !initWithValue_width_style_barStyle_possibleTitles_possibleSystemItems_tintColor_applyBezel_forButtonItemStyle____shadowColor)
  {
    v21 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.0, 0.35);
    v22 = (void *)initWithValue_width_style_barStyle_possibleTitles_possibleSystemItems_tintColor_applyBezel_forButtonItemStyle____shadowColor;
    initWithValue_width_style_barStyle_possibleTitles_possibleSystemItems_tintColor_applyBezel_forButtonItemStyle____shadowColor = (uint64_t)v21;

  }
  v40.receiver = self;
  v40.super_class = (Class)UINavigationButton;
  v23 = -[UIButton initWithFrame:](&v40, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v24 = v23;
  if (v23)
  {
    v39 = v20;
    -[UINavigationButton _activeVisualStyle](v23, "_activeVisualStyle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a6)
      objc_msgSend(v25, "_legacyButtonFontForStyle:", a5);
    else
      objc_msgSend(v25, "buttonFontForStyle:", a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton _setFont:](v24, "_setFont:", v27);

    -[UINavigationButton _buttonTitleEdgeInsets](v24, "_buttonTitleEdgeInsets");
    -[UIButton setTitleEdgeInsets:](v24, "setTitleEdgeInsets:");
    -[UIButton setTitleShadowColor:forStates:](v24, "setTitleShadowColor:forStates:", initWithValue_width_style_barStyle_possibleTitles_possibleSystemItems_tintColor_applyBezel_forButtonItemStyle____shadowColor, 0);
    if (a6)
      -[UIButton _setTitleShadowOffset:](v24, "_setTitleShadowOffset:", 0.0, -1.0);
    objc_msgSend(v26, "buttonContentEdgeInsets");
    -[UIButton setContentEdgeInsets:](v24, "setContentEdgeInsets:");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      -[UIButton setTitle:forStates:](v24, "setTitle:forStates:", v17, 0);
    else
      -[UIButton setImage:forStates:](v24, "setImage:forStates:", v17, 0);
    -[UIButton setContentHorizontalAlignment:](v24, "setContentHorizontalAlignment:", 0);
    -[UIButton setContentVerticalAlignment:](v24, "setContentVerticalAlignment:", 0);
    -[UIButton setAdjustsImageWhenHighlighted:](v24, "setAdjustsImageWhenHighlighted:", 0);
    -[UIButton setAdjustsImageWhenDisabled:](v24, "setAdjustsImageWhenDisabled:", 0);
    -[UIButton setDisabledDimsImage:](v24, "setDisabledDimsImage:", 0);
    v24->_style = a5;
    v24->_barStyle = a6;
    v29 = objc_msgSend(v18, "copy");
    possibleTitles = v24->_possibleTitles;
    v24->_possibleTitles = (NSSet *)v29;

    v31 = objc_msgSend(v19, "copy");
    possibleSystemItems = v24->_possibleSystemItems;
    v24->_possibleSystemItems = (NSSet *)v31;

    objc_storeStrong((id *)&v24->_navigationBarTintColor, a9);
    v24->_buttonItemStyle = a11;
    -[UINavigationButton _updateStyle](v24, "_updateStyle");
    -[UINavigationButton sizeThatFits:](v24, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[UINavigationButton _setFrame:deferLayout:](v24, "_setFrame:deferLayout:", 1, 0.0, 0.0, v33, v34);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v24, sel__accessibilityButtonShapesDidChangeNotification_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

    -[UIView layer](v24, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAllowsGroupBlending:", (isKindOfClass & 1) == 0);

    -[UIView layer](v24, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAllowsGroupOpacity:", 0);

    -[UINavigationButton setPointerInteractionEnabled:](v24, "setPointerInteractionEnabled:", _UIUseModernBars());
    v20 = v39;
  }

  return v24;
}

- (UINavigationButton)initWithValue:(id)a3 width:(double)a4 style:(int)a5 barStyle:(int64_t)a6 possibleTitles:(id)a7 tintColor:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:possibleSystemItems:tintColor:applyBezel:forButtonItemStyle:](self, "initWithValue:width:style:barStyle:possibleTitles:possibleSystemItems:tintColor:applyBezel:forButtonItemStyle:", a3, *(_QWORD *)&a5, a6, a7, 0, a8, a4, v9, 0);
}

- (UINavigationButton)initWithTitle:(id)a3
{
  return -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](self, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", a3, 0, 0, 0, 0, 0.0);
}

- (UINavigationButton)initWithTitle:(id)a3 style:(int)a4
{
  return -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](self, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", a3, *(_QWORD *)&a4, 0, 0, 0, 0.0);
}

- (UINavigationButton)initWithTitle:(id)a3 possibleTitles:(id)a4 style:(int)a5
{
  return -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](self, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", a3, *(_QWORD *)&a5, 0, a4, 0, 0.0);
}

- (UINavigationButton)initWithImage:(id)a3 width:(double)a4 style:(int)a5 applyBezel:(BOOL)a6 forBarStyle:(int64_t)a7 buttonItemStyle:(int64_t)a8
{
  uint64_t v9;

  LOBYTE(v9) = a6;
  return -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:possibleSystemItems:tintColor:applyBezel:forButtonItemStyle:](self, "initWithValue:width:style:barStyle:possibleTitles:possibleSystemItems:tintColor:applyBezel:forButtonItemStyle:", a3, *(_QWORD *)&a5, a7, 0, 0, 0, a4, v9, a8);
}

- (UINavigationButton)initWithImage:(id)a3 width:(double)a4 style:(int)a5
{
  return -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](self, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", a3, *(_QWORD *)&a5, 0, 0, 0, a4);
}

- (UINavigationButton)initWithImage:(id)a3
{
  return -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](self, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", a3, 0, 0, 0, 0, 0.0);
}

- (UINavigationButton)initWithImage:(id)a3 style:(int)a4
{
  return -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](self, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", a3, *(_QWORD *)&a4, 0, 0, 0, 0.0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UINavigationButton;
  -[UIButton dealloc](&v4, sel_dealloc);
}

- (BOOL)_isModernButton
{
  return 1;
}

- (NSString)title
{
  return -[UIButton titleForState:](self, "titleForState:", 0);
}

- (void)setTitle:(id)a3
{
  void *v4;

  -[UIButton setTitle:forStates:](self, "setTitle:forStates:", a3, 0);
  -[UIView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    return;
  }
  -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
}

- (UIImage)image
{
  return -[UIButton imageForState:](self, "imageForState:", 0);
}

- (void)setImage:(id)a3
{
  -[UIButton setImage:forStates:](self, "setImage:forStates:", a3, 0);
  if (-[UINavigationButton style](self, "style") != 1)
    -[UINavigationButton _updateContentInsets](self, "_updateContentInsets");
}

- (BOOL)contentsEqualTo:(id)a3 withStyle:(int)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;

  v6 = a3;
  if (v6 && self->_style == a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UINavigationButton title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      -[UINavigationButton image](self, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  UINavigationButton *v3;
  double *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSSet *v10;
  NSSet *v11;
  double v12;
  void *v13;
  NSSet *v14;
  _BOOL8 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSSet *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  NSSet *v37;
  void *v38;
  void *v39;
  NSSet *v40;
  NSSet *v41;
  double v42;
  double v43;
  void *v44;
  int v45;
  UINavigationButton *v46;
  char v47;
  _BOOL4 v48;
  id v49;
  id v50;
  void *v51;
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
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double height;
  double v81;
  double maximumWidth;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  NSSet *v99;
  void *v100;
  NSSet *obj;
  UINavigationButton *v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;
  CGSize result;

  v3 = self;
  v114 = *MEMORY[0x1E0C80C00];
  v4 = (double *)MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UINavigationButton title](self, "title", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationButton image](v3, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UINavigationButton _barButtonItemStyle](v3, "_barButtonItemStyle");
  -[UINavigationButton _activeVisualStyle](v3, "_activeVisualStyle");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v3;
  if (v6)
  {
    -[_UIBarItemAppearanceStorage textAttributesForState:](v3->_appearanceStorage, "textAttributesForState:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)off_1E1678D90);
    v10 = (NSSet *)objc_claimAutoreleasedReturnValue();

    -[UINavigationButton _adjustedDefaultTitleFont](v3, "_adjustedDefaultTitleFont");
    obj = (NSSet *)objc_claimAutoreleasedReturnValue();
    v11 = obj;
    v97 = v7;
    if (v10 && (-[NSSet pointSize](v10, "pointSize"), v11 = v10, v12 == 0.0))
    {
      -[_UIBarButtonItemAppearanceStorage anyBackgroundImage](v3->_appearanceStorage, "anyBackgroundImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v100, "_legacyButtonFontSize");
      else
        objc_msgSend(v100, "buttonFontSize");
      -[NSSet fontWithSize:](v10, "fontWithSize:");
      v14 = (NSSet *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = v11;
    }
    v96 = v8;
    v98 = v6;
    objc_msgSend(v6, "_legacy_sizeWithFont:", v14);
    v18 = v30;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v31 = v3->_possibleTitles;
    v32 = -[NSSet countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v109;
      v99 = v14;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v109 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
          v37 = v14;
          if (!v10 && -[NSDictionary count](v3->_stylesForSizingTitles, "count"))
          {
            -[NSDictionary objectForKey:](v3->_stylesForSizingTitles, "objectForKey:", v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            if (v38)
            {
              v40 = v31;
              objc_msgSend(v100, "buttonFontForStyle:", objc_msgSend(v38, "integerValue"));
              v41 = (NSSet *)objc_claimAutoreleasedReturnValue();

              if (v3->_fontScaleAdjustment <= 0.0)
              {
                v37 = v41;
              }
              else
              {
                -[NSSet pointSize](v41, "pointSize");
                -[NSSet fontWithSize:](v41, "fontWithSize:", v42 * v3->_fontScaleAdjustment);
                v37 = (NSSet *)objc_claimAutoreleasedReturnValue();

              }
              v31 = v40;
              v10 = 0;
              v14 = v99;
            }

          }
          objc_msgSend(v36, "_legacy_sizeWithFont:", v37);
          if (v43 > v18)
            v18 = v43;

        }
        v33 = -[NSSet countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
      }
      while (v33);
    }

    v7 = v97;
    v6 = v98;
    v8 = v96;
LABEL_39:

    goto LABEL_40;
  }
  if (v7)
  {
    v15 = _AXSEnhanceTextLegibilityEnabled() != 0;
    -[UIView traitCollection](v3, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sizeWithHairlineThickening:forTraitCollection:", v15, v16);
    v18 = v17;
    v5 = v19;

  }
  else
  {
    v18 = *v4;
  }
  if (-[NSSet count](v3->_possibleSystemItems, "count"))
  {
    -[UIView traitCollection](v3, "traitCollection");
    v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    obj = v3->_possibleSystemItems;
    v20 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v105;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v105 != v22)
            objc_enumerationMutation(obj);
          v24 = objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * j), "unsignedIntegerValue");
          v103 = 0;
          BYTE1(v95) = 1;
          LOBYTE(v95) = (*((_BYTE *)v102 + 816) & 3) == 1;
          +[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:usingSystemItem:usingItemStyle:](UIBarButtonItem, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:usingSystemItem:usingItemStyle:", 0, 0, &v103, 0, 0, v102->_barStyle, v95, v24, v8);
          v25 = v103;
          objc_msgSend(v25, "_sizeWithHairlineThickening:forTraitCollection:", _AXSEnhanceTextLegibilityEnabled() != 0, v10);
          v27 = v26;
          v29 = v28;

          v18 = fmax(v18, v27);
          v5 = fmax(v5, v29);
        }
        v21 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
      }
      while (v21);
      v3 = v102;
      v6 = 0;
    }
    goto LABEL_39;
  }
LABEL_40:
  -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](v3->_appearanceStorage, "backgroundImageForState:style:isMini:", 0, v8, (*((_BYTE *)v3 + 816) & 3) == 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44)
  {
    if ((*((_BYTE *)v3 + 816) & 3) == 1)
    {
      -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](v3->_appearanceStorage, "backgroundImageForState:style:isMini:", 0, v8, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }
  }
  v45 = -[UINavigationButton style](v3, "style");
  v46 = v3;
  v47 = *((_BYTE *)v3 + 816);
  v48 = -[UINavigationButton _wantsAccessibilityButtonShapes](v46, "_wantsAccessibilityButtonShapes");
  v49 = v44;
  v50 = v100;
  v51 = v50;
  if (v49)
  {
    objc_msgSend(v49, "capInsets");
    if (v48)
      v54 = 6.0;
    else
      v54 = v53;
    if (v48)
      v55 = 6.0;
    else
      v55 = v52;
    objc_msgSend(v49, "alignmentRectInsets");
    v57 = v56;
    v59 = v58;
    if (v7)
    {
      objc_msgSend(v51, "_legacyButtonImagePadding");
LABEL_58:
      v61 = fmax(v55 - v57, v60 * 0.5) + fmax(v54 - v59, v60 * 0.5);
      if (v45 == 1 && v49)
        v61 = v61 + -1.0;
      goto LABEL_69;
    }
    objc_msgSend(v51, "_legacyLeftTitleMargin");
    v63 = v62;
    objc_msgSend(v51, "_legacyRightTitleMargin");
  }
  else
  {
    v57 = 0.0;
    if (v48)
      v55 = 6.0;
    else
      v55 = 0.0;
    if (v7)
    {
      objc_msgSend(v50, "buttonImagePadding");
      v54 = v55;
      v59 = 0.0;
      goto LABEL_58;
    }
    if (v45 == 1)
      objc_msgSend(v50, "leftBackTitleMargin");
    else
      objc_msgSend(v50, "leftTitleMargin");
    v63 = v65;
    objc_msgSend(v51, "rightTitleMargin");
    v54 = v55;
    v59 = 0.0;
  }
  v61 = fmax(v55 - v57, v63) + fmax(v54 - v59, v64);
  objc_msgSend(v51, "minBackTextWidth");
  if (v18 < v66)
  {
    objc_msgSend(v51, "minBackTextWidth");
    v18 = v67;
  }
LABEL_69:
  objc_msgSend(v51, "buttonHeight");
  v69 = v68;
  if (v49)
  {
    objc_msgSend(v49, "alignmentRectInsets");
    v71 = v70;
    v73 = v72;
    objc_msgSend(v49, "size");
    v75 = fmax(v69, v74 - (v71 + v73));
  }
  else
  {
    if (v48)
    {
      _UINavigationButtonAccessibilityBackground(0, (v47 & 3) == 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "size");
      v69 = v77;

    }
    v78 = fmax(v69, v5);
    if (v7)
      v75 = v78;
    else
      v75 = v69;
  }
  v79 = ceil(v61 + v18);

  height = v102->_boundsAdjustment.height;
  v81 = fmax(v102->_minimumWidth, v79 - v102->_boundsAdjustment.width);
  maximumWidth = v102->_maximumWidth;
  v83 = fmin(maximumWidth, v81);
  if (maximumWidth <= 0.0)
    v84 = v81;
  else
    v84 = v83;
  -[UIButton alignmentRectInsets](v102, "alignmentRectInsets");
  v86 = v85;
  v88 = v87;
  v90 = v89;
  v92 = v91;

  v93 = v84 + v88 + v92;
  v94 = v75 - height + v86 + v90;
  result.height = v94;
  result.width = v93;
  return result;
}

- (void)setStyle:(int)a3
{
  void *v5;

  if (self->_style != a3
    || (-[UIButton backgroundImageForState:](self, "backgroundImageForState:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_style = a3;
    -[UINavigationButton _updateStyle](self, "_updateStyle");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationButton;
  -[UIButton setHighlighted:](&v13, sel_setHighlighted_);
  -[UINavigationButton originatingNavigationItem](self, "originatingNavigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIControl isHighlighted](self, "isHighlighted");
  -[UINavigationButton originatingButtonItem](self, "originatingButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_evaluateBackIndicatorForHilightedState:ofBarButtonItem:inNavigationItem:", v7, v8, v5);

  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (v3)
    {
      -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v9;
    }
    v12 = v11;
    -[UINavigationButton _updateShadowOffsetWithAttributes:forState:](self, "_updateShadowOffsetWithAttributes:forState:", v11, v3);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  int64_t barStyle;
  _BOOL8 v15;
  void *v16;
  objc_super v17;

  v3 = a3;
  v5 = -[UIControl isEnabled](self, "isEnabled");
  v17.receiver = self;
  v17.super_class = (Class)UINavigationButton;
  -[UIButton setEnabled:](&v17, sel_setEnabled_, v3);
  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[UIControl isHighlighted](self, "isHighlighted");
    v8 = 2;
    if (v3)
      v8 = 0;
    if (v7)
      v9 = 1;
    else
      v9 = v8;
    if (v7 || !v3)
    {
      -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v6;
    }
    v11 = v10;
    -[UINavigationButton _updateShadowOffsetWithAttributes:forState:](self, "_updateShadowOffsetWithAttributes:forState:", v10, v9);

  }
  v12 = (unint64_t)(self->_barStyle - 1) > 1 || v5 == v3;
  if (!v12 && -[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes"))
  {
    -[UIButton _backgroundView](self, "_backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      barStyle = self->_barStyle;
      v15 = -[UINavigationButton _wantsBlendModeForAccessibilityBackgrounds](self, "_wantsBlendModeForAccessibilityBackgrounds");
      -[UINavigationButton _accessibilityBackgroundTintColor](self, "_accessibilityBackgroundTintColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UINavigationButton _resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:](UINavigationButton, "_resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:", v13, barStyle, v3, 1, v15, v16);

    }
  }

}

- (void)setControlSize:(int)a3
{
  char v3;

  v3 = *((_BYTE *)self + 816);
  if ((v3 & 3) != a3)
  {
    *((_BYTE *)self + 816) = v3 & 0xFC | a3 & 3;
    -[UINavigationButton _updateStyle](self, "_updateStyle");
  }
}

- (int)controlSize
{
  return *((_BYTE *)self + 816) & 3;
}

- (void)setBarStyle:(int64_t)a3
{
  void *v5;

  if (self->_barStyle != a3
    || (-[UIButton backgroundImageForState:](self, "backgroundImageForState:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_barStyle = a3;
    -[UINavigationButton _updateStyle](self, "_updateStyle");
  }
}

- (void)setNavigationBarTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_navigationBarTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_navigationBarTintColor, a3);
    -[UINavigationButton _updateStyle](self, "_updateStyle");
    v5 = v6;
  }

}

- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3
{
  return 1;
}

- (void)_adjustBounds
{
  -[UIView bounds](self, "bounds");
  -[UIButton setBounds:](self, "setBounds:");
}

- (void)_setFrame:(CGRect)a3 deferLayout:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  void *v16;
  int v17;
  objc_super v18;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  v18.receiver = self;
  v18.super_class = (Class)UINavigationButton;
  -[UIButton _setFrame:deferLayout:](&v18, sel__setFrame_deferLayout_, v4, x, y, width, height);
  if (width != v11 || height != v13)
    -[UINavigationButton _adjustBounds](self, "_adjustBounds");
  -[UINavigationButton image](self, "image");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = -[UINavigationButton style](self, "style");

    if (v17 != 1)
      -[UINavigationButton _updateContentInsets](self, "_updateContentInsets");
  }
}

- (void)_setBoundsAdjustment:(CGSize)a3
{
  if (a3.width != self->_boundsAdjustment.width || a3.height != self->_boundsAdjustment.height)
  {
    self->_boundsAdjustment = a3;
    -[UINavigationButton _adjustBounds](self, "_adjustBounds");
  }
}

- (void)_updateContentInsets
{
  int v3;
  void *v4;
  void *v5;
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
  id v17;

  -[UINavigationButton _activeVisualStyle](self, "_activeVisualStyle");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[UINavigationButton style](self, "style");
  -[UINavigationButton image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
  {

    objc_msgSend(v17, "leftBackTitleMargin");
    v7 = v6;
    objc_msgSend(v17, "rightTitleMargin");
    v9 = v7 + 1.0;
    v10 = v7 + -2.0;
    if (v5)
      v11 = v8;
    else
      v11 = v8 + -1.0;
    if (v5)
      v9 = v10;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v17, "buttonImagePadding");
      v13 = v12;
      -[UIView bounds](self, "bounds");
      v15 = v14;
      objc_msgSend(v5, "size");
      v11 = floor(fmin(v13, v15 - v16) * 0.5);
    }
    else
    {
      v11 = 0.0;
    }

    v9 = v11;
  }
  -[UIButton setContentEdgeInsets:](self, "setContentEdgeInsets:", 0.0, v9, 0.0, v11);

}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 barMetrics:(int64_t)a6
{
  id v10;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v12;
  _UIBarButtonItemAppearanceStorage *v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  _BOOL4 createdByBarButtonItem;
  id WeakRetained;
  id v25;

  v10 = a3;
  if ((unint64_t)(a6 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (v10)
    {
      v25 = v10;
      if (!appearanceStorage)
      {
        v12 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
        v13 = self->_appearanceStorage;
        self->_appearanceStorage = v12;

        v10 = v25;
      }
      v14 = v10;
      if ((objc_msgSend(v14, "_isResizable") & 1) == 0)
      {
        objc_msgSend(v14, "size");
        v16 = floor(v15 * 0.5);
        objc_msgSend(v14, "resizableImageWithCapInsets:", 0.0, v16, 0.0, v15 - v16 + -1.0);
        v17 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v17;
      }
    }
    else
    {
      if (!appearanceStorage)
        goto LABEL_30;
      v25 = 0;
      v14 = 0;
    }
    -[_UIBarButtonItemAppearanceStorage anyBackgroundImage](self->_appearanceStorage, "anyBackgroundImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      v19 = 1;
    else
      v19 = a4;
    -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](self->_appearanceStorage, "backgroundImageForState:style:isMini:", v19, a5, a6 == 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20 == v14)
    {
      if ((a6 == 1) == (-[UINavigationButton controlSize](self, "controlSize") != 1)
        || a5 != 8 && -[UINavigationButton _buttonItemStyle](self, "_buttonItemStyle") != a5
        || (-[UIButton backgroundImageForState:](self, "backgroundImageForState:", a4),
            v22 = (id)objc_claimAutoreleasedReturnValue(),
            v22,
            v22 == v14))
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      -[_UIBarButtonItemAppearanceStorage setBackgroundImage:forState:style:isMini:](self->_appearanceStorage, "setBackgroundImage:forState:style:isMini:", v14, v19, a5, a6 == 1);
    }
    -[UINavigationButton _updateStyle](self, "_updateStyle");
    if (_AXSButtonShapesEnabled()
      && objc_msgSend(-[UIView _screen](self, "_screen"), "_userInterfaceIdiom") != 3)
    {
      -[_UIBarButtonItemAppearanceStorage anyBackgroundImage](self->_appearanceStorage, "anyBackgroundImage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18 == 0) == (v21 != 0))
      {
        createdByBarButtonItem = self->_createdByBarButtonItem;

        if (createdByBarButtonItem)
          -[UIButton setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
    objc_msgSend(WeakRetained, "setNeedsLayout");

    goto LABEL_28;
  }
  if ((_UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn & 1) == 0)
  {
    _UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn = 1;
    v25 = v10;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UIBarButtonItem", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
LABEL_29:
    v10 = v25;
  }
LABEL_30:

}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  -[UINavigationButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", a3, a4, 8, a5);
}

- (id)_backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  void *v4;
  int64_t v8;
  unint64_t v9;

  if ((unint64_t)(a4 - 101) > 1)
  {
    v8 = -[UINavigationButton _barButtonItemStyle](self, "_barButtonItemStyle");
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      v9 = 1;
    else
      v9 = a3;
    -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](self->_appearanceStorage, "backgroundImageForState:style:isMini:", v9, v8, a4 == 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((_backgroundImageForState_barMetrics__didWarn & 1) == 0)
    {
      _backgroundImageForState_barMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3, "UIBarButtonItem", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    v4 = 0;
  }
  return v4;
}

- (void)_UIAppearance_setTintColor:(id)a3
{
  id v4;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v6;
  _UIBarButtonItemAppearanceStorage *v7;
  id v8;
  id v9;

  v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  v9 = v4;
  if (v4)
  {
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  -[_UIBarButtonItemAppearanceStorage tintColor](appearanceStorage, "tintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIBarButtonItemAppearanceStorage setTintColor:](self->_appearanceStorage, "setTintColor:", v9);
  if (v8 != v9)
    -[UINavigationButton _updateStyle](self, "_updateStyle");
LABEL_7:

}

- (UIColor)_tintColor
{
  return -[_UIBarButtonItemAppearanceStorage tintColor](self->_appearanceStorage, "tintColor");
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v8;
  _UIBarButtonItemAppearanceStorage *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (v6)
  {
    if (!appearanceStorage)
    {
      v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_diagnostics())
  {
    if (a4 >= 3)
    {
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v20 = 134217984;
        v21 = a4;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted and UIControlStateDisabled. state = %ld is interpreted as UIControlStateHighlighted.", (uint8_t *)&v20, 0xCu);
      }

    }
  }
  else if (a4 >= 3)
  {
    v18 = _UIAppearance_setTitleTextAttributes_forState____s_category;
    if (!_UIAppearance_setTitleTextAttributes_forState____s_category)
    {
      v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&_UIAppearance_setTitleTextAttributes_forState____s_category);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = 134217984;
      v21 = a4;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted and UIControlStateDisabled. state = %ld is interpreted as UIControlStateHighlighted.", (uint8_t *)&v20, 0xCu);
    }
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v11 = 1;
  else
    v11 = a4;
  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v10 | v12 && (objc_msgSend((id)v10, "isEqualToDictionary:", v12) & 1) == 0)
  {
    -[_UIBarItemAppearanceStorage setTextAttributes:forState:](self->_appearanceStorage, "setTextAttributes:forState:", v10, v11);
    if (!v11)
    {
      v13 = *(_QWORD *)off_1E1678D90;
      objc_msgSend((id)v10, "objectForKey:", *(_QWORD *)off_1E1678D90);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "objectForKey:", v13);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 | v15)
      {
        if ((objc_msgSend((id)v14, "isEqual:", v15) & 1) == 0)
        {
          -[UIView sizeToFit](self, "sizeToFit");
          WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
          objc_msgSend(WeakRetained, "setNeedsLayout");

        }
      }

    }
    -[UINavigationButton _updateStyle](self, "_updateStyle");
  }

}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  unint64_t v5;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    if (a3 >= 3)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v10 = 134217984;
        v11 = a3;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted and UIControlStateDisabled. state = %ld is interpreted as UIControlStateHighlighted.", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  else if (a3 >= 3)
  {
    v8 = _titleTextAttributesForState____s_category;
    if (!_titleTextAttributesForState____s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_titleTextAttributesForState____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted and UIControlStateDisabled. state = %ld is interpreted as UIControlStateHighlighted.", (uint8_t *)&v10, 0xCu);
    }
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v5 = 1;
  else
    v5 = a3;
  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v9;
  _UIBarButtonItemAppearanceStorage *v10;
  double v11;
  id WeakRetained;

  appearanceStorage = self->_appearanceStorage;
  if (a3 != 0.0 || appearanceStorage != 0)
  {
    if (!appearanceStorage)
    {
      v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", a4);
    if (v11 != a3)
    {
      -[_UIBarButtonItemAppearanceStorage setBackgroundVerticalAdjustment:forBarMetrics:](self->_appearanceStorage, "setBackgroundVerticalAdjustment:forBarMetrics:", a4, a3);
      WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
      objc_msgSend(WeakRetained, "setNeedsLayout");

    }
  }
}

- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3
{
  double result;

  -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", a3);
  return result;
}

- (BOOL)_hasBaselineAlignedAbsoluteVerticalPosition:(double *)a3 withinNavBar:(id)a4 forSize:(CGSize)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double MaxY;
  double v12;
  double v13;
  void *v14;
  double Height;
  double v16;
  double v17;
  CGRect v19;
  CGRect v20;

  v7 = a4;
  -[UINavigationButton title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "_currentVisualStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    -[UIButton titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    MaxY = CGRectGetMaxY(v19);
    objc_msgSend(v10, "_baselineOffsetFromBottom");
    v13 = v12;
    objc_msgSend(v7, "_contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    Height = CGRectGetHeight(v20);
    objc_msgSend(v9, "navigationItemBaselineOffset");
    v17 = v16;

    if (a3)
      *a3 = Height - v17 - (MaxY - v13);

  }
  return v8 != 0;
}

- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  double vertical;
  double horizontal;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v9;
  _UIBarButtonItemAppearanceStorage *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _UIBarButtonItemAppearanceStorage *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  if ((unint64_t)(a4 - 101) <= 1)
  {
    if ((_UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn & 1) == 0)
    {
      _UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3.horizontal, a3.vertical, "UIBarButtonItem", CFSTR("button title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return;
  }
  vertical = a3.vertical;
  horizontal = a3.horizontal;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    if (a3.horizontal == 0.0 && a3.vertical == 0.0)
      return;
    v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    v10 = self->_appearanceStorage;
    self->_appearanceStorage = v9;

    appearanceStorage = self->_appearanceStorage;
  }
  if (a4 == 1)
    -[_UIBarButtonItemAppearanceStorage miniTitlePositionOffset](appearanceStorage, "miniTitlePositionOffset");
  else
    -[_UIBarButtonItemAppearanceStorage titlePositionOffset](appearanceStorage, "titlePositionOffset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "UIOffsetValue");
  }
  else
  {
    v13 = 0.0;
    v14 = 0.0;
  }
  if (horizontal != v13 || vertical != v14)
  {
    v15 = self->_appearanceStorage;
    if (a4 == 1)
    {
      *(double *)v18 = horizontal;
      *(double *)&v18[1] = vertical;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v18, "{UIOffset=dd}");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBarButtonItemAppearanceStorage setMiniTitlePositionOffset:](v15, "setMiniTitlePositionOffset:", v16);
    }
    else
    {
      *(double *)v17 = horizontal;
      *(double *)&v17[1] = vertical;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v17, "{UIOffset=dd}");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBarButtonItemAppearanceStorage setTitlePositionOffset:](v15, "setTitlePositionOffset:", v16);
    }

    -[UINavigationButton _updateStyle](self, "_updateStyle");
  }

}

- (UIOffset)_titlePositionAdjustmentForBarMetrics:(int64_t)a3
{
  double v3;
  double v4;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIOffset result;

  if ((unint64_t)(a3 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (a3 == 1)
      -[_UIBarButtonItemAppearanceStorage miniTitlePositionOffset](appearanceStorage, "miniTitlePositionOffset");
    else
      -[_UIBarButtonItemAppearanceStorage titlePositionOffset](appearanceStorage, "titlePositionOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "UIOffsetValue");
      v3 = v8;
      v4 = v9;
    }
    else
    {
      v3 = 0.0;
      v4 = 0.0;
    }

  }
  else
  {
    v3 = 0.0;
    if ((_titlePositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      _titlePositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, "UIBarButtonItem", CFSTR("button title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    v4 = 0.0;
  }
  v10 = v3;
  v11 = v4;
  result.vertical = v11;
  result.horizontal = v10;
  return result;
}

- (void)_applyBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (v6)
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, v6, (void *)1);
  if (v22)
  {
    v7 = -[UINavigationButton _barButtonItemStyle](self, "_barButtonItemStyle");
    objc_msgSend(v22, "backgroundImageForState:style:isMini:", 0, v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backgroundImageForState:style:isMini:", 1, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backgroundImageForState:style:isMini:", 2, v7, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backgroundImageForState:style:isMini:", 0, v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backgroundImageForState:style:isMini:", 1, v7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backgroundImageForState:style:isMini:", 2, v7, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textAttributesForState:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textAttributesForState:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)v8;
    if (!v6)
    {
      TagAttributeForAxes(self, v8, sel_setBackgroundImage_forState_barMetrics_, 0, 0);
      TagAttributeForAxes(self, (uint64_t)v9, sel_setBackgroundImage_forState_barMetrics_, 1, 0);
      TagAttributeForAxes(self, (uint64_t)v20, sel_setBackgroundImage_forState_barMetrics_, 2, 0);
      TagAttributeForAxes(self, (uint64_t)v10, sel_setBackgroundImage_forState_barMetrics_, 0, 1);
      TagAttributeForAxes(self, (uint64_t)v11, sel_setBackgroundImage_forState_barMetrics_, 1, 1);
      TagAttributeForAxes(self, (uint64_t)v12, sel_setBackgroundImage_forState_barMetrics_, 2, 1);
      TagAttributeForAxes(self, (uint64_t)v13, sel_setTitleTextAttributes_forState_, 0, -1);
      TagAttributeForAxes(self, (uint64_t)v14, sel_setTitleTextAttributes_forState_, 1, -1);
    }
    -[UINavigationButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", v8, 0, v7, 0);
    -[UINavigationButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", v9, 1, v7, 0);
    -[UINavigationButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", v20, 2, v7, 0);
    -[UINavigationButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", v10, 0, v7, 1);
    -[UINavigationButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", v11, 1, v7, 1);
    -[UINavigationButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", v12, 2, v7, 1);
    -[UINavigationButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", v13, 0);
    -[UINavigationButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", v14, 1);
    objc_msgSend(v22, "textAttributesForState:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", v15, 2);

    objc_msgSend(v22, "tintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationButton _setTintColor:](self, "_setTintColor:", v16);

    objc_msgSend(v22, "titlePositionOffset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "UIOffsetValue");
      -[UINavigationButton _setTitlePositionAdjustment:forBarMetrics:](self, "_setTitlePositionAdjustment:forBarMetrics:", 0);
    }
    objc_msgSend(v22, "miniTitlePositionOffset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "UIOffsetValue");
      -[UINavigationButton _setTitlePositionAdjustment:forBarMetrics:](self, "_setTitlePositionAdjustment:forBarMetrics:", 1);
    }
    objc_msgSend(v22, "backgroundVerticalAdjustmentForBarMetrics:", 0);
    -[UINavigationButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 0);
    objc_msgSend(v22, "backgroundVerticalAdjustmentForBarMetrics:", 1);
    -[UINavigationButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 1);
    objc_msgSend(v22, "backgroundVerticalAdjustmentForBarMetrics:", 101);
    -[UINavigationButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 101);
    objc_msgSend(v22, "backgroundVerticalAdjustmentForBarMetrics:", 102);
    -[UINavigationButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 102);

  }
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (void)_setGroupName:(id)a3 forNavigationBar:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[UIButton _contentBackdropView](self, "_contentBackdropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p-%@"), v6, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setGroupName:", v9);

  }
  else
  {
    objc_msgSend(v7, "_setGroupName:", 0);
  }

}

- (int64_t)_activeBarMetrics
{
  return (*((_BYTE *)self + 816) & 3) == 1;
}

- (id)_visualStyleForMetrics:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (qword_1ECD7B838 != -1)
    dispatch_once(&qword_1ECD7B838, &__block_literal_global_53);
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == -1)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "userInterfaceIdiom");

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (a3 << 8) + 16 * v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_21_1, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[_UINavigationBarVisualStyle visualStyleForIdiom:](_UINavigationBarVisualStyle, "visualStyleForIdiom:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMetrics:", a3);
    objc_msgSend((id)_MergedGlobals_21_1, "setObject:forKeyedSubscript:", v9, v8);
  }

  return v9;
}

void __45__UINavigationButton__visualStyleForMetrics___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_21_1;
  _MergedGlobals_21_1 = v0;

}

- (int64_t)_externalDrawingStyleForState:(unint64_t)a3
{
  if (((a3 == 8) & -[UINavigationButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton")) != 0)
    return 2;
  else
    return 0;
}

- (id)_activeVisualStyle
{
  return -[UINavigationButton _visualStyleForMetrics:](self, "_visualStyleForMetrics:", -[UINavigationButton _activeBarMetrics](self, "_activeBarMetrics"));
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  UINavigationButton *v2;
  void *v3;

  v2 = self;
  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "controlCanBecomeFocused:", v2);

  return (char)v2;
}

- (BOOL)_isExternalRoundedRectButton
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 3;

  return v3;
}

- (id)_externalUnfocusedBorderColor
{
  return +[UIColor _externalBarBackgroundColor](UIColor, "_externalBarBackgroundColor");
}

- (void)_uinavigationbar_prepareToAppearInNavigationItem:(id)a3 onLeft:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;

  v4 = a4;
  -[UINavigationButton setOriginatingNavigationItem:](self, "setOriginatingNavigationItem:", a3);
  if (-[NSSet count](self->_possibleTitles, "count") || -[NSSet count](self->_possibleSystemItems, "count"))
  {
    if (-[UINavigationButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes"))
    {
      v6 = 0;
    }
    else if (((*((_DWORD *)&self->super.super.super._viewFlags + 4) >> 19) & 1) != v4)
    {
      v6 = 1;
    }
    else
    {
      v6 = 2;
    }
    -[UIButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", v6);
  }
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UINavigationButton;
  -[UIControl setPointerInteractionEnabled:](&v7, sel_setPointerInteractionEnabled_);
  -[UIButton pointerStyleProvider](self, "pointerStyleProvider");
  v5 = objc_claimAutoreleasedReturnValue();
  if (a3 && v5 == 0)
    v6 = &__block_literal_global_59;
  else
    v6 = (void *)v5;
  -[UIButton setPointerStyleProvider:](self, "setPointerStyleProvider:", v6);

}

id __51__UINavigationButton_setPointerInteractionEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v34;
  void *v35;

  v4 = a3;
  v5 = a2;
  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBarSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "preview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "target");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "container");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v19, v10, v12, v14, v16);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  objc_msgSend(v7, "buttonMinimumHeight");
  v29 = v28;
  if (objc_msgSend(v7, "useGenerousPadding"))
    objc_msgSend(v7, "buttonGenerousPadding");
  else
    objc_msgSend(v7, "buttonTightPadding");
  v31 = (v29 - v27) * 0.5;
  if (v27 >= v29)
    v31 = 0.0;
  v32 = v23 - v31;
  if (v27 >= v29)
    v33 = v27;
  else
    v33 = v29;
  +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v21 - v30, v32, v25 + v30 + v30, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v4, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (int64_t)_buttonItemStyle
{
  return self->_buttonItemStyle;
}

- (void)_setButtonItemStyle:(int64_t)a3
{
  self->_buttonItemStyle = a3;
}

- (NSDictionary)_stylesForSizingTitles
{
  return self->_stylesForSizingTitles;
}

- (void)_setStylesForSizingTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 856);
}

- (BOOL)_createdByBarButtonItem
{
  return self->_createdByBarButtonItem;
}

- (void)_setCreatedByBarButtonItem:(BOOL)a3
{
  self->_createdByBarButtonItem = a3;
}

- (BOOL)_isFontScaleInvalid
{
  return self->_isFontScaleInvalid;
}

- (void)_setFontScaleInvalid:(BOOL)a3
{
  self->_isFontScaleInvalid = a3;
}

- (double)_fontScaleAdjustment
{
  return self->_fontScaleAdjustment;
}

- (BOOL)_wantsBlendModeForAccessibilityBackgrounds
{
  return self->_wantsBlendModeForAccessibilityBackgrounds;
}

- (UIColor)_accessibilityBackgroundTintColor
{
  return self->_accessibilityBackgroundTintColor;
}

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (void)_setAppearanceGuideClass:(Class)a3
{
  objc_storeStrong((id *)&self->_appearanceGuideClass, a3);
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__additionalSelectionInsets.top;
  left = self->__additionalSelectionInsets.left;
  bottom = self->__additionalSelectionInsets.bottom;
  right = self->__additionalSelectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3
{
  self->__additionalSelectionInsets = a3;
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (int)style
{
  return self->_style;
}

- (UIView)_enclosingBar
{
  return (UIView *)objc_loadWeakRetained((id *)&self->__enclosingBar);
}

- (void)_setEnclosingBar:(id)a3
{
  objc_storeWeak((id *)&self->__enclosingBar, a3);
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (UINavigationItem)originatingNavigationItem
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->_originatingNavigationItem);
}

- (void)setOriginatingNavigationItem:(id)a3
{
  objc_storeWeak((id *)&self->_originatingNavigationItem, a3);
}

- (UIBarButtonItem)originatingButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_originatingButtonItem);
}

- (void)setOriginatingButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_originatingButtonItem, a3);
}

- (BOOL)_barItemHidden
{
  return self->__barItemHidden;
}

- (void)_setBarItemHidden:(BOOL)a3
{
  self->__barItemHidden = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__enclosingBar);
  objc_storeStrong((id *)&self->_appearanceGuideClass, 0);
  objc_storeStrong((id *)&self->_accessibilityBackgroundTintColor, 0);
  objc_storeStrong((id *)&self->_stylesForSizingTitles, 0);
  objc_destroyWeak((id *)&self->_originatingNavigationItem);
  objc_destroyWeak((id *)&self->_originatingButtonItem);
  objc_storeStrong((id *)&self->_possibleSystemItems, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
}

@end
