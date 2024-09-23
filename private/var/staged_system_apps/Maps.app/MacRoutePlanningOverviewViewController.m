@implementation MacRoutePlanningOverviewViewController

- (MacRoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3
{
  MacRoutePlanningOverviewViewController *v3;
  MacRoutePlanningOverviewViewController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MacRoutePlanningOverviewViewController;
  v3 = -[RoutePlanningOverviewViewController initWithDataCoordinator:](&v8, "initWithDataCoordinator:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v3, "cardPresentationController"));
    objc_msgSend(v5, "setAllowResizeInFloatingStyle:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v6, "setDefaultContaineeLayout:", 1);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("hasExpandedSteps"));

  v4.receiver = self;
  v4.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController dealloc](&v4, "dealloc");
}

- (id)keyCommands
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MacRoutePlanningOverviewViewController;
  v3 = -[ContaineeViewController keyCommands](&v10, "keyCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  if (sub_1002A8AA0(self) == 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputLeftArrow, 0, "arrowLeftPressed:"));
    objc_msgSend(v5, "addObject:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputRightArrow, 0, "arrowRightPressed:"));
    objc_msgSend(v5, "addObject:", v7);

  }
  v8 = objc_msgSend(v5, "copy");

  return v8;
}

- (void)arrowRightPressed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController traitCollection](self, "traitCollection", a3));
  v5 = objc_msgSend(v4, "layoutDirection");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  v7 = v6;
  if (v5 == (id)1)
    objc_msgSend(v6, "collapseCurrentlyFocusedRoute");
  else
    objc_msgSend(v6, "expandCurrentlyFocusedRoute");

}

- (void)arrowLeftPressed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController traitCollection](self, "traitCollection", a3));
  v5 = objc_msgSend(v4, "layoutDirection");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  v7 = v6;
  if (v5 == (id)1)
    objc_msgSend(v6, "expandCurrentlyFocusedRoute");
  else
    objc_msgSend(v6, "collapseCurrentlyFocusedRoute");

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;

  v12 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextFocusedItem"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextFocusedItem"));
    if (+[UIFocusSystem environment:containsEnvironment:](UIFocusSystem, "environment:containsEnvironment:", v7, v8))
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextFocusedItem"));
      v11 = +[UIFocusSystem environment:containsEnvironment:](UIFocusSystem, "environment:containsEnvironment:", v9, v10);

      if ((v11 & 1) == 0)
        -[MacRoutePlanningOverviewViewController setRouteSearchSuggestionsTableViewHidden:](self, "setRouteSearchSuggestionsTableViewHidden:", 1);
    }
  }

}

- (void)_setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RoutePlanningTransitTimingControlsView *v9;
  double y;
  double width;
  double height;
  RoutePlanningTransitTimingControlsView *v13;
  void *v14;
  RoutePlanningOptionsBar *v15;
  void *v16;
  RoutePlanningEVChargeOptionsView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  RoutePlanningWaypointEditorViewController *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t IsEnabled_Maps182;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id location;
  objc_super v56;
  _QWORD v57[3];

  v56.receiver = self;
  v56.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController _setupSubviews](&v56, "_setupSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v3, "setScrollViewDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v4, "setStepsListDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("hasExpandedSteps"), 1, &unk_1014D26D8);

  objc_initWeak(&location, self);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1004D5570;
  v53[3] = &unk_1011AD260;
  objc_copyWeak(&v54, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v6, "setPostReloadHandler:", v53);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v7, "bringSubviewToFront:", v8);

  v9 = [RoutePlanningTransitTimingControlsView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = -[RoutePlanningTransitTimingControlsView initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MacRoutePlanningOverviewViewController setTimingControlsView:](self, "setTimingControlsView:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = -[RoutePlanningOptionsBar initWithFrame:]([RoutePlanningOptionsBar alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MacRoutePlanningOverviewViewController setOptionsBar:](self, "setOptionsBar:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v17 = objc_opt_new(RoutePlanningEVChargeOptionsView);
  -[MacRoutePlanningOverviewViewController setChargingOptionsView:](self, "setChargingOptionsView:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Charging Options Description [Catalyst, Route Planning]"), CFSTR("localized string not found"), 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "descriptionLabel"));
  objc_msgSend(v22, "setText:", v20);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "checkbox"));
  objc_msgSend(v24, "addTarget:action:forControlEvents:", self, "pressedAssumeFullCharge", 0x2000);

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1004D55E4;
  v51[3] = &unk_1011B8EB0;
  objc_copyWeak(&v52, &location);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView"));
  objc_msgSend(v25, "setChangeHandler:", v51);

  objc_copyWeak(&v50, &location);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView", _NSConcreteStackBlock, 3221225472, sub_1004D5644, &unk_1011AD4F0));
  objc_msgSend(v26, "setLayoutHandler:", &v49);

  v27 = -[RoutePlanningWaypointEditorViewController initWithWaypointInfoProvider:]([RoutePlanningWaypointEditorViewController alloc], "initWithWaypointInfoProvider:", self);
  -[MacRoutePlanningOverviewViewController setSearchFieldsViewController:](self, "setSearchFieldsViewController:", v27);

  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v28, v29) & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0)
  {
    IsEnabled_Maps182 = 1;
  }
  else
  {
    IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v31, "setMprEnabled:", IsEnabled_Maps182);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  -[MacRoutePlanningOverviewViewController addChildViewController:](self, "addChildViewController:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));

  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = objc_alloc((Class)UIStackView);
  v57[0] = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView"));
  v57[1] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
  v57[2] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 3));
  v39 = objc_msgSend(v35, "initWithArrangedSubviews:", v38);

  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v39, "setAlignment:", 0);
  objc_msgSend(v39, "setAxis:", 1);
  objc_msgSend(v39, "setDistribution:", 0);
  objc_msgSend(v39, "setCustomSpacing:afterView:", v34, 14.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView"));
  objc_msgSend(v39, "setCustomSpacing:afterView:", v40, 12.0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v41, "setTitleView:", v39);

  -[MacRoutePlanningOverviewViewController setHeaderStackView:](self, "setHeaderStackView:", v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v42, "didMoveToParentViewController:", self);

  -[MacRoutePlanningOverviewViewController _prepareRouteSearchControllers](self, "_prepareRouteSearchControllers");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "_headerTapGesture"));
  objc_msgSend(v44, "setCancelsTouchesInView:", 0);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v45, "setTitleViewInsets:", 5.0, 16.0, 0.0, 16.0);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v47, "setAccessoryView:", v46);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v48, "setAccessoryViewInsets:", 0.0, 16.0, 16.0, 16.0);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
}

