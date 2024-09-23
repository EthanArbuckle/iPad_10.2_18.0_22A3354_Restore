@implementation MTAAppController

- (void)windowSceneWillConnect:(id)a3
{
  -[MTAAppController initWindowAndViewControllersWithWindowScene:](self, "initWindowAndViewControllersWithWindowScene:", a3);
}

- (void)startedTest:(id)a3
{
  id v5;
  objc_super v6;

  objc_storeStrong((id *)&self->_currentTestName, a3);
  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTAAppController;
  -[MTAAppController startedTest:](&v6, "startedTest:", v5);

}

- (void)sceneWillEnterForeground:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  MTAAppController *v13;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneWillEnterForeground", (uint8_t *)&v12, 0xCu);
  }

  -[MTAAppController prepareTabBarControllerRestoreIndex:](self, "prepareTabBarControllerRestoreIndex:", 1);
  -[MTAAppController reloadTimerState](self, "reloadTimerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self->_tabBarController, "stopwatchViewController"));
  v7 = objc_msgSend(v6, "isViewLoaded");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self->_tabBarController, "stopwatchViewController"));
    objc_msgSend(v8, "reloadState");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortcutItems"));
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    -[MTATabBarController populateShortcutItems](self->_tabBarController, "populateShortcutItems");
  -[MTATabBarController restoreState](self->_tabBarController, "restoreState");
}

- (void)restoreLastSelectedTabIndex
{
  void *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("LAST_SELECTED_VIEW"));

  if ((uint64_t)v4 <= 0)
    v5 = 0;
  else
    v5 = (unint64_t)v4 - 1;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController viewControllers](self->_tabBarController, "viewControllers"));
  if (v5 >= (unint64_t)objc_msgSend(v7, "count"))
    v6 = 0;
  else
    v6 = v5;
  -[MTATabBarController setSelectedIndex:](self->_tabBarController, "setSelectedIndex:", v6);

}

- (void)reloadTimerState
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self->_tabBarController, "timerViewController"));
  v4 = objc_msgSend(v3, "isViewLoaded");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self->_tabBarController, "timerViewController"));
    objc_msgSend(v5, "reloadState");

  }
}

- (void)prepareTabBarControllerRestoreIndex:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000067A4;
  v3[3] = &unk_1000997B8;
  v3[4] = self;
  v4 = a3;
  if (qword_1000BFB98 != -1)
    dispatch_once(&qword_1000BFB98, v3);
}

- (void)initWindowAndViewControllersWithWindowScene:(id)a3
{
  id v4;
  MTASecureWindow *v5;
  MTASecureWindow *window;
  MTASecureWindow *v7;
  void *v8;
  MTASecureWindow *v9;
  void *v10;
  MTATabBarController *v11;
  MTATabBarController *tabBarController;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v14;

  v4 = a3;
  v5 = -[MTASecureWindow initWithWindowScene:]([MTASecureWindow alloc], "initWithWindowScene:", v4);

  window = self->_window;
  self->_window = v5;

  v7 = self->_window;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  -[MTASecureWindow setTintColor:](v7, "setTintColor:", v8);

  v9 = self->_window;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  -[MTASecureWindow setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[MTASecureWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  -[MTAAppController applyStyle](self, "applyStyle");
  v11 = -[MTATabBarController initWithAlarmManager:alarmDataSource:timerManager:timerDataSource:]([MTATabBarController alloc], "initWithAlarmManager:alarmDataSource:timerManager:timerDataSource:", self->_alarmManager, self->_alarmDataSource, self->_timerManager, self->_timerDataSource);
  tabBarController = self->_tabBarController;
  self->_tabBarController = v11;

  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "scheduleUserPreferencesCommit", MobileTimerUserPreferencesDirty, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "handleFrameworkPreferencesNotification:", MobileTimerFrameworkPreferencesChanged, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10001C464, MobileTimerUserPreferencesChanged, 0, (CFNotificationSuspensionBehavior)0);

}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  NSString *currentTestName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAAppController;
  -[MTAAppController finishedTest:extraResults:](&v6, "finishedTest:extraResults:", a3, a4);
  currentTestName = self->_currentTestName;
  self->_currentTestName = 0;

}

