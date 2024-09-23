@implementation RTPersistenceMirroringManager

- (RTPersistenceMirroringManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager_);
}

- (RTPersistenceMirroringManager)initWithAccountManager:(id)a3 defaultsManager:(id)a4 persistenceManager:(id)a5 platform:(id)a6 reachabilityManager:(id)a7 xpcActivityManager:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  RTPersistenceExpirationEnforcer *v17;
  void *v18;
  void *v19;
  RTPersistenceMirroringPolicy *v21;
  RTPersistenceMirroringPolicy *v22;
  RTPersistenceMirroringPolicy *v23;
  id v24;
  id v25;
  id v26;
  RTPersistenceMirroringManager *v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v13 = a8;
  v14 = a7;
  v26 = a6;
  v15 = a5;
  v25 = a4;
  v24 = a3;
  v23 = -[RTPersistenceMirroringPolicy initWithQualityOfService:]([RTPersistenceMirroringPolicy alloc], "initWithQualityOfService:", 1);
  v22 = -[RTPersistenceMirroringPolicy initWithQualityOfService:]([RTPersistenceMirroringPolicy alloc], "initWithQualityOfService:", 2);
  v21 = -[RTPersistenceMirroringPolicy initWithQualityOfService:]([RTPersistenceMirroringPolicy alloc], "initWithQualityOfService:", 3);
  v16 = (void *)objc_opt_new();
  v17 = -[RTPersistenceExpirationEnforcer initWithPersistenceManager:]([RTPersistenceExpirationEnforcer alloc], "initWithPersistenceManager:", v15);
  v29[0] = v23;
  v29[1] = v22;
  v29[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  v28 = -[RTPersistenceMirroringManager initWithAccountManager:defaultsManager:mirroringPolicies:persistenceCloudDeletionEnforcer:persistenceExpirationEnforcer:persistenceManager:platform:reachabilityManager:timerManager:xpcActivityManager:](self, "initWithAccountManager:defaultsManager:mirroringPolicies:persistenceCloudDeletionEnforcer:persistenceExpirationEnforcer:persistenceManager:platform:reachabilityManager:timerManager:xpcActivityManager:", v24, v25, v18, v16, v17, v15, v26, v14, v19, v13);

  return v28;
}

- (RTPersistenceMirroringManager)initWithAccountManager:(id)a3 defaultsManager:(id)a4 mirroringPolicies:(id)a5 persistenceCloudDeletionEnforcer:(id)a6 persistenceExpirationEnforcer:(id)a7 persistenceManager:(id)a8 platform:(id)a9 reachabilityManager:(id)a10 timerManager:(id)a11 xpcActivityManager:(id)a12
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  RTPersistenceMirroringManager *v23;
  RTInvocationDispatcher *v24;
  void *v25;
  uint64_t v26;
  RTInvocationDispatcher *dispatcher;
  uint64_t v28;
  NSMutableArray *pendingMirroringRequests;
  uint64_t v30;
  NSMutableDictionary *retryTimers;
  uint64_t v32;
  NSMutableDictionary *mirroringPolicies;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  void *v42;
  void *v43;
  RTPersistenceManager *persistenceManager;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  RTPersistenceMirroringManager *v52;
  void *v53;
  RTPersistenceMirroringManager *v54;
  RTPersistenceMirroringManager *v55;
  RTPersistenceMirroringManager *v56;
  NSObject *v57;
  const char *v58;
  id v60;
  void *v61;
  id v63;
  id v64;
  void **p_reachabilityManager;
  void **p_accountManager;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  RTPersistenceMirroringManager *v77;
  _QWORD v78[4];
  RTPersistenceMirroringManager *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  uint8_t buf[16];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v63 = a4;
  v18 = a4;
  v19 = a5;
  v20 = v17;
  v69 = v19;
  v21 = a6;
  v75 = a6;
  v64 = a7;
  v74 = a7;
  v73 = a8;
  v72 = a9;
  v71 = a10;
  v70 = a11;
  v22 = a12;
  v68 = v22;
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v58 = "Invalid parameter not satisfying: accountManager";
LABEL_38:
    _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, v58, buf, 2u);
    goto LABEL_39;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v58 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_38;
  }
  if (!v75)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v58 = "Invalid parameter not satisfying: persistenceCloudDeletionEnforcer";
    goto LABEL_38;
  }
  if (!v74)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v58 = "Invalid parameter not satisfying: persistenceExpirationEnforcer";
    goto LABEL_38;
  }
  if (!v73)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v58 = "Invalid parameter not satisfying: persistenceManager";
    goto LABEL_38;
  }
  if (!v72)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v58 = "Invalid parameter not satisfying: platform";
    goto LABEL_38;
  }
  if (!v71)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v58 = "Invalid parameter not satisfying: reachabilityManager";
    goto LABEL_38;
  }
  if (!v70)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v58 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_38;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v58 = "Invalid parameter not satisfying: xpcActivityManager";
      goto LABEL_38;
    }
LABEL_39:

    v56 = 0;
    v55 = self;
    goto LABEL_40;
  }
  v60 = v18;
  v61 = v20;
  v84.receiver = self;
  v84.super_class = (Class)RTPersistenceMirroringManager;
  v23 = -[RTNotifier init](&v84, sel_init);
  if (v23)
  {
    v24 = [RTInvocationDispatcher alloc];
    -[RTNotifier queue](v23, "queue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[RTInvocationDispatcher initWithQueue:](v24, "initWithQueue:", v25);
    dispatcher = v23->_dispatcher;
    v23->_dispatcher = (RTInvocationDispatcher *)v26;

    p_accountManager = (void **)&v23->_accountManager;
    objc_storeStrong((id *)&v23->_accountManager, a3);
    objc_storeStrong((id *)&v23->_defaultsManager, v63);
    objc_storeStrong((id *)&v23->_persistenceCloudDeletionEnforcer, v21);
    objc_storeStrong((id *)&v23->_persistenceExpirationEnforcer, v64);
    objc_storeStrong((id *)&v23->_persistenceManager, a8);
    p_reachabilityManager = (void **)&v23->_reachabilityManager;
    objc_storeStrong((id *)&v23->_reachabilityManager, a10);
    objc_storeStrong((id *)&v23->_platform, a9);
    objc_storeStrong((id *)&v23->_timerManager, a11);
    objc_storeStrong((id *)&v23->_xpcActivityManager, a12);
    v28 = objc_opt_new();
    pendingMirroringRequests = v23->_pendingMirroringRequests;
    v23->_pendingMirroringRequests = (NSMutableArray *)v28;

    v30 = objc_opt_new();
    retryTimers = v23->_retryTimers;
    v23->_retryTimers = (NSMutableDictionary *)v30;

    v23->_cloudSyncAuthorizationState = 0;
    v23->_currentReachability = 0;
    objc_storeWeak((id *)&v23->_metricsDelegate, v23);
    v23->_syncDisabledForPerProcessMemoryLimit = -[RTPersistenceMirroringManager disableMirroringForPerProcessMemoryLimitViolation:platform:](v23, "disableMirroringForPerProcessMemoryLimitViolation:platform:", v23->_defaultsManager, v23->_platform);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v69, "count"));
    mirroringPolicies = v23->_mirroringPolicies;
    v23->_mirroringPolicies = (NSMutableDictionary *)v32;

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v34 = v69;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v81 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          v40 = v23->_mirroringPolicies;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v39, "qualityOfService"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v40, "setObject:forKey:", v39, v41);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      }
      while (v36);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v23, sel_onMirroringDelegateInitialization_, CFSTR("RTPersistenceStoreMirroringDelegateDidInitializeNotificationName"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v23, sel_onMirroringDelegateInitialization_, CFSTR("RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName"), 0);

    persistenceManager = v23->_persistenceManager;
    +[RTNotification notificationName](RTPersistenceManagerNotificationAvailabilityDidChange, "notificationName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](persistenceManager, "addObserver:selector:name:", v23, sel_persistenceAvailabilityDidChange_, v45);

    v46 = *p_accountManager;
    +[RTNotification notificationName](RTAccountManagerNotificationCloudSyncAuthorizationStateChanged, "notificationName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObserver:selector:name:", v23, sel_onCloudSyncAuthorizationChange_, v47);

    v48 = *p_reachabilityManager;
    +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObserver:selector:name:", v23, sel_onReachabilityChange_, v49);

    v50 = *p_accountManager;
    v51 = MEMORY[0x1E0C809B0];
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke;
    v78[3] = &unk_1E929A358;
    v52 = v23;
    v79 = v52;
    objc_msgSend(v50, "fetchCloudSyncAuthorizationState:", v78);
    v53 = *p_reachabilityManager;
    v76[0] = v51;
    v76[1] = 3221225472;
    v76[2] = __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_3;
    v76[3] = &unk_1E929A380;
    v54 = v52;
    v77 = v54;
    objc_msgSend(v53, "fetchCurrentReachability:", v76);
    -[RTPersistenceMirroringManager registerForXPCActivities](v54, "registerForXPCActivities");

  }
  v55 = v23;
  v56 = v55;
  v18 = v60;
  v20 = v61;
LABEL_40:

  return v56;
}

void __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_2;
  v5[3] = &unk_1E9297BF0;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 64) = *(_QWORD *)(result + 40);
  return result;
}

void __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_4;
  v5[3] = &unk_1E9297BF0;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_4(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = *(_QWORD *)(result + 40);
  return result;
}

- (BOOL)exportMirroringIsAvailableWithExpirationEnforcer:(id)a3 expirationDate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  id v24;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a6)
  {
    if (v9)
    {
      if (v10)
      {
        if (v11)
        {
          v24 = 0;
          objc_msgSend(v9, "collectRecordIDsByTypeExpiredBeforeDate:ownedByThisDevice:context:error:", v10, 0, v11, &v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v24;
          if (v14 || objc_msgSend(v13, "count"))
          {
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "Suspending export mirroring due to expired records.", buf, 2u);
            }

            v16 = 0;
          }
          else
          {
            v16 = 1;
          }
          v17 = objc_retainAutorelease(v14);
          *a6 = v17;

          goto LABEL_24;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
        }

        v21 = CFSTR("context");
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
        }

        v21 = CFSTR("expirationDate");
      }
      _RTErrorInvalidParameterCreate((uint64_t)v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_24;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationEnforcer", buf, 2u);
    }

    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("expirationEnforcer"));
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v16 = 0;
  }
LABEL_24:

  return v16;
}

- (BOOL)disableMirroringForPerProcessMemoryLimitViolation:(id)a3 platform:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint8_t buf[8];
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      LOBYTE(v11) = 1;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: defaultsManager";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_11;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: platform";
    goto LABEL_14;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject objectForKey:](v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");
  if (v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "Disabling mirroring due to previous failures.", buf, 2u);
    }

    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = (void *)objc_msgSend(v13, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringMemoryLimitExceeded, 1);
    v23 = CFSTR("buildVersion");
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    log_analytics_submission(v14, v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("buildVersion");
    v22 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
LABEL_12:

  return v11;
}