- (id)_initialConstraints
{
  id v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;
  _QWORD v24[4];

  v23.receiver = self;
  v23.super_class = (Class)MacRoutePlanningOverviewViewController;
  v3 = -[RoutePlanningOverviewViewController _initialConstraints](&v23, "_initialConstraints");
  v22 = (id)objc_claimAutoreleasedReturnValue(v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v24[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v5));
  v24[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionViewToBottomConstraint](self, "collectionViewToBottomConstraint"));
  v24[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  objc_msgSend(v22, "addObjectsFromArray:", v13);

  return v22;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MacRoutePlanningOverviewViewController _refreshRouteSearchFields](self, "_refreshRouteSearchFields");
  -[MacRoutePlanningOverviewViewController _refreshDesiredTransportType](self, "_refreshDesiredTransportType");
  -[MacRoutePlanningOverviewViewController _refreshOptionsVisibility](self, "_refreshOptionsVisibility");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v4, "endEditingFields");

}

- (void)viewDidDisappear:(BOOL)a3
{
  SearchFieldItem *v4;
  SearchFieldItem *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v8.receiver = self;
  v8.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  v4 = objc_opt_new(SearchFieldItem);
  v9[0] = v4;
  v5 = objc_opt_new(SearchFieldItem);
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v7, "setItems:", v6);

}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[MacRoutePlanningOverviewViewController willMoveToParentViewController:](&v4, "willMoveToParentViewController:", a3);
  -[MacRoutePlanningOverviewViewController setRouteSearchSuggestionsTableViewHidden:](self, "setRouteSearchSuggestionsTableViewHidden:", 1);
}

- (void)pressedAssumeFullCharge
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "checkbox"));
  objc_msgSend(v5, "virtualGarageSetAssumesFullCharge:", objc_msgSend(v4, "isOn"));

}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeCollection"));
  v8 = objc_msgSend(v7, "count");

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      goto LABEL_2;
    case 2uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
      v17 = objc_msgSend(v16, "hasExpandedSteps");

      v3 = -1.0;
      if ((v17 & 1) != 0)
        return v3;
      if (v8)
        goto LABEL_20;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      if (objc_msgSend(v18, "requestState") == (id)1)
      {

      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        v25 = objc_msgSend(v24, "requestState");

        if (v25 != (id)3)
          return v3;
      }
LABEL_20:
      -[RoutePlanningOverviewViewController _fittingHeightForMediumLayout](self, "_fittingHeightForMediumLayout");
      v27 = v26;
      -[MacRoutePlanningOverviewViewController _routePlanningAdvisoryFooterViewHeight](self, "_routePlanningAdvisoryFooterViewHeight");
      return v27 + v28;
    case 3uLL:
    case 4uLL:
      if (!v8)
        return -1.0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
      v3 = -1.0;
      if (objc_msgSend(v9, "hasExpandedSteps"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v14, "availableHeight");
        v3 = v15;

      }
LABEL_3:

      return v3;
    case 5uLL:
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v29 = 136315650;
        v30 = "-[MacRoutePlanningOverviewViewController heightForLayout:]";
        v31 = 2080;
        v32 = "RoutePlanningOverviewViewController.m";
        v33 = 1024;
        v34 = 3251;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v29 = 138412290;
          v30 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);

        }
      }
