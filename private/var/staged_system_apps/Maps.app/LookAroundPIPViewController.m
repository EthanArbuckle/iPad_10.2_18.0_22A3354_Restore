@implementation LookAroundPIPViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (LookAroundPIPViewController)initWithDataCoordinator:(id)a3 lookAroundView:(id)a4
{
  id v7;
  id v8;
  LookAroundPIPViewController *v9;
  LookAroundPIPViewController *v10;
  NSDateFormatter *v11;
  NSDateFormatter *dateFormatter;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LookAroundPIPViewController;
  v9 = -[LookAroundPIPViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataCoordinator, a3);
    -[LookAroundPIPDataCoordinator addObserver:](v10->_dataCoordinator, "addObserver:", v10);
    objc_storeStrong((id *)&v10->_lookAroundView, a4);
    v11 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v10->_dateFormatter;
    v10->_dateFormatter = v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[LookAroundPIPDataCoordinator removeObserver:](self->_dataCoordinator, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)LookAroundPIPViewController;
  -[LookAroundPIPViewController dealloc](&v3, "dealloc");
}

- (UIView)floatingButtonsView
{
  return (UIView *)-[LookAroundFloatingButtonsViewController view](self->_floatingButtonsViewController, "view");
}

- (BOOL)showsMinimizedButton
{
  return -[LookAroundFloatingButtonsViewController showsMinimizedButton](self->_floatingButtonsViewController, "showsMinimizedButton");
}

- (void)setShowsMinimizedButton:(BOOL)a3
{
  -[LookAroundFloatingButtonsViewController setShowsMinimizedButton:](self->_floatingButtonsViewController, "setShowsMinimizedButton:", a3);
}

- (void)loadView
{
  CardView *v3;
  CardView *cardView;
  CardView *v5;

  v3 = -[CardView initAllowingBlurred:]([CardView alloc], "initAllowingBlurred:", 0);
  -[CardView setLayoutStyle:](v3, "setLayoutStyle:", 6);
  cardView = self->_cardView;
  self->_cardView = v3;
  v5 = v3;

  -[LookAroundPIPViewController setView:](self, "setView:", self->_cardView);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LookAroundPIPViewController;
  -[LookAroundPIPViewController viewDidLoad](&v3, "viewDidLoad");
  -[LookAroundPIPViewController _setupViews](self, "_setupViews");
  -[LookAroundPIPViewController _setupConstraints](self, "_setupConstraints");
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LookAroundPIPViewController;
  -[LookAroundPIPViewController didMoveToParentViewController:](&v9, "didMoveToParentViewController:");
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController actionCoordinator](self, "actionCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentMapItem"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController dataCoordinator](self, "dataCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
    objc_msgSend(v7, "enterLookAroundPIPWithLookAroundView:mapItem:", v8, v6);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundPIPViewController;
  -[LookAroundPIPViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[MKLookAroundContainerView setFrame:](self->_lookAroundContainerView, "setFrame:");

  if (-[LookAroundFloatingButtonsViewController showsMinimizedButton](self->_floatingButtonsViewController, "showsMinimizedButton"))
  {
    v4 = 16.0;
  }
  else
  {
    v4 = 8.0;
  }
  if (sub_1002A8AA0(self) == 5)
    v4 = 10.0;
  -[NSLayoutConstraint setConstant:](self->_floatingButtonsTopConstraint, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_floatingButtonsLeadingConstraint, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_floatingButtonsTrailingConstraint, "setConstant:", -v4);
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapMaximizeButton:(id)a4
{
  void *v5;

  -[LookAroundFloatingButtonsViewController setShowsMinimizedButton:](self->_floatingButtonsViewController, "setShowsMinimizedButton:", 1, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v5, "viewControllerPresentLookAround:showsFullScreen:", self, 1);

  -[MKLookAroundView recordTriggerAction:](self->_lookAroundView, "recordTriggerAction:", 6062);
  -[LookAroundPIPViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 6062, 1700, 0);
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapMinimizeButton:(id)a4
{
  void *v5;

  -[LookAroundFloatingButtonsViewController setShowsMinimizedButton:](self->_floatingButtonsViewController, "setShowsMinimizedButton:", 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v5, "viewControllerPresentLookAround:showsFullScreen:", self, 0);

  -[MKLookAroundView recordTriggerAction:](self->_lookAroundView, "recordTriggerAction:", 6064);
  -[LookAroundPIPViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 6064, 1702, 0);
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapDoneButton:(id)a4
{
  uint64_t v5;
  id v6;

  if (-[LookAroundPIPViewController showsMinimizedButton](self, "showsMinimizedButton", a3, a4))
    v5 = 1702;
  else
    v5 = 1700;
  -[LookAroundPIPViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 6063, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v6, "exitLookAround");

}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectReportAnIssue:(id)a4
{
  RAPLookAroundContextImpl *v5;
  void *v6;
  void *v7;
  void *v8;
  RAPLookAroundContextImpl *v9;

  -[LookAroundPIPViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 5013, 1701, 0);
  v5 = [RAPLookAroundContextImpl alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  v9 = -[RAPLookAroundContextImpl initWithLookAroundView:](v5, "initWithLookAroundView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rapPresenter"));
  objc_msgSend(v8, "presentLookAroundRAPWithContext:completion:", v9, 0);

}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectToggleLabels:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  v7 = objc_msgSend(v6, "showsPointLabels");
  v8 = v7 ^ 1;

  objc_msgSend(v5, "setHidingLabels:", v7);
  if ((_DWORD)v7)
    v9 = 6066;
  else
    v9 = 6067;
  -[LookAroundPIPViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", v9, 1701, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v10, "setShowsPointLabels:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v11, "setShowsRoadLabels:", v8);

}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectImageryInfo:(id)a4
{
  void *v5;
  NSDateFormatter *dateFormatter;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDateFormatter *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3, a4));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Last Updated [LookAround]"), CFSTR("localized string not found"), 0));

  dateFormatter = self->_dateFormatter;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("MMMMyyyy"), 0, v7));
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](dateFormatter, "setLocalizedDateFormatFromTemplate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Imagery [LookAround]"), CFSTR("localized string not found"), 0));
  v11 = self->_dateFormatter;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v11, "stringFromDate:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v15, 1));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("localized string not found"), 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, 0));

  objc_msgSend(v16, "addAction:", v19);
  objc_msgSend(v16, "setPreferredAction:", v19);
  -[LookAroundPIPViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

}

- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3
{
  -[LookAroundPIPViewController _updateEnterLookAroundFullScreenEnabled:](self, "_updateEnterLookAroundFullScreenEnabled:", 1);
}

- (void)lookAroundPIPDataCoordinatorFailedToEnterLookArounPIP:(id)a3
{
  -[MKLookAroundContainerView setDimmingState:animated:](self->_lookAroundContainerView, "setDimmingState:animated:", 1, 1);
  -[LookAroundPIPViewController _updateLookAroundAvailability:imageryError:](self, "_updateLookAroundAvailability:imageryError:", 0, 1);
  -[LookAroundPIPViewController _updateEnterLookAroundFullScreenEnabled:](self, "_updateEnterLookAroundFullScreenEnabled:", 0);
}

- (void)lookAroundPIPDataCoordinatorWillExitLookAroundPIP:(id)a3
{
  -[LookAroundPIPViewController _updateEnterLookAroundFullScreenEnabled:](self, "_updateEnterLookAroundFullScreenEnabled:", 0);
}

- (void)lookAroundPIPDataCoordinatorDidExitLookAroundPIP:(id)a3
{
  +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:", 6059, 0, 0);
}

- (void)lookAroundPIPDataCoordinatorDidChangeLookAroundAvailability:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  v6 = objc_msgSend(v5, "_lookAroundAvailability");

  v7 = objc_msgSend(v4, "isMapViewInSyncWithLookAroundView");
  v8 = objc_msgSend(v4, "isPanningMapView");

  if (v6 == (id)2)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9 & (v8 ^ 1);
  -[MKLookAroundContainerView setDimmingState:animated:](self->_lookAroundContainerView, "setDimmingState:animated:", v9 ^ 1 | v8, 1);
  -[LookAroundPIPViewController _updateLookAroundAvailability:](self, "_updateLookAroundAvailability:", v6);
  -[LookAroundPIPViewController _updateEnterLookAroundFullScreenEnabled:](self, "_updateEnterLookAroundFullScreenEnabled:", v10);
}

- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3
{
  VKMuninMarker *v4;
  VKMuninMarker *muninMarker;

  v4 = (VKMuninMarker *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPDataCoordinator muninMarker](self->_dataCoordinator, "muninMarker", a3));
  muninMarker = self->_muninMarker;
  self->_muninMarker = v4;

  -[MKLookAroundContainerView setDimmingState:animated:](self->_lookAroundContainerView, "setDimmingState:animated:", 1, 1);
  -[LookAroundPIPViewController _updateEnterLookAroundFullScreenEnabled:](self, "_updateEnterLookAroundFullScreenEnabled:", 0);
}

