@implementation LookAroundActionCoordinator

- (LookAroundActionCoordinator)initWithContainerViewController:(id)a3
{
  id v4;
  LookAroundActionCoordinator *v5;
  LookAroundActionCoordinator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LookAroundActionCoordinator;
  v5 = -[LookAroundActionCoordinator init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_containerViewController, v4);
    -[LookAroundActionCoordinator _registerBackgroundNotifications](v6, "_registerBackgroundNotifications");
  }

  return v6;
}

- (MKMapItem)currentMapItem
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentMapItem"));

  return (MKMapItem *)v3;
}

- (id)mapView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  return v4;
}

- (id)placeCardViewController
{
  PlaceCardViewController *placeCardViewController;
  PlaceCardViewController *v4;
  PlaceCardViewController *v5;

  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    v4 = objc_alloc_init(PlaceCardViewController);
    v5 = self->_placeCardViewController;
    self->_placeCardViewController = v4;

    -[PlaceCardViewController setExcludedContent:](self->_placeCardViewController, "setExcludedContent:", 13006);
    -[PlaceCardViewController setPlaceCardDelegate:](self->_placeCardViewController, "setPlaceCardDelegate:", self);
    -[InfoCardViewController setContaineeDelegate:](self->_placeCardViewController, "setContaineeDelegate:", self);
    -[PlaceCardViewController setPlaceCardDismissalDelegate:](self->_placeCardViewController, "setPlaceCardDismissalDelegate:", self);
    -[PlaceCardViewController setActionCoordinator:](self->_placeCardViewController, "setActionCoordinator:", self);
    placeCardViewController = self->_placeCardViewController;
  }
  return placeCardViewController;
}

- (LookAroundPIPDataCoordinator)dataCoordinator
{
  LookAroundPIPDataCoordinatorImpl *v3;
  void *v4;
  LookAroundPIPDataCoordinator *v5;
  LookAroundPIPDataCoordinator *dataCoordinator;
  LookAroundPIPAnalyticsController *v7;
  LookAroundPIPAnalyticsController *analyticsController;

  if (!self->_dataCoordinator)
  {
    v3 = [LookAroundPIPDataCoordinatorImpl alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator mapView](self, "mapView"));
    v5 = -[LookAroundPIPDataCoordinatorImpl initWithMapView:](v3, "initWithMapView:", v4);
    dataCoordinator = self->_dataCoordinator;
    self->_dataCoordinator = v5;

  }
  if (!self->_analyticsController)
  {
    v7 = -[LookAroundPIPAnalyticsController initWithDataCoordinator:]([LookAroundPIPAnalyticsController alloc], "initWithDataCoordinator:", self->_dataCoordinator);
    analyticsController = self->_analyticsController;
    self->_analyticsController = v7;

  }
  return self->_dataCoordinator;
}

- (id)trayContaineeViewControllerWithLookAroundView:(id)a3
{
  LookAroundTrayContaineeViewController *trayContaineeViewController;
  id v5;
  LookAroundTrayContaineeViewController *v6;
  LookAroundTrayContaineeViewController *v7;

  trayContaineeViewController = self->_trayContaineeViewController;
  if (!trayContaineeViewController)
  {
    v5 = a3;
    v6 = -[LookAroundTrayContaineeViewController initWithLookAroundView:]([LookAroundTrayContaineeViewController alloc], "initWithLookAroundView:", v5);

    v7 = self->_trayContaineeViewController;
    self->_trayContaineeViewController = v6;

    -[LookAroundTrayContaineeViewController loadViewIfNeeded](self->_trayContaineeViewController, "loadViewIfNeeded");
    -[LookAroundTrayContaineeViewController setActionCoordinator:](self->_trayContaineeViewController, "setActionCoordinator:", self);
    -[ContaineeViewController setContaineeDelegate:](self->_trayContaineeViewController, "setContaineeDelegate:", self);
    trayContaineeViewController = self->_trayContaineeViewController;
  }
  return trayContaineeViewController;
}

- (void)collectionPickerClosed:(id)a3
{
  CollectionPicker *collectionPicker;

  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;

}

