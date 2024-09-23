@implementation RidesharingContainerViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RidesharingContainerViewController;
  -[OverlayContainerViewController viewDidLoad](&v3, "viewDidLoad");
  -[RidesharingContainerViewController _setupRecenterButton](self, "_setupRecenterButton");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RidesharingContainerViewController;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController detailsPickingViewController](self, "detailsPickingViewController"));
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1005EA0FC;
    v11[3] = &unk_1011AEDC8;
    v11[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, 0);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RidesharingContainerViewController;
  -[OverlayContainerViewController viewDidLayoutSubviews](&v18, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  objc_msgSend(v4, "_edgeInsets");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonsContainerViewController view](self->_recenterButtonContainer, "view"));
  objc_msgSend(v7, "frame");
  v9 = v6 + v8;
  -[ContainerViewController edgePadding](self, "edgePadding");
  v11 = v10 + v9;
  -[ContainerViewController edgePadding](self, "edgePadding");
  v13 = v12 + v11;
  -[ContainerViewController edgePadding](self, "edgePadding");
  objc_msgSend(v4, "_setCompassInsets:", v13, 0.0, 0.0, v14);

  if (self->_needsUpdateForShowingDetailsPicking)
  {
    if (-[ContainerViewController containerStyle](self, "containerStyle"))
    {
      self->_needsUpdateForShowingDetailsPicking = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v16 = objc_opt_class(RidesharingDetailsPickingViewController);
      isKindOfClass = objc_opt_isKindOfClass(v15, v16);

      if ((isKindOfClass & 1) != 0)
        -[RidesharingContainerViewController _updateForShowingDetailsPickingAnimated:](self, "_updateForShowingDetailsPickingAnimated:", 1);
    }
  }

}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  return 2;
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  objc_super v20;

  v5 = -[ContainerViewController containerStyle](self, "containerStyle");
  v20.receiver = self;
  v20.super_class = (Class)RidesharingContainerViewController;
  -[OverlayContainerViewController contentHeightUpdatedWithValue:](&v20, "contentHeightUpdatedWithValue:", a3);
  if ((v5 | 4) != 5)
    goto LABEL_13;
  if (v5 == 5)
    v6 = 1;
  else
    v6 = 2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v7, "heightForLayout:", v6);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v10, "heightForLayout:", 3);
  v12 = v11;

  if (v12 != v9)
  {
    if (v9 < a3)
    {
      v13 = (a3 - v9) / (v9 * 1.10000002 - v9);
      if (v13 < 0.0)
        v13 = 0.0;
      if (v13 <= 1.0)
        v14 = 1.0 - v13;
      else
        v14 = 0.0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonsContainerViewController view](self->_recenterButtonContainer, "view"));
      objc_msgSend(v15, "setAlpha:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
      v17 = v16;
      v18 = v14;
      goto LABEL_14;
    }
LABEL_13:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonsContainerViewController view](self->_recenterButtonContainer, "view"));
    objc_msgSend(v19, "setAlpha:", 1.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
    v17 = v16;
    v18 = 1.0;
LABEL_14:
    objc_msgSend(v16, "setAlpha:", v18);

  }
}

