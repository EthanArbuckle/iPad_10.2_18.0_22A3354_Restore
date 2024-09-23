@implementation RidesharingModeController

- (RidesharingModeController)init
{
  RidesharingModeController *v2;
  RidesharingContainerViewController *v3;
  RidesharingContainerViewController *containerViewController;
  RidesharingCoordinator *v5;
  RidesharingCoordination *ridebookingCoordinator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RidesharingModeController;
  v2 = -[RidesharingModeController init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(RidesharingContainerViewController);
    containerViewController = v2->_containerViewController;
    v2->_containerViewController = v3;

    -[ContainerViewController setChromeContext:](v2->_containerViewController, "setChromeContext:", v2);
    -[ContainerViewController setAllowOnlyStandardStyle:](v2->_containerViewController, "setAllowOnlyStandardStyle:", 0);
    v5 = -[RidesharingCoordinator initWithContainerViewController:]([RidesharingCoordinator alloc], "initWithContainerViewController:", v2->_containerViewController);
    ridebookingCoordinator = v2->_ridebookingCoordinator;
    v2->_ridebookingCoordinator = (RidesharingCoordination *)v5;

  }
  return v2;
}

- (RidesharingModeController)initWithRideOption:(id)a3
{
  id v5;
  RidesharingModeController *v6;
  RidesharingModeController *v7;

  v5 = a3;
  v6 = -[RidesharingModeController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rideOption, a3);

  return v7;
}

- (RidesharingModeController)initWithApplicationIdentifier:(id)a3
{
  id v4;
  RidesharingModeController *v5;
  NSString *v6;
  NSString *applicationIdentifier;

  v4 = a3;
  v5 = -[RidesharingModeController init](self, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = v6;

  }
  return v5;
}

- (id)fullscreenViewController
{
  return self->_containerViewController;
}

- (void)setChromeViewController:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_chromeViewController, obj);
    -[ContainerViewController setChromeViewController:](self->_containerViewController, "setChromeViewController:", obj);
  }

}

- (UIView)passThroughView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passThroughView"));

  return (UIView *)v3;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (self->_rideOption)
    -[RidesharingCoordination presentDetailsPicking](self->_ridebookingCoordinator, "presentDetailsPicking");
  if (self->_applicationIdentifier)
    -[RidesharingCoordination presentConfirmedRideWithApplicationIdentifier:](self->_ridebookingCoordinator, "presentConfirmedRideWithApplicationIdentifier:");
  -[RidesharingModeController _setupMapView](self, "_setupMapView");

}

- (void)_setupMapView
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingModeController chromeViewController](self, "chromeViewController"));
  v4 = objc_msgSend(v3, "displayedViewMode");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v5, "updateViewMode:animated:", 0, 0);

  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  uint64_t Log;
  NSObject *v6;
  char *v7;
  id v8;
  NSString *applicationIdentifier;
  void *v10;
  void *v11;
  int v12;
  char *v13;
  __int16 v14;
  id v15;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingModeController.m");
    v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Resigning ridesharing mode"));
    v12 = 136315394;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", (uint8_t *)&v12, 0x16u);

  }
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingModeController chromeViewController](self, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ridesharingAnnotationsManager"));
  objc_msgSend(v11, "removeCurrentRide");

}

- (id)fullscreenViewControllerPresentationTransition
{
  return objc_opt_new(ModeTransitionController);
}

- (id)fullscreenViewControllerDismissalTransition
{
  return objc_opt_new(ModeTransitionController);
}

- (BOOL)showsMapView
{
  return 1;
}

- (id)mapViewDelegate
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  RidesharingContainerViewController *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingContainerViewController confirmedRideViewController](self->_containerViewController, "confirmedRideViewController"));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingModeController chromeViewController](self, "chromeViewController"));
    v7 = (RidesharingContainerViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ridesharingAnnotationsManager"));

  }
  else
  {
    v7 = self->_containerViewController;
  }
  return v7;
}

- (IOSChromeViewController)chromeViewController
{
  return (IOSChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (RideBookingRideOption)rideOption
{
  return self->_rideOption;
}

- (void)setRideOption:(id)a3
{
  objc_storeStrong((id *)&self->_rideOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_ridebookingCoordinator, 0);
}

@end
