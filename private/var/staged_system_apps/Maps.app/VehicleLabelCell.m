@implementation VehicleLabelCell

- (VehicleLabelCell)init
{
  return -[VehicleLabelCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, 0);
}

- (VehicleLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VehicleLabelCell *v4;
  VehicleLabelCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehicleLabelCell;
  v4 = -[VehicleLabelCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 0, a4);
  v5 = v4;
  if (v4)
  {
    -[VehicleLabelCell _commonInit](v4, "_commonInit");
    -[VehicleLabelCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("VehicleLabelCell"));
  }
  return v5;
}

- (void)_commonInit
{
  UILabel *v3;
  UILabel *label;
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
  _QWORD v21[3];

  v3 = objc_opt_new(UILabel);
  label = self->_label;
  self->_label = v3;

  -[UILabel setAccessibilityIdentifier:](self->_label, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_label, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_label, "setFont:", v6);

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleLabelCell contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_label);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_label, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleLabelCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 16.0));
  v21[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_label, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleLabelCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -16.0));
  v21[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_label, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleLabelCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v21[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (double)cellHeightWithWidth:(double)a3
{
  double v3;
  double result;

  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3 + -32.0, 1.79769313e308);
  result = v3 + 20.0;
  if (v3 + 20.0 < 44.0)
    return 44.0;
  return result;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
