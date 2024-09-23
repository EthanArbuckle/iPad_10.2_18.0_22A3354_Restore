@implementation PedestrianARArrowGuidanceView

- (PedestrianARArrowGuidanceView)initWithMapViewDelegate:(id)a3 route:(id)a4 activity:(id)a5
{
  id v8;
  id v9;
  id v10;
  PedestrianARArrowGuidanceView *v11;
  PedestrianARArrowGuidanceView *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[PedestrianARArrowGuidanceView initWithMapViewDelegate:route:activity:]";
      v26 = 2080;
      v27 = "PedestrianARArrowGuidanceView.m";
      v28 = 1024;
      v29 = 53;
      v30 = 2080;
      v31 = "mapViewDelegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)PedestrianARArrowGuidanceView;
  v11 = -[PedestrianARArrowGuidanceView initWithFrame:](&v23, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_mapViewDelegate, v8);
    objc_storeStrong((id *)&v12->_activity, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueRouteID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    v12->_isFirstArrowOfRoute = objc_msgSend(v13, "hasAREverLocalizedForRoute:", v15) ^ 1;

    -[PedestrianARArrowGuidanceView _setupViews](v12, "_setupViews");
    -[PedestrianARArrowGuidanceView _resetState](v12, "_resetState");
    WeakRetained = objc_loadWeakRetained((id *)&v12->_mapViewDelegate);
    objc_msgSend(WeakRetained, "registerObserver:", v12);

  }
  return v12;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewDelegate);
  objc_msgSend(WeakRetained, "unregisterObserver:", self);

  -[PedestrianARArrowGuidanceView _stopShowInstructionTimer](self, "_stopShowInstructionTimer");
  -[PedestrianARArrowGuidanceView _stopArrowPulseAnimationTimer](self, "_stopArrowPulseAnimationTimer");
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARArrowGuidanceView;
  -[PedestrianARArrowGuidanceView dealloc](&v4, "dealloc");
}

- (void)stop
{
  _QWORD v2[5];

  self->_isStopping = 1;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003FED84;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.2);
}

- (void)_setupViews
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *dynamicArrowImageView;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  UILabel *v14;
  UILabel *instructionLabel;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *instructionWidthConstraint;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  void *v36;
  _QWORD v37[3];

  v3 = objc_alloc((Class)UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("PedestrianAR_feature_arrow_right")));
  v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);
  dynamicArrowImageView = self->_dynamicArrowImageView;
  self->_dynamicArrowImageView = v5;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_dynamicArrowImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_dynamicArrowImageView, "setContentMode:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dynamicArrowImageView, "layer"));
  objc_msgSend(v7, "setShadowOffset:", 0.0, 0.0);

  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor")));
  v9 = objc_msgSend(v8, "CGColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dynamicArrowImageView, "layer"));
  objc_msgSend(v10, "setShadowColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dynamicArrowImageView, "layer"));
  LODWORD(v12) = 1053609165;
  objc_msgSend(v11, "setShadowOpacity:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dynamicArrowImageView, "layer"));
  objc_msgSend(v13, "setShadowRadius:", 26.0);

  -[PedestrianARArrowGuidanceView addSubview:](self, "addSubview:", self->_dynamicArrowImageView);
  v14 = (UILabel *)objc_alloc_init((Class)UILabel);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v14;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_instructionLabel, "layer"));
  objc_msgSend(v16, "setShadowOffset:", 0.0, 0.0);

  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor")));
  v18 = objc_msgSend(v17, "CGColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_instructionLabel, "layer"));
  objc_msgSend(v19, "setShadowColor:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_instructionLabel, "layer"));
  LODWORD(v21) = 1061997773;
  objc_msgSend(v20, "setShadowOpacity:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_instructionLabel, "layer"));
  objc_msgSend(v22, "setShadowRadius:", 26.0);

  -[UILabel setNumberOfLines:](self->_instructionLabel, "setNumberOfLines:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UILabel setTextColor:](self->_instructionLabel, "setTextColor:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("PedestrianARArrowGuidanceView [instruction]"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_instructionLabel, "setText:", v25);

  -[PedestrianARArrowGuidanceView addSubview:](self, "addSubview:", self->_instructionLabel);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_instructionLabel, "widthAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v27, "bounds");
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintLessThanOrEqualToConstant:", v28 * 0.699999988));
  instructionWidthConstraint = self->_instructionWidthConstraint;
  self->_instructionWidthConstraint = v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_dynamicArrowImageView, "heightAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", 57.0));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_dynamicArrowImageView, "widthAnchor", v32));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToConstant:", 57.0));
  v35 = self->_instructionWidthConstraint;
  v37[1] = v34;
  v37[2] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

  -[PedestrianARArrowGuidanceView _updateFont](self, "_updateFont");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARArrowGuidanceView;
  -[PedestrianARArrowGuidanceView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARArrowGuidanceView traitCollection](self, "traitCollection")),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory")),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory")),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v5,
        v8))
  {
    -[PedestrianARArrowGuidanceView _updateFont](self, "_updateFont");
  }

}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARArrowGuidanceView;
  -[PedestrianARArrowGuidanceView layoutSubviews](&v4, "layoutSubviews");
  -[PedestrianARArrowGuidanceView frame](self, "frame");
  -[NSLayoutConstraint setConstant:](self->_instructionWidthConstraint, "setConstant:", v3 * 0.699999988);
  -[UILabel setNeedsUpdateConstraints](self->_instructionLabel, "setNeedsUpdateConstraints");
}

