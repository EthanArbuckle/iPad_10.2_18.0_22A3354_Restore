@implementation PKAddPassesAboutWalletViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAddPassesAboutWalletViewController;
  -[PKAddPassesAboutWalletViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKAddPassesAboutWalletViewController _setUpViews](self, "_setUpViews");
  -[PKAddPassesAboutWalletViewController _setUpConstraints](self, "_setUpConstraints");
}

- (void)_setUpViews
{
  -[PKAddPassesAboutWalletViewController _setUpView](self, "_setUpView");
  -[PKAddPassesAboutWalletViewController _setUpScrollView](self, "_setUpScrollView");
  -[PKAddPassesAboutWalletViewController _setUpStackView](self, "_setUpStackView");
  -[PKAddPassesAboutWalletViewController _setUpImageView](self, "_setUpImageView");
  -[PKAddPassesAboutWalletViewController _setUpTitleLabel](self, "_setUpTitleLabel");
  -[PKAddPassesAboutWalletViewController _setUpSubtitleLabel](self, "_setUpSubtitleLabel");
  -[PKAddPassesAboutWalletViewController _setUpFirstBodyLabel](self, "_setUpFirstBodyLabel");
  -[PKAddPassesAboutWalletViewController _setUpSecondBodyLabel](self, "_setUpSecondBodyLabel");
  -[PKAddPassesAboutWalletViewController _setUpDoneButton](self, "_setUpDoneButton");
}

- (void)_setUpView
{
  void *v3;
  void *v4;
  id v5;

  -[PKAddPassesAboutWalletViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKAddPassesAboutWalletViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 540.0, 700.0);

}

- (void)_setUpStackView
{
  id v3;
  UIStackView *v4;
  UIStackView *stackView;

  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 0.0);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_stackView);
}

- (void)_setUpScrollView
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  id v5;

  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 1);
  -[PKAddPassesAboutWalletViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_scrollView);

}

- (void)_setUpImageView
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *imageView;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  PKUIImageNamed(CFSTR("AboutPassbookHeader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);
  imageView = self->_imageView;
  self->_imageView = v5;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_imageView);
  -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", self->_imageView, 20.0);
}

- (void)_setUpTitleLabel
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  UILabel *v8;
  id v9;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC4918], 2, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v9);
  v5 = self->_titleLabel;
  PKLocalizedPaymentString(CFSTR("ABOUT_WALLET_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v5, "setText:", v6);

  -[PKAddPassesAboutWalletViewController amendLabel:](self, "amendLabel:", self->_titleLabel);
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  v8 = self->_titleLabel;
  self->_titleLabel = v7;

  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_titleLabel);
  -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", self->_titleLabel, 15.0);

}

- (void)_setUpSubtitleLabel
{
  UILabel *v3;
  UILabel *subtitleLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  UILabel *v8;
  id v9;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v3;

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC4918], 2, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v9);
  v5 = self->_subtitleLabel;
  PKLocalizedPaymentString(CFSTR("ABOUT_WALLET_SUBTITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v5, "setText:", v6);

  -[PKAddPassesAboutWalletViewController amendLabel:](self, "amendLabel:", self->_subtitleLabel);
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  v8 = self->_subtitleLabel;
  self->_subtitleLabel = v7;

  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_subtitleLabel);
  -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", self->_subtitleLabel, 15.0);

}

