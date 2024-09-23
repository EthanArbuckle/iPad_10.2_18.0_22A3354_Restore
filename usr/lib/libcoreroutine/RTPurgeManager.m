@implementation RTPurgeManager

+ (id)purgeTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E9299648[a3];
}

- (RTPurgeManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager_);
}

- (RTPurgeManager)initWithDefaultsManager:(id)a3 learnedLocationStore:(id)a4 lifeCycleManager:(id)a5 platform:(id)a6 purgers:(id)a7 visitStore:(id)a8 xpcActivityManager:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTPurgeManager *v19;
  RTPurgeManager *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  RTDarwinNotificationHelper *notificationHelper;
  RTDarwinNotificationHelper *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  RTXPCActivityCriteria *v34;
  void *v35;
  RTPurgeManager *v36;
  NSObject *v37;
  RTPurgeManager *val;
  void *v41;
  id obj;
  void *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48[2];
  _QWORD handler[4];
  id v50;
  id v51;
  int out_token;
  _QWORD v53[4];
  id v54;
  id location[2];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v44 = a7;
  v46 = a8;
  v45 = a9;
  v41 = v16;
  obj = v17;
  v43 = v18;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationStore", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lifecycleManager", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v46)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitStore", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v45)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager", (uint8_t *)location, 2u);
    }
LABEL_39:

    v36 = 0;
    goto LABEL_40;
  }
  v60.receiver = self;
  v60.super_class = (Class)RTPurgeManager;
  v19 = -[RTNotifier init](&v60, sel_init);
  val = v19;
  v20 = v19;
  if (v19)
  {
    v19->_pressureState = 0;
    v21 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v22 = v44;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v57 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v21, "insertObject:atIndex:", v26, 0);
          else
            objc_msgSend(v21, "addObject:", v26);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v23);
    }

    objc_storeStrong((id *)&val->_learnedLocationStore, a4);
    objc_storeWeak((id *)&val->_lifeCycleManager, obj);
    objc_storeStrong((id *)&val->_platform, a6);
    objc_storeStrong((id *)&val->_purgers, v21);
    objc_storeStrong((id *)&val->_visitStore, a8);
    objc_storeStrong((id *)&val->_xpcActivityManager, a9);
    v27 = objc_opt_new();
    notificationHelper = val->_notificationHelper;
    val->_notificationHelper = (RTDarwinNotificationHelper *)v27;

    objc_initWeak(location, val);
    v29 = val->_notificationHelper;
    v30 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke;
    v53[3] = &unk_1E92983E8;
    objc_copyWeak(&v54, location);
    -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](v29, "addObserverForNotificationName:handler:", CFSTR("com.apple.language.changed"), v53);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", val, sel_onCoreLocationPrivacyReset, *MEMORY[0x1E0CA5560], 0);

    if (objc_msgSend(v43, "internalInstall"))
    {
      out_token = -1;
      v32 = (const char *)objc_msgSend(CFSTR("PurgeNow"), "UTF8String");
      -[RTNotifier queue](val, "queue");
      v33 = objc_claimAutoreleasedReturnValue();
      handler[0] = v30;
      handler[1] = 3221225472;
      handler[2] = __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_2;
      handler[3] = &unk_1E9298AA8;
      objc_copyWeak(&v51, location);
      v50 = v15;
      notify_register_dispatch(v32, &out_token, v33, handler);

      objc_destroyWeak(&v51);
    }
    v34 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 0, 0, 0, 0, 0, 86400.0, 43200.0);
    -[RTXPCActivityCriteria setCpuIntensive:](v34, "setCpuIntensive:", 1);
    -[RTPurgeManager xpcActivityManager](val, "xpcActivityManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v30;
    v47[1] = 3221225472;
    v47[2] = __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_44;
    v47[3] = &unk_1E9297790;
    v48[1] = (id)a2;
    objc_copyWeak(v48, location);
    objc_msgSend(v35, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.purge"), v34, v47);

    objc_destroyWeak(v48);
    objc_destroyWeak(&v54);
    objc_destroyWeak(location);

    v20 = val;
  }
  self = v20;
  v36 = self;
LABEL_40:

  return v36;
}

void __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "handleLanguageChangeNotification");
    WeakRetained = v2;
  }

}

