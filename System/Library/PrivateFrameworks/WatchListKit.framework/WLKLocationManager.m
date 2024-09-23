@implementation WLKLocationManager

void __51__WLKLocationManager__locationAuthorizationStatus___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WLKIsTVApp())
  {
    objc_msgSend(WeakRetained, "clLocationManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "authorizationStatus");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9E3C8];
    WLKTVAppBundleID();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "authorizationStatusForBundleIdentifier:", v2);
  }
  v5 = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "_statusForCLAuthorizationStatus:", v5);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);

}

intptr_t __41__WLKLocationManager_authorizationStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)_statusForCLAuthorizationStatus:(int)a3
{
  if ((a3 - 2) > 2)
    return -1;
  else
    return qword_1B51BA3B8[a3 - 2];
}

void __26__WLKLocationManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WLKSystemLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Creating CLLocationManager", (uint8_t *)&v21, 2u);
  }

  if (WLKIsTVApp())
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - WLK is TVApp", (uint8_t *)&v21, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    objc_msgSend(WeakRetained, "clQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "_initWithDelegate:onQueue:", WeakRetained, v5);
    objc_msgSend(WeakRetained, "setClLocationManager:", v6);
  }
  else if (WLKIsDaemon())
  {
    v7 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    WLKTVAppBundleID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "clQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v5, WeakRetained, v6);
    objc_msgSend(WeakRetained, "setClLocationManager:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundlePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    objc_msgSend(WeakRetained, "clQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithEffectiveBundlePath:delegate:onQueue:", v5, WeakRetained, v16);
    objc_msgSend(WeakRetained, "setClLocationManager:", v17);

    objc_msgSend(WeakRetained, "clLocationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_10;
    WLKSystemLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v20;
      _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - bundle id:%@ does not have the right entitlement for location data.", (uint8_t *)&v21, 0xCu);

    }
  }

LABEL_10:
  objc_msgSend(WeakRetained, "clLocationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDesiredAccuracy:", *MEMORY[0x1E0C9E4F8]);

  objc_msgSend(WeakRetained, "clLocationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDistanceFilter:", 1000.0);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("LastKnownLocation"));
  objc_msgSend(WeakRetained, "_deleteLastKnownLocation");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKReachabilityMonitor sharedInstance](WLKReachabilityMonitor, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", WeakRetained, sel__networkReachbilityDidChange_, CFSTR("WLKReachabilityMonitorReachabilityDidChange"), v13);

}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

void __51__WLKLocationManager__networkReachbilityDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  +[WLKReachabilityMonitor sharedInstance](WLKReachabilityMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_updateLocationIfNeeded");
}

- (void)setClLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_clLocationManager, a3);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  int v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clQueue);
  v5 = objc_msgSend(v4, "authorizationStatus");
  if (-[WLKLocationManager isAuthorizationApproved](self, "isAuthorizationApproved"))
  {
    if (!self->_lastKnownLocation)
    {
      v6 = -[WLKLocationManager _statusForCLAuthorizationStatus:](self, "_statusForCLAuthorizationStatus:", v5);
      v7 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_initWeak(location, self);
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_47;
      v12[3] = &unk_1E68A8958;
      v12[4] = self;
      objc_copyWeak(&v13, location);
      -[WLKLocationManager _requestCLLocationUpdates:](self, "_requestCLLocationUpdates:", v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
  }
  else
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 67109120;
      HIDWORD(location[0]) = v5;
      _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Authorization status is not approved with status: %d", (uint8_t *)location, 8u);
    }

    if ((v5 & 0xFFFFFFFD) == 0)
    {
      WLKSystemLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Deleting last known location and sending authorization did change notification", (uint8_t *)location, 2u);
      }

      -[WLKLocationManager _setLastKnownLocation:](self, "_setLastKnownLocation:", 0);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_48;
      v10[3] = &unk_1E68A8980;
      v10[4] = self;
      v11 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v10);
    }
  }

}

