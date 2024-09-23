@implementation RidesharingDetailsPickingViewController

- (RidesharingDetailsPickingViewController)init
{
  RidesharingDetailsPickingViewController *v2;
  RideBookingRequestRideOptionProxy *v3;
  RideBookingRequestRideOptionProxy *requestRideOptionProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RidesharingDetailsPickingViewController;
  v2 = -[RidesharingDetailsPickingViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = -[RideBookingRequestRideOptionProxy initWithDelegate:]([RideBookingRequestRideOptionProxy alloc], "initWithDelegate:", v2);
    requestRideOptionProxy = v2->_requestRideOptionProxy;
    v2->_requestRideOptionProxy = v3;

  }
  return v2;
}

- (void)viewDidLoad
{
  ContainerHeaderView *v3;
  ContainerHeaderView *containerHeaderView;
  void *v5;
  ContainerHeaderView *v6;
  void *v7;
  void *v8;
  RouteOverviewFieldsView *v9;
  RouteOverviewFieldsView *routeFromToView;
  id v11;
  void *v12;
  void *v13;
  ExtensionsPrimaryDetailsView *v14;
  ExtensionsPrimaryDetailsView *primaryDetailsView;
  ProminentActionButton *v16;
  ProminentActionButton *requestButton;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ExtensionsPrimaryDetailsView *v23;
  void *v24;
  ExtensionsSecondaryDetailsView *v25;
  ExtensionsSecondaryDetailsView *secondaryDetailsView;
  ExtensionsPayView *v27;
  ExtensionsPayView *payView;
  ExtensionsActionsFooterView *v29;
  ExtensionsActionsFooterView *openAppView;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;
  ProminentActionButton *v40;

  v39.receiver = self;
  v39.super_class = (Class)RidesharingDetailsPickingViewController;
  -[ExtensionsStackViewController viewDidLoad](&v39, "viewDidLoad");
  v3 = objc_alloc_init(ContainerHeaderView);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v3;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_containerHeaderView, "setDelegate:", self);
  -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController headerView](self, "headerView"));
  objc_msgSend(v5, "addSubview:", self->_containerHeaderView);

  v6 = self->_containerHeaderView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController headerView](self, "headerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView _maps_constraintsForCenteringInView:](v6, "_maps_constraintsForCenteringInView:", v7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

  v9 = -[RouteOverviewFieldsView initWithDelegate:waypointInfoProvider:editingMode:]([RouteOverviewFieldsView alloc], "initWithDelegate:waypointInfoProvider:editingMode:", self, 0, 0);
  routeFromToView = self->_routeFromToView;
  self->_routeFromToView = v9;

  -[RouteOverviewFieldsView setHasRefinementsBar:](self->_routeFromToView, "setHasRefinementsBar:", 0);
  -[RouteOverviewFieldsView setTranslatesAutoresizingMaskIntoConstraints:](self->_routeFromToView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Route Planning] Ride Share Title"), CFSTR("localized string not found"), 0));
  objc_msgSend(v11, "setText:", v13);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v11, &stru_1011E79D8);
  -[ContainerHeaderView setTitleView:](self->_containerHeaderView, "setTitleView:", v11);
  -[ContainerHeaderView setTitleViewInsets:](self->_containerHeaderView, "setTitleViewInsets:", 16.0, 16.0, 12.0, 16.0);
  -[ContainerHeaderView setAccessoryView:](self->_containerHeaderView, "setAccessoryView:", 0);
  -[ContainerHeaderView setAccessoryViewInsets:](self->_containerHeaderView, "setAccessoryViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v14 = objc_alloc_init(ExtensionsPrimaryDetailsView);
  primaryDetailsView = self->_primaryDetailsView;
  self->_primaryDetailsView = v14;

  -[ExtensionsPrimaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryDetailsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (ProminentActionButton *)objc_claimAutoreleasedReturnValue(+[ProminentActionButton button](ProminentActionButton, "button"));
  requestButton = self->_requestButton;
  self->_requestButton = v16;

  -[ProminentActionButton addTarget:action:forControlEvents:](self->_requestButton, "addTarget:action:forControlEvents:", self, "_request", 0x2000);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController theme](self, "theme"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "keyColor"));
  -[ProminentActionButton setTintColor:](self->_requestButton, "setTintColor:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton titleLabel](self->_requestButton, "titleLabel"));
  objc_msgSend(v20, "setLineBreakMode:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton titleLabel](self->_requestButton, "titleLabel"));
  objc_msgSend(v21, "setNumberOfLines:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton titleLabel](self->_requestButton, "titleLabel"));
  objc_msgSend(v22, "setTextAlignment:", 1);

  v23 = self->_primaryDetailsView;
  v40 = self->_requestButton;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
  -[ExtensionsPrimaryDetailsView configureWithActionButtons:](v23, "configureWithActionButtons:", v24);

  v25 = objc_alloc_init(ExtensionsSecondaryDetailsView);
  secondaryDetailsView = self->_secondaryDetailsView;
  self->_secondaryDetailsView = v25;

  -[ExtensionsSecondaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryDetailsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_initWeak(&location, self);
  v27 = objc_alloc_init(ExtensionsPayView);
  payView = self->_payView;
  self->_payView = v27;

  -[ExtensionsPayView setTranslatesAutoresizingMaskIntoConstraints:](self->_payView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10024BF84;
  v36[3] = &unk_1011AD8E8;
  objc_copyWeak(&v37, &location);
  -[ExtensionsPayView setPerformChangeCommand:](self->_payView, "setPerformChangeCommand:", v36);
  v29 = objc_alloc_init(ExtensionsActionsFooterView);
  openAppView = self->_openAppView;
  self->_openAppView = v29;

  -[ExtensionsActionsFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_openAppView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10024C0A0;
  v34[3] = &unk_1011AD260;
  objc_copyWeak(&v35, &location);
  -[ExtensionsActionsFooterView setDidTapOpenAppButton:](self->_openAppView, "setDidTapOpenAppButton:", v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
  -[RidesharingDetailsPickingViewController _updateFromRequestRideStatus:](self, "_updateFromRequestRideStatus:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController stackedViews](self, "stackedViews"));
  objc_msgSend(v32, "_maps_setArrangedSubviews:", v33);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RidesharingDetailsPickingViewController;
  -[RidesharingDetailsPickingViewController viewDidAppear:](&v10, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController coordinator](self, "coordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerViewController"));
  objc_msgSend(v5, "setNeedsUpdateForShowingDetailsPickingAnimated");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController coordinator](self, "coordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerViewController"));
  objc_msgSend(v7, "setRequestingRide:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "analyticsBookingSession"));
  objc_msgSend(v9, "captureView:", 2);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RidesharingDetailsPickingViewController;
  -[ContaineeViewController viewWillDisappear:](&v9, "viewWillDisappear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController coordinator](self, "coordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerViewController"));
  objc_msgSend(v6, "updateForDismissingDetailsPickingAnimated:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController coordinator](self, "coordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containerViewController"));
  objc_msgSend(v8, "setRequestingRide:", 0);

}

- (NSArray)topBannerItems
{
  NSArray *topBannerItems;
  TopBannerItem *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  TopBannerItem *v9;
  TopBannerItem *moveMapPromptItem;
  NSArray *v11;
  NSArray *v12;
  TopBannerItem *v14;

  topBannerItems = self->_topBannerItems;
  if (!topBannerItems)
  {
    v4 = [TopBannerItem alloc];
    v5 = objc_alloc((Class)NSAttributedString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Move the map to set your pickup location"), CFSTR("localized string not found"), 0));
    v8 = objc_msgSend(v5, "initWithString:", v7);
    v9 = -[TopBannerItem initWithType:layout:userInfo:attributedString:icon:buttonText:buttonAction:](v4, "initWithType:layout:userInfo:attributedString:icon:buttonText:buttonAction:", 0, 0, 0, v8, 0, 0, 0);
    moveMapPromptItem = self->_moveMapPromptItem;
    self->_moveMapPromptItem = v9;

    v14 = self->_moveMapPromptItem;
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v12 = self->_topBannerItems;
    self->_topBannerItems = v11;

    topBannerItems = self->_topBannerItems;
  }
  return topBannerItems;
}

- (BannerContainerProtocol)bannerContainer
{
  BannerContainerProtocol **p_bannerContainer;
  id WeakRetained;
  id v4;

  p_bannerContainer = &self->_bannerContainer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bannerContainer);

  if (WeakRetained)
    v4 = objc_loadWeakRetained((id *)p_bannerContainer);
  else
    v4 = 0;
  return (BannerContainerProtocol *)v4;
}

- (id)stackedViews
{
  ExtensionsPrimaryDetailsView *primaryDetailsView;
  ExtensionsSecondaryDetailsView *secondaryDetailsView;
  _QWORD v5[5];

  primaryDetailsView = self->_primaryDetailsView;
  v5[0] = self->_routeFromToView;
  v5[1] = primaryDetailsView;
  secondaryDetailsView = self->_secondaryDetailsView;
  v5[2] = self->_payView;
  v5[3] = secondaryDetailsView;
  v5[4] = self->_openAppView;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 5));
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (a3 - 3 < 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v9, "availableHeight");
    v4 = v10;

  }
  else if (a3 == 2)
  {
    -[RidesharingDetailsPickingViewController headerAndRouteFromToViewHeight](self, "headerAndRouteFromToViewHeight");
    v12 = v11;
    -[ExtensionsPrimaryDetailsView systemLayoutSizeFittingSize:](self->_primaryDetailsView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    return v12 + v13;
  }
  else
  {
    v4 = -1.0;
    if (a3 == 1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v5, "bottomSafeOffset");
      v7 = v6;
      -[RidesharingDetailsPickingViewController headerAndRouteFromToViewHeight](self, "headerAndRouteFromToViewHeight");
      v4 = v7 + v8;

    }
  }
  return v4;
}

- (double)headerAndRouteFromToViewHeight
{
  double v3;
  double v4;
  double v5;

  -[ContaineeViewController headerHeight](self, "headerHeight");
  v4 = v3;
  -[RouteOverviewFieldsView systemLayoutSizeFittingSize:](self->_routeFromToView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  if (v5 == 0.0)
    -[RouteOverviewFieldsView intrinsicContentSize](self->_routeFromToView, "intrinsicContentSize");
  return v4 + v5;
}

- (BOOL)_isPresented
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController presentingViewController](self, "presentingViewController"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController parentViewController](self, "parentViewController"));
    v4 = v5 != 0;

  }
  return v4;
}

- (void)_updateFromRequestRideStatus:(id)a3
{
  id v4;
  RidesharingErrorAlertProvider *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  double v14;
  ProminentActionButton *requestButton;
  void *v16;
  ExtensionsPrimaryDetailsView *primaryDetailsView;
  void *v18;
  void *v19;
  void *v20;
  ProminentActionButton *v21;

  v4 = a3;
  -[RidesharingDetailsPickingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (objc_msgSend(v4, "requestRideStatusError"))
  {
    v5 = [RidesharingErrorAlertProvider alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userActivity"));
    v8 = -[RidesharingErrorAlertProvider _initWithCause:application:activity:](v5, "_initWithCause:application:activity:", 2, v6, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "analyticsBookingSession"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    objc_msgSend(v10, "captureErrorMessage:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController coordinator](self, "coordinator"));
    objc_msgSend(v12, "viewController:presentErrorAlertIfNeeded:", self, v8);

  }
  else if (-[RidesharingDetailsPickingViewController _isPresented](self, "_isPresented")
         && objc_msgSend(v4, "requestExpired"))
  {
    -[RidesharingDetailsPickingViewController _showExpirationAlert](self, "_showExpirationAlert");
  }
  else
  {
    +[ExtensionsViewComposer composeCustomHeaderView:forRideBookingRequestRideStatus:](ExtensionsViewComposer, "composeCustomHeaderView:forRideBookingRequestRideStatus:", self->_routeFromToView, v4);
    +[ExtensionsViewComposer composePrimaryDetailsView:forRideBookingRequestRideStatus:](ExtensionsViewComposer, "composePrimaryDetailsView:forRideBookingRequestRideStatus:", self->_primaryDetailsView, v4);
    v13 = objc_msgSend(v4, "loadingRequest");
    if (v13)
      v14 = 0.5;
    else
      v14 = 1.0;
    -[ProminentActionButton setEnabled:](self->_requestButton, "setEnabled:", v13 ^ 1);
    -[ProminentActionButton setAlpha:](self->_requestButton, "setAlpha:", v14);
    requestButton = self->_requestButton;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestCommandTitle"));
    -[ProminentActionButton setTitle:forState:](requestButton, "setTitle:forState:", v16, 0);

    primaryDetailsView = self->_primaryDetailsView;
    v21 = self->_requestButton;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    -[ExtensionsPrimaryDetailsView configureWithActionButtons:](primaryDetailsView, "configureWithActionButtons:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideOption"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "paymentMethods"));
    -[ExtensionsPayView setHidden:](self->_payView, "setHidden:", objc_msgSend(v20, "count") == 0);

    +[ExtensionsViewComposer composeSecondaryDetailsView:forRideBookingRequestRideStatus:](ExtensionsViewComposer, "composeSecondaryDetailsView:forRideBookingRequestRideStatus:", self->_secondaryDetailsView, v4);
    +[ExtensionsViewComposer composePayView:forRideBookingRequestRideStatus:](ExtensionsViewComposer, "composePayView:forRideBookingRequestRideStatus:", self->_payView, v4);
    +[ExtensionsViewComposer composeOpenAppView:forRideBookingRequestRideStatus:](ExtensionsViewComposer, "composeOpenAppView:forRideBookingRequestRideStatus:", self->_openAppView, v4);
  }

}

- (void)requestRideStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[RidesharingDetailsPickingViewController setRequestRideStatus:](self, "setRequestRideStatus:", v4);
  -[RidesharingDetailsPickingViewController _updateFromRequestRideStatus:](self, "_updateFromRequestRideStatus:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  if (v6 == (id)2)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "updateHeightForCurrentLayout");

  }
}

- (id)waypointsForFieldsView:(id)a3
{
  return 0;
}

- (id)currentRefinementsForFieldsView:(id)a3
{
  return 0;
}

- (int64_t)transportTypeForFieldsView:(id)a3
{
  return 4;
}

- (void)_showExpirationAlert
{
  void *v3;
  void *v4;

  if (!self->_finishedPickingDetails)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController coordinator](self, "coordinator"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
    objc_msgSend(v3, "presentExpirationAlertControllerWithRequestRideStatus:", v4);

    self->_finishedPickingDetails = 1;
  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3, a4));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 4, 1402, 0);

  if (!self->_finishedPickingDetails)
  {
    -[RidesharingDetailsPickingViewController setRequestRideOptionProxy:](self, "setRequestRideOptionProxy:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController coordinator](self, "coordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
    objc_msgSend(v7, "dismissRidesharingSessionAndReturnToRoutePlanning:", 1);

    self->_finishedPickingDetails = 1;
  }
}

- (void)_selectPaymentType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 14006, 1402, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[RidesharingPaymentSelectionAlertController ridesharingPaymentSelectionAlertControllerWithRequestRideStatus:requestRideOptionProxy:](RidesharingPaymentSelectionAlertController, "ridesharingPaymentSelectionAlertControllerWithRequestRideStatus:requestRideOptionProxy:", v4, v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView changePaymentMethodButton](self->_payView, "changePaymentMethodButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
  objc_msgSend(v7, "setSourceView:", v6);

  -[RidesharingDetailsPickingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_request
{
  void *v3;
  _QWORD *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
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
  _QWORD v25[4];
  _QWORD *v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 14004, 1402, 0);

  self->_finishedPickingDetails = 1;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10024CF58;
  v28[3] = &unk_1011AC860;
  v28[4] = self;
  v4 = objc_retainBlock(v28);
  -[RideBookingRequestRideStatus startWaypointCoordinate](self->_requestRideStatus, "startWaypointCoordinate");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastLocation"));
  v11 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v6, v8);
  objc_msgSend(v10, "distanceFromLocation:", v11);
  v13 = v12;

  if (v13 <= GEOConfigGetDouble(MapsConfig_RideBookingDistanceToPickupThreshold, off_1014B2ED8))
  {
    ((void (*)(_QWORD *))v4[2])(v4);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Ridesharing] pickup location distance confirmation title"), CFSTR("localized string not found"), 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Ridesharing] pickup location distance confirmation message"), CFSTR("localized string not found"), 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v24, v23, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10024D244;
    v27[3] = &unk_1011AD938;
    v27[4] = self;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 1, v27));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Confirm"), CFSTR("localized string not found"), 0));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10024D258;
    v25[3] = &unk_1011AD960;
    v26 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 0, v25));

    objc_msgSend(v16, "addAction:", v19);
    objc_msgSend(v16, "addAction:", v22);
    -[RidesharingDetailsPickingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

  }
}

