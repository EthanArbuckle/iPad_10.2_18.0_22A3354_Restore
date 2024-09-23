@implementation MapsRouteCreationContext

- (MapsRouteCreationContext)initWithExistingMapItems:(id)a3
{
  id v4;
  MapsRouteCreationContext *v5;
  MNRouteEditor *v6;
  MNRouteEditor *routeEditor;
  MapsRouteCreationContainee *v8;
  MapsRouteCreationContainee *editContainee;
  MapsSaveRouteContainee *v10;
  MapsSaveRouteContainee *saveContainee;
  uint64_t v12;
  NSMutableArray *containees;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *editStack;
  NSUndoManager *v18;
  NSUndoManager *undoManager;
  void *v20;
  uint64_t v21;
  CardView *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  CardView *undoButtonContainer;
  UIButton *v36;
  void *v37;
  UIButton *undoButton;
  UIButton *v39;
  CardView *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  CardView *recenterButtonContainer;
  CardView *v54;
  UIButton *v55;
  void *v56;
  UIButton *recenterButton;
  void *v58;
  void *v59;
  UINotificationFeedbackGenerator *v60;
  UINotificationFeedbackGenerator *notificationGenerator;
  MapsRippleAnnotation *v62;
  MapsRippleAnnotation *rippleAnnotation;
  CardView *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  UIButton *v79;
  void *v80;
  UIButton *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  CardView *v87;
  objc_super v88;
  _QWORD v89[8];

  v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)MapsRouteCreationContext;
  v5 = -[MapsRouteCreationContext init](&v88, "init");
  if (v5)
  {
    v6 = (MNRouteEditor *)objc_msgSend(objc_alloc((Class)MNRouteEditor), "initWithTraceRecordingEnabled:", GEOConfigGetBOOL(NavigationConfig_TraceRecordingEnabled[0], NavigationConfig_TraceRecordingEnabled[1]));
    routeEditor = v5->_routeEditor;
    v5->_routeEditor = v6;

    v8 = -[MapsRouteCreationContainee initWithContext:]([MapsRouteCreationContainee alloc], "initWithContext:", v5);
    editContainee = v5->_editContainee;
    v5->_editContainee = v8;

    v10 = -[MapsSaveRouteContainee initWithDelegate:isEditing:showInitialKeyboard:]([MapsSaveRouteContainee alloc], "initWithDelegate:isEditing:showInitialKeyboard:", v5, 0, 1);
    saveContainee = v5->_saveContainee;
    v5->_saveContainee = v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v5->_editContainee));
    containees = v5->_containees;
    v5->_containees = (NSMutableArray *)v12;

    -[ContaineeViewController setContaineeDelegate:](v5->_editContainee, "setContaineeDelegate:", v5);
    v86 = v4;
    if (objc_msgSend(v4, "count"))
      v14 = objc_claimAutoreleasedReturnValue(+[RouteCreationEditState initialEditStateFromMapItems:](RouteCreationEditState, "initialEditStateFromMapItems:", v4));
    else
      v14 = objc_claimAutoreleasedReturnValue(+[RouteCreationEditState initialEditStateFromRoute:](RouteCreationEditState, "initialEditStateFromRoute:", 0));
    v15 = (void *)v14;
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v14));
    editStack = v5->_editStack;
    v5->_editStack = (NSMutableArray *)v16;

    v18 = objc_opt_new(NSUndoManager);
    undoManager = v5->_undoManager;
    v5->_undoManager = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightSemibold));
    v21 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v20));

    v22 = -[CardView initAllowingBlurredForButton:]([CardView alloc], "initAllowingBlurredForButton:", 1);
    -[CardView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CardView setLayoutStyle:](v22, "setLayoutStyle:", 6);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
    v24 = objc_msgSend(v23, "CGColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v22, "layer"));
    objc_msgSend(v25, "setBorderColor:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v22, "layer"));
    objc_msgSend(v26, "setCornerRadius:", 8.0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v22, "layer"));
    objc_msgSend(v27, "setBorderWidth:", 0.5);

    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
    v29 = objc_msgSend(v28, "CGColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v22, "layer"));
    objc_msgSend(v30, "setShadowColor:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v22, "layer"));
    LODWORD(v32) = *(_DWORD *)"\nף=";
    objc_msgSend(v31, "setShadowOpacity:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v22, "layer"));
    objc_msgSend(v33, "setShadowOffset:", 0.0, -2.0);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v22, "layer"));
    objc_msgSend(v34, "setShadowPathIsBounds:", 1);

    undoButtonContainer = v5->_undoButtonContainer;
    v5->_undoButtonContainer = v22;
    v87 = v22;

    v36 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v36, "setAccessibilityIdentifier:", CFSTR("UndoButton"));
    v85 = (void *)v21;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.uturn.backward"), v21));
    -[UIButton setImage:forState:](v36, "setImage:forState:", v37, 0);

    -[UIButton addTarget:action:forControlEvents:](v36, "addTarget:action:forControlEvents:", v5, "pressedUndo", 64);
    undoButton = v5->_undoButton;
    v5->_undoButton = v36;
    v39 = v36;

    v40 = -[CardView initAllowingBlurredForButton:]([CardView alloc], "initAllowingBlurredForButton:", 1);
    -[CardView setTranslatesAutoresizingMaskIntoConstraints:](v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CardView setLayoutStyle:](v40, "setLayoutStyle:", 6);
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
    v42 = objc_msgSend(v41, "CGColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v40, "layer"));
    objc_msgSend(v43, "setBorderColor:", v42);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v40, "layer"));
    objc_msgSend(v44, "setCornerRadius:", 8.0);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v40, "layer"));
    objc_msgSend(v45, "setBorderWidth:", 0.5);

    v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
    v47 = objc_msgSend(v46, "CGColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v40, "layer"));
    objc_msgSend(v48, "setShadowColor:", v47);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v40, "layer"));
    LODWORD(v50) = *(_DWORD *)"\nף=";
    objc_msgSend(v49, "setShadowOpacity:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v40, "layer"));
    objc_msgSend(v51, "setShadowOffset:", 0.0, -2.0);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v40, "layer"));
    objc_msgSend(v52, "setShadowPathIsBounds:", 1);

    recenterButtonContainer = v5->_recenterButtonContainer;
    v5->_recenterButtonContainer = v40;
    v54 = v40;

    v55 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v55, "setAccessibilityIdentifier:", CFSTR("RecenterButton"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("location.bottomleft.forward.to.point.topright.scurvepath.dashed"), v21));
    -[UIButton setImage:forState:](v55, "setImage:forState:", v56, 0);

    -[UIButton addTarget:action:forControlEvents:](v55, "addTarget:action:forControlEvents:", v5, "pressedRecenter", 64);
    -[UIButton imageEdgeInsets](v55, "imageEdgeInsets");
    -[UIButton setImageEdgeInsets:](v55, "setImageEdgeInsets:");
    -[CardView setAlpha:](v54, "setAlpha:", 0.0);
    recenterButton = v5->_recenterButton;
    v5->_recenterButton = v55;
    v79 = v55;

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011BECC0));
    v81 = v39;
    -[UIButton setTintColor:](v39, "setTintColor:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton tintColor](v39, "tintColor"));
    -[UIButton setTintColor:](v79, "setTintColor:", v59);

    -[MapsRouteCreationContext _createFakeButton](v5, "_createFakeButton");
    v60 = objc_opt_new(UINotificationFeedbackGenerator);
    notificationGenerator = v5->_notificationGenerator;
    v5->_notificationGenerator = v60;

    v62 = objc_opt_new(MapsRippleAnnotation);
    rippleAnnotation = v5->_rippleAnnotation;
    v5->_rippleAnnotation = v62;

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[CardView widthAnchor](v87, "widthAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToConstant:", 44.0));
    v89[0] = v83;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CardView heightAnchor](v87, "heightAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToConstant:", 44.0));
    v89[1] = v80;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v5->_undoButton, "widthAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:", 44.0));
    v89[2] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v5->_undoButton, "heightAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToConstant:", 44.0));
    v89[3] = v75;
    v64 = v54;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CardView widthAnchor](v54, "widthAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToConstant:", 44.0));
    v89[4] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CardView heightAnchor](v54, "heightAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToConstant:", 44.0));
    v89[5] = v67;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v5->_recenterButton, "widthAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToConstant:", 44.0));
    v89[6] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v5->_recenterButton, "heightAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToConstant:", 44.0));
    v89[7] = v71;
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v72);

    v4 = v86;
  }

  return v5;
}

