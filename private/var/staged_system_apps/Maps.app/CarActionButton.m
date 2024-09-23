@implementation CarActionButton

+ (id)actionButtonWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:image:", v7, v6);

  return v8;
}

- (CarActionButton)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  CarActionButton *v11;
  CarActionButton *v12;
  UIImageView *v13;
  UIImageView *imageView;
  UILabel *v15;
  UILabel *titleLabel;
  double v17;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  objc_super v50;
  _QWORD v51[9];

  v6 = a3;
  v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)CarActionButton;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[CarFocusableBlurControl initWithFrame:](&v50, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[CarFocusableBlurControl setCastsShadow:](v11, "setCastsShadow:", 0);
    -[CarFocusableBlurControl setRoundedCornerRadius:](v12, "setRoundedCornerRadius:", 9.0);
    v13 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    v48 = v7;
    imageView = v12->_imageView;
    v12->_imageView = v13;

    -[UIImageView setAccessibilityIdentifier:](v12->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v12->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v12->_imageView, "setContentMode:", 1);
    -[CarFocusableControl addSubview:](v12, "addSubview:", v12->_imageView);
    v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v15;

    -[UILabel setAccessibilityIdentifier:](v12->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v17) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v12->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    -[UILabel setText:](v12->_titleLabel, "setText:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightMedium));
    -[UILabel setFont:](v12->_titleLabel, "setFont:", v18);

    -[UILabel setAdjustsFontSizeToFitWidth:](v12->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v12->_titleLabel, "setMinimumScaleFactor:", 0.699999988);
    -[UILabel setBaselineAdjustment:](v12->_titleLabel, "setBaselineAdjustment:", 1);
    -[CarFocusableControl addSubview:](v12, "addSubview:", v12->_titleLabel);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v12->_imageView, "centerYAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton centerYAnchor](v12, "centerYAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
    v51[0] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v12->_imageView, "centerXAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton leadingAnchor](v12, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 20.5));
    v51[1] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v12->_imageView, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton topAnchor](v12, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:constant:", v40, 4.0));
    v51[2] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton bottomAnchor](v12, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v12->_imageView, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:constant:", v37, 4.0));
    v51[3] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v12->_imageView, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton leadingAnchor](v12, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 4.0));
    v51[4] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v12->_titleLabel, "firstBaselineAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton topAnchor](v12, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 28.0));
    v51[5] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton bottomAnchor](v12, "bottomAnchor"));
    v49 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v12->_titleLabel, "firstBaselineAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v19, 16.0));
    v51[6] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v12->_titleLabel, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton leadingAnchor](v12, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 41.0));
    v51[7] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButton trailingAnchor](v12, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v12->_titleLabel, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", v25, 10.0));
    v51[8] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

    v7 = v48;
    v6 = v49;

  }
  return v12;
}

- (void)updateSearchButtonTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarActionButton;
  -[CarActionButton setTintColor:](&v6, "setTintColor:", v4);
  if (-[CarActionButton state](self, "state"))
  {
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
