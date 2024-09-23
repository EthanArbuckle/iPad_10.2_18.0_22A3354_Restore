@implementation PKFindBankAccountInformationFooterView

- (PKFindBankAccountInformationFooterView)initWithFrame:(CGRect)a3 action:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PKFindBankAccountInformationFooterView *v10;
  PKFindBankAccountInformationFooterView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKFindBankAccountInformationFooterView;
  v10 = -[PKFindBankAccountInformationFooterView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
    -[PKFindBankAccountInformationFooterView setupAccountInformationButtonWithAction:](v10, "setupAccountInformationButtonWithAction:", v9);

  return v11;
}

- (void)setupAccountInformationButtonWithAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *accountInformationButton;
  id v10;

  v4 = (void *)MEMORY[0x1E0DC3520];
  v5 = a3;
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_CANNOT_FIND_ACCOUNT_FOOTER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_plainConfigurationWithTitle:font:", v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, v5);
  v8 = (UIButton *)objc_claimAutoreleasedReturnValue();

  accountInformationButton = self->_accountInformationButton;
  self->_accountInformationButton = v8;

  -[UIButton setConfigurationUpdateHandler:](self->_accountInformationButton, "setConfigurationUpdateHandler:", &__block_literal_global_144);
  -[UIButton setAccessibilityIdentifier:](self->_accountInformationButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67828]);
  -[PKFindBankAccountInformationFooterView addSubview:](self, "addSubview:", self->_accountInformationButton);

}

void __82__PKFindBankAccountInformationFooterView_setupAccountInformationButtonWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNumberOfLines:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PKFindBankAccountInformationFooterView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", self->_accountInformationButton, a3.width, 1.79769313e308);
  v5 = v4 + 18.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFindBankAccountInformationFooterView;
  -[PKFindBankAccountInformationFooterView layoutSubviews](&v5, sel_layoutSubviews);
  -[PKFindBankAccountInformationFooterView bounds](self, "bounds");
  -[PKFindBankAccountInformationFooterView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", self->_accountInformationButton, v3, v4);
  PKRectCenteredIntegralRect();
  -[UIButton setFrame:](self->_accountInformationButton, "setFrame:");
}

- (void)setButtonsEnabled:(BOOL)a3
{
  -[UIButton setEnabled:](self->_accountInformationButton, "setEnabled:", a3);
}

- (CGSize)_sizeForButton:(id)a3 constrainedToSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  if (a3)
  {
    objc_msgSend(a3, "sizeThatFits:", a4.width, a4.height);
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountInformationButton, 0);
}

@end