- (void)_createFakeButton
{
  MapsMenuButton *v3;
  MapsMenuButton *contextMenuFakeButton;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  -[MapsMenuButton removeFromSuperview](self->_contextMenuFakeButton, "removeFromSuperview");
  v3 = -[MapsMenuButton initWithDelegate:]([MapsMenuButton alloc], "initWithDelegate:", self);
  contextMenuFakeButton = self->_contextMenuFakeButton;
  self->_contextMenuFakeButton = v3;

  -[MapsMenuButton setShowsMenuAsPrimaryAction:](self->_contextMenuFakeButton, "setShowsMenuAsPrimaryAction:", 1);
  -[MapsMenuButton setHidden:](self->_contextMenuFakeButton, "setHidden:", 1);
  objc_initWeak(&location, self);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100642378;
  v12 = &unk_1011BECE8;
  objc_copyWeak(&v13, &location);
  -[MapsMenuButton _setMenuProvider:](self->_contextMenuFakeButton, "_setMenuProvider:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController", v9, v10, v11, v12));
  v6 = objc_msgSend(v5, "isTopContext:", self);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
    objc_msgSend(v8, "addSubview:", self->_contextMenuFakeButton);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)showsMapView
{
  return 1;
}

- (id)desiredCards
{
  return self->_containees;
}

- (int64_t)desiredFloatingControls
{
  return 0;
}

- (BOOL)wantsWeatherShowing
{
  return 0;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)wantsLookAroundShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006424D4;
  v8[3] = &unk_1011AD260;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "addPreparation:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[MNRouteEditor endSession](self->_routeEditor, "endSession");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10064284C;
  v15[3] = &unk_1011AD260;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "addPreparation:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentContextTransition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enterAnimation"));

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1006429AC;
    v13[3] = &unk_1011AD260;
    v10 = &v14;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v9, "addAnimations:", v13);
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1006429E4;
    v11[3] = &unk_1011AD4F0;
    v10 = &v12;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "addCompletion:", v11);
  }
  objc_destroyWeak(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)pushSaveContainee
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[MapsRouteCreationContext pushSaveContainee]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableArray addObject:](self->_containees, "addObject:", self->_saveContainee);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)popContainee
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[MapsRouteCreationContext popContainee]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableArray removeLastObject](self->_containees, "removeLastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)didSaveCustomRoute:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  MapsCustomRouteViewContext *v7;
  void *v8;
  int v9;
  const char *v10;

  v4 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[MapsRouteCreationContext didSaveCustomRoute:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }

  v7 = -[MapsCustomRouteViewContext initWithExistingRouteData:]([MapsCustomRouteViewContext alloc], "initWithExistingRouteData:", v4);
  -[MapsCustomRouteViewContext setExitRouteCreationOnClose:](v7, "setExitRouteCreationOnClose:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v8, "pushContext:animated:completion:", v7, 1, 0);

}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController", a3, a4));
  objc_msgSend(v5, "popContext:animated:completion:", self, 1, 0);

}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  UINotificationFeedbackGenerator *notificationGenerator;
  id v5;
  void *v6;

  notificationGenerator = self->_notificationGenerator;
  v5 = a3;
  -[UINotificationFeedbackGenerator notificationOccurred:](notificationGenerator, "notificationOccurred:", 0);
  -[MapsRouteCreationContext _expandCardIfNeeded](self, "_expandCardIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

  -[MapsRouteCreationContext _appendMapItem:isCurrentLocation:isCoordinate:](self, "_appendMapItem:isCurrentLocation:isCoordinate:", v6, 0, 0);
  return 1;
}

- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  id v7;
  double v8;
  CLLocationDegrees v9;
  double v10;
  CLLocationDegrees v11;
  CLLocationCoordinate2D v12;

  v7 = a5;
  objc_msgSend(a4, "doubleValue");
  v9 = v8;
  objc_msgSend(v7, "doubleValue");
  v11 = v10;

  v12 = CLLocationCoordinate2DMake(v9, v11);
  -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0, v12.latitude, v12.longitude);
  return 1;
}

- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3
{
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  CLLocationCoordinate2D v6;

  objc_msgSend(a3, "coordinate");
  v6 = CLLocationCoordinate2DMake(v4, v5);
  -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0, v6.latitude, v6.longitude);
  return 1;
}

- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3
{
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  CLLocationCoordinate2D v6;

  objc_msgSend(a3, "coordinate");
  v6 = CLLocationCoordinate2DMake(v4, v5);
  -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0, v6.latitude, v6.longitude);
  return 1;
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOComposedRouteAnchorPoint *anchorPointAttachedToMenu;
  id v10;
  NSObject *v11;
  const char *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  GEOComposedRoute *composedRoute;
  id v24;
  int v26;
  id v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorNearMapItem:](self, "_anchorNearMapItem:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchorPoints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorPointNearMapItem:inAnchorPoints:](self, "_anchorPointNearMapItem:inAnchorPoints:", v4, v7));

  anchorPointAttachedToMenu = self->_anchorPointAttachedToMenu;
  if (anchorPointAttachedToMenu)
  {
    v10 = sub_1004320DC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      goto LABEL_15;
    }
    v26 = 138412290;
    v27 = v5;
    v12 = "Ignoring anchor point at index: %@ (marker) due to an existing context menu";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v26, 0xCu);
    goto LABEL_5;
  }
  if (!v5)
  {
    composedRoute = self->_composedRoute;
    -[UINotificationFeedbackGenerator notificationOccurred:](self->_notificationGenerator, "notificationOccurred:", 0);
    if (composedRoute || !v8)
    {
      -[MapsRouteCreationContext _expandCardIfNeeded](self, "_expandCardIfNeeded");
      -[MapsRouteCreationContext _appendMapItem:isCurrentLocation:isCoordinate:](self, "_appendMapItem:isCurrentLocation:isCoordinate:", v4, 0, 0);
      goto LABEL_15;
    }
    v24 = sub_1004320DC();
    v11 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_5;
    v26 = 138412290;
    v27 = v8;
    v12 = "Pretending to add anchorPoint (%@) because it's already in the anchor point list";
    goto LABEL_4;
  }
  v13 = sub_1004320DC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anchorPoints"));
    v26 = 134217984;
    v27 = objc_msgSend(v16, "indexOfAnchorPoint:", v5);
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (marker)", (uint8_t *)&v26, 0xCu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapView"));

  objc_msgSend(v5, "locationCoordinate");
  v20 = v19;
  v22 = v21;
  -[MapsRouteCreationContext _setMenuAttachedAnchorPoint:](self, "_setMenuAttachedAnchorPoint:", v5);
  objc_msgSend(v18, "convertCoordinate:toPointToView:", v18, v20, v22);
  -[MapsRouteCreationContext _moveContextMenuToPoint:anchorPoint:](self, "_moveContextMenuToPoint:anchorPoint:", v5);