- (BOOL)isAuthorizationApproved
{
  return -[CLLocationManager authorizationStatus](self->_clLocationManager, "authorizationStatus") == kCLAuthorizationStatusAuthorizedWhenInUse;
}

- (void)_updateLocationIfNeeded
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[WLKLocationManager isAuthorizationApproved](self, "isAuthorizationApproved"))
  {
    v3 = -[WLKLocationManager _copyLastKnownLocation](self, "_copyLastKnownLocation");
    if (v3 && -[WLKLocationManager _isLastKnownLocationFresh:](self, "_isLastKnownLocationFresh:", v3))
    {
      WLKSystemLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[WLKLocationManager _updateLocationIfNeeded]";
        _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: not updating lkl, using cached", (uint8_t *)&v6, 0xCu);
      }

    }
    else
    {
      WLKSystemLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[WLKLocationManager _updateLocationIfNeeded]";
        _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: requesting recent location", (uint8_t *)&v6, 0xCu);
      }

      -[WLKLocationManager _requestActiveLocationChangeUpdates](self, "_requestActiveLocationChangeUpdates");
    }
  }
  else
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - _updateLocationIfNeeded: location not authorized", (uint8_t *)&v6, 2u);
    }
  }

}

- (OS_dispatch_queue)clQueue
{
  return self->_clQueue;
}

- (void)_deleteLastKnownLocation
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B515A000, a2, v4, "WLKLocationManager - Failed to remove last known location file with error: %s", v5);

}

- (void)_networkReachbilityDidChange:(id)a3
{
  id v4;
  NSObject *clQueue;
  _QWORD block[5];

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[WLKLocationManager _networkReachbilityDidChange:].cold.1();
  clQueue = self->_clQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WLKLocationManager__networkReachbilityDidChange___block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_async(clQueue, block);

}

- (int64_t)authorizationStatus
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  int64_t v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = dispatch_semaphore_create(0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__WLKLocationManager_authorizationStatus__block_invoke;
  v8[3] = &unk_1E68A8848;
  v10 = &v11;
  v4 = v3;
  v9 = v4;
  -[WLKLocationManager _locationAuthorizationStatus:](self, "_locationAuthorizationStatus:", v8);
  v5 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_locationAuthorizationStatus:(id)a3
{
  id v4;
  NSObject *clQueue;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id location[2];

  v4 = a3;
  if ((WLKShouldRunInProcess() & 1) != 0 || WLKIsTVApp())
  {
    objc_initWeak(location, self);
    clQueue = self->_clQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__WLKLocationManager__locationAuthorizationStatus___block_invoke;
    block[3] = &unk_1E68A7ED8;
    objc_copyWeak(&v19, location);
    block[4] = self;
    v18 = v4;
    v6 = v4;
    dispatch_async(clQueue, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    -[WLKLocationManager _connection](self, "_connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_2;
    v15[3] = &unk_1E68A7E88;
    v9 = v4;
    v16 = v9;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    WLKSystemLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Calling out to daemon for auth status", (uint8_t *)location, 2u);
    }

    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_55;
    v13[3] = &unk_1E68A89A8;
    v14 = v9;
    v12 = v9;
    objc_msgSend(v10, "fetchLocationAuthorizationStatus:", v13);

  }
}

+ (id)defaultLocationManager
{
  if (defaultLocationManager___once != -1)
    dispatch_once(&defaultLocationManager___once, &__block_literal_global_24);
  return (id)defaultLocationManager___defaultLocationManager;
}

void __44__WLKLocationManager_defaultLocationManager__block_invoke()
{
  WLKLocationManager *v0;
  void *v1;

  v0 = objc_alloc_init(WLKLocationManager);
  v1 = (void *)defaultLocationManager___defaultLocationManager;
  defaultLocationManager___defaultLocationManager = (uint64_t)v0;

}

- (WLKLocationManager)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id buf[2];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WLKLocationManager;
  v2 = -[WLKLocationManager init](&v16, sel_init);
  if (v2)
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Init", (uint8_t *)buf, 2u);
    }

    v4 = dispatch_queue_create("WLKLocationQueue-CoreLocation", 0);
    v5 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v4;

    objc_initWeak(buf, v2);
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __26__WLKLocationManager_init__block_invoke;
    v13[3] = &unk_1E68A7FC0;
    objc_copyWeak(&v14, buf);
    v7 = (void *)MEMORY[0x1B5E47FF4](v13);
    dispatch_async(*((dispatch_queue_t *)v2 + 3), v7);
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __26__WLKLocationManager_init__block_invoke_23;
    v11[3] = &unk_1E68A8820;
    v12 = v2;
    notify_register_dispatch("com.apple.WatchListKit.WLKLocationManagerLocationDidChangeNotification", (int *)v2 + 2, v8, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
  return (WLKLocationManager *)v2;
}

- (NSDictionary)lastKnownLocation
{
  return (NSDictionary *)-[WLKLocationManager _copyLastKnownLocation](self, "_copyLastKnownLocation");
}

- (id)_locationQueryParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[WLKLocationManager lastKnownLocation](self, "lastKnownLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v13 = CFSTR("latlong");
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("reducedPrecisionLatitudeString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reducedPrecisionLongitudeString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@,%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  WLKSystemLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Loc query params: %@", buf, 0xCu);
  }

  return v8;
}

