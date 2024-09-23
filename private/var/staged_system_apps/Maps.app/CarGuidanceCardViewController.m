@implementation CarGuidanceCardViewController

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_signSelectionTimer, "invalidate");
  -[NSTimer invalidate](self->_reloadTimer, "invalidate");
  -[NSTimer invalidate](self->_junctionViewRestoreTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CarGuidanceCardViewController;
  -[CarGuidanceCardViewController dealloc](&v3, "dealloc");
}

- (CarGuidanceCardViewController)initWithDestination:(unint64_t)a3 guidanceCardSizeProvider:(id)a4 interactionDelegate:(id)a5
{
  id v8;
  id v9;
  CarGuidanceCardViewController *v10;
  CarGuidanceCardViewController *v11;
  void *v12;
  CarDynamicBlurView *v13;
  CarDynamicBlurView *dynamicBlurView;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CarGuidanceCardViewController;
  v10 = -[CarGuidanceCardViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v11 = v10;
  if (v10)
  {
    v10->_destination = a3;
    objc_storeWeak((id *)&v10->_guidanceCardSizeProvider, v8);
    objc_storeWeak((id *)&v11->_interactionDelegate, v9);
    if (!a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v11->_navigationGuidanceSignStyle = (int64_t)objc_msgSend(v12, "integerForKey:", CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"));

    }
    v13 = -[CarDynamicBlurView initWithBlurViewContext:delegate:]([CarDynamicBlurView alloc], "initWithBlurViewContext:delegate:", 1, v11);
    dynamicBlurView = v11->_dynamicBlurView;
    v11->_dynamicBlurView = v13;

  }
  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarGuidanceCardViewController;
  -[CarGuidanceCardViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController view](self, "view"));
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("CarGuidanceCardView"));

  self->_loggedManeuverStep = 0x7FFFFFFFFFFFFFFFLL;
  -[CarGuidanceCardViewController _updateCardState](self, "_updateCardState");
  -[CarGuidanceCardViewController _swapDisplayedSignIfNeeded](self, "_swapDisplayedSignIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarGuidanceCardViewController;
  -[CarGuidanceCardViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[CarGuidanceCardViewController _updateSignLayout](self, "_updateSignLayout");
}

- (NSUUID)proceedToRouteSignID
{
  NSUUID *proceedToRouteSignID;
  NSUUID *v4;
  NSUUID *v5;

  proceedToRouteSignID = self->_proceedToRouteSignID;
  if (!proceedToRouteSignID)
  {
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v5 = self->_proceedToRouteSignID;
    self->_proceedToRouteSignID = v4;

    proceedToRouteSignID = self->_proceedToRouteSignID;
  }
  return proceedToRouteSignID;
}

- (void)setCurrentSign:(id)a3
{
  CarGuidanceCard *v5;
  CarGuidanceCard **p_currentSign;
  CarGuidanceCard *currentSign;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  CarGuidanceCard *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CarGuidanceCard *v24;

  v5 = (CarGuidanceCard *)a3;
  p_currentSign = &self->_currentSign;
  currentSign = self->_currentSign;
  if (currentSign != v5)
  {
    v24 = v5;
    -[CarGuidanceCard removeFromSuperview](currentSign, "removeFromSuperview");
    objc_storeStrong((id *)&self->_currentSign, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", *p_currentSign);

    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 5);
    if ((objc_opt_respondsToSelector(v24, "minimumCompressedContentLayoutGuide") & 1) == 0)
      goto LABEL_8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCard minimumCompressedContentLayoutGuide](v24, "minimumCompressedContentLayoutGuide"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController view](self, "view"));
    objc_msgSend(v14, "_car_dynamicPointScaleValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:multiplier:", v13));
    objc_msgSend(v9, "addObject:", v15);

    if (v10)
    {
      if (self->_destination == 2)
        v16 = 1000.0;
      else
        v16 = 750.0;

    }
    else
    {
LABEL_8:
      v16 = 1000.0;
    }
    v17 = *p_currentSign;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController view](self, "view"));
    LODWORD(v19) = 1148846080;
    *(float *)&v20 = v16;
    LODWORD(v21) = 1148846080;
    LODWORD(v22) = 1148846080;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCard _maps_constraintsForCenteringInView:priorities:](v17, "_maps_constraintsForCenteringInView:priorities:", v18, v19, v20, v21, v22));
    objc_msgSend(v9, "addObjectsFromArray:", v23);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);
    v5 = v24;
  }

}

- (CarNavigationGuidanceSign)fullGuidanceSign
{
  CarNavigationGuidanceSign *fullGuidanceSign;
  CarNavigationGuidanceSign *v4;
  CarNavigationGuidanceSign *v5;

  fullGuidanceSign = self->_fullGuidanceSign;
  if (!fullGuidanceSign)
  {
    v4 = -[CarNavigationGuidanceSign initWithDestination:]([CarNavigationGuidanceSign alloc], "initWithDestination:", -[CarGuidanceCardViewController destination](self, "destination"));
    v5 = self->_fullGuidanceSign;
    self->_fullGuidanceSign = v4;

    -[CarNavigationGuidanceSign setSizeProvider:](self->_fullGuidanceSign, "setSizeProvider:", self);
    -[CarNavigationGuidanceSign setTranslatesAutoresizingMaskIntoConstraints:](self->_fullGuidanceSign, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarNavigationGuidanceSign setSignStyle:](self->_fullGuidanceSign, "setSignStyle:", 0);
    fullGuidanceSign = self->_fullGuidanceSign;
  }
  return fullGuidanceSign;
}

- (CarNavigationGuidanceSign)miniGuidanceSign
{
  CarNavigationGuidanceSign *miniGuidanceSign;
  CarNavigationGuidanceSign *v4;
  CarNavigationGuidanceSign *v5;

  miniGuidanceSign = self->_miniGuidanceSign;
  if (!miniGuidanceSign)
  {
    v4 = -[CarNavigationGuidanceSign initWithDestination:]([CarNavigationGuidanceSign alloc], "initWithDestination:", -[CarGuidanceCardViewController destination](self, "destination"));
    v5 = self->_miniGuidanceSign;
    self->_miniGuidanceSign = v4;

    -[CarNavigationGuidanceSign setSizeProvider:](self->_miniGuidanceSign, "setSizeProvider:", self);
    -[CarNavigationGuidanceSign setTranslatesAutoresizingMaskIntoConstraints:](self->_miniGuidanceSign, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarNavigationGuidanceSign setSignStyle:](self->_miniGuidanceSign, "setSignStyle:", 1);
    miniGuidanceSign = self->_miniGuidanceSign;
  }
  return miniGuidanceSign;
}

