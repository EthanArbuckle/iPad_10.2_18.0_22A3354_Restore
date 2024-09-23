@implementation SettingsController

- (SettingsController)init
{
  SettingsController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SettingsController;
  v2 = -[SettingsController init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v2->_showsEnvironments = objc_msgSend(v3, "BOOLForKey:", CFSTR("ShowEnvironmentInfoInSettings"));

    v2->_showsRadarComposer = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_userDefaultsDidChange", NSUserDefaultsDidChangeNotification, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_offlineStateChanged", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  }
  return v2;
}

- (IOSBasedChromeViewController)chrome
{
  IOSBasedChromeViewController **p_chrome;

  p_chrome = &self->_chrome;

  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)p_chrome);
}

- (void)_userDefaultsDidChange
{
  void *v3;
  unsigned int v4;
  int showsEnvironments;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ShowEnvironmentInfoInSettings"));

  showsEnvironments = self->_showsEnvironments;
  self->_showsEnvironments = v4;
  if (showsEnvironments != v4)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SettingsControllerDidChange"), self);

  }
}

- (void)_offlineStateChanged
{
  int64_t v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (objc_msgSend(v4, "isUsingOfflineMaps"))
  {
    v3 = -[SettingsController selectedViewMode](self, "selectedViewMode");

    if (v3 == 2)
      -[SettingsController setMapViewMode:animated:](self, "setMapViewMode:animated:", 0, 0);
  }
  else
  {

  }
}

- (BOOL)showsLabels
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v3 = objc_msgSend(v2, "displayedViewMode");

  return ((unint64_t)v3 + 1 < 9) & (0x157u >> ((_BYTE)v3 + 1));
}

- (BOOL)showsTraffic
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));
  v4 = objc_msgSend(v3, "showsTraffic");

  return v4;
}

- (void)toggleLabels
{
  uint64_t v3;

  if (-[SettingsController canToggleLabels](self, "canToggleLabels"))
  {
    v3 = -[SettingsController showsLabels](self, "showsLabels") ^ 1;
    -[SettingsController setShouldChangeViewModeForLabels:](self, "setShouldChangeViewModeForLabels:", 1);
    -[SettingsController setShowsLabels:](self, "setShowsLabels:", v3);
    -[SettingsController setShouldChangeViewModeForLabels:](self, "setShouldChangeViewModeForLabels:", 0);
  }
}

- (void)toggleTraffic
{
  unsigned __int8 v3;
  unsigned int v4;
  char v5;
  uint64_t v6;

  if (-[SettingsController canToggleTraffic](self, "canToggleTraffic"))
  {
    v3 = -[SettingsController showsLabels](self, "showsLabels");
    v4 = -[SettingsController showsTraffic](self, "showsTraffic");
    v5 = v4;
    v6 = v4 ^ 1;
    -[SettingsController setShouldChangeViewModeForTraffic:](self, "setShouldChangeViewModeForTraffic:", 1);
    -[SettingsController setShowsTraffic:](self, "setShowsTraffic:", v6);
    -[SettingsController setShouldChangeViewModeForTraffic:](self, "setShouldChangeViewModeForTraffic:", 0);
    if ((v5 & 1) == 0 && (v3 & 1) == 0)
      -[SettingsController setShowsLabels:](self, "setShowsLabels:", 1);
  }
}

- (void)toggleWeather
{
  +[MapsSettings setShowsWeather:](MapsSettings, "setShowsWeather:", -[SettingsController showsWeather](self, "showsWeather") ^ 1);
}

- (void)toggleAirQualityIndex
{
  +[MapsSettings setShowsAirQualityIndex:](MapsSettings, "setShowsAirQualityIndex:", -[SettingsController showsAirQualityIndex](self, "showsAirQualityIndex") ^ 1);
}

- (BOOL)showsWeather
{
  return +[MapsSettings showsWeather](MapsSettings, "showsWeather");
}

- (BOOL)showsAirQualityIndex
{
  return +[MapsSettings showsAirQualityIndex](MapsSettings, "showsAirQualityIndex");
}

- (MKMapAttribution)mapAttribution
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));
  v13[0] = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system11](UIFont, "system11"));
  v14[0] = v8;
  v13[1] = NSForegroundColorAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v14[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapAttributionWithStringAttributes:underlineText:", v10, 1));

  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v3);
  return (MKMapAttribution *)v11;
}

