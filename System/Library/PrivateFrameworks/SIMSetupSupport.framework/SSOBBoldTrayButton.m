@implementation SSOBBoldTrayButton

- (void)updateBusyText:(id)a3
{
  SSSpinner *v4;
  SSSpinner *spinner;
  void *v6;
  id v7;

  v7 = a3;
  if (!self->_spinner)
  {
    v4 = -[SSSpinner initWithText:]([SSSpinner alloc], "initWithText:", v7);
    spinner = self->_spinner;
    self->_spinner = v4;

  }
  -[SSOBBoldTrayButton spinner](self, "spinner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateText:", v7);

}

- (void)_showLoading
{
  void *v3;
  NSString *v4;
  NSString *normalStateTitle;
  SSSpinner *v6;
  SSSpinner *spinner;

  -[SSOBBoldTrayButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  normalStateTitle = self->_normalStateTitle;
  self->_normalStateTitle = v4;

  -[SSOBBoldTrayButton setTitle:forState:](self, "setTitle:forState:", CFSTR(" "), 0);
  if (!self->_spinner)
  {
    v6 = -[SSSpinner initWithText:]([SSSpinner alloc], "initWithText:", CFSTR(" "));
    spinner = self->_spinner;
    self->_spinner = v6;

  }
  -[SSOBBoldTrayButton _showSpinning](self, "_showSpinning");
  -[OBBoldTrayButton setEnabled:](self, "setEnabled:", 0);
}

- (void)_hideLoading
{
  void *v3;
  void *v4;
  id v5;

  -[SSOBBoldTrayButton normalStateTitle](self, "normalStateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SSOBBoldTrayButton normalStateTitle](self, "normalStateTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSOBBoldTrayButton setTitle:forState:](self, "setTitle:forState:", v4, 0);

  }
  -[OBBoldTrayButton setEnabled:](self, "setEnabled:", 1);
  -[SSOBBoldTrayButton spinner](self, "spinner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimating");

}

- (void)_showSpinning
{
  void *v3;
  id v4;

  -[SSSpinner setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SSOBBoldTrayButton spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSOBBoldTrayButton addSubview:](self, "addSubview:", v3);

  -[SSOBBoldTrayButton _centerActivityIndicatorInButton](self, "_centerActivityIndicatorInButton");
  -[SSOBBoldTrayButton spinner](self, "spinner");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimating");

}

- (void)_centerActivityIndicatorInButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSOBBoldTrayButton spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSOBBoldTrayButton centerXAnchor](self, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[SSOBBoldTrayButton spinner](self, "spinner");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSOBBoldTrayButton centerYAnchor](self, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

}

- (SSSpinner)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (NSString)normalStateTitle
{
  return (NSString *)objc_getProperty(self, a2, 776, 1);
}

- (void)setNormalStateTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 776);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalStateTitle, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