- (void)applyStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UITabBarAppearance *v31;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  objc_msgSend(v2, "setBarStyle:", 1);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  objc_msgSend(v3, "setTranslucent:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v4, "setTintColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UITabBar appearance](UITabBar, "appearance"));
  objc_msgSend(v6, "setBarStyle:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITabBar appearance](UITabBar, "appearance"));
  objc_msgSend(v7, "setTranslucent:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITabBar appearance](UITabBar, "appearance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v8, "setTintColor:", v9);

  v31 = objc_opt_new(UITabBarAppearance);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  -[UITabBarAppearance setBackgroundColor:](v31, "setBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UITabBar appearance](UITabBar, "appearance"));
  objc_msgSend(v11, "setScrollEdgeAppearance:", v31);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIToolbar appearance](UIToolbar, "appearance"));
  objc_msgSend(v12, "setBarStyle:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIToolbar appearance](UIToolbar, "appearance"));
  objc_msgSend(v13, "setTranslucent:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIToolbar appearance](UIToolbar, "appearance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v14, "setTintColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UITableView appearance](UITableView, "appearance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  objc_msgSend(v16, "setBackgroundColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UITableView appearance](UITableView, "appearance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellSeparatorColor](UIColor, "mtui_cellSeparatorColor"));
  objc_msgSend(v18, "setSeparatorColor:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UITableView appearance](UITableView, "appearance"));
  objc_msgSend(v20, "setIndicatorStyle:", 2);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UITableView appearance](UITableView, "appearance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v21, "setSectionIndexColor:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UITableView appearance](UITableView, "appearance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  objc_msgSend(v23, "setSectionIndexBackgroundColor:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UITableView appearance](UITableView, "appearance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v25, "setTintColor:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UITableViewCell appearance](UITableViewCell, "appearance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  objc_msgSend(v27, "setBackgroundColor:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton appearance](UIButton, "appearance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v29, "setTintColor:", v30);

}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  int v10;
  MTAAppController *v11;

  v5 = MTLogForCategory(8, a2, a3, a4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ application willFinishLaunchingWithOptions", (uint8_t *)&v10, 0xCu);
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v8, &stru_100099768);

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  MTAlarmManager *v7;
  MTAlarmManager *alarmManager;
  MTAlarmDataSource *v9;
  MTAlarmDataSource *alarmDataSource;
  MTTimerManager *v11;
  MTTimerManager *timerManager;
  MTSessionManager *v13;
  MTSessionManager *sessionManager;
  MTTimerDataSource *v15;
  MTTimerDataSource *timerDataSource;
  MTUserNotificationAppDelegate *v17;
  MTUserNotificationAppDelegate *notificationDelegate;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  MTAAppController *v24;

  v5 = MTLogForCategory(8, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543362;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ application didFinishLaunchingWithOptions", (uint8_t *)&v23, 0xCu);
  }

  v7 = objc_opt_new(MTAlarmManager);
  alarmManager = self->_alarmManager;
  self->_alarmManager = v7;

  v9 = (MTAlarmDataSource *)objc_msgSend(objc_alloc((Class)MTAlarmDataSource), "initWithAlarmManager:", self->_alarmManager);
  alarmDataSource = self->_alarmDataSource;
  self->_alarmDataSource = v9;

  v11 = objc_opt_new(MTTimerManager);
  timerManager = self->_timerManager;
  self->_timerManager = v11;

  v13 = objc_opt_new(MTSessionManager);
  sessionManager = self->_sessionManager;
  self->_sessionManager = v13;

  v15 = (MTTimerDataSource *)objc_msgSend(objc_alloc((Class)MTTimerDataSource), "initWithTimerManager:", self->_timerManager);
  timerDataSource = self->_timerDataSource;
  self->_timerDataSource = v15;

  v17 = objc_opt_new(MTUserNotificationAppDelegate);
  notificationDelegate = self->_notificationDelegate;
  self->_notificationDelegate = v17;

  +[UIView _naui_beginDebuggingAutolayout](UIView, "_naui_beginDebuggingAutolayout");
  +[ClockManager loadUserPreferences](ClockManager, "loadUserPreferences");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTAppIntentsProvider sharedInstance](MTAppIntentsProvider, "sharedInstance"));
  objc_msgSend(v19, "setDelegate:", self);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyWindow"));
  objc_msgSend(v21, "_accessibilitySetInterfaceStyleIntent:", 2);

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "configuration", a3));
  objc_msgSend(v5, "setDelegateClass:", objc_opt_class(MTASceneManager, v6));
  return v5;
}