- (BOOL)canToggleLabels
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v3 = objc_msgSend(v2, "displayedViewMode");

  return (((unint64_t)v3 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (BOOL)canToggleTraffic
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v3 = objc_msgSend(v2, "displayedViewMode");

  return (((unint64_t)v3 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (void)proceedToEnvironmentsSelector
{
  id v2;
  EnvironmentsViewController *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)UINavigationController);
  v3 = -[EnvironmentsViewController initWithStyle:]([EnvironmentsViewController alloc], "initWithStyle:", 1);
  v5 = objc_msgSend(v2, "initWithRootViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v4, "presentViewController:animated:", v5, 1);

}

- (void)_openURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "baseActionCoordinator"));

  objc_msgSend(v7, "viewController:openURL:", 0, v4);
}

- (void)presentAttributions
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController mapAttribution](self, "mapAttribution"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "plainTextFileURL"));
  if (GEOConfigGetBOOL(MapsConfig_AllowPlainTextAttribution, off_1014B5038))
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver")), v7 = objc_msgSend(v6, "isNetworkReachable"), v6, (v7 & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
    if (v8)
      -[SettingsController _openURL:](self, "_openURL:", v8);

  }
  else
  {
    v9 = sub_10043181C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Attempting to present attribution details, but network is offline. Presenting cached plain-text version instead", v14, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "baseActionCoordinator"));

    objc_msgSend(v13, "viewController:openPlainTextFileURL:", 0, v4);
  }

}

- (void)setShowsLabels:(BOOL)a3
{
  -[SettingsController setUserDesiresLabels:shouldForceUpdateMapViewDisplayOptions:](self, "setUserDesiresLabels:shouldForceUpdateMapViewDisplayOptions:", a3, 1);
}

- (void)setShowsTraffic:(BOOL)a3
{
  -[SettingsController setUserDesiresTraffic:shouldForceUpdateMapViewDisplayOptions:](self, "setUserDesiresTraffic:shouldForceUpdateMapViewDisplayOptions:", a3, 1);
}

- (BOOL)userDesiresTraffic
{
  return +[MapsSettings userDesiresTraffic](MapsSettings, "userDesiresTraffic");
}

- (BOOL)userDesiresLabels
{
  return +[MapsSettings userDesiresLabels](MapsSettings, "userDesiresLabels");
}

- (void)setUserDesiresLabels:(BOOL)a3 shouldForceUpdateMapViewDisplayOptions:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  if (-[SettingsController userDesiresLabels](self, "userDesiresLabels") == a3)
  {
    if (!v4)
      return;
  }
  else
  {
    +[MapsSettings setUserDesiresLabels:](MapsSettings, "setUserDesiresLabels:", v5);
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  objc_msgSend(v7, "updateMapViewDisplayOptions");

}

- (void)setUserDesiresLabels:(BOOL)a3
{
  -[SettingsController setUserDesiresLabels:shouldForceUpdateMapViewDisplayOptions:](self, "setUserDesiresLabels:shouldForceUpdateMapViewDisplayOptions:", a3, 0);
}

- (void)setUserDesiresTraffic:(BOOL)a3 shouldForceUpdateMapViewDisplayOptions:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  if (-[SettingsController userDesiresTraffic](self, "userDesiresTraffic") == a3)
  {
    if (!v4)
      return;
  }
  else
  {
    +[MapsSettings setUserDesiresTraffic:](MapsSettings, "setUserDesiresTraffic:", v5);
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  objc_msgSend(v7, "updateMapViewDisplayOptions");

}

- (void)setUserDesiresTraffic:(BOOL)a3
{
  -[SettingsController setUserDesiresTraffic:shouldForceUpdateMapViewDisplayOptions:](self, "setUserDesiresTraffic:shouldForceUpdateMapViewDisplayOptions:", a3, 0);
}

- (BOOL)in3DMode
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  v5 = objc_msgSend(v4, "_isPitched");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));
  LOBYTE(v4) = objc_msgSend(v7, "_canEnter3DMode") & v5;

  return (char)v4;
}

- (int64_t)mapViewMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v3 = objc_msgSend(v2, "displayedViewMode");

  return (int64_t)v3;
}

- (void)setMapViewMode:(int64_t)a3
{
  -[SettingsController setMapViewMode:animated:](self, "setMapViewMode:animated:", a3, 1);
}

- (void)setMapViewMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v4 = a4;
  self->_userRequestingViewModeChange = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topIOSBasedContext"));

  v9 = objc_opt_respondsToSelector(v8, "updateViewMode:animated:");
  v10 = sub_10043181C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if ((v9 & 1) != 0)
  {
    if (v12)
    {
      v15 = 138543362;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updating view mode on context %{public}@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(v8, "updateViewMode:animated:", a3, v4);
  }
  else
  {
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
      v15 = 138543362;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updating view mode on chrome %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
    objc_msgSend(v14, "updateViewMode:animated:", a3, v4);

  }
  self->_userRequestingViewModeChange = 0;

}

- (NSArray)selectableViewModes
{
  return (NSArray *)&off_101273E18;
}

