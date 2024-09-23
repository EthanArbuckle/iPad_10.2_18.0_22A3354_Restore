@implementation VehicleBatteryView

- (VehicleBatteryView)initWithVehicle:(id)a3 configuration:(int64_t)a4 batteryChargeTextAtEdge:(unint64_t)a5
{
  double y;
  double width;
  double height;
  VehicleBatteryView *v10;
  VehicleBatteryView *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  BatteryIconView *v15;
  BatteryIconView *batteryView;
  double v17;
  double v18;
  UILabel *v19;
  UILabel *percentLabel;
  double v21;
  double v22;
  double v23;
  int64_t configuration;
  BatteryStateAgeView *v25;
  BatteryStateAgeView *batteryStateAgeView;
  double v27;
  double v28;
  double v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)VehicleBatteryView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = -[VehicleBatteryView initWithFrame:](&v31, "initWithFrame:", a3, CGRectZero.origin.x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[VehicleBatteryView setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", v14);

    v11->_configuration = a4;
    v11->_batteryChargeTextAtEdge = a5;
    v15 = -[BatteryIconView initWithFrame:]([BatteryIconView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    batteryView = v11->_batteryView;
    v11->_batteryView = v15;

    -[BatteryIconView setAccessibilityIdentifier:](v11->_batteryView, "setAccessibilityIdentifier:", CFSTR("BatteryIconView"));
    -[BatteryIconView setTranslatesAutoresizingMaskIntoConstraints:](v11->_batteryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v17) = 1148846080;
    -[BatteryIconView setContentCompressionResistancePriority:forAxis:](v11->_batteryView, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    LODWORD(v18) = 1148846080;
    -[BatteryIconView setContentCompressionResistancePriority:forAxis:](v11->_batteryView, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    -[VehicleBatteryView addSubview:](v11, "addSubview:", v11->_batteryView);
    v19 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    percentLabel = v11->_percentLabel;
    v11->_percentLabel = v19;

    -[UILabel setAccessibilityIdentifier:](v11->_percentLabel, "setAccessibilityIdentifier:", CFSTR("PercentLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_percentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v11->_percentLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v21) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v11->_percentLabel, "setContentCompressionResistancePriority:forAxis:", 0, v21);
    LODWORD(v22) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v11->_percentLabel, "setContentHuggingPriority:forAxis:", 0, v22);
    LODWORD(v23) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v11->_percentLabel, "setContentHuggingPriority:forAxis:", 1, v23);
    -[VehicleBatteryView addSubview:](v11, "addSubview:", v11->_percentLabel);
    configuration = v11->_configuration;
    if ((unint64_t)(configuration - 1) <= 1)
    {
      v25 = -[BatteryStateAgeView initWithConfiguration:]([BatteryStateAgeView alloc], "initWithConfiguration:", configuration == 2);
      batteryStateAgeView = v11->_batteryStateAgeView;
      v11->_batteryStateAgeView = v25;

      -[BatteryStateAgeView setTranslatesAutoresizingMaskIntoConstraints:](v11->_batteryStateAgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v27) = 1144750080;
      -[BatteryStateAgeView setContentHuggingPriority:forAxis:](v11->_batteryStateAgeView, "setContentHuggingPriority:forAxis:", 0, v27);
      LODWORD(v28) = 1144750080;
      -[BatteryStateAgeView setContentHuggingPriority:forAxis:](v11->_batteryStateAgeView, "setContentHuggingPriority:forAxis:", 1, v28);
      LODWORD(v29) = 1148846080;
      -[BatteryStateAgeView setContentCompressionResistancePriority:forAxis:](v11->_batteryStateAgeView, "setContentCompressionResistancePriority:forAxis:", 1, v29);
      -[VehicleBatteryView addSubview:](v11, "addSubview:", v11->_batteryStateAgeView);
    }
    -[VehicleBatteryView _setupStyling](v11, "_setupStyling");
    -[VehicleBatteryView _setupConstraints](v11, "_setupConstraints");
  }
  return v11;
}

+ (id)colorForBatteryLevel:(unint64_t)a3
{
  void *v4;

  if (GEOConfigGetUInteger(MapsConfig_EVRoutingCriticalBatteryThreshold, off_1014B4D28) >= a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else if (GEOConfigGetUInteger(MapsConfig_EVRoutingLowBatteryThreshold, off_1014B4D18) >= a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  }
  return v4;
}

- (void)_setupStyling
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_percentLabel, "setFont:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_percentLabel, "setTextColor:", v4);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id *p_percentLabel;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
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
  id v22;
  BatteryStateAgeView *batteryStateAgeView;
  void *v24;
  BatteryStateAgeView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  BatteryStateAgeView *v33;
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
  BatteryStateAgeView *v48;
  void *v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[6];
  _QWORD v54[2];
  _QWORD v55[2];

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (self->_batteryChargeTextAtEdge == 8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView leadingAnchor](self->_batteryView, "leadingAnchor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleBatteryView leadingAnchor](self, "leadingAnchor"));
    v49 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
    v55[0] = v5;
    p_percentLabel = (id *)&self->_percentLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_percentLabel, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView trailingAnchor](self->_batteryView, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 4.0));
    v55[1] = v9;
    v10 = v55;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_percentLabel, "leadingAnchor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleBatteryView leadingAnchor](self, "leadingAnchor"));
    v49 = v11;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v4));
    v54[0] = v5;
    p_percentLabel = (id *)&self->_batteryView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView leadingAnchor](self->_batteryView, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_percentLabel, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 4.0));
    v54[1] = v9;
    v10 = v54;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  objc_msgSend(v50, "addObjectsFromArray:", v12);

  v48 = (BatteryStateAgeView *)*p_percentLabel;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView centerYAnchor](self->_batteryView, "centerYAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleBatteryView centerYAnchor](self, "centerYAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v53[0] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_percentLabel, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleBatteryView topAnchor](self, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:", v43));
  v53[1] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleBatteryView bottomAnchor](self, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_percentLabel, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:", v40));
  v53[2] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_percentLabel, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView centerYAnchor](self->_batteryView, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v13));
  v53[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView topAnchor](self->_batteryStateAgeView, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleBatteryView topAnchor](self, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v16));
  v53[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleBatteryView bottomAnchor](self, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView bottomAnchor](self->_batteryStateAgeView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v19));
  v53[5] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  if ((unint64_t)(self->_configuration - 1) > 1)
  {
    v32 = v50;
    v33 = v48;
  }
  else
  {
    v22 = -[VehicleBatteryView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    batteryStateAgeView = self->_batteryStateAgeView;
    if (v22 == (id)1)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView rightAnchor](batteryStateAgeView, "rightAnchor"));
      v25 = v48;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView leftAnchor](v48, "leftAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -4.0));
      v52[0] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView centerYAnchor](self->_batteryStateAgeView, "centerYAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView centerYAnchor](self->_batteryView, "centerYAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
      v52[1] = v30;
      v31 = v52;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView leftAnchor](batteryStateAgeView, "leftAnchor"));
      v25 = v48;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView rightAnchor](v48, "rightAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
      v51[0] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView centerYAnchor](self->_batteryStateAgeView, "centerYAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView centerYAnchor](self->_batteryView, "centerYAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
      v51[1] = v30;
      v31 = v51;
    }
    v32 = v50;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
    objc_msgSend(v50, "addObjectsFromArray:", v34);

    v33 = self->_batteryStateAgeView;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleBatteryView trailingAnchor](self, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView trailingAnchor](v33, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  objc_msgSend(v32, "addObject:", v37);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);
}

