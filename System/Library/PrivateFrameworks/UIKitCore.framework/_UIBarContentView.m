@implementation _UIBarContentView

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 10;
}

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (BOOL)centerTextButtons
{
  return self->_centerTextButtons;
}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  return -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", a3);
}

- (_UIBarButtonItemAppearanceStorage)appearanceStorage
{
  return self->_appearanceStorage;
}

- (double)absorptionForItem:(id)a3
{
  return 0.0;
}

- (double)defaultTextPadding
{
  return 0.0;
}

- (_UIBarContentView)initWithFrame:(CGRect)a3
{
  _UIBarContentView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBarContentView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
    -[_UIBarContentView _setAppearanceGuideClass:](v3, "_setAppearanceGuideClass:", objc_opt_class());
  return v3;
}

- (void)_setAppearanceGuideClass:(Class)a3
{
  objc_storeStrong((id *)&self->_appearanceGuideClass, a3);
}

- (UIImage)backIndicatorMaskImage
{
  return self->_backIndicatorMaskImage;
}

- (void)setCenterTextButtons:(BOOL)a3
{
  self->_centerTextButtons = a3;
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
    -[_UIBarContentView _appearanceChanged](self, "_appearanceChanged");
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backIndicatorMaskImage, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_appearanceGuideClass, 0);
}

- (int64_t)barType
{
  return 0;
}

- (BOOL)compactMetrics
{
  return 0;
}

- (unint64_t)edgesPaddingBarButtonItem:(id)a3
{
  return 15;
}

- (double)defaultEdgeSpacing
{
  return 0.0;
}

- (double)backButtonMargin
{
  return 0.0;
}

- (double)backButtonMaximumWidth
{
  return 0.0;
}

- (void)_appearanceChanged
{
  id v2;

  -[UIView superview](self, "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  -[_UIBarContentView _UIAppearance_setBackgroundImage:forState:style:barMetrics:](self, "_UIAppearance_setBackgroundImage:forState:style:barMetrics:", a3, a4, 8, a5);
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
  id v19;
  id v20;

  v10 = a3;
  if ((unint64_t)(a6 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (v10)
    {
      v20 = v10;
      if (!appearanceStorage)
      {
        v12 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
        v13 = self->_appearanceStorage;
        self->_appearanceStorage = v12;

        v10 = v20;
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
        goto LABEL_20;
      v20 = 0;
      v14 = 0;
    }
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a4 != 4)
      a4 = 1;
    -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](self->_appearanceStorage, "backgroundImageForState:style:isMini:", a4, a5, a6 == 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 != v14)
    {
      -[_UIBarButtonItemAppearanceStorage setBackgroundImage:forState:style:isMini:](self->_appearanceStorage, "setBackgroundImage:forState:style:isMini:", v14, a4, a5, a6 == 1);
      -[_UIBarContentView _appearanceChanged](self, "_appearanceChanged");
    }

    goto LABEL_19;
  }
  if ((_UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn_1 & 1) == 0)
  {
    _UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn_1 = 1;
    v20 = v10;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UIBarButtonItem", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
LABEL_19:
    v10 = v20;
  }
LABEL_20:

}

- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v9;
  _UIBarButtonItemAppearanceStorage *v10;
  double v11;

  if ((unint64_t)(a4 - 101) > 1)
  {
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
        -[_UIBarContentView _appearanceChanged](self, "_appearanceChanged");
      }
    }
  }
  else if ((_UIAppearance_setBackgroundVerticalPositionAdjustment_forBarMetrics__didWarn_0 & 1) == 0)
  {
    _UIAppearance_setBackgroundVerticalPositionAdjustment_forBarMetrics__didWarn_0 = 1;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3, "UIBarButtonItem", CFSTR("toolbar button background vertical position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
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
    if ((_UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn_1 & 1) == 0)
    {
      _UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn_1 = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3.horizontal, a3.vertical, "UIBarButtonItem", CFSTR("title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
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

    -[_UIBarContentView _appearanceChanged](self, "_appearanceChanged");
  }

}

- (void)_UIAppearance_setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  unint64_t v8;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v10;
  _UIBarButtonItemAppearanceStorage *v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;

  v8 = (unint64_t)a3;
  if ((unint64_t)(a5 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (v8 | (unint64_t)appearanceStorage)
    {
      v17 = (id)v8;
      if (!appearanceStorage)
      {
        v10 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
        v11 = self->_appearanceStorage;
        self->_appearanceStorage = v10;

      }
      v12 = v17;
      if (v17)
      {
        if ((objc_msgSend(v12, "_isResizable") & 1) == 0)
        {
          objc_msgSend(v12, "size");
          v14 = floor(v13 * 0.5);
          objc_msgSend(v12, "resizableImageWithCapInsets:", 0.0, v14, 0.0, v13 - v14 + -1.0);
          v15 = objc_claimAutoreleasedReturnValue();

          v12 = (id)v15;
        }
      }
      else
      {
        v12 = 0;
      }
      -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", a4, a5 == 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 != v16)
      {
        -[_UIBarButtonItemAppearanceStorage setBackButtonBackgroundImage:forState:isMini:](self->_appearanceStorage, "setBackButtonBackgroundImage:forState:isMini:", v12, a4, a5 == 1);
        -[_UIBarContentView _appearanceChanged](self, "_appearanceChanged");
      }

      goto LABEL_14;
    }
  }
  else if ((_UIAppearance_setBackButtonBackgroundImage_forState_barMetrics__didWarn_0 & 1) == 0)
  {
    _UIAppearance_setBackButtonBackgroundImage_forState_barMetrics__didWarn_0 = 1;
    v17 = (id)v8;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UIBarButtonItem", CFSTR("back button background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
LABEL_14:
    v8 = (unint64_t)v17;
  }

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
    if ((_UIAppearance_setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn_0 & 1) == 0)
    {
      _UIAppearance_setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn_0 = 1;
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

    -[_UIBarContentView _appearanceChanged](self, "_appearanceChanged");
  }

}

- (void)_UIAppearance_setBackButtonBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v9;
  _UIBarButtonItemAppearanceStorage *v10;
  double v11;

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
      -[_UIBarContentView _appearanceChanged](self, "_appearanceChanged");
    }
  }
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v8;
  _UIBarButtonItemAppearanceStorage *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

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
  v14 = objc_claimAutoreleasedReturnValue();

  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", a4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v14 | v10 && (objc_msgSend((id)v14, "isEqualToDictionary:", v10) & 1) == 0)
  {
    -[_UIBarItemAppearanceStorage setTextAttributes:forState:](self->_appearanceStorage, "setTextAttributes:forState:", v14, a4);
    v11 = *(_QWORD *)off_1E1678D90;
    objc_msgSend((id)v14, "objectForKey:", *(_QWORD *)off_1E1678D90);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "objectForKey:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 | v13)
    {
      if ((objc_msgSend((id)v12, "isEqual:", v13) & 1) == 0)
        -[_UIBarContentView _appearanceChanged](self, "_appearanceChanged");
    }

  }
}

- (UIImage)backIndicatorImage
{
  return 0;
}

- (void)setBackIndicatorMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_backIndicatorMaskImage, a3);
}

@end
