@implementation CalendarSceneManager

- (void)_setupDebugMenu:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E6944;
  v4[3] = &unk_1001B2538;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "statusBarManager"));
  objc_msgSend(v3, "setDebugMenuHandler:", v4);

}

- (void)__buildCalendarSyncHashesForCalendars:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[EKPreferences shared](EKPreferences, "shared"));
  objc_msgSend(v4, "setDeselectedCalendars:reason:", v3, CFSTR("restoring selected calendars from preferences"));

}

- (double)_resumeToTodayTimeout
{
  void *v2;
  unsigned int v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v3 = objc_msgSend(v2, "isShortResumeToTodayTimeout");

  result = 480.0;
  if (v3)
    return 5.0;
  return result;
}

+ (void)setApplicationLastActiveTimeProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedState"));
  objc_msgSend(v5, "setApplicationLastActiveTimeProvider:", v4);

}

- (id)_setUpModel
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Application createNewCalendarModel](Application, "createNewCalendarModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _sharedState](CalendarSceneManager, "_sharedState"));
  v5 = objc_msgSend(v4, "extendedLaunchComplete");

  if (v5)
  {
    objc_msgSend(v3, "startNotificationMonitor");
    -[CUIKCalendarModel checkLocationAuthorizationAndAllowEventLocationPrediction](self->_model, "checkLocationAuthorizationAndAllowEventLocationPrediction");
  }
  return v3;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  dispatch_time_t v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneWillEnterForeground: %@", buf, 0xCu);
  }
  -[MainWindowRootViewController willEnterForeground](self->_rootViewController, "willEnterForeground");
  -[RootNavigationController willEnterForeground](self->_rootNavigationController, "willEnterForeground");
  +[EKUIAppReviewUtils applicationDidForeground](EKUIAppReviewUtils, "applicationDidForeground");
  v6 = 1;
  if ((byte_1001F6518 & 1) == 0)
  {
    byte_1001F6518 = 1;
    v6 = 0;
  }
  CUIKITriggerReminderSync(v6);
  v7 = dispatch_time(0, 2000000000);
  global_queue = dispatch_get_global_queue(17, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7958;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v7, v9, block);

}

- (void)_collectStats:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EB194;
  v4[3] = &unk_1001B5480;
  v5 = a3;
  v3 = v5;
  CalAnalyticsSendEventLazy(CFSTR("MobileCalActivated"), v4);

}

- (void)_topMainViewControllerCompletedExtendedLaunch:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 sceneHasCompletedExtendedLaunch;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MainViewControllerDidCompleteExtendedLaunchNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _sharedState](CalendarSceneManager, "_sharedState"));
  if (!objc_msgSend(v5, "extendedLaunchComplete"))
  {

LABEL_5:
    -[CalendarSceneManager _extendedLaunchDidComplete](self, "_extendedLaunchDidComplete");
    goto LABEL_6;
  }
  sceneHasCompletedExtendedLaunch = self->_sceneHasCompletedExtendedLaunch;

  if (!sceneHasCompletedExtendedLaunch)
    goto LABEL_5;
LABEL_6:
  v7 = (id)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _sharedState](CalendarSceneManager, "_sharedState"));
  objc_msgSend(v7, "setExtendedLaunchComplete:", 1);

}

+ (id)_sharedState
{
  if (qword_1001F6508 != -1)
    dispatch_once(&qword_1001F6508, &stru_1001B5370);
  return (id)qword_1001F6500;
}

+ (id)_applicationLastActiveTime
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationLastActiveTimeProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationLastActiveTime"));

  return v4;
}

- (void)_displayedOccurrencesChangedForTheFirstTime:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[5];

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self->_rootNavigationController, "topMainViewControllerContainer", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentChildViewController"));
  if ((objc_msgSend(v4, "handlesNotifyOnExtendedLaunchCompletion") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _sharedState](CalendarSceneManager, "_sharedState"));
    v6 = objc_msgSend(v5, "extendedLaunchComplete");

    if ((v6 & 1) != 0)
    {
      if (!self->_sceneHasCompletedExtendedLaunch)
        -[CalendarSceneManager _extendedLaunchDidComplete](self, "_extendedLaunchDidComplete");
    }
    else
    {
      -[CalendarSceneManager _extendedLaunchDidComplete](self, "_extendedLaunchDidComplete");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000E6FBC;
      block[3] = &unk_1001B2538;
      block[4] = self;
      if (qword_1001F64F8 != -1)
        dispatch_once(&qword_1001F64F8, block);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _sharedState](CalendarSceneManager, "_sharedState"));
    objc_msgSend(v7, "setExtendedLaunchComplete:", 1);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, CUIKCalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification, 0);

}

- (BOOL)_areMultipleScenesOpen
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "openSessions"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "role", (_QWORD)v14));
        v11 = objc_msgSend(v10, "isEqualToString:", UIWindowSceneSessionRoleApplication);

        v7 += v11;
        if (v7 > 1)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)_shouldResumeToTodayOnBecomeActive
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 maintainToday;
  NSObject *v17;
  int v19;
  _BOOL4 v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Determining whether to show today on resume.", (uint8_t *)&v19, 2u);
  }
  if (self->_launchedFromURLOrActivity)
  {
    v4 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_launchedFromURLOrActivity is YES, not showing today on resume.", (uint8_t *)&v19, 2u);
    }
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = CUIKNowDate();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CalendarSceneManager _resumeToTodayTimeout](self, "_resumeToTodayTimeout");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _applicationLastActiveTime](CalendarSceneManager, "_applicationLastActiveTime"));
    if (v10)
    {
      objc_msgSend(v7, "timeIntervalSinceDate:", v10);
      v12 = v11;
    }
    else
    {
      v12 = v9 + 1.0;
    }
    v5 = v12 > v9;
    v13 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      v19 = 67109634;
      v20 = v12 > v9;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Resume to today timeout expired: %d (Application last active time = %@ | now = %@", (uint8_t *)&v19, 0x1Cu);
    }
    if (-[CalendarSceneManager _areMultipleScenesOpen](self, "_areMultipleScenesOpen"))
    {
      v14 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        maintainToday = self->_maintainToday;
        v19 = 67109120;
        v20 = maintainToday;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Multiple scenes present, _maintainToday = %d", (uint8_t *)&v19, 8u);
      }
      v5 = v12 > v9 && self->_maintainToday;
    }
    v17 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      v19 = 67109120;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Should show today on resume result = %d", (uint8_t *)&v19, 8u);
    }

  }
  return v5;
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  NSArray *userActivitiesToContinueAfterConnection;
  EKEvent *selectedOccurrenceToRestoreAfterConnection;
  EKEvent *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  UIApplicationShortcutItem *shortcutItemToRunAfterConnection;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;

  v4 = a3;
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneDidBecomeActive: %@", buf, 0xCu);
  }
  v6 = -[CalendarSceneManager _shouldResumeToTodayOnBecomeActive](self, "_shouldResumeToTodayOnBecomeActive");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self->_rootNavigationController, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy();

  if (v6)
    v9 = 1;
  else
    v9 = 2;
  -[RootNavigationController selectTodayWithTrigger:animated:](self->_rootNavigationController, "selectTodayWithTrigger:animated:", v9, 0);
  self->_launchedFromURLOrActivity = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self->_rootNavigationController, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v11);

  -[RootNavigationController didBecomeActive](self->_rootNavigationController, "didBecomeActive");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  LODWORD(v11) = objc_msgSend(v12, "requestSyncOnApplicationLaunch");

  if ((_DWORD)v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
    -[CalendarSceneManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_refreshAccountListAndViewContentsIfNeededForModel:", v13, 2.0);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_userActivitiesToContinueAfterConnection;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        -[CalendarSceneManager _continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:](self, "_continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), 1, 1, 0, (_QWORD)v27);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  userActivitiesToContinueAfterConnection = self->_userActivitiesToContinueAfterConnection;
  self->_userActivitiesToContinueAfterConnection = 0;

  selectedOccurrenceToRestoreAfterConnection = self->_selectedOccurrenceToRestoreAfterConnection;
  if (selectedOccurrenceToRestoreAfterConnection)
  {
    -[MainWindowRootViewController showEventAndCloseSidebarIfNeeded:animated:showMode:](self->_rootViewController, "showEventAndCloseSidebarIfNeeded:animated:showMode:", selectedOccurrenceToRestoreAfterConnection, 0, 1);
    v21 = self->_selectedOccurrenceToRestoreAfterConnection;
    self->_selectedOccurrenceToRestoreAfterConnection = 0;

  }
  if (self->_sceneNeedsToCallExtendedLaunchCompletionSPI)
  {
    self->_sceneNeedsToCallExtendedLaunchCompletionSPI = 0;
    v22 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager: calling _completeStateRestoration (sceneDidBecomeActive) for scene: %@", buf, 0xCu);
    }
    objc_msgSend(v4, "_completeStateRestoration", (_QWORD)v27);
  }
  if (self->_shortcutItemToRunAfterConnection)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self->_rootNavigationController, "view"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "window"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "windowScene"));
    -[CalendarSceneManager windowScene:performActionForShortcutItem:completionHandler:](self, "windowScene:performActionForShortcutItem:completionHandler:", v25, self->_shortcutItemToRunAfterConnection, 0);

    shortcutItemToRunAfterConnection = self->_shortcutItemToRunAfterConnection;
    self->_shortcutItemToRunAfterConnection = 0;

  }
  -[CalendarSceneManager _collectStats:](self, "_collectStats:", self->_rootNavigationController, (_QWORD)v27);

}

