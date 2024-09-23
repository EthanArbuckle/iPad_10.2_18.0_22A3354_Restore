@implementation ICAllowNotificationsViewController

+ (NSString)imageName
{
  unsigned int v3;
  const __CFString *v4;

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
    return (NSString *)CFSTR("allow_notifications_banner");
  v3 = +[UIDevice ic_is12hrClock](UIDevice, "ic_is12hrClock");
  v4 = CFSTR("24hr");
  if (v3)
    v4 = CFSTR("12hr");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ios_allow_notifications_%@"), v4));
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
    return 2;
  v6.receiver = self;
  v6.super_class = (Class)ICAllowNotificationsViewController;
  return -[ICAllowNotificationsViewController supportedInterfaceOrientations](&v6, "supportedInterfaceOrientations");
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICAllowNotificationsViewController;
  -[ICAllowNotificationsViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = objc_msgSend((id)objc_opt_class(self), "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController imageView](self, "imageView"));
  objc_msgSend(v6, "setImage:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForStyle:withFontWeight:](UIFont, "ic_preferredFontForStyle:withFontWeight:", UIFontTextStyleLargeTitle, UIFontWeightBold));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setFont:", v7);

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ICAllowNotificationsViewController;
  -[ICAllowNotificationsViewController updateViewConstraints](&v23, "updateViewConstraints");
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController continueButtonWidthConstraint](self, "continueButtonWidthConstraint"));
    objc_msgSend(v3, "setActive:", 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController hiddenButtonWidthConstraint](self, "hiddenButtonWidthConstraint"));
    objc_msgSend(v4, "setActive:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController buttonMarginConstraints](self, "buttonMarginConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController leadingLabelMarginConstraint](self, "leadingLabelMarginConstraint"));
    v7 = v6;
    v8 = 36.0;
LABEL_6:
    objc_msgSend(v6, "setConstant:", v8);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController trailingLabelMarginConstraint](self, "trailingLabelMarginConstraint"));
    v18 = v17;
    v19 = v8;
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController ic_windowScene](self, "ic_windowScene"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
  v11 = objc_msgSend(v10, "ic_hasCompactWidth");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController continueButtonWidthConstraint](self, "continueButtonWidthConstraint"));
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(v12, "setActive:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController hiddenButtonWidthConstraint](self, "hiddenButtonWidthConstraint"));
    objc_msgSend(v20, "setActive:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController buttonMarginConstraints](self, "buttonMarginConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v21);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController leadingLabelMarginConstraint](self, "leadingLabelMarginConstraint"));
    v7 = v6;
    v8 = 74.0;
    goto LABEL_6;
  }
  objc_msgSend(v12, "setActive:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController hiddenButtonWidthConstraint](self, "hiddenButtonWidthConstraint"));
  objc_msgSend(v14, "setActive:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController buttonMarginConstraints](self, "buttonMarginConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController leadingLabelMarginConstraint](self, "leadingLabelMarginConstraint"));
  objc_msgSend(v16, "setConstant:", 24.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController trailingLabelMarginConstraint](self, "trailingLabelMarginConstraint"));
  v18 = v17;
  v19 = 24.0;
LABEL_7:
  objc_msgSend(v17, "setConstant:", v19);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController view](self, "view"));
  objc_msgSend(v22, "setAccessibilityViewIsModal:", 1);

}

- (void)continuePressed:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController continueButton](self, "continueButton", a3));
  objc_msgSend(v4, "setEnabled:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController completionHandler](self, "completionHandler"));
  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ICAllowNotificationsViewController completionHandler](self, "completionHandler"));
    v6[2]();

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (NSLayoutConstraint)leadingLabelMarginConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_leadingLabelMarginConstraint);
}

- (void)setLeadingLabelMarginConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_leadingLabelMarginConstraint, a3);
}

- (NSLayoutConstraint)trailingLabelMarginConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_trailingLabelMarginConstraint);
}

- (void)setTrailingLabelMarginConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_trailingLabelMarginConstraint, a3);
}

- (UIStackView)buttonStackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_buttonStackView);
}

- (void)setButtonStackView:(id)a3
{
  objc_storeWeak((id *)&self->_buttonStackView, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UIButton)continueButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_continueButton);
}

- (void)setContinueButton:(id)a3
{
  objc_storeWeak((id *)&self->_continueButton, a3);
}

- (UIButton)invisibleBottomButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_invisibleBottomButton);
}

- (void)setInvisibleBottomButton:(id)a3
{
  objc_storeWeak((id *)&self->_invisibleBottomButton, a3);
}

- (NSArray)buttonMarginConstraints
{
  return self->_buttonMarginConstraints;
}

- (void)setButtonMarginConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonMarginConstraints, a3);
}

- (NSLayoutConstraint)continueButtonWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_continueButtonWidthConstraint);
}

- (void)setContinueButtonWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_continueButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)hiddenButtonWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_hiddenButtonWidthConstraint);
}

- (void)setHiddenButtonWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_hiddenButtonWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hiddenButtonWidthConstraint);
  objc_destroyWeak((id *)&self->_continueButtonWidthConstraint);
  objc_storeStrong((id *)&self->_buttonMarginConstraints, 0);
  objc_destroyWeak((id *)&self->_invisibleBottomButton);
  objc_destroyWeak((id *)&self->_continueButton);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_buttonStackView);
  objc_destroyWeak((id *)&self->_trailingLabelMarginConstraint);
  objc_destroyWeak((id *)&self->_leadingLabelMarginConstraint);
  objc_destroyWeak((id *)&self->_imageView);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