- (void)registerForXPCActivities
{
  RTXPCActivityCriteria *v4;
  RTXPCActivityManager *xpcActivityManager;
  uint64_t v6;
  RTXPCActivityCriteria *v7;
  void *v8;
  RTXPCActivityCriteria *v9;
  void *v10;
  _QWORD v11[5];
  id v12[2];
  _QWORD v13[5];
  id v14[2];
  _QWORD v15[4];
  id v16[2];
  id location[2];

  v4 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 1, 1, 3, 0, 1, 86400.0, 43200.0);
  -[RTXPCActivityCriteria setCpuIntensive:](v4, "setCpuIntensive:", 1);
  -[RTXPCActivityCriteria setExpectedDuration:](v4, "setExpectedDuration:", 120.0);
  objc_initWeak(location, self);
  xpcActivityManager = self->_xpcActivityManager;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke;
  v15[3] = &unk_1E9297790;
  v16[1] = (id)a2;
  objc_copyWeak(v16, location);
  -[RTXPCActivityManager registerActivityWithIdentifier:criteria:handler:](xpcActivityManager, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.persistence.mirroring.background"), v4, v15);
  v7 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 2, 1, 0, 3, 1, 1, 1.79769313e308, 60.0);
  -[RTXPCActivityCriteria setCpuIntensive:](v7, "setCpuIntensive:", 1);
  -[RTXPCActivityCriteria setUserRequestedBackgroundTask:](v7, "setUserRequestedBackgroundTask:", 1);
  -[RTPersistenceMirroringManager xpcActivityManager](self, "xpcActivityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_68;
  v13[3] = &unk_1E929A3D0;
  v14[1] = (id)a2;
  v13[4] = self;
  objc_copyWeak(v14, location);
  objc_msgSend(v8, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.persistence.mirroring.backup"), v7, v13);

  v9 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 2, 1, 1, 3, 0, 1, 0.0, 300.0);
  -[RTXPCActivityCriteria setCpuIntensive:](v9, "setCpuIntensive:", 1);
  -[RTXPCActivityCriteria setPostInstall:](v9, "setPostInstall:", 1);
  -[RTXPCActivityCriteria setRequiresBuddyComplete:](v9, "setRequiresBuddyComplete:", 1);
  -[RTPersistenceMirroringManager xpcActivityManager](self, "xpcActivityManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_70;
  v11[3] = &unk_1E929A3D0;
  v12[1] = (id)a2;
  v11[4] = self;
  objc_copyWeak(v12, location);
  objc_msgSend(v10, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.persistence.mirroring.post-install"), v9, v11);

  objc_destroyWeak(v12);
  objc_destroyWeak(v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(location);

}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke(uint64_t a1, void *a2, void *a3)
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
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
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
      v10[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_65;
      v10[3] = &unk_1E92971A0;
      v12 = *(_QWORD *)(a1 + 40);
      v11 = v5;
      objc_msgSend(WeakRetained, "performPeriodicSyncWithHandler:", v10);

    }
    else if (v5)
    {
      v5[2](v5, 0);
    }

  }
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_65(uint64_t a1, void *a2)
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
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to sync, error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void (**v10)(id, id);
  void *v11;
  _QWORD block[4];
  void (**v13)(id, id);
  id v14[2];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_69;
    block[3] = &unk_1E929A3A8;
    objc_copyWeak(v14, (id *)(a1 + 40));
    v10 = v5;
    v11 = *(void **)(a1 + 48);
    v13 = v10;
    v14[1] = v11;
    dispatch_async(v9, block);

    objc_destroyWeak(v14);
  }

}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_69(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_2;
    v4[3] = &unk_1E92971A0;
    v6 = *(_QWORD *)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_performExportWithHandler:", v4);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_2(uint64_t a1, void *a2)
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
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to sync, error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void (**v10)(id, id);
  void *v11;
  _QWORD block[4];
  void (**v13)(id, id);
  id v14[2];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_71;
    block[3] = &unk_1E929A3A8;
    objc_copyWeak(v14, (id *)(a1 + 40));
    v10 = v5;
    v11 = *(void **)(a1 + 48);
    v13 = v10;
    v14[1] = v11;
    dispatch_async(v9, block);

    objc_destroyWeak(v14);
  }

}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_71(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_2_72;
    v4[3] = &unk_1E92971A0;
    v6 = *(_QWORD *)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "performPeriodicSyncWithHandler:", v4);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_2_72(uint64_t a1, void *a2)
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
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to sync, error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)unregisterForXPCActivities
{
  -[RTXPCActivityManager unregisterActivityWithIdentifier:handler:](self->_xpcActivityManager, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.persistence.mirroring.background"), 0);
  -[RTXPCActivityManager unregisterActivityWithIdentifier:handler:](self->_xpcActivityManager, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.persistence.mirroring.backup"), 0);
  -[RTXPCActivityManager unregisterActivityWithIdentifier:handler:](self->_xpcActivityManager, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.persistence.mirroring.post-install"), 0);
}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *retryTimers;
  NSMutableArray *pendingMirroringRequests;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[RTPersistenceMirroringManager unregisterForXPCActivities](self, "unregisterForXPCActivities");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_retryTimers, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_retryTimers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidate");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[NSMutableDictionary removeAllObjects](self->_retryTimers, "removeAllObjects");
  retryTimers = self->_retryTimers;
  self->_retryTimers = 0;

  -[NSMutableArray removeAllObjects](self->_pendingMirroringRequests, "removeAllObjects");
  pendingMirroringRequests = self->_pendingMirroringRequests;
  self->_pendingMirroringRequests = 0;

  -[RTNotifier removeObserver:](self->_persistenceManager, "removeObserver:", self);
  -[RTInvocationDispatcher shutdown](self->_dispatcher, "shutdown");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:", self);

  if (v4)
    v4[2](v4, 0);

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *retryTimers;
  NSMutableArray *pendingMirroringRequests;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[RTPersistenceMirroringManager unregisterForXPCActivities](self, "unregisterForXPCActivities");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_retryTimers, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_retryTimers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_retryTimers, "removeAllObjects");
  retryTimers = self->_retryTimers;
  self->_retryTimers = 0;

  -[NSMutableArray removeAllObjects](self->_pendingMirroringRequests, "removeAllObjects");
  pendingMirroringRequests = self->_pendingMirroringRequests;
  self->_pendingMirroringRequests = 0;

  -[RTNotifier removeObserver:](self->_persistenceManager, "removeObserver:", self);
  -[RTInvocationDispatcher shutdown](self->_dispatcher, "shutdown");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", self);

  v12.receiver = self;
  v12.super_class = (Class)RTPersistenceMirroringManager;
  -[RTPersistenceMirroringManager dealloc](&v12, sel_dealloc);
}

- (BOOL)_dataAvailableToMirror
{
  return -[RTPersistenceManager availability](self->_persistenceManager, "availability") == 2;
}

- (BOOL)_authorizedToMirror
{
  return self->_cloudSyncAuthorizationState == 2;
}

- (void)performPeriodicSyncWithHandler:(id)a3
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
  v7[2] = __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[18], "buildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMirroringAttemptMapValue:buildVersion:", 1, v3);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke_2;
  v5[3] = &unk_1E9299358;
  v4 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v4;
  objc_msgSend(v6, "_performImportWithHandler:", v5);

}

void __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(id **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4[18], "buildVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMirroringAttemptMapValue:buildVersion:", 0, v5);

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke_3;
    v8[3] = &unk_1E9299068;
    v8[4] = v4;
    v7 = *(id *)(a1 + 40);
    v9 = 0;
    v10 = v7;
    objc_msgSend(v4, "_performExportWithHandler:", v8);

  }
}

void __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(id **)(a1 + 32);
  objc_msgSend(v3[18], "buildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMirroringAttemptMapValue:buildVersion:", 0, v4);

  if (*(_QWORD *)(a1 + 48))
  {
    _RTSafeArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v6);
  }

}

- (void)setMirroringAttemptMapValue:(BOOL)a3 buildVersion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

    }
    else
    {
      v9 = (void *)objc_opt_new();
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, v6);

    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", v9, CFSTR("RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: buildVersion", v12, 2u);
    }

  }
}

- (void)_performImportWithHandler:(id)a3
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  RTInvocationDispatcher *dispatcher;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  RTPersistenceManager *persistenceManager;
  _QWORD v15[5];
  void (**v16)(id, id);
  id v17;
  _QWORD v18[4];
  void (**v19)(id, id);
  _QWORD v20[5];
  void (**v21)(id, id);
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, id))a3;
  if (-[RTPersistenceMirroringManager _dataAvailableToMirror](self, "_dataAvailableToMirror"))
  {
    v17 = 0;
    -[RTPersistenceMirroringManager _transactionHistorySizeError:](self, "_transactionHistorySizeError:", &v17);
    v6 = v17;
    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v8;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@ error on importing: %@, deferring import", buf, 0x16u);

      }
      if (v5)
        v5[2](v5, v6);
    }
    else
    {
      persistenceManager = self->_persistenceManager;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_80;
      v15[3] = &unk_1E9298398;
      v15[4] = self;
      v16 = v5;
      -[RTPersistenceManager performImportMirroringRequestWithQualityOfService:handler:](persistenceManager, "performImportMirroringRequestWithQualityOfService:handler:", 3, v15);

    }
  }
  else
  {
    dispatcher = self->_dispatcher;
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke;
    v20[3] = &unk_1E9297650;
    v20[4] = self;
    v21 = v5;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_2;
    v18[3] = &unk_1E9297178;
    v19 = v21;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTInvocationDispatcher enqueueBlock:failureBlock:description:](dispatcher, "enqueueBlock:failureBlock:description:", v20, v18, CFSTR("%@-%@"), v12, v13);

  }
}

uint64_t __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performImportWithHandler:", *(_QWORD *)(a1 + 40));
}

void __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *MEMORY[0x1E0CB2D50];
    v5[0] = CFSTR("Unable to complete buffered mirroring request.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_80(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_2_81;
  block[3] = &unk_1E9297848;
  v11 = a2;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_2_81(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 48) || *(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "error during background import mirroring request, %@", (uint8_t *)&v5, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)_transactionHistorySizeError:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  char v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v25 = 0;
  -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceContextWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v7 = -[RTPersistenceMirroringManager _evaluatePersistentHistoryLengthWithManagedObjectContext:shouldResetSync:error:](self, "_evaluatePersistentHistoryLengthWithManagedObjectContext:shouldResetSync:error:", v6, &v25, &v24);
  v8 = v24;
  v9 = v8;
  v10 = 0;
  if (v25 && v7 && !v8)
  {
    -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistenceStoreForType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = CFSTR("RTPersistentStoreMetadataStoreTransactionHistorySizeExceededKey");
    v31[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentStoreCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v12, "updateMetadata:context:coordinator:error:", v13, v6, v14, &v23);
    v15 = v23;

    if (v15)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "error while updating metadata, %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Exceeded maximum transaction history size."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v17;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v26 = *MEMORY[0x1E0CB2D50];
    v27 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), -9997, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "persistenceStore:encounteredCriticalError:", v12, v10);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v10);

  return v10 == 0;
}

- (void)performExportWithHandler:(id)a3
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
  v7[2] = __58__RTPersistenceMirroringManager_performExportWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__RTPersistenceMirroringManager_performExportWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performExportWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_performExportWithHandler:(id)a3
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  RTInvocationDispatcher *dispatcher;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  RTPersistenceManager *persistenceManager;
  _QWORD v15[5];
  void (**v16)(id, id);
  id v17;
  _QWORD v18[4];
  void (**v19)(id, id);
  _QWORD v20[5];
  void (**v21)(id, id);
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, id))a3;
  if (-[RTPersistenceMirroringManager _dataAvailableToMirror](self, "_dataAvailableToMirror"))
  {
    v17 = 0;
    -[RTPersistenceMirroringManager _transactionHistorySizeError:](self, "_transactionHistorySizeError:", &v17);
    v6 = v17;
    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v8;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@ error on exporting: %@, deferring export", buf, 0x16u);

      }
      if (v5)
        v5[2](v5, v6);
    }
    else
    {
      persistenceManager = self->_persistenceManager;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_85;
      v15[3] = &unk_1E9298398;
      v15[4] = self;
      v16 = v5;
      -[RTPersistenceManager performExportMirroringRequestWithQualityOfService:handler:](persistenceManager, "performExportMirroringRequestWithQualityOfService:handler:", 3, v15);

    }
  }
  else
  {
    dispatcher = self->_dispatcher;
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke;
    v20[3] = &unk_1E9297650;
    v20[4] = self;
    v21 = v5;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_2;
    v18[3] = &unk_1E9297178;
    v19 = v21;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTInvocationDispatcher enqueueBlock:failureBlock:description:](dispatcher, "enqueueBlock:failureBlock:description:", v20, v18, CFSTR("%@-%@"), v12, v13);

  }
}