void __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PurgeNow"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412546;
      v6 = CFSTR("PurgeNow");
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "default, %@, value, %@", (uint8_t *)&v5, 0x16u);
    }

    if (objc_msgSend(v3, "BOOLValue"))
      objc_msgSend(WeakRetained, "_purge:", 0);

  }
}

void __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  void (**v11)(id, id);
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_45;
      v10[3] = &unk_1E92971A0;
      v12 = *(_QWORD *)(a1 + 40);
      v11 = v5;
      objc_msgSend(WeakRetained, "purge:", v10);

    }
    else if (v5)
    {
      v5[2](v5, 0);
    }

  }
}

void __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to purge, error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)dealloc
{
  NSObject *memoryWarningDispatchSource;
  OS_dispatch_source *v4;
  void *v5;
  NSArray *purgers;
  objc_super v7;

  memoryWarningDispatchSource = self->_memoryWarningDispatchSource;
  if (memoryWarningDispatchSource)
  {
    dispatch_source_cancel(memoryWarningDispatchSource);
    v4 = self->_memoryWarningDispatchSource;
    self->_memoryWarningDispatchSource = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.language.changed"));
  purgers = self->_purgers;
  self->_purgers = 0;

  v7.receiver = self;
  v7.super_class = (Class)RTPurgeManager;
  -[RTPurgeManager dealloc](&v7, sel_dealloc);
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  NSArray *purgers;
  void *v7;
  id v8;

  v8 = a3;
  -[RTPurgeManager xpcActivityManager](self, "xpcActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.purge"), 0);

  -[RTPurgeManager _unregisterForMemoryPressureWarnings](self, "_unregisterForMemoryPressureWarnings");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.language.changed"));
  purgers = self->_purgers;
  self->_purgers = 0;

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    v7 = v8;
  }

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTPurgeManagerNotificationMemoryWarning, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) == 1)
      -[RTPurgeManager _registerForMemoryPressureWarnings](self, "_registerForMemoryPressureWarnings");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Unsupported notification %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTPurgeManagerNotificationMemoryWarning, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
      -[RTPurgeManager _unregisterForMemoryPressureWarnings](self, "_unregisterForMemoryPressureWarnings");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Unsupported notification %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)_registerForMemoryPressureWarnings
{
  OS_dispatch_source **p_memoryWarningDispatchSource;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  _QWORD handler[4];
  dispatch_source_t v8;
  id v9;
  id location;

  p_memoryWarningDispatchSource = &self->_memoryWarningDispatchSource;
  if (!self->_memoryWarningDispatchSource)
  {
    -[RTNotifier queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, v4);

    objc_storeStrong((id *)p_memoryWarningDispatchSource, v5);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __52__RTPurgeManager__registerForMemoryPressureWarnings__block_invoke;
    handler[3] = &unk_1E9298210;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    v6 = v5;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __52__RTPurgeManager__registerForMemoryPressureWarnings__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uintptr_t data;
  BOOL v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
    if (data == 1)
    {
      v5 = 0;
    }
    else if (data == 4)
    {
      v5 = 2;
    }
    else
    {
      v4 = data == 2;
      WeakRetained = v6;
      if (!v4)
        goto LABEL_10;
      v5 = 1;
    }
    objc_msgSend(v6, "setPressureState:", v5);
    WeakRetained = v6;
  }
LABEL_10:

}

- (void)_unregisterForMemoryPressureWarnings
{
  NSObject *memoryWarningDispatchSource;
  OS_dispatch_source *v4;

  memoryWarningDispatchSource = self->_memoryWarningDispatchSource;
  if (memoryWarningDispatchSource)
  {
    dispatch_source_cancel(memoryWarningDispatchSource);
    v4 = self->_memoryWarningDispatchSource;
    self->_memoryWarningDispatchSource = 0;

  }
}

- (void)purge:(id)a3
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
  v7[2] = __24__RTPurgeManager_purge___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __24__RTPurgeManager_purge___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purge:", *(_QWORD *)(a1 + 40));
}

- (void)_purge:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityPurge);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "request to do periodic purge received.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __25__RTPurgeManager__purge___block_invoke;
  v8[3] = &unk_1E9297568;
  v9 = v4;
  v7 = v4;
  -[RTPurgeManager _purgeWithType:referenceDate:handler:](self, "_purgeWithType:referenceDate:handler:", 0, v6, v8);

}

