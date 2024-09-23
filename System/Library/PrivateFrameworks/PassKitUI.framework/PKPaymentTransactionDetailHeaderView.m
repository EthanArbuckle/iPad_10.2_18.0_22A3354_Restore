@implementation PKPaymentTransactionDetailHeaderView

- (PKPaymentTransactionDetailHeaderView)initWithFrame:(CGRect)a3
{
  PKPaymentTransactionDetailHeaderView *v3;
  UILabel *v4;
  UILabel *amountLabel;
  UILabel *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionDetailHeaderView;
  v3 = -[PKPaymentTransactionDetailHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    amountLabel = v3->_amountLabel;
    v3->_amountLabel = v4;

    v6 = v3->_amountLabel;
    PKRoundedSystemFontOfSizeAndWeight(64.0, *MEMORY[0x1E0DC1448]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setTextAlignment:](v3->_amountLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_amountLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_amountLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PKPaymentTransactionDetailHeaderView addSubview:](v3, "addSubview:", v3->_amountLabel);
    -[UILabel setAccessibilityIdentifier:](v3->_amountLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    v3->_useStroke = 1;
  }
  return v3;
}

- (void)setAmountText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *amountText;
  UILabel *amountLabel;
  void *v12;
  NSString *v13;

  v4 = a3;
  v5 = self->_amountText;
  v6 = (NSString *)v4;
  v13 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v13;
      if (v7)
        goto LABEL_13;
    }
    else
    {

      v8 = v13;
    }
    v9 = (NSString *)-[NSString copy](v8, "copy");
    amountText = self->_amountText;
    self->_amountText = v9;

    -[UILabel setText:](self->_amountLabel, "setText:", self->_amountText);
    amountLabel = self->_amountLabel;
    if (self->_inBridge)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](amountLabel, "setTextColor:", v12);

    -[PKPaymentTransactionDetailHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v8 = v13;
LABEL_13:

}

- (void)setSubtitleText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *subtitleText;
  NSString *v11;
  UILabel *subtitleLabel;
  UILabel *v13;
  UILabel *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  uint64_t v18;
  UILabel *v19;
  void *v20;
  void *v21;
  NSString *v22;

  v4 = a3;
  v5 = self->_subtitleText;
  v6 = (NSString *)v4;
  v22 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v22;
      if (v7)
        goto LABEL_22;
    }
    else
    {

      v8 = v22;
    }
    v9 = (NSString *)-[NSString copy](v8, "copy");
    subtitleText = self->_subtitleText;
    self->_subtitleText = v9;

    v11 = self->_subtitleText;
    subtitleLabel = self->_subtitleLabel;
    if (v11)
    {
      if (!subtitleLabel)
      {
        v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v14 = self->_subtitleLabel;
        self->_subtitleLabel = v13;

        v15 = self->_subtitleLabel;
        if (self->_hasProminentSubtitle)
        {
          PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](v15, "setFont:", v16);

          v17 = self->_subtitleLabel;
          if (self->_inBridge)
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          else
            objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        }
        else
        {
          PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](v15, "setFont:", v20);

          v17 = self->_subtitleLabel;
          if (self->_inBridge)
            objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
          else
            objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        }
        v18 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v18;
        -[UILabel setTextColor:](v17, "setTextColor:", v18);

        -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
        -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
        -[PKPaymentTransactionDetailHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);
        subtitleLabel = self->_subtitleLabel;
        v11 = self->_subtitleText;
      }
      -[UILabel setText:](subtitleLabel, "setText:", v11);
    }
    else
    {
      -[UILabel removeFromSuperview](subtitleLabel, "removeFromSuperview");
      v19 = self->_subtitleLabel;
      self->_subtitleLabel = 0;

    }
    -[PKPaymentTransactionDetailHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v8 = v22;
LABEL_22:

}

