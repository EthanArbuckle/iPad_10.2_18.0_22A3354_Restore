@implementation PKPaymentTransactionView

- (PKPaymentTransactionView)initWithFrame:(CGRect)a3
{
  PKPaymentTransactionView *v3;
  PKPaymentTransactionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentTransactionView;
  v3 = -[PKPaymentTransactionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKPaymentTransactionView createSubviews](v3, "createSubviews");
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  if (-[PKPaymentTransactionView _shouldUseStackedLayout](self, "_shouldUseStackedLayout", a3.width, a3.height))
  {
    self->_isTemplateLayout = 1;
    -[PKPaymentTransactionView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, 3.40282347e38);
    self->_isTemplateLayout = 0;
  }
  else
  {
    -[PKPaymentTransactionView _defaultLayoutHeight](self, "_defaultLayoutHeight");
    v6 = v7;
    v5 = width;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)createSubviews
{
  UILabel *v3;
  UILabel *primaryLabel;
  UILabel *v5;
  UILabel *secondaryLabel;
  UILabel *v7;
  UILabel *tertiaryLabel;
  UILabel *v9;
  UILabel *transactionValueLabel;
  UILabel *v11;
  UILabel *badgeLabel;
  UIImageView *v13;
  UIImageView *bonusImageView;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  UIImageView *v27;
  void *v28;
  UIImageView *v29;
  void *v30;
  id v31;

  if (!self->_primaryLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = self->_primaryLabel;
    self->_primaryLabel = v3;

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = self->_secondaryLabel;
    self->_secondaryLabel = v5;

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    tertiaryLabel = self->_tertiaryLabel;
    self->_tertiaryLabel = v7;

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    transactionValueLabel = self->_transactionValueLabel;
    self->_transactionValueLabel = v9;

    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    badgeLabel = self->_badgeLabel;
    self->_badgeLabel = v11;

    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    bonusImageView = self->_bonusImageView;
    self->_bonusImageView = v13;

    v15 = self->_primaryLabel;
    -[PKPaymentTransactionView defaultPrimaryColor](self, "defaultPrimaryColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    v17 = self->_secondaryLabel;
    -[PKPaymentTransactionView defaultSecondaryColor](self, "defaultSecondaryColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    v19 = self->_tertiaryLabel;
    -[PKPaymentTransactionView defaultSecondaryColor](self, "defaultSecondaryColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    v21 = self->_badgeLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    v23 = self->_badgeLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[UILabel setTextAlignment:](self->_badgeLabel, "setTextAlignment:", 1);
    -[UILabel layer](self->_badgeLabel, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", 4.0);

    -[UILabel layer](self->_badgeLabel, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMasksToBounds:", 1);

    v27 = self->_bonusImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v27, "setTintColor:", v28);

    v29 = self->_bonusImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v29, "setBackgroundColor:", v30);

    -[UIImageView setContentMode:](self->_bonusImageView, "setContentMode:", 4);
    -[UIImageView setHidden:](self->_bonusImageView, "setHidden:", 1);
    -[UIImageView layer](self->_bonusImageView, "layer");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerRadius:", 4.0);
    objc_msgSend(v31, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v31, "setMasksToBounds:", 1);
    -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[UILabel setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68108]);
    -[UILabel setAccessibilityIdentifier:](self->_transactionValueLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D681B8]);
    -[UILabel setAccessibilityIdentifier:](self->_badgeLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67920]);
    -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_primaryLabel);
    -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_secondaryLabel);
    -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_tertiaryLabel);
    -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_transactionValueLabel);
    -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_badgeLabel);
    -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_bonusImageView);
    -[PKPaymentTransactionView setStrokeImage:](self, "setStrokeImage:", 1);
    -[PKPaymentTransactionView resetFonts](self, "resetFonts");
    -[PKPaymentTransactionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68130]);

  }
}