- (id)_copyLastKnownLocation
{
  WLKLocationManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSDictionary copy](v2->_lastKnownLocation, "copy");
  objc_sync_exit(v2);

  return v3;
}

void __26__WLKLocationManager_init__block_invoke_23(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];
  uint8_t buf[8];
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), &state64);
  if (state64 != getpid())
  {
    WLKSystemLogObject();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v1, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Received didChange notification", buf, 2u);
    }

    WLKSystemLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Firing local notification", v4, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("WLKLocationManagerLocationDidChangeNotification"), 0);

  }
}

- (void)dealloc
{
  CLLocationManager *v3;
  CLLocationManager *clLocationManager;
  NSObject *clQueue;
  CLLocationManager *v6;
  int didChangeNotificationToken;
  void *v8;
  objc_super v9;
  _QWORD block[4];
  CLLocationManager *v11;

  v3 = self->_clLocationManager;
  clLocationManager = self->_clLocationManager;
  self->_clLocationManager = 0;

  clQueue = self->_clQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WLKLocationManager_dealloc__block_invoke;
  block[3] = &unk_1E68A80F8;
  v6 = v3;
  v11 = v6;
  dispatch_async(clQueue, block);
  didChangeNotificationToken = self->_didChangeNotificationToken;
  if (didChangeNotificationToken)
    notify_cancel(didChangeNotificationToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)WLKLocationManager;
  -[WLKLocationManager dealloc](&v9, sel_dealloc);
}

uint64_t __29__WLKLocationManager_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopUpdatingLocation");
  return objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
}