- (void)_updateSceneActivationConditions
{
  CalendarSceneManager *v2;
  void *v3;
  void *v4;
  NSString *const **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *const **v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CalendarSceneManager *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sourceForSelectedIdentity"));

  v5 = &EKEventStoreChangedNotification_ptr;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager model](v2, "model"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceForSelectedIdentity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceIdentifier"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _encodeIdentifier:](CalendarSceneManager, "_encodeIdentifier:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("x-apple-calevent://%@/"), v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self CONTAINS %@"), v10));

    goto LABEL_17;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v31 = v2;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager model](v2, "model"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventStore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegateSources"));

  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v18), "sourceIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _encodeIdentifier:](CalendarSceneManager, "_encodeIdentifier:", v19));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("x-apple-calevent://%@/"), v20));
        v22 = v5;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5[247], "predicateWithFormat:", CFSTR("self CONTAINS %@"), v21));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v23));

        v5 = v22;
        objc_msgSend(v9, "addObject:", v24);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v9, "count") == (id)1)
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  }
  else
  {
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      v11 = 0;
      goto LABEL_16;
    }
    v25 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));
  }
  v11 = (void *)v25;
LABEL_16:
  v2 = v31;
LABEL_17:

  v26 = objc_alloc_init((Class)UISceneActivationConditions);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5[247], "predicateWithValue:", 1));
  objc_msgSend(v26, "setCanActivateForTargetContentIdentifierPredicate:", v27);

  if (v11)
  {
    objc_msgSend(v26, "setPrefersToActivateForTargetContentIdentifierPredicate:", v11);
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5[247], "predicateWithValue:", 0));
    objc_msgSend(v26, "setPrefersToActivateForTargetContentIdentifierPredicate:", v28);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager mobileCalWindow](v2, "mobileCalWindow"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "windowScene"));
  objc_msgSend(v30, "setActivationConditions:", v26);

}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)__restoreSelectedCalendarsFromPreferences
{
  void *v3;
  CUIKCalendarModel *model;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  NSObject *v24;
  CUIKCalendarModel *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  dispatch_queue_global_t global_queue;
  NSObject *v33;
  id v34;
  void *v35;
  id v36;
  _QWORD block[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  CUIKCalendarModel *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;

  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    model = self->_model;
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](model, "eventStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
    *(_DWORD *)buf = 138412802;
    v45 = model;
    v46 = 2112;
    v47 = v6;
    v48 = 2112;
    v49 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CalendarSceneManager Setting up selected calendars for model from preference %@ (%@ %@)", buf, 0x20u);

  }
  v8 = objc_alloc((Class)EKCalendarVisibilityManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
  v11 = objc_msgSend(v8, "initWithEventStore:limitedToSource:visibilityChangedCallback:queue:", v9, v10, 0, 0);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "invisibleCalendarsForAllIdentities"));
  if (objc_msgSend(UIApp, "launchedToTest"))
  {
    v35 = v12;
    v36 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarsForEntityType:", 0));

    v12 = objc_msgSend(v14, "mutableCopy");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
          v22 = objc_msgSend(v21, "containsString:", CFSTR("Legacy"));

          if ((v22 & 1) == 0)
            objc_msgSend(v12, "removeObject:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v17);
    }

    v11 = v36;
  }
  v23 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    v25 = (CUIKCalendarModel *)objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134217984;
    v45 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CalendarSceneManager Invisible calendars: (%tu)", buf, 0xCu);

  }
  v26 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v12);
  -[CUIKCalendarModel setUnselectedCalendars:](self->_model, "setUnselectedCalendars:", v26);
  -[CUIKCalendarModel setMaxCachedDays:](self->_model, "setMaxCachedDays:", 300);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[EKPreferences shared](EKPreferences, "shared"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "collapsedSectionIdentifiers"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v28));
  -[CUIKCalendarModel setCollapsedSectionIdentifiers:](self->_model, "setCollapsedSectionIdentifiers:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarVisibilityManager unselectedCalendarIdentifiersForFocusMode](EKCalendarVisibilityManager, "unselectedCalendarIdentifiersForFocusMode"));
  v31 = v30 != 0;

  -[CUIKCalendarModel setFocusFilterMode:](self->_model, "setFocusFilterMode:", v31);
  global_queue = dispatch_get_global_queue(-2, 0);
  v33 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000033DC;
  block[3] = &unk_1001B26A0;
  block[4] = self;
  v38 = v11;
  v34 = v11;
  dispatch_async(v33, block);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  uint64_t v19;
  CUIKCalendarModel *v20;
  CUIKCalendarModel *model;
  void *v22;
  uint64_t v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  MobileCalWindow *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  RootNavigationController *v40;
  void *v41;
  MainWindowRootViewController *v42;
  MainWindowRootViewController *rootViewController;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  unsigned __int8 v49;
  uint64_t v50;
  int v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  EKReminderEditViewControllerCreator *v63;
  NSObject *v64;
  dispatch_time_t v65;
  NSObject *v66;
  _BOOL4 v67;
  RootNavigationController *v68;
  UIApplicationShortcutItem *v69;
  UIApplicationShortcutItem *shortcutItemToRunAfterConnection;
  void *v71;
  NSArray *v72;
  NSArray *userActivitiesToContinueAfterConnection;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  NSObject *log;
  RootNavigationController *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  _QWORD v93[4];
  RootNavigationController *v94;
  _QWORD block[5];
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t buf[4];
  uint64_t v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v102 = (uint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager scene:willConnectToSession:options: %@", buf, 0xCu);
  }
  v12 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v92 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "windows"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v98;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v98 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i);
          v19 = objc_opt_class(MobileCalWindow);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
          {
            v26 = kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager Scene window already set up, no further work needed", buf, 2u);
            }

            goto LABEL_70;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
        if (v15)
          continue;
        break;
      }
    }

    v20 = (CUIKCalendarModel *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager _setUpModel](self, "_setUpModel"));
    model = self->_model;
    self->_model = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "_sceneIdentifier"));
    -[CUIKCalendarModel setSceneIdentifier:](self->_model, "setSceneIdentifier:", v22);

    -[CalendarSceneManager _setupDebugMenu:](self, "_setupDebugMenu:", v92);
    if ((objc_msgSend(UIApp, "launchedToTest") & 1) != 0)
    {
      v23 = 0;
      v24 = 1;
    }
    else
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateRestorationActivity"));
      if (v23)
      {
        v27 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v102 = v23;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "CalendarSceneManager _stateRestoreSelectedCalendarsFromUserActivity. %@", buf, 0xCu);
        }
        v28 = -[CalendarSceneManager _stateRestoreSelectedCalendarsFromUserActivity:](self, "_stateRestoreSelectedCalendarsFromUserActivity:", v23);
        v24 = 0;
        if (self->_finishedSetup)
          goto LABEL_28;
      }
      else
      {
        v24 = 1;
      }
    }
    v29 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "CalendarSceneManager _restoreSelectedCalendarsFromPreferenceIfNeeded", buf, 2u);
    }
    v28 = -[CalendarSceneManager _restoreSelectedCalendarsFromPreferenceIfNeeded](self, "_restoreSelectedCalendarsFromPreferenceIfNeeded");
