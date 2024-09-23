@implementation VehicleCell

+ (id)reuseIdentifier
{
  return CFSTR("VehicleCell");
}

- (VehicleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VehicleCell *v4;
  VehicleCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  UIView *v13;
  UIView *iconImageContainerView;
  void *v15;
  UIImageView *v16;
  UIImageView *iconImageView;
  double v18;
  double v19;
  UIStackView *v20;
  UIStackView *stackView;
  void *v22;
  UILabel *v23;
  UILabel *titleLabel;
  double v25;
  double v26;
  double v27;
  VehicleBatteryView *v28;
  VehicleBatteryView *batteryChargeView;
  double v30;
  double v31;
  double v32;
  UIStackView *v33;
  void *v34;
  objc_super v36;
  _QWORD v37[2];

  v36.receiver = self;
  v36.super_class = (Class)VehicleCell;
  v4 = -[VehicleCell initWithStyle:reuseIdentifier:](&v36, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[VehicleCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    -[VehicleCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    v9 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = (UIView *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconImageContainerView = v5->_iconImageContainerView;
    v5->_iconImageContainerView = v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_iconImageContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell contentView](v5, "contentView"));
    objc_msgSend(v15, "addSubview:", v5->_iconImageContainerView);

    v16 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = v16;

    -[UIImageView setAccessibilityIdentifier:](v5->_iconImageView, "setAccessibilityIdentifier:", CFSTR("IconImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_iconImageView, "setContentMode:", 1);
    LODWORD(v18) = 1144750080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_iconImageView, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    LODWORD(v19) = 1144750080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_iconImageView, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    -[UIView addSubview:](v5->_iconImageContainerView, "addSubview:", v5->_iconImageView);
    v20 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    stackView = v5->_stackView;
    v5->_stackView = v20;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v5->_stackView, "setAxis:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell contentView](v5, "contentView"));
    objc_msgSend(v22, "addSubview:", v5->_stackView);

    v23 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v23;

    -[UILabel setAccessibilityIdentifier:](v5->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v25) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v25);
    LODWORD(v26) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v26);
    LODWORD(v27) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v27);
    v28 = -[VehicleBatteryView initWithVehicle:configuration:batteryChargeTextAtEdge:]([VehicleBatteryView alloc], "initWithVehicle:configuration:batteryChargeTextAtEdge:", 0, 1, 8);
    batteryChargeView = v5->_batteryChargeView;
    v5->_batteryChargeView = v28;

    -[VehicleBatteryView setTranslatesAutoresizingMaskIntoConstraints:](v5->_batteryChargeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v30) = 1148846080;
    -[VehicleBatteryView setContentCompressionResistancePriority:forAxis:](v5->_batteryChargeView, "setContentCompressionResistancePriority:forAxis:", 1, v30);
    LODWORD(v31) = 1144750080;
    -[VehicleBatteryView setContentCompressionResistancePriority:forAxis:](v5->_batteryChargeView, "setContentCompressionResistancePriority:forAxis:", 0, v31);
    LODWORD(v32) = 1148846080;
    -[VehicleBatteryView setContentHuggingPriority:forAxis:](v5->_batteryChargeView, "setContentHuggingPriority:forAxis:", 1, v32);
    v33 = v5->_stackView;
    v37[0] = v5->_titleLabel;
    v37[1] = v5->_batteryChargeView;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
    -[UIStackView _maps_setArrangedSubviews:](v33, "_maps_setArrangedSubviews:", v34);

    -[VehicleCell _setupConstraints](v5, "_setupConstraints");
    -[VehicleCell _setupStyling](v5, "_setupStyling");
  }
  return v5;
}