- (void)resetFonts
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v5;
  uint64_t v6;
  UILabel *primaryLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *transactionValueLabel;
  void *v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  UILabel *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
    v5 = 2;
  else
    v5 = 1;
  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", v5);
  -[UILabel setNumberOfLines:](self->_tertiaryLabel, "setNumberOfLines:", v5);
  v6 = PKUIGetMinScreenWidthType();
  primaryLabel = self->_primaryLabel;
  if (v6)
    v8 = (void *)*MEMORY[0x1E0DC4A88];
  else
    v8 = (void *)*MEMORY[0x1E0DC4B10];
  v9 = (void *)*MEMORY[0x1E0DC4938];
  if (v6)
    v10 = (void *)*MEMORY[0x1E0DC4B10];
  else
    v10 = (void *)*MEMORY[0x1E0DC4AB8];
  PKFontForDefaultDesign(v8, (void *)*MEMORY[0x1E0DC4938], 32770, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](primaryLabel, "setFont:", v11);

  PKFontForDefaultDesign(v10, v9, 0x8000, 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v22);
  -[UILabel setFont:](self->_tertiaryLabel, "setFont:", v22);
  transactionValueLabel = self->_transactionValueLabel;
  PKFontForDefaultDesign(v8, v9, 0, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](transactionValueLabel, "setFont:", v13);

  if (self->_hideBadgeBackground)
  {
    v14 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  -[UILabel setFont:](self->_badgeLabel, "setFont:", v14);
  v16 = -[PKPaymentTransactionView _shouldUseStackedLayout](self, "_shouldUseStackedLayout");
  v17 = self->_transactionValueLabel;
  if (v16)
  {
    -[UILabel setAdjustsFontSizeToFitWidth:](v17, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_transactionValueLabel, "setMinimumScaleFactor:", 0.5);
  }
  else
  {
    -[UILabel setAdjustsFontSizeToFitWidth:](v17, "setAdjustsFontSizeToFitWidth:", 0);
  }
  if (self->_hideSecondaryBadgeSymbolBackground)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v19, "scaledValueForValue:", 8.0);
    objc_msgSend(v20, "configurationWithPointSize:weight:scale:", 7, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_secondaryBadgeSymbolConfiguration)
  {
    objc_msgSend(v18, "configurationByApplyingConfiguration:");
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }
  -[UIImageView setPreferredSymbolConfiguration:](self->_bonusImageView, "setPreferredSymbolConfiguration:", v18);

}

- (BOOL)_shouldUseStackedLayout
{
  void *v2;
  double v3;
  BOOL v4;

  -[UILabel font](self->_transactionValueLabel, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3 >= 25.0;

  return v4;
}

- (void)setPrimaryString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  NSString *v10;
  NSString *v11;
  BOOL v12;
  BOOL v13;
  NSString *v14;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR(" ");
  v9 = v8;

  v10 = self->_primaryString;
  v11 = v9;
  v14 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if (v11)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
    {

LABEL_13:
      objc_storeStrong((id *)&self->_primaryString, v8);
      -[PKPaymentTransactionView _updatePrimaryLabelString](self, "_updatePrimaryLabelString");
      -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_14;
    }
    v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_13;
  }
LABEL_14:

}

- (void)setAllowPrimaryStringExpansion:(BOOL)a3
{
  if (self->_allowPrimaryStringExpansion != a3)
  {
    self->_allowPrimaryStringExpansion = a3;
    -[PKPaymentTransactionView _updatePrimaryLabelString](self, "_updatePrimaryLabelString");
    -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updatePrimaryLabelString
{
  double v3;

  -[UILabel setText:](self->_primaryLabel, "setText:", self->_primaryString);
  if (!self->_primaryString || (LODWORD(v3) = 1.0, !self->_allowPrimaryStringExpansion))
    LODWORD(v3) = 0;
  -[UILabel _setHyphenationFactor:](self->_primaryLabel, "_setHyphenationFactor:", v3);
}

- (id)defaultPrimaryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (void)setPrimaryColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    +[PKPaymentTransactionView appearance](PKPaymentTransactionView, "appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[PKPaymentTransactionView defaultPrimaryColor](self, "defaultPrimaryColor");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v9;

  }
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v5);

}

- (void)setSecondaryString:(id)a3
{
  -[UILabel setText:](self->_secondaryLabel, "setText:", a3);
  -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
}

- (id)defaultSecondaryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)setSecondaryColor:(id)a3
{
  id v4;
  UIColor *v5;
  void *v6;
  void *v7;
  void *v8;
  UIColor *v9;
  UIColor *secondaryColor;
  UIColor *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    v5 = (UIColor *)v4;
  }
  else
  {
    +[PKPaymentTransactionView appearance](PKPaymentTransactionView, "appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[PKPaymentTransactionView defaultSecondaryColor](self, "defaultSecondaryColor");
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v9;

  }
  secondaryColor = self->_secondaryColor;
  self->_secondaryColor = v5;
  v11 = v5;

  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v11);
}

- (void)setTertiaryString:(id)a3
{
  -[UILabel setText:](self->_tertiaryLabel, "setText:", a3);
  -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
}

+ (id)defaultTertiaryLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
}

- (void)setBadgeString:(id)a3
{
  UILabel *badgeLabel;
  id v5;
  uint64_t v6;

  badgeLabel = self->_badgeLabel;
  v5 = a3;
  -[UILabel setText:](badgeLabel, "setText:", v5);
  v6 = objc_msgSend(v5, "length");

  -[UILabel setHidden:](self->_badgeLabel, "setHidden:", v6 == 0);
  -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHideBadgeBackground:(BOOL)a3
{
  UILabel *badgeLabel;
  void *v5;

  if (self->_hideBadgeBackground != a3)
  {
    self->_hideBadgeBackground = a3;
    badgeLabel = self->_badgeLabel;
    if (a3)
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](badgeLabel, "setBackgroundColor:", v5);

    -[PKPaymentTransactionView resetFonts](self, "resetFonts");
    -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)badgeString
{
  return -[UILabel text](self->_badgeLabel, "text");
}

- (void)setTransactionValueAttributedText:(id)a3
{
  -[UILabel setAttributedText:](self->_transactionValueLabel, "setAttributedText:", a3);
  -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
}

- (NSAttributedString)transactionValueAttributedText
{
  return -[UILabel attributedText](self->_transactionValueLabel, "attributedText");
}

- (void)setSecondaryBadgeSymbol:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  UIImageView *bonusImageView;
  void *v10;
  NSString *v11;

  v5 = a3;
  v6 = self->_secondaryBadgeSymbol;
  v7 = (NSString *)v5;
  v11 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_secondaryBadgeSymbol, a3);
    bonusImageView = self->_bonusImageView;
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", self->_secondaryBadgeSymbol);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](bonusImageView, "setImage:", v10);

    -[UIImageView setHidden:](self->_bonusImageView, "setHidden:", v11 == 0);
    -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
    -[PKPaymentTransactionView layoutIfNeeded](self, "layoutIfNeeded");
  }
