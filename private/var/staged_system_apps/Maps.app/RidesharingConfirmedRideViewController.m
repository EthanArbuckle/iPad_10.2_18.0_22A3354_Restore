@implementation RidesharingConfirmedRideViewController

- (RidesharingConfirmedRideViewController)initWithApplicationIdentifier:(id)a3
{
  id v4;
  RidesharingConfirmedRideViewController *v5;
  NSString *v6;
  NSString *applicationIdentifier;
  RideBookingRideStatusObserverProxy *v8;
  RideBookingRideStatusObserverProxy *rideStatusObserverProxy;
  void *v10;
  uint64_t v11;
  _MXExtensionManager *extensionManager;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RidesharingConfirmedRideViewController;
  v5 = -[RidesharingConfirmedRideViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = v6;

    v8 = -[RideBookingRideStatusObserverProxy initWithDelegate:]([RideBookingRideStatusObserverProxy alloc], "initWithDelegate:", v5);
    rideStatusObserverProxy = v5->_rideStatusObserverProxy;
    v5->_rideStatusObserverProxy = v8;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1005E4DE8;
    v14[3] = &unk_1011BD4E0;
    v15 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_MXExtensionManager _lookupPolicyWithBlock:](_MXExtensionManager, "_lookupPolicyWithBlock:", v14));
    v11 = objc_claimAutoreleasedReturnValue(+[_MXExtensionManager managerWithLookupPolicy:delegate:](_MXExtensionManager, "managerWithLookupPolicy:delegate:", v10, v5));
    extensionManager = v5->_extensionManager;
    v5->_extensionManager = (_MXExtensionManager *)v11;

  }
  return v5;
}

- (RidesharingConfirmedRideViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RidesharingConfirmedRideViewController;
  return -[RidesharingConfirmedRideViewController initWithNibName:bundle:](&v3, "initWithNibName:bundle:", 0, 0);
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
  FeedbackHeaderView *v14;
  FeedbackHeaderView *feedbackHeaderView;
  UIView *v16;
  UIView *bannerViewContainerView;
  id v18;
  UIView *v19;
  UIView *roundedRectView;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  ExtensionsBannerView *v27;
  ExtensionsBannerView *bannerView;
  ExtensionsRidesharingTemplatedBannerView *v29;
  ExtensionsRidesharingTemplatedBannerView *templatedBannerView;
  ExtensionsBannerAttributionView *v31;
  ExtensionsBannerAttributionView *bannerAttributionView;
  ExtensionsFeedbackView *v33;
  ExtensionsFeedbackView *v34;
  ExtensionsFeedbackView *feedbackView;
  ExtensionsPrimaryDetailsView *v36;
  ExtensionsPrimaryDetailsView *primaryDetailsView;
  ExtensionsSecondaryDetailsView *v38;
  ExtensionsSecondaryDetailsView *secondaryDetailsView;
  ExtensionsActionsFooterView *v40;
  ExtensionsActionsFooterView *openAppView;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id location;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)RidesharingConfirmedRideViewController;
  -[ExtensionsStackViewController viewDidLoad](&v51, "viewDidLoad");
  v3 = objc_alloc_init(ContainerHeaderView);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v3;

  -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", 0.0);
  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_containerHeaderView, "setDelegate:", self);
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
  v14 = objc_alloc_init(FeedbackHeaderView);
  feedbackHeaderView = self->_feedbackHeaderView;
  self->_feedbackHeaderView = v14;

  -[FeedbackHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_feedbackHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[FeedbackHeaderView setTitle:](self->_feedbackHeaderView, "setTitle:", &stru_1011EB268);
  -[FeedbackHeaderView setSubtitle:](self->_feedbackHeaderView, "setSubtitle:", &stru_1011EB268);
  v16 = (UIView *)objc_alloc_init((Class)UIView);
  bannerViewContainerView = self->_bannerViewContainerView;
  self->_bannerViewContainerView = v16;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_bannerViewContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_bannerViewTapped:");
  -[UIView addGestureRecognizer:](self->_bannerViewContainerView, "addGestureRecognizer:", v18);
  v19 = objc_opt_new(UIView);
  roundedRectView = self->_roundedRectView;
  self->_roundedRectView = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_roundedRectView, "layer"));
  objc_msgSend(v21, "setCornerRadius:", 6.0);

  -[UIView setClipsToBounds:](self->_roundedRectView, "setClipsToBounds:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_roundedRectView, "layer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "colorWithAlphaComponent:", 0.200000003)));
  objc_msgSend(v22, "setBorderColor:", objc_msgSend(v24, "CGColor"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_roundedRectView, "layer"));
  objc_msgSend(v25, "setBorderWidth:", 1.0);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_roundedRectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v26) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_roundedRectView, "setContentCompressionResistancePriority:forAxis:", 1, v26);
  v27 = objc_alloc_init(ExtensionsBannerView);
  bannerView = self->_bannerView;
  self->_bannerView = v27;

  -[ExtensionsBannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_bannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = objc_alloc_init(ExtensionsRidesharingTemplatedBannerView);
  templatedBannerView = self->_templatedBannerView;
  self->_templatedBannerView = v29;

  -[ExtensionsRidesharingTemplatedBannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_templatedBannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v31 = objc_alloc_init(ExtensionsBannerAttributionView);
  bannerAttributionView = self->_bannerAttributionView;
  self->_bannerAttributionView = v31;

  -[ExtensionsBannerAttributionView setTranslatesAutoresizingMaskIntoConstraints:](self->_bannerAttributionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_initWeak(&location, self);
  v33 = [ExtensionsFeedbackView alloc];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1005E55AC;
  v48[3] = &unk_1011BD528;
  objc_copyWeak(&v49, &location);
  v34 = -[ExtensionsFeedbackView initWithSubmitHandler:](v33, "initWithSubmitHandler:", v48);
  feedbackView = self->_feedbackView;
  self->_feedbackView = v34;

  -[ExtensionsFeedbackView setTranslatesAutoresizingMaskIntoConstraints:](self->_feedbackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36 = objc_alloc_init(ExtensionsPrimaryDetailsView);
  primaryDetailsView = self->_primaryDetailsView;
  self->_primaryDetailsView = v36;

  -[ExtensionsPrimaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryDetailsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v38 = objc_alloc_init(ExtensionsSecondaryDetailsView);
  secondaryDetailsView = self->_secondaryDetailsView;
  self->_secondaryDetailsView = v38;

  -[ExtensionsSecondaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryDetailsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v40 = objc_alloc_init(ExtensionsActionsFooterView);
  openAppView = self->_openAppView;
  self->_openAppView = v40;

  -[ExtensionsActionsFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_openAppView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1005E59F0;
  v46[3] = &unk_1011AD260;
  objc_copyWeak(&v47, &location);
  -[ExtensionsActionsFooterView setDidTapOpenAppButton:](self->_openAppView, "setDidTapOpenAppButton:", v46);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController stackedViews](self, "stackedViews"));
  objc_msgSend(v42, "_maps_setArrangedSubviews:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  objc_msgSend(v44, "setCustomSpacing:afterView:", self->_routeFromToView, 16.0);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  -[RidesharingConfirmedRideViewController _updateFromRideStatus:](self, "_updateFromRideStatus:", v45);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);

}

- (void)extensionManager:(id)a3 didUpdateAvailableExtensions:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RidesharingConfirmedRideViewController *v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005E5BAC;
  v7[3] = &unk_1011AFF10;
  objc_copyWeak(&v10, &location);
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)getRemoteViewControllerWithDelegate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t Log;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController extensionForUI](self, "extensionForUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "extension"));
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v9));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1005E5EB4;
    v12[3] = &unk_1011BD550;
    v13 = v7;
    +[INUIRemoteViewController attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connectionHandler:](INUIRemoteViewController, "attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connectionHandler:", v10, v6, v12);

  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingConfirmedRideViewController");
    v10 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingConfirmedRideViewController.m";
      v16 = 1024;
      v17 = 252;
      v18 = 2082;
      v19 = "-[RidesharingConfirmedRideViewController getRemoteViewControllerWithDelegate:completion:]";
      v20 = 2082;
      v21 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)RidesharingConfirmedRideViewController;
  v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005E603C;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &stru_1011BD570);

}

- (void)_bannerViewTapped:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  v5 = objc_msgSend(v4, "containeeLayout");

  if (v5 != (id)3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "wantsLayout:", 3);

  }
}

- (void)_openAppTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 6020, -[RidesharingConfirmedRideViewController _currentAnalyticsTarget](self, "_currentAnalyticsTarget"), 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userActivity"));
  objc_msgSend(v4, "openWithActivity:", v6);

}

