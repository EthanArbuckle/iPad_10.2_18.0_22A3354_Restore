@implementation BatteryStateAgeView

- (BatteryStateAgeView)initWithConfiguration:(int64_t)a3
{
  double y;
  double width;
  double height;
  BatteryStateAgeView *v7;
  BatteryStateAgeView *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  UILabel *v12;
  UILabel *stateUpdatedLabel;
  double v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *activityIndicator;
  double v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BatteryStateAgeView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[BatteryStateAgeView initWithFrame:](&v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[BatteryStateAgeView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v11);

    v8->_configuration = a3;
    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    stateUpdatedLabel = v8->_stateUpdatedLabel;
    v8->_stateUpdatedLabel = v12;

    -[UILabel setAccessibilityIdentifier:](v8->_stateUpdatedLabel, "setAccessibilityIdentifier:", CFSTR("StateUpdatedLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_stateUpdatedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_stateUpdatedLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v14) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_stateUpdatedLabel, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    -[BatteryStateAgeView addSubview:](v8, "addSubview:", v8->_stateUpdatedLabel);
    v15 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v8->_activityIndicator;
    v8->_activityIndicator = v15;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v8->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setAccessibilityIdentifier:](v8->_activityIndicator, "setAccessibilityIdentifier:", CFSTR("BatteryStateActivityIndicator"));
    LODWORD(v17) = 1148846080;
    -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](v8->_activityIndicator, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    -[BatteryStateAgeView addSubview:](v8, "addSubview:", v8->_activityIndicator);
    -[BatteryStateAgeView _setupConstraints](v8, "_setupConstraints");
    -[BatteryStateAgeView _setupStyling](v8, "_setupStyling");
  }
  return v8;
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
  _QWORD v35[10];

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_stateUpdatedLabel, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView topAnchor](self, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v32));
  v35[0] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_stateUpdatedLabel, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView leadingAnchor](self, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v35[1] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_stateUpdatedLabel, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView centerYAnchor](self, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v35[2] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView trailingAnchor](self, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_stateUpdatedLabel, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v35[3] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView bottomAnchor](self, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_stateUpdatedLabel, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v20));
  v35[4] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView topAnchor](self->_activityIndicator, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView topAnchor](self, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v17));
  v35[5] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](self->_activityIndicator, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 8.0));
  v35[6] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_activityIndicator, "centerYAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView centerYAnchor](self, "centerYAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  v35[7] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView trailingAnchor](self, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](self->_activityIndicator, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v7));
  v35[8] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryStateAgeView bottomAnchor](self, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](self->_activityIndicator, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v10));
  v35[9] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 10));
  objc_msgSend(v34, "addObjectsFromArray:", v12);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);
}

- (void)_setupStyling
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_stateUpdatedLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_stateUpdatedLabel, "setTextColor:", v4);

  -[UILabel setNumberOfLines:](self->_stateUpdatedLabel, "setNumberOfLines:", 2);
}

- (void)_updateContents
{
  double v3;
  double v4;
  double Double;
  char BOOL;
  int64_t configuration;
  BOOL v8;
  NSDate *dateOfLastSync;
  void *v10;
  NSDate *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  NSDate *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  __CFString *v27;
  NSString *v28;
  void *v29;
  id v30;

  -[NSDate timeIntervalSinceNow](self->_dateOfLastSync, "timeIntervalSinceNow");
  v4 = v3;
  Double = GEOConfigGetDouble(MapsConfig_EVRoutingMinimumSyncAgeToDisplay, off_1014B3848);
  BOOL = GEOConfigGetBOOL(VirtualGarageConfig_EVRoutingForceShowLastSyncDate[0], VirtualGarageConfig_EVRoutingForceShowLastSyncDate[1]);
  configuration = self->_configuration;
  v8 = configuration == 1 || v4 <= -Double;
  if (v8 || (BOOL & 1) != 0)
  {
    if (configuration)
    {
      dateOfLastSync = self->_dateOfLastSync;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v11 = dateOfLastSync;
      -[NSDate timeIntervalSinceDate:](v11, "timeIntervalSinceDate:", v10);
      v13 = v12;
      -[NSDate timeIntervalSinceDate:](v11, "timeIntervalSinceDate:", v10);
      if (v13 >= 0.0)
        v15 = v14;
      else
        v15 = -v14;
      if (v15 >= 60.0)
      {
        if (v15 >= 3600.0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v18 = v17;
          if (v15 >= 86400.0)
          {
            v16 = vcvtmd_u64_f64(v15 / 86400.0);
            v19 = CFSTR("VehicleBattery_Date_relative_time_days_ago");
          }
          else
          {
            v16 = vcvtmd_u64_f64(v15 / 3600.0);
            v19 = CFSTR("VehicleBattery_Date_relative_time_hours_ago");
          }
        }
        else
        {
          v16 = vcvtmd_u64_f64(v15 / 60.0);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v18 = v17;
          v19 = CFSTR("VehicleBattery_Date_relative_time_minutes_ago");
        }
      }
      else
      {
        v16 = vcvtmd_u64_f64(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = v17;
        v19 = CFSTR("VehicleBattery_Date_relative_time_seconds_ago");
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, CFSTR("localized string not found"), 0));

      v30 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%d"), &v30, v16));
      v24 = v30;

    }
    else
    {
      v20 = self->_dateOfLastSync;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:](NSDateComponentsFormatter, "_mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:", v20, v21, 128));

    }
    v25 = -[BatteryStateAgeView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (-[BatteryStateAgeView shouldShowSeparator](self, "shouldShowSeparator"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR(" · [List view details separator]"), CFSTR("localized string not found"), 0));

    }
    else
    {
      v27 = &stru_1011EB268;
    }
    if (v25 == (id)1)
      v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v22, v27);
    else
      v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v27, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[UILabel setText:](self->_stateUpdatedLabel, "setText:", v29);

  }
  else
  {
    -[UILabel setText:](self->_stateUpdatedLabel, "setText:", &stru_1011EB268);
  }
}

- (void)setDateOfLastSync:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_dateOfLastSync != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dateOfLastSync, a3);
    -[BatteryStateAgeView _updateContents](self, "_updateContents");
    v5 = v6;
  }

}

- (void)setShouldShowSeparator:(BOOL)a3
{
  if (self->_shouldShowSeparator != a3)
  {
    self->_shouldShowSeparator = a3;
    -[BatteryStateAgeView _updateContents](self, "_updateContents");
  }
}

- (void)startAnimating
{
  -[UIActivityIndicatorView setAlpha:](self->_activityIndicator, "setAlpha:", 1.0);
  -[UILabel setAlpha:](self->_stateUpdatedLabel, "setAlpha:", 0.0);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView setAlpha:](self->_activityIndicator, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_stateUpdatedLabel, "setAlpha:", 1.0);
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
}

- (id)viewForFirstBaselineLayout
{
  return self->_stateUpdatedLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_stateUpdatedLabel;
}

- (BOOL)shouldShowSeparator
{
  return self->_shouldShowSeparator;
}

- (NSDate)dateOfLastSync
{
  return self->_dateOfLastSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastSync, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_stateUpdatedLabel, 0);
}

@end
