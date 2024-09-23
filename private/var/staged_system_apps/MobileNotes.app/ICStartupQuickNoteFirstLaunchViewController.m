@implementation ICStartupQuickNoteFirstLaunchViewController

- (id)initStartedWithPencil:(BOOL)a3 launchBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  ICStartupQuickNoteFirstLaunchViewController *v7;
  ICStartupQuickNoteFirstLaunchViewController *v8;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICStartupQuickNoteFirstLaunchViewController;
  v7 = -[ICStartupQuickNoteFirstLaunchViewController init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[ICStartupQuickNoteFirstLaunchViewController setStartedWithPencil:](v7, "setStartedWithPencil:", v4);
    -[ICStartupQuickNoteFirstLaunchViewController setLaunchBlock:](v8, "setLaunchBlock:", v6);
    -[ICStartupQuickNoteFirstLaunchViewController setTransitioningDelegate:](v8, "setTransitioningDelegate:", v8);
    -[ICStartupQuickNoteFirstLaunchViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 4);
  }

  return v8;
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
  double v10;
  double v11;
  double v12;
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
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ICStartupQuickNoteFirstLaunchViewController;
  -[ICStartupQuickNoteFirstLaunchViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setCornerRadius:", 12.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController imageView](self, "imageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setCornerRadius:", 12.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_100554118));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController view](self, "view"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController view](self, "view"));
  objc_msgSend(v9, "ic_backingScaleFactor");
  v11 = v10;

  if (v11 > 1.0)
  {
    v12 = 1.0 / v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController separator1HeightConstraint](self, "separator1HeightConstraint"));
    objc_msgSend(v13, "setConstant:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController separator2HeightConstraint](self, "separator2HeightConstraint"));
    objc_msgSend(v14, "setConstant:", v12);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController imageView](self, "imageView"));
  objc_msgSend(v16, "setTintColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v18, "setTextColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v20, "setTextColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController seperator1](self, "seperator1"));
  objc_msgSend(v22, "setBackgroundColor:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController seperator2](self, "seperator2"));
  objc_msgSend(v24, "setBackgroundColor:", v23);

}

- (void)okAction:(id)a3
{
  void (**v4)(_QWORD, _QWORD);

  -[ICStartupQuickNoteFirstLaunchViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchViewController launchBlock](self, "launchBlock"));
  v4[2](v4, 0);

  -[ICStartupQuickNoteFirstLaunchViewController setLaunchBlock:](self, "setLaunchBlock:", 0);
}

- (void)settingsAction:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];

  -[ICStartupQuickNoteFirstLaunchViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v4 = -[objc_class serviceWithDefaultShellEndpoint](off_1005CDE40(), "serviceWithDefaultShellEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_opt_new(NSMutableDictionary);
  v7 = off_1005CDE48();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v8);

  v9 = off_1005CDE50();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=NOTES")));
  v12 = off_1005CDE58();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v11, v13);

  v14 = -[objc_class optionsWithDictionary:](off_1005CDE60(), "optionsWithDictionary:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000C6504;
  v16[3] = &unk_100554140;
  v16[4] = self;
  objc_msgSend(v5, "openApplication:withOptions:completion:", CFSTR("com.apple.Preferences"), v15, v16);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  ICStartupQuickNoteFirstLaunchPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[ICStartupQuickNoteFirstLaunchPresentationController initWithPresentedViewController:presentingViewController:]([ICStartupQuickNoteFirstLaunchPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return _objc_msgSend(a3, "presentationController");
}

- (id)animationControllerForDismissedController:(id)a3
{
  return _objc_msgSend(a3, "presentationController");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (NSLayoutConstraint)separator1HeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_separator1HeightConstraint);
}

- (void)setSeparator1HeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_separator1HeightConstraint, a3);
}

- (NSLayoutConstraint)separator2HeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_separator2HeightConstraint);
}

- (void)setSeparator2HeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_separator2HeightConstraint, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_messageLabel);
}

- (void)setMessageLabel:(id)a3
{
  objc_storeWeak((id *)&self->_messageLabel, a3);
}

- (BOOL)startedWithPencil
{
  return self->_startedWithPencil;
}

- (void)setStartedWithPencil:(BOOL)a3
{
  self->_startedWithPencil = a3;
}

- (id)launchBlock
{
  return self->_launchBlock;
}

- (void)setLaunchBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIView)seperator1
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_seperator1);
}

- (void)setSeperator1:(id)a3
{
  objc_storeWeak((id *)&self->_seperator1, a3);
}

- (UIView)seperator2
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_seperator2);
}

- (void)setSeperator2:(id)a3
{
  objc_storeWeak((id *)&self->_seperator2, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_seperator2);
  objc_destroyWeak((id *)&self->_seperator1);
  objc_storeStrong(&self->_launchBlock, 0);
  objc_destroyWeak((id *)&self->_messageLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_separator2HeightConstraint);
  objc_destroyWeak((id *)&self->_separator1HeightConstraint);
  objc_destroyWeak((id *)&self->_imageView);
}

@end
