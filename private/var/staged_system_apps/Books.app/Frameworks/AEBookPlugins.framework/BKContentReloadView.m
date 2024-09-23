@implementation BKContentReloadView

- (BKContentReloadView)initWithFrame:(CGRect)a3 theme:(id)a4 delegate:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  BKContentReloadView *v13;
  BKContentReloadView *v14;
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
  id v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  objc_super v34;
  _QWORD v35[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v34.receiver = self;
  v34.super_class = (Class)BKContentReloadView;
  v13 = -[BKContentReloadView initWithFrame:](&v34, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[BKContentReloadView setDelegate:](v13, "setDelegate:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView stackView](v14, "stackView"));
    -[BKContentReloadView addSubview:](v14, "addSubview:", v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView widthAnchor](v14, "widthAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", v30, -24.0));
    v35[0] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView heightAnchor](v14, "heightAnchor"));
    v32 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:constant:", v27, -56.0));
    v35[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView centerYAnchor](v14, "centerYAnchor"));
    v33 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v35[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView centerXAnchor](v14, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v35[3] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    v11 = v33;
    -[BKContentReloadView setTheme:](v14, "setTheme:", v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v25 = -[BKContentReloadView registerForTraitChanges:withAction:](v14, "registerForTraitChanges:withAction:", v24, "_traitCollectionDidChange:previousTraitCollection:");

    v12 = v32;
  }

  return v14;
}

- (void)setTheme:(id)a3
{
  objc_storeStrong((id *)&self->_theme, a3);
  -[BKContentReloadView _updateColors](self, "_updateColors");
}

- (UIStackView)stackView
{
  UIStackView *stackView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIStackView *v8;
  UIStackView *v9;
  _QWORD v11[2];

  stackView = self->_stackView;
  if (!stackView)
  {
    v4 = objc_alloc((Class)UIStackView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView label](self, "label"));
    v11[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView button](self, "button"));
    v11[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    v8 = (UIStackView *)objc_msgSend(v4, "initWithArrangedSubviews:", v7);
    v9 = self->_stackView;
    self->_stackView = v8;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
    -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 4);
    -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 1.17549435e-38);
    stackView = self->_stackView;
  }
  return stackView;
}

- (UILabel)label
{
  UILabel *label;
  UILabel *v4;
  UILabel *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  label = self->_label;
  if (!label)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_label;
    self->_label = v4;

    v6 = AEBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("A problem repeatedly occurred with this book’s content."), &stru_1C3088, 0));
    -[UILabel setText:](self->_label, "setText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 14.0));
    -[UILabel setFont:](self->_label, "setFont:", v9);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_label, "setBackgroundColor:", v10);

    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    -[UILabel setOpaque:](self->_label, "setOpaque:", 0);
    -[UILabel sizeToFit](self->_label, "sizeToFit");
    label = self->_label;
  }
  return label;
}

- (UIButton)button
{
  UIButton *button;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  UIButton *v13;
  _QWORD v15[5];
  id v16;
  id location;

  button = self->_button;
  if (!button)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
    v6 = AEBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Reload Book"), &stru_1C3088, 0));
    objc_msgSend(v5, "setTitle:", v8);

    objc_msgSend(v5, "setTitleAlignment:", 2);
    objc_msgSend(v5, "setCornerStyle:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "finishedButtonBackgroundColor"));
    objc_msgSend(v5, "setBaseBackgroundColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "finishedButtonTextColor"));
    objc_msgSend(v5, "setBaseForegroundColor:", v10);

    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_812CC;
    v15[3] = &unk_1C0A60;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v15));
    v12 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v5, v11));
    v13 = self->_button;
    self->_button = v12;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    button = self->_button;
  }
  return button;
}

- (void)_updateColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[BKContentReloadView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView theme](self, "theme"));
  if ((objc_msgSend(v3, "overlayContentBackgroundColor") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[BKContentReloadView setBackgroundColor:](self, "setBackgroundColor:", v4);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView traitCollection](self, "traitCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "backgroundColorForTraitCollection:", v4));
    -[BKContentReloadView setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentTextColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView label](self, "label"));
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentReloadView button](self, "button"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  v10 = objc_msgSend(v9, "copy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "buttonColor"));
  objc_msgSend(v10, "setBaseBackgroundColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v10, "setBaseForegroundColor:", v12);

  objc_msgSend(v8, "setConfiguration:", v10);
}

- (void)_buttonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKContentReloadView delegate](self, "delegate", a3));
  objc_msgSend(v4, "reloadViewDidBeginReloading:", self);

}

- (IMThemePage)theme
{
  return self->_theme;
}

- (BKContentReloadViewDelegate)delegate
{
  return (BKContentReloadViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_theme, 0);
}

@end