- (void)lookAroundPIPDataCoordinatorIsPanningMapView:(id)a3
{
  VKMuninMarker *v4;
  VKMuninMarker *muninMarker;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = (VKMuninMarker *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPDataCoordinator muninMarker](self->_dataCoordinator, "muninMarker"));
  muninMarker = self->_muninMarker;
  if ((v4 != 0) != (muninMarker != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
    v7 = objc_msgSend(v6, "_lookAroundAvailability");

    -[LookAroundPIPViewController _updateLookAroundAvailability:](self, "_updateLookAroundAvailability:", v7);
    muninMarker = self->_muninMarker;
  }
  self->_muninMarker = v4;

}

- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3
{
  MKLookAroundContainerView *lookAroundContainerView;
  id v5;
  void *v6;
  VKMuninMarker *muninMarker;

  lookAroundContainerView = self->_lookAroundContainerView;
  v5 = a3;
  -[MKLookAroundContainerView setDimmingState:animated:](lookAroundContainerView, "setDimmingState:animated:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));

  -[LookAroundPIPViewController _updateLookAroundAvailability:](self, "_updateLookAroundAvailability:", objc_msgSend(v6, "_lookAroundAvailability"));
  muninMarker = self->_muninMarker;
  self->_muninMarker = 0;

}

- (void)lookAroundPIPDataCoordinatorDidSynchronizeMapView:(id)a3
{
  -[MKLookAroundContainerView setDimmingState:animated:](self->_lookAroundContainerView, "setDimmingState:animated:", 2, 1);
  -[LookAroundPIPViewController _updateLookAroundAvailability:](self, "_updateLookAroundAvailability:", 2);
}

- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMapViewInSyncWithLookAroundView");
  v6 = v5 & objc_msgSend(v4, "isLookAroundDataAvailable");
  -[MKLookAroundContainerView setDimmingState:animated:](self->_lookAroundContainerView, "setDimmingState:animated:", v6 ^ 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));

  -[LookAroundPIPViewController _updateLookAroundAvailability:](self, "_updateLookAroundAvailability:", objc_msgSend(v7, "_lookAroundAvailability"));
  -[LookAroundPIPViewController _updateEnterLookAroundFullScreenEnabled:](self, "_updateEnterLookAroundFullScreenEnabled:", v6);
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *floatingButtonsTopConstraint;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *floatingButtonsLeadingConstraint;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *floatingButtonsTrailingConstraint;
  NSLayoutConstraint *v22;
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
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[9];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self->_floatingButtonsViewController, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  floatingButtonsTopConstraint = self->_floatingButtonsTopConstraint;
  self->_floatingButtonsTopConstraint = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self->_floatingButtonsViewController, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  floatingButtonsLeadingConstraint = self->_floatingButtonsLeadingConstraint;
  self->_floatingButtonsLeadingConstraint = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self->_floatingButtonsViewController, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  floatingButtonsTrailingConstraint = self->_floatingButtonsTrailingConstraint;
  self->_floatingButtonsTrailingConstraint = v20;

  v22 = self->_floatingButtonsLeadingConstraint;
  v43[0] = self->_floatingButtonsTopConstraint;
  v43[1] = v22;
  v43[2] = self->_floatingButtonsTrailingConstraint;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_statusMessageLabel, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self->_floatingButtonsViewController, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:", v40));
  v43[3] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_statusMessageLabel, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:", v37));
  v43[4] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_statusMessageLabel, "centerXAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v43[5] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_statusMessageLabel, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v23));
  v43[6] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_statusMessageLabel, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 8.0));
  v43[7] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_statusMessageLabel, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -8.0));
  v43[8] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

}

