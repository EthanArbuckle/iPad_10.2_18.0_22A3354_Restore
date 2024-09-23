@implementation SMActiveSessionZone

- (SMActiveSessionZone)initWithQueue:(id)a3 defaultsManager:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  SMActiveSessionZone *v16;
  SMActiveSessionZone *v17;
  uint64_t v18;
  NSHashTable *observers;
  SMActiveSessionZone *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@", buf, 0x16u);

    }
    v13 = objc_alloc(MEMORY[0x1E0C95098]);
    v14 = objc_msgSend(v13, "initWithZoneName:ownerName:", CFSTR("ActiveSessionZone"), *MEMORY[0x1E0C94730]);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v14);
    v22.receiver = self;
    v22.super_class = (Class)SMActiveSessionZone;
    v16 = -[SMCloudKitZone initWithZone:queue:](&v22, sel_initWithZone_queue_, v15, v7);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_defaultsManager, a4);
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v18 = objc_claimAutoreleasedReturnValue();
      observers = v17->_observers;
      v17->_observers = (NSHashTable *)v18;

      -[SMActiveSessionZone setup](v17, "setup");
    }
    self = v17;

    v20 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[SMCloudKitZone queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SMActiveSessionZone_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __28__SMActiveSessionZone_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaHandoffEnabled"))
  {
    if (+[RTBootInfo isFirstRunSinceBootWithDefaultsManager:defaultsKey:](RTBootInfo, "isFirstRunSinceBootWithDefaultsManager:defaultsKey:", self->_defaultsManager, CFSTR("SMDefaultsBootInfoActiveSessionDetailsIsFetchedSinceBootkey")))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v9 = 136315138;
        v10 = "-[SMActiveSessionZone _setup]";
        _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, clearing up the defaults related to the local copy of ActiveSessionDetails", (uint8_t *)&v9, 0xCu);
      }

      -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", 0, CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsKey"));
      -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", 0, CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchSuccessDateKey"));
      -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", 0, CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"));
      -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchedFromCloudKitSinceBootKey"));
      -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTBootInfo setBootSessionIDWithDefaultsManager:defaultsKey:](RTBootInfo, "setBootSessionIDWithDefaultsManager:defaultsKey:", v5, CFSTR("SMDefaultsBootInfoActiveSessionDetailsIsFetchedSinceBootkey"));

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v7 = (char *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 1024;
        v12 = 1;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, isFirstRunSinceBoot, %d, clearing ActiveSessionDetails local copy and defaults entries since device rebooted", (uint8_t *)&v9, 0x12u);

      }
    }
    -[SMActiveSessionZone initializeSyncEngine](self, "initializeSyncEngine");
    if (-[SMActiveSessionZone isActiveSessionDetailsOutOfSync](self, "isActiveSessionDetailsOutOfSync"))
    {
      -[SMActiveSessionZone updateActiveSessionDetailsFromCloudKitRecord](self, "updateActiveSessionDetailsFromCloudKitRecord");
    }
    else
    {
      -[SMActiveSessionZone _getLatestActiveSessionDetailsLocalCopy](self, "_getLatestActiveSessionDetailsLocalCopy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMActiveSessionZone setLatestActiveSessionDetails:](self, "setLatestActiveSessionDetails:", v8);

    }
  }
}

- (void)dealloc
{
  CKSyncEngine *syncEngine;
  objc_super v4;

  syncEngine = self->_syncEngine;
  if (syncEngine)
  {
    self->_syncEngine = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)SMActiveSessionZone;
  -[SMCloudKitZone dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMCloudKitZone queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SMActiveSessionZone_addObserver___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __35__SMActiveSessionZone_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addObserver:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMCloudKitZone queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SMActiveSessionZone_removeObserver___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __38__SMActiveSessionZone_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v7;
    v12 = 2080;
    v13 = "-[SMActiveSessionZone _addObserver:]";
    v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, adding observer, %@", (uint8_t *)&v10, 0x20u);

  }
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);

}

- (void)_removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v7;
    v12 = 2080;
    v13 = "-[SMActiveSessionZone _removeObserver:]";
    v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, removing observer, %@", (uint8_t *)&v10, 0x20u);

  }
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (void)_notifyObserversForActiveSessionDetailsFetchAttemptedFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SMActiveSessionZone observers](self, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v22 = "-[SMActiveSessionZone _notifyObserversForActiveSessionDetailsFetchAttemptedFromCKCompleted:success:error:]";
            v23 = 2112;
            v24 = v15;
            _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%s, calling the selector in the observer, %@", buf, 0x16u);
          }

          objc_msgSend(v15, "onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:", v8, v6, v9);
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

}

