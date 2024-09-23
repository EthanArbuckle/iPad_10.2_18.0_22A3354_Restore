@implementation MapsRouteCreationContainee

- (MapsRouteCreationContainee)initWithContext:(id)a3
{
  id v4;
  MapsRouteCreationContainee *v5;
  MapsRouteCreationContainee *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsRouteCreationContainee;
  v5 = -[MapsRouteCreationContainee init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v6->_previousWidth = 1.79769313e308;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v7, "setAllowResizeInFloatingStyle:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v8, "setDefaultContaineeLayout:", 2);

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
  void *v11;
  void *v12;
  double v13;
  MapsLoopingVideoPlayerView *v14;
  MapsLoopingVideoPlayerView *playerView;
  double v16;
  RouteCreationCardView *v17;
  RouteCreationCardView *cardView;
  id WeakRetained;
  id v20;
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
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  MapsSubtitleHeaderView *v42;
  void *v43;
  objc_super v44;
  uint64_t v45;
  _QWORD v46[4];

  v44.receiver = self;
  v44.super_class = (Class)MapsRouteCreationContainee;
  -[ContaineeViewController viewDidLoad](&v44, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteCreationContainee view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CreateARouteView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (!objc_msgSend(v5, "isInternalInstall"))
  {

    goto LABEL_5;
  }
  BOOL = GEOConfigGetBOOL(MapsConfig_CustomRouteTTRButtonEnabled, off_1014B5638);

  if (!BOOL)
  {
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
    objc_msgSend(v7, "setInsets:", *(double *)&qword_1014B7628, *(double *)&qword_1014B7628, *(double *)&qword_1014B7630, *(double *)&qword_1014B7628);
    v9 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v7);
    objc_msgSend(v4, "addObject:", v9);
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
  objc_msgSend(v7, "setInsets:", *(double *)&qword_1014B7628, 0.0, *(double *)&qword_1014B7630, *(double *)&qword_1014B7628);
  v8 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v7);
  objc_msgSend(v4, "addObject:", v8);

  v9 = (CardButton *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration ttr](CardButtonConfiguration, "ttr"));
  -[CardButton setInsets:](v9, "setInsets:", *(double *)&qword_1014B7628, *(double *)&qword_1014B7628, *(double *)&qword_1014B7630, *(double *)&qword_1014B7628);
  v10 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v9);
  objc_msgSend(v4, "addObject:", v10);

