@implementation PLPlatterActionButton

- (PLPlatterActionButton)initWithFrame:(CGRect)a3
{
  PLPlatterActionButton *v3;
  PLPlatterActionButton *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLPlatterActionButton;
  v3 = -[PLPlatterActionButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PLPlatterActionButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("swipe-action-button-identifier"));
    -[PLPlatterActionButton setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v4->_cornerRadius = 13.0;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v4, sel__handleHoverGestureRecognizerEvent_);
      -[PLPlatterActionButton addGestureRecognizer:](v4, "addGestureRecognizer:", v7);

    }
  }
  return v4;
}

- (void)willMoveToSuperview:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPlatterActionButton;
  v3 = a3;
  -[PLPlatterActionButton willMoveToSuperview:](&v5, sel_willMoveToSuperview_, v3);
  objc_msgSend(v3, "layer", v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAllowsGroupBlending:", 0);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  UILabel *titleLabel;
  id v7;

  v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    title = self->_title;
    self->_title = v4;

    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    titleLabel = self->_titleLabel;
    self->_titleLabel = 0;

    -[PLPlatterActionButton _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
    -[PLPlatterActionButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setFont:(id)a3
{
  UIFont *v4;
  UIFont *font;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIFont *)objc_msgSend(v6, "copy");
    font = self->_font;
    self->_font = v4;

    -[UILabel setFont:](self->_titleLabel, "setFont:", self->_font);
    -[PLPlatterActionButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBackgroundTintColor:(id)a3
{
  UIColor *v4;
  UIColor *backgroundTintColor;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    backgroundTintColor = self->_backgroundTintColor;
    self->_backgroundTintColor = v4;

    -[PLPlatterActionButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *textColor;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    textColor = self->_textColor;
    self->_textColor = v4;

    -[PLPlatterActionButton _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
    -[PLPlatterActionButton _configureTitleLabelEffects](self, "_configureTitleLabelEffects");
    -[PLPlatterActionButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPlatterActionButton;
  -[PLPlatterActionButton layoutSubviews](&v3, sel_layoutSubviews);
  -[PLPlatterActionButton _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[PLPlatterActionButton _configureBackgroundColoringViewIfNecessary](self, "_configureBackgroundColoringViewIfNecessary");
  -[PLPlatterActionButton _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
  -[PLPlatterActionButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  -[PLPlatterActionButton _layoutTitleLabel](self, "_layoutTitleLabel");
  -[PLPlatterActionButton _layoutBackgroundView](self, "_layoutBackgroundView");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height);
  v5 = v4 + 16.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  unsigned int v6;
  char v7;
  MTMaterialView *backgroundView;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  char v13;
  id location;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLPlatterActionButton;
  v5 = -[PLPlatterActionButton isHighlighted](&v17, sel_isHighlighted);
  v16.receiver = self;
  v16.super_class = (Class)PLPlatterActionButton;
  -[PLPlatterActionButton setHighlighted:](&v16, sel_setHighlighted_, v3);
  v15.receiver = self;
  v15.super_class = (Class)PLPlatterActionButton;
  v6 = -[PLPlatterActionButton isHighlighted](&v15, sel_isHighlighted);
  if (v5 != v6)
  {
    v7 = v6;
    -[PLPlatterActionButton _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
    backgroundView = self->_backgroundView;
    v9 = objc_initWeak(&location, backgroundView);
    v10 = (void *)objc_msgSend((id)objc_opt_class(), "newDefaultHighlightAnimator");

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__PLPlatterActionButton_setHighlighted___block_invoke;
    v11[3] = &unk_1E91D30D8;
    objc_copyWeak(&v12, &location);
    v13 = v7;
    objc_msgSend(v10, "addAnimations:", v11);
    objc_msgSend(v10, "startAnimation");
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

void __40__PLPlatterActionButton_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHighlighted:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setBackgroundMaterialRecipe:(int64_t)a3
{
  if (self->_backgroundMaterialRecipe != a3)
  {
    self->_backgroundMaterialRecipe = a3;
    -[MTMaterialView setRecipe:](self->_backgroundView, "setRecipe:");
    -[PLPlatterActionButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BSUIFontProvider)_fontProvider
{
  BSUIFontProvider *v3;
  BSUIFontProvider *fontProvider;

  if (!self->_fontProvider)
  {
    if (-[PLPlatterActionButton adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
      objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    else
      objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;

  }
  return self->_fontProvider;
}

- (void)_updateTitleLabelFont
{
  UIFont *v3;
  uint64_t v4;
  void *v5;
  UIFont *v6;
  UIFont *v7;

  if (self->_titleLabel)
  {
    v3 = self->_font;
    if (!v3)
    {
      if (-[UILabel numberOfLines](self->_titleLabel, "numberOfLines") <= 1)
        v4 = 1;
      else
        v4 = 8;
      -[PLPlatterActionButton _fontProvider](self, "_fontProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB590], v4);
      v6 = (UIFont *)objc_claimAutoreleasedReturnValue();

      v3 = v6;
    }
    v7 = v3;
    -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  }
}

- (void)_configureTitleLabelEffects
{
  UIColor *textColor;
  MTVisualStylingProvider *titleLabelVisualStylingProvider;
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *v7;

  -[PLPlatterActionButton _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  textColor = self->_textColor;
  if (textColor)
  {
    titleLabelVisualStylingProvider = self->_titleLabelVisualStylingProvider;
    if (titleLabelVisualStylingProvider)
    {
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](titleLabelVisualStylingProvider, "stopAutomaticallyUpdatingView:", self->_titleLabel);
      -[UILabel mt_removeAllVisualStyling](self->_titleLabel, "mt_removeAllVisualStyling");
      v5 = self->_titleLabelVisualStylingProvider;
      self->_titleLabelVisualStylingProvider = 0;

      textColor = self->_textColor;
    }
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", textColor);
  }
  else
  {
    -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", 1);
    v6 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    v7 = self->_titleLabelVisualStylingProvider;
    self->_titleLabelVisualStylingProvider = v6;

    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_titleLabelVisualStylingProvider, "automaticallyUpdateView:withStyle:", self->_titleLabel, 1);
  }
}

- (void)_configureTitleLabelIfNecessary
{
  double x;
  double y;
  double width;
  UILabel *v6;
  UILabel *titleLabel;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;

  if (!self->_titleLabel)
  {
    -[PLPlatterActionButton bounds](self, "bounds");
    v15 = CGRectInset(v14, 8.0, 0.0);
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    v6 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v6;

    v8 = 1;
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.5);
    LODWORD(v9) = 1036831949;
    -[UILabel _setHyphenationFactor:](self->_titleLabel, "_setHyphenationFactor:", v9);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    if (-[PLPlatterActionButton _wordCountForText:](self, "_wordCountForText:", self->_title) > 1)
      v8 = 2;
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v8);
    -[PLPlatterActionButton _updateTitleLabelFont](self, "_updateTitleLabelFont");
    -[PLPlatterActionButton traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");

    -[UILabel font](self->_titleLabel, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lineHeight");
    UIRoundToScale();
    v13 = v12;

    -[UILabel setFrame:](self->_titleLabel, "setFrame:", x, y, width, v13);
    -[PLPlatterActionButton _configureTitleLabelEffects](self, "_configureTitleLabelEffects");
    -[PLPlatterActionButton addSubview:](self, "addSubview:", self->_titleLabel);
  }
}

- (void)_configureBackgroundColoringViewIfNecessary
{
  UIColor *backgroundTintColor;
  UIView *backgroundTintColoringView;
  UIView *v5;
  UIView *v6;
  UIView *v7;

  backgroundTintColor = self->_backgroundTintColor;
  backgroundTintColoringView = self->_backgroundTintColoringView;
  if (backgroundTintColor)
  {
    if (!backgroundTintColoringView)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v6 = self->_backgroundTintColoringView;
      self->_backgroundTintColoringView = v5;

      -[MTMaterialView addSubview:](self->_backgroundView, "addSubview:", self->_backgroundTintColoringView);
      -[UIView _setContinuousCornerRadius:](self->_backgroundTintColoringView, "_setContinuousCornerRadius:", self->_cornerRadius);
      backgroundTintColoringView = self->_backgroundTintColoringView;
      backgroundTintColor = self->_backgroundTintColor;
    }
    -[UIView setBackgroundColor:](backgroundTintColoringView, "setBackgroundColor:", backgroundTintColor);
  }
  else
  {
    -[UIView removeFromSuperview](backgroundTintColoringView, "removeFromSuperview");
    v7 = self->_backgroundTintColoringView;
    self->_backgroundTintColoringView = 0;

  }
  -[PLPlatterActionButton _configureTitleLabelEffects](self, "_configureTitleLabelEffects");
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PLPlatterActionButton _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[PLPlatterActionButton _configureBackgroundColoringViewIfNecessary](self, "_configureBackgroundColoringViewIfNecessary");
    -[UIView _setContinuousCornerRadius:](self->_backgroundTintColoringView, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[PLPlatterActionButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_configureBackgroundViewIfNecessary
{
  MTMaterialView *v3;
  MTMaterialView *backgroundView;

  if (!self->_backgroundView)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", self->_backgroundMaterialRecipe);
    v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    -[MTMaterialView setGroupNameBase:](self->_backgroundView, "setGroupNameBase:", self->_materialGroupNameBase);
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[PLPlatterActionButton addSubview:](self, "addSubview:", self->_backgroundView);
    -[PLPlatterActionButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  }
}

- (void)_layoutBackgroundView
{
  MTMaterialView *backgroundView;
  UIView *backgroundTintColoringView;

  backgroundView = self->_backgroundView;
  -[PLPlatterActionButton bounds](self, "bounds");
  -[MTMaterialView setFrame:](backgroundView, "setFrame:");
  backgroundTintColoringView = self->_backgroundTintColoringView;
  -[PLPlatterActionButton bounds](self, "bounds");
  -[UIView setFrame:](backgroundTintColoringView, "setFrame:");
}

- (void)_layoutTitleLabel
{
  void *v3;
  CGRect v4;
  CGRect v5;

  -[PLPlatterActionButton bounds](self, "bounds");
  CGRectGetWidth(v4);
  -[UILabel frame](self->_titleLabel, "frame");
  CGRectGetHeight(v5);
  BSRectWithSize();
  -[PLPlatterActionButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  -[PLPlatterActionButton bounds](self, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
}

- (int64_t)_wordCountForText:(id)a3
{
  __CFString *v3;
  CFIndex Length;
  const __CFLocale *v5;
  __CFStringTokenizer *v6;
  int64_t v7;
  CFRange v9;

  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    Length = CFStringGetLength(v3);
    v5 = CFLocaleCopyCurrent();
    v9.location = 0;
    v9.length = Length;
    v6 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, v9, 3uLL, v5);
    v7 = -1;
    do
      ++v7;
    while (CFStringTokenizerAdvanceToNextToken(v6));
    CFRelease(v6);
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferredContentSizeCategory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPlatterActionButton setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v5);

    }
    -[PLPlatterActionButton adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (NSString)preferredContentSizeCategory
{
  NSString **p_preferredContentSizeCategory;
  NSString *preferredContentSizeCategory;

  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E0CEB440]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BSUIFontProvider *fontProvider;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPlatterActionButton preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    -[PLPlatterActionButton setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);
    -[PLPlatterActionButton _updateTitleLabelFont](self, "_updateTitleLabelFont");
    -[PLPlatterActionButton setNeedsLayout](self, "setNeedsLayout");
  }

  return v6 ^ 1;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  NSString **p_materialGroupNameBase;
  id v6;

  p_materialGroupNameBase = &self->_materialGroupNameBase;
  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    -[MTMaterialView setGroupNameBase:](self->_backgroundView, "setGroupNameBase:", *p_materialGroupNameBase);
    -[PLPlatterActionButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_handleHoverGestureRecognizerEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PLPlatterActionButton *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  PLPlatterActionButton *v16;

  v4 = objc_msgSend(a3, "state");
  if (v4 == 3)
  {
    v5 = (void *)MEMORY[0x1E0CEABB0];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __60__PLPlatterActionButton__handleHoverGestureRecognizerEvent___block_invoke_2;
    v10 = &unk_1E91D3160;
    v11 = self;
    v6 = &v7;
  }
  else
  {
    if (v4 != 1)
      return;
    v5 = (void *)MEMORY[0x1E0CEABB0];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __60__PLPlatterActionButton__handleHoverGestureRecognizerEvent___block_invoke;
    v15 = &unk_1E91D3160;
    v16 = self;
    v6 = &v12;
  }
  objc_msgSend(v5, "animateWithDuration:animations:", v6, 0.2, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t __60__PLPlatterActionButton__handleHoverGestureRecognizerEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 1);
}

uint64_t __60__PLPlatterActionButton__handleHoverGestureRecognizerEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NSString)title
{
  return self->_title;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)backgroundMaterialRecipe
{
  return self->_backgroundMaterialRecipe;
}

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setFontProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fontProvider, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (MTVisualStylingProvider)titleLabelVisualStylingProvider
{
  return self->_titleLabelVisualStylingProvider;
}

- (void)setTitleLabelVisualStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelVisualStylingProvider, a3);
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleLabelVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_backgroundTintColoringView, 0);
}

@end