- (void)collectionPickerNewCollection:(id)a3
{
  id v4;
  CollectionPicker *collectionPicker;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008FE900;
  v11[3] = &unk_1011BC2E8;
  objc_copyWeak(&v13, &location);
  v6 = v4;
  v12 = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008FE968;
  v8[3] = &unk_1011DB940;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  objc_msgSend(v7, "viewControllerToPresentIfContainee:ifAlertController:", v11, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)viewController:(id)a3 createNewCollectionWithSession:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CollectionCreateViewController *v11;
  id WeakRetained;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collection"));
  if (objc_msgSend(v7, "handlerType") == (id)3)
  {
    v8 = 256;
  }
  else
  {
    v9 = objc_opt_class(CollectionListViewController);
    if ((objc_opt_isKindOfClass(v13, v9) & 1) != 0)
    {
      v8 = 251;
    }
    else
    {
      v10 = objc_opt_class(PlaceCardViewController);
      if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
        v8 = 201;
      else
        v8 = 0;
    }
  }

  v11 = -[CollectionCreateViewController initWithEditSession:]([CollectionCreateViewController alloc], "initWithEditSession:", v6);
  -[ContaineeViewController setContaineeDelegate:](v11, "setContaineeDelegate:", self);
  -[CollectionCreateViewController setTarget:](v11, "setTarget:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v11, 1);

}

- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4
{
  LookAroundTrayContaineeViewController *v6;
  id v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  void *v11;
  LookAroundTrayContaineeViewController *v12;
  id v13;
  id WeakRetained;
  dispatch_time_t v15;
  LookAroundTrayContaineeViewController *v16;
  _QWORD block[5];

  v6 = (LookAroundTrayContaineeViewController *)a3;
  v7 = a4;
  v8 = objc_opt_class(UIKeyCommand);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) == 0)
  {
LABEL_4:
    if ((LookAroundTrayContaineeViewController *)self->_placeCardViewController == v6)
    {
      -[LookAroundActionCoordinator _captureLookAroundUserAction:onTarget:](self, "_captureLookAroundUserAction:onTarget:", 4, 201);
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(WeakRetained, "popLastViewControllerAnimated:", 1);

      v15 = dispatch_time(0, 250000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1008FEC74;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else if (self->_trayContaineeViewController != v6)
    {
      v13 = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(v13, "popLastViewControllerAnimated:", 1);

    }
    goto LABEL_12;
  }
  v10 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_mapsSceneDelegate"));
  v12 = (LookAroundTrayContaineeViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topMostPresentedViewController"));

  if ((-[LookAroundTrayContaineeViewController conformsToProtocol:](v12, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeProtocol) & 1) != 0)
  {

    goto LABEL_4;
  }
  if (v12 != v6)
  {
    v16 = (LookAroundTrayContaineeViewController *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController presentedViewController](v6, "presentedViewController"));

    if (v16 == v12)
      -[LookAroundTrayContaineeViewController dismissViewControllerAnimated:completion:](v12, "dismissViewControllerAnimated:completion:", 1, 0);
  }

LABEL_12:
}

- (void)viewControllerPresentLookAround:(id)a3 showsFullScreen:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "animateTransitionToFullScreen:", v4);

}

- (void)viewController:(id)a3 presentPlaceCardForItem:(id)a4
{
  -[LookAroundActionCoordinator viewController:presentPlaceCardForItem:animated:](self, "viewController:presentPlaceCardForItem:animated:", a3, a4, 1);
}

- (void)viewController:(id)a3 presentPlaceCardForItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char IsEqualToMapItemForPurpose;
  id v16;
  id v17;

  v5 = a5;
  v17 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator placeCardViewController](self, "placeCardViewController"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeCardItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geoMapItem"));

  IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v12, v14, 5);
  if (v9 == v7 && (IsEqualToMapItemForPurpose & 1) != 0)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardPresentationController"));
    objc_msgSend(v16, "wantsLayout:", 2);
  }
  else
  {
    -[LookAroundActionCoordinator _captureLookAroundUserAction:onTarget:](self, "_captureLookAroundUserAction:onTarget:", 21, 201);
    objc_msgSend(v7, "setPlaceCardItem:withHistory:", v17, 0);
    v16 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v16, "presentController:animated:", v7, v5);
  }

}

- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "setContaineeDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v6, v4);

}

- (void)viewControllerPresentTray:(id)a3 showsFullScreen:(BOOL)a4 usingLookAroundView:(id)a5
{
  _BOOL8 v5;
  LookAroundContainerViewController **p_containerViewController;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v5 = a4;
  p_containerViewController = &self->_containerViewController;
  v9 = a5;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator trayContaineeViewControllerWithLookAroundView:](self, "trayContaineeViewControllerWithLookAroundView:", v9));

  objc_msgSend(WeakRetained, "presentController:animated:", v11, 0);
  -[LookAroundActionCoordinator viewControllerPresentLookAround:showsFullScreen:](self, "viewControllerPresentLookAround:showsFullScreen:", v12, v5);

}

