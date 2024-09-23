@implementation PedestrianARSafetyView

- (PedestrianARSafetyView)initWithFrame:(CGRect)a3
{
  PedestrianARSafetyView *v3;
  PedestrianARSafetyView *v4;
  void *v5;
  uint64_t v6;
  ARSession *session;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PedestrianARSafetyView;
  v3 = -[PedestrianARSafetyView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PedestrianARSafetyView _setupViews](v3, "_setupViews");
    v4->_numberOfSafetyUIPerSession = 0;
    v4->_showSafetyUI = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "session"));
    session = v4->_session;
    v4->_session = (ARSession *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView session](v4, "session"));
    objc_msgSend(v8, "_addObserver:", v4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, "_deviceOrientationDidChange:", UIDeviceOrientationDidChangeNotification, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PedestrianARSafetyView didEndARSession](self, "didEndARSession");
  -[PedestrianARSafetyView _stopWalkingWarningDismissTimer](self, "_stopWalkingWarningDismissTimer");
  -[PedestrianARSafetyView _stopWalkingWarningDisplayTimer](self, "_stopWalkingWarningDisplayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView session](self, "session"));
  objc_msgSend(v3, "_removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIDeviceOrientationDidChangeNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARSafetyView;
  -[PedestrianARSafetyView dealloc](&v5, "dealloc");
}

- (void)_setupViews
{
  PedestrianARGradientOverlay *v3;
  void *v4;
  PedestrianARGradientOverlay *v5;
  PedestrianARGradientOverlay *gradientOverlay;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  UIImageView *stopImageView;
  void *v18;
  UILabel *v19;
  UILabel *instructionLabel;
  void *v21;
  double v22;
  UILabel *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *imageViewHeightConstraint;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[11];

  -[PedestrianARSafetyView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v3 = [PedestrianARGradientOverlay alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARGradientOverlayConfiguration safetyViewConfiguration](PedestrianARGradientOverlayConfiguration, "safetyViewConfiguration"));
  v5 = -[PedestrianARGradientOverlay initWithConfiguration:](v3, "initWithConfiguration:", v4);
  gradientOverlay = self->_gradientOverlay;
  self->_gradientOverlay = v5;

  -[PedestrianARGradientOverlay setTranslatesAutoresizingMaskIntoConstraints:](self->_gradientOverlay, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PedestrianARGradientOverlay setState:](self->_gradientOverlay, "setState:", 3);
  -[PedestrianARSafetyView addSubview:](self, "addSubview:", self->_gradientOverlay);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("hand.raised.fill")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleLargeTitle));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithConfiguration:", v9));

  v11 = objc_alloc((Class)UIImageView);
  v66 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithRenderingMode:", 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_flatImageWithColor:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithRenderingMode:", 1));
  v16 = (UIImageView *)objc_msgSend(v11, "initWithImage:", v15);
  stopImageView = self->_stopImageView;
  self->_stopImageView = v16;

  -[UIImageView setContentMode:](self->_stopImageView, "setContentMode:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_stopImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](self->_stopImageView, "setBackgroundColor:", v18);

  -[PedestrianARSafetyView addSubview:](self, "addSubview:", self->_stopImageView);
  v19 = (UILabel *)objc_alloc_init((Class)UILabel);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v19;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_instructionLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_instructionLabel, "font"));
  objc_msgSend(v21, "pointSize");
  v23 = self->_instructionLabel;
  if (10.0 / v22 > 1.0)
  {
    -[UILabel setMinimumScaleFactor:](v23, "setMinimumScaleFactor:", 1.0);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v23, "font"));
    objc_msgSend(v24, "pointSize");
    -[UILabel setMinimumScaleFactor:](self->_instructionLabel, "setMinimumScaleFactor:", 10.0 / v25);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UILabel setTextColor:](self->_instructionLabel, "setTextColor:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("PedestrianARSafetyView [instruction]"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_instructionLabel, "setText:", v28);

  -[UILabel setTextAlignment:](self->_instructionLabel, "setTextAlignment:", 1);
  -[PedestrianARSafetyView addSubview:](self, "addSubview:", self->_instructionLabel);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_stopImageView, "heightAnchor"));
  -[PedestrianARSafetyView _imageSizeForCurrentContentSizeCategory](self, "_imageSizeForCurrentContentSizeCategory");
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:"));
  imageViewHeightConstraint = self->_imageViewHeightConstraint;
  self->_imageViewHeightConstraint = v30;

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay leadingAnchor](self->_gradientOverlay, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView leadingAnchor](self, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v67[0] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay trailingAnchor](self->_gradientOverlay, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView trailingAnchor](self, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v67[1] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay bottomAnchor](self->_gradientOverlay, "bottomAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView bottomAnchor](self, "bottomAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
  v67[2] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay topAnchor](self->_gradientOverlay, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView topAnchor](self, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v67[3] = v54;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_instructionLabel, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 26.0));
  v67[4] = v50;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_instructionLabel, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, -26.0));
  v67[5] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_instructionLabel, "centerYAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView centerYAnchor](self, "centerYAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 6.5));
  v67[6] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_stopImageView, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_instructionLabel, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v32, -13.0));
  v34 = self->_imageViewHeightConstraint;
  v67[7] = v33;
  v67[8] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_stopImageView, "widthAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_stopImageView, "heightAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  v67[9] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_stopImageView, "centerXAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView centerXAnchor](self, "centerXAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  v67[10] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

  -[PedestrianARSafetyView setState:](self, "setState:", 1);
  -[PedestrianARSafetyView _updateFont](self, "_updateFont");
  -[PedestrianARSafetyView _updateNumberOflines](self, "_updateNumberOflines");

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
  v9.super_class = (Class)PedestrianARSafetyView;
  -[PedestrianARSafetyView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView traitCollection](self, "traitCollection")),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory")),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory")),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v5,
        v8))
  {
    -[PedestrianARSafetyView _updateFont](self, "_updateFont");
    -[PedestrianARSafetyView _imageSizeForCurrentContentSizeCategory](self, "_imageSizeForCurrentContentSizeCategory");
    -[NSLayoutConstraint setConstant:](self->_imageViewHeightConstraint, "setConstant:");
  }

}

