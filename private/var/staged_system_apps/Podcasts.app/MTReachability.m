@implementation MTReachability

- (void)addObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)_updateGlobalCellularWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *cellularQueue;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v4 = a3;
  v5 = _CTServerConnectionCreateOnTargetQueue(kCFAllocatorDefault, 0, self->_cellularQueue, 0);
  if (v5)
  {
    cellularQueue = self->_cellularQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023388;
    block[3] = &unk_1004A6918;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(cellularQueue, block);

  }
}

- (void)setHasDeterminedActualGlobalCellularState:(BOOL)a3
{
  id v4;

  self->_hasDeterminedActualGlobalCellularState = a3;
  if (a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled"), CFSTR("MTGlobalCellularUserDefaultKey"));

  }
}

- (void)setGlobalCellularEnabled:(BOOL)a3
{
  self->_globalCellularEnabled = a3;
  -[MTReachability setHasDeterminedActualGlobalCellularState:](self, "setHasDeterminedActualGlobalCellularState:", 1);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000050C4;
  block[3] = &unk_1004A65A0;
  block[4] = a1;
  if (qword_100567450 != -1)
    dispatch_once(&qword_100567450, block);
  return (id)qword_100567448;
}

- (MTReachability)init
{
  MTReachability *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSHashTable *callbacks;
  dispatch_queue_t v7;
  OS_dispatch_queue *cellularQueue;
  void *v9;
  uint64_t v10;
  ITMReachability *reachability;
  void *v12;
  RadiosPreferences *v13;
  RadiosPreferences *radiosPreferences;
  void *v15;
  _QWORD v17[4];
  MTReachability *v18;
  uint8_t buf[16];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MTReachability;
  v2 = -[MTReachability init](&v20, "init");
  if (v2)
  {
    v3 = _MTLogCategoryNetwork();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing Reachability", buf, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    callbacks = v2->_callbacks;
    v2->_callbacks = (NSHashTable *)v5;

    v7 = dispatch_queue_create("com.apple.MTReachability.cellularQueue", 0);
    cellularQueue = v2->_cellularQueue;
    v2->_cellularQueue = (OS_dispatch_queue *)v7;

    v2->_hasDeterminedActualGlobalCellularState = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
    v2->_globalCellularEnabled = objc_msgSend(v9, "BOOLForKey:", CFSTR("MTGlobalCellularUserDefaultKey"));

    v10 = objc_claimAutoreleasedReturnValue(+[ITMReachability reachabilityForInternetConnection](ITMReachability, "reachabilityForInternetConnection"));
    reachability = v2->_reachability;
    v2->_reachability = (ITMReachability *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, "_updateReachability", kReachabilityChangedNotification, v2->_reachability);

    -[ITMReachability startNotifier](v2->_reachability, "startNotifier");
    -[MTReachability _updateReachability](v2, "_updateReachability");
    v13 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v13;

    -[RadiosPreferences setDelegate:](v2->_radiosPreferences, "setDelegate:", v2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, "_applicationDidBecomeActive", MTApplicationDidBecomeActiveNotification, 0);

    -[MTReachability _updateAirplaneMode](v2, "_updateAirplaneMode");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000C5EB0;
    v17[3] = &unk_1004A6200;
    v18 = v2;
    -[MTReachability _updateGlobalCellularWithCompletion:](v18, "_updateGlobalCellularWithCompletion:", v17);

  }
  return v2;
}

- (void)_updateReachability
{
  uint64_t v3;
  NSObject *v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  _BYTE v42[10];

  v3 = _MTLogCategoryNetwork(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating reachability", buf, 2u);
  }

  v5 = -[MTReachability isReachable](self, "isReachable");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability reachability](self, "reachability"));
  -[MTReachability setNetworkStatus:](self, "setNetworkStatus:", objc_msgSend(v6, "currentReachabilityStatus"));

  -[MTReachability setReachable:](self, "setReachable:", 1);
  v7 = -[MTReachability networkStatus](self, "networkStatus");
  if (v7)
  {
    if (v7 == (id)1)
    {
      v9 = 1;
    }
    else
    {
      if (v7 != (id)2)
        goto LABEL_10;
      v9 = -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");
    }
  }
  else
  {
    v9 = 0;
  }
  v7 = -[MTReachability setReachable:](self, "setReachable:", v9);
