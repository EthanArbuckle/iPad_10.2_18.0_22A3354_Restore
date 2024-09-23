@implementation ErrorModeView

- (void)setTitle:(id)a3 andMessage:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v11 = v6;
  v8 = v7;
  v9 = v11;
  v10 = v8;
  if (!objc_msgSend(v8, "length"))
  {

    v9 = 0;
    v10 = v11;
  }
  -[UILabel setText:](self->_titleLabel, "setText:", v9);
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", objc_msgSend(v9, "length") == 0);
  -[UILabel setText:](self->_messageLabel, "setText:", v10);
  -[UILabel setHidden:](self->_messageLabel, "setHidden:", objc_msgSend(v10, "length") == 0);

}

- (void)setTitleLabelFont:(id)a3
{
  -[UILabel setFont:](self->_titleLabel, "setFont:", a3);
}

- (void)setButtonTitle:(id)a3 handler:(id)a4
{
  MapsThemeButton *button;
  id v7;
  id v8;
  id v9;

  button = self->_button;
  v7 = a4;
  v8 = a3;
  -[MapsThemeButton setTitle:forState:](button, "setTitle:forState:", v8, 0);
  -[ErrorModeView setHandler:](self, "setHandler:", v7);

  v9 = objc_msgSend(v8, "length");
  -[MapsThemeButton setHidden:](self->_button, "setHidden:", v9 == 0);
}

- (void)setButtonTitle:(id)a3 glyphName:(id)a4 backgroundColor:(id)a5 handler:(id)a6
{
  id v10;
  MapsThemeButton *button;
  void *v12;
  id v13;

  v13 = a5;
  v10 = a4;
  -[ErrorModeView setButtonTitle:handler:](self, "setButtonTitle:handler:", a3, a6);
  button = self->_button;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v10));

  -[MapsThemeButton setImage:forState:](button, "setImage:forState:", v12, 0);
  -[MapsThemeButton setBackgroundColor:](self->_button, "setBackgroundColor:", v13);

}

- (void)setTitleLabelFontProvider:(id)a3
{
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_titleLabel, a3);
}

- (void)setMessageLabelFontProvider:(id)a3
{
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_messageLabel, a3);
}

