@implementation PKMerchantTokenDetailHeaderCell

- (PKMerchantTokenDetailHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKMerchantTokenDetailHeaderCell *v4;
  PKMerchantTokenDetailHeaderCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKMerchantTokenDetailHeaderCell;
  v4 = -[PKMerchantTokenDetailHeaderCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKMerchantTokenDetailHeaderCell _setUpViews](v4, "_setUpViews");
    -[PKMerchantTokenDetailHeaderCell _setUpConstraints](v5, "_setUpConstraints");
  }
  return v5;
}

- (void)updateCellWithMerchantToken:(id)a3
{
  void *v4;
  PKMerchantTokenIconView *iconView;
  void *v6;
  double v7;
  PKMerchantTokenIconView *v8;
  void *v9;
  void *v10;
  double v11;
  PKMerchantTokenIconView *v12;
  void *v13;
  UILabel *nameLabel;
  void *v15;
  id v16;

  v16 = a3;
  -[PKMerchantTokenIconView superview](self->_iconView, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v16, "isAMPPaymentToken"))
    {
      iconView = self->_iconView;
      PKUIImageNamed(CFSTR("MerchantTokenAppleMerchantIcon80"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 14.0;
      v8 = iconView;
    }
    else
    {
      if (!objc_msgSend(v16, "isAppleCashPaymentToken"))
      {
        v12 = self->_iconView;
        objc_msgSend(v16, "merchantIconURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "merchantName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMerchantTokenIconView updateWithImageURL:monogramText:cornerRadius:](v12, "updateWithImageURL:monogramText:cornerRadius:", v6, v13, 14.0);

        goto LABEL_8;
      }
      PKPassKitUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("AppleCashIcon"), CFSTR("pdf"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = PKUIScreenScale();
      PKUIImageFromPDF(v10, 80.0, 80.0, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = self->_iconView;
      v7 = 14.0;
    }
    -[PKMerchantTokenIconView updateWithImage:cornerRadius:](v8, "updateWithImage:cornerRadius:", v6, v7);
LABEL_8:

  }
  nameLabel = self->_nameLabel;
  objc_msgSend(v16, "merchantName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](nameLabel, "setText:", v15);

}

- (void)hideMerchantIcon
{
  -[PKMerchantTokenIconView removeFromSuperview](self->_iconView, "removeFromSuperview");
}

- (void)_setUpViews
{
  -[PKMerchantTokenDetailHeaderCell _setUpSelf](self, "_setUpSelf");
  -[PKMerchantTokenDetailHeaderCell _setUpStackView](self, "_setUpStackView");
  -[PKMerchantTokenDetailHeaderCell _setUpIconView](self, "_setUpIconView");
  -[PKMerchantTokenDetailHeaderCell _setUpNameLabel](self, "_setUpNameLabel");
}

- (void)_setUpSelf
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenDetailHeaderCell setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)_setUpStackView
{
  id v3;
  UIStackView *v4;
  UIStackView *stackView;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[PKMerchantTokenDetailHeaderCell contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_stackView);

}

- (void)_setUpIconView
{
  PKMerchantTokenIconView *v3;
  PKMerchantTokenIconView *v4;
  PKMerchantTokenIconView *iconView;

  v3 = [PKMerchantTokenIconView alloc];
  v4 = -[PKMerchantTokenIconView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconView = self->_iconView;
  self->_iconView = v4;

  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_iconView);
  -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", self->_iconView, 20.0);
}

- (void)_setUpNameLabel
{
  id v3;
  UILabel *v4;
  UILabel *nameLabel;
  UILabel *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  nameLabel = self->_nameLabel;
  self->_nameLabel = v4;

  -[UILabel setNumberOfLines:](self->_nameLabel, "setNumberOfLines:", 2);
  v6 = self->_nameLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B50], (NSString *)*MEMORY[0x1E0DC48C8], *MEMORY[0x1E0DC1448]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_nameLabel);
}

- (void)_setUpConstraints
{
  -[PKMerchantTokenDetailHeaderCell _setUpStackViewConstraints](self, "_setUpStackViewConstraints");
  -[PKMerchantTokenDetailHeaderCell _setUpIconViewConstraints](self, "_setUpIconViewConstraints");
}

- (void)_setUpStackViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[PKMerchantTokenDetailHeaderCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v4, -8.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v8;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)_setUpIconViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[PKMerchantTokenIconView widthAnchor](self->_iconView, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", 80.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  -[PKMerchantTokenIconView heightAnchor](self->_iconView, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 80.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
