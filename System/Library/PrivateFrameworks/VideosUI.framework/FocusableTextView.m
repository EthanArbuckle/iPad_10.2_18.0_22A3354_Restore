@implementation FocusableTextView

+ (FocusableTextView)textViewWithAttributedString:(id)a3 textLayout:(id)a4 existingTextView:(id)a5
{
  id v7;
  id v8;
  id v9;
  FocusableTextView *v10;
  FocusableTextView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (FocusableTextView *)v8;
  else
    v10 = -[FocusableTextView initWithTextLayout:]([FocusableTextView alloc], "initWithTextLayout:", v7);
  v11 = v10;
  -[FocusableTextView computationLabel](v10, "computationLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("Lorem"), v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FocusableTextView setComputationLabel:](v11, "setComputationLabel:", v13);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vuiTraitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[FocusableTextView setMaximumNumberOfLines:](v11, "setMaximumNumberOfLines:", objc_msgSend(v7, "numberOfLinesForTraitCollection:", v15));
  -[FocusableTextView _updateTextColor](v11, "_updateTextColor");
  -[FocusableTextView setDescriptionText:](v11, "setDescriptionText:", v9);

  -[FocusableTextView _configureAlignmentWithTextAlignment:allowsTextAlignmentOverride:](v11, "_configureAlignmentWithTextAlignment:allowsTextAlignmentOverride:", objc_msgSend(v7, "alignment"), objc_msgSend(v7, "allowsTextAlignmentOverride"));
  return v11;
}

- (FocusableTextView)initWithTextLayout:(id)a3
{
  id v4;
  FocusableTextView *v5;
  FocusableTextView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FocusableTextView;
  v5 = -[FocusableTextView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[FocusableTextView setTextLayout:](v5, "setTextLayout:", v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22.receiver = v6;
    v22.super_class = (Class)FocusableTextView;
    -[FocusableTextView setVuiBackgroundColor:](&v22, sel_setVuiBackgroundColor_, v7);

    -[FocusableTextView setupViews_iOSAndMacOS](v6, "setupViews_iOSAndMacOS");
    objc_initWeak(&location, v6);
    v25[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __40__FocusableTextView_initWithTextLayout___block_invoke;
    v19[3] = &unk_1E9F99F98;
    objc_copyWeak(&v20, &location);
    -[FocusableTextView vui_registerForTraitChanges:withHandler:](v6, "vui_registerForTraitChanges:withHandler:", v8, v19);

    v24 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v15 = 3221225472;
    v16 = __40__FocusableTextView_initWithTextLayout___block_invoke_2;
    v17 = &unk_1E9F99F98;
    objc_copyWeak(&v18, &location);
    -[FocusableTextView vui_registerForTraitChanges:withHandler:](v6, "vui_registerForTraitChanges:withHandler:", v10, &v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__contrastSettingsDidChange, *MEMORY[0x1E0DC4508], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__transparencySettingsDidChange, *MEMORY[0x1E0DC45B8], 0);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __40__FocusableTextView_initWithTextLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTextColor");

}

void __40__FocusableTextView_initWithTextLayout___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "textLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "vuiTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "numberOfLinesForTraitCollection:", v2);

  objc_msgSend(WeakRetained, "setMaximumNumberOfLines:", v3);
  objc_msgSend(WeakRetained, "vui_setNeedsLayout");

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
    -[FocusableTextView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setDescriptionTextAlignment:(int64_t)a3
{
  if (self->_descriptionTextAlignment != a3)
  {
    self->_descriptionTextAlignment = a3;
    -[FocusableTextView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }
}

- (void)setMoreLabelTextColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_moreLabelTextColor != v5)
  {
    objc_storeStrong((id *)&self->_moreLabelTextColor, a3);
    -[VUITextLayout setSeeMoreTextColor:](self->_textLayout, "setSeeMoreTextColor:", v5);
    -[FocusableTextView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (void)_updateTextColorsIfNeeded
{
  void *v3;

  if (self->_descriptionTextColor)
  {
    -[FocusableTextView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextView setTextColor:](self->_descriptionTextView, "setTextColor:", v3);

  }
  if (self->_moreLabelTextColor)
    -[VUILabel setTextColor:](self->_moreLabel, "setTextColor:");
}

- (id)makeTextView
{
  VUITextView *v3;
  VUITextView *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = [VUITextView alloc];
  v4 = -[VUITextView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[VUITextView setVuiBackgroundColor:](v4, "setVuiBackgroundColor:", 0);
  -[VUITextView textContainer](v4, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineFragmentPadding");
  self->_defaultLineFragmentPadding = v6;

  -[VUITextView textContainer](v4, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineFragmentPadding:", 0.0);

  -[VUITextView setVuiTextContainerInset:](v4, "setVuiTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
  -[VUITextView setEditable:](v4, "setEditable:", 0);
  -[VUITextView setScrollEnabled:](v4, "setScrollEnabled:", 0);
  -[VUITextView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  -[VUITextView setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
  -[VUITextView setSelectable:](v4, "setSelectable:", 0);
  -[VUITextView vuiLayer](v4, "vuiLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 0.0);

  -[VUITextView textContainer](v4, "textContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaximumNumberOfLines:", 0);

  -[VUITextView textContainer](v4, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineBreakMode:", 2);

  return v4;
}

- (void)setupViews_iOSAndMacOS
{
  VUITextView *v3;
  VUITextView *auxilliaryTextView;
  VUITextView *v5;
  VUITextView *descriptionTextView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUILabel *v11;
  VUILabel *moreLabel;
  VUILabel *v13;
  void *v14;
  VUILabel *v15;
  UITapGestureRecognizer *v16;
  UITapGestureRecognizer *moreLabelTapGestureRecognizer;
  id v18;

  -[FocusableTextView makeTextView](self, "makeTextView");
  v3 = (VUITextView *)objc_claimAutoreleasedReturnValue();
  auxilliaryTextView = self->_auxilliaryTextView;
  self->_auxilliaryTextView = v3;

  -[FocusableTextView addSubview:](self, "addSubview:", self->_auxilliaryTextView);
  -[VUITextView setAlpha:](self->_auxilliaryTextView, "setAlpha:", 0.0);
  self->_descriptionTextAlignment = 4;
  -[FocusableTextView makeTextView](self, "makeTextView");
  v5 = (VUITextView *)objc_claimAutoreleasedReturnValue();
  descriptionTextView = self->_descriptionTextView;
  self->_descriptionTextView = v5;

  -[FocusableTextView addSubview:](self, "addSubview:", self->_descriptionTextView);
  -[FocusableTextView textLayout](self, "textLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v7, "copy");

  objc_msgSend(v18, "setFontWeight:", 10);
  objc_msgSend(v18, "setColor:", 0);
  objc_msgSend(v18, "setTextStyle:", 20);
  objc_msgSend(v18, "setEnableAXUnderlineButtonShape:", 1);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("MORE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedUppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v10, v18, self->_moreLabel);
  v11 = (VUILabel *)objc_claimAutoreleasedReturnValue();
  moreLabel = self->_moreLabel;
  self->_moreLabel = v11;

  -[VUILabel setAdjustsFontForContentSizeCategory:](self->_moreLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[VUILabel setUserInteractionEnabled:](self->_moreLabel, "setUserInteractionEnabled:", 1);
  v13 = self->_moreLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextLayout:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILabel setFont:](v13, "setFont:", v14);

  -[VUILabel sizeToFit](self->_moreLabel, "sizeToFit");
  -[FocusableTextView addSubview:](self, "addSubview:", self->_moreLabel);
  v15 = self->_moreLabel;
  -[FocusableTextView _moreLabelFrame](self, "_moreLabelFrame");
  -[VUILabel setFrame:](v15, "setFrame:");
  v16 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__selectButtonAction_);
  moreLabelTapGestureRecognizer = self->_moreLabelTapGestureRecognizer;
  self->_moreLabelTapGestureRecognizer = v16;

  -[VUILabel addGestureRecognizer:](self->_moreLabel, "addGestureRecognizer:", self->_moreLabelTapGestureRecognizer);
}

- (void)layoutSubviews_iOSAndMacOS
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
  VUILabel *moreLabel;
  VUILabel *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  -[FocusableTextView bounds](self, "bounds");
  if (v5 == 0.0 || (v7 = v6, v6 == 0.0))
  {
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[VUITextView setFrame:](self->_descriptionTextView, "setFrame:", *MEMORY[0x1E0C9D648], v20, v21, v22);
    -[VUILabel setFrame:](self->_moreLabel, "setFrame:", v19, v20, v21, v22);
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v10 = v5;
    -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
    v12 = v9 - v11;
    -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
    v14 = v13;
    -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
    v16 = v7 + v14 + v15;
    -[VUITextView setFrame:](self->_descriptionTextView, "setFrame:", v8, v12, v10, v16);
    -[VUITextView setVuiTextAlignment:](self->_descriptionTextView, "setVuiTextAlignment:", self->_descriptionTextAlignment);
    moreLabel = self->_moreLabel;
    -[FocusableTextView _moreLabelFrame](self, "_moreLabelFrame");
    -[VUILabel setFrame:](moreLabel, "setFrame:");
    -[FocusableTextView _recomputeTextSizeIfNeeded](self, "_recomputeTextSizeIfNeeded");
    v18 = self->_moreLabel;
    if (self->_textTruncating)
    {
      -[VUILabel setHidden:](v18, "setHidden:", 0);
      -[FocusableTextView _moreLabelExclusionPathFrame](self, "_moreLabelExclusionPathFrame");
      -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
    }
    else
    {
      -[VUILabel setHidden:](v18, "setHidden:", 1);
      -[VUITextView textContainer](self->_descriptionTextView, "textContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);

    }
    v24 = *MEMORY[0x1E0C9D538];
    v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[FocusableTextView _moreLabelFrame](self, "_moreLabelFrame");
    -[FocusableTextView configureMoreButtonMaskWithMaskFrame:moreLabelFrame:](self, "configureMoreButtonMaskWithMaskFrame:moreLabelFrame:", v24, v25, v10, v16, v26, v27, v28, v29);
    -[FocusableTextView _updateTextColorsIfNeeded](self, "_updateTextColorsIfNeeded");
  }
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    -[FocusableTextView computeSizeThatFits:](self, "computeSizeThatFits:", a3.width, a3.height);
    width = v6;
    height = v7;
  }
  else
  {
    -[FocusableTextView layoutSubviews_iOSAndMacOS](self, "layoutSubviews_iOSAndMacOS");
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)computeSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[FocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines");
  -[VUITextView textContainer](self->_auxilliaryTextView, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumNumberOfLines:", v6);

  -[VUITextView vui_sizeThatFits:](self->_auxilliaryTextView, "vui_sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;
  -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
  v13 = v12;
  -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
  v15 = v11 - (v13 + v14);
  -[FocusableTextView vuiTraitCollection](self, "vuiTraitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v16, "isAXEnabled");

  if ((_DWORD)v7)
  {
    v17 = (void *)MEMORY[0x1E0DC69B0];
    -[FocusableTextView vuiTraitCollection](self, "vuiTraitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scaleContentSizeValue:forTraitCollection:", v18, 5.0);
    v15 = v15 + v19;

  }
  if (width <= 0.0)
    v20 = v9;
  else
    v20 = width;
  v21 = v15;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;
  CGRect v6;

  -[FocusableTextView bounds](self, "bounds");
  -[FocusableTextView computeSizeThatFits:](self, "computeSizeThatFits:", CGRectGetWidth(v6), 0.0);
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
  -[FocusableTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
  v8.receiver = self;
  v8.super_class = (Class)FocusableTextView;
  -[FocusableTextView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

+ (double)cornerRadius
{
  return 5.0;
}

+ (double)topInset
{
  return 1.0;
}

+ (double)bottomInset
{
  return 1.0;
}

- (void)setSelectable:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_selectable = a3;
  -[VUIBaseView setVuiUserInteractionEnabled:](self, "setVuiUserInteractionEnabled:");
  -[VUITextView setVuiUserInteractionEnabled:](self->_descriptionTextView, "setVuiUserInteractionEnabled:", v3);
  -[VUITextView setSelectable:](self->_descriptionTextView, "setSelectable:", v3);
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
  VUITextView *descriptionTextView;
  void *v14;
  VUITextView *auxilliaryTextView;
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
    v7 = *MEMORY[0x1E0DC1178];
    v8 = objc_msgSend(v5, "length");
    v9 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __40__FocusableTextView_setDescriptionText___block_invoke;
    v24[3] = &unk_1E9FA4AC0;
    v10 = v6;
    v25 = v10;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v24);
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      objc_initWeak(&location, self);
      v11 = objc_msgSend(v5, "length");
      v12 = *MEMORY[0x1E0DC1140];
      v17 = v9;
      v18 = 3221225472;
      v19 = __40__FocusableTextView_setDescriptionText___block_invoke_2;
      v20 = &unk_1E9FA4AE8;
      objc_copyWeak(&v22, &location);
      v21 = v10;
      objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, &v17);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    descriptionTextView = self->_descriptionTextView;
    v14 = (void *)objc_msgSend(v10, "copy", v17, v18, v19, v20);
    -[VUITextView setVuiAttributedText:](descriptionTextView, "setVuiAttributedText:", v14);

    auxilliaryTextView = self->_auxilliaryTextView;
    v16 = (void *)objc_msgSend(v10, "copy");
    -[VUITextView setVuiAttributedText:](auxilliaryTextView, "setVuiAttributedText:", v16);

    -[FocusableTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
    -[FocusableTextView vui_setNeedsLayout](self, "vui_setNeedsLayout");

  }
}

void __40__FocusableTextView_setDescriptionText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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
      v11 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    v12 = v11;

    objc_msgSend(v12, "setLineBreakMode:", 0);
    objc_msgSend(v12, "setAlignment:", 4);
    v13 = *MEMORY[0x1E0DC1178];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1178], a3, a4);
    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v14, "addAttribute:value:range:", v13, v15, a3, a4);

    v8 = v16;
  }

}

void __40__FocusableTextView_setDescriptionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

    v10 = *MEMORY[0x1E0DC1140];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1140], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, v9, a3, a4);

  }
}

- (NSAttributedString)descriptionText
{
  return -[VUITextView vuiAttributedText](self->_descriptionTextView, "vuiAttributedText");
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  void *v5;

  if (-[FocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines") != a3)
  {
    -[VUITextView textContainer](self->_descriptionTextView, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaximumNumberOfLines:", a3);

    -[FocusableTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
    -[FocusableTextView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }
}

- (unint64_t)maximumNumberOfLines
{
  void *v2;
  unint64_t v3;

  -[VUITextView textContainer](self->_descriptionTextView, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumNumberOfLines");

  return v3;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  double result;

  if (a3)
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_computationLabel, "topMarginToLabel:withBaselineMargin:", a4);
  else
    -[FocusableTextView topMarginWithBaselineMargin:](self, "topMarginWithBaselineMargin:", a4);
  return result;
}

- (double)vui_baselineOffsetFromBottom
{
  double result;

  -[VUILabel vui_baselineOffsetFromBottom](self->_computationLabel, "vui_baselineOffsetFromBottom");
  return result;
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  double result;

  -[VUILabel topMarginWithBaselineMargin:](self->_computationLabel, "topMarginWithBaselineMargin:", a3);
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  double result;

  -[VUILabel bottomMarginWithBaselineMargin:](self->_computationLabel, "bottomMarginWithBaselineMargin:", a3);
  return result;
}

- (double)_bottomBaselineOffset
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v10[6];
  _QWORD v11[4];

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
  v4 = v3;
  -[VUITextView textLayoutManager](self->_descriptionTextView, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__FocusableTextView__bottomBaselineOffset__block_invoke;
  v10[3] = &unk_1E9FA4B10;
  v10[4] = v11;
  v10[5] = v4;
  objc_msgSend(v5, "enumerateTextSegmentsInRange:type:options:usingBlock:", v6, 0, 0, v10);
  -[VUITextView bounds](self->_descriptionTextView, "bounds");
  VUIRoundValue();
  v8 = v7;

  _Block_object_dispose(v11, 8);
  return v8;
}

uint64_t __42__FocusableTextView__bottomBaselineOffset__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  double v7;
  double v8;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(double *)(v6 + 24);
  v8 = a3 + *(double *)(a1 + 40) + a6;
  if (v7 < v8)
    v7 = v8;
  *(double *)(v6 + 24) = v7;
  return 1;
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
    -[VUITextView bounds](self->_descriptionTextView, "bounds");
    v4 = v3;
    if (-[FocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines"))
    {
      -[VUITextView textContainer](self->_auxilliaryTextView, "textContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMaximumNumberOfLines:", -[FocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines"));

      -[VUITextView vui_sizeThatFits:](self->_auxilliaryTextView, "vui_sizeThatFits:", v4, 0.0);
      v7 = v6;
      -[VUITextView textContainer](self->_auxilliaryTextView, "textContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMaximumNumberOfLines:", -[FocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines") + 1);

      -[VUITextView vui_sizeThatFits:](self->_auxilliaryTextView, "vui_sizeThatFits:", v4, 0.0);
      self->_textTruncating = v9 > v7;
    }
    else
    {
      self->_textTruncating = 0;
    }
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
  double defaultLineFragmentPadding;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
  v4 = v3;
  v6 = v5;
  -[FocusableTextView _moreLabelFrame](self, "_moreLabelFrame");
  v8 = v7;
  v10 = v9 - v6;
  v12 = v11 - v4;
  v14 = v13 + 0.0;
  defaultLineFragmentPadding = self->_defaultLineFragmentPadding;
  -[VUITextView textContainer](self->_descriptionTextView, "textContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lineFragmentPadding");
  v18 = defaultLineFragmentPadding - v17;

  v19 = v10 - v18;
  v20 = v14 + v18;
  v21 = v12;
  v22 = v8;
  result.size.height = v22;
  result.size.width = v20;
  result.origin.y = v21;
  result.origin.x = v19;
  return result;
}

- (id)_createMoreButtonMaskFade
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12[0] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v6);

  -[VUITextView vuiText](self->_descriptionTextView, "vuiText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isNaturallyRTL");

  if (v8)
    v9 = 1.0;
  else
    v9 = 0.0;
  if (v8)
    v10 = 0.0;
  else
    v10 = 1.0;
  objc_msgSend(v3, "setStartPoint:", v9, 0.5);
  objc_msgSend(v3, "setEndPoint:", v10, 0.5);
  objc_msgSend(v3, "setLocations:", &unk_1EA0BBBC8);
  objc_msgSend(v3, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
  objc_msgSend(v3, "setMasksToBounds:", 1);
  return v3;
}

- (void)configureMoreButtonMaskWithMaskFrame:(CGRect)a3 moreLabelFrame:(CGRect)a4
{
  double width;
  double height;
  double v6;
  double y;
  double x;
  char v10;
  CALayer *moreButtonMask;
  CAGradientLayer *moreButtonMaskFade;
  CALayer *v13;
  CALayer *v14;
  id v15;
  CAGradientLayer *v16;
  CAGradientLayer *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  double v25;
  id v26;

  width = a4.size.width;
  height = a3.size.height;
  v6 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[VUILabel isHidden](self->_moreLabel, "isHidden", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  moreButtonMask = self->_moreButtonMask;
  if ((v10 & 1) != 0)
  {
    self->_moreButtonMask = 0;

    moreButtonMaskFade = self->_moreButtonMaskFade;
    self->_moreButtonMaskFade = 0;

  }
  else
  {
    if (!moreButtonMask)
    {
      v13 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v14 = self->_moreButtonMask;
      self->_moreButtonMask = v13;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](self->_moreButtonMask, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

      -[CALayer setMasksToBounds:](self->_moreButtonMask, "setMasksToBounds:", 1);
      -[FocusableTextView _createMoreButtonMaskFade](self, "_createMoreButtonMaskFade");
      v16 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
      v17 = self->_moreButtonMaskFade;
      self->_moreButtonMaskFade = v16;

      -[CALayer addSublayer:](self->_moreButtonMask, "addSublayer:", self->_moreButtonMaskFade);
      moreButtonMask = self->_moreButtonMask;
    }
    -[CALayer setFrame:](moreButtonMask, "setFrame:", x, y, v6, height);
    -[FocusableTextView _makeLastLineBreakByClipping](self, "_makeLastLineBreakByClipping");
    v19 = v18;
    -[VUITextView vuiTextContainerInset](self->_descriptionTextView, "vuiTextContainerInset");
    v21 = v19 + v20;
    v22 = width * 1.5;
    -[VUITextView vuiText](self->_descriptionTextView, "vuiText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "_isNaturallyRTL");

    v25 = v6 - v22;
    if (v24)
      v25 = 0.0;
    -[CAGradientLayer setFrame:](self->_moreButtonMaskFade, "setFrame:", v25, v21, v22, height - v21);
  }
  -[VUITextView layer](self->_descriptionTextView, "layer");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setMask:", self->_moreButtonMask);

}

- (CGRect)_getStartAndEndIndexOfLastVisibleLine:(id)a3 startIndex:(unint64_t *)a4 endIndex:(unint64_t *)a5
{
  id v7;
  __int128 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[7];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  CGRect result;

  v7 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x4010000000;
  v22 = &unk_1DA394075;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v23 = *MEMORY[0x1E0C9D648];
  v24 = v8;
  objc_msgSend(v7, "documentRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__FocusableTextView__getStartAndEndIndexOfLastVisibleLine_startIndex_endIndex___block_invoke;
  v18[3] = &unk_1E9FA4B38;
  v18[4] = &v19;
  v18[5] = &v25;
  v18[6] = &v29;
  objc_msgSend(v7, "enumerateTextSegmentsInRange:type:options:usingBlock:", v9, 0, 0, v18);
  *a4 = v26[3];
  *a5 = v30[3];
  v10 = v20[4];
  v11 = v20[5];
  v12 = v20[6];
  v13 = v20[7];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

uint64_t __79__FocusableTextView__getStartAndEndIndexOfLastVisibleLine_startIndex_endIndex___block_invoke(_QWORD *a1, void *a2, double a3, double a4, double a5, double a6)
{
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(double **)(a1[4] + 8);
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = a5;
  v7[7] = a6;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v8 = objc_msgSend(a2, "range");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v8 + v9;
  return 1;
}

- (CGRect)_makeLastLineBreakByClipping
{
  void *v3;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  VUITextView *descriptionTextView;
  void *v21;
  VUITextView *auxilliaryTextView;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[4];
  id v29;
  unint64_t v30;
  uint64_t v31;
  CGRect result;

  v30 = 0;
  v31 = 0;
  -[VUITextView vuiAttributedText](self->_descriptionTextView, "vuiAttributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  -[VUITextView textLayoutManager](self->_descriptionTextView, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FocusableTextView _getStartAndEndIndexOfLastVisibleLine:startIndex:endIndex:](self, "_getStartAndEndIndexOfLastVisibleLine:startIndex:endIndex:", v5, &v31, &v30);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v30;
  v15 = v31;
  if (v14 <= objc_msgSend(v3, "length"))
  {
    v16 = v14 - v15;
    v17 = *MEMORY[0x1E0DC1178];
    v18 = v31;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __49__FocusableTextView__makeLastLineBreakByClipping__block_invoke;
    v28[3] = &unk_1E9FA4AC0;
    v19 = v4;
    v29 = v19;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v17, v18, v16, 0, v28);
    descriptionTextView = self->_descriptionTextView;
    v21 = (void *)objc_msgSend(v19, "copy");
    -[VUITextView setVuiAttributedText:](descriptionTextView, "setVuiAttributedText:", v21);

    auxilliaryTextView = self->_auxilliaryTextView;
    v23 = (void *)objc_msgSend(v19, "copy");
    -[VUITextView setVuiAttributedText:](auxilliaryTextView, "setVuiAttributedText:", v23);

  }
  v24 = v7;
  v25 = v9;
  v26 = v11;
  v27 = v13;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

void __49__FocusableTextView__makeLastLineBreakByClipping__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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
      v11 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    v12 = v11;

    objc_msgSend(v12, "setLineBreakMode:", 2);
    objc_msgSend(v12, "setAlignment:", 4);
    v13 = *MEMORY[0x1E0DC1178];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1178], a3, a4);
    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v14, "addAttribute:value:range:", v13, v15, a3, a4);

    v8 = v16;
  }

}

- (CGRect)_moreLabelFrame
{
  void *v3;
  int v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double MaxX;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double Width;
  double v23;
  void *v24;
  double MaxY;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  -[VUITextView vuiText](self->_descriptionTextView, "vuiText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isNaturallyRTL");

  -[VUITextView frame](self->_descriptionTextView, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[VUILabel sizeThatFits:](self->_moreLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v14 = v13;
  v16 = v15;
  v17 = 3.0;
  if ((v4 & 1) == 0)
  {
    v34.origin.x = v6;
    v34.origin.y = v8;
    v34.size.width = v10;
    v34.size.height = v12;
    MaxX = CGRectGetMaxX(v34);
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.width = v14;
    v35.size.height = v16;
    v17 = MaxX - CGRectGetWidth(v35) + -3.0;
  }
  v19 = v10;
  v20 = v8;
  v21 = v6;
  v36.origin.y = 0.0;
  v36.origin.x = v17;
  v36.size.width = v14;
  v36.size.height = v16;
  Width = CGRectGetWidth(v36);
  v23 = v14 + 3.0;
  if (v4)
  {
    v37.origin.y = 0.0;
    v37.origin.x = v17;
    v37.size.width = v23;
    v37.size.height = v16;
    v17 = v17 + Width - CGRectGetWidth(v37);
  }
  -[VUITextView vuiAttributedText](self->_descriptionTextView, "vuiAttributedText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38.origin.x = v21;
  v38.origin.y = v20;
  v38.size.width = v19;
  v38.size.height = v12;
  MaxY = CGRectGetMaxY(v38);
  v39.origin.x = v17;
  v39.origin.y = 0.0;
  v39.size.width = v23;
  v39.size.height = v16;
  v26 = floor(MaxY - CGRectGetHeight(v39));
  if (objc_msgSend(v24, "length"))
  {
    -[FocusableTextView _bottomBaselineOffset](self, "_bottomBaselineOffset");
    v28 = v27;
    -[VUILabel vui_baselineOffsetFromBottom](self->_moreLabel, "vui_baselineOffsetFromBottom");
    v26 = v26 + v29 - v28;
  }

  v30 = v17;
  v31 = v26;
  v32 = v23;
  v33 = v16;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FocusableTextView;
  -[FocusableTextView tintColorDidChange](&v4, sel_tintColorDidChange);
  if (-[FocusableTextView tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  else
    -[FocusableTextView moreLabelTextColor](self, "moreLabelTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILabel setTextColor:](self->_moreLabel, "setTextColor:", v3);

}

- (void)_updateTextColor
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  -[VUITextLayout color](self->_textLayout, "color");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout seeMoreTextColor](self->_textLayout, "seeMoreTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = v12;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[VUITextLayout highContrastTintColor](self->_textLayout, "highContrastTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      v7 = v12;
    }
    else
    {
      -[FocusableTextView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v12);
      v8 = objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v6 = (id)v8;
    }

    v12 = v6;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v12, "colorByRemovingTransparency");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "colorByRemovingTransparency");
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v10;
    v11 = (id)v9;
  }
  else
  {
    v11 = v12;
  }
  v13 = v11;
  -[FocusableTextView setDescriptionTextColor:](self, "setDescriptionTextColor:", v11);
  -[FocusableTextView setMoreLabelTextColor:](self, "setMoreLabelTextColor:", v3);

}

- (void)_configureAlignmentWithTextAlignment:(int64_t)a3 allowsTextAlignmentOverride:(BOOL)a4
{
  int64_t v4;

  v4 = a3;
  if (a4 && ((a3 == 4) & -[FocusableTextView vuiIsRTL](self, "vuiIsRTL")) != 0)
    v4 = 2;
  -[FocusableTextView setDescriptionTextAlignment:](self, "setDescriptionTextAlignment:", v4);
}

- (void)_selectButtonAction:(id)a3
{
  id v4;
  void (**selectionHandler)(void);
  id v6;

  v4 = a3;
  selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler && self->_textTruncating)
  {
    v6 = v4;
    selectionHandler[2]();
    v4 = v6;
  }

}

- (double)vuiBaselineHeight
{
  return self->vuiBaselineHeight;
}

- (VUILabel)computationLabel
{
  return self->_computationLabel;
}

- (void)setComputationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_computationLabel, a3);
}

- (UIColor)descriptionTextColor
{
  return self->_descriptionTextColor;
}

- (int64_t)descriptionTextAlignment
{
  return self->_descriptionTextAlignment;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (BOOL)isTextTruncating
{
  return self->_textTruncating;
}

- (UIColor)moreLabelTextColor
{
  return self->_moreLabelTextColor;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (VUITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextView, a3);
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

- (int64_t)originalMaximumNumberOfLines
{
  return self->_originalMaximumNumberOfLines;
}

- (void)setOriginalMaximumNumberOfLines:(int64_t)a3
{
  self->_originalMaximumNumberOfLines = a3;
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_textLayout, a3);
}

- (VUILabel)moreLabel
{
  return self->_moreLabel;
}

- (void)setMoreLabel:(id)a3
{
  objc_storeStrong((id *)&self->_moreLabel, a3);
}

- (CALayer)moreButtonMask
{
  return self->_moreButtonMask;
}

- (void)setMoreButtonMask:(id)a3
{
  objc_storeStrong((id *)&self->_moreButtonMask, a3);
}

- (CAGradientLayer)moreButtonMaskFade
{
  return self->_moreButtonMaskFade;
}

- (void)setMoreButtonMaskFade:(id)a3
{
  objc_storeStrong((id *)&self->_moreButtonMaskFade, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButtonMaskFade, 0);
  objc_storeStrong((id *)&self->_moreButtonMask, 0);
  objc_storeStrong((id *)&self->_moreLabel, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_moreLabelTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_moreLabelTextColor, 0);
  objc_storeStrong((id *)&self->_descriptionTextColor, 0);
  objc_storeStrong((id *)&self->_computationLabel, 0);
  objc_storeStrong((id *)&self->_auxilliaryTextView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
