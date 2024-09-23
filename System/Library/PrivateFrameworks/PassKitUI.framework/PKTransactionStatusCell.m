@implementation PKTransactionStatusCell

- (PKTransactionStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTransactionStatusCell *v4;
  PKTransactionStatusCell *v5;
  void *v6;
  UILabel *v7;
  UILabel *primaryLabel;
  UILabel *v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  UILabel *v13;
  UILabel *secondaryTitleLabel;
  UILabel *v15;
  void *v16;
  UIButton *v17;
  UIButton *secondaryTitleButton;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *secondaryValueLabel;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  UILabel *tertiaryLabel;
  UILabel *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PKTransactionStatusCell;
  v4 = -[PKTransactionStatusCell initWithStyle:reuseIdentifier:](&v31, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[PKTransactionStatusCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = v5->_primaryLabel;
    v5->_primaryLabel = v7;

    v9 = v5->_primaryLabel;
    v10 = (NSString *)*MEMORY[0x1E0DC4A88];
    v11 = (NSString *)*MEMORY[0x1E0DC4938];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4938], 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v12);

    -[UILabel setNumberOfLines:](v5->_primaryLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_primaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v6, "addSubview:", v5->_primaryLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryTitleLabel = v5->_secondaryTitleLabel;
    v5->_secondaryTitleLabel = v13;

    v15 = v5->_secondaryTitleLabel;
    PKFontForDefaultDesign(v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setNumberOfLines:](v5->_secondaryTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_secondaryTitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    objc_msgSend(v6, "addSubview:", v5->_secondaryTitleLabel);
    v17 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    secondaryTitleButton = v5->_secondaryTitleButton;
    v5->_secondaryTitleButton = v17;

    v19 = (void *)MEMORY[0x1E0DC3520];
    PKFontForDefaultDesign(v10, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pkui_plainConfigurationWithTitle:font:", &stru_1E3E7D690, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    -[UIButton setConfiguration:](v5->_secondaryTitleButton, "setConfiguration:", v21);
    -[UIButton setHidden:](v5->_secondaryTitleButton, "setHidden:", 1);
    objc_storeStrong(&v5->_secondaryTitleButtonAction, &__block_literal_global_46);
    -[UIButton addTarget:action:forControlEvents:](v5->_secondaryTitleButton, "addTarget:action:forControlEvents:", v5, sel_didPressSecondaryTitleButton_, 64);
    -[UIButton setAccessibilityIdentifier:](v5->_secondaryTitleButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE0]);
    objc_msgSend(v6, "addSubview:", v5->_secondaryTitleButton);
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryValueLabel = v5->_secondaryValueLabel;
    v5->_secondaryValueLabel = v22;

    v24 = v5->_secondaryValueLabel;
    PKFontForDefaultDesign(v10, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    -[UILabel setNumberOfLines:](v5->_secondaryValueLabel, "setNumberOfLines:", 1);
    -[UILabel setAccessibilityIdentifier:](v5->_secondaryValueLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D681B8]);
    objc_msgSend(v6, "addSubview:", v5->_secondaryValueLabel);
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    tertiaryLabel = v5->_tertiaryLabel;
    v5->_tertiaryLabel = v26;

    v28 = v5->_tertiaryLabel;
    PKFontForDefaultDesign(v10, v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v28, "setFont:", v29);

    -[UILabel setNumberOfLines:](v5->_tertiaryLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_tertiaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE8]);
    objc_msgSend(v6, "addSubview:", v5->_tertiaryLabel);
    -[PKTransactionStatusCell _updateTextColors](v5, "_updateTextColors");
    -[PKTransactionStatusCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C0]);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTransactionStatusCell;
  -[PKTransactionStatusCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKTransactionStatusCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKTransactionStatusCell _layoutWithBounds:](self, "_layoutWithBounds:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_templateLayout = 1;
  -[PKTransactionStatusCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 1.79769313e308);
  self->_templateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setPrimaryText:(id)a3
{
  id v4;
  NSString *primaryText;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  primaryText = self->_primaryText;
  v10 = (NSString *)v4;
  v6 = primaryText;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_primaryText;
    self->_primaryText = v8;

    -[UILabel setText:](self->_primaryLabel, "setText:", self->_primaryText);
    -[PKTransactionStatusCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (NSString)secondaryTitle
{
  return -[NSAttributedString string](self->_secondaryTitleAttributed, "string");
}

- (void)setSecondaryTitle:(id)a3
{
  id v4;

  objc_msgSend(a3, "pk_attributedString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTransactionStatusCell setSecondaryTitleAttributed:](self, "setSecondaryTitleAttributed:", v4);

}

- (void)setSecondaryTitleAttributed:(id)a3
{
  unint64_t v4;
  void *v5;
  char v6;
  NSAttributedString *v7;
  NSAttributedString *secondaryTitleAttributed;
  void *v9;

  v4 = (unint64_t)a3;
  v5 = (void *)v4;
  if (v4 | (unint64_t)self->_secondaryTitleLabel)
  {
    v9 = (void *)v4;
    v6 = objc_msgSend((id)v4, "isEqualToAttributedString:", self->_secondaryTitleAttributed);
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSAttributedString *)objc_msgSend(v9, "copy");
      secondaryTitleAttributed = self->_secondaryTitleAttributed;
      self->_secondaryTitleAttributed = v7;

      -[UILabel setAttributedText:](self->_secondaryTitleLabel, "setAttributedText:", self->_secondaryTitleAttributed);
      -[PKTransactionStatusCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (void)setSecondaryTitleLinkText:(id)a3
{
  id v4;
  NSString *secondaryTitleLinkText;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  secondaryTitleLinkText = self->_secondaryTitleLinkText;
  v10 = (NSString *)v4;
  v6 = secondaryTitleLinkText;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_secondaryTitleLinkText;
    self->_secondaryTitleLinkText = v8;

    -[UIButton pkui_updateConfigurationWithTitle:](self->_secondaryTitleButton, "pkui_updateConfigurationWithTitle:", self->_secondaryTitleLinkText);
    -[UIButton setHidden:](self->_secondaryTitleButton, "setHidden:", -[PKTransactionStatusCell hasCompleteSecondaryLink](self, "hasCompleteSecondaryLink") ^ 1);
    -[PKTransactionStatusCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSecondaryTitleLinkURL:(id)a3
{
  NSURL *v4;
  NSURL *secondaryTitleLinkURL;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v4 = (NSURL *)objc_msgSend(v6, "copy");
    secondaryTitleLinkURL = self->_secondaryTitleLinkURL;
    self->_secondaryTitleLinkURL = v4;

    -[UIButton setHidden:](self->_secondaryTitleButton, "setHidden:", -[PKTransactionStatusCell hasCompleteSecondaryLink](self, "hasCompleteSecondaryLink") ^ 1);
    -[PKTransactionStatusCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)hasCompleteSecondaryLink
{
  NSUInteger v3;

  v3 = -[NSString length](self->_secondaryTitleLinkText, "length");
  if (v3)
    LOBYTE(v3) = self->_secondaryTitleLinkURL != 0;
  return v3;
}

- (void)setSecondaryValue:(id)a3
{
  id v4;
  NSString *secondaryValue;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  secondaryValue = self->_secondaryValue;
  v10 = (NSString *)v4;
  v6 = secondaryValue;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_secondaryValue;
    self->_secondaryValue = v8;

    -[UILabel setText:](self->_secondaryValueLabel, "setText:", self->_secondaryValue);
    -[PKTransactionStatusCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTertiaryText:(id)a3
{
  id v4;
  NSString *tertiaryText;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  tertiaryText = self->_tertiaryText;
  v10 = (NSString *)v4;
  v6 = tertiaryText;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_tertiaryText;
    self->_tertiaryText = v8;

    -[UILabel setText:](self->_tertiaryLabel, "setText:", self->_tertiaryText);
    -[PKTransactionStatusCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSecondaryTextOverrideColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_secondaryTextOverrideColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_secondaryTextOverrideColor, a3);
    -[PKTransactionStatusCell _updateTextColors](self, "_updateTextColors");
    v5 = v6;
  }

}

- (void)setIsBridge:(BOOL)a3
{
  if (((!self->_isBridge ^ a3) & 1) == 0)
  {
    self->_isBridge = a3;
    -[PKTransactionStatusCell _updateTextColors](self, "_updateTextColors");
  }
}

- (void)_updateTextColors
{
  UILabel *primaryLabel;
  void *v4;
  UILabel *secondaryTitleLabel;
  void *v6;
  UILabel *tertiaryLabel;
  void *v8;
  id v9;

  primaryLabel = self->_primaryLabel;
  if (self->_isBridge)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](primaryLabel, "setTextColor:", v4);

  secondaryTitleLabel = self->_secondaryTitleLabel;
  if (self->_secondaryTextOverrideColor)
  {
    -[UILabel setTextColor:](self->_secondaryTitleLabel, "setTextColor:");
  }
  else
  {
    if (self->_isBridge)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](secondaryTitleLabel, "setTextColor:", v6);

  }
  tertiaryLabel = self->_tertiaryLabel;
  if (self->_isBridge)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](tertiaryLabel, "setTextColor:", v8);

  if (self->_isBridge)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_secondaryValueLabel, "setTextColor:", v9);

}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRectEdge v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  UILabel *secondaryValueLabel;
  double v22;
  CGFloat v23;
  double v24;
  UILabel *secondaryTitleLabel;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  UIButton *secondaryTitleButton;
  float v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect remainder;
  CGSize result;
  CGRect v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v35, 0, sizeof(v35));
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v9 = x + v8;
  v10 = y + 14.0;
  v12 = width - (v8 + v11);
  remainder.origin.x = x + v8;
  remainder.origin.y = y + 14.0;
  v13 = height + -28.0;
  remainder.size.width = v12;
  remainder.size.height = v13;
  if (-[PKTransactionStatusCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v14 = CGRectMinXEdge;
  else
    v14 = CGRectMaxXEdge;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_primaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v12, v13);
  v16 = v15;
  v18 = v17;
  v38.origin.x = v9;
  v38.origin.y = v10;
  v38.size.width = v12;
  v38.size.height = v13;
  CGRectDivide(v38, &v35, &remainder, v18, CGRectMinYEdge);
  if (!self->_templateLayout)
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", *(_OWORD *)&v35.origin, *(_OWORD *)&v35.size);
  CGRectDivide(remainder, &v35, &remainder, 4.0, CGRectMinYEdge);
  if (-[NSString length](self->_secondaryValue, "length"))
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryValueLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v20 = v19;
    CGRectDivide(remainder, &v35, &remainder, v16, v14);
    if (!self->_templateLayout)
    {
      secondaryValueLabel = self->_secondaryValueLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](secondaryValueLabel, "setFrame:");
    }
    CGRectDivide(remainder, &v35, &remainder, 4.0, v14);
  }
  else
  {
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (!self->_templateLayout)
      -[UILabel setFrame:](self->_secondaryValueLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v22 = v18 + 4.0;
  -[UILabel sizeThatFits:](self->_secondaryTitleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v24 = v23;
  CGRectDivide(remainder, &v35, &remainder, v23, CGRectMinYEdge);
  if (!self->_templateLayout)
  {
    secondaryTitleLabel = self->_secondaryTitleLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](secondaryTitleLabel, "setFrame:");
  }
  v26 = v22 + 28.0;
  if (-[NSString length](self->_tertiaryText, "length"))
  {
    CGRectDivide(remainder, &v35, &remainder, 4.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v28 = v27;
    CGRectDivide(remainder, &v35, &remainder, v27, CGRectMinYEdge);
    if (!self->_templateLayout)
      -[UILabel setFrame:](self->_tertiaryLabel, "setFrame:", *(_OWORD *)&v35.origin, *(_OWORD *)&v35.size);
    v26 = v26 + v28 + 4.0;
  }
  else if (!self->_templateLayout)
  {
    -[UILabel setFrame:](self->_tertiaryLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  if ((-[UIButton isHidden](self->_secondaryTitleButton, "isHidden") & 1) == 0)
  {
    CGRectDivide(remainder, &v35, &remainder, 4.0, CGRectMinYEdge);
    -[UIButton sizeThatFits:](self->_secondaryTitleButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v30 = v29;
    CGRectDivide(remainder, &v35, &remainder, v29, CGRectMinYEdge);
    if (!self->_templateLayout)
    {
      secondaryTitleButton = self->_secondaryTitleButton;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIButton setFrame:](secondaryTitleButton, "setFrame:");
    }
    v26 = v26 + v30 + 4.0;
  }
  v32 = fmax(v24, v20) + v26;
  v33 = ceilf(v32);
  v34 = width;
  result.height = v33;
  result.width = v34;
  return result;
}

- (void)didPressSecondaryTitleButton:(id)a3
{
  void (**secondaryTitleButtonAction)(void);

  secondaryTitleButtonAction = (void (**)(void))self->_secondaryTitleButtonAction;
  if (secondaryTitleButtonAction)
  {
    if (self->_secondaryTitleLinkURL)
      secondaryTitleButtonAction[2]();
  }
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSAttributedString)secondaryTitleAttributed
{
  return self->_secondaryTitleAttributed;
}

- (NSString)secondaryTitleLinkText
{
  return self->_secondaryTitleLinkText;
}

- (NSURL)secondaryTitleLinkURL
{
  return self->_secondaryTitleLinkURL;
}

- (NSString)secondaryValue
{
  return self->_secondaryValue;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (UIColor)secondaryTextOverrideColor
{
  return self->_secondaryTextOverrideColor;
}

- (BOOL)isBridge
{
  return self->_isBridge;
}

- (id)secondaryTitleButtonAction
{
  return self->_secondaryTitleButtonAction;
}

- (void)setSecondaryTitleButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondaryTitleButtonAction, 0);
  objc_storeStrong((id *)&self->_secondaryTextOverrideColor, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryValue, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLinkURL, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLinkText, 0);
  objc_storeStrong((id *)&self->_secondaryTitleAttributed, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryValueLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTitleButton, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