- (void)setRequestingRide:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController coordinator](self, "coordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerViewController"));
  objc_msgSend(v6, "setRequestingRide:", v3);

  v7 = v3 ^ 1;
  -[ProminentActionButton setSpinnerHidden:](self->_requestButton, "setSpinnerHidden:", v7);
  -[ProminentActionButton setUserInteractionEnabled:](self->_requestButton, "setUserInteractionEnabled:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView changePaymentMethodButton](self->_payView, "changePaymentMethodButton"));
  objc_msgSend(v8, "setUserInteractionEnabled:", v7);

}

- (void)_requestRide
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
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
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t Log;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id buf[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("RidesharingDidRequestRideNotificationKey"), 0);

  -[RidesharingDetailsPickingViewController setRequestingRide:](self, "setRequestingRide:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocation"));
  objc_msgSend(v6, "distanceFromLocation:", v8);
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "analyticsBookingSession"));
  objc_msgSend(v12, "setDistanceToPickup:", v10);

  v13 = objc_alloc_init((Class)NSDate);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "analyticsBookingSession"));
  objc_msgSend(v15, "setBookingDate:", v13);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "destination"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_geoMapItem"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "origin"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_geoMapItem"));

  if (v18)
  {
    if (v21)
      goto LABEL_10;
    goto LABEL_7;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "destination"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "location"));
  objc_msgSend(v24, "coordinate");
  v26 = v25;
  v28 = v27;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingDetailsPickingViewController");
  v30 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Constructing a minimalMapItem for the BaR destination for analytics", (uint8_t *)buf, 2u);
  }

  v31 = objc_msgSend(objc_alloc((Class)GEOPlace), "initWithLatitude:longitude:", v26, v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForPlace:](GEOMapItemStorage, "mapItemStorageForPlace:", v31));

  if (!v21)
  {
LABEL_7:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "origin"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "location"));
    objc_msgSend(v34, "coordinate");
    v36 = v35;
    v38 = v37;
    v39 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingDetailsPickingViewController");
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Constructing a minimalMapItem for the BaR destination for analytics", (uint8_t *)buf, 2u);
    }

    v41 = objc_msgSend(objc_alloc((Class)GEOPlace), "initWithLatitude:longitude:", v36, v38);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForPlace:](GEOMapItemStorage, "mapItemStorageForPlace:", v41));

  }