LABEL_15:
  return anchorPointAttachedToMenu == 0;
}

- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  id v21;

  objc_msgSend(a3, "coordinate");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorNearCoordinate:](self, "_anchorNearCoordinate:"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));

    objc_msgSend(v10, "convertCoordinate:toPointToView:", v10, v5, v7);
    v12 = v11;
    v14 = v13;
    v15 = sub_1004320DC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "anchorPoints"));
      v20 = 134217984;
      v21 = objc_msgSend(v18, "indexOfAnchorPoint:", v8);
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (user annotation)", (uint8_t *)&v20, 0xCu);

    }
    -[MapsRouteCreationContext _setMenuAttachedAnchorPoint:](self, "_setMenuAttachedAnchorPoint:", v8);
    -[MapsRouteCreationContext _moveContextMenuToPoint:anchorPoint:](self, "_moveContextMenuToPoint:anchorPoint:", v8, v12, v14);

  }
  else
  {
    -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 1, v5, v7);
  }

  return v8 == 0;
}

- (BOOL)chromeDidSelectAnnotationView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  id v26;

  v4 = a3;
  v5 = objc_opt_class(MapsUserLocationView);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (v6 = objc_opt_class(MapsRippleAnnotationView), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotation"));
    objc_msgSend(v8, "coordinate");
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorNearCoordinate:](self, "_anchorNearCoordinate:", v10, v12));
    v7 = v13 == 0;
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapView"));

      objc_msgSend(v15, "convertCoordinate:toPointToView:", v15, v10, v12);
      v17 = v16;
      v19 = v18;
      v20 = sub_1004320DC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "anchorPoints"));
        v25 = 134217984;
        v26 = objc_msgSend(v23, "indexOfAnchorPoint:", v13);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (annotation view)", (uint8_t *)&v25, 0xCu);

      }
      -[MapsRouteCreationContext _setMenuAttachedAnchorPoint:](self, "_setMenuAttachedAnchorPoint:", v13);
      -[MapsRouteCreationContext _moveContextMenuToPoint:anchorPoint:](self, "_moveContextMenuToPoint:anchorPoint:", v13, v17, v19);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotation"));
      objc_msgSend(v15, "coordinate");
      -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0);
    }

  }
  return v7;
}

- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3
{
  return 1;
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void **v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  MapsRouteCreationContext *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;

  v4 = a3;
  if (objc_msgSend(v4, "featureType") == 19)
  {
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));

    objc_msgSend(v10, "convertCoordinate:toPointToView:", v10, v6, v8);
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorNearPoint:](self, "_anchorNearPoint:"));
    if (v15 && !self->_anchorPointAttachedToMenu)
    {
      v18 = sub_1004320DC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "anchorPoints"));
        *(_DWORD *)buf = 134217984;
        v33 = objc_msgSend(v21, "indexOfAnchorPoint:", v15);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (label marker)", buf, 0xCu);

      }
      -[MapsRouteCreationContext _setMenuAttachedAnchorPoint:](self, "_setMenuAttachedAnchorPoint:", v15);
      v24 = _NSConcreteStackBlock;
      v25 = 3221225472;
      v26 = sub_1006436A8;
      v27 = &unk_1011B15D8;
      v28 = self;
      v30 = v12;
      v31 = v14;
      v22 = v15;
      v29 = v22;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v24);
      v16 = objc_msgSend(v22, "anchorPointType", v24, v25, v26, v27, v28) == (id)3;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v17 = objc_msgSend(v4, "isTrail");

    return v17 ^ 1;
  }
  return v16;
}

- (BOOL)chromeDidSelectFlyoverTourLabelMarker:(id)a3
{
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  CLLocationCoordinate2D v6;

  objc_msgSend(a3, "coordinate");
  v6 = CLLocationCoordinate2DMake(v4, v5);
  -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0, v6.latitude, v6.longitude);
  return 1;
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (id)_anchorNearCoordinate:(CLLocationCoordinate2D)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", a3.latitude, a3.longitude);
  v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorNearMapItem:](self, "_anchorNearMapItem:", v5));

  return v6;
}

- (id)_anchorPointNearMapItem:(id)a3 inAnchorPoints:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "muid", (_QWORD)v13))
        {
          v11 = objc_msgSend(v10, "muid");
          if (v11 == objc_msgSend(v5, "_muid"))
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)_anchorNearMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anchorPoints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorPointNearMapItem:inAnchorPoints:](self, "_anchorPointNearMapItem:inAnchorPoints:", v4, v6));

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placemark"));
    objc_msgSend(v11, "coordinate");
    v13 = v12;
    v15 = v14;

    objc_msgSend(v10, "convertCoordinate:toPointToView:", v10, v13, v15);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorNearPoint:](self, "_anchorNearPoint:"));

  }
  return v8;
}

- (id)_anchorNearPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  NSObject *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  _BYTE v38[128];

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anchorPoints"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v10)
  {
    v12 = v10;
    v13 = 0;
    v14 = *(_QWORD *)v29;
    v15 = 1600.0;
    *(_QWORD *)&v11 = 134218496;
    v27 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "locationCoordinate", v27);
        objc_msgSend(v7, "convertCoordinate:toPointToView:", v7);
        v19 = v18;
        v21 = v20;
        v22 = (y - v20) * (y - v20) + (x - v18) * (x - v18);
        v23 = sub_1004320DC();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v27;
          v33 = v19;
          v34 = 2048;
          v35 = v21;
          v36 = 2048;
          v37 = v22;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Anchor position: %g, %g. Tap point distance from anchor: %g", buf, 0x20u);
        }

        if (v22 < v15)
        {
          v25 = v17;

          v15 = v22;
          v13 = v25;
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  int v21;
  double v22;
  __int16 v23;
  double v24;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = sub_1004320DC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v21 = 134218240;
    v22 = x;
    v23 = 2048;
    v24 = y;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Tap point: %g, %g", (uint8_t *)&v21, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _anchorNearPoint:](self, "_anchorNearPoint:", x, y));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anchorPoints"));
    v13 = (uint64_t)objc_msgSend(v12, "indexOfAnchorPoint:", v10);

    if (!self->_anchorPointAttachedToMenu)
    {
      v14 = sub_1004320DC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "anchorPoints"));
        v18 = objc_msgSend(v17, "indexOfAnchorPoint:", v10);
        v21 = 134217984;
        v22 = *(double *)&v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (map view)", (uint8_t *)&v21, 0xCu);

      }
      -[MapsRouteCreationContext _moveContextMenuToPoint:anchorPoint:](self, "_moveContextMenuToPoint:anchorPoint:", v10, x, y);
      goto LABEL_13;
    }
  }
  else
  {
    if (!self->_anchorPointAttachedToMenu)
    {
      objc_msgSend(v7, "convertPoint:toCoordinateFromView:", v7, x, y);
      -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0);
      goto LABEL_13;
    }
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v19 = sub_1004320DC();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = 134217984;
    v22 = *(double *)&v13;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Ignoring anchor point at index: %lu (map view) due to an existing context menu", (uint8_t *)&v21, 0xCu);
  }

LABEL_13:
}