- (void)_setUpFirstBodyLabel
{
  UILabel *v3;
  UILabel *firstBodyLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  UILabel *v10;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  firstBodyLabel = self->_firstBodyLabel;
  self->_firstBodyLabel = v3;

  v5 = self->_firstBodyLabel;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 0x8000, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  v7 = self->_firstBodyLabel;
  PKLocalizedPaymentString(CFSTR("ABOUT_WALLET_1_BODY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v7, "setText:", v8);

  -[PKAddPassesAboutWalletViewController amendLabel:](self, "amendLabel:", self->_firstBodyLabel);
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  v10 = self->_firstBodyLabel;
  self->_firstBodyLabel = v9;

  -[UILabel setLineBreakMode:](self->_firstBodyLabel, "setLineBreakMode:", 0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_firstBodyLabel);
  -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", self->_firstBodyLabel, 15.0);
}

- (void)_setUpSecondBodyLabel
{
  UILabel *v3;
  UILabel *secondBodyLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  UILabel *v10;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  secondBodyLabel = self->_secondBodyLabel;
  self->_secondBodyLabel = v3;

  v5 = self->_secondBodyLabel;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 0x8000, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  v7 = self->_secondBodyLabel;
  PKLocalizedPaymentString(CFSTR("ABOUT_WALLET_2_BODY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v7, "setText:", v8);

  -[PKAddPassesAboutWalletViewController amendLabel:](self, "amendLabel:", self->_secondBodyLabel);
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  v10 = self->_secondBodyLabel;
  self->_secondBodyLabel = v9;

  -[UILabel setLineBreakMode:](self->_secondBodyLabel, "setLineBreakMode:", 0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_secondBodyLabel);
  -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", self->_secondBodyLabel, 24.0);
}

- (void)_setUpDoneButton
{
  UIButton *v3;
  UIButton *doneButton;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  id v12;

  v3 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  doneButton = self->_doneButton;
  self->_doneButton = v3;

  v5 = self->_doneButton;
  PKLocalizedString(CFSTR("DONE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v5, "setTitle:forState:", v6, 0);

  -[UIButton titleLabel](self->_doneButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AD0], (NSString *)*MEMORY[0x1E0DC48D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[UIButton titleLabel](self->_doneButton, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

  -[UIButton _setCornerRadius:](self->_doneButton, "_setCornerRadius:", 14.0);
  v10 = self->_doneButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_doneButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, sel_dismissViewController, 64);
  -[PKAddPassesAboutWalletViewController view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_doneButton);

}

- (void)_setUpConstraints
{
  UIScrollView *scrollView;
  double v4;
  UIScrollView *v5;
  double v6;

  -[PKAddPassesAboutWalletViewController _setUpScrollViewConstraints](self, "_setUpScrollViewConstraints");
  -[PKAddPassesAboutWalletViewController _setUpStackViewConstraints](self, "_setUpStackViewConstraints");
  -[PKAddPassesAboutWalletViewController _setUpImageViewConstraints](self, "_setUpImageViewConstraints");
  -[PKAddPassesAboutWalletViewController _setUpDoneButtonConstraints](self, "_setUpDoneButtonConstraints");
  scrollView = self->_scrollView;
  -[UIButton frame](self->_doneButton, "frame");
  -[UIScrollView setContentInset:](scrollView, "setContentInset:", 0.0, 0.0, v4, 0.0);
  v5 = self->_scrollView;
  -[UIButton frame](self->_doneButton, "frame");
  -[UIScrollView setScrollIndicatorInsets:](v5, "setScrollIndicatorInsets:", 0.0, 0.0, v6, -4.0);
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
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v5;
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v8;
  -[UIStackView widthAnchor](self->_stackView, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)_setUpScrollViewConstraints
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
  -[PKAddPassesAboutWalletViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->_doneButton, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 44.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v8;
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -44.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)_setUpImageViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView topAnchor](self->_imageView, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddPassesAboutWalletViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, v7 * 0.09);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 300.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", 95.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v13);

}

- (void)_setUpDoneButtonConstraints
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
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton widthAnchor](self->_doneButton, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 274.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  -[UIButton heightAnchor](self->_doneButton, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 40.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  -[UIButton centerXAnchor](self->_doneButton, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddPassesAboutWalletViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  -[UIButton bottomAnchor](self->_doneButton, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddPassesAboutWalletViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -34.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)dismissViewController
{
  -[PKAddPassesAboutWalletViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_closeButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PKAddPassesAboutWalletViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    -[PKAddPassesAboutWalletViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)amendLabel:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondBodyLabel, 0);
  objc_storeStrong((id *)&self->_firstBodyLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
