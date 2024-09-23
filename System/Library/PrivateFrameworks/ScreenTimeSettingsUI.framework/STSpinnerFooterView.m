@implementation STSpinnerFooterView

- (STSpinnerFooterView)initWithSpecifier:(id)a3
{
  id v3;
  STSpinnerFooterView *v4;
  id v5;
  uint64_t v6;
  UIActivityIndicatorView *spinnerView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STSpinnerFooterView;
  v3 = a3;
  v4 = -[STSpinnerFooterView initWithReuseIdentifier:](&v10, sel_initWithReuseIdentifier_, 0);
  objc_storeWeak((id *)&v4->_specifier, v3);

  v5 = objc_alloc(MEMORY[0x24BEBD398]);
  v6 = objc_msgSend(v5, "initWithActivityIndicatorStyle:", 100, v10.receiver, v10.super_class);
  spinnerView = v4->_spinnerView;
  v4->_spinnerView = (UIActivityIndicatorView *)v6;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_spinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STSpinnerFooterView contentView](v4, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v4->_spinnerView);

  return v4;
}

- (void)reloadFromSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  -[STSpinnerFooterView specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSpinnerFooterView textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[STSpinnerFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  -[STSpinnerFooterView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSpinnerFooterView specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  v19.receiver = self;
  v19.super_class = (Class)STSpinnerFooterView;
  -[STSpinnerFooterView layoutSubviews](&v19, sel_layoutSubviews);
  objc_msgSend(v3, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ascender");
  v8 = v7 * 0.5;

  -[STSpinnerFooterView spinnerViewVerticalPositionConstraint](self, "spinnerViewVerticalPositionConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setConstant:", v8);
  }
  else
  {
    -[STSpinnerFooterView spinnerView](self, "spinnerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstBaselineAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSpinnerFooterView setSpinnerViewVerticalPositionConstraint:](self, "setSpinnerViewVerticalPositionConstraint:", v10);
    v14 = (void *)MEMORY[0x24BDD1628];
    v20[0] = v10;
    objc_msgSend(v11, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v16, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateConstraints:", v18);

  }
}

- (double)preferredHeightForWidth:(double)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[STSpinnerFooterView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  v6 = v5;
  -[STSpinnerFooterView textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", a3, 1.79769313e308);
  v9 = v8 + 12.0;

  if (v6 >= v9)
    return v6;
  else
    return v9;
}

- (void)startAnimatingSpinner
{
  id v2;

  -[STSpinnerFooterView spinnerView](self, "spinnerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnimating");

}

- (void)stopAnimatingSpinner
{
  id v2;

  -[STSpinnerFooterView spinnerView](self, "spinnerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_specifier);
}

- (UIActivityIndicatorView)spinnerView
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 608, 1);
}

- (NSLayoutConstraint)spinnerViewVerticalPositionConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 616, 1);
}

- (void)setSpinnerViewVerticalPositionConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerViewVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_destroyWeak((id *)&self->_specifier);
}

@end