- (void)setupZoneWithQos:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: qos";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  -[RTDefaultsManager objectForKey:value:](self->_defaultsManager, "objectForKey:value:", CFSTR("RTDefaultsSafetyCacheActiveSessionZoneTTLkey"), &unk_1E932D180);
  v10 = objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)SMActiveSessionZone;
  -[SMCloudKitZone zone](&v23, sel_zone);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setExpirationAfterTimeInterval:", v10);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[SMCloudKitZone zoneID](self, "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "zoneName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v25 = v14;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v17;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,zone TTL set to %@ seconds", buf, 0x2Au);

  }
  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__SMActiveSessionZone_setupZoneWithQos_completion___block_invoke;
  v20[3] = &unk_1E9297740;
  v20[4] = self;
  v22 = a2;
  v21 = v9;
  -[SMCloudKitZone saveZoneToDatabase:qos:withCompletion:](self, "saveZoneToDatabase:qos:withCompletion:", v18, v7, v20);

LABEL_9:
}

void __51__SMActiveSessionZone_setupZoneWithQos_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,ActiveSessionZone saved successfully", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setActiveSessionZoneAvailable:", 1);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to save ActiveSessionZone with error %@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setActiveSessionZoneAvailable:", 0);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v11();

}

- (void)checkActiveSessionDetailsZoneAvailibilityWithQos:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(id, uint64_t, _QWORD);
  SEL v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  if (v8)
  {
    if (-[SMActiveSessionZone activeSessionZoneAvailable](self, "activeSessionZoneAvailable"))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Active Session Zone available", buf, 0x16u);

      }
      v8[2](v8, 1, 0);
    }
    else
    {
      -[SMCloudKitZone privateDatabase](self, "privateDatabase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __83__SMActiveSessionZone_checkActiveSessionDetailsZoneAvailibilityWithQos_completion___block_invoke;
      v15[3] = &unk_1E9297768;
      v15[4] = self;
      v18 = a2;
      v17 = v8;
      v16 = v7;
      -[SMCloudKitZone fetchZoneFromDatabase:qos:withCompletion:](self, "fetchZoneFromDatabase:qos:withCompletion:", v14, v16, v15);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __83__SMActiveSessionZone_checkActiveSessionDetailsZoneAvailibilityWithQos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void (*v19)(void);
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  __int128 v24;
  _QWORD v25[5];
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Active Session Zone fetch successful", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setActiveSessionZoneAvailable:", 1);
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_14;
  }
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {

    goto LABEL_11;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != 26)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      v31 = 2112;
      v32 = v5;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,Fetching Active Session Zone failed with error %@", buf, 0x20u);

    }
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_14:
    v19();
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Active Session Zone does not exist. Setting up Active Session Zone", buf, 0x16u);

  }
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__SMActiveSessionZone_checkActiveSessionDetailsZoneAvailibilityWithQos_completion___block_invoke_39;
  v25[3] = &unk_1E9297740;
  v25[4] = v12;
  v24 = *(_OWORD *)(a1 + 48);
  v14 = (id)v24;
  v26 = v24;
  objc_msgSend(v12, "setupZoneWithQos:completion:", v13, v25);

LABEL_15:
}

void __83__SMActiveSessionZone_checkActiveSessionDetailsZoneAvailibilityWithQos_completion___block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (*v7)(void);
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      v18 = 2112;
      v19 = v4;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,Failed to setup Active Session Zone with error %@", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setActiveSessionZoneAvailable:", 0);
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Setup Active Session Zone Successful", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setActiveSessionZoneAvailable:", 1);
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

- (void)writeActiveSessionDetailsRecord:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  _QWORD v15[4];
  NSObject *v16;
  SMActiveSessionZone *v17;
  id v18;
  id v19;
  SEL v20;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: activeSessionDetails";
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_7;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: completion";
    goto LABEL_9;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke;
  v15[3] = &unk_1E929BDD8;
  v16 = v9;
  v17 = self;
  v20 = a2;
  v19 = v12;
  v18 = v10;
  -[SMActiveSessionZone checkActiveSessionDetailsZoneAvailibilityWithQos:completion:](self, "checkActiveSessionDetailsZoneAvailibilityWithQos:completion:", v18, v15);

  v13 = v16;
LABEL_7:

}

void __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v28 = v16;
      v29 = 2112;
      v30 = v18;
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(*(id *)(a1 + 40), "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", CFSTR("ActiveSessionDetails"), v7);

    v9 = *(void **)(a1 + 40);
    objc_msgSend(v9, "privateDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke_41;
    v21[3] = &unk_1E92A30E0;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v22 = v12;
    v23 = v13;
    v20 = *(_OWORD *)(a1 + 56);
    v14 = (id)v20;
    v26 = v20;
    v24 = v8;
    v25 = *(id *)(a1 + 48);
    v15 = v8;
    objc_msgSend(v9, "fetchRecord:fromDatabase:qos:withCompletion:", v15, v10, v11, v21);

  }
}

void __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  __int128 v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v57 = v17;
      v58 = 2112;
      v59 = v19;
      v60 = 2112;
      v61 = v20;
      v62 = 2112;
      v63 = 0;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ActiveSessionDetails record exists. Updating the record %@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "setActiveSessionRecord:", v5);
    goto LABEL_9;
  }
  v8 = objc_msgSend(v6, "code");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v57 = v11;
      v58 = 2112;
      v59 = v13;
      v60 = 2112;
      v61 = v14;
      v62 = 2112;
      v63 = v7;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ActiveSessionDetails record does not exists. Creating new record %@", buf, 0x2Au);

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("ActiveSessionDetailsRecord"), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setActiveSessionRecord:", v15);

LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "activeSessionRecord");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "encryptedValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, CFSTR("SessionID"));

    objc_msgSend(*(id *)(a1 + 32), "activeDeviceIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "activeSessionRecord");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encryptedValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("ActiveDeviceIdentifier"));

    objc_msgSend(*(id *)(a1 + 32), "cacheReleasedDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "activeSessionRecord");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encryptedValues");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, CFSTR("CacheReleasedDate"));

    objc_msgSend(*(id *)(a1 + 32), "scheduledSendGUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "activeSessionRecord");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encryptedValues");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, CFSTR("ScheduledSendGUID"));

    objc_msgSend(*(id *)(a1 + 32), "receiverHandles");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "activeSessionRecord");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "encryptedValues");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v35, CFSTR("ReceiverHandles"));

    v38 = *(void **)(a1 + 40);
    objc_msgSend(v38, "activeSessionRecord");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "privateDatabase");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = *(_QWORD *)(a1 + 56);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke_44;
    v51[3] = &unk_1E9298550;
    v43 = *(id *)(a1 + 32);
    v44 = *(_QWORD *)(a1 + 40);
    v52 = v43;
    v53 = v44;
    v50 = *(_OWORD *)(a1 + 64);
    v45 = (id)v50;
    v54 = v50;
    objc_msgSend(v38, "saveRecords:toDatabase:qos:withCompletion:", v40, v41, v42, v51);

    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v57 = v46;
    v58 = 2112;
    v59 = v48;
    v60 = 2112;
    v61 = v49;
    v62 = 2112;
    v63 = v7;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to fetch record to write active session details with error %@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_13:

}

void __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke_44(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (*v7)(void);
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v12;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v4;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v16, 0x2Au);

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,activeSessionDetails record saved successfully", (uint8_t *)&v16, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_updateActiveSessionDetailsLocalCopy:", *(_QWORD *)(a1 + 32));
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

- (void)_writeActiveSessionDetails:(id)a3 pendingRetryCount:(int64_t)a4 qos:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21[3];
  id location;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__SMActiveSessionZone__writeActiveSessionDetails_pendingRetryCount_qos_completion___block_invoke;
  v17[3] = &unk_1E92A3108;
  objc_copyWeak(v21, &location);
  v17[4] = self;
  v21[1] = (id)a2;
  v14 = v13;
  v20 = v14;
  v21[2] = (id)a4;
  v15 = v11;
  v18 = v15;
  v16 = v12;
  v19 = v16;
  -[SMActiveSessionZone writeActiveSessionDetailsRecord:qos:completion:](self, "writeActiveSessionDetailsRecord:qos:completion:", v15, v16, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

void __83__SMActiveSessionZone__writeActiveSessionDetails_pendingRetryCount_qos_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void (*v12)(void);
  uint64_t v13;
  _BOOL4 v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v22;
      v31 = 2112;
      v32 = v23;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, activeSessionZone object was destroyed", (uint8_t *)&v29, 0x16u);

    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_19;
  }
  if (!v5 && a2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v9;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,active session details stored", (uint8_t *)&v29, 0x16u);

    }
    goto LABEL_18;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v5))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_19:
      v12();
      goto LABEL_20;
    }
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138413058;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v5;
    v35 = 2048;
    v36 = objc_msgSend(v5, "code");
    v18 = "#SafetyCache,Initiator,%@,%@,failed to write active session details with non recoverable error %@, error.code %ld";
    v19 = v7;
    v20 = 42;
LABEL_22:
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v29, v20);

    goto LABEL_18;
  }
  v13 = *(_QWORD *)(a1 + 80);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v13 <= 0)
  {
    if (!v14)
      goto LABEL_18;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138412802;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v5;
    v18 = "#SafetyCache,Initiator:%@,%@,failed to write active session details after retries with recoverable error %@";
    v19 = v7;
    v20 = 32;
    goto LABEL_22;
  }
  if (v14)
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 80);
    v29 = 138413058;
    v30 = v25;
    v31 = 2112;
    v32 = v26;
    v33 = 2112;
    v34 = v5;
    v35 = 1024;
    LODWORD(v36) = v27;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@,failed to write active session details with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v29, 0x26u);

  }
  objc_msgSend(WeakRetained, "_writeActiveSessionDetails:pendingRetryCount:qos:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80) - 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_20:

}

