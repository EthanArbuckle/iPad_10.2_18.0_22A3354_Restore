@implementation PHRegistrationView

- (void)setAuthKitSignInView:(id)a3
{
  UIView *v4;
  UIView *authKitSignInView;
  UIView *v6;
  UIView *v7;
  void *v8;
  double v9;
  double v10;

  v4 = (UIView *)a3;
  if (v4)
    -[PHRegistrationView setShowsAuthKitUI:](self, "setShowsAuthKitUI:", 1);
  -[UIView removeFromSuperview](self->_authKitSignInView, "removeFromSuperview");
  authKitSignInView = self->_authKitSignInView;
  self->_authKitSignInView = v4;
  v6 = v4;

  v7 = self->_authKitSignInView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_authKitSignInView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[PHRegistrationView addSubview:](self, "addSubview:", self->_authKitSignInView);
  -[UIView frame](self->_authKitSignInView, "frame");
  v10 = v9;

  -[PHRegistrationView setOriginalAuthKitViewHeight:](self, "setOriginalAuthKitViewHeight:", v10);
}

- (void)setPrivacyLinkView:(id)a3
{
  UIView *v4;
  UIView *privacyLinkView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_privacyLinkView, "removeFromSuperview");
  privacyLinkView = self->_privacyLinkView;
  self->_privacyLinkView = v4;
  v6 = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_privacyLinkView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[PHRegistrationView addSubview:](self, "addSubview:", self->_privacyLinkView);

}

- (void)setSigningIn:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a3;
  if (-[PHRegistrationView showsAuthKitUI](self, "showsAuthKitUI"))
  {
    -[UIView setHidden:](self->_authKitSignInView, "setHidden:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInLabel](self, "signingInLabel"));
    v6 = v3 ^ 1;
    objc_msgSend(v5, "setHidden:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInSpinner](self, "signingInSpinner"));
    objc_msgSend(v7, "setHidden:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInSpinner](self, "signingInSpinner"));
    v9 = v8;
    if ((v6 & 1) != 0)
      objc_msgSend(v8, "stopAnimating");
    else
      objc_msgSend(v8, "startAnimating");

    -[PHRegistrationView setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView continueButton](self, "continueButton"));
    v11 = v10;
    if (v3)
    {
      objc_msgSend(v10, "setHidden:", 1);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView waitingForActivationLabel](self, "waitingForActivationLabel"));
      v14 = v12;
      v13 = 0;
    }
    else
    {
      objc_msgSend(v10, "setHidden:", 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView waitingForActivationLabel](self, "waitingForActivationLabel"));
      v14 = v12;
      v13 = 1;
    }
    objc_msgSend(v12, "setHidden:", v13);

  }
}

- (void)setActivationFailed:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  if (!-[PHRegistrationView showsAuthKitUI](self, "showsAuthKitUI"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHRegistrationView errorLabel](self, "errorLabel"));
    objc_msgSend(v5, "setHidden:", !v3);

  }
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME"), &stru_10008B240, CFSTR("General")));
    -[UILabel setText:](self->_titleLabel, "setText:", v7);

    if (-[PHRegistrationView showsAuthKitUI](self, "showsAuthKitUI"))
      v8 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIFont _thinSystemFontOfSize:](UIFont, "_thinSystemFontOfSize:", 35.0));
    v9 = (void *)v8;
    -[UILabel setFont:](self->_titleLabel, "setFont:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v10);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v11);

    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_titleLabel);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UILabel)verbiageLabel
{
  UILabel *verbiageLabel;
  UILabel *v4;
  UILabel *v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  verbiageLabel = self->_verbiageLabel;
  if (!verbiageLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_verbiageLabel;
    self->_verbiageLabel = v4;

    v6 = objc_alloc_init((Class)TUFeatureFlags);
    if (-[PHRegistrationView showsAuthKitUI](self, "showsAuthKitUI"))
    {
      v7 = objc_msgSend(v6, "appleAccountRebrandEnabled");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      if (v7)
        v10 = CFSTR("FACETIME_REGISTRATION_BLURB_APPLEACCOUNT");
      else
        v10 = CFSTR("FACETIME_REGISTRATION_BLURB");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("FACETIME_REGISTRATION_BLURB_NON_AUTHKIT");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_10008B240, CFSTR("General")));

    -[UILabel setText:](self->_verbiageLabel, "setText:", v11);
    if (-[PHRegistrationView showsAuthKitUI](self, "showsAuthKitUI"))
      v12 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    else
      v12 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v13 = (void *)v12;
    -[UILabel setFont:](self->_verbiageLabel, "setFont:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_verbiageLabel, "setTextColor:", v14);

    -[UILabel setNumberOfLines:](self->_verbiageLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_verbiageLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_verbiageLabel, "setTextAlignment:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_verbiageLabel, "setBackgroundColor:", v15);

    -[UILabel setAutoresizingMask:](self->_verbiageLabel, "setAutoresizingMask:", 18);
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_verbiageLabel);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");

    verbiageLabel = self->_verbiageLabel;
  }
  return verbiageLabel;
}