LABEL_10:
  v10 = _MTLogCategoryNetwork(v7, v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability reachability](self, "reachability"));
    v13 = objc_msgSend(v12, "currentReachabilityStatus");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v42 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "\treachability status <%ld>", buf, 0xCu);

  }
  v16 = _MTLogCategoryNetwork(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v42 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "\tcellular enabled <%x>", buf, 8u);
  }

  v21 = _MTLogCategoryNetwork(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = -[MTReachability hasDeterminedActualGlobalCellularState](self, "hasDeterminedActualGlobalCellularState");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v42 = v23 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "\tis using cached global cellular setting <%x>", buf, 8u);
  }

  v26 = _MTLogCategoryNetwork(v24, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = -[MTReachability isReachable](self, "isReachable");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v42 = v5;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "\treachability changing from %i to %i", buf, 0xEu);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  objc_sync_enter(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  v31 = objc_msgSend(v30, "copy");

  objc_sync_exit(v29);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v32 = v31;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v37;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v35), "reachabilityChangedFrom:to:", v5, -[MTReachability isReachable](self, "isReachable", (_QWORD)v36));
        v35 = (char *)v35 + 1;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v33);
  }

}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (NSHashTable)callbacks
{
  return self->_callbacks;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (ITMReachability)reachability
{
  return self->_reachability;
}

- (BOOL)isGlobalCellularEnabled
{
  return self->_globalCellularEnabled;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (BOOL)hasDeterminedActualGlobalCellularState
{
  return self->_hasDeterminedActualGlobalCellularState;
}

- (void)_updateAirplaneMode
{
  unsigned int v3;
  void *v4;
  id v5;

  -[RadiosPreferences refresh](self->_radiosPreferences, "refresh");
  v3 = -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
  if (self->_airplaneModeEnabled != v3)
  {
    self->_airplaneModeEnabled = v3;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_airplaneModeEnabled));
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MTAirplaneModeChangedNotification"), v4);

  }
}

- (void)_applicationDidBecomeActive
{
  _QWORD v3[5];

  -[MTReachability _updateAirplaneMode](self, "_updateAirplaneMode");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000C5F60;
  v3[3] = &unk_1004A6200;
  v3[4] = self;
  -[MTReachability _updateGlobalCellularWithCompletion:](self, "_updateGlobalCellularWithCompletion:", v3);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", a3));
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability reachability](self, "reachability"));
  objc_msgSend(v3, "stopNotifier");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = kReachabilityChangedNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability reachability](self, "reachability"));
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)MTReachability;
  -[MTReachability dealloc](&v7, "dealloc");
}

- (void)removeObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (id)reasonTextForNoInternet
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;

  v2 = -[MTReachability reasonForNoInternet](self, "reasonForNoInternet");
  switch(v2)
  {
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Airplane Mode");
      break;
    case 2uLL:
      v7 = MGGetBoolAnswer(CFSTR("wapi"));
      v8 = CFSTR("NO_WIFI");
      if (v7)
        v8 = CFSTR("NO_WLAN");
      v9 = v8;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v9, &stru_1004C6D40, 0));

      goto LABEL_10;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("No Internet");
      break;
    default:
      v6 = 0;
      return v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1004C6D40, 0));
LABEL_10:

  return v6;
}

- (BOOL)showInternetUnreachableDialog
{
  return -[MTReachability showInternetUnreachableDialogWithAcknowledmentBlock:](self, "showInternetUnreachableDialogWithAcknowledmentBlock:", 0);
}