- (void)fetchAuthorizationStatus:(id)a3
{
  id v4;
  void *v5;
  dispatch_time_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD block[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;

  v4 = a3;
  if (!v4)
    -[WLKLocationManager fetchAuthorizationStatus:].cold.1();
  v5 = v4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v6 = dispatch_time(0, 3000000000);
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke;
  block[3] = &unk_1E68A8870;
  v15 = v16;
  v8 = v5;
  v14 = v8;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_32;
  v10[3] = &unk_1E68A88C0;
  v12 = v16;
  v9 = v8;
  v11 = v9;
  -[WLKLocationManager _locationAuthorizationStatus:](self, "_locationAuthorizationStatus:", v10);

  _Block_object_dispose(v16, 8);
}

uint64_t __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

void __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_32(uint64_t a1, uint64_t a2)
{
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  uint64_t v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_2;
  block[3] = &unk_1E68A8898;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - fetchAuthorizationStatus completed", v4, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

- (void)requestAuthorization
{
  -[WLKLocationManager requestAuthorizationWithForcedPrompt:](self, "requestAuthorizationWithForcedPrompt:", 0);
}

- (void)requestAuthorizationWithForcedPrompt:(BOOL)a3
{
  NSObject *clQueue;
  _QWORD *v5;
  _QWORD v6[5];
  _QWORD block[5];

  if (!a3
    || -[WLKLocationManager _locationServicesEnabled](self, "_locationServicesEnabled")
    && -[WLKLocationManager authorizationStatus](self, "authorizationStatus"))
  {
    clQueue = self->_clQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__WLKLocationManager_requestAuthorizationWithForcedPrompt___block_invoke_2;
    v6[3] = &unk_1E68A80F8;
    v6[4] = self;
    v5 = v6;
  }
  else
  {
    clQueue = self->_clQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__WLKLocationManager_requestAuthorizationWithForcedPrompt___block_invoke;
    block[3] = &unk_1E68A80F8;
    block[4] = self;
    v5 = block;
  }
  dispatch_async(clQueue, v5);
}

uint64_t __59__WLKLocationManager_requestAuthorizationWithForcedPrompt___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "requestWhenInUseAuthorizationWithPrompt");
}

uint64_t __59__WLKLocationManager_requestAuthorizationWithForcedPrompt___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "requestWhenInUseAuthorization");
}

- (BOOL)_locationServicesEnabled
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled");
}

- (void)_requestActiveLocationChangeUpdates
{
  NSObject *v3;
  _QWORD v4[5];
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[WLKLocationManager _requestActiveLocationChangeUpdates]";
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: starting location updates", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__WLKLocationManager__requestActiveLocationChangeUpdates__block_invoke;
  v4[3] = &unk_1E68A88E8;
  objc_copyWeak(&v5, (id *)buf);
  v4[4] = self;
  -[WLKLocationManager _requestCLLocationUpdates:](self, "_requestCLLocationUpdates:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __57__WLKLocationManager__requestActiveLocationChangeUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WLKSystemLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Active location request returned err: %@", (uint8_t *)&v12, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    WLKSystemLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      v12 = 136315394;
      v13 = "-[WLKLocationManager _requestActiveLocationChangeUpdates]_block_invoke";
      v14 = 2080;
      v15 = v11;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: nil new location, error:%s", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_dictionaryForCLLocation:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setLastKnownLocation:", v9);
  }

}

- (BOOL)_isIgnorableLocationError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (void *)*MEMORY[0x1E0C9E488],
        v5,
        v5 == v6))
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v4, "code");
      _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Ignoring location error: %ld", (uint8_t *)&v10, 0xCu);
    }

    v7 = objc_msgSend(v4, "code") == 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  WLKLocationManager *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)-[NSDictionary copy](v4->_lastKnownLocation, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("LastKnownLocation"));

  objc_sync_exit(v4);
  return v3;
}

- (BOOL)_isLastKnownLocation:(id)a3 freshForMaxAge:(double)a4 fromNewTimestamp:(double)a5
{
  void *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("secondsSinceEpoch"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    v10 = a5 - v9;
    WLKSystemLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "-[WLKLocationManager _isLastKnownLocation:freshForMaxAge:fromNewTimestamp:]";
      v16 = 2048;
      v17 = v10;
      v18 = 2048;
      v19 = a4;
      _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: locationAge %f, maxAge %f", (uint8_t *)&v14, 0x20u);
    }

    return v10 < a4;
  }
  else
  {
    WLKSystemLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[WLKLocationManager _isLastKnownLocation:freshForMaxAge:fromNewTimestamp:]";
      _os_log_impl(&dword_1B515A000, v13, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: nil lkl", (uint8_t *)&v14, 0xCu);
    }

    return 0;
  }
}