- (CarArrivedGuidanceSign)arrivalOverlaySign
{
  CarArrivedGuidanceSign *arrivalOverlaySign;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CarArrivedGuidanceSign *v9;
  CarArrivedGuidanceSign *v10;

  arrivalOverlaySign = self->_arrivalOverlaySign;
  if (!arrivalOverlaySign)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navDisplayName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mkServerFormattedString"));

    v9 = -[CarArrivedGuidanceSign initWithDestination:]([CarArrivedGuidanceSign alloc], "initWithDestination:", -[CarGuidanceCardViewController destination](self, "destination"));
    v10 = self->_arrivalOverlaySign;
    self->_arrivalOverlaySign = v9;

    -[CarArrivedGuidanceSign setTranslatesAutoresizingMaskIntoConstraints:](self->_arrivalOverlaySign, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarArrivedGuidanceSign setFormattedDestination:](self->_arrivalOverlaySign, "setFormattedDestination:", v8);
    -[CarArrivedGuidanceSign setSizeProvider:](self->_arrivalOverlaySign, "setSizeProvider:", self);

    arrivalOverlaySign = self->_arrivalOverlaySign;
  }
  return arrivalOverlaySign;
}

- (CarReroutingGuidanceSign)reroutingOverlaySign
{
  CarReroutingGuidanceSign *reroutingOverlaySign;
  CarReroutingGuidanceSign *v4;
  CarReroutingGuidanceSign *v5;

  reroutingOverlaySign = self->_reroutingOverlaySign;
  if (!reroutingOverlaySign)
  {
    v4 = -[CarReroutingGuidanceSign initWithDestination:]([CarReroutingGuidanceSign alloc], "initWithDestination:", -[CarGuidanceCardViewController destination](self, "destination"));
    v5 = self->_reroutingOverlaySign;
    self->_reroutingOverlaySign = v4;

    -[CarReroutingGuidanceSign setTranslatesAutoresizingMaskIntoConstraints:](self->_reroutingOverlaySign, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarSpinnerGuidanceSign setSizeProvider:](self->_reroutingOverlaySign, "setSizeProvider:", self);
    reroutingOverlaySign = self->_reroutingOverlaySign;
  }
  return reroutingOverlaySign;
}

- (CarLoadingGuidanceSign)loadingOverlaySign
{
  CarLoadingGuidanceSign *loadingOverlaySign;
  CarLoadingGuidanceSign *v4;
  CarLoadingGuidanceSign *v5;

  loadingOverlaySign = self->_loadingOverlaySign;
  if (!loadingOverlaySign)
  {
    v4 = -[CarLoadingGuidanceSign initWithDestination:]([CarLoadingGuidanceSign alloc], "initWithDestination:", -[CarGuidanceCardViewController destination](self, "destination"));
    v5 = self->_loadingOverlaySign;
    self->_loadingOverlaySign = v4;

    -[CarLoadingGuidanceSign setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingOverlaySign, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarSpinnerGuidanceSign setSizeProvider:](self->_loadingOverlaySign, "setSizeProvider:", self);
    loadingOverlaySign = self->_loadingOverlaySign;
  }
  return loadingOverlaySign;
}

- (void)setNavigationGuidanceSignStyle:(int64_t)a3
{
  -[CarGuidanceCardViewController setNavigationGuidanceSignStyle:userInitiated:](self, "setNavigationGuidanceSignStyle:userInitiated:", a3, 0);
}

- (void)setNavigationGuidanceSignStyle:(int64_t)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  if (self->_navigationGuidanceSignStyle != a3)
  {
    v4 = a4;
    self->_navigationGuidanceSignStyle = a3;
    -[CarGuidanceCardViewController _updateCardState](self, "_updateCardState");
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController interactionDelegate](self, "interactionDelegate"));
    objc_msgSend(v7, "guidanceCardController:didChangeGuidanceSignStyle:userInitiated:", self, a3, v4);

  }
}

- (void)_updateCardState
{
  unint64_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  CarGuidanceCardViewController *v8;
  CarGuidanceCardViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  unint64_t cardState;
  const __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  int64_t navigationGuidanceSignStyle;
  const __CFString *v28;
  CarGuidanceCardViewController *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  char *v35;
  int64_t v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  char *v41;
  id v42;
  NSObject *v43;
  CarGuidanceCardViewController *v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  char *v50;
  const char *v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  __CFString *v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  const __CFString *v66;

  v3 = -[CarGuidanceCardViewController arrivalState](self, "arrivalState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v5 = objc_msgSend(v4, "state");

  v6 = sub_10043356C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    goto LABEL_30;
  v52 = v5;
  v8 = self;
  v9 = v8;
  if (!v8)
  {
    v15 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v10 = (objc_class *)objc_opt_class(v8);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
    v14 = v13;
    if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
    {
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

      goto LABEL_8;
    }

  }
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

LABEL_10:
  v16 = v15;
  cardState = v9->_cardState;
  if (cardState > 4)
    v18 = CFSTR(".Unknown");
  else
    v18 = *(&off_1011AF538 + cardState);
  v51 = (const char *)v18;
  if (v3 == 5)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = v19;
  if (v9->_isRerouting)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v22 = v21;
  if (v9->_hasGuidance)
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  v24 = v23;
  if (v5)
    v25 = CFSTR("NO");
  else
    v25 = CFSTR("YES");
  v26 = v25;
  navigationGuidanceSignStyle = v9->_navigationGuidanceSignStyle;
  if (navigationGuidanceSignStyle)
  {
    if (navigationGuidanceSignStyle == 1)
    {
      v28 = CFSTR(".Mini");
    }
    else
    {
      v31 = sub_1004318FC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v54 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
        v55 = 2080;
        v56 = "CarNavigationGuidanceSign.h";
        v57 = 1024;
        LODWORD(v58) = 36;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v33 = sub_1004318FC();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v54 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
        v28 = CFSTR(".Unknown");
      }
      else
      {
        v28 = CFSTR(".Unknown");
      }
    }
  }
  else
  {
    v28 = CFSTR(".Default");
  }
  v5 = v52;
  *(_DWORD *)buf = 138544898;
  v54 = (const char *)v16;
  v55 = 2112;
  v56 = v51;
  v57 = 2112;
  v58 = v20;
  v59 = 2112;
  v60 = v22;
  v61 = 2112;
  v62 = v24;
  v63 = 2112;
  v64 = v26;
  v65 = 2112;
  v66 = v28;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] guidanceCardVC: _updateCardState. currentState: %@, hasArrived: %@, isRerouting: %@, hasGuidance: %@, hasNavigationStopped: %@, navSignStyle: %@", buf, 0x48u);

