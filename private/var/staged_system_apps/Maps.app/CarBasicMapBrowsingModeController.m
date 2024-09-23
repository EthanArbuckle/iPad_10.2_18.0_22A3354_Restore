@implementation CarBasicMapBrowsingModeController

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  void *v5;
  unsigned int v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController", a3, a4));
  v6 = objc_msgSend(v5, "isCurrentContext:", self);

  if (v6)
    -[CarBasicMapBrowsingModeController setInitialTrackingIfNeededAndPossible](self, "setInitialTrackingIfNeededAndPossible");
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (CarMapTrackingController)trackingController
{
  CarMapTrackingController *trackingController;
  CarMapTrackingController *v4;
  CarMapTrackingController *v5;

  trackingController = self->_trackingController;
  if (!trackingController)
  {
    v4 = objc_alloc_init(CarMapTrackingController);
    v5 = self->_trackingController;
    self->_trackingController = v4;

    trackingController = self->_trackingController;
  }
  return trackingController;
}

- (void)setInitialTrackingIfNeededAndPossible
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_mapsSceneDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryPointsCoordinator"));
  v6 = objc_msgSend(v5, "didLaunchWithExplicitIntent");

  if (!self->_didSetInitialTracking && (v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userLocation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));

    if (v9)
    {
      self->_didSetInitialTracking = 1;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultMapSettings"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100A5ED6C;
      v13[3] = &unk_1011AE8F8;
      v13[4] = self;
      objc_msgSend(v11, "applyToMapViewAnimated:duration:completion:", 0, v13, 0.0);

    }
    else
    {

    }
  }
}

- (void)setVisibleMapRegion:(id *)a3 animated:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  _QWORD v15[9];
  char v16;

  v8 = (char)a3;
  v9 = v7;
  v10 = v6;
  v11 = v5;
  v12 = v4;
  self->_didSetInitialTracking = 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController", a3, a4));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100A5EE30;
  v15[3] = &unk_1011E0BD0;
  v15[4] = self;
  v15[5] = v12;
  v15[6] = v11;
  v15[7] = v10;
  v15[8] = v9;
  v16 = v8;
  objc_msgSend(v14, "whenContextNextBecomesCurrent:performAction:withBlock:", self, CFSTR("SetMapRegion"), v15);

}

- (void)setMapCamera:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  if (v6)
  {
    self->_didSetInitialTracking = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A5EF88;
    v8[3] = &unk_1011B4060;
    v8[4] = self;
    v9 = v6;
    v10 = a4;
    objc_msgSend(v7, "whenContextNextBecomesCurrent:performAction:withBlock:", self, CFSTR("SetMapRegion"), v8);

  }
}

- (BOOL)showsMapView
{
  return 1;
}

- (void)configureNavigationDisplay:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setCameraStyle:", 4);
  objc_msgSend(v3, "setRouteGeniusEntry:", 0);
  objc_msgSend(v3, "setCameraPaused:", 0);

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A5F084;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addPreparation:", v4);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A5F21C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addPreparation:", v4);
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