- (BOOL)_canShowTextServices
{
  return 0;
}

- (UIViewController)containerViewController
{
  return (UIViewController *)self->_tabBarController;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)MTAAppController;
  -[MTAAppController dealloc](&v4, "dealloc");
}

- (void)sceneDidBecomeActive:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  MTSessionManager *sessionManager;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  MTAAppController *v37;
  __int16 v38;
  MTSessionManager *v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneDidBecomeActive", buf, 0xCu);
  }

  if (+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController viewControllers](self->_tabBarController, "viewControllers"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "topViewController"));
          objc_msgSend(v12, "setTitle:", &stru_10009A4D0);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationItem"));
          objc_msgSend(v13, "setLeftBarButtonItem:", 0);

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationItem"));
          objc_msgSend(v14, "setRightBarButtonItem:", 0);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
          objc_msgSend(v15, "setHidden:", 1);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v9);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController view](self->_tabBarController, "view", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subviews"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subviews"));

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
          if ((objc_opt_respondsToSelector(v24, "_setSelected:") & 1) != 0
            && (objc_opt_respondsToSelector(v24, "_showSelectedIndicator:changeSelection:") & 1) != 0)
          {
            objc_msgSend(v24, "_setSelected:", 0);
            objc_msgSend(v24, "_showSelectedIndicator:changeSelection:", 0, 0);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v21);
    }

  }
  v25 = MTLogForCategory(8, v6);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    sessionManager = self->_sessionManager;
    *(_DWORD *)buf = 138543618;
    v37 = self;
    v38 = 2114;
    v39 = sessionManager;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ ending session with manager: %{public}@", buf, 0x16u);
  }

  -[MTSessionManager endAlertingSession](self->_sessionManager, "endAlertingSession");
}

- (void)scene:(id)a3 openURL:(id)a4 sourceApplication:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceSpecifier"));
  v8 = objc_msgSend(v6, "mtClockAppSection");

  if (v8 != (id)-1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C8F0;
    block[3] = &unk_100099790;
    block[4] = self;
    v10 = v7;
    v11 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_handleDefaultSpecifierForSection:(int64_t)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v4 = -[MTATabBarController tabIndexForAppSection:](self->_tabBarController, "tabIndexForAppSection:", a3);
  -[MTATabBarController setSelectedIndex:](self->_tabBarController, "setSelectedIndex:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4 + 1));
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("LAST_SELECTED_VIEW"));

}

- (void)_handleEditSpecifierForSection:(int64_t)a3
{
  if (a3 == 2)
  {
    -[MTAAppController _handleDefaultSpecifierForSection:](self, "_handleDefaultSpecifierForSection:");
    -[MTATabBarController showSleepView](self->_tabBarController, "showSleepView");
  }
}

- (void)_handleAddSpecifierForSection:(int64_t)a3
{
  if (a3 == 4)
  {
    -[MTAAppController _handleDefaultSpecifierForSection:](self, "_handleDefaultSpecifierForSection:");
    -[MTATabBarController showAddView](self->_tabBarController, "showAddView");
  }
}

- (int64_t)interfaceOrientation
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTASecureWindow windowScene](self->_window, "windowScene"));
  v3 = objc_msgSend(v2, "interfaceOrientation");

  return (int64_t)v3;
}

