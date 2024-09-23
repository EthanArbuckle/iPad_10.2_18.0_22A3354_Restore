@implementation CarMapPanningModeController

- (CarMapPanningModeController)init
{
  CarMapPanningModeController *v2;
  CarMapPanningViewController *v3;
  CarMapPanningViewController *viewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarMapPanningModeController;
  v2 = -[CarMapPanningModeController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(CarMapPanningViewController);
    viewController = v2->_viewController;
    v2->_viewController = v3;

    -[CarMapPanningViewController setPanDelegate:](v2->_viewController, "setPanDelegate:", v2);
  }
  return v2;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 4;
  return self;
}

- (BOOL)showsHeadingIndicator
{
  return 1;
}

- (BOOL)showsSpeedLimit
{
  return 1;
}

- (BOOL)allowMapZoomAndRecentering
{
  return 0;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (BOOL)supportsAlternateRouteSelection
{
  return 1;
}

- (id)fullscreenViewController
{
  return self->_viewController;
}

- (BOOL)showsNavigationBar
{
  return 0;
}

- (NSArray)carFocusOrderSequences
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController fullscreenViewController](self, "fullscreenViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "carFocusOrderSequences"));

  return (NSArray *)v3;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  ChromeViewController **p_chromeViewController;
  id v6;
  id WeakRetained;
  void *v8;
  id mapInsetPropagationSuspensionToken;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CarMapPanningViewController *viewController;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  p_chromeViewController = &self->_chromeViewController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "acquireMapInsetPropagationSuspensionTokenForReason:", CFSTR("CarPlay panning context")));
  mapInsetPropagationSuspensionToken = self->_mapInsetPropagationSuspensionToken;
  self->_mapInsetPropagationSuspensionToken = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController chromeViewController](self, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
  -[CarMapPanningViewController setMapView:](self->_viewController, "setMapView:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController chromeViewController](self, "chromeViewController"));
  -[CarMapPanningViewController setChromeViewController:](self->_viewController, "setChromeViewController:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController carChromeViewController](self, "carChromeViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nudgerizer"));
  -[CarMapPanningViewController setNudgerizer:](self->_viewController, "setNudgerizer:", v14);

  viewController = self->_viewController;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](viewController, "nudgerizer"));
  objc_msgSend(v16, "setDelegate:", viewController);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController mapView](self->_viewController, "mapView"));
  v18 = objc_msgSend(v6, "isAnimated");

  objc_msgSend(v17, "setUserTrackingMode:animated:", 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController chromeViewController](self, "chromeViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mapView"));
  self->_scrollWasEnabled = objc_msgSend(v20, "isScrollEnabled");

  v22 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController chromeViewController](self, "chromeViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapView"));
  objc_msgSend(v21, "setScrollEnabled:", 0);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id mapInsetPropagationSuspensionToken;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController carChromeViewController](self, "carChromeViewController", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nudgerizer"));
  objc_msgSend(v6, "setDelegate:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController chromeViewController](self, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
  objc_msgSend(v8, "setScrollEnabled:", self->_scrollWasEnabled);

  mapInsetPropagationSuspensionToken = self->_mapInsetPropagationSuspensionToken;
  self->_mapInsetPropagationSuspensionToken = 0;

}

- (void)layoutForUnobscuredBoundsChange
{
  -[CarMapPanningViewController refreshContentViewIfNeeded](self->_viewController, "refreshContentViewIfNeeded");
}

- (void)configureNavigationDisplay:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setCameraStyle:", 0);
  objc_msgSend(v3, "setCameraPaused:", &__kCFBooleanTrue);

}

- (BOOL)invalidAfterDisconnect
{
  return 1;
}

- (void)_doneButtonPressed
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = objc_msgSend(v3, "isCarAppSceneHostingNavigation");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController chromeViewController](self, "chromeViewController"));
  v6 = v5;
  if (v4)
    v7 = 3051;
  else
    v7 = 4;
  objc_msgSend(v5, "captureUserAction:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v8, "popFromContext:", self);

}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  if (!a4)
    self->_mapWasPanned = 1;
}

- (void)carMapPanningViewControllerDidPan:(id)a3 inDirection:(int64_t)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningModeController chromeViewController](self, "chromeViewController", a3));
  objc_msgSend(v6, "captureUserActionPannedInDirection:", a4);

  self->_mapWasPanned = 1;
}

- (void)carMapPanningViewControllerDidTapDone:(id)a3
{
  -[CarMapPanningModeController _doneButtonPressed](self, "_doneButtonPressed", a3);
}

- (int)currentUsageTarget
{
  return 1002;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (BOOL)mapWasPanned
{
  return self->_mapWasPanned;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong(&self->_mapInsetPropagationSuspensionToken, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
