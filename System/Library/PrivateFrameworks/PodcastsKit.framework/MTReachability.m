@implementation MTReachability

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MTReachability_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

void __32__MTReachability_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___MTReachability;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = v1;

}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "sharedInstance", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copy
{
  +[MTReachability sharedInstance](MTReachability, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTReachability)init
{
  MTReachability *v2;
  NSObject *v3;
  uint64_t v4;
  NSHashTable *callbacks;
  dispatch_queue_t v6;
  OS_dispatch_queue *cellularQueue;
  void *v8;
  uint64_t v9;
  ITMReachability *reachability;
  void *v11;
  RadiosPreferences *v12;
  RadiosPreferences *radiosPreferences;
  void *v14;
  _QWORD v16[4];
  MTReachability *v17;
  uint8_t buf[16];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MTReachability;
  v2 = -[MTReachability init](&v19, sel_init);
  if (v2)
  {
    _MTLogCategoryNetwork();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB0C000, v3, OS_LOG_TYPE_DEFAULT, "Initializing Reachability", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    callbacks = v2->_callbacks;
    v2->_callbacks = (NSHashTable *)v4;

    v6 = dispatch_queue_create("com.apple.MTReachability.cellularQueue", 0);
    cellularQueue = v2->_cellularQueue;
    v2->_cellularQueue = (OS_dispatch_queue *)v6;

    v2->_hasDeterminedActualGlobalCellularState = 0;
    objc_msgSend(MEMORY[0x24BDBCF50], "_applePodcastsFoundationSharedUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_globalCellularEnabled = objc_msgSend(v8, "BOOLForKey:", CFSTR("MTGlobalCellularUserDefaultKey"));

    objc_msgSend(MEMORY[0x24BE737D8], "reachabilityForInternetConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    reachability = v2->_reachability;
    v2->_reachability = (ITMReachability *)v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__updateReachability, *MEMORY[0x24BE73B90], v2->_reachability);

    -[ITMReachability startNotifier](v2->_reachability, "startNotifier");
    -[MTReachability _updateReachability](v2, "_updateReachability");
    v12 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x24BE04788]);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v12;

    -[RadiosPreferences setDelegate:](v2->_radiosPreferences, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__applicationDidBecomeActive, *MEMORY[0x24BE73770], 0);

    -[MTReachability _updateAirplaneMode](v2, "_updateAirplaneMode");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __22__MTReachability_init__block_invoke;
    v16[3] = &unk_24FD628D0;
    v17 = v2;
    -[MTReachability _updateGlobalCellularWithCompletion:](v17, "_updateGlobalCellularWithCompletion:", v16);

  }
  return v2;
}

uint64_t __22__MTReachability_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateReachability");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  -[MTReachability reachability](self, "reachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopNotifier");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE73B90];
  -[MTReachability reachability](self, "reachability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)MTReachability;
  -[MTReachability dealloc](&v7, sel_dealloc);
}

- (void)_applicationDidBecomeActive
{
  _QWORD v3[5];

  -[MTReachability _updateAirplaneMode](self, "_updateAirplaneMode");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__MTReachability__applicationDidBecomeActive__block_invoke;
  v3[3] = &unk_24FD628D0;
  v3[4] = self;
  -[MTReachability _updateGlobalCellularWithCompletion:](self, "_updateGlobalCellularWithCompletion:", v3);
}

uint64_t __45__MTReachability__applicationDidBecomeActive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateReachability");
}

- (void)_updateReachability
{
  NSObject *v3;
  _BOOL8 v4;
  void *v5;
  int64_t v6;
  _BOOL8 v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  _BYTE v30[10];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  _MTLogCategoryNetwork();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB0C000, v3, OS_LOG_TYPE_DEFAULT, "Updating reachability", buf, 2u);
  }

  v4 = -[MTReachability isReachable](self, "isReachable");
  -[MTReachability reachability](self, "reachability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTReachability setNetworkStatus:](self, "setNetworkStatus:", objc_msgSend(v5, "currentReachabilityStatus"));

  -[MTReachability setReachable:](self, "setReachable:", 1);
  v6 = -[MTReachability networkStatus](self, "networkStatus");
  if (v6)
  {
    if (v6 == 1)
    {
      v7 = 1;
    }
    else
    {
      if (v6 != 2)
        goto LABEL_10;
      v7 = -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");
    }
  }
  else
  {
    v7 = 0;
  }
  -[MTReachability setReachable:](self, "setReachable:", v7);
LABEL_10:
  _MTLogCategoryNetwork();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[MTReachability reachability](self, "reachability");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "currentReachabilityStatus");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v30 = v10;
    _os_log_impl(&dword_22FB0C000, v8, OS_LOG_TYPE_DEFAULT, "\treachability status <%ld>", buf, 0xCu);

  }
  _MTLogCategoryNetwork();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v12;
    _os_log_impl(&dword_22FB0C000, v11, OS_LOG_TYPE_DEFAULT, "\tcellular enabled <%x>", buf, 8u);
  }

  _MTLogCategoryNetwork();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[MTReachability hasDeterminedActualGlobalCellularState](self, "hasDeterminedActualGlobalCellularState");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = !v14;
    _os_log_impl(&dword_22FB0C000, v13, OS_LOG_TYPE_DEFAULT, "\tis using cached global cellular setting <%x>", buf, 8u);
  }

  _MTLogCategoryNetwork();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = -[MTReachability isReachable](self, "isReachable");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v30 = v4;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v16;
    _os_log_impl(&dword_22FB0C000, v15, OS_LOG_TYPE_DEFAULT, "\treachability changing from %i to %i", buf, 0xEu);
  }

  -[MTReachability callbacks](self, "callbacks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v17);
  -[MTReachability callbacks](self, "callbacks");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  objc_sync_exit(v17);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "reachabilityChangedFrom:to:", v4, -[MTReachability isReachable](self, "isReachable", (_QWORD)v24));
      }
      while (v21 != v23);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v21);
  }

}