LABEL_9:

}

- (void)setHideSecondaryBadgeSymbolBackground:(BOOL)a3
{
  UIImageView *bonusImageView;
  void *v5;

  if (self->_hideSecondaryBadgeSymbolBackground != a3)
  {
    self->_hideSecondaryBadgeSymbolBackground = a3;
    bonusImageView = self->_bonusImageView;
    if (a3)
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](bonusImageView, "setBackgroundColor:", v5);

    -[PKPaymentTransactionView resetFonts](self, "resetFonts");
    -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSecondaryBadgeSymbolConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryBadgeSymbolConfiguration, a3);
    -[PKPaymentTransactionView resetFonts](self, "resetFonts");
    -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPrimaryImage:(id)a3
{
  -[PKPaymentTransactionView setPrimaryImage:animated:](self, "setPrimaryImage:animated:", a3, 0);
}

- (void)setStrokeImage:(BOOL)a3
{
  UIImageView *primaryImageView;
  double v5;
  id v6;

  if (((!self->_strokeImage ^ a3) & 1) == 0)
  {
    self->_strokeImage = a3;
    primaryImageView = self->_primaryImageView;
    if (primaryImageView)
    {
      -[UIImageView layer](primaryImageView, "layer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (self->_strokeImage)
        v5 = PKUIPixelLength();
      else
        v5 = 0.0;
      objc_msgSend(v6, "setBorderWidth:", v5);

    }
  }
}

- (void)setPrimaryImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  UIImage **p_primaryImage;
  UIImageView *primaryImageView;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;
  void *v13;
  double v14;
  void *v15;
  UIImageView *v16;
  UIImageView *v17;
  void *v18;
  double v19;
  UIImageView *v20;
  UIImageView *v21;
  UIImageView *v22;
  UIImageView *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  UIImageView *v30;
  _QWORD v31[5];
  UIImageView *v32;

  v4 = a4;
  v7 = (UIImage *)a3;
  p_primaryImage = &self->_primaryImage;
  if (self->_primaryImage != v7)
  {
    objc_storeStrong((id *)&self->_primaryImage, a3);
    if (*p_primaryImage)
    {
      -[PKPaymentTransactionView setShowsAvatarView:](self, "setShowsAvatarView:", 0);
      primaryImageView = self->_primaryImageView;
      if (primaryImageView)
      {
        if (v4)
        {
          v10 = primaryImageView;
          v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_primaryImage);
          v12 = self->_primaryImageView;
          self->_primaryImageView = v11;

          -[UIImageView setContentMode:](self->_primaryImageView, "setContentMode:", 1);
          -[UIImageView setClipsToBounds:](self->_primaryImageView, "setClipsToBounds:", 1);
          -[UIImageView _setContinuousCornerRadius:](self->_primaryImageView, "_setContinuousCornerRadius:", 4.0);
          -[PKPaymentTransactionView _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
          -[UIImageView layer](self->_primaryImageView, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (self->_strokeImage)
            v14 = PKUIPixelLength();
          else
            v14 = 0.0;
          objc_msgSend(v13, "setBorderWidth:", v14);

          -[UIImageView setImage:](self->_primaryImageView, "setImage:", *p_primaryImage);
          -[UIImageView setAlpha:](self->_primaryImageView, "setAlpha:", 0.0);
          v26 = MEMORY[0x1E0C809B0];
          v27 = (void *)MEMORY[0x1E0DC3F10];
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __53__PKPaymentTransactionView_setPrimaryImage_animated___block_invoke;
          v31[3] = &unk_1E3E61388;
          v31[4] = self;
          v32 = v10;
          v29[0] = v26;
          v29[1] = 3221225472;
          v29[2] = __53__PKPaymentTransactionView_setPrimaryImage_animated___block_invoke_2;
          v29[3] = &unk_1E3E62288;
          v30 = v32;
          v20 = v32;
          objc_msgSend(v27, "pkui_animateUsingOptions:animations:completion:", 4, v31, v29);

        }
        else
        {
          -[UIImageView image](primaryImageView, "image");
          v20 = (UIImageView *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](self->_primaryImageView, "setImage:", *p_primaryImage);
          -[UIImageView image](self->_primaryImageView, "image");
          v21 = (UIImageView *)objc_claimAutoreleasedReturnValue();

          if (v21 == v20)
          {
            -[UIImageView removeFromSuperview](self->_primaryImageView, "removeFromSuperview");
            v22 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_primaryImage);
            v23 = self->_primaryImageView;
            self->_primaryImageView = v22;

            -[UIImageView setContentMode:](self->_primaryImageView, "setContentMode:", 1);
            -[UIImageView setClipsToBounds:](self->_primaryImageView, "setClipsToBounds:", 1);
            -[UIImageView _setContinuousCornerRadius:](self->_primaryImageView, "_setContinuousCornerRadius:", 4.0);
            -[PKPaymentTransactionView _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
            -[UIImageView layer](self->_primaryImageView, "layer");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (self->_strokeImage)
              v25 = PKUIPixelLength();
            else
              v25 = 0.0;
            objc_msgSend(v24, "setBorderWidth:", v25);

          }
        }

      }
      else
      {
        v16 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_primaryImage);
        v17 = self->_primaryImageView;
        self->_primaryImageView = v16;

        -[UIImageView setContentMode:](self->_primaryImageView, "setContentMode:", 1);
        -[UIImageView setClipsToBounds:](self->_primaryImageView, "setClipsToBounds:", 1);
        -[UIImageView _setContinuousCornerRadius:](self->_primaryImageView, "_setContinuousCornerRadius:", 4.0);
        -[PKPaymentTransactionView _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
        -[UIImageView layer](self->_primaryImageView, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_strokeImage)
          v19 = PKUIPixelLength();
        else
          v19 = 0.0;
        objc_msgSend(v18, "setBorderWidth:", v19);

      }
      -[UIImageView superview](self->_primaryImageView, "superview");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_primaryImageView);
        goto LABEL_23;
      }
    }
    else
    {
      -[UIImageView superview](self->_primaryImageView, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[UIImageView removeFromSuperview](self->_primaryImageView, "removeFromSuperview");
LABEL_23:
        -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
        -[PKPaymentTransactionView layoutIfNeeded](self, "layoutIfNeeded");
      }
    }
  }

}