- (void)_updateFont
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView traitCollection](self, "traitCollection"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle2, v5, UIFontWeightBold));
  -[UILabel setFont:](self->_instructionLabel, "setFont:", v4);

}

- (void)_updateNumberOflines
{
  double Width;
  uint64_t v4;
  CGRect v5;
  CGRect v6;

  -[PedestrianARSafetyView frame](self, "frame");
  Width = CGRectGetWidth(v5);
  -[PedestrianARSafetyView frame](self, "frame");
  if (Width <= CGRectGetHeight(v6))
    v4 = 5;
  else
    v4 = 3;
  -[UILabel setNumberOfLines:](self->_instructionLabel, "setNumberOfLines:", v4);
}

- (void)_deviceOrientationDidChange:(id)a3
{
  -[PedestrianARSafetyView _updateNumberOflines](self, "_updateNumberOflines", a3);
  -[UILabel invalidateIntrinsicContentSize](self->_instructionLabel, "invalidateIntrinsicContentSize");
}

- (double)_imageSizeForCurrentContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  double v6;

  if (qword_1014D2A70 != -1)
    dispatch_once(&qword_1014D2A70, &stru_1011BD3F8);
  v3 = (void *)qword_1014D2A68;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  if (objc_msgSend(v3, "containsObject:", v5))
    v6 = 60.0;
  else
    v6 = 54.0;

  return v6;
}

- (void)didStartARSession
{
  -[PedestrianARSafetyView setState:](self, "setState:", 2);
  -[PedestrianARSafetyView _startMonitoringDeviceMotion](self, "_startMonitoringDeviceMotion");
}

- (void)didEndARSession
{
  -[PedestrianARSafetyView setState:](self, "setState:", 1);
  -[PedestrianARSafetyView _stopMonitoringDeviceMotion](self, "_stopMonitoringDeviceMotion");
}

