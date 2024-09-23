@implementation MapsCustomRouteViewContainee

- (MapsCustomRouteViewContainee)initWithContext:(id)a3
{
  id v4;
  MapsCustomRouteViewContainee *v5;
  MapsCustomRouteViewContainee *v6;
  uint64_t v7;
  GEOComposedRoute *route;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapsCustomRouteViewContainee;
  v5 = -[MapsCustomRouteViewContainee init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composedRoute"));
    route = v6->_route;
    v6->_route = (GEOComposedRoute *)v7;

    v6->_previousWidth = 1.79769313e308;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v9, "setAllowResizeInFloatingStyle:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v10, "setDefaultContaineeLayout:", 2);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  int BOOL;
  void *v7;
  CardButton *v8;
  CardButton *v9;
  CardButton *v10;
  MapsSubtitleHeaderView *v11;
  void *v12;
  MapsSubtitleHeaderView *v13;
  void *v14;
  MapsSubtitleHeaderView *containerHeaderView;
  double v16;
  MapsCustomRouteCardView *v17;
  MapsCustomRouteCardView *cardView;
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
  MapsSubtitleHeaderView *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[4];

  v35.receiver = self;
  v35.super_class = (Class)MapsCustomRouteViewContainee;
  -[ContaineeViewController viewDidLoad](&v35, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (objc_msgSend(v5, "isInternalInstall"))
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_CustomRouteTTRButtonEnabled, off_1014B5638);

    if (BOOL)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
      objc_msgSend(v7, "setInsets:", *(double *)&qword_1014B7628, 0.0, *(double *)&qword_1014B7630, *(double *)&qword_1014B7628);
      v8 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v7);
      objc_msgSend(v4, "addObject:", v8);

      v9 = (CardButton *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration ttr](CardButtonConfiguration, "ttr"));
      -[CardButton setInsets:](v9, "setInsets:", *(double *)&qword_1014B7628, *(double *)&qword_1014B7628, *(double *)&qword_1014B7630, *(double *)&qword_1014B7628);
      v10 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v9);
      objc_msgSend(v4, "addObject:", v10);

      goto LABEL_6;
    }
  }
  else
  {

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
  objc_msgSend(v7, "setInsets:", *(double *)&qword_1014B7628, *(double *)&qword_1014B7628, *(double *)&qword_1014B7630, *(double *)&qword_1014B7628);
  v9 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v7);
  objc_msgSend(v4, "addObject:", v9);
LABEL_6:

  v11 = [MapsSubtitleHeaderView alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute userProvidedName](self->_route, "userProvidedName"));
  v34 = v4;
  if (v12)
  {
    v13 = -[MapsSubtitleHeaderView initWithTitle:subtitle:leadingButton:trailingButtons:delegate:](v11, "initWithTitle:subtitle:leadingButton:trailingButtons:delegate:", v12, 0, 0, v4, self);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](self->_route, "name"));
    v13 = -[MapsSubtitleHeaderView initWithTitle:subtitle:leadingButton:trailingButtons:delegate:](v11, "initWithTitle:subtitle:leadingButton:trailingButtons:delegate:", v14, 0, 0, v4, self);

  }
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v13;
  v33 = v13;

  -[MapsSubtitleHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v16) = 1148846080;
  -[MapsSubtitleHeaderView setContentCompressionResistancePriority:forAxis:](self->_containerHeaderView, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  objc_msgSend(v3, "addSubview:", self->_containerHeaderView);
  v17 = objc_opt_new(MapsCustomRouteCardView);
  cardView = self->_cardView;
  self->_cardView = v17;

  -[MapsCustomRouteCardView setDelegate:](self->_cardView, "setDelegate:", self);
  -[MapsCustomRouteCardView setTranslatesAutoresizingMaskIntoConstraints:](self->_cardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsCustomRouteViewContainee _updateRouteCardWithRoute:](self, "_updateRouteCardWithRoute:", self->_route);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView leadingAnchor](self->_containerHeaderView, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v36[0] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView topAnchor](self->_containerHeaderView, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v19));
  v36[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView trailingAnchor](self->_containerHeaderView, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v36[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](self->_containerHeaderView, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v36[3] = v26;
  v28 = v3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  -[MapsCustomRouteViewContainee _insertRouteCardIfNeeded](self, "_insertRouteCardIfNeeded");
  -[MapsCustomRouteViewContainee _insertAppropriateCardStateForRoute:](self, "_insertAppropriateCardStateForRoute:", self->_route);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double previousWidth;
  double v7;
  double v8;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MapsCustomRouteViewContainee;
  -[ContaineeViewController viewDidLayoutSubviews](&v11, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  previousWidth = self->_previousWidth;
  v7 = fabs(previousWidth + -1.79769313e308);
  v8 = vabdd_f64(previousWidth, v5);
  if (v7 <= 2.22044605e-16 || v8 > 2.22044605e-16)
  {
    self->_previousWidth = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", v8));
    objc_msgSend(v10, "updateHeightForCurrentLayout");

  }
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (double)headerHeight
{
  MapsSubtitleHeaderView *containerHeaderView;
  double v4;
  double v5;
  double v6;
  double v7;

  -[MapsSubtitleHeaderView layoutIfNeeded](self->_containerHeaderView, "layoutIfNeeded");
  containerHeaderView = self->_containerHeaderView;
  -[MapsSubtitleHeaderView frame](containerHeaderView, "frame");
  v5 = v4;
  LODWORD(v4) = 1148846080;
  LODWORD(v6) = 1112014848;
  -[MapsSubtitleHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](containerHeaderView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, UILayoutFittingCompressedSize.height, v4, v6);
  return v7;
}

- (double)heightForLayout:(unint64_t)a3
{
  MapsCustomRouteCardView *cardView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  if (a3 - 2 >= 2)
  {
    v14 = -1.0;
    if (a3 == 1)
    {
      -[MapsCustomRouteViewContainee headerHeight](self, "headerHeight");
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v17, "bottomSafeOffset");
      v14 = v16 + v18;

    }
  }
  else
  {
    -[MapsCustomRouteCardView layoutIfNeeded](self->_cardView, "layoutIfNeeded");
    cardView = self->_cardView;
    -[MapsCustomRouteCardView frame](cardView, "frame");
    v6 = v5;
    LODWORD(v5) = 1148846080;
    LODWORD(v7) = 1112014848;
    -[MapsCustomRouteCardView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](cardView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, UILayoutFittingCompressedSize.height, v5, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "bottomSafeOffset");
    v12 = v11;

    -[MapsCustomRouteViewContainee headerHeight](self, "headerHeight");
    return v12 + v9 + v13;
  }
  return v14;
}

- (BOOL)shouldCollapseOnMapGesture
{
  return 0;
}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  if (objc_msgSend(v4, "containeeLayout") == (id)2)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v6 = objc_msgSend(v5, "containeeLayout");

    if (v6 != (id)3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      v9 = v7;
      v8 = 2;
      goto LABEL_6;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v9 = v7;
  v8 = 1;
LABEL_6:
  objc_msgSend(v7, "wantsLayout:", v8);

}

- (void)trailingButtonTapped:(id)a3
{
  -[MapsCustomRouteViewContainee handleButtonTap:](self, "handleButtonTap:", objc_msgSend(a3, "type"));
}

- (void)handleButtonTap:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  if (a3 == 8)
  {
    v6 = sub_1004320DC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "pressed TTR", (uint8_t *)&v13, 2u);
    }

    v8 = objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    -[NSObject launchTTR](v8, "launchTTR");
    goto LABEL_9;
  }
  if (!a3)
  {
    v4 = sub_1004320DC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "pressed close", (uint8_t *)&v13, 2u);
    }

    -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
    return;
  }
  v9 = sub_1004318FC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315650;
    v14 = "-[MapsCustomRouteViewContainee handleButtonTap:]";
    v15 = 2080;
    v16 = "MapsCustomRouteViewContainee.m";
    v17 = 1024;
    v18 = 220;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v13, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v11 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);

    }
