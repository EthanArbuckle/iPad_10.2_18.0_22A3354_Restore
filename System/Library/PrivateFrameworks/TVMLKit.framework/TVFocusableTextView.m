@implementation TVFocusableTextView

- (TVFocusableTextView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  TVFocusableTextView *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  _UIFloatingContentView *floatingView;
  _UIFloatingContentView *v13;
  uint64_t v14;
  UITextView *auxilliaryTextView;
  uint64_t v16;
  UITextView *descriptionTextView;
  void *v18;
  id v19;
  uint64_t v20;
  UILabel *moreLabel;
  UILabel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  UILabel *v41;
  uint64_t v42;
  UITapGestureRecognizer *moreLabelTapGestureRecognizer;
  uint64_t v44;
  UITapGestureRecognizer *playRecognizer;
  objc_super v47;
  objc_super v48;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v48.receiver = self;
  v48.super_class = (Class)TVFocusableTextView;
  v7 = -[TVFocusableTextView initWithFrame:](&v48, sel_initWithFrame_);
  v8 = (TVFocusableTextView *)v7;
  if (v7)
  {
    v7[445] = 0;
    v7[443] = 0;
    *((_QWORD *)v7 + 60) = 0x402C000000000000;
    *((_QWORD *)v7 + 61) = 0x4018000000000000;
    v9 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)(v7 + 584) = *MEMORY[0x24BDF7718];
    *(_OWORD *)(v7 + 600) = v9;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47.receiver = v8;
    v47.super_class = (Class)TVFocusableTextView;
    -[TVFocusableTextView setBackgroundColor:](&v47, sel_setBackgroundColor_, v10);

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF70B8]), "initWithFrame:", x, y, width, height);
    floatingView = v8->_floatingView;
    v8->_floatingView = (_UIFloatingContentView *)v11;

    -[_UIFloatingContentView setBackgroundColor:forState:](v8->_floatingView, "setBackgroundColor:forState:", 0, 0);
    -[_UIFloatingContentView setBackgroundColor:forState:](v8->_floatingView, "setBackgroundColor:forState:", 0, 8);
    -[_UIFloatingContentView setBackgroundColor:forState:](v8->_floatingView, "setBackgroundColor:forState:", 0, 1);
    -[_UIFloatingContentView setBackgroundColor:forState:](v8->_floatingView, "setBackgroundColor:forState:", 0, 4);
    -[_UIFloatingContentView setFloatingContentDelegate:](v8->_floatingView, "setFloatingContentDelegate:", v8);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v8->_floatingView, "setContentMotionRotation:translation:", 0.0, 0.04, 0.0, 4.0);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v8->_floatingView, "setFocusedSizeIncrease:", 20.0);
    v13 = v8->_floatingView;
    objc_msgSend((id)objc_opt_class(), "cornerRadius");
    -[_UIFloatingContentView setCornerRadius:](v13, "setCornerRadius:");
    -[TVFocusableTextView addSubview:](v8, "addSubview:", v8->_floatingView);
    __37__TVFocusableTextView_initWithFrame___block_invoke();
    v14 = objc_claimAutoreleasedReturnValue();
    auxilliaryTextView = v8->_auxilliaryTextView;
    v8->_auxilliaryTextView = (UITextView *)v14;

    v8->_descriptionTextAlignment = 4;
    __37__TVFocusableTextView_initWithFrame___block_invoke();
    v16 = objc_claimAutoreleasedReturnValue();
    descriptionTextView = v8->_descriptionTextView;
    v8->_descriptionTextView = (UITextView *)v16;

    -[_UIFloatingContentView contentView](v8->_floatingView, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v8->_descriptionTextView);

    v19 = objc_alloc(MEMORY[0x24BDF6B68]);
    v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    moreLabel = v8->_moreLabel;
    v8->_moreLabel = (UILabel *)v20;

    v22 = v8->_moreLabel;
    _TVMLLocString(CFSTR("TVDescriptionMore"), CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedUppercaseString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v22, "setText:", v24);

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7808]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fontDescriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fontAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    v29 = *MEMORY[0x24BDF7770];
    objc_msgSend(v28, "objectForKey:", *MEMORY[0x24BDF7770]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    if (!v31)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7890]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v32, *MEMORY[0x24BDF78A0]);

    objc_msgSend(v28, "setObject:forKey:", v31, v29);
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A78]), "initWithFontAttributes:", v28);
    v34 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(v25, "pointSize");
    objc_msgSend(v34, "fontWithDescriptor:size:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_moreLabel, "setFont:", v35);
    -[UILabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:](v8->_moreLabel, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
    v36 = v8->_moreLabel;
    _TVMLLocString(CFSTR("TVDescriptionMore"), CFSTR("Localizable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v36, "setText:", v37);

    v38 = v8->_moreLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDC4FC0]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v38, "setFont:", v39);

    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_moreLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel sizeToFit](v8->_moreLabel, "sizeToFit");
    -[_UIFloatingContentView contentView](v8->_floatingView, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", v8->_moreLabel);

    v41 = v8->_moreLabel;
    -[TVFocusableTextView _moreLabelFrame](v8, "_moreLabelFrame");
    -[UILabel setFrame:](v41, "setFrame:");
    v42 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v8, sel__selectButtonAction_);
    moreLabelTapGestureRecognizer = v8->_moreLabelTapGestureRecognizer;
    v8->_moreLabelTapGestureRecognizer = (UITapGestureRecognizer *)v42;

    -[UILabel addGestureRecognizer:](v8->_moreLabel, "addGestureRecognizer:", v8->_moreLabelTapGestureRecognizer);
    -[UILabel setUserInteractionEnabled:](v8->_moreLabel, "setUserInteractionEnabled:", 1);
    v44 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v8, sel__playButtonAction_);
    playRecognizer = v8->_playRecognizer;
    v8->_playRecognizer = (UITapGestureRecognizer *)v44;

    -[UITapGestureRecognizer setAllowedPressTypes:](v8->_playRecognizer, "setAllowedPressTypes:", &unk_24EBCD3E8);
    -[UITapGestureRecognizer setDelegate:](v8->_playRecognizer, "setDelegate:", v8);
    -[TVFocusableTextView addGestureRecognizer:](v8, "addGestureRecognizer:", v8->_playRecognizer);

  }
  return v8;
}