LABEL_2:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v9, "bottomSafeOffset");
      v11 = v10;
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v3 = v11 + v12 + 10.0;
      goto LABEL_3;
    default:
      return v3;
  }
}

- (double)_routePlanningAdvisoryFooterViewHeight
{
  void *v3;
  double v4;
  double v5;

  if (!MapsFeature_IsEnabled_FrenchClimateLaw(self, a2))
    return 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v3, "estimatedRoutePlanningAdvisoryFooterViewHeight");
  v5 = v4;

  return v5;
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController willChangeLayout:](&v11, "willChangeLayout:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  if (v6 && (unint64_t)v6 < a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v9 = v7;
    v10 = 2;
LABEL_7:
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v10, v8, 0);

    return;
  }
  if (a3 && (unint64_t)v6 > a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v9 = v7;
    v10 = 1;
    goto LABEL_7;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  id v11;
  objc_super v12;

  if (a6 == &unk_1014D26D8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController", a3, a4, a5));
    v8 = objc_msgSend(v7, "hasExpandedSteps");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v11 = v9;
    if (v8)
      v10 = 3;
    else
      v10 = 2;
    objc_msgSend(v9, "wantsLayout:", v10);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MacRoutePlanningOverviewViewController;
    -[MacRoutePlanningOverviewViewController observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "clearMapSelection");

  -[MacRoutePlanningOverviewViewController _showManeuverArrowsForStep:](self, "_showManeuverArrowsForStep:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "composedRoute"));
  v7 = sub_1007787B0(v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[MacRoutePlanningOverviewViewController _updateCurrentRouteDisplayedMapRect:forRoute:](self, "_updateCurrentRouteDisplayedMapRect:forRoute:", v14, v7, v9, v11, v13);
}

- (void)_updateCurrentRouteDisplayedMapRect:(id)a3 forRoute:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  char *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  char *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  id v25;
  NSObject *v26;
  _QWORD v27[9];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v6 = a3.var0.var1;
  v7 = a3.var0.var0;
  v9 = (char *)a4;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1004D636C;
  v27[3] = &unk_1011AFFE8;
  v27[4] = self;
  *(double *)&v27[5] = v7;
  *(double *)&v27[6] = v6;
  *(double *)&v27[7] = var0;
  *(double *)&v27[8] = var1;
  v10 = objc_retainBlock(v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeCollection"));
  v13 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentRoute"));

  if (v13 == v9)
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }
  else
  {
    v14 = sub_10043214C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tapped a route step for a non-current route; switching current route",
        buf,
        2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routeCollection"));
    v18 = objc_msgSend(v17, "indexOfRoute:", v9);

    if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v29 = "-[MacRoutePlanningOverviewViewController _updateCurrentRouteDisplayedMapRect:forRoute:]";
        v30 = 2080;
        v31 = "RoutePlanningOverviewViewController.m";
        v32 = 1024;
        v33 = 3322;
        v34 = 2080;
        v35 = "index != NSNotFound";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v22 = sub_1004318FC();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v29 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v25 = sub_10043214C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Could not find index of non-current composedRoute in route collection: %p", buf, 0xCu);
      }

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      objc_msgSend(v19, "updateCurrentRoute:", v9);

      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }

}

- (void)directionsStepsListDidTapRAPButton:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController _maps_platformController](self, "_maps_platformController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));
  v6 = objc_opt_class(RoutePlanningSession);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) == 0 || !v5)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315906;
      v17 = "-[MacRoutePlanningOverviewViewController directionsStepsListDidTapRAPButton:]";
      v18 = 2080;
      v19 = "RoutePlanningOverviewViewController.m";
      v20 = 1024;
      v21 = 3338;
      v22 = 2080;
      v23 = "routePlanningSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v16 = 138412290;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 5013, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rapPresenter"));
  objc_msgSend(v10, "presentReportAProblemForRouteFromEntryPoint:", -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"));

}

