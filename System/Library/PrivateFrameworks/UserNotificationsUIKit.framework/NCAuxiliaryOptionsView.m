@implementation NCAuxiliaryOptionsView

- (NCAuxiliaryOptionsView)init
{
  NCAuxiliaryOptionsView *v2;
  NCAuxiliaryOptionsView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCAuxiliaryOptionsView;
  v2 = -[NCAuxiliaryOptionsView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NCAuxiliaryOptionsView _setDefaultAttributes](v2, "_setDefaultAttributes");
  return v3;
}

- (NCAuxiliaryOptionsView)initWithFrame:(CGRect)a3
{
  NCAuxiliaryOptionsView *v3;
  NCAuxiliaryOptionsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCAuxiliaryOptionsView;
  v3 = -[NCAuxiliaryOptionsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NCAuxiliaryOptionsView _setDefaultAttributes](v3, "_setDefaultAttributes");
  return v4;
}

- (BSUIFontProvider)fontProvider
{
  BSUIFontProvider *v3;
  BSUIFontProvider *fontProvider;

  if (!self->_fontProvider)
  {
    if (-[NCAuxiliaryOptionsView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
      objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    else
      objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;

  }
  return self->_fontProvider;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v6;
  double v7;
  NSArray *auxiliaryOptionButtons;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGSize result;

  width = a3.width;
  v33 = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  if (a3.width > 0.0)
  {
    if (self->_optionsSummaryLabel)
    {
      BSRectWithSize();
      -[NCAuxiliaryOptionsView _optionsSummaryWidthForBounds:](self, "_optionsSummaryWidthForBounds:");
      -[UILabel unui_measuringHeightWithNumberOfLines:](self->_optionsSummaryLabel, "unui_measuringHeightWithNumberOfLines:", -[NCAuxiliaryOptionsView _summaryLabelNumberOfLinesForBoundsSize:](self, "_summaryLabelNumberOfLinesForBoundsSize:"));
      v7 = v6 + 14.0;
    }
    else
    {
      v7 = 14.0;
    }
    auxiliaryOptionButtons = self->_auxiliaryOptionButtons;
    if (auxiliaryOptionButtons)
    {
      -[NSArray firstObject](auxiliaryOptionButtons, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "font");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_scaledValueForValue:", 44.0);
      v13 = v12;

      BSRectWithSize();
      -[NCAuxiliaryOptionsView _optionsButtonWidthForBounds:auxiliaryOptionButtonsCount:](self, "_optionsButtonWidthForBounds:auxiliaryOptionButtonsCount:", -[NSArray count](self->_auxiliaryOptionButtons, "count"), v14, v15, v16, v17);
      v19 = v18;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v20 = self->_auxiliaryOptionButtons;
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v29;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24), "sizeThatFits:", v19, 1.79769313e308, (_QWORD)v28);
            if (v13 < v25)
              v13 = v25;
            ++v24;
          }
          while (v22 != v24);
          v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v22);
      }

      v26 = 18.0;
      if (!self->_optionsSummaryLabel)
        v26 = 0.0;
      v7 = v7 + v13 + v26;
    }
    v4 = v7 + 14.0;
  }
  v27 = width;
  result.height = v4;
  result.width = v27;
  return result;
}