void __25__RTPurgeManager__purge___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "error occurred during old data purge, %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)clearRoutineWithHandler:(id)a3
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
  v7[2] = __42__RTPurgeManager_clearRoutineWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__RTPurgeManager_clearRoutineWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  _rt_log_facility_get_os_log(RTLogFacilityPurge);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "request to do clear routine received.", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__RTPurgeManager_clearRoutineWithHandler___block_invoke_52;
  v5[3] = &unk_1E9297568;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_purgeWithType:referenceDate:handler:", 1, v4, v5);

}

void __42__RTPurgeManager_clearRoutineWithHandler___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "error occurred during clear routine, %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)onCoreLocationPrivacyReset
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__RTPurgeManager_onCoreLocationPrivacyReset__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __44__RTPurgeManager_onCoreLocationPrivacyReset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  _rt_log_facility_get_os_log(RTLogFacilityPurge);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "request to purge from reset location and privacy received.", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_purgeWithType:referenceDate:handler:", 2, v4, &__block_literal_global_16);

}

void __44__RTPurgeManager_onCoreLocationPrivacyReset__block_invoke_53(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "error occurred during reset location and privacy, %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id)_generatePeriodicPurgeReferenceDateDict
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPurgeManager _shortTermReferenceDate:](self, "_shortTermReferenceDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPurgeManager _longTermReferenceDate:](self, "_longTermReferenceDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)MEMORY[0x1E0C99D80];
  v7 = v3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithObjectsAndKeys:", v4, &unk_1E93269C0, v5, &unk_1E93269D8, v7, &unk_1E93269F0, 0);

  return v8;
}

- (id)_selectPruneDateFromReferenceDateDict:(id)a3 purger:(id)a4 type:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "purgeTypeToString:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v13;
        v16 = 2080;
        v17 = "-[RTPurgeManager _selectPruneDateFromReferenceDateDict:purger:type:]";
        v18 = 1024;
        v19 = 406;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "pruneReferenceDict must not be nil for type, %@ (in %s:%d)", (uint8_t *)&v14, 0x1Cu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "periodicPurgePolicy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_purgeWithType:(int64_t)a3 referenceDate:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSUInteger v11;
  void *v12;
  uint64_t v13;
  RTPurgeManager *v14;
  RTPurgeManager *v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  dispatch_time_t v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void (**v43)(_QWORD, _QWORD);
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void (**v53)(_QWORD, _QWORD);
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  void *v57;
  void *v59;
  dispatch_semaphore_t v60;
  NSArray *obj;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  _QWORD v66[6];
  id v67;
  id v68;
  NSObject *v69;
  int64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _BYTE v77[128];
  _BYTE buf[12];
  __int16 v79;
  void *v80;
  _QWORD v81[4];

  v81[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v60 = dispatch_semaphore_create(0);
  v9 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilityPurge);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = -[NSArray count](self->_purgers, "count");
    objc_msgSend((id)objc_opt_class(), "purgeTypeToString:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v11;
    v79 = 2112;
    v80 = v12;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "starting purge with %lu purgers, type, %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v59 = 0;
    v14 = self;
  }
  else
  {
    v14 = self;
    -[RTPurgeManager _generatePeriodicPurgeReferenceDateDict](self, "_generatePeriodicPurgeReferenceDateDict");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v13;
  v53 = (void (**)(_QWORD, _QWORD))v8;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v14->_purgers;
  v15 = v14;
  v64 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v64)
  {
    v65 = 0;
    v63 = *(_QWORD *)v72;
    v54 = *MEMORY[0x1E0CB2D50];
    v55 = *MEMORY[0x1E0D18598];
    v16 = 0x1E0C99000uLL;
    v56 = a3;
    v57 = v9;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v72 != v63)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(*(id *)(v16 + 3432), "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityPurge);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "purgeTypeToString:", a3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v22;
          v79 = 2112;
          v80 = v23;
          _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "purger of class %@ started, type, %@", buf, 0x16u);

          v16 = 0x1E0C99000uLL;
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[RTPurgeManager _selectPruneDateFromReferenceDateDict:purger:type:](v15, "_selectPruneDateFromReferenceDateDict:purger:type:", v59, v18, a3);
          v24 = objc_claimAutoreleasedReturnValue();

          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = __55__RTPurgeManager__purgeWithType_referenceDate_handler___block_invoke;
          v66[3] = &unk_1E92989F8;
          v66[4] = v18;
          v66[5] = v15;
          v70 = a3;
          v67 = v19;
          v68 = v9;
          v25 = v60;
          v69 = v25;
          v62 = (void *)v24;
          objc_msgSend(v18, "performPurgeOfType:referenceDate:completion:", a3, v24, v66);
          v26 = v25;
          objc_msgSend(*(id *)(v16 + 3432), "now");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = dispatch_time(0, 3600000000000);
          v29 = v65;
          if (dispatch_semaphore_wait(v26, v28))
          {
            objc_msgSend(*(id *)(v16 + 3432), "now");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "timeIntervalSinceDate:", v27);
            v32 = v31;
            v33 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_164);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "filteredArrayUsingPredicate:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "firstObject");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "submitToCoreAnalytics:type:duration:", v37, 1, v32);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v39 = (void *)MEMORY[0x1E0CB35C8];
            v81[0] = v54;
            *(_QWORD *)buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v81, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "errorWithDomain:code:userInfo:", v55, 15, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = v65;
            a3 = v56;
            v9 = v57;
            v15 = self;
            v16 = 0x1E0C99000;
            if (v41)
            {
              v29 = objc_retainAutorelease(v41);

            }
          }

          v42 = v29;
          v65 = v42;
          v7 = v62;
        }

      }
      v64 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    }
    while (v64);
  }
  else
  {
    v65 = 0;
  }

  if (!objc_msgSend(v9, "count"))
  {
    v47 = 0;
    v44 = v52;
    v43 = v53;
    if (!v53)
      goto LABEL_30;
    goto LABEL_29;
  }
  v44 = v52;
  v43 = v53;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v45 = *MEMORY[0x1E0D18590];
    v75[0] = *MEMORY[0x1E0CB2D50];
    v75[1] = v45;
    v76[0] = CFSTR("Multiple errors occurred.");
    v76[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 9, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v53)
      goto LABEL_30;