- (void)directionsStepsList:(id)a3 didTapElevationInfoButton:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;

  v6 = a3;
  v7 = a4;
  if (sub_1002A8AA0(self) != 5)
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315906;
      v15 = "-[MacRoutePlanningOverviewViewController directionsStepsList:didTapElevationInfoButton:]";
      v16 = 2080;
      v17 = "RoutePlanningOverviewViewController.m";
      v18 = 1024;
      v19 = 3354;
      v20 = 2080;
      v21 = "MapsIdiomIsMac(self)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v14, 0x26u);
    }

    if (sub_100A70734())
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v14 = 138412290;
        v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

      }
    }
  }
  if (sub_1002A8AA0(self) == 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
    -[MacRoutePlanningOverviewViewController _presentElevationGraphForRoute:fromView:](self, "_presentElevationGraphForRoute:fromView:", v8, v7);

  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v6 = a3;
  objc_msgSend(a4, "displayedMapRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));

  -[MacRoutePlanningOverviewViewController _updateCurrentRouteDisplayedMapRect:forRoute:](self, "_updateCurrentRouteDisplayedMapRect:forRoute:", v15, v8, v10, v12, v14);
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v26 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clusteredVehicleItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clusteredSegment"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController clusteredVehiclesSelectionAlertControllerForClusteredSegment:completion:](UIAlertController, "clusteredVehiclesSelectionAlertControllerForClusteredSegment:completion:", v6, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v9, "setSourceView:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController view](self, "view"));
    objc_msgSend(v26, "bounds");
    objc_msgSend(v10, "convertRect:fromView:", v26);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v20, "setPermittedArrowDirections:", 12);

    -[MacRoutePlanningOverviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clusteredVehicleItem"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "clusteredSegment"));
    v24 = MapsAnalyticsEventValueForClusteredSegment(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v21, "captureUserAction:onTarget:eventValue:", 3037, 606, v25);

  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v9, "setRoutePlanningAdvisory:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v10, "setRoutePlanningIncidentsSourceView:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v11, "presentRoutePlanningViewType:", 5);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayedItemIndexForAnalytics"));

  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:transitStep:", 9040, 606, 0, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchingRouteStep"));

  objc_msgSend(v11, "presentScheduleForStep:", v10);
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsWithURL:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 6050, 647, v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v7, "openURL:withCompletionHandler:", v4, &stru_1011B8ED0);

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v9 = objc_msgSend(v8, "containeeLayout");

    if (v9 != (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v10, "wantsLayout:", 1);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController routePlanningDataCoordinator:didUpdateRouteCollection:](&v15, "routePlanningDataCoordinator:didUpdateRouteCollection:", v6, v7);
  v11 = objc_msgSend(v7, "count");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v13 = objc_msgSend(v12, "containeeLayout");

    if (v13 == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v14, "wantsExpandLayout");

    }
  }
  -[MacRoutePlanningOverviewViewController _clearAlternateRouteManeuverArrows](self, "_clearAlternateRouteManeuverArrows");
  -[MacRoutePlanningOverviewViewController _refreshRouteSearchFields](self, "_refreshRouteSearchFields");

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController routePlanningDataCoordinator:didUpdateResolvedWaypointSet:](&v5, "routePlanningDataCoordinator:didUpdateResolvedWaypointSet:", a3, a4);
  -[MacRoutePlanningOverviewViewController _refreshRouteSearchFields](self, "_refreshRouteSearchFields");
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MacRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController routePlanningDataCoordinator:didUpdateTransportType:](&v10, "routePlanningDataCoordinator:didUpdateTransportType:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "macMenuPresentationController"));
  v7 = objc_msgSend(v6, "isPresented");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "macMenuPresentationController"));
    objc_msgSend(v9, "dismissAnimated:completion:", 1, 0);

  }
}

- (void)_showManeuverArrowsForStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composedRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steps"));
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "-[MacRoutePlanningOverviewViewController _showManeuverArrowsForStep:]";
      v23 = 2080;
      v24 = "RoutePlanningOverviewViewController.m";
      v25 = 1024;
      v26 = 3447;
      v27 = 2080;
      v28 = "stepIndex != NSNotFound";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v21, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v21 = 138412290;
        v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

      }
    }
    v19 = sub_10043214C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = 134217984;
      v22 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Could not find the index for step %p", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(v5, "setManeuverDisplayEnabled:", 0);
    v8 = v5;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "setManeuverDisplayEnabled:", 1);
    v8 = v5;
    v9 = v7;
  }
  objc_msgSend(v8, "setCurrentDisplayStep:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeAnnotationsController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mapLayer"));
  objc_msgSend(v13, "forceLayout");

}

- (void)_clearAlternateRouteManeuverArrows
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateRoutes"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "setManeuverDisplayEnabled:", 0);
        objc_msgSend(v10, "setCurrentDisplayStep:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeAnnotationsController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_mapLayer"));
  objc_msgSend(v14, "forceLayout");

}

- (void)_forceChangeOrigin
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v2, "selectFromField");

}

- (void)_refreshDesiredTransportType
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = objc_msgSend(v3, "desiredTransportType");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v5, "setSelectedType:", objc_msgSend(v6, "desiredTransportType"));

    -[MacRoutePlanningOverviewViewController _refreshTimingDisplay](self, "_refreshTimingDisplay");
  }
}

