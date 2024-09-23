@implementation NavSecondarySignViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavSecondarySignViewController)init
{
  NavSecondarySignViewController *v2;
  NavSecondarySignViewController *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  RouteStepListMetrics *metrics;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavSecondarySignViewController;
  v2 = -[NavSecondarySignViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[NavSecondarySignViewController setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v6);

    v7 = objc_claimAutoreleasedReturnValue(+[RouteStepListMetrics navSignMetrics](RouteStepListMetrics, "navSignMetrics"));
    metrics = v3->_metrics;
    v3->_metrics = (RouteStepListMetrics *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v9, "registerObserver:", v3);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIView *v5;
  void *v6;
  GuidanceManeuverView *v7;
  GuidanceManeuverView *guidanceManeuverView;
  UILabel *v9;
  UILabel *primaryTextLabel;
  void *v11;
  double v12;
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
  UIView *v38;
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
  objc_super v53;
  _QWORD v54[12];

  v53.receiver = self;
  v53.super_class = (Class)NavSecondarySignViewController;
  -[NavSecondarySignViewController viewDidLoad](&v53, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setMasksToBounds:", 1);

  v5 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("ImageContainerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", v5);

  v7 = -[GuidanceManeuverView initWithFrame:textureProvider:]([GuidanceManeuverView alloc], "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  guidanceManeuverView = self->_guidanceManeuverView;
  self->_guidanceManeuverView = v7;

  -[GuidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:](self->_guidanceManeuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GuidanceManeuverView setFraming:](self->_guidanceManeuverView, "setFraming:", 1);
  -[GuidanceManeuverView setAlpha:](self->_guidanceManeuverView, "setAlpha:", 0.800000012);
  -[UIView addSubview:](v5, "addSubview:", self->_guidanceManeuverView);
  v9 = objc_opt_new(UILabel);
  primaryTextLabel = self->_primaryTextLabel;
  self->_primaryTextLabel = v9;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_primaryTextLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryTextLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  objc_msgSend(v11, "addSubview:", self->_primaryTextLabel);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v54[0] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v54[1] = v45;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v54[2] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5, "widthAnchor"));
  -[RouteStepListMetrics imageAreaWidth](self->_metrics, "imageAreaWidth");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:"));
  v54[3] = v39;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerXAnchor](self->_guidanceManeuverView, "centerXAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v5, "centerXAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v54[4] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerYAnchor](self->_guidanceManeuverView, "centerYAnchor"));
  v38 = v5;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v5, "centerYAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v54[5] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](self->_guidanceManeuverView, "widthAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", 36.0));
  v54[6] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](self->_guidanceManeuverView, "heightAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", 36.0));
  v54[7] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryTextLabel, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v54[8] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_primaryTextLabel, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  -[RouteStepListMetrics textTrailingMargin](self->_metrics, "textTrailingMargin");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, -v12));
  v54[9] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_primaryTextLabel, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  v54[10] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 52.0));
  v54[11] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 12));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  -[NavSecondarySignViewController _insertBackgroundView](self, "_insertBackgroundView");
}

