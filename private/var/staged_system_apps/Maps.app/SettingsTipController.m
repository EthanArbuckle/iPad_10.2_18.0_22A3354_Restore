@implementation SettingsTipController

- (SettingsTipController)initWithChromeViewController:(id)a3
{
  id v4;
  SettingsTipController *v5;
  SettingsTipController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SettingsTipController;
  v5 = -[SettingsTipController init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_chromeViewController, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "_sceneWillEnterForeground:", UISceneWillEnterForegroundNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, "_sceneDidEnterBackground:", UISceneDidEnterBackgroundNotification, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "_routePlanningPresentedDidChange:", CFSTR("RoutePlanningPresentedDidChangeNotification"), 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipController _venuesManager](v6, "_venuesManager"));
    objc_msgSend(v10, "addChangeObserver:", v6);

    -[SettingsTipController _transitionIfSessionState:toSessionState:](v6, "_transitionIfSessionState:toSessionState:", 0, 1);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SettingsTipController _cancelImpressionTimer](self, "_cancelImpressionTimer");
  v3.receiver = self;
  v3.super_class = (Class)SettingsTipController;
  -[SettingsTipController dealloc](&v3, "dealloc");
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___SettingsTipControllerObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (BOOL)shouldShowTip
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;
  uint64_t UInteger;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  void *v15;
  void *v16;

  if ((objc_msgSend(UIApp, "launchedToTest") & 1) != 0)
    return 0;
  if (!self->_sessionState)
    return 0;
  if (self->_impressionState == 2)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SettingsTipKey"));

  if ((v4 & 1) != 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("SettingsTipLaunchCount"));

  UInteger = GEOConfigGetUInteger(MapsConfig_SettingsTipMinimumLaunchCount, off_1014B46E8);
  if ((uint64_t)v6 < UInteger && UInteger > 0)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = objc_msgSend(v9, "integerForKey:", CFSTR("SettingsTipImpressionCount"));

  if ((uint64_t)v10 >= GEOConfigGetUInteger(MapsConfig_SettingsTipMaximumImpressionCount, off_1014B46F8))
    return 0;
  if (!+[MapsSettings userDesiresTraffic](MapsSettings, "userDesiresTraffic"))
    return 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipController _baseActionCoordinator](self, "_baseActionCoordinator"));
  v12 = objc_msgSend(v11, "isRoutePlanningPresented");

  if ((v12 & 1) != 0)
    return 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipController _venuesManager](self, "_venuesManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "venueWithFocus"));
  v13 = v16 == 0;

  return v13;
}

- (void)settingsTipShown
{
  -[SettingsTipController _transitionIfImpressionState:toImpressionState:](self, "_transitionIfImpressionState:toImpressionState:", 0, 1);
}

- (void)settingsOpened
{
  -[SettingsTipController _markAsSeenOrClosed](self, "_markAsSeenOrClosed");
}

- (void)settingsTipClosed
{
  -[SettingsTipController _markAsSeenOrClosed](self, "_markAsSeenOrClosed");
}

- (id)_baseActionCoordinator
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "baseActionCoordinator"));

  return v4;
}

- (id)_venuesManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipController _baseActionCoordinator](self, "_baseActionCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venuesManager"));

  return v3;
}

- (void)_transitionIfSessionState:(int64_t)a3 toSessionState:(int64_t)a4
{
  int64_t sessionState;

  sessionState = self->_sessionState;
  if (sessionState == a3 || sessionState == a4)
  {
    self->_sessionState = a4;
    if (a4 == 1)
    {
      -[SettingsTipController _incrementSessionCount](self, "_incrementSessionCount");
    }
    else if (!a4)
    {
      -[SettingsTipController _transitionIfImpressionState:toImpressionState:](self, "_transitionIfImpressionState:toImpressionState:", self->_impressionState);
    }
    -[GEOObserverHashTable settingsTipControllerDidUpdate:](self->_observers, "settingsTipControllerDidUpdate:", self);
  }
}

- (void)_incrementSessionCount
{
  void *v2;
  char *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (char *)objc_msgSend(v2, "integerForKey:", CFSTR("SettingsTipLaunchCount"));

  if ((uint64_t)v3 < GEOConfigGetUInteger(MapsConfig_SettingsTipMinimumLaunchCount, off_1014B46E8))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setInteger:forKey:", v3 + 1, CFSTR("SettingsTipLaunchCount"));

  }
}

- (void)_markAsSeenOrClosed
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("SettingsTipKey"));

  -[SettingsTipController _transitionIfImpressionState:toImpressionState:](self, "_transitionIfImpressionState:toImpressionState:", 1, 2);
}

- (void)_transitionIfImpressionState:(int64_t)a3 toImpressionState:(int64_t)a4
{
  int64_t impressionState;

  impressionState = self->_impressionState;
  if (impressionState == a3 || impressionState == a4)
  {
    self->_impressionState = a4;
    switch(a4)
    {
      case 2:
        goto LABEL_9;
      case 1:
        -[SettingsTipController _incrementImpressionCount](self, "_incrementImpressionCount");
        -[SettingsTipController _startImpressionTimer](self, "_startImpressionTimer");
        break;
      case 0:
LABEL_9:
        -[SettingsTipController _cancelImpressionTimer](self, "_cancelImpressionTimer");
        break;
    }
    -[GEOObserverHashTable settingsTipControllerDidUpdate:](self->_observers, "settingsTipControllerDidUpdate:", self);
  }
}

- (void)_incrementImpressionCount
{
  void *v2;
  char *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (char *)objc_msgSend(v2, "integerForKey:", CFSTR("SettingsTipImpressionCount"));

  if ((uint64_t)v3 < GEOConfigGetUInteger(MapsConfig_SettingsTipMaximumImpressionCount, off_1014B46F8))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setInteger:forKey:", v3 + 1, CFSTR("SettingsTipImpressionCount"));

  }
}

- (void)_startImpressionTimer
{
  double Double;
  NSTimer *v4;
  NSTimer *impressionTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_impressionTimer)
  {
    Double = GEOConfigGetDouble(MapsConfig_SettingsTipAutomaticDismissalTimeout, off_1014B4708);
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100332FA4;
    v6[3] = &unk_1011ADF20;
    objc_copyWeak(&v7, &location);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, Double));
    impressionTimer = self->_impressionTimer;
    self->_impressionTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelImpressionTimer
{
  NSTimer *impressionTimer;

  -[NSTimer invalidate](self->_impressionTimer, "invalidate");
  impressionTimer = self->_impressionTimer;
  self->_impressionTimer = 0;

}

- (void)_sceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));

  if (v4 == v8)
    -[SettingsTipController _transitionIfSessionState:toSessionState:](self, "_transitionIfSessionState:toSessionState:", 0, 1);
}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));

  if (v4 == v8)
    -[SettingsTipController _transitionIfSessionState:toSessionState:](self, "_transitionIfSessionState:toSessionState:", 1, 0);
}

- (void)_routePlanningPresentedDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipController _baseActionCoordinator](self, "_baseActionCoordinator"));

  if (v4 == v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTipController _baseActionCoordinator](self, "_baseActionCoordinator"));
    v7 = objc_msgSend(v6, "isRoutePlanningPresented");

    if (v7)
      -[SettingsTipController _transitionIfImpressionState:toImpressionState:](self, "_transitionIfImpressionState:toImpressionState:", 1, 2);
  }
}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  if (a3)
    -[SettingsTipController _transitionIfImpressionState:toImpressionState:](self, "_transitionIfImpressionState:toImpressionState:", 1, 2, a5);
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (int64_t)impressionState
{
  return self->_impressionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
