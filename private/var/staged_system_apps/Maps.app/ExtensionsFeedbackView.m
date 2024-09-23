@implementation ExtensionsFeedbackView

- (ExtensionsFeedbackView)initWithSubmitHandler:(id)a3
{
  id v4;
  ExtensionsFeedbackView *v5;
  id v6;
  id submitHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ExtensionsFeedbackView;
  v5 = -[ExtensionsFeedbackView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    submitHandler = v5->_submitHandler;
    v5->_submitHandler = v6;

    -[ExtensionsFeedbackView _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (void)_commonInit
{
  UIStackView *v3;
  UIStackView *stackView;
  RidesharingRatingView *v5;
  RidesharingRatingView *ratingView;
  RidesharingTippingView *v7;
  RidesharingTippingView *tippingView;
  ProminentActionButton *v9;
  ProminentActionButton *submitButton;
  void *v11;
  UIImageView *v12;
  UIImageView *headerImageView;
  _QWORD v14[5];
  _QWORD v15[5];

  -[ExtensionsFeedbackView setLeftHairlineInset:](self, "setLeftHairlineInset:", 16.0);
  -[ExtensionsFeedbackView setRightHairlineInset:](self, "setRightHairlineInset:", 0.0);
  -[ExtensionsFeedbackView setTopHairlineHidden:](self, "setTopHairlineHidden:", 1);
  -[ExtensionsFeedbackView setBottomHairlineHidden:](self, "setBottomHairlineHidden:", 0);
  v3 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v3;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 3);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 15.0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10074A74C;
  v15[3] = &unk_1011C5660;
  v15[4] = self;
  v5 = -[RidesharingRatingView initWithSelectedStars:updateBlock:]([RidesharingRatingView alloc], "initWithSelectedStars:updateBlock:", 0, v15);
  ratingView = self->_ratingView;
  self->_ratingView = v5;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10074A798;
  v14[3] = &unk_1011C5688;
  v14[4] = self;
  v7 = -[RidesharingTippingView initWithOptions:updateBlock:]([RidesharingTippingView alloc], "initWithOptions:updateBlock:", 0, v14);
  tippingView = self->_tippingView;
  self->_tippingView = v7;

  v9 = (ProminentActionButton *)objc_claimAutoreleasedReturnValue(+[ProminentActionButton button](ProminentActionButton, "button"));
  submitButton = self->_submitButton;
  self->_submitButton = v9;

  -[ProminentActionButton addTarget:action:forControlEvents:](self->_submitButton, "addTarget:action:forControlEvents:", self, "_submitTapped:", 64);
  -[ExtensionsFeedbackView _updateSubmitButton](self, "_updateSubmitButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton titleLabel](self->_submitButton, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v11, &stru_1011E7C18);

  v12 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  headerImageView = self->_headerImageView;
  self->_headerImageView = v12;

  -[UIImageView setContentMode:](self->_headerImageView, "setContentMode:", 1);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_headerImageView);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_ratingView);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_tippingView);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_submitButton);
  -[ExtensionsFeedbackView addSubview:](self, "addSubview:", self->_stackView);
  -[ExtensionsFeedbackView _updateConstraints](self, "_updateConstraints");
  -[ExtensionsFeedbackView updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionsFeedbackView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hairlineColor"));
  -[ExtensionsFeedbackView setHairlineColor:](self, "setHairlineColor:", v3);

}

- (void)_updateConstraints
{
  NSArray *constraints;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
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
  _QWORD v25[7];

  constraints = self->_constraints;
  if (constraints && -[NSArray count](constraints, "count"))
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_stackView, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsFeedbackView topAnchor](self, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 7.5));
  v25[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_stackView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsFeedbackView leadingAnchor](self, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 16.0));
  v25[1] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_stackView, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsFeedbackView trailingAnchor](self, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, -16.0));
  v25[2] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsFeedbackView bottomAnchor](self, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v4, -15.0));
  v25[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_headerImageView, "heightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 57.0));
  v25[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_headerImageView, "widthAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 57.0));
  v25[5] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton heightAnchor](self->_submitButton, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 50.0));
  v25[6] = v11;
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 7));

  v13 = self->_constraints;
  self->_constraints = v12;
  v14 = v12;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (void)_updateSubmitButton
{
  _BOOL8 v3;
  double v4;

  if (self->_selectedTip)
    v3 = 1;
  else
    v3 = self->_selectedRating != 0;
  -[ProminentActionButton setEnabled:](self->_submitButton, "setEnabled:", v3);
  v4 = 0.300000012;
  if (v3)
    v4 = 1.0;
  -[ProminentActionButton setAlpha:](self->_submitButton, "setAlpha:", v4);
}

- (void)_submitTapped:(id)a3
{
  void (**submitHandler)(id, NSNumber *, RideBookingCurrencyAmount *);

  submitHandler = (void (**)(id, NSNumber *, RideBookingCurrencyAmount *))self->_submitHandler;
  if (submitHandler)
    submitHandler[2](self->_submitHandler, self->_selectedRating, self->_selectedTip);
}

- (void)configureHeaderImage:(id)a3
{
  -[UIImageView setImage:](self->_headerImageView, "setImage:");
  -[UIImageView setHidden:](self->_headerImageView, "setHidden:", a3 == 0);
}

- (void)configureSubmitButtonTitle:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton titleLabel](self->_submitButton, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v6 & 1) == 0)
    -[ProminentActionButton setTitle:forState:](self->_submitButton, "setTitle:forState:", v7, 0);

}

- (void)setTippingOptions:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_tippingOptions, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_tippingOptions, a3);
    -[RidesharingTippingView setHidden:](self->_tippingView, "setHidden:", v5 == 0);
    -[RidesharingTippingView setTippingOptions:](self->_tippingView, "setTippingOptions:", v5);
  }

}

- (void)setShowRatingOptions:(BOOL)a3
{
  self->_showRatingOptions = a3;
  -[RidesharingRatingView setHidden:](self->_ratingView, "setHidden:", !a3);
}

- (void)configureTippingViewWithDelegate:(id)a3
{
  -[RidesharingTippingView setDelegate:](self->_tippingView, "setDelegate:", a3);
}

- (NSArray)tippingOptions
{
  return self->_tippingOptions;
}

- (BOOL)showRatingOptions
{
  return self->_showRatingOptions;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (RidesharingRatingView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
  objc_storeStrong((id *)&self->_ratingView, a3);
}

- (RidesharingTippingView)tippingView
{
  return self->_tippingView;
}

- (void)setTippingView:(id)a3
{
  objc_storeStrong((id *)&self->_tippingView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (ProminentActionButton)submitButton
{
  return self->_submitButton;
}

- (void)setSubmitButton:(id)a3
{
  objc_storeStrong((id *)&self->_submitButton, a3);
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_headerImageView, a3);
}

- (id)submitHandler
{
  return self->_submitHandler;
}

- (void)setSubmitHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)selectedRating
{
  return self->_selectedRating;
}

- (void)setSelectedRating:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRating, a3);
}

- (RideBookingCurrencyAmount)selectedTip
{
  return self->_selectedTip;
}

- (void)setSelectedTip:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedTip, 0);
  objc_storeStrong((id *)&self->_selectedRating, 0);
  objc_storeStrong(&self->_submitHandler, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_tippingView, 0);
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_tippingOptions, 0);
}

@end
