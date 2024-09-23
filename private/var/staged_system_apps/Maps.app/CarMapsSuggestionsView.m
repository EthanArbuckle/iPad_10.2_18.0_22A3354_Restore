@implementation CarMapsSuggestionsView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarMapsSuggestionsView)init
{
  double y;
  double width;
  double height;
  CarMapsSuggestionsView *v5;
  double v6;
  CarMapsSuggestionsView *v7;
  void *v8;
  BOOL v9;
  CarETAOnlyGuidanceSign *v10;
  CarETAOnlyGuidanceSign *etaOnlyView;
  UILabel *v12;
  UILabel *selectLabel;
  void *v14;
  void *v15;
  double v16;
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
  void *v28;
  objc_super v29;
  _QWORD v30[3];

  v29.receiver = self;
  v29.super_class = (Class)CarMapsSuggestionsView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v5 = -[CarMapsSuggestionsView initWithFrame:](&v29, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1144750080;
    -[CarMapsSuggestionsView setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 1, v6);
    v7->_routeIsNavigable = 1;
    v7->_showSelectLabel = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v7->_navigationAidedDrivingEnabled = objc_msgSend(v8, "isNavigationAidedDrivingEnabled");

    v9 = !v7->_navigationAidedDrivingEnabled;
    v7->_lastLayoutConfig.showSelectLabel = !v7->_showSelectLabel;
    v7->_lastLayoutConfig.navigationAidedDrivingEnabled = v9;
    v7->_lastLayoutConfig.suggestionKey = 0;
    v10 = -[CarETAOnlyGuidanceSign initWithFrame:]([CarETAOnlyGuidanceSign alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    etaOnlyView = v7->_etaOnlyView;
    v7->_etaOnlyView = v10;

    -[CarETAOnlyGuidanceSign setTranslatesAutoresizingMaskIntoConstraints:](v7->_etaOnlyView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarMapsSuggestionsView addSubview:](v7, "addSubview:", v7->_etaOnlyView);
    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    selectLabel = v7->_selectLabel;
    v7->_selectLabel = v12;

    -[UILabel setLineBreakMode:](v7->_selectLabel, "setLineBreakMode:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemTertiaryColor](UIColor, "_carSystemTertiaryColor"));
    -[UILabel setTextColor:](v7->_selectLabel, "setTextColor:", v14);

    -[UILabel setNumberOfLines:](v7->_selectLabel, "setNumberOfLines:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
    -[UILabel setFont:](v7->_selectLabel, "setFont:", v15);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_selectLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v7->_selectLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign topAnchor](v7->_etaOnlyView, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView topAnchor](v7, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v17));
    v30[0] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign leadingAnchor](v7->_etaOnlyView, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView leadingAnchor](v7, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    v30[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign trailingAnchor](v7->_etaOnlyView, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView trailingAnchor](v7, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    v30[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

    -[CarMapsSuggestionsView _updateViewLayout](v7, "_updateViewLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v7, "_externalDeviceUpdated:", CFSTR("MapsExternalDeviceUpdated"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarMapsSuggestionsView;
  -[CarMapsSuggestionsView dealloc](&v4, "dealloc");
}

- (void)_externalDeviceUpdated:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance", a3));
  -[CarMapsSuggestionsView setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", objc_msgSend(v4, "isNavigationAidedDrivingEnabled"));

}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    -[CarMapsSuggestionsView _setNeedsViewLayout](self, "_setNeedsViewLayout");
  }
}

- (void)_setNeedsViewLayout
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v3 = -[CarMapsSuggestionsView _needsViewLayout](self, "_needsViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView layoutUpdateTimer](self, "layoutUpdateTimer"));

  if (v3)
  {
    if (!v4)
    {
      objc_initWeak(&location, self);
      v7 = _NSConcreteStackBlock;
      v8 = 3221225472;
      v9 = sub_100C7B1E0;
      v10 = &unk_1011ADF20;
      objc_copyWeak(&v11, &location);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v7, 0.0));
      -[CarMapsSuggestionsView setLayoutUpdateTimer:](self, "setLayoutUpdateTimer:", v5, v7, v8, v9, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView layoutUpdateTimer](self, "layoutUpdateTimer"));
    objc_msgSend(v6, "invalidate");

    -[CarMapsSuggestionsView setLayoutUpdateTimer:](self, "setLayoutUpdateTimer:", 0);
  }
}

- (BOOL)_needsViewLayout
{
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  _BOOL4 v7;

  v3 = -[CarMapsSuggestionsView suggestionKey](self, "suggestionKey");
  -[CarMapsSuggestionsView lastLayoutConfig](self, "lastLayoutConfig");
  if (v3 != v4
    || (v5 = -[CarMapsSuggestionsView showSelectLabel](self, "showSelectLabel"),
        v5 == (((unint64_t)-[CarMapsSuggestionsView lastLayoutConfig](self, "lastLayoutConfig") & 1) == 0)))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v6 = -[CarMapsSuggestionsView navigationAidedDrivingEnabled](self, "navigationAidedDrivingEnabled");
    return v6 ^ ((unint64_t)-[CarMapsSuggestionsView lastLayoutConfig](self, "lastLayoutConfig") >> 8) & 1;
  }
  return v7;
}

- (void)_updateViewLayout
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView layoutUpdateTimer](self, "layoutUpdateTimer"));
  objc_msgSend(v3, "invalidate");

  -[CarMapsSuggestionsView setLayoutUpdateTimer:](self, "setLayoutUpdateTimer:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView currentConstraints](self, "currentConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

  v28 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
  objc_msgSend(v5, "removeFromSuperview");

  if (-[CarMapsSuggestionsView showSelectLabel](self, "showSelectLabel"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
    -[CarMapsSuggestionsView addSubview:](self, "addSubview:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstBaselineAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastBaselineAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 18.0));
    -[NSMutableArray addObject:](v28, "addObject:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView leadingAnchor](self, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 10.0));
    -[NSMutableArray addObject:](v28, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView trailingAnchor](self, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -10.0));
    -[NSMutableArray addObject:](v28, "addObject:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastBaselineAnchor"));
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  }
  v22 = (void *)v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView bottomAnchor](self, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -10.0));
  -[NSMutableArray addObject:](v28, "addObject:", v24);

  -[CarMapsSuggestionsView setCurrentConstraints:](self, "setCurrentConstraints:", v28);
  v25 = -[CarMapsSuggestionsView showSelectLabel](self, "showSelectLabel");
  LODWORD(v22) = -[CarMapsSuggestionsView navigationAidedDrivingEnabled](self, "navigationAidedDrivingEnabled");
  v26 = -[CarMapsSuggestionsView suggestionKey](self, "suggestionKey");
  v27 = 256;
  if (!(_DWORD)v22)
    v27 = 0;
  -[CarMapsSuggestionsView setLastLayoutConfig:](self, "setLastLayoutConfig:", v27 | v25, v26);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (void)_updateContents
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  const __CFString *v23;
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
  id v35;
  id v36;

  v4 = 16;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
  v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsResumeRouteDefaultTitle")));

  v6 = v36;
  if (!v36)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
  objc_msgSend(v7, "setTitle:", v6);

  if (!v36)
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry route](self->_currentSuggestion, "route"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "legs"));
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry route](self->_currentSuggestion, "route"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "legs"));
    v11 = (char *)objc_msgSend(v2, "count") - 1;
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
  objc_msgSend(v12, "setNumberOfStops:", v11);

  if (v10)
  {

  }
  v13 = -[CarMapsSuggestionsView routeIsNavigable](self, "routeIsNavigable");
  if (v13)
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView currentETA](self, "currentETA"));
  else
    v14 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
  objc_msgSend(v15, "setLatestETA:", v14);

  if (v13)
  if (-[CarMapsSuggestionsView routeIsNavigable](self, "routeIsNavigable"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
    objc_msgSend(v16, "setSubtitleOverride:", 0);
  }
  else
  {
    v17 = CarDisplayDirectionsNotAvailableErrorTitle();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
    objc_msgSend(v18, "setSubtitleOverride:", v16);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v20 = objc_msgSend(v19, "supportsTouchInteractionModel");

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = v21;
  if (v20)
    v23 = CFSTR("CAR_PROACTIVE_TAP");
  else
    v23 = CFSTR("CAR_PROACTIVE_SELECT");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v23, CFSTR("localized string not found"), 0));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
  objc_msgSend(v25, "setText:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView etaOnlyView](self, "etaOnlyView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "title"));
    objc_msgSend(v26, "addObject:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "text"));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView selectLabel](self, "selectLabel"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "text"));
    objc_msgSend(v26, "addObject:", v34);

  }
  v35 = objc_msgSend(v26, "copy");
  -[CarMapsSuggestionsView setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", v35);

}

