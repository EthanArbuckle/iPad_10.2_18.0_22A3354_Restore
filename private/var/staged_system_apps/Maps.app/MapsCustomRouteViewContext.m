@implementation MapsCustomRouteViewContext

- (MapsCustomRouteViewContext)initWithExistingRoute:(id)a3
{
  id v5;
  MapsCustomRouteViewContext *v6;
  MapsCustomRouteViewContext *v7;
  uint64_t v8;
  GEOComposedGeometryRoutePersistentData *routeData;
  MapsCustomRouteViewContainee *v10;
  MapsCustomRouteViewContainee *customRouteViewContainee;
  uint64_t v12;
  NSMutableArray *containees;
  MapsSaveRouteContainee *v14;
  MapsSaveRouteContainee *saveRouteContainee;
  CardView *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  CardView *recenterButtonContainer;
  CardView *v30;
  UIButton *v31;
  void *v32;
  void *v33;
  void *v34;
  UIButton *recenterButton;
  CardView *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  UIButton *v46;
  void *v47;
  void *v48;
  id v49;
  objc_super v50;
  _QWORD v51[4];

  v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MapsCustomRouteViewContext;
  v6 = -[MapsCustomRouteViewContext init](&v50, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_composedRoute, a3);
    -[GEOComposedRoute updateCustomRouteStartEndCaptions](v7->_composedRoute, "updateCustomRouteStartEndCaptions");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentData"));
    routeData = v7->_routeData;
    v7->_routeData = (GEOComposedGeometryRoutePersistentData *)v8;

    v10 = -[MapsCustomRouteViewContainee initWithContext:]([MapsCustomRouteViewContainee alloc], "initWithContext:", v7);
    customRouteViewContainee = v7->_customRouteViewContainee;
    v7->_customRouteViewContainee = v10;

    -[ContaineeViewController setContaineeDelegate:](v7->_customRouteViewContainee, "setContaineeDelegate:", v7);
    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v7->_customRouteViewContainee));
    containees = v7->_containees;
    v7->_containees = (NSMutableArray *)v12;

    v14 = -[MapsSaveRouteContainee initWithDelegate:isEditing:showInitialKeyboard:]([MapsSaveRouteContainee alloc], "initWithDelegate:isEditing:showInitialKeyboard:", v7, 0, 1);
    saveRouteContainee = v7->_saveRouteContainee;
    v7->_saveRouteContainee = v14;

    v49 = v5;
    v16 = -[CardView initAllowingBlurredForButton:]([CardView alloc], "initAllowingBlurredForButton:", 1);
    -[CardView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CardView setLayoutStyle:](v16, "setLayoutStyle:", 6);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
    v18 = objc_msgSend(v17, "CGColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v16, "layer"));
    objc_msgSend(v19, "setBorderColor:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v16, "layer"));
    objc_msgSend(v20, "setCornerRadius:", 8.0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v16, "layer"));
    objc_msgSend(v21, "setBorderWidth:", 0.5);

    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
    v23 = objc_msgSend(v22, "CGColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v16, "layer"));
    objc_msgSend(v24, "setShadowColor:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v16, "layer"));
    LODWORD(v26) = *(_DWORD *)"\nף=";
    objc_msgSend(v25, "setShadowOpacity:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v16, "layer"));
    objc_msgSend(v27, "setShadowOffset:", 0.0, -2.0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](v16, "layer"));
    objc_msgSend(v28, "setShadowPathIsBounds:", 1);

    recenterButtonContainer = v7->_recenterButtonContainer;
    v7->_recenterButtonContainer = v16;
    v30 = v16;

    v31 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v31, "setAccessibilityIdentifier:", CFSTR("RecenterButton"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightSemibold));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v32));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("location.bottomleft.forward.to.point.topright.scurvepath"), v48));
    -[UIButton setImage:forState:](v31, "setImage:forState:", v33, 0);

    -[UIButton addTarget:action:forControlEvents:](v31, "addTarget:action:forControlEvents:", v7, "pressedRecenter", 64);
    -[CardView setAlpha:](v30, "setAlpha:", 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011B75C0));
    -[UIButton setTintColor:](v31, "setTintColor:", v34);

    -[UIButton imageEdgeInsets](v31, "imageEdgeInsets");
    -[UIButton setImageEdgeInsets:](v31, "setImageEdgeInsets:");
    recenterButton = v7->_recenterButton;
    v7->_recenterButton = v31;
    v46 = v31;

    v36 = v30;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CardView widthAnchor](v30, "widthAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", 44.0));
    v51[0] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CardView heightAnchor](v30, "heightAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToConstant:", 44.0));
    v51[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v7->_recenterButton, "widthAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:", 44.0));
    v51[2] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v7->_recenterButton, "heightAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", 44.0));
    v51[3] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

    v5 = v49;
  }

  return v7;
}