- (void)_setupConstraints
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
  _QWORD v47[14];

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell contentView](self, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "heightAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToConstant:", 80.0));
  v47[0] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_iconImageContainerView, "heightAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToConstant:", 40.0));
  v47[1] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_iconImageContainerView, "widthAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToConstant:", 40.0));
  v47[2] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_iconImageContainerView, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 16.0));
  v47[3] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_iconImageContainerView, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell contentView](self, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerYAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v47[4] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_iconImageView, "centerXAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_iconImageContainerView, "centerXAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v47[5] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_iconImageContainerView, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v47[6] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_iconImageView, "widthAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintLessThanOrEqualToConstant:", 28.0));
  v47[7] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_iconImageView, "heightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintLessThanOrEqualToConstant:", 28.0));
  v47[8] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](self->_stackView, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v47[9] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_stackView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_iconImageContainerView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 12.0));
  v47[10] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_stackView, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v13, 16.0));
  v47[11] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_stackView, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 20.0));
  v47[12] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 20.0));
  v47[13] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 14));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_setupStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_iconImageContainerView, "layer"));
  objc_msgSend(v3, "setCornerRadius:", 20.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_iconImageContainerView, "layer"));
  objc_msgSend(v4, "setCornerCurve:", kCACornerCurveCircular);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_iconImageContainerView, "layer"));
  objc_msgSend(v5, "setMaskedCorners:", 15);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleBody, UIFontWeightMedium));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

}

- (void)setupWithVehicle:(id)a3 cellStyle:(int64_t)a4 isSelected:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView **p_iconImageContainerView;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSBundle *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  VehicleBatteryView *batteryChargeView;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;

  v5 = a5;
  v37 = a3;
  v8 = sub_10037CF30((int)objc_msgSend(v37, "isPureElectricVehicle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithRenderingMode:", 2));
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "colorHex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexRepresentation:](UIColor, "_maps_colorFromHexRepresentation:", v11));
  if (v12)
  {
    p_iconImageContainerView = &self->_iconImageContainerView;
    -[UIView setBackgroundColor:](self->_iconImageContainerView, "setBackgroundColor:", v12);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    p_iconImageContainerView = &self->_iconImageContainerView;
    -[UIView setBackgroundColor:](self->_iconImageContainerView, "setBackgroundColor:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView backgroundColor](*p_iconImageContainerView, "backgroundColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v15, "_maps_euclideanDistanceFromColor:", v16);
  v18 = v17;

  if (v18 >= 0.1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v20);
  }
  else
  {
    v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleCell traitCollection](self, "traitCollection"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("TertiaryVehicleTint"), v20, v21));
    -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "combinedDisplayName"));
  if (v23)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v23);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Vehicle Selection] My Vehicle"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_titleLabel, "setText:", v25);

  }
  v26 = objc_msgSend(v37, "isPureElectricVehicle");
  batteryChargeView = self->_batteryChargeView;
  if (v26)
  {
    -[VehicleBatteryView setVehicle:](batteryChargeView, "setVehicle:", v37);
    -[VehicleBatteryView setHidden:](self->_batteryChargeView, "setHidden:", 0);
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "applicationRecord"));
    if (v28)
    {
      v29 = (void *)v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "currentVehicleState"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dateOfUpdate"));
      objc_msgSend(v31, "timeIntervalSinceNow");
      v33 = v32;

      if (v33 < -60.0)
        -[VehicleBatteryView refreshState](self->_batteryChargeView, "refreshState");
    }
  }
  else
  {
    -[VehicleBatteryView setHidden:](batteryChargeView, "setHidden:", 1);
  }
  if (a4 == 1)
  {
    -[VehicleCell setAccessoryType:](self, "setAccessoryType:", 1);
    v35 = objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
LABEL_22:
    v36 = (void *)v35;
    -[VehicleCell setBackgroundColor:](self, "setBackgroundColor:", v35);

    goto LABEL_23;
  }
  if (!a4)
  {
    if (v5)
      v34 = 3;
    else
      v34 = 0;
    -[VehicleCell setAccessoryType:](self, "setAccessoryType:", v34);
    v35 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    goto LABEL_22;
  }
LABEL_23:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryChargeView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageContainerView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