- (UILabel)supplementalVerbiageLabel
{
  UILabel *supplementalVerbiageLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  supplementalVerbiageLabel = self->_supplementalVerbiageLabel;
  if (!supplementalVerbiageLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_supplementalVerbiageLabel;
    self->_supplementalVerbiageLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_REGISTRATION_BLURB_NON_AUTHKIT_SUPPLEMENT"), &stru_10008B240, CFSTR("General")));
    -[UILabel setText:](self->_supplementalVerbiageLabel, "setText:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    -[UILabel setFont:](self->_supplementalVerbiageLabel, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_supplementalVerbiageLabel, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](self->_supplementalVerbiageLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_supplementalVerbiageLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_supplementalVerbiageLabel, "setTextAlignment:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_supplementalVerbiageLabel, "setBackgroundColor:", v10);

    -[UILabel setAutoresizingMask:](self->_supplementalVerbiageLabel, "setAutoresizingMask:", 18);
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_supplementalVerbiageLabel);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");
    supplementalVerbiageLabel = self->_supplementalVerbiageLabel;
  }
  return supplementalVerbiageLabel;
}

- (UILabel)signingInLabel
{
  UILabel *signingInLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  signingInLabel = self->_signingInLabel;
  if (!signingInLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_signingInLabel;
    self->_signingInLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_REGISTRATION_SIGNING_IN"), &stru_10008B240, CFSTR("General")));
    -[UILabel setText:](self->_signingInLabel, "setText:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    -[UILabel setFont:](self->_signingInLabel, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_signingInLabel, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](self->_signingInLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_signingInLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_signingInLabel, "setTextAlignment:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_signingInLabel, "setBackgroundColor:", v10);

    -[UILabel setAutoresizingMask:](self->_signingInLabel, "setAutoresizingMask:", 18);
    -[UILabel setHidden:](self->_signingInLabel, "setHidden:", 1);
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_signingInLabel);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");
    signingInLabel = self->_signingInLabel;
  }
  return signingInLabel;
}

- (UILabel)waitingForActivationLabel
{
  UILabel *waitingForActivationLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  waitingForActivationLabel = self->_waitingForActivationLabel;
  if (!waitingForActivationLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_waitingForActivationLabel;
    self->_waitingForActivationLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_REGISTRATION_WAITING_FOR_ACTIVATION"), &stru_10008B240, CFSTR("General")));
    -[UILabel setText:](self->_waitingForActivationLabel, "setText:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    -[UILabel setFont:](self->_waitingForActivationLabel, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_waitingForActivationLabel, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](self->_waitingForActivationLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_waitingForActivationLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_waitingForActivationLabel, "setTextAlignment:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_waitingForActivationLabel, "setBackgroundColor:", v10);

    -[UILabel setAutoresizingMask:](self->_waitingForActivationLabel, "setAutoresizingMask:", 18);
    -[UILabel setHidden:](self->_waitingForActivationLabel, "setHidden:", 1);
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_waitingForActivationLabel);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");
    waitingForActivationLabel = self->_waitingForActivationLabel;
  }
  return waitingForActivationLabel;
}

