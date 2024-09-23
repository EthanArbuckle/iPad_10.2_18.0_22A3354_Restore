@implementation CarSmallWidgetController

+ (Class)chromeViewControllerClass
{
  return (Class)objc_opt_class(CarSmallWidgetChromeViewController);
}

+ (Class)fallbackModeControllerClass
{
  return (Class)objc_opt_class(CarSmallWidgetBrowsingModeController);
}

- (id)contextsForCurrentAppState
{
  CarSmallWidgetBrowsingModeController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned int v14;
  __objc2_class **v15;
  CarSmallWidgetRouteGeniusModeController *v16;
  CarSmallWidgetRouteGeniusModeController *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  __CFString *v25;
  id v26;
  uint8_t buf[4];
  CarSmallWidgetController *v29;
  __int16 v30;
  __CFString *v31;

  v3 = objc_alloc_init(CarSmallWidgetBrowsingModeController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSession"));

  v8 = objc_opt_class(RouteGeniusSession);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0
    && (unint64_t)-[CarWidgetController sceneType](self, "sceneType") <= 3)
  {
    v17 = [CarSmallWidgetRouteGeniusModeController alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "suggestion"));
    v16 = -[CarSmallWidgetRouteGeniusModeController initWithSuggestion:](v17, "initWithSuggestion:", v19);

  }
  else
  {
    v9 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
      goto LABEL_12;
    v10 = v7;
    v11 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    v14 = objc_msgSend(v13, "isCarNavigationCompatible");
    v15 = off_1011960C8;
    if (!v14)
      v15 = off_1011960C0;
    v16 = (CarSmallWidgetRouteGeniusModeController *)objc_alloc_init(*v15);
  }
  objc_msgSend(v4, "addObject:", v16);

LABEL_12:
  v20 = sub_10043379C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = v4;
    v23 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "count"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", ")));
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v23, v24));

      }
      else
      {
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v23));
      }
    }
    else
    {
      v25 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 134349314;
    v29 = self;
    v30 = 2112;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Recreating current app state with modes: %@", buf, 0x16u);

  }
  v26 = objc_msgSend(v4, "copy");

  return v26;
}

@end
