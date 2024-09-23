@implementation PKStackedLabelCell

- (PKStackedLabelCell)initWithReuseIdentifier:(id)a3
{
  return -[PKStackedLabelCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, a3);
}

- (PKStackedLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKStackedLabelCell *v4;
  uint64_t v5;
  UIColor *titleTextColor;
  uint64_t v7;
  UIColor *detailTextColor;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  UILabel *detailLabel;
  UIImageView *v13;
  UIImageView *detailImageView;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKStackedLabelCell;
  v4 = -[PKStackedLabelCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    titleTextColor = v4->_titleTextColor;
    v4->_titleTextColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = objc_claimAutoreleasedReturnValue();
    detailTextColor = v4->_detailTextColor;
    v4->_detailTextColor = (UIColor *)v7;

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4);
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v4->_titleTextColor);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v11;

    -[UILabel setNumberOfLines:](v4->_detailLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4->_detailLabel, "setTextAlignment:", 4);
    -[UILabel setTextColor:](v4->_detailLabel, "setTextColor:", v4->_detailTextColor);
    -[UILabel setLineBreakMode:](v4->_detailLabel, "setLineBreakMode:", 4);
    -[UILabel setAccessibilityIdentifier:](v4->_detailLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    detailImageView = v4->_detailImageView;
    v4->_detailImageView = v13;

    -[PKStackedLabelCell _applyLabelStyles](v4, "_applyLabelStyles");
    -[PKStackedLabelCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v4->_titleLabel);
    objc_msgSend(v15, "addSubview:", v4->_detailLabel);
    objc_msgSend(v15, "addSubview:", v4->_detailImageView);
    v4->_isRTL = -[PKStackedLabelCell _shouldReverseLayoutDirection](v4, "_shouldReverseLayoutDirection");

  }
  return v4;
}

- (void)_applyLabelStyles
{
  UILabel *titleLabel;
  NSString *v4;
  void *v5;
  UILabel *detailLabel;
  id v7;

  titleLabel = self->_titleLabel;
  v4 = (NSString *)*MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v5);

  detailLabel = self->_detailLabel;
  PKFontForDefaultDesign(v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](detailLabel, "setFont:", v7);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRectEdge v33;
  UILabel *v34;
  UIImageView *v35;
  UILabel *detailLabel;
  UILabel *titleLabel;
  UIImageView *detailImageView;
  CGFloat amount;
  double v40;
  double v41;
  CGRect slice;
  CGRect remainder;
  objc_super v44;
  CGRect v45;

  v44.receiver = self;
  v44.super_class = (Class)PKStackedLabelCell;
  -[PKStackedLabelCell layoutSubviews](&v44, sel_layoutSubviews);
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel frame](self->_detailLabel, "frame");
  -[UIImageView frame](self->_detailImageView, "frame");
  -[UILabel font](self->_titleLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v40 = v4;

  -[UILabel font](self->_detailLabel, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");

  -[PKStackedLabelCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "bounds");
  v16 = v10 + v15;
  v18 = v8 + v17;
  v20 = v19 - (v10 + v14);
  v22 = v21 - (v8 + v12);
  remainder.origin.x = v16;
  remainder.origin.y = v18;
  remainder.size.width = v20;
  remainder.size.height = v22;
  memset(&slice, 0, sizeof(slice));
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v20, v22);
  v24 = v23;
  amount = v25;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v20, v22);
  v27 = v26;
  -[UIImageView sizeThatFits:](self->_detailImageView, "sizeThatFits:", v20, v22);
  v29 = v28;
  PKFloatRoundToPixel();
  v31 = v30;
  v41 = v27;
  v32 = v30 + v24 + v27 + v29 + v40 * 0.4863;
  v33 = 2 * self->_isRTL;
  PKContentAlignmentMake();
  if (v32 <= v20)
  {
    PKContentAlignmentMake();
    CGRectDivide(remainder, &slice, &remainder, v24, v33);
    titleLabel = self->_titleLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](titleLabel, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, remainder.size.width - v41 - v31, v33);
    detailImageView = self->_detailImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](detailImageView, "setFrame:");
  }
  else
  {
    v45.origin.x = v16;
    v45.origin.y = v18;
    v45.size.width = v20;
    v45.size.height = v22;
    CGRectDivide(v45, &slice, &remainder, amount, CGRectMinYEdge);
    v34 = self->_titleLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v34, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, 6.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v29, v33);
    v35 = self->_detailImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](v35, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, v31, v33);
  detailLabel = self->_detailLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](detailLabel, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[PKStackedLabelCell contentView](self, "contentView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "frame");
  v10 = v9 - (v6 + v8);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v10, 1.79769313e308);
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v10, 1.79769313e308);
  -[UIImageView sizeThatFits:](self->_detailImageView, "sizeThatFits:", v10, 1.79769313e308);
  -[UILabel font](self->_titleLabel, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineHeight");

  -[UILabel font](self->_detailLabel, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lineHeight");

  PKSizeRoundToPixel();
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKStackedLabelCell;
  -[PKStackedLabelCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PKStackedLabelCell _applyLabelStyles](self, "_applyLabelStyles");
  -[PKStackedLabelCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitleText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_titleText;
  v7 = (NSString *)v5;
  v9 = v7;
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
    objc_storeStrong((id *)&self->_titleText, a3);
    -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[PKStackedLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setDetailText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_detailText;
  v7 = (NSString *)v5;
  v9 = v7;
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
    objc_storeStrong((id *)&self->_detailText, a3);
    -[UILabel setText:](self->_detailLabel, "setText:", v9);
    -[UILabel sizeToFit](self->_detailLabel, "sizeToFit");
    -[PKStackedLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setDetailImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_detailImage != v5)
  {
    objc_storeStrong((id *)&self->_detailImage, a3);
    -[UIImageView setImage:](self->_detailImageView, "setImage:", v5);
    -[UIImageView setTintColor:](self->_detailImageView, "setTintColor:", self->_detailTextColor);
    -[PKStackedLabelCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitleTextColor:(id)a3
{
  UIColor **p_titleTextColor;
  id v6;

  p_titleTextColor = &self->_titleTextColor;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", *p_titleTextColor);
  }

}

- (void)setDetailTextColor:(id)a3
{
  UIColor **p_detailTextColor;
  id v6;

  p_detailTextColor = &self->_detailTextColor;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailTextColor, a3);
    -[UILabel setTextColor:](self->_detailLabel, "setTextColor:", *p_detailTextColor);
  }

}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIImage)detailImage
{
  return self->_detailImage;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_detailImage, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_detailImageView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