- (void)_refreshRouteSearchFields
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  char *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));

  if (!v3)
  {
    v22 = sub_1004318FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Route search fields should have been setup in viewDidLoad")));
      v28 = 136316162;
      v29 = "-[MacRoutePlanningOverviewViewController _refreshRouteSearchFields]";
      v30 = 2080;
      v31 = "RoutePlanningOverviewViewController.m";
      v32 = 1024;
      v33 = 3485;
      v34 = 2080;
      v35 = "self.searchFieldsViewController != nil";
      v36 = 2112;
      v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v28, 0x30u);

    }
    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v28 = 138412290;
        v29 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);

      }
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v5 = objc_msgSend(v4, "desiredTransportType");
  v7 = 0;
  switch((unint64_t)v5)
  {
    case 0uLL:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v5, v6) & 1) == 0
        && (MapsFeature_IsEnabled_Maps420() & 1) == 0)
      {
        goto LABEL_6;
      }
      v7 = 1;
      break;
    case 1uLL:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v5, v6);
      goto LABEL_9;
    case 2uLL:
LABEL_6:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
      goto LABEL_9;
    case 5uLL:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_9:
      v7 = IsEnabled_DrivingMultiWaypointRoutes;
      break;
    default:
      break;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v9, "setMprEnabled:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "directionItemForCurrentSession"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v13, "setItems:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "items"));
  v16 = objc_msgSend(v15, "count");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
  v18 = objc_msgSend(v17, "count");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v20, "setItems:", v19);

  if (v16 != v18)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v21, "updateHeightForCurrentLayout");

  }
}

- (void)_refreshOptionsVisibility
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = objc_msgSend(v3, "desiredTransportType");
  v6 = 0;
  switch((unint64_t)v4)
  {
    case 0uLL:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v4, v5) & 1) == 0
        && (MapsFeature_IsEnabled_Maps420() & 1) == 0)
      {
        goto LABEL_5;
      }
      v6 = 1;
      break;
    case 1uLL:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v4, v5);
      goto LABEL_8;
    case 2uLL:
LABEL_5:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
      goto LABEL_8;
    case 5uLL:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_8:
      v6 = IsEnabled_DrivingMultiWaypointRoutes;
      break;
    default:
      break;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v8, "setMprEnabled:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v10 = (unint64_t)objc_msgSend(v9, "desiredTransportType");

  if (v10 <= 5 && ((1 << v10) & 0x2E) != 0)
  {
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Options [Catalyst, Route Planning]"), CFSTR("localized string not found"), 0));
    v29 = _NSConcreteStackBlock;
    v30 = 3221225472;
    v31 = sub_1004D7870;
    v32 = &unk_1011AD260;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v11, "setButtonTitle:actionHandler:", v13, &v29);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar", v29, v30, v31, v32));
    objc_msgSend(v14, "setHidden:", 0);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    objc_msgSend(v15, "setButtonTitle:actionHandler:", 0, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    objc_msgSend(v16, "setHidden:", 1);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v17, "titleViewInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
  if (objc_msgSend(v26, "isHidden"))
    v27 = 10.0;
  else
    v27 = 0.0;

  if (vabdd_f64(v27, v23) > 2.22044605e-16)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
    objc_msgSend(v28, "setTitleViewInsets:", v19, v21, v27, v25);

  }
}

- (void)_refreshTimingDisplay
{
  NSSet *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;

  if (MapsFeature_IsEnabled_Maps357RoutePlanning(self, a2))
    v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, &off_10126D900, 0);
  else
    v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, 0, v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "transportType")));
  v7 = objc_msgSend(v4, "containsObject:", v6);
  if ((_DWORD)v7)
  {

LABEL_10:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timing"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routeCollection"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentRoute"));

    if (v18)
      v19 = (uint64_t)objc_msgSend(v18, "shouldShowSchedule");
    else
      v19 = 1;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView"));
    objc_msgSend(v20, "setHidden:", 0);

    goto LABEL_15;
  }
  if (MapsFeature_IsEnabled_Maps357RoutePlanning(v7, v8))
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, &off_10126D900, 0);
  else
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, 0, v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "desiredTransportType")));
  v13 = objc_msgSend(v10, "containsObject:", v12);

  if (v13)
    goto LABEL_10;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView"));
  v19 = 1;
  objc_msgSend(v18, "setHidden:", 1);
  v15 = 0;
LABEL_15:

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView"));
  objc_msgSend(v21, "setSelectedTiming:", v15);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController timingControlsView](self, "timingControlsView"));
  objc_msgSend(v22, "setShowSchedulingButtons:", v19);

  v23 = sub_10043214C();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Updating timing to: %@", buf, 0xCu);
  }

}