- (int64_t)selectedViewMode
{
  unint64_t v2;
  int64_t v3;

  v2 = -[SettingsController mapViewMode](self, "mapViewMode");
  if (v2 > 7)
    v3 = 0;
  else
    v3 = qword_100E3C290[v2];
  if (((v3 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
    return v3;
  else
    return 2;
}

- (void)setSelectedViewMode:(int64_t)a3
{
  -[SettingsController setSelectedViewMode:animated:](self, "setSelectedViewMode:animated:", a3, 0);
}

- (void)setSelectedViewMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  int64_t v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v4 = a4;
  if ((unint64_t)a3 > 7)
    v6 = 0;
  else
    v6 = qword_100E3C290[a3];
  if (((v6 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
    v7 = v6;
  else
    v7 = 2;
  +[MapsSettings setSelectedViewMode:](MapsSettings, "setSelectedViewMode:", v7);
  v8 = -[SettingsController bestMapViewModeForViewMode:](self, "bestMapViewModeForViewMode:", v7);
  v9 = sub_10043181C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 < 8 && ((0xEFu >> v7) & 1) != 0)
      v11 = *(&off_1011D9038 + v7);
    else
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v7));
    v12 = v11;
    v13 = v8 + 1;
    if ((unint64_t)(v8 + 1) < 9 && ((0x1DFu >> v13) & 1) != 0)
      v14 = *(&off_1011D9078 + v13);
    else
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v8));
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2114;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Selected view mode was %{public}@; setting best view mode %{public}@",
      buf,
      0x16u);

  }
  -[SettingsController setMapViewMode:animated:](self, "setMapViewMode:animated:", v8, v4);
}

- (int64_t)bestMapViewModeForViewMode:(int64_t)a3
{
  return -[SettingsController bestMapViewModeForViewMode:ignoringLabelPreference:](self, "bestMapViewModeForViewMode:ignoringLabelPreference:", a3, 0);
}

- (int64_t)bestMapViewModeForViewMode:(int64_t)a3 ignoringLabelPreference:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v7;
  _BOOL4 v8;
  unsigned int v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;

  v4 = a4;
  v7 = -[SettingsController userDesiresLabels](self, "userDesiresLabels");
  if (v4)
    v8 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  else
    v8 = v7;
  if ((objc_msgSend((id)objc_opt_class(self), "deviceSupportsGlobe") & 1) != 0)
    v9 = 1;
  else
    v9 = -[SettingsController in3DMode](self, "in3DMode");
  v10 = 0;
  if ((unint64_t)a3 <= 7 && a3 != 4)
  {
    v11 = 1;
    if (!v8)
      v11 = 2;
    v12 = 5;
    if (!v8)
      v12 = 6;
    if (v9)
      v11 = v12;
    if (((a3 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
      return a3;
    else
      return v11;
  }
  return v10;
}

+ (BOOL)deviceSupportsGlobe
{
  return +[VKMapView _globeIsEnabled](VKMapView, "_globeIsEnabled");
}

- (SettingsTipController)settingsTipController
{
  void *v3;
  uint64_t v4;
  SettingsTipController *v5;
  void *v6;
  SettingsTipController *v7;
  SettingsTipController *settingsTipController;

  if (!self->_settingsTipController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
    v4 = sub_1002A8AA0(v3);

    if (v4 != 5)
    {
      v5 = [SettingsTipController alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsController chrome](self, "chrome"));
      v7 = -[SettingsTipController initWithChromeViewController:](v5, "initWithChromeViewController:", v6);
      settingsTipController = self->_settingsTipController;
      self->_settingsTipController = v7;

    }
  }
  return self->_settingsTipController;
}

- (void)setChrome:(id)a3
{
  objc_storeWeak((id *)&self->_chrome, a3);
}

- (BOOL)showsEnvironments
{
  return self->_showsEnvironments;
}

- (BOOL)showsRadarComposer
{
  return self->_showsRadarComposer;
}

- (BOOL)shouldChangeViewModeForLabels
{
  return self->_shouldChangeViewModeForLabels;
}

- (void)setShouldChangeViewModeForLabels:(BOOL)a3
{
  self->_shouldChangeViewModeForLabels = a3;
}

- (BOOL)shouldChangeViewModeForTraffic
{
  return self->_shouldChangeViewModeForTraffic;
}

- (void)setShouldChangeViewModeForTraffic:(BOOL)a3
{
  self->_shouldChangeViewModeForTraffic = a3;
}

- (BOOL)userRequestingViewModeChange
{
  return self->_userRequestingViewModeChange;
}

- (void)setUserRequestingViewModeChange:(BOOL)a3
{
  self->_userRequestingViewModeChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsTipController, 0);
  objc_destroyWeak((id *)&self->_chrome);
}

@end
