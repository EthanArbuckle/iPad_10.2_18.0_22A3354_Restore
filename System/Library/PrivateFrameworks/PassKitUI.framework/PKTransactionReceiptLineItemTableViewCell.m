@implementation PKTransactionReceiptLineItemTableViewCell

- (PKTransactionReceiptLineItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTransactionReceiptLineItemTableViewCell *v4;
  PKTransactionReceiptLineItemTableViewCell *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIImageView *imageView;
  void *v14;
  id v15;
  uint64_t v16;
  UILabel *amountLabel;
  UILabel *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  uint64_t v23;
  UILabel *primaryLabel;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  uint64_t v29;
  UILabel *secondaryLabel;
  UILabel *v31;
  NSString *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  uint64_t v36;
  UILabel *tertiaryLabel;
  UILabel *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)PKTransactionReceiptLineItemTableViewCell;
  v4 = -[PKTransactionReceiptLineItemTableViewCell initWithStyle:reuseIdentifier:](&v43, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[PKTransactionReceiptLineItemTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v12;

    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 1);
    -[UIImageView layer](v5->_imageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v14, "setCornerRadius:", 6.0);
    objc_msgSend(v14, "setMasksToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    objc_msgSend(v14, "setBorderWidth:", PKUIPixelLength());
    objc_msgSend(v6, "addSubview:", v5->_imageView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
    amountLabel = v5->_amountLabel;
    v5->_amountLabel = (UILabel *)v16;

    v18 = v5->_amountLabel;
    v19 = (void *)*MEMORY[0x1E0DC4A88];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v20);

    v21 = v5->_amountLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setAccessibilityIdentifier:](v5->_amountLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A8]);
    objc_msgSend(v6, "addSubview:", v5->_amountLabel);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
    primaryLabel = v5->_primaryLabel;
    v5->_primaryLabel = (UILabel *)v23;

    v25 = v5->_primaryLabel;
    PKFontForDefaultDesign(v19, 0, 2, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v25, "setFont:", v26);

    v27 = v5->_primaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    -[UILabel setNumberOfLines:](v5->_primaryLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_primaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v6, "addSubview:", v5->_primaryLabel);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
    secondaryLabel = v5->_secondaryLabel;
    v5->_secondaryLabel = (UILabel *)v29;

    v31 = v5->_secondaryLabel;
    v32 = (NSString *)*MEMORY[0x1E0DC4B10];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v31, "setFont:", v33);

    v34 = v5->_secondaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v34, "setTextColor:", v35);

    -[UILabel setNumberOfLines:](v5->_secondaryLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_secondaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    objc_msgSend(v6, "addSubview:", v5->_secondaryLabel);
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
    tertiaryLabel = v5->_tertiaryLabel;
    v5->_tertiaryLabel = (UILabel *)v36;

    v38 = v5->_tertiaryLabel;
    PKFontForDefaultDesign(v32, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v38, "setFont:", v39);

    v40 = v5->_tertiaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v40, "setTextColor:", v41);

    -[UILabel setNumberOfLines:](v5->_tertiaryLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_tertiaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68108]);
    objc_msgSend(v6, "addSubview:", v5->_tertiaryLabel);
    -[PKTransactionReceiptLineItemTableViewCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CF0]);

  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTransactionReceiptLineItemTableViewCell;
  -[PKTransactionReceiptLineItemTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKTransactionReceiptLineItemTableViewCell setImage:](self, "setImage:", 0);
  -[PKTransactionReceiptLineItemTableViewCell setPrimaryText:](self, "setPrimaryText:", 0);
  -[PKTransactionReceiptLineItemTableViewCell setSecondaryText:](self, "setSecondaryText:", 0);
  -[PKTransactionReceiptLineItemTableViewCell setTertiaryText:](self, "setTertiaryText:", 0);
  -[PKTransactionReceiptLineItemTableViewCell setAmountText:](self, "setAmountText:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  UIImage *image;
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
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  width = a3.width;
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  image = self->_image;
  if (image)
  {
    -[UIImage size](image, "size");
    PKSizeAspectFit();
    v11 = v10;
    v12 = 61.0;
  }
  else
  {
    v11 = 0.0;
    if (self->_suppressImage)
      v12 = 0.0;
    else
      v12 = 61.0;
  }
  if (self->_amountText)
  {
    -[UILabel pkui_sizeThatFits:](self->_amountLabel, "pkui_sizeThatFits:", width, 1.79769313e308);
    v15 = v14;
    if (v13 > 0.0)
      v13 = v13 + 16.0;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v16 = width - v12 - v13 - v6;
  v17 = v16 - v8;
  if (self->_primaryText)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_primaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v16 - v8, 1.79769313e308);
    v19 = v18 + 0.0 + 2.0;
  }
  else
  {
    v19 = 0.0;
  }
  if (self->_secondaryText)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v17, 1.79769313e308);
    v19 = v19 + v20 + 2.0;
  }
  if (self->_tertiaryText)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v17, 1.79769313e308);
    v19 = v19 + v21;
  }
  v22 = 16.0;
  v23 = fmax(v15, fmax(v11, v19)) + 16.0;
  if (!self->_hasTrailingLineSeparator)
    v22 = 0.0;
  v24 = v23 + v22;
  v25 = width;
  result.height = v24;
  result.width = v25;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
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
  int v21;
  CGRectEdge v22;
  UIImageView *imageView;
  CGRectEdge v24;
  CGFloat v25;
  UILabel *amountLabel;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGRect v30;
  CGRect remainder;
  objc_super v32;
  CGRect v33;

  v32.receiver = self;
  v32.super_class = (Class)PKTransactionReceiptLineItemTableViewCell;
  -[PKTransactionReceiptLineItemTableViewCell layoutSubviews](&v32, sel_layoutSubviews);
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v4 = v3;
  v6 = v5;
  -[PKTransactionReceiptLineItemTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v4 + v9;
  v17 = 16.0;
  v18 = v11 + 16.0;
  v19 = v13 - (v4 + v6);
  if (self->_hasTrailingLineSeparator)
    v17 = 32.0;
  v20 = v15 - v17;
  remainder.origin.x = v16;
  remainder.origin.y = v18;
  remainder.size.width = v19;
  remainder.size.height = v15 - v17;
  v21 = -[PKTransactionReceiptLineItemTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", 0, 0, 0, 0);
  if (v21)
    v22 = CGRectMaxXEdge;
  else
    v22 = CGRectMinXEdge;
  if (self->_image || !self->_suppressImage)
  {
    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v19;
    v33.size.height = v20;
    CGRectDivide(v33, &v30, &remainder, 45.0, v22);
    -[UIImage size](self->_image, "size");
    imageView = self->_imageView;
    PKSizeAspectFit();
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](imageView, "setFrame:");
    CGRectDivide(remainder, &v30, &remainder, 16.0, v22);
  }
  else
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  if (v21)
    v24 = CGRectMinXEdge;
  else
    v24 = CGRectMaxXEdge;
  -[UILabel pkui_sizeThatFits:](self->_amountLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v30, &remainder, v25, v24);
  amountLabel = self->_amountLabel;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](amountLabel, "setFrame:");
  CGRectDivide(remainder, &v30, &remainder, 16.0, v24);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_primaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v30, &remainder, v27, CGRectMinYEdge);
  -[UILabel setFrame:](self->_primaryLabel, "setFrame:", *(_OWORD *)&v30.origin, *(_OWORD *)&v30.size);
  CGRectDivide(remainder, &v30, &remainder, 2.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v30, &remainder, v28, CGRectMinYEdge);
  -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", *(_OWORD *)&v30.origin, *(_OWORD *)&v30.size);
  CGRectDivide(remainder, &v30, &remainder, 2.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v30, &remainder, v29, CGRectMinYEdge);
  -[UILabel setFrame:](self->_tertiaryLabel, "setFrame:", *(_OWORD *)&v30.origin, *(_OWORD *)&v30.size);
}