- (void)_cancelTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 18, -[RidesharingConfirmedRideViewController _currentAnalyticsTarget](self, "_currentAnalyticsTarget"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v6, "setSpinnerHidden:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatusObserverProxy](self, "rideStatusObserverProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005E6314;
  v10[3] = &unk_1011BD598;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "checkIfCanCancelRideWithRideStatus:completion:", v9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_cleanupWithRideStatus:(id)a3
{
  id v4;
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
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v5, "setSpinnerHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController analyticsBookedSession](self, "analyticsBookedSession"));
  objc_msgSend(v6, "setCancelled:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController analyticsBookedSession](self, "analyticsBookedSession"));
  objc_msgSend(v7, "endSession");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userActivityForCanceling"));

  objc_msgSend(v8, "openWithActivity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController coordinator](self, "coordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "containerViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chromeViewController"));
  objc_msgSend(v12, "popToRootContextAnimated:completion:", 1, 0);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController coordinator](self, "coordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "appCoordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "platformController"));
  objc_msgSend(v14, "clearSessions");

}

- (id)_cancelConfirmationAlertControllerForApp:(id)a3 withFee:(id)a4 threshold:(id)a5 continueBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
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
  double v28;
  double v29;
  uint64_t Log;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v12)
  {
    v52 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ridesharing cancel ride confirmation default title"), CFSTR("localized string not found"), 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ridesharing cancel ride confirmation default message"), CFSTR("localized string not found"), 0));

    v53 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ridesharing cancel ride confirmation continue cancel"), CFSTR("localized string not found"), 0));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ridesharing cancel ride confirmation dont cancel"), CFSTR("localized string not found"), 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ridesharing cancel ride confirmation fee only title"), CFSTR("localized string not found"), 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "formattedString"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v22));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ridesharing cancel ride confirmation fee message"), CFSTR("localized string not found"), 0));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("ridesharing.cancelRide.confirmation.continue.fee"), CFSTR("localized string not found"), 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "formattedString"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v26));

    v47 = v10;
    if (v10 && v53)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v53, "timeIntervalSinceDate:", v27);
      v29 = v28;

      if (v29 >= 30.0)
        goto LABEL_14;
    }
    else if (!v10)
    {
      if (!v53)
      {
LABEL_14:
        v33 = v17;
        v35 = v52;
        v34 = v46;
        goto LABEL_15;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("ridesharing cancel ride confirmation threshold only title"), CFSTR("localized string not found"), 0));

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("ridesharing cancel ride confirmation threshold only message"), CFSTR("localized string not found"), 0));
      v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v40, v9));

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("ridesharing.cancelRide.confirmation.continue.unknownFee"), CFSTR("localized string not found"), 0));

      v36 = v41;
      v15 = v38;
      v35 = v52;
LABEL_11:

LABEL_15:
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v15, v33, 1));
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1005E6F9C;
      v56[3] = &unk_1011AD960;
      v42 = v35;
      v57 = v42;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v48, 1, v56));
      objc_msgSend(v31, "addAction:", v43);

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1005E6FAC;
      v54[3] = &unk_1011AD960;
      v13 = v52;
      v55 = v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v34, 2, v54));
      objc_msgSend(v31, "addAction:", v44);

      v11 = v53;
      v10 = v47;
      goto LABEL_16;
    }
    v32 = v51;

    v33 = v50;
    v34 = v49;
    v15 = v32;
    v35 = v52;
    v36 = v46;
    goto LABEL_11;
  }
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingConfirmedRideViewController");
  v15 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v59 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingConfirmedRideViewController.m";
    v60 = 1024;
    v61 = 344;
    v62 = 2082;
    v63 = "-[RidesharingConfirmedRideViewController _cancelConfirmationAlertControllerForApp:withFee:threshold:continueBlock:]";
    v64 = 2082;
    v65 = "nil == (continueBlock)";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
  }
  v31 = 0;
LABEL_16:

  return v31;
}

- (void)_completedButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 6020, -[RidesharingConfirmedRideViewController _currentAnalyticsTarget](self, "_currentAnalyticsTarget"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "viewControllerRideCompletionAction:", self);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userActivityForCompletedRide"));
  objc_msgSend(v6, "openWithActivity:", v8);

}

- (void)contactTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 14005, -[RidesharingConfirmedRideViewController _currentAnalyticsTarget](self, "_currentAnalyticsTarget"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController analyticsBookedSession](self, "analyticsBookedSession"));
  objc_msgSend(v5, "setContactedDriver:", 1);

  if (self->_cachedContactUrl)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    objc_msgSend(v6, "openURL:completionHandler:", self->_cachedContactUrl, 0);

  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;

  -[RidesharingConfirmedRideViewController setRequestRideOptionProxy:](self, "setRequestRideOptionProxy:", 0, a4);
  -[RidesharingConfirmedRideViewController setRideStatus:](self, "setRideStatus:", 0);
  -[RidesharingConfirmedRideViewController setExtensionManager:](self, "setExtensionManager:", 0);
  -[RidesharingConfirmedRideViewController setExtensionForUI:](self, "setExtensionForUI:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "viewController:minimizeConfirmation:", self, 0);

}