- (void)_setupViews
{
  id v3;
  void *v4;
  MKLookAroundContainerView *v5;
  MKLookAroundContainerView *lookAroundContainerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LookAroundFloatingButtonsViewController *v12;
  LookAroundFloatingButtonsViewController *floatingButtonsViewController;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *statusMessageLabel;
  void *v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
  v3 = objc_alloc((Class)MKLookAroundContainerView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  v5 = (MKLookAroundContainerView *)objc_msgSend(v3, "initWithLookAroundView:", v4);
  lookAroundContainerView = self->_lookAroundContainerView;
  self->_lookAroundContainerView = v5;

  -[MKLookAroundContainerView setBadgeHidden:](self->_lookAroundContainerView, "setBadgeHidden:", 0);
  objc_msgSend(v19, "addSubview:", self->_lookAroundContainerView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v7, "setNavigatingEnabled:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v8, "setPanningEnabled:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v9, "setZoomingEnabled:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v10, "setShowsPointLabels:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v11, "setShowsRoadLabels:", 1);

  v12 = -[LookAroundFloatingButtonsViewController initWithShowsMinimizeButton:groupButtonsIfNeeded:]([LookAroundFloatingButtonsViewController alloc], "initWithShowsMinimizeButton:groupButtonsIfNeeded:", 0, 1);
  floatingButtonsViewController = self->_floatingButtonsViewController;
  self->_floatingButtonsViewController = v12;

  -[LookAroundPIPViewController addChildViewController:](self, "addChildViewController:", self->_floatingButtonsViewController);
  -[LookAroundFloatingButtonsViewController setDelegate:](self->_floatingButtonsViewController, "setDelegate:", self);
  -[LookAroundFloatingButtonsViewController setMaximizedButtonEnabled:](self->_floatingButtonsViewController, "setMaximizedButtonEnabled:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self->_floatingButtonsViewController, "view"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self->_floatingButtonsViewController, "view"));
  objc_msgSend(v19, "addSubview:", v15);

  -[LookAroundFloatingButtonsViewController didMoveToParentViewController:](self->_floatingButtonsViewController, "didMoveToParentViewController:", self);
  v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  statusMessageLabel = self->_statusMessageLabel;
  self->_statusMessageLabel = v16;

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_statusMessageLabel, &stru_1011DCE08);
  -[UILabel setAlpha:](self->_statusMessageLabel, "setAlpha:", 0.0);
  -[UILabel setNumberOfLines:](self->_statusMessageLabel, "setNumberOfLines:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_statusMessageLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](self->_statusMessageLabel, "setTextAlignment:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_statusMessageLabel, "setTextColor:", v18);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_statusMessageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "addSubview:", self->_statusMessageLabel);
  -[MapsThemeViewController updateTheme](self, "updateTheme");

}

- (void)_updateLookAroundAvailability:(int64_t)a3
{
  -[LookAroundPIPViewController _updateLookAroundAvailability:imageryError:](self, "_updateLookAroundAvailability:imageryError:", a3, 0);
}

- (void)_updateLookAroundAvailability:(int64_t)a3 imageryError:(BOOL)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  UILabel *v9;
  id v10;
  UILabel *v11;
  _QWORD v12[4];
  UILabel *v13;
  id v14;

  if (a3 == 1 && !a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("LookAround PIP [Area Available]");
LABEL_7:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

    goto LABEL_8;
  }
  if (!a3 && !a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("LookAround PIP [Not Available]");
    goto LABEL_7;
  }
  if (a4)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[LookAroundErrorStringBuilder buildBestErrorStringForCurrentNetworkState](LookAroundErrorStringBuilder, "buildBestErrorStringForCurrentNetworkState"));
  else
    v8 = 0;
LABEL_8:
  v9 = self->_statusMessageLabel;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10096A600;
  v12[3] = &unk_1011AC8B0;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, 0.25);

}

- (void)_updateEnterLookAroundFullScreenEnabled:(BOOL)a3
{
  -[LookAroundFloatingButtonsViewController setMaximizedButtonEnabled:animated:](self->_floatingButtonsViewController, "setMaximizedButtonEnabled:animated:", a3, 1);
}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  unsigned __int8 v21;
  uint64_t v22;
  id v23;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v23 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController dataCoordinator](self, "dataCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v9, "centerCoordinate");
  v13 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithLatitude:longitude:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "camera"));
  objc_msgSend(v14, "heading");
  v16 = v15;
  objc_msgSend(v9, "_zoomLevel");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "visiblePlaceMUIDs"));
  v20 = objc_msgSend(v19, "count");
  if ((objc_msgSend(v10, "showsRoadLabels") & 1) != 0)
    v21 = 1;
  else
    v21 = objc_msgSend(v10, "showsPointLabels");
  LOBYTE(v22) = v21;
  +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:", v6, v5, v23, v13, v16, v20, v18, v22);

}

- (LookAroundActionCoordination)actionCoordinator
{
  return (LookAroundActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (void)setActionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_actionCoordinator, a3);
}

- (MKLookAroundContainerView)lookAroundContainerView
{
  return self->_lookAroundContainerView;
}

- (void)setLookAroundContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundContainerView, a3);
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (void)setLookAroundView:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundView, a3);
}

- (CardView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
  objc_storeStrong((id *)&self->_cardView, a3);
}

- (LookAroundPIPDataCoordinator)dataCoordinator
{
  return self->_dataCoordinator;
}

- (void)setDataCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_dataCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCoordinator, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_muninMarker, 0);
  objc_storeStrong((id *)&self->_statusMessageLabel, 0);
  objc_storeStrong((id *)&self->_floatingButtonsTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_floatingButtonsLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_floatingButtonsTopConstraint, 0);
  objc_storeStrong((id *)&self->_floatingButtonsViewController, 0);
}

@end