- (void)_showRecenterButton
{
  GEOComposedRoute *composedRoute;
  double v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  composedRoute = self->_composedRoute;
  -[CardView alpha](self->_recenterButtonContainer, "alpha");
  if (composedRoute)
    v5 = v4 < 1.0;
  else
    v5 = 0;
  if (v5)
  {
    v6 = sub_1004320DC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "animating to show recenter button", buf, 2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100643EEC;
    v8[3] = &unk_1011AC860;
    v8[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.3);
  }
}

- (void)_insertRippleAnnotationAtCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = sub_1004320DC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Start ripple animation", v11, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_removeRippleView", 0);
  -[MapsRippleAnnotation setCoordinate:](self->_rippleAnnotation, "setCoordinate:", latitude, longitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
  objc_msgSend(v9, "addAnnotation:", self->_rippleAnnotation);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRippleAnnotation rippleView](self->_rippleAnnotation, "rippleView"));
  objc_msgSend(v10, "startAnimating");

}

- (void)_removeRippleView
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Stop ripple animation", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRippleAnnotation rippleView](self->_rippleAnnotation, "rippleView"));
  objc_msgSend(v5, "stopAnimating");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));
  objc_msgSend(v7, "removeAnnotation:", self->_rippleAnnotation);

}

- (void)_appendMapItem:(id)a3 isCurrentLocation:(BOOL)a4 isCoordinate:(BOOL)a5
{
  id v8;
  id v9;
  void ***v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;
  BOOL v32;
  BOOL v33;
  id location;
  id v35;
  void *v36;
  uint8_t buf[4];
  id v38;

  v8 = a3;
  -[GEOMapServiceTicket cancel](self->_currentReverseGeocodeTicket, "cancel");
  objc_initWeak(&location, self);
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_100644420;
  v29 = &unk_1011BED38;
  objc_copyWeak(&v31, &location);
  v32 = a4;
  v9 = v8;
  v30 = v9;
  v33 = a5;
  v10 = objc_retainBlock(&v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService", v26, v27, v28, v29));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "defaultUserInitiatedTraits"));

  if ((objc_msgSend(v9, "_hasMUID") & 1) == 0)
  {
    v22 = sub_1004320DC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Reverse geocoding and appending mapItem: %@", buf, 0xCu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v9, "_coordinate");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ticketForReverseGeocodeCoordinate:traits:", v12));

    v25 = &_dispatch_main_q;
    objc_msgSend(v20, "submitWithHandler:queue:networkActivity:", v10, &_dispatch_main_q, 0);
    goto LABEL_9;
  }
  v13 = objc_msgSend(v9, "_hasResolvablePartialInformation");
  v14 = sub_1004320DC();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Refining map item and appending mapItem: %@", buf, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_identifier"));
    v36 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ticketForIdentifiers:traits:", v19, v12));

    v21 = &_dispatch_main_q;
    objc_msgSend(v20, "submitWithHandler:queue:networkActivity:", v10, &_dispatch_main_q, 0);
LABEL_9:

    goto LABEL_13;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138412290;
    v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Appending mapItem without reverse geocoding: %@", buf, 0xCu);
  }

  v35 = v9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  ((void (*)(void ***, void *, _QWORD))v10[2])(v10, v20, 0);
LABEL_13:

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

- (void)_appendAnchorPoint:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  MNRouteEditor *routeEditor;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Appending anchor point: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  routeEditor = self->_routeEditor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100644A78;
  v9[3] = &unk_1011B2260;
  objc_copyWeak(&v11, (id *)buf);
  v8 = v4;
  v10 = v8;
  -[MNRouteEditor validateAnchorPoint:handler:](routeEditor, "validateAnchorPoint:handler:", v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

- (BOOL)_wouldDuplicateTrailingAnchorWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anchorPoints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  objc_msgSend(v7, "locationCoordinate");
  v11 = vabdd_f64(latitude, v10) < 0.000000999999997
     && vabdd_f64(longitude, v8) < 0.000000999999997
     && vabdd_f64(1.79769313e308, v9) < 0.000000999999997;

  return v11;
}

- (void)_appendCoordinate:(CLLocationCoordinate2D)a3 isCurrentLocation:(BOOL)a4
{
  _BOOL8 v4;
  double longitude;
  double latitude;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  double v15;

  v4 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  if (-[MapsRouteCreationContext _wouldDuplicateTrailingAnchorWithCoordinate:](self, "_wouldDuplicateTrailingAnchorWithCoordinate:"))
  {
    v8 = sub_1004320DC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v13 = latitude;
      v14 = 2048;
      v15 = longitude;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Dropping appending coordinate: %f, %f", buf, 0x16u);
    }

  }
  else
  {
    if (!v4)
      -[MapsRouteCreationContext _insertRippleAnnotationAtCoordinate:](self, "_insertRippleAnnotationAtCoordinate:", latitude, longitude);
    -[UINotificationFeedbackGenerator notificationOccurred:](self->_notificationGenerator, "notificationOccurred:", 0);
    -[MapsRouteCreationContext _expandCardIfNeeded](self, "_expandCardIfNeeded");
    v11 = objc_msgSend(objc_alloc((Class)MKPlacemark), "initWithCoordinate:", latitude, longitude);
    v10 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v11);
    -[MapsRouteCreationContext _appendMapItem:isCurrentLocation:isCoordinate:](self, "_appendMapItem:isCurrentLocation:isCoordinate:", v10, v4, 1);

  }
}

- (void)_deleteFirstAnchorPointMatchingAnchorPoint:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Deleting first anchor point: %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instanceByRemovingFirstAnchorPoint:", v4));
  -[MapsRouteCreationContext _pushEditState:shouldRecenterOnCompletion:](self, "_pushEditState:shouldRecenterOnCompletion:", v8, 0);

}

- (void)_deleteLastAnchorPointMatchingAnchorPoint:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Deleting last anchor point: %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instanceByRemovingLastAnchorPoint:", v4));
  -[MapsRouteCreationContext _pushEditState:shouldRecenterOnCompletion:](self, "_pushEditState:shouldRecenterOnCompletion:", v8, 0);

}

- (void)pressedUndo
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[MapsRouteCreationContext pressedUndo]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[NSUndoManager undo](self->_undoManager, "undo");
}

- (void)pressedReverse
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[MapsRouteCreationContext pressedReverse]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (-[MapsRouteCreationContext reverseEnabled](self, "reverseEnabled"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject instanceByReversingAnchorPoints](v5, "instanceByReversingAnchorPoints"));
    -[MapsRouteCreationContext _pushEditState:shouldRecenterOnCompletion:](self, "_pushEditState:shouldRecenterOnCompletion:", v6, 1);

  }
  else
  {
    v7 = sub_1004320DC();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Reverse is disabled; ignoring",
        (uint8_t *)&v8,
        2u);
    }
  }

}

- (void)pressedOutAndBack
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[MapsRouteCreationContext pressedOutAndBack]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (-[MapsRouteCreationContext outAndBackEnabled](self, "outAndBackEnabled"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject instanceByFormingOutAndBackAnchors](v5, "instanceByFormingOutAndBackAnchors"));
    -[MapsRouteCreationContext _pushEditState:shouldRecenterOnCompletion:](self, "_pushEditState:shouldRecenterOnCompletion:", v6, 1);

  }
  else
  {
    v7 = sub_1004320DC();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Out and back is disabled; ignoring",
        (uint8_t *)&v8,
        2u);
    }
  }

}

- (void)pressedCloseLoop
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[MapsRouteCreationContext pressedCloseLoop]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (-[MapsRouteCreationContext closeLoopEnabled](self, "closeLoopEnabled"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject instanceByClosingTheLoop](v5, "instanceByClosingTheLoop"));
    -[MapsRouteCreationContext _pushEditState:shouldRecenterOnCompletion:](self, "_pushEditState:shouldRecenterOnCompletion:", v6, 1);

  }
  else
  {
    v7 = sub_1004320DC();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Close loop is disabled; ignoring",
        (uint8_t *)&v8,
        2u);
    }
  }

}