- (void)_updateFont
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARArrowGuidanceView traitCollection](self, "traitCollection"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityMedium));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle2, v5, UIFontWeightBold));
  -[UILabel setFont:](self->_instructionLabel, "setFont:", v4);

}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  os_activity_scope_state_s v19;
  uint8_t buf[4];
  void *v21;

  v6 = a3;
  v7 = a4;
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v19);
  if (self->_isStopping)
  {
    v8 = sub_10043395C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Pedestrian AR is stopping. No longer updating directional arrows", buf, 2u);
    }
    goto LABEL_4;
  }
  if (objc_msgSend(v7, "isVisible"))
  {
    v10 = sub_10043395C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
      *(_DWORD *)buf = 138477827;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Feature '%{private}@' should be visible. Hiding directional arrows", buf, 0xCu);

    }
LABEL_14:

    -[PedestrianARArrowGuidanceView _resetState](self, "_resetState");
    goto LABEL_15;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
  v14 = v13 == 0;

  if (v14)
  {
    v16 = sub_10043395C();
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Feature is nil. Hiding directional arrows", buf, 2u);
    }
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "isDirectlyBehind")
    || -[PedestrianARArrowGuidanceView _isFirstArrowPosition](self, "_isFirstArrowPosition"))
  {
    objc_msgSend(v7, "screenHeading");
    self->_dynamicArrowAngle = v15;
    -[PedestrianARArrowGuidanceView _updateDynamicArrow](self, "_updateDynamicArrow");
    goto LABEL_15;
  }
  v17 = sub_10043395C();
  v9 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
    *(_DWORD *)buf = 138477827;
    v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Feature '%{private}@' is directly behind user.", buf, 0xCu);

  }
LABEL_4:

LABEL_15:
  os_activity_scope_leave(&v19);

}

- (void)_updateDynamicArrow
{
  unsigned int v3;
  double dynamicArrowAngle;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __double2 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double x;
  double v23;
  double y;
  UIImageView *dynamicArrowImageView;
  _BOOL4 v26;
  _BOOL4 v27;
  _QWORD v28[10];
  CGAffineTransform v29;
  CGAffineTransform v30;

  -[UIImageView setHidden:](self->_dynamicArrowImageView, "setHidden:", 0);
  v3 = -[PedestrianARArrowGuidanceView _isFirstArrowPosition](self, "_isFirstArrowPosition");
  if (v3)
  {
    dynamicArrowAngle = self->_dynamicArrowAngle;
  }
  else
  {
    dynamicArrowAngle = self->_dynamicArrowAngle;
    v5 = self->_dynamicArrowLastAngle - dynamicArrowAngle;
    if (v5 < 0.0)
      v5 = -v5;
    if (v5 > 45.0)
    {
      self->_dynamicArrowLastAngle = dynamicArrowAngle;
      return;
    }
  }
  self->_dynamicArrowLastAngle = dynamicArrowAngle;
  -[PedestrianARArrowGuidanceView frame](self, "frame");
  v7 = v6 * 0.5 + -28.5;
  -[PedestrianARArrowGuidanceView frame](self, "frame");
  v9 = v8 * 0.5 + -28.5;
  -[PedestrianARArrowGuidanceView frame](self, "frame");
  v11 = v10 * 0.5;
  -[PedestrianARArrowGuidanceView frame](self, "frame");
  v13 = v12 * 0.5;
  v14 = (self->_dynamicArrowAngle + -90.0) * 0.0174532925;
  v15 = __sincos_stret(v14);
  v16 = v11 + v15.__cosval * v7;
  v17 = v13 + v15.__sinval * v9;
  -[UILabel bounds](self->_instructionLabel, "bounds");
  v19 = v18 * 0.5 + 28.5 + 8.0;
  -[UILabel bounds](self->_instructionLabel, "bounds");
  v21 = self->_dynamicArrowAngle;
  if (v21 > 45.0 && v21 <= 135.0)
  {
    x = v16 - v19;
    goto LABEL_17;
  }
  v23 = v20 * 0.5 + 28.5 + 4.0;
  if (v21 <= 135.0 || v21 > 225.0)
  {
    if (v21 > 225.0 && v21 <= 315.0)
    {
      x = v16 + v19;
LABEL_17:
      y = v17;
      if (!v3)
        goto LABEL_19;
      goto LABEL_18;
    }
    v26 = v21 <= 315.0;
    v27 = v21 > 45.0;
    if (v26 && v27)
      y = CGPointZero.y;
    else
      y = v17 + v23;
    if (v26 && v27)
      x = CGPointZero.x;
    else
      x = v16;
    if (!v3)
      goto LABEL_19;
LABEL_18:
    -[UIImageView setCenter:](self->_dynamicArrowImageView, "setCenter:", v16, v17);
    -[UILabel setCenter:](self->_instructionLabel, "setCenter:", x, y);
    CGAffineTransformMakeRotation(&v30, v14);
    dynamicArrowImageView = self->_dynamicArrowImageView;
    v29 = v30;
    -[UIImageView setTransform:](dynamicArrowImageView, "setTransform:", &v29);
    -[PedestrianARArrowGuidanceView _startArrowPulseAnimationTimer](self, "_startArrowPulseAnimationTimer");
    goto LABEL_19;
  }
  y = v17 - v23;
  x = v16;
  if (v3)
    goto LABEL_18;
LABEL_19:
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1003FF8C0;
  v28[3] = &unk_1011B5310;
  v28[4] = self;
  *(double *)&v28[5] = v14;
  *(double *)&v28[6] = v16;
  *(double *)&v28[7] = v17;
  *(double *)&v28[8] = x;
  *(double *)&v28[9] = y;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v28, 0.600000024);
  if (self->_isFirstArrowOfRoute)
  {
    self->_isFirstArrowOfRoute = 0;
    -[PedestrianARArrowGuidanceView _showInstruction](self, "_showInstruction");
  }
  else
  {
    -[PedestrianARArrowGuidanceView _startShowInstructionTimerIfNeeded](self, "_startShowInstructionTimerIfNeeded");
  }
}