- (UILabel)errorLabel
{
  UILabel *errorLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  errorLabel = self->_errorLabel;
  if (!errorLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_errorLabel;
    self->_errorLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_REGISTRATION_ACTIVATION_ERROR"), &stru_10008B240, CFSTR("General")));
    -[UILabel setText:](self->_errorLabel, "setText:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    -[UILabel setFont:](self->_errorLabel, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    -[UILabel setTextColor:](self->_errorLabel, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](self->_errorLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_errorLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_errorLabel, "setTextAlignment:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_errorLabel, "setBackgroundColor:", v10);

    -[UILabel setAutoresizingMask:](self->_errorLabel, "setAutoresizingMask:", 18);
    -[UILabel setHidden:](self->_errorLabel, "setHidden:", 1);
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_errorLabel);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");
    errorLabel = self->_errorLabel;
  }
  return errorLabel;
}

- (UIActivityIndicatorView)signingInSpinner
{
  UIActivityIndicatorView *signingInSpinner;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  void *v6;

  signingInSpinner = self->_signingInSpinner;
  if (!signingInSpinner)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_signingInSpinner;
    self->_signingInSpinner = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIActivityIndicatorView setColor:](self->_signingInSpinner, "setColor:", v6);

    -[UIActivityIndicatorView setHidden:](self->_signingInSpinner, "setHidden:", 1);
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_signingInSpinner);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");
    signingInSpinner = self->_signingInSpinner;
  }
  return signingInSpinner;
}

- (UIButton)learnMoreButton
{
  UIButton *learnMoreButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  learnMoreButton = self->_learnMoreButton;
  if (!learnMoreButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    v5 = self->_learnMoreButton;
    self->_learnMoreButton = v4;

    v6 = self->_learnMoreButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_REGISTRATION_LEARN_MORE"), &stru_10008B240, CFSTR("General")));
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_learnMoreButton, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    objc_msgSend(v9, "setFont:", v10);

    -[UIButton setAutoresizingMask:](self->_learnMoreButton, "setAutoresizingMask:", 5);
    -[UIButton addTarget:action:forControlEvents:](self->_learnMoreButton, "addTarget:action:forControlEvents:", self, "_learnMorePressed:", 64);
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_learnMoreButton);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");
    learnMoreButton = self->_learnMoreButton;
  }
  return learnMoreButton;
}