- (void)setShowSelectLabel:(BOOL)a3
{
  if (self->_showSelectLabel != a3)
  {
    self->_showSelectLabel = a3;
    if (a3)
      -[CarMapsSuggestionsView startHideSelectLabelTimer](self, "startHideSelectLabelTimer");
    else
      -[CarMapsSuggestionsView stopHideSelectLabelTimer](self, "stopHideSelectLabelTimer");
    -[CarMapsSuggestionsView _setNeedsViewLayout](self, "_setNeedsViewLayout");
  }
}

- (void)setCurrentSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MapsSuggestionsRouteGeniusEntry *currentSuggestion;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  -[CarMapsSuggestionsView setSuggestionKey:](self, "setSuggestionKey:", (char *)-[CarMapsSuggestionsView suggestionKey](self, "suggestionKey") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
    -[CarMapsSuggestionsView setRouteIsNavigable:](self, "setRouteIsNavigable:", objc_msgSend(v6, "isNavigable"));

  }
  else
  {
    -[CarMapsSuggestionsView setRouteIsNavigable:](self, "setRouteIsNavigable:", 0);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));

  currentSuggestion = self->_currentSuggestion;
  self->_currentSuggestion = (MapsSuggestionsRouteGeniusEntry *)v4;
  v9 = v4;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoMapItem"));

  -[CarMapsSuggestionsView _updateContents](self, "_updateContents");
  if (!-[CarMapsSuggestionsView showSelectLabel](self, "showSelectLabel"))
  {
    v12 = 1;
    if (v13 && v11)
      v12 = GEOMapItemIsEqualToMapItemForPurpose(v13, v11, 1) ^ 1;
    -[CarMapsSuggestionsView setShowSelectLabel:](self, "setShowSelectLabel:", v12);
  }
  -[CarMapsSuggestionsView _setNeedsViewLayout](self, "_setNeedsViewLayout");

}