LABEL_10:
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
  objc_msgSend(v42, "captureActualTransportationMode:originMapItem:destinationMapItem:", 6, v21, v18);

  objc_initWeak(buf, self);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10024D734;
  v44[3] = &unk_1011AD988;
  objc_copyWeak(&v45, buf);
  objc_msgSend(v43, "requestRideWithCompletion:", v44);

  objc_destroyWeak(&v45);
  objc_destroyWeak(buf);

}

- (void)_openApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 6020, 1402, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "analyticsBookingSession"));
  objc_msgSend(v5, "endSessionOnView:state:", 2, 4);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingDetailsPickingViewController requestRideStatus](self, "requestRideStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userActivity"));
  objc_msgSend(v6, "openWithActivity:", v8);

}

- (void)setBannerContainer:(id)a3
{
  objc_storeWeak((id *)&self->_bannerContainer, a3);
}

- (RidesharingCoordinator)coordinator
{
  return (RidesharingCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideStatus, a3);
}

- (RideBookingRequestRideOptionProxy)requestRideOptionProxy
{
  return self->_requestRideOptionProxy;
}

- (void)setRequestRideOptionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideOptionProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRideOptionProxy, 0);
  objc_storeStrong((id *)&self->_requestRideStatus, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_destroyWeak((id *)&self->_bannerContainer);
  objc_storeStrong((id *)&self->_topBannerItems, 0);
  objc_storeStrong((id *)&self->_moveMapPromptItem, 0);
  objc_storeStrong((id *)&self->_requestButton, 0);
  objc_storeStrong((id *)&self->_openAppView, 0);
  objc_storeStrong((id *)&self->_secondaryDetailsView, 0);
  objc_storeStrong((id *)&self->_payView, 0);
  objc_storeStrong((id *)&self->_primaryDetailsView, 0);
  objc_storeStrong((id *)&self->_routeFromToView, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end