- (BOOL)undoEnabled
{
  void *v3;
  void *v4;
  MapsSaveRouteContainee *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "reason"))
  {
    v5 = (MapsSaveRouteContainee *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_containees, "lastObject"));
    v6 = v5 != self->_saveContainee;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)reverseEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anchorPoints"));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (BOOL)outAndBackEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anchorPoints"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isOutAndBackAllowed");

  return v4;
}

- (BOOL)closeLoopEnabled
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anchorPoints"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "startAndEndAreTheSame") ^ 1;

  return v4;
}

- (void)pressedStartNavigationWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  GEOComposedRoute *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  GEOComposedRoute *v16;
  _QWORD v17[4];
  GEOComposedRoute *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;

  v4 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[MapsRouteCreationContext pressedStartNavigationWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3001, 131, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "resetForcedExploreModernMapFlag");

  v8 = self->_composedRoute;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute userProvidedName](v8, "userProvidedName"));
  if (objc_msgSend(v9, "length"))
    v10 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute userProvidedName](v8, "userProvidedName"));
  else
    v10 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](v8, "name"));
  v11 = (void *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_platformController"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100645770;
  v17[3] = &unk_1011B75E8;
  v18 = v8;
  v19 = v11;
  v20 = v4;
  v14 = v4;
  v15 = v11;
  v16 = v8;
  objc_msgSend(v13, "pushNavigationWithRoute:navigationMode:shouldCheckNavSafetyAlert:completion:", v16, 1, 1, v17);

}

- (void)pressedStartSteppingWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  GEOComposedRoute *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  GEOComposedRoute *v16;
  _QWORD v17[4];
  GEOComposedRoute *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;

  v4 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[MapsRouteCreationContext pressedStartSteppingWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3001, 131, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "resetForcedExploreModernMapFlag");

  v8 = self->_composedRoute;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute userProvidedName](v8, "userProvidedName"));
  if (objc_msgSend(v9, "length"))
    v10 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute userProvidedName](v8, "userProvidedName"));
  else
    v10 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](v8, "name"));
  v11 = (void *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_platformController"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1006459F8;
  v17[3] = &unk_1011B75E8;
  v18 = v8;
  v19 = v11;
  v20 = v4;
  v14 = v4;
  v15 = v11;
  v16 = v8;
  objc_msgSend(v13, "pushNavigationWithRoute:navigationMode:shouldCheckNavSafetyAlert:completion:", v16, 2, 1, v17);

}

- (void)pressedRoutePlanning
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  MapsRouteCreationContext *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[MapsRouteCreationContext pressedRoutePlanning]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6003, 131, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "resetForcedExploreModernMapFlag");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contexts"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
      v14 = objc_opt_class(BaseModeController);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v15 = v13;

    if (!v15)
      goto LABEL_14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100645E04;
    v24[3] = &unk_1011AC8B0;
    v25 = v15;
    v26 = self;
    v17 = v15;
    objc_msgSend(v16, "popToContext:animated:completion:", v17, 0, v24);

  }
  else
  {
LABEL_11:

LABEL_14:
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v32 = "-[MapsRouteCreationContext pressedRoutePlanning]";
      v33 = 2080;
      v34 = "MapsRouteCreationContext.m";
      v35 = 1024;
      v36 = 924;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v32 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v23 = sub_1004320DC();
    v17 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Missing base mode controller for pushing route planning", buf, 2u);
    }
  }

}

- (void)pressedSave
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed save", v5, 2u);
  }

  -[MapsRouteCreationContext pushSaveContainee](self, "pushSaveContainee");
}

- (void)pressedRecenter
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed recenter", v5, 2u);
  }

  -[MapsRouteCreationContext _centerOnCurrentRouteAnimated:](self, "_centerOnCurrentRouteAnimated:", 1);
}

- (id)emptyStateVideoName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContainee traitCollection](self->_editContainee, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anchorPoints"));
  v7 = objc_msgSend(v6, "count");

  if (v7 == (id)1)
  {
    v8 = CFSTR("Coaching_Continue_Light");
    v9 = CFSTR("Coaching_Continue_Dark");
  }
  else
  {
    if (v7)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v8 = CFSTR("Coaching_Start_Light");
    v9 = CFSTR("Coaching_Start_Dark");
  }
  if (v5 == (id)2)
    v8 = (__CFString *)v9;
  v10 = v8;
LABEL_9:

  return v10;
}

- (void)_updateUndoVisibility
{
  id v3;
  NSObject *v4;
  _DWORD v5[2];

  -[CardView setHidden:](self->_undoButtonContainer, "setHidden:", -[MapsRouteCreationContext undoEnabled](self, "undoEnabled") ^ 1);
  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = !-[MapsRouteCreationContext undoEnabled](self, "undoEnabled");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_updateUndoVisibility: undo hidden: %d", (uint8_t *)v5, 8u);
  }

}

- (void)_setMenuAttachedAnchorPoint:(id)a3
{
  GEOComposedRouteAnchorPoint *v4;
  id v5;
  NSObject *v6;
  GEOComposedRouteAnchorPoint *anchorPointAttachedToMenu;
  int v8;
  GEOComposedRouteAnchorPoint *v9;

  v4 = (GEOComposedRouteAnchorPoint *)a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting _anchorPointAttachedToMenu to %p", (uint8_t *)&v8, 0xCu);
  }

  anchorPointAttachedToMenu = self->_anchorPointAttachedToMenu;
  self->_anchorPointAttachedToMenu = v4;

}

- (void)_moveContextMenuToPoint:(CGPoint)a3 anchorPoint:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[16];

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsMenuButton superview](self->_contextMenuFakeButton, "superview", a4));

  if (v7)
  {
    -[MapsMenuButton setFrame:](self->_contextMenuFakeButton, "setFrame:", x, y, 1.0, 1.0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006463F0;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v8 = sub_1004320DC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Aborting context menu presentation", buf, 2u);
    }

    -[MapsRouteCreationContext _setMenuAttachedAnchorPoint:](self, "_setMenuAttachedAnchorPoint:", 0);
  }
}

- (void)_centerOnCurrentRouteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  GEOComposedRoute *composedRoute;
  uint8_t buf[4];
  _BOOL4 v14;

  v3 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_centerOnCurrentRouteAnimated: %d", buf, 8u);
  }

  v7 = 0.3;
  if (!v3)
    v7 = 0.0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006465E0;
  v11[3] = &unk_1011AC860;
  v11[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, v7);
  if (self->_composedRoute)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapCameraController"));
    composedRoute = self->_composedRoute;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &composedRoute, 1));
    objc_msgSend(v9, "frameRoutes:includeCompassInset:animated:completion:", v10, 0, v3, 0);

  }
}

- (void)menuWillDismissWithAnimator:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[MapsRouteCreationContext menuWillDismissWithAnimator:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1006467B0;
  v12[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  v7 = objc_retainBlock(v12);
  v8 = v7;
  if (v4)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100646814;
    v10[3] = &unk_1011ADA00;
    v11 = v7;
    objc_msgSend(v4, "addCompletion:", v10);

  }
  else
  {
    v9 = dispatch_time(0, 100000000);
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v8);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (id)routeData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentData"));

  return v3;
}

