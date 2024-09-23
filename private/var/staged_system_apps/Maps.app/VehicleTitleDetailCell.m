@implementation VehicleTitleDetailCell

- (VehicleTitleDetailCell)init
{
  return -[VehicleTitleDetailCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, 0);
}

- (VehicleTitleDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VehicleTitleDetailCell *v4;
  VehicleTitleDetailCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehicleTitleDetailCell;
  v4 = -[VehicleTitleDetailCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 0, a4);
  v5 = v4;
  if (v4)
  {
    -[VehicleTitleDetailCell _commonInit](v4, "_commonInit");
    -[VehicleTitleDetailCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("VehicleTitleDetailCell"));
  }
  return v5;
}

- (void)_commonInit
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *detailLabel;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[6];

  v3 = objc_opt_new(UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v7 = objc_opt_new(UILabel);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v7;

  -[UILabel setAccessibilityIdentifier:](self->_detailLabel, "setAccessibilityIdentifier:", CFSTR("DetailLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_detailLabel, "setAccessibilityIdentifier:", CFSTR("DetailLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_detailLabel, "setTextColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_detailLabel, "setFont:", v10);

  -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_detailLabel, "setTextAlignment:", 2* (-[VehicleTitleDetailCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != (id)1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell contentView](self, "contentView"));
  objc_msgSend(v11, "addSubview:", self->_titleLabel);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell contentView](self, "contentView"));
  objc_msgSend(v12, "addSubview:", self->_detailLabel);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 20.0));
  v37[0] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_detailLabel, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -10.0));
  v37[1] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_titleLabel, "centerYAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v37[2] = v26;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_detailLabel, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -20.0));
  v37[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_detailLabel, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:multiplier:", v16, 0.449999988));
  v37[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_detailLabel, "centerYAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  v37[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

}

- (double)cellHeightWithWidth:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  v4 = a3 * 0.449999988;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3 - a3 * 0.449999988 + -50.0, 1.79769313e308);
  v6 = v5;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v4, 1.79769313e308);
  if (v6 <= v7)
    v8 = v7;
  else
    v8 = v6;
  result = v8 + 20.0;
  if (result < 44.0)
    return 44.0;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