- (UIButton)continueButton
{
  UIButton *continueButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  UIButton *v16;
  void *v17;

  continueButton = self->_continueButton;
  if (!continueButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    v5 = self->_continueButton;
    self->_continueButton = v4;

    v6 = self->_continueButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_10008B240, CFSTR("General")));
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_continueButton, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightMedium));
    objc_msgSend(v9, "setFont:", v10);

    v11 = self->_continueButton;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTitleColor:forState:](v11, "setTitleColor:forState:", v12, 0);

    v13 = self->_continueButton;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "colorWithAlphaComponent:", 0.25));
    -[UIButton setTitleColor:forState:](v13, "setTitleColor:forState:", v15, 1);

    v16 = self->_continueButton;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "applicationTintColor"));
    -[UIButton setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[UIButton _setCornerRadius:](self->_continueButton, "_setCornerRadius:", 8.0);
    -[UIButton setAutoresizingMask:](self->_continueButton, "setAutoresizingMask:", 5);
    -[UIButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, "_continueTouchUpInside:", 64);
    -[UIButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, "_continueTouchDown:", 1);
    -[UIButton addTarget:action:forEvents:](self->_continueButton, "addTarget:action:forEvents:", self, "_continueTouchUpOutside:", 128);
    -[UIButton addTarget:action:forEvents:](self->_continueButton, "addTarget:action:forEvents:", self, "_continueDragExit:", 32);
    -[UIButton addTarget:action:forEvents:](self->_continueButton, "addTarget:action:forEvents:", self, "_continueDragEnter:", 16);
    -[PHRegistrationView addSubview:](self, "addSubview:", self->_continueButton);
    -[PHRegistrationView setNeedsLayout](self, "setNeedsLayout");
    continueButton = self->_continueButton;
  }
  return continueButton;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double MidX;
  CGFloat v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  CGFloat v90;
  void *v91;
  CGFloat v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  void *v104;
  CGFloat v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  CGFloat v112;
  void *v113;
  double v114;
  double v115;
  CGFloat v116;
  CGFloat v117;
  double v118;
  void *v119;
  double v120;
  double v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  CGFloat v127;
  double v128;
  void *v129;
  double v130;
  CGFloat v131;
  double v132;
  double v133;
  double v134;
  CGFloat v135;
  double v136;
  CGFloat v137;
  double v138;
  double v139;
  double v140;
  double v141;
  CGFloat v142;
  double v143;
  CGFloat v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  void *v157;
  void *v158;
  double v159;
  double v160;
  CGFloat v161;
  CGFloat rect;
  CGFloat rect_8;
  void *rect_16;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;

  -[PHRegistrationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  rect_16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView titleLabel](self, "titleLabel"));
  objc_msgSend(rect_16, "frame");
  v12 = v11;
  v14 = v13;
  rect = v4;
  rect_8 = v6;
  v165.origin.x = v4;
  v165.origin.y = v6;
  v165.size.width = v8;
  v165.size.height = v10;
  v15 = floor(CGRectGetMidX(v165) + v12 * -0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(rect_16, "font"));
  objc_msgSend(v16, "ascender");
  v18 = v17;

  if (-[PHRegistrationView showsAuthKitUI](self, "showsAuthKitUI"))
  {
    v19 = floor(87.0 - v18);
  }
  else
  {
    -[PHRegistrationView bounds](self, "bounds");
    v19 = -(UIStatusBarHeight - v20 * 0.33);
  }
  objc_msgSend(rect_16, "setFrame:", v15, v19, v12, v14);
  v166.origin.x = v15;
  v166.origin.y = v19;
  v166.size.width = v12;
  v166.size.height = v14;
  MaxY = CGRectGetMaxY(v166);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(rect_16, "font"));
  objc_msgSend(v22, "descender");
  v24 = MaxY + v23 + 43.0;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView verbiageLabel](self, "verbiageLabel"));
  v167.origin.x = rect;
  v167.origin.y = v6;
  v167.size.width = v8;
  v167.size.height = v10;
  objc_msgSend(v25, "sizeThatFits:", CGRectGetWidth(v167) + -20.0, 1.79769313e308);
  v27 = v26;
  v29 = v28;
  v168.origin.x = rect;
  v168.origin.y = v6;
  v168.size.width = v8;
  v168.size.height = v10;
  v30 = floor(CGRectGetMidX(v168) + v27 * -0.5);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "font"));
  objc_msgSend(v31, "ascender");
  v33 = floor(v24 - v32);

  objc_msgSend(v25, "setFrame:", v30, v33, v27, v29);
  v169.origin.x = v30;
  v169.origin.y = v33;
  v169.size.width = v27;
  v169.size.height = v29;
  v34 = CGRectGetMaxY(v169);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "font"));
  objc_msgSend(v35, "descender");
  v37 = v34 + v36 + 24.0;

  if (-[PHRegistrationView showsAuthKitUI](self, "showsAuthKitUI"))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView learnMoreButton](self, "learnMoreButton"));
    objc_msgSend(v38, "sizeToFit");
    objc_msgSend(v38, "bounds");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    if (v39 <= v8)
      v46 = v39;
    else
      v46 = v8;
    v170.origin.x = rect;
    v170.origin.y = v6;
    v170.size.width = v8;
    v170.size.height = v10;
    MidX = CGRectGetMidX(v170);
    v171.origin.x = v41;
    v171.origin.y = v43;
    v171.size.width = v46;
    v171.size.height = v45;
    v48 = floor(MidX - CGRectGetWidth(v171) * 0.5);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "titleLabel"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "font"));
    objc_msgSend(v50, "ascender");
    v52 = v37 - v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "titleLabel"));
    objc_msgSend(v53, "origin");
    v55 = floor(v52 - v54);

    objc_msgSend(v38, "setFrame:", v48, v55, v46, v45);
    v172.origin.x = v48;
    v172.origin.y = v55;
    v172.size.width = v46;
    v172.size.height = v45;
    v56 = CGRectGetMaxY(v172);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "titleLabel"));
    objc_msgSend(v57, "origin");
    v59 = v56 - v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "titleLabel"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "font"));
    objc_msgSend(v61, "descender");
    v63 = ceil(v59 + v62 + 40.0);

    -[UIView frame](self->_authKitSignInView, "frame");
    v66 = v65;
    v68 = v67;
    if (v64 <= v8)
      v69 = v64;
    else
      v69 = v8;
    -[PHRegistrationView originalAuthKitViewHeight](self, "originalAuthKitViewHeight");
    v71 = v70;
    v173.origin.x = rect;
    v173.origin.y = rect_8;
    v173.size.width = v8;
    v173.size.height = v10;
    v72 = CGRectGetMidX(v173);
    v174.origin.x = v66;
    v174.origin.y = v68;
    v174.size.width = v69;
    v174.size.height = v71;
    v73 = floor(v72 - CGRectGetWidth(v174) * 0.5);
    -[UIView setFrame:](self->_authKitSignInView, "setFrame:", v73, v63, v69, v71);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_authKitSignInView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInLabel](self, "signingInLabel"));
    objc_msgSend(v74, "sizeToFit");

    v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInLabel](self, "signingInLabel"));
    objc_msgSend(v75, "frame");
    v77 = v76;
    v79 = v78;

    -[PHRegistrationView frame](self, "frame");
    v161 = v10;
    v81 = v80 * 0.5 - v77 * 0.5;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInLabel](self, "signingInLabel"));
    objc_msgSend(v82, "setFrame:", v81, v63, v77, v79);

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInSpinner](self, "signingInSpinner"));
    objc_msgSend(v83, "sizeToFit");

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInSpinner](self, "signingInSpinner"));
    objc_msgSend(v84, "frame");
    v86 = v85;
    v88 = v87;

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView signingInSpinner](self, "signingInSpinner"));
    objc_msgSend(v89, "setFrame:", v81 - v86 + -6.0, v63, v86, v88);

    v175.origin.x = v73;
    v175.origin.y = v63;
    v175.size.width = v69;
    v175.size.height = v71;
    v90 = ceil(CGRectGetMaxY(v175));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView privacyLinkView](self, "privacyLinkView"));
    v92 = v8 * 0.75;
    LODWORD(v93) = 1112014848;
    LODWORD(v94) = 1132068864;
    objc_msgSend(v91, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8 * 0.75, 0.0, v93, v94);
    v96 = v95;
    objc_msgSend(v91, "bounds");
    v98 = v97;
    objc_msgSend(v91, "bounds");
    v100 = v99;
    v176.origin.x = rect;
    v176.origin.y = rect_8;
    v176.size.width = v8;
    v176.size.height = v161;
    v101 = CGRectGetMidX(v176);
    v177.origin.x = v98;
    v177.origin.y = v100;
    v177.size.width = v92;
    v177.size.height = v96;
    v102 = floor(v101 - CGRectGetWidth(v177) * 0.5);
    objc_msgSend(v91, "setFrame:", v102, v90, v92, v96);
    v178.origin.x = v102;
    v178.origin.y = v90;
    v178.size.width = v92;
    v178.size.height = v96;
    v103 = ceil(CGRectGetMaxY(v178) + 30.0);
  }
  else
  {
    if (MGGetBoolAnswer(CFSTR("green-tea")))
    {
      v104 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView supplementalVerbiageLabel](self, "supplementalVerbiageLabel"));
      v105 = v6;
      v179.origin.x = rect;
      v179.origin.y = v6;
      v179.size.width = v8;
      v179.size.height = v10;
      objc_msgSend(v104, "sizeThatFits:", CGRectGetWidth(v179) + -20.0, 1.79769313e308);
      v107 = v106;
      v108 = v37;
      v110 = v109;
      v180.origin.x = rect;
      v180.origin.y = rect_8;
      v180.size.width = v8;
      v180.size.height = v10;
      v111 = v10;
      v112 = floor(CGRectGetMidX(v180) + v107 * -0.5);
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "font"));
      objc_msgSend(v113, "ascender");
      v115 = floor(v108 - v114);

      v116 = v115 + 24.0;
      objc_msgSend(v104, "setFrame:", v112, v116, v107, v110);
      v181.origin.x = v112;
      v10 = v111;
      v181.origin.y = v116;
      v117 = rect;
      v181.size.width = v107;
      v181.size.height = v110;
      v118 = CGRectGetMaxY(v181);
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "font"));
      objc_msgSend(v119, "descender");
      v121 = v118 + v120 + 24.0;

    }
    else
    {
      v117 = rect;
      v105 = v6;
      v121 = v37;
    }
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView errorLabel](self, "errorLabel"));
    v182.origin.x = v117;
    v182.origin.y = v105;
    v182.size.width = v8;
    v182.size.height = v10;
    objc_msgSend(v122, "sizeThatFits:", CGRectGetWidth(v182) + -20.0, 1.79769313e308);
    v124 = v123;
    v126 = v125;
    v183.origin.x = v117;
    v183.origin.y = v105;
    v183.size.width = v8;
    v183.size.height = v10;
    v127 = v10;
    v128 = floor(CGRectGetMidX(v183) - v124 * 0.5);
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "font"));
    objc_msgSend(v129, "ascender");
    v131 = v117;
    v132 = floor(v121 - v130);

    objc_msgSend(v122, "setFrame:", v128, v132 + 24.0, v124, v126);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView continueButton](self, "continueButton"));
    objc_msgSend(v38, "setFrame:", 0.0, 0.0, 288.0, 50.0);
    objc_msgSend(v38, "bounds");
    v135 = v134;
    v137 = v136;
    v139 = v138;
    if (v133 <= v8)
      v140 = v133;
    else
      v140 = v8;
    v184.origin.x = v131;
    v184.origin.y = rect_8;
    v184.size.width = v8;
    v184.size.height = v127;
    v141 = CGRectGetMidX(v184);
    v185.origin.x = v135;
    v185.origin.y = v137;
    v185.size.width = v140;
    v185.size.height = v139;
    v142 = floor(v141 - CGRectGetWidth(v185) * 0.5);
    -[PHRegistrationView bounds](self, "bounds");
    v144 = v143 + -60.0 - v139;
    objc_msgSend(v38, "setFrame:", v142, v144, v140, v139);
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView waitingForActivationLabel](self, "waitingForActivationLabel"));
    objc_msgSend(v145, "sizeToFit");

    v146 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView waitingForActivationLabel](self, "waitingForActivationLabel"));
    objc_msgSend(v146, "frame");
    v148 = v147;
    v150 = v149;

    -[PHRegistrationView frame](self, "frame");
    v152 = v151 * 0.5 - v148 * 0.5;
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView waitingForActivationLabel](self, "waitingForActivationLabel"));
    objc_msgSend(v153, "setFrame:", v152, v139 * 0.5 + v144 - v150 * 0.5, v148, v150);

    v186.origin.x = v142;
    v186.origin.y = v144;
    v186.size.width = v140;
    v186.size.height = v139;
    v154 = CGRectGetMaxY(v186);
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "titleLabel"));
    objc_msgSend(v91, "origin");
    v156 = v154 - v155;
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "titleLabel"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "font"));
    objc_msgSend(v158, "descender");
    v103 = ceil(v156 + v159 + 40.0);

  }
  -[PHRegistrationView frame](self, "frame");
  -[PHRegistrationView setContentSize:](self, "setContentSize:", v160, v103);

}