- (int)_currentAnalyticsTarget
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  v3 = objc_msgSend(v2, "phase");

  if (v3 == (id)1)
    return 1403;
  else
    return 1404;
}

- (ProminentActionButton)cancelButton
{
  ProminentActionButton *cancelButton;
  ProminentActionButton *v4;
  ProminentActionButton *v5;
  void *v6;
  void *v7;
  void *v8;
  ProminentActionButton *v9;
  void *v10;
  void *v11;

  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    v4 = (ProminentActionButton *)objc_claimAutoreleasedReturnValue(+[ProminentActionButton invertedButton](ProminentActionButton, "invertedButton"));
    v5 = self->_cancelButton;
    self->_cancelButton = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton titleLabel](self->_cancelButton, "titleLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v6, &stru_1011E7C78);

    -[ProminentActionButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, "_cancelTapped:", 0x2000);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController theme](self, "theme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controlTintColor"));
    -[ProminentActionButton setTintColor:](self->_cancelButton, "setTintColor:", v8);

    v9 = self->_cancelButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Cancel [Ridesharing booked ride cancel button]"), CFSTR("localized string not found"), 0));
    -[ProminentActionButton setTitle:forState:](v9, "setTitle:forState:", v11, 0);

    cancelButton = self->_cancelButton;
  }
  return cancelButton;
}

- (ProminentActionButton)contactButton
{
  ProminentActionButton *contactButton;
  ProminentActionButton *v4;
  ProminentActionButton *v5;
  void *v6;
  void *v7;
  void *v8;
  ProminentActionButton *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  contactButton = self->_contactButton;
  if (!contactButton)
  {
    v4 = (ProminentActionButton *)objc_claimAutoreleasedReturnValue(+[ProminentActionButton button](ProminentActionButton, "button"));
    v5 = self->_contactButton;
    self->_contactButton = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton titleLabel](self->_contactButton, "titleLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v6, &stru_1011E7C78);

    -[ProminentActionButton addTarget:action:forControlEvents:](self->_contactButton, "addTarget:action:forControlEvents:", self, "contactTapped:", 0x2000);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController theme](self, "theme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controlTintColor"));
    -[ProminentActionButton setTintColor:](self->_contactButton, "setTintColor:", v8);

    -[ProminentActionButton setEnabled:](self->_contactButton, "setEnabled:", 0);
    v9 = self->_contactButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactCommandTitle"));
    v12 = objc_msgSend(v11, "copy");
    if (v12)
    {
      -[ProminentActionButton setTitle:forState:](v9, "setTitle:forState:", v12, 0);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Contact [Ridesharing booked ride]"), CFSTR("localized string not found"), 0));
      -[ProminentActionButton setTitle:forState:](v9, "setTitle:forState:", v14, 0);

    }
    contactButton = self->_contactButton;
  }
  return contactButton;
}

- (ProminentActionButton)completedButton
{
  ProminentActionButton *completedButton;
  ProminentActionButton *v4;
  ProminentActionButton *v5;
  void *v6;
  void *v7;
  void *v8;

  completedButton = self->_completedButton;
  if (!completedButton)
  {
    v4 = (ProminentActionButton *)objc_claimAutoreleasedReturnValue(+[ProminentActionButton button](ProminentActionButton, "button"));
    v5 = self->_completedButton;
    self->_completedButton = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton titleLabel](self->_completedButton, "titleLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v6, &stru_1011E7C78);

    -[ProminentActionButton addTarget:action:forControlEvents:](self->_completedButton, "addTarget:action:forControlEvents:", self, "_completedButtonTapped:", 0x2000);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController theme](self, "theme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controlTintColor"));
    -[ProminentActionButton setTintColor:](self->_completedButton, "setTintColor:", v8);

    completedButton = self->_completedButton;
  }
  return completedButton;
}

- (void)rideStatusMapDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController applicationIdentifier](self, "applicationIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  -[RidesharingConfirmedRideViewController _updateFromRideStatus:](self, "_updateFromRideStatus:", v6);
}