LABEL_30:
  if (!v5)
    return;
  if (v3 != 5)
  {
    if (self->_isRerouting)
    {
      v29 = self;
      v30 = 1;
      goto LABEL_35;
    }
    if (!self->_hasGuidance)
    {
      v29 = self;
      v30 = 0;
      goto LABEL_35;
    }
    v36 = -[CarGuidanceCardViewController navigationGuidanceSignStyle](self, "navigationGuidanceSignStyle");
    if (!v36)
    {
      v29 = self;
      v30 = 2;
      goto LABEL_35;
    }
    if (v36 == 1)
    {
      v29 = self;
      v30 = 3;
      goto LABEL_35;
    }
    v37 = sub_1004318FC();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v54 = "-[CarGuidanceCardViewController _updateCardState]";
      v55 = 2080;
      v56 = "CarGuidanceCardViewController.m";
      v57 = 1024;
      LODWORD(v58) = 319;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v39 = sub_1004318FC();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v54 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v42 = sub_10043356C();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
LABEL_64:

      return;
    }
    v44 = self;
    v45 = (objc_class *)objc_opt_class(v44);
    v46 = NSStringFromClass(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    if ((objc_opt_respondsToSelector(v44, "accessibilityIdentifier") & 1) != 0)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v44, "performSelector:", "accessibilityIdentifier"));
      v49 = v48;
      if (v48 && !objc_msgSend(v48, "isEqualToString:", v47))
      {
        v50 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v47, v44, v49));

        goto LABEL_63;
      }

    }
    v50 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v47, v44));
LABEL_63:

    *(_DWORD *)buf = 138543362;
    v54 = v50;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, "[%{public}@] Was not able to infer cardState. The guidance sign might be in an unexpected state.", buf, 0xCu);

    goto LABEL_64;
  }
  v29 = self;
  v30 = 4;
LABEL_35:
  -[CarGuidanceCardViewController setCardState:](v29, "setCardState:", v30);
}

- (void)setCardState:(unint64_t)a3
{
  -[CarGuidanceCardViewController setCardState:animated:](self, "setCardState:animated:", a3, 1);
}

- (void)setCardState:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t v4;
  id v6;
  NSObject *v7;
  CarGuidanceCardViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  unint64_t cardState;
  const __CFString *v17;
  id v18;
  NSObject *v19;
  CarGuidanceCardViewController *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NavSignManeuverGuidanceInfo *previousPrimaryGuidance;
  NavSignManeuverGuidanceInfo *previousSecondaryGuidance;
  NavSignLaneGuidanceInfo *previousLaneInfo;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;

  if (self->_cardState != a3)
  {
    v4 = a3;
    v6 = sub_10043356C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    if (v4 > 4)
      v15 = CFSTR(".Unknown");
    else
      v15 = *(&off_1011AF538 + v4);
    cardState = self->_cardState;
    if (cardState > 4)
      v17 = CFSTR(".Unknown");
    else
      v17 = *(&off_1011AF538 + cardState);
    *(_DWORD *)buf = 138544130;
    v31 = v14;
    v32 = 2112;
    v33 = v15;
    v34 = 2112;
    v35 = v17;
    v36 = 2112;
    v37 = CFSTR("NO");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] guidanceCardVC: settingCardState: %@, fromState: %@, animated: %@", buf, 0x2Au);

LABEL_15:
    self->_cardState = v4;
    if (v4 < 2)
      goto LABEL_25;
    if (!self->_previousPrimaryGuidance)
    {
LABEL_27:
      -[CarGuidanceCardViewController _swapDisplayedSignIfNeeded](self, "_swapDisplayedSignIfNeeded");
      return;
    }
    v18 = sub_10043356C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
LABEL_24:

      previousPrimaryGuidance = self->_previousPrimaryGuidance;
      self->_previousPrimaryGuidance = 0;

      previousSecondaryGuidance = self->_previousSecondaryGuidance;
      self->_previousSecondaryGuidance = 0;

      previousLaneInfo = self->_previousLaneInfo;
      self->_previousLaneInfo = 0;

      v4 = self->_cardState;
LABEL_25:
      if (v4 == 1)
        self->_loggedManeuverStep = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_27;
    }
    v20 = self;
    v21 = (objc_class *)objc_opt_class(v20);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_23;
      }

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_23:

    *(_DWORD *)buf = 138543362;
    v31 = v26;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] Clearing previously saved sign guidance", buf, 0xCu);

    goto LABEL_24;
  }
}

- (void)_swapDisplayedSignIfNeeded
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  CarGuidanceCardViewController *v9;
  CarGuidanceCardViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v3 = -[CarGuidanceCardViewController cardState](self, "cardState");
  switch(v3)
  {
    case 0uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController loadingOverlaySign](self, "loadingOverlaySign"));
      goto LABEL_8;
    case 1uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController reroutingOverlaySign](self, "reroutingOverlaySign"));
      goto LABEL_8;
    case 2uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
      goto LABEL_8;
    case 3uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController miniGuidanceSign](self, "miniGuidanceSign"));
      goto LABEL_8;
    case 4uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController arrivalOverlaySign](self, "arrivalOverlaySign"));
LABEL_8:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController currentSign](self, "currentSign"));

  if (v6 != v5)
  {
    v7 = sub_10043356C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_23:

      -[CarGuidanceCardViewController setCurrentSign:](self, "setCurrentSign:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController view](self, "view"));
      objc_msgSend(v19, "layoutIfNeeded");

      -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 0);
      goto LABEL_24;
    }
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_17;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_17:

LABEL_19:
    if (v3 > 4)
      v17 = CFSTR(".Unknown");
    else
      v17 = *(&off_1011AF538 + v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController currentSign](v10, "currentSign"));
    *(_DWORD *)buf = 138544130;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v18;
    v26 = 2112;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] _swapDisplayedSignIfNeeded: cardState=%@ currentSign=%@ newSign=%@", buf, 0x2Au);

    goto LABEL_23;
  }
LABEL_24:

}

- (void)_scheduleReloadAnimated:(BOOL)a3
{
  id v5;
  NSObject *v6;
  CarGuidanceCardViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSTimer *v16;
  NSTimer *reloadTimer;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (-[CarGuidanceCardViewController isViewLoaded](self, "isViewLoaded") && !self->_reloadTimer)
    {
      self->_reloadAnimated = a3;
      if (self->_reloading)
      {
        v5 = sub_10043356C();
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
LABEL_12:

          self->_pendingReload = 1;
          return;
        }
        v7 = self;
        v8 = (objc_class *)objc_opt_class(v7);
        v9 = NSStringFromClass(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
          v12 = v11;
          if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

            goto LABEL_11;
          }

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_11:

        *(_DWORD *)buf = 138543362;
        v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] guidanceCardVC: _scheduleReload, but there is already a pending reload", buf, 0xCu);

        goto LABEL_12;
      }
      v16 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_reload", 0, 0, 0.0));
      reloadTimer = self->_reloadTimer;
      self->_reloadTimer = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController view](self, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subviews"));
      v20 = objc_msgSend(v19, "count");

      if (!v20)
        -[NSTimer fire](self->_reloadTimer, "fire");
    }
  }
  else
  {
    v14 = sub_10043356C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "_scheduleReloadAnimated in not on the main thread!", buf, 2u);
    }

  }
}

