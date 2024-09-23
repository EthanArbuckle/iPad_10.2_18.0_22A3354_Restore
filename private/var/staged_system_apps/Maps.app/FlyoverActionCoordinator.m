@implementation FlyoverActionCoordinator

- (FlyoverActionCoordinator)init
{

  return 0;
}

- (FlyoverActionCoordinator)initWithContainerViewController:(id)a3
{
  id v4;
  FlyoverActionCoordinator *v5;
  FlyoverActionCoordinator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FlyoverActionCoordinator;
  v5 = -[FlyoverActionCoordinator init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_containerViewController, v4);

  return v6;
}

- (void)viewControllerDidStartFlyover:(id)a3
{
  self->_flyoverRunning = 1;
}

- (void)viewControllerDidEndFlyover:(id)a3
{
  self->_flyoverRunning = 0;
}

- (void)viewControllerEndFlyover:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform", a3));
  v5 = objc_msgSend(v4, "supportsARMode");

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "_exitARMode");
  else
    objc_msgSend(v7, "setFlyoverMode:", 0xFFFFFFFFLL);

}

- (void)viewControllerPresentTray:(id)a3
{
  FlyoverContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topMostPresentedViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));

  v8 = objc_loadWeakRetained((id *)p_containerViewController);
  v12 = v8;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topMostPresentedViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitionCoordinator"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100AEE9BC;
    v13[3] = &unk_1011AEDC8;
    v13[4] = self;
    objc_msgSend(v10, "animateAlongsideTransition:completion:", 0, v13);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverActionCoordinator trayContaineeViewController](self, "trayContaineeViewController"));
    objc_msgSend(v12, "presentController:animated:", v11, 0);

  }
}

- (int64_t)displayedViewMode
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = objc_msgSend(v3, "displayedViewMode");

  return (int64_t)v4;
}

- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  objc_msgSend(v6, "updateViewMode:animated:", a3, v4);

}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  return 5;
}

- (BOOL)isFlyoverUnificationEnabled
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapLayer"));
  v6 = objc_msgSend(v5, "isFlyoverUnificationEnabled");

  return v6;
}

- (void)flyoverTourPlay
{
  FlyoverContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapLayer"));
  objc_msgSend(v6, "setFlyoverMode:", 1);

  v12 = objc_loadWeakRetained((id *)p_containerViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
  v9 = objc_loadWeakRetained((id *)p_containerViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_flyover"));
  objc_msgSend(v8, "_performFlyoverAnimation:", v11);

}

- (void)flyoverTourPause
{
  FlyoverContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  objc_msgSend(v5, "_pauseFlyoverAnimation");

  v6 = objc_loadWeakRetained((id *)p_containerViewController);
  v7 = 2 * (objc_msgSend(v6, "sessionInterruptedReason") != 0);

  v11 = objc_loadWeakRetained((id *)p_containerViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapLayer"));
  objc_msgSend(v10, "setFlyoverMode:", v7);

}

- (void)flyoverTourResume
{
  FlyoverContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapLayer"));
  objc_msgSend(v6, "setFlyoverMode:", 1);

  v9 = objc_loadWeakRetained((id *)p_containerViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
  objc_msgSend(v8, "_resumeFlyoverAnimation");

}

- (void)flyoverTourCompleted
{
  FlyoverContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
  objc_msgSend(v6, "_stopFlyoverAnimation");

  v7 = objc_loadWeakRetained((id *)p_containerViewController);
  v8 = 2 * (objc_msgSend(v7, "sessionInterruptedReason") != 0);

  v9 = objc_loadWeakRetained((id *)p_containerViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_mapLayer"));
  objc_msgSend(v12, "setFlyoverMode:", v8);

  -[FlyoverTrayContaineeViewController resetFlyoverTour](self->_trayContaineeViewController, "resetFlyoverTour");
}

- (FlyoverTrayContaineeViewController)trayContaineeViewController
{
  void *v3;
  FlyoverTrayContaineeViewController *trayContaineeViewController;
  FlyoverTrayContaineeViewController *v5;
  id WeakRetained;
  void *v7;
  FlyoverTrayContaineeViewController *v8;
  FlyoverTrayContaineeViewController *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)5)
    goto LABEL_4;
  trayContaineeViewController = self->_trayContaineeViewController;

  if (!trayContaineeViewController)
  {
    v5 = [FlyoverTrayContaineeViewController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapItem"));
    v8 = -[FlyoverTrayContaineeViewController initWithMapItem:](v5, "initWithMapItem:", v7);
    v9 = self->_trayContaineeViewController;
    self->_trayContaineeViewController = v8;

    -[FlyoverTrayContaineeViewController setDelegate:](self->_trayContaineeViewController, "setDelegate:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self->_trayContaineeViewController, "view"));
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
LABEL_4:

  }
  return self->_trayContaineeViewController;
}

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (void)setAppCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_appCoordinator, a3);
}

- (FlyoverContainerViewController)containerViewController
{
  return (FlyoverContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (void)setTrayContaineeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_trayContaineeViewController, a3);
}

- (BOOL)isFlyoverRunning
{
  return self->_flyoverRunning;
}

- (void)setFlyoverRunning:(BOOL)a3
{
  self->_flyoverRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trayContaineeViewController, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_appCoordinator);
}

@end