- (void)_learnMorePressed:(id)a3
{
  uint64_t (*v3)(void);
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (uint64_t (*)(void))CUTWeakLinkSymbol("CNFRegLocalizedSplashScreenURL", CFSTR("CommunicationsSetupUI"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = v3();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v6, "openURL:withCompletionHandler:", v5, 0);

}

- (void)_setContinueButtonTouched:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[PHRegistrationView continueButton](self, "continueButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "backgroundColor"));
  v6 = v5;
  v7 = 1.0;
  if (v3)
    v7 = 0.5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationView continueButton](self, "continueButton"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (void)_continueTouchUpInside:(id)a3
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100028540;
  v10[3] = &unk_1000898B8;
  v10[4] = self;
  v3 = objc_retainBlock(v10);
  v4 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", &_dispatch_main_q);
  v5 = TUPreferredFaceTimeBundleIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028598;
  v8[3] = &unk_100089D90;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "performNetworkAccessFlowIfAllowed:ignoreForeground:completion:", v6, 0, v8);

}

- (void)_continueTouchUpOutside:(id)a3
{
  -[PHRegistrationView _setContinueButtonTouched:](self, "_setContinueButtonTouched:", 0);
}

- (void)_continueTouchDown:(id)a3
{
  -[PHRegistrationView _setContinueButtonTouched:](self, "_setContinueButtonTouched:", 1);
}