- (void)_reload
{
  id v3;
  NSTimer *reloadTimer;
  void *v5;
  void *v6;
  _QWORD v7[5];
  char v8;
  _QWORD v9[5];

  self->_reloading = 1;
  if (self->_reloadAnimated)
    v3 = -[CarGuidanceCardViewController isViewLoaded](self, "isViewLoaded");
  else
    v3 = 0;
  -[NSTimer invalidate](self->_reloadTimer, "invalidate");
  reloadTimer = self->_reloadTimer;
  self->_reloadTimer = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", v3));
  objc_msgSend(v5, "setDuration:", 0.25);
  objc_msgSend(v5, "setOptions:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController currentSign](self, "currentSign"));
  objc_msgSend(v6, "updateWithGroupAnimation:", v5);

  if ((_DWORD)v3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10029BB2C;
    v9[3] = &unk_1011AC860;
    v9[4] = self;
    objc_msgSend(v5, "addAnimations:completion:", v9, 0);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10029BB5C;
  v7[3] = &unk_1011AF4D8;
  v7[4] = self;
  v8 = (char)v3;
  objc_msgSend(v5, "addAnimations:completion:", 0, v7);
  objc_msgSend(v5, "runWithCurrentOptions");

}

- (void)_enableSignSelection
{
  self->_handlingSignPress = 0;
}

- (void)handleUserSelectionAtPoint:(CGPoint)a3
{
  id v4;
  NSObject *v5;
  CarGuidanceCardViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  double y;
  double x;
  NSTimer *v18;
  NSTimer *signSelectionTimer;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  CarGuidanceCardViewController *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  id v32;
  _BOOL4 v33;
  CarGuidanceCardViewController *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CarGuidanceCardViewController *v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  const __CFString *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const __CFString *v52;

  if (self->_handlingSignPress)
  {
    v4 = sub_10043356C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      return;
    }
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v50 = v12;
    v13 = "[%{public}@] handleUserSelectionAtPoint: card is currently animating, ignoring tap.";
    v14 = v5;
    v15 = 12;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, buf, v15);

    goto LABEL_10;
  }
  y = a3.y;
  x = a3.x;
  self->_handlingSignPress = 1;
  v18 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_enableSignSelection", 0, 0, 0.3));
  signSelectionTimer = self->_signSelectionTimer;
  self->_signSelectionTimer = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
  v21 = objc_msgSend(v20, "isPointInJunctionView:", x, y);

  if (v21)
  {
    v22 = sub_10043356C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      -[CarGuidanceCardViewController temporarilyHideJunctionViewForSeconds:animated:](self, "temporarilyHideJunctionViewForSeconds:animated:", 1, 12.0);
      return;
    }
    v24 = self;
    v25 = (objc_class *)objc_opt_class(v24);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if ((objc_opt_respondsToSelector(v24, "accessibilityIdentifier") & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v24, "performSelector:", "accessibilityIdentifier"));
      v29 = v28;
      if (v28 && !objc_msgSend(v28, "isEqualToString:", v27))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v27, v24, v29));

        goto LABEL_18;
      }

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v27, v24));
LABEL_18:

    *(_DWORD *)buf = 138543362;
    v50 = v30;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}@] handleUserSelectionAtPoint: temporarily hiding junctionView.", buf, 0xCu);

    goto LABEL_19;
  }
  v31 = -[CarGuidanceCardViewController cardState](self, "cardState");
  v32 = sub_10043356C();
  v5 = objc_claimAutoreleasedReturnValue(v32);
  v33 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v31 >= 4)
  {
    if (!v33)
      goto LABEL_10;
    v41 = self;
    v42 = (objc_class *)objc_opt_class(v41);
    v43 = NSStringFromClass(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    if ((objc_opt_respondsToSelector(v41, "accessibilityIdentifier") & 1) != 0)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v41, "performSelector:", "accessibilityIdentifier"));
      v46 = v45;
      if (v45 && !objc_msgSend(v45, "isEqualToString:", v44))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v44, v41, v46));

        goto LABEL_35;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v44, v41));
LABEL_35:

    v47 = -[CarGuidanceCardViewController cardState](v41, "cardState");
    if (v47 > 4)
      v48 = CFSTR(".Unknown");
    else
      v48 = *(&off_1011AF538 + v47);
    *(_DWORD *)buf = 138543618;
    v50 = v12;
    v51 = 2112;
    v52 = v48;
    v13 = "[%{public}@] handleUserSelectionAtPoint: card is in a state (%@) that does not support taps. Aborting.";
    v14 = v5;
    v15 = 22;
    goto LABEL_9;
  }
  if (v33)
  {
    v34 = self;
    v35 = (objc_class *)objc_opt_class(v34);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

    *(_DWORD *)buf = 138543362;
    v50 = v40;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] handleUserSelectionAtPoint: will handle tap by updating sign style", buf, 0xCu);

  }
  -[CarGuidanceCardViewController setNavigationGuidanceSignStyle:userInitiated:](self, "setNavigationGuidanceSignStyle:userInitiated:", -[CarGuidanceCardViewController navigationGuidanceSignStyle](self, "navigationGuidanceSignStyle") == 0, 1);
}

- (void)temporarilyHideJunctionViewForSeconds:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSTimer *v8;
  NSTimer *junctionViewRestoreTimer;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  id location;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
  objc_msgSend(v7, "hideJunctionViewAnimated:", v4);

  -[NSTimer invalidate](self->_junctionViewRestoreTimer, "invalidate");
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10029C28C;
  v10[3] = &unk_1011AF500;
  objc_copyWeak(&v11, &location);
  v12 = v4;
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, a3));
  junctionViewRestoreTimer = self->_junctionViewRestoreTimer;
  self->_junctionViewRestoreTimer = v8;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)showTemporarilyHiddenJunctionViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[NSTimer invalidate](self->_junctionViewRestoreTimer, "invalidate");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
  objc_msgSend(v5, "showJunctionViewAnimated:", v3);

}

- (void)setHasGuidance:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  CarGuidanceCardViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  __CFString *v19;

  if (self->_hasGuidance != a3)
  {
    v3 = a3;
    self->_hasGuidance = a3;
    v5 = sub_10043356C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      -[CarGuidanceCardViewController _updateCardState](self, "_updateCardState");
      return;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    v14 = CFSTR("NO");
    if (v3)
      v14 = CFSTR("YES");
    v15 = v14;
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    v18 = 2112;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] setHasGuidance: %@", buf, 0x16u);

    goto LABEL_11;
  }
}

- (void)_guidanceWasUpdated
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController primaryGuidance](self, "primaryGuidance"));
  if (v4)
  {
    -[CarGuidanceCardViewController setHasGuidance:](self, "setHasGuidance:", 1);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController laneGuidanceInfo](self, "laneGuidanceInfo"));
    -[CarGuidanceCardViewController setHasGuidance:](self, "setHasGuidance:", v3 != 0);

  }
}