- (void)_updateFromRideStatus:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *p_templatedBannerView;
  void *v11;
  RidesharingErrorAlertProvider *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 hasShownFullContaineeLayout;
  void *v24;
  NSString *driverPhoneNumber;
  id v26;
  void *v27;
  NSString *v28;
  NSString *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  ExtensionsPrimaryDetailsView *primaryDetailsView;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  _QWORD v46[5];
  id v47;
  _QWORD block[4];
  id v49;
  id v50;
  id location;

  v5 = a3;
  if (!v5)
    goto LABEL_36;
  objc_storeStrong((id *)&self->_rideStatus, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v7, v8));
  -[RidesharingConfirmedRideViewController setAnalyticsBookedSession:](self, "setAnalyticsBookedSession:", v9);

  if ((objc_msgSend(v5, "isValidRide") & 1) == 0)
  {
    v12 = [RidesharingErrorAlertProvider alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "application"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userActivity"));
    v15 = -[RidesharingErrorAlertProvider _initWithCause:application:activity:](v12, "_initWithCause:application:activity:", 1, v13, v14);

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005E7CF4;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v50, &location);
    v49 = v15;
    v16 = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
    goto LABEL_36;
  }
  if (!self->_hasEverRequestedRemoteViewController && !self->_remoteViewController)
  {
    self->_hasEverRequestedRemoteViewController = 1;
    p_templatedBannerView = &self->_templatedBannerView;
    +[ExtensionsViewComposer composeBlankTemplatedBannerView:forRideBookingRideStatus:](ExtensionsViewComposer, "composeBlankTemplatedBannerView:forRideBookingRideStatus:", self->_templatedBannerView, v5);
    -[ExtensionsBannerAttributionView setHidden:](self->_bannerAttributionView, "setHidden:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController extensionForUI](self, "extensionForUI"));

    if (v11)
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1005E7DAC;
      v46[3] = &unk_1011BD5C0;
      v46[4] = self;
      v47 = v5;
      -[RidesharingConfirmedRideViewController getRemoteViewControllerWithDelegate:completion:](self, "getRemoteViewControllerWithDelegate:completion:", self, v46);

    }
    else
    {
      +[ExtensionsViewComposer composeTemplatedBannerView:forRideBookingRideStatus:](ExtensionsViewComposer, "composeTemplatedBannerView:forRideBookingRideStatus:", *p_templatedBannerView, v5);
      if (self->_remoteViewController)
        p_templatedBannerView = &self->_bannerView;
      -[RidesharingConfirmedRideViewController _setBannerViewContainerContentView:](self, "_setBannerViewContainerContentView:", *p_templatedBannerView);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v17, "updateHeightForCurrentLayout");

    }
  }
  if (!objc_msgSend(v5, "isValidRide") || (objc_msgSend(v5, "isActiveRide") & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController coordinator](self, "coordinator"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "containerViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chromeViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ridesharingAnnotationsManager"));
    objc_msgSend(v21, "removeCurrentRide");

    if (objc_msgSend(v5, "phase") == (id)4)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      if (objc_msgSend(v22, "containeeLayout") == (id)3)
      {

      }
      else
      {
        hasShownFullContaineeLayout = self->_hasShownFullContaineeLayout;

        if (!hasShownFullContaineeLayout)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
          objc_msgSend(v24, "wantsLayout:", 3);

          self->_hasShownFullContaineeLayout = 1;
        }
      }
    }
  }
  driverPhoneNumber = self->_driverPhoneNumber;
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "driverPhoneNumber"));
  if (!-[NSString isEqualToString:](driverPhoneNumber, "isEqualToString:", v26))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "driverPhoneNumber"));

    if (!v27)
      goto LABEL_22;
    v28 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "driverPhoneNumber"));
    v29 = self->_driverPhoneNumber;
    self->_driverPhoneNumber = v28;

    v26 = objc_msgSend(objc_alloc((Class)CNPhoneNumber), "initWithStringValue:", self->_driverPhoneNumber);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController contactButton](self, "contactButton"));
    objc_msgSend(v30, "setEnabled:", 0);

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1005E7EA4;
    v45[3] = &unk_1011BD5E8;
    v45[4] = self;
    -[RidesharingConfirmedRideViewController getCanCallPhoneNumber:completion:](self, "getCanCallPhoneNumber:completion:", v26, v45);
  }