- (ErrorModeView)init
{
  ErrorModeView *v2;
  ErrorModeView *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  double y;
  double width;
  double height;
  UIStackView *v12;
  UIStackView *stackView;
  UILabel *v14;
  UILabel *titleLabel;
  void *v16;
  double v17;
  UILabel *v18;
  UILabel *messageLabel;
  void *v20;
  double v21;
  MapsThemeButton *v22;
  MapsThemeButton *button;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)ErrorModeView;
  v2 = -[ErrorModeView init](&v29, "init");
  v3 = v2;
  if (v2)
  {
    -[ErrorModeView _setHostsLayoutEngine:](v2, "_setHostsLayoutEngine:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ErrorModeView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[ErrorModeView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[ErrorModeView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v7);

    v8 = objc_alloc((Class)UIStackView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v12 = (UIStackView *)objc_msgSend(v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    stackView = v3->_stackView;
    v3->_stackView = v12;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 3);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 0);
    -[ErrorModeView setSpacing:](v3, "setSpacing:", 10.0);
    -[ErrorModeView addSubview:](v3, "addSubview:", v3->_stackView);
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v14;

    -[UILabel setHidden:](v3->_titleLabel, "setHidden:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v16);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v3->_titleLabel, &stru_1011E7C38);
    LODWORD(v17) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    -[UILabel setAccessibilityIdentifier:](v3->_titleLabel, "setAccessibilityIdentifier:", CFSTR("ErrorModeTitle"));
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_titleLabel);
    v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = v18;

    -[UILabel setHidden:](v3->_messageLabel, "setHidden:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v3->_messageLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_messageLabel, "setNumberOfLines:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v3->_messageLabel, "setTextColor:", v20);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v3->_messageLabel, &stru_1011E7A78);
    LODWORD(v21) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_messageLabel, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    -[UILabel setAccessibilityIdentifier:](v3->_messageLabel, "setAccessibilityIdentifier:", CFSTR("ErrorModeMessage"));
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_messageLabel);
    v22 = -[MapsThemeButton initWithFrame:]([MapsThemeButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    button = v3->_button;
    v3->_button = v22;

    -[MapsThemeButton setHidden:](v3->_button, "setHidden:", 1);
    -[MapsThemeButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsThemeButton setTitleColorProvider:](v3->_button, "setTitleColorProvider:", &stru_1011BE7C0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](v3->_button, "titleLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v24, &stru_1011E7A78);

    -[MapsThemeButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, "_buttonTapped:", 64);
    LODWORD(v25) = 1148829696;
    -[MapsThemeButton setContentCompressionResistancePriority:forAxis:](v3->_button, "setContentCompressionResistancePriority:forAxis:", 1, v25);
    -[MapsThemeButton setContentEdgeInsets:](v3->_button, "setContentEdgeInsets:", 5.0, 10.0, 5.0, 10.0);
    -[MapsThemeButton _setContinuousCornerRadius:](v3->_button, "_setContinuousCornerRadius:", 5.0);
    -[MapsThemeButton setAccessibilityIdentifier:](v3->_button, "setAccessibilityIdentifier:", CFSTR("ErrorModeButton"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](v3->_button, "titleLabel"));
    objc_msgSend(v26, "setNumberOfLines:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](v3->_button, "titleLabel"));
    objc_msgSend(v27, "setTextAlignment:", 1);

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_button);
    -[ErrorModeView setupConstraints](v3, "setupConstraints");
  }
  return v3;
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *verticalAdjustmentConstraint;
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
  _QWORD v17[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](self->_stackView, "centerYAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView centerYAnchor](self, "centerYAnchor"));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  verticalAdjustmentConstraint = self->_verticalAdjustmentConstraint;
  self->_verticalAdjustmentConstraint = v5;

  v17[0] = self->_verticalAdjustmentConstraint;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](self->_stackView, "centerXAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView centerXAnchor](self, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v17[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_stackView, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView leadingAnchor](self, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11, 30.0));
  v17[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView trailingAnchor](self, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_stackView, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:constant:", v14, 30.0));
  v17[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);
}

- (void)setVerticalAdjustment:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_verticalAdjustmentConstraint, "setConstant:", a3 * 0.5);
}

- (void)_buttonTapped:(id)a3
{
  void (**handler)(id, id);

  handler = (void (**)(id, id))self->_handler;
  if (handler)
    handler[2](handler, a3);
}

- (void)setTopPadding:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  -[NSLayoutConstraint setActive:](self->_verticalAdjustmentConstraint, "setActive:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_stackView, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView topAnchor](self, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:constant:", v6, a3));
  v12[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView bottomAnchor](self, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v9, 0.0));
  v12[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

}

- (void)setSpacing:(double)a3
{
  +[DynamicTypeWizard autoscaleStackView:spacing:withFontProvider:](DynamicTypeWizard, "autoscaleStackView:spacing:withFontProvider:", self->_stackView, &stru_1011E7A78, a3);
}

- (double)fittingHeight
{
  double v3;
  double v4;
  double v5;

  -[UIStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v4 = v3 + 30.0;
  -[NSLayoutConstraint constant](self->_verticalAdjustmentConstraint, "constant");
  return v4 + fabs(v5);
}

- (void)insertErrorIcon:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *errorIconImageView;
  void *v11;
  id v12;

  if (!self->_errorIconImageView)
  {
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system28Medium](UIFont, "system28Medium"));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v7, 3));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v6, v12));
    v9 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v8);
    errorIconImageView = self->_errorIconImageView;
    self->_errorIconImageView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[UIImageView setTintColor:](self->_errorIconImageView, "setTintColor:", v11);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_errorIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView insertArrangedSubview:atIndex:](self->_stackView, "insertArrangedSubview:atIndex:", self->_errorIconImageView, a4);
    -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", self->_errorIconImageView, 8.0);
    -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);

  }
}

- (void)removeErrorIconImageView
{
  UIImageView *errorIconImageView;
  UIImageView *v4;

  errorIconImageView = self->_errorIconImageView;
  if (errorIconImageView)
  {
    -[UIImageView removeFromSuperview](errorIconImageView, "removeFromSuperview");
    v4 = self->_errorIconImageView;
    self->_errorIconImageView = 0;

  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_errorIconImageView, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_verticalAdjustmentConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