LABEL_6:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Create Route"), CFSTR("localized string not found"), 0));

  v42 = -[MapsSubtitleHeaderView initWithTitle:subtitle:leadingButton:trailingButtons:delegate:]([MapsSubtitleHeaderView alloc], "initWithTitle:subtitle:leadingButton:trailingButtons:delegate:", v43, 0, 0, v4, self);
  -[MapsSubtitleHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1148846080;
  -[MapsSubtitleHeaderView setContentCompressionResistancePriority:forAxis:](v42, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  objc_msgSend(v11, "addSubview:", v42);
  objc_storeStrong((id *)&self->_modalHeaderView, v42);
  v14 = objc_opt_new(MapsLoopingVideoPlayerView);
  playerView = self->_playerView;
  self->_playerView = v14;

  -[MapsLoopingVideoPlayerView setTranslatesAutoresizingMaskIntoConstraints:](self->_playerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v16) = 1148846080;
  -[MapsLoopingVideoPlayerView setContentCompressionResistancePriority:forAxis:](self->_playerView, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  v17 = objc_opt_new(RouteCreationCardView);
  cardView = self->_cardView;
  self->_cardView = v17;

  -[RouteCreationCardView setTranslatesAutoresizingMaskIntoConstraints:](self->_cardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  -[RouteCreationCardView setEditingDelegate:](self->_cardView, "setEditingDelegate:", WeakRetained);

  v20 = objc_loadWeakRetained((id *)&self->_context);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "composedRoute"));
  -[MapsRouteCreationContainee _updateRouteCardWithRoute:](self, "_updateRouteCardWithRoute:", v21);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView leadingAnchor](self->_modalHeaderView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v46[0] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView topAnchor](self->_modalHeaderView, "topAnchor"));
  v22 = v11;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v23));
  v46[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView trailingAnchor](self->_modalHeaderView, "trailingAnchor"));
  v40 = v22;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v41 = v4;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v46[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](self->_modalHeaderView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  v46[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  v45 = objc_opt_class(UITraitUserInterfaceStyle);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  v33 = -[MapsRouteCreationContainee registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v32, self, "_userInterfaceStyleDidChange");

  -[MapsRouteCreationContainee _insertRouteCardIfNeeded](self, "_insertRouteCardIfNeeded");
  v34 = objc_loadWeakRetained((id *)&self->_context);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "composedRoute"));
  -[MapsRouteCreationContainee _insertAppropriateCardStateForRoute:](self, "_insertAppropriateCardStateForRoute:", v35);

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
  v11.super_class = (Class)MapsRouteCreationContainee;
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
  MapsSubtitleHeaderView *modalHeaderView;
  double v4;
  double v5;
  double v6;
  double v7;

  -[MapsSubtitleHeaderView layoutIfNeeded](self->_modalHeaderView, "layoutIfNeeded");
  modalHeaderView = self->_modalHeaderView;
  -[MapsSubtitleHeaderView frame](modalHeaderView, "frame");
  v5 = v4;
  LODWORD(v4) = 1148846080;
  LODWORD(v6) = 1112014848;
  -[MapsSubtitleHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](modalHeaderView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, UILayoutFittingCompressedSize.height, v4, v6);
  return v7;
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  RouteCreationCardView *cardView;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  if (a3 - 2 >= 2)
  {
    v9 = -1.0;
    if (a3 == 1)
    {
      -[MapsRouteCreationContainee headerHeight](self, "headerHeight");
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v12, "bottomSafeOffset");
      v9 = v11 + v13;

    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView superview](self->_playerView, "superview"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      objc_msgSend(v5, "layoutIfNeeded");

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      objc_msgSend(v6, "frame");
      v8 = v7 * 0.580817044;

    }
    else
    {
      -[RouteCreationCardView layoutIfNeeded](self->_cardView, "layoutIfNeeded");
      cardView = self->_cardView;
      -[RouteCreationCardView frame](cardView, "frame");
      v16 = v15;
      LODWORD(v15) = 1148846080;
      LODWORD(v17) = 1112014848;
      -[RouteCreationCardView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](cardView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v16, UILayoutFittingCompressedSize.height, v15, v17);
      v8 = v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v19, "bottomSafeOffset");
    v21 = v20;

    if (fabs(v21) <= 2.22044605e-16)
      v21 = 16.0;
    -[MapsRouteCreationContainee headerHeight](self, "headerHeight");
    return v8 + v22 + v21;
  }
  return v9;
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
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  v4 = objc_msgSend(a3, "type");
  if (v4 == (id)8)
  {
    v7 = sub_1004320DC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "pressed TTR", (uint8_t *)&v14, 2u);
    }

    v9 = objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    -[NSObject launchTTR](v9, "launchTTR");
    goto LABEL_11;
  }
  if (!v4)
  {
    v5 = sub_1004320DC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "pressed cancel", (uint8_t *)&v14, 2u);
    }

    if (self->_route && GEOConfigGetBOOL(MapsConfig_EnableRouteCreationExitConfirmation, off_1014B54C8))
      -[MapsRouteCreationContainee _showExitConfirmationAlert](self, "_showExitConfirmationAlert");
    else
      -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
    return;
  }
  v10 = sub_1004318FC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v14 = 136315650;
    v15 = "-[MapsRouteCreationContainee trailingButtonTapped:]";
    v16 = 2080;
    v17 = "MapsRouteCreationContainee.m";
    v18 = 1024;
    v19 = 267;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v14, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v12 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

    }
LABEL_11:

  }
}

- (void)_showExitConfirmationAlert
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
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Exit Alert Title"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Exit Alert Message"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("ExitAlert"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Exit Delete Option"), CFSTR("localized string not found"), 0));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_1004354B4;
  v18 = &unk_1011AFA88;
  objc_copyWeak(&v19, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 2, &v15));

  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("DeleteAction"), v15, v16, v17, v18);
  objc_msgSend(v7, "addAction:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Exit Cancel Option"), CFSTR("localized string not found"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, 0));

  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("CancelAction"));
  objc_msgSend(v7, "addAction:", v14);
  -[MapsRouteCreationContainee _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)setRoute:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_route, a3);
  v5 = a3;
  -[MapsRouteCreationContainee _insertAppropriateCardStateForRoute:](self, "_insertAppropriateCardStateForRoute:", v5);

}