- (void)_continueDragExit:(id)a3
{
  -[PHRegistrationView _setContinueButtonTouched:](self, "_setContinueButtonTouched:", 0);
}

- (void)_continueDragEnter:(id)a3
{
  -[PHRegistrationView _setContinueButtonTouched:](self, "_setContinueButtonTouched:", 1);
}

- (PHRegistrationViewDelegate)registrationDelegate
{
  return self->_registrationDelegate;
}

- (void)setRegistrationDelegate:(id)a3
{
  self->_registrationDelegate = (PHRegistrationViewDelegate *)a3;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setVerbiageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verbiageLabel, a3);
}

- (void)setSupplementalVerbiageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalVerbiageLabel, a3);
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (void)setSigningInLabel:(id)a3
{
  objc_storeStrong((id *)&self->_signingInLabel, a3);
}

- (void)setWaitingForActivationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_waitingForActivationLabel, a3);
}

- (void)setSigningInSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_signingInSpinner, a3);
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (UIView)privacyLinkView
{
  return self->_privacyLinkView;
}

- (UIView)authKitSignInView
{
  return self->_authKitSignInView;
}

- (double)originalAuthKitViewHeight
{
  return self->_originalAuthKitViewHeight;
}

- (void)setOriginalAuthKitViewHeight:(double)a3
{
  self->_originalAuthKitViewHeight = a3;
}

- (BOOL)showsAuthKitUI
{
  return self->_showsAuthKitUI;
}

- (void)setShowsAuthKitUI:(BOOL)a3
{
  self->_showsAuthKitUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authKitSignInView, 0);
  objc_storeStrong((id *)&self->_privacyLinkView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_signingInSpinner, 0);
  objc_storeStrong((id *)&self->_waitingForActivationLabel, 0);
  objc_storeStrong((id *)&self->_signingInLabel, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_supplementalVerbiageLabel, 0);
  objc_storeStrong((id *)&self->_verbiageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