- (void)_pushEditState:(id)a3 shouldRecenterOnCompletion:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableArray *editStack;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = a4;
  editStack = self->_editStack;
  v7 = a3;
  -[NSMutableArray addObject:](editStack, "addObject:", v7);
  -[NSUndoManager registerUndoWithTarget:selector:object:](self->_undoManager, "registerUndoWithTarget:selector:object:", self, "_undoEditStack:", 0);
  v8 = sub_100387538((uint64_t)objc_msgSend(v7, "reason"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSUndoManager setActionName:](self->_undoManager, "setActionName:", v9);

  v10 = objc_msgSend(v7, "reason");
  -[MapsRouteCreationContext _requeryStateWithAction:shouldRecenterOnCompletion:](self, "_requeryStateWithAction:shouldRecenterOnCompletion:", -[MapsRouteCreationContext _routeEditorActionForEditReason:](self, "_routeEditorActionForEditReason:", v10), v4);
  -[MapsRouteCreationContext _updateCoachingPillWithIgnoreChromeTransitioning:](self, "_updateCoachingPillWithIgnoreChromeTransitioning:", 0);
}

- (void)_undoEditStack:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject", a3));
  -[NSUndoManager registerUndoWithTarget:selector:object:](self->_undoManager, "registerUndoWithTarget:selector:object:", self, "_undoEditStack:", v6);
  v4 = sub_100387538((uint64_t)objc_msgSend(v6, "reason"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSUndoManager setActionName:](self->_undoManager, "setActionName:", v5);

  -[MapsRouteCreationContext _popEditStack](self, "_popEditStack");
}

- (void)_popEditStack
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  if (!objc_msgSend(v3, "reason"))
    +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("You should never be able to pop the initial state"));
  -[NSMutableArray removeLastObject](self->_editStack, "removeLastObject");
  -[MapsRouteCreationContext _requeryStateWithAction:shouldRecenterOnCompletion:](self, "_requeryStateWithAction:shouldRecenterOnCompletion:", 1001, 0);
  -[MapsRouteCreationContext _updateCoachingPillWithIgnoreChromeTransitioning:](self, "_updateCoachingPillWithIgnoreChromeTransitioning:", 0);

}

- (unint64_t)_routeEditorActionForEditReason:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return qword_100E39B18[a3 - 1];
}

- (void)_requeryStateWithAction:(unint64_t)a3 shouldRecenterOnCompletion:(BOOL)a4
{
  void *v7;
  void *v8;
  id v9;
  GEOComposedRoute *composedRoute;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  GEORouteAttributes *v21;
  void *v22;
  unsigned __int8 v23;
  MNRouteEditor *routeEditor;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  BOOL v30;
  unsigned __int8 v31;
  id location;

  -[MapsRouteCreationContext _updateUndoVisibility](self, "_updateUndoVisibility");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anchorPoints"));
  v9 = objc_msgSend(v8, "count");

  if ((unint64_t)v9 > 1)
  {
    v18 = (void *)objc_opt_new(MNRouteEditorRequest);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anchorPoints"));
    objc_msgSend(v18, "setAnchorPoints:", v19);

    objc_msgSend(v18, "setAction:", a3);
    objc_msgSend(v18, "setCurrentRoute:", self->_composedRoute);
    if (a3 - 1001 <= 1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routePersistentData"));
      objc_msgSend(v18, "setUndoRedoRouteData:", v20);

    }
    v21 = objc_opt_new(GEORouteAttributes);
    -[GEORouteAttributes setMainTransportType:](v21, "setMainTransportType:", 2);
    -[GEORouteAttributes setIncludeRoutingPathLeg:](v21, "setIncludeRoutingPathLeg:", 1);
    objc_msgSend(v18, "setRouteAttributes:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v23 = objc_msgSend(v22, "isUsingOfflineMaps");

    objc_initWeak(&location, self);
    routeEditor = self->_routeEditor;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100646D3C;
    v26[3] = &unk_1011BED60;
    objc_copyWeak(&v29, &location);
    v27 = v7;
    v30 = a4;
    v12 = v18;
    v28 = v12;
    v31 = v23;
    v25 = -[MNRouteEditor requestRouteGeometry:finishedHandler:](routeEditor, "requestRouteGeometry:finishedHandler:", v12, v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  else
  {
    composedRoute = self->_composedRoute;
    self->_composedRoute = 0;

    -[MapsRouteCreationContainee setRoute:](self->_editContainee, "setRoute:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anchorPoints"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayInfo"));
    objc_msgSend(v13, "_routeCreation_setStartWaypointCaption");

    if (objc_msgSend(v12, "isCurrentLocation"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayInfo"));
      objc_msgSend(v14, "_routeCreation_setMyLocationName");

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v15, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapSelectionManager"));
    objc_msgSend(v17, "clearSelection");

    -[CardView removeFromSuperview](self->_recenterButtonContainer, "removeFromSuperview");
    -[UIButton removeFromSuperview](self->_recenterButton, "removeFromSuperview");
  }

}

- (id)_mostRecentlyAddedAnchor
{
  void *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v4 = (char *)-[NSMutableArray count](self->_editStack, "count") - 2;
  if (v4 < -[NSMutableArray count](self->_editStack, "count")
    && (v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_editStack, "objectAtIndexedSubscript:", v4))) != 0)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anchorPoints"));
    v8 = objc_msgSend(v7, "copy");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchorPoints"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13), "uniqueID"));
          objc_msgSend(v8, "removeAnchorPointWithID:", v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anchorPoints"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  }

  return v15;
}

- (id)_errorMessageForUnsupportedCountry:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Custom Routes generic unavailability"), CFSTR("localized string not found"), 0));

  return v4;
}

- (id)_errorMessageForError:(id)a3 directionsError:(id)a4 request:(id)a5 isOffline:(BOOL)a6 shouldBackoutEdit:(BOOL *)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  _BOOL8 v21;
  id v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v41[5];

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1006478D0;
  v41[3] = &unk_1011ACF48;
  v41[4] = a7;
  v13 = objc_retainBlock(v41);
  if (!v12 || !objc_msgSend(v12, "problemDetailsCount"))
  {
LABEL_17:
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    v27 = objc_msgSend(v26, "isEqual:", MNErrorDomain);

    if (v27)
    {
      v28 = objc_msgSend(v11, "code");
      if (v28 == (id)9)
      {
        ((void (*)(_QWORD *))v13[2])(v13);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", MNRouteEditorErrorUnsupportedCountriesKey));

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "anyObject"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _errorMessageForUnsupportedCountry:](self, "_errorMessageForUnsupportedCountry:", v39));

        goto LABEL_30;
      }
      if (v28 == (id)8)
      {
        ((void (*)(_QWORD *))v13[2])(v13);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
        v30 = sub_1002A8AA0(v29);

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v32 = v31;
        if (v30 == 5)
          v33 = CFSTR("[Route Creation] Anchor too far MacOS");
        else
          v33 = CFSTR("[Route Creation] Anchor too far");
        goto LABEL_29;
      }
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    if (objc_msgSend(v34, "isEqual:", NSURLErrorDomain))
    {

    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
      v36 = objc_msgSend(v35, "isEqual:", kCFErrorDomainCFNetwork);

      if (!v36)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v32 = v31;
        v33 = CFSTR("[Route Creation] Default error message");
        goto LABEL_29;
      }
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = v31;
    v33 = CFSTR("[Route Creation] Network error message");
LABEL_29:
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", v33, CFSTR("localized string not found"), 0));

    goto LABEL_30;
  }
  v14 = 0;
  v15 = MKPlaceCollectionsLogicController_ptr;
  while (2)
  {
    switch(objc_msgSend(v12, "problemDetailAtIndex:", v14))
    {
      case 2u:
      case 5u:
      case 0xDu:
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
        v17 = sub_1002A8AA0(v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[307], "mainBundle"));
        v19 = v18;
        if (v17 == 5)
          v20 = CFSTR("[Route Creation] Anchor too far MacOS");
        else
          v20 = CFSTR("[Route Creation] Anchor too far");
        goto LABEL_14;
      case 3u:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _mostRecentlyAddedAnchor](self, "_mostRecentlyAddedAnchor"));
        v21 = v8;
        v22 = v11;
        v23 = v13;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "countryCode"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext _errorMessageForUnsupportedCountry:](self, "_errorMessageForUnsupportedCountry:", v24));

        v13 = v23;
        v11 = v22;
        v8 = v21;
        v15 = MKPlaceCollectionsLogicController_ptr;
        goto LABEL_15;
      case 4u:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[307], "mainBundle"));
        v19 = v18;
        v20 = CFSTR("[Route Creation] Custom Routes no pedestrians");
        goto LABEL_14;
      case 9u:
      case 0x12u:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[307], "mainBundle"));
        v19 = v18;
        v20 = CFSTR("[Route Creation] Custom Routes too far");
        goto LABEL_14;
      case 0x15u:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[307], "mainBundle"));
        v19 = v18;
        v20 = CFSTR("[Route Creation] Custom Routes too many anchors");
        goto LABEL_14;
      case 0x16u:
        if (!v8)
          goto LABEL_16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[307], "mainBundle"));
        v19 = v18;
        v20 = CFSTR("[Route Creation] Offline route creation error");