- (void)setImage:(id)a3
{
  UIImage **p_image;
  id v6;

  p_image = &self->_image;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[UIImageView setImage:](self->_imageView, "setImage:", *p_image);
    -[PKTransactionReceiptLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPrimaryText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *primaryText;
  NSString *v10;

  v4 = a3;
  v5 = self->_primaryText;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    primaryText = self->_primaryText;
    self->_primaryText = v8;

    -[UILabel setText:](self->_primaryLabel, "setText:", self->_primaryText);
    -[PKTransactionReceiptLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSecondaryText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *secondaryText;
  NSString *v10;

  v4 = a3;
  v5 = self->_secondaryText;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    secondaryText = self->_secondaryText;
    self->_secondaryText = v8;

    -[UILabel setText:](self->_secondaryLabel, "setText:", self->_secondaryText);
    -[PKTransactionReceiptLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTertiaryText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *tertiaryText;
  NSString *v10;

  v4 = a3;
  v5 = self->_tertiaryText;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    tertiaryText = self->_tertiaryText;
    self->_tertiaryText = v8;

    -[UILabel setText:](self->_tertiaryLabel, "setText:", self->_tertiaryText);
    -[PKTransactionReceiptLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setAmountText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *amountText;
  NSString *v10;

  v4 = a3;
  v5 = self->_amountText;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    amountText = self->_amountText;
    self->_amountText = v8;

    -[UILabel setText:](self->_amountLabel, "setText:", self->_amountText);
    -[PKTransactionReceiptLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setHasTrailingLineSeparator:(BOOL)a3
{
  if (((!self->_hasTrailingLineSeparator ^ a3) & 1) == 0)
  {
    self->_hasTrailingLineSeparator = a3;
    -[PKTransactionReceiptLineItemTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", -[PKTransactionReceiptLineItemTableViewCell separatorStyleForTrailingLineSeparator](self, "separatorStyleForTrailingLineSeparator"));
    -[PKTransactionReceiptLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)separatorStyleForTrailingLineSeparator
{
  return self->_hasTrailingLineSeparator;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v5;

  if (-[PKTransactionReceiptLineItemTableViewCell separatorStyleForTrailingLineSeparator](self, "separatorStyleForTrailingLineSeparator") == a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKTransactionReceiptLineItemTableViewCell;
    -[PKTransactionReceiptLineItemTableViewCell setSeparatorStyle:](&v5, sel_setSeparatorStyle_, a3);
  }
}

- (void)setSuppressImage:(BOOL)a3
{
  if (((!self->_suppressImage ^ a3) & 1) == 0)
  {
    self->_suppressImage = a3;
    -[PKTransactionReceiptLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (NSString)amountText
{
  return self->_amountText;
}

- (BOOL)hasTrailingLineSeparator
{
  return self->_hasTrailingLineSeparator;
}

- (BOOL)suppressImage
{
  return self->_suppressImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
