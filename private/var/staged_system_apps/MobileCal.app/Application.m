@implementation Application

- (void)requestLocationAuthorization
{
  CLLocationManager *v3;
  CLLocationManager *locationManager;

  v3 = (CLLocationManager *)objc_alloc_init((Class)CLLocationManager);
  locationManager = self->_locationManager;
  self->_locationManager = v3;

  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
}

- (void)_topMainViewControllerCompletedExtendedLaunch:(id)a3
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = -[Application _extractViewTypeFromUserInfo:withKey:](self, "_extractViewTypeFromUserInfo:withKey:", v4, CFSTR("_MainViewControllerExtendedLaunchDidCompleteNotification_CalendarContentViewType_Key"));

  -[Application _extendedLaunchCompletedByView:](self, "_extendedLaunchCompletedByView:", v5);
}

- (int64_t)_extractViewTypeFromUserInfo:(id)a3 withKey:(id)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", a4));
  v5 = v4;
  if (v4)
    v6 = (int64_t)objc_msgSend(v4, "integerValue");
  else
    v6 = -1;

  return v6;
}

- (void)requestNotificationAuthorization
{
  void *v3;
  _QWORD v4[5];

  if (!self->_requestedNotificationAuthorization && !self->_notificationAuthorizationGranted)
  {
    self->_requestedNotificationAuthorization = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[Application userNotificationCenter](self, "userNotificationCenter"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000048B0;
    v4[3] = &unk_1001B57A8;
    v4[4] = self;
    objc_msgSend(v3, "requestAuthorizationWithOptions:completionHandler:", 7, v4);

  }
}

+ (double)_resumeToTodayTimeout
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

+ (id)createNewCalendarModel
{
  void *v3;
  void *v4;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_setUpModel"));
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)_mobilecalDidBecomeActive
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calendar did become active", buf, 2u);
  }
  if (!-[Application _showingSplashScreen](self, "_showingSplashScreen"))
  {
    -[Application requestLocationAuthorization](self, "requestLocationAuthorization");
    v4 = dispatch_queue_create("com.apple.calendar.defer_contacts_initialization", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001CBDC;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_async(v4, block);
    -[Application requestNotificationAuthorization](self, "requestNotificationAuthorization");

  }
  if (self->_extendedLaunchCompleted && (objc_msgSend(UIApp, "launchedToTest") & 1) == 0)
  {
    v5 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because MobileCal became active", buf, 2u);
    }
    +[CalWidgetUtils refreshEventWidgets](CalWidgetUtils, "refreshEventWidgets");
    +[CalWidgetUtils refreshDateWidgets](CalWidgetUtils, "refreshDateWidgets");
  }
}

- (Application)init
{
  Application *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  void *v10;

  v8.receiver = self;
  v8.super_class = (Class)Application;
  v2 = -[Application init](&v8, "init");
  if (v2)
  {
    CalUILogInitialize();
    EKUILogInitIfNeeded();
    v3 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processName"));
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Launching [%@]", buf, 0xCu);

    }
    -[Application setDelegate:](v2, "setDelegate:", v2);
  }
  return v2;
}

- (BOOL)_showingSplashScreen
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[Application allSceneManagers](self, "allSceneManagers"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "showingSplashScreen", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)_findSomeCalendarModel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Application allSceneManagers](self, "allSceneManagers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));

  return v4;
}

+ (id)_setUpModel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MobileCalEventStoreDataPath")));

  +[EKEventStore setPredicatePropertyLoadMode:](EKEventStore, "setPredicatePropertyLoadMode:", 2);
  v6 = qword_1001F6568;
  if (qword_1001F6568)
  {
    v7 = objc_alloc((Class)CUIKCalendarModel);
    v8 = objc_msgSend(v7, "initWithEventStore:pasteboardManager:", qword_1001F6568, 0);
  }
  else
  {
    v9 = objc_alloc((Class)CUIKCalendarModel);
    if (v5)
      v10 = objc_msgSend(v9, "initWithDataPath:pasteboardManager:", v5, 0);
    else
      v10 = objc_msgSend(v9, "initWithPasteboardManager:", 0);
    v8 = v10;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventStore"));
    v12 = (void *)qword_1001F6568;
    qword_1001F6568 = v11;

  }
  objc_msgSend(v8, "setAutoStartNotificationMonitor:", 0);
  objc_msgSend(v8, "setAllowEventLocationPrediction:", 0);
  objc_msgSend(v8, "setMaxCachedDays:", 300);
  objc_msgSend((id)objc_opt_class(a1), "_setModelDateForLaunch:restoreLastViewedDateFromPreferenceIfNeeded:", v8, v6 == 0);

  return v8;
}