uint64_t __53__PKPaymentTransactionView_setPrimaryImage_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __53__PKPaymentTransactionView_setPrimaryImage_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_updateImageViewDynamicColors
{
  void *v3;
  _QWORD v4[5];

  -[PKPaymentTransactionView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PKPaymentTransactionView__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __57__PKPaymentTransactionView__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (void)setShowsAvatarView:(BOOL)a3
{
  if (((!self->_showsAvatarView ^ a3) & 1) == 0)
  {
    self->_showsAvatarView = a3;
    -[PKPaymentTransactionView _updateAvatarView](self, "_updateAvatarView");
  }
}

- (void)_updateAvatarView
{
  CNAvatarView *v3;
  CNAvatarView *avatarView;
  CNAvatarView *v5;
  CNAvatarView *v6;

  if (self->_showsAvatarView)
  {
    -[PKPaymentTransactionView setPrimaryImage:](self, "setPrimaryImage:", 0);
    if (self->_avatarView)
      return;
    v3 = (CNAvatarView *)objc_msgSend(objc_alloc(getCNAvatarViewClass_0()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    avatarView = self->_avatarView;
    self->_avatarView = v3;

    -[CNAvatarView setUserInteractionEnabled:](self->_avatarView, "setUserInteractionEnabled:", 0);
    -[CNAvatarView setAsynchronousRendering:](self->_avatarView, "setAsynchronousRendering:", 1);
    -[CNAvatarView setShowsContactOnTap:](self->_avatarView, "setShowsContactOnTap:", 0);
    -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_avatarView);
  }
  else
  {
    v5 = self->_avatarView;
    if (!v5)
      return;
    -[CNAvatarView removeFromSuperview](v5, "removeFromSuperview");
    v6 = self->_avatarView;
    self->_avatarView = 0;

  }
  -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)shouldShowTransactionPreviewForTouchAtPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  CNAvatarView *avatarView;
  _BOOL4 v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  avatarView = self->_avatarView;
  if (avatarView && (-[CNAvatarView isHidden](avatarView, "isHidden") & 1) == 0)
  {
    -[CNAvatarView convertPoint:fromView:](self->_avatarView, "convertPoint:fromView:", v7, x, y);
    v11 = v10;
    v13 = v12;
    -[CNAvatarView bounds](self->_avatarView, "bounds");
    v15.x = v11;
    v15.y = v13;
    v9 = !CGRectContainsPoint(v16, v15);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)setShowsDisclosureView:(BOOL)a3
{
  id v4;
  void *v5;

  if (self->_showsDisclosureView != a3)
  {
    self->_showsDisclosureView = a3;
    if (a3)
    {
      v4 = -[PKPaymentTransactionView _disclosureView](self, "_disclosureView");
      -[UIImageView superview](self->_disclosureView, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        return;
      -[PKPaymentTransactionView addSubview:](self, "addSubview:", self->_disclosureView);
    }
    else
    {
      -[UIImageView removeFromSuperview](self->_disclosureView, "removeFromSuperview");
    }
    -[PKPaymentTransactionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_disclosureView
{
  UIImageView *disclosureView;
  id v4;
  void *v5;
  UIImageView *v6;
  void *v7;
  UIImageView *v8;

  disclosureView = self->_disclosureView;
  if (!disclosureView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v6, "setTintColor:", v7);

    -[UIImageView setContentMode:](v6, "setContentMode:", 1);
    v8 = self->_disclosureView;
    self->_disclosureView = v6;

    disclosureView = self->_disclosureView;
  }
  return disclosureView;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  int v9;
  CGRectEdge v10;
  CGRectEdge v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIImageView **p_bonusImageView;
  char v21;
  char v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  CGSize v29;
  CNAvatarView *avatarView;
  UILabel *v31;
  UIImageView *v32;
  CGSize v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  char v45;
  UIImageView **v46;
  double v47;
  char v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void **p_avatarView;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGSize v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  double v69;
  CGFloat v70;
  void *v71;
  uint64_t v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  UILabel *transactionValueLabel;
  CGFloat v77;
  UILabel *primaryLabel;
  UIImageView *disclosureView;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  double v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  UILabel *secondaryLabel;
  UILabel *tertiaryLabel;
  double v94;
  double v95;
  double v96;
  double v97;
  UIImageView *primaryImageView;
  UIImageView *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  UILabel *v107;
  double v108;
  UILabel *v109;
  double v110;
  UILabel *v111;
  double v112;
  double v113;
  double v114;
  UILabel *v115;
  double v116;
  double v117;
  double v118;
  UILabel *badgeLabel;
  UIImageView *v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  double v124;
  char v125;
  CGFloat v126;
  CGFloat v127;
  uint64_t v128;
  double v129;
  double v130;
  CGRectEdge edge;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect rect;
  CGRect slice;
  CGRect v137;
  CGRect remainder;
  CGSize result;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PKPaymentTransactionView _shouldUseStackedLayout](self, "_shouldUseStackedLayout");
  v9 = -[PKPaymentTransactionView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v9)
    v10 = CGRectMaxXEdge;
  else
    v10 = CGRectMinXEdge;
  if (v9)
    v11 = CGRectMinXEdge;
  else
    v11 = CGRectMaxXEdge;
  v12 = 0.0;
  if (v8)
  {
    -[UILabel font](self->_transactionValueLabel, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lineHeight");
    objc_msgSend(v13, "capHeight");
    objc_msgSend(v13, "descender");
    PKFloatRoundToPixel();
    v12 = v14;

  }
  -[UILabel text](self->_badgeLabel, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v15, "length");

  memset(&v137, 0, sizeof(v137));
  v126 = x;
  v127 = y;
  v16 = x + 13.0;
  v17 = y + 8.0;
  v130 = width;
  v18 = width + -26.0;
  v19 = height + -16.0;
  remainder.origin.x = v16;
  remainder.origin.y = y + 8.0;
  remainder.size.width = v18;
  remainder.size.height = height + -16.0;
  edge = v10;
  v129 = height;
  if (v8)
  {
    PKContentAlignmentMake();
    goto LABEL_11;
  }
  if (!self->_allowPrimaryStringExpansion
    || (-[UILabel text](self->_primaryLabel, "text"), (v49 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_41:
    -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 1);
    p_bonusImageView = &self->_bonusImageView;
    v125 = -[UIImageView isHidden](self->_bonusImageView, "isHidden");
LABEL_43:
    p_avatarView = (void **)&self->_avatarView;
    if (self->_avatarView
      || self->_primaryImage && (p_avatarView = (void **)&self->_primaryImageView, self->_primaryImageView))
    {
      v142.origin.x = v16;
      v142.origin.y = y + 8.0;
      v142.size.width = v18;
      v142.size.height = height + -16.0;
      CGRectDivide(v142, &v137, &remainder, 45.0, v10);
      if (!self->_isTemplateLayout)
      {
        v55 = *p_avatarView;
        PKSizeAlignedInRect();
        objc_msgSend(v55, "setFrame:");
      }
      CGRectDivide(remainder, &v137, &remainder, 12.0, v10);
    }
    slice = remainder;
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v57 = v56;
    -[UILabel sizeThatFits:](self->_tertiaryLabel, "sizeThatFits:", slice.size.width, slice.size.height);
    v59 = v58;
    -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", slice.size.width, slice.size.height);
    v61 = v60;
    -[UILabel sizeThatFits:](self->_badgeLabel, "sizeThatFits:", slice.size.width, slice.size.height);
    v62 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    rect.size = v62;
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", slice.size.width, slice.size.height);
    v64 = v63;
    if (self->_showsDisclosureView)
      v65 = v63 + 12.0;
    else
      v65 = 0.0;
    v66 = slice.size.width - v65;
    v67 = v61 + 12.0;
    if (v61 == 0.0)
      v67 = 0.0;
    -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", v66 - v67, slice.size.height);
    v121 = v68;
    v70 = v69;
    PKSizeAlignedInRect();
    slice = v143;
    memset(&v134, 0, sizeof(v134));
    CGRectDivide(v143, &v134, &slice, v70, CGRectMinYEdge);
    if (self->_showsDisclosureView)
    {
      CGRectDivide(slice, &v137, &slice, v64 + 12.0, v11);
      CGRectDivide(v134, &rect, &v134, v64 + 12.0, v11);
    }
    -[UILabel text](self->_transactionValueLabel, "text", v121);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "length");

    if (v72)
    {
      -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", slice.size.width, slice.size.height);
      v74 = v73;
      memset(&v133, 0, sizeof(v133));
      CGRectDivide(v134, &v133, &v134, v75, v11);
      rect.size.height = v74;
      PKSizeAlignedInRect();
      if (!self->_isTemplateLayout)
      {
        transactionValueLabel = self->_transactionValueLabel;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[UILabel setFrame:](transactionValueLabel, "setFrame:");
      }
      CGRectDivide(v134, &v133, &v134, 12.0, v11);
    }
    v77 = height;
    if (!self->_isTemplateLayout)
    {
      primaryLabel = self->_primaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](primaryLabel, "setFrame:");
    }
    CGRectDivide(slice, &v134, &slice, 2.0, CGRectMinYEdge);
    if (self->_showsDisclosureView && !self->_isTemplateLayout)
    {
      -[UIImageView setHidden:](self->_disclosureView, "setHidden:", 0);
      disclosureView = self->_disclosureView;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](disclosureView, "setFrame:");
    }
    v80 = v130;
    if (!v128)
      goto LABEL_80;
    -[UILabel sizeThatFits:](self->_badgeLabel, "sizeThatFits:", slice.size.width, slice.size.height);
    if (self->_hideBadgeBackground)
      v82 = v81;
    else
      v82 = v81 + 10.0;
    memset(&v133, 0, sizeof(v133));
    CGRectDivide(slice, &v133, &slice, v82, v11);
    if (self->_isTemplateLayout)
    {
      if ((v125 & 1) != 0)
      {
LABEL_80:
        if ((v125 & 1) == 0)
        {
          -[UIImageView sizeThatFits:](*p_bonusImageView, "sizeThatFits:", slice.size.width, slice.size.height);
          memset(&v133, 0, sizeof(v133));
          CGRectDivide(slice, &v133, &slice, v87 + 6.0, v11);
          if (!self->_isTemplateLayout)
          {
            PKContentAlignmentMake();
            PKSizeAlignedInRect();
            v133.origin.x = v89;
            v133.origin.y = v88;
            v133.size.width = v90;
            v133.size.height = v91;
            if (v57 > 0.0 && v59 > 0.0)
              v133.origin.y = v88 + 3.0;
            -[UIImageView setFrame:](*p_bonusImageView, "setFrame:");
          }
        }
        memset(&v133, 0, sizeof(v133));
        CGRectDivide(slice, &v133, &slice, v57, CGRectMinYEdge);
        if (!self->_isTemplateLayout)
        {
          secondaryLabel = self->_secondaryLabel;
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          -[UILabel setFrame:](secondaryLabel, "setFrame:");
        }
        if (v57 > 0.0)
          CGRectDivide(slice, &v133, &slice, 2.0, CGRectMinYEdge);
        memset(&v132, 0, sizeof(v132));
        CGRectDivide(slice, &v132, &slice, v59, CGRectMinYEdge);
        if (!self->_isTemplateLayout)
        {
          tertiaryLabel = self->_tertiaryLabel;
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          -[UILabel setFrame:](tertiaryLabel, "setFrame:");
        }
        v94 = remainder.size.height + 8.0;
        goto LABEL_93;
      }
    }
    else
    {
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v133.origin.x = v84;
      v133.origin.y = v83;
      v133.size.width = v85;
      v133.size.height = v86;
      if (v57 > 0.0 && v59 > 0.0 && !self->_hideBadgeBackground)
        v133.origin.y = v83 + 3.0;
      -[UILabel setFrame:](self->_badgeLabel, "setFrame:");
      if ((v125 & 1) != 0)
        goto LABEL_80;
    }
    if (!self->_hideSecondaryBadgeSymbolBackground)
      CGRectDivide(slice, &v133, &slice, 6.0, v11);
    goto LABEL_80;
  }
  v50 = (void *)v49;
  -[UILabel text](self->_secondaryLabel, "text");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[UILabel text](self->_tertiaryLabel, "text");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = edge;
    if (v53)
      goto LABEL_41;
  }
  else
  {

  }
LABEL_11:
  -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 2);
  p_bonusImageView = &self->_bonusImageView;
  v21 = -[UIImageView isHidden](self->_bonusImageView, "isHidden");
  v22 = v21;
  if (!v8)
  {
    v125 = v21;
    goto LABEL_43;
  }
  -[UILabel text](self->_transactionValueLabel, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  v25 = 25.0;
  if (!self->_showsDisclosureView)
    v25 = *MEMORY[0x1E0C9D820];
  v124 = v25;
  v123 = v24;
  if (self->_primaryImage && self->_primaryImageView || self->_avatarView)
  {
    if (v24)
      -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", v18, v19);
    -[UILabel font](self->_transactionValueLabel, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lineHeight");
    v28 = v27;

    v29 = (CGSize)0;
    memset(&slice, 0, sizeof(slice));
    if (self->_showsDisclosureView)
    {
      v140.origin.x = v16;
      v140.origin.y = v17;
      v140.size.width = v18;
      v140.size.height = height + -16.0;
      CGRectDivide(v140, &slice, &remainder, v124 + 12.0, v11);
      v29 = (CGSize)0;
      v16 = remainder.origin.x;
      v17 = remainder.origin.y;
      v18 = remainder.size.width;
      v19 = remainder.size.height;
    }
    rect.origin = (CGPoint)v29;
    rect.size = v29;
    v141.origin.x = v16;
    v141.origin.y = v17;
    v141.size.width = v18;
    v141.size.height = v19;
    CGRectDivide(v141, &rect, &remainder, v28, CGRectMinYEdge);
    if (self->_avatarView)
    {
      memset(&v134, 0, sizeof(v134));
      CGRectDivide(rect, &v134, &rect, v28 - v12, edge);
      if (!self->_isTemplateLayout)
      {
        -[CNAvatarView setHidden:](self->_avatarView, "setHidden:", 0);
        avatarView = self->_avatarView;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[CNAvatarView setFrame:](avatarView, "setFrame:");
      }
    }
    else
    {
      if (!self->_primaryImage || !self->_primaryImageView)
        goto LABEL_25;
      memset(&v134, 0, sizeof(v134));
      CGRectDivide(rect, &v134, &rect, v28 - v12, edge);
      if (!self->_isTemplateLayout)
      {
        -[UIImageView setHidden:](self->_primaryImageView, "setHidden:", 0);
        primaryImageView = self->_primaryImageView;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[UIImageView setFrame:](primaryImageView, "setFrame:");
      }
    }
    CGRectDivide(rect, &v134, &rect, 12.0, edge);
LABEL_25:
    if (!self->_isTemplateLayout)
    {
      v31 = self->_transactionValueLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v31, "setFrame:");
    }
    if (self->_showsDisclosureView && !self->_isTemplateLayout)
    {
      -[UIImageView setHidden:](self->_disclosureView, "setHidden:", 0);
      v32 = self->_disclosureView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](v32, "setFrame:");
    }
    v33 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v134.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v134.size = v33;
    if (v128)
    {
      -[UILabel sizeThatFits:](self->_badgeLabel, "sizeThatFits:", rect.size.width, rect.size.height);
      CGRectDivide(rect, &v134, &rect, v34 + 10.0 + 12.0, v11);
      if (!self->_isTemplateLayout)
      {
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v134.origin.x = v35;
        v134.origin.y = v36;
        v134.size.width = v37;
        v134.size.height = v38;
        -[UILabel setFrame:](self->_badgeLabel, "setFrame:");
      }
    }
    if ((v22 & 1) == 0)
    {
      -[UIImageView sizeThatFits:](*p_bonusImageView, "sizeThatFits:", rect.size.width, rect.size.height);
      memset(&v133, 0, sizeof(v133));
      v40 = v39 + 6.0;
      CGRectIsEmpty(v134);
      CGRectDivide(rect, &v133, &rect, v40, v11);
      if (!self->_isTemplateLayout)
      {
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v133.origin.x = v41;
        v133.origin.y = v42;
        v133.size.width = v43;
        v133.size.height = v44;
        -[UIImageView setFrame:](*p_bonusImageView, "setFrame:");
      }
    }
    v45 = v22;
    v46 = &self->_bonusImageView;
    v47 = v28 + 5.0 + 8.0;
    v48 = 1;
    goto LABEL_105;
  }
  v47 = 8.0;
  v45 = v22;
  v46 = &self->_bonusImageView;
  if (self->_showsDisclosureView)
  {
    v145.origin.x = v16;
    v145.origin.y = y + 8.0;
    v145.size.width = v18;
    v145.size.height = height + -16.0;
    CGRectDivide(v145, &v137, &remainder, 25.0, v11);
    if (!self->_isTemplateLayout)
    {
      v99 = self->_disclosureView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](v99, "setFrame:");
    }
    CGRectDivide(remainder, &v137, &remainder, 12.0, v11);
  }
  v48 = 0;
LABEL_105:
  v100 = remainder.size.width;
  -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", remainder.size.width, 3.40282347e38);
  v102 = v101;
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v100, 3.40282347e38);
  v104 = v103;
  -[UILabel sizeThatFits:](self->_tertiaryLabel, "sizeThatFits:", v100, 3.40282347e38);
  v106 = v105;
  if (!self->_isTemplateLayout)
  {
    v122 = v105;
    v107 = self->_primaryLabel;
    PKContentAlignmentMake();
    v106 = v122;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v107, "setFrame:");
  }
  v94 = v47 + v102;
  if (v104 > 0.0)
  {
    v108 = v94 + 2.0;
    if (!self->_isTemplateLayout)
    {
      v109 = self->_secondaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v109, "setFrame:");
    }
    v94 = v108 + v104;
  }
  v80 = v130;
  if (v106 > 0.0)
  {
    v110 = v94 + 2.0;
    if (!self->_isTemplateLayout)
    {
      v111 = self->_tertiaryLabel;
      PKContentAlignmentMake();
      v80 = v130;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v111, "setFrame:");
    }
    v94 = v106 + v110;
  }
  v77 = v129;
  if ((v48 & 1) == 0)
  {
    if (v123)
    {
      v112 = v94 + 2.0;
      -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", v100, 3.40282347e38);
      v114 = v113;
      if (!self->_isTemplateLayout)
      {
        v115 = self->_transactionValueLabel;
        PKContentAlignmentMake();
        v80 = v130;
        PKSizeAlignedInRect();
        -[UILabel setFrame:](v115, "setFrame:");
      }
      v94 = v112 + v114;
    }
    if (v128)
    {
      v116 = v94 + 2.0;
      -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", v100, 3.40282347e38);
      v118 = v117;
      if ((v45 & 1) != 0)
      {
        if (self->_isTemplateLayout)
        {
LABEL_129:
          v94 = v116 + v118;
          v77 = v129;
          v80 = v130;
          goto LABEL_93;
        }
        badgeLabel = self->_badgeLabel;
        PKContentAlignmentMake();
      }
      else
      {
        -[UIImageView sizeThatFits:](*v46, "sizeThatFits:", v100, 3.40282347e38);
        if (self->_isTemplateLayout)
          goto LABEL_129;
        v120 = *v46;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[UIImageView setFrame:](v120, "setFrame:");
        if (self->_isTemplateLayout)
          goto LABEL_129;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        badgeLabel = self->_badgeLabel;
        PKContentAlignmentMake();
      }
      PKSizeAlignedInRect();
      -[UILabel setFrame:](badgeLabel, "setFrame:");
      goto LABEL_129;
    }
    v77 = v129;
  }