- (void)setPrimaryGuidance:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)&self->_primaryGuidance, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
  objc_msgSend(v6, "setPrimaryGuidance:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController miniGuidanceSign](self, "miniGuidanceSign"));
  objc_msgSend(v7, "setPrimaryGuidance:", v5);

  -[CarGuidanceCardViewController _guidanceWasUpdated](self, "_guidanceWasUpdated");
}

- (void)setSecondaryGuidance:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_secondaryGuidance, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
  objc_msgSend(v6, "setSecondaryGuidance:", v5);

}

- (void)setLaneGuidanceInfo:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
  objc_msgSend(v6, "setLaneGuidanceInfo:", v5);

  -[CarGuidanceCardViewController _guidanceWasUpdated](self, "_guidanceWasUpdated");
}

- (void)setJunctionViewInfo:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_junctionViewInfo, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
  objc_msgSend(v6, "setJunctionViewInfo:", v5);

}

- (void)showManeuverSign:(id)a3 maneuverStepIndex:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CarGuidanceCardViewController *v9;
  CarGuidanceCardViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  CarGuidanceCardViewController *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  CarGuidanceCardViewController *v37;
  CarGuidanceCardViewController *v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  CarGuidanceCardViewController *v49;
  CarGuidanceCardViewController *v50;
  objc_class *v51;
  NSString *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  __CFString *v57;
  id v58;
  CarGuidanceCardViewController *v59;
  CarGuidanceCardViewController *v60;
  objc_class *v61;
  NSString *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  NSObject *v68;
  uint32_t v69;
  void *v70;
  double v71;
  double v72;
  id v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  CarGuidanceCardViewController *v77;
  objc_class *v78;
  NSString *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  unint64_t v84;
  uint8_t buf[4];
  unint64_t v86;
  __int16 v87;
  double v88;
  __int16 v89;
  void *v90;

  v6 = a3;
  v7 = sub_10043356C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
    *(_DWORD *)buf = 138543618;
    v86 = (unint64_t)v16;
    v87 = 2112;
    v88 = *(double *)&v18;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Showing primary maneuver sign: %@", buf, 0x16u);

  }
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("MapsPPTGuidanceWillUpdateNotifcation"), self, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController primaryGuidance](self, "primaryGuidance"));
  if (v19)
  {

    goto LABEL_22;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo signID](self->_previousPrimaryGuidance, "signID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signID"));
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if (v22)
  {
    v23 = sub_10043356C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
LABEL_21:

      -[CarGuidanceCardViewController setPrimaryGuidance:](self, "setPrimaryGuidance:", self->_previousPrimaryGuidance);
      -[CarGuidanceCardViewController setSecondaryGuidance:](self, "setSecondaryGuidance:", self->_previousSecondaryGuidance);
      -[CarGuidanceCardViewController setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", self->_previousLaneInfo);
      goto LABEL_22;
    }
    v25 = self;
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_20;
      }

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_20:

    *(_DWORD *)buf = 138543362;
    v86 = (unint64_t)v31;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] Restoring sign state", buf, 0xCu);

    goto LABEL_21;
  }
LABEL_22:
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController primaryGuidance](self, "primaryGuidance"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "signID"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signID"));
  if (!v34)
  {
    v35 = sub_10043356C();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
LABEL_33:

      goto LABEL_34;
    }
    v37 = self;
    v38 = v37;
    if (!v37)
    {
      v44 = CFSTR("<nil>");
      goto LABEL_32;
    }
    v39 = (objc_class *)objc_opt_class(v37);
    v40 = NSStringFromClass(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    if ((objc_opt_respondsToSelector(v38, "accessibilityIdentifier") & 1) != 0)
    {
      v84 = a4;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v38, "performSelector:", "accessibilityIdentifier"));
      v43 = v42;
      if (v42 && !objc_msgSend(v42, "isEqualToString:", v41))
      {
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v41, v38, v43));

        a4 = v84;
        goto LABEL_30;
      }

      a4 = v84;
    }
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v41, v38));
LABEL_30:

LABEL_32:
    *(_DWORD *)buf = 138543618;
    v86 = (unint64_t)v44;
    v87 = 2112;
    v88 = *(double *)&v6;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "[%{public}@] showManeuverSign without a UUID: %@, this shouldn't happen.", buf, 0x16u);

    goto LABEL_33;
  }
LABEL_34:
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController primaryGuidance](self, "primaryGuidance"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignManeuverGuidanceInfo updatedGuidanceWithPreviousGuidance:currentGuidance:](NavSignManeuverGuidanceInfo, "updatedGuidanceWithPreviousGuidance:currentGuidance:", v45, v6));
  -[CarGuidanceCardViewController setPrimaryGuidance:](self, "setPrimaryGuidance:", v46);

  if (!v33 && v34)
  {
    v47 = sub_10043356C();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v49 = self;
      v50 = v49;
      if (!v49)
      {
        v57 = CFSTR("<nil>");
        goto LABEL_54;
      }
      v51 = (objc_class *)objc_opt_class(v49);
      v52 = NSStringFromClass(v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      if ((objc_opt_respondsToSelector(v50, "accessibilityIdentifier") & 1) != 0)
      {
        v54 = a4;
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v50, "performSelector:", "accessibilityIdentifier"));
        v56 = v55;
        if (v55 && !objc_msgSend(v55, "isEqualToString:", v53))
        {
          v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v53, v50, v56));

          a4 = v54;
          goto LABEL_43;
        }

        a4 = v54;
      }
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v53, v50));
LABEL_43:

LABEL_54:
      *(_DWORD *)buf = 138543362;
      v86 = (unint64_t)v57;
      v67 = "[%{public}@] Switching from no sign to sign, should not animate";
      v68 = v48;
      v69 = 12;
LABEL_58:
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, v67, buf, v69);

    }
LABEL_59:

    goto LABEL_60;
  }
  if ((objc_msgSend(v34, "isEqual:", v33) & 1) == 0)
  {
    v58 = sub_10043356C();
    v48 = objc_claimAutoreleasedReturnValue(v58);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      goto LABEL_59;
    v59 = self;
    v60 = v59;
    if (!v59)
    {
      v57 = CFSTR("<nil>");
      goto LABEL_57;
    }
    v61 = (objc_class *)objc_opt_class(v59);
    v62 = NSStringFromClass(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    if ((objc_opt_respondsToSelector(v60, "accessibilityIdentifier") & 1) != 0)
    {
      v64 = a4;
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v60, "performSelector:", "accessibilityIdentifier"));
      v66 = v65;
      if (v65 && !objc_msgSend(v65, "isEqualToString:", v63))
      {
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v63, v60, v66));

        a4 = v64;
        goto LABEL_52;
      }

      a4 = v64;
    }
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v63, v60));
LABEL_52:

LABEL_57:
    *(_DWORD *)buf = 138543874;
    v86 = (unint64_t)v57;
    v87 = 2112;
    v88 = *(double *)&v33;
    v89 = 2112;
    v90 = v34;
    v67 = "[%{public}@] Switching sign from %@ to %@";
    v68 = v48;
    v69 = 32;
    goto LABEL_58;
  }
LABEL_60:
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v70, "distanceUntilManeuver");
  v72 = v71;

  if (vabdd_f64(v72, self->_loggedDistanceToManeuver) > 100.0 && self->_loggedManeuverStep != a4)
  {
    v73 = sub_10043356C();
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134283777;
      v86 = a4;
      v87 = 2049;
      v88 = v72;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "[Car] Advanced to step %{private}lu with %{private}f meters until the next maneuver", buf, 0x16u);
    }

    self->_loggedDistanceToManeuver = v72;
    self->_loggedManeuverStep = a4;
  }
  if (-[CarGuidanceCardViewController cardState](self, "cardState") >= 2)
  {
    v75 = sub_10043356C();
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (!os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
LABEL_74:

      -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
      goto LABEL_75;
    }
    v77 = self;
    v78 = (objc_class *)objc_opt_class(v77);
    v79 = NSStringFromClass(v78);
    v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
    if ((objc_opt_respondsToSelector(v77, "accessibilityIdentifier") & 1) != 0)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v77, "performSelector:", "accessibilityIdentifier"));
      v82 = v81;
      if (v81 && !objc_msgSend(v81, "isEqualToString:", v80))
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v80, v77, v82));

        goto LABEL_73;
      }

    }
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v80, v77));
LABEL_73:

    *(_DWORD *)buf = 138543362;
    v86 = (unint64_t)v83;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "[%{public}@] Scheduling reload now", buf, 0xCu);

    goto LABEL_74;
  }
  -[CarGuidanceCardViewController _updateCardState](self, "_updateCardState");
LABEL_75:

}

- (void)showSecondaryManeuverSign:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CarGuidanceCardViewController *v7;
  CarGuidanceCardViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v5 = sub_10043356C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "signID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Showing secondary maneuver sign: %@", buf, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController secondaryGuidance](self, "secondaryGuidance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignManeuverGuidanceInfo updatedGuidanceWithPreviousGuidance:currentGuidance:](NavSignManeuverGuidanceInfo, "updatedGuidanceWithPreviousGuidance:currentGuidance:", v17, v4));
  -[CarGuidanceCardViewController setSecondaryGuidance:](self, "setSecondaryGuidance:", v18);

  -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
}

- (void)hideSecondaryManeuver
{
  void *v3;
  id v4;
  NSObject *v5;
  CarGuidanceCardViewController *v6;
  CarGuidanceCardViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController secondaryGuidance](self, "secondaryGuidance"));

  if (v3)
  {
    v4 = sub_10043356C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      -[CarGuidanceCardViewController setSecondaryGuidance:](self, "setSecondaryGuidance:", 0);
      -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
      return;
    }
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_9;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

LABEL_11:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController secondaryGuidance](v7, "secondaryGuidance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "signID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    *(_DWORD *)buf = 138543618;
    v18 = v13;
    v19 = 2112;
    v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Hiding secondary maneuver sign: %@", buf, 0x16u);

    goto LABEL_12;
  }
}

- (id)currentLaneGuidanceId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController laneGuidanceInfo](self, "laneGuidanceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "laneInfoId"));

  return v3;
}

- (void)showLaneGuidance:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController laneGuidanceInfo](self, "laneGuidanceInfo"));
    v5 = objc_msgSend(v6, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      -[CarGuidanceCardViewController setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", v6);
      -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
    }
  }

}

- (void)hideLaneGuidance
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController laneGuidanceInfo](self, "laneGuidanceInfo"));

  if (v3)
  {
    -[CarGuidanceCardViewController setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", 0);
    -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
  }
}

- (void)showJunctionView:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController junctionViewInfo](self, "junctionViewInfo"));
    v5 = objc_msgSend(v6, "isEqual:", v4);

    if ((v5 & 1) == 0)
      -[CarGuidanceCardViewController presentJunctionViewInfo:](self, "presentJunctionViewInfo:", v6);
  }

}

- (void)presentJunctionViewInfo:(id)a3
{
  -[CarGuidanceCardViewController setJunctionViewInfo:](self, "setJunctionViewInfo:", a3);
  -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
}

- (void)hideJunctionView
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController junctionViewInfo](self, "junctionViewInfo"));

  if (v3)
  {
    -[CarGuidanceCardViewController setJunctionViewInfo:](self, "setJunctionViewInfo:", 0);
    -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
  }
}

- (void)showNoGuidance
{
  -[CarGuidanceCardViewController setPrimaryGuidance:](self, "setPrimaryGuidance:", 0);
  -[CarGuidanceCardViewController setSecondaryGuidance:](self, "setSecondaryGuidance:", 0);
  -[CarGuidanceCardViewController setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", 0);
}

- (void)setArrivalState:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  CarGuidanceCardViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;

  if (self->_arrivalState == a3)
    return;
  self->_arrivalState = a3;
  v5 = sub_10043356C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    v14 = sub_10064BC50(a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    v18 = 2112;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] etaCardVC: updateArrivalState: %@", buf, 0x16u);

  }
  if (a3 == 5)
    -[CarGuidanceCardViewController showNoGuidance](self, "showNoGuidance");
  -[CarGuidanceCardViewController _updateCardState](self, "_updateCardState");
}

- (void)setDestinationDisplayName:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mkServerFormattedString"));
  -[CarArrivedGuidanceSign setFormattedDestination:](self->_arrivalOverlaySign, "setFormattedDestination:", v4);

}

- (void)setIsRerouting:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  CarGuidanceCardViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  CarGuidanceCardViewController *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const __CFString *v28;

  if (self->_isRerouting != a3)
  {
    v3 = a3;
    if (!a3 || (id)-[CarGuidanceCardViewController arrivalState](self, "arrivalState") == (id)1)
    {
      self->_isRerouting = v3;
      v5 = sub_10043356C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_13:

        -[CarGuidanceCardViewController _updateCardState](self, "_updateCardState");
        return;
      }
      v7 = self;
      v8 = (objc_class *)objc_opt_class(v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
        v12 = v11;
        if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

          goto LABEL_10;
        }

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_10:

      v14 = CFSTR("NO");
      if (v3)
        v14 = CFSTR("YES");
      v15 = v14;
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2112;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] setIsRerouting: %@", buf, 0x16u);

      goto LABEL_13;
    }
    v16 = sub_10043356C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    v18 = self;
    v19 = (objc_class *)objc_opt_class(v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_20;
      }

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_20:

    *(_DWORD *)buf = 138543618;
    v26 = v24;
    v27 = 2112;
    v28 = CFSTR("YES");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Will ignore setIsRerouting: %@, because we are in an arrival state.", buf, 0x16u);