- (void)registerForStateCapture
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  id location;

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("com.apple.calendar.calendarmodel.stateCaptureQ", v4);

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FC114;
  v7[3] = &unk_1001B56B8;
  objc_copyWeak(&v8, &location);
  CalAddStateCaptureBlock(v5, "[UserStateLog] Selected Calendars", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000FC4E0;
  v6[3] = &unk_1001B56E0;
  v6[4] = self;
  CalAddStateCaptureBlock(v5, "Notifying Listeners that State Capture Happened in MobileCal", v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

+ (void)_setModelDateForLaunch:(id)a3 restoreLastViewedDateFromPreferenceIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  id v34;

  v4 = a4;
  v34 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastSuspendTime"));

  v10 = CUIKNowDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(a1, "_resumeToTodayTimeout");
  v13 = v12;
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v15 = v14;
  v16 = objc_msgSend(v9, "doubleValue");
  if (!v4)
    goto LABEL_7;
  if (!v9)
    goto LABEL_7;
  if (v15 - v17 > v13)
    goto LABEL_7;
  v16 = objc_msgSend(UIApp, "launchedToTest");
  if ((v16 & 1) != 0)
    goto LABEL_7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastViewedDate"));

  if (!v19)
    goto LABEL_7;
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  v22 = objc_msgSend(objc_alloc((Class)NSTimeZone), "initWithName:", CFSTR("GMT"));
  v23 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithAbsoluteTime:timeZone:", v22, v21);
  v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "calendarDateInTimeZone:", v7));

  if (!v24)
  {
LABEL_7:
    v25 = CUIKNowComponents(v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v24 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithDateComponents:timeZone:", v26, v7);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "environment"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("SelectedDateName")));

  if (v29)
  {
    objc_msgSend(v29, "doubleValue");
    v31 = -v30;
    if (v30 >= 0.0)
      v31 = v30;
    if (v31 > 0.00001)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      v33 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithDate:timeZone:", v32, v7);

      v24 = v33;
    }
  }
  objc_msgSend(v34, "setSelectedDate:", v24);

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _UNKNOWN **v34;
  void *v35;
  void *v36;
  void *v37;
  int v39;
  id v40;
  CGRect v41;

  v5 = a3;
  +[CalMCSignpost beginLaunch:](CalMCSignpost, "beginLaunch:", 0);
  v6 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 138412290;
    v40 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calendar Finished Launching [%@]", (uint8_t *)&v39, 0xCu);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v17 = v16;
    v41.origin.x = v9;
    v41.origin.y = v11;
    v41.size.width = v13;
    v41.size.height = v15;
    v18 = NSStringFromCGRect(v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v39 = 138412290;
    v40 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Main screen bounds [%@]", (uint8_t *)&v39, 0xCu);

  }
  +[UIWindow _setTransformLayerRotationsAreEnabled:](UIWindow, "_setTransformLayerRotationsAreEnabled:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringForKey:", CFSTR("UITestingLastConfirmedSplashScreenVersionViewed")));
  v22 = v21;
  if (v21)
  {
    v23 = objc_msgSend(v21, "integerValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[EKPreferences shared](EKPreferences, "shared"));
    objc_msgSend(v24, "setLastConfirmedSplashScreenVersion:", v23);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringForKey:", CFSTR("UITestingShowListView")));
  v26 = v25;
  if (v25)
  {
    v27 = objc_msgSend(v25, "BOOLValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    objc_msgSend(v28, "setShowListView:", v27);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "environment"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("StartingViewOverride")));

  if (v31)
  {
    if (objc_msgSend(v31, "isEqual:", CFSTR("day")))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v33 = v32;
      v34 = &off_1001BC490;
    }
    else if (objc_msgSend(v31, "isEqual:", CFSTR("week")))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v33 = v32;
      v34 = &off_1001BC4A8;
    }
    else if (objc_msgSend(v31, "isEqual:", CFSTR("month")))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v33 = v32;
      v34 = &off_1001BC4C0;
    }
    else if (objc_msgSend(v31, "isEqual:", CFSTR("year")))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v33 = v32;
      v34 = &off_1001BC4D8;
    }
    else
    {
      if (!objc_msgSend(v31, "isEqual:", CFSTR("list")))
        goto LABEL_21;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v33 = v32;
      v34 = &off_1001BC4F0;
    }
    objc_msgSend(v32, "setLastViewMode:", v34);

  }