LABEL_29:
    ((void (**)(_QWORD, void *))v43)[2](v43, v47);
    goto LABEL_30;
  }
  objc_msgSend(v9, "firstObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    goto LABEL_29;
LABEL_30:
  _rt_log_facility_get_os_log(RTLogFacilityPurge);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "purgeTypeToString:", a3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "timeIntervalSinceDate:", v44);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v49;
    v79 = 2048;
    v80 = v51;
    _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_INFO, "finished purge, type, %@, latency, %.2f", buf, 0x16u);

  }
}

void __55__RTPurgeManager__purgeWithType_referenceDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityPurge);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "purgeTypeToString:", *(_QWORD *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v13 = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2048;
    v18 = v9;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "purger of class %@ finished, type, %@, latency, %.2f", (uint8_t *)&v13, 0x20u);

  }
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("RTPersistenceMirroringManagerErrorDomain")) & 1) != 0)
    {
      objc_msgSend(v3, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("RTPersistenceMirroringManagerErrorDomain"))
        || objc_msgSend(v3, "code") == 5)
      {

        goto LABEL_10;
      }
      v12 = objc_msgSend(v3, "code");

      if (v12 == 3)
        goto LABEL_10;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

- (void)setPressureState:(int64_t)a3
{
  RTPurgeManagerNotificationMemoryWarning *v4;
  RTPurgeManagerNotificationMemoryWarning *v5;

  if (self->_pressureState != a3)
  {
    self->_pressureState = a3;
    v4 = -[RTPurgeManagerNotificationMemoryWarning initWithMemoryPressureState:]([RTPurgeManagerNotificationMemoryWarning alloc], "initWithMemoryPressureState:", self->_pressureState);
    if (v4)
    {
      v5 = v4;
      -[RTNotifier postNotification:](self, "postNotification:", v4);
      v4 = v5;
    }

  }
}

- (void)handleLanguageChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTPurgeManager_handleLanguageChangeNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__RTPurgeManager_handleLanguageChangeNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLanguageChangeNotification");
}

