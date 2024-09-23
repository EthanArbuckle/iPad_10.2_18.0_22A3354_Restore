@implementation UITabBarButtonLabel

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contents")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarButtonLabel;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

uint64_t __53__UITabBarButtonLabel__updateForFontChangeWithIdiom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITabBarButtonLabel;
  -[UILabel traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (dyld_program_sdk_at_least())
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (!self->_hasSeenIdiom || v6 != objc_msgSend(v4, "userInterfaceIdiom"))
    {
      self->_hasSeenIdiom = 1;
      -[UITabBarButtonLabel _updateForFontChangeWithIdiom:](self, "_updateForFontChangeWithIdiom:", -[UITabBarButtonLabel _idiomForFontGivenIdiom:](self, "_idiomForFontGivenIdiom:", v6));
    }
  }
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "legibilityWeight");
  v9 = objc_msgSend(v4, "legibilityWeight");

  if (v8 != v9)
    self->_boundsWidth = 0.0;

}

- (BOOL)_shouldCeilSizeToViewScale
{
  return 1;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITabBarButtonLabel;
  -[UILabel _didChangeFromIdiom:onScreen:traverseHierarchy:](&v7, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIView _screen](self, "_screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarButtonLabel _updateForFontChangeWithIdiom:](self, "_updateForFontChangeWithIdiom:", -[UITabBarButtonLabel _idiomForFontGivenIdiom:](self, "_idiomForFontGivenIdiom:", objc_msgSend(v6, "_userInterfaceIdiom")));

  }
}

- (int64_t)_idiomForFontGivenIdiom:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  objc_msgSend(WeakRetained, "tabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_tabBarSizing");

  if (v6)
    return v6 != 1;
  else
    return a3;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    -[UITabBarButtonLabel updateTextColorsForState](self, "updateTextColorsForState");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_isHighlighted != a3)
  {
    self->_isHighlighted = a3;
    -[UITabBarButtonLabel updateTextColorsForState](self, "updateTextColorsForState");
  }
}

