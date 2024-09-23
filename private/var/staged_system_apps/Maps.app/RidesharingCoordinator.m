@implementation RidesharingCoordinator

- (RidesharingCoordinator)initWithContainerViewController:(id)a3
{
  id v5;
  RidesharingCoordinator *v6;
  RidesharingCoordinator *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RidesharingCoordinator;
  v6 = -[RidesharingCoordinator init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerViewController, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appCoordinator"));
    objc_storeWeak((id *)&v7->_appCoordinator, v9);

  }
  return v7;
}

- (BOOL)_wasPresentedFromProactiveTray
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator appCoordinator](self, "appCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "baseActionCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(SearchViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  return isKindOfClass & 1;
}

- (void)presentDetailsPicking
{
  void *v3;
  void *v4;
  RidesharingDetailsPickingViewController *v5;

  v5 = objc_alloc_init(RidesharingDetailsPickingViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v3, "setDetailsPickingViewController:", v5);

  -[RidesharingDetailsPickingViewController setCoordinator:](v5, "setCoordinator:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v4, "presentController:animated:useDefaultContaineeLayout:", v5, 1, 1);

}

- (void)presentExpirationAlertControllerWithRequestRideStatus:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  if (-[RidesharingCoordinator _ridesharingIsCurrentMode](self, "_ridesharingIsCurrentMode"))
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v6 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingCoordinator.m");
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Ride option expired, showing expiration alert"));
      *(_DWORD *)buf = 136315394;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", buf, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationAlertTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationAlertMessage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1));

    objc_initWeak((id *)buf, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("localized string not found"), 0));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100857BB8;
    v16[3] = &unk_1011AFA88;
    objc_copyWeak(&v17, (id *)buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 1, v16));
    objc_msgSend(v11, "addAction:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v15, "presentViewController:animated:completion:", v11, 1, 0);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
}

- (void)presentConfirmedRideWithApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RidesharingConfirmedRideViewController *v11;

  v4 = a3;
  v11 = -[RidesharingConfirmedRideViewController initWithApplicationIdentifier:]([RidesharingConfirmedRideViewController alloc], "initWithApplicationIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v5, "setDetailsPickingViewController:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v6, "setConfirmedRideViewController:", v11);

  -[RidesharingConfirmedRideViewController setCoordinator:](v11, "setCoordinator:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v7, "presentController:animated:useDefaultContaineeLayout:", v11, 1, 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ridesharingAnnotationsManager"));
  objc_msgSend(v10, "addCurrentRideWithApplicationIdentifier:", v4);

}

- (void)viewController:(id)a3 minimizeConfirmation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ridesharingAnnotationsManager"));
  objc_msgSend(v7, "removeCurrentRide");

  if (-[RidesharingCoordinator _wasPresentedFromProactiveTray](self, "_wasPresentedFromProactiveTray"))
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rideStatus"));
    v8 = objc_msgSend(v9, "shouldShowFeedbackControls");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v10, "dismissRidesharingSessionAndReturnToRoutePlanning:", v8);

  v11 = sub_100B3A5D4();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v12, "hintRefreshOfType:", 9);

}

- (void)viewControllerRideCompletionAction:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator appCoordinator](self, "appCoordinator", a3));
  objc_msgSend(v3, "dismissRidesharingSessionAndReturnToRoutePlanning:", 0);

}

- (void)viewControllerSendFeedbackAction
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t Log;
  char *v11;
  id v12;
  int v13;
  char *v14;
  __int16 v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v3, "dismissRidesharingSessionAndReturnToRoutePlanning:", -[RidesharingCoordinator _wasPresentedFromProactiveTray](self, "_wasPresentedFromProactiveTray") ^ 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator appCoordinator](self, "appCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baseActionCoordinator"));

  v6 = objc_opt_class(ActionCoordinator);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routePlanningDataCoordinator"));
    -[NSObject refreshRidesharingOptionsIfVisible](v9, "refreshRidesharingOptionsIfVisible");
  }
  else
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingCoordinator.m");
      v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Could not trigger a refresh of ride options after finishing sending feedback. Ride options list may have stale data"));
      v13 = 136315394;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)viewController:(id)a3 presentErrorAlertIfNeeded:(id)a4
{
  id v6;
  RidesharingErrorAlertProvider *v7;
  uint64_t Log;
  NSObject *v9;
  char *v10;
  char *v11;
  _QWORD *v12;
  void *v13;
  UIAlertController *errorAlert;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  _QWORD v20[4];
  _QWORD *v21;
  _QWORD v22[5];
  RidesharingErrorAlertProvider *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v6 = a3;
  v7 = (RidesharingErrorAlertProvider *)a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingCoordinator.m");
    v11 = (char *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Presenting error alert: %@ on: %@"), v7, v6);
    *(_DWORD *)buf = 136315394;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  if (!v6)
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[RidesharingCoordinator viewController:presentErrorAlertIfNeeded:]";
      v27 = 2080;
      v28 = "RidesharingCoordinator.m";
      v29 = 1024;
      v30 = 118;
      v31 = 2080;
      v32 = "viewController";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (self->_errorAlertProvider != v7)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100858274;
    v22[3] = &unk_1011AD238;
    v22[4] = self;
    v23 = v7;
    v24 = v6;
    v12 = objc_retainBlock(v22);
    v13 = v12;
    errorAlert = self->_errorAlert;
    if (errorAlert)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100858650;
      v20[3] = &unk_1011ADA00;
      v21 = v12;
      -[UIAlertController dismissViewControllerAnimated:completion:](errorAlert, "dismissViewControllerAnimated:completion:", 1, v20);

    }
    else
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }

  }
}

- (BOOL)_ridesharingIsCurrentMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentIOSBasedContext"));
  v8 = objc_msgSend(v4, "isEqual:", v7);

  return v8;
}

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (void)setAppCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_appCoordinator, a3);
}

- (RidesharingContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_errorAlert, 0);
  objc_storeStrong((id *)&self->_errorAlertProvider, 0);
}

@end