LABEL_28:
    v30 = EKUIShouldSaveStateInPreferences(v28);
    if ((v24 & 1) == 0 && (v30 & 1) == 0)
    {
      v31 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "CalendarSceneManager _restoreModelPersistedStateFromUserActivity", buf, 2u);
      }
      -[CalendarSceneManager _restoreModelPersistedStateFromUserActivity:](self, "_restoreModelPersistedStateFromUserActivity:", v23);
    }
    v90 = v9;
    v91 = (void *)v23;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v32, "addObserver:selector:name:object:", self, "_displayedOccurrencesChangedForTheFirstTime:", CUIKCalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification, 0);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v33, "addObserver:selector:name:object:", self, "_topMainViewControllerCompletedExtendedLaunch:", CFSTR("MainViewControllerDidCompleteExtendedLaunchNotification"), 0);

    v34 = objc_autoreleasePoolPush();
    v35 = objc_alloc_init(MobileCalWindow);
    objc_autoreleasePoolPop(v34);
    v38 = CalendarAppTintColor(v36, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    -[MobileCalWindow setTintColor:](v35, "setTintColor:", v39);

    -[MobileCalWindow setWindowScene:](v35, "setWindowScene:", v92);
    v40 = -[RootNavigationController initWithModel:targetWindow:]([RootNavigationController alloc], "initWithModel:targetWindow:", self->_model, v35);
    EKUIPushFallbackSizingContextWithViewHierarchy(v35);
    v41 = objc_autoreleasePoolPush();
    v42 = -[MainWindowRootViewController initWithRootNavigationController:]([MainWindowRootViewController alloc], "initWithRootNavigationController:", v40);
    rootViewController = self->_rootViewController;
    self->_rootViewController = v42;

    -[MobileCalWindow setRootViewController:](v35, "setRootViewController:", self->_rootViewController);
    objc_autoreleasePoolPop(v41);
    v44 = objc_autoreleasePoolPush();
    -[MobileCalWindow makeKeyAndVisible](v35, "makeKeyAndVisible");
    objc_autoreleasePoolPop(v44);
    EKUIPopFallbackSizingContextWithViewHierarchy(v35);
    objc_storeStrong((id *)&self->_mobileCalWindow, v35);
    v87 = v40;
    objc_storeStrong((id *)&self->_rootNavigationController, v40);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (objc_msgSend(v45, "BOOLForKey:", CFSTR("UITestingFastAnimations")))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MobileCalWindow layer](v35, "layer"));
      LODWORD(v47) = 1120403456;
      objc_msgSend(v46, "setSpeed:", v47);

    }
    v89 = v45;
    if (+[EKFeatureSet mustDisplaySplashScreenToUser](EKFeatureSet, "mustDisplaySplashScreenToUser")&& (v48 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager")), v49 = objc_msgSend(v48, "isMultiUser"), v48, (v49 & 1) == 0))
    {
      if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v35, v50))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastViewMode"));
        v54 = objc_msgSend(v53, "integerValue");

        if (v54 == (id)3)
        {
          v55 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            log = v55;
            v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
            *(_DWORD *)buf = 138412546;
            v102 = (uint64_t)v85;
            v103 = 2112;
            v104 = v56;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Overriding 'last view mode' preference.  Previous: [%@]  New: [%@].", buf, 0x16u);

          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
          objc_msgSend(v52, "setLastViewMode:", v57);

        }
      }
      v51 = 1;
    }
    else
    {
      v51 = 0;
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v58, "addObserver:selector:name:object:", self, "_selectedIdentityDidUpdate:", CUIKCalendarModelIdentityChangedNotification, 0);

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v59, "addObserver:selector:name:object:", self, "_selectedIdentityDidUpdate:", CUIKCalendarModelDelegatesChangedNotification, 0);

    -[CalendarSceneManager _updateSceneActivationConditions](self, "_updateSceneActivationConditions");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "lastSidebarMode"));
    v62 = objc_msgSend(v61, "unsignedIntegerValue");

    -[MainWindowRootViewController setCurrentSidebarState:](self->_rootViewController, "setCurrentSidebarState:", v62);
    v63 = objc_alloc_init(EKReminderEditViewControllerCreator);
    +[EKEventEditViewController registerIntegrationEditViewControllerCreator:](EKEventEditViewController, "registerIntegrationEditViewControllerCreator:", v63);

    if ((v24 & 1) == 0)
    {
      -[CalendarSceneManager _restoreStateFromUserActivity:](self, "_restoreStateFromUserActivity:", v91);
      if (self->_selectedOccurrenceToRestoreAfterConnection)
      {
        if (!self->_sceneNeedsToCallExtendedLaunchCompletionSPI)
        {
          self->_sceneNeedsToCallExtendedLaunchCompletionSPI = 1;
          v64 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v102 = (uint64_t)v92;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager calling _extendStateRestoration for scene: %@", buf, 0xCu);
          }
          objc_msgSend(v92, "_extendStateRestoration");
          v65 = dispatch_time(0, 5000000000);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000E72D0;
          block[3] = &unk_1001B26A0;
          block[4] = self;
          v96 = v92;
          dispatch_after(v65, (dispatch_queue_t)&_dispatch_main_q, block);

        }
      }
    }
    v66 = kCalUILogHandle;
    v67 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO);
    if (v51)
    {
      if (v67)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "CalendarSceneManager Presenting splash screen to the user.", buf, 2u);
      }
      -[CalendarSceneManager _constructAndPresentSplashScreenFromViewController:window:](self, "_constructAndPresentSplashScreenFromViewController:window:", self->_rootViewController, v35);
    }
    else if (v67)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "CalendarSceneManager Will not present the splash screen to the user.", buf, 2u);
    }
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_1000E738C;
    v93[3] = &unk_1001B2538;
    v68 = v87;
    v94 = v68;
    if (qword_1001F6510 != -1)
      dispatch_once(&qword_1001F6510, v93);
    v69 = (UIApplicationShortcutItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortcutItem"));
    shortcutItemToRunAfterConnection = self->_shortcutItemToRunAfterConnection;
    self->_shortcutItemToRunAfterConnection = v69;

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userActivities"));
    v72 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "allObjects"));
    userActivitiesToContinueAfterConnection = self->_userActivitiesToContinueAfterConnection;
    self->_userActivitiesToContinueAfterConnection = v72;

    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLContexts"));
    if (v74)
    {
      -[CalendarSceneManager scene:openURLContexts:](self, "scene:openURLContexts:", v92, v74);
    }
    else
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "notificationResponse"));

      if (v75)
      {
        v88 = v10;
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "notificationResponse"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "notification"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "request"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "content"));
        v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "defaultActionURL"));

        v81 = (void *)v80;
        v82 = kCalUILogHandle;
        v83 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO);
        if (v80)
        {
          if (v83)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Opening URL from dragged notification banner", buf, 2u);
          }
          -[CalendarSceneManager _openURL:](self, "_openURL:", v80);
          v10 = v88;
        }
        else
        {
          v10 = v88;
          if (v83)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Unable to find URL for dragged notification banner", buf, 2u);
          }
        }

      }
    }
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v84, "addObserver:selector:name:object:", self, "_mainViewControllerDidRequestSceneTitleUpdate:", CFSTR("_CalendarWindowSceneTitleRequiresUpdateNotification"), v92);

    -[CalendarSceneManager _updateSceneTitle](self, "_updateSceneTitle");
    v9 = v90;
    goto LABEL_70;
  }
  v25 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "CalendarSceneManager Scene connected, but it's not a window scene.", buf, 2u);
  }
LABEL_70:

}

- (BOOL)showingSplashScreen
{
  return self->_showingSplashScreen;
}

- (MobileCalWindow)mobileCalWindow
{
  return self->_mobileCalWindow;
}

- (void)_updateSceneTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  id v10;

  if (EKUIDeviceCanTransform(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
      v5 = CUIKDisplayedTitleForSource(v4, 1);
      v6 = objc_claimAutoreleasedReturnValue(v5);
    }
    else if (-[CalendarSceneManager _isAnyWindowShowingDelegateCalendar](self, "_isAnyWindowShowingDelegateCalendar"))
    {
      v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("My Calendar"), &stru_1001B67C0, 0));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self->_rootNavigationController, "topMainViewControllerContainer"));
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneTitle"));
    }
    v10 = (id)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager mobileCalWindow](self, "mobileCalWindow"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
    objc_msgSend(v9, "setTitle:", v10);

  }
}