- (void)updateActiveSessionDetailsFromCloudKitRecord
{
  NSObject *v3;
  _QWORD block[5];

  -[SMCloudKitZone queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SMActiveSessionZone_updateActiveSessionDetailsFromCloudKitRecord__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __67__SMActiveSessionZone_updateActiveSessionDetailsFromCloudKitRecord__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateActiveSessionDetailsFromCloudKitRecord");
}

- (void)_updateActiveSessionDetailsFromCloudKitRecord
{
  SMCloudKitQosOptions *v4;
  _QWORD v5[6];

  v4 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__SMActiveSessionZone__updateActiveSessionDetailsFromCloudKitRecord__block_invoke;
  v5[3] = &unk_1E92A3130;
  v5[4] = self;
  v5[5] = a2;
  -[SMActiveSessionZone _fetchActiveSessionDetailsWithRetryCount:qosOptions:completion:](self, "_fetchActiveSessionDetailsWithRetryCount:qosOptions:completion:", 2, v4, v5);

}

void __68__SMActiveSessionZone__updateActiveSessionDetailsFromCloudKitRecord__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v15 = 138413314;
    v14 = CFSTR("NO");
    v16 = v11;
    if ((_DWORD)a3)
      v14 = CFSTR("YES");
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, activeSessionDetails, %@, success %@, fetchError, %@", (uint8_t *)&v15, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:", v7, a3, v8);

}

- (void)fetchActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SMCloudKitZone queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SMActiveSessionZone_fetchActiveSessionDetailsRecordWithQos_completion___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __73__SMActiveSessionZone_fetchActiveSessionDetailsRecordWithQos_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchActiveSessionDetailsRecordWithQos:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  _QWORD v19[5];
  id v20;
  os_signpost_id_t v21;
  SEL v22;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: qos";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_10;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: completion";
    goto LABEL_12;
  }
  v10 = objc_alloc(MEMORY[0x1E0C95070]);
  -[SMCloudKitZone zoneID](self, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "initWithRecordName:zoneID:", CFSTR("ActiveSessionDetails"), v11);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, v12);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SMHandoffSessionFetchActiveSessionDetailsCkLatency", " enableTelemetry=YES ", buf, 2u);
  }

  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__SMActiveSessionZone__fetchActiveSessionDetailsRecordWithQos_completion___block_invoke;
  v19[3] = &unk_1E92A3158;
  v21 = v14;
  v22 = a2;
  v19[4] = self;
  v20 = v9;
  -[SMCloudKitZone fetchRecord:fromDatabase:qos:withCompletion:](self, "fetchRecord:fromDatabase:qos:withCompletion:", v12, v17, v7, v19);

LABEL_10:
}

void __74__SMActiveSessionZone__fetchActiveSessionDetailsRecordWithQos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMHandoffSessionFetchActiveSessionDetailsCkLatency", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v33;
      v43 = 2112;
      v44 = v34;
      v45 = 2112;
      v46 = v6;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to fetch ActiveSessionDetailsRecord with error %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "encryptedValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SessionID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v13;
      v43 = 2112;
      v44 = v15;
      v45 = 2112;
      v46 = v16;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ActiveSessionDetailsRecord fetched successfully", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_createActiveSessionDetailsFromCKRecord:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sessionID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "activeDeviceIdentifier");
        v39 = v5;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cacheReleasedDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringFromDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "scheduledSendGUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "receiverHandles");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413826;
        v42 = v40;
        v43 = 2112;
        v44 = v21;
        v45 = 2112;
        v46 = v22;
        v47 = 2112;
        v48 = v23;
        v49 = 2112;
        v50 = v24;
        v51 = 2112;
        v52 = v25;
        v53 = 2112;
        v54 = v26;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Fetched ActiveSessionDetails from CK ,sessionID,%@,activeDeviceIdentifier,%@,cacheReleasedDate,%@,scheduledSendGUID,%@,receiverHandles%@", buf, 0x48u);

        v5 = v39;
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = v36;
        v43 = 2112;
        v44 = v37;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,missing fields in activeSessionDetails record", buf, 0x16u);

      }
      v27 = *(_QWORD *)(a1 + 40);
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0D18598];
      v55 = *MEMORY[0x1E0CB2D50];
      v56[0] = CFSTR("missing fields in activeSessionDetails record");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 7, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v27 + 16))(v27, 0, 0, v31);

    }
  }

}

- (void)_fetchActiveSessionDetailsWithRetryCount:(unint64_t)a3 qosOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16[3];
  id location;

  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__SMActiveSessionZone__fetchActiveSessionDetailsWithRetryCount_qosOptions_completion___block_invoke;
  v13[3] = &unk_1E92A3180;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a2;
  v11 = v10;
  v16[2] = (id)a3;
  v15 = v11;
  v13[4] = self;
  v12 = v9;
  v14 = v12;
  -[SMActiveSessionZone _fetchActiveSessionDetailsRecordWithQos:completion:](self, "_fetchActiveSessionDetailsRecordWithQos:completion:", v12, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void __86__SMActiveSessionZone__fetchActiveSessionDetailsWithRetryCount_qosOptions_completion___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void (*v15)(void);
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  _BYTE v36[14];
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412546;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@, activeSessionZone released during zone fetch", (uint8_t *)&v31, 0x16u);

    }
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_23;
  }
  if ((a3 & 1) != 0)
  {
    if (!v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412546;
        v32 = v12;
        v33 = 2112;
        v34 = v13;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,active session details fetched and stored", (uint8_t *)&v31, 0x16u);

      }
      goto LABEL_22;
    }
  }
  else if (objc_msgSend(v8, "code") == 11)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138413314;
      v32 = v17;
      v33 = 2112;
      v34 = v18;
      v35 = 1024;
      *(_DWORD *)v36 = 0;
      *(_WORD *)&v36[4] = 2048;
      *(_QWORD *)&v36[6] = objc_msgSend(v8, "code");
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@, There is no active session details and correspondingly no active session because: active session details success, %{Bool}d, error.code %ld, error is %@", (uint8_t *)&v31, 0x30u);

    }
    goto LABEL_22;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v8))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_23:
      v15();
      goto LABEL_24;
    }