- (MapsCustomRouteViewContext)initWithExistingRouteData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  MapsCustomRouteViewContext *v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buildRoute"));
  v7 = -[MapsCustomRouteViewContext initWithExistingRoute:](self, "initWithExistingRoute:", v6);

  return v7;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3
{
  return 0;
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  return 0;
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

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (void)pushSuggestedNavigationMode:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  char *v31;
  id v32;
  MapsCustomRouteViewContext *v33;
  MapsCustomRouteViewContext *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  _QWORD v41[4];
  NSObject *v42;
  MapsCustomRouteViewContext *v43;
  id v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext composedRoute](self, "composedRoute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userProvidedName"));
  if (objc_msgSend(v8, "length"))
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userProvidedName"));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v10 = (void *)v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v11, "resetForcedExploreModernMapFlag");

  if (a3 - 1 < 3)
  {
    v12 = -[MapsCustomRouteViewContext _analyticsTarget](self, "_analyticsTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext _analyticsValue](self, "_analyticsValue"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3001, v12, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_maps_platformController"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100463E9C;
    v45[3] = &unk_1011B75E8;
    v46 = v7;
    v47 = v10;
    v48 = v6;
    objc_msgSend(v15, "pushNavigationWithRoute:navigationMode:shouldCheckNavSafetyAlert:completion:", v46, a3, 1, v45);

    v16 = v46;
LABEL_32:

    goto LABEL_33;
  }
  if (a3 == 4)
  {
    v17 = -[MapsCustomRouteViewContext _analyticsTarget](self, "_analyticsTarget");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext _analyticsValue](self, "_analyticsValue"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6003, v17, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contexts"));

    v20 = sub_10039E1FC(v16, &stru_1011B7608);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100463F8C;
      v41[3] = &unk_1011AECC0;
      v42 = v21;
      v43 = self;
      v44 = v6;
      objc_msgSend(v22, "popToContext:animated:completion:", v42, 0, v41);

      v23 = v42;
LABEL_30:

      goto LABEL_31;
    }
    v27 = sub_1004318FC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v50 = "-[MapsCustomRouteViewContext pushSuggestedNavigationMode:withCompletionHandler:]";
      v51 = 2080;
      v52 = "MapsCustomRouteViewContext.m";
      v53 = 1024;
      v54 = 243;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v29 = sub_1004318FC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v50 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v32 = sub_1004320DC();
    v23 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v33 = self;
    v34 = v33;
    if (!v33)
    {
      v40 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v35 = (objc_class *)objc_opt_class(v33);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v50 = (const char *)v40;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Missing base mode controller for pushing route planning", buf, 0xCu);

    goto LABEL_30;
  }
  v24 = sub_1004318FC();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v50 = "-[MapsCustomRouteViewContext pushSuggestedNavigationMode:withCompletionHandler:]";
    v51 = 2080;
    v52 = "MapsCustomRouteViewContext.m";
    v53 = 1024;
    v54 = 271;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v26 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_31:

    goto LABEL_32;
  }
LABEL_33:

}

