@implementation CarDoneButton

- (CarDoneButton)initWithFrame:(CGRect)a3
{
  CarDoneButton *v3;
  UILabel *v4;
  UILabel *titleLabel;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  void *v32;
  _QWORD v33[4];

  v31.receiver = self;
  v31.super_class = (Class)CarDoneButton;
  v3 = -[CarFocusableBlurControl initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    LODWORD(v8) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v8);
    LODWORD(v9) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v9);
    -[CarFocusableControl addSubview:](v3, "addSubview:", v3->_titleLabel);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarDoneButton leadingAnchor](v3, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 12.0));
    v33[0] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarDoneButton trailingAnchor](v3, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 12.0));
    v33[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_titleLabel, "firstBaselineAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarDoneButton topAnchor](v3, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 19.0));
    v33[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDoneButton bottomAnchor](v3, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v3->_titleLabel, "lastBaselineAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 9.0));
    v33[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CarGuidanceBar_Done"), CFSTR("localized string not found"), 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    LODWORD(v16) = objc_msgSend(v20, "isCarAppSceneHostingNavigation");

    if ((_DWORD)v16)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CarGuidanceBar_Resume"), CFSTR("localized string not found"), 0));

      v19 = (void *)v22;
    }
    -[UILabel setText:](v3->_titleLabel, "setText:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightMedium));
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v23);

    -[CarFocusableBlurControl setRoundedCornerRadius:](v3, "setRoundedCornerRadius:", 14.0);
    -[CarDoneButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarDoneButton"));
    v32 = v19;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    -[CarDoneButton setAccessibilityUserInputLabels:](v3, "setAccessibilityUserInputLabels:", v24);

  }
  return v3;
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarDoneButton;
  v4 = a3;
  -[CarDoneButton setTintColor:](&v5, "setTintColor:", v4);
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v4, v5.receiver, v5.super_class);

}

- (BOOL)needsContinuousRoundedCorners
{
  return 1;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