LABEL_25:
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412802;
    v32 = v29;
    v33 = 2112;
    v34 = v30;
    v35 = 2112;
    *(_QWORD *)v36 = v8;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@,failed to fetch active session details after retries with recoverable error %@", (uint8_t *)&v31, 0x20u);

    goto LABEL_22;
  }
  v19 = *(_QWORD *)(a1 + 72);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (!v19)
  {
    if (!v20)
      goto LABEL_22;
    goto LABEL_25;
  }
  if (v20)
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 72);
    v31 = 138413058;
    v32 = v25;
    v33 = 2112;
    v34 = v26;
    v35 = 2112;
    *(_QWORD *)v36 = v8;
    *(_WORD *)&v36[8] = 1024;
    *(_DWORD *)&v36[10] = v27;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@,failed to fetch active session details with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v31, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_fetchActiveSessionDetailsWithRetryCount:qosOptions:completion:", *(_QWORD *)(a1 + 72) - 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_24:

}

- (void)_updateActiveSessionDetailsLocalCopy:(id)a3
{
  -[SMActiveSessionZone setLatestActiveSessionDetails:](self, "setLatestActiveSessionDetails:", a3);
  -[SMActiveSessionZone _saveLatestActiveSessionDetailsLocalCopy](self, "_saveLatestActiveSessionDetailsLocalCopy");
}

- (void)deleteActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  SMActiveSessionZone *v19;
  id v20;
  SEL v21;
  uint8_t buf[16];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: qos";
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: completion";
    goto LABEL_9;
  }
  v10 = objc_alloc(MEMORY[0x1E0C95070]);
  -[SMCloudKitZone zoneID](self, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithRecordName:zoneID:", CFSTR("ActiveSessionDetails"), v11);

  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__SMActiveSessionZone_deleteActiveSessionDetailsRecordWithQos_completion___block_invoke;
  v17[3] = &unk_1E9298550;
  v18 = v12;
  v19 = self;
  v21 = a2;
  v20 = v9;
  v15 = v12;
  -[SMCloudKitZone deleteRecords:fromDatabase:qos:withCompletion:](self, "deleteRecords:fromDatabase:qos:withCompletion:", v13, v14, v7, v17);

LABEL_7:
}

void __74__SMActiveSessionZone_deleteActiveSessionDetailsRecordWithQos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 32);
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138413058;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to delete ActiveSessionDetailsRecord with ID %@ with error %@", (uint8_t *)&v14, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,ActiveSessionDetailsRecord deleted successfully", (uint8_t *)&v14, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)initializeSyncEngine
{
  NSObject *v3;
  _QWORD block[5];

  -[SMCloudKitZone queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SMActiveSessionZone_initializeSyncEngine__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __43__SMActiveSessionZone_initializeSyncEngine__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeSyncEngine");
}

- (void)_initializeSyncEngine
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CKSyncEngine *v8;
  CKSyncEngine *syncEngine;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CKSyncEngine *v15;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SMActiveSessionZone _getSyncEngineMetadata](self, "_getSyncEngineMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C95160]);
  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDatabase:stateSerialization:delegate:", v6, v4, self);

  objc_msgSend(v7, "setApsMachServiceName:", *MEMORY[0x1E0D8BB10]);
  objc_msgSend(v7, "setPriority:", 2);
  objc_msgSend(v7, "setUseOpportunisticPushTopic:", 1);
  v8 = (CKSyncEngine *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95158]), "initWithConfiguration:", v7);
  syncEngine = self->_syncEngine;
  self->_syncEngine = v8;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = self->_syncEngine;
    v16 = CFSTR("YES");
    v18 = 138413058;
    v19 = v12;
    if (v15)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    if (!v4)
      v16 = CFSTR("NO");
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, syncEngine initialized succesfully: %@, with metadata %@", (uint8_t *)&v18, 0x2Au);

  }
}

- (id)_getSyncEngineMetadata
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsSafetyCacheActiveSessionZoneCKSyncEngineMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to decode metadata for CKSyncEngineState", buf, 0x16u);

      }
      v8 = 0;
    }
    else
    {
      v8 = v5;
    }
    v9 = v8;

    v10 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to retrieve CKSyncEngineState serialized data, %@", buf, 0x20u);

    }
    v10 = 0;
  }

  return v10;
}

- (void)_persistSyncEngineMetadata:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator:%@,%@,ActiveSessionDetails, metadata %@", buf, 0x20u);

  }
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (!v8)
  {
    -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v7, CFSTR("RTDefaultsSafetyCacheActiveSessionZoneCKSyncEngineMetadata"));

    -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v9, "setObject:forKey:", v11, CFSTR("RTDefaultsSafetyCacheActiveSessionZoneCKSyncEngineMetadataDate"));
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v5;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,ActiveSessionDetails, Failed to encode metadata, %@", buf, 0x20u);