- (void)pushSaveContaineeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  MapsCustomRouteViewContext *v7;
  MapsCustomRouteViewContext *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  id saveCompletionHandler;
  void *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  const char *v21;

  v4 = a3;
  v5 = sub_1004320DC();
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
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
    *(_DWORD *)buf = 138543618;
    v19 = v14;
    v20 = 2080;
    v21 = "-[MapsCustomRouteViewContext pushSaveContaineeWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

  }
  v15 = objc_retainBlock(v4);

  saveCompletionHandler = self->_saveCompletionHandler;
  self->_saveCompletionHandler = v15;

  -[NSMutableArray addObject:](self->_containees, "addObject:", self->_saveRouteContainee);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v17, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v5;
  NSObject *v6;
  MapsCustomRouteViewContext *v7;
  MapsCustomRouteViewContext *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  const char *v30;

  v5 = sub_1004320DC();
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
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
    *(_DWORD *)buf = 138543618;
    v28 = v14;
    v29 = 2080;
    v30 = "-[MapsCustomRouteViewContext containeeViewControllerGoToPreviousState:withSender:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

  }
  v15 = -[MapsCustomRouteViewContext exitRouteCreationOnClose](self, "exitRouteCreationOnClose");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
  v17 = v16;
  if (v15)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contexts"));

    if ((unint64_t)objc_msgSend(v18, "count") < 2)
    {
LABEL_17:
      v19 = 0;
    }
    else
    {
      v19 = 0;
      while (1)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v19 + 1));
        v21 = objc_opt_class(MapsCustomRouteViewContext);
        if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
          break;
        v22 = objc_opt_class(MapsRouteCreationContext);
        if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
          break;

        v23 = objc_msgSend(v18, "count");
        v24 = v19 + 2;
        ++v19;
        if (v24 >= (unint64_t)v23)
          goto LABEL_17;
      }

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v19));
    objc_msgSend(v25, "popToContext:animated:completion:", v26, 1, 0);

  }
  else
  {
    objc_msgSend(v16, "popContext:animated:completion:", self, 1, 0);
    v18 = v17;
  }

}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  return 1;
}

- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectAnnotationView:(id)a3
{
  return 1;
}

- (id)routeData
{
  return self->_routeData;
}

- (void)popContainee
{
  id v3;
  NSObject *v4;
  MapsCustomRouteViewContext *v5;
  MapsCustomRouteViewContext *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id saveCompletionHandler;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const char *v18;

  v3 = sub_1004320DC();
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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2080;
    v18 = "-[MapsCustomRouteViewContext popContainee]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

  }
  -[NSMutableArray removeLastObject](self->_containees, "removeLastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v13, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

  saveCompletionHandler = self->_saveCompletionHandler;
  self->_saveCompletionHandler = 0;

}

- (void)didSaveCustomRoute:(id)a3
{
  id v4;
  NSObject *v5;
  MapsCustomRouteViewContext *v6;
  MapsCustomRouteViewContext *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void (**saveCompletionHandler)(void);
  id v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  const char *v21;

  v4 = sub_1004320DC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v6 = self;
  v7 = v6;
  if (!v6)
  {
    v13 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v8 = (objc_class *)objc_opt_class(v6);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
    {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

      goto LABEL_8;
    }

  }
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v19 = v13;
  v20 = 2080;
  v21 = "-[MapsCustomRouteViewContext didSaveCustomRoute:]";
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

LABEL_11:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData storageID](self->_routeData, "storageID"));
  -[GEOComposedRoute setStorageID:](self->_composedRoute, "setStorageID:", v14);

  -[NSMutableArray removeLastObject](self->_containees, "removeLastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v15, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

  saveCompletionHandler = (void (**)(void))self->_saveCompletionHandler;
  if (saveCompletionHandler)
  {
    saveCompletionHandler[2]();
    v17 = self->_saveCompletionHandler;
    self->_saveCompletionHandler = 0;

  }
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  MapsCustomRouteViewContext *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  NSObject *v16;
  MapsCustomRouteViewContext *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;

  v4 = a3;
  if (!self->_userInteractedWithMap)
  {
    v5 = sub_1004320DC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      self->_userInteractedWithMap = 1;
      goto LABEL_10;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] User started interacting with map, will suppress camera updates", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:
  -[CardView alpha](self->_recenterButtonContainer, "alpha");
  if (v14 < 1.0)
  {
    v15 = sub_1004320DC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_18:

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100464CF8;
      v24[3] = &unk_1011AC860;
      v24[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v24, 0.3);
      goto LABEL_19;
    }
    v17 = self;
    v18 = (objc_class *)objc_opt_class(v17);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_17;
      }

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_17:

    *(_DWORD *)buf = 138543362;
    v26 = v23;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] animating to show recenter button", buf, 0xCu);

    goto LABEL_18;
  }