LABEL_21:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  -[Application setUserNotificationCenter:](self, "setUserNotificationCenter:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[Application userNotificationCenter](self, "userNotificationCenter"));
  objc_msgSend(v36, "setDelegate:", self);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_mobilecalDidEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_mobilecalWillResignActive", UIApplicationWillResignActiveNotification, 0);
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_mobilecalDidBecomeActive", UIApplicationDidBecomeActiveNotification, 0);
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_selectedCalendarSaveToPreferencesNotificationReceived:", CUIKCalendarModelVisibleCalendarPreferenceRequiresSavingNotification, 0);
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_collapsedSectionIdentifiersSaveToPreferencesNotificationReceived:", CUIKCalendarModelCollapsedSectionIdentifiersPreferenceRequiresSavingNotification, 0);
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_displayedOccurrencesChangedForTheFirstTime:", CFSTR("_CalendarSceneManagerDidChangeDisplayedOccurrencesForTheFirstTimeNotification"), 0);
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_topMainViewControllerCompletedExtendedLaunch:", CFSTR("MainViewControllerDidCompleteExtendedLaunchNotification"), 0);
  if (+[EKFeatureSet mustDisplaySplashScreenToUser](EKFeatureSet, "mustDisplaySplashScreenToUser"))objc_msgSend(v37, "addObserver:selector:name:object:", self, "_sceneManagerDidDismissSplashScreen", CFSTR("_CalendarSceneManagerDidCompleteSplashScreenNotification"), 0);
  +[CalendarSceneManager setApplicationLastActiveTimeProvider:](CalendarSceneManager, "setApplicationLastActiveTimeProvider:", self);
  -[Application registerForStateCapture](self, "registerForStateCapture");
  -[Application registerAppIntentsDependencies](self, "registerAppIntentsDependencies");

  return 1;
}

- (void)_extendedLaunchCompletedByView:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calendar extended launch completed", buf, 2u);
  }
  if (objc_msgSend(UIApp, "shouldRecordExtendedLaunchTime"))
  {
    v6 = (void *)UIApp;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "_launchTestName"));
    objc_msgSend(v6, "finishedTest:extraResults:", v7, 0);

  }
  +[CalMCSignpost endLaunchToView:extended:](CalMCSignpost, "endLaunchToView:extended:", a3, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("_CalendarSceneManagerDidChangeDisplayedOccurrencesForTheFirstTimeNotification"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("MainViewControllerDidCompleteExtendedLaunchNotification"), 0);

  self->_extendedLaunchCompleted = 1;
  if ((objc_msgSend(UIApp, "launchedToTest") & 1) == 0)
  {
    v10 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because MobileCal finished launching", v13, 2u);
    }
    +[CalWidgetUtils refreshEventWidgets](CalWidgetUtils, "refreshEventWidgets");
    +[CalWidgetUtils refreshDateWidgets](CalWidgetUtils, "refreshDateWidgets");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[Application _findSomeCalendarModel](self, "_findSomeCalendarModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventStore"));
    +[EKUIDiscoverabilityUtilities scanEventsForDiscoveredConferencesIfNeeded:](EKUIDiscoverabilityUtilities, "scanEventsForDiscoveredConferencesIfNeeded:", v12);

  }
}

- (id)_extendLaunchTest
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = _UIWindowSceneSessionRoleCarPlay;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9), "session"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "role"));
        v13 = objc_msgSend(v12, "isEqualToString:", v8);

        if (!v13)
        {

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[Application tester](self, "tester"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "extendedLaunchTestName"));

          v17 = kCalUILogTestHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Extended launch test name: [%@]", buf, 0xCu);
          }
          return v16;
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v6)
        continue;
      break;
    }
  }

  return 0;
}

- (ApplicationTester)tester
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000080F4;
  block[3] = &unk_1001B2538;
  block[4] = self;
  if (qword_1001F6570 != -1)
    dispatch_once(&qword_1001F6570, block);
  return self->_tester;
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (void)requestContactsAuthorization
{
  id v2;

  v2 = +[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider");
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4;
  CLLocationManager *locationManager;
  CLLocationManager *v6;

  v4 = objc_msgSend(a3, "authorizationStatus");
  locationManager = self->_locationManager;
  if (v4)
  {
    -[CLLocationManager setDelegate:](locationManager, "setDelegate:", 0);
    v6 = self->_locationManager;
    self->_locationManager = 0;

  }
  else
  {
    -[CLLocationManager requestWhenInUseAuthorization](locationManager, "requestWhenInUseAuthorization");
  }
}

- (id)applicationLastActiveTime
{
  return self->_applicationLastActiveTime;
}

- (RootNavigationController)rootNavigationController
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Application tester](self, "tester"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Application _rootNavigationControllerForModel:](self, "_rootNavigationControllerForModel:", v4));

  return (RootNavigationController *)v5;
}

- (id)_rootNavigationControllerForModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedScenes"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
        v12 = objc_opt_class(CalendarSceneManager);
        isKindOfClass = objc_opt_isKindOfClass(v11, v12);

        if ((isKindOfClass & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[Application tester](self, "tester"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "model"));

          if (v15 == v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rootNavigationController"));

            goto LABEL_13;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (MainWindowRootViewController)rootViewController
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Application tester](self, "tester"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Application _rootViewControllerForModel:](self, "_rootViewControllerForModel:", v4));

  return (MainWindowRootViewController *)v5;
}