uint64_t __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performExportWithHandler:", *(_QWORD *)(a1 + 40));
}

void __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *MEMORY[0x1E0CB2D50];
    v5[0] = CFSTR("Unable to complete buffered mirroring request.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_85(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_2_86;
  block[3] = &unk_1E9297848;
  v11 = a2;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_2_86(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 48) || *(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "error during background export mirroring request, %@", (uint8_t *)&v5, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a4;
  v11 = a6;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke;
  block[3] = &unk_1E929A420;
  block[4] = self;
  v16 = v10;
  v18 = a3;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 96);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke_2;
  v8[3] = &unk_1E929A3F8;
  v5 = *(_QWORD *)(a1 + 56);
  v8[4] = v2;
  v11 = v5;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 64);
  v9 = v6;
  v12 = v7;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v4, "createManagedObjectContext:", v8);

}

void __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke_3;
  v9[3] = &unk_1E9297E20;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v9[1] = 3221225472;
  v7 = v6;
  v14 = *(_QWORD *)(a1 + 64);
  v10 = v7;
  v11 = v3;
  v12 = *(id *)(a1 + 48);
  v8 = v3;
  dispatch_async(v4, v9);

}

uint64_t __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performMirroringRequestWithType:affectedStore:qualityOfService:managedObjectContext:handler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 managedObjectContext:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  int64_t v24;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __125__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke;
  v19[3] = &unk_1E9297E20;
  v19[4] = self;
  v20 = v12;
  v23 = a3;
  v24 = a5;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, v19);

}

uint64_t __125__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performMirroringRequestWithType:affectedStore:qualityOfService:managedObjectContext:handler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 managedObjectContext:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  RTPersistenceMirroringRequest *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *mirroringPolicies;
  void *v23;
  uint64_t v24;
  RTPersistenceMirroringRequest *v25;
  void *v26;
  void *v27;
  RTPersistenceMirroringRequest *v28;
  void *v29;
  RTPersistenceMirroringRequest *v30;
  void *v31;
  RTInvocationDispatcher *dispatcher;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  RTPersistenceMirroringRequest *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  RTPersistenceMirroringRequest *v42;
  NSObject *v43;
  RTPersistenceMirroringRequest *v44;
  _QWORD v45[4];
  void (**v46)(_QWORD, _QWORD, _QWORD);
  _QWORD v47[5];
  id v48;
  id v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  int64_t v51;
  int64_t v52;
  uint64_t v53;
  const __CFString *v54;
  id v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint8_t buf[4];
  RTPersistenceMirroringRequest *v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  _QWORD v69[4];

  v69[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (a3 != 2 && self->_syncDisabledForPerProcessMemoryLimit)
  {
    if (v14)
    {
      v68 = *MEMORY[0x1E0CB2D50];
      v69[0] = CFSTR("Sync is disabled due to requests exceeding the memory threshold.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = 8;
LABEL_9:
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), v18, v16);
      v19 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      ((void (**)(_QWORD, _QWORD, RTPersistenceMirroringRequest *))v15)[2](v15, 0, v19);
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (a3 != 1 || self->_exportingAvailable)
  {
    if (!-[RTPersistenceMirroringManager _dataAvailableToMirror](self, "_dataAvailableToMirror"))
    {
      dispatcher = self->_dispatcher;
      v33 = MEMORY[0x1E0C809B0];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __126__RTPersistenceMirroringManager__performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke;
      v47[3] = &unk_1E9297E20;
      v47[4] = self;
      v51 = a3;
      v48 = v12;
      v52 = a5;
      v49 = v13;
      v50 = v15;
      v45[0] = v33;
      v45[1] = 3221225472;
      v45[2] = __126__RTPersistenceMirroringManager__performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke_2;
      v45[3] = &unk_1E9297178;
      v46 = v50;
      -[RTInvocationDispatcher enqueueBlock:failureBlock:description:](dispatcher, "enqueueBlock:failureBlock:description:", v47, v45, CFSTR("pending invocation for mirroring"));

      goto LABEL_13;
    }
    if (v12)
    {
      if (v13)
      {
        objc_msgSend(v12, "options");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0C97958]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C97950]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          if (!a5)
          {
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "mirroring request with QoS none requested, returning", buf, 2u);
            }

            if (v15)
              v15[2](v15, 0, 0);
            goto LABEL_12;
          }
          mirroringPolicies = self->_mirroringPolicies;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](mirroringPolicies, "objectForKeyedSubscript:", v23);
          v19 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            -[RTPersistenceMirroringManager optionsForQualityOfService:](self, "optionsForQualityOfService:", a5);
            v44 = v19;
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = [RTPersistenceMirroringRequest alloc];
            -[RTNotifier queue](self, "queue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v12;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v25;
            v29 = (void *)v24;
            v19 = v44;
            v30 = -[RTPersistenceMirroringRequest initWithQueue:requestType:mirroringPolicy:affectedStores:options:completionHandler:](v28, "initWithQueue:requestType:mirroringPolicy:affectedStores:options:completionHandler:", v26, a3, v44, v27, v29, v15);

            -[RTPersistenceMirroringRequest setDelegate:](v30, "setDelegate:", self);
            -[RTPersistenceMirroringRequest request](v30, "request");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              -[RTPersistenceMirroringManager _enqueueMirroringRequest:context:](self, "_enqueueMirroringRequest:context:", v30, v13);
            }
            else
            {
              v40 = v29;
              v53 = *MEMORY[0x1E0CB2D50];
              v54 = CFSTR("Underlying CloudKit request was nil for mirroring request type.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 2, v41);
              v42 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
              _rt_log_facility_get_os_log(RTLogFacilityDatabase);
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v63 = v42;
                _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "nil cloudkit request for mirroring request, %@", buf, 0xCu);
              }

              if (v15)
                ((void (**)(_QWORD, _QWORD, RTPersistenceMirroringRequest *))v15)[2](v15, 0, v42);

              v29 = v40;
              v19 = v44;
            }
          }
          else
          {
            if (!v15)
              goto LABEL_11;
            v56 = *MEMORY[0x1E0CB2D50];
            v57 = CFSTR("There is no mirroring policy associated with the requested quality of service.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 1, v29);
            v30 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v30;
              _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "invalid qos for mirroring request, %@", buf, 0xCu);
            }

            ((void (**)(_QWORD, _QWORD, RTPersistenceMirroringRequest *))v15)[2](v15, 0, v30);
          }

          goto LABEL_11;
        }
        if (!v15)
          goto LABEL_12;
        v58 = *MEMORY[0x1E0CB2D50];
        v59 = CFSTR("This persistent store is not associated with a mirroring delegate.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v19 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 1, v19);
        v36 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v36;
          _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "invalid mirroring delegate for mirroring request, %@", buf, 0xCu);
        }

        ((void (**)(_QWORD, _QWORD, RTPersistenceMirroringRequest *))v15)[2](v15, 0, v36);
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      if (!v15)
        goto LABEL_13;
      v60 = *MEMORY[0x1E0CB2D50];
      v61 = CFSTR("Mirroring request requires specifying a managed object context.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 1, v16);
      v19 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v63 = v19;
      v35 = "invalid managed object context for mirroring operation, %@";
    }
    else
    {
      if (!v15)
        goto LABEL_13;
      v64 = *MEMORY[0x1E0CB2D50];
      v65 = CFSTR("Mirroring request requires specifying an affected store.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 1, v16);
      v19 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v63 = v19;
      v35 = "invalid store for mirroring operation, %@";
    }
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0xCu);
LABEL_28:

    goto LABEL_10;
  }
  if (v14)
  {
    v66 = *MEMORY[0x1E0CB2D50];
    v67 = CFSTR("Exports are suspended.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 9;
    goto LABEL_9;
  }
LABEL_13:

}

uint64_t __126__RTPersistenceMirroringManager__performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performMirroringRequestWithType:affectedStore:qualityOfService:managedObjectContext:handler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __126__RTPersistenceMirroringManager__performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *MEMORY[0x1E0CB2D50];
    v5[0] = CFSTR("enqueued operation for mirroring failed because store was not available.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)_enqueueMirroringRequest:(id)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  RTPersistenceMirroringRequest *activeMirroringRequest;
  NSObject *v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  RTPersistenceMirroringManager *val;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  v31 = v6;
  v7 = -[NSMutableArray indexOfObject:](self->_pendingMirroringRequests, "indexOfObject:", v6);
  val = self;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = (uint64_t)v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Enqueueing mirroring request with identifier, %@", buf, 0xCu);

    }
    -[NSMutableArray addObject:](self->_pendingMirroringRequests, "addObject:", v6);
    v32 = v6;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_pendingMirroringRequests, "objectAtIndex:", v7);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v43 = (uint64_t)v6;
      v44 = 2112;
      v45 = v32;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "Merging new mirroring request, %@ with existing mirroring request, %@", buf, 0x16u);
    }

    objc_msgSend(v32, "mergeRequest:", v6);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      activeMirroringRequest = self->_activeMirroringRequest;
      *(_DWORD *)buf = 138412290;
      v43 = (uint64_t)activeMirroringRequest;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "~~~~~~ACTIVE MIRRORING REQUEST: %@~~~~~~", buf, 0xCu);
    }

    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = -[NSMutableArray count](self->_pendingMirroringRequests, "count");
      *(_DWORD *)buf = 134217984;
      v43 = v15;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "~~~~~~[PENDING MIRRORING REQUESTS]: %lu~~~~~~", buf, 0xCu);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = self->_pendingMirroringRequests;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v17)
    {
      v18 = 0;
      v19 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            v43 = v18 + i;
            v44 = 2112;
            v45 = v21;
            _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "Pending request %lu: %@", buf, 0x16u);
          }

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v18 += i;
      }
      while (v17);
    }

  }
  if ((objc_msgSend(v32, "isReady") & 1) != 0)
  {
    -[RTPersistenceMirroringManager _startMirroringRequest:context:](val, "_startMirroringRequest:context:", v32, v29);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v31, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = (uint64_t)v25;
      _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "Deferring mirroring request with identifier, %@, because it is not ready to execute.", buf, 0xCu);

    }
    objc_initWeak((id *)buf, val);
    objc_msgSend(v32, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __66__RTPersistenceMirroringManager__enqueueMirroringRequest_context___block_invoke;
    v33[3] = &unk_1E92981E8;
    objc_copyWeak(&v36, (id *)buf);
    v28 = v26;
    v34 = v28;
    v35 = v29;
    -[RTPersistenceMirroringManager _scheduleRetryAttemptForRequest:referenceDate:handler:](val, "_scheduleRetryAttemptForRequest:referenceDate:handler:", v32, v27, v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }

}