- (void)setSecondarySubtitleText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *secondarySubtitleText;
  NSString *v11;
  UILabel *secondaryLabel;
  UILabel *v13;
  UILabel *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  UILabel *v18;
  void *v19;
  NSString *v20;

  v4 = a3;
  v5 = self->_secondarySubtitleText;
  v6 = (NSString *)v4;
  v20 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v20;
      if (v7)
        goto LABEL_18;
    }
    else
    {

      v8 = v20;
    }
    v9 = (NSString *)-[NSString copy](v8, "copy");
    secondarySubtitleText = self->_secondarySubtitleText;
    self->_secondarySubtitleText = v9;

    v11 = self->_secondarySubtitleText;
    secondaryLabel = self->_secondaryLabel;
    if (v11)
    {
      if (!secondaryLabel)
      {
        v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v14 = self->_secondaryLabel;
        self->_secondaryLabel = v13;

        v15 = self->_secondaryLabel;
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v15, "setFont:", v16);

        v17 = self->_secondaryLabel;
        if (self->_inBridge)
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v17, "setTextColor:", v19);

        -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_secondaryLabel, "setTextAlignment:", 1);
        -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE0]);
        -[PKPaymentTransactionDetailHeaderView addSubview:](self, "addSubview:", self->_secondaryLabel);
        secondaryLabel = self->_secondaryLabel;
        v11 = self->_secondarySubtitleText;
      }
      -[UILabel setText:](secondaryLabel, "setText:", v11);
    }
    else
    {
      -[UILabel removeFromSuperview](secondaryLabel, "removeFromSuperview");
      v18 = self->_secondaryLabel;
      self->_secondaryLabel = 0;

    }
    -[PKPaymentTransactionDetailHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v8 = v20;
LABEL_18:

}

- (void)setTertiarySubtitleText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *tertiarySubtitleText;
  NSString *v11;
  UILabel *tertiaryLabel;
  UILabel *v13;
  UILabel *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  UILabel *v18;
  void *v19;
  NSString *v20;

  v4 = a3;
  v5 = self->_tertiarySubtitleText;
  v6 = (NSString *)v4;
  v20 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v20;
      if (v7)
        goto LABEL_18;
    }
    else
    {

      v8 = v20;
    }
    v9 = (NSString *)-[NSString copy](v8, "copy");
    tertiarySubtitleText = self->_tertiarySubtitleText;
    self->_tertiarySubtitleText = v9;

    v11 = self->_tertiarySubtitleText;
    tertiaryLabel = self->_tertiaryLabel;
    if (v11)
    {
      if (!tertiaryLabel)
      {
        v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v14 = self->_tertiaryLabel;
        self->_tertiaryLabel = v13;

        v15 = self->_tertiaryLabel;
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v15, "setFont:", v16);

        v17 = self->_tertiaryLabel;
        if (self->_inBridge)
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v17, "setTextColor:", v19);

        -[UILabel setNumberOfLines:](self->_tertiaryLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_tertiaryLabel, "setTextAlignment:", 1);
        -[UILabel setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68108]);
        -[PKPaymentTransactionDetailHeaderView addSubview:](self, "addSubview:", self->_tertiaryLabel);
        tertiaryLabel = self->_tertiaryLabel;
        v11 = self->_tertiarySubtitleText;
      }
      -[UILabel setText:](tertiaryLabel, "setText:", v11);
    }
    else
    {
      -[UILabel removeFromSuperview](tertiaryLabel, "removeFromSuperview");
      v18 = self->_tertiaryLabel;
      self->_tertiaryLabel = 0;

    }
    -[PKPaymentTransactionDetailHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v8 = v20;
LABEL_18:

}