- (void)_startShowInstructionTimerIfNeeded
{
  NSTimer *v3;
  NSTimer *showInstructionTimer;
  _QWORD v5[4];
  id v6;
  id location;

  if (-[UILabel isHidden](self->_instructionLabel, "isHidden"))
  {
    if (!self->_showInstructionTimer)
    {
      objc_initWeak(&location, self);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1003FFA3C;
      v5[3] = &unk_1011ADF20;
      objc_copyWeak(&v6, &location);
      v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 3.0));
      showInstructionTimer = self->_showInstructionTimer;
      self->_showInstructionTimer = v3;

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_stopShowInstructionTimer
{
  NSTimer *showInstructionTimer;

  -[NSTimer invalidate](self->_showInstructionTimer, "invalidate");
  showInstructionTimer = self->_showInstructionTimer;
  self->_showInstructionTimer = 0;

}

- (void)_showInstruction
{
  if ((-[UIImageView isHidden](self->_dynamicArrowImageView, "isHidden") & 1) == 0)
    -[UILabel setHidden:](self->_instructionLabel, "setHidden:", 0);
}

- (void)_resetState
{
  self->_dynamicArrowAngle = 2.22507386e-308;
  self->_dynamicArrowLastAngle = 2.22507386e-308;
  -[PedestrianARArrowGuidanceView _stopShowInstructionTimer](self, "_stopShowInstructionTimer");
  -[PedestrianARArrowGuidanceView _stopArrowPulseAnimationTimer](self, "_stopArrowPulseAnimationTimer");
  -[UIImageView setHidden:](self->_dynamicArrowImageView, "setHidden:", 1);
  -[UILabel setHidden:](self->_instructionLabel, "setHidden:", 1);
}

- (BOOL)_isFirstArrowPosition
{
  return self->_dynamicArrowLastAngle == 2.22507386e-308;
}

- (void)_startArrowPulseAnimationTimer
{
  NSTimer *v3;
  NSTimer *arrowPulseAnimationTimer;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003FFC44;
  v5[3] = &unk_1011ADF20;
  objc_copyWeak(&v6, &location);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v5, 0.6));
  arrowPulseAnimationTimer = self->_arrowPulseAnimationTimer;
  self->_arrowPulseAnimationTimer = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_stopArrowPulseAnimationTimer
{
  NSTimer *arrowPulseAnimationTimer;

  -[NSTimer invalidate](self->_arrowPulseAnimationTimer, "invalidate");
  arrowPulseAnimationTimer = self->_arrowPulseAnimationTimer;
  self->_arrowPulseAnimationTimer = 0;

}

- (void)_startArrowPulseAnimation
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003FFD14;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v2, 0, 0.600000024, 0.0);
}

- (PedestrianARVKMapViewMapDelegate)mapViewDelegate
{
  return (PedestrianARVKMapViewMapDelegate *)objc_loadWeakRetained((id *)&self->_mapViewDelegate);
}

- (void)setMapViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapViewDelegate);
  objc_storeStrong((id *)&self->_instructionWidthConstraint, 0);
  objc_storeStrong((id *)&self->_arrowPulseAnimationTimer, 0);
  objc_storeStrong((id *)&self->_showInstructionTimer, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_dynamicArrowImageView, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
