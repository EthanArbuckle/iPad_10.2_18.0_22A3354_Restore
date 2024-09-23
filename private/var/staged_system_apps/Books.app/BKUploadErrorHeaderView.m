@implementation BKUploadErrorHeaderView

- (void)awakeFromNib
{
  double v3;
  double v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKUploadErrorHeaderView;
  -[BKUploadErrorHeaderView awakeFromNib](&v14, "awakeFromNib");
  -[BKUploadErrorHeaderView bounds](self, "bounds");
  v4 = v3;
  -[BKUploadErrorHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 1, 0, 0, 1.0, v4));
  -[BKUploadErrorHeaderView addConstraint:](self, "addConstraint:", v5);

  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKUploadErrorHeaderView tintColor](self, "tintColor")));
  v7 = objc_msgSend(v6, "CGColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadErrorHeaderView upgradeButton](self, "upgradeButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v9, "setBorderColor:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "scale");
  v12 = 1.0 / v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadErrorHeaderView underlineHeightConstraint](self, "underlineHeightConstraint"));
  objc_msgSend(v13, "setConstant:", v12);

}

- (void)upgradeButtonTouched:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadErrorHeaderView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "uploadErrorHeaderViewUpgradeButtonPressed:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKUploadErrorHeaderView delegate](self, "delegate"));
    objc_msgSend(v6, "uploadErrorHeaderViewUpgradeButtonPressed:", self);

  }
}

- (BKUploadErrorHeaderViewDelegate)delegate
{
  return (BKUploadErrorHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)upgradeButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_upgradeButton);
}

- (void)setUpgradeButton:(id)a3
{
  objc_storeWeak((id *)&self->_upgradeButton, a3);
}

- (UILabel)errorLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_errorLabel);
}

- (void)setErrorLabel:(id)a3
{
  objc_storeWeak((id *)&self->_errorLabel, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UIView)underlineView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_underlineView);
}

- (void)setUnderlineView:(id)a3
{
  objc_storeWeak((id *)&self->_underlineView, a3);
}

- (NSLayoutConstraint)underlineHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_underlineHeightConstraint);
}

- (void)setUnderlineHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_underlineHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_underlineHeightConstraint);
  objc_destroyWeak((id *)&self->_underlineView);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_errorLabel);
  objc_destroyWeak((id *)&self->_upgradeButton);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