- (void)saveState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)-[MTATabBarController selectedIndex](self->_tabBarController, "selectedIndex") + 1));
  CFPreferencesSetAppValue(CFSTR("LAST_SELECTED_VIEW"), v3, MobileTimerAppID);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
  objc_msgSend(v4, "saveState");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self->_tabBarController, "alarmViewController"));
  objc_msgSend(v5, "saveState");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self->_tabBarController, "stopwatchViewController"));
  objc_msgSend(v6, "saveState");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self->_tabBarController, "timerViewController"));
  objc_msgSend(v7, "saveState");

  -[MTAAppController commitUserPreferences](self, "commitUserPreferences");
  CPLoggingFlush(-1);
}

- (void)cancelScheduledUserPreferencesCommit
{
  NSTimer *userPreferencesCommitTimer;

  -[NSTimer invalidate](self->_userPreferencesCommitTimer, "invalidate");
  userPreferencesCommitTimer = self->_userPreferencesCommitTimer;
  self->_userPreferencesCommitTimer = 0;

}

- (void)scheduleUserPreferencesCommit
{
  NSTimer *v3;
  NSTimer *userPreferencesCommitTimer;

  -[MTAAppController cancelScheduledUserPreferencesCommit](self, "cancelScheduledUserPreferencesCommit");
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "commitUserPreferences", 0, 0, 3.0));
  userPreferencesCommitTimer = self->_userPreferencesCommitTimer;
  self->_userPreferencesCommitTimer = v3;

}

- (void)commitUserPreferences
{
  -[MTAAppController cancelScheduledUserPreferencesCommit](self, "cancelScheduledUserPreferencesCommit");
  CFPreferencesAppSynchronize(MobileTimerAppID);
}

- (void)handleFrameworkPreferencesNotification:(id)a3
{
  -[MTAAppController handleUserPreferencesChanged](self, "handleUserPreferencesChanged", a3);
}

- (void)handleUserPreferencesChanged
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
  v4 = objc_msgSend(v3, "isViewLoaded");

  if (!self->_userPreferencesCommitTimer)
  {
    +[ClockManager loadUserPreferences](ClockManager, "loadUserPreferences");
    if (v4)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
      if (objc_msgSend(v6, "checkIfCitiesModified"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
        objc_msgSend(v5, "reloadState");

      }
    }
  }
}

- (void)applicationWillTerminate:(id)a3
{
  -[MTAAppController sceneDidEnterBackground:](self, "sceneDidEnterBackground:", 0);
}