- (MUBlurView)backgroundView
{
  MUBlurView *backgroundView;
  MUBlurView *v4;
  MUBlurView *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = (MUBlurView *)objc_msgSend(objc_alloc((Class)MUBlurView), "initWithBlurEffectStyle:", 19);
    v5 = self->_backgroundView;
    self->_backgroundView = v4;

    v6 = sub_1006E6768();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[MUBlurView setNonBlurredColor:](self->_backgroundView, "setNonBlurredColor:", v7);

    -[MUBlurView setBlurGroupName:](self->_backgroundView, "setBlurGroupName:", CFSTR("NavSignBlur"));
    v8 = sub_1006E67DC();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[MUBlurView setOverlayColor:](self->_backgroundView, "setOverlayColor:", v9);

    -[MUBlurView setStyle:](self->_backgroundView, "setStyle:", 2);
    -[MUBlurView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (void)_insertBackgroundView
{
  MUBlurView *backgroundView;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[MUBlurView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "insertSubview:atIndex:", v5, 0);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController backgroundView](self, "backgroundView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController view](self, "view"));
  LODWORD(v7) = 1148846080;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_constraintsEqualToEdgesOfView:priority:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavSecondarySignViewController;
  v4 = a3;
  -[NavSecondarySignViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController traitCollection](self, "traitCollection"));
  v6 = sub_1002A8A0C(v4, v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "isLuminanceReduced");

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10096C718;
    v9[3] = &unk_1011ACE58;
    v10 = (char)v8;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:animations:](UIView, "_maps_animateForAndromeda:animations:", v8, v9);
  }
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  MNGuidanceSignDescription *latestPrimarySign;
  id v15;
  MNGuidanceSignDescription *latestSecondarySign;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));

  if (!self->_isShowingMidstepLaneGuidance)
  {
    v10 = 0;
LABEL_8:
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueID"));
    v13 = (void *)v12;
    if (v12 | (uint64_t)self->_drawnSecondarySignID)
      v11 = objc_msgSend((id)v12, "isEqual:") ^ 1;
    else
      v11 = 0;

    goto LABEL_12;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  v9 = (void *)v8;
  if (v8 | (uint64_t)self->_drawnPrimarySignID)
    v10 = objc_msgSend((id)v8, "isEqual:") ^ 1;
  else
    v10 = 0;

  if (!self->_isShowingMidstepLaneGuidance)
    goto LABEL_8;
  v11 = 0;
LABEL_12:
  latestPrimarySign = self->_latestPrimarySign;
  self->_latestPrimarySign = (MNGuidanceSignDescription *)v6;
  v15 = v6;

  latestSecondarySign = self->_latestSecondarySign;
  self->_latestSecondarySign = (MNGuidanceSignDescription *)v7;

  if ((v10 & 1) != 0 || v11)
    -[NavSecondarySignViewController _updateSign](self, "_updateSign");
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  int isShowingMidstepLaneGuidance;
  unsigned int v6;

  isShowingMidstepLaneGuidance = self->_isShowingMidstepLaneGuidance;
  v6 = objc_msgSend(a4, "isForManeuver", a3);
  self->_isShowingMidstepLaneGuidance = v6 ^ 1;
  if (isShowingMidstepLaneGuidance != (v6 ^ 1))
    -[NavSecondarySignViewController _updateSign](self, "_updateSign");
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  _BOOL4 isShowingMidstepLaneGuidance;

  isShowingMidstepLaneGuidance = self->_isShowingMidstepLaneGuidance;
  self->_isShowingMidstepLaneGuidance = 0;
  if (isShowingMidstepLaneGuidance)
    -[NavSecondarySignViewController _updateSign](self, "_updateSign", a3, a4);
}

- (id)_currentSign
{
  uint64_t v2;

  v2 = 7;
  if (!self->_isShowingMidstepLaneGuidance)
    v2 = 8;
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___NavSecondarySignViewController__metrics[v2]));
}