- (void)updateTopBannerViewWithTopBannerItems:(id)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RidesharingContainerViewController;
  -[OverlayContainerViewController updateTopBannerViewWithTopBannerItems:](&v5, "updateTopBannerViewWithTopBannerItems:", a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005EA46C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setNeedsUpdateForShowingDetailsPickingAnimated
{
  id v2;

  self->_needsUpdateForShowingDetailsPicking = 1;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController view](self, "view"));
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_updateForShowingDetailsPickingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  MKMarkerAnnotationView *v5;
  MKMarkerAnnotationView *ETACalloutView;
  UIImage *v7;
  void *v8;
  void *v9;
  RidesharingBalloonETAView *v10;
  RidesharingBalloonETAView *ETAView;
  RideBookingRequestRideOptionProxy *v12;
  RideBookingRequestRideOptionProxy *requestRideOptionProxy;

  v3 = a3;
  if (!self->_ETACalloutView)
  {
    v5 = (MKMarkerAnnotationView *)objc_msgSend(objc_alloc((Class)MKMarkerAnnotationView), "initWithAnnotation:reuseIdentifier:", 0, 0);
    ETACalloutView = self->_ETACalloutView;
    self->_ETACalloutView = v5;

    v7 = objc_opt_new(UIImage);
    -[MKMarkerAnnotationView setGlyphImage:](self->_ETACalloutView, "setGlyphImage:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingBalloonETAView balloonStrokeColor](RidesharingBalloonETAView, "balloonStrokeColor"));
    -[MKMarkerAnnotationView setMarkerStrokeTintColor:](self->_ETACalloutView, "setMarkerStrokeTintColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingBalloonETAView balloonFillColor](RidesharingBalloonETAView, "balloonFillColor"));
    -[MKMarkerAnnotationView setMarkerTintColor:](self->_ETACalloutView, "setMarkerTintColor:", v9);

    v10 = objc_alloc_init(RidesharingBalloonETAView);
    ETAView = self->_ETAView;
    self->_ETAView = v10;

    -[MKMarkerAnnotationView setSelectedContentView:](self->_ETACalloutView, "setSelectedContentView:", self->_ETAView);
  }
  if (!self->_requestRideOptionProxy)
  {
    v12 = -[RideBookingRequestRideOptionProxy initWithDelegate:]([RideBookingRequestRideOptionProxy alloc], "initWithDelegate:", self);
    requestRideOptionProxy = self->_requestRideOptionProxy;
    self->_requestRideOptionProxy = v12;

  }
  -[MKMarkerAnnotationView setSelected:animated:](self->_ETACalloutView, "setSelected:animated:", 1, v3);
}

- (void)updateForDismissingDetailsPickingAnimated:(BOOL)a3
{
  RideBookingRequestRideOptionProxy *requestRideOptionProxy;

  -[MKMarkerAnnotationView setSelected:animated:](self->_ETACalloutView, "setSelected:animated:", 0, a3);
  -[MKMarkerAnnotationView removeFromSuperview](self->_ETACalloutView, "removeFromSuperview");
  requestRideOptionProxy = self->_requestRideOptionProxy;
  self->_requestRideOptionProxy = 0;

}

- (void)setRequestingRide:(BOOL)a3
{
  self->_requestingRide = a3;
}

- (void)requestRideStatusDidChange:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Double;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id location;

  v5 = a3;
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "requestRideStatusError") && !self->_isUserInitiatedMapChange)
  {
    objc_storeStrong((id *)&self->_requestRideStatus, a3);
    -[RideBookingRequestRideStatus startWaypointCoordinate](self->_requestRideStatus, "startWaypointCoordinate");
    v8 = v7;
    v10 = v9;
    objc_initWeak(&location, self);
    if (self->_loadedFirstRequestRide)
    {
      -[RidesharingContainerViewController _updateETACalloutFromDetailsPickingProviderAndMapMoving](self, "_updateETACalloutFromDetailsPickingProviderAndMapMoving");
    }
    else
    {
      Double = GEOConfigGetDouble(MapsConfig_RideBookingPickupLocationZoomRadius, off_1014B2EA8);
      v12 = MKMapRectMakeWithRadialDistance(v8, v10, Double);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mapView"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1005EA840;
      v21[3] = &unk_1011AC888;
      objc_copyWeak(&v22, &location);
      v21[4] = self;
      objc_msgSend(v20, "_setVisibleMapRect:animated:completionHandler:", 1, v21, v12, v14, v16, v18);

      objc_destroyWeak(&v22);
    }
    objc_destroyWeak(&location);
  }

}