- (id)_rootViewControllerForModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedScenes"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
        v12 = objc_opt_class(CalendarSceneManager);
        isKindOfClass = objc_opt_isKindOfClass(v11, v12);

        if ((isKindOfClass & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[Application tester](self, "tester"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "model"));

          if (v15 == v17)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mobileCalWindow"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rootViewController"));

            goto LABEL_13;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (void)_displayedOccurrencesChangedForTheFirstTime:(id)a3
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = -[Application _extractViewTypeFromUserInfo:withKey:](self, "_extractViewTypeFromUserInfo:withKey:", v4, CFSTR("_CalendarSceneManagerDidChangeDisplayedOccurrencesForTheFirstTimeNotification_CalendarContentViewType_Key"));

  -[Application _extendedLaunchCompletedByView:](self, "_extendedLaunchCompletedByView:", v5);
}

- (void)_mobilecalDidEnterBackground
{
  NSObject *v3;
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  NSDate **p_applicationLastActiveTime;
  NSObject *v14;
  NSDate *v15;
  int v16;
  NSDate *v17;

  v3 = kCalUILogHandle;
  v4 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calendar did enter background", (uint8_t *)&v16, 2u);
  }
  self->_requestedNotificationAuthorization = 0;
  v5 = (id)EKUIShouldSaveStateInPreferences(v4);
  if ((_DWORD)v5)
    v5 = -[Application _persistActiveViewModeSettingToPreferences](self, "_persistActiveViewModeSettingToPreferences");
  v8 = CUIKNowDate(v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  objc_msgSend(v12, "setLastSuspendTime:", v11);

  p_applicationLastActiveTime = &self->_applicationLastActiveTime;
  objc_storeStrong((id *)&self->_applicationLastActiveTime, v9);
  v14 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v15 = *p_applicationLastActiveTime;
    v16 = 138412290;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "35182919: didEnterBackground: lastActiveTime = %@", (uint8_t *)&v16, 0xCu);
  }

}