LABEL_22:
  +[ExtensionsViewComposer composeCustomHeaderView:forRideBookingRideStatus:](ExtensionsViewComposer, "composeCustomHeaderView:forRideBookingRideStatus:", self->_routeFromToView, v5);
  +[ExtensionsViewComposer composeBannerView:forRidesharingCurrentRideViewController:rideBookingRideStatus:](ExtensionsViewComposer, "composeBannerView:forRidesharingCurrentRideViewController:rideBookingRideStatus:", self->_bannerView, self, v5);
  +[ExtensionsViewComposer composeTemplatedBannerView:forRideBookingRideStatus:](ExtensionsViewComposer, "composeTemplatedBannerView:forRideBookingRideStatus:", self->_templatedBannerView, v5);
  +[ExtensionsViewComposer composeBannerAttributionView:forRideBookingRideStatus:](ExtensionsViewComposer, "composeBannerAttributionView:forRideBookingRideStatus:", self->_bannerAttributionView, v5);
  +[ExtensionsViewComposer composeSecondaryDetailsView:forRideBookingRideStatus:](ExtensionsViewComposer, "composeSecondaryDetailsView:forRideBookingRideStatus:", self->_secondaryDetailsView, v5);
  +[ExtensionsViewComposer composeOpenAppView:forRideBookingRideStatus:](ExtensionsViewComposer, "composeOpenAppView:forRideBookingRideStatus:", self->_openAppView, v5);
  if (self->_remoteViewController)
    v31 = 176;
  else
    v31 = 184;
  -[RidesharingConfirmedRideViewController _setBannerViewContainerContentView:](self, "_setBannerViewContainerContentView:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + v31));
  -[ExtensionsFeedbackView setHidden:](self->_feedbackView, "setHidden:", 1);
  -[UIView setHidden:](self->_bannerViewContainerView, "setHidden:", 0);
  -[ExtensionsSecondaryDetailsView setHidden:](self->_secondaryDetailsView, "setHidden:", 0);
  v32 = objc_alloc_init((Class)NSMutableOrderedSet);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController cancelButton](self, "cancelButton"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cancelCommandTitle"));
  objc_msgSend(v33, "setTitle:forState:", v34, 0);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController completedButton](self, "completedButton"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardRideCompletedActionButtonTitle"));
  objc_msgSend(v35, "setTitle:forState:", v36, 0);

  if (!objc_msgSend(v5, "isValidRide") || (objc_msgSend(v5, "isActiveRide") & 1) == 0)
  {
    v38 = objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController completedButton](self, "completedButton"));
    goto LABEL_30;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v32, "addObject:", v37);

  if (-[NSString length](self->_driverPhoneNumber, "length"))
  {
    v38 = objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController contactButton](self, "contactButton"));
LABEL_30:
    v39 = (void *)v38;
    objc_msgSend(v32, "addObject:", v38);

  }
  if (objc_msgSend(v5, "shouldShowFeedbackControls"))
  {
    +[ExtensionsViewComposer composeFeedbackView:forRideBookingRideStatus:tippingViewDelegate:](ExtensionsViewComposer, "composeFeedbackView:forRideBookingRideStatus:tippingViewDelegate:", self->_feedbackView, v5, self);
    -[ContainerHeaderView setTitleView:](self->_containerHeaderView, "setTitleView:", self->_feedbackHeaderView);
    +[ExtensionsViewComposer composeCustomFeedbackHeaderView:forRideBookingRideStatus:](ExtensionsViewComposer, "composeCustomFeedbackHeaderView:forRideBookingRideStatus:", self->_feedbackHeaderView, v5);
    -[ExtensionsFeedbackView setHidden:](self->_feedbackView, "setHidden:", 0);
    -[UIView setHidden:](self->_bannerViewContainerView, "setHidden:", 1);
    v40 = objc_alloc_init((Class)NSMutableOrderedSet);

    v32 = v40;
  }
  primaryDetailsView = self->_primaryDetailsView;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectEnumerator"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "allObjects"));
  +[ExtensionsViewComposer composePrimaryDetailsView:forRideBookingRideStatus:withActionButtons:](ExtensionsViewComposer, "composePrimaryDetailsView:forRideBookingRideStatus:withActionButtons:", primaryDetailsView, v5, v43);

  v44 = objc_msgSend(v5, "phase");
  if ((v44 == 0) != -[ExtensionsPrimaryDetailsView isHidden](self->_primaryDetailsView, "isHidden"))
    -[ExtensionsPrimaryDetailsView setHidden:](self->_primaryDetailsView, "setHidden:", v44 == 0);

LABEL_36:
}

