@implementation RouteCreationIconButton

- (RouteCreationIconButton)initWithImage:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  RouteCreationIconButton *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *iconImageView;
  UILabel *v13;
  UILabel *subtitleLabel;
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
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  objc_super v43;
  _QWORD v44[7];

  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)RouteCreationIconButton;
  v9 = -[RouteCreationIconButton initWithFrame:](&v43, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
    -[RouteCreationIconButton setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[RouteCreationIconButton _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:", 12.0);
    -[RouteCreationIconButton setAccessibilityLabel:](v9, "setAccessibilityLabel:", v8);
    v11 = objc_opt_new(UIImageView);
    iconImageView = v9->_iconImageView;
    v9->_iconImageView = v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v9->_iconImageView, "setContentMode:", 1);
    v13 = objc_opt_new(UILabel);
    subtitleLabel = v9->_subtitleLabel;
    v9->_subtitleLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 13.0, UIFontWeightMedium));
    -[UILabel setFont:](v9->_subtitleLabel, "setFont:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UILabel setTextColor:](v9->_subtitleLabel, "setTextColor:", v16);

    -[UILabel setTextAlignment:](v9->_subtitleLabel, "setTextAlignment:", 1);
    objc_storeStrong((id *)&v9->_image, a3);
    -[UIImageView setImage:](v9->_iconImageView, "setImage:", v7);
    objc_storeStrong((id *)&v9->_title, a4);
    -[UILabel setText:](v9->_subtitleLabel, "setText:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011D9768));
    -[UIImageView setTintColor:](v9->_iconImageView, "setTintColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView tintColor](v9->_iconImageView, "tintColor"));
    -[UILabel setTextColor:](v9->_subtitleLabel, "setTextColor:", v18);

    -[RouteCreationIconButton addSubview:](v9, "addSubview:", v9->_iconImageView);
    -[RouteCreationIconButton addSubview:](v9, "addSubview:", v9->_subtitleLabel);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v9->_iconImageView, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton leadingAnchor](v9, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 6.0));
    v44[0] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v9->_iconImageView, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton trailingAnchor](v9, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -6.0));
    v44[1] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v9->_iconImageView, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton topAnchor](v9, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 6.0));
    v44[2] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v9->_iconImageView, "heightAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", 18.0));
    v44[3] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v9->_subtitleLabel, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton leadingAnchor](v9, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v19, 6.0));
    v44[4] = v20;
    v42 = v7;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v9->_subtitleLabel, "trailingAnchor"));
    v41 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationIconButton trailingAnchor](v9, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -6.0));
    v44[5] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v9->_subtitleLabel, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v9->_iconImageView, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 4.0));
    v44[6] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

    v8 = v41;
    v7 = v42;

  }
  return v9;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RouteCreationIconButton;
  -[RouteCreationIconButton setEnabled:](&v4, "setEnabled:", a3);
  -[RouteCreationIconButton _updateDisabledState](self, "_updateDisabledState");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RouteCreationIconButton;
  -[RouteCreationIconButton layoutSubviews](&v3, "layoutSubviews");
  -[RouteCreationIconButton _updateDisabledState](self, "_updateDisabledState");
}

- (void)_updateDisabledState
{
  unsigned int v3;
  double v4;

  v3 = -[RouteCreationIconButton isEnabled](self, "isEnabled");
  v4 = 0.400000006;
  if (v3)
    v4 = 1.0;
  -[RouteCreationIconButton setAlpha:](self, "setAlpha:", v4);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
