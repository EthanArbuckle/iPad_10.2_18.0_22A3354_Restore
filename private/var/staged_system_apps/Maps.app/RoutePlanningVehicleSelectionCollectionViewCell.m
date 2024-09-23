@implementation RoutePlanningVehicleSelectionCollectionViewCell

- (RoutePlanningVehicleSelectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  RoutePlanningVehicleSelectionCollectionViewCell *v3;
  void *v4;
  UILabel *v5;
  UILabel *titleLabel;
  uint64_t v7;
  void *v8;
  VehicleBatteryView *v9;
  VehicleBatteryView *vehicleBatteryView;
  id v11;
  void *v12;
  UIStackView *v13;
  void *v14;
  UIStackView *stackView;
  objc_super v17;
  _QWORD v18[2];

  v17.receiver = self;
  v17.super_class = (Class)RoutePlanningVehicleSelectionCollectionViewCell;
  v3 = -[MapsDebugCollectionViewCell initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    -[RoutePlanningVehicleSelectionCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (sub_1002A8AA0(v3) == 5)
      v7 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    else
      v7 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v8 = (void *)v7;
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v7);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v9 = -[VehicleBatteryView initWithVehicle:configuration:batteryChargeTextAtEdge:]([VehicleBatteryView alloc], "initWithVehicle:configuration:batteryChargeTextAtEdge:", 0, 1, 8);
    vehicleBatteryView = v3->_vehicleBatteryView;
    v3->_vehicleBatteryView = v9;

    -[VehicleBatteryView setTranslatesAutoresizingMaskIntoConstraints:](v3->_vehicleBatteryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = objc_alloc((Class)UIStackView);
    v18[0] = v3->_titleLabel;
    v18[1] = v3->_vehicleBatteryView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    v13 = (UIStackView *)objc_msgSend(v11, "initWithArrangedSubviews:", v12);

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v13, "setAlignment:", 0);
    -[UIStackView setDistribution:](v13, "setDistribution:", 0);
    -[UIStackView setAxis:](v13, "setAxis:", 1);
    -[UIStackView setSpacing:](v13, "setSpacing:", 4.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleSelectionCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v14, "addSubview:", v13);

    stackView = v3->_stackView;
    v3->_stackView = v13;

    -[RoutePlanningVehicleSelectionCollectionViewCell _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (void)_setupConstraints
{
  double v3;
  UIStackView *stackView;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if (sub_1002A8AA0(self) == 5)
    v3 = 12.0;
  else
    v3 = 18.0;
  stackView = self->_stackView;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningVehicleSelectionCollectionViewCell contentView](self, "contentView"));
  LODWORD(v5) = 1148846080;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_constraintsEqualToEdgesOfView:insets:priority:](stackView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v8, v3, 16.0, v3, 16.0, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

}

- (void)setupWithVehicle:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  double v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "combinedDisplayName"));
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

  v5 = objc_msgSend(v9, "isPureElectricVehicle");
  if (v5)
    v6 = v9;
  else
    v6 = 0;
  v7 = v5 ^ 1;
  if (v5)
    v8 = 1.0;
  else
    v8 = 0.0;
  -[VehicleBatteryView setVehicle:](self->_vehicleBatteryView, "setVehicle:", v6);
  -[VehicleBatteryView setHidden:](self->_vehicleBatteryView, "setHidden:", v7);
  -[VehicleBatteryView setAlpha:](self->_vehicleBatteryView, "setAlpha:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_vehicleBatteryView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