void __66__RTPersistenceMirroringManager__enqueueMirroringRequest_context___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = WeakRetained[15];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v10 = *(void **)(a1 + 32);
          objc_msgSend(v9, "identifier", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v10) = objc_msgSend(v10, "isEqual:", v11);

          if ((_DWORD)v10)
          {
            objc_msgSend(v3, "_enqueueMirroringRequest:context:", v9, *(_QWORD *)(a1 + 40));
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_startMirroringRequest:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  RTPersistenceMirroringRequest *activeMirroringRequest;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  RTPersistenceMirroringRequest *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_activeMirroringRequest)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      activeMirroringRequest = self->_activeMirroringRequest;
      *(_DWORD *)buf = 138412546;
      v24 = activeMirroringRequest;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "an existing request is already active, %@, deferring this request, %@.", buf, 0x16u);
    }

    goto LABEL_20;
  }
  if (!-[RTPersistenceMirroringManager _authorizedToMirror](self, "_authorizedToMirror"))
  {
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("The mirroring request is denied due to user authorization");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 3;
LABEL_19:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completeRequestWithError:", v14);

    goto LABEL_20;
  }
  if (-[RTPersistenceMirroringManager _mirroringDelegateState](self, "_mirroringDelegateState") != 1)
  {
    if (-[RTPersistenceMirroringManager _mirroringDelegateState](self, "_mirroringDelegateState") == 2)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("The mirroring request failed because the mirroring delegate failed setup.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 7;
    }
    else if (-[RTPersistenceMirroringManager _mirroringDelegateState](self, "_mirroringDelegateState"))
    {
      v13 = 0;
      v11 = 0;
    }
    else
    {
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = CFSTR("The mirroring request failed because the mirroring delegate has not initialized yet.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 5;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_19;
  }
  if (!self->_currentReachability)
  {
    v15 = *MEMORY[0x1E0CB2D50];
    v16 = CFSTR("The mirroring request failed because the network is not reachable.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 6;
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "requestType") == 2)
  {
    -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateStoreAvailability:", 1);

  }
  objc_msgSend(v6, "executeMirroringRequestWithContext:", v7);
LABEL_20:

}

- (void)mirroringRequestDidBegin:(id)a3
{
  RTPersistenceMirroringRequest *v4;
  NSObject *v5;
  RTPersistenceMirroringRequest *activeMirroringRequest;
  RTPersistenceMirroringRequest *v7;
  NSMutableDictionary *retryTimers;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  int v13;
  RTPersistenceMirroringRequest *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (RTPersistenceMirroringRequest *)a3;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "mirroring request, %@ did begin", (uint8_t *)&v13, 0xCu);
  }

  activeMirroringRequest = self->_activeMirroringRequest;
  self->_activeMirroringRequest = v4;
  v7 = v4;

  -[NSMutableArray removeObject:](self->_pendingMirroringRequests, "removeObject:", v7);
  retryTimers = self->_retryTimers;
  -[RTPersistenceMirroringRequest identifier](v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](retryTimers, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  v11 = self->_retryTimers;
  -[RTPersistenceMirroringRequest identifier](v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

}

- (BOOL)mirroringRequest:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  double v33;
  void *v34;
  RTPersistenceMirroringRequest *activeMirroringRequest;
  BOOL v36;
  void *v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  _QWORD block[5];
  id v45;
  id v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v52 = v6;
    v53 = 2112;
    v54 = (uint64_t)v7;
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "mirroring request, %@ failed with error, %@", buf, 0x16u);
  }

  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("RTPersistenceMirroringManagerErrorDomain")))
  {
    v10 = objc_msgSend(v7, "code");

    if (v10 == 8)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = objc_msgSend(v11, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringMemoryLimitExceeded, 1);
      v49 = CFSTR("buildVersion");
      -[RTPlatform buildVersion](self->_platform, "buildVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      log_analytics_submission(v12, v14);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("buildVersion");
      -[RTPlatform buildVersion](self->_platform, "buildVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "domain");
  v12 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToString:](v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    objc_msgSend(v7, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsString:", CFSTR("was aborted because the mirroring delegate never successfully initialized due to error: Error Domain=NSCocoaErrorDomain Code=256"));

    if (!v20)
      goto LABEL_12;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_FAULT, "Mirroring request failed due to data protection", buf, 2u);
    }
  }
LABEL_11:

LABEL_12:
  objc_msgSend(v7, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Retry-After"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = objc_msgSend(v6, "attemptCount");
    v25 = RTPersistenceMirroringRequestRetryCountMax;

    if (v24 < v25)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v6, "attemptCount");
        *(_DWORD *)buf = 138412546;
        v52 = v28;
        v53 = 2048;
        v54 = v29;
        _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "will retry request with identifier, %@, attempt count, %lu", buf, 0x16u);

      }
      objc_msgSend(v7, "userInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Retry-After"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "unsignedIntegerValue");
      v33 = (double)v32;

      if (!v32)
        v33 = 30.0;
      if (objc_msgSend(v6, "requestType") == 2)
      {
        -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "updateStoreAvailability:", 2);

      }
      -[RTPersistenceMirroringManager _prepareRequestForRetryAttempt:retryInterval:](self, "_prepareRequestForRetryAttempt:retryInterval:", v6, v33);
      activeMirroringRequest = self->_activeMirroringRequest;
      self->_activeMirroringRequest = 0;

      v36 = 1;
      goto LABEL_27;
    }
  }
  else
  {

  }
  if (objc_msgSend(v6, "requestType") == 2)
  {
    -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "updateStoreAvailability:", 2);

  }
  -[RTNotifier queue](self, "queue");
  v38 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__RTPersistenceMirroringManager_mirroringRequest_didFailWithError___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v39 = v6;
  v45 = v39;
  v46 = v7;
  dispatch_async(v38, block);

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v39, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v52 = v42;
    _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "will not retry request with identifier, %@", buf, 0xCu);

  }
  -[RTPersistenceMirroringManager _finalizeMirroringRequest:](self, "_finalizeMirroringRequest:", v39);

  v36 = 0;
LABEL_27:

  return v36;
}

void __67__RTPersistenceMirroringManager_mirroringRequest_didFailWithError___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 88));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mirroringManager:mirroringRequest:didFailWithError:", a1[4], a1[5], a1[6]);

}

- (void)mirroringRequestDidSucceed:(id)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  RTPersistenceCloudDeletionEnforcer *persistenceCloudDeletionEnforcer;
  void *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  int v18;
  NSObject *v19;
  int v20;
  void *v22;
  RTDefaultsManager *defaultsManager;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = (uint64_t)v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "mirroring request, %@, succeeded", buf, 0xCu);
  }

  if (!objc_msgSend(v4, "requestType"))
  {
    self->_exportingAvailable = 1;
    -[RTPersistenceManager persistenceContextWithOptions:](self->_persistenceManager, "persistenceContextWithOptions:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    persistenceCloudDeletionEnforcer = self->_persistenceCloudDeletionEnforcer;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v10 = -[RTPersistenceCloudDeletionEnforcer processRequestsSinceReferenceDate:context:error:](persistenceCloudDeletionEnforcer, "processRequestsSinceReferenceDate:context:error:", v9, v7, &v31);
    v11 = v31;

    if (!v10 || v11 != 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = (uint64_t)v11;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "error while processing deletion requests after import, %@", buf, 0xCu);
      }

    }
    v6 = CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastImportDate");
    goto LABEL_34;
  }
  if (objc_msgSend(v4, "requestType") != 1)
  {
    if (objc_msgSend(v4, "requestType") == 2)
    {
      -[RTPersistenceManager persistenceStoreForType:](self->_persistenceManager, "persistenceStoreForType:", 1);
      v7 = objc_claimAutoreleasedReturnValue();
      -[RTPersistenceManager persistenceContextWithOptions:](self->_persistenceManager, "persistenceContextWithOptions:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceManager delegate](self->_persistenceManager, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = 0;
      do
      {

        v30 = 0;
        v18 = objc_msgSend(v15, "persistenceMirroringManagerDidFinishZonePurge:store:context:error:", self, v7, v14, &v30);
        v16 = v30;
        if (v16)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v33 = (uint64_t)v16;
            _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Error while re-preparing the store after zone reset, %@", buf, 0xCu);
          }

        }
        v20 = v18 ^ 1;
        if (v16)
          v20 = 1;
      }
      while (v20 == 1 && v17++ < 4);
      if ((v20 & 1) == 0)
        -[RTPersistenceManager updateStoreAvailability:](self->_persistenceManager, "updateStoreAvailability:", 2);
      -[RTPlatform buildVersion](self->_platform, "buildVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceMirroringManager setMirroringAttemptMapValue:buildVersion:](self, "setMirroringAttemptMapValue:buildVersion:", 0, v22);

      v6 = CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastZoneResetDate");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v27 = objc_msgSend(v4, "requestType");
        *(_DWORD *)buf = 134218498;
        v33 = v27;
        v34 = 2080;
        v35 = "-[RTPersistenceMirroringManager mirroringRequestDidSucceed:]";
        v36 = 1024;
        v37 = 1105;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unhandled request type, %lu (in %s:%d)", buf, 0x1Cu);
      }
      v6 = &stru_1E92AB3A8;
    }
LABEL_34:

    goto LABEL_35;
  }
  v6 = CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastExportDate");
LABEL_35:
  defaultsManager = self->_defaultsManager;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", v24, v6);

  -[RTNotifier queue](self, "queue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTPersistenceMirroringManager_mirroringRequestDidSucceed___block_invoke;
  block[3] = &unk_1E9297540;
  block[4] = self;
  v29 = v4;
  v26 = v4;
  dispatch_async(v25, block);

  -[RTPersistenceMirroringManager _finalizeMirroringRequest:](self, "_finalizeMirroringRequest:", v26);
}

void __60__RTPersistenceMirroringManager_mirroringRequestDidSucceed___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mirroringManager:mirroringRequestDidSucceed:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_finalizeMirroringRequest:(id)a3
{
  RTPersistenceMirroringRequest *activeMirroringRequest;

  -[NSMutableArray removeObject:](self->_pendingMirroringRequests, "removeObject:", a3);
  activeMirroringRequest = self->_activeMirroringRequest;
  self->_activeMirroringRequest = 0;

  -[RTPersistenceMirroringManager _dequeueNextMirroringRequest](self, "_dequeueNextMirroringRequest");
}

- (void)_dequeueNextMirroringRequest
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pendingMirroringRequests, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_pendingMirroringRequests;
    v4 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v7, "isReady"))
          {
            v4 = v7;
            goto LABEL_12;
          }
        }
        v4 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

    -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__RTPersistenceMirroringManager__dequeueNextMirroringRequest__block_invoke;
    v10[3] = &unk_1E9299838;
    v10[4] = self;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "createManagedObjectContext:", v10);

  }
}

void __61__RTPersistenceMirroringManager__dequeueNextMirroringRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTPersistenceMirroringManager__dequeueNextMirroringRequest__block_invoke_2;
  block[3] = &unk_1E9299D78;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __61__RTPersistenceMirroringManager__dequeueNextMirroringRequest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMirroringRequest:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_prepareRequestForRetryAttempt:(id)a3 retryInterval:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  char *v13;
  id v14;
  id v15;
  NSObject *v16;
  char *v17;
  RTTimerManager *timerManager;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  RTPersistenceMirroringManager *v43;
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[RTPersistenceMirroringManager _prepareRequestForRetryAttempt:retryInterval:]";
      v47 = 1024;
      LODWORD(v48) = 1160;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: retryInterval >= 0 (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_retryTimers, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "UUIDString");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v11;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "Cancelling existing timer for mirroring operation with identifier, %@", buf, 0xCu);

    }
    objc_msgSend(v9, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_retryTimers, "removeObjectForKey:", v8);
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "UUIDString");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v13;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "Creating new underlying mirroring request for request with identifier %@", buf, 0xCu);

  }
  objc_msgSend(v6, "_prepareMirroringRequestForRetry:", v6);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke;
  v41[3] = &unk_1E9299D78;
  v14 = v8;
  v42 = v14;
  v43 = self;
  v15 = v6;
  v44 = v15;
  v36 = (void *)MEMORY[0x1D8232094](v41);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v14, "UUIDString");
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v17;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "Creating retry timer for request identifier %@", buf, 0xCu);

  }
  timerManager = self->_timerManager;
  objc_msgSend(v14, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", v19, v20, v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKey:](self->_retryTimers, "setObject:forKey:", v21, v14);
  objc_msgSend(v21, "fireAfterDelay:", a4);
  objc_msgSend(v21, "resume");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v34 = v21;
    v35 = v14;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      -[NSMutableDictionary allKeys](self->_retryTimers, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");
      *(_DWORD *)buf = 134217984;
      v46 = (const char *)v24;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "~~~~~Current active retry timers: %lu~~~~~", buf, 0xCu);

    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[NSMutableDictionary allKeys](self->_retryTimers, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v31, "UUIDString");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v46 = (const char *)(v28 + i);
            v47 = 2112;
            v48 = v33;
            _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%lu. identifier %@", buf, 0x16u);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        v28 += i;
      }
      while (v27);
    }

    v14 = v35;
    v21 = v34;
  }

}