- (BOOL)_isLastKnownLocationFresh:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  LOBYTE(self) = -[WLKLocationManager _isLastKnownLocation:freshForMaxAge:fromNewTimestamp:](self, "_isLastKnownLocation:freshForMaxAge:fromNewTimestamp:", v5, 86400.0, v7);

  return (char)self;
}

- (BOOL)_shouldLastKnownLocation:(id)a3 beUpdatedTo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  double v10;
  BOOL v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[WLKLocationManager _isLastKnownLocation:significantlyOlderThanNewLocation:](self, "_isLastKnownLocation:significantlyOlderThanNewLocation:", v6, v7))
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[WLKLocationManager _shouldLastKnownLocation:beUpdatedTo:]";
      v9 = "WLKLocationManager - %s: new location is after significant time";
LABEL_7:
      _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    -[WLKLocationManager _getDistanceOfLastKnownLocationDictionary:fromLocation:](self, "_getDistanceOfLastKnownLocationDictionary:fromLocation:", v6, v7);
    if (v10 <= 1000.0)
    {
      v11 = 0;
      goto LABEL_10;
    }
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[WLKLocationManager _shouldLastKnownLocation:beUpdatedTo:]";
      v9 = "WLKLocationManager - %s: new location is significantantly farther";
      goto LABEL_7;
    }
  }

  v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)_isLastKnownLocation:(id)a3 significantlyOlderThanNewLocation:(id)a4
{
  id v6;
  void *v7;
  double v8;

  if (!a4)
    return 0;
  v6 = a3;
  objc_msgSend(a4, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  LOBYTE(self) = -[WLKLocationManager _isLastKnownLocation:freshForMaxAge:fromNewTimestamp:](self, "_isLastKnownLocation:freshForMaxAge:fromNewTimestamp:", v6, 7200.0, v8);

  return (char)self;
}

- (id)_createLocationObjFromLocationDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("reducedPrecisionLatitudeString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "doubleValue");
      v7 = v6;
      objc_msgSend(v3, "objectForKey:", CFSTR("reducedPrecisionLongitudeString"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "doubleValue");
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v7, v10);
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)_getDistanceOfLastKnownLocationDictionary:(id)a3 fromLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    WLKSystemLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[WLKLocationManager _getDistanceOfLastKnownLocationDictionary:fromLocation:]";
      v13 = "WLKLocationManager - %s: nil newLocation";
LABEL_9:
      _os_log_impl(&dword_1B515A000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);
    }
LABEL_10:

    v11 = *MEMORY[0x1E0C9E318];
    goto LABEL_15;
  }
  if (!v6)
  {
    WLKSystemLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[WLKLocationManager _getDistanceOfLastKnownLocationDictionary:fromLocation:]";
      v13 = "WLKLocationManager - %s: nil location";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  -[WLKLocationManager _createLocationObjFromLocationDictionary:](self, "_createLocationObjFromLocationDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "distanceFromLocation:", v7);
    v11 = v10;
  }
  else
  {
    WLKSystemLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[WLKLocationManager _getDistanceOfLastKnownLocationDictionary:fromLocation:]";
      _os_log_impl(&dword_1B515A000, v14, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s: nil lastKnownLocObj", (uint8_t *)&v16, 0xCu);
    }

    v11 = *MEMORY[0x1E0C9E318];
  }

LABEL_15:
  return v11;
}

- (void)_setLastKnownLocation:(id)a3
{
  NSDictionary *v4;
  NSObject *v5;
  WLKLocationManager *v6;
  NSDictionary *lastKnownLocation;
  NSObject *v8;
  int didChangeNotificationToken;
  pid_t v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (NSDictionary *)a3;
  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[WLKLocationManager _setLastKnownLocation:]";
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - %s", (uint8_t *)&v11, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  lastKnownLocation = v6->_lastKnownLocation;
  v6->_lastKnownLocation = v4;

  objc_sync_exit(v6);
  WLKSystemLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Wrote location", (uint8_t *)&v11, 2u);
  }

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_38);
  didChangeNotificationToken = v6->_didChangeNotificationToken;
  v10 = getpid();
  notify_set_state(didChangeNotificationToken, v10);
  notify_post("com.apple.WatchListKit.WLKLocationManagerLocationDidChangeNotification");
}

