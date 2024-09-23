@implementation CarHeadingIndicatorView

- (CarHeadingIndicatorView)initWithCarSceneType:(int64_t)a3
{
  CarHeadingIndicatorView *v4;
  CarHeadingIndicatorView *v5;
  uint64_t v6;
  uint64_t v7;
  MKLocationManager *locationManager;
  id v9;
  uint64_t v10;
  double v11;
  id v12;
  double y;
  double width;
  double height;
  UIView *v16;
  UIView *containerView;
  UILabel *v18;
  UILabel *headingLabel;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CarHeadingIndicatorView;
  v4 = -[CarFocusableBlurControl initWithFrame:](&v25, "initWithFrame:", 0.0, 0.0, 34.0, 34.0);
  v5 = v4;
  if (v4)
  {
    v4->_sceneType = a3;
    -[CarHeadingIndicatorView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("CarHeadingIndicatorView"));
    -[CarFocusableBlurControl setRoundedCornerRadius:](v5, "setRoundedCornerRadius:", UIRoundToViewScale(v5, v6, 17.0));
    v7 = objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    locationManager = v5->_locationManager;
    v5->_locationManager = (MKLocationManager *)v7;

    v9 = -[MKLocationManager vehicleHeadingOrCourse](v5->_locationManager, "vehicleHeadingOrCourse");
    v5->_compassPoint = MKCompassPointFromLocationDirection(v9, v10, v11);
    v12 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v16 = (UIView *)objc_msgSend(v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    containerView = v5->_containerView;
    v5->_containerView = v16;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v5->_containerView, "setAccessibilityIdentifier:", CFSTR("ContainerView"));
    -[CarFocusableControl addSubview:](v5, "addSubview:", v5->_containerView);
    v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    headingLabel = v5->_headingLabel;
    v5->_headingLabel = v18;

    -[UILabel setAccessibilityIdentifier:](v5->_headingLabel, "setAccessibilityIdentifier:", CFSTR("HeadingLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_headingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v5->_headingLabel, "setTextAlignment:", 1);
    LODWORD(v20) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_headingLabel, "setContentHuggingPriority:forAxis:", 1, v20);
    LODWORD(v21) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_headingLabel, "setContentHuggingPriority:forAxis:", 0, v21);
    LODWORD(v22) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_headingLabel, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_headingLabel, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    -[UIView addSubview:](v5->_containerView, "addSubview:", v5->_headingLabel);
    -[CarHeadingIndicatorView _setupConstraints](v5, "_setupConstraints");
    -[CarHeadingIndicatorView _updateStyling](v5, "_updateStyling");
    -[CarHeadingIndicatorView _updateContents](v5, "_updateContents");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CarHeadingIndicatorView _stopLocationUpdates](self, "_stopLocationUpdates");
  v3.receiver = self;
  v3.super_class = (Class)CarHeadingIndicatorView;
  -[CarHeadingIndicatorView dealloc](&v3, "dealloc");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarHeadingIndicatorView;
  -[CarFocusableBlurControl didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView window](self, "window"));

  if (v3)
  {
    -[CarHeadingIndicatorView _updateColors](self, "_updateColors");
    -[CarHeadingIndicatorView _updateStyling](self, "_updateStyling");
    -[CarHeadingIndicatorView _applyDynamicScaling](self, "_applyDynamicScaling");
  }
  -[CarHeadingIndicatorView _setActive:](self, "_setActive:", self->_active);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarHeadingIndicatorView;
  v4 = a3;
  -[CarFocusableBlurControl traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[CarHeadingIndicatorView _updateColors](self, "_updateColors");
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
    -[CarHeadingIndicatorView _setActive:](self, "_setActive:");
}

- (void)_setActive:(BOOL)a3
{
  void *v4;

  self->_active = a3;
  if (a3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView window](self, "window")),
        v4,
        v4))
  {
    -[CarHeadingIndicatorView _startLocationUpdates](self, "_startLocationUpdates");
  }
  else
  {
    -[CarHeadingIndicatorView _stopLocationUpdates](self, "_stopLocationUpdates");
  }
}

- (void)_setupConstraints
{
  void *v3;
  double v4;
  double v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *widthConstraint;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
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
  _QWORD v37[10];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView widthAnchor](self, "widthAnchor"));
  if (self->_sceneType == 7)
  {
    -[CarHeadingIndicatorView _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue");
    v5 = v4 * 34.0;
  }
  else
  {
    v5 = 34.0;
  }
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToConstant:", v5));
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v6;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView topAnchor](self, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v37[0] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_containerView, "leftAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView leftAnchor](self, "leftAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v37[1] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView bottomAnchor](self, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v37[2] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_containerView, "rightAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView rightAnchor](self, "rightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v37[3] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_headingLabel, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v23));
  v37[4] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_headingLabel, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_containerView, "heightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v20));
  v37[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_headingLabel, "centerXAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v37[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_headingLabel, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_containerView, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v15 = self->_widthConstraint;
  v37[7] = v14;
  v37[8] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView heightAnchor](self, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView widthAnchor](self, "widthAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v37[9] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 10));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);
}