- (void)_updateETACalloutFromDetailsPickingProviderAndMapMoving
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  MKMarkerAnnotationView *ETACalloutView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MKMarkerAnnotationView *v19;
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
  NSLayoutConstraint *v31;
  NSLayoutConstraint *ETACalloutVerticalConstraint;
  NSLayoutConstraint *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  uint64_t Log;
  NSObject *v39;
  char *v40;
  id v41;
  RidesharingBalloonETAView *ETAView;
  void *v43;
  uint64_t v44;
  uint8_t buf[4];
  char *v46;
  __int16 v47;
  id v48;
  _QWORD v49[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v3, "heightForLayout:", 2);
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v6, "heightForLayout:", 3);
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
  objc_msgSend(v10, "_edgeInsets");
  v12 = v11;

  v13 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v13 <= 7 && ((1 << v13) & 0xA3) != 0)
    v12 = v12 - v5;
  ETACalloutView = self->_ETACalloutView;
  if (ETACalloutView)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MKMarkerAnnotationView superview](ETACalloutView, "superview"));
    if (v15)
    {

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapView"));

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController view](self, "view"));
        v19 = self->_ETACalloutView;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
        objc_msgSend(v18, "insertSubview:belowSubview:", v19, v20);

        -[MKMarkerAnnotationView setTranslatesAutoresizingMaskIntoConstraints:](self->_ETACalloutView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MKMarkerAnnotationView centerXAnchor](self->_ETACalloutView, "centerXAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapView"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_edgeInsetsLayoutGuide"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerXAnchor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v25));

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKMarkerAnnotationView selectedContentView](self->_ETACalloutView, "selectedContentView"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController view](self, "view"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
        v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, (v12 - v8) * 0.5));
        ETACalloutVerticalConstraint = self->_ETACalloutVerticalConstraint;
        self->_ETACalloutVerticalConstraint = v31;

        v33 = self->_ETACalloutVerticalConstraint;
        v49[0] = v26;
        v49[1] = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 2));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

      }
    }
  }
  -[NSLayoutConstraint setConstant:](self->_ETACalloutVerticalConstraint, "setConstant:", (v12 - v8) * 0.5);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController requestRideStatus](self, "requestRideStatus"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "etaMinutesAtStartWaypoint"));
  v37 = objc_msgSend(v35, "loadingRequest");
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v39 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    v40 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingContainerViewController.m");
    v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Updating ETA callout with minutes: %@, loading?:%d"), v36, v37);
    *(_DWORD *)buf = 136315394;
    v46 = v40;
    v47 = 2112;
    v48 = v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  if (v37)
  {
    ETAView = self->_ETAView;
    v43 = 0;
    v44 = 2;
LABEL_17:
    -[RidesharingBalloonETAView setMinutes:withState:](ETAView, "setMinutes:withState:", v43, v44);
    goto LABEL_18;
  }
  if (self->_isUserInitiatedMapChange)
  {
    ETAView = self->_ETAView;
    v43 = 0;
    v44 = 1;
    goto LABEL_17;
  }
  if (v36)
  {
    ETAView = self->_ETAView;
    v43 = v36;
    v44 = 0;
    goto LABEL_17;
  }
LABEL_18:

}

- (void)_moveMapToNewStartWaypointIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  if (!self->_isUserInitiatedMapChange)
  {
    v3 = a3;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController requestRideStatus](self, "requestRideStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
    objc_msgSend(v7, "startWaypointCoordinate");
    objc_msgSend(v6, "setCenterCoordinate:animated:", v3);

  }
}

- (void)_moveToCenterCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  id v15;

  longitude = a3.longitude;
  latitude = a3.latitude;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingContainerViewController.m");
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Centering map to coordinate (%f, %f)"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
    *(_DWORD *)buf = 136315394;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
  objc_msgSend(v11, "setCenterCoordinate:animated:", 1, latitude, longitude);

}

- (ButtonsContainerViewController)recenterButtonContainer
{
  ButtonsContainerViewController *recenterButtonContainer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FloatingButtonItem *v8;
  ButtonsContainerViewController *v9;
  void *v10;
  ButtonsContainerViewController *v11;
  ButtonsContainerViewController *v12;
  void *v13;
  FloatingButtonItem *v15;

  recenterButtonContainer = self->_recenterButtonContainer;
  if (!recenterButtonContainer)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Recenter"), CFSTR("localized string not found"), 0));
    objc_msgSend(v4, "setAccessibilityLabel:", v6);

    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "_recenterTapped:", 64);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme locationImage](MapsTheme, "locationImage"));
    objc_msgSend(v4, "setImage:forState:", v7, 0);

    v8 = -[FloatingButtonItem initWithButton:option:]([FloatingButtonItem alloc], "initWithButton:option:", v4, 1);
    v9 = [ButtonsContainerViewController alloc];
    v15 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v11 = -[ButtonsContainerViewController initWithFloatingButtonItems:](v9, "initWithFloatingButtonItems:", v10);
    v12 = self->_recenterButtonContainer;
    self->_recenterButtonContainer = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController blurGroupName](self, "blurGroupName"));
    -[ButtonsContainerViewController setBlurGroupName:](self->_recenterButtonContainer, "setBlurGroupName:", v13);

    recenterButtonContainer = self->_recenterButtonContainer;
  }
  return recenterButtonContainer;
}

- (void)_recenterTapped:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  CLLocationCoordinate2D v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController", a3));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userLocation"));
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  v9 = v8;

  v15.latitude = v7;
  v15.longitude = v9;
  if (CLLocationCoordinate2DIsValid(v15))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController detailsPickingViewController](self, "detailsPickingViewController"));
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
      objc_msgSend(v13, "updateStartingWaypointCoordinate:", v7, v9);

    }
    -[RidesharingContainerViewController _moveToCenterCoordinate:](self, "_moveToCenterCoordinate:", v7, v9);
  }

}