- (void)_setBannerViewContainerContentView:(id)a3
{
  id v4;
  UIView *v5;
  UIView *roundedRectView;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
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
  void *v38;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[12];
  _BYTE v68[128];
  _BYTE v69[128];

  v4 = a3;
  v5 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  roundedRectView = self->_roundedRectView;

  if (v5 != roundedRectView)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_roundedRectView, "subviews"));
    v8 = objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v64;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v64 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v12), "removeFromSuperview");
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      }
      while (v10);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_bannerViewContainerView, "subviews"));
    v14 = objc_msgSend(v13, "copy");

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v60;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v18), "removeFromSuperview");
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v16);
    }

    -[UIView addSubview:](self->_bannerViewContainerView, "addSubview:", self->_roundedRectView);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_roundedRectView, "addSubview:", v4);
    -[UIView addSubview:](self->_roundedRectView, "addSubview:", self->_bannerAttributionView);
    LODWORD(v19) = 1148846080;
    objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    LODWORD(v20) = 1148846080;
    -[ExtensionsBannerAttributionView setContentCompressionResistancePriority:forAxis:](self->_bannerAttributionView, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_roundedRectView, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 1.0));
    v67[0] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_roundedRectView, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 1.0));
    v67[1] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_roundedRectView, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -1.0));
    v67[2] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 145.0));
    v67[3] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsBannerAttributionView topAnchor](self->_bannerAttributionView, "topAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v67[4] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsBannerAttributionView leadingAnchor](self->_bannerAttributionView, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_roundedRectView, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 1.0));
    v67[5] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsBannerAttributionView trailingAnchor](self->_bannerAttributionView, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_roundedRectView, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -1.0));
    v67[6] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsBannerAttributionView bottomAnchor](self->_bannerAttributionView, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_roundedRectView, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -1.0));
    v67[7] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_roundedRectView, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_bannerViewContainerView, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v67[8] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_roundedRectView, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_bannerViewContainerView, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v21));
    v67[9] = v22;
    v58 = v4;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_roundedRectView, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_bannerViewContainerView, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 16.0));
    v67[10] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_roundedRectView, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_bannerViewContainerView, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -16.0));
    v67[11] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 12));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    v4 = v58;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v30, "updateHeightForCurrentLayout");

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

- (void)didChangeLayout:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RidesharingConfirmedRideViewController;
  -[ExtensionsStackViewController didChangeLayout:](&v6, "didChangeLayout:");
  if (a3 == 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController analyticsBookedSession](self, "analyticsBookedSession"));
    objc_msgSend(v5, "setViewedDetails:", 1);

  }
}

- (id)stackedViews
{
  UIView *bannerViewContainerView;
  ExtensionsPrimaryDetailsView *primaryDetailsView;
  ExtensionsActionsFooterView *openAppView;
  _QWORD v6[6];

  bannerViewContainerView = self->_bannerViewContainerView;
  v6[0] = self->_routeFromToView;
  v6[1] = bannerViewContainerView;
  primaryDetailsView = self->_primaryDetailsView;
  v6[2] = self->_feedbackView;
  v6[3] = primaryDetailsView;
  openAppView = self->_openAppView;
  v6[4] = self->_secondaryDetailsView;
  v6[5] = openAppView;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 6));
}

- (double)heightForLayout:(unint64_t)a3
{
  INUIRemoteViewController *remoteViewController;
  void *v6;
  unsigned int v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double height;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  remoteViewController = self->_remoteViewController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  v7 = objc_msgSend(v6, "shouldShowFeedbackControls");

  if (a3 - 3 < 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v13, "availableHeight");
    v8 = v14;

  }
  else if (a3 == 2)
  {
    -[RidesharingConfirmedRideViewController headerAndRouteFromToViewHeight](self, "headerAndRouteFromToViewHeight");
    v16 = v15;
    height = UILayoutFittingCompressedSize.height;
    -[UIView systemLayoutSizeFittingSize:](self->_bannerViewContainerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    v19 = v16 + v18;
    v20 = 0.0;
    v21 = 0.0;
    if (remoteViewController)
      -[ExtensionsBannerAttributionView systemLayoutSizeFittingSize:](self->_bannerAttributionView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    v22 = v19 + v21;
    if (v7)
    {
      -[ExtensionsFeedbackView systemLayoutSizeFittingSize:](self->_feedbackView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
      v20 = v23;
    }
    return v22 + v20;
  }
  else
  {
    v8 = -1.0;
    if (a3 == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v9, "bottomSafeOffset");
      v11 = v10;
      -[RidesharingConfirmedRideViewController headerAndRouteFromToViewHeight](self, "headerAndRouteFromToViewHeight");
      v8 = v11 + v12;

    }
  }
  return v8;
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

- (CGSize)minimumSizeForRemoteViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController view](self, "view", a3));
  objc_msgSend(v3, "frame");
  v5 = v4 + -32.0;

  v6 = 145.0;
  v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)maximumSizeForRemoteViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController view](self, "view", a3));
  objc_msgSend(v3, "frame");
  v5 = v4 + -32.0;

  v6 = 145.0;
  v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)remoteViewControllerServiceDidTerminate:(id)a3
{
  INUIRemoteViewController *remoteViewController;
  id v5;

  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  self->_hasEverRequestedRemoteViewController = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingConfirmedRideViewController rideStatus](self, "rideStatus"));
  -[RidesharingConfirmedRideViewController _updateFromRideStatus:](self, "_updateFromRideStatus:", v5);

}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = -[INUIRemoteViewController disconnect](self->_remoteViewController, "disconnect");
  v4.receiver = self;
  v4.super_class = (Class)RidesharingConfirmedRideViewController;
  -[RidesharingConfirmedRideViewController dealloc](&v4, "dealloc");
}