- (void)setGlobalCellularEnabled:(BOOL)a3
{
  self->_globalCellularEnabled = a3;
  -[MTReachability setHasDeterminedActualGlobalCellularState:](self, "setHasDeterminedActualGlobalCellularState:", 1);
}

- (void)setHasDeterminedActualGlobalCellularState:(BOOL)a3
{
  id v4;

  self->_hasDeterminedActualGlobalCellularState = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "_applePodcastsFoundationSharedUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled"), CFSTR("MTGlobalCellularUserDefaultKey"));

  }
}

- (void)addObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MTReachability callbacks](self, "callbacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MTReachability callbacks](self, "callbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MTReachability callbacks](self, "callbacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MTReachability callbacks](self, "callbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
  void *v9;
  __CFString *v10;

  v2 = -[MTReachability reasonForNoInternet](self, "reasonForNoInternet");
  switch(v2)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Airplane Mode");
      break;
    case 2uLL:
      v7 = MGGetBoolAnswer();
      v8 = CFSTR("NO_WIFI");
      if (v7)
        v8 = CFSTR("NO_WLAN");
      v9 = (void *)MEMORY[0x24BDD1488];
      v10 = v8;
      objc_msgSend(v9, "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", v10, &stru_24FD64198, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("No Internet");
      break;
    default:
      v6 = 0;
      return v6;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24FD64198, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
    if (-[MTReachability networkStatus](self, "networkStatus") == 2)
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
  else if (-[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled") || (MGGetBoolAnswer() & 1) == 0)
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

  objc_msgSend(MEMORY[0x24BDBCF50], "_applePodcastsFoundationSettingsUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x24BE73A38]) & 1) == 0
    && -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");

  return v4;
}

- (BOOL)isReachableViaCellular
{
  return -[MTReachability networkStatus](self, "networkStatus") == 2;
}

- (BOOL)isReachableViaWifi
{
  return -[MTReachability networkStatus](self, "networkStatus") == 1;
}

- (void)_showAlertForInternetUnavailableReason:(unint64_t)a3 completion:(id)a4
{
  id v5;
  int v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      v6 = MGGetBoolAnswer();
      v7 = CFSTR("ALERT_TITLE_AIRPLANE_MODE_WIFI");
      if (v6)
        v7 = CFSTR("ALERT_TITLE_AIRPLANE_MODE_WLAN");
      v8 = (void *)MEMORY[0x24BDD1488];
      v9 = v7;
      objc_msgSend(v8, "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_24FD64198, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75460], "preferencesURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ALERT_TITLE_GLOBAL_CELLULAR_DISABLED"), &stru_24FD64198, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = MGGetBoolAnswer();
      v16 = CFSTR("ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WIFI");
      if (v15)
        v16 = CFSTR("ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WLAN");
      v17 = (void *)MEMORY[0x24BDD1488];
      v18 = v16;
      objc_msgSend(v17, "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", v18, &stru_24FD64198, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE754B8], "preferencesURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ALERT_TITLE_NO_INTERNET"), &stru_24FD64198, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
LABEL_10:
      v13 = 0;
      goto LABEL_11;
    default:
      v12 = 0;
      v13 = 0;
      v11 = 0;
LABEL_11:
      _MTLogCategoryNetwork();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = 138412546;
        v23 = v11;
        v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_22FB0C000, v21, OS_LOG_TYPE_ERROR, "Unable to show Internet Unavailable dialog. Title = [%@], Message = [%@]", (uint8_t *)&v22, 0x16u);
      }

LABEL_14:
      return;
  }
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
  v5 = _CTServerConnectionCreateOnTargetQueue();
  if (v5)
  {
    cellularQueue = self->_cellularQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__MTReachability__updateGlobalCellularWithCompletion___block_invoke;
    block[3] = &unk_24FD62920;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(cellularQueue, block);

  }
}

void __54__MTReachability__updateGlobalCellularWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;
  char v9;
  id location[2];

  location[1] = 0;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _CTServerConnectionCopyCellularUsagePolicy();
  CFRelease(*(CFTypeRef *)(a1 + 48));
  if (objc_msgSend(MEMORY[0x24BE754B8], "isEnabled"))
    v4 = MGGetBoolAnswer();
  else
    v4 = 0;
  objc_initWeak(location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MTReachability__updateGlobalCellularWithCompletion___block_invoke_2;
  block[3] = &unk_24FD628F8;
  objc_copyWeak(&v7, location);
  v8 = 0;
  v9 = v4;
  v6 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(location);

}

uint64_t __54__MTReachability__updateGlobalCellularWithCompletion___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  id WeakRetained;
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    v2 = *(_BYTE *)(a1 + 49) != 0;
  else
    v2 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setGlobalCellularEnabled:", v2);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateAirplaneMode
{
  int v3;
  void *v4;
  id v5;

  -[RadiosPreferences refresh](self->_radiosPreferences, "refresh");
  v3 = -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
  if (self->_airplaneModeEnabled != v3)
  {
    self->_airplaneModeEnabled = v3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_airplaneModeEnabled);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MTAirplaneModeChangedNotification"), v4);

  }
}

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (BOOL)isGlobalCellularEnabled
{
  return self->_globalCellularEnabled;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (ITMReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (NSHashTable)callbacks
{
  return self->_callbacks;
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

- (BOOL)hasDeterminedActualGlobalCellularState
{
  return self->_hasDeterminedActualGlobalCellularState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularQueue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
}

@end
