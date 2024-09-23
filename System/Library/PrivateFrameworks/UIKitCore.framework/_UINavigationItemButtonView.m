@implementation _UINavigationItemButtonView

- (_UINavigationItemButtonView)initWithNavigationItem:(id)a3
{
  _UINavigationItemButtonView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationItemButtonView;
  v3 = -[_UINavigationItemView initWithNavigationItem:](&v5, sel_initWithNavigationItem_, a3);
  if (v3)
    -[UILabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:](v3->super._label, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", dyld_program_sdk_at_least());
  return v3;
}

- (void)_resetRenderingModesForAccessibilityBackgrounds
{
  UIImageView *backgroundImageView;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  id WeakRetained;

  backgroundImageView = self->_backgroundImageView;
  if (backgroundImageView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
    objc_msgSend(WeakRetained, "_navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_barStyle");
    v6 = -[_UINavigationItemButtonView _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");
    v7 = -[_UINavigationItemButtonView _wantsBlendModeForAccessibilityBackgrounds](self, "_wantsBlendModeForAccessibilityBackgrounds");
    -[_UINavigationItemButtonView _accessibilityBackgroundTintColor](self, "_accessibilityBackgroundTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UINavigationButton _resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:](UINavigationButton, "_resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:", backgroundImageView, v5, 1, v6, v7, v8);

  }
}

- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0 && self->_wantsBlendModeForAccessibilityBackgrounds != v3)
  {
    self->_wantsBlendModeForAccessibilityBackgrounds = v3;
    -[_UINavigationItemButtonView _resetRenderingModesForAccessibilityBackgrounds](self, "_resetRenderingModesForAccessibilityBackgrounds");
  }
}

- (void)_setAccessibilityBackgroundTintColor:(id)a3
{
  char v5;
  UIColor *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = dyld_program_sdk_at_least();
  v6 = v7;
  if ((v5 & 1) == 0 && self->_accessibilityBackgroundTintColor != v7)
  {
    objc_storeStrong((id *)&self->_accessibilityBackgroundTintColor, a3);
    -[_UINavigationItemButtonView _resetRenderingModesForAccessibilityBackgrounds](self, "_resetRenderingModesForAccessibilityBackgrounds");
    v6 = v7;
  }

}

- (BOOL)_showsAccessibilityBackgroundWhenEnabled
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 0;
  -[_UIBarButtonItemAppearanceStorage anyBackButtonBackgroundImage](self->_appearanceStorage, "anyBackButtonBackgroundImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 0;
  }
  else if (self->_imageView)
  {
    v3 = 1;
  }
  else
  {
    -[_UINavigationItemButtonView title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "length") != 0;

  }
  return v3;
}

- (BOOL)_wantsAccessibilityButtonShapes
{
  int v3;

  v3 = -[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self);
  if (v3)
    LOBYTE(v3) = -[_UINavigationItemButtonView _showsAccessibilityBackgroundWhenEnabled](self, "_showsAccessibilityBackgroundWhenEnabled");
  return v3;
}

- (BOOL)_suppressesBackIndicatorView
{
  void *v3;
  BOOL v4;

  -[_UIBarButtonItemAppearanceStorage anyBackButtonBackgroundImage](self->_appearanceStorage, "anyBackButtonBackgroundImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = -[_UINavigationItemButtonView _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");

  return v4;
}