- (void)setMerchantIcon:(id)a3
{
  UIImage *v5;
  UIImageView *merchantIconImageView;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  UIImage *v11;

  v5 = (UIImage *)a3;
  if (self->_merchantIcon != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_merchantIcon, a3);
    merchantIconImageView = self->_merchantIconImageView;
    if (self->_merchantIcon)
    {
      if (!merchantIconImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v8 = self->_merchantIconImageView;
        self->_merchantIconImageView = v7;

        -[UIImageView setContentMode:](self->_merchantIconImageView, "setContentMode:", 1);
        -[UIImageView setClipsToBounds:](self->_merchantIconImageView, "setClipsToBounds:", 1);
        -[UIImageView _setContinuousCornerRadius:](self->_merchantIconImageView, "_setContinuousCornerRadius:", 8.0);
        if (self->_useStroke)
        {
          -[UIImageView layer](self->_merchantIconImageView, "layer");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setBorderWidth:", PKUIPixelLength());

        }
        -[PKPaymentTransactionDetailHeaderView addSubview:](self, "addSubview:", self->_merchantIconImageView);
        merchantIconImageView = self->_merchantIconImageView;
      }
      -[UIImageView setImage:](merchantIconImageView, "setImage:");
      -[PKPaymentTransactionDetailHeaderView _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
    }
    else
    {
      -[UIImageView removeFromSuperview](merchantIconImageView, "removeFromSuperview");
      v10 = self->_merchantIconImageView;
      self->_merchantIconImageView = 0;

    }
    -[PKPaymentTransactionDetailHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionDetailHeaderView;
  -[PKPaymentTransactionDetailHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaymentTransactionDetailHeaderView bounds](self, "bounds");
  -[PKPaymentTransactionDetailHeaderView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKPaymentTransactionDetailHeaderView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionDetailHeaderView;
  -[PKPaymentTransactionDetailHeaderView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKPaymentTransactionDetailHeaderView _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIImageView *merchantIconImageView;
  double v14;
  CGFloat v15;
  UILabel *amountLabel;
  UILabel *subtitleLabel;
  double v18;
  CGFloat v19;
  UILabel *v20;
  double v21;
  CGFloat v22;
  UILabel *secondaryLabel;
  double v24;
  CGFloat v25;
  UILabel *tertiaryLabel;
  double v27;
  double v28;
  CGRect v29;
  CGRect remainder;
  CGSize result;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a3.origin.x + 16.0;
  v9 = 0.0;
  v10 = a3.origin.y + 0.0;
  v11 = a3.size.width + -32.0;
  v12 = a3.size.height + -22.0;
  remainder.origin.x = v8;
  remainder.origin.y = v10;
  remainder.size.width = v11;
  remainder.size.height = v12;
  memset(&v29, 0, sizeof(v29));
  if (self->_merchantIcon)
  {
    CGRectDivide(*(CGRect *)&v8, &v29, &remainder, 80.0, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
    {
      merchantIconImageView = self->_merchantIconImageView;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](merchantIconImageView, "setFrame:", *(_OWORD *)&v29.origin, *(_OWORD *)&v29.size);
    }
    CGRectDivide(remainder, &v29, &remainder, 20.0, CGRectMinYEdge);
    v9 = 100.0;
  }
  if (-[NSString length](self->_amountText, "length", *(_OWORD *)&v29.origin, *(_OWORD *)&v29.size))
  {
    -[UILabel pkui_sizeThatFits:](self->_amountLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
    v15 = v14;
    if (!self->_isTemplateLayout)
    {
      amountLabel = self->_amountLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](amountLabel, "setFrame:");
    }
    CGRectDivide(remainder, &v29, &remainder, v15, CGRectMinYEdge);
    v9 = v9 + v15;
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v19 = v18;
    if (!self->_isTemplateLayout)
    {
      v20 = self->_subtitleLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v20, "setFrame:");
    }
    CGRectDivide(remainder, &v29, &remainder, v19, CGRectMinYEdge);
    v9 = v9 + v19;
  }
  if (self->_secondaryLabel)
  {
    CGRectDivide(remainder, &v29, &remainder, 4.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v22 = v21;
    if (!self->_isTemplateLayout)
    {
      secondaryLabel = self->_secondaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](secondaryLabel, "setFrame:");
    }
    CGRectDivide(remainder, &v29, &remainder, v22, CGRectMinYEdge);
    v9 = v9 + v22 + 4.0;
  }
  if (self->_tertiaryLabel)
  {
    CGRectDivide(remainder, &v29, &remainder, 4.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v25 = v24;
    if (!self->_isTemplateLayout)
    {
      tertiaryLabel = self->_tertiaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](tertiaryLabel, "setFrame:");
    }
    CGRectDivide(remainder, &v29, &remainder, v25, CGRectMinYEdge);
    v9 = v9 + v25 + 4.0;
  }
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v27 = CGRectGetWidth(v32);
  v28 = v9 + 22.0;
  result.height = v28;
  result.width = v27;
  return result;
}

- (void)_updateImageViewDynamicColors
{
  void *v3;
  _QWORD v4[5];

  -[PKPaymentTransactionDetailHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PKPaymentTransactionDetailHeaderView__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __69__PKPaymentTransactionDetailHeaderView__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (BOOL)inBridge
{
  return self->_inBridge;
}

- (void)setInBridge:(BOOL)a3
{
  self->_inBridge = a3;
}

- (BOOL)hasProminentSubtitle
{
  return self->_hasProminentSubtitle;
}

- (void)setHasProminentSubtitle:(BOOL)a3
{
  self->_hasProminentSubtitle = a3;
}

- (NSString)amountText
{
  return self->_amountText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)secondarySubtitleText
{
  return self->_secondarySubtitleText;
}

- (NSString)tertiarySubtitleText
{
  return self->_tertiarySubtitleText;
}

- (UIImage)merchantIcon
{
  return self->_merchantIcon;
}

- (BOOL)useStroke
{
  return self->_useStroke;
}

- (void)setUseStroke:(BOOL)a3
{
  self->_useStroke = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_tertiarySubtitleText, 0);
  objc_storeStrong((id *)&self->_secondarySubtitleText, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_merchantIconImageView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
}

@end