- (void)_legacyApperance_updateTextColorsForState
{
  UITabBarButton **p_tabBarButton;
  UITabBarButtonLabel *v4;
  void *v5;
  int v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  UITabBarButtonLabel *v11;
  void *v12;
  UIColor *unselectedTintColor;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  UIColor *v26;
  UIColor *v27;
  _BOOL4 v28;
  _UITabBarItemAppearanceStorage *appearanceStorage;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  UIColor *v38;
  id v39;
  int v40;
  void *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  double v45;
  double v46;
  BOOL v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id WeakRetained;

  p_tabBarButton = &self->_tabBarButton;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  objc_msgSend(WeakRetained, "tabBar");
  v4 = (UITabBarButtonLabel *)objc_claimAutoreleasedReturnValue();
  -[UITabBarButtonLabel _effectiveUnselectedTabTintColorConsideringView:](v4, "_effectiveUnselectedTabTintColorConsideringView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(WeakRetained, "isFocused");
  v7 = objc_loadWeakRetained((id *)p_tabBarButton);
  if ((objc_msgSend(v7, "isDefaultTVLayout") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", *(_QWORD *)off_1E1678D98);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 != 0;

  }
  if (-[UITabBarButtonLabel _useVibrantItems](v4, "_useVibrantItems"))
    v11 = v4;
  else
    v11 = self;
  -[UIView tintColor](v11, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  unselectedTintColor = self->_unselectedTintColor;
  if (unselectedTintColor && !self->_isSelected)
  {
    v27 = unselectedTintColor;
    v28 = 1;
    goto LABEL_47;
  }
  if (self->_isHighlighted && self->_isSelected)
  {
    -[UIView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (v15 == 3)
    {
      -[_UIBarItemAppearanceStorage textAttributeForKey:state:](self->_appearanceStorage, "textAttributeForKey:state:", *(_QWORD *)off_1E1678D98, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
LABEL_33:
        v27 = v16;
LABEL_41:

        v28 = 0;
        goto LABEL_47;
      }
      objc_msgSend(WeakRetained, "_contentTintColorForState:", 5);
      v36 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v36;
      if (v36)
        v35 = (void *)v36;
      else
        v35 = v12;
LABEL_40:
      v27 = v35;

      goto LABEL_41;
    }
  }
  if ((v6 & v8) == 1)
  {
    v18 = objc_loadWeakRetained((id *)p_tabBarButton);
    v19 = objc_msgSend(v18, "isDefaultTVLayout");

    if (v19)
    {
      v20 = objc_loadWeakRetained((id *)p_tabBarButton);
      objc_msgSend(v20, "defaultColorForState:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        -[UIView tintColor](self, "tintColor");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v23;

      v12 = v32;
    }
    -[_UIBarItemAppearanceStorage textAttributeForKey:state:](self->_appearanceStorage, "textAttributeForKey:state:", *(_QWORD *)off_1E1678D98, 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      goto LABEL_33;
    objc_msgSend(WeakRetained, "_contentTintColorForState:", 8);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
      v35 = (void *)v33;
    else
      v35 = v12;
    goto LABEL_40;
  }
  if (self->_isHighlighted)
  {
    -[_UIBarItemAppearanceStorage textAttributeForKey:state:](self->_appearanceStorage, "textAttributeForKey:state:", *(_QWORD *)off_1E1678D98, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      objc_msgSend(WeakRetained, "_contentTintColorForState:", 1);
      v26 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;
    goto LABEL_28;
  }
  appearanceStorage = self->_appearanceStorage;
  v30 = *(_QWORD *)off_1E1678D98;
  if (self->_isSelected)
  {
    -[_UIBarItemAppearanceStorage textAttributeForKey:state:](appearanceStorage, "textAttributeForKey:state:", v30, 4);
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v27 = (UIColor *)v31;
      v28 = 1;
    }
    else
    {
      objc_msgSend(WeakRetained, "_contentTintColorForState:", 4);
      v38 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v28 = v38 != 0;
      if (!v38)
      {
        v38 = v12;
        v12 = v38;
        v28 = 0;
      }
      v27 = v38;
    }
  }
  else
  {
    -[_UIBarItemAppearanceStorage textAttributeForKey:state:](appearanceStorage, "textAttributeForKey:state:", v30, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    v28 = v37 != 0;
    if (!v37)
    {
      objc_msgSend(WeakRetained, "_defaultUnselectedLabelTintColor");
      v52 = objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v27 = (UIColor *)v52;
        goto LABEL_29;
      }
      objc_msgSend(WeakRetained, "_contentTintColorForState:", 0);
      v53 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v53;
      if (v53)
        v54 = (void *)v53;
      else
        v54 = v5;
      v27 = v54;
LABEL_28:

LABEL_29:
      v28 = 0;
      goto LABEL_47;
    }
    v27 = (UIColor *)v37;
  }
LABEL_47:
  v39 = objc_loadWeakRetained((id *)p_tabBarButton);
  v40 = objc_msgSend(v39, "isDefaultTVLayout");

  if (v40)
  {
    -[UIView traitCollection](v4, "traitCollection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "userInterfaceStyle");

    if (_AXSEnhanceBackgroundContrastEnabled())
      v43 = 1;
    else
      v43 = v6;
    if ((v43 & 1) != 0)
    {
      v44 = 0;
      v45 = 1.0;
    }
    else
    {
      if (objc_msgSend(WeakRetained, "_isSelected"))
      {
        v44 = 0;
        v46 = 0.86;
        if (v42 == 2)
          v46 = 0.5;
        v47 = !v28;
      }
      else
      {
        v48 = 23;
        if (v42 == 2)
          v48 = 24;
        v47 = !v28;
        if (v28)
          v44 = 0;
        else
          v44 = v48;
        v46 = 0.5;
      }
      if (v47)
        v45 = v46;
      else
        v45 = 1.0;
    }
    -[UIView setCompositingMode:](self, "setCompositingMode:", v44);
    -[UIView setAlpha:](self, "setAlpha:", v45);
  }
  -[UILabel setTextColor:](self, "setTextColor:", v27);
  -[_UIBarItemAppearanceStorage textAttributeForKey:state:](self->_appearanceStorage, "textAttributeForKey:state:", *(_QWORD *)off_1E1679048, 4 * self->_isSelected);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
  {
    objc_msgSend(v49, "shadowColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](self, "setShadowColor:", v51);

    objc_msgSend(v50, "shadowOffset");
    -[UILabel setShadowOffset:](self, "setShadowOffset:");
  }
  if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    -[UIView forceDisplayIfNeeded](self, "forceDisplayIfNeeded");

}

- (void)resizeToFitWidth:(double)a3
{
  double v4;
  double boundsWidth;
  NSAttributedString *previousAttributedTextForSizingExcludingKern;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  BOOL v13;
  float v14;
  NSNumber *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSNumber *previousKernAttributeForSizing;
  uint64_t v24;
  uint64_t v25;
  NSNumber *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSNumber *v33;
  double v34;
  double v35;
  NSNumber *v36;
  NSAttributedString *v37;
  NSAttributedString *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3 + -2.0;
  boundsWidth = self->_boundsWidth;
  previousAttributedTextForSizingExcludingKern = self->_previousAttributedTextForSizingExcludingKern;
  -[UILabel attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length")
    && (objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678E60, 0, 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "doubleValue"),
        v10 = v9,
        v8,
        v10 < 0.0))
  {
    -[UITabBarButtonLabel _mutableAttributedTextExcludingKern](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
  }
  else
  {
    v11 = (void *)objc_msgSend(v7, "mutableCopy");
    v12 = 0;
  }
  v13 = v4 != boundsWidth || previousAttributedTextForSizingExcludingKern == 0;
  if (v13
    || !objc_msgSend(v11, "isEqualToAttributedString:", self->_previousAttributedTextForSizingExcludingKern))
  {
    if (v4 != boundsWidth)
      -[UIView sizeToFit](self, "sizeToFit");
    self->_boundsWidth = v4;
    -[UIView frame](self, "frame");
    if (((v22 < v4) & ~v12) != 0)
    {
      previousKernAttributeForSizing = self->_previousKernAttributeForSizing;
      self->_previousKernAttributeForSizing = 0;
    }
    else
    {
      v39 = v21;
      v40 = v20;
      v41 = v19;
      previousKernAttributeForSizing = (NSNumber *)objc_msgSend(v7, "mutableCopy");
      v24 = -[NSNumber length](previousKernAttributeForSizing, "length");
      v25 = *(_QWORD *)off_1E1678E60;
      v26 = (NSNumber *)&unk_1E1A95620;
      -[NSNumber addAttribute:value:range:](previousKernAttributeForSizing, "addAttribute:value:range:", *(_QWORD *)off_1E1678E60, &unk_1E1A95620, 0, v24);
      -[NSNumber boundingRectWithSize:options:context:](previousKernAttributeForSizing, "boundingRectWithSize:options:context:", 0, 0, 3.40282347e38, 3.40282347e38);
      v28 = v27;
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v30 = v29;
      if (ceil(v29 * v28) / v29 < v4)
      {
        v42 = v4;
        v31 = 0.0;
        v32 = 1.2;
        do
        {
          v33 = v26;
          v34 = (v32 + v31) * 0.5;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v34);
          v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();

          -[NSNumber addAttribute:value:range:](previousKernAttributeForSizing, "addAttribute:value:range:", v25, v26, 0, v24);
          -[NSNumber boundingRectWithSize:options:context:](previousKernAttributeForSizing, "boundingRectWithSize:options:context:", 0, 0, 3.40282347e38, 3.40282347e38);
          v28 = ceil(v30 * v35) / v30;
          if (v28 <= v42)
          {
            if (v28 >= v42)
              break;
          }
          else
          {
            v31 = (v32 + v31) * 0.5;
            v34 = v32;
          }
          v32 = v34;
        }
        while (v34 - v31 >= 0.01875);
      }
      -[UILabel setAttributedText:](self, "setAttributedText:", previousKernAttributeForSizing);
      -[UILabel setFrame:](self, "setFrame:", v41, v40, v28, v39);
      v36 = self->_previousKernAttributeForSizing;
      self->_previousKernAttributeForSizing = v26;

    }
    -[UITabBarButtonLabel _mutableAttributedTextExcludingKern](self);
    v37 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v38 = self->_previousAttributedTextForSizingExcludingKern;
    self->_previousAttributedTextForSizingExcludingKern = v37;

  }
  else
  {
    -[NSNumber floatValue](self->_previousKernAttributeForSizing, "floatValue");
    if (fabsf(v14) >= 2.2204e-16)
    {
      v15 = self->_previousKernAttributeForSizing;
      v43 = *(_QWORD *)off_1E1678E60;
      v44[0] = v15;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v11;
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAttributes:range:", v18, 0, objc_msgSend(v17, "length"));

      -[UILabel setAttributedText:](self, "setAttributedText:", v17);
    }
  }

}

- (void)setTabBarButton:(id)a3
{
  objc_storeWeak((id *)&self->_tabBarButton, a3);
}

- (void)_updateForFontChangeWithIdiom:(int64_t)a3
{
  void *v4;
  _QWORD v5[5];

  -[UITabBarButtonLabel _fontForIdiom:](self, "_fontForIdiom:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self, "setFont:", v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__UITabBarButtonLabel__updateForFontChangeWithIdiom___block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
}

- (UITabBarButtonLabel)initWithFrame:(CGRect)a3
{
  UITabBarButtonLabel *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITabBarButtonLabel;
  v3 = -[UILabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarButtonLabel _fontForIdiom:](v3, "_fontForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3, "setFont:", v5);

  }
  return v3;
}

- (id)_fontForIdiom:(int64_t)a3 forTabBarDisplayStyle:(int64_t)a4
{
  UITabBarButton **p_tabBarButton;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  const UIFontTextStyle *v29;
  double v30;
  double v31;
  int v32;
  double *v33;

  p_tabBarButton = &self->_tabBarButton;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  objc_msgSend(WeakRetained, "itemAppearanceData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)p_tabBarButton);
    v11 = objc_msgSend(v10, "_currentItemState");

    v12 = objc_loadWeakRetained((id *)p_tabBarButton);
    objc_msgSend(v12, "titleTextAttributesForState:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *(_QWORD *)off_1E1678D90);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *(_QWORD *)off_1E1678D90);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v14)
  {
    if (a3 != 8)
    {
      if (a3 == 3)
      {
        -[UIView traitCollection](self, "traitCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = off_1E167A828;
        v23 = CFSTR("UICTFontTextStyleEmphasizedCaption2");
      }
      else
      {
        if (a3 == 2)
          goto LABEL_10;
        v24 = objc_loadWeakRetained((id *)p_tabBarButton);
        v25 = objc_msgSend(v24, "layoutStyle");

        if (!v25)
        {
          +[UITabBarButtonLabel _fontPointSizeForIdiom:](UITabBarButtonLabel, "_fontPointSizeForIdiom:", a3);
          v31 = v30;
          v32 = dyld_program_sdk_at_least();
          v33 = (double *)off_1E167DC68;
          if (!v32)
            v33 = (double *)off_1E167DC70;
          objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", v31, *v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          return v14;
        }
        -[UIView traitCollection](self, "traitCollection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_traitCollectionByReplacingObject:forTraitToken:", CFSTR("UICTContentSizeCategoryL"), 0x1E1A99540);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_loadWeakRetained((id *)p_tabBarButton);
        v28 = objc_msgSend(v27, "layoutStyle");

        v22 = off_1E167A828;
        v29 = &UIFontTextStyleFootnote;
        if (v28 == 2)
          v29 = &UIFontTextStyleCaption1;
        v23 = (const __CFString *)*v29;
      }
      objc_msgSend(v22, "preferredFontForTextStyle:compatibleWithTraitCollection:", v23, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
    }
LABEL_10:
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 29.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained((id *)p_tabBarButton);
    objc_msgSend(v18, "tabBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      a4 = objc_msgSend(v19, "_displayStyle");
    if (!a4)
    {
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
    }

    return v14;
  }
  objc_msgSend(v14, "pointSize");
  if (v15 == 0.0)
  {
    +[UITabBarButtonLabel _fontPointSizeForIdiom:](UITabBarButtonLabel, "_fontPointSizeForIdiom:", a3);
    objc_msgSend(v14, "fontWithSize:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
  return v14;
}

+ (double)_fontPointSizeForIdiom:(int64_t)a3
{
  double result;
  int v4;

  if (a3 == 8 || a3 == 2)
    return 40.0;
  result = 10.0;
  if (a3 == 1)
  {
    v4 = dyld_program_sdk_at_least();
    result = 14.0;
    if (v4)
      return 10.0;
  }
  return result;
}

- (id)_fontForIdiom:(int64_t)a3
{
  return -[UITabBarButtonLabel _fontForIdiom:forTabBarDisplayStyle:](self, "_fontForIdiom:forTabBarDisplayStyle:", a3, 0);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITabBarButtonLabel;
  -[UILabel tintColorDidChange](&v3, sel_tintColorDidChange);
  -[UITabBarButtonLabel updateTextColorsForState](self, "updateTextColorsForState");
}

- (void)updateTextColorsForState
{
  UITabBarButton **p_tabBarButton;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  p_tabBarButton = &self->_tabBarButton;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  objc_msgSend(WeakRetained, "itemAppearanceData");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_7;
  }
  v6 = (void *)v5;
  v7 = objc_loadWeakRetained((id *)p_tabBarButton);
  v8 = objc_msgSend(v7, "layoutStyle");

  if (v8 == 3)
  {
LABEL_7:
    -[UITabBarButtonLabel _legacyApperance_updateTextColorsForState](self, "_legacyApperance_updateTextColorsForState");
    return;
  }
  -[UILabel text](self, "text");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    v9 = objc_loadWeakRetained((id *)p_tabBarButton);
    v10 = objc_msgSend(v9, "_currentItemState");

    v11 = objc_loadWeakRetained((id *)p_tabBarButton);
    objc_msgSend(v11, "defaultColorForState:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[UILabel setTextColor:](self, "setTextColor:", v12);
    }
    else
    {
      v13 = objc_loadWeakRetained((id *)p_tabBarButton);
      objc_msgSend(v13, "tintColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self, "setTextColor:", v14);

    }
    v15 = objc_loadWeakRetained((id *)p_tabBarButton);
    objc_msgSend(v15, "titleTextAttributesForState:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v18, v16);
    -[UILabel setAttributedText:](self, "setAttributedText:", v17);

  }
}

- (void)_setAppearanceGuideClass:(Class)a3
{
  objc_storeStrong((id *)&self->_appearanceGuideClass, a3);
}

- (id)_mutableAttributedTextExcludingKern
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "attributedText");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
      v3 = v1;
    else
      v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
    v4 = v3;

    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1678E60, 0, objc_msgSend(v4, "length"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBarButton);
  objc_storeStrong((id *)&self->_unselectedTintColor, 0);
  objc_storeStrong((id *)&self->_appearanceGuideClass, 0);
  objc_storeStrong((id *)&self->_previousAttributedTextForSizingExcludingKern, 0);
  objc_storeStrong((id *)&self->_previousKernAttributeForSizing, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
}

- (UITabBarButtonLabel)initWithTabBarDisplayStyle:(int64_t)a3
{
  UITabBarButtonLabel *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITabBarButtonLabel;
  v4 = -[UIView init](&v8, sel_init);
  if (v4)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarButtonLabel _fontForIdiom:forTabBarDisplayStyle:](v4, "_fontForIdiom:forTabBarDisplayStyle:", objc_msgSend(v5, "userInterfaceIdiom"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v6);

  }
  return v4;
}

- (void)setUnselectedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedTintColor, a3);
  -[UITabBarButtonLabel _updateLabelsVibrancy](self, "_updateLabelsVibrancy");
  -[UITabBarButtonLabel updateTextColorsForState](self, "updateTextColorsForState");
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6;
  _UITabBarItemAppearanceStorage *appearanceStorage;
  _UITabBarItemAppearanceStorage *v8;
  _UITabBarItemAppearanceStorage *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;

  v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (v6)
  {
    if (!appearanceStorage)
    {
      v8 = objc_alloc_init(_UITabBarItemAppearanceStorage);
      v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
  v18 = objc_claimAutoreleasedReturnValue();

  v10 = _checkControlStateArgumentAdjustIfNecessary(a4);
  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v18 | v11)
  {
    if ((objc_msgSend((id)v18, "isEqualToDictionary:", v11) & 1) == 0)
    {
      -[_UIBarItemAppearanceStorage setTextAttributes:forState:](self->_appearanceStorage, "setTextAttributes:forState:", v18, v10);
      -[UITabBarButtonLabel updateTextColorsForState](self, "updateTextColorsForState");
      -[UILabel setNeedsDisplay](self, "setNeedsDisplay");
      if (!v10)
      {
        objc_msgSend((id)v18, "objectForKey:", *(_QWORD *)off_1E1678D90);
        v12 = objc_claimAutoreleasedReturnValue();
        -[UILabel font](self, "font");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v12 | v13 && (objc_msgSend((id)v12, "isEqual:", v13) & 1) == 0)
        {
          -[UIView _screen](self, "_screen");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITabBarButtonLabel _updateForFontChangeWithIdiom:](self, "_updateForFontChangeWithIdiom:", objc_msgSend(v14, "_userInterfaceIdiom"));

        }
        -[UITabBarButtonLabel _updateLabelsVibrancy](self, "_updateLabelsVibrancy");
        -[UIView _screen](self, "_screen");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "_userInterfaceIdiom");

        if (v16 == 3)
          v17 = 0.9;
        else
          v17 = 0.0;
        -[UILabel setAdjustsFontSizeToFitWidth:](self, "setAdjustsFontSizeToFitWidth:", v16 == 3);
        -[UILabel setMinimumScaleFactor:](self, "setMinimumScaleFactor:", v17);

      }
    }
  }

}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  return -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", _checkControlStateArgumentAdjustIfNecessary(a3));
}

- (void)_applyTabBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  v6 = a4;
  if (v6)
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, v6, (void *)1);
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__UITabBarButtonLabel__applyTabBarButtonAppearanceStorage_withTaggedSelectors___block_invoke;
    v8[3] = &unk_1E16B73A8;
    v8[4] = self;
    objc_msgSend(v7, "enumerateTextAttributesWithBlock:", v8);
  }

}

uint64_t __79__UITabBarButtonLabel__applyTabBarButtonAppearanceStorage_withTaggedSelectors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTitleTextAttributes:forState:", a3, a2);
}

- (UIColor)unselectedTintColor
{
  return self->_unselectedTintColor;
}

- (UITabBarButton)tabBarButton
{
  return (UITabBarButton *)objc_loadWeakRetained((id *)&self->_tabBarButton);
}

@end
