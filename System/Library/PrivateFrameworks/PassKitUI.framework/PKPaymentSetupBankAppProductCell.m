@implementation PKPaymentSetupBankAppProductCell

- (PKPaymentSetupBankAppProductCell)init
{
  void *v3;
  PKPaymentSetupBankAppProductCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend((id)objc_opt_class(), "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupBankAppProductCell;
  v4 = -[PKPaymentSetupBankAppProductCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 3, v3);

  if (v4)
  {
    -[PKPaymentSetupBankAppProductCell detailTextLabel](v4, "detailTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double y;
  CGFloat width;
  double height;
  double v21;
  double v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupBankAppProductCell;
  -[PKPaymentSetupProductCell layoutSubviews](&v23, sel_layoutSubviews);
  -[PKPaymentSetupProductCell textLabelOffset](self, "textLabelOffset");
  v4 = v3;
  -[PKPaymentSetupBankAppProductCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupBankAppProductCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    objc_msgSend(v6, "frame");
    -[PKPaymentSetupBankAppProductCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    UIRectCenteredYInRect();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v6, "setFrame:", v11, v13, v15, v17);
  }
  if (v4 > 0.0)
  {
    objc_msgSend(v5, "frame");
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    v24.origin.x = v4;
    v21 = CGRectGetWidth(v24);
    -[PKPaymentSetupBankAppProductCell bounds](self, "bounds");
    if (v21 >= CGRectGetWidth(v25) - v4)
    {
      -[PKPaymentSetupBankAppProductCell bounds](self, "bounds");
      v22 = CGRectGetWidth(v27) - v4;
    }
    else
    {
      v26.origin.x = v4;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v22 = CGRectGetWidth(v26);
    }
    objc_msgSend(v5, "setFrame:", v4, y, v22, height);
  }

}

@end