- (void)_mobilecalWillResignActive
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSDate **p_applicationLastActiveTime;
  NSObject *v7;
  NSDate *v8;
  int v9;
  NSDate *v10;

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calendar will resign active", (uint8_t *)&v9, 2u);
  }
  v4 = CUIKNowDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  p_applicationLastActiveTime = &self->_applicationLastActiveTime;
  objc_storeStrong((id *)&self->_applicationLastActiveTime, v5);
  v7 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v8 = *p_applicationLastActiveTime;
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "35182919: willResignActive: lastActiveTime = %@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)_persistActiveViewModeSettingToPreferences
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
      objc_opt_class(CalendarSceneManager);
      isKindOfClass = objc_opt_isKindOfClass(v9, v10);

      if ((isKindOfClass & 1) != 0)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));

    if (!v12)
      return;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootNavigationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v13, "currentViewType")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    objc_msgSend(v15, "setLastViewMode:", v14);

    v16 = objc_msgSend(objc_alloc((Class)NSTimeZone), "initWithName:", CFSTR("GMT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "model"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "calendarDateInTimeZone:", v16));

    objc_msgSend(v19, "absoluteTime");
    v21 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    objc_msgSend(v22, "setLastViewedDate:", v21);

    if (objc_msgSend(v13, "shouldSaveSelectedEvent"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "model"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "selectedOccurrence"));

    }
    else
    {
      v24 = 0;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueID"));
    objc_msgSend(v25, "setLastViewedOccurrenceUID:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
    objc_msgSend(v27, "setLastViewedOccurrenceDate:", v28);

  }
  else
  {
LABEL_9:
    v12 = v3;
  }

}

- (void)applicationWillTerminate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calendar will terminate", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  void *v72;
  void *v73;
  double v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  uint64_t v80;
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
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  objc_super v140;
  void *v141;
  _QWORD v142[17];
  _QWORD v143[5];
  _QWORD v144[2];

  v4 = a3;
  v140.receiver = self;
  v140.super_class = (Class)Application;
  -[Application buildMenuWithBuilder:](&v140, "buildMenuWithBuilder:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "system"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));

  if (v6 == v7)
  {
    *(_QWORD *)&v8 = objc_opt_class(self).n128_u64[0];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v9, v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("New Event"), &stru_1001B67C0, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v11, 0, "routeNewEventKeyCommand", CFSTR("n"), 0x100000, 0));
    v144[0] = v12;
    *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v14, v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Save Event"), &stru_1001B67C0, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v16, 0, "handleSaveKeyCommand", CFSTR("s"), 0x100000, 0));
    v144[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v144, 2));
    v19 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v18));

    v137 = (void *)v19;
    objc_msgSend(v5, "insertChildMenu:atStartOfMenuForIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_1001B67C0, 0, "handleCloseKeyCommand", UIKeyInputEscape, 0, 0));
    objc_msgSend(v20, "setAttributes:", 4);
    *(_QWORD *)&v21 = objc_opt_class(self).n128_u64[0];
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v22, v21));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Edit Event"), &stru_1001B67C0, 0));
    v139 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v24, 0, "_performEditKeyCommand", CFSTR("e"), 0x100000, 0));

    *(_QWORD *)&v25 = objc_opt_class(self).n128_u64[0];
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v26, v25));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Delete - keyboard shortcut"), CFSTR("Delete"), 0));
    v29 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v28, 0, "handleDeleteKeyCommand", UIKeyInputDelete, 0, 0));

    *(_QWORD *)&v30 = objc_opt_class(self).n128_u64[0];
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v31, v30));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Duplicate - keyboard shortcut"), CFSTR("Duplicate"), 0));
    v34 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v33, 0, "handleDuplicateKeyCommand", CFSTR("d"), 0x100000, 0));

    *(_QWORD *)&v35 = objc_opt_class(self).n128_u64[0];
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v36, v35));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Keyboard shortcut - search"), CFSTR("Search"), 0));
    v39 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v38, 0, "routeSearchKeyCommand", CFSTR("f"), 0x100000, 0));

    v138 = v5;
    objc_msgSend(v5, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuEdit, &stru_1001B5650);
    v133 = (void *)v39;
    v134 = (void *)v34;
    v143[0] = v39;
    v143[1] = v139;
    v135 = (void *)v29;
    v136 = v20;
    v143[2] = v20;
    v143[3] = v29;
    v143[4] = v34;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v143, 5));
    v41 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v40));

    v132 = (void *)v41;
    objc_msgSend(v5, "insertChildMenu:atStartOfMenuForIdentifier:", v41, UIMenuEdit);
    *(_QWORD *)&v42 = objc_opt_class(self).n128_u64[0];
    v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v43, v42));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "localizedStringForKey:value:table:", CFSTR("Show Today"), &stru_1001B67C0, 0));
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v130, 0, "handleTodayKeyCommand", CFSTR("t"), 0x100000, 0));
    v142[0] = v129;
    *(_QWORD *)&v44 = objc_opt_class(self).n128_u64[0];
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v45, v44));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "localizedStringForKey:value:table:", CFSTR("Refresh Calendars"), &stru_1001B67C0, 0));
    v126 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v127, 0, "handleRefreshKeyCommand", CFSTR("r"), 0x100000, 0));
    v142[1] = v126;
    *(_QWORD *)&v46 = objc_opt_class(self).n128_u64[0];
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v47, v46));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "localizedStringForKey:value:table:", CFSTR("Go to the Next Day, Week, Month or Year"), &stru_1001B67C0, 0));
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v124, 0, "handleGoToNextDateComponentUnitCommand"));
    v142[2] = v123;
    *(_QWORD *)&v48 = objc_opt_class(self).n128_u64[0];
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v49, v48));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "localizedStringForKey:value:table:", CFSTR("Go to the Previous Day, Week, Month or Year"), &stru_1001B67C0, 0));
    v120 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v121, 0, "handleGoToPreviousDateComponentUnitCommand"));
    v142[3] = v120;
    *(_QWORD *)&v50 = objc_opt_class(self).n128_u64[0];
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v51, v50));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "localizedStringForKey:value:table:", CFSTR("Go to Day View"), &stru_1001B67C0, 0));
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v118, 0, "handleDayKeyCommand", CFSTR("1"), 0x100000, 0));
    v142[4] = v117;
    *(_QWORD *)&v52 = objc_opt_class(self).n128_u64[0];
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v53, v52));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "localizedStringForKey:value:table:", CFSTR("Go to Week View"), &stru_1001B67C0, 0));
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v115, 0, "handleWeekKeyCommand", CFSTR("2"), 0x100000, 0));
    v142[5] = v114;
    *(_QWORD *)&v54 = objc_opt_class(self).n128_u64[0];
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v55, v54));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("Go to Month View"), &stru_1001B67C0, 0));
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v112, 0, "handleMonthKeyCommand", CFSTR("3"), 0x100000, 0));
    v142[6] = v111;
    *(_QWORD *)&v56 = objc_opt_class(self).n128_u64[0];
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v57, v56));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "localizedStringForKey:value:table:", CFSTR("Go to Year View"), &stru_1001B67C0, 0));
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v109, 0, "handleYearKeyCommand", CFSTR("4"), 0x100000, 0));
    v142[7] = v108;
    *(_QWORD *)&v58 = objc_opt_class(self).n128_u64[0];
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v59, v58));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "localizedStringForKey:value:table:", CFSTR("Select the Next Event"), &stru_1001B67C0, 0));
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v106, 0, "handleSelectNextEventCommand", CFSTR("\t"), 0x80000, CFSTR("tab")));
    v142[8] = v105;
    *(_QWORD *)&v60 = objc_opt_class(self).n128_u64[0];
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v61, v60));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "localizedStringForKey:value:table:", CFSTR("Select the Previous Event"), &stru_1001B67C0, 0));
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v103, 0, "handleSelectPreviousEventCommand", CFSTR("\t"), 655360, CFSTR("shift tab")));
    v142[9] = v102;
    *(_QWORD *)&v62 = objc_opt_class(self).n128_u64[0];
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v63, v62));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "localizedStringForKey:value:table:", CFSTR("Select the Next Event"), &stru_1001B67C0, 0));
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v100, 0, "handleSelectNextEventCommand", UIKeyInputRightArrow, 0x80000, CFSTR("right arrow")));
    v142[10] = v99;
    *(_QWORD *)&v64 = objc_opt_class(self).n128_u64[0];
    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v65, v64));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("Select the Previous Event"), &stru_1001B67C0, 0));
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v96, 0, "handleSelectPreviousEventCommand", UIKeyInputLeftArrow, 0x80000, CFSTR("left arrow")));
    v142[11] = v97;
    *(_QWORD *)&v66 = objc_opt_class(self).n128_u64[0];
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v67, v66));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("Select the Next Event"), &stru_1001B67C0, 0));
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v94, 0, "handleSelectNextEventCommand", UIKeyInputDownArrow, 0x80000, CFSTR("down arrow")));
    v142[12] = v93;
    *(_QWORD *)&v68 = objc_opt_class(self).n128_u64[0];
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v69, v68));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "localizedStringForKey:value:table:", CFSTR("Select the Previous Event"), &stru_1001B67C0, 0));
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v91, 0, "handleSelectPreviousEventCommand", UIKeyInputUpArrow, 0x80000, CFSTR("up arrow")));
    v142[13] = v90;
    *(_QWORD *)&v70 = objc_opt_class(self).n128_u64[0];
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v71, v70));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Select the Next Occurrence"), &stru_1001B67C0, 0));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v72, 0, "handleSelectNextOccurrenceCommand", CFSTR("]"), 0x100000, 0));
    v142[14] = v73;
    *(_QWORD *)&v74 = objc_opt_class(self).n128_u64[0];
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v75, v74));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("Select the Previous Occurrence"), &stru_1001B67C0, 0));
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v77, 0, "handleSelectPreviousOccurrenceCommand", CFSTR("["), 0x100000, 0));
    v142[15] = v78;
    *(_QWORD *)&v79 = objc_opt_class(self).n128_u64[0];
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v80, v79));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("View Availability…"), &stru_1001B67C0, 0));
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v82, 0, "handleViewAvailabilityCommand", CFSTR("a"), 1179648, 0));
    v142[16] = v83;
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v142, 17));
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v84));

    v5 = v138;
    objc_msgSend(v138, "insertChildMenu:atStartOfMenuForIdentifier:", v85, UIMenuView);
    if (+[EKFeatureSet mustDisplaySplashScreenToUser](EKFeatureSet, "mustDisplaySplashScreenToUser"))
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_1001B67C0, 0, "handleDismissSplashScreenKeyCommand", CFSTR("\r"), 0, 0));
      objc_msgSend(v86, "setAttributes:", 4);
      v141 = v86;
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v141, 1));
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v87));

      objc_msgSend(v138, "insertChildMenu:atStartOfMenuForIdentifier:", v88, UIMenuApplication);
    }

  }
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  __objc2_class **v9;
  void *v10;
  unsigned int v11;
  double v12;
  uint64_t v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "configuration", a3));
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v8 = objc_msgSend(v7, "isEqualToString:", _UIWindowSceneSessionRoleCarPlay);

  if ((v8 & 1) != 0)
  {
    v9 = off_1001B13A8;
LABEL_5:
    *(_QWORD *)&v12 = objc_opt_class(*v9).n128_u64[0];
    objc_msgSend(v6, "setDelegateClass:", v13, v12);
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v11 = objc_msgSend(v10, "isEqualToString:", UIWindowSceneSessionRoleApplication);

  if (v11)
  {
    v9 = off_1001B13A0;
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (void)_collapsedSectionIdentifiersSaveToPreferencesNotificationReceived:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  objc_opt_class(CUIKCalendarModel);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[Application allSceneManagers](self, "allSceneManagers"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "model"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collapsedSectionIdentifiers"));
          v16 = v15;
          if (v11)
            objc_msgSend(v11, "intersectSet:", v15);
          else
            v11 = objc_msgSend(v15, "mutableCopy");

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = &__NSArray0__struct;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[EKPreferences shared](EKPreferences, "shared"));
    objc_msgSend(v20, "setCollapsedSectionIdentifiers:", v19);

  }
}

