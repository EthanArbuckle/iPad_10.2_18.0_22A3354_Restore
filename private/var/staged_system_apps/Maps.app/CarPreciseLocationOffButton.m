@implementation CarPreciseLocationOffButton

+ (id)preciseLocationOffButtonWithTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:", v4);

  return v5;
}

- (CarPreciseLocationOffButton)initWithTitle:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  CarPreciseLocationOffButton *v8;
  CarPreciseLocationOffButton *v9;
  UILabel *v10;
  UILabel *titleLabel;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[4];

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CarPreciseLocationOffButton;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[CarFocusableBlurControl initWithFrame:](&v28, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[CarFocusableBlurControl setCastsShadow:](v8, "setCastsShadow:", 0);
    -[CarFocusableBlurControl setRoundedCornerRadius:](v9, "setRoundedCornerRadius:", 14.0);
    -[CarPreciseLocationOffButton setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("CarPreciseLocationOffButton"));
    v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = v10;

    -[UILabel setAccessibilityIdentifier:](v9->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v9->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    -[UILabel setText:](v9->_titleLabel, "setText:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
    -[UILabel setFont:](v9->_titleLabel, "setFont:", v13);

    -[UILabel setAdjustsFontSizeToFitWidth:](v9->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v9->_titleLabel, "setMinimumScaleFactor:", 0.699999988);
    -[UILabel setBaselineAdjustment:](v9->_titleLabel, "setBaselineAdjustment:", 1);
    -[UILabel setTextAlignment:](v9->_titleLabel, "setTextAlignment:", 1);
    -[CarFocusableControl addSubview:](v9, "addSubview:", v9->_titleLabel);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v9->_titleLabel, "firstBaselineAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButton topAnchor](v9, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 18.0));
    v29[0] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButton bottomAnchor](v9, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v9->_titleLabel, "firstBaselineAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 10.0));
    v29[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v9->_titleLabel, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButton leadingAnchor](v9, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 15.0));
    v29[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButton trailingAnchor](v9, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v9->_titleLabel, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v19, 15.0));
    v29[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  }
  return v9;
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarPreciseLocationOffButton;
  v4 = a3;
  -[CarPreciseLocationOffButton setTintColor:](&v5, "setTintColor:", v4);
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v4, v5.receiver, v5.super_class);

}

- (BOOL)needsContinuousRoundedCorners
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