void __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "enqueueing retry timer block for request identifier %@", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(v4 + 96);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke_132;
  v7[3] = &unk_1E9299838;
  v7[4] = v4;
  v8 = v5;
  objc_msgSend(v6, "createManagedObjectContext:", v7);

}

void __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke_132(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke_2;
  block[3] = &unk_1E9299D78;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueMirroringRequest:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_scheduleRetryAttemptForRequest:(id)a3 referenceDate:(id)a4 handler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  RTTimerManager *timerManager;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void (**v31)(_QWORD);
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = a4;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_retryTimers, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v14;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "Cancelling existing timer for mirroring operation with identifier, %@", buf, 0xCu);

    }
    objc_msgSend(v12, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_retryTimers, "removeObjectForKey:", v11);
  }
  objc_msgSend(v8, "mirroringPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalUntilOperationAllowed");
  v17 = v16;

  objc_msgSend(v10, "dateByAddingTimeInterval:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isBeforeDate:", v18);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v20)
  {
    v30 = v8;
    v31 = v9;
    if (v22)
    {
      objc_msgSend(v11, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "Creating timer to fire deferred mirroring operation with identifier, %@ at, %@", buf, 0x16u);

    }
    timerManager = self->_timerManager;
    objc_msgSend(v11, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v31;
    -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", v26, v27, v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_retryTimers, "setObject:forKey:", v28, v11);
    objc_msgSend(v28, "fireAfterDelay:", v17);
    objc_msgSend(v28, "resume");

    v8 = v30;
  }
  else
  {
    if (v22)
    {
      objc_msgSend(v11, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v29;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "Deferral period for request with identifier, %@, already expired, firing now.", buf, 0xCu);

    }
    if (v9)
      v9[2](v9);
  }

}

- (void)persistenceAvailabilityDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTPersistenceManagerNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__RTPersistenceMirroringManager_persistenceAvailabilityDidChange___block_invoke;
    v11[3] = &unk_1E9297540;
    v11[4] = self;
    v12 = v4;
    dispatch_sync(v8, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2080;
      v16 = "-[RTPersistenceMirroringManager persistenceAvailabilityDidChange:]";
      v17 = 1024;
      v18 = 1258;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __66__RTPersistenceMirroringManager_persistenceAvailabilityDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistenceAvailabilityDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)_persistenceAvailabilityDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTPersistenceManagerNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[RTPersistenceMirroringManager _persistenceAvailabilityDidChange:]";
      v11 = 1024;
      v12 = 1265;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "notification name is not RTPersistenceManagerNotificationAvailabilityDidChange (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
  -[RTPersistenceMirroringManager _updateExportingAvailability:](self, "_updateExportingAvailability:", objc_msgSend(v4, "availability"));
  if (-[RTPersistenceMirroringManager _dataAvailableToMirror](self, "_dataAvailableToMirror")
    && -[RTInvocationDispatcher invocationsPending](self->_dispatcher, "invocationsPending"))
  {
    -[RTInvocationDispatcher dispatchPendingInvocations](self->_dispatcher, "dispatchPendingInvocations");
  }

}

- (void)_updateExportingAvailability:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  RTPersistenceExpirationEnforcer *persistenceExpirationEnforcer;
  void *v8;
  _QWORD v9[9];

  if (a3 == 2)
  {
    v9[7] = v3;
    v9[8] = v4;
    -[RTPersistenceManager persistenceContextWithOptions:](self->_persistenceManager, "persistenceContextWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    persistenceExpirationEnforcer = self->_persistenceExpirationEnforcer;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -4838400.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 0;
    self->_exportingAvailable = -[RTPersistenceMirroringManager exportMirroringIsAvailableWithExpirationEnforcer:expirationDate:context:error:](self, "exportMirroringIsAvailableWithExpirationEnforcer:expirationDate:context:error:", persistenceExpirationEnforcer, v8, v6, v9);

  }
}

- (void)onCloudSyncAuthorizationChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAccountManagerNotificationCloudSyncAuthorizationStateChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__RTPersistenceMirroringManager_onCloudSyncAuthorizationChange___block_invoke;
    v11[3] = &unk_1E9297540;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v8, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2080;
      v16 = "-[RTPersistenceMirroringManager onCloudSyncAuthorizationChange:]";
      v17 = 1024;
      v18 = 1299;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __64__RTPersistenceMirroringManager_onCloudSyncAuthorizationChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onCloudSyncAuthorizationChange:", *(_QWORD *)(a1 + 40));
}

- (void)_onCloudSyncAuthorizationChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  int64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAccountManagerNotificationCloudSyncAuthorizationStateChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTPersistenceMirroringManager _onCloudSyncAuthorizationChange:]";
      v12 = 1024;
      v13 = 1306;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "notification name is not RTAccountManagerNotificationCloudSyncAuthorizationStateChanged (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  v9 = objc_msgSend(v4, "cloudSyncAuthorizationState");
  self->_cloudSyncAuthorizationState = v9;
  if (v9 == 2 && -[RTInvocationDispatcher invocationsPending](self->_dispatcher, "invocationsPending"))
    -[RTInvocationDispatcher dispatchPendingInvocations](self->_dispatcher, "dispatchPendingInvocations");

}

- (void)onReachabilityChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__RTPersistenceMirroringManager_onReachabilityChange___block_invoke;
    v11[3] = &unk_1E9297540;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v8, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2080;
      v16 = "-[RTPersistenceMirroringManager onReachabilityChange:]";
      v17 = 1024;
      v18 = 1324;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __54__RTPersistenceMirroringManager_onReachabilityChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onReachabilityChange:", *(_QWORD *)(a1 + 40));
}

- (void)_onReachabilityChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[RTPersistenceMirroringManager _onReachabilityChange:]";
      v11 = 1024;
      v12 = 1331;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "notification name is not RTReachabilityMonitorNotificationReachabilityChanged (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
  self->_currentReachability = objc_msgSend(v4, "reachability");

}

- (int64_t)_mirroringDelegateState
{
  void *v2;
  int64_t v3;

  -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mirroringDelegateStateForStoreType:", 1);

  return v3;
}

- (void)_updateMirroringDelegateState
{
  if (-[RTPersistenceMirroringManager _mirroringDelegateState](self, "_mirroringDelegateState"))
  {
    if (-[RTInvocationDispatcher invocationsPending](self->_dispatcher, "invocationsPending"))
      -[RTInvocationDispatcher dispatchPendingInvocations](self->_dispatcher, "dispatchPendingInvocations");
  }
}

- (id)optionsForQualityOfService:(int64_t)a3
{
  id result;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *mirroringPolicies;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = (id)objc_opt_new();
  v6 = result;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(result, "operationConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscretionaryNetworkBehavior:", 0);

    objc_msgSend(v6, "operationConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  else
  {
    if (a3 != 1)
    {
      __break(1u);
      return result;
    }
    objc_msgSend(result, "operationConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDiscretionaryNetworkBehavior:", 2);

    objc_msgSend(v6, "operationConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  objc_msgSend(v8, "setAutomaticallyRetryNetworkFailures:", v10);

  mirroringPolicies = self->_mirroringPolicies;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mirroringPolicies, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315394;
      v19 = "-[RTPersistenceMirroringManager optionsForQualityOfService:]";
      v20 = 1024;
      v21 = 1371;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "mirroring policy was nil (in %s:%d)", (uint8_t *)&v18, 0x12u);
    }

  }
  v16 = objc_msgSend(v14, "allowsMirroringViaCellular");
  objc_msgSend(v6, "operationConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAllowsCellularAccess:", v16);

  return v6;
}

+ (int64_t)periodicPurgePolicy
{
  return 0;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t v16;
  SEL v17;
  uint8_t buf[4];
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (a3 == 1)
  {
    -[RTNotifier queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke;
    block[3] = &unk_1E929A420;
    block[4] = self;
    v16 = 1;
    v14 = v9;
    v15 = v10;
    v17 = a2;
    dispatch_async(v11, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v19 = a3;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "RTPersistenceMirroringManager doesn't implement purge type, %ld", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_dataAvailableToMirror") & 1) == 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v14 = *(void **)(v12 + 168);
    v15 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v32[3] = &unk_1E9297590;
    v16 = *(_QWORD *)(a1 + 56);
    v32[4] = v12;
    v35 = v16;
    v33 = v13;
    v34 = *(id *)(a1 + 48);
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_3;
    v29[3] = &unk_1E9298E88;
    v17 = *(_QWORD *)(a1 + 64);
    v29[4] = *(_QWORD *)(a1 + 32);
    v31 = v17;
    v30 = *(id *)(a1 + 48);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enqueueBlock:failureBlock:description:", v32, v29, CFSTR("%@-%@"), v19, v20);

    return;
  }
  if (*(_QWORD *)(a1 + 56) != 1)
    return;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RTPersistenceMirroringManager not purging due to iCloud sync auth state, %ld"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v4;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v42 = *MEMORY[0x1E0CB2D50];
    v43 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 3, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_25;
  }
  objc_msgSend(*(id *)(v2 + 96), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "mirroringOptionsForStoreWithType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RTPersistenceMirroringManager not purging due to nil mirroring delegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v9;
        _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      v40 = *MEMORY[0x1E0CB2D50];
      v41 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 5, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      goto LABEL_24;
    }

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_mirroringDelegateState") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RTPersistenceMirroringManager not purging due to failed mirroring delegate."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v5;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v38 = *MEMORY[0x1E0CB2D50];
    v39 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 7;
LABEL_23:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), v11, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_mirroringDelegateState"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RTPersistenceMirroringManager not purging due to mirroring delegate setup state."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v5;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v36 = *MEMORY[0x1E0CB2D50];
    v37 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 5;
    goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_146;
  v27[3] = &unk_1E929A448;
  v28 = *(id *)(a1 + 48);
  objc_msgSend(v22, "performZoneResetMirroringRequestWithQualityOfService:handler:", 3, v27);

  v5 = v28;
LABEL_26:

}

uint64_t __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performPurgeOfType:referenceDate:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);

}

void __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_146(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Error during (purge) zone reset in mirroring manager, %@", (uint8_t *)&v6, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(a4, "hasMask:", 1) & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__RTPersistenceMirroringManager_sendDiagnosticsToURL_options_handler___block_invoke;
    block[3] = &unk_1E9299330;
    block[4] = self;
    v13 = v9;
    v12 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __70__RTPersistenceMirroringManager_sendDiagnosticsToURL_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_dataAvailableToMirror")
    && objc_msgSend(*(id *)(a1 + 32), "_mirroringDelegateState") == 1)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 0;
    objc_msgSend(v2, "_generateDiagnosticFilesAtURL:error:", v3, &v8);
    v4 = v8;
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "skipping diagnostics from the mirroring manager due to data availability or mirroring delegate state", buf, 2u);
    }

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    v4 = 0;
  }

}

- (BOOL)exceedingMemoryThreshold
{
  double v2;

  +[RTRuntime footprint](RTRuntime, "footprint");
  return v2 > 15.0;
}

- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  id v25;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!-[RTPersistenceMirroringManager exceedingMemoryThreshold](self, "exceedingMemoryThreshold"))
  {
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("CloudKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v29);
    v18 = v29;

    if (v18)
    {
      v16 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v18);
    }
    else
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.CoreRoutine-3"), 1);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v19);
      objc_msgSend(v20, "privateCloudDatabase");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v22 = -[RTPersistenceMirroringManager _fetchDatabaseChangesForDatabase:outputURL:error:](self, "_fetchDatabaseChangesForDatabase:outputURL:error:", v21, v15, &v28);
      v23 = v28;

      if (!v22 || v23)
      {
        v16 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v23);
      }
      else
      {
        objc_msgSend(v20, "privateCloudDatabase");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        -[RTPersistenceMirroringManager _fetchZoneChangesForDatabase:outputURL:error:](self, "_fetchZoneChangesForDatabase:outputURL:error:", v24, v15, &v27);
        v25 = v27;

        v16 = v25 == 0;
        if (a4 && v25)
          *a4 = objc_retainAutorelease(v25);

      }
    }

    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138413058;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    v36 = 2048;
    v37 = v12;
    v38 = 2048;
    v39 = 15;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, deferring attempt to generate diagnostic files; exceeding memory threshold, current footprint, %.4f MB, fo"
      "otprint threshold, %lu MB",
      buf,
      0x2Au);

  }
  if (a4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("routined exceeding persistence mirroring manager's memory threshold for generating diagnostic files.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v15);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (BOOL)_fetchDatabaseChangesForDatabase:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  dispatch_semaphore_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  dispatch_time_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  BOOL v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *context;
  _QWORD v58[4];
  id v59;
  NSObject *v60;
  _BYTE *v61;
  uint64_t *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  __int128 v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  uint8_t v81[8];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v56 = v9;
  v52 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: database", buf, 2u);
    }

    if (!a5)
      goto LABEL_17;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("database"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v51 = 0;
    *a5 = v19;
    goto LABEL_30;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outputURL", buf, 2u);
    }

    if (!a5)
      goto LABEL_17;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("outputURL"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (-[RTPersistenceMirroringManager exceedingMemoryThreshold](self, "exceedingMemoryThreshold"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      v74 = v15;
      LOWORD(v75) = 2048;
      *(_QWORD *)((char *)&v75 + 2) = 15;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, deferring attempt to fetch database changes; exceeding memory threshold, current footprint, %.4f MB, foo"
        "tprint threshold, %lu MB",
        buf,
        0x2Au);

    }
    if (a5)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v78 = *MEMORY[0x1E0CB2D50];
      v79 = CFSTR("routined exceeding persistence mirroring manager's memory threshold for fetching database changes.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_17:
    v51 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v52, "URLByAppendingPathComponent:", CFSTR("database-changes.txt"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "createFileAtPath:contents:attributes:", v22, 0, 0);

  v23 = (void *)MEMORY[0x1E0CB3608];
  objc_msgSend(v50, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fileHandleForWritingAtPath:", v24);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v55 != 0;
  if (v55)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v74 = __Block_byref_object_copy__27;
    *(_QWORD *)&v75 = __Block_byref_object_dispose__27;
    *((_QWORD *)&v75 + 1) = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 0;
    v53 = *MEMORY[0x1E0D18598];
    v54 = *MEMORY[0x1E0CB2D50];
    do
    {
      context = (void *)MEMORY[0x1D8231EA8]();
      v25 = objc_alloc(MEMORY[0x1E0C94DB0]);
      v26 = (void *)objc_msgSend(v25, "initWithPreviousServerChangeToken:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      objc_msgSend(v26, "setFetchAllChanges:", 0);
      objc_msgSend(v26, "setResultsLimit:", 1024);
      v27 = dispatch_semaphore_create(0);
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke;
      v67[3] = &unk_1E929A470;
      v28 = v55;
      v68 = v28;
      objc_msgSend(v26, "setRecordZoneWithIDChangedBlock:", v67);
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_172;
      v65[3] = &unk_1E929A470;
      v29 = v28;
      v66 = v29;
      objc_msgSend(v26, "setRecordZoneWithIDWasDeletedBlock:", v65);
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_175;
      v63[3] = &unk_1E929A470;
      v30 = v29;
      v64 = v30;
      objc_msgSend(v26, "setRecordZoneWithIDWasPurgedBlock:", v63);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_178;
      v58[3] = &unk_1E929A498;
      v31 = v30;
      v59 = v31;
      v61 = buf;
      v62 = &v69;
      v32 = v27;
      v60 = v32;
      objc_msgSend(v26, "setFetchDatabaseChangesCompletionBlock:", v58);
      objc_msgSend(v56, "addOperation:", v26);
      v33 = v32;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v33, v35))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "timeIntervalSinceDate:", v34);
        v38 = v37;
        v39 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_22);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "filteredArrayUsingPredicate:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "submitToCoreAnalytics:type:duration:", v43, 1, v38);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v81 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v81, 2u);
        }

        v45 = (void *)MEMORY[0x1E0CB35C8];
        v80 = v54;
        *(_QWORD *)v81 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", v53, 15, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
      }

      objc_autoreleasePoolPop(context);
    }
    while (*((_BYTE *)v70 + 24));
    objc_msgSend(v31, "closeFile");
    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(buf, 8);

  }
  else if (a5)
  {
    v76 = *MEMORY[0x1E0CB2D50];
    v77 = CFSTR("Could not open file descriptor to write diagnostics.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v48);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_30:

  return v51;
}

void __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Record Zone With ID was changed: %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeData:", v8);

  objc_autoreleasePoolPop(v4);
}

void __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Record Zone With ID was deleted: %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeData:", v8);

  objc_autoreleasePoolPop(v4);
}

void __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Record Zone With ID was purged: %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeData:", v8);

  objc_autoreleasePoolPop(v4);
}

void __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_178(uint64_t a1, void *a2, int a3, void *a4)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D8231EA8]();
  v11 = (void *)MEMORY[0x1E0CB3940];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An error occurred fetching changes: %@"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    objc_msgSend(v8, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("MoreComing: %@. Server Notification Change Token %@"), v13, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v17 = *(void **)(a1 + 32);
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "writeData:", v18);

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

  objc_autoreleasePoolPop(v10);
}

- (BOOL)_fetchZoneChangesForDatabase:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_semaphore_t v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  dispatch_time_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  BOOL v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *context;
  void *v64;
  _QWORD v65[4];
  id v66;
  NSObject *v67;
  _QWORD v68[4];
  id v69;
  _BYTE *v70;
  uint64_t *v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  _BYTE buf[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  __int128 v86;
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  const __CFString *v90;
  uint64_t v91;
  uint8_t v92[8];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v61 = v9;
  v55 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: database", buf, 2u);
    }

    if (!a5)
      goto LABEL_17;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("database"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v54 = 0;
    *a5 = v19;
    goto LABEL_30;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outputURL", buf, 2u);
    }

    if (!a5)
      goto LABEL_17;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("outputURL"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (-[RTPersistenceMirroringManager exceedingMemoryThreshold](self, "exceedingMemoryThreshold"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      v85 = v15;
      LOWORD(v86) = 2048;
      *(_QWORD *)((char *)&v86 + 2) = 15;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, deferring attempt to fetch zone changes; exceeding memory threshold, current footprint, %.4f MB, footpri"
        "nt threshold, %lu MB",
        buf,
        0x2Au);

    }
    if (a5)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v89 = *MEMORY[0x1E0CB2D50];
      v90 = CFSTR("routined exceeding persistence mirroring manager's memory threshold for fetching zone changes.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_17:
    v54 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v55, "URLByAppendingPathComponent:", CFSTR("zone-changes.txt"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "createFileAtPath:contents:attributes:", v22, 0, 0);

  v23 = (void *)MEMORY[0x1E0CB3608];
  objc_msgSend(v53, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fileHandleForWritingAtPath:", v24);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v60 != 0;
  if (v60)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v85 = __Block_byref_object_copy__27;
    *(_QWORD *)&v86 = __Block_byref_object_dispose__27;
    *((_QWORD *)&v86 + 1) = 0;
    v77 = 0;
    v78 = &v77;
    v79 = 0x2020000000;
    v80 = 0;
    v59 = *MEMORY[0x1E0C94730];
    v56 = *MEMORY[0x1E0D18598];
    v57 = *MEMORY[0x1E0CB2D50];
    do
    {
      context = (void *)MEMORY[0x1D8231EA8]();
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("com.apple.coredata.cloudkit.zone"), v59);
      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "setPreviousServerChangeToken:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      objc_msgSend(v25, "setFetchNewestChangesFirst:", 0);
      objc_msgSend(v25, "setResultsLimit:", 1024);
      v26 = objc_alloc(MEMORY[0x1E0C94DE8]);
      v83 = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v64;
      v82 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v26, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v27, v28);

      objc_msgSend(v29, "setFetchAllChanges:", 0);
      v30 = (void *)objc_opt_new();
      v31 = dispatch_semaphore_create(0);
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke;
      v74[3] = &unk_1E929A4C0;
      v62 = v30;
      v75 = v62;
      v32 = v60;
      v76 = v32;
      objc_msgSend(v29, "setRecordWasChangedBlock:", v74);
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_200;
      v72[3] = &unk_1E929A4E8;
      v33 = v32;
      v73 = v33;
      objc_msgSend(v29, "setRecordWithIDWasDeletedBlock:", v72);
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_204;
      v68[3] = &unk_1E929A510;
      v34 = v33;
      v69 = v34;
      v70 = buf;
      v71 = &v77;
      objc_msgSend(v29, "setRecordZoneFetchCompletionBlock:", v68);
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_208;
      v65[3] = &unk_1E929A538;
      v58 = v34;
      v66 = v58;
      v35 = v31;
      v67 = v35;
      objc_msgSend(v29, "setFetchRecordZoneChangesCompletionBlock:", v65);
      objc_msgSend(v61, "addOperation:", v29);
      v36 = v35;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v36, v38))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "timeIntervalSinceDate:", v37);
        v41 = v40;
        v42 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_22);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "filteredArrayUsingPredicate:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "submitToCoreAnalytics:type:duration:", v46, 1, v41);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v92 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
        }

        v48 = (void *)MEMORY[0x1E0CB35C8];
        v91 = v57;
        *(_QWORD *)v92 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, &v91, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", v56, 15, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
      }

      objc_autoreleasePoolPop(context);
    }
    while (*((_BYTE *)v78 + 24));
    objc_msgSend(v58, "closeFile");
    _Block_object_dispose(&v77, 8);
    _Block_object_dispose(buf, 8);

  }
  else if (a5)
  {
    v87 = *MEMORY[0x1E0CB2D50];
    v88 = CFSTR("Could not open file descriptor to write diagnostics.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v51);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_30:

  return v54;
}

void __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu %@"), objc_msgSend(*(id *)(a1 + 32), "count"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v13 = *(void **)(a1 + 40);
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "writeData:", v14);

  objc_autoreleasePoolPop(v10);
}

void __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RecordDeleted: %@ (%@)"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "writeData:", v11);

  objc_autoreleasePoolPop(v7);
}

void __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_204(_QWORD *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  context = (void *)MEMORY[0x1D8231EA8]();
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Client Change Token %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v16;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    v18 = (void *)a1[4];
    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "writeData:", v19);

  }
  v20 = (void *)MEMORY[0x1E0CB3940];
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An error occurred fetching changes: %@"), v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  else
  {
    if (a5)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    objc_msgSend(v11, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("MoreComing: %@. Server Notification Change Token %@"), v23, v25, context, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }

  v26 = (void *)a1[4];
  objc_msgSend(v21, "dataUsingEncoding:", 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "writeData:", v27);

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a5;
  objc_autoreleasePoolPop(context);

}

void __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_208(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D8231EA8]();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An error occurred fetching changes: %@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v8);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_autoreleasePoolPop(v4);

}

- (void)onMirroringDelegateInitialization:(id)a3
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
  v7[2] = __67__RTPersistenceMirroringManager_onMirroringDelegateInitialization___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __67__RTPersistenceMirroringManager_onMirroringDelegateInitialization___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMirroringDelegateInitialization:", *(_QWORD *)(a1 + 40));
}

- (void)_onMirroringDelegateInitialization:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("RTPersistenceStoreMirroringDelegateDidInitializeNotificationName")))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName"));

    if ((v7 & 1) != 0)
      goto LABEL_6;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 138413058;
      v12 = CFSTR("RTPersistenceStoreMirroringDelegateDidInitializeNotificationName");
      v13 = 2112;
      v14 = CFSTR("RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName");
      v15 = 2080;
      v16 = "-[RTPersistenceMirroringManager _onMirroringDelegateInitialization:]";
      v17 = 1024;
      v18 = 1815;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "notification name is not %@ or %@ (in %s:%d)", (uint8_t *)&v11, 0x26u);
    }
  }