- (void)_selectedCalendarSaveToPreferencesNotificationReceived:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint8_t v35[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  objc_opt_class(CUIKCalendarModel);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[Application allSceneManagers](self, "allSceneManagers"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i), "model"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sourceForSelectedIdentity"));

          if (!v14)
          {
            v15 = 0;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v10)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_12:

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
          if ((v15 & 1) == 0)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j), "model"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sourceForSelectedIdentity"));

            if (v24)
              continue;
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "model"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "unselectedCalendarsIgnoringFocus"));
          v27 = v26;
          if (v19)
            objc_msgSend(v19, "intersectSet:", v26);
          else
            v19 = objc_msgSend(v26, "mutableCopy");

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CUIKCalendarModelVisibleCalendarPreferenceRequiresSavingNotificationReasonKey));

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[EKPreferences shared](EKPreferences, "shared"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));
    v32 = (void *)v31;
    if (v31)
      v33 = (void *)v31;
    else
      v33 = &__NSArray0__struct;
    objc_msgSend(v30, "setDeselectedCalendars:reason:", v33, v29);

    if ((objc_msgSend(UIApp, "launchedToTest") & 1) == 0)
    {
      v34 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because of selectedCalendar change notification", v35, 2u);
      }
      +[CalWidgetUtils refreshEventWidgets](CalWidgetUtils, "refreshEventWidgets");
    }

  }
}

