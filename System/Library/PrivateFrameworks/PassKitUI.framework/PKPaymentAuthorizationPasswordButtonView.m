@implementation PKPaymentAuthorizationPasswordButtonView

- (PKPaymentAuthorizationPasswordButtonView)initWithFrame:(CGRect)a3 action:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PKPaymentAuthorizationPasswordButtonView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIButton *passwordButton;
  UIView *v17;
  UIView *separatorView;
  UIView *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *hiddenConstraints;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentAuthorizationPasswordButtonView;
  v10 = -[PKPaymentAuthorizationPasswordButtonView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0DC3520];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pkui_plainConfigurationWithTitle:font:", 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBaseForegroundColor:", v14);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v13, v9);
    v15 = objc_claimAutoreleasedReturnValue();
    passwordButton = v10->_passwordButton;
    v10->_passwordButton = (UIButton *)v15;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v10->_passwordButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaymentAuthorizationPasswordButtonView addSubview:](v10, "addSubview:", v10->_passwordButton);
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v10->_separatorView;
    v10->_separatorView = v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = v10->_separatorView;
    PKAuthorizationSeparatorColor();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[PKPaymentAuthorizationPasswordButtonView addSubview:](v10, "addSubview:", v10->_separatorView);
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hiddenConstraints = v10->_hiddenConstraints;
    v10->_hiddenConstraints = v21;

    -[PKPaymentAuthorizationPasswordButtonView _setupConstraints](v10, "_setupConstraints");
    -[PKPaymentAuthorizationPasswordButtonView setNeedsUpdateConstraints](v10, "setNeedsUpdateConstraints");

  }
  return v10;
}

- (void)setActionTitle:(id)a3
{
  -[UIButton pkui_updateConfigurationWithTitle:](self->_passwordButton, "pkui_updateConfigurationWithTitle:", a3);
}

- (void)updateConstraints
{
  int v3;
  NSMutableArray *hiddenConstraints;
  NSLayoutConstraint *seperatorHeightConstraint;
  double v6;
  NSLayoutConstraint *v7;
  objc_super v8;

  v3 = -[PKPaymentAuthorizationPasswordButtonView isHidden](self, "isHidden");
  hiddenConstraints = self->_hiddenConstraints;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", hiddenConstraints);
    -[NSLayoutConstraint setConstant:](self->_buttonBottomPaddingConstraint, "setConstant:", 0.0);
    -[NSLayoutConstraint setConstant:](self->_buttonTopPaddingConstraint, "setConstant:", 0.0);
    seperatorHeightConstraint = self->_seperatorHeightConstraint;
    v6 = 0.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", hiddenConstraints);
    -[NSLayoutConstraint setConstant:](self->_buttonTopPaddingConstraint, "setConstant:", 13.0);
    -[NSLayoutConstraint setConstant:](self->_buttonBottomPaddingConstraint, "setConstant:", -13.0);
    v7 = self->_seperatorHeightConstraint;
    PKFloatCeilToPixel();
    seperatorHeightConstraint = v7;
  }
  -[NSLayoutConstraint setConstant:](seperatorHeightConstraint, "setConstant:", v6);
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationPasswordButtonView;
  -[PKPaymentAuthorizationPasswordButtonView updateConstraints](&v8, sel_updateConstraints);
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationPasswordButtonView;
  -[PKPaymentAuthorizationPasswordButtonView setHidden:](&v4, sel_setHidden_, a3);
  -[PKPaymentAuthorizationPasswordButtonView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *buttonTopPaddingConstraint;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *buttonBottomPaddingConstraint;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *seperatorHeightConstraint;
  double v14;
  NSMutableArray *hiddenConstraints;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passwordButton, 5, 0, self, 17, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationPasswordButtonView addConstraint:](self, "addConstraint:", v3);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passwordButton, 6, 0, self, 18, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationPasswordButtonView addConstraint:](self, "addConstraint:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passwordButton, 3, 0, self, 3, 1.0, 0.0);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  buttonTopPaddingConstraint = self->_buttonTopPaddingConstraint;
  self->_buttonTopPaddingConstraint = v5;

  -[PKPaymentAuthorizationPasswordButtonView addConstraint:](self, "addConstraint:", self->_buttonTopPaddingConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passwordButton, 4, 0, self, 4, 1.0, 0.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  buttonBottomPaddingConstraint = self->_buttonBottomPaddingConstraint;
  self->_buttonBottomPaddingConstraint = v7;

  -[PKPaymentAuthorizationPasswordButtonView addConstraint:](self, "addConstraint:", self->_buttonBottomPaddingConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 1, 0, self, 1, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationPasswordButtonView addConstraint:](self, "addConstraint:", v9);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 2, 0, self, 2, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationPasswordButtonView addConstraint:](self, "addConstraint:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 3, 0, self, 3, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationPasswordButtonView addConstraint:](self, "addConstraint:", v11);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 8, 0, 0, 0, 1.0, 0.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  seperatorHeightConstraint = self->_seperatorHeightConstraint;
  self->_seperatorHeightConstraint = v12;

  -[PKPaymentAuthorizationPasswordButtonView addConstraint:](self, "addConstraint:", self->_seperatorHeightConstraint);
  LODWORD(v14) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_passwordButton, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  hiddenConstraints = self->_hiddenConstraints;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, 0, 0, 1.0, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](hiddenConstraints, "addObject:", v16);

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_hiddenConstraints);
  -[PKPaymentAuthorizationPasswordButtonView addConstraints:](self, "addConstraints:", self->_hiddenConstraints);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seperatorHeightConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTopPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_hiddenConstraints, 0);
  objc_storeStrong((id *)&self->_passwordButton, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