LABEL_7:
  }

}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  CKSyncEngine *v7;
  CKSyncEngine *v8;
  CKSyncEngine *syncEngine;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  CKSyncEngine *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = (CKSyncEngine *)a3;
  v8 = (CKSyncEngine *)a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v15 = "#SafetyCache,Initiator:%@,%@, invalid event was nil";
      v16 = v11;
      v17 = 22;
      goto LABEL_15;
    }
LABEL_6:

    goto LABEL_7;
  }
  syncEngine = self->_syncEngine;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (syncEngine != v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v7;
      v15 = "#SafetyCache,Initiator:%@,%@, Sync engine %@ doesn't match internal reference.";
      v16 = v11;
      v17 = 32;
LABEL_15:
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v17);

      goto LABEL_6;
    }
    goto LABEL_6;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = v19;
    v25 = 2112;
    v26 = v20;
    v27 = 2112;
    v28 = v8;
    v29 = 2048;
    v30 = -[CKSyncEngine type](v8, "type");
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator, %@,%@, CKSyncEngine incoming event %@, %lu", (uint8_t *)&v23, 0x2Au);

  }
  v21 = -[CKSyncEngine type](v8, "type");
  if (v21 == 3)
  {
    -[SMActiveSessionZone handleFetchedRecordZoneChanges:](self, "handleFetchedRecordZoneChanges:", v8);
  }
  else if (!v21)
  {
    -[SMActiveSessionZone handleStateUpdate:](self, "handleStateUpdate:", v8);
  }
LABEL_7:

}

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  SMActiveSessionZone *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[6];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (self->_syncEngine == a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    v55 = self;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v71 = v49;
      v72 = 2112;
      v73 = v50;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator, %@,%@", buf, 0x16u);

      self = v55;
    }

    v52 = v7;
    objc_msgSend(v7, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "zoneIDs");
    v11 = objc_claimAutoreleasedReturnValue();

    -[CKSyncEngine state](self->_syncEngine, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pendingRecordZoneChanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = (void *)v11;
    if (v11)
    {
      v14 = a2;
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v16 = v13;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v66 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_msgSend(v21, "recordID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "zoneID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v54, "containsObject:", v23);

            if (v24)
              objc_msgSend(v15, "addObject:", v21);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
        }
        while (v18);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      a2 = v14;
      self = v55;
    }
    v25 = objc_alloc(MEMORY[0x1E0C95198]);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __70__SMActiveSessionZone_syncEngine_nextRecordZoneChangeBatchForContext___block_invoke;
    v64[3] = &unk_1E92A31A8;
    v64[4] = self;
    v64[5] = a2;
    v26 = a2;
    v51 = v13;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v53 = (void *)objc_msgSend(v25, "initWithPendingChanges:recordProvider:", v13, v64);
    objc_msgSend(v53, "recordsToSave");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v61 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(v26);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412803;
            v71 = v35;
            v72 = 2112;
            v73 = v36;
            v74 = 2113;
            v75 = v32;
            _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator, %@,%@, nextRecordZoneChangeBatch, record to save: %{private}@", buf, 0x20u);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      }
      while (v29);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v53, "recordIDsToDelete");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v57 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(v26);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412803;
            v71 = v45;
            v72 = 2112;
            v73 = v46;
            v74 = 2113;
            v75 = v42;
            _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator, %@,%@, nextRecordZoneChangeBatch, record to delete: %{private}@", buf, 0x20u);

          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v39);
    }

    v7 = v52;
    v8 = v53;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __70__SMActiveSessionZone_syncEngine_nextRecordZoneChangeBatchForContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator, %@,%@, CKSyncEngineRecordZoneChangeBatch, callback", (uint8_t *)&v7, 0x16u);

  }
  return 0;
}

- (void)handleStateUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMCloudKitZone queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__SMActiveSessionZone_handleStateUpdate___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __41__SMActiveSessionZone_handleStateUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStateUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)_handleStateUpdate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "stateUpdateEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stateSerialization");
    v8 = objc_claimAutoreleasedReturnValue();
    -[SMActiveSessionZone _persistSyncEngineMetadata:](self, "_persistSyncEngineMetadata:", v8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,ActiveSessionDetails, Called back for invalid CKSyncEngineStateUpdateEvent (%@)", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)handleFetchedRecordZoneChanges:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMCloudKitZone queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SMActiveSessionZone_handleFetchedRecordZoneChanges___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __54__SMActiveSessionZone_handleFetchedRecordZoneChanges___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFetchedRecordZoneChanges:", *(_QWORD *)(a1 + 40));
}

- (void)_handleFetchedRecordZoneChanges:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator:%@,%@,event, %@", buf, 0x20u);

  }
  objc_msgSend(v5, "fetchedRecordZoneChangesEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "modifications");
    v12 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__SMActiveSessionZone__handleFetchedRecordZoneChanges___block_invoke;
    v16[3] = &unk_1E92A31D0;
    v16[4] = self;
    v16[5] = a2;
    -[NSObject enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v16);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v5;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@, Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent %@", buf, 0x20u);

    }
  }

}

