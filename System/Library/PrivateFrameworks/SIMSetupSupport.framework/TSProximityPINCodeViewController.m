@implementation TSProximityPINCodeViewController

- (TSProximityPINCodeViewController)initWithPIN:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TSProximityPINCodeViewController *v10;
  objc_super v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_TRANSFER_PIN_CODE_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_TRANSFER_PIN_CODE_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)TSProximityPINCodeViewController;
  v10 = -[TSProximityPINCodeViewController initWithTitle:detailText:icon:contentLayout:](&v12, sel_initWithTitle_detailText_icon_contentLayout_, v9, v7, 0, 2);

  if (v10)
    objc_storeStrong((id *)&v10->_pin, a3);

  return v10;
}

- (void)updatePIN:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  objc_storeStrong((id *)&self->_pin, a3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__TSProximityPINCodeViewController_updatePIN___block_invoke;
  v7[3] = &unk_24DEF2A48;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __46__TSProximityPINCodeViewController_updatePIN___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "pinCodeLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v1);

}

- (void)viewDidLoad
{
  id v3;
  UILabel *v4;
  UILabel *pinCodeLabel;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)TSProximityPINCodeViewController;
  -[TSOBWelcomeController viewDidLoad](&v26, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BEBD708]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  pinCodeLabel = self->_pinCodeLabel;
  self->_pinCodeLabel = v4;

  -[UILabel setNumberOfLines:](self->_pinCodeLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_pinCodeLabel, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_pinCodeLabel, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE210]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_pinCodeLabel, "setFont:", v8);

  -[UILabel setTextAlignment:](self->_pinCodeLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_pinCodeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v9) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_pinCodeLabel, "setContentHuggingPriority:forAxis:", 1, v9);
  -[UILabel setText:](self->_pinCodeLabel, "setText:", self->_pin);
  -[TSProximityPINCodeViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_pinCodeLabel);

  v21 = (void *)MEMORY[0x24BDD1628];
  -[UILabel centerXAnchor](self->_pinCodeLabel, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSProximityPINCodeViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  -[UILabel centerYAnchor](self->_pinCodeLabel, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSProximityPINCodeViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v14;
  -[UILabel topAnchor](self->_pinCodeLabel, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSProximityPINCodeViewController headerView](self, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v19);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setDefaultNavigationItems:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isIdleTimerDisabled = objc_msgSend(v5, "isIdleTimerDisabled");

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdleTimerDisabled:", 1);

  v7.receiver = self;
  v7.super_class = (Class)TSProximityPINCodeViewController;
  -[TSProximityPINCodeViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleTimerDisabled:", self->_isIdleTimerDisabled);

  v6.receiver = self;
  v6.super_class = (Class)TSProximityPINCodeViewController;
  -[TSProximityPINCodeViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)pin
{
  return (NSString *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setPin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (UILabel)pinCodeLabel
{
  return self->_pinCodeLabel;
}

- (void)setPinCodeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeLabel, a3);
}

- (BOOL)isIdleTimerDisabled
{
  return self->_isIdleTimerDisabled;
}

- (void)setIsIdleTimerDisabled:(BOOL)a3
{
  self->_isIdleTimerDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeLabel, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
