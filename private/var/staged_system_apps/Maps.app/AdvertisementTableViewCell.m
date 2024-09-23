@implementation AdvertisementTableViewCell

- (AdvertisementTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AdvertisementTableViewCell *v4;
  UILabel *v5;
  UILabel *advertisementLabel;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AdvertisementTableViewCell;
  v4 = -[AdvertisementTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UILabel);
    advertisementLabel = v4->_advertisementLabel;
    v4->_advertisementLabel = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_advertisementLabel, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_advertisementLabel, "setFont:", v8);

    -[UILabel setNumberOfLines:](v4->_advertisementLabel, "setNumberOfLines:", 0);
    -[UILabel setContentMode:](v4->_advertisementLabel, "setContentMode:", 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v9, "addSubview:", v4->_advertisementLabel);

    -[AdvertisementTableViewCell setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
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
  void *v32;
  _QWORD v33[5];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_advertisementLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell advertisementLabel](self, "advertisementLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell advertisementLabel](self, "advertisementLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
  objc_msgSend(v9, "_mapkit_scaledValueForValue:", 18.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layoutMarginsGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leftAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell advertisementLabel](self, "advertisementLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leftAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell advertisementLabel](self, "advertisementLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutMarginsGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell advertisementLabel](self, "advertisementLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisementTableViewCell contentView](self, "contentView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "heightAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToConstant:", 200.0));

  v33[0] = v10;
  v33[1] = v16;
  v33[2] = v28;
  v33[3] = v22;
  v33[4] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

}

- (UILabel)advertisementLabel
{
  return self->_advertisementLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementLabel, 0);
}

@end