- (void)setState:(int64_t)a3
{
  int64_t state;
  id v6;
  NSObject *v7;
  unint64_t v8;
  const __CFString *v9;
  int64_t v10;
  int v11;
  PedestrianARSafetyView *v12;
  __int16 v13;
  const __CFString *v14;

  state = self->_state;
  if (state != a3 && (a3 != 3 || state != 4))
  {
    self->_state = a3;
    v6 = sub_1005E2984();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = self->_state - 1;
      if (v8 > 3)
        v9 = CFSTR("PedestrianARSafetyViewUnknown");
      else
        v9 = *(&off_1011BD438 + v8);
      v11 = 134349314;
      v12 = self;
      v13 = 2112;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] state %@", (uint8_t *)&v11, 0x16u);
    }

    switch(a3)
    {
      case 1:
        goto LABEL_12;
      case 2:
        -[PedestrianARSafetyView _stopWalkingWarningDisplayTimer](self, "_stopWalkingWarningDisplayTimer");
        -[PedestrianARSafetyView _stopWalkingWarningDismissTimer](self, "_stopWalkingWarningDismissTimer");
        goto LABEL_12;
      case 3:
        -[PedestrianARSafetyView _startWalkingWarningDisplayTimer](self, "_startWalkingWarningDisplayTimer");
LABEL_12:
        -[PedestrianARSafetyView _hideViews:](self, "_hideViews:", 1);
        break;
      case 4:
        if (self->_showSafetyUI)
          -[PedestrianARSafetyView _hideViews:](self, "_hideViews:", 0);
        v10 = self->_numberOfSafetyUIPerSession + 1;
        self->_numberOfSafetyUIPerSession = v10;
        self->_showSafetyUI = v10 < GEOConfigGetInteger(MapsConfig_PedestrianARSSafetyMaxCountPerARSession, off_1014B40D8);
        -[PedestrianARSafetyView _startWalkingWarningDismissTimer](self, "_startWalkingWarningDismissTimer");
        break;
      default:
        return;
    }
  }
}

- (void)_hideViews:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSDate *v10;
  NSDate *lastDisplayTime;
  _QWORD v12[6];

  if (a3)
  {
    -[NSDate timeIntervalSinceNow](self->_lastDisplayTime, "timeIntervalSinceNow");
    v5 = v4;
    -[NSDate timeIntervalSinceNow](self->_lastDisplayTime, "timeIntervalSinceNow");
    if (v5 >= 0.0)
      v7 = v6;
    else
      v7 = -v6;
    v8 = 0.0;
    if (v7 >= GEOConfigGetDouble(MapsConfig_PedestrianARSSafetyMinTimeOnScreen, off_1014B4088)
      || GEOConfigGetDouble(MapsConfig_PedestrianARSSafetyMinTimeOnScreen, off_1014B4088) - v7 <= 0.0)
    {
      v9 = 0.0;
    }
    else
    {
      v9 = GEOConfigGetDouble(MapsConfig_PedestrianARSSafetyMinTimeOnScreen, off_1014B4088) - v7;
    }
  }
  else
  {
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    lastDisplayTime = self->_lastDisplayTime;
    self->_lastDisplayTime = v10;

    v9 = 0.0;
    v8 = 1.0;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005E2AE0;
  v12[3] = &unk_1011AD518;
  v12[4] = self;
  *(double *)&v12[5] = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v12, 0, 0.5, v9);
}

- (void)_startMonitoringDeviceMotion
{
  NSTimer *v3;
  id v4;

  objc_storeStrong((id *)&self->_startWalkingLocation, self->_lastLocation);
  v3 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_didStartWalkingCheck", 0, 0, GEOConfigGetDouble(MapsConfig_PedestrianARSSafetyWalkingCheckThreshold, off_1014B4068));
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[PedestrianARSafetyView setDeviceMotionTimer:](self, "setDeviceMotionTimer:", v4);

}

- (void)_stopMonitoringDeviceMotion
{
  void *v3;
  GEOLocation *startWalkingLocation;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView deviceMotionTimer](self, "deviceMotionTimer"));
  objc_msgSend(v3, "invalidate");

  -[PedestrianARSafetyView setDeviceMotionTimer:](self, "setDeviceMotionTimer:", 0);
  startWalkingLocation = self->_startWalkingLocation;
  self->_startWalkingLocation = 0;

}

