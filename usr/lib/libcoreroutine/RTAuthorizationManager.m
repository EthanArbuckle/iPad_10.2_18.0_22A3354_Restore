@implementation RTAuthorizationManager

- (void)fetchRoutineSupportedWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__RTAuthorizationManager_fetchRoutineSupportedWithHandler___block_invoke;
  v7[3] = &unk_1E9297678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)fetchRoutineEnabledWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__RTAuthorizationManager_fetchRoutineEnabledWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __59__RTAuthorizationManager_fetchRoutineSupportedWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "isSupported"));
}

uint64_t __57__RTAuthorizationManager_fetchRoutineEnabledWithHandler___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isSupported"))
    v2 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
  else
    v2 = 0;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = CFSTR("NO");
    if (v2)
      v4 = CFSTR("YES");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "CoreRoutine enabled, %@", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  RTAuthorizationManagerNotificationRoutineEnabled *v11;
  void *v12;
  int v13;
  RTAuthorizationManagerNotificationConsoleUserDidChange *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v7) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v16, 0xCu);
    }

  }
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    v11 = -[RTAuthorizationManagerNotificationRoutineEnabled initWithEnabled:]([RTAuthorizationManagerNotificationRoutineEnabled alloc], "initWithEnabled:", -[RTAuthorizationManager isEnabled](self, "isEnabled"));
    goto LABEL_9;
  }
  +[RTNotification notificationName](RTAuthorizationManagerNotificationConsoleUserDidChange, "notificationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
  {
    v14 = [RTAuthorizationManagerNotificationConsoleUserDidChange alloc];
    -[RTAuthorizationManager userSessionMonitor](self, "userSessionMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[RTAuthorizationManagerNotificationConsoleUserDidChange initWithactiveUser:](v14, "initWithactiveUser:", objc_msgSend(v15, "activeUser"));

    if (!v11)
    {
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v11, v6);
    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[RTNotification notificationName](RTAuthorizationManagerNotificationConsoleUserDidChange, "notificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v6);

  }
  return v5;
}

- (RTAuthorizationManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlatform_userSessionMonitor_);
}

- (RTAuthorizationManager)initWithPlatform:(id)a3 userSessionMonitor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTAuthorizationManager *v10;
  RTInvocationDispatcher *v11;
  void *v12;
  uint64_t v13;
  RTInvocationDispatcher *dispatcher;
  __CFNotificationCenter *DarwinNotifyCenter;
  RTUserSessionMonitor *userSessionMonitor;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  _BOOL4 v20;
  NSObject *v21;
  const __CFString *v22;
  RTAuthorizationManager *v23;
  NSObject *v24;
  const char *v25;
  objc_super v27;
  uint8_t buf[4];
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

      v23 = 0;
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: platform";
LABEL_24:
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_21;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: userSessionMonitor";
    goto LABEL_24;
  }
  v27.receiver = self;
  v27.super_class = (Class)RTAuthorizationManager;
  v10 = -[RTNotifier init](&v27, sel_init);
  if (v10)
  {
    v11 = [RTInvocationDispatcher alloc];
    -[RTNotifier queue](v10, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[RTInvocationDispatcher initWithQueue:](v11, "initWithQueue:", v12);
    dispatcher = v10->_dispatcher;
    v10->_dispatcher = (RTInvocationDispatcher *)v13;

    objc_storeStrong((id *)&v10->_platform, a3);
    objc_storeStrong((id *)&v10->_userSessionMonitor, a4);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)onAppResetChangedNotification, (CFStringRef)*MEMORY[0x1E0CA5560], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    userSessionMonitor = v10->_userSessionMonitor;
    +[RTNotification notificationName](RTUserSessionMonitorNotificationConsoleUserDidChange, "notificationName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](userSessionMonitor, "addObserver:selector:name:", v10, sel_onUserSessionChangeNotification_, v17);

    v10->_supported = objc_msgSend(v7, "supportsCoreRoutineCapability");
    _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (v10->_supported)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v29 = v19;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "CoreRoutine's services supported, %@", buf, 0xCu);
    }

    v20 = -[RTAuthorizationManager isLocationServicesEnabled](v10, "isLocationServicesEnabled");
    if (v20)
      LOBYTE(v20) = -[RTAuthorizationManager isCoreRoutineLocationClientEnabled](v10, "isCoreRoutineLocationClientEnabled");
    v10->_enabled = v20;
    _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      if (v10->_enabled)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "CoreRoutine's location client enabled, %@", buf, 0xCu);
    }

    -[RTAuthorizationManager setup](v10, "setup");
  }
  self = v10;
  v23 = self;
LABEL_22:

  return v23;
}

- (void)_registerForNotifications
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, registered for daily notifications", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

}

- (void)_unregisterForNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (id)_getMetrics:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v3 = a3;
  v5 = -[RTAuthorizationManager isLocationServicesEnabled](self, "isLocationServicesEnabled");
  v6 = -[RTAuthorizationManager isCoreRoutineLocationClientEnabled](self, "isCoreRoutineLocationClientEnabled");
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("coreRoutineSystemServiceEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("locationServicesEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v11 = CFSTR("authorizationStateChange");
  else
    v11 = CFSTR("authorizationState");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v11);

  return v7;
}