- (BOOL)_runSelectTest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  if (-[NSString isEqualToString:](self->_currentTestName, "isEqualToString:", CFSTR("SelectAlarm")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self->_tabBarController, "alarmViewController"));
  }
  else if (-[NSString isEqualToString:](self->_currentTestName, "isEqualToString:", CFSTR("SelectWorldClock")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
  }
  else if (-[NSString isEqualToString:](self->_currentTestName, "isEqualToString:", CFSTR("SelectStopwatch")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self->_tabBarController, "stopwatchViewController"));
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_currentTestName, "isEqualToString:", CFSTR("SelectTimer")))
      goto LABEL_13;
    v5 = objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self->_tabBarController, "timerViewController"));
  }
  v6 = (void *)v5;
  if (v5)
  {
    if ((objc_opt_respondsToSelector(v5, "setupForTest:options:") & 1) != 0)
      objc_msgSend(v6, "setupForTest:options:", self->_currentTestName, v4);
    -[MTAAppController startedTest:](self, "startedTest:", self->_currentTestName);
    -[MTAAppController _selectViewController:](self, "_selectViewController:", v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001CF4C;
    block[3] = &unk_1000997E0;
    block[4] = self;
    v10 = v6;
    v11 = v4;
    v7 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
LABEL_13:

  return 1;
}

- (BOOL)_runScrollTest:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  NSString *currentTestName;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("natural")));
  if (objc_msgSend(v5, "BOOLValue"))
    v6 = +[RPTTestRunner isRecapAvailable](RPTTestRunner, "isRecapAvailable");
  else
    v6 = 0;

  if (-[NSString containsString:](self->_currentTestName, "containsString:", CFSTR("ScrollAlarm")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self->_tabBarController, "alarmViewController"));
    v8 = 0;
    if (!v7)
      goto LABEL_22;
  }
  else
  {
    if (!-[NSString containsString:](self->_currentTestName, "containsString:", CFSTR("ScrollWorldClock")))
      goto LABEL_22;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
    if (-[NSString containsString:](self->_currentTestName, "containsString:", CFSTR("Edit")))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
      v8 = 1;
      objc_msgSend(v9, "setEditing:animated:", 1, 1);

      if (!v7)
        goto LABEL_22;
    }
    else
    {
      v8 = 0;
      if (!v7)
        goto LABEL_22;
    }
  }
  if ((objc_opt_respondsToSelector(v7, "setupForTest:options:") & 1) != 0)
    objc_msgSend(v7, "setupForTest:options:", self->_currentTestName, v4);
  -[MTAAppController _selectViewController:](self, "_selectViewController:", v7);
  -[MTAAppController _spinMainRunLoop](self, "_spinMainRunLoop");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentScrollView"));
  if (v6)
  {
    v11 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollView:completionHandler:", self->_currentTestName, v10, 0);
    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v11);
  }
  else
  {
    currentTestName = self->_currentTestName;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));
    v13 = objc_msgSend(v11, "intValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("offset")));
    objc_msgSend(v10, "_performScrollTest:iterations:delta:", currentTestName, v13, objc_msgSend(v14, "intValue"));

  }
  if (v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
    objc_msgSend(v15, "setEditing:animated:", 0, 0);

  }
  if ((objc_opt_respondsToSelector(v7, "teardownForTest:options:") & 1) != 0)
    objc_msgSend(v7, "teardownForTest:options:", self->_currentTestName, v4);

LABEL_22:
  return 1;
}

- (void)_spinMainRunLoop
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
  objc_msgSend(v3, "runUntilDate:", v2);

}

- (void)_selectViewController:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  MTAAppController *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController viewControllers](self->_tabBarController, "viewControllers"));
  v6 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      v17 = &v8[(_QWORD)v9];
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v5);
        v12 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        if (v12 == v4
          || (v13 = objc_opt_class(UINavigationController, v7), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewControllers")),
              v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0)),
              v15,
              v14,
              v15 == v4))
        {

          if (&v11[(_QWORD)v9] != (char *)-1)
            -[MTATabBarController setSelectedIndex:](v16->_tabBarController, "setSelectedIndex:");
          goto LABEL_14;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v17;
      if (v8)
        continue;
      break;
    }
  }

LABEL_14:
}

- (BOOL)_runRotationTest
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = UIWindowDidRotateNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](UIWindow, "keyWindow"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_windowDidRotate:", v4, v5);

  -[MTAAppController rotateIfNeeded:](self, "rotateIfNeeded:", 1);
  -[MTAAppController _spinMainRunLoop](self, "_spinMainRunLoop");
  -[MTAAppController startedTest:](self, "startedTest:", self->_currentTestName);
  -[MTAAppController rotateIfNeeded:](self, "rotateIfNeeded:", 3);
  return 1;
}

- (BOOL)_runResizeTest
{
  id v3;
  NSString *currentTestName;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)RPTResizeTestParameters);
  currentTestName = self->_currentTestName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](UIWindow, "keyWindow"));
  v6 = objc_msgSend(v3, "initWithTestName:window:completionHandler:", currentTestName, v5, 0);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v6);
  return 1;
}