void __55__SMActiveSessionZone__handleFetchedRecordZoneChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ActiveSessionDetails"));

  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "latestActiveSessionDetails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator:%@,%@ A Push Notifications updated ActiveSessionDetails, %@", (uint8_t *)&v20, 0x20u);

    }
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "_createActiveSessionDetailsFromCKRecord:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:", v13, 1, 0);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413058;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v3;
    v26 = 2112;
    v27 = v19;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator:%@,%@,ActiveSessionDetails, ckrecord %@, activeSessionDetailsRecordID %@", (uint8_t *)&v20, 0x2Au);

  }
}

- (void)_onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v13 = 136315906;
    v14 = "-[SMActiveSessionZone _onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:]";
    v15 = 2112;
    v16 = v8;
    v17 = 1024;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, fetchedActiveSessionDetails, %@, success, %{Bool}d, error, %@", (uint8_t *)&v13, 0x26u);
  }

  if (v9 || !v6)
  {
    if (v6 || objc_msgSend(v9, "code") != 11)
    {
      -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"));

    }
    else
    {
      -[SMActiveSessionZone setLatestActiveSessionDetails:](self, "setLatestActiveSessionDetails:", 0);
      -[SMActiveSessionZone _saveLatestActiveSessionDetailsStateToDefaults:](self, "_saveLatestActiveSessionDetailsStateToDefaults:", 0);
    }
  }
  else
  {
    -[SMActiveSessionZone _updateActiveSessionDetailsLocalCopy:](self, "_updateActiveSessionDetailsLocalCopy:", v8);
  }
  -[SMActiveSessionZone _notifyObserversForActiveSessionDetailsFetchAttemptedFromCKCompleted:success:error:](self, "_notifyObserversForActiveSessionDetailsFetchAttemptedFromCKCompleted:success:error:", v8, v6, v9);

}

- (id)_createActiveSessionDetailsFromCKRecord:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t v22[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "encryptedValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SessionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithUUIDString:", v6);

    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "encryptedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ActiveDeviceIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithUUIDString:", v10);

    v12 = 0;
    if (v7 && v11)
    {
      v13 = objc_alloc(MEMORY[0x1E0D8B8E8]);
      objc_msgSend(v3, "encryptedValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CacheReleasedDate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "encryptedValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ScheduledSendGUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "encryptedValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ReceiverHandles"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v13, "initWithSessionID:activeDeviceIdentifier:cacheReleasedDate:scheduledSendGUID:receiverHandles:", v7, v11, v15, v17, v19);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: record", v22, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)isActiveSessionDetailsOutOfSync
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[SMActiveSessionZone _isActiveSessionDetailsLocalRecordExpired](self, "_isActiveSessionDetailsLocalRecordExpired"))
  {
    v3 = 1;
  }
  else
  {
    v3 = !-[SMActiveSessionZone _isActiveSessionDetailsFetchedFromCloudKitSinceBoot](self, "_isActiveSessionDetailsFetchedFromCloudKitSinceBoot");
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[SMActiveSessionZone isActiveSessionDetailsOutOfSync]";
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isOutOfSync, %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (BOOL)_isActiveSessionDetailsLocalRecordExpired
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchSuccessDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5 < 1800.0;

  }
  else
  {
    v6 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("YES");
    if (v6)
      v9 = CFSTR("NO");
    v10 = 136315394;
    v11 = "-[SMActiveSessionZone _isActiveSessionDetailsLocalRecordExpired]";
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isExpired, %@", (uint8_t *)&v10, 0x16u);
  }

  return !v6;
}

