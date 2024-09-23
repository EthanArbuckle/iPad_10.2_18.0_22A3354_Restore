@implementation ExtensionsActionView

- (ExtensionsActionView)initWithFrame:(CGRect)a3
{
  ExtensionsActionView *v3;
  ExtensionsActionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsActionView;
  v3 = -[ExtensionsActionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ExtensionsActionView _commonInit](v3, "_commonInit");
  return v4;
}

- (ExtensionsActionView)initWithCoder:(id)a3
{
  ExtensionsActionView *v3;
  ExtensionsActionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsActionView;
  v3 = -[ExtensionsActionView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ExtensionsActionView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIButton *v3;
  UIButton *button;
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
  _QWORD v16[3];

  -[ExtensionsActionView setLeftHairlineInset:](self, "setLeftHairlineInset:", 16.0);
  -[ExtensionsActionView setRightHairlineInset:](self, "setRightHairlineInset:", 0.0);
  -[ExtensionsActionView setTopHairlineHidden:](self, "setTopHairlineHidden:", 0);
  -[ExtensionsActionView setBottomHairlineHidden:](self, "setBottomHairlineHidden:", 1);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  button = self->_button;
  self->_button = v3;

  -[ExtensionsActionView addSubview:](self, "addSubview:", self->_button);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v5, &stru_1011E7A78);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsActionView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 16.0));
  v16[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsActionView centerYAnchor](self, "centerYAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_button, "centerYAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v16[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsActionView trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11, 16.0));
  v16[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "_didTap", 0x2000);
}

- (void)updateTheme
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionsActionView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hairlineColor"));
  -[ExtensionsActionView setHairlineColor:](self, "setHairlineColor:", v3);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_didTap
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsActionView didTapButton](self, "didTapButton"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ExtensionsActionView didTapButton](self, "didTapButton"));
    v4[2]();

  }
}

- (NSString)buttonTitle
{
  return -[UIButton titleForState:](self->_button, "titleForState:", 0);
}

- (void)setButtonTitle:(id)a3
{
  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", a3, 0);
}

- (id)didTapButton
{
  return self->_didTapButton;
}

- (void)setDidTapButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didTapButton, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