- (BOOL)showInternetUnreachableDialogWithAcknowledmentBlock:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  if (-[MTReachability isReachable](self, "isReachable")
    || (v5 = -[MTReachability reasonForNoInternet](self, "reasonForNoInternet")) == 0)
  {
    v6 = 0;
  }
  else
  {
    -[MTReachability _showAlertForInternetUnavailableReason:completion:](self, "_showAlertForInternetUnavailableReason:completion:", v5, v4);
    v6 = 1;
  }

  return v6;
}

- (unint64_t)reasonForNoInternet
{
  if (-[MTReachability networkStatus](self, "networkStatus"))
  {
    if ((id)-[MTReachability networkStatus](self, "networkStatus") == (id)2)
    {
      if (-[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled"))
        return 0;
      else
        return 2;
    }
    else
    {
      return 0;
    }
  }
  else if (-[MTReachability isAirplaneModeEnabled](self, "isAirplaneModeEnabled"))
  {
    return 1;
  }
  else if (-[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled")
         || (MGGetBoolAnswer(CFSTR("cellular-data")) & 1) == 0)
  {
    return 3;
  }
  else
  {
    return 2;
  }
}

- (BOOL)isPodcastsCellularDownloadsEnabled
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
  if ((objc_msgSend(v3, "BOOLForKey:", kMTWiFiDownloadOnly) & 1) != 0)
    v4 = 0;
  else
    v4 = -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");

  return v4;
}

- (BOOL)isReachableViaCellular
{
  return (id)-[MTReachability networkStatus](self, "networkStatus") == (id)2;
}

- (BOOL)isReachableViaWifi
{
  return (id)-[MTReachability networkStatus](self, "networkStatus") == (id)1;
}

- (void)_showAlertForInternetUnavailableReason:(unint64_t)a3 completion:(id)a4
{
  id v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
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
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v5 = a4;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      v6 = MGGetBoolAnswer(CFSTR("wapi"));
      v7 = CFSTR("ALERT_TITLE_AIRPLANE_MODE_WIFI");
      if (v6)
        v7 = CFSTR("ALERT_TITLE_AIRPLANE_MODE_WLAN");
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_1004C6D40, 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PSAirplaneModeSettingsDetail preferencesURL](PSAirplaneModeSettingsDetail, "preferencesURL"));
      goto LABEL_10;
    case 2uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ALERT_TITLE_GLOBAL_CELLULAR_DISABLED"), &stru_1004C6D40, 0));

      v14 = MGGetBoolAnswer(CFSTR("wapi"));
      v15 = CFSTR("ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WIFI");
      if (v14)
        v15 = CFSTR("ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WLAN");
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v16, &stru_1004C6D40, 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PSCellularDataSettingsDetail preferencesURL](PSCellularDataSettingsDetail, "preferencesURL"));
      goto LABEL_11;
    case 3uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ALERT_TITLE_NO_INTERNET"), &stru_1004C6D40, 0));

      v11 = 0;
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    default:
      v11 = 0;
      v12 = 0;
      v10 = 0;
LABEL_11:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTAlertController alertControllerWithTitle:message:preferredStyle:](MTAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1, v10));
      if (v11)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Settings"), &stru_1004C6D40, 0));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000C660C;
        v29[3] = &unk_1004A9DC0;
        v30 = v11;
        v31 = v5;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 0, v29));

        objc_msgSend(v19, "addAction:", v22);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1004C6D40, 0));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000C6664;
      v27[3] = &unk_1004A9318;
      v28 = v5;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 0, v27));

      objc_msgSend(v19, "addAction:", v25);
      objc_msgSend(v19, "presentAnimated:completion:", 1, 0);

LABEL_14:
      return;
  }
}

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (void)setCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_callbacks, a3);
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_radiosPreferences, a3);
}

- (OS_dispatch_queue)cellularQueue
{
  return self->_cellularQueue;
}

- (void)setCellularQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cellularQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularQueue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
}

@end
