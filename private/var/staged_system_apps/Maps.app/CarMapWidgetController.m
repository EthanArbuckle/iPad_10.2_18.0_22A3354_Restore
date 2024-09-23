@implementation CarMapWidgetController

+ (Class)chromeViewControllerClass
{
  return (Class)objc_opt_class(CarMapWidgetChromeViewController, a2);
}

+ (Class)fallbackModeControllerClass
{
  return (Class)objc_opt_class(CarMapWidgetMapBrowsingModeController, a2);
}

- (id)contextsForCurrentAppState
{
  CarMapWidgetMapBrowsingModeController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __objc2_class **v19;
  CarMapWidgetRouteGeniusModeController *v20;
  void *v21;
  void *v22;
  CarMapWidgetRouteGeniusModeController *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  __CFString *v29;
  id v30;
  uint8_t buf[4];
  CarMapWidgetController *v33;
  __int16 v34;
  __CFString *v35;

  v3 = objc_alloc_init(CarMapWidgetMapBrowsingModeController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSession"));

  v8 = objc_opt_class(RouteGeniusSession);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0
    && (unint64_t)-[CarWidgetController sceneType](self, "sceneType") <= 3)
  {
    v20 = [CarMapWidgetRouteGeniusModeController alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "suggestion"));
    v23 = -[CarBasicRouteGeniusModeController initWithSuggestion:](v20, "initWithSuggestion:", v22);

LABEL_15:
    objc_msgSend(v4, "addObject:", v23);

    goto LABEL_16;
  }
  v9 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v10 = v7;
    v11 = objc_opt_class(NavigationSession);
    v12 = (objc_opt_isKindOfClass(v10, v11) & 1) != 0 ? v10 : 0;
    v13 = v12;

    v14 = objc_msgSend(v13, "isCarNavigationCompatible");
    if (v14)
    {
      if ((id)-[CarWidgetController sceneType](self, "sceneType") == (id)7)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
        v18 = objc_msgSend(v17, "_car_hybridInstrumentClusterLayout");

        v19 = off_101196078;
        if (!v18)
          v19 = off_1011960C8;
      }
      else
      {
        v19 = off_101196090;
      }
      v23 = (CarMapWidgetRouteGeniusModeController *)objc_alloc_init(*v19);
      goto LABEL_15;
    }
  }
LABEL_16:
  v24 = sub_1004335DC();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = v4;
    v27 = v26;
    if (v26)
    {
      if (objc_msgSend(v26, "count"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", ")));
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v27, v28));

      }
      else
      {
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v27));
      }
    }
    else
    {
      v29 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 134349314;
    v33 = self;
    v34 = 2112;
    v35 = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Recreating current app state with modes: %@", buf, 0x16u);

  }
  v30 = objc_msgSend(v4, "copy");

  return v30;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id chromeDeactivationToken;
  id v5;
  objc_super v6;

  chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_chromeDeactivationToken = 0;
  v5 = a3;

  v6.receiver = self;
  v6.super_class = (Class)CarMapWidgetController;
  -[CarWidgetController sceneWillEnterForeground:](&v6, "sceneWillEnterForeground:", v5);

}

- (void)sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  id chromeDeactivationToken;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarMapWidgetController;
  -[CarWidgetController sceneDidEnterBackground:](&v7, "sceneDidEnterBackground:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "acquireChromeDeactivationTokenForReason:", CFSTR("CarPlay Dashboard backgrounded")));
  chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_chromeDeactivationToken = v5;

}

- (id)chromeDeactivationToken
{
  return self->_chromeDeactivationToken;
}

- (void)setChromeDeactivationToken:(id)a3
{
  objc_storeStrong(&self->_chromeDeactivationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chromeDeactivationToken, 0);
}

@end
