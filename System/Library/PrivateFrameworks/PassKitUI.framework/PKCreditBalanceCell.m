@implementation PKCreditBalanceCell

- (PKCreditBalanceCell)initWithFrame:(CGRect)a3
{
  PKCreditBalanceCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCreditBalanceCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
    -[PKCreditBalanceCell _createSubviews](v3, "_createSubviews");
  }
  return v3;
}

- (void)_createSubviews
{
  UILabel *v3;
  UILabel *labelBalance;
  UIFont *v5;
  UIFont *defaultFont;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  UILabel *labelAmount;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  UILabel *labelCreditAvailable;
  UILabel *v15;
  void *v16;
  id v17;

  -[PKCreditBalanceCell contentView](self, "contentView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  labelBalance = self->_labelBalance;
  self->_labelBalance = v3;

  -[UILabel font](self->_labelBalance, "font");
  v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
  defaultFont = self->_defaultFont;
  self->_defaultFont = v5;

  -[UILabel setNumberOfLines:](self->_labelBalance, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelBalance, "setAdjustsFontSizeToFitWidth:", 1);
  v7 = self->_labelBalance;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v7, "setTextColor:", v8);

  -[UILabel setAccessibilityIdentifier:](self->_labelBalance, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);
  objc_msgSend(v17, "addSubview:", self->_labelBalance);
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  labelAmount = self->_labelAmount;
  self->_labelAmount = v9;

  -[UILabel setNumberOfLines:](self->_labelAmount, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelAmount, "setAdjustsFontSizeToFitWidth:", 1);
  v11 = self->_labelAmount;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v11, "setTextColor:", v12);

  -[UILabel setAccessibilityIdentifier:](self->_labelAmount, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  objc_msgSend(v17, "addSubview:", self->_labelAmount);
  v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  labelCreditAvailable = self->_labelCreditAvailable;
  self->_labelCreditAvailable = v13;

  -[UILabel setNumberOfLines:](self->_labelCreditAvailable, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelCreditAvailable, "setAdjustsFontSizeToFitWidth:", 1);
  v15 = self->_labelCreditAvailable;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v15, "setTextColor:", v16);

  -[UILabel setAccessibilityIdentifier:](self->_labelCreditAvailable, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  objc_msgSend(v17, "addSubview:", self->_labelCreditAvailable);
  -[PKCreditBalanceCell _updateDefaultValues](self, "_updateDefaultValues");
  -[PKCreditBalanceCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67928]);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCreditBalanceCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKCreditBalanceCell _updateDefaultValues](self, "_updateDefaultValues");
}

- (void)_updateDefaultValues
{
  id v3;

  -[PKCreditBalanceCell setBalanceText:](self, "setBalanceText:", 0);
  -[PKCreditBalanceCell setBalanceFont:](self, "setBalanceFont:", self->_defaultFont);
  -[PKCreditBalanceCell setBalanceLabelNumberOfLines:](self, "setBalanceLabelNumberOfLines:", 1);
  -[PKCreditBalanceCell setAmountText:](self, "setAmountText:", 0);
  -[PKCreditBalanceCell setAmountFont:](self, "setAmountFont:", self->_defaultFont);
  -[PKCreditBalanceCell setCreditAvailableText:](self, "setCreditAvailableText:", 0);
  -[PKCreditBalanceCell setCreditAvailableFont:](self, "setCreditAvailableFont:", self->_defaultFont);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKCreditBalanceCell setCreditAvailableTextColor:](self, "setCreditAvailableTextColor:", v3);

}