- (void)_windowDidRotate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  MTAAppController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  if (self->_currentTestName)
  {
    v12 = v4;
    if (self->_iterations)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](UIWindow, "keyWindow"));
      v6 = objc_msgSend(v5, "interfaceOrientation");

      if (v6 == (id)3)
      {
        --self->_iterations;
        v7 = self;
        v8 = 1;
      }
      else
      {
        v7 = self;
        v8 = 3;
      }
      -[MTAAppController rotateIfNeeded:](v7, "rotateIfNeeded:", v8);
    }
    else
    {
      -[MTAAppController finishedTest:extraResults:](self, "finishedTest:extraResults:");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v10 = UIWindowDidRotateNotification;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](UIWindow, "keyWindow"));
      objc_msgSend(v9, "removeObserver:name:object:", self, v10, v11);

    }
    v4 = v12;
  }

}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;

  v5 = a4;
  v7 = MTLogForCategory(8, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will Continue with Activity Type:%@", (uint8_t *)&v11, 0xCu);
  }

  -[MTAAppController prepareTabBarControllerRestoreIndex:](self, "prepareTabBarControllerRestoreIndex:", 0);
  if (qword_1000BFBA0 != -1)
    dispatch_once(&qword_1000BFBA0, &stru_100099800);
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.clock.worldclock")))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.clock.alarm")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.clock.wakealarm")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.clock.bedtime")))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self->_tabBarController, "alarmViewController"));
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.clock.stopwatch")))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self->_tabBarController, "stopwatchViewController"));
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.clock.timer")))
      goto LABEL_12;
    v9 = objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self->_tabBarController, "timerViewController"));
  }
  v10 = (void *)v9;
  -[MTAAppController _selectViewController:](self, "_selectViewController:", v9);

LABEL_12:
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "intent"));

  if (v6)
  {
    -[MTATabBarController performActionForIntent:](self->_tabBarController, "performActionForIntent:", v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.clock.worldclock"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
      if ((objc_opt_respondsToSelector(v9, "restoreWithUserActivity:") & 1) != 0)
        objc_msgSend(v9, "restoreWithUserActivity:", v10);

    }
  }

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a5;
  v8 = MTLogForCategory(8, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_1000651AC((uint64_t)self, (uint64_t)v6, v9);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  objc_msgSend(v6, "bypass");

  -[MTAAppController prepareTabBarControllerRestoreIndex:](self, "prepareTabBarControllerRestoreIndex:", 0);
  -[MTATabBarController performActionForShortcutItem:](self->_tabBarController, "performActionForShortcutItem:", v7);

}

- (void)appIntentsProvider:(id)a3 didSelectTab:(unint64_t)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  const char *v19;

  v7 = a3;
  switch(a4)
  {
    case 0uLL:
      v8 = MTLogForCategory(8, v6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[MTAAppController appIntentsProvider:didSelectTab:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Handling AppIntents action for MTProviderTabClock", (uint8_t *)&v18, 0xCu);
      }

      v10 = objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
      goto LABEL_14;
    case 1uLL:
      v11 = MTLogForCategory(8, v6);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[MTAAppController appIntentsProvider:didSelectTab:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Handling AppIntents action for MTProviderTabAlarm", (uint8_t *)&v18, 0xCu);
      }

      v10 = objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self->_tabBarController, "alarmViewController"));
      goto LABEL_14;
    case 2uLL:
      v13 = MTLogForCategory(8, v6);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[MTAAppController appIntentsProvider:didSelectTab:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Handling AppIntents action for MTProviderTabStopwatch", (uint8_t *)&v18, 0xCu);
      }

      v10 = objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self->_tabBarController, "stopwatchViewController"));
      goto LABEL_14;
    case 3uLL:
      v15 = MTLogForCategory(8, v6);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[MTAAppController appIntentsProvider:didSelectTab:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Handling AppIntents action for MTProviderTabTimer", (uint8_t *)&v18, 0xCu);
      }

      v10 = objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self->_tabBarController, "timerViewController"));
LABEL_14:
      v17 = (void *)v10;
      -[MTAAppController _selectViewController:](self, "_selectViewController:", v10);

      break;
    default:
      break;
  }

}

- (void)didAddNewWorldClockWithName:(id)a3 provider:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  MTAAppController *v13;
  __int16 v14;
  id v15;

  v5 = a3;
  v7 = MTLogForCategory(8, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: didAddNewWordClockWithName: %{public}@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001DE6C;
  v10[3] = &unk_1000993B8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

}