- (void)_restoreSelectedCalendarsFromPreferenceIfNeeded
{
  if (!self->_finishedSetup)
  {
    -[CalendarSceneManager __restoreSelectedCalendarsFromPreferences](self, "__restoreSelectedCalendarsFromPreferences");
    self->_finishedSetup = 1;
  }
}

- (void)_extendedLaunchDidComplete
{
  +[CalMCSignpost endLaunchToView:extended:](CalMCSignpost, "endLaunchToView:extended:", -[RootNavigationController currentViewType](self->_rootNavigationController, "currentViewType"), 1);
  self->_sceneHasCompletedExtendedLaunch = 1;
  -[CUIKCalendarModel startNotificationMonitor](self->_model, "startNotificationMonitor");
  -[CUIKCalendarModel checkLocationAuthorizationAndAllowEventLocationPrediction](self->_model, "checkLocationAuthorizationAndAllowEventLocationPrediction");
}

+ (BOOL)isSceneCalendarAppScene:(id)a3
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "delegate"));
  objc_opt_class(CalendarSceneManager);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (RootNavigationController)rootNavigationController
{
  return self->_rootNavigationController;
}

- (void)handleURL:(id)a3 context:(id)a4
{
  self->_launchedFromURLOrActivity = 1;
  -[MainWindowRootViewController handleURL:context:](self->_rootViewController, "handleURL:context:", a3, a4);
}

- (void)setLaunchedFromURLOrActivity
{
  self->_launchedFromURLOrActivity = 1;
}

- (void)_showDate:(id)a3 inView:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  id v20;

  v6 = a3;
  v7 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager showDate inView with date %{public}@", (uint8_t *)&v19, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v6, v9));

  switch(a4)
  {
    case 1uLL:
      v11 = 0;
      v12 = 0;
      v13 = 3;
      break;
    case 2uLL:
      v12 = 0;
      v11 = 1;
      v13 = 2;
      break;
    case 3uLL:
    case 6uLL:
      v11 = 0;
      v12 = 0;
      v13 = 1;
      break;
    case 4uLL:
      v11 = 0;
      v12 = 0;
      v13 = 0;
      break;
    case 5uLL:
      v11 = 0;
      v12 = 0;
      v13 = 4;
      break;
    default:
      v11 = 0;
      v13 = -1;
      v12 = 1;
      break;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self->_rootNavigationController, "traitCollection"));
  v15 = v14;
  if (v11)
  {
    if (objc_msgSend(v14, "horizontalSizeClass") == (id)1 && objc_msgSend(v15, "verticalSizeClass") == (id)2)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager model](self, "model"));
      v17 = objc_msgSend(v16, "numDaysToShow");

      if (v17 == (id)1)
        v13 = 3;
      else
        v13 = 2;
    }
    else
    {
      v13 = 2;
    }
    goto LABEL_19;
  }
  if ((v12 & 1) == 0)
  {
LABEL_19:
    v18 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self->_rootNavigationController, "pushCalendarViewControllerWithViewType:andDate:", v13, v10);
    goto LABEL_20;
  }
  -[RootNavigationController showDate:animated:](self->_rootNavigationController, "showDate:animated:", v10, 1);
LABEL_20:

}

- (void)_showEvent:(id)a3 inView:(unint64_t)a4
{
  -[RootNavigationController showEvent:animated:showMode:context:](self->_rootNavigationController, "showEvent:animated:showMode:context:", a3, 1, 1, 0);
}

- (void)diagnosticsViewControllerDidDismiss
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager diagnosticsViewController](self, "diagnosticsViewController"));
  objc_msgSend(v3, "setDelegate:", 0);

  -[CalendarSceneManager setDiagnosticsViewController:](self, "setDiagnosticsViewController:", 0);
}

- (void)showDebugMenu
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager diagnosticsViewController](self, "diagnosticsViewController"));

  if (!v3)
  {
    objc_opt_class(CalendarDiagnosticsUIViewController);
    if (v4)
    {
      v5 = objc_alloc_init((Class)CalendarDiagnosticsUIViewController);
      -[CalendarSceneManager setDiagnosticsViewController:](self, "setDiagnosticsViewController:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager diagnosticsViewController](self, "diagnosticsViewController"));
      objc_msgSend(v6, "setDelegate:", self);

      v8 = (id)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager rootNavigationController](self, "rootNavigationController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager diagnosticsViewController](self, "diagnosticsViewController"));
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
  }
}

- (void)_stateRestoreSelectedCalendarsFromUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  CalendarSceneManager *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  CalendarSceneManager *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];

  v4 = a3;
  if (-[CalendarSceneManager _isUserActivityForStateRestoration:](self, "_isUserActivityForStateRestoration:", v4))
  {
    if ((objc_msgSend(UIApp, "launchedToTest") & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_InvisibleCalendars")));

      objc_opt_class(NSSet);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v66 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
              objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
                objc_msgSend(v5, "addObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
          }
          while (v11);
        }

      }
      v55 = v7;
      v56 = self;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "calendarsForEntityType:", 0));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v5, "count")));
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v62;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(_QWORD *)v62 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "calendarIdentifier"));
            v26 = objc_msgSend(v5, "containsObject:", v25);

            if (v26)
              objc_msgSend(v18, "addObject:", v24);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        }
        while (v21);
      }

      v27 = objc_msgSend(v5, "count");
      if (v27 != objc_msgSend(v18, "count"))
      {
        v28 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          v30 = objc_msgSend(v5, "count");
          v31 = objc_msgSend(v18, "count");
          *(_DWORD *)buf = 134218240;
          v71 = v30;
          v72 = 2048;
          v73 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Calendar state restoration: tried to restore %lu invisible calendars, but only found %lu.", buf, 0x16u);

        }
      }
      v32 = (void *)kCalUILogHandle;
      v33 = v56;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        v34 = v32;
        v35 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 134217984;
        v71 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Calendar state restoration: restoring unselected calendars: %tu", buf, 0xCu);

      }
      -[CUIKCalendarModel setUnselectedCalendars:](v56->_model, "setUnselectedCalendars:", v18);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_CollapsedSectionIdentifiers")));

      objc_opt_class(NSSet);
      if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
      {
        v53 = v38;
        v54 = v4;
        v40 = v38;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v58;
          do
          {
            for (k = 0; k != v42; k = (char *)k + 1)
            {
              if (*(_QWORD *)v58 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)k);
              objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0)
                objc_msgSend(v36, "addObject:", v45);
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          }
          while (v42);
        }

        v38 = v53;
        v4 = v54;
        v33 = v56;
      }
      -[CUIKCalendarModel setCollapsedSectionIdentifiers:](v33->_model, "setCollapsedSectionIdentifiers:", v36, v53, v54);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarVisibilityManager unselectedCalendarIdentifiersForFocusMode](EKCalendarVisibilityManager, "unselectedCalendarIdentifiersForFocusMode"));

      if (v47)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_FocusFilterMode")));

        v50 = objc_msgSend(v49, "integerValue");
        if ((unint64_t)v50 <= 1)
          v51 = 1;
        else
          v51 = (uint64_t)v50;
        -[CUIKCalendarModel setFocusFilterMode:](v33->_model, "setFocusFilterMode:", v51);

      }
      v33->_finishedSetup = 1;

    }
  }
  else
  {
    v52 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Calendar state restoration (selected calendars): currently ignoring user activity that does not have a state restoration flag.", buf, 2u);
    }
  }

}

- (void)_refreshAccountListAndViewContentsIfNeededForModel:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E70F8;
  block[3] = &unk_1001B2538;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