- (void)_insertAppropriateCardStateForRoute:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView superview](self->_playerView, "superview"));

  -[MapsRouteCreationContainee loadViewIfNeeded](self, "loadViewIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "legs"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypoints"));
    v7 = objc_msgSend(v6, "count");

    if ((unint64_t)v7 >= 2)
    {
      -[MapsRouteCreationContainee _insertRouteCardIfNeeded](self, "_insertRouteCardIfNeeded");
      -[MapsRouteCreationContainee _updateRouteCardWithRoute:](self, "_updateRouteCardWithRoute:", v9);
      if (!v4)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else
  {

  }
  -[MapsRouteCreationContainee _insertEmptyStateIfNeeded](self, "_insertEmptyStateIfNeeded");
  -[MapsRouteCreationContainee _updateEmptyStateContent](self, "_updateEmptyStateContent");
LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v8, "updateHeightForCurrentLayout");

LABEL_8:
}

- (void)_insertEmptyStateIfNeeded
{
  MapsLoopingVideoPlayerView *v3;
  MapsLoopingVideoPlayerView *v4;
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
  _QWORD v24[4];

  -[RouteCreationCardView setAlpha:](self->_cardView, "setAlpha:", 0.0);
  v3 = self->_playerView;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView superview](v3, "superview"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      objc_msgSend(v6, "addSubview:", v4);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView leadingAnchor](v4, "leadingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
      v24[0] = v20;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView trailingAnchor](v4, "trailingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
      v24[1] = v16;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView topAnchor](v4, "topAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
      v24[2] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView heightAnchor](v4, "heightAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "widthAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:multiplier:constant:", v13, 0.580817044, 0.0));
      v24[3] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    }
  }

}

- (void)_insertRouteCardIfNeeded
{
  NSString *currentVideoName;
  RouteCreationCardView *v4;
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
  _QWORD v20[3];

  -[MapsLoopingVideoPlayerView removeFromSuperview](self->_playerView, "removeFromSuperview");
  currentVideoName = self->_currentVideoName;
  self->_currentVideoName = 0;

  v4 = self->_cardView;
  -[RouteCreationCardView setAlpha:](v4, "setAlpha:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView superview](v4, "superview"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", v4);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView leadingAnchor](v4, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
    v20[0] = v16;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView trailingAnchor](v4, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
    v20[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView topAnchor](v4, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
    v20[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  }
}

- (void)_updateRouteCardWithRoute:(id)a3
{
  -[RouteCreationCardView setRoute:](self->_cardView, "setRoute:", a3);
  -[MapsRouteCreationContainee _updateDoneButton](self, "_updateDoneButton");
}

- (BOOL)_isValidRoute
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView route](self->_cardView, "route"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "legs"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_updateDoneButton
{
  _BOOL8 v3;
  id v4;

  v3 = -[MapsRouteCreationContainee _isValidRoute](self, "_isValidRoute");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteCreationCardView saveButton](self->_cardView, "saveButton"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_updateEmptyStateContent
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  MapsRouteCreationContainee *v15;
  __int16 v16;
  void *v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "emptyStateVideoName"));

  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v15 = self;
    v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating video: %@", buf, 0x16u);
  }

  if (v4 && !-[NSString isEqualToString:](self->_currentVideoName, "isEqualToString:", v4))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSDataAsset), "initWithName:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
    v12[0] = AVAssetPreferPreciseDurationAndTimingKey;
    v12[1] = AVAssetReferenceRestrictionsKey;
    v13[0] = &__kCFBooleanFalse;
    v13[1] = &off_10126D3C0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithData:contentType:options:](AVAsset, "assetWithData:contentType:options:", v8, AVFileTypeAppleM4V, v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v10));
    -[MapsLoopingVideoPlayerView replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:](self->_playerView, "replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v11, 0);
    objc_storeStrong((id *)&self->_currentVideoName, v4);

  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_currentVideoName, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