- (void)_sceneManagerDidDismissSplashScreen
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void (**v7)(void);
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Calendar - a sceneManager dismissed a splash screen.", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_CalendarSceneManagerDidCompleteSplashScreenNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Application applicationRequestDelayer](self, "applicationRequestDelayer"));
  if (v5)
  {
    v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Executing delayed application request.", v9, 2u);
    }
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[Application applicationRequestDelayer](self, "applicationRequestDelayer"));
    v7[2]();

    -[Application setApplicationRequestDelayer:](self, "setApplicationRequestDelayer:", 0);
  }
  -[Application requestLocationAuthorization](self, "requestLocationAuthorization");
  -[Application requestContactsAuthorization](self, "requestContactsAuthorization");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
  objc_msgSend(v8, "setNeedsRebuild");

}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  NSObject *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  dispatch_time_t v23;
  _QWORD *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *group;
  id obj;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD block[5];
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD v44[5];
  NSObject *v45;
  __int128 *p_buf;
  _QWORD *v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[3];
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  __int128 buf;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _BYTE v62[128];

  v28 = a3;
  v29 = a4;
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[Application application:performFetchWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Calendar %s", (uint8_t *)&buf, 0xCu);
  }
  group = dispatch_group_create();
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v56[3] = 1;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedScenes"));

  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v53;
    v30 = CUIKCalendarModelDisplayedOccurrencesChangedNotification;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate", v28));
        objc_opt_class(CalendarSceneManager);
        isKindOfClass = objc_opt_isKindOfClass(v11, v12);

        if ((isKindOfClass & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
          if (objc_msgSend(v10, "activationState"))
          {
            v50[0] = 0;
            v50[1] = v50;
            v50[2] = 0x2020000000;
            v51 = 0;
            v48[0] = 0;
            v48[1] = v48;
            v48[2] = 0x2020000000;
            v49 = 0;
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v58 = 0x3032000000;
            v59 = sub_1000FD1D0;
            v60 = sub_1000FD1E0;
            v61 = 0;
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_1000FD1E8;
            v44[3] = &unk_1001B5708;
            v44[4] = v10;
            p_buf = &buf;
            v47 = v56;
            v15 = group;
            v45 = v15;
            v16 = objc_retainBlock(v44);
            dispatch_group_enter(v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_1000FD308;
            v40[3] = &unk_1001B5730;
            v42 = v48;
            v40[4] = v10;
            v43 = v50;
            v20 = v16;
            v41 = v20;
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v30, v18, v19, v40));
            v22 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v21;

            v23 = dispatch_time(0, 8000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000FD3F0;
            block[3] = &unk_1001B5758;
            v38 = v50;
            block[4] = v10;
            v39 = v48;
            v24 = v20;
            v37 = v24;
            dispatch_after(v23, (dispatch_queue_t)&_dispatch_main_q, block);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
            objc_msgSend(v25, "updateAfterAppResume");

            _Block_object_dispose(&buf, 8);
            _Block_object_dispose(v48, 8);
            _Block_object_dispose(v50, 8);
          }
          else
          {
            v26 = kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v10;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Not updating scene snapshot because it's already active: %@", (uint8_t *)&buf, 0xCu);
            }
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v7);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000FD4C4;
  v33[3] = &unk_1001B5780;
  v34 = v29;
  v35 = v56;
  v27 = v29;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, v33);

  _Block_object_dispose(v56, 8);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[Application tester](self, "tester"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[Application _findSomeCalendarModel](self, "_findSomeCalendarModel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[Application tester](self, "tester"));
    objc_msgSend(v14, "setModel:", v13);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[Application tester](self, "tester"));
  v16 = objc_msgSend(v15, "application:runTest:options:", v10, v9, v8);

  return v16;
}