- (BOOL)_shouldMaintainToday
{
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  _BOOL4 v18;

  v3 = kCalUILogHandle;
  v4 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO);
  if (v4)
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Determining whether to maintain today on next resume (assuming timeout is expired).", (uint8_t *)&v17, 2u);
  }
  v7 = CUIKNowDate(v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (-[CalendarSceneManager _areMultipleScenesOpen](self, "_areMultipleScenesOpen"))
  {
    v9 = -[RootNavigationController isDateVisible:](self->_rootNavigationController, "isDateVisible:", v8);
    v10 = kCalUILogHandle;
    if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v17 = 67109120;
    v18 = v9;
    v11 = "Multiple scenes present, today visible = %d.";
    v12 = v10;
    v13 = 8;
  }
  else
  {
    v14 = kCalUILogHandle;
    v9 = 1;
    if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    LOWORD(v17) = 0;
    v11 = "Single scene, should always maintain today. Not bothering to check if today is visible.";
    v12 = v14;
    v13 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v17, v13);
LABEL_9:
  v15 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v17 = 67109120;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "should maintain today result = %d", (uint8_t *)&v17, 8u);
  }

  return v9;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  int v44;
  _BYTE v45[128];

  v4 = a3;
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneDidDisconnect: %@", buf, 0xCu);
  }
  v36 = v4;
  -[MobileCalWindow setHidden:](self->_mobileCalWindow, "setHidden:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, CUIKCalendarModelIdentityChangedNotification, self->_model);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, CUIKCalendarModelDelegatesChangedNotification, self->_model);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedScenes"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        *(_QWORD *)&v15 = objc_opt_class(self).n128_u64[0];
        if (objc_msgSend(v16, "isSceneCalendarAppScene:", v14, v15))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_sceneIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager mobileCalWindow](self, "mobileCalWindow"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "windowScene"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_sceneIdentifier"));
          v21 = objc_msgSend(v17, "isEqualToString:", v20);

          if (!v21)
          {

            v33 = (void *)kCalUILogHandle;
            v25 = v36;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
            {
              v34 = v33;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_sceneIdentifier"));
              *(_DWORD *)buf = 138412290;
              v42 = v35;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "CalendarSceneManager Scene %@ disconnected", buf, 0xCu);

            }
            goto LABEL_17;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v11)
        continue;
      break;
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager rootNavigationController](self, "rootNavigationController"));
  v23 = objc_msgSend(v22, "currentViewType");

  v24 = (void *)kCalUILogHandle;
  v25 = v36;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v26 = v24;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_sceneIdentifier"));
    *(_DWORD *)buf = 138412546;
    v42 = v27;
    v43 = 1024;
    v44 = (int)v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "CalendarSceneManager Scene %@ disconnected, writing out last view mode: %d", buf, 0x12u);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23));
  objc_msgSend(v28, "setLastViewMode:", v29);

  v30 = -[MainWindowRootViewController currentSidebarState](self->_rootViewController, "currentSidebarState");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v30));
  objc_msgSend(v31, "setLastSidebarMode:", v32);

LABEL_17:
}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneWillResignActive: %@", (uint8_t *)&v6, 0xCu);
  }
  self->_launchedFromURLOrActivity = 0;
  self->_maintainToday = -[CalendarSceneManager _shouldMaintainToday](self, "_shouldMaintainToday");

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  id v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneDidEnterBackground: %@", (uint8_t *)&v8, 0xCu);
  }
  *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v7, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_refreshAccountListAndViewContentsIfNeededForModel:", self->_model, v6);
  -[RootNavigationController didEnterBackground](self->_rootNavigationController, "didEnterBackground");
  CUIKITriggerReminderSync(2);

}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v42;
  uint8_t buf[4];
  id v44;

  v4 = a3;
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager stateRestorationActivityForScene: %@", buf, 0xCu);
  }
  if (self->_finishedSetup)
  {
    v6 = -[RootNavigationController currentViewType](self->_rootNavigationController, "currentViewType");
    if (v6 > 4)
      v7 = 0;
    else
      v7 = qword_1001A1950[v6];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));

    v9 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.calendar.continuity.date_selection"));
    v12 = objc_alloc((Class)CUIKUserActivityCalendarDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar"));
    v14 = objc_msgSend(v12, "initWithDate:view:calendar:", v11, v7, v13);

    objc_msgSend(v14, "updateActivity:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("_UserActivityStateRestore_Flag"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel unselectedCalendarsIgnoringFocus](self->_model, "unselectedCalendarsIgnoringFocus"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("calendarIdentifier")));

    objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("_UserActivityStateRestore_InvisibleCalendars"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel collapsedSectionIdentifiers](self->_model, "collapsedSectionIdentifiers"));
    objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("_UserActivityStateRestore_CollapsedSectionIdentifiers"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode")));
    objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("_UserActivityStateRestore_FocusFilterMode"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sourceIdentifier"));
      objc_msgSend(v15, "setObject:forKey:", v23, CFSTR("_UserActivityStateRestore_SelectedSource"));

    }
    -[CalendarSceneManager _addPersistedStateFromCalendarModelToDictionary:](self, "_addPersistedStateFromCalendarModelToDictionary:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CalendarSceneManager _shouldMaintainToday](self, "_shouldMaintainToday")));
    objc_msgSend(v15, "setObject:forKey:", v24, CFSTR("_UserActivityStateRestore_MaintainToday_Key"));

    v25 = objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));
    if (!v25)
      goto LABEL_18;
    v28 = (void *)v25;
    v42 = v18;
    v29 = v14;
    v30 = v4;
    v31 = v11;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "uniqueID"));
    if (v33)
    {
      v34 = (void *)v33;
      v35 = -[RootNavigationController shouldSaveSelectedEvent](self->_rootNavigationController, "shouldSaveSelectedEvent");

      v11 = v31;
      v4 = v30;
      v14 = v29;
      v18 = v42;
      if (!v35)
      {
LABEL_18:
        v38 = CUIKNowDate(v25, v26, v27);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        objc_msgSend(v15, "setObject:forKey:", v39, CFSTR("_UserActivityStateRestore_Timestamp"));

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MainWindowRootViewController currentSidebarState](self->_rootViewController, "currentSidebarState")));
        objc_msgSend(v15, "setObject:forKey:", v40, CFSTR("_UserActivityStateRestore_LastSidebarMode_Key"));

        objc_msgSend(v9, "addUserInfoEntriesFromDictionary:", v15);
        goto LABEL_19;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uniqueID"));
      objc_msgSend(v15, "setObject:forKey:", v37, CFSTR("_UserActivityStateRestore_SelectedOccurrenceUID_Key"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
      objc_msgSend(v15, "setObject:forKey:", v32, CFSTR("_UserActivityStateRestore_SelectedOccurrenceDate_Key"));
    }
    else
    {
      v4 = v30;
      v14 = v29;
      v18 = v42;
    }

    goto LABEL_18;
  }
  v8 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager Don't attempt to save state. because setup is not finished yet. During stateRestorationActivityForScene %@", buf, 0xCu);
  }
  v9 = 0;
LABEL_19:

  return v9;
}

- (void)_addPersistedStateFromCalendarModelToDictionary:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->_model, "persistedSceneState"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dayViewHourScale");
    if (v6 > 0.0)
    {
      objc_msgSend(v5, "dayViewHourScale");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v13, "setObject:forKey:", v7, CFSTR("_UserActivityStateRestore_DayHourScale_Key"));

    }
    objc_msgSend(v5, "weekViewHourScale");
    if (v8 > 0.0)
    {
      objc_msgSend(v5, "weekViewHourScale");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("_UserActivityStateRestore_WeekHourScale_Key"));

    }
    if ((objc_msgSend(v5, "dayViewFirstVisibleSecond") & 0x80000000) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "dayViewFirstVisibleSecond")));
      objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("_UserActivityStateRestore_DayViewFirstVisibleSecond_Key"));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "showDayAsList")));
    objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("_UserActivityStateRestore_ShowDayAsList_Key"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "showMonthAsDivided")));
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("_UserActivityStateRestore_ShowMonthAsDivided_Key"));

  }
}