- (void)_handleLanguageChangeNotification
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  _rt_log_facility_get_os_log(RTLogFacilityPurge);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "receive language change notification", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__RTPurgeManager__handleLanguageChangeNotification__block_invoke;
  v5[3] = &unk_1E9297150;
  v5[4] = self;
  -[RTPurgeManager _purgeWithType:referenceDate:handler:](self, "_purgeWithType:referenceDate:handler:", 3, v4, v5);

}

void __51__RTPurgeManager__handleLanguageChangeNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "error occurred during purge localized data, %@", (uint8_t *)&v7, 0xCu);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityPurge);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "exiting after processing the language change notification", (uint8_t *)&v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "lifeCycleManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exit");

}

- (id)_shortTermReferenceDate:(id)a3
{
  id v4;
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
  NSObject *v15;
  uint8_t v17[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:", -604800.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", -259200.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v7);
    -[RTPurgeManager _cacheDateDependencyForVisitWithDateInterval:](self, "_cacheDateDependencyForVisitWithDateInterval:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

    -[RTPurgeManager _cacheDateDependencyUnlabeledLearnedVisitWithDateInterval:](self, "_cacheDateDependencyUnlabeledLearnedVisitWithDateInterval:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    -[RTPurgeManager _cacheDateDependencyLabeledLearnedVisitWithDateInterval:](self, "_cacheDateDependencyLabeledLearnedVisitWithDateInterval:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

    -[RTPurgeManager _cacheDateDependencyMomentsWithDateInterval:](self, "_cacheDateDependencyMomentsWithDateInterval:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

    objc_msgSend(v8, "valueForKeyPath:", CFSTR("@min.self"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", v17, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -604800.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_longTermReferenceDate:(id)a3
{
  return (id)objc_msgSend(a3, "dateByAddingTimeInterval:", -4838400.0);
}

- (id)_determinePruneDate:(id)a3 boundaryInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "laterDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "earlierDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cacheDateDependencyForVisitWithDateInterval:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  id v16;
  uint8_t buf[4];
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  -[RTPurgeManager _lastVisitWithError:](self, "_lastVisitWithError:", &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v16;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "_cacheDateDependencyForVisitWithDateInterval, when trying to retrieve lastVisit, got error %@", buf, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "exit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(v5, "entry");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

    }
    else
    {
      v12 = 0;
    }
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (v12)
      {
        objc_msgSend(v12, "stringFromDate");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = CFSTR("nil");
      }
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "_cacheDateDependencyForVisitWithDateInterval: lastVisitDate is %@", buf, 0xCu);
      if (v12)

    }
    if (v12)
    {
      -[RTPurgeManager _determinePruneDate:boundaryInterval:](self, "_determinePruneDate:boundaryInterval:", v12, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v8;
}

- (id)_lastVisitWithError:(id *)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  NSObject *v30;
  id v31;
  objc_class *v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v39[4];
  NSObject *v40;
  _BYTE *v41;
  uint64_t *v42;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE buf[12];
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  _BYTE v54[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[4];

  v58[1] = *MEMORY[0x1E0C80C00];
  -[RTPurgeManager visitStore](self, "visitStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v54 = 136315394;
      *(_QWORD *)&v54[4] = "-[RTPurgeManager _lastVisitWithError:]";
      *(_WORD *)&v54[12] = 1024;
      *(_DWORD *)&v54[14] = 604;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "_lastVisitWithError, visitStore is nil (in %s:%d)", v54, 0x12u);
    }

  }
  *(_QWORD *)v54 = 0;
  *(_QWORD *)&v54[8] = v54;
  *(_QWORD *)&v54[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__20;
  v56 = __Block_byref_object_dispose__20;
  v57 = 0;
  v43 = 0;
  v44 = (id *)&v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__20;
  v47 = __Block_byref_object_dispose__20;
  v48 = 0;
  v6 = objc_alloc(MEMORY[0x1E0D18508]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, v7, 0, 0, &unk_1E9326A08);

  v9 = dispatch_semaphore_create(0);
  -[RTPurgeManager visitStore](self, "visitStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __38__RTPurgeManager__lastVisitWithError___block_invoke;
  v39[3] = &unk_1E9296EE0;
  v41 = v54;
  v42 = &v43;
  v11 = v9;
  v40 = v11;
  objc_msgSend(v10, "fetchVisitsWithOptions:handler:", v8, v39);

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_164);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  v58[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v58, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

    v28 = 0;
  }
  else
  {
LABEL_10:
    v27 = 0;
    v28 = 1;
  }

  v29 = v27;
  if ((v28 & 1) == 0)
    objc_storeStrong(v44 + 5, v27);
  if (a3 && v44[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v44[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v34;
      v50 = 2112;
      v51 = v35;
      v52 = 2112;
      v53 = v36;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v31 = 0;
    *a3 = objc_retainAutorelease(v44[5]);
  }
  else
  {
    v31 = *(id *)(*(_QWORD *)&v54[8] + 40);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(v54, 8);

  return v31;
}

void __38__RTPurgeManager__lastVisitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_cacheDateDependencyUnlabeledLearnedVisitWithDateInterval:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  id v13;
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  -[RTPurgeManager _firstUnlabeledLearnedVisitWithError:](self, "_firstUnlabeledLearnedVisitWithError:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v13;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "_cacheDateDependencyUnlabeledLearnedVisit, when trying to retrieve unlabeled firstVisit, got error %@", buf, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "entryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v9)
      {
        objc_msgSend(v9, "stringFromDate");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = CFSTR("nil");
      }
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "_cacheDateDependencyUnlabeledLearnedVisitWithDateInterval unlabeled firstVisit.entryDate is %@", buf, 0xCu);
      if (v9)

    }
    if (v9)
    {
      -[RTPurgeManager _determinePruneDate:boundaryInterval:](self, "_determinePruneDate:boundaryInterval:", v9, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v8;
}

- (id)_firstUnlabeledLearnedVisitWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  NSObject *v28;
  id v29;
  objc_class *v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v36[4];
  NSObject *v37;
  _BYTE *v38;
  uint64_t *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE buf[12];
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  -[RTPurgeManager learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v51 = 136315394;
      *(_QWORD *)&v51[4] = "-[RTPurgeManager _firstUnlabeledLearnedVisitWithError:]";
      *(_WORD *)&v51[12] = 1024;
      *(_DWORD *)&v51[14] = 661;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "_firstUnlabeledLearnedVisitWithError, learnedLocationStore is nil (in %s:%d)", v51, 0x12u);
    }

  }
  *(_QWORD *)v51 = 0;
  *(_QWORD *)&v51[8] = v51;
  *(_QWORD *)&v51[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__20;
  v53 = __Block_byref_object_dispose__20;
  v54 = 0;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__20;
  v44 = __Block_byref_object_dispose__20;
  v45 = 0;
  v7 = dispatch_semaphore_create(0);
  -[RTPurgeManager learnedLocationStore](self, "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __55__RTPurgeManager__firstUnlabeledLearnedVisitWithError___block_invoke;
  v36[3] = &unk_1E9296EE0;
  v38 = v51;
  v39 = &v40;
  v9 = v7;
  v37 = v9;
  objc_msgSend(v8, "fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:limit:", v36, &unk_1E9326A08);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_164);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v55[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v55, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_retainAutorelease(v24);

    v26 = 0;
  }
  else
  {
LABEL_10:
    v25 = 0;
    v26 = 1;
  }

  v27 = v25;
  if ((v26 & 1) == 0)
    objc_storeStrong(v41 + 5, v25);
  if (a3 && v41[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v41[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v32;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v34;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v29 = 0;
    *a3 = objc_retainAutorelease(v41[5]);
  }
  else
  {
    v29 = *(id *)(*(_QWORD *)&v51[8] + 40);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v51, 8);

  return v29;
}

void __55__RTPurgeManager__firstUnlabeledLearnedVisitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_cacheDateDependencyLabeledLearnedVisitWithDateInterval:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  id v13;
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  -[RTPurgeManager _lastLabeledLearnedVisitWithError:](self, "_lastLabeledLearnedVisitWithError:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v13;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "_cacheDateDependencyLabeledLearnedVisitWithDateInterval, when trying to retrieve labeled lastVisit.exitDate, got error %@", buf, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "exitDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v9)
      {
        objc_msgSend(v9, "stringFromDate");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = CFSTR("nil");
      }
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "_cacheDateDependencyLabeledLearnedVisitWithDateInterval, labeled lastVisit.exitDate is %@", buf, 0xCu);
      if (v9)

    }
    if (v9)
    {
      -[RTPurgeManager _determinePruneDate:boundaryInterval:](self, "_determinePruneDate:boundaryInterval:", v9, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v8;
}

- (id)_cacheDateDependencyMomentsWithDateInterval:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE buf[24];
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPurgeManager platform](self, "platform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "iPhoneDevice");

  if (v8)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v9 = (void *)_MergedGlobals_3;
    v21 = _MergedGlobals_3;
    if (!_MergedGlobals_3)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMOOnboardingManagerClass_block_invoke;
      v23 = &unk_1E9298BF8;
      v24 = &v18;
      __getMOOnboardingManagerClass_block_invoke((uint64_t)buf);
      v9 = (void *)v19[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v10, "sharedInstance", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "onboardingFlowCompletionStatus");

    if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(v5, "startDate");
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    _rt_log_facility_get_os_log(RTLogFacilityPurge);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v23 = v16;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, onboarding flow completion status, %lu, earliest date required by moments, %@", buf, 0x20u);

    }
  }

  return v6;
}

- (id)_lastLabeledLearnedVisitWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  NSObject *v28;
  id v29;
  objc_class *v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v36[4];
  NSObject *v37;
  _BYTE *v38;
  uint64_t *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE buf[12];
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  -[RTPurgeManager learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v51 = 136315394;
      *(_QWORD *)&v51[4] = "-[RTPurgeManager _lastLabeledLearnedVisitWithError:]";
      *(_WORD *)&v51[12] = 1024;
      *(_DWORD *)&v51[14] = 739;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "_lastLabeledLearnedVisitWithError, learnedLocationStore is nil (in %s:%d)", v51, 0x12u);
    }

  }
  *(_QWORD *)v51 = 0;
  *(_QWORD *)&v51[8] = v51;
  *(_QWORD *)&v51[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__20;
  v53 = __Block_byref_object_dispose__20;
  v54 = 0;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__20;
  v44 = __Block_byref_object_dispose__20;
  v45 = 0;
  v7 = dispatch_semaphore_create(0);
  -[RTPurgeManager learnedLocationStore](self, "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __52__RTPurgeManager__lastLabeledLearnedVisitWithError___block_invoke;
  v36[3] = &unk_1E9298D70;
  v38 = v51;
  v39 = &v40;
  v9 = v7;
  v37 = v9;
  objc_msgSend(v8, "fetchLastVisitWithHandler:", v36);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_164);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v55[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v55, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_retainAutorelease(v24);

    v26 = 0;
  }
  else
  {
LABEL_10:
    v25 = 0;
    v26 = 1;
  }

  v27 = v25;
  if ((v26 & 1) == 0)
    objc_storeStrong(v41 + 5, v25);
  if (a3 && v41[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v41[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v32;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v34;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v29 = 0;
    *a3 = objc_retainAutorelease(v41[5]);
  }
  else
  {
    v29 = *(id *)(*(_QWORD *)&v51[8] + 40);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v51, 8);

  return v29;
}

void __52__RTPurgeManager__lastLabeledLearnedVisitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (OS_dispatch_source)memoryWarningDispatchSource
{
  return self->_memoryWarningDispatchSource;
}

- (void)setMemoryWarningDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_memoryWarningDispatchSource, a3);
}

- (int64_t)pressureState
{
  return self->_pressureState;
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTLifeCycleManager)lifeCycleManager
{
  return (RTLifeCycleManager *)objc_loadWeakRetained((id *)&self->_lifeCycleManager);
}

- (void)setLifeCycleManager:(id)a3
{
  objc_storeWeak((id *)&self->_lifeCycleManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (NSArray)purgers
{
  return self->_purgers;
}

- (void)setPurgers:(id)a3
{
  objc_storeStrong((id *)&self->_purgers, a3);
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (void)setVisitStore:(id)a3
{
  objc_storeStrong((id *)&self->_visitStore, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_purgers, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_destroyWeak((id *)&self->_lifeCycleManager);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_memoryWarningDispatchSource, 0);
}

@end