- (void)_refreshSelectedVehicleDisplay
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t IsEnabled_EVRouting;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  int v24;
  int IsEnabled_Alberta;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  void *v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = objc_msgSend(v3, "desiredTransportType");

  if (v4 == (id)1)
  {
    IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(v5, v6);
    if ((IsEnabled_EVRouting & 1) != 0 || MapsFeature_IsEnabled_Alberta(IsEnabled_EVRouting))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage vehicles](self->super._virtualGarage, "vehicles"));
      v9 = objc_msgSend(v8, "count") != 0;

    }
    else
    {
      v9 = 0;
    }
    v23 = IsEVRoutingSupported();
    v24 = v23;
    IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta(v23);
    v20 = objc_claimAutoreleasedReturnValue(-[VGVirtualGarage selectedVehicle](self->super._virtualGarage, "selectedVehicle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    objc_msgSend(v26, "setSummaryText:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    objc_msgSend(v27, "setVehicle:", v20);

    v28 = -[NSObject isPureElectricVehicle](v20, "isPureElectricVehicle");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
    v30 = v29;
    if (v28 && v9 && v24 | IsEnabled_Alberta)
    {
      if (!v29)
        goto LABEL_19;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController headerStackView](self, "headerStackView"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "arrangedSubviews"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
      v34 = objc_msgSend(v32, "containsObject:", v33);

      if ((v34 & 1) != 0)
        goto LABEL_19;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController headerStackView](self, "headerStackView"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
      objc_msgSend(v30, "addArrangedSubview:", v35);

    }
    else
    {
      objc_msgSend(v29, "removeFromSuperview");
    }

LABEL_19:
    v36 = sub_10043214C();
    v21 = objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      goto LABEL_27;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "vehicle"));
    v43 = 138412290;
    v44 = v37;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Updating summary to vehicle: %@", (uint8_t *)&v43, 0xCu);

LABEL_21:
    goto LABEL_22;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  if (objc_msgSend(v10, "desiredTransportType") != (id)5)
    goto LABEL_24;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cyclePreferences"));
  if ((objc_msgSend(v12, "ebike") & 1) == 0)
  {

LABEL_24:
LABEL_25:
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    objc_msgSend(v38, "setVehicle:", 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    objc_msgSend(v39, "setSummaryText:", 0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
    objc_msgSend(v40, "removeFromSuperview");

    v41 = sub_10043214C();
    v20 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v43) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Removing summary", (uint8_t *)&v43, 2u);
    }
    goto LABEL_27;
  }
  v13 = sub_1003C76E0();

  if (!v13)
    goto LABEL_25;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
  objc_msgSend(v14, "setVehicle:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("e-bike [RoutePlanning, Catalyst]"), CFSTR("localized string not found"), 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
  objc_msgSend(v17, "setSummaryText:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController chargingOptionsView](self, "chargingOptionsView"));
  objc_msgSend(v18, "removeFromSuperview");

  v19 = sub_10043214C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController optionsBar](self, "optionsBar"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject summaryText](v21, "summaryText"));
    v43 = 138412290;
    v44 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Updating summary to: %@", (uint8_t *)&v43, 0xCu);
    goto LABEL_21;
  }
LABEL_27:

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v42, "updateHeightForCurrentLayout");

}

- (void)_prepareRouteSearchControllers
{
  void *v3;
  RouteWaypointSuggestionsTableViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  RouteSearchViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RouteSearchViewController *v16;
  void *v17;
  void *v18;
  MenuContaineeViewController *v19;
  void *v20;
  MenuContaineeViewController *v21;
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
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  void *v50;
  _BYTE location[12];
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  void *v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));

  if (!v3)
  {
    v40 = sub_1004318FC();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Route search fields should have been setup in viewDidLoad")));
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[MacRoutePlanningOverviewViewController _prepareRouteSearchControllers]";
      v52 = 2080;
      v53 = "RoutePlanningOverviewViewController.m";
      v54 = 1024;
      v55 = 3590;
      v56 = 2080;
      v57 = "self.searchFieldsViewController != nil";
      v58 = 2112;
      v59 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", location, 0x30u);

    }
    if (sub_100A70734())
    {
      v43 = sub_1004318FC();
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  v4 = objc_alloc_init(RouteWaypointSuggestionsTableViewController);
  -[MacRoutePlanningOverviewViewController setRouteSearchSuggestionsTableViewController:](self, "setRouteSearchSuggestionsTableViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
  objc_msgSend(v5, "setRestoresFocusAfterTransition:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableView"));

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setSeparatorStyle:", 0);
  objc_msgSend(v7, "setRemembersLastFocusedIndexPath:", 0);
  LODWORD(v9) = 1132068864;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v9);
  LODWORD(v10) = 1144750080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v10);
  v11 = [RouteSearchViewController alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v16 = -[RouteSearchViewController initWithWaypointEditor:suggestionsTableView:delegate:dataCoordinator:](v11, "initWithWaypointEditor:suggestionsTableView:delegate:dataCoordinator:", v12, v13, v14, v15);
  -[MacRoutePlanningOverviewViewController setRouteSearchViewController:](self, "setRouteSearchViewController:", v16);

  objc_initWeak((id *)location, self);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1004D85A0;
  v48[3] = &unk_1011AD4F0;
  objc_copyWeak(&v49, (id *)location);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
  objc_msgSend(v17, "setTableViewDidReloadHandler:", v48);

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1004D85DC;
  v46[3] = &unk_1011AD260;
  objc_copyWeak(&v47, (id *)location);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  objc_msgSend(v18, "setIntrinsicContentSizeInvalidationHandler:", v46);

  v19 = [MenuContaineeViewController alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
  v21 = -[MenuContaineeViewController initWithContentViewController:](v19, "initWithContentViewController:", v20);
  -[MacRoutePlanningOverviewViewController setRouteSearchSuggestionsContaineeViewController:](self, "setRouteSearchSuggestionsContaineeViewController:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tableView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));
  objc_msgSend(v24, "setTrackedScrollview:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layoutGuideForCurrentlyEditingField"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "macMenuPresentationController"));
  objc_msgSend(v28, "setAnchorLayoutGuide:", v26);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layoutGuideForCurrentlyEditingField"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "macMenuPresentationController"));
  objc_msgSend(v32, "setWidthLayoutGuide:", v30);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
  v50 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "macMenuPresentationController"));
  objc_msgSend(v37, "setPassThroughViews:", v35);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "macMenuPresentationController"));
  objc_msgSend(v39, "addObserver:", self);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak((id *)location);

}