- (BOOL)_isUserActivityForStateRestoration:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_Flag")));

  objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (id)_extractNumberFromUserActivity:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (!v8 || (objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {

LABEL_5:
    v8 = 0;
  }

  return v8;
}

- (void)_restoreModelPersistedStateFromUserActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  if ((EKUIShouldSaveStateInPreferences(v16) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->_model, "persistedSceneState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager _extractNumberFromUserActivity:forKey:](self, "_extractNumberFromUserActivity:forKey:", v16, CFSTR("_UserActivityStateRestore_ShowDayAsList_Key")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager _extractNumberFromUserActivity:forKey:](self, "_extractNumberFromUserActivity:forKey:", v16, CFSTR("_UserActivityStateRestore_ShowMonthAsDivided_Key")));
    if (v5)
      v7 = objc_msgSend(v5, "BOOLValue");
    else
      v7 = 0;
    objc_msgSend(v4, "setShowDayAsList:", v7);
    if (v6)
      v8 = objc_msgSend(v6, "BOOLValue");
    else
      v8 = 0;
    objc_msgSend(v4, "setShowMonthAsDivided:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager _extractNumberFromUserActivity:forKey:](self, "_extractNumberFromUserActivity:forKey:", v16, CFSTR("_UserActivityStateRestore_DayHourScale_Key")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager _extractNumberFromUserActivity:forKey:](self, "_extractNumberFromUserActivity:forKey:", v16, CFSTR("_UserActivityStateRestore_WeekHourScale_Key")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager _extractNumberFromUserActivity:forKey:](self, "_extractNumberFromUserActivity:forKey:", v16, CFSTR("_UserActivityStateRestore_DayViewFirstVisibleSecond_Key")));
    v12 = -1.0;
    v13 = -1.0;
    if (v9)
      objc_msgSend(v9, "doubleValue", -1.0);
    objc_msgSend(v4, "setDayViewHourScale:", v13);
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      v12 = v14;
    }
    objc_msgSend(v4, "setWeekViewHourScale:", v12);
    if (v11)
      v15 = (uint64_t)objc_msgSend(v11, "intValue");
    else
      v15 = 0xFFFFFFFFLL;
    objc_msgSend(v4, "setDayViewFirstVisibleSecond:", v15);

  }
}

- (void)_restoreStateFromUserActivity:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSString *const **v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  NSObject *v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSString *const **v41;
  uint64_t v42;
  uint64_t isKindOfClass;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  EKEvent *v64;
  EKEvent *selectedOccurrenceToRestoreAfterConnection;
  void *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  _BYTE v77[10];
  NSObject *v78;
  __int16 v79;
  int v80;

  v4 = a3;
  v5 = -[CalendarSceneManager _isUserActivityForStateRestoration:](self, "_isUserActivityForStateRestoration:", v4);
  v6 = kCalUILogHandle;
  v7 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calendar state restoration: currently ignoring user activity that does not have a state restoration flag.", buf, 2u);
    }
    goto LABEL_62;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calendar state restoration: starting restoration from user activity....", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _applicationLastActiveTime](CalendarSceneManager, "_applicationLastActiveTime"));

  v9 = &EKEventStoreChangedNotification_ptr;
  if (!v8)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_Timestamp")));

    objc_opt_class(NSDate);
    if ((objc_opt_isKindOfClass(v18, v23) & 1) == 0)
    {
      v17 = 0;
      goto LABEL_18;
    }
    v19 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v24, "timeIntervalSinceDate:", v19);
    v26 = v25;
    -[CalendarSceneManager _resumeToTodayTimeout](self, "_resumeToTodayTimeout");
    v28 = v27;

    v17 = v26 > v28;
    if (v26 <= v28
      || (v29 = (void *)kCalUILogHandle, !os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO)))
    {
LABEL_15:

LABEL_18:
      goto LABEL_19;
    }
    v20 = v29;
    v30 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[CalendarSceneManager _resumeToTodayTimeout](self, "_resumeToTodayTimeout");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v77 = v19;
    *(_WORD *)&v77[8] = 2112;
    v78 = v30;
    v79 = 1024;
    v80 = (int)v31;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Calendar state restoration: user activity timestamp is outside the resume to today timeout. Last active time = %@, Now = %@, timeout = %d", buf, 0x1Cu);

LABEL_14:
    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _applicationLastActiveTime](CalendarSceneManager, "_applicationLastActiveTime"));
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;
  -[CalendarSceneManager _resumeToTodayTimeout](self, "_resumeToTodayTimeout");
  v15 = v14;

  if (v13 <= v15)
  {
    v17 = 0;
  }
  else
  {
    v16 = (void *)kCalUILogHandle;
    v17 = 1;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      v18 = v16;
      v19 = objc_claimAutoreleasedReturnValue(+[CalendarSceneManager _applicationLastActiveTime](CalendarSceneManager, "_applicationLastActiveTime"));
      v20 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[CalendarSceneManager _resumeToTodayTimeout](self, "_resumeToTodayTimeout");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v77 = v19;
      *(_WORD *)&v77[8] = 2112;
      v78 = v20;
      v79 = 1024;
      v80 = (int)v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Calendar state restoration: last active time is outside the resume to today timeout. Last active time = %@, Now = %@, timeout = %d", buf, 0x1Cu);
      goto LABEL_14;
    }
  }
LABEL_19:
  if (!-[CalendarSceneManager _areMultipleScenesOpen](self, "_areMultipleScenesOpen"))
    goto LABEL_24;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_MaintainToday_Key")));

  objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v33, v34) & 1) == 0)
  {

    goto LABEL_24;
  }
  v35 = objc_msgSend(v33, "BOOLValue");
  self->_maintainToday = v35;

  if (v35)
  {
LABEL_24:
    v37 = !v17;
    v36 = 1;
    goto LABEL_25;
  }
  v36 = 0;
  v37 = 1;
LABEL_25:
  v38 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v77 = v37;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v17;
    LOWORD(v78) = 1024;
    *(_DWORD *)((char *)&v78 + 2) = v36;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Calendar state restoration: restore selected date = %d (resumeTimeoutExpired = %d, maintainToday = %d)", buf, 0x14u);
  }
  -[CalendarSceneManager _continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:](self, "_continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:", v4, 0, v37, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_SelectedSource")));

  v41 = &EKEventStoreChangedNotification_ptr;
  objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v40, v42);
  if ((isKindOfClass & 1) == 0)
    goto LABEL_47;
  v44 = v40;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sources"));

  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (!v47)
  {
    v54 = v46;
    goto LABEL_45;
  }
  v48 = v47;
  v70 = v40;
  v49 = *(_QWORD *)v72;
LABEL_30:
  v50 = 0;
  while (1)
  {
    if (*(_QWORD *)v72 != v49)
      objc_enumerationMutation(v46);
    v51 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "sourceIdentifier"));
    if (!objc_msgSend(v52, "isEqualToString:", v44))
    {

      goto LABEL_37;
    }
    v53 = objc_msgSend(v51, "isEnabled");

    if ((v53 & 1) != 0)
      break;
LABEL_37:
    if (v48 == (id)++v50)
    {
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      if (v48)
        goto LABEL_30;
      v54 = v46;
      v9 = &EKEventStoreChangedNotification_ptr;
      v40 = v70;
      v41 = &EKEventStoreChangedNotification_ptr;
      goto LABEL_45;
    }
  }
  v54 = v51;

  v9 = &EKEventStoreChangedNotification_ptr;
  v40 = v70;
  v41 = &EKEventStoreChangedNotification_ptr;
  if (!v54)
    goto LABEL_46;
  v55 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v77 = v54;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring selected identity: %@", buf, 0xCu);
  }
  -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](self->_model, "updateSourceForSelectedIdentity:selectedCalendars:", v54, 0);
LABEL_45:

LABEL_46:
LABEL_47:
  if ((EKUIShouldSaveStateInPreferences(isKindOfClass) & 1) == 0)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_SelectedOccurrenceUID_Key")));

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_SelectedOccurrenceDate_Key")));

    objc_opt_class(v41[253]);
    if ((objc_opt_isKindOfClass(v57, v60) & 1) != 0)
    {
      objc_opt_class(v9[223]);
      if ((objc_opt_isKindOfClass(v59, v61) & 1) != 0)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "allEventsWithUniqueId:occurrenceDate:", v57, v59));

        if (objc_msgSend(v63, "count") == (id)1)
        {
          v64 = (EKEvent *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "firstObject"));
          selectedOccurrenceToRestoreAfterConnection = self->_selectedOccurrenceToRestoreAfterConnection;
          self->_selectedOccurrenceToRestoreAfterConnection = v64;
        }
        else
        {
          selectedOccurrenceToRestoreAfterConnection = self->_selectedOccurrenceToRestoreAfterConnection;
          self->_selectedOccurrenceToRestoreAfterConnection = 0;
        }

      }
    }

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("_UserActivityStateRestore_LastSidebarMode_Key")));

  objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v67, v68) & 1) != 0)
    -[MainWindowRootViewController setCurrentSidebarState:](self->_rootViewController, "setCurrentSidebarState:", objc_msgSend(v67, "unsignedIntegerValue"));
  if ((objc_msgSend(UIApp, "launchedToTest") & 1) == 0)
    self->_finishedSetup = 1;
  v69 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Calendar state restoration: completed", buf, 2u);
  }

LABEL_62:
}

