@implementation PKInstallmentPlanTotalFinancedCollectionViewCell

- (PKInstallmentPlanTotalFinancedCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKInstallmentPlanTotalFinancedCollectionViewCell *v3;
  PKInstallmentPlanTotalFinancedCollectionViewCell *v4;
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
  UILabel *v15;
  void *v16;
  uint64_t v17;
  UILabel *amountLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  uint64_t v23;
  UILabel *subtitleLabel;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  UIImageView *disclosureView;
  UIImageView *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)PKInstallmentPlanTotalFinancedCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKInstallmentPlanTotalFinancedCollectionViewCell contentView](v3, "contentView");
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
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    v15 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    amountLabel = v4->_amountLabel;
    v4->_amountLabel = (UILabel *)v17;

    v19 = v4->_amountLabel;
    PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], 0, 2, 0, *MEMORY[0x1E0DC1420]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    v21 = v4->_amountLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setAccessibilityIdentifier:](v4->_amountLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A8]);
    objc_msgSend(v5, "addSubview:", v4->_amountLabel);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v23;

    v25 = v4->_subtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v25, "setFont:", v26);

    v27 = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
    v29 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "initWithImage:", v30);
    disclosureView = v4->_disclosureView;
    v4->_disclosureView = (UIImageView *)v31;

    v33 = v4->_disclosureView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v33, "setTintColor:", v34);

    objc_msgSend(v5, "addSubview:", v4->_disclosureView);
    -[PKInstallmentPlanTotalFinancedCollectionViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68120]);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  self->_isTemplateLayout = 1;
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  -[PKInstallmentPlanTotalFinancedCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width - (v6 + v6), height);
  self->_isTemplateLayout = 0;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKInstallmentPlanTotalFinancedCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKInstallmentPlanTotalFinancedCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKInstallmentPlanTotalFinancedCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:");

}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRectEdge v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGRect *p_slice;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKInstallmentPlanTotalFinancedCollectionViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v8 = CGRectMinXEdge;
  else
    v8 = CGRectMaxXEdge;
  remainder.origin.x = x + 16.0;
  remainder.origin.y = y + 16.0;
  remainder.size.width = width + -32.0;
  remainder.size.height = height + -32.0;
  memset(&slice, 0, sizeof(slice));
  -[UIImageView frame](self->_disclosureView, "frame", *(_QWORD *)&width, *(_QWORD *)&height);
  v10 = v9;
  v27.origin.x = x + 16.0;
  v27.origin.y = y + 16.0;
  v27.size.width = width + -32.0;
  v27.size.height = height + -32.0;
  CGRectDivide(v27, &slice, &remainder, v10, v8);
  if (!self->_isTemplateLayout)
  {
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 16.0, v8);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v12 = v11;
  -[UILabel sizeThatFits:](self->_amountLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v14 = v13;
  if (self->_subtitleText)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v16 = v15;
  }
  else
  {
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (!self->_isTemplateLayout)
  {
    CGRectDivide(remainder, &slice, &remainder, v12, CGRectMinYEdge);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(remainder, &slice, &remainder, 5.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v14, CGRectMinYEdge);
    -[UILabel setFrame:](self->_amountLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    if (v16 <= 0.0)
    {
      p_slice = (CGRect *)MEMORY[0x1E0C9D648];
    }
    else
    {
      p_slice = &slice;
      CGRectDivide(remainder, &slice, &remainder, 5.0, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, v16, CGRectMinYEdge);
    }
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", p_slice->origin.x, p_slice->origin.y, p_slice->size.width, p_slice->size.height);
  }
  v18 = v16 + 5.0;
  if (v16 <= 0.0)
    v18 = -0.0;
  v19 = v12 + v14 + 5.0 + v18 + 32.0;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = v22;
  v28.size.height = v23;
  v20 = CGRectGetWidth(v28);
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *title;
  NSString *v10;

  v4 = a3;
  v5 = self->_title;
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
    title = self->_title;
    self->_title = v8;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    -[PKInstallmentPlanTotalFinancedCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setAmount:(id)a3
{
  UILabel *amountLabel;
  void *v6;
  id v7;

  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    amountLabel = self->_amountLabel;
    objc_msgSend(v7, "formattedStringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](amountLabel, "setText:", v6);

    -[PKInstallmentPlanTotalFinancedCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitleText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subtitleText;
  NSString *v10;

  v4 = a3;
  v5 = self->_subtitleText;
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
    subtitleText = self->_subtitleText;
    self->_subtitleText = v8;

    -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitleText);
    -[PKInstallmentPlanTotalFinancedCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (NSString)title
{
  return self->_title;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
