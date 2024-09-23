@implementation NavdDefaultsUpdater

- (NavdDefaultsUpdater)initWithDefaults:(id)a3 navigationService:(id)a4 carDisplayController:(id)a5
{
  id v9;
  id v10;
  id v11;
  NavdDefaultsUpdater *v12;
  NavdDefaultsUpdater *v13;
  NavigationSettingsMonitor *v14;
  NavigationSettingsMonitor *settingsMonitor;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NavdDefaultsUpdater;
  v12 = -[NavdDefaultsUpdater init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    objc_storeStrong((id *)&v13->_navigationService, a4);
    objc_storeStrong((id *)&v13->_carDisplayController, a5);
    v14 = -[NavigationSettingsMonitor initWithUserDefaults:]([NavigationSettingsMonitor alloc], "initWithUserDefaults:", v9);
    settingsMonitor = v13->_settingsMonitor;
    v13->_settingsMonitor = v14;

    -[NavdDefaultsUpdater _migrateDeprecatedSettings](v13, "_migrateDeprecatedSettings");
    -[NavdDefaultsUpdater _startObserving](v13, "_startObserving");
    -[NavdDefaultsUpdater _updateSettings](v13, "_updateSettings");
  }

  return v13;
}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)_startObserving
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_carPlayConnectionUpdated:", CFSTR("CarDisplayDidChangeConnectedNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_sceneDidActivateNotification:", UISceneDidActivateNotification, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_navigationSettingsUpdated:", CFSTR("NavigationSettingsMonitorDidUpdateSettings"), self->_settingsMonitor);

}

- (void)_migrateDeprecatedSettings
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSNumber *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater userDefaults](self, "userDefaults"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("VoiceNavigationVolume")));

  v4 = v14;
  if (v14)
  {
    v5 = v14;
    if (qword_1014D2CF8 != -1)
      dispatch_once(&qword_1014D2CF8, &stru_1011BF6B8);
    v6 = (id)qword_1014D2CF0;
    v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("Off Volume"));
    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      _CFPreferencesSetAppValueWithContainer(CFSTR("VoiceVolumeForDrivingContext"), v5, CFSTR("com.apple.Maps"), v8);

    }
    if (qword_1014D2CF8 != -1)
      dispatch_once(&qword_1014D2CF8, &stru_1011BF6B8);
    v9 = (id)qword_1014D2CF0;
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    _CFPreferencesSetAppValueWithContainer(CFSTR("VoiceIsMute"), v10, CFSTR("com.apple.Maps"), v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    _CFPreferencesSynchronizeWithContainer(CFSTR("com.apple.Maps"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost, v12);

    GSSendAppPreferencesChanged(CFSTR("com.apple.Maps"), CFSTR("VoiceIsMute"));
    GSSendAppPreferencesChanged(CFSTR("com.apple.Maps"), CFSTR("VoiceVolumeForDrivingContext"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater userDefaults](self, "userDefaults"));
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("VoiceNavigationVolume"));

    v4 = v14;
  }

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v6 = a5;
  v7 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  -[NavdDefaultsUpdater setNavigationSession:](self, "setNavigationSession:", v9);

  v13 = v6;
  v10 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
    v11 = v13;
  else
    v11 = 0;
  v12 = v11;

  -[NavdDefaultsUpdater setRoutePlanningSession:](self, "setRoutePlanningSession:", v12);
  -[NavdDefaultsUpdater _updateSettings](self, "_updateSettings");

}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *routePlanningSession;
  RoutePlanningSession *v7;

  v5 = (RoutePlanningSession *)a3;
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v5)
  {
    v7 = v5;
    -[RoutePlanningSession removeObserver:](routePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
    v5 = v7;
  }

}

- (int64_t)_currentTransportType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater routePlanningSession](self, "routePlanningSession"));
LABEL_5:
    v6 = v4;
    v7 = objc_msgSend(v4, "currentTransportType");

    return (int64_t)v7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater navigationSession](self, "navigationSession"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater navigationSession](self, "navigationSession"));
    goto LABEL_5;
  }
  return 0;
}

- (void)_updateSettings
{
  void *v3;
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater carDisplayController](self, "carDisplayController"));
  v4 = objc_msgSend(v3, "isCurrentlyConnectedToAnyCarScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater settingsMonitor](self, "settingsMonitor"));
  objc_msgSend(v5, "setIsCarPlay:", v4);

  v6 = -[NavdDefaultsUpdater _currentTransportType](self, "_currentTransportType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater settingsMonitor](self, "settingsMonitor"));
  objc_msgSend(v7, "setTransportType:", v6);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater navigationService](self, "navigationService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDefaultsUpdater settingsMonitor](self, "settingsMonitor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userOptions"));
  objc_msgSend(v10, "changeUserOptions:", v9);

}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (CarDisplayController)carDisplayController
{
  return self->_carDisplayController;
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void)setNavigationSession:(id)a3
{
  objc_storeStrong((id *)&self->_navigationSession, a3);
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (NavigationSettingsMonitor)settingsMonitor
{
  return self->_settingsMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsMonitor, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_carDisplayController, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