- (void)_updateSign
{
  NSUUID *v3;
  NSUUID *drawnPrimarySignID;
  NSUUID *v5;
  NSUUID *drawnSecondarySignID;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  GuidanceManeuverArtwork *v30;
  id v31;
  id v32;
  void *v33;
  GuidanceManeuverArtwork *v34;
  RouteStepListMetrics *metrics;
  GuidanceManeuverView *guidanceManeuverView;
  RouteStepListMetrics *v37;
  GuidanceManeuverView *v38;
  void *v39;
  void *v40;
  _BYTE v41[496];
  _OWORD v42[31];
  _BYTE __dst[496];
  _OWORD __src[31];
  _QWORD v45[3];
  _QWORD v46[3];

  v3 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[MNGuidanceSignDescription uniqueID](self->_latestPrimarySign, "uniqueID"));
  drawnPrimarySignID = self->_drawnPrimarySignID;
  self->_drawnPrimarySignID = v3;

  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[MNGuidanceSignDescription uniqueID](self->_latestSecondarySign, "uniqueID"));
  drawnSecondarySignID = self->_drawnSecondarySignID;
  self->_drawnSecondarySignID = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController _currentSign](self, "_currentSign"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "secondaryStrings"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = objc_alloc((Class)MKServerFormattedString);
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "secondaryStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v14 = objc_msgSend(v11, "initWithComposedString:", v13);
    }
    else
    {
      v15 = objc_alloc((Class)MKServerFormattedStringParameters);
      v16 = objc_msgSend(v8, "distanceDetailLevel");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "variableOverrides"));
      v12 = objc_msgSend(v15, "initWithInstructionsDistanceDetailLevel:variableOverrides:", v16, v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "details"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

      v14 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithGeoServerString:parameters:", v13, v12);
    }
    v19 = v14;

    -[RouteStepListMetrics displayedAsSecondaryFontPointSize](self->_metrics, "displayedAsSecondaryFontPointSize");
    v21 = v20;
    -[RouteStepListMetrics displayedAsSecondaryFontWeight](self->_metrics, "displayedAsSecondaryFontWeight");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v21, v22));
    v45[0] = NSForegroundColorAttributeName;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListMetrics displayedAsSecondaryTextColor](self->_metrics, "displayedAsSecondaryTextColor"));
    v46[0] = v24;
    v46[1] = v23;
    v45[1] = NSFontAttributeName;
    v45[2] = MKServerFormattedStringArtworkSizeAttributeKey;
    v46[2] = &off_10126FCD0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 3));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "multiPartAttributedStringWithAttributes:", v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "attributedString"));
    -[UILabel setAttributedText:](self->_primaryTextLabel, "setAttributedText:", v27);

  }
  else
  {
    -[UILabel setText:](self->_primaryTextLabel, "setText:", 0);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavSecondarySignViewController _effectiveJunctionForSign:](self, "_effectiveJunctionForSign:", v8));
  if (objc_msgSend(v28, "numElements"))
    v29 = objc_msgSend(objc_alloc((Class)MKJunction), "initWithJunction:", v28);
  else
    v29 = 0;
  v30 = [GuidanceManeuverArtwork alloc];
  v31 = objc_msgSend(v28, "maneuverType");
  v32 = objc_msgSend(v28, "drivingSide");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "artworkOverride"));
  v34 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v30, "initWithManeuver:junction:drivingSide:artworkDataSource:", v31, v29, v32, v33);
  -[GuidanceManeuverView setManeuverArtwork:](self->_guidanceManeuverView, "setManeuverArtwork:", v34);

  metrics = self->_metrics;
  if (metrics)
    -[RouteStepListMetrics secondaryArrowMetrics](metrics, "secondaryArrowMetrics");
  else
    memset(__src, 0, sizeof(__src));
  guidanceManeuverView = self->_guidanceManeuverView;
  memcpy(__dst, __src, sizeof(__dst));
  -[GuidanceManeuverView setArrowMetrics:](guidanceManeuverView, "setArrowMetrics:", __dst);
  v37 = self->_metrics;
  if (v37)
    -[RouteStepListMetrics secondaryJunctionArrowMetrics](v37, "secondaryJunctionArrowMetrics");
  else
    memset(v42, 0, sizeof(v42));
  v38 = self->_guidanceManeuverView;
  memcpy(v41, v42, sizeof(v41));
  -[GuidanceManeuverView setJunctionArrowMetrics:](v38, "setJunctionArrowMetrics:", v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListMetrics arrowColor](self->_metrics, "arrowColor"));
  -[GuidanceManeuverView setArrowColor:](self->_guidanceManeuverView, "setArrowColor:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListMetrics arrowAccentColor](self->_metrics, "arrowAccentColor"));
  -[GuidanceManeuverView setAccentColor:](self->_guidanceManeuverView, "setAccentColor:", v40);

}

- (id)_effectiveJunctionForSign:(id)a3
{
  MNGuidanceSignDescription *v4;
  MNGuidanceSignDescription *latestPrimarySign;
  void *v6;
  unsigned int v7;
  BOOL v8;
  void *v9;
  unsigned int v10;
  void *v11;

  v4 = (MNGuidanceSignDescription *)a3;
  latestPrimarySign = self->_latestPrimarySign;
  if (latestPrimarySign
    && ((v6 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceSignDescription junction](latestPrimarySign, "junction")),
         v7 = objc_msgSend(v6, "maneuverType"),
         v6,
         self->_latestSecondarySign == v4)
      ? (v8 = v7 - 85 > 1)
      : (v8 = 1),
        !v8
     && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceSignDescription junction](v4, "junction")),
         v10 = objc_msgSend(v9, "maneuverType"),
         v9,
         v10 == v7)))
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceSignDescription junction](v4, "junction"));
  }

  return v11;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_drawnSecondarySignID, 0);
  objc_storeStrong((id *)&self->_drawnPrimarySignID, 0);
  objc_storeStrong((id *)&self->_latestSecondarySign, 0);
  objc_storeStrong((id *)&self->_latestPrimarySign, 0);
  objc_storeStrong((id *)&self->_guidanceManeuverView, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