- (void)setVehicle:(id)a3
{
  VGVehicle *v5;
  uint64_t BOOL;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *percentLabel;
  void *v12;
  void *v13;
  VGVehicle *v14;

  v5 = (VGVehicle *)a3;
  if (self->_vehicle != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_vehicle, a3);
    BOOL = GEOConfigGetBOOL(MapsConfig_EVRoutingShouldShowBatteryPercentageInVehiclePickers, off_1014B46C8);
    if (v14)
    {
      v7 = -[VGVehicle displayedBatteryPercentage](v14, "displayedBatteryPercentage");
      -[BatteryIconView setLevel:](self->_batteryView, "setLevel:", v7);
      if ((BOOL & 1) != 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%lu%%"), CFSTR("localized string not found"), 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7));
        -[UILabel setText:](self->_percentLabel, "setText:", v10);

        percentLabel = (UILabel *)objc_claimAutoreleasedReturnValue(+[VehicleBatteryView colorForBatteryLevel:](VehicleBatteryView, "colorForBatteryLevel:", v7));
        -[UILabel setTextColor:](self->_percentLabel, "setTextColor:", percentLabel);
      }
      else
      {
        percentLabel = self->_percentLabel;
        self->_percentLabel = 0;
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle currentVehicleState](self->_vehicle, "currentVehicleState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateOfUpdate"));
      -[BatteryStateAgeView setDateOfLastSync:](self->_batteryStateAgeView, "setDateOfLastSync:", v13);

      -[BatteryStateAgeView setShouldShowSeparator:](self->_batteryStateAgeView, "setShouldShowSeparator:", BOOL);
    }
    else
    {
      -[UILabel setText:](self->_percentLabel, "setText:", 0);
      -[BatteryStateAgeView setDateOfLastSync:](self->_batteryStateAgeView, "setDateOfLastSync:", 0);
    }
    v5 = v14;
  }

}

- (void)setReloading:(BOOL)a3
{
  BatteryStateAgeView *batteryStateAgeView;
  NSString *v5;
  NSString *identifierOfCurrentlyLoadingVehicle;
  NSString *v7;

  if (self->_reloading != a3)
  {
    self->_reloading = a3;
    batteryStateAgeView = self->_batteryStateAgeView;
    if (a3)
    {
      -[BatteryStateAgeView startAnimating](batteryStateAgeView, "startAnimating");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[VGVehicle identifier](self->_vehicle, "identifier"));
      identifierOfCurrentlyLoadingVehicle = self->_identifierOfCurrentlyLoadingVehicle;
      self->_identifierOfCurrentlyLoadingVehicle = v5;

    }
    else
    {
      -[BatteryStateAgeView stopAnimating](batteryStateAgeView, "stopAnimating");
      v7 = self->_identifierOfCurrentlyLoadingVehicle;
      self->_identifierOfCurrentlyLoadingVehicle = 0;

    }
  }
}

- (void)refreshState
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!-[VehicleBatteryView isReloading](self, "isReloading")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle identifier](self->_vehicle, "identifier")),
        v4 = objc_msgSend(v3, "isEqualToString:", self->_identifierOfCurrentlyLoadingVehicle),
        v3,
        (v4 & 1) == 0))
  {
    -[VehicleBatteryView setReloading:](self, "setReloading:", 1);
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle identifier](self->_vehicle, "identifier"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100AC722C;
    v7[3] = &unk_1011E1C08;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v5, "virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:", v6, 1, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_batteryStateAgeView;
}

- (id)viewForLastBaselineLayout
{
  return self->_batteryStateAgeView;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (BOOL)isReloading
{
  return self->_reloading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_identifierOfCurrentlyLoadingVehicle, 0);
  objc_storeStrong((id *)&self->_batteryStateAgeView, 0);
  objc_storeStrong((id *)&self->_percentLabel, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
}

@end