- (BOOL)_continueUserActivity:(id)a3 restoreSelectedOccurrence:(BOOL)a4 restoreSelectedDate:(BOOL)a5 restorationHandler:(id)a6
{
  char *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
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
  CUIKCalendarModel *model;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  CUIKCalendarModel *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  unsigned int v74;
  CUIKCalendarModel *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  MainWindowRootViewController *rootViewController;
  void *v92;
  void *v93;
  NSObject *v94;
  NSObject *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  NSObject *v99;
  unsigned int v100;
  unsigned int v102;
  void *v103;
  void *v104;
  void *v105;
  _BOOL4 v106;
  _BOOL4 v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  _QWORD v112[4];
  id v113;
  char *v114;
  id v115;
  id v116;
  BOOL v117;
  BOOL v118;
  uint8_t buf[4];
  const char *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  unsigned int v124;

  v106 = a5;
  v107 = a4;
  v8 = (char *)a3;
  v111 = a6;
  v9 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v120 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager was requested to continue the following user activity: [%@]", buf, 0xCu);
  }
  v10 = EKWeakLinkStringConstant("CSSearchableItemActionType", 11);
  v109 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v11 = EKWeakLinkStringConstant("CSQueryContinuationActionType", 11);
  v108 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
  if (self->_showingSplashScreen)
  {
    v12 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v120 = "-[CalendarSceneManager _continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "The splash screen is currently being shown.  Will delay execution of [%s] until the splash screen is dismissed.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472;
    v112[2] = sub_1000E96EC;
    v112[3] = &unk_1001B5398;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v113 = v13;
    objc_copyWeak(&v116, (id *)buf);
    v114 = v8;
    v117 = v107;
    v118 = v106;
    v115 = v111;
    -[CalendarSceneManager setSplashScreenCompletionAction:](self, "setSplashScreenCompletionAction:", v112);

    objc_destroyWeak(&v116);
    objc_destroyWeak((id *)buf);
    v14 = 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v110, "isEqualToString:", v109))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v16 = EKWeakLinkStringConstant("CSSearchableItemActivityIdentifier", 11);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v17));

    if (v18)
    {
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(".")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "firstObject"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", CFSTR(".")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", v20, &stru_1001B67C0));

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "calendarItemWithIdentifier:", v19));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectID"));
      objc_msgSend(v21, "doubleValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "eventForObjectID:occurrenceDate:", v25, v26));

      if (v27)
      {
        model = self->_model;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "calendar"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "source"));
        -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](model, "updateSourceForSelectedIdentity:selectedCalendars:", v30, 0);

        -[MainWindowRootViewController showEventAndCloseSidebarIfNeeded:animated:showMode:](self->_rootViewController, "showEventAndCloseSidebarIfNeeded:animated:showMode:", v27, 0, 1);
        v31 = 1;
      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }

    v14 = v31 != 0;
LABEL_70:
    if (v107 || v106)
      self->_launchedFromURLOrActivity = v14;
    goto LABEL_73;
  }
  if (objc_msgSend(v110, "isEqualToString:", v108))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v33 = EKWeakLinkStringConstant("CSSearchQueryString", 11);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", v34));

    -[MainWindowRootViewController continueSearchWithTerm:](self->_rootViewController, "continueSearchWithTerm:", v35);
LABEL_56:
    v14 = 1;
    goto LABEL_70;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interaction"));
  v37 = v36 == 0;

  if (v37)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKUserActivity activityForActivity:](CUIKUserActivity, "activityForActivity:", v8));
    v53 = objc_msgSend(v52, "type");
    if (v53)
    {
      if (v53 == (id)4098)
      {
        v66 = v52;
        v67 = self->_model;
        if (v107)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](v67, "eventStore"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "eventFromStore:", v68));

          if (v69)
          {
            v70 = (void *)kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
            {
              v71 = v70;
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "calendar"));
              v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "source"));
              v74 = objc_msgSend(v66, "view");
              *(_DWORD *)buf = 138412802;
              v120 = (const char *)v69;
              v121 = 2112;
              v122 = v73;
              v123 = 1024;
              v124 = v74;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring selected event (%@), event identity (%@) and view (%d)", buf, 0x1Cu);

            }
            v75 = self->_model;
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "calendar"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "source"));
            -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](v75, "updateSourceForSelectedIdentity:selectedCalendars:", v77, 0);

            -[CalendarSceneManager _showEvent:inView:](self, "_showEvent:inView:", v69, objc_msgSend(v66, "view"));
          }
        }
        else
        {
          v96 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](v67, "selectedDate"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "date"));

          v97 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "Calendar state restoration: requested to not restore selected event, restoring to model selected date instead", buf, 2u);
          }
          v98 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            v99 = v98;
            v100 = objc_msgSend(v66, "view");
            *(_DWORD *)buf = 138412546;
            v120 = (const char *)v69;
            v121 = 1024;
            LODWORD(v122) = v100;
            _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring date (%@) and view (%d)", buf, 0x12u);

          }
          -[CalendarSceneManager _showDate:inView:](self, "_showDate:inView:", v69, objc_msgSend(v66, "view"));
        }

      }
      else
      {
        if (v53 != (id)4097)
        {
          v14 = 0;
LABEL_69:

          goto LABEL_70;
        }
        v54 = v52;
        v55 = objc_msgSend(v54, "view");
        if (v106)
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "date"));
          if (objc_msgSend(v54, "isTomorrow"))
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
            v58 = objc_alloc_init((Class)NSDateComponents);
            v59 = objc_msgSend(v58, "setDay:", 1);
            v61 = CUIKTodayDate(v59, v60);
            v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
            v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "dateByAddingComponents:toDate:options:", v58, v62, 0));

            v55 = 0;
            v56 = (void *)v63;
          }
          v64 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v120 = (const char *)v56;
            v121 = 1024;
            LODWORD(v122) = (_DWORD)v55;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring date (%@) and view (%d)", buf, 0x12u);
          }
        }
        else
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "date"));

          v94 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "Calendar state restoration: requested to not restore date, restoring to model selected date instead", buf, 2u);
          }
          v95 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v120 = (const char *)v56;
            v121 = 1024;
            LODWORD(v122) = (_DWORD)v55;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring date (%@) and view (%d)", buf, 0x12u);
          }
        }
        -[CalendarSceneManager _showDate:inView:](self, "_showDate:inView:", v56, v55);

      }
    }
    v14 = 1;
    goto LABEL_69;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interaction"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "intent"));

  objc_opt_class(EKUICreateEventIntent);
  if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
  {
    v41 = v39;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "startDate"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "endDate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allDay"));
    v102 = objc_msgSend(v43, "BOOLValue");

    if (v42)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "componentsSeparatedByString:", CFSTR("#")));

      v46 = (unint64_t)objc_msgSend(v45, "count");
      if ((v46 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));
        objc_msgSend(v47, "doubleValue");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", 1));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v49));

        v103 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v48, v50));
        if (v46 == 3)
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastObject"));
        else
          v51 = 0;

      }
      else
      {
        v51 = 0;
        v103 = 0;
      }

    }
    else
    {
      v51 = 0;
      v103 = 0;
    }
    if (v105)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "identifier"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "componentsSeparatedByString:", CFSTR("#")));

      if (objc_msgSend(v79, "count") == (id)2)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "firstObject"));
        objc_msgSend(v80, "doubleValue");
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "lastObject"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v82));

        v84 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v81, v83));
      }
      else
      {
        v84 = 0;
      }

    }
    else
    {
      v84 = 0;
    }
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "locationName"));

    if (v85)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "locationName"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[EKStructuredLocation locationWithTitle:](EKStructuredLocation, "locationWithTitle:", v86));

      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "geolocation"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "location"));
      objc_msgSend(v87, "setGeoLocation:", v89);

      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "locationAddress"));
      objc_msgSend(v87, "setAddress:", v90);

    }
    else
    {
      v87 = 0;
    }
    rootViewController = self->_rootViewController;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "title"));
    -[MainWindowRootViewController showAddEventWithTitle:startDate:endDate:location:suggestionsKey:allDay:](rootViewController, "showAddEventWithTitle:startDate:endDate:location:suggestionsKey:allDay:", v92, v103, v84, v87, v51, v102);

    goto LABEL_56;
  }
  v65 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v120 = (const char *)v39;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Asked to continue unrecognized intent type: %@", buf, 0xCu);
  }

  v14 = 0;
LABEL_73:

  return v14;
}

