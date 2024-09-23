@implementation PKPaymentSetupTransferCardView

- (PKPaymentSetupTransferCardView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  PKPaymentSetupTransferCardView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupTransferCardView;
  v5 = -[PKPaymentSetupTransferCardView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    PKProvisioningBackgroundColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupTransferCardView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[PKPaymentSetupTransferCardView sizeThatFits:](v5, "sizeThatFits:", width, height);
    -[PKPaymentSetupTransferCardView setFrame:](v5, "setFrame:", v7, v8, v9, v10);
    -[PKPaymentSetupTransferCardView _createSubviews](v5, "_createSubviews");
    -[PKPaymentSetupTransferCardView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
  }
  return v5;
}

- (void)_createSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *transferBalanceButton;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v3 = (void *)MEMORY[0x1E0DC3520];
  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_TRANSFER_BALANCE_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4918]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_plainConfigurationWithTitle:font:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC3428];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __49__PKPaymentSetupTransferCardView__createSubviews__block_invoke;
  v14 = &unk_1E3E62BD0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v7, "actionWithHandler:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v6, v8, v11, v12, v13, v14);
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  transferBalanceButton = self->_transferBalanceButton;
  self->_transferBalanceButton = v9;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_transferBalanceButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setConfigurationUpdateHandler:](self->_transferBalanceButton, "setConfigurationUpdateHandler:", &__block_literal_global_135);
  -[PKPaymentSetupTransferCardView addSubview:](self, "addSubview:", self->_transferBalanceButton);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __49__PKPaymentSetupTransferCardView__createSubviews__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_transferBalanceButtonTapped:", v4);
}

void __49__PKPaymentSetupTransferCardView__createSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNumberOfLines:", 1);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupTransferCardView;
  -[PKPaymentSetupTransferCardView layoutSubviews](&v8, sel_layoutSubviews);
  -[PKPaymentSetupTransferCardView bounds](self, "bounds");
  v4 = v3;
  -[UIButton sizeThatFits:](self->_transferBalanceButton, "sizeThatFits:", v3, v5);
  -[UIButton setFrame:](self->_transferBalanceButton, "setFrame:", v4 * 0.5 - v6 * 0.5, 20.0, v6, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[PKPaymentSetupTransferCardView bounds](self, "bounds", a3.width, a3.height);
  -[UIButton sizeThatFits:](self->_transferBalanceButton, "sizeThatFits:", width, v5);
  v7 = v6 + 20.0 + 70.0;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)_transferBalanceButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didInitiateTransferExistingCard");

}

- (PKPaymentSetupTransferCardDelegate)delegate
{
  return (PKPaymentSetupTransferCardDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)transferBalanceButton
{
  return self->_transferBalanceButton;
}

- (void)setTransferBalanceButton:(id)a3
{
  objc_storeStrong((id *)&self->_transferBalanceButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferBalanceButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
