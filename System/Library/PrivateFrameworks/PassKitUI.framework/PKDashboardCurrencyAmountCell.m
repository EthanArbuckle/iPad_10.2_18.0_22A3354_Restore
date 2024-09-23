@implementation PKDashboardCurrencyAmountCell

- (PKDashboardCurrencyAmountCell)initWithFrame:(CGRect)a3
{
  PKDashboardCurrencyAmountCell *v3;
  PKDashboardCurrencyAmountCell *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *titleLabel;
  UILabel *v13;
  void *v14;
  uint64_t v15;
  UILabel *currencyLabel;
  UILabel *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKDashboardCurrencyAmountCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardCurrencyAmountCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    v13 = v4->_titleLabel;
    -[PKDashboardCurrencyAmountCell defaultPrimaryColor](v4, "defaultPrimaryColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    currencyLabel = v4->_currencyLabel;
    v4->_currencyLabel = (UILabel *)v15;

    v17 = v4->_currencyLabel;
    -[PKDashboardCurrencyAmountCell defaultSecondaryColor](v4, "defaultSecondaryColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setNumberOfLines:](v4->_currencyLabel, "setNumberOfLines:", 1);
    -[UILabel setAccessibilityIdentifier:](v4->_currencyLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    objc_msgSend(v5, "addSubview:", v4->_currencyLabel);
    -[PKDashboardCurrencyAmountCell resetFonts](v4, "resetFonts");

  }
  return v4;
}

- (void)setTitleString:(id)a3
{
  NSString *v4;
  NSString *titleString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  titleString = self->_titleString;
  self->_titleString = v4;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_titleString);
  -[PKDashboardCurrencyAmountCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAmount:(id)a3
{
  PKCurrencyAmount *v4;
  PKCurrencyAmount *currencyAmount;

  v4 = (PKCurrencyAmount *)objc_msgSend(a3, "copy");
  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = v4;

  -[PKDashboardCurrencyAmountCell _updateCurrencyLabel](self, "_updateCurrencyLabel");
  -[PKDashboardCurrencyAmountCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDetailString:(id)a3
{
  NSString *v4;
  NSString *detailString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  detailString = self->_detailString;
  self->_detailString = v4;

  -[PKDashboardCurrencyAmountCell _updateCurrencyLabel](self, "_updateCurrencyLabel");
  -[PKDashboardCurrencyAmountCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsPositivePrefix:(BOOL)a3
{
  self->_showsPositivePrefix = a3;
  -[PKDashboardCurrencyAmountCell _updateCurrencyLabel](self, "_updateCurrencyLabel");
  -[PKDashboardCurrencyAmountCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)defaultPrimaryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)defaultSecondaryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDashboardCurrencyAmountCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKDashboardCurrencyAmountCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKDashboardCurrencyAmountCell _layoutWithBounds:](self, "_layoutWithBounds:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  -[PKDashboardCurrencyAmountCell _layoutWithBounds:](self, "_layoutWithBounds:", v6, v7, width + v8 * -2.0, height);
  v11 = fmin(height, 44.0);
  if (v10 < 44.0)
    v10 = v11;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)resetFonts
{
  UILabel *titleLabel;
  NSString *v4;
  NSString *v5;
  void *v6;
  UILabel *currencyLabel;
  id v8;

  titleLabel = self->_titleLabel;
  v4 = (NSString *)*MEMORY[0x1E0DC4A88];
  v5 = (NSString *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v6);

  currencyLabel = self->_currencyLabel;
  PKFontForDefaultDesign(v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](currencyLabel, "setFont:", v8);

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
  double v14;
  double v15;
  int v16;
  CGRectEdge v17;
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
  double v33;
  CGRectEdge v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v55;
  CGRect v56;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a3.origin.x + 12.0;
  v9 = a3.origin.y + 12.0;
  v10 = a3.size.width + -24.0;
  v11 = a3.size.height + -24.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.size.width + -24.0, a3.size.height + -24.0);
  v46 = v12;
  v47 = v13;
  -[UILabel sizeThatFits:](self->_currencyLabel, "sizeThatFits:", v10, v11);
  v49 = v14;
  v50 = v15;
  v16 = -[PKDashboardCurrencyAmountCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  memset(&slice, 0, sizeof(slice));
  if (v16)
    v17 = CGRectMaxXEdge;
  else
    v17 = CGRectMinXEdge;
  remainder.origin.x = v8;
  remainder.origin.y = v9;
  remainder.size.width = v10;
  remainder.size.height = v11;
  v51 = width;
  if (-[PKDashboardCurrencyAmountCell _shouldUseStackedLayoutWithBounds:](self, "_shouldUseStackedLayoutWithBounds:", x, y, width, height))
  {
    v55.origin.x = v8;
    v55.origin.y = v9;
    v55.size.width = v10;
    v55.size.height = v11;
    CGRectDivide(v55, &slice, &remainder, v47 + 5.0, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v48 = v18;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    CGRectDivide(remainder, &slice, &remainder, v50, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = v24 + 12.0 + 5.0 + v31;
  }
  else
  {
    if (v16)
      v34 = CGRectMinXEdge;
    else
      v34 = CGRectMaxXEdge;
    v56.origin.x = v8;
    v56.origin.y = v9;
    v56.size.width = v10;
    v56.size.height = v11;
    CGRectDivide(v56, &slice, &remainder, fmin(v10, v46), v17);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v48 = v35;
    v20 = v36;
    v22 = v37;
    v24 = v38;
    CGRectDivide(remainder, &slice, &remainder, fmin(remainder.size.width, v49), v34);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v26 = v39;
    v28 = v40;
    v30 = v41;
    v32 = v42;
    v33 = v24 + 12.0;
  }
  v43 = v33 + 12.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v48, v20, v22, v24);
  -[UILabel setFrame:](self->_currencyLabel, "setFrame:", v26, v28, v30, v32);
  v44 = v51;
  v45 = v43;
  result.height = v45;
  result.width = v44;
  return result;
}

- (void)_updateCurrencyLabel
{
  uint64_t v3;
  void *v4;
  char v5;
  UILabel *currencyLabel;
  void *v7;
  id v8;

  if (self->_detailString)
  {
    -[UILabel setText:](self->_currencyLabel, "setText:");
  }
  else
  {
    -[PKCurrencyAmount formattedStringValue](self->_currencyAmount, "formattedStringValue");
    v3 = objc_claimAutoreleasedReturnValue();
    v8 = (id)v3;
    if (self->_showsPositivePrefix
      && (-[PKCurrencyAmount amount](self->_amount, "amount", v3),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "pk_isNegativeNumber"),
          v4,
          v3 = (uint64_t)v8,
          (v5 & 1) == 0))
    {
      currencyLabel = self->_currencyLabel;
      PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](currencyLabel, "setText:", v7);

    }
    else
    {
      -[UILabel setText:](self->_currencyLabel, "setText:", v3);
    }

  }
}

- (BOOL)_shouldUseStackedLayoutWithBounds:(CGRect)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  width = a3.size.width;
  -[UILabel font](self->_titleLabel, "font", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  v7 = v6;

  if (v7 >= 25.0)
    return 1;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
  v9 = v8;
  -[UILabel sizeThatFits:](self->_currencyLabel, "sizeThatFits:", width, 1.79769313e308);
  return width < v9 + v10 + 36.0;
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
  v10.super_class = (Class)PKDashboardCurrencyAmountCell;
  -[PKDashboardCurrencyAmountCell traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKDashboardCurrencyAmountCell traitCollection](self, "traitCollection");
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
        -[PKDashboardCurrencyAmountCell resetFonts](self, "resetFonts");
    }
  }

}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)detailString
{
  return self->_detailString;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (BOOL)showsPositivePrefix
{
  return self->_showsPositivePrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_currencyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