LABEL_21:
  }
}

- (void)showRecalculating
{
  id v3;
  NSObject *v4;
  CarGuidanceCardViewController *v5;
  CarGuidanceCardViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  NSObject *v14;
  CarGuidanceCardViewController *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  NavSignManeuverGuidanceInfo *v22;
  NavSignManeuverGuidanceInfo *previousPrimaryGuidance;
  NavSignManeuverGuidanceInfo *v24;
  NavSignManeuverGuidanceInfo *previousSecondaryGuidance;
  NavSignLaneGuidanceInfo *v26;
  NavSignLaneGuidanceInfo *previousLaneInfo;
  uint8_t buf[4];
  __CFString *v29;

  v3 = sub_10043356C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] showRecalculating", buf, 0xCu);

  }
  -[CarGuidanceCardViewController setIsRerouting:](self, "setIsRerouting:", 1);
  if (!self->_previousPrimaryGuidance)
  {
    v13 = sub_10043356C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      v22 = (NavSignManeuverGuidanceInfo *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController primaryGuidance](self, "primaryGuidance"));
      previousPrimaryGuidance = self->_previousPrimaryGuidance;
      self->_previousPrimaryGuidance = v22;

      v24 = (NavSignManeuverGuidanceInfo *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController secondaryGuidance](self, "secondaryGuidance"));
      previousSecondaryGuidance = self->_previousSecondaryGuidance;
      self->_previousSecondaryGuidance = v24;

      v26 = (NavSignLaneGuidanceInfo *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController laneGuidanceInfo](self, "laneGuidanceInfo"));
      previousLaneInfo = self->_previousLaneInfo;
      self->_previousLaneInfo = v26;

      goto LABEL_20;
    }
    v15 = self;
    v16 = (objc_class *)objc_opt_class(v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_18;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_18:

    *(_DWORD *)buf = 138543362;
    v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] Saving current sign guidance", buf, 0xCu);

    goto LABEL_19;
  }
LABEL_20:
  -[CarGuidanceCardViewController showNoGuidance](self, "showNoGuidance");
  -[CarGuidanceCardViewController _showRecalculatingWithDataConnectionFailedMessage:](self, "_showRecalculatingWithDataConnectionFailedMessage:", 0);
}

- (void)hideRecalculating
{
  id v3;
  NSObject *v4;
  CarGuidanceCardViewController *v5;
  CarGuidanceCardViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;

  v3 = sub_10043356C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] hideRecalculating", buf, 0xCu);

  }
  -[CarGuidanceCardViewController setIsRerouting:](self, "setIsRerouting:", 0);
}

- (void)didReroute
{
  id v3;
  NSObject *v4;
  CarGuidanceCardViewController *v5;
  CarGuidanceCardViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;

  v3 = sub_10043356C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] didReroute", buf, 0xCu);

  }
  -[CarGuidanceCardViewController setIsRerouting:](self, "setIsRerouting:", 0);
}

- (void)showRecalculationFailed
{
  id v3;
  NSObject *v4;
  CarGuidanceCardViewController *v5;
  CarGuidanceCardViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;

  v3 = sub_10043356C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] showRecalculationFailed", buf, 0xCu);

  }
  -[CarGuidanceCardViewController showNoGuidance](self, "showNoGuidance");
  -[CarGuidanceCardViewController _showRecalculatingWithDataConnectionFailedMessage:](self, "_showRecalculatingWithDataConnectionFailedMessage:", 1);
}

- (void)_showRecalculatingWithDataConnectionFailedMessage:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  id v6;

  v3 = a3;
  v5 = (id)-[CarGuidanceCardViewController cardState](self, "cardState") == (id)1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController reroutingOverlaySign](self, "reroutingOverlaySign"));
  objc_msgSend(v6, "setShowMessage:animated:", v3, v5);

}

- (void)setTimeToManeuver:(double)a3 distanceToManeuver:(double)a4 distanceText:(id)a5 forStep:(id)a6 atStepIndex:(unint64_t)a7
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v8 = a5;
  v9 = -[CarGuidanceCardViewController cardState](self, "cardState");
  if (v8 && v9 != 4)
  {
    v16 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController primaryGuidance](self, "primaryGuidance"));
    objc_msgSend(v11, "setMajorTextAlternatives:", v10);

    v15 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "primaryGuidance"));
    objc_msgSend(v14, "setMajorTextAlternatives:", v12);

    -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
  }

}

- (void)showProceedingToRouteDistance:(double)a3 displayString:(id)a4 forStep:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GuidanceManeuverArtwork *v15;
  GuidanceManeuverArtwork *v16;
  void *v17;
  NavSignManeuverGuidanceInfo *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NavSignManeuverGuidanceInfo *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;

  v8 = a4;
  v9 = a5;
  if ((id)-[CarGuidanceCardViewController cardState](self, "cardState") != (id)4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsForContext:", 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForDistance:", a3));
    if (v8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mkServerFormattedString"));
      v30 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));

    }
    else
    {
      v13 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController primaryGuidance](self, "primaryGuidance"));
    v15 = (GuidanceManeuverArtwork *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "maneuverArtwork"));

    if (!v15)
    {
      v16 = [GuidanceManeuverArtwork alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artworkOverride"));
      v15 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v16, "initWithManeuver:junction:drivingSide:artworkDataSource:", 17, 0, 1, v17);

    }
    v18 = [NavSignManeuverGuidanceInfo alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController proceedToRouteSignID](self, "proceedToRouteSignID"));
    if (v11)
    {
      v28 = v8;
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mkServerFormattedString"));
      v20 = v9;
      v21 = v11;
      v22 = v10;
      v23 = (void *)v29;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
      v25 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v18, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v19, v15, v24, v13, 0);

      v10 = v22;
      v11 = v21;
      v9 = v20;
      v8 = v28;
    }
    else
    {
      v25 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v18, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v19, v15, 0, v13, 0);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController primaryGuidance](self, "primaryGuidance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignManeuverGuidanceInfo updatedGuidanceWithPreviousGuidance:currentGuidance:](NavSignManeuverGuidanceInfo, "updatedGuidanceWithPreviousGuidance:currentGuidance:", v26, v25));
    -[CarGuidanceCardViewController setPrimaryGuidance:](self, "setPrimaryGuidance:", v27);

    -[CarGuidanceCardViewController _scheduleReloadAnimated:](self, "_scheduleReloadAnimated:", 1);
  }

}