LABEL_14:
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, CFSTR("localized string not found"), 0));
LABEL_15:

        if (!v25)
        {
LABEL_16:
          if (++v14 >= (unint64_t)objc_msgSend(v12, "problemDetailsCount"))
            goto LABEL_17;
          continue;
        }
        ((void (*)(_QWORD *))v13[2])(v13);
LABEL_30:

        return v25;
      default:
        goto LABEL_16;
    }
  }
}

- (void)_presentPopupViewForMessage:(id)a3 timeout:(double)a4 isError:(BOOL)a5 ignoreChromeTransitioning:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void ***v14;
  void *v15;
  void *v16;
  unsigned int v17;
  MapsPopupMessageView *popupMessageView;
  double v19;
  void *v20;
  _BOOL4 v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27[2];
  BOOL v28;
  BOOL v29;
  uint8_t buf[4];
  id v31;

  v10 = a3;
  v11 = sub_1004320DC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Presenting popup for message: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_100647B20;
  v25 = &unk_1011BED88;
  objc_copyWeak(v27, (id *)buf);
  v28 = a6;
  v13 = v10;
  v26 = v13;
  v27[1] = *(id *)&a4;
  v29 = a5;
  v14 = objc_retainBlock(&v22);
  if (-[MapsPopupMessageView isDismissing](self->_popupMessageView, "isDismissing", v22, v23, v24, v25)
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView superview](self->_popupMessageView, "superview"))) == 0
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView message](self->_popupMessageView, "message")),
        v17 = objc_msgSend(v16, "isEqual:", v13),
        v16,
        v15,
        !v17))
  {
    popupMessageView = self->_popupMessageView;
    if (!popupMessageView)
    {
      ((void (*)(void ***))v14[2])(v14);
      goto LABEL_14;
    }
    if (!a5)
    {
      -[MapsPopupMessageView timeout](popupMessageView, "timeout");
      popupMessageView = self->_popupMessageView;
      if (v19 > 2.22044605e-16)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView superview](popupMessageView, "superview"));
        v21 = v20 == 0;

        if (!v21)
          goto LABEL_14;
        popupMessageView = self->_popupMessageView;
      }
    }
    -[MapsPopupMessageView dismissAnimated:completion:](popupMessageView, "dismissAnimated:completion:", 1, v14);
    goto LABEL_14;
  }
  -[MapsPopupMessageView resetTimerAnimated:](self->_popupMessageView, "resetTimerAnimated:", 1);
LABEL_14:

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)buf);

}

- (void)_backoutLastState
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Programmatically undoing last action", v5, 2u);
  }

  -[NSUndoManager undo](self->_undoManager, "undo");
}

- (BOOL)wantsCompassLayoutControl
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v3 = sub_1002A8AA0(v2) != 5;

  return v3;
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration
{
  RouteAnnotationsMutableConfiguration *v3;
  void *v4;
  RouteAnnotationsMutableConfiguration *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [RouteAnnotationsMutableConfiguration alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext composedRoute](self, "composedRoute"));
  v5 = -[RouteAnnotationsConfiguration initWithRoute:](v3, "initWithRoute:", v4);

  -[RouteAnnotationsConfiguration setRouteTrafficFeaturesActive:](v5, "setRouteTrafficFeaturesActive:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchorPoints"));
  -[RouteAnnotationsConfiguration setAnchorPoints:](v5, "setAnchorPoints:", v7);

  v8 = -[RouteAnnotationsMutableConfiguration copy](v5, "copy");
  return (RouteAnnotationsConfiguration *)v8;
}

- (void)_insertEditStackButtons
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
  _QWORD v27[4];
  _QWORD v28[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewport"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_undoButtonContainer, "contentView"));
  objc_msgSend(v5, "addSubview:", self->_undoButton);

  objc_msgSend(v4, "addSubview:", self->_undoButtonContainer);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CardView leadingAnchor](self->_undoButtonContainer, "leadingAnchor"));
  v26 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 10.0));
  v28[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](self->_undoButtonContainer, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -10.0));
  v28[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_undoButton, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CardView leadingAnchor](self->_undoButtonContainer, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v27[0] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_undoButton, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CardView trailingAnchor](self->_undoButtonContainer, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v13));
  v27[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_undoButton, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CardView topAnchor](self->_undoButtonContainer, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v27[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_undoButton, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](self->_undoButtonContainer, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v27[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  -[MapsRouteCreationContext _updateUndoVisibility](self, "_updateUndoVisibility");
}

- (void)_insertRecenterButtonIfNeeded
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
  _QWORD v28[4];
  _QWORD v29[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CardView superview](self->_recenterButtonContainer, "superview"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_recenterButtonContainer, "contentView"));
    objc_msgSend(v4, "addSubview:", self->_recenterButton);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewport"));

    objc_msgSend(v6, "addSubview:", self->_recenterButtonContainer);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CardView trailingAnchor](self->_recenterButtonContainer, "trailingAnchor"));
    v27 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -10.0));
    v29[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](self->_recenterButtonContainer, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -10.0));
    v29[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_recenterButton, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CardView leadingAnchor](self->_recenterButtonContainer, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v28[0] = v24;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_recenterButton, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CardView trailingAnchor](self->_recenterButtonContainer, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v28[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_recenterButton, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CardView topAnchor](self->_recenterButtonContainer, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v28[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_recenterButton, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](self->_recenterButtonContainer, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v28[3] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  }
}

- (void)_removeEditStackButtons
{
  -[CardView removeFromSuperview](self->_undoButtonContainer, "removeFromSuperview");
  -[UIButton removeFromSuperview](self->_undoButton, "removeFromSuperview");
  -[CardView removeFromSuperview](self->_recenterButtonContainer, "removeFromSuperview");
  -[UIButton removeFromSuperview](self->_recenterButton, "removeFromSuperview");
}

- (void)_expandCardIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("__internal_EnableAutomaticCardExpanion"));

  if (v4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_containees, "lastObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
    v6 = objc_msgSend(v5, "containeeLayout");

    if (v6 == (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
      objc_msgSend(v7, "wantsExpandLayout");

    }
  }
}