- (BOOL)isRouteSearchSuggestionsTableViewHidden
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
  if (objc_msgSend(v3, "isViewLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v7 = v6 == 0;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)setRouteSearchSuggestionsTableViewHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  char *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  char *v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));

  if (!v5)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Route search suggestions containee should have been setup in viewDidLoad")));
      v26 = 136316162;
      v27 = "-[MacRoutePlanningOverviewViewController setRouteSearchSuggestionsTableViewHidden:]";
      v28 = 2080;
      v29 = "RoutePlanningOverviewViewController.m";
      v30 = 1024;
      v31 = 3637;
      v32 = 2080;
      v33 = "self.routeSearchSuggestionsContaineeViewController != nil";
      v34 = 2112;
      v35 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v26, 0x30u);

    }
    if (sub_100A70734())
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v26 = 138412290;
        v27 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);

      }
    }
  }
  if (v3)
  {
    if (-[MacRoutePlanningOverviewViewController isRouteSearchSuggestionsTableViewHidden](self, "isRouteSearchSuggestionsTableViewHidden"))
    {
      return;
    }
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v7, "BOOLForKey:", CFSTR("__internal_DisableMacRoutingAutocomplete"));

    if (v6 == -[MacRoutePlanningOverviewViewController isRouteSearchSuggestionsTableViewHidden](self, "isRouteSearchSuggestionsTableViewHidden"))return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController searchFieldsViewController](self, "searchFieldsViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "focusGroupIdentifierForCurrentlyEditingField"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tableView"));
    objc_msgSend(v13, "setFocusGroupIdentifier:", v11);

    v14 = objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsContaineeViewController](self, "routeSearchSuggestionsContaineeViewController"));
    if (v6)
      -[NSObject viewController:dismissMenuControllerAnimated:](v14, "viewController:dismissMenuControllerAnimated:", v15, 1);
    else
      -[NSObject viewController:presentMenuController:animated:fromChrome:completion:](v14, "viewController:presentMenuController:animated:fromChrome:completion:", self, v15, 1, -[ContainerViewController delaysFirstCardPresentation]_0() ^ 1, &stru_1011B8EF0);

LABEL_16:
    return;
  }
  v16 = sub_1004318FC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v26 = 136315650;
    v27 = "-[MacRoutePlanningOverviewViewController setRouteSearchSuggestionsTableViewHidden:]";
    v28 = 2080;
    v29 = "RoutePlanningOverviewViewController.m";
    v30 = 1024;
    v31 = 3648;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v26, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v18 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v26 = 138412290;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);

    }
    goto LABEL_16;
  }
}

- (void)_presentElevationGraphForRoute:(id)a3 fromView:(id)a4
{
  id v6;
  RoutePlanningElevationPopoverViewController *elevationPopoverController;
  RoutePlanningElevationPopoverViewController *v8;
  RoutePlanningElevationPopoverViewController *v9;
  void *v10;
  void *v11;
  RoutePlanningElevationPopoverViewController *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  elevationPopoverController = self->_elevationPopoverController;
  if (v15)
  {
    if (!elevationPopoverController)
    {
      v8 = objc_alloc_init(RoutePlanningElevationPopoverViewController);
      v9 = self->_elevationPopoverController;
      self->_elevationPopoverController = v8;

      -[RoutePlanningElevationPopoverViewController setModalPresentationStyle:](self->_elevationPopoverController, "setModalPresentationStyle:", 7);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController popoverPresentationController](self->_elevationPopoverController, "popoverPresentationController"));
      objc_msgSend(v10, "setPermittedArrowDirections:", 12);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController popoverPresentationController](self->_elevationPopoverController, "popoverPresentationController"));
      objc_msgSend(v11, "setDelegate:", self);

      -[RoutePlanningElevationPopoverViewController setDefinesPresentationContext:](self->_elevationPopoverController, "setDefinesPresentationContext:", 1);
      elevationPopoverController = self->_elevationPopoverController;
    }
  }
  else if (elevationPopoverController)
  {
    -[RoutePlanningElevationPopoverViewController dismissViewControllerAnimated:completion:](elevationPopoverController, "dismissViewControllerAnimated:completion:", 1, 0);
    v12 = self->_elevationPopoverController;
    self->_elevationPopoverController = 0;

    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController popoverPresentationController](elevationPopoverController, "popoverPresentationController"));
  objc_msgSend(v13, "setSourceView:", v6);

  -[RoutePlanningElevationPopoverViewController setRoute:](self->_elevationPopoverController, "setRoute:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController presentingViewController](self->_elevationPopoverController, "presentingViewController"));

  if (!v14)
    -[MacRoutePlanningOverviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_elevationPopoverController, 1, 0);
LABEL_8:

}