- (void)_setupRecenterButton
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
  _QWORD v25[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController recenterButtonContainer](self, "recenterButtonContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController recenterButtonContainer](self, "recenterButtonContainer"));
  -[ContainerViewController addChildViewController:](self, "addChildViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController recenterButtonContainer](self, "recenterButtonContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v6, "addSubview:", v8);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController recenterButtonContainer](self, "recenterButtonContainer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v9));
  v25[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController recenterButtonContainer](self, "recenterButtonContainer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v25[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController recenterButtonContainer](self, "recenterButtonContainer"));
  objc_msgSend(v18, "didMoveToParentViewController:", self);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController recenterButtonContainer](self, "recenterButtonContainer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v20, "layoutIfNeeded");

}

- (id)_topBannerViewHorizontalConstraints
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v4, sub_1005EC29C());
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v18[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController recenterButtonContainer](self, "recenterButtonContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v12 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", v11, -sub_1005EC29C());
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v18[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));

  return v14;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  void *v5;
  void *v6;
  _BOOL4 isUserInitiatedMapChange;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "setScrollEnabled:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController detailsPickingViewController](self, "detailsPickingViewController"));
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    isUserInitiatedMapChange = self->_isUserInitiatedMapChange;

    if (!isUserInitiatedMapChange)
      goto LABEL_6;
    -[MKMarkerAnnotationView center](self->_ETACalloutView, "center");
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMarkerAnnotationView superview](self->_ETACalloutView, "superview"));
    objc_msgSend(v17, "convertPoint:toCoordinateFromView:", v12, v9, v11);
    v14 = v13;
    v16 = v15;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController requestRideOptionProxy](self, "requestRideOptionProxy"));
    objc_msgSend(v5, "updateStartingWaypointCoordinate:", v14, v16);
  }
  else
  {

  }
LABEL_6:
  if (self->_loadedFirstRequestRide)
    -[RidesharingContainerViewController _updateETACalloutFromDetailsPickingProviderAndMapMoving](self, "_updateETACalloutFromDetailsPickingProviderAndMapMoving");
  self->_isUserInitiatedMapChange = 0;

}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v7 = a3;
  v11 = v7;
  if (self->_requestingRide || a4 == 1)
  {
    objc_msgSend(v7, "setScrollEnabled:", 0);
  }
  else
  {
    self->_isUserInitiatedMapChange = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController detailsPickingViewController](self, "detailsPickingViewController"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
      -[RidesharingContainerViewController _updateETACalloutFromDetailsPickingProviderAndMapMoving](self, "_updateETACalloutFromDetailsPickingProviderAndMapMoving");
  }

}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return 0;
}

- (CGPoint)mapView:(id)a3 focusPointForPoint:(CGPoint)a4 gesture:(int64_t)a5
{
  id v5;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  double v11;
  CGPoint result;

  if (a5 == 1)
  {
    v5 = a3;
    objc_msgSend(v5, "centerCoordinate");
    objc_msgSend(v5, "convertCoordinate:toPointToView:", v5);
    x = v6;
    y = v8;

  }
  else
  {
    y = a4.y;
    x = a4.x;
  }
  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (RidesharingDetailsPickingViewController)detailsPickingViewController
{
  return (RidesharingDetailsPickingViewController *)objc_loadWeakRetained((id *)&self->_detailsPickingViewController);
}

- (void)setDetailsPickingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_detailsPickingViewController, a3);
}

- (RidesharingConfirmedRideViewController)confirmedRideViewController
{
  return (RidesharingConfirmedRideViewController *)objc_loadWeakRetained((id *)&self->_confirmedRideViewController);
}

- (void)setConfirmedRideViewController:(id)a3
{
  objc_storeWeak((id *)&self->_confirmedRideViewController, a3);
}

- (void)setRecenterButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_recenterButtonContainer, a3);
}

- (RideBookingRequestRideOptionProxy)requestRideOptionProxy
{
  return self->_requestRideOptionProxy;
}

- (void)setRequestRideOptionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideOptionProxy, a3);
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRideStatus, 0);
  objc_storeStrong((id *)&self->_requestRideOptionProxy, 0);
  objc_storeStrong((id *)&self->_recenterButtonContainer, 0);
  objc_destroyWeak((id *)&self->_confirmedRideViewController);
  objc_destroyWeak((id *)&self->_detailsPickingViewController);
  objc_storeStrong((id *)&self->_ETACalloutVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_ETAView, 0);
  objc_storeStrong((id *)&self->_ETACalloutView, 0);
}

@end