- (void)_updateStyling
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_navHeadingFontWithPreferredSize:diameter:desiredPadding:](UIFont, "_maps_navHeadingFontWithPreferredSize:diameter:desiredPadding:", 15.0, 34.0, 4.0));
  v4 = 1.0;
  if (self->_sceneType == 7)
    -[CarHeadingIndicatorView _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_scaledFontForScaleFactor:", v4));
  -[UILabel setFont:](self->_headingLabel, "setFont:", v5);

  -[UILabel setTextAlignment:](self->_headingLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_headingLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_headingLabel, "setMinimumScaleFactor:", 0.550000012);
  -[UILabel setBaselineAdjustment:](self->_headingLabel, "setBaselineAdjustment:", 1);
  -[UILabel setLineBreakMode:](self->_headingLabel, "setLineBreakMode:", 2);
  v7 = 17.0;
  if (self->_sceneType == 7)
  {
    -[CarHeadingIndicatorView _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue", 17.0);
    v7 = v8 * 34.0 * 0.5;
  }
  -[CarFocusableBlurControl setRoundedCornerRadius:](self, "setRoundedCornerRadius:", UIRoundToViewScale(self, v6, v7));
  -[CarHeadingIndicatorView _updateColors](self, "_updateColors");
}

- (void)_updateContents
{
  unsigned int v3;
  unsigned int compassPoint;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = -[CarHeadingIndicatorView contentsHidden](self, "contentsHidden");
  compassPoint = self->_compassPoint;
  v6 = MKLocalizedAbbreviationForCompassPoint(compassPoint, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[UILabel setText:](self->_headingLabel, "setText:", v7);

  -[CarHeadingIndicatorView setContentsHidden:](self, "setContentsHidden:", compassPoint == 0);
  if (v3 != -[CarHeadingIndicatorView contentsHidden](self, "contentsHidden"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("CarHeadingIndicatorViewDidChangeVisibility"), self);

  }
}

- (void)_updateColors
{
  int blurMode;
  uint64_t v4;
  id v5;

  blurMode = self->_blurMode;
  if ((blurMode - 2) >= 2)
  {
    if (blurMode == 1)
    {
      v4 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      goto LABEL_6;
    }
    if (blurMode)
      return;
  }
  v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
LABEL_6:
  v5 = (id)v4;
  -[UILabel setTextColor:](self->_headingLabel, "setTextColor:", v4);

}

- (void)_applyDynamicScaling
{
  double v3;
  double v4;

  if (self->_sceneType == 7)
  {
    -[CarHeadingIndicatorView _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue");
    v4 = v3 * 34.0;
  }
  else
  {
    v4 = 34.0;
  }
  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", v4);
}

- (void)_startLocationUpdates
{
  if (!self->_monitoringCourse
    && -[MKLocationManager isLocationServicesApproved](self->_locationManager, "isLocationServicesApproved"))
  {
    if (-[CarHeadingIndicatorView _canStartLocationUpdates](self, "_canStartLocationUpdates"))
    {
      self->_monitoringCourse = 1;
      -[MKLocationManager startLocationUpdateWithObserver:](self->_locationManager, "startLocationUpdateWithObserver:", self);
      -[MKLocationManager startVehicleHeadingUpdate](self->_locationManager, "startVehicleHeadingUpdate");
    }
  }
}

- (void)_stopLocationUpdates
{
  if (self->_monitoringCourse)
  {
    -[MKLocationManager stopLocationUpdateWithObserver:](self->_locationManager, "stopLocationUpdateWithObserver:", self);
    -[MKLocationManager stopVehicleHeadingUpdate](self->_locationManager, "stopVehicleHeadingUpdate");
    self->_monitoringCourse = 0;
  }
}

- (BOOL)_canStartLocationUpdates
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarHeadingIndicatorView window](self, "window"));
  if (v3)
    v4 = 1;
  else
    v4 = -[CarHeadingIndicatorView isActive](self, "isActive");

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  if (self->_sceneType == 7)
  {
    -[CarHeadingIndicatorView _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue");
    v3 = 34.0;
    v5 = v4 * 34.0;
    if (self->_sceneType == 7)
    {
      -[CarHeadingIndicatorView _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue");
      v3 = v6 * 34.0;
    }
  }
  else
  {
    v5 = 34.0;
    v3 = 34.0;
  }
  v7 = v5;
  result.height = v3;
  result.width = v7;
  return result;
}

- (void)dynamicBlurViewDidChangeBlurMode:(int)a3
{
  if (self->_blurMode != a3)
  {
    self->_blurMode = a3;
    -[CarHeadingIndicatorView _updateColors](self, "_updateColors");
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)needsContinuousRoundedCorners
{
  return 0;
}

- (void)_updateDisplayedHeadingWithHeading:(double)a3
{
  uint64_t v4;

  v4 = MKCompassPointFromLocationDirection(self, a2, a3);
  -[CarHeadingIndicatorView setCompassPoint:](self, "setCompassPoint:", v4);
}

- (void)setCompassPoint:(int)a3
{
  if (self->_compassPoint != a3)
  {
    self->_compassPoint = a3;
    -[CarHeadingIndicatorView _updateContents](self, "_updateContents");
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  objc_msgSend(a3, "vehicleHeadingOrCourse");
  -[CarHeadingIndicatorView _updateDisplayedHeadingWithHeading:](self, "_updateDisplayedHeadingWithHeading:");
}

- (void)locationManager:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  objc_msgSend(a3, "vehicleHeadingOrCourse", a4);
  -[CarHeadingIndicatorView _updateDisplayedHeadingWithHeading:](self, "_updateDisplayedHeadingWithHeading:");
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (BOOL)contentsHidden
{
  return self->_contentsHidden;
}

- (void)setContentsHidden:(BOOL)a3
{
  self->_contentsHidden = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (int)compassPoint
{
  return self->_compassPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_headingLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