- (void)presentationControllerWillDismiss:(id)a3
{
  RoutePlanningElevationPopoverViewController *elevationPopoverController;
  id v5;
  id v6;
  RoutePlanningElevationPopoverViewController *v7;

  elevationPopoverController = self->_elevationPopoverController;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController popoverPresentationController](elevationPopoverController, "popoverPresentationController"));

  if (v6 == v5)
  {
    v7 = self->_elevationPopoverController;
    self->_elevationPopoverController = 0;

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  uint64_t v7;
  id v8;

  y = a4.y;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3, a5, a4.x));
  if (y <= 0.0)
    v7 = 7;
  else
    v7 = 8;
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", v7, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)macMenuPresentationControllerDidDismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacRoutePlanningOverviewViewController routeSearchSuggestionsTableViewController](self, "routeSearchSuggestionsTableViewController", a3));
  objc_msgSend(v3, "reset");

}

- (RouteSearchViewController)routeSearchViewController
{
  return self->_routeSearchViewController;
}

- (void)setRouteSearchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_routeSearchViewController, a3);
}

- (RoutePlanningWaypointEditorViewController)searchFieldsViewController
{
  return self->_searchFieldsViewController;
}

- (void)setSearchFieldsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchFieldsViewController, a3);
}

- (RoutePlanningTransitTimingControlsView)timingControlsView
{
  return self->_timingControlsView;
}

- (void)setTimingControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_timingControlsView, a3);
}

- (RoutePlanningOptionsBar)optionsBar
{
  return self->_optionsBar;
}

- (void)setOptionsBar:(id)a3
{
  objc_storeStrong((id *)&self->_optionsBar, a3);
}

- (RoutePlanningEVChargeOptionsView)chargingOptionsView
{
  return self->_chargingOptionsView;
}

- (void)setChargingOptionsView:(id)a3
{
  objc_storeStrong((id *)&self->_chargingOptionsView, a3);
}

- (UIStackView)headerStackView
{
  return self->_headerStackView;
}

- (void)setHeaderStackView:(id)a3
{
  objc_storeStrong((id *)&self->_headerStackView, a3);
}

- (RouteWaypointSuggestionsTableViewController)routeSearchSuggestionsTableViewController
{
  return self->_routeSearchSuggestionsTableViewController;
}

- (void)setRouteSearchSuggestionsTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_routeSearchSuggestionsTableViewController, a3);
}

- (NSTimer)routeSearchSuggestionsToggleTimer
{
  return self->_routeSearchSuggestionsToggleTimer;
}

- (void)setRouteSearchSuggestionsToggleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_routeSearchSuggestionsToggleTimer, a3);
}

- (MenuContaineeViewController)routeSearchSuggestionsContaineeViewController
{
  return self->_routeSearchSuggestionsContaineeViewController;
}

- (void)setRouteSearchSuggestionsContaineeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_routeSearchSuggestionsContaineeViewController, a3);
}

- (RoutePlanningElevationPopoverViewController)elevationPopoverController
{
  return self->_elevationPopoverController;
}

- (void)setElevationPopoverController:(id)a3
{
  objc_storeStrong((id *)&self->_elevationPopoverController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevationPopoverController, 0);
  objc_storeStrong((id *)&self->_routeSearchSuggestionsContaineeViewController, 0);
  objc_storeStrong((id *)&self->_routeSearchSuggestionsToggleTimer, 0);
  objc_storeStrong((id *)&self->_routeSearchSuggestionsTableViewController, 0);
  objc_storeStrong((id *)&self->_headerStackView, 0);
  objc_storeStrong((id *)&self->_chargingOptionsView, 0);
  objc_storeStrong((id *)&self->_optionsBar, 0);
  objc_storeStrong((id *)&self->_timingControlsView, 0);
  objc_storeStrong((id *)&self->_searchFieldsViewController, 0);
  objc_storeStrong((id *)&self->_routeSearchViewController, 0);
}

@end