- (void)didRemoveWorldClockWithName:(id)a3 provider:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  MTAAppController *v13;
  __int16 v14;
  id v15;

  v5 = a3;
  v7 = MTLogForCategory(8, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: didRemoveWorldClockWithName: %{public}@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001E19C;
  v10[3] = &unk_1000993B8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  BOOL v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("iterations")));
  self->_iterations = (int64_t)objc_msgSend(v9, "integerValue");

  objc_storeStrong((id *)&self->_currentTestName, a3);
  if (objc_msgSend(v7, "rangeOfString:", CFSTR("Scroll")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = -[MTAAppController _runScrollTest:](self, "_runScrollTest:", v8);
LABEL_23:
    v18 = v15;
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "rangeOfString:", CFSTR("Select")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = -[MTAAppController _runSelectTest:](self, "_runSelectTest:", v8);
    goto LABEL_23;
  }
  v10 = objc_msgSend(v7, "hasPrefix:", CFSTR("Rotate"));
  if ((v10 & 1) == 0)
  {
    v10 = objc_msgSend(v7, "hasPrefix:", CFSTR("Resize"));
    if (!(_DWORD)v10)
      goto LABEL_22;
  }
  if ((MTUIIsPadIdiom(v10, v11) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 != (id)5)
      goto LABEL_22;
  }
  if (objc_msgSend(v7, "hasSuffix:", CFSTR("WorldClock")))
  {
    v14 = objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockViewController](self->_tabBarController, "worldClockViewController"));
  }
  else if (objc_msgSend(v7, "hasSuffix:", CFSTR("Alarm")))
  {
    v14 = objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self->_tabBarController, "alarmViewController"));
  }
  else if (objc_msgSend(v7, "hasSuffix:", CFSTR("Stopwatch")))
  {
    v14 = objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self->_tabBarController, "stopwatchViewController"));
  }
  else
  {
    if (!objc_msgSend(v7, "hasSuffix:", CFSTR("Timer")))
    {
LABEL_22:
      v20.receiver = self;
      v20.super_class = (Class)MTAAppController;
      v15 = -[MTAAppController runTest:options:](&v20, "runTest:options:", v7, v8);
      goto LABEL_23;
    }
    v14 = objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self->_tabBarController, "timerViewController"));
  }
  v16 = (void *)v14;
  if (!v14)
    goto LABEL_22;
  if ((objc_opt_respondsToSelector(v14, "setupForTest:options:") & 1) != 0)
    objc_msgSend(v16, "setupForTest:options:", v7, v8);
  -[MTAAppController _selectViewController:](self, "_selectViewController:", v16);
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("Rotate")))
  {
    v17 = -[MTAAppController _runRotationTest](self, "_runRotationTest");
  }
  else
  {
    if (!objc_msgSend(v7, "hasPrefix:", CFSTR("Resize")))
    {
      v18 = 0;
      goto LABEL_29;
    }
    v17 = -[MTAAppController _runResizeTest](self, "_runResizeTest");
  }
  v18 = v17;
LABEL_29:
  if ((objc_opt_respondsToSelector(v16, "teardownForTest:options:") & 1) != 0)
    objc_msgSend(v16, "teardownForTest:options:", v7, v8);

LABEL_24:
  return v18;
}

- (double)visibleViewHeight
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController viewControllers](self->_tabBarController, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
  if (v4)
  {
    v5 = +[MTAUtilities isLandscape](MTAUtilities, "isLandscape");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v6, "frame");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v9, "frame");
    v11 = v10;

    if (v8 >= v11)
      v12 = v11;
    else
      v12 = v8;
    if (v8 >= v11)
      v13 = v8;
    else
      v13 = v11;
    if (v5)
      v14 = v12;
    else
      v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tabBarController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tabBar"));
    objc_msgSend(v16, "frame");
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationBar"));
    objc_msgSend(v20, "frame");
    v22 = v21;

    v23 = v14 - v18 - v22;
  }
  else
  {
    v23 = 0.0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTestName, 0);
  objc_storeStrong((id *)&self->_timerDataSource, 0);
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_notificationDelegate, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_userPreferencesCommitTimer, 0);
}

@end