LABEL_6:
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("RTPersistenceStoreMirroringDelegateDidInitializeNotificationName")))
  {

LABEL_9:
    -[RTPersistenceMirroringManager _updateMirroringDelegateState](self, "_updateMirroringDelegateState");
    goto LABEL_10;
  }
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName"));

  if (v10)
    goto LABEL_9;
LABEL_10:

}

- (id)changeCountForManagedObjectContext:(id)a3 currentExporterToken:(id)a4 changeRequestError:(id *)a5
{
  id v9;
  id v10;
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
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0C97BD8];
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterToken:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchHistoryAfterDate:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "setResultType:", 6);
  objc_msgSend(v9, "persistentStoreCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "persistenceStoreForType:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistentStoreForURL:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAffectedStores:", v19);

  objc_msgSend(v12, "setFetchBatchSize:", 1024);
  v28 = 0;
  objc_msgSend(v9, "executeRequest:error:", v12, &v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v28;
  if (v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v21;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "error while querying persistent history, %@", buf, 0xCu);
    }

    if (!a5)
    {
      v24 = 0;
      goto LABEL_14;
    }
    v23 = objc_retainAutorelease(v21);
    v24 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v20, "result");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v30 = v26;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v24;
    v35 = 2112;
    v36 = 0;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, request, %@, change count, %@, error, %@", buf, 0x2Au);

  }
  if (a5)
LABEL_12:
    *a5 = v21;
LABEL_14:

  return v24;
}

- (BOOL)_shouldResetForChangeCountForManagedObjectContext:(id)a3 currentExporterToken:(id)a4 changeRequestError:(id *)a5
{
  void *v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  -[RTPersistenceMirroringManager changeCountForManagedObjectContext:currentExporterToken:changeRequestError:](self, "changeCountForManagedObjectContext:currentExporterToken:changeRequestError:", a3, a4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "error while querying persistent history, %@", buf, 0xCu);
    }

    v10 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v8);
  }
  else
  {
    v10 = -[RTPersistenceMirroringManager _calculateStoreShouldResetFromChangeHistoryCount:](self, "_calculateStoreShouldResetFromChangeHistoryCount:", objc_msgSend(v7, "integerValue"));
  }

  return v10;
}

- (void)fetchDiagnosticLogsWithHandler:(id)a3
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
  v7[2] = __64__RTPersistenceMirroringManager_fetchDiagnosticLogsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__RTPersistenceMirroringManager_fetchDiagnosticLogsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(*(id *)(a1 + 32), "_dataAvailableToMirror"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("persistence manager, available, %@, mirroring delegate state, %ld\n"), v3, objc_msgSend(*(id *)(a1 + 32), "_mirroringDelegateState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

  if ((objc_msgSend(*(id *)(a1 + 32), "_dataAvailableToMirror") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistenceContextWithOptions:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__RTPersistenceMirroringManager_fetchDiagnosticLogsWithHandler___block_invoke_2;
    v9[3] = &unk_1E9299D78;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v11 = v8;
    v7 = v6;
    objc_msgSend(v7, "performBlockAndWait:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __64__RTPersistenceMirroringManager_fetchDiagnosticLogsWithHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  id obj;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  void *context;
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  id v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "latestModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitiesByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v72 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
  if (v72)
  {
    v71 = *(_QWORD *)v84;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v84 != v71)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1D8231EA8]();
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v7 = objc_msgSend(&unk_1E932C118, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
        v8 = a1;
        v74 = v5;
        if (v7)
        {
          v9 = *(_QWORD *)v80;
          while (2)
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v80 != v9)
                objc_enumerationMutation(&unk_1E932C118);
              v11 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
              objc_msgSend(v6, "attributesByName");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKey:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                v18 = v11;
                if (v18)
                {
                  v19 = v18;
                  v20 = objc_alloc(MEMORY[0x1E0C97B48]);
                  objc_msgSend(v6, "managedObjectClassName");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = (void *)objc_msgSend(v20, "initWithEntityName:", v21);

                  objc_msgSend(v22, "setResultType:", 2);
                  v70 = v19;
                  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v19);
                  v23 = objc_claimAutoreleasedReturnValue();
                  v24 = objc_alloc_init(MEMORY[0x1E0C97B30]);
                  objc_msgSend(v24, "setName:", CFSTR("firstDate"));
                  v25 = (void *)MEMORY[0x1E0CB35D0];
                  v69 = (void *)v23;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v23);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "expressionForFunction:arguments:", CFSTR("min:"), v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setExpression:", v27);

                  objc_msgSend(v24, "setExpressionResultType:", 900);
                  v28 = objc_alloc_init(MEMORY[0x1E0C97B30]);
                  objc_msgSend(v28, "setName:", CFSTR("lastDate"));
                  v29 = (void *)MEMORY[0x1E0CB35D0];
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v23);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "expressionForFunction:arguments:", CFSTR("max:"), v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setExpression:", v31);

                  objc_msgSend(v28, "setExpressionResultType:", 900);
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v24, v28, 0);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setPropertiesToFetch:", v32);

                  objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v22, 0);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "lastObject");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "valueForKey:", CFSTR("firstDate"));
                  v35 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v33, "lastObject");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "valueForKey:", CFSTR("lastDate"));
                  v15 = (void *)objc_claimAutoreleasedReturnValue();

                  v14 = (void *)v35;
                  v17 = 0;
                  if (v35 && v15)
                  {
                    v37 = objc_alloc(MEMORY[0x1E0C97B48]);
                    objc_msgSend(v6, "managedObjectClassName");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = (void *)objc_msgSend(v37, "initWithEntityName:", v38);

                    v8 = a1;
                    v7 = objc_msgSend(*(id *)(a1 + 40), "countForFetchRequest:error:", v39, 0);
                    objc_msgSend(v6, "attributesByName");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "valueForKey:", CFSTR("flags"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v41)
                    {
                      +[RTCloudManagedObject tombstonedPredicate](RTCloudManagedObject, "tombstonedPredicate");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "setPredicate:", v42);

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "countForFetchRequest:error:", v39, 0));
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v17 = 0;
                    }

                  }
                  else
                  {
                    v7 = 0;
                    v8 = a1;
                  }
                  v16 = v70;
                }
                else
                {
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  v7 = 0;
                }
                goto LABEL_25;
              }
            }
            v7 = objc_msgSend(&unk_1E932C118, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
            if (v7)
              continue;
            break;
          }
        }
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
LABEL_25:
        v43 = *(void **)(v8 + 48);
        v44 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringFromDate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringFromDate");
        v48 = v14;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", CFSTR("%@ count, %@, tombstoneCount, %@, firstInsertDate, %@, lastInsertDate, %@"), v45, v46, v17, v47, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v50);

        objc_autoreleasePoolPop(context);
        v5 = v74 + 1;
      }
      while (v74 + 1 != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
    }
    while (v72);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "_mirroringDelegateState") == 1)
  {
    v51 = *(void **)(a1 + 32);
    v52 = *(_QWORD *)(a1 + 40);
    v78 = 0;
    objc_msgSend(v51, "changeCountForManagedObjectContext:currentExporterToken:changeRequestError:", v52, 0, &v78);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v78;
    if (!v54)
    {
      v55 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Change count, %@"), v53);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v56);

    }
    v57 = *(void **)(a1 + 32);
    v58 = *(_QWORD *)(a1 + 40);
    v77 = 0;
    objc_msgSend(v57, "currentExporterTokenWithManagedObjectContext:error:", v58, &v77);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v77;
    objc_msgSend(v57, "transactionHistoryCountRequestWithManagedObjectContext:currentExporterToken:", v58, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v60)
    {
      v62 = *(void **)(a1 + 40);
      v76 = 0;
      objc_msgSend(v62, "executeRequest:error:", v61, &v76);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v76;
      if (v60)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v60;
          _os_log_error_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_ERROR, "error while querying persistent history, %@", buf, 0xCu);
        }

      }
      objc_msgSend(v63, "result");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transaction count, %@"), v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "addObject:", v67);

    }
  }
}

- (id)currentExporterTokenWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *v34;
  id v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE buf[12];
  __int16 v58;
  id v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v37 = a3;
  objc_msgSend(v37, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = dispatch_semaphore_create(0);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__27;
  v55 = __Block_byref_object_dispose__27;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__27;
  v49 = __Block_byref_object_dispose__27;
  v50 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __84__RTPersistenceMirroringManager_currentExporterTokenWithManagedObjectContext_error___block_invoke;
  v40[3] = &unk_1E929A560;
  v43 = &v45;
  v7 = v5;
  v41 = v7;
  v44 = &v51;
  v8 = v6;
  v42 = v8;
  v38 = (void *)MEMORY[0x1D8232094](v40);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AD8]), "initWithOptions:completionBlock:", 0, v38);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObjectIDsToFetch:", v10);

  v39 = 0;
  objc_msgSend(v37, "executeRequest:error:", v9, &v39);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v39;
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v12);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E0CB35C8];
  v60[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v60, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

    v27 = 0;
  }
  else
  {
LABEL_6:
    v26 = 0;
    v27 = 1;
  }

  v28 = v26;
  if ((v27 & 1) == 0)
  {
    if (a4)
    {
LABEL_18:
      v29 = 0;
      *a4 = objc_retainAutorelease(v36);
      goto LABEL_20;
    }
LABEL_19:
    v29 = 0;
    goto LABEL_20;
  }
  if (!v34 || v36)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v32;
      v58 = 2112;
      v59 = v36;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, encountered error during export progress request, error, %@", buf, 0x16u);

    }
    if (a4)
      goto LABEL_18;
    goto LABEL_19;
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v52[5]);
  v29 = (id)v46[5];
LABEL_20:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v29;
}

void __84__RTPersistenceMirroringManager_currentExporterTokenWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "success"))
  {
    objc_msgSend(v3, "objectIDToLastExportedToken");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v4, "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    objc_msgSend(v3, "error");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "export progress request failed with error, %@", (uint8_t *)&v12, 0xCu);

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)transactionHistoryFetchRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C97BF0];
  v6 = a4;
  objc_msgSend(v5, "entityDescriptionWithContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntityName:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@ && %K == %@"), CFSTR("token"), v6, CFSTR("author"), CFSTR("ExpirationEnforcer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  return v10;
}

- (id)transactionHistoryRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4
{
  void *v4;
  void *v5;

  -[RTPersistenceMirroringManager transactionHistoryFetchRequestWithManagedObjectContext:currentExporterToken:](self, "transactionHistoryFetchRequestWithManagedObjectContext:currentExporterToken:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryWithFetchRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultType:", 3);

  return v5;
}

- (id)transactionHistoryCountRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4
{
  void *v4;
  void *v5;

  -[RTPersistenceMirroringManager transactionHistoryFetchRequestWithManagedObjectContext:currentExporterToken:](self, "transactionHistoryFetchRequestWithManagedObjectContext:currentExporterToken:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryWithFetchRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultType:", 2);

  return v5;
}

- (BOOL)_evaluatePersistentHistoryLengthWithManagedObjectContext:(id)a3 shouldResetSync:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  _QWORD v19[5];
  id v20;
  uint8_t *v21;
  uint64_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t v33[4];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a5)
  {
    if (v8)
    {
      if (a4)
      {
        v29 = 0;
        v30 = &v29;
        v31 = 0x2020000000;
        v32 = 0;
        if (-[RTPersistenceMirroringManager _mirroringDelegateState](self, "_mirroringDelegateState") == 1)
        {
          *(_QWORD *)buf = 0;
          v24 = buf;
          v25 = 0x3032000000;
          v26 = __Block_byref_object_copy__27;
          v27 = __Block_byref_object_dispose__27;
          v28 = 0;
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __112__RTPersistenceMirroringManager__evaluatePersistentHistoryLengthWithManagedObjectContext_shouldResetSync_error___block_invoke;
          v19[3] = &unk_1E929A588;
          v19[4] = self;
          v20 = v9;
          v21 = buf;
          v22 = &v29;
          objc_msgSend(v20, "performBlockAndWait:", v19);
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v18 = *((unsigned __int8 *)v30 + 24);
            *(_DWORD *)v33 = 67109120;
            v34 = v18;
            _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "calculated value for shouldResetSync: %d", v33, 8u);
          }

          *a4 = *((_BYTE *)v30 + 24);
          *a5 = objc_retainAutorelease(*((id *)v24 + 5));
          v11 = *((_QWORD *)v24 + 5) == 0;

          _Block_object_dispose(buf, 8);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "mirroring delegate not ready to evaluate export progress, skipping.", buf, 2u);
          }

          *a4 = *((_BYTE *)v30 + 24);
          v11 = 1;
        }
        _Block_object_dispose(&v29, 8);
        goto LABEL_22;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: shouldResetSync != NULL", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("shouldResetSync != NULL"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("managedObjectContext"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0;
    *a5 = v14;
    goto LABEL_22;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v11 = 0;