- (_UINavigationItemButtonView)initWithFrame:(CGRect)a3
{
  _UINavigationItemButtonView *v3;
  _UINavigationItemButtonView *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationItemButtonView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_abbreviatedTitleIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__accessibilityButtonShapesDidChangeNotification_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    -[UIView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  }
  return v4;
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  if (-[_UINavigationItemButtonView _showsAccessibilityBackgroundWhenEnabled](self, "_showsAccessibilityBackgroundWhenEnabled"))
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationItemButtonView;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v9, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  -[UIView _screen](self, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_userInterfaceIdiom");

  if (v8 != a3 && (a3 == 3 || v8 == 3))
    -[_UINavigationItemButtonView _accessibilityButtonShapesParametersDidChange](self, "_accessibilityButtonShapesParametersDidChange");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationItemButtonView;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  -[_UINavigationItemView _updateLabelColor](self, "_updateLabelColor");
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (BOOL)_useSilverLookForBarStyle:(int64_t)a3
{
  return 0;
}

- (id)_currentTextColorForBarStyle:(int64_t)a3
{
  void *v4;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;

  if ((unint64_t)(a3 - 1) > 1
    || !-[_UINavigationItemButtonView _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes"))
  {
    appearanceStorage = self->_appearanceStorage;
    if (self->_pressed)
    {
      v6 = 1;
    }
    else if (-[UIView isFocused](self, "isFocused"))
    {
      v6 = 8;
    }
    else
    {
      v6 = 0;
    }
    -[_UIBarItemAppearanceStorage textAttributesForState:](appearanceStorage, "textAttributesForState:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1678D98);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
    }
    else
    {
      if (!-[UIView isFocused](self, "isFocused"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
        objc_msgSend(WeakRetained, "navigationBar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "buttonItemTextColor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      +[UIColor _externalBarBackgroundColor](UIColor, "_externalBarBackgroundColor");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v9;
LABEL_15:

    return v4;
  }
  +[UIColor whiteColor](UIColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_currentTextShadowColorForBarStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;

  -[_UIBarItemAppearanceStorage textAttributeForKey:state:](self->_appearanceStorage, "textAttributeForKey:state:", *(_QWORD *)off_1E1679048, self->_pressed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shadowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
    objc_msgSend(WeakRetained, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buttonItemShadowColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[_UIBarItemAppearanceStorage textAttributeForKey:state:](self->_appearanceStorage, "textAttributeForKey:state:", *(_QWORD *)off_1E1679048, self->_pressed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "shadowOffset");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v8 = -1.0;
    v6 = 0.0;
  }

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_currentCustomBackgroundNeedsDarkening:(BOOL *)a3
{
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isMinibar");
  if (a3)
    *a3 = 0;
  -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
    {
      -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", 0, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (id)v9;
      if (self->_pressed)
      {
        -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", 1, v9 != 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9)
          v13 = (void *)v9;
        else
          v13 = v8;
        v11 = v13;
      }
      v14 = v11;
      if (v11)
      {
        v15 = v11;

      }
      else
      {
        if (v10)
          v16 = v10;
        else
          v16 = v8;
        v15 = v16;

        if (a3)
          *a3 = 1;
      }

      v8 = v15;
LABEL_22:

      goto LABEL_23;
    }
    if (self->_pressed)
    {
      -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v10 = v12;

        v8 = v10;
      }
      else
      {
        v10 = 0;
        if (a3)
          *a3 = 1;
      }
      goto LABEL_22;
    }
  }
LABEL_23:

  return v8;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v2;
  void *v3;
  double v4;
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
  UIEdgeInsets result;

  -[_UINavigationItemButtonView _currentCustomBackgroundNeedsDarkening:](self, "_currentCustomBackgroundNeedsDarkening:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "alignmentRectInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = 0.0;
    v7 = 0.0;
    v9 = 0.0;
    v11 = 0.0;
  }

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
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
  double v30;
  double v31;
  CGSize result;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_currentVisualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationItemButtonView image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isMinibar");
  -[UIImageView image](self->_backgroundImageView, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_11;
  if (-[_UINavigationItemButtonView _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes"))
  {
    _UINavigationButtonAccessibilityBackground(1, v10);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = (void *)v12;
    goto LABEL_10;
  }
  -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v13 = 0;
  else
    v13 = v10;
  if (v13 == 1)
  {
    -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", 0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  if (v11)
  {
LABEL_11:
    objc_msgSend(v11, "capInsets");
    v15 = v14;
    v17 = v16;
    goto LABEL_12;
  }
  v17 = 0.0;
  v15 = 0.0;
LABEL_12:
  if (v9)
  {
    objc_msgSend(v8, "leftBackImageMargin");
    v19 = fmax(v15, v18);
    objc_msgSend(v8, "rightImageMargin");
  }
  else
  {
    objc_msgSend(v8, "leftBackTitleMarginForCustomBackButtonBackground:", v11);
    v19 = v21;
    objc_msgSend(v8, "rightTitleMargin");
  }
  v22 = fmax(v17, v20);
  objc_msgSend(WeakRetained, "_fontScaleAdjustment");
  if (!v9 && v23 != 0.0)
  {
    objc_msgSend(v8, "backButtonIndicatorSpacing");
    objc_msgSend(v8, "backButtonIndicatorSpacing");
    UIFloorToViewScale(self);
    v19 = v24;
    UIRoundToViewScale(self);
    v22 = v25;
LABEL_20:
    v28 = width - v19 - v22;
    v26 = v22 + v19;
    -[UILabel sizeThatFits:](self->super._label, "sizeThatFits:", v28, 0.0);
    goto LABEL_21;
  }
  if (!v9)
    goto LABEL_20;
  v26 = v19 + v22;
  -[_UINavigationItemButtonView imageSize](self, "imageSize");
LABEL_21:
  v29 = v26 + v27;

  v30 = v29;
  v31 = height;
  result.height = v31;
  result.width = v30;
  return result;
}

- (double)_titleYAdjustmentCustomization
{
  return 0.0;
}

- (id)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)layoutSubviews
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  int v14;
  UIImageView *backgroundImageView;
  UIImageView *v16;
  UIImageView *v17;
  UIImageView *v18;
  void *v19;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
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
  UIImageView *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  UIImageView *v46;
  UIImageView *imageView;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
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
  BOOL v69;
  double v70;
  double v71;
  double v72;
  double v73;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  id v87;
  char v88;
  objc_super v89;

  v89.receiver = self;
  v89.super_class = (Class)_UINavigationItemButtonView;
  -[_UINavigationItemView _updateLabelContents](&v89, sel__updateLabelContents);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  objc_msgSend(WeakRetained, "_navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_currentVisualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationItemButtonView image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isMinibar");
  v12 = -[_UINavigationItemButtonView _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");
  if (v12)
    _UINavigationButtonAccessibilityBackground(1, v11);
  else
    -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v11;
  if (v13)
    v14 = 0;
  else
    v14 = v11;
  if (v14 == 1)
  {
    -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  backgroundImageView = self->_backgroundImageView;
  if (v13)
  {
    v86 = v10;
    v87 = WeakRetained;
    if (!backgroundImageView)
    {
      v16 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v13);
      v17 = self->_backgroundImageView;
      self->_backgroundImageView = v16;

      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundImageView, 0);
      backgroundImageView = self->_backgroundImageView;
    }
    -[UIView bounds](self, "bounds");
    -[UIImageView setFrame:](backgroundImageView, "setFrame:");
    v18 = self->_backgroundImageView;
    v19 = v8;
    v20 = objc_msgSend(v8, "_barStyle");
    v21 = -[_UINavigationItemButtonView _wantsBlendModeForAccessibilityBackgrounds](self, "_wantsBlendModeForAccessibilityBackgrounds");
    -[_UINavigationItemButtonView _accessibilityBackgroundTintColor](self, "_accessibilityBackgroundTintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[UINavigationButton _resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:](UINavigationButton, "_resetRenderingModesForBackgroundImageView:inBarStyle:isEnabled:withAccessibilityBackground:wantsBlendModeForAccessibilityBackgrounds:accessibilityBackgroundTintColor:", v18, v20, 1, v12, v21, v22);

    objc_msgSend(v13, "alignmentRectInsets");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    objc_msgSend(v13, "capInsets");
    v32 = v31;
    v34 = v33;
    v10 = v86;
    WeakRetained = v87;
  }
  else
  {
    v30 = 0.0;
    v19 = v8;
    if (backgroundImageView)
    {
      -[UIView removeFromSuperview](self->_backgroundImageView, "removeFromSuperview");
      v35 = self->_backgroundImageView;
      self->_backgroundImageView = 0;

    }
    v28 = 0.0;
    v26 = 0.0;
    v24 = 0.0;
    v32 = 0.0;
    v34 = 0.0;
  }
  if (v10)
  {
    objc_msgSend(v9, "leftBackImageMargin");
    v37 = fmax(v26, fmax(v32, v36));
    v38 = fmax(v30, v34);
    objc_msgSend(v9, "rightImageMargin");
  }
  else
  {
    objc_msgSend(v9, "leftBackTitleMarginForCustomBackButtonBackground:", v13);
    v37 = fmax(v26, v40);
    v38 = fmax(v30, v34);
    objc_msgSend(v9, "rightTitleMargin");
  }
  v41 = v19;
  v42 = fmax(v38, v39);
  objc_msgSend(WeakRetained, "_fontScaleAdjustment");
  if (!v10 && v43 != 0.0)
  {
    objc_msgSend(v9, "backButtonIndicatorSpacing");
    objc_msgSend(v9, "backButtonIndicatorSpacing");
    UIFloorToViewScale(self);
    v37 = v44;
    UIRoundToViewScale(self);
    v42 = v45;
LABEL_26:
    -[_UINavigationItemButtonView title](self, "title");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v57, "isEqualToString:", &stru_1E16EDF20) & 1) == 0)
    {
      -[_UINavigationItemView _titleSize](self, "_titleSize");
      v59 = v58;
      -[_UINavigationItemView _labelFrame](self, "_labelFrame");
      v63 = v62;
      v65 = v64;
      if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
        v66 = v42;
      else
        v66 = v37;
      v67 = v60 + v66;
      v68 = v61 - (v42 + v37);
      v69 = round(v59) < v68;
      v70 = v67 + floor((v68 - v59) * 0.5);
      v71 = v68 - floor(v68 - v59);
      if (v69)
        v72 = v70;
      else
        v72 = v67;
      if (v69)
        v73 = v71;
      else
        v73 = v68;
      appearanceStorage = self->_appearanceStorage;
      if ((v88 & 1) != 0)
        -[_UIBarButtonItemAppearanceStorage miniBackButtonTitlePositionOffset](appearanceStorage, "miniBackButtonTitlePositionOffset");
      else
        -[_UIBarButtonItemAppearanceStorage backButtonTitlePositionOffset](appearanceStorage, "backButtonTitlePositionOffset");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v19;
      v77 = v75;
      if (v75)
      {
        objc_msgSend(v75, "UIOffsetValue");
        if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
          v78 = -v78;
        v72 = v72 + v78;
        v63 = v63 + v79;
      }
      -[UIView window](self, "window");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "screen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "scale");
      v83 = v82;

      if (v83 == 0.0)
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "scale");
        v83 = v85;

      }
      v41 = v76;
      -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
      -[UIView addSubview:](self, "addSubview:", self->super._label);
      -[UILabel setFrame:](self->super._label, "setFrame:", v72, round(v63 * v83) / v83, v73, v65);

    }
    goto LABEL_47;
  }
  if (!v10)
    goto LABEL_26;
  if (!self->_imageView)
  {
    v46 = objc_alloc_init(UIImageView);
    imageView = self->_imageView;
    self->_imageView = v46;

  }
  objc_msgSend(v9, "topImageMargin");
  v49 = v24 + v48;
  v50 = v5 - (v37 + v42);
  objc_msgSend(v9, "topImageMargin");
  v52 = v51;
  objc_msgSend(v9, "bottomImageMargin");
  v54 = v7 - (v28 + v24 + v52 + v53);
  -[_UINavigationItemButtonView imageSize](self, "imageSize");
  -[UIImageView setFrame:](self->_imageView, "setFrame:", round(v37 + (v50 - v55) * 0.5), round(v49 + (v54 - v56) * 0.5), v55);
  -[UIImageView setImage:](self->_imageView, "setImage:", v10);
  -[UIView removeFromSuperview](self->super._label, "removeFromSuperview");
  -[UIView addSubview:](self, "addSubview:", self->_imageView);
LABEL_47:

}

- (id)title
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  v4 = WeakRetained;
  if (self->_abbreviatedTitleIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(WeakRetained, "backBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v4, "backButtonTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(v4, "title");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          _UINSLocalizedStringWithDefaultValue(CFSTR("Back"), CFSTR("Back"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "_abbreviatedBackButtonTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", self->_abbreviatedTitleIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)image
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  objc_msgSend(WeakRetained, "backBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)imageSize
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_currentVisualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultBackButtonAlignmentHeight");
  v7 = v6;
  objc_msgSend(v5, "topImageMargin");
  v9 = v7 - v8;
  objc_msgSend(v5, "bottomImageMargin");
  v11 = v9 - v10;
  -[_UINavigationItemButtonView image](self, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  if (v16 <= v11)
    v11 = v16;
  else
    v14 = ceil(v14 * (v11 / v16));

  v17 = v14;
  v18 = v11;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  UIView *v6;
  UIView *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  UIView *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  UIView *v20;
  _QWORD v21[4];
  UIView *v22;
  CGRect v23;

  if (self->_style != a3)
  {
    if (a4)
    {
      -[UIView bounds](self, "bounds");
      if (!CGRectIsEmpty(v23))
      {
        +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
        v6 = [UIView alloc];
        -[UIView bounds](self, "bounds");
        v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
        -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
        -[UIView bounds](self, "bounds");
        _UIGraphicsBeginImageContextWithOptions(0, 0, v8, v9, 0.0);
        -[UIView bounds](self, "bounds");
        -[UIView drawRect:](self, "drawRect:");
        _UIGraphicsGetImageFromCurrentImageContext(0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        v11 = objc_retainAutorelease(v10);
        v12 = objc_msgSend(v11, "CGImage");
        -[UIView layer](v7, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setContents:", v12);

        -[UIView addSubview:](self, "addSubview:", v7);
        +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
        v14 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __49___UINavigationItemButtonView_setStyle_animated___block_invoke;
        v21[3] = &unk_1E16B1B28;
        v22 = v7;
        v16 = v14;
        v17 = 3221225472;
        v18 = __49___UINavigationItemButtonView_setStyle_animated___block_invoke_2;
        v19 = &unk_1E16B3FD8;
        v20 = v22;
        v15 = v22;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v21, &v16, 0.2, 0.0);

      }
    }
    self->_style = a3;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay", v16, v17, v18, v19);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStyle:(int64_t)a3
{
  -[_UINavigationItemButtonView setStyle:animated:](self, "setStyle:animated:", a3, 0);
}

- (void)setPressed:(BOOL)a3
{
  -[_UINavigationItemButtonView setPressed:initialPress:](self, "setPressed:initialPress:", a3, 1);
}

- (void)setPressed:(BOOL)a3 initialPress:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_pressed != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_pressed = a3;
    v8[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton _setVisuallyHighlighted:forViews:initialPress:](UIButton, "_setVisuallyHighlighted:forViews:initialPress:", v5, v7, v4);

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (id)_defaultFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;

  -[_UINavigationItemView navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_currentVisualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UINavigationItemView navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_fontScaleAdjustment");
  v8 = v7;

  if (v8 == 0.0)
    v8 = 1.0;
  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)off_1E1678D90);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "pointSize");
  if (v13 == 0.0)
  {
    objc_msgSend(v5, "buttonFontSize");
    objc_msgSend(v11, "fontWithSize:", v8 * v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v11;
  }
  v16 = v15;
  if (!v15)
  {
    +[UINavigationButton defaultFont](UINavigationButton, "defaultFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    if (v8 < 1.0)
    {
      objc_msgSend(v17, "pointSize");
      objc_msgSend(v16, "fontWithSize:", v8 * v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v19;
    }
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationItemButtonView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)_UIAppearance_setTintColor:(id)a3
{
  unint64_t v4;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v6;
  _UIBarButtonItemAppearanceStorage *v7;
  id v8;

  v4 = (unint64_t)a3;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    v8 = (id)v4;
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UIBarButtonItemAppearanceStorage setTintColor:](appearanceStorage, "setTintColor:", v8);
    v4 = (unint64_t)v8;
  }

}

- (UIColor)_tintColor
{
  return -[_UIBarButtonItemAppearanceStorage tintColor](self->_appearanceStorage, "tintColor");
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  unint64_t v6;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v8;
  _UIBarButtonItemAppearanceStorage *v9;
  _UIBarButtonItemAppearanceStorage *v10;
  id v11;

  v6 = (unint64_t)a3;
  appearanceStorage = self->_appearanceStorage;
  if (v6 | (unint64_t)appearanceStorage)
  {
    v8 = (void *)v6;
    if (!appearanceStorage)
    {
      v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;

    }
    objc_msgSend(v8, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIBarItemAppearanceStorage setTextAttributes:forState:](self->_appearanceStorage, "setTextAttributes:forState:", v11, a4);
  }
}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  return -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", a3);
}

- (BOOL)customBackgroundImageChangedToOrFromNil
{
  return self->_customBackgroundImageChangedToOrFromNil;
}

- (void)backIndicatorViewHasRespondedToCustomBackgroundImageChange
{
  self->_customBackgroundImageChangedToOrFromNil = 0;
}

- (BOOL)hasCustomBackgroundImage
{
  void *v2;
  BOOL v3;

  -[_UIBarButtonItemAppearanceStorage anyBackButtonBackgroundImage](self->_appearanceStorage, "anyBackButtonBackgroundImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_UIAppearance_setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  unint64_t v8;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v10;
  _UIBarButtonItemAppearanceStorage *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  id WeakRetained;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  id v21;

  v8 = (unint64_t)a3;
  if ((unint64_t)(a5 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (v8 | (unint64_t)appearanceStorage)
    {
      v21 = (id)v8;
      if (!appearanceStorage)
      {
        v10 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
        v11 = self->_appearanceStorage;
        self->_appearanceStorage = v10;

      }
      v12 = v21;
      if (v21)
      {
        v13 = v12;
        if ((objc_msgSend(v12, "_isResizable") & 1) == 0)
        {
          objc_msgSend(v12, "size");
          v15 = floor(v14 * 0.5);
          objc_msgSend(v12, "resizableImageWithCapInsets:", 0.0, v15, 0.0, v14 - v15 + -1.0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v13 = 0;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
      objc_msgSend(WeakRetained, "_navigationBar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a4)
      {
        if (v17)
        {
          if ((a5 != 1) != objc_msgSend(v17, "isMinibar"))
          {
            -[_UINavigationItemButtonView _backButtonBackgroundImageForState:barMetrics:](self, "_backButtonBackgroundImageForState:barMetrics:", 0, a5);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13 != v18)
              objc_msgSend(v17, "setNeedsLayout");
          }
        }
      }
      v19 = a5 == 1;
      -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", a4, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBarButtonItemAppearanceStorage setBackButtonBackgroundImage:forState:isMini:](self->_appearanceStorage, "setBackButtonBackgroundImage:forState:isMini:", v13, a4, v19);
      if (!v21 && v20 || v12 && !v20)
      {
        self->_customBackgroundImageChangedToOrFromNil = 1;
        objc_msgSend(v17, "_updateBackIndicatorImage");
      }

      goto LABEL_22;
    }
  }
  else if ((_UIAppearance_setBackButtonBackgroundImage_forState_barMetrics__didWarn & 1) == 0)
  {
    _UIAppearance_setBackButtonBackgroundImage_forState_barMetrics__didWarn = 1;
    v21 = (id)v8;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UIBarButtonItem", CFSTR("back button background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
LABEL_22:
    v8 = (unint64_t)v21;
  }

}

- (id)_backButtonBackgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) > 1)
  {
    -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", a3, a4 == 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((_backButtonBackgroundImageForState_barMetrics__didWarn & 1) == 0)
    {
      _backButtonBackgroundImageForState_barMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3, "UIBarButtonItem", CFSTR("back button background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return 0;
  }
}

- (void)_UIAppearance_setBackButtonBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v9;
  _UIBarButtonItemAppearanceStorage *v10;
  double v11;
  void *v12;
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
    -[_UIBarButtonItemAppearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:](appearanceStorage, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", a4);
    if (v11 != a3)
    {
      -[_UIBarButtonItemAppearanceStorage setBackButtonBackgroundVerticalAdjustment:forBarMetrics:](self->_appearanceStorage, "setBackButtonBackgroundVerticalAdjustment:forBarMetrics:", a4, a3);
      WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
      objc_msgSend(WeakRetained, "_navigationBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsLayout");

    }
  }
}

- (double)_backButtonBackgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3
{
  double result;

  -[_UIBarButtonItemAppearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", a3);
  return result;
}

- (void)_UIAppearance_setBackButtonTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
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
    if ((_UIAppearance_setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn & 1) == 0)
    {
      _UIAppearance_setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3.horizontal, a3.vertical, "UIBarButtonItem", CFSTR("back button title adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
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
      -[_UIBarButtonItemAppearanceStorage setMiniBackButtonTitlePositionOffset:](v15, "setMiniBackButtonTitlePositionOffset:", v16);
    }
    else
    {
      *(double *)v17 = horizontal;
      *(double *)&v17[1] = vertical;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v17, "{UIOffset=dd}");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBarButtonItemAppearanceStorage setBackButtonTitlePositionOffset:](v15, "setBackButtonTitlePositionOffset:", v16);
    }

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIOffset)_backButtonTitlePositionAdjustmentForBarMetrics:(int64_t)a3
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
      -[_UIBarButtonItemAppearanceStorage miniBackButtonTitlePositionOffset](appearanceStorage, "miniBackButtonTitlePositionOffset");
    else
      -[_UIBarButtonItemAppearanceStorage backButtonTitlePositionOffset](appearanceStorage, "backButtonTitlePositionOffset");
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
    if ((_backButtonTitlePositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      _backButtonTitlePositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, "UIBarButtonItem", CFSTR("back button title adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (v6)
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, v6, (void *)1);
  if (v18)
  {
    objc_msgSend(v18, "backButtonBackgroundImageForState:isMini:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backButtonBackgroundImageForState:isMini:", 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backButtonBackgroundImageForState:isMini:", 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backButtonBackgroundImageForState:isMini:", 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textAttributesForState:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textAttributesForState:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      TagAttributeForAxes(self, (uint64_t)v7, sel_setBackButtonBackgroundImage_forState_barMetrics_, 0, 0);
      TagAttributeForAxes(self, (uint64_t)v8, sel_setBackButtonBackgroundImage_forState_barMetrics_, 1, 0);
      TagAttributeForAxes(self, (uint64_t)v9, sel_setBackButtonBackgroundImage_forState_barMetrics_, 0, 1);
      TagAttributeForAxes(self, (uint64_t)v10, sel_setBackButtonBackgroundImage_forState_barMetrics_, 1, 1);
      TagAttributeForAxes(self, (uint64_t)v11, sel_setTitleTextAttributes_forState_, 0, -1);
      TagAttributeForAxes(self, (uint64_t)v12, sel_setTitleTextAttributes_forState_, 1, -1);
    }
    -[_UINavigationItemButtonView _setBackButtonBackgroundImage:forState:barMetrics:](self, "_setBackButtonBackgroundImage:forState:barMetrics:", v7, 0, 0);
    -[_UINavigationItemButtonView _setBackButtonBackgroundImage:forState:barMetrics:](self, "_setBackButtonBackgroundImage:forState:barMetrics:", v8, 1, 0);
    -[_UINavigationItemButtonView _setBackButtonBackgroundImage:forState:barMetrics:](self, "_setBackButtonBackgroundImage:forState:barMetrics:", v9, 0, 1);
    -[_UINavigationItemButtonView _setBackButtonBackgroundImage:forState:barMetrics:](self, "_setBackButtonBackgroundImage:forState:barMetrics:", v10, 1, 1);
    -[_UINavigationItemButtonView _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", v11, 0);
    -[_UINavigationItemButtonView _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", v12, 1);
    objc_msgSend(v18, "textAttributesForState:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationItemButtonView _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", v13, 2);

    objc_msgSend(v18, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationItemButtonView _setTintColor:](self, "_setTintColor:", v14);

    objc_msgSend(v18, "backButtonTitlePositionOffset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "UIOffsetValue");
      -[_UINavigationItemButtonView _setBackButtonTitlePositionAdjustment:forBarMetrics:](self, "_setBackButtonTitlePositionAdjustment:forBarMetrics:", 0);
    }
    objc_msgSend(v18, "miniBackButtonTitlePositionOffset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "UIOffsetValue");
      -[_UINavigationItemButtonView _setBackButtonTitlePositionAdjustment:forBarMetrics:](self, "_setBackButtonTitlePositionAdjustment:forBarMetrics:", 1);
    }
    objc_msgSend(v18, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", 0);
    -[_UINavigationItemButtonView _setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:", 0);
    objc_msgSend(v18, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", 1);
    -[_UINavigationItemButtonView _setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:", 1);
    objc_msgSend(v18, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", 101);
    -[_UINavigationItemButtonView _setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:", 101);
    objc_msgSend(v18, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", 102);
    -[_UINavigationItemButtonView _setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:", 102);
    -[UIView _updateNeedsDisplayOnBoundsChange](self);

  }
}

- (Class)_appearanceGuideClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  _UINavigationItemButtonView *v7;
  _UINavigationItemButtonView *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UINavigationItemButtonView;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v12, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (_UINavigationItemButtonView *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    -[UIView tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v9);

    goto LABEL_5;
  }
  objc_msgSend(v6, "previouslyFocusedItem");
  v8 = (_UINavigationItemButtonView *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", 0);
LABEL_5:
    -[_UINavigationItemView navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_updateBackIndicatorImage");

  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationItemButtonView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[_UINavigationItemButtonView _updateBackSelectGestureRecognizer](self, "_updateBackSelectGestureRecognizer");
}

- (void)_updateBackSelectGestureRecognizer
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 3)
  {
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    -[_UINavigationItemButtonView _installBackSelectGestureRecognizer](self, "_installBackSelectGestureRecognizer");
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 4.5;
  }
  else
  {
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    -[_UINavigationItemButtonView _uninstallBackSelectGestureRecognizer](self, "_uninstallBackSelectGestureRecognizer");
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
  }
  v7 = v5;
  objc_msgSend(v5, "setCornerRadius:", v6);

}

- (void)_installBackSelectGestureRecognizer
{
  void *v3;
  UITapGestureRecognizer *value;

  objc_getAssociatedObject(self, &_buttonViewBackSelectGestureRecognizerKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    value = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__backSelectGestureChanged_);
    -[UIGestureRecognizer setCancelsTouchesInView:](value, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelegate:](value, "setDelegate:", self);
    -[UITapGestureRecognizer setAllowedPressTypes:](value, "setAllowedPressTypes:", &unk_1E1A92BB8);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", value);
    objc_setAssociatedObject(self, &_buttonViewBackSelectGestureRecognizerKey, value, (void *)1);
    v3 = value;
  }

}

- (void)_uninstallBackSelectGestureRecognizer
{
  void *v3;
  void *v4;

  objc_getAssociatedObject(self, &_buttonViewBackSelectGestureRecognizerKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", v3);
    objc_setAssociatedObject(self, &_buttonViewBackSelectGestureRecognizerKey, 0, (void *)1);
    v3 = v4;
  }

}

- (void)_backSelectGestureChanged:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v10;
  id v11;
  CGRect v12;
  CGRect v13;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[UIView bounds](self, "bounds");
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    height = v12.size.height;
    MidX = CGRectGetMidX(v12);
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    MidY = CGRectGetMidY(v13);
    -[_UINavigationItemView navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_navigationBar");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "convertPoint:fromView:", self, MidX, MidY);
    objc_msgSend(v11, "popForCarplayPressAtFakePoint:");

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char isKindOfClass;
  BOOL v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom") != 3)
  {

    goto LABEL_5;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)_UINavigationItemButtonView;
    v10 = -[UIView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (unint64_t)_abbreviatedTitleIndex
{
  return self->_abbreviatedTitleIndex;
}

- (void)_setAbbreviatedTitleIndex:(unint64_t)a3
{
  self->_abbreviatedTitleIndex = a3;
}

- (BOOL)_wantsBlendModeForAccessibilityBackgrounds
{
  return self->_wantsBlendModeForAccessibilityBackgrounds;
}

- (UIColor)_accessibilityBackgroundTintColor
{
  return self->_accessibilityBackgroundTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityBackgroundTintColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
}

@end
