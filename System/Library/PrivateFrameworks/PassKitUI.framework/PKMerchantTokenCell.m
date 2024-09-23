@implementation PKMerchantTokenCell

- (PKMerchantTokenCell)initWithFrame:(CGRect)a3
{
  PKMerchantTokenCell *v3;
  PKMerchantTokenCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMerchantTokenCell;
  v3 = -[PKMerchantTokenCell initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    -[PKMerchantTokenCell _setUpViews](v3, "_setUpViews");
    -[PKMerchantTokenCell _setUpConstraints](v4, "_setUpConstraints");
  }
  return v4;
}

- (void)updateCellWithMerchantToken:(id)a3 showMerchantIcon:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PKMerchantTokenIconView *iconView;
  void *v8;
  double v9;
  PKMerchantTokenIconView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  PKMerchantTokenIconView *v16;
  void *v17;
  UILabel *nameLabel;
  id v19;

  v4 = a4;
  v6 = a3;
  v19 = v6;
  if (v4)
  {
    if (objc_msgSend(v6, "isAMPPaymentToken"))
    {
      iconView = self->_iconView;
      PKUIImageNamed(CFSTR("MerchantTokenAppleMerchantIcon45"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 4.0;
      v10 = iconView;
    }
    else
    {
      if (!objc_msgSend(v19, "isAppleCashPaymentToken"))
      {
        v16 = self->_iconView;
        objc_msgSend(v19, "merchantIconURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "merchantName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMerchantTokenIconView updateWithImageURL:monogramText:cornerRadius:](v16, "updateWithImageURL:monogramText:cornerRadius:", v8, v17, 4.0);

        goto LABEL_9;
      }
      PKPassKitUIBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLForResource:withExtension:", CFSTR("AppleCashIcon"), CFSTR("pdf"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = PKUIScreenScale();
      PKUIImageFromPDF(v14, 45.0, 45.0, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = self->_iconView;
      v9 = 4.0;
    }
    -[PKMerchantTokenIconView updateWithImage:cornerRadius:](v10, "updateWithImage:cornerRadius:", v8, v9);
LABEL_9:

    nameLabel = self->_nameLabel;
    objc_msgSend(v19, "merchantName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](nameLabel, "setText:", v11);
    goto LABEL_10;
  }
  -[UIStackView removeFromSuperview](self->_stackView, "removeFromSuperview");
  -[PKMerchantTokenCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "merchantName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  -[PKMerchantTokenCell setContentConfiguration:](self, "setContentConfiguration:", v11);
LABEL_10:

}

- (void)_setUpViews
{
  -[PKMerchantTokenCell _setUpSelf](self, "_setUpSelf");
  -[PKMerchantTokenCell _setUpStackView](self, "_setUpStackView");
  -[PKMerchantTokenCell _setUpIconView](self, "_setUpIconView");
  -[PKMerchantTokenCell _setUpNameLabel](self, "_setUpNameLabel");
}

- (void)_setUpSelf
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3568]);
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenCell setAccessories:](self, "setAccessories:", v4);

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
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 12.0);
  -[PKMerchantTokenCell contentView](self, "contentView");
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
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_nameLabel);
}

- (void)_setUpConstraints
{
  -[PKMerchantTokenCell _setUpStackViewConstraints](self, "_setUpStackViewConstraints");
  -[PKMerchantTokenCell _setUpIconViewConstraints](self, "_setUpIconViewConstraints");
  -[PKMerchantTokenCell _setUpSeparatorConstraints](self, "_setUpSeparatorConstraints");
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
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  -[PKMerchantTokenCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 15.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v4, -16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 13.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v8;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v12);

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
  objc_msgSend(v4, "constraintEqualToConstant:", 45.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  -[PKMerchantTokenIconView heightAnchor](self->_iconView, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 45.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v8);

}

- (void)_setUpSeparatorConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKMerchantTokenCell separatorLayoutGuide](self, "separatorLayoutGuide");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