- (void)layoutSubviews
{
  _BOOL4 isCompactUI;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  UILabel *labelBalance;
  UILabel *labelAmount;
  UILabel *labelCreditAvailable;
  CGRect v19;
  CGRect slice;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v21.receiver = self;
  v21.super_class = (Class)PKCreditBalanceCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v21, sel_layoutSubviews);
  isCompactUI = self->_isCompactUI;
  -[PKCreditBalanceCell bounds](self, "bounds");
  v8 = 12.0;
  if (isCompactUI)
    v8 = 8.0;
  v9 = v8 + v4;
  v10 = v5 + 8.0;
  v11 = 16.0;
  if (!isCompactUI)
    v11 = 24.0;
  v12 = v6 - v11;
  v13 = v7 + -16.0;
  -[PKCreditBalanceCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  memset(&slice, 0, sizeof(slice));
  v19.size.width = v12;
  v19.size.height = v13;
  -[UILabel sizeThatFits:](self->_labelBalance, "sizeThatFits:", v12, v13, *(_QWORD *)&v9, *(_QWORD *)&v10);
  v15 = v14 + 0.0;
  v22.origin.x = v9;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v13;
  CGRectDivide(v22, &slice, &v19, v15, CGRectMinYEdge);
  labelBalance = self->_labelBalance;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](labelBalance, "setFrame:");
  -[UILabel sizeThatFits:](self->_labelAmount, "sizeThatFits:", v19.size.width, v19.size.height);
  v23 = v19;
  CGRectDivide(v19, &slice, &v19, v23.origin.y + 0.0, CGRectMinYEdge);
  labelAmount = self->_labelAmount;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](labelAmount, "setFrame:");
  -[UILabel sizeThatFits:](self->_labelCreditAvailable, "sizeThatFits:", v19.size.width, v19.size.height);
  v24 = v19;
  CGRectDivide(v19, &slice, &v19, v24.origin.y + 0.0, CGRectMinYEdge);
  labelCreditAvailable = self->_labelCreditAvailable;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](labelCreditAvailable, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = a3.width + -24.0;
  -[UILabel sizeThatFits:](self->_labelBalance, "sizeThatFits:", a3.width + -24.0);
  v8 = v7 + 0.0 + 16.0;
  -[UILabel sizeThatFits:](self->_labelAmount, "sizeThatFits:", v6, height);
  v10 = v8 + v9 + 0.0;
  -[UILabel sizeThatFits:](self->_labelCreditAvailable, "sizeThatFits:", v6, height);
  v12 = v10 + v11 + 0.0;
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)setBalanceText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_balanceText;
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
    objc_storeStrong((id *)&self->_balanceText, a3);
    -[UILabel setText:](self->_labelBalance, "setText:", self->_balanceText);
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setBalanceFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_balanceFont, a3);
    -[UILabel setFont:](self->_labelBalance, "setFont:", v5);
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBalanceLabelNumberOfLines:(int64_t)a3
{
  if (self->_balanceLabelNumberOfLines != a3)
  {
    self->_balanceLabelNumberOfLines = a3;
    -[UILabel setNumberOfLines:](self->_labelBalance, "setNumberOfLines:");
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAmountText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_amountText;
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
    objc_storeStrong((id *)&self->_amountText, a3);
    -[UILabel setText:](self->_labelAmount, "setText:", self->_amountText);
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setAmountFont:(id)a3
{
  UIFont **p_amountFont;
  id v6;

  p_amountFont = &self->_amountFont;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amountFont, a3);
    -[UILabel setFont:](self->_labelAmount, "setFont:", *p_amountFont);
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCreditAvailableText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_creditAvailableText;
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
    objc_storeStrong((id *)&self->_creditAvailableText, a3);
    -[UILabel setText:](self->_labelCreditAvailable, "setText:", self->_creditAvailableText);
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setCreditAvailableFont:(id)a3
{
  UIFont **p_creditAvailableFont;
  id v6;

  p_creditAvailableFont = &self->_creditAvailableFont;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_creditAvailableFont, a3);
    -[UILabel setFont:](self->_labelCreditAvailable, "setFont:", *p_creditAvailableFont);
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCreditAvailableTextColor:(id)a3
{
  UIColor **p_creditAvailableTextColor;
  id v6;

  p_creditAvailableTextColor = &self->_creditAvailableTextColor;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_creditAvailableTextColor, a3);
    -[UILabel setTextColor:](self->_labelCreditAvailable, "setTextColor:", *p_creditAvailableTextColor);
  }

}

- (void)setItem:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_item, a3);
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setUseAccessibilityLayout:(BOOL)a3
{
  if (self->_useAccessibilityLayout != a3)
  {
    self->_useAccessibilityLayout = a3;
    -[PKCreditBalanceCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (PKDashboardCreditAccountItem)item
{
  return self->_item;
}

- (NSString)balanceText
{
  return self->_balanceText;
}

- (UIFont)balanceFont
{
  return self->_balanceFont;
}

- (int64_t)balanceLabelNumberOfLines
{
  return self->_balanceLabelNumberOfLines;
}

- (NSString)amountText
{
  return self->_amountText;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (NSString)creditAvailableText
{
  return self->_creditAvailableText;
}

- (UIFont)creditAvailableFont
{
  return self->_creditAvailableFont;
}

- (UIColor)creditAvailableTextColor
{
  return self->_creditAvailableTextColor;
}

- (BOOL)useAccessibilityLayout
{
  return self->_useAccessibilityLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creditAvailableTextColor, 0);
  objc_storeStrong((id *)&self->_creditAvailableFont, 0);
  objc_storeStrong((id *)&self->_creditAvailableText, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_balanceFont, 0);
  objc_storeStrong((id *)&self->_balanceText, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_labelCreditAvailable, 0);
  objc_storeStrong((id *)&self->_labelAmount, 0);
  objc_storeStrong((id *)&self->_labelBalance, 0);
  objc_storeStrong((id *)&self->_defaultFont, 0);
}

@end