- (BOOL)_isActiveSessionDetailsFetchedFromCloudKitSinceBoot
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchedFromCloudKitSinceBootKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    v8 = 136315394;
    v9 = "-[SMActiveSessionZone _isActiveSessionDetailsFetchedFromCloudKitSinceBoot]";
    v10 = 2112;
    v11 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isRecordFetchedFromCKSinceBoot, %@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (BOOL)isEligibleForCacheUpdateForCurrentDeviceIdentifier:(id)a3 sessionManagerState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  int v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SMActiveSessionZone latestActiveSessionDetails](self, "latestActiveSessionDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v11))
  {
    -[SMActiveSessionZone latestActiveSessionDetails](self, "latestActiveSessionDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeDeviceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v6);

  }
  else
  {
    v14 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = CFSTR("NO");
    if (v14)
      v16 = CFSTR("YES");
    v18 = 136315394;
    v19 = "-[SMActiveSessionZone isEligibleForCacheUpdateForCurrentDeviceIdentifier:sessionManagerState:]";
    v20 = 2112;
    v21 = v16;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, isEligible, %@", (uint8_t *)&v18, 0x16u);
  }

  return v14;
}

- (void)writeActiveSessionDetailOnCloudToInitiateHandoff:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SMCloudKitZone queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SMActiveSessionZone_writeActiveSessionDetailOnCloudToInitiateHandoff_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __80__SMActiveSessionZone_writeActiveSessionDetailOnCloudToInitiateHandoff_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeActiveSessionDetailsOnCloudToInitiateHandoff:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_writeActiveSessionDetailsOnCloudToInitiateHandoff:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  SMCloudKitQosOptions *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SMActiveSessionZone *v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  v9 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__SMActiveSessionZone__writeActiveSessionDetailsOnCloudToInitiateHandoff_handler___block_invoke;
  v12[3] = &unk_1E929F500;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a2;
  v10 = v8;
  v15 = v10;
  v11 = v7;
  v13 = v11;
  v14 = self;
  -[SMActiveSessionZone _writeActiveSessionDetails:pendingRetryCount:qos:completion:](self, "_writeActiveSessionDetails:pendingRetryCount:qos:completion:", v11, 3, v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void __82__SMActiveSessionZone__writeActiveSessionDetailsOnCloudToInitiateHandoff_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v16 = 138413314;
      v14 = CFSTR("NO");
      v17 = v9;
      if (a2)
        v14 = CFSTR("YES");
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Active Session Details stored in Cloud, success, %@, error, %@", (uint8_t *)&v16, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_updateActiveSessionDetailsLocalCopy:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@,object has been cleaned up", (uint8_t *)&v16, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)fetchActiveSessionDetailsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMCloudKitZone queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SMActiveSessionZone_fetchActiveSessionDetailsWithHandler___block_invoke;
  block[3] = &unk_1E9298E88;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __60__SMActiveSessionZone_fetchActiveSessionDetailsWithHandler___block_invoke(uint64_t a1)
{
  SMCloudKitQosOptions *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6[2];
  void *v7;
  _QWORD v8[5];
  __int128 v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "isActiveSessionDetailsOutOfSync") & 1) != 0)
  {
    v2 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
    v3 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__SMActiveSessionZone_fetchActiveSessionDetailsWithHandler___block_invoke_2;
    v8[3] = &unk_1E92A31F8;
    v8[4] = v3;
    *(_OWORD *)v6 = *(_OWORD *)(a1 + 40);
    v4 = v6[0];
    v9 = *(_OWORD *)v6;
    objc_msgSend(v3, "_fetchActiveSessionDetailsWithRetryCount:qosOptions:completion:", 2, v2, v8);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_getLatestActiveSessionDetailsLocalCopy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v5 + 16))(v5, v7, 1, 0);

  }
}

void __60__SMActiveSessionZone_fetchActiveSessionDetailsWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v15 = 138413314;
    v14 = CFSTR("NO");
    v16 = v11;
    if ((_DWORD)a3)
      v14 = CFSTR("YES");
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, activeSessionDetails, %@, success %@, fetchError, %@", (uint8_t *)&v15, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:", v7, a3, v8);
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7);

}

- (void)_saveLatestActiveSessionDetailsLocalCopy
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SMActiveSessionZone latestActiveSessionDetails](self, "latestActiveSessionDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SMActiveSessionZone _saveLatestActiveSessionDetailsLocalCopy]";
      v18 = 1024;
      LODWORD(v19) = 1010;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.latestActiveSessionDetails (in %s:%d)", buf, 0x12u);
    }

  }
  v6 = (void *)MEMORY[0x1E0CB36F8];
  -[SMActiveSessionZone latestActiveSessionDetails](self, "latestActiveSessionDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMActiveSessionZone latestActiveSessionDetails](self, "latestActiveSessionDetails");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to serialize activeSessionDetails, %@, error, %@", buf, 0x2Au);

    }
  }
  -[SMActiveSessionZone _saveLatestActiveSessionDetailsStateToDefaults:](self, "_saveLatestActiveSessionDetailsStateToDefaults:", v8);

}

- (void)_saveLatestActiveSessionDetailsStateToDefaults:(id)a3
{
  RTDefaultsManager *defaultsManager;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  defaultsManager = self->_defaultsManager;
  v5 = a3;
  -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchedFromCloudKitSinceBootKey"));
  -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsKey"));

  -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchSuccessDateKey"));

  -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", 0, CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"));

}

- (id)_getLatestActiveSessionDetailsLocalCopy
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SMActiveSessionZone defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        v23 = 2112;
        v24 = v6;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to decode metadata for SMActiveSessionDetails, error, %@", buf, 0x20u);

      }
      v8 = 0;
    }
    else
    {
      v8 = v5;
    }
    v9 = v8;

    v10 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to retrieve serialized data from defaults", buf, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

- (CKRecord)activeSessionRecord
{
  return self->_activeSessionRecord;
}

- (void)setActiveSessionRecord:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessionRecord, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)activeSessionZoneAvailable
{
  return self->_activeSessionZoneAvailable;
}

- (void)setActiveSessionZoneAvailable:(BOOL)a3
{
  self->_activeSessionZoneAvailable = a3;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (SMActiveSessionDetails)latestActiveSessionDetails
{
  return self->_latestActiveSessionDetails;
}

- (void)setLatestActiveSessionDetails:(id)a3
{
  objc_storeStrong((id *)&self->_latestActiveSessionDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestActiveSessionDetails, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeSessionRecord, 0);
}

@end
