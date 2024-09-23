@implementation FlyoverModeController

- (FlyoverModeController)initWithMapItem:(id)a3
{
  id v5;
  FlyoverModeController *v6;
  FlyoverModeController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FlyoverModeController;
  v6 = -[FlyoverModeController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (FlyoverActionCoordination)actionCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverModeController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "flyoverActionCoordinator"));

  return (FlyoverActionCoordination *)v3;
}

- (void)setChromeViewController:(id)a3
{
  IOSBasedChromeViewController **p_chromeViewController;
  id v5;

  p_chromeViewController = &self->_chromeViewController;
  v5 = a3;
  objc_storeWeak((id *)p_chromeViewController, v5);
  -[ContainerViewController setChromeViewController:](self->_containerViewController, "setChromeViewController:", v5);

}

- (FlyoverContainerViewController)containerViewController
{
  FlyoverContainerViewController *containerViewController;
  FlyoverContainerViewController *v4;
  void *v5;
  FlyoverContainerViewController *v6;
  FlyoverContainerViewController *v7;
  void *v8;
  void *v9;

  containerViewController = self->_containerViewController;
  if (!containerViewController)
  {
    v4 = [FlyoverContainerViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverModeController mapItem](self, "mapItem"));
    v6 = -[FlyoverContainerViewController initWithMapItem:](v4, "initWithMapItem:", v5);
    v7 = self->_containerViewController;
    self->_containerViewController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverModeController actionCoordinator](self, "actionCoordinator"));
    -[FlyoverContainerViewController setFlyoverDelegate:](self->_containerViewController, "setFlyoverDelegate:", v8);

    -[ContainerViewController setChromeContext:](self->_containerViewController, "setChromeContext:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverModeController chromeViewController](self, "chromeViewController"));
    -[ContainerViewController setChromeViewController:](self->_containerViewController, "setChromeViewController:", v9);

    containerViewController = self->_containerViewController;
  }
  return containerViewController;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)transitionControllerForPushFromMode:(id)a3
{
  return objc_opt_new(ModeTransitionController);
}

- (id)transitionControllerForPopToMode:(id)a3
{
  return objc_opt_new(ModeTransitionController);
}

- (id)mapViewDelegate
{
  return self->_containerViewController;
}

- (BOOL)showsMapView
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  FlyoverModeController *v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10096192C;
  v7[3] = &unk_1011ACCB8;
  v8 = a3;
  v9 = self;
  v6 = v8;
  objc_msgSend(a4, "addCompletion:", v7);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100961B0C;
  v6[3] = &unk_1011AC8B0;
  v6[4] = self;
  v7 = a3;
  v5 = v7;
  objc_msgSend(a4, "addPreparation:", v6);

}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[App switcher title] Flyover — <location>"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverModeController mapItem](self, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));

  v4[2](v4, v9);
}

- (BOOL)wantsStatusBarControl
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverModeController containerViewController](self, "containerViewController"));
  v3 = objc_msgSend(v2, "preferredStatusBarStyle");

  return (int64_t)v3;
}

- (BOOL)wantsWeatherShowing
{
  return 0;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)wantsLookAroundShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (BOOL)wasShowingCompass
{
  return self->_wasShowingCompass;
}

- (void)setWasShowingCompass:(BOOL)a3
{
  self->_wasShowingCompass = a3;
}

- (BOOL)wasShowingScale
{
  return self->_wasShowingScale;
}

- (void)setWasShowingScale:(BOOL)a3
{
  self->_wasShowingScale = a3;
}

- (BOOL)wasShowingUserLocation
{
  return self->_wasShowingUserLocation;
}

- (void)setWasShowingUserLocation:(BOOL)a3
{
  self->_wasShowingUserLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