LABEL_22:

  return v11;
}

void __112__RTPersistenceMirroringManager__evaluatePersistentHistoryLengthWithManagedObjectContext_shouldResetSync_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  id v16;
  id obj;
  uint8_t buf[4];
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "currentExporterTokenWithManagedObjectContext:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionHistoryRequestWithManagedObjectContext:currentExporterToken:", *(_QWORD *)(a1 + 40), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v16 = 0;
    objc_msgSend(v7, "executeRequest:error:", v6, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (v9)
    {
      v10 = v9;
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v10;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "error while querying persistent history, %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v8, "result");
      v11 = objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_calculateStoreShouldResetFromTransactionHistory:", v11);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v10 = 0;
      }
      else
      {
        v12 = *(void **)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v15 = 0;
        v14 = objc_msgSend(v12, "_shouldResetForChangeCountForManagedObjectContext:currentExporterToken:changeRequestError:", v13, v5, &v15);
        v10 = v15;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;
      }
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "current exporter token is nil, shouldReset, NO", buf, 2u);
    }
  }

}

- (BOOL)_calculateStoreShouldResetFromChangeHistoryCount:(unint64_t)a3
{
  unint64_t v3;
  id WeakRetained;

  v3 = a3 >> 4;
  if (a3 >> 4 >= 0x271)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "mirroringManager:exceededHistoryType:count:limit:", self, 1, a3, 10000);

  }
  return v3 > 0x270;
}

- (BOOL)_calculateStoreShouldResetFromTransactionHistory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  id WeakRetained;
  RTPersistenceMirroringManager *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  NSObject *v29;
  __int16 v30;
  NSObject *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v7)
    {
      v8 = v7;
      v22 = self;
      v23 = v4;
      v9 = 0;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v6);
          v9 = ((char *)v9 + 1);
          if ((unint64_t)v9 >= 0x19)
          {
            WeakRetained = objc_loadWeakRetained((id *)&v22->_metricsDelegate);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(WeakRetained, "mirroringManager:exceededHistoryType:count:limit:", v22, 2, v9, 25);

            v19 = 1;
            goto LABEL_20;
          }
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "timestamp");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isOnOrAfter:", v5);

          if (v14)
          {
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v29 = v9;
              _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "Reset reset-sync window transaction count %lu", buf, 0xCu);
            }

            v16 = v5;
            objc_msgSend(v12, "timestamp");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "dateByAddingTimeInterval:", 86400.0);
            v5 = objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v5;
              v30 = 2112;
              v31 = v16;
              _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "Reset reset-sync window, new window, %@, old window, %@", buf, 0x16u);
            }

            v9 = 0;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v8)
          continue;
        break;
      }
      v19 = 0;
LABEL_20:
      v4 = v23;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "export progress request had no results", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (RTPersistenceMirroringMetricsDelegate)metricsDelegate
{
  return (RTPersistenceMirroringMetricsDelegate *)objc_loadWeakRetained((id *)&self->_metricsDelegate);
}

- (void)setMetricsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_metricsDelegate, a3);
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (NSMutableDictionary)mirroringPolicies
{
  return self->_mirroringPolicies;
}

- (void)setMirroringPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_mirroringPolicies, a3);
}

- (NSMutableDictionary)retryTimers
{
  return self->_retryTimers;
}

- (void)setRetryTimers:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimers, a3);
}

- (NSMutableArray)pendingMirroringRequests
{
  return self->_pendingMirroringRequests;
}

- (void)setPendingMirroringRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMirroringRequests, a3);
}

- (RTPersistenceMirroringRequest)activeMirroringRequest
{
  return self->_activeMirroringRequest;
}

- (void)setActiveMirroringRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activeMirroringRequest, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (RTPersistenceCloudDeletionEnforcer)persistenceCloudDeletionEnforcer
{
  return self->_persistenceCloudDeletionEnforcer;
}

- (void)setPersistenceCloudDeletionEnforcer:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceCloudDeletionEnforcer, a3);
}

- (RTPersistenceExpirationEnforcer)persistenceExpirationEnforcer
{
  return self->_persistenceExpirationEnforcer;
}

- (void)setPersistenceExpirationEnforcer:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceExpirationEnforcer, a3);
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (BOOL)exportingAvailable
{
  return self->_exportingAvailable;
}

- (void)setExportingAvailable:(BOOL)a3
{
  self->_exportingAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_persistenceExpirationEnforcer, 0);
  objc_storeStrong((id *)&self->_persistenceCloudDeletionEnforcer, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_activeMirroringRequest, 0);
  objc_storeStrong((id *)&self->_pendingMirroringRequests, 0);
  objc_storeStrong((id *)&self->_retryTimers, 0);
  objc_storeStrong((id *)&self->_mirroringPolicies, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_destroyWeak((id *)&self->_metricsDelegate);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

- (void)mirroringManager:(id)a3 mirroringRequestDidSucceed:(id)a4
{
  -[RTPersistenceMirroringManager collectMetricsFromMirroringRequest:error:](self, "collectMetricsFromMirroringRequest:error:", a4, 0);
}

- (void)mirroringManager:(id)a3 mirroringRequest:(id)a4 didFailWithError:(id)a5
{
  -[RTPersistenceMirroringManager collectMetricsFromMirroringRequest:error:](self, "collectMetricsFromMirroringRequest:error:", a4, a5);
}

- (void)collectMetricsFromMirroringRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  RTPersistenceMirroringManager *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", -4838400.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResultType:", 5);
  objc_msgSend(v10, "setFetchLimit:", 5);
  -[RTPersistenceMirroringManager persistenceManager](self, "persistenceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__RTPersistenceMirroringManager_Metrics__collectMetricsFromMirroringRequest_error___block_invoke;
  v15[3] = &unk_1E929BF78;
  v16 = v10;
  v17 = v6;
  v18 = v7;
  v19 = self;
  v12 = v7;
  v13 = v6;
  v14 = v10;
  objc_msgSend(v11, "createManagedObjectContext:", v15);

}

void __83__RTPersistenceMirroringManager_Metrics__collectMetricsFromMirroringRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__RTPersistenceMirroringManager_Metrics__collectMetricsFromMirroringRequest_error___block_invoke_2;
  v7[3] = &unk_1E929BF50;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v11 = v4;
  v12 = v5;
  v6 = v3;
  objc_msgSend(v6, "performBlock:", v7);

}

void __83__RTPersistenceMirroringManager_Metrics__collectMetricsFromMirroringRequest_error___block_invoke_2(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t j;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *context;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = 0;
  v2 = 0;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v3 = a1[4];
    v4 = a1[5];
    v67 = 0;
    objc_msgSend(v3, "executeRequest:error:", v4, &v67);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v67;
    v51 = v5;
    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v6;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "error while fetching history, %@", buf, 0xCu);
      }
LABEL_23:

      v21 = 0;
      v52 = 0;
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v71 = v23;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "error while fetching history; unexpected result class, %@",
          buf,
          0xCu);

      }
      goto LABEL_23;
    }
    v48 = v5;
    objc_msgSend(v48, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v8, "count");
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (!v10)
      goto LABEL_20;
    v11 = v10;
    v12 = *(_QWORD *)v64;
    v53 = v9;
    v54 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v64 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
          objc_msgSend(v15, "changes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v1 += (int)objc_msgSend(v16, "count");

          objc_msgSend(v15, "author");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "containsString:", CFSTR("NSCloudKitMirroringDelegate")))
            goto LABEL_15;
          v57 = v1;
          objc_msgSend(v15, "timestamp");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "enqueueDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isBeforeDate:", v19);

          if (v20)
          {
            objc_msgSend(v15, "timestamp");
            v1 = 0;
            v12 = v54;
            v17 = v55;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v53;
LABEL_15:

          }
          else
          {
            v1 = v57;
            v9 = v53;
            v12 = v54;
          }
          ++v2;

          continue;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v11);
LABEL_20:

    objc_msgSend(a1[5], "setFetchOffset:", objc_msgSend(a1[5], "fetchOffset") + v52);
    objc_msgSend(a1[4], "reset");
    v21 = 1;
    v6 = 0;
LABEL_24:

    objc_autoreleasePoolPop(context);
  }
  while (v21 && !v6 && v52);
  if (v2)
  {
    objc_msgSend(a1[7], "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[7], "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D18598]))
    {
      v27 = objc_msgSend(a1[7], "code");

      if (v27 == 9)
      {
        v49 = v6;
        objc_msgSend(a1[7], "userInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D18590]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        if (v31)
        {
          v32 = v31;
          v58 = v25;
          v33 = *(_QWORD *)v60;
          do
          {
            v34 = v30;
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v60 != v33)
                objc_enumerationMutation(v34);
              objc_msgSend(a1[8], "persistenceOperationMetricWithMirroringRequest:lastMirroringTransactionDate:recordsChanged:error:", a1[6], v55, v1, *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_alloc(MEMORY[0x1E0CB3940]);
              v38 = v1;
              v39 = (void *)objc_msgSend(v37, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringOperation, 1);
              log_analytics_submission(v39, v36);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              AnalyticsSendEvent();

              v1 = v38;
            }
            v30 = v34;
            v32 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          }
          while (v32);
          v41 = v34;
          v6 = v49;
          v25 = v58;
        }
        else
        {
          v41 = v30;
        }
        goto LABEL_42;
      }
    }
    else
    {

    }
    if (v25)
    {
      objc_msgSend(a1[8], "persistenceOperationMetricWithMirroringRequest:lastMirroringTransactionDate:recordsChanged:error:", a1[6], v55, v1, v25);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_alloc(MEMORY[0x1E0CB3940]);
      v44 = (void *)objc_msgSend(v43, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringOperation, 1);
      log_analytics_submission(v44, v42);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

    }
    objc_msgSend(a1[8], "persistenceOperationMetricWithMirroringRequest:lastMirroringTransactionDate:recordsChanged:error:", a1[6], v55, v1, a1[7]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_alloc(MEMORY[0x1E0CB3940]);
    v30 = (id)objc_msgSend(v46, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringOperation, 1);
    log_analytics_submission(v30, v41);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v30);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

LABEL_42:
  }

}

- (id)persistenceOperationMetricWithMirroringRequest:(id)a3 lastMirroringTransactionDate:(id)a4 recordsChanged:(unint64_t)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
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

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "mirroringPolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "qualityOfService"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("qualityOfService"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "requestType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("requestType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("recordsChanged"));

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v10, "isEqualToDate:", v18);

  if ((_DWORD)v16)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E932CF60, CFSTR("timeIntervalSinceLastOperation"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v19, "timeIntervalSinceDate:", v10);
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("timeIntervalSinceLastOperation"));

  }
  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "duration");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("durationOfOperation"));

  if (v11)
  {
    objc_msgSend(v11, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "code"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("errorCode"));

  }
  return v12;
}

- (void)mirroringManager:(id)a3 exceededHistoryType:(unint64_t)a4 count:(unint64_t)a5 limit:(unint64_t)a6
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("limit"));

  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = (void *)objc_msgSend(v12, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringHistoryLimitExceeded, 1);
  log_analytics_submission(v13, v15);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

@end