- (void)viewControllerPresentTTR:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MapsRadarDraft *v11;
  void *v12;
  NSObject *v13;
  LookAroundActionCoordinator *v14;
  LookAroundActionCoordinator *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint8_t buf[4];
  __CFString *v24;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lookAroundView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharingURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Summary:\n\nSteps to Reproduce:\n\nResults:\n\nTest Environment:\n\nShare Link:\n%@"), v9));
  v11 = objc_opt_new(MapsRadarDraft);
  -[MapsRadarDraft setTitle:](v11, "setTitle:", CFSTR("[Maps LookAround]: "));
  -[MapsRadarDraft setDescriptionText:](v11, "setDescriptionText:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarComponent mapsLookAroundComponent](MapsRadarComponent, "mapsLookAroundComponent"));
  -[MapsRadarDraft setComponent:](v11, "setComponent:", v12);

  if (qword_1014D3960 != -1)
    dispatch_once(&qword_1014D3960, &stru_1011DB988);
  v13 = (id)qword_1014D3958;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self;
    v15 = v14;
    if (!v14)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v16 = (objc_class *)objc_opt_class(v14);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_10;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR for lookaround", buf, 0xCu);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v22, "launchTTRWithRadar:", v11);

}

- (void)viewController:(id)a3 pickCollectionWithSession:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  CollectionPicker *v14;
  CollectionPicker *collectionPicker;
  CollectionPicker *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a5;
  v13 = a4;
  v14 = -[CollectionPicker initWithCollectionEditSession:sourceView:sourceRect:]([CollectionPicker alloc], "initWithCollectionEditSession:sourceView:sourceRect:", v13, v12, x, y, width, height);

  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = v14;

  -[CollectionPicker setDelegate:](self->_collectionPicker, "setDelegate:", self);
  v16 = self->_collectionPicker;
  v17[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1008FF320;
  v18[3] = &unk_1011DB968;
  v18[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1008FF384;
  v17[3] = &unk_1011ADFD8;
  -[CollectionPicker viewControllerToPresentIfContainee:ifAlertController:](v16, "viewControllerToPresentIfContainee:ifAlertController:", v18, v17);
}

- (void)viewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a5;
  v8 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "macPopoverPresentationController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008FF498;
    v10[3] = &unk_1011ADA00;
    v11 = v7;
    objc_msgSend(v9, "dismissAnimated:completion:", 1, v10);

  }
}

- (void)viewController:(id)a3 openURL:(id)a4
{
  id v5;
  MapsWebLinkPresenter *v6;
  void *v7;
  MapsWebLinkPresenter *v8;

  v5 = a4;
  v6 = [MapsWebLinkPresenter alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator containerViewController](self, "containerViewController"));
  v8 = -[MapsWebLinkPresenter initWithPresentingViewController:](v6, "initWithPresentingViewController:", v7);

  -[MapsWebLinkPresenter presentWebURL:](v8, "presentWebURL:", v5);
}

- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4
{
  id v5;
  PlaceCardViewController *placeCardViewController;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  placeCardViewController = self->_placeCardViewController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008FF5B8;
  v8[3] = &unk_1011ACAD0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[LookAroundActionCoordinator viewController:dismissAnimated:completion:](self, "viewController:dismissAnimated:completion:", placeCardViewController, 1, v8);

}

- (void)didDismissViewController:(id)a3 mapItem:(id)a4
{
  id v6;
  id v7;
  PlaceCardItem *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v6);

  -[LookAroundActionCoordinator viewController:presentPlaceCardForItem:](self, "viewController:presentPlaceCardForItem:", v7, v8);
}

- (void)exitLookAround
{
  id WeakRetained;
  uint64_t v4;
  id v5;
  unsigned int v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = sub_1002A8AA0(WeakRetained);

  v5 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = objc_msgSend(v5, "isDisplayingLookAroundPIP");
  v7 = 0.26;
  if (v4 != 5)
    v7 = 0.0;
  if (v6)
    v8 = 0.75;
  else
    v8 = v7;

  v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(v9, "prepareForExit");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator dataCoordinator](self, "dataCoordinator"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008FF7B4;
  v11[3] = &unk_1011AD260;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "exitLookAroundPIPAfter:withCompletion:", v11, v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)activityViewControllerForPlaceViewController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "createActivityViewControllerForCurrentContext"));

  return v4;
}

