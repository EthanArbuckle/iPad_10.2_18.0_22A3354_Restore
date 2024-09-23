@implementation CarIncompatibleNavigationModeController

- (CarIncompatibleNavigationModeController)init
{
  CarIncompatibleNavigationModeController *v2;
  CarAlertViewController *v3;
  CarAlertViewController *viewController;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarIncompatibleNavigationModeController;
  v2 = -[CarIncompatibleNavigationModeController init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(CarAlertViewController);
    viewController = v2->_viewController;
    v2->_viewController = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController navigationItem](v2->_viewController, "navigationItem"));
    objc_msgSend(v5, "setHidesBackButton:", 1);

  }
  return v2;
}

- (id)fullscreenViewController
{
  return self->_viewController;
}

- (BOOL)showsNavigationBar
{
  return 0;
}

- (BOOL)showsMapView
{
  return 0;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)fullscreenViewControllerPresentationTransition
{
  CarSlideUpTransition *v2;

  v2 = objc_opt_new(CarSlideUpTransition);
  -[CarSlideUpTransition setOperation:](v2, "setOperation:", 1);
  return v2;
}

- (id)fullscreenViewControllerDismissalTransition
{
  CarSlideUpTransition *v2;

  v2 = objc_opt_new(CarSlideUpTransition);
  -[CarSlideUpTransition setOperation:](v2, "setOperation:", 2);
  return v2;
}

- (void)configureNavigationDisplay:(id)a3
{
  objc_msgSend(a3, "setCameraPaused:", &__kCFBooleanTrue);
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CarAlertViewController *viewController;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  void *v24;

  -[CarAlertViewController reset](self->_viewController, "reset", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v5, "desiredTransportType"))
  {
    v6 = objc_msgSend(v5, "desiredTransportType");
    if (v6 > 5)
      v7 = 1;
    else
      v7 = qword_100E3D240[v6];
    v16 = CarInterruptionUserInfoWithTransportType(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionTitle")));
    -[CarAlertViewController setAlertTitle:](self->_viewController, "setAlertTitle:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionMessage")));
    -[CarAlertViewController setAlertMessage:](self->_viewController, "setAlertMessage:", v18);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionActions")));
  }
  else
  {
    v8 = CarDisplayDirectionsNotAvailableErrorTitle();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[CarAlertViewController setAlertTitle:](self->_viewController, "setAlertTitle:", v9);

    v10 = CarDisplayTurnByTurnNotAvailableAdvisory();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[CarAlertViewController setAlertMessage:](self->_viewController, "setAlertMessage:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("End Navigation [CarPlay, Stepping]"), CFSTR("localized string not found"), 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v13, 0, &stru_1011E1368));
    v24 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));

  }
  -[CarAlertViewController setActions:](self->_viewController, "setActions:", v15);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100A8DC18;
  v22[3] = &unk_1011E1390;
  v23 = v15;
  viewController = self->_viewController;
  v20 = v15;
  -[CarAlertViewController setResultBlock:](viewController, "setResultBlock:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncompatibleNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v21, "setHardwareBackButtonBehavior:forContext:", 2, self);

}

- (NSArray)carFocusOrderSequences
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  if (!-[CarAlertViewController isViewLoaded](self->_viewController, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController focusOrderSubItems](self->_viewController, "focusOrderSubItems"));
  v4 = sub_10039DCD4(v3, &stru_1011E13D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v5, 5));
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return (NSArray *)v7;
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
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