LABEL_93:
  v95 = v94 + 8.0;
  v144.origin.x = v126;
  v144.origin.y = v127;
  v144.size.width = v80;
  v144.size.height = v77;
  v96 = CGRectGetWidth(v144);
  v97 = v95;
  result.height = v97;
  result.width = v96;
  return result;
}

- (double)_defaultLayoutHeight
{
  void *v3;
  void *v4;
  void *v5;
  double result;

  -[UILabel font](self->_primaryLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  -[UILabel font](self->_secondaryLabel, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  -[UILabel font](self->_tertiaryLabel, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");

  PKFloatRoundToPixel();
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionView;
  -[PKPaymentTransactionView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaymentTransactionView bounds](self, "bounds");
  -[PKPaymentTransactionView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentTransactionView;
  -[PKPaymentTransactionView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPaymentTransactionView traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
        -[PKPaymentTransactionView resetFonts](self, "resetFonts");
    }
  }

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionView;
  -[PKPaymentTransactionView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKPaymentTransactionView _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (NSString)secondaryString
{
  return self->_secondaryString;
}

- (NSString)tertiaryString
{
  return self->_tertiaryString;
}

- (BOOL)hideBadgeBackground
{
  return self->_hideBadgeBackground;
}

- (BOOL)hideSecondaryBadgeSymbolBackground
{
  return self->_hideSecondaryBadgeSymbolBackground;
}

- (BOOL)showsAvatarView
{
  return self->_showsAvatarView;
}

- (BOOL)showsDisclosureView
{
  return self->_showsDisclosureView;
}

- (NSString)secondaryBadgeSymbol
{
  return self->_secondaryBadgeSymbol;
}

- (UIImageSymbolConfiguration)secondaryBadgeSymbolConfiguration
{
  return self->_secondaryBadgeSymbolConfiguration;
}

- (BOOL)allowPrimaryStringExpansion
{
  return self->_allowPrimaryStringExpansion;
}

- (UIImage)primaryImage
{
  return self->_primaryImage;
}

- (BOOL)strokeImage
{
  return self->_strokeImage;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_primaryImage, 0);
  objc_storeStrong((id *)&self->_secondaryBadgeSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_secondaryBadgeSymbol, 0);
  objc_storeStrong((id *)&self->_tertiaryString, 0);
  objc_storeStrong((id *)&self->_secondaryString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_bonusImageView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_primaryImageView, 0);
  objc_storeStrong((id *)&self->_transactionValueLabel, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
