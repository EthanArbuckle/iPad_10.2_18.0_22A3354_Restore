@implementation SFAirDropInstructionsViewController

- (id)_instructionsText
{
  return (id)SFLocalizedStringForKey();
}

- (id)_airDropText
{
  return (id)SFLocalizedStringForKey();
}

- (id)_instructionsBaseFormatString
{
  return (id)SFLocalizedStringForKey();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  SFCollectionViewLayout *v6;
  SFCollectionViewLayout *collectionViewLayout;
  SFAirDropActiveIconView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SFAirDropActiveIconView *v13;
  SFAirDropActiveIconView *airDropActiveIconView;
  void *v15;
  UITextView *v16;
  UITextView *instructionsTextView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SFAirDropInstructionsViewController;
  -[SFAirDropInstructionsViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[SFAirDropInstructionsViewController _airDropText](self, "_airDropText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropInstructionsViewController setTitle:](self, "setTitle:", v3);

  -[SFAirDropInstructionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setOpaque:", 0);
  v6 = objc_alloc_init(SFCollectionViewLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v6;

  -[SFCollectionViewLayout setFallbackDelegate:](self->_collectionViewLayout, "setFallbackDelegate:", self);
  v8 = [SFAirDropActiveIconView alloc];
  v9 = *MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v13 = -[SFAirDropActiveIconView initWithFrame:grayscale:](v8, "initWithFrame:grayscale:", 0, *MEMORY[0x24BDBF090], v10, v11, v12);
  airDropActiveIconView = self->_airDropActiveIconView;
  self->_airDropActiveIconView = v13;

  -[SFAirDropActiveIconView setAlpha:](self->_airDropActiveIconView, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView setBackgroundColor:](self->_airDropActiveIconView, "setBackgroundColor:", v15);

  v16 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA88]), "initReadonlyAndUnselectableWithFrame:textContainer:", 0, v9, v10, v11, v12);
  instructionsTextView = self->_instructionsTextView;
  self->_instructionsTextView = v16;

  -[UITextView setScrollingEnabled:](self->_instructionsTextView, "setScrollingEnabled:", 0);
  -[UITextView textContainer](self->_instructionsTextView, "textContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineFragmentPadding:", 0.0);

  -[UITextView setTextContainerInset:](self->_instructionsTextView, "setTextContainerInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  -[UITextView textContainer](self->_instructionsTextView, "textContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMaximumNumberOfLines:", 0);

  -[UITextView textContainer](self->_instructionsTextView, "textContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLineBreakMode:", 4);

  -[UITextView setTextAlignment:](self->_instructionsTextView, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.05, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_instructionsTextView, "setTextColor:", v21);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_instructionsTextView, "setBackgroundColor:", v22);

  -[UITextView setAlpha:](self->_instructionsTextView, "setAlpha:", 1.0);
  -[UITextView setTextAlignment:](self->_instructionsTextView, "setTextAlignment:", 4);
  objc_msgSend(v4, "addSubview:", self->_airDropActiveIconView);
  objc_msgSend(v4, "addSubview:", self->_instructionsTextView);
  -[SFAirDropInstructionsViewController _updateFontSizes](self, "_updateFontSizes");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAirDropInstructionsViewController;
  -[SFAirDropInstructionsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SFAirDropInstructionsViewController _layoutiOSSubviews](self, "_layoutiOSSubviews");
  -[SFAirDropInstructionsViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (double)_titleLabelHeight
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSComparisonResult v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {

LABEL_5:
    v12 = *MEMORY[0x24BEBE1E8];
    -[SFAirDropInstructionsViewController _screen](self, "_screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _SFPersonCollectionViewMaximumSizeCategory(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropInstructionsViewController _fontWithStyle:maxSizeCategory:traits:](self, "_fontWithStyle:maxSizeCategory:traits:", v12, v13, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v5 = (NSString *)*MEMORY[0x24BEBE098];
  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8 == NSOrderedAscending)
    goto LABEL_5;
  v9 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_scaledValueForValue:", 11.0);
  objc_msgSend(v9, "systemFontOfSize:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  objc_msgSend(v11, "lineHeight");
  -[SFAirDropInstructionsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UICeilToViewScale();
  v16 = v15;

  return v16;
}

- (void)_layoutiOSSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  CGFloat v9;
  void *v10;
  NSString *v11;
  _BOOL4 IsAccessibilityCategory;
  NSComparisonResult v13;
  int v14;
  char v15;
  SFCollectionViewLayout *collectionViewLayout;
  SFCollectionViewLayout *v17;
  id v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UITextView *instructionsTextView;
  UITextView *v26;
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
  id v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  -[SFAirDropInstructionsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v6 = 76.0;
  else
    v6 = 60.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = dbl_2127A2B00[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  self->_minimumPreferredContentSize.width = 0.0;
  self->_minimumPreferredContentSize.height = v9;
  UIRoundToViewScale();
  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);
  v13 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE098], v11);
  v14 = v13 == NSOrderedAscending || IsAccessibilityCategory;
  if (v14 == 1)
  {
    v15 = v13 != NSOrderedAscending || IsAccessibilityCategory;
    if ((v15 & 1) == 0)
    {
      collectionViewLayout = self->_collectionViewLayout;
      objc_msgSend(v3, "bounds");
      -[SFCollectionViewLayout firstItemCenterForContainerWidth:](collectionViewLayout, "firstItemCenterForContainerWidth:", CGRectGetWidth(v43));
    }
  }
  else
  {
    v17 = self->_collectionViewLayout;
    objc_msgSend(v3, "bounds");
    -[SFCollectionViewLayout firstItemCenterForContainerWidth:](v17, "firstItemCenterForContainerWidth:", CGRectGetWidth(v44));
  }
  -[SFAirDropInstructionsViewController _titleLabelHeight](self, "_titleLabelHeight");
  objc_msgSend(v3, "safeAreaInsets");
  v18 = v3;
  v19 = objc_msgSend(v18, "_shouldReverseLayoutDirection");
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 11.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lineHeight");
    UIRoundToViewScale();

    objc_msgSend(v18, "safeAreaInsets");
  }
  UIRoundToViewScale();
  v22 = v21;
  if ((v19 & 1) != 0)
  {
    objc_msgSend(v18, "bounds");
    CGRectGetMaxX(v45);
  }
  objc_msgSend(v18, "safeAreaInsets");
  UIRoundToViewScale();
  v24 = v23;

  -[SFAirDropActiveIconView setFrame:](self->_airDropActiveIconView, "setFrame:", v24, v22, v6, v6);
  instructionsTextView = self->_instructionsTextView;
  v42 = v18;
  v26 = instructionsTextView;
  if ((objc_msgSend(v42, "_shouldReverseLayoutDirection") & 1) != 0)
  {
    objc_msgSend(v42, "safeAreaInsets");
    UIRoundToViewScale();
    v28 = v27;
    v46.origin.x = v24;
    v46.origin.y = v22;
    v46.size.width = v6;
    v46.size.height = v6;
    CGRectGetMinX(v46);
  }
  else
  {
    v47.origin.x = v24;
    v47.origin.y = v22;
    v47.size.width = v6;
    v47.size.height = v6;
    CGRectGetMaxX(v47);
    UIRoundToViewScale();
    v28 = v29;
    objc_msgSend(v42, "bounds");
    CGRectGetMaxX(v48);
    objc_msgSend(v42, "safeAreaInsets");
  }
  UIFloorToViewScale();
  v31 = v30;
  -[UITextView sizeThatFits:](v26, "sizeThatFits:");

  UICeilToViewScale();
  v33 = v32;
  v34 = v24;
  v35 = v22;
  v36 = v6;
  v37 = v6;
  if (v14)
    CGRectGetMinY(*(CGRect *)&v34);
  else
    CGRectGetMidY(*(CGRect *)&v34);
  UIRoundToViewScale();
  v39 = v38;
  objc_msgSend(v42, "bounds");
  CGRectGetHeight(v49);
  objc_msgSend(v42, "safeAreaInsets");
  UIFloorToViewScale();
  if (v33 >= v40)
    v41 = v40;
  else
    v41 = v33;

  -[UITextView setFrame:](self->_instructionsTextView, "setFrame:", v28, v39, v31, v41);
}

- (void)updatePreferredContentSize
{
  CGSize *p_minimumPreferredContentSize;
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSString *lhs;

  p_minimumPreferredContentSize = &self->_minimumPreferredContentSize;
  width = self->_minimumPreferredContentSize.width;
  height = self->_minimumPreferredContentSize.height;
  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  lhs = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x24BEBE0A0]) != NSOrderedAscending)
  {
    -[SFAirDropInstructionsViewController _cachedPreferredItemSize](self, "_cachedPreferredItemSize");
    v8 = v7;
    -[SFAirDropInstructionsViewController _titleLabelHeight](self, "_titleLabelHeight");
    v10 = v8 + v9 + 20.0;
    if (v10 >= p_minimumPreferredContentSize->height)
      height = v10;
    else
      height = p_minimumPreferredContentSize->height;
    width = 0.0;
  }
  -[SFAirDropInstructionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFAirDropInstructionsViewController;
  v4 = a3;
  -[SFAirDropInstructionsViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
  {
    -[SFAirDropInstructionsViewController _updateFontSizes](self, "_updateFontSizes");
    -[SFAirDropInstructionsViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateConstraints");

    -[SFAirDropInstructionsViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
}

- (void)_updateFontSizes
{
  void *v3;
  void *v4;
  id v5;

  -[SFAirDropInstructionsViewController title](self, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAirDropInstructionsViewController _instructionsText](self, "_instructionsText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropInstructionsViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_instructionsTextView, "setAttributedText:", v4);

}

- (id)_fontWithStyle:(id)a3 maxSizeCategory:(id)a4 traits:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v11, (UIContentSizeCategory)v9) != NSOrderedAscending)
  {
    v12 = v9;

    v11 = v12;
  }
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)attributedStringWithTitle:(id)a3 content:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  NSComparisonResult v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a4;
  -[SFAirDropInstructionsViewController _instructionsBaseFormatString](self, "_instructionsBaseFormatString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v12))
  {

LABEL_5:
    v24 = *MEMORY[0x24BEBE1E8];
    -[SFAirDropInstructionsViewController _screen](self, "_screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _SFPersonCollectionViewMaximumSizeCategory(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropInstructionsViewController _fontWithStyle:maxSizeCategory:traits:](self, "_fontWithStyle:maxSizeCategory:traits:", v24, v26, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFAirDropInstructionsViewController _screen](self, "_screen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _SFPersonCollectionViewMaximumSizeCategory(v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropInstructionsViewController _fontWithStyle:maxSizeCategory:traits:](self, "_fontWithStyle:maxSizeCategory:traits:", v24, v27, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v13 = (NSString *)*MEMORY[0x24BEBE098];
  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = UIContentSizeCategoryCompareToCategory(v13, v15);

  if (v16 == NSOrderedAscending)
    goto LABEL_5;
  v17 = (void *)MEMORY[0x24BEBB520];
  v18 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_scaledValueForValue:", 11.0);
  objc_msgSend(v17, "boldSystemFontOfSize:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_scaledValueForValue:", 11.0);
  objc_msgSend(v21, "systemFontOfSize:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  v28 = objc_msgSend(v10, "rangeOfString:", v6);
  v30 = v29;
  v38 = *MEMORY[0x24BEBB360];
  v31 = v38;
  v39[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v31;
  v37 = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v10, v33);
  objc_msgSend(v34, "setAttributes:range:", v32, v28, v30);

  return v34;
}

- (CGSize)_cachedPreferredItemSize
{
  void *v3;
  double Width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;

  -[SFAirDropInstructionsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v14);
  -[SFAirDropInstructionsViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFPersonCollectionViewCell _cachedPreferredItemSizeForViewWidth:sizeCategory:](SFPersonCollectionViewCell, "_cachedPreferredItemSizeForViewWidth:sizeCategory:", v6, Width);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UITextView)instructionsTextView
{
  return self->_instructionsTextView;
}

- (SFAirDropActiveIconView)airDropActiveIconView
{
  return self->_airDropActiveIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airDropActiveIconView, 0);
  objc_storeStrong((id *)&self->_instructionsTextView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end
