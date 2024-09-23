@implementation TransitPayEducationScreenTitleView

- (TransitPayEducationScreenTitleView)initWithTitle:(id)a3
{
  id v4;
  TransitPayEducationScreenTitleView *v5;
  NSString *v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitPayEducationScreenTitleView;
  v5 = -[TransitPayEducationScreenTitleView init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    title = v5->_title;
    v5->_title = v6;

    -[TransitPayEducationScreenTitleView _setupViews](v5, "_setupViews");
    -[TransitPayEducationScreenTitleView _setUpConstraints](v5, "_setUpConstraints");
  }

  return v5;
}

- (void)_setupViews
{
  UILabel *v3;
  UILabel *titleLabel;
  UIImageView *v5;
  UIImageView *iconImageView;

  v3 = (UILabel *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenTitleView _createTitleLabel](self, "_createTitleLabel"));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[TransitPayEducationScreenTitleView addSubview:](self, "addSubview:", self->_titleLabel);
  v5 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenTitleView _createIconImageView](self, "_createIconImageView"));
  iconImageView = self->_iconImageView;
  self->_iconImageView = v5;

  -[TransitPayEducationScreenTitleView addSubview:](self, "addSubview:", self->_iconImageView);
}

- (void)_setUpConstraints
{
  double Double;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[8];

  Double = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenNavBarIconLeftPadding, off_1014B44B8);
  v4 = Double * GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenNavBarIconLeftPaddingMultiplier, off_1014B44C8);
  v5 = GEOConfigGetDouble(MapsConfig_TransitPayEducationNavBarIconHeight, off_1014B4498);
  v6 = v5 * GEOConfigGetDouble(MapsConfig_TransitPayEducationNavBarIconHeightMultiplier, off_1014B44A8);
  v7 = GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenNavBarTitleLeftPadding, off_1014B44D8);
  v8 = v7 * GEOConfigGetDouble(MapsConfig_TransitPayEducationScreenNavBarTitleLeftPaddingMultiplier, off_1014B44E8);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_iconImageView, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", v6));
  v32[0] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_iconImageView, "widthAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", v6));
  v32[1] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenTitleView leadingAnchor](self, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, v4));
  v32[2] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenTitleView centerYAnchor](self, "centerYAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v32[3] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, v8));
  v32[4] = v19;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenTitleView topAnchor](self, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v32[5] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenTitleView trailingAnchor](self, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v32[6] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayEducationScreenTitleView bottomAnchor](self, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v32[7] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

- (id)_createTitleLabel
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setText:", self->_title);
  objc_msgSend(v3, "setTextAlignment:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleBody, UIFontWeightSemibold));
  objc_msgSend(v3, "setFont:", v4);

  return v3;
}

- (id)_createIconImageView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)UIImageView);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "scale");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.Passbook"), 2));
  objc_msgSend(v2, "setImage:", v4);

  objc_msgSend(v2, "setClipsToBounds:", 1);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
