@implementation PKMerchantTokenLoadingView

- (PKMerchantTokenLoadingView)initWithFrame:(CGRect)a3
{
  PKMerchantTokenLoadingView *v3;
  PKMerchantTokenLoadingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMerchantTokenLoadingView;
  v3 = -[PKMerchantTokenLoadingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKMerchantTokenLoadingView _setUpViews](v3, "_setUpViews");
    -[PKMerchantTokenLoadingView _setUpConstraints](v4, "_setUpConstraints");
  }
  return v4;
}

- (NSString)loadingText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setLoadingText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (void)_setUpViews
{
  -[PKMerchantTokenLoadingView _setUpSelf](self, "_setUpSelf");
  -[PKMerchantTokenLoadingView _setUpStackView](self, "_setUpStackView");
  -[PKMerchantTokenLoadingView _setUpActivityIndicator](self, "_setUpActivityIndicator");
  -[PKMerchantTokenLoadingView _setUpLabel](self, "_setUpLabel");
}

- (void)_setUpSelf
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)_setUpStackView
{
  id v3;
  UIStackView *v4;
  UIStackView *stackView;

  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 16.0);
  -[PKMerchantTokenLoadingView addSubview:](self, "addSubview:", self->_stackView);
}

- (void)_setUpActivityIndicator
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicator;

  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_activityIndicator);
}

- (void)_setUpLabel
{
  id v3;
  UILabel *v4;
  UILabel *label;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  label = self->_label;
  self->_label = v4;

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_label);
}

- (void)_setUpConstraints
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
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView centerXAnchor](self->_stackView, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingView centerXAnchor](self, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  -[UIStackView centerYAnchor](self->_stackView, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingView centerYAnchor](self, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingView layoutMarginsGuide](self, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingView layoutMarginsGuide](self, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