id __37__TVFocusableTextView_initWithFrame___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDF6EF8]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v1, "setBackgroundColor:", 0);
  objc_msgSend(v1, "setTextContainerInset:", 0.0, -5.0, 0.0, -5.0);
  objc_msgSend(v1, "setScrollEnabled:", 0);
  objc_msgSend(v1, "setEditable:", 0);
  objc_msgSend(v1, "setUserInteractionEnabled:", 0);
  objc_msgSend(v1, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v1, "setSelectable:", 0);
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerRadius:", 0.0);

  objc_msgSend(v1, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumNumberOfLines:", 0);

  objc_msgSend(v1, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 4);

  return v1;
}

- (void)setDescriptionTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_descriptionTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_descriptionTextColor, a3);
    -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setDescriptionTextHighlightColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_descriptionTextHighlightColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_descriptionTextHighlightColor, a3);
    -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setDescriptionTextAlignment:(int64_t)a3
{
  if (self->_descriptionTextAlignment != a3)
  {
    self->_descriptionTextAlignment = a3;
    -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setHighlightBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_highlightBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_highlightBackgroundColor, a3);
    -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setFocusSizeIncrease:(unint64_t)a3
{
  if (self->_focusSizeIncrease != a3)
  {
    self->_focusSizeIncrease = a3;
    -[_UIFloatingContentView setFocusedSizeIncrease:](self->_floatingView, "setFocusedSizeIncrease:", (double)a3);
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (self->_padding.left != a3.left
    || self->_padding.top != a3.top
    || self->_padding.right != a3.right
    || self->_padding.bottom != a3.bottom)
  {
    self->_padding = a3;
    -[UITextView setTextContainerInset:](self->_descriptionTextView, "setTextContainerInset:");
    -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAlwaysShowBackground:(BOOL)a3
{
  if (self->_alwaysShowBackground != a3)
  {
    self->_alwaysShowBackground = a3;
    -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateBackgroundColors
{
  UIColor **p_backgroundColor;
  UIColor *backgroundColor;
  UIColor *v5;
  UIVisualEffectView *backgroundView;
  double v7;
  void *v8;
  UIColor *v9;

  p_backgroundColor = &self->_backgroundColor;
  backgroundColor = self->_backgroundColor;
  if (self->_alwaysShowBackground)
  {
    v5 = backgroundColor;
    backgroundColor = self->_highlightBackgroundColor;
    if (backgroundColor)
      goto LABEL_7;
  }
  else
  {
    v5 = 0;
    if (backgroundColor)
      goto LABEL_7;
    p_backgroundColor = &self->_highlightBackgroundColor;
  }
  backgroundColor = *p_backgroundColor;
LABEL_7:
  v9 = backgroundColor;
  -[_UIFloatingContentView setBackgroundColor:forState:](self->_floatingView, "setBackgroundColor:forState:", v5, 0);
  -[_UIFloatingContentView setBackgroundColor:forState:](self->_floatingView, "setBackgroundColor:forState:", v9, 8);
  -[_UIFloatingContentView setBackgroundColor:forState:](self->_floatingView, "setBackgroundColor:forState:", v9, 1);
  backgroundView = self->_backgroundView;
  if (self->_highlightBackgroundColor)
  {
    -[UIVisualEffectView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  }
  else
  {
    v7 = 1.0;
    if (!self->_alwaysShowBackground)
      -[UIVisualEffectView alpha](self->_backgroundView, "alpha", 1.0);
    -[UIVisualEffectView setAlpha:](backgroundView, "setAlpha:", v7);
    -[_UIFloatingContentView visualEffectContainerView](self->_floatingView, "visualEffectContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_backgroundView);

  }
}

- (void)_updateTextColorsIfNeeded
{
  -[TVFocusableTextView _updateTextColorsForFocusState:](self, "_updateTextColorsForFocusState:", (-[_UIFloatingContentView controlState](self->_floatingView, "controlState") >> 3) & 1);
}

- (void)_updateTextColorsForFocusState:(BOOL)a3
{
  UIColor *descriptionTextHighlightColor;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *moreLabel;
  void *v13;
  id v14;

  if (self->_descriptionTextColor && self->_descriptionTextHighlightColor)
  {
    if (a3)
      descriptionTextHighlightColor = self->_descriptionTextHighlightColor;
    else
      descriptionTextHighlightColor = self->_descriptionTextColor;
    -[TVFocusableTextView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", descriptionTextHighlightColor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](self->_descriptionTextView, "setTextColor:", v5);

  }
  if (self->_moreLabelTextColor)
  {
    -[UILabel setTextColor:](self->_moreLabel, "setTextColor:");
  }
  else
  {
    -[TVFocusableTextView descriptionText](self, "descriptionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[TVFocusableTextView descriptionText](self, "descriptionText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attributesAtIndex:effectiveRange:", 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDF6600]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        moreLabel = self->_moreLabel;
        objc_msgSend(v10, "colorWithAlphaComponent:", 0.5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](moreLabel, "setTextColor:", v13);

      }
    }
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  double moreHighlightPadding;
  double v8;
  CGFloat v9;
  double v10;
  void *v11;
  UILabel *moreLabel;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22[1] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)TVFocusableTextView;
  -[TVFocusableTextView layoutSubviews](&v21, sel_layoutSubviews);
  -[TVFocusableTextView bounds](self, "bounds");
  if (v3 == 0.0 || (v5 = v4, v4 == 0.0))
  {
    v14 = *MEMORY[0x24BDBF090];
    v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
    -[UITextView setFrame:](self->_descriptionTextView, "setFrame:", *MEMORY[0x24BDBF090], v15, v16, v17);
    -[_UIFloatingContentView setFrame:](self->_floatingView, "setFrame:", v14, v15, v16, v17);
    -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", v14, v15, v16, v17);
    -[UILabel setFrame:](self->_moreLabel, "setFrame:", v14, v15, v16, v17);
  }
  else
  {
    v6 = v3;
    moreHighlightPadding = self->_moreHighlightPadding;
    -[UITextView setFrame:](self->_descriptionTextView, "setFrame:", moreHighlightPadding, moreHighlightPadding + -6.0);
    v8 = -self->_moreHighlightPadding;
    v23.origin.x = moreHighlightPadding;
    v23.origin.y = moreHighlightPadding + -6.0;
    v23.size.width = v6;
    v23.size.height = v5;
    v9 = CGRectGetWidth(v23) + self->_moreHighlightPadding * 2.0;
    v24.origin.x = moreHighlightPadding;
    v24.origin.y = moreHighlightPadding + -6.0;
    v24.size.width = v6;
    v24.size.height = v5;
    v10 = moreHighlightPadding + -6.0 + moreHighlightPadding + -3.0 + CGRectGetHeight(v24);
    -[_UIFloatingContentView setFrame:](self->_floatingView, "setFrame:", v8, -(moreHighlightPadding + -6.0), v9, v10);
    -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v9, v10);
    -[UITextView setTextAlignment:](self->_descriptionTextView, "setTextAlignment:", self->_descriptionTextAlignment);
    -[_UIFloatingContentView contentView](self->_floatingView, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_moreLabel);

    moreLabel = self->_moreLabel;
    -[TVFocusableTextView _moreLabelFrame](self, "_moreLabelFrame");
    -[UILabel setFrame:](moreLabel, "setFrame:");
    -[TVFocusableTextView _recomputeTextSizeIfNeeded](self, "_recomputeTextSizeIfNeeded");
    if (self->_textTruncating && !self->_disableFocus)
    {
      -[UILabel setHidden:](self->_moreLabel, "setHidden:", 0);
      -[TVFocusableTextView _moreLabelExclusionPathFrame](self, "_moreLabelExclusionPathFrame");
      v18 = (void *)MEMORY[0x24BDF6870];
      v26 = CGRectIntegral(v25);
      objc_msgSend(v18, "bezierPathWithRect:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView textContainer](self->_descriptionTextView, "textContainer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setExclusionPaths:", v20);

    }
    else
    {
      -[UILabel setHidden:](self->_moreLabel, "setHidden:", 1);
      -[UITextView textContainer](self->_descriptionTextView, "textContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setExclusionPaths:", MEMORY[0x24BDBD1A8]);
    }

    -[TVFocusableTextView _updateTextColorsIfNeeded](self, "_updateTextColorsIfNeeded");
    -[TVFocusableTextView _updateBackgroundColors](self, "_updateBackgroundColors");
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _QWORD v5[5];
  BOOL v6;
  BOOL v7;

  if (a5)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __69__TVFocusableTextView_setSelected_animated_withAnimationCoordinator___block_invoke;
    v5[3] = &unk_24EB856A8;
    v5[4] = self;
    v6 = a3;
    v7 = a4;
    objc_msgSend(a5, "addCoordinatedAnimations:completion:", v5, 0);
  }
  else
  {
    -[TVFocusableTextView setSelected:animated:](self, "setSelected:animated:", a3, a4);
  }
}

uint64_t __69__TVFocusableTextView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelected:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "nextFocusedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDescendantOfView:", self);

  -[TVFocusableTextView _updateTextColorsForFocusState:](self, "_updateTextColorsForFocusState:", v6);
}

- (BOOL)canBecomeFocused
{
  void *v3;
  uint64_t v4;

  if (-[TVFocusableTextView disableFocus](self, "disableFocus"))
    return 0;
  -[UITextView attributedText](self->_descriptionTextView, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  if (-[TVFocusableTextView isAlwaysFocusable](self, "isAlwaysFocusable"))
    return 1;
  return -[TVFocusableTextView isTextTruncating](self, "isTextTruncating");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[TVFocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines");
  -[UITextView textContainer](self->_auxilliaryTextView, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumNumberOfLines:", v6);

  -[UITextView sizeThatFits:](self->_auxilliaryTextView, "sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;
  if (v6)
  {
    if (self->_moreLabelOnNewLine)
    {
      -[UITextView textContainer](self->_auxilliaryTextView, "textContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMaximumNumberOfLines:", 0);

      -[UITextView sizeThatFits:](self->_auxilliaryTextView, "sizeThatFits:", width, height);
      if (v13 > v11)
      {
        -[UILabel sizeThatFits:](self->_moreLabel, "sizeThatFits:", width, height);
        v11 = v11 + v14;
      }
    }
  }
  if (width == 0.0)
    v15 = v9;
  else
    v15 = width;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;
  CGRect v6;

  -[TVFocusableTextView bounds](self, "bounds");
  -[TVFocusableTextView sizeThatFits:](self, "sizeThatFits:", CGRectGetWidth(v6), 0.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TVFocusableTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
  v8.receiver = self;
  v8.super_class = (Class)TVFocusableTextView;
  -[TVFocusableTextView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

+ (double)cornerRadius
{
  return 5.0;
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  UITextView *descriptionTextView;
  void *v14;
  UITextView *auxilliaryTextView;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = *MEMORY[0x24BDF6628];
    v8 = objc_msgSend(v5, "length");
    v9 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __42__TVFocusableTextView_setDescriptionText___block_invoke;
    v24[3] = &unk_24EB856D0;
    v10 = v6;
    v25 = v10;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v24);
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      objc_initWeak(&location, self);
      v11 = objc_msgSend(v5, "length");
      v12 = *MEMORY[0x24BDF6600];
      v17 = v9;
      v18 = 3221225472;
      v19 = __42__TVFocusableTextView_setDescriptionText___block_invoke_2;
      v20 = &unk_24EB856F8;
      objc_copyWeak(&v22, &location);
      v21 = v10;
      objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, &v17);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v10, "tv_addLanguageAwareness:", 0, v17, v18, v19, v20);
    descriptionTextView = self->_descriptionTextView;
    v14 = (void *)objc_msgSend(v10, "copy");
    -[UITextView setAttributedText:](descriptionTextView, "setAttributedText:", v14);

    auxilliaryTextView = self->_auxilliaryTextView;
    v16 = (void *)objc_msgSend(v10, "copy");
    -[UITextView setAttributedText:](auxilliaryTextView, "setAttributedText:", v16);

    -[TVFocusableTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
    -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");

  }
}

void __42__TVFocusableTextView_setDescriptionText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v16, "mutableCopy");
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = objc_alloc_init(MEMORY[0x24BDF6748]);
    v12 = v11;

    objc_msgSend(v12, "setLineBreakMode:", 0);
    objc_msgSend(v12, "setAlignment:", 4);
    v13 = *MEMORY[0x24BDF6628];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x24BDF6628], a3, a4);
    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v14, "addAttribute:value:range:", v13, v15, a3, a4);

    v8 = v16;
  }

}

void __42__TVFocusableTextView_setDescriptionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v11;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_accessibilityHigherContrastTintColorForColor:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x24BDF6600];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x24BDF6600], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, v9, a3, a4);

  }
}