LABEL_9:

  }
}

- (void)pressedStepping
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id location;

  -[MapsCustomRouteCardView setButtonEnabled:](self->_cardView, "setButtonEnabled:", 0);
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AFB848;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  objc_msgSend(WeakRetained, "pushSuggestedNavigationMode:withCompletionHandler:", 2, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)pressedNavigation
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id location;

  -[MapsCustomRouteCardView setButtonEnabled:](self->_cardView, "setButtonEnabled:", 0);
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AFB9FC;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  objc_msgSend(WeakRetained, "pushSuggestedNavigationMode:withCompletionHandler:", 1, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)pressedRoutePlanning
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "pushSuggestedNavigationMode:withCompletionHandler:", 4, 0);

}

- (void)pressedSaveToLibrary
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AFBBD4;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  objc_msgSend(WeakRetained, "pushSaveContaineeWithCompletionHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)pressedOfflineDownload
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContainee _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baseActionCoordinator"));

  v6 = objc_opt_class(ActionCoordinator);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "composedRoute"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "userProvidedName"));
  if (objc_msgSend(v10, "length"))
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "userProvidedName"));
  else
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
  v12 = (void *)v11;

  v13 = objc_loadWeakRetained((id *)&self->_context);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "composedRoute"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "boundingMapRegion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:](GEOMapRegion, "_maps_offlineDownloadRegionForRouteBounds:", v15));
  v17 = objc_loadWeakRetained((id *)&self->_context);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "composedRoute"));
  LOBYTE(v19) = 1;
  objc_msgSend(v8, "viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:shouldShowDataManagementAfterDownload:shouldShowDataManagementAfterDownloadIfRegionDiffers:dismissalBlock:", self, v16, v12, v18, 0, 0, v19, 0);

}

- (void)pressedOfflineDataManagement
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContainee _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baseActionCoordinator"));

  v6 = objc_opt_class(ActionCoordinator);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "viewControllerShowOfflineMaps:", self);
}

- (void)didUpdateLayout
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v2, "updateHeightForCurrentLayout");

}

- (void)_insertAppropriateCardStateForRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[MapsCustomRouteViewContainee loadViewIfNeeded](self, "loadViewIfNeeded");
  -[MapsCustomRouteViewContainee _insertRouteCardIfNeeded](self, "_insertRouteCardIfNeeded");
  -[MapsCustomRouteViewContainee _updateRouteCardWithRoute:](self, "_updateRouteCardWithRoute:", v4);

}

- (void)_insertRouteCardIfNeeded
{
  MapsCustomRouteCardView *v3;
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
  _QWORD v19[3];

  v3 = self->_cardView;
  -[MapsCustomRouteCardView setAlpha:](v3, "setAlpha:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView superview](v3, "superview"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v5, "addSubview:", v3);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView leadingAnchor](v3, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
    v19[0] = v15;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView trailingAnchor](v3, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
    v19[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView topAnchor](v3, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v19[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  }
}

- (void)_updateRouteCardWithRoute:(id)a3
{
  id v4;

  -[MapsCustomRouteCardView setRoute:](self->_cardView, "setRoute:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "updateHeightForCurrentLayout");

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