- (NSArray)allSceneManagers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedScenes"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
        objc_opt_class(CalendarSceneManager);
        isKindOfClass = objc_opt_isKindOfClass(v12, v13);

        if ((isKindOfClass & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
          objc_msgSend(v4, "addObject:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return (NSArray *)v4;
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
  block[2] = sub_1000FD800;
  block[3] = &unk_1001B2538;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v6 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  v8 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 26));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v13 = 138543874;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will present notification with options = %{public}@, notification identifier = %{public}@, notification = %@", (uint8_t *)&v13, 0x20u);

  }
  v7[2](v7, 26);

}

- (BOOL)optionKeyIsDown
{
  NSObject *v3;
  unint64_t optionKeyDown;
  int v6;
  unint64_t v7;

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    optionKeyDown = self->_optionKeyDown;
    v6 = 134217984;
    v7 = optionKeyDown;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "optionKeyIsDown: %lu", (uint8_t *)&v6, 0xCu);
  }
  return self->_optionKeyDown != 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  unint64_t optionKeyDown;
  id v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unint64_t v25;
  _BYTE v26[128];

  v6 = a3;
  v18 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "characters"));
        if (objc_msgSend(v13, "length"))
        {

        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
          v15 = objc_msgSend(v14, "modifierFlags");

          if ((v15 & 0x80000) != 0)
          {
            ++self->_optionKeyDown;
            v16 = kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
            {
              optionKeyDown = self->_optionKeyDown;
              *(_DWORD *)buf = 134217984;
              v25 = optionKeyDown;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "optionKeyPress: %lu", buf, 0xCu);
            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }
  v19.receiver = self;
  v19.super_class = (Class)Application;
  -[Application pressesBegan:withEvent:](&v19, "pressesBegan:withEvent:", v6, v18);

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  unint64_t optionKeyDown;
  id v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unint64_t v25;
  _BYTE v26[128];

  v6 = a3;
  v18 = a4;
  if (self->_optionKeyDown)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "characters"));
          if (objc_msgSend(v13, "length"))
          {

          }
          else
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
            v15 = objc_msgSend(v14, "modifierFlags");

            if ((v15 & 0x80000) != 0)
            {
              --self->_optionKeyDown;
              v16 = kCalUILogHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
              {
                optionKeyDown = self->_optionKeyDown;
                *(_DWORD *)buf = 134217984;
                v25 = optionKeyDown;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "optionKeyRelease: %lu", buf, 0xCu);
              }
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v8);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)Application;
  -[Application pressesEnded:withEvent:](&v19, "pressesEnded:withEvent:", v6, v18);

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  unint64_t optionKeyDown;
  id v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unint64_t v25;
  _BYTE v26[128];

  v6 = a3;
  v18 = a4;
  if (self->_optionKeyDown)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "characters"));
          if (objc_msgSend(v13, "length"))
          {

          }
          else
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
            v15 = objc_msgSend(v14, "modifierFlags");

            if ((v15 & 0x80000) != 0)
            {
              --self->_optionKeyDown;
              v16 = kCalUILogHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
              {
                optionKeyDown = self->_optionKeyDown;
                *(_DWORD *)buf = 134217984;
                v25 = optionKeyDown;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "optionKeyCancel: %lu", buf, 0xCu);
              }
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v8);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)Application;
  -[Application pressesCancelled:withEvent:](&v19, "pressesCancelled:withEvent:", v6, v18);

}

- (id)applicationRequestDelayer
{
  return self->_applicationRequestDelayer;
}

- (void)setApplicationRequestDelayer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong(&self->_applicationRequestDelayer, 0);
  objc_storeStrong((id *)&self->_applicationLastActiveTime, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_tester, 0);
}

- (id)eventStore
{
  Application *v2;
  void *v3;

  v2 = self;
  v3 = (void *)Application.eventStore()();

  return v3;
}

- (void)registerAppIntentsDependencies
{
  Application *v2;

  v2 = self;
  Application.registerAppIntentsDependencies()();

}

@end
