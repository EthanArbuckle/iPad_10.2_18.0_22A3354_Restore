@implementation PKPaymentTransactionDetailLineItemTableViewCell

- (PKPaymentTransactionDetailLineItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKPaymentTransactionDetailLineItemTableViewCell *v4;
  UILabel *v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *valueLabel;
  UIFont *v9;
  UIFont *valueFont;
  UIColor *v11;
  UIColor *valueColor;
  UIColor *v13;
  void *v14;
  UIFont *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionDetailLineItemTableViewCell;
  v4 = -[PKPaymentTransactionDetailLineItemTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = v7;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v4->_titleFont, v9);
    valueFont = v4->_valueFont;
    v4->_valueFont = v9;
    v16 = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v4->_titleColor, v11);
    valueColor = v4->_valueColor;
    v4->_valueColor = v11;
    v13 = v11;

    -[PKPaymentTransactionDetailLineItemTableViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_titleLabel);
    objc_msgSend(v14, "addSubview:", v4->_valueLabel);
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v4->_titleFont);
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v4->_titleColor);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[UILabel setFont:](v4->_valueLabel, "setFont:", v4->_valueFont);
    -[UILabel setTextColor:](v4->_valueLabel, "setTextColor:", v4->_valueColor);
    -[UILabel setNumberOfLines:](v4->_valueLabel, "setNumberOfLines:", 1);
    -[UILabel setAccessibilityIdentifier:](v4->_valueLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);

    -[PKPaymentTransactionDetailLineItemTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[PKPaymentTransactionDetailLineItemTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CF0]);

  }
  return v4;
}

- (void)setTitleText:(id)a3
{
  NSString **p_titleText;
  id v6;

  p_titleText = &self->_titleText;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", *p_titleText) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    -[UILabel setText:](self->_titleLabel, "setText:", *p_titleText);
    -[PKPaymentTransactionDetailLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitleFont:(id)a3
{
  UIFont **p_titleFont;
  id v6;

  p_titleFont = &self->_titleFont;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_titleFont) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[UILabel setFont:](self->_titleLabel, "setFont:", *p_titleFont);
    -[PKPaymentTransactionDetailLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitleColor:(id)a3
{
  UIColor **p_titleColor;
  id v6;

  p_titleColor = &self->_titleColor;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_titleColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", *p_titleColor);
  }

}

- (void)setValueText:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_valueText) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueText, a3);
    -[UILabel setText:](self->_valueLabel, "setText:", v5);
    -[PKPaymentTransactionDetailLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setValueFont:(id)a3
{
  UIFont **p_valueFont;
  id v6;

  p_valueFont = &self->_valueFont;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_valueFont) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFont, a3);
    -[UILabel setFont:](self->_valueLabel, "setFont:", *p_valueFont);
    -[PKPaymentTransactionDetailLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setValueColor:(id)a3
{
  UIColor **p_valueColor;
  id v6;

  p_valueColor = &self->_valueColor;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_valueColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueColor, a3);
    -[UILabel setTextColor:](self->_valueLabel, "setTextColor:", *p_valueColor);
  }

}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  if (((!self->_hasTrailingLineSeperator ^ a3) & 1) == 0)
  {
    self->_hasTrailingLineSeperator = a3;
    -[PKPaymentTransactionDetailLineItemTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", -[PKPaymentTransactionDetailLineItemTableViewCell separatorStyleForTrailingLineSeparator](self, "separatorStyleForTrailingLineSeparator"));
    -[PKPaymentTransactionDetailLineItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)separatorStyleForTrailingLineSeparator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v5;

  if (-[PKPaymentTransactionDetailLineItemTableViewCell separatorStyleForTrailingLineSeparator](self, "separatorStyleForTrailingLineSeparator") == a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentTransactionDetailLineItemTableViewCell;
    -[PKPaymentTransactionDetailLineItemTableViewCell setSeparatorStyle:](&v5, sel_setSeparatorStyle_, a3);
  }
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
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
  CGRectEdge v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect slice;
  CGRect remainder;
  objc_super v29;
  CGRect v30;

  v29.receiver = self;
  v29.super_class = (Class)PKPaymentTransactionDetailLineItemTableViewCell;
  -[PKPaymentTransactionDetailLineItemTableViewCell layoutSubviews](&v29, sel_layoutSubviews);
  v3 = -[PKPaymentTransactionDetailLineItemTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKPaymentTransactionDetailLineItemTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "bounds");
  v12 = v6 + v11;
  v13 = 11.0;
  v14 = v9 + 11.0;
  v16 = v15 - (v6 + v8);
  if (self->_hasTrailingLineSeperator)
    v13 = 22.0;
  v17 = v10 - v13;
  remainder.origin.x = v12;
  remainder.origin.y = v9 + 11.0;
  remainder.size.width = v16;
  remainder.size.height = v10 - v13;
  if (v3)
    v18 = CGRectMinXEdge;
  else
    v18 = CGRectMaxXEdge;
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v16, v17);
  v20 = v19;
  v22 = v21;
  memset(&slice, 0, sizeof(slice));
  v30.origin.x = v12;
  v30.origin.y = v14;
  v30.size.width = v16;
  v30.size.height = v17;
  CGRectDivide(v30, &slice, &remainder, v20, v18);
  memset(&v26, 0, sizeof(v26));
  memset(&v25, 0, sizeof(v25));
  CGRectDivide(slice, &v25, &v26, v22, CGRectMinYEdge);
  -[UILabel setFrame:](self->_valueLabel, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  memset(&v24, 0, sizeof(v24));
  memset(&v23, 0, sizeof(v23));
  CGRectDivide(remainder, &v23, &v24, 6.0, v18);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
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
  double v22;
  CGSize result;

  width = a3.width;
  -[PKPaymentTransactionDetailLineItemTableViewCell contentView](self, "contentView", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "frame");
  v11 = v10 - v7 - v9;
  if (self->_hasTrailingLineSeperator)
    v12 = 11.0;
  else
    v12 = 0.0;
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v11, 1.79769313e308);
  v14 = v13;
  LODWORD(v16) = 1148846080;
  LODWORD(v17) = 1112014848;
  -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_titleLabel, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v11 - v15 + -6.0, 0.0, v16, v17);
  if (v14 <= v18)
    v19 = v18;
  else
    v19 = v14;
  v20 = v12 + v19 + 11.0;

  v21 = width;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (NSString)valueText
{
  return self->_valueText;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (UIColor)valueColor
{
  return self->_valueColor;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_valueColor, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