- (void)setCurrentETA:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(v9, "remainingMinutes");
  if (v5 != (id)-[GuidanceETA remainingMinutes](self->_currentETA, "remainingMinutes")
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "etaDate")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA etaDate](self->_currentETA, "etaDate")),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_currentETA, a3);
    -[CarMapsSuggestionsView _updateContents](self, "_updateContents");
  }

}

- (void)startHideSelectLabelTimer
{
  id v3;

  -[CarMapsSuggestionsView stopHideSelectLabelTimer](self, "stopHideSelectLabelTimer");
  if (GEOConfigGetDouble(MapsConfig_CarRouteGeniusSelectHideTimeInterval, off_1014B2F18) > 0.0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_hideSelectLabel", 0, 0));
    -[CarMapsSuggestionsView setHideSelectLabelTimer:](self, "setHideSelectLabelTimer:", v3);

  }
}

- (void)stopHideSelectLabelTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsView hideSelectLabelTimer](self, "hideSelectLabelTimer"));
  objc_msgSend(v3, "invalidate");

  -[CarMapsSuggestionsView setHideSelectLabelTimer:](self, "setHideSelectLabelTimer:", 0);
}

- (void)_hideSelectLabel
{
  -[CarMapsSuggestionsView stopHideSelectLabelTimer](self, "stopHideSelectLabelTimer");
  -[CarMapsSuggestionsView setShowSelectLabel:](self, "setShowSelectLabel:", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarMapsSuggestionsView;
  return UIAccessibilityTraitButton | -[CarMapsSuggestionsView accessibilityTraits](&v3, "accessibilityTraits");
}

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  return self->_currentSuggestion;
}

- (GuidanceETA)currentETA
{
  return self->_currentETA;
}

- (CarETAOnlyGuidanceSign)etaOnlyView
{
  return (CarETAOnlyGuidanceSign *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEtaOnlyView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UILabel)selectLabel
{
  return (UILabel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSelectLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)currentConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSTimer)hideSelectLabelTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHideSelectLabelTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSTimer)layoutUpdateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLayoutUpdateTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- ($65C3FA8A572F9D8A414E710B16373297)lastLayoutConfig
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];
  $65C3FA8A572F9D8A414E710B16373297 result;

  objc_copyStruct(v4, &self->_lastLayoutConfig, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var2 = v3;
  result.var0 = v2;
  result.var1 = BYTE1(v2);
  return result;
}

- (void)setLastLayoutConfig:(id)a3
{
  $65C3FA8A572F9D8A414E710B16373297 v3;

  v3 = a3;
  objc_copyStruct(&self->_lastLayoutConfig, &v3, 16, 1, 0);
}

- (unint64_t)suggestionKey
{
  return self->_suggestionKey;
}

- (void)setSuggestionKey:(unint64_t)a3
{
  self->_suggestionKey = a3;
}

- (BOOL)showSelectLabel
{
  return self->_showSelectLabel;
}

- (BOOL)navigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (BOOL)routeIsNavigable
{
  return self->_routeIsNavigable;
}

- (void)setRouteIsNavigable:(BOOL)a3
{
  self->_routeIsNavigable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutUpdateTimer, 0);
  objc_storeStrong((id *)&self->_hideSelectLabelTimer, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_selectLabel, 0);
  objc_storeStrong((id *)&self->_etaOnlyView, 0);
  objc_storeStrong((id *)&self->_currentETA, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
}

@end