- (int64_t)overriddenInterfaceStyleForPlaceViewControllerSubviews:(id)a3
{
  id v4;
  id WeakRetained;
  unsigned __int8 v6;
  int64_t v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = objc_msgSend(WeakRetained, "isDisplayingLookAroundFullScreen");

  if ((v6 & 1) != 0)
    v7 = 2;
  else
    v7 = (int64_t)objc_msgSend(v4, "preferredUserInterfaceStyle");

  return v7;
}

- (void)_registerBackgroundNotifications
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleEnterToBackgroundNotification:", UISceneDidEnterBackgroundNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleEnterToForegroundNotification:", UISceneWillEnterForegroundNotification, 0);

}

- (void)_handleEnterToForegroundNotification:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_maps_uiScene"));

  if (v4 == v6)
    +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:", 6058, 0, 0);
}

- (void)_handleEnterToBackgroundNotification:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_maps_uiScene"));

  if (v4 == v6)
    +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:", 6059, 0, 0);
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  return 0;
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  void *v3;
  unsigned __int8 v4;

  if (a3 != 3)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator containerViewController](self, "containerViewController"));
  v4 = objc_msgSend(v3, "isDisplayingLookAroundFullScreen");

  return v4;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  _BOOL8 v4;
  id WeakRetained;

  if ((unint64_t)(a4 - 1) >= 2)
  {
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "popLastViewControllerAnimated:", v4);

  }
}

- (UIScrollView)pptTestScrollView
{
  return 0;
}

- (void)_captureLookAroundUserAction:(int)a3 onTarget:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  uint64_t v15;
  id v16;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lookAroundView"));

  objc_msgSend(v16, "centerCoordinate");
  v9 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithLatitude:longitude:", v7, v8);
  objc_msgSend(v16, "presentationYaw");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "visiblePlaceMUIDs"));
  v13 = objc_msgSend(v12, "count");
  if ((objc_msgSend(v16, "showsRoadLabels") & 1) != 0)
    v14 = 1;
  else
    v14 = objc_msgSend(v16, "showsPointLabels");
  LOBYTE(v15) = v14;
  +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:", v5, v4, 0, v9, v11, v13, 0.0, v15);

}

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (void)setAppCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_appCoordinator, a3);
}

- (LookAroundContainerViewController)containerViewController
{
  return (LookAroundContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_collectionPicker, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_dataCoordinator, 0);
  objc_storeStrong((id *)&self->_placeCardViewController, 0);
  objc_storeStrong((id *)&self->_trayContaineeViewController, 0);
}

- (int64_t)displayedViewMode
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = objc_msgSend(v3, "displayedViewMode");

  return (int64_t)v4;
}

- (GEOMapServiceTraits)newTraits
{
  void *v2;
  void *v3;
  GEOMapServiceTraits *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTraits"));

  return v4;
}

- (void)placeCardViewController:(id)a3 didSelectParent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v6, "openParentMapItem:", v5);

}

- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v9, "enterRoutePlanningWithDirectionItem:withUserInfo:", v8, v7);

}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (void)placeCardViewController:(id)a3 showCollection:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v6, "openCollection:", v5);

}

- (void)placeCardViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v15, "openRelatedMapItems:withTitle:originalMapItem:analyticsDelegate:", v14, v13, v12, v11);

}

- (void)placeCardViewController:(id)a3 showCuratedCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = objc_alloc((Class)MKMapItemIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionIdentifier"));

  v9 = objc_msgSend(v6, "initWithGEOMapItemIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v8, "openCuratedCollectionWithIdentifier:", v9);

}

- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v6, "openGuidesHomeWithGuideLocation:", v5);

}

- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v10, "openCuratedCollectionsList:usingTitle:", v9, v8);

}

- (void)placeCardViewController:(id)a3 presentPOIEnrichmentWithCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v6, "setContainerViewController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containeeDelegate"));
  objc_msgSend(v6, "setContaineeDelegate:", v9);

  objc_msgSend(v6, "setPresentationDelegate:", self);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v10, "presentPOIEnrichmentWithCoordinator:", v6);

}

- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  objc_msgSend(v6, "copy:", v5);

}

@end