- (void)_onDailyMetricsNotification:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v17;
      v20 = 2080;
      v21 = "-[RTAuthorizationManager _onDailyMetricsNotification:]";
      v22 = 1024;
      v23 = 157;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = (const char *)v5;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, received notification, %@", buf, 0x16u);

  }
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v12 & 1) != 0)
  {
    -[RTAuthorizationManager _getMetrics:](self, "_getMetrics:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = (void *)objc_msgSend(v14, "initWithCString:encoding:", RTAnalyticsEventAuthorizationState, 1);
    log_analytics_submission(v15, v13);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    objc_msgSend(v5, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
  }

LABEL_11:
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__RTAuthorizationManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__RTAuthorizationManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDailyMetricsNotification:", *(_QWORD *)(a1 + 40));
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[RTAuthorizationManager allocWithZone:](RTAuthorizationManager_Embedded, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTAuthorizationManager;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__RTAuthorizationManager_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __31__RTAuthorizationManager_setup__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setup");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 1;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invocationsPending");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "dispatchPendingInvocations");
  return result;
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[RTAuthorizationManager dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shutdown");

  -[RTAuthorizationManager _unregisterForNotifications](self, "_unregisterForNotifications");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)RTAuthorizationManager;
  -[RTAuthorizationManager dealloc](&v5, sel_dealloc);
}

- (BOOL)isLocationServicesEnabled
{
  return 0;
}

- (BOOL)isCoreRoutineLocationClientEnabled
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const __CFString *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)CLCopyAppsUsingLocation();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x1E0C9E3C8], "primaryEntityClassForLocationDictionary:", v6) == 16)
        {
          LODWORD(v3) = objc_msgSend(MEMORY[0x1E0C9E3C8], "isEntityAuthorizedForLocationDictionary:", v6);

          goto LABEL_11;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("NO");
    if ((_DWORD)v3)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "CoreRoutine's location client enabled, %@", buf, 0xCu);
  }

  return v3;
}

- (BOOL)shouldPersistLocations
{
  void *v2;
  char v3;

  -[RTAuthorizationManager userSessionMonitor](self, "userSessionMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeUser");

  return v3;
}

- (void)setRoutineEnabled:(BOOL)a3 withHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTAuthorizationManager_setRoutineEnabled_withHandler___block_invoke;
  block[3] = &unk_1E9297848;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __56__RTAuthorizationManager_setRoutineEnabled_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 48))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "set routine enabled to %@", buf, 0xCu);
  }

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)CLCopyAppsUsingLocation();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x1E0C9E3C8], "primaryEntityClassForLocationDictionary:", v9) == 16)
        {
          objc_msgSend(MEMORY[0x1E0C9E3C8], "setEntityAuthorized:forLocationDictionary:", *(unsigned __int8 *)(a1 + 48), v9);

          goto LABEL_16;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_16:

  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 48));
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);

}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  RTAuthorizationManagerNotificationRoutineEnabled *v8;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    v8 = -[RTAuthorizationManagerNotificationRoutineEnabled initWithEnabled:]([RTAuthorizationManagerNotificationRoutineEnabled alloc], "initWithEnabled:", self->_enabled);
    -[RTNotifier postNotification:](self, "postNotification:", v8);
    -[RTAuthorizationManager _getMetrics:](self, "_getMetrics:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (void *)objc_msgSend(v5, "initWithCString:encoding:", RTAnalyticsEventAuthorizationStateChange, 1);
    log_analytics_submission(v6, v4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (void)updateRoutineEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__RTAuthorizationManager_updateRoutineEnabled___block_invoke;
  v6[3] = &unk_1E9297870;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

uint64_t __47__RTAuthorizationManager_updateRoutineEnabled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "update routine enabled to %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)handleAppResetChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTAuthorizationManager_handleAppResetChangeNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__RTAuthorizationManager_handleAppResetChangeNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "isCoreRoutineLocationClientEnabled"));
  _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
    v4 = CFSTR("NO");
    if (v3)
      v4 = CFSTR("YES");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Overall CoreRoutine services enabled after app reset changed notification, %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)onUserSessionChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTAuthorizationManager *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__RTAuthorizationManager_onUserSessionChangeNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__RTAuthorizationManager_onUserSessionChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v6;
  RTAuthorizationManagerNotificationConsoleUserDidChange *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTUserSessionMonitorNotificationConsoleUserDidChange, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "activeUser");
      v9 = 67109120;
      LODWORD(v10) = v6;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "active user did change: is active user: %d", (uint8_t *)&v9, 8u);
    }

    v7 = -[RTAuthorizationManagerNotificationConsoleUserDidChange initWithactiveUser:]([RTAuthorizationManagerNotificationConsoleUserDidChange alloc], "initWithactiveUser:", objc_msgSend(*(id *)(a1 + 32), "activeUser"));
    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "postNotification:", v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = (RTAuthorizationManagerNotificationConsoleUserDidChange *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v8;
      v11 = 2080;
      v12 = "-[RTAuthorizationManager onUserSessionChangeNotification:]_block_invoke";
      v13 = 1024;
      v14 = 393;
      _os_log_error_impl(&dword_1D1A22000, &v7->super.super, OS_LOG_TYPE_ERROR, "unhandled notification name, %@ (in %s:%d)", (uint8_t *)&v9, 0x1Cu);

    }
  }

}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (RTUserSessionMonitor)userSessionMonitor
{
  return (RTUserSessionMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserSessionMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSessionMonitor, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end