- (CGSize)availableSize
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat width;
  double v8;
  CGFloat height;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  double v17;
  double v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  CGSize result;

  v3 = -[CarGuidanceCardViewController destination](self, "destination");
  if (v3 - 1 >= 2)
  {
    if (v3)
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315650;
        v25 = "-[CarGuidanceCardViewController availableSize]";
        v26 = 2080;
        v27 = "CarGuidanceCardViewController.m";
        v28 = 1024;
        v29 = 837;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v24, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v24 = 138412290;
          v25 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);

        }
      }
      width = CGSizeZero.width;
      height = CGSizeZero.height;
    }
    else
    {
      -[CarGuidanceCardViewController availableCardSize](self, "availableCardSize");
      width = v10;
      height = v11;
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController guidanceCardSizeProvider](self, "guidanceCardSizeProvider"));

    if (!v4)
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315906;
        v25 = "-[CarGuidanceCardViewController availableSize]";
        v26 = 2080;
        v27 = "CarGuidanceCardViewController.m";
        v28 = 1024;
        v29 = 833;
        v30 = 2080;
        v31 = "self.guidanceCardSizeProvider";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v24, 0x26u);
      }

      if (sub_100A70734())
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v24 = 138412290;
          v25 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);

        }
      }
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController guidanceCardSizeProvider](self, "guidanceCardSizeProvider"));
    objc_msgSend(v5, "availableSize");
    width = v6;
    height = v8;

  }
  v17 = width;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (unint64_t)maneuverViewLayoutType
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  CGRect v28;

  v3 = -[CarGuidanceCardViewController destination](self, "destination");
  if (v3 - 1 < 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController guidanceCardSizeProvider](self, "guidanceCardSizeProvider"));

    if (!v4)
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315906;
        v21 = "-[CarGuidanceCardViewController maneuverViewLayoutType]";
        v22 = 2080;
        v23 = "CarGuidanceCardViewController.m";
        v24 = 1024;
        v25 = 854;
        v26 = 2080;
        v27 = "self.guidanceCardSizeProvider";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v20, 0x26u);
      }

      if (sub_100A70734())
      {
        v17 = sub_1004318FC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v20 = 138412290;
          v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

        }
      }
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController guidanceCardSizeProvider](self, "guidanceCardSizeProvider"));
    v6 = (unint64_t)objc_msgSend(v5, "maneuverViewLayoutType");
LABEL_4:

    return v6;
  }
  if (!v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController junctionViewInfo](self, "junctionViewInfo"));

    if (v7)
      return 2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    objc_msgSend(v14, "bounds");
    v6 = CGRectGetWidth(v28) * 0.409999996 >= 180.0;

    goto LABEL_4;
  }
  v8 = sub_1004318FC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v20 = 136315650;
    v21 = "-[CarGuidanceCardViewController maneuverViewLayoutType]";
    v22 = 2080;
    v23 = "CarGuidanceCardViewController.m";
    v24 = 1024;
    v25 = 859;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v20, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v20 = 138412290;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

    }
  }
  return 1;
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  CarDynamicBlurView *v6;

  v6 = self->_dynamicBlurView;

  return v6;
}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)dynamicBlurViewDidChangeBlurMode:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController fullGuidanceSign](self, "fullGuidanceSign"));
  objc_msgSend(v5, "setBlurMode:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController miniGuidanceSign](self, "miniGuidanceSign"));
  objc_msgSend(v6, "setBlurMode:", v3);

}

- (void)_updateSignLayout
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController currentSign](self, "currentSign"));
  objc_msgSend(v3, "setNeedsLayout");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarGuidanceCardViewController currentSign](self, "currentSign"));
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)setAvailableCardSize:(CGSize)a3
{
  if (a3.width != self->_availableCardSize.width || a3.height != self->_availableCardSize.height)
  {
    self->_availableCardSize = a3;
    -[CarGuidanceCardViewController _updateSignLayout](self, "_updateSignLayout");
  }
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (CGSize)availableCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_availableCardSize.width;
  height = self->_availableCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)navigationGuidanceSignStyle
{
  return self->_navigationGuidanceSignStyle;
}

- (unint64_t)cardState
{
  return self->_cardState;
}

- (CarGuidanceCard)currentSign
{
  return self->_currentSign;
}

- (void)setFullGuidanceSign:(id)a3
{
  objc_storeStrong((id *)&self->_fullGuidanceSign, a3);
}

- (void)setMiniGuidanceSign:(id)a3
{
  objc_storeStrong((id *)&self->_miniGuidanceSign, a3);
}

- (void)setArrivalOverlaySign:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalOverlaySign, a3);
}

- (void)setReroutingOverlaySign:(id)a3
{
  objc_storeStrong((id *)&self->_reroutingOverlaySign, a3);
}

- (void)setLoadingOverlaySign:(id)a3
{
  objc_storeStrong((id *)&self->_loadingOverlaySign, a3);
}

- (BOOL)hasGuidance
{
  return self->_hasGuidance;
}

- (BOOL)isRerouting
{
  return self->_isRerouting;
}

- (NavSignManeuverGuidanceInfo)primaryGuidance
{
  return self->_primaryGuidance;
}

- (NavSignManeuverGuidanceInfo)secondaryGuidance
{
  return self->_secondaryGuidance;
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (NavJunctionViewInfo)junctionViewInfo
{
  return self->_junctionViewInfo;
}

- (unint64_t)arrivalState
{
  return self->_arrivalState;
}

- (void)setProceedToRouteSignID:(id)a3
{
  objc_storeStrong((id *)&self->_proceedToRouteSignID, a3);
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (CarGuidanceCardSizeProviding)guidanceCardSizeProvider
{
  return (CarGuidanceCardSizeProviding *)objc_loadWeakRetained((id *)&self->_guidanceCardSizeProvider);
}

- (void)setGuidanceCardSizeProvider:(id)a3
{
  objc_storeWeak((id *)&self->_guidanceCardSizeProvider, a3);
}

- (CarGuidanceCardInteractionDelegate)interactionDelegate
{
  return (CarGuidanceCardInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_destroyWeak((id *)&self->_guidanceCardSizeProvider);
  objc_storeStrong((id *)&self->_proceedToRouteSignID, 0);
  objc_storeStrong((id *)&self->_junctionViewInfo, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_secondaryGuidance, 0);
  objc_storeStrong((id *)&self->_primaryGuidance, 0);
  objc_storeStrong((id *)&self->_loadingOverlaySign, 0);
  objc_storeStrong((id *)&self->_reroutingOverlaySign, 0);
  objc_storeStrong((id *)&self->_arrivalOverlaySign, 0);
  objc_storeStrong((id *)&self->_miniGuidanceSign, 0);
  objc_storeStrong((id *)&self->_fullGuidanceSign, 0);
  objc_storeStrong((id *)&self->_currentSign, 0);
  objc_storeStrong((id *)&self->_previousLaneInfo, 0);
  objc_storeStrong((id *)&self->_previousSecondaryGuidance, 0);
  objc_storeStrong((id *)&self->_previousPrimaryGuidance, 0);
  objc_storeStrong((id *)&self->_dynamicBlurView, 0);
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_signSelectionTimer, 0);
  objc_storeStrong((id *)&self->_junctionViewRestoreTimer, 0);
}

@end