- (void)presentCustomTipAlert:(id)a3
{
  -[RidesharingConfirmedRideViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)getCanCallPhoneNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSURL *cachedContactUrl;
  NSObject *v9;
  void *v10;
  uint64_t Log;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    cachedContactUrl = self->_cachedContactUrl;
    self->_cachedContactUrl = 0;

    if (!v6)
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      goto LABEL_8;
    }
    v9 = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
    -[NSObject getCanCallPhoneNumber:completion:](v9, "getCanCallPhoneNumber:completion:", v10, v7);

  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingConfirmedRideViewController");
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingConfirmedRideViewController.m";
      v14 = 1024;
      v15 = 760;
      v16 = 2082;
      v17 = "-[RidesharingConfirmedRideViewController getCanCallPhoneNumber:completion:]";
      v18 = 2082;
      v19 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", (uint8_t *)&v12, 0x26u);
    }
  }

LABEL_8:
}

- (INUIRemoteViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (void)set_remoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (RidesharingCoordinator)coordinator
{
  return (RidesharingCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (RideBookingRideStatus)rideStatus
{
  return self->_rideStatus;
}

- (void)setRideStatus:(id)a3
{
  objc_storeStrong((id *)&self->_rideStatus, a3);
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void)setContactButton:(id)a3
{
  objc_storeStrong((id *)&self->_contactButton, a3);
}

- (void)setCompletedButton:(id)a3
{
  objc_storeStrong((id *)&self->_completedButton, a3);
}

- (RideBookingRequestRideOptionProxy)requestRideOptionProxy
{
  return self->_requestRideOptionProxy;
}

- (void)setRequestRideOptionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideOptionProxy, a3);
}

- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy
{
  return self->_rideStatusObserverProxy;
}

- (void)setRideStatusObserverProxy:(id)a3
{
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, a3);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (_MXExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
  objc_storeStrong((id *)&self->_extensionManager, a3);
}

- (_MXExtension)extensionForUI
{
  return self->_extensionForUI;
}

- (void)setExtensionForUI:(id)a3
{
  objc_storeStrong((id *)&self->_extensionForUI, a3);
}

- (RidesharingAnalyticsBookedSession)analyticsBookedSession
{
  return self->_analyticsBookedSession;
}

- (void)setAnalyticsBookedSession:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsBookedSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsBookedSession, 0);
  objc_storeStrong((id *)&self->_extensionForUI, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, 0);
  objc_storeStrong((id *)&self->_requestRideOptionProxy, 0);
  objc_storeStrong((id *)&self->_completedButton, 0);
  objc_storeStrong((id *)&self->_contactButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_rideStatus, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cachedContactUrl, 0);
  objc_storeStrong((id *)&self->_driverPhoneNumber, 0);
  objc_storeStrong((id *)&self->_openAppView, 0);
  objc_storeStrong((id *)&self->_secondaryDetailsView, 0);
  objc_storeStrong((id *)&self->_primaryDetailsView, 0);
  objc_storeStrong((id *)&self->_feedbackView, 0);
  objc_storeStrong((id *)&self->_bannerAttributionView, 0);
  objc_storeStrong((id *)&self->_templatedBannerView, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_bannerViewContainerView, 0);
  objc_storeStrong((id *)&self->_roundedRectView, 0);
  objc_storeStrong((id *)&self->_feedbackHeaderView, 0);
  objc_storeStrong((id *)&self->_routeFromToView, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end