- (void)_updateMenu
{
  GEOComposedRouteAnchorPoint *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
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
  id v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  void *i;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  UIMenu *v54;
  UIMenu *menu;
  NSMutableArray *v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  uint8_t v73[128];
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;

  v3 = self->_anchorPointAttachedToMenu;
  v4 = sub_1004320DC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v75 = (const char *)v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Building context menu with %@", buf, 0xCu);
  }

  if (v3)
  {
    objc_initWeak((id *)buf, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchorPoints"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    if ((objc_msgSend(v8, "isEqual:", v3) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
      v9 = objc_msgSend(v15, "isEqual:", v3);

    }
    v56 = objc_opt_new(NSMutableArray);
    if ((-[MapsRouteCreationContext reverseEnabled](self, "reverseEnabled") & v9) == 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Menu Option Reverse"), CFSTR("localized string not found"), 0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.arrow.down")));
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100648F98;
      v71[3] = &unk_1011AF8A0;
      objc_copyWeak(&v72, (id *)buf);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v71));

      -[NSMutableArray addObject:](v56, "addObject:", v19);
      objc_destroyWeak(&v72);
    }
    if ((-[MapsRouteCreationContext outAndBackEnabled](self, "outAndBackEnabled") & v9) == 1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Menu Option Out-n-Back"), CFSTR("localized string not found"), 0));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath.fill")));
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100648FD0;
      v69[3] = &unk_1011AF8A0;
      objc_copyWeak(&v70, (id *)buf);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v21, v22, 0, v69));

      -[NSMutableArray addObject:](v56, "addObject:", v23);
      objc_destroyWeak(&v70);
    }
    if ((-[MapsRouteCreationContext closeLoopEnabled](self, "closeLoopEnabled") & v9) == 1)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Menu Option Close Loop"), CFSTR("localized string not found"), 0));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("point.forward.to.point.capsulepath.fill")));
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100649008;
      v67[3] = &unk_1011AF8A0;
      objc_copyWeak(&v68, (id *)buf);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v25, v26, 0, v67));

      -[NSMutableArray addObject:](v56, "addObject:", v27);
      objc_destroyWeak(&v68);
    }
    v65 = 0u;
    v66 = 0u;
    v64 = 0u;
    v63 = 0u;
    v28 = v7;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v29)
    {
      v30 = 0;
      v31 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i), "locationCoordinate");
          v34 = v33;
          v36 = v35;
          v38 = v37;
          -[GEOComposedRouteAnchorPoint locationCoordinate](v3, "locationCoordinate");
          if (vabdd_f64(v34, v41) < 0.000000999999997
            && vabdd_f64(v36, v39) < 0.000000999999997
            && fabs(v38 - v40) < 0.000000999999997)
          {
            ++v30;
          }
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v29);

      if (v30 >= 2)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Delete First Anchor"), CFSTR("localized string not found"), 0));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100649040;
        v61[3] = &unk_1011AF8A0;
        v45 = &v62;
        objc_copyWeak(&v62, (id *)buf);
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v43, v44, 0, v61));

        objc_msgSend(v46, "setAttributes:", 2);
        -[NSMutableArray addObject:](v56, "addObject:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Delete Last Anchor"), CFSTR("localized string not found"), 0));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_100649078;
        v59[3] = &unk_1011AF8A0;
        objc_copyWeak(&v60, (id *)buf);
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v48, v49, 0, v59));

        objc_msgSend(v50, "setAttributes:", 2);
        -[NSMutableArray addObject:](v56, "addObject:", v50);

        objc_destroyWeak(&v60);
LABEL_34:

        objc_destroyWeak(v45);
        v54 = (UIMenu *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v56));
        menu = self->_menu;
        self->_menu = v54;

        objc_destroyWeak((id *)buf);
        goto LABEL_35;
      }
    }
    else
    {

    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Delete Anchor"), CFSTR("localized string not found"), 0));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1006490B0;
    v57[3] = &unk_1011AF8A0;
    v45 = &v58;
    objc_copyWeak(&v58, (id *)buf);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v52, v53, 0, v57));

    objc_msgSend(v46, "setAttributes:", 2);
    -[NSMutableArray addObject:](v56, "addObject:", v46);
    goto LABEL_34;
  }
  v10 = sub_1004318FC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v75 = "-[MapsRouteCreationContext _updateMenu]";
    v76 = 2080;
    v77 = "MapsRouteCreationContext.m";
    v78 = 1024;
    v79 = 1481;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v75 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
LABEL_35:

}

- (void)_updateScaleAndCompass
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView superview](self->_popupMessageView, "superview"));
  v4 = v3 == 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));

  objc_msgSend(v8, "setShowsScale:", v4);
  objc_msgSend(v8, "setShowsCompass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v7 = sub_1002A8AA0(v6);

  if (v7 != 5 && !v3)
  {
    objc_msgSend(v8, "_compassInsets");
    objc_msgSend(v8, "_setCompassInsets:", 0.0);
  }

}

- (void)_updateCoachingPillWithIgnoreChromeTransitioning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  MapsPopupMessageView *popupMessageView;
  _QWORD v20[4];
  id v21;
  id location;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_editStack, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anchorPoints"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContext chromeViewController](self, "chromeViewController"));
  v8 = sub_1002A8AA0(v7);

  if (!objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("[Route Creation] Empty State Start");
    v12 = CFSTR("[Route Creation] Empty State Start MacOS");
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "count") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("[Route Creation] Empty State Continue");
    v12 = CFSTR("[Route Creation] Empty State Continue MacOS");
LABEL_5:
    if (v8 == 5)
      v13 = v12;
    else
      v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));

    -[MapsRouteCreationContext _presentPopupViewForMessage:timeout:isError:ignoreChromeTransitioning:](self, "_presentPopupViewForMessage:timeout:isError:ignoreChromeTransitioning:", v14, 0, v3, 0.0);
    goto LABEL_9;
  }
  v15 = objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView superview](self->_popupMessageView, "superview"));
  if (v15)
  {
    v16 = (void *)v15;
    -[MapsPopupMessageView timeout](self->_popupMessageView, "timeout");
    v18 = v17;

    if (v18 <= 2.22044605e-16)
    {
      objc_initWeak(&location, self);
      popupMessageView = self->_popupMessageView;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100649394;
      v20[3] = &unk_1011AD260;
      objc_copyWeak(&v21, &location);
      -[MapsPopupMessageView dismissAnimated:completion:](popupMessageView, "dismissAnimated:completion:", 1, v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
LABEL_9:

}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedRoute, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_rippleAnnotation, 0);
  objc_storeStrong((id *)&self->_notificationGenerator, 0);
  objc_storeStrong((id *)&self->_popupMessageView, 0);
  objc_storeStrong(&self->_hikingMapToken, 0);
  objc_storeStrong((id *)&self->_contextMenuFakeButton, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_anchorPointAttachedToMenu, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_recenterButtonContainer, 0);
  objc_storeStrong((id *)&self->_undoButtonContainer, 0);
  objc_storeStrong((id *)&self->_currentReverseGeocodeTicket, 0);
  objc_storeStrong((id *)&self->_editStack, 0);
  objc_storeStrong((id *)&self->_routeEditor, 0);
  objc_storeStrong((id *)&self->_containees, 0);
  objc_storeStrong((id *)&self->_saveContainee, 0);
  objc_storeStrong((id *)&self->_editContainee, 0);
}

@end