- (BOOL)_isAnyWindowShowingDelegateCalendar
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
        objc_opt_class(CalendarSceneManager);
        isKindOfClass = objc_opt_isKindOfClass(v8, v9);

        if ((isKindOfClass & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceForSelectedIdentity"));

          if (v13)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (void)_mainViewControllerDidRequestSceneTitleUpdate:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity", a3));

  if (!v4)
    -[CalendarSceneManager _updateSceneTitle](self, "_updateSceneTitle");
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  CalendarSceneManager *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  CalendarSceneManager *v30;
  _BYTE v31[128];

  v5 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v22 = self;
    v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Multiple URLs requested, only one will be opened. URLs:", buf, 2u);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            v14 = v12;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
            *(_DWORD *)buf = 138412290;
            v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "    %@", buf, 0xCu);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v9);
    }

    self = v22;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URL"));
  v18 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager mobileCalWindow](self, "mobileCalWindow"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "windowScene"));
    *(_DWORD *)buf = 138412546;
    v28 = v21;
    v29 = 2112;
    v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Open URL requested. Scene: %@   SceneManager: %@", buf, 0x16u);

  }
  -[CalendarSceneManager _openURL:](self, "_openURL:", v17);

}

- (void)_openURL:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _BYTE *v23;
  id v24;
  unsigned __int8 v25;
  id location;
  unsigned __int8 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Opening URL %@", buf, 0xCu);
  }
  if (self->_showingSplashScreen)
  {
    v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CalendarSceneManager _openURL:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "The splash screen is currently being shown.  Will delay execution of [%s] with URL [%@] until the splash screen is dismissed.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000EA018;
    v28[3] = &unk_1001B53C0;
    v8 = v4;
    v29 = v8;
    v9 = v7;
    v30 = v9;
    objc_copyWeak(&v31, (id *)buf);
    -[CalendarSceneManager setSplashScreenCompletionAction:](self, "setSplashScreenCompletionAction:", v28);
    objc_destroyWeak(&v31);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    v27 = 0;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager _eventURLFromLaunchURL:isTravel:](self, "_eventURLFromLaunchURL:isTravel:", v4, &v27));

    v10 = +[CLLocationManager authorizationStatusForBundleIdentifier:](CLLocationManager, "authorizationStatusForBundleIdentifier:", 0);
    if (!v27 || v10 - 1 >= 2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager model](self, "model"));
      v12 = objc_msgSend(v11, "currentlyLocked");

      if (v12)
      {
        objc_initWeak(&location, self);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v35 = sub_1000EA0F0;
        v36 = sub_1000EA100;
        v37 = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager model](self, "model"));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000EA108;
        v21[3] = &unk_1001B53E8;
        objc_copyWeak(&v24, &location);
        v15 = CUIKCalendarModelDidUnlockNotification;
        v16 = v8;
        v25 = v27;
        v22 = v16;
        v23 = buf;
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v15, v14, 0, v21));
        v18 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v17;

        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      else
      {
        v32 = EKUIEventDetailsFromTravelAdvisoryContextKey;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v27));
        v33 = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
        -[CalendarSceneManager handleURL:context:](self, "handleURL:context:", v8, v20);

      }
    }
  }

}

- (id)_eventURLFromLaunchURL:(id)a3 isTravel:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 0;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "query"));
    if (v7)
    {
      v17 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("?")));
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "isEqualToString:", CFSTR("travel=true")))
            {
              if (a4)
                *a4 = 1;
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?travel=true"), &stru_1001B67C0));

              v15 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v14));
              v6 = (void *)v15;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

      v7 = v17;
    }

  }
  return v6;
}

+ (id)_encodeIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1001F6528;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1001F6528, &stru_1001B5408);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", qword_1001F6520));

  return v5;
}

- (void)_selectedIdentityDidUpdate:(id)a3
{
  CUIKCalendarModel *v4;
  CUIKCalendarModel *model;

  v4 = (CUIKCalendarModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  model = self->_model;

  if (v4 == model)
    -[CalendarSceneManager _updateSceneActivationConditions](self, "_updateSceneActivationConditions");
  -[CalendarSceneManager _updateSceneTitle](self, "_updateSceneTitle");
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  -[CalendarSceneManager _continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:](self, "_continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:", a4, 1, 1, 0);
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v6 = a4;
  v7 = a5;
  v8 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Scene failed to continue user activity with type: \"%@\", error: %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  char *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;

  v8 = a3;
  v9 = (char *)a4;
  v10 = a5;
  v11 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "The application was requested to perform an action for the following shortcut item: [%@]", buf, 0xCu);
  }
  if (self->_showingSplashScreen)
  {
    v12 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CalendarSceneManager windowScene:performActionForShortcutItem:completionHandler:]";
      v26 = 2112;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "The splash screen is currently being shown.  Will delay execution of [%s] with shortcut item [%@] until the splash screen is dismissed.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000EA8C4;
    v18[3] = &unk_1001B5430;
    v19 = v9;
    v14 = v13;
    v20 = v14;
    objc_copyWeak(&v23, (id *)buf);
    v21 = v8;
    v22 = v10;
    -[CalendarSceneManager setSplashScreenCompletionAction:](self, "setSplashScreenCompletionAction:", v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type"));
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.mobilecal.addevent"));

    v17 = kCalUILogHandle;
    if ((_DWORD)v16)
    {
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Received Add Event Springboard Quick Action '%@'.", buf, 0xCu);
      }
      -[MainWindowRootViewController showAddEvent](self->_rootViewController, "showAddEvent");
    }
    else if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unrecognized Springboard Quick Action '%@'.", buf, 0xCu);
    }
    if (v10)
      (*((void (**)(id, id))v10 + 2))(v10, v16);
  }

}

- (void)_constructAndPresentSplashScreenFromViewController:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SplashScreenViewController *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id from;
  id location;
  uint8_t buf[4];
  SplashScreenViewController *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_receivedSplashScreenCompletedNotification", CFSTR("_CalendarSceneManagerDidCompleteSplashScreenNotification"), 0);

  v9 = objc_alloc_init(SplashScreenViewController);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v9);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000EAC14;
  v15[3] = &unk_1001B5458;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  v15[4] = self;
  -[SplashScreenViewController setDoneBlock:](v9, "setDoneBlock:", v15);
  self->_showingSplashScreen = 1;
  v10 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Presenting splash screen view controller: [%@]", buf, 0xCu);
  }
  EKUIPushFallbackSizingContextWithViewHierarchy(v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EAE94;
  v12[3] = &unk_1001B4028;
  objc_copyWeak(&v14, &from);
  v11 = v7;
  v13 = v11;
  objc_msgSend(v6, "presentViewController:animated:completion:", v9, 1, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_splashScreenDidDismissShouldNotify:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void (**v7)(void);
  void *v8;
  uint8_t v9[16];

  v3 = a3;
  self->_showingSplashScreen = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarSceneManager splashScreenCompletionAction](self, "splashScreenCompletionAction"));

  if (v5)
  {
    v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Executing delayed application request.", v9, 2u);
    }
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CalendarSceneManager splashScreenCompletionAction](self, "splashScreenCompletionAction"));
    v7[2]();

    -[CalendarSceneManager setSplashScreenCompletionAction:](self, "setSplashScreenCompletionAction:", 0);
  }
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("_CalendarSceneManagerDidCompleteSplashScreenNotification"), self);

  }
}

- (void)_receivedSplashScreenCompletedNotification
{
  void *v3;
  NSObject *v4;
  RootNavigationController *rootNavigationController;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_CalendarSceneManagerDidCompleteSplashScreenNotification"), 0);

  if (self->_showingSplashScreen)
  {
    v4 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Received notification that splash screen view controller completed, dismissing.", buf, 2u);
    }
    rootNavigationController = self->_rootNavigationController;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000EB120;
    v6[3] = &unk_1001B2538;
    v6[4] = self;
    -[RootNavigationController dismissViewControllerAnimated:completion:](rootNavigationController, "dismissViewControllerAnimated:completion:", 1, v6);
  }
}

- (MainWindowRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (id)splashScreenCompletionAction
{
  return self->_splashScreenCompletionAction;
}

- (void)setSplashScreenCompletionAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CalendarDiagnosticsUIViewController)diagnosticsViewController
{
  return self->_diagnosticsViewController;
}

- (void)setDiagnosticsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsViewController, 0);
  objc_storeStrong(&self->_splashScreenCompletionAction, 0);
  objc_storeStrong((id *)&self->_selectedOccurrenceToRestoreAfterConnection, 0);
  objc_storeStrong((id *)&self->_shortcutItemToRunAfterConnection, 0);
  objc_storeStrong((id *)&self->_userActivitiesToContinueAfterConnection, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_rootNavigationController, 0);
  objc_storeStrong((id *)&self->_mobileCalWindow, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