- (NSAttributedString)descriptionText
{
  return -[UITextView attributedText](self->_descriptionTextView, "attributedText");
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  void *v5;

  -[UITextView textContainer](self->_descriptionTextView, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaximumNumberOfLines:", a3);

  -[TVFocusableTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
  -[TVFocusableTextView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)maximumNumberOfLines
{
  void *v2;
  unint64_t v3;

  -[UITextView textContainer](self->_descriptionTextView, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumNumberOfLines");

  return v3;
}

- (void)setTrackHorizontal:(BOOL)a3
{
  _UIFloatingContentView *floatingView;
  double v4;
  double v5;

  self->_trackHorizontal = a3;
  floatingView = self->_floatingView;
  if (a3)
  {
    v4 = 0.04;
    v5 = 4.0;
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }
  -[_UIFloatingContentView setContentMotionRotation:translation:](floatingView, "setContentMotionRotation:translation:", v4, 0.04, v5, 4.0);
}

- (void)_setNeedsTextSizeComputation
{
  self->_needsTextSizeComputation = 1;
}

- (void)_recomputeTextSizeIfNeeded
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  if (self->_needsTextSizeComputation)
  {
    self->_needsTextSizeComputation = 0;
    -[UITextView bounds](self->_descriptionTextView, "bounds");
    v4 = v3;
    -[UITextView textContainer](self->_auxilliaryTextView, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaximumNumberOfLines:", -[TVFocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines"));

    -[UITextView sizeThatFits:](self->_auxilliaryTextView, "sizeThatFits:", v4, 0.0);
    v7 = v6;
    -[UITextView textContainer](self->_auxilliaryTextView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaximumNumberOfLines:", 0);

    -[UITextView sizeThatFits:](self->_auxilliaryTextView, "sizeThatFits:", v4, 0.0);
    self->_textTruncating = v9 > v7;
    -[TVFocusableTextView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
}

- (CGRect)_moreLabelExclusionPathFrame
{
  double v3;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[UITextView textContainerInset](self->_descriptionTextView, "textContainerInset");
  v4 = v3;
  v6 = v5;
  -[TVFocusableTextView _moreLabelFrame](self, "_moreLabelFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TVFocusableTextView moreHorizontalMargin](self, "moreHorizontalMargin");
  v16 = v15;
  if (self->_moreLabelOnNewLine)
  {
    -[UITextView frame](self->_descriptionTextView, "frame");
    v12 = v17 - v4 - v6;
  }
  v18 = v8 - v16;
  v19 = v16 + v12;
  v20 = v10;
  v21 = v14;
  result.size.height = v21;
  result.size.width = v19;
  result.origin.y = v20;
  result.origin.x = v18;
  return result;
}

- (CGRect)_moreLabelFrame
{
  void *v3;
  int v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double MaxX;
  double moreHighlightPadding;
  double v25;
  double Width;
  double v27;
  void *v28;
  double MaxY;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double Height;
  double left;
  double right;
  double v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat rect;
  CGFloat v55;
  _QWORD v56[2];
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect result;

  -[UITextView text](self->_descriptionTextView, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isNaturallyRTL");

  -[_UIFloatingContentView bounds](self->_floatingView, "bounds");
  v6 = v5;
  rect = v7;
  v9 = v8;
  v11 = v10;
  -[UITextView frame](self->_descriptionTextView, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v55 = v18;
  -[UILabel sizeThatFits:](self->_moreLabel, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v20 = v19;
  v22 = v21;
  if (self->_moreLabelOnNewLine)
  {
    if (v4)
    {
      v57.origin.x = v6;
      v57.origin.y = rect;
      v57.size.width = v9;
      v57.size.height = v11;
      MaxX = CGRectGetMaxX(v57);
      v58.origin.x = 0.0;
      v58.origin.y = 0.0;
      v58.size.width = v20;
      v58.size.height = v22;
      moreHighlightPadding = MaxX - CGRectGetWidth(v58) - self->_moreHighlightPadding;
    }
    else
    {
      moreHighlightPadding = self->_moreHighlightPadding;
    }
  }
  else
  {
    moreHighlightPadding = 4.0;
    if ((v4 & 1) == 0)
    {
      v59.origin.x = v13;
      v59.origin.y = v15;
      v59.size.width = v17;
      v59.size.height = v55;
      v25 = CGRectGetMaxX(v59);
      v60.origin.x = 0.0;
      v60.origin.y = 0.0;
      v60.size.width = v20;
      v60.size.height = v22;
      moreHighlightPadding = v25 - CGRectGetWidth(v60) + -4.0;
    }
    v61.origin.y = 0.0;
    v61.origin.x = moreHighlightPadding;
    v61.size.width = v20;
    v61.size.height = v22;
    Width = CGRectGetWidth(v61);
    v20 = v20 + 4.0;
    if (v4)
    {
      v27 = Width;
      v62.origin.y = 0.0;
      v62.origin.x = moreHighlightPadding;
      v62.size.width = v20;
      v62.size.height = v22;
      moreHighlightPadding = moreHighlightPadding + v27 - CGRectGetWidth(v62);
    }
  }
  -[UITextView attributedText](self->_descriptionTextView, "attributedText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v63.origin.x = v13;
  v63.origin.y = v15;
  v63.size.width = v17;
  v63.size.height = v55;
  MaxY = CGRectGetMaxY(v63);
  if (objc_msgSend(v28, "length"))
  {
    v56[0] = 0;
    v56[1] = objc_msgSend(v28, "length");
    objc_msgSend(v28, "attributesAtIndex:effectiveRange:", 0, v56);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "descender");
    v33 = v32;
    objc_msgSend(v31, "leading");
    v34 = v20;
    v36 = v33 - v35 * 0.5;
    -[UILabel font](self->_moreLabel, "font");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "descender");
    v39 = v38;
    -[UILabel font](self->_moreLabel, "font");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leading");
    v42 = v36 - (v39 - v41 * 0.5);
    v20 = v34;
    MaxY = MaxY + v42;

  }
  v64.origin.y = 0.0;
  v64.origin.x = moreHighlightPadding;
  v64.size.width = v20;
  v64.size.height = v22;
  Height = CGRectGetHeight(v64);
  if (v4)
  {
    if (self->_moreLabelOnNewLine)
      left = -self->_padding.right;
    else
      left = self->_padding.left;
    v46 = moreHighlightPadding + left;
  }
  else
  {
    if (self->_moreLabelOnNewLine)
      right = -self->_padding.left;
    else
      right = self->_padding.right;
    v46 = moreHighlightPadding - right;
  }
  v47 = MaxY - Height;
  v48 = floorf(v47);
  if (self->_moreLabelOnNewLine)
    v48 = v48 + -3.0;
  v49 = v48 - self->_padding.bottom;

  v50 = v46;
  v51 = v49;
  v52 = v20;
  v53 = v22;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 4 && -[TVFocusableTextView isFocused](self, "isFocused"))
  {
    -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", 9, 1);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TVFocusableTextView;
    -[TVFocusableTextView pressesBegan:withEvent:](&v10, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVFocusableTextView;
  -[TVFocusableTextView tintColorDidChange](&v4, sel_tintColorDidChange);
  if (-[TVFocusableTextView tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "systemMidGrayColor");
  else
    -[TVFocusableTextView moreLabelTextColor](self, "moreLabelTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_moreLabel, "setTextColor:", v3);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[TVFocusableTextView playRecognizer](self, "playRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    return 1;
  -[TVFocusableTextView playHandler](self, "playHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

  return v6;
}

- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  UIVisualEffectView *backgroundView;
  BOOL v6;
  double v7;

  v6 = !self->_alwaysShowBackground;
  backgroundView = self->_backgroundView;
  v6 = v6 && (a5 & 8) == 0;
  v7 = 1.0;
  if (v6)
    v7 = 0.0;
  -[UIVisualEffectView setAlpha:](backgroundView, "setAlpha:", a3, a4, v7);
}

- (void)_selectButtonAction:(id)a3
{
  void (**selectionHandler)(id, id);

  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2](selectionHandler, a3);
}

- (void)_playButtonAction:(id)a3
{
  void (**playHandler)(id, id);

  playHandler = (void (**)(id, id))self->_playHandler;
  if (playHandler)
    playHandler[2](playHandler, a3);
}

- (UIColor)descriptionTextColor
{
  return self->_descriptionTextColor;
}

- (UIColor)descriptionTextHighlightColor
{
  return self->_descriptionTextHighlightColor;
}

- (int64_t)descriptionTextAlignment
{
  return self->_descriptionTextAlignment;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (BOOL)isTextTruncating
{
  return self->_textTruncating;
}

- (double)moreHighlightPadding
{
  return self->_moreHighlightPadding;
}

- (void)setMoreHighlightPadding:(double)a3
{
  self->_moreHighlightPadding = a3;
}

- (double)moreHorizontalMargin
{
  return self->_moreHorizontalMargin;
}

- (void)setMoreHorizontalMargin:(double)a3
{
  self->_moreHorizontalMargin = a3;
}

- (BOOL)moreLabelOnNewLine
{
  return self->_moreLabelOnNewLine;
}

- (void)setMoreLabelOnNewLine:(BOOL)a3
{
  self->_moreLabelOnNewLine = a3;
}

- (UIColor)moreLabelTextColor
{
  return self->_moreLabelTextColor;
}

- (void)setMoreLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_moreLabelTextColor, a3);
}

- (BOOL)trackHorizontal
{
  return self->_trackHorizontal;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)alwaysShowBackground
{
  return self->_alwaysShowBackground;
}

- (unint64_t)focusSizeIncrease
{
  return self->_focusSizeIncrease;
}

- (BOOL)isAlwaysFocusable
{
  return self->_alwaysFocusable;
}

- (void)setAlwaysFocusable:(BOOL)a3
{
  self->_alwaysFocusable = a3;
}

- (BOOL)disableFocus
{
  return self->_disableFocus;
}

- (void)setDisableFocus:(BOOL)a3
{
  self->_disableFocus = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (id)playHandler
{
  return self->_playHandler;
}

- (void)setPlayHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextView, a3);
}

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingView, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UITapGestureRecognizer)selectRecognizer
{
  return self->_selectRecognizer;
}

- (void)setSelectRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_selectRecognizer, a3);
}

- (UITapGestureRecognizer)playRecognizer
{
  return self->_playRecognizer;
}

- (void)setPlayRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_playRecognizer, a3);
}

- (UILabel)moreLabel
{
  return self->_moreLabel;
}

- (void)setMoreLabel:(id)a3
{
  objc_storeStrong((id *)&self->_moreLabel, a3);
}

- (UITapGestureRecognizer)moreLabelTapGestureRecognizer
{
  return self->_moreLabelTapGestureRecognizer;
}

- (BOOL)needsTextSizeComputation
{
  return self->_needsTextSizeComputation;
}

- (void)setNeedsTextSizeComputation:(BOOL)a3
{
  self->_needsTextSizeComputation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreLabelTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_moreLabel, 0);
  objc_storeStrong((id *)&self->_playRecognizer, 0);
  objc_storeStrong((id *)&self->_selectRecognizer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong(&self->_playHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_moreLabelTextColor, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_descriptionTextHighlightColor, 0);
  objc_storeStrong((id *)&self->_descriptionTextColor, 0);
  objc_storeStrong((id *)&self->_auxilliaryTextView, 0);
  objc_storeStrong((id *)&self->_vibrantEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
