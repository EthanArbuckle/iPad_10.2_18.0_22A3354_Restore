@implementation TSCellularSetupActivatingViewController

- (TSCellularSetupActivatingViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSCellularSetupActivatingViewController;
  return -[OBTableWelcomeController initWithTitle:detailText:icon:](&v3, sel_initWithTitle_detailText_icon_, &stru_24DEF4290, 0, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSCellularSetupActivatingViewController;
  -[OBTableWelcomeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[TSCellularSetupActivatingViewController _spinnerStartAnimating](self, "_spinnerStartAnimating");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSCellularSetupActivatingViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupActivatingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSCellularSetupActivatingViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
  -[TSCellularSetupActivatingViewController _setUpSpinner](self, "_setUpSpinner");
  -[TSCellularSetupActivatingViewController _setUpLabel](self, "_setUpLabel");
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidesBackButton:animated:", 1, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[TSCellularSetupActivatingViewController viewDidDisappear:]";
    v9 = 2080;
    v10 = "-[TSCellularSetupActivatingViewController viewDidDisappear:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "dismiss %s  @%s", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)TSCellularSetupActivatingViewController;
  -[TSCellularSetupActivatingViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  -[TSCellularSetupActivatingViewController _spinnerStopAnimating](self, "_spinnerStopAnimating");
}

- (void)_setUpSpinner
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
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
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v3;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setBackgroundColor:](self->_spinner, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v6);

  -[UIActivityIndicatorView setClipsToBounds:](self->_spinner, "setClipsToBounds:", 1);
  -[TSCellularSetupActivatingViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_spinner);

  -[UIActivityIndicatorView setIsAccessibilityElement:](self->_spinner, "setIsAccessibilityElement:", 1);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)MEMORY[0x24BDD1628];
  -[UIActivityIndicatorView topAnchor](self->_spinner, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupActivatingViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 100.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupActivatingViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

  -[TSCellularSetupActivatingViewController _spinnerStartAnimating](self, "_spinnerStartAnimating");
}

- (void)_setUpLabel
{
  UILabel *v3;
  UILabel *label;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];

  v31[5] = *MEMORY[0x24BDAC8D0];
  v3 = (UILabel *)objc_opt_new();
  label = self->_label;
  self->_label = v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_SPINNER_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v6);

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_label, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", 0);
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v8);

  -[UILabel setFrame:](self->_label, "setFrame:", 5.0, 5.0, 40.0, 20.0);
  -[TSCellularSetupActivatingViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_label);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_label, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupActivatingViewController contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v27;
  -[UILabel centerXAnchor](self->_label, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupActivatingViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v23;
  -[UILabel centerYAnchor](self->_label, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupActivatingViewController contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v11;
  -[UILabel widthAnchor](self->_label, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupActivatingViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:multiplier:", v14, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v15;
  -[UILabel heightAnchor](self->_label, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scaledValueForValue:", 350.0);
  objc_msgSend(v16, "constraintEqualToConstant:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v19);

}

- (void)_spinnerStartAnimating
{
  void *v3;
  char v4;
  id v5;

  -[TSCellularSetupActivatingViewController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnimating");

  if ((v4 & 1) == 0)
  {
    -[TSCellularSetupActivatingViewController spinner](self, "spinner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startAnimating");

  }
}

- (void)_spinnerStopAnimating
{
  void *v3;
  int v4;
  id v5;

  -[TSCellularSetupActivatingViewController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnimating");

  if (v4)
  {
    -[TSCellularSetupActivatingViewController spinner](self, "spinner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimating");

  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