void __44__WLKLocationManager__setLastKnownLocation___block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  WLKSystemLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Notifying of location change", v2, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("WLKLocationManagerLocationDidChangeNotification"), 0);

}

- (void)_requestRecentCLLocation:(id)a3
{
  id v4;
  NSObject *clQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clQueue = self->_clQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__WLKLocationManager__requestRecentCLLocation___block_invoke;
  v7[3] = &unk_1E68A8930;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clQueue, v7);

}

void __47__WLKLocationManager__requestRecentCLLocation___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  double v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "location");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Request recent cl location", buf, 2u);
    }

    objc_msgSend(v2, "horizontalAccuracy");
    if (v4 > 1000.0)
    {
      WLKSystemLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Recent cl location accuracy unusable", v11, 2u);
      }

      v2 = 0;
    }
    objc_msgSend(v2, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = v7;

    if (v8 < -86400.0)
    {
      WLKSystemLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Recent cl location is stale", v10, 2u);
      }

      v2 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)_requestCLLocationUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
    -[WLKLocationManager setLocationUpdateBlock:](self, "setLocationUpdateBlock:", v4);
  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Updating location", v6, 2u);
  }

  -[CLLocationManager requestLocation](self->_clLocationManager, "requestLocation");
}

- (id)_dictionaryForCLLocation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%s%df"), "%0.0", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "coordinate");
  objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%f"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "coordinate");
  objc_msgSend(v9, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%f"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("reducedPrecisionLatitudeString");
  v17[1] = CFSTR("reducedPrecisionLongitudeString");
  v18[0] = v8;
  v18[1] = v11;
  v17[2] = CFSTR("secondsSinceEpoch");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v12, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_cachedDictionary:(BOOL)a3
{
  void *v4;
  char v5;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (!a3)
    return -[WLKLocationManager _copyLastKnownLocation](self, "_copyLastKnownLocation");
  +[WLKAppLibrary defaultAppLibrary](WLKAppLibrary, "defaultAppLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTVAppInstalled");

  if ((v5 & 1) != 0)
  {
    if (-[WLKLocationManager isAuthorizationApproved](self, "isAuthorizationApproved"))
      return -[WLKLocationManager _copyLastKnownLocation](self, "_copyLastKnownLocation");
  }
  else
  {
    WLKSystemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - _dictionaryOnDisk: app is not installed", buf, 2u);
    }

    if (-[WLKLocationManager isAuthorizationApproved](self, "isAuthorizationApproved"))
      return 0;
  }
  WLKSystemLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - _dictionaryOnDisk: location not authorized", v9, 2u);
  }

  return 0;
}

void __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WLKSystemLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Notifying of authorization status change", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("WLKLocationManagerAuthorizationStatusDidChangeNotification"), 0, v5);

}

void __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 || !objc_msgSend(*(id *)(a1 + 32), "_isIgnorableLocationError:", v6))
  {
    objc_msgSend(WeakRetained, "_dictionaryForCLLocation:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setLastKnownLocation:", v8);
  }
  else
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_47_cold_1();
  }

}