- (void)_didStartWalkingCheck
{
  GEOLocation *lastLocation;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  GEOLocation *startWalkingLocation;
  id v13;
  NSObject *v14;
  const char *v15;
  id v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  int v20;
  PedestrianARSafetyView *v21;
  __int16 v22;
  double v23;

  lastLocation = self->_lastLocation;
  if (lastLocation && self->_startWalkingLocation)
  {
    -[GEOLocation coordinate](lastLocation, "coordinate");
    v5 = v4;
    v7 = v6;
    v8 = -[GEOLocation coordinate](self->_startWalkingLocation, "coordinate");
    v11 = GEOCalculateDistance(v8, v5, v7, v9, v10);
    if (v11 >= GEOConfigGetDouble(MapsConfig_PedestrianARSafetyMinimumWalkingDistance, off_1014B4058))
    {
      -[PedestrianARSafetyView setState:](self, "setState:", 3);
      v19 = sub_1005E2984();
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 134349312;
        v21 = self;
        v22 = 2048;
        v23 = v11;
        v15 = "[%{public}p] DeviceMotion - %f - walking";
        goto LABEL_10;
      }
    }
    else
    {
      startWalkingLocation = self->_startWalkingLocation;
      self->_startWalkingLocation = 0;

      -[PedestrianARSafetyView setState:](self, "setState:", 2);
      v13 = sub_1005E2984();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 134349312;
        v21 = self;
        v22 = 2048;
        v23 = v11;
        v15 = "[%{public}p] DeviceMotion - %f - not walking";
LABEL_10:
        v17 = v14;
        v18 = 22;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v16 = sub_1005E2984();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v20 = 134349056;
      v21 = self;
      v15 = "[%{public}p] DeviceMotion no location";
      v17 = v14;
      v18 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, v18);
    }
  }

  -[PedestrianARSafetyView _startMonitoringDeviceMotion](self, "_startMonitoringDeviceMotion");
}

- (void)_startWalkingWarningDisplayTimer
{
  NSTimer *v3;
  id v4;

  v3 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_didExceedWalkingWarningDisplayLimit", 0, 0, GEOConfigGetDouble(MapsConfig_PedestrianARSafetyWalkingLimit, off_1014B4048));
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[PedestrianARSafetyView setWalkingWarningDisplayLimitTimer:](self, "setWalkingWarningDisplayLimitTimer:", v4);

}

- (void)_stopWalkingWarningDisplayTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView walkingWarningDisplayLimitTimer](self, "walkingWarningDisplayLimitTimer"));
  objc_msgSend(v3, "invalidate");

  -[PedestrianARSafetyView setWalkingWarningDisplayLimitTimer:](self, "setWalkingWarningDisplayLimitTimer:", 0);
}

- (void)_didExceedWalkingWarningDisplayLimit
{
  -[PedestrianARSafetyView setState:](self, "setState:", 4);
}

- (void)_startWalkingWarningDismissTimer
{
  NSTimer *v3;
  id v4;

  v3 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_didExceedWalkingWarningDismissLimit", 0, 0, GEOConfigGetDouble(MapsConfig_PedestrianARSSafetyMaxTimeOnScreen, off_1014B4078));
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[PedestrianARSafetyView setWalkingWarningDisplayLimitTimer:](self, "setWalkingWarningDisplayLimitTimer:", v4);

}

- (void)_stopWalkingWarningDismissTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView walkingWarningDisplayLimitTimer](self, "walkingWarningDisplayLimitTimer"));
  objc_msgSend(v3, "invalidate");

  -[PedestrianARSafetyView setWalkingWarningDisplayLimitTimer:](self, "setWalkingWarningDisplayLimitTimer:", 0);
}

- (void)_didExceedWalkingWarningDismissLimit
{
  -[PedestrianARSafetyView setState:](self, "setState:", 2);
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  GEOLocation *v8;
  GEOLocation *lastLocation;
  id v10;

  v10 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));

  if (v5)
  {
    v6 = objc_alloc((Class)GEOLocation);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));
    v8 = (GEOLocation *)objc_msgSend(v6, "initWithCLLocation:", v7);
    lastLocation = self->_lastLocation;
    self->_lastLocation = v8;

  }
}

- (NSTimer)deviceMotionTimer
{
  return self->_deviceMotionTimer;
}

- (void)setDeviceMotionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMotionTimer, a3);
}

- (NSTimer)walkingWarningDisplayLimitTimer
{
  return self->_walkingWarningDisplayLimitTimer;
}

- (void)setWalkingWarningDisplayLimitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_walkingWarningDisplayLimitTimer, a3);
}

- (NSTimer)walkingWarningDismissLimitTimer
{
  return self->_walkingWarningDismissLimitTimer;
}

- (void)setWalkingWarningDismissLimitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_walkingWarningDismissLimitTimer, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_walkingWarningDismissLimitTimer, 0);
  objc_storeStrong((id *)&self->_walkingWarningDisplayLimitTimer, 0);
  objc_storeStrong((id *)&self->_deviceMotionTimer, 0);
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lastDisplayTime, 0);
  objc_storeStrong((id *)&self->_startWalkingLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_gradientOverlay, 0);
  objc_storeStrong((id *)&self->_stopImageView, 0);
}

@end