- (void)layoutSubviews
{
  -[NCAuxiliaryOptionsView _configureOverlayIfNecessary](self, "_configureOverlayIfNecessary");
  -[NCAuxiliaryOptionsView _layoutOptionsSummaryLabel](self, "_layoutOptionsSummaryLabel");
  -[NCAuxiliaryOptionsView _layoutOptionsButtons](self, "_layoutOptionsButtons");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v5;

  -[NCAuxiliaryOptionsView _configureOverlayIfNecessary](self, "_configureOverlayIfNecessary");
  -[UIView layer](self->_overlayView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", 12);

  -[UIView _setContinuousCornerRadius:](self->_overlayView, "_setContinuousCornerRadius:", a3);
}

- (NSString)auxiliaryOptionsSummaryText
{
  return -[UILabel text](self->_optionsSummaryLabel, "text");
}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
  void *v4;
  char v5;
  UILabel *optionsSummaryLabel;
  id v7;

  v7 = a3;
  -[NCAuxiliaryOptionsView auxiliaryOptionsSummaryText](self, "auxiliaryOptionsSummaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      -[NCAuxiliaryOptionsView _configureAuxiliaryOptionsSummaryTextLabelIfNecessary](self, "_configureAuxiliaryOptionsSummaryTextLabelIfNecessary");
      -[UILabel setText:](self->_optionsSummaryLabel, "setText:", v7);
    }
    else
    {
      -[UILabel removeFromSuperview](self->_optionsSummaryLabel, "removeFromSuperview");
      optionsSummaryLabel = self->_optionsSummaryLabel;
      self->_optionsSummaryLabel = 0;

    }
    -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  double v4;

  if (self->_auxiliaryOptionsVisible != a3)
  {
    self->_auxiliaryOptionsVisible = a3;
    v4 = 0.0;
    if (a3)
      v4 = 1.0;
    -[NCAuxiliaryOptionsView setAlpha:](self, "setAlpha:", v4);
    -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAuxiliaryOptionActions:(id)a3
{
  unint64_t v5;
  NSUInteger v6;
  NSArray *auxiliaryOptionButtons;
  id v8;
  void *v9;
  unint64_t v10;
  NSUInteger v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray **location;
  id *locationa;
  id v19;

  v19 = a3;
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, a3);
  v5 = objc_msgSend(v19, "count");
  v6 = -[NSArray count](self->_auxiliaryOptionButtons, "count");
  location = &self->_auxiliaryOptionButtons;
  auxiliaryOptionButtons = self->_auxiliaryOptionButtons;
  if (auxiliaryOptionButtons)
    v8 = (id)-[NSArray mutableCopy](auxiliaryOptionButtons, "mutableCopy", location);
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;
  if (v6 <= v5)
    v10 = v5;
  else
    v10 = v6;
  if (v10)
  {
    v11 = 0;
    while (v11 >= v5 || v6 > v11)
    {
      if (v11 < v5 || v6 <= v11)
      {
        objc_msgSend(v9, "objectAtIndex:", v11, location);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_17;
      }
      else
      {
        objc_msgSend(v9, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeFromSuperview");

        objc_msgSend(v9, "removeLastObject");
      }
LABEL_18:
      if (v10 == ++v11)
        goto LABEL_19;
    }
    v12 = -[NCAuxiliaryOptionsView _newOptionsButton](self, "_newOptionsButton");
    objc_msgSend(v9, "addObject:", v12);
    if (!v12)
      goto LABEL_18;
LABEL_17:
    objc_msgSend(v19, "objectAtIndex:", v11, location);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
    objc_msgSend(v12, "addAction:forControlEvents:", v14, 64);
    objc_msgSend(v14, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v15);

    objc_msgSend(v12, "setTextColor:", self->_auxiliaryOptionsTextColor);
    objc_msgSend(v12, "setBackgroundTintColor:", self->_materialTintColor);
    objc_msgSend(v12, "setBackgroundMaterialRecipe:", self->_materialRecipe);
    objc_msgSend(v12, "setMaterialGroupNameBase:", self->_materialGroupNameBase);

    goto LABEL_18;
  }
LABEL_19:
  if (objc_msgSend(v19, "count", location))
    v16 = v9;
  else
    v16 = 0;
  objc_storeStrong(locationa, v16);
  -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setAuxiliaryOptionsTextColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *auxiliaryOptionsTextColor;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (v4)
    {
      v5 = (UIColor *)v4;
    }
    else
    {
      -[NCAuxiliaryOptionsView _defaultTextColor](self, "_defaultTextColor");
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    auxiliaryOptionsTextColor = self->_auxiliaryOptionsTextColor;
    self->_auxiliaryOptionsTextColor = v5;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_auxiliaryOptionButtons;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setTextColor:", self->_auxiliaryOptionsTextColor, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[UILabel setTextColor:](self->_optionsSummaryLabel, "setTextColor:", self->_auxiliaryOptionsTextColor);
    -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
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
    -[UIView setBackgroundColor:](self->_overlayView, "setBackgroundColor:", *p_auxiliaryOptionsBackgroundColor);
    -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAuxiliaryOptionsBackgroundCompositingFilter:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, a3);
    -[UIView layer](self->_overlayView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", v6);

    -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMaterialTintColor:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialTintColor, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_auxiliaryOptionButtons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setBackgroundTintColor:", self->_materialTintColor, (_QWORD)v11);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMaterialRecipe:(int64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_materialRecipe != a3)
  {
    self->_materialRecipe = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_auxiliaryOptionButtons;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setBackgroundMaterialRecipe:", a3, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_auxiliaryOptionButtons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setMaterialGroupNameBase:", self->_materialGroupNameBase, (_QWORD)v11);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)adjustForContentSizeCategoryChange
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NCAuxiliaryOptionsView _updateTextAttributesForOptionsSummaryLabel](self, "_updateTextAttributesForOptionsSummaryLabel");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_auxiliaryOptionButtons;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[NCAuxiliaryOptionsView _preferredFontForOptionButton](self, "_preferredFontForOptionButton", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFont:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  self->_widthForCachedLayoutInfo = 0.0;
  -[NCAuxiliaryOptionsView setNeedsLayout](self, "setNeedsLayout");
  return 1;
}

- (void)_setDefaultAttributes
{
  UIColor *v3;
  UIColor *auxiliaryOptionsTextColor;
  UIColor *v5;
  UIColor *auxiliaryOptionsBackgroundColor;

  -[NCAuxiliaryOptionsView _defaultTextColor](self, "_defaultTextColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  auxiliaryOptionsTextColor = self->_auxiliaryOptionsTextColor;
  self->_auxiliaryOptionsTextColor = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  auxiliaryOptionsBackgroundColor = self->_auxiliaryOptionsBackgroundColor;
  self->_auxiliaryOptionsBackgroundColor = v5;

  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, (id)*MEMORY[0x1E0CD2E98]);
}

- (id)_preferredFontForAuxiliaryOptionsSummaryTextLabel
{
  void *v2;
  void *v3;

  -[NCAuxiliaryOptionsView fontProvider](self, "fontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AB8], 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateTextAttributesForOptionsSummaryLabel
{
  UILabel *optionsSummaryLabel;
  id v3;

  optionsSummaryLabel = self->_optionsSummaryLabel;
  if (optionsSummaryLabel)
  {
    -[NCAuxiliaryOptionsView _preferredFontForAuxiliaryOptionsSummaryTextLabel](self, "_preferredFontForAuxiliaryOptionsSummaryTextLabel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](optionsSummaryLabel, "setFont:", v3);

  }
}

- (void)_configureAuxiliaryOptionsSummaryTextLabelIfNecessary
{
  UILabel *v3;
  UILabel *optionsSummaryLabel;

  if (!self->_optionsSummaryLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    optionsSummaryLabel = self->_optionsSummaryLabel;
    self->_optionsSummaryLabel = v3;

    -[UILabel setTextColor:](self->_optionsSummaryLabel, "setTextColor:", self->_auxiliaryOptionsTextColor);
    -[UILabel setNumberOfLines:](self->_optionsSummaryLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_optionsSummaryLabel, "setTextAlignment:", 1);
    -[NCAuxiliaryOptionsView _updateTextAttributesForOptionsSummaryLabel](self, "_updateTextAttributesForOptionsSummaryLabel");
    -[NCAuxiliaryOptionsView addSubview:](self, "addSubview:", self->_optionsSummaryLabel);
  }
}

- (id)_preferredFontForOptionButton
{
  void *v2;
  void *v3;

  -[NCAuxiliaryOptionsView fontProvider](self, "fontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4B10], 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_newOptionsButton
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D7D3E8]);
  -[NCAuxiliaryOptionsView _preferredFontForOptionButton](self, "_preferredFontForOptionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "_setContinuousCornerRadius:", 9.5);
  -[NCAuxiliaryOptionsView addSubview:](self, "addSubview:", v3);
  return v3;
}

- (void)_configureOverlayIfNecessary
{
  UIView *v3;
  UIView *overlayView;
  UIView *v5;
  void *v6;

  if (!self->_overlayView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    overlayView = self->_overlayView;
    self->_overlayView = v3;

    v5 = self->_overlayView;
    -[NCAuxiliaryOptionsView bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView setAutoresizingMask:](self->_overlayView, "setAutoresizingMask:", 18);
    -[UIView setBackgroundColor:](self->_overlayView, "setBackgroundColor:", self->_auxiliaryOptionsBackgroundColor);
    -[UIView layer](self->_overlayView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", self->_auxiliaryOptionsBackgroundCompositingFilter);

    -[NCAuxiliaryOptionsView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_overlayView, 0);
  }
}

- (void)_calculateOptionsSummaryLabelLayoutInfoForBoundsSize:(CGSize)a3
{
  UILabel *optionsSummaryLabel;

  if (self->_optionsSummaryLabel)
  {
    if (a3.width != self->_widthForCachedLayoutInfo)
    {
      self->_widthForCachedLayoutInfo = a3.width;
      optionsSummaryLabel = self->_optionsSummaryLabel;
      BSRectWithSize();
      self->_cachedSummaryLabelNumberOfLines = -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](optionsSummaryLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext);
    }
  }
}

- (unint64_t)_summaryLabelNumberOfLinesForBoundsSize:(CGSize)a3
{
  -[NCAuxiliaryOptionsView _calculateOptionsSummaryLabelLayoutInfoForBoundsSize:](self, "_calculateOptionsSummaryLabelLayoutInfoForBoundsSize:", a3.width, a3.height);
  return self->_cachedSummaryLabelNumberOfLines;
}

- (double)_optionsSummaryWidthForBounds:(CGRect)a3
{
  return CGRectGetWidth(a3) + -28.0;
}

- (CGRect)_optionsSummaryMeasuringFrameForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[NCAuxiliaryOptionsView _optionsSummaryWidthForBounds:](self, "_optionsSummaryWidthForBounds:");
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_optionsSummaryLabel, "unui_measuringHeightWithNumberOfLines:", -[NCAuxiliaryOptionsView _summaryLabelNumberOfLinesForBoundsSize:](self, "_summaryLabelNumberOfLinesForBoundsSize:"));
  BSRectWithSize();
  UIRectCenteredXInRectScale();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_layoutOptionsSummaryLabel
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v7;
  CGRect v8;

  if (self->_optionsSummaryLabel)
  {
    -[NCAuxiliaryOptionsView bounds](self, "bounds");
    -[NCAuxiliaryOptionsView _optionsSummaryMeasuringFrameForBounds:](self, "_optionsSummaryMeasuringFrameForBounds:");
    x = v7.origin.x;
    y = v7.origin.y;
    width = v7.size.width;
    height = v7.size.height;
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_optionsSummaryLabel, "unui_drawingHeightWithNumberOfLines:", -[NCAuxiliaryOptionsView _summaryLabelNumberOfLinesForBoundsSize:](self, "_summaryLabelNumberOfLinesForBoundsSize:", CGRectGetWidth(v7), 1.79769313e308));
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    CGRectGetWidth(v8);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_optionsSummaryLabel, "setFrame:");
  }
}

- (double)_optionsButtonWidthForBounds:(CGRect)a3 auxiliaryOptionButtonsCount:(unint64_t)a4
{
  if (a4)
    return (CGRectGetWidth(a3) + -28.0 + (double)(a4 - 1) * -10.0) / (double)a4;
  else
    return 0.0;
}

- (void)_layoutOptionsButtons
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  CGFloat MaxY;
  double v15;
  void (**v16)(void *, void *);
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD aBlock[6];
  _QWORD v30[4];
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v34 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_auxiliaryOptionButtons, "count"))
  {
    -[NCAuxiliaryOptionsView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[NCAuxiliaryOptionsView _optionsButtonWidthForBounds:auxiliaryOptionButtonsCount:](self, "_optionsButtonWidthForBounds:auxiliaryOptionButtonsCount:", -[NSArray count](self->_auxiliaryOptionButtons, "count"), v3, v5, v7, v9);
    v12 = v11;
    if (self->_optionsSummaryLabel)
    {
      -[NCAuxiliaryOptionsView _optionsSummaryMeasuringFrameForBounds:](self, "_optionsSummaryMeasuringFrameForBounds:", v4, v6, v8, v10);
      v13 = CGRectGetMaxY(v35) + 18.0;
    }
    else
    {
      v13 = 18.0;
    }
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x4010000000;
    v30[3] = "";
    v31 = 0u;
    v32 = 0u;
    v36.origin.x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    MaxY = CGRectGetMaxY(v36);
    *(_QWORD *)&v31 = 0x402C000000000000;
    *((double *)&v31 + 1) = v13;
    *(_QWORD *)&v32 = v12;
    *((double *)&v32 + 1) = MaxY - v13 + -14.0;
    v15 = _NCMainScreenScale();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__NCAuxiliaryOptionsView__layoutOptionsButtons__block_invoke;
    aBlock[3] = &unk_1E8D1CE58;
    aBlock[4] = v30;
    *(double *)&aBlock[5] = v15;
    v16 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceLayoutDirection") == 1;

    if (v18)
    {
      v19 = -[NSArray count](self->_auxiliaryOptionButtons, "count");
      if (v19 - 1 >= 0)
      {
        do
        {
          -[NSArray objectAtIndex:](self->_auxiliaryOptionButtons, "objectAtIndex:", --v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16[2](v16, v20);

        }
        while (v19 > 0);
      }
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v21 = self->_auxiliaryOptionButtons;
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v26;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v26 != v23)
              objc_enumerationMutation(v21);
            v16[2](v16, *(void **)(*((_QWORD *)&v25 + 1) + 8 * v24++));
          }
          while (v22 != v24);
          v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v22);
      }

    }
    _Block_object_dispose(v30, 8);
  }
}

CGFloat __47__NCAuxiliaryOptionsView__layoutOptionsButtons__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGFloat result;

  v3 = a2;
  UIRectIntegralWithScale();
  objc_msgSend(v3, "setFrame:");

  result = CGRectGetMaxX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)) + 10.0;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (id)_defaultTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (NSArray)auxiliaryOptionButtons
{
  return self->_auxiliaryOptionButtons;
}

- (BOOL)auxiliaryOptionsVisible
{
  return self->_auxiliaryOptionsVisible;
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

- (UIColor)materialTintColor
{
  return self->_materialTintColor;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (void)setFontProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fontProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_materialTintColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsTextColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionButtons, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_optionsSummaryLabel, 0);
}

@end