void __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_48(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(*(id *)(a1 + 32), "_statusForCLAuthorizationStatus:", *(unsigned int *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WLKLocationManagerAuthorizationStatusDidChangeNotification"), 0, v4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  NSObject *clQueue;
  CLLocationManager *v8;
  CLLocationManager *clLocationManager;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  __int16 v15;
  __int16 v16;
  uint8_t buf[2];

  v6 = a4;
  clQueue = self->_clQueue;
  v8 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(clQueue);
  clLocationManager = self->_clLocationManager;

  if (clLocationManager == v8)
  {
    -[WLKLocationManager locationUpdateBlock](self, "locationUpdateBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v6, "count"))
      {
        -[WLKLocationManager locationUpdateBlock](self, "locationUpdateBlock");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v14, 0);

        goto LABEL_12;
      }
      WLKSystemLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v15 = 0;
      v11 = "WLKLocationManager - No location in update";
      v12 = (uint8_t *)&v15;
    }
    else
    {
      WLKSystemLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v16 = 0;
      v11 = "WLKLocationManager - No location update block";
      v12 = (uint8_t *)&v16;
    }
    goto LABEL_4;
  }
  WLKSystemLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v11 = "WLKLocationManager - Location manager ref don't match";
    v12 = buf;
LABEL_4:
    _os_log_impl(&dword_1B515A000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
  }
LABEL_12:

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  NSObject *clQueue;
  CLLocationManager *v8;
  CLLocationManager *clLocationManager;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);

  v6 = a4;
  clQueue = self->_clQueue;
  v8 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(clQueue);
  clLocationManager = self->_clLocationManager;

  if (clLocationManager == v8)
  {
    WLKSystemLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WLKLocationManager locationManager:didFailWithError:].cold.1();

    -[WLKLocationManager locationUpdateBlock](self, "locationUpdateBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WLKLocationManager locationUpdateBlock](self, "locationUpdateBlock");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v6);

    }
  }

}

void __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, -1);

}

uint64_t __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_55(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Daemon callback for auth status %ld", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    WLKConnectionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v8 = self->_connection;
    WLKConnectionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_59);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __33__WLKLocationManager__connection__block_invoke_60;
    v15 = &unk_1E68A7FC0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __33__WLKLocationManager__connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKSystemLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Connection interrupted.", v1, 2u);
  }

}

void __33__WLKLocationManager__connection__block_invoke_60(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  WLKSystemLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKLocationManager - Connection invalidated.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 6);
    *((_QWORD *)WeakRetained + 6) = 0;

  }
}

- (void)setClQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clQueue, a3);
}

- (id)locationUpdateBlock
{
  return self->_locationUpdateBlock;
}

- (void)setLocationUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)didChangeNotificationToken
{
  return self->_didChangeNotificationToken;
}

- (void)setDidChangeNotificationToken:(int)a3
{
  self->_didChangeNotificationToken = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
  objc_storeStrong(&self->_locationUpdateBlock, 0);
  objc_storeStrong((id *)&self->_clQueue, 0);
  objc_storeStrong((id *)&self->_lastKnownLocation, 0);
}

- (void)_networkReachbilityDidChange:.cold.1()
{
  __assert_rtn("-[WLKLocationManager _networkReachbilityDidChange:]", "WLKLocationManager.m", 135, "[NSThread isMainThread]");
}

- (void)fetchAuthorizationStatus:.cold.1()
{
  __assert_rtn("-[WLKLocationManager fetchAuthorizationStatus:]", "WLKLocationManager.m", 175, "completion != nil");
}

void __47__WLKLocationManager_fetchAuthorizationStatus___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B515A000, a1, a3, "WLKLocationManager - fetchAuthorizationStatus timed out.", a5, a6, a7, a8, 0);
}

void __60__WLKLocationManager_locationManagerDidChangeAuthorization___block_invoke_47_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B515A000, v0, v1, "WLKLocationManager - Error requesting location update, not updating our location: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)locationManager:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B515A000, v0, v1, "WLKLocationManager - Location update failed %@", v2);
  OUTLINED_FUNCTION_1();
}

void __51__WLKLocationManager__locationAuthorizationStatus___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B515A000, v0, v1, "WLKLocationManager - Unable to communicate with the remote object proxy (%@)", v2);
  OUTLINED_FUNCTION_1();
}

@end