LABEL_19:

}

- (void)_resetUserInteractionState
{
  id v3;
  NSObject *v4;
  MapsCustomRouteViewContext *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;

  if (self->_userInteractedWithMap)
  {
    v3 = sub_1004320DC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      *(_WORD *)&self->_userInteractedWithMap = 0;
      return;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Clearing user interacted state, will allow camera updates", buf, 0xCu);

    goto LABEL_9;
  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  _QWORD v9[4];
  id v10;
  unsigned __int8 v11;
  _QWORD v12[4];
  id v13;
  unsigned __int8 v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isAnimated");
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100464FEC;
  v15[3] = &unk_1011AD260;
  objc_copyWeak(&v16, &location);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1004650FC;
  v12[3] = &unk_1011AD388;
  objc_copyWeak(&v13, &location);
  v14 = v8;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10046513C;
  v9[3] = &unk_1011AE960;
  objc_copyWeak(&v10, &location);
  v11 = v8;
  objc_msgSend(v7, "addPreparation:animations:completion:", v15, v12, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
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
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100465360;
  v15[3] = &unk_1011AD260;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "addPreparation:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentContextTransition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enterAnimation"));

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100465428;
    v13[3] = &unk_1011AD260;
    v10 = &v14;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v9, "addAnimations:", v13);
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100465460;
    v11[3] = &unk_1011AD4F0;
    v10 = &v12;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "addCompletion:", v11);
  }
  objc_destroyWeak(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (BOOL)wantsCompassLayoutControl
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
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
  id v6;

  v3 = [RouteAnnotationsMutableConfiguration alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext composedRoute](self, "composedRoute"));
  v5 = -[RouteAnnotationsConfiguration initWithRoute:](v3, "initWithRoute:", v4);

  -[RouteAnnotationsConfiguration setRouteTrafficFeaturesActive:](v5, "setRouteTrafficFeaturesActive:", 0);
  v6 = -[RouteAnnotationsMutableConfiguration copy](v5, "copy");

  return (RouteAnnotationsConfiguration *)v6;
}

