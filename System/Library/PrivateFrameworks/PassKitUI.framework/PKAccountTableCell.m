@implementation PKAccountTableCell

- (PKAccountTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PKAccountTableCell *v9;
  PKAccountTableCell *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountTableCell;
  v9 = -[PKAccountTableCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[PKAccountTableCell setSpecifier:](v9, "setSpecifier:", v8);
    -[PKAccountTableCell setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  }

  return v10;
}

- (void)layoutSubviews
{
  int v3;
  CGRectEdge v4;
  void *v5;
  UIView *accessoryView;
  CGRectEdge v7;
  CGFloat v8;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double x;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat y;
  double v20;
  void *v21;
  id WeakRetained;
  UIView *v23;
  CGRect v24;
  CGRect v25;
  CGRect slice;
  CGRect remainder;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)PKAccountTableCell;
  -[PSTableCell layoutSubviews](&v28, sel_layoutSubviews);
  v3 = -[PKAccountTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v3)
    v4 = CGRectMaxXEdge;
  else
    v4 = CGRectMinXEdge;
  -[PKAccountTableCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  memset(&slice, 0, sizeof(slice));
  memset(&v25, 0, sizeof(v25));
  memset(&v24, 0, sizeof(v24));
  remainder = v29;
  CGRectDivide(v29, &slice, &remainder, 16.0, v4);
  CGRectDivide(remainder, &v25, &remainder, 29.0, v4);
  CGRectDivide(remainder, &slice, &remainder, 16.0, v4);
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    if (v3)
      v7 = CGRectMinXEdge;
    else
      v7 = CGRectMaxXEdge;
    -[UIView frame](accessoryView, "frame", *(_OWORD *)&v24.origin);
    CGRectDivide(remainder, &v24, &remainder, v8, v7);
  }
  width = remainder.size.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308, *(_OWORD *)&v24.origin);
  v11 = v10;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, 1.79769313e308);
  v13 = v12;
  v14 = v11 + 8.0 + 2.0 + v12 + 8.0;
  PKSizeAlignedInRect();
  x = v30.origin.x;
  v17 = v16;
  v18 = v30.size.width;
  v30.origin.y = v16 + 8.0;
  y = v30.origin.y;
  v30.size.height = v11;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v30.origin.x, CGRectGetMaxY(v30) + 2.0, v30.size.width, v13);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", x, y, v18, v11);
  v20 = 60.0;
  if (v14 >= 60.0)
    v20 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E0D80600]));
  objc_msgSend(WeakRetained, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D80938]);

  v25.size.height = v14;
  v25.origin.y = v17;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  v23 = self->_accessoryView;
  if (v23)
  {
    -[UIView sizeThatFits:](v23, "sizeThatFits:", *(_OWORD *)&v24.size);
    PKSizeAlignedInRect();
    -[UIView setFrame:](self->_accessoryView, "setFrame:");
  }

}

- (void)setSpecifier:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E0D80600]));
  v6 = objc_msgSend(WeakRetained, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKAccountTableCell;
    -[PSTableCell setSpecifier:](&v8, sel_setSpecifier_, v4);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkAccount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[PKAccountTableCell _configureCellForAccount:](self, "_configureCellForAccount:", v7);

  }
}

- (void)_configureCellForAccount:(id)a3
{
  uint64_t v4;
  UILabel *v5;
  UILabel *titleLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *subtitleLabel;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  UIImageView *v25;
  UIImageView *iconImageView;
  void *v27;
  void *v28;
  UIView *v29;
  UIView *accessoryView;
  UIView *v31;
  void *v32;
  id v33;

  v33 = a3;
  v4 = objc_msgSend(v33, "feature");
  if (!self->_titleLabel)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    v7 = self->_titleLabel;
    -[PKAccountTableCell _titleForAccount:](self, "_titleForAccount:", v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v8);

    v9 = self->_titleLabel;
    +[PKAccountTableCell titleFont](PKAccountTableCell, "titleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[PKAccountTableCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_titleLabel);

  }
  if (!self->_subtitleLabel)
  {
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v12;

    v14 = self->_subtitleLabel;
    -[PKAccountTableCell _subtitleForAccount:](self, "_subtitleForAccount:", v33);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v14, "setText:", v15);

    v16 = self->_subtitleLabel;
    -[PKAccountTableCell _subtitleColorForAccountState:](self, "_subtitleColorForAccountState:", objc_msgSend(v33, "state"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setColor:](v16, "setColor:", v17);

    v18 = self->_subtitleLabel;
    +[PKAccountTableCell subtitleFont](PKAccountTableCell, "subtitleFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
    -[PKAccountTableCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", self->_subtitleLabel);

  }
  if (!self->_iconImageView)
  {
    if (v4 == 5)
    {
      PKPassKitUIBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLForResource:withExtension:", CFSTR("SAVINGS_Icon"), CFSTR("pdf"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = PKUIScreenScale();
      PKUIImageFromPDF(v22, 29.0, 29.0, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    v25 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v24);
    iconImageView = self->_iconImageView;
    self->_iconImageView = v25;

    -[UIImageView sizeToFit](self->_iconImageView, "sizeToFit");
    -[UIImageView layer](self->_iconImageView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerRadius:", 6.0);
    objc_msgSend(v27, "setMasksToBounds:", 1);
    -[PKAccountTableCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", self->_iconImageView);

  }
  if (!self->_accessoryView)
  {
    -[PKAccountTableCell _accessoryForAccount:](self, "_accessoryForAccount:", v33);
    v29 = (UIView *)objc_claimAutoreleasedReturnValue();
    accessoryView = self->_accessoryView;
    self->_accessoryView = v29;

    v31 = self->_accessoryView;
    if (v31)
    {
      -[UIView sizeToFit](v31, "sizeToFit");
      -[PKAccountTableCell contentView](self, "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", self->_accessoryView);

    }
  }

}

- (id)_titleForAccount:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "feature") == 5)
  {
    PKLocalizedFeatureString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_subtitleForAccount:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "feature");
  v4 = objc_msgSend(v3, "state");
  if (v4 == 3 || v4 == 2)
  {
LABEL_13:
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v4 == 1)
  {
    if (objc_msgSend(v3, "type") == 4)
    {
      objc_msgSend(v3, "savingsDetails");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountSummary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currencyCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentBalance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
    if (objc_msgSend(v7, "length") && v8 && !objc_msgSend(v8, "pk_isNotANumber"))
    {
      PKCurrencyAmountMake();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "formattedStringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }

    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (id)_accessoryForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "feature") == 5 && PKSavingsAccountIsThresholdExceededActive())
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_subtitleColorForAccountState:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)subtitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (double)estimatedHeightForCell
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a1, "titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = v4;
  objc_msgSend(a1, "subtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  v8 = v5 + v7;

  return fmax(fmax(v8 + 2.0 + 16.0, 45.0), 60.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