- (void)_insertRecenterButton
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
  _QWORD v26[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewport"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_recenterButtonContainer, "contentView"));
  objc_msgSend(v5, "addSubview:", self->_recenterButton);

  objc_msgSend(v4, "addSubview:", self->_recenterButtonContainer);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CardView trailingAnchor](self->_recenterButtonContainer, "trailingAnchor"));
  v23 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, -10.0));
  v26[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](self->_recenterButtonContainer, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, -10.0));
  v26[1] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_recenterButton, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CardView leadingAnchor](self->_recenterButtonContainer, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v26[2] = v16;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_recenterButton, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CardView trailingAnchor](self->_recenterButtonContainer, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v26[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_recenterButton, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CardView topAnchor](self->_recenterButtonContainer, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v26[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_recenterButton, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](self->_recenterButtonContainer, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v26[5] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)_frameRouteAnimated:(BOOL)a3
{
  id v4;
  NSObject *v5;
  MapsCustomRouteViewContext *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL8 v15;
  id v16;
  NSObject *v17;
  MapsCustomRouteViewContext *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  MapsCustomRouteViewContext *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BOOL4 v42;

  if (self->_userInteractedWithMap)
  {
    if (self->_loggedFirstCameraSuppress)
    {
      v4 = sub_1004320DC();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = self;
        v7 = (objc_class *)objc_opt_class(v6);
        v8 = NSStringFromClass(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
          v11 = v10;
          if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

            goto LABEL_9;
          }

        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_9:

        *(_DWORD *)buf = 138543362;
        v40 = v12;
        v13 = v5;
        v14 = OS_LOG_TYPE_DEBUG;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%{public}@] Will suppress camera update, user has interacted with map since last update", buf, 0xCu);

      }
LABEL_28:

      return;
    }
    self->_loggedFirstCameraSuppress = 1;
    v30 = sub_1004320DC();
    v5 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    v31 = self;
    v32 = (objc_class *)objc_opt_class(v31);
    v33 = NSStringFromClass(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if ((objc_opt_respondsToSelector(v31, "accessibilityIdentifier") & 1) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v31, "performSelector:", "accessibilityIdentifier"));
      v36 = v35;
      if (v35 && !objc_msgSend(v35, "isEqualToString:", v34))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v34, v31, v36));

        goto LABEL_26;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v34, v31));
LABEL_26:

    *(_DWORD *)buf = 138543362;
    v40 = v12;
    v13 = v5;
    v14 = OS_LOG_TYPE_INFO;
    goto LABEL_27;
  }
  v15 = a3;
  v16 = sub_1004320DC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = self;
    v19 = (objc_class *)objc_opt_class(v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_16;
      }

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_16:

    *(_DWORD *)buf = 138543618;
    v40 = v24;
    v41 = 1024;
    v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] _frameRouteAnimated: %d", buf, 0x12u);

  }
  v25 = 0.3;
  if (!v15)
    v25 = 0.0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100465C6C;
  v37[3] = &unk_1011AC860;
  v37[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v37, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext chromeViewController](self, "chromeViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mapCameraController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext composedRoute](self, "composedRoute"));
  v38 = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  objc_msgSend(v27, "frameRoutes:includeCompassInset:animated:completion:", v29, 0, v15, 0);

}

- (void)pressedRecenter
{
  id v3;
  NSObject *v4;
  MapsCustomRouteViewContext *v5;
  MapsCustomRouteViewContext *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;

  v3 = sub_1004320DC();
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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] pressed recenter", buf, 0xCu);

  }
  -[MapsCustomRouteViewContext _resetUserInteractionState](self, "_resetUserInteractionState");
  -[MapsCustomRouteViewContext _frameRouteAnimated:](self, "_frameRouteAnimated:", 1);
}

- (id)_analyticsValue
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext routeData](self, "routeData"));
  v4 = objc_msgSend(v3, "tourMuid");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext routeData](self, "routeData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v5, "tourMuid")));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int)_analyticsTarget
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext composedRoute](self, "composedRoute"));
  if (objc_msgSend(v2, "source") == (id)2)
    v3 = 132;
  else
    v3 = 130;

  return v3;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (BOOL)exitRouteCreationOnClose
{
  return self->_exitRouteCreationOnClose;
}

- (void)setExitRouteCreationOnClose:(BOOL)a3
{
  self->_exitRouteCreationOnClose = a3;
}

- (NSUUID)historyUUID
{
  return self->_historyUUID;
}

- (void)setHistoryUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyUUID, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_recenterButtonContainer, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong(&self->_saveCompletionHandler, 0);
  objc_storeStrong(&self->_hikingMapToken, 0);
  objc_storeStrong((id *)&self->_composedRoute, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_containees, 0);
  objc_storeStrong((id *)&self->_saveRouteContainee, 0);
  objc_storeStrong((id *)&self->_customRouteViewContainee, 0);
}

@end
