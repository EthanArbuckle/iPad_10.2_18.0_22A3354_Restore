@implementation SMInitiatorCacheManager

- (SMInitiatorCacheManager)initWithInitiatorContact:(id)a3 loadedFromDisk:(BOOL)a4 safetyCacheStore:(id)a5 sessionStore:(id)a6 defaultsManager:(id)a7 locationManager:(id)a8 queue:(id)a9 batteryManager:(id)a10 xpcActivityManager:(id)a11 messagingService:(id)a12 networkOfInterestManager:(id)a13 authorizationManager:(id)a14 wristStateManager:(id)a15 vehicleLocationProvider:(id)a16 activeSessionDetailsZone:(id)a17 healthKitManager:(id)a18 platform:(id)a19
{
  id v23;
  id v24;
  void *v25;
  SMInitiatorCacheManager *v26;
  SMInitiatorCacheManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  char *v32;
  objc_class *v33;
  char *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  double v38;
  NSObject *v39;
  double cacheUpdateBackstopTimeout;
  SMMessagingService *messagingService;
  void *v42;
  SMInitiatorCacheManager *v43;
  SMInitiatorCacheManager *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  NSObject *v53;
  char *v54;
  objc_class *v55;
  char *v56;
  void *v57;
  id v60;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  _QWORD block[4];
  SMInitiatorCacheManager *v79;
  objc_super v80;
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  double v88;
  __int16 v89;
  const __CFString *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v60 = a5;
  v23 = a5;
  v76 = a6;
  v75 = a7;
  v74 = a8;
  v73 = a9;
  v66 = a10;
  v72 = a11;
  v71 = a12;
  v70 = a13;
  v69 = a14;
  v65 = a15;
  v64 = a16;
  v63 = a17;
  v68 = a18;
  v24 = a19;
  v67 = v24;
  if (!v77)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: initiatorContact";
LABEL_50:
    _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, v51, buf, 2u);
    goto LABEL_51;
  }
  if (!v23)
  {
    v25 = 0;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: safetyCacheStore";
    goto LABEL_50;
  }
  if (!v76)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_50;
  }
  if (!v75)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_50;
  }
  if (!v74)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_50;
  }
  if (!v73)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: queue";
    goto LABEL_50;
  }
  if (!v72)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: xpcActivityManager";
    goto LABEL_50;
  }
  if (!v71)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: messagingService";
    goto LABEL_50;
  }
  if (!v70)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: networkOfInterestManager";
    goto LABEL_50;
  }
  if (!v69)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: authorizationManager";
    goto LABEL_50;
  }
  if (!v68)
  {
    v25 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v51 = "Invalid parameter not satisfying: healthKitManager";
      goto LABEL_50;
    }
LABEL_51:

    v44 = 0;
    v45 = v77;
    v47 = v65;
    v46 = v66;
    v49 = v63;
    v48 = v64;
LABEL_52:
    v43 = self;
    goto LABEL_53;
  }
  v25 = v23;
  if (!v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v53 = objc_claimAutoreleasedReturnValue();
    v45 = v77;
    v47 = v65;
    v46 = v66;
    v49 = v63;
    v48 = v64;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", buf, 2u);
    }

    v44 = 0;
    goto LABEL_52;
  }
  v80.receiver = self;
  v80.super_class = (Class)SMInitiatorCacheManager;
  v26 = -[SMInitiatorCacheManager init](&v80, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_initiatorContact, a3);
    v27->_initiatorContactStored = a4;
    objc_storeStrong((id *)&v27->_safetyCacheStore, v60);
    objc_storeStrong((id *)&v27->_sessionStore, a6);
    objc_storeStrong((id *)&v27->_defaultsManager, a7);
    objc_storeStrong((id *)&v27->_locationManager, a8);
    objc_storeStrong((id *)&v27->_batteryManager, a10);
    objc_storeStrong((id *)&v27->_queue, a9);
    objc_storeStrong((id *)&v27->_xpcActivityManager, a11);
    objc_storeStrong((id *)&v27->_messagingService, a12);
    objc_storeStrong((id *)&v27->_networkOfInterestManager, a13);
    objc_storeStrong((id *)&v27->_authorizationManager, a14);
    v27->_initiatorEligibility = 0;
    v27->_receiverEligibility = 0;
    objc_storeStrong((id *)&v27->_wristStateManager, a15);
    objc_storeStrong((id *)&v27->_vehicleLocationProvider, a16);
    objc_storeStrong((id *)&v27->_activeSessionDetailsZone, a17);
    objc_storeStrong((id *)&v27->_healthKitManager, a18);
    objc_storeStrong((id *)&v27->_platform, a19);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[SMInitiatorContact sessionUUID](v27->_initiatorContact, "sessionUUID");
      v54 = (char *)objc_claimAutoreleasedReturnValue();
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v82 = v54;
      v83 = 2112;
      v84 = v56;
      v85 = 2112;
      v86 = (uint64_t)v57;
      _os_log_debug_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,created SMInitiatorCacheManager", buf, 0x20u);

    }
    if (!v27->_initiatorContactStored)
      -[SMInitiatorCacheManager _updateInitiatorContactInStore](v27, "_updateInitiatorContactInStore");
    -[SMInitiatorCacheManager initiatorContact](v27, "initiatorContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "shouldBeCleanedUpDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](v27, "sessionUUID");
        v32 = (char *)objc_claimAutoreleasedReturnValue();
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v82 = v32;
        v83 = 2112;
        v84 = v34;
        v85 = 2112;
        v86 = (uint64_t)v35;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,SMInitiatorCacheManager should be cleaned up", buf, 0x20u);

      }
      -[SMInitiatorCacheManager queue](v27, "queue");
      v36 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __325__SMInitiatorCacheManager_initWithInitiatorContact_loadedFromDisk_safetyCacheStore_sessionStore_defaultsManager_locationManager_queue_batteryManager_xpcActivityManager_messagingService_networkOfInterestManager_authorizationManager_wristStateManager_vehicleLocationProvider_activeSessionDetailsZone_healthKitManager_platform___block_invoke;
      block[3] = &unk_1E92977B8;
      v79 = v27;
      dispatch_async(v36, block);

    }
    -[RTDefaultsManager objectForKey:value:](v27->_defaultsManager, "objectForKey:value:", CFSTR("RTDefaultsSMDefaultCacheUpdateBackstopTimeout"), &unk_1E932D000);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v27->_cacheUpdateBackstopTimeout = v38;

    if (v27->_cacheUpdateBackstopTimeout != 900.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        cacheUpdateBackstopTimeout = v27->_cacheUpdateBackstopTimeout;
        *(_DWORD *)buf = 136316162;
        v82 = "-[SMInitiatorCacheManager initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsMa"
              "nager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:au"
              "thorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:]";
        v83 = 2080;
        v84 = "overriding cache backstop timeouts";
        v85 = 2048;
        v86 = 0x408C200000000000;
        v87 = 2048;
        v88 = cacheUpdateBackstopTimeout;
        v89 = 2112;
        v90 = CFSTR("RTDefaultsSMDefaultCacheUpdateBackstopTimeout");
        _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }

    }
    -[SMInitiatorCacheManager _setupActiveSessionZone](v27, "_setupActiveSessionZone");
    messagingService = v27->_messagingService;
    +[RTNotification notificationName](SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification, "notificationName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](messagingService, "addObserver:selector:name:", v27, sel_onNearbyEffectivePairedDeviceChangedNotification_, v42);

  }
  v43 = v27;
  v44 = v43;
  v45 = v77;
  v47 = v65;
  v46 = v66;
  v49 = v63;
  v48 = v64;
LABEL_53:

  return v44;
}

uint64_t __325__SMInitiatorCacheManager_initWithInitiatorContact_loadedFromDisk_safetyCacheStore_sessionStore_defaultsManager_locationManager_queue_batteryManager_xpcActivityManager_messagingService_networkOfInterestManager_authorizationManager_wristStateManager_vehicleLocationProvider_activeSessionDetailsZone_healthKitManager_platform___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpInitiatorContact");
}

- (SMInitiatorCacheManager)initWithSafetyCacheStore:(id)a3 sessionStore:(id)a4 defaultsManager:(id)a5 locationManager:(id)a6 queue:(id)a7 batteryManager:(id)a8 xpcActivityManager:(id)a9 messagingService:(id)a10 networkOfInterestManager:(id)a11 authorizationManager:(id)a12 sessionID:(id)a13 wristStateManager:(id)a14 vehicleLocationProvider:(id)a15 conversation:(id)a16 activeSessionDetailsZone:(id)a17 healthKitManager:(id)a18 platform:(id)a19
{
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  objc_class *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  SMInitiatorCacheManager *v43;
  id v45;
  id v47;
  id v49;
  id v51;
  id v53;
  id v55;

  v31 = (objc_class *)MEMORY[0x1E0D8B968];
  v41 = a19;
  v40 = a18;
  v39 = a17;
  v33 = a16;
  v38 = a15;
  v37 = a14;
  v19 = a13;
  v36 = a12;
  v35 = a11;
  v32 = a10;
  v34 = a9;
  v45 = a8;
  v55 = a7;
  v53 = a6;
  v51 = a5;
  v49 = a4;
  v47 = a3;
  v20 = [v31 alloc];
  v21 = (void *)objc_opt_new();
  +[SMCryptoUtilities createSafetyCacheKey](SMCryptoUtilities, "createSafetyCacheKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMCryptoUtilities createAllowReadToken](SMCryptoUtilities, "createAllowReadToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_opt_new();
  LOBYTE(v30) = 1;
  LOWORD(v29) = 0;
  v27 = (void *)objc_msgSend(v20, "initWithIdentifier:conversation:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:", v21, v33, 0, 0, 0, 0, -1.0, -1.0, -1.0,
                  0,
                  0,
                  0,
                  v19,
                  v22,
                  v23,
                  v25,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  -1,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  v29,
                  0,
                  0,
                  v30,
                  0,
                  v26,
                  0,
                  0,
                  0,
                  0);

  v43 = -[SMInitiatorCacheManager initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:](self, "initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:", v27, 0, v47, v49, v51, v53, v55, v45, v34, v32, v35, v36, v37, v38, v39,
          v40,
          v41);

  return v43;
}

- (NSUUID)sessionUUID
{
  void *v2;
  void *v3;

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isActiveDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager messagingService](self, "messagingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (BOOL)isCellularActivated
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  BOOL v23;
  objc_class *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  intptr_t (*v30)(uint64_t, char, uint64_t);
  void *v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE buf[12];
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v2 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __46__SMInitiatorCacheManager_isCellularActivated__block_invoke;
  v31 = &unk_1E929F3E8;
  v33 = &v34;
  v4 = v2;
  v32 = v4;
  +[SMInitiatorEligibility checkCellularEnabledWithQueue:handler:](SMInitiatorEligibility, "checkCellularEnabledWithQueue:handler:", v3, &v28);

  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v28, v29, v30, v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(v5, v7))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v10 = v9;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_812);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredArrayUsingPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "submitToCoreAnalytics:type:duration:", v15, 1, v10);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: safetyCacheStore", buf, 2u);
  }

  v17 = (void *)MEMORY[0x1E0CB35C8];
  v43[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v43, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_retainAutorelease(v19);

  }
  else
  {
LABEL_6:
    v20 = 0;
  }

  v21 = v20;
  if (v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v26;
      v39 = 2080;
      v40 = "-[SMInitiatorCacheManager isCellularActivated]";
      v41 = 2112;
      v42 = v27;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@,%s,sema error,%@", buf, 0x20u);

    }
  }
  v23 = *((_BYTE *)v35 + 24) != 0;

  _Block_object_dispose(&v34, 8);
  return v23;
}

intptr_t __46__SMInitiatorCacheManager_isCellularActivated__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isStandalone
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D8B928]);
  -[SMInitiatorCacheManager queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);

  LOBYTE(v4) = objc_msgSend(v5, "isEffectivePairedDeviceNearby") ^ 1;
  return (char)v4;
}

- (void)notifyObserversSafetyCacheDidUpdate
{
  NSObject *v4;
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
  objc_class *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v15;
    v21 = 2112;
    v22 = v17;
    v23 = 2112;
    v24 = v18;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sending safety cache update to observers", (uint8_t *)&v19, 0x20u);

  }
  -[SMInitiatorCacheManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "watchCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shouldBeCleanedUpDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyReleaseMessageSendDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cacheManagerDidUpdateCacheForSessionID:phoneCache:watchCache:cacheExpiryDate:cacheReleaseDate:", v6, v8, v10, v12, v14);

}

- (void)initializeSessionWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CFAbsoluteTime Current;
  NSObject *v31;
  CFAbsoluteTime v32;
  uint64_t v33;
  NSObject *v34;
  CFAbsoluteTime v35;
  NSObject *v36;
  CFAbsoluteTime v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  objc_class *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  objc_class *v57;
  void *v58;
  void *v59;
  SEL v60;
  _QWORD block[4];
  NSObject *v62;
  SMInitiatorCacheManager *v63;
  _BYTE *v64;
  id v65[3];
  _QWORD v66[4];
  NSObject *v67;
  _BYTE *v68;
  id v69[3];
  _QWORD v70[4];
  NSObject *v71;
  _BYTE *v72;
  _QWORD *v73;
  _QWORD *v74;
  id v75[3];
  _QWORD v76[4];
  NSObject *v77;
  _BYTE *v78;
  _QWORD *v79;
  _QWORD *v80;
  id v81[3];
  id location;
  _QWORD v83[5];
  id v84;
  _QWORD v85[5];
  id v86;
  _BYTE buf[24];
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  _QWORD v94[4];

  v94[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (-[SMInitiatorCacheManager initializationInProgress](self, "initializationInProgress"))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v49 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v48;
        *(_WORD *)&buf[22] = 2112;
        v88 = v49;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initialization already in progress", buf, 0x20u);

      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v52;
        _os_log_fault_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,initialization already in progress", buf, 0x16u);

      }
      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v93 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initialization already in progress"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 22, v10);

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, 0, 0, 0, 0, v11);
    }
    else
    {
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "sessionState");

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 == 10)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v20 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v19;
          *(_WORD *)&buf[22] = 2112;
          v88 = v20;
          _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,starting initialization sequence", buf, 0x20u);

        }
        -[SMInitiatorCacheManager setInitializationInProgress:](self, "setInitializationInProgress:", 1);
        -[SMInitiatorCacheManager setInitializationWasAborted:](self, "setInitializationWasAborted:", 0);
        -[SMInitiatorCacheManager setInitializationCompletionCalled:](self, "setInitializationCompletionCalled:", 0);
        -[SMInitiatorCacheManager setInitializationCompletion:](self, "setInitializationCompletion:", v5);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v88 = __Block_byref_object_copy__81;
        v89 = __Block_byref_object_dispose__81;
        v60 = a2;
        v90 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
        v22 = (void *)MEMORY[0x1E0CB37E8];
        v23 = (void *)MEMORY[0x1E0D8B960];
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "conversation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "receiverHandles");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "primaryHandle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "getSMHandleTypeWithHandle:", v28));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValue:forKey:", v29, CFSTR("receiverHandleType"));

        Current = CFAbsoluteTimeGetCurrent();
        v31 = dispatch_group_create();
        v85[0] = 0;
        v85[1] = v85;
        v85[2] = 0x3032000000;
        v85[3] = __Block_byref_object_copy__81;
        v85[4] = __Block_byref_object_dispose__81;
        v86 = 0;
        v83[0] = 0;
        v83[1] = v83;
        v83[2] = 0x3032000000;
        v83[3] = __Block_byref_object_copy__81;
        v83[4] = __Block_byref_object_dispose__81;
        v84 = 0;
        objc_initWeak(&location, self);
        dispatch_group_enter(v31);
        v32 = CFAbsoluteTimeGetCurrent();
        v33 = MEMORY[0x1E0C809B0];
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke;
        v76[3] = &unk_1E929F410;
        objc_copyWeak(v81, &location);
        v81[1] = *(id *)&v32;
        v81[2] = (id)v60;
        v78 = buf;
        v79 = v85;
        v80 = v83;
        v34 = v31;
        v77 = v34;
        -[SMInitiatorCacheManager _checkInitiatorEligibilityWithCompletion:](self, "_checkInitiatorEligibilityWithCompletion:", v76);
        dispatch_group_enter(v34);
        v35 = CFAbsoluteTimeGetCurrent();
        v70[0] = v33;
        v70[1] = 3221225472;
        v70[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_145;
        v70[3] = &unk_1E929F410;
        objc_copyWeak(v75, &location);
        v75[1] = *(id *)&v35;
        v75[2] = (id)v60;
        v72 = buf;
        v73 = v83;
        v74 = v85;
        v36 = v34;
        v71 = v36;
        -[SMInitiatorCacheManager _checkConversationEligibilityWithCompletion:](self, "_checkConversationEligibilityWithCompletion:", v70);
        dispatch_group_enter(v36);
        v37 = CFAbsoluteTimeGetCurrent();
        v66[0] = v33;
        v66[1] = 3221225472;
        v66[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_152;
        v66[3] = &unk_1E929F438;
        objc_copyWeak(v69, &location);
        v68 = buf;
        v69[1] = *(id *)&v37;
        v69[2] = (id)v60;
        v38 = v36;
        v67 = v38;
        -[SMInitiatorCacheManager _setupShareZoneWithCompletion:](self, "_setupShareZoneWithCompletion:", v66);
        -[SMInitiatorCacheManager queue](self, "queue");
        v39 = objc_claimAutoreleasedReturnValue();
        block[0] = v33;
        block[1] = 3221225472;
        block[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_162;
        block[3] = &unk_1E929F460;
        v62 = v38;
        v40 = v38;
        objc_copyWeak(v65, &location);
        v65[1] = *(id *)&Current;
        v63 = self;
        v64 = buf;
        v65[2] = (id)v60;
        dispatch_group_notify(v40, v39, block);

        objc_destroyWeak(v65);
        objc_destroyWeak(v69);

        objc_destroyWeak(v75);
        objc_destroyWeak(v81);
        objc_destroyWeak(&location);
        _Block_object_dispose(v83, 8);

        _Block_object_dispose(v85, 8);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (objc_class *)objc_opt_class();
          NSStringFromClass(v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v56 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v53;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v55;
          *(_WORD *)&buf[22] = 2112;
          v88 = v56;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,not in initializing state", buf, 0x20u);

        }
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v58;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v59;
          _os_log_fault_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,not in initializing state", buf, 0x16u);

        }
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v91 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not in Initializing state"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v42, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 41, v44);

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, 0, 0, 0, 0, v45);
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("initiatorCheckDuration"));

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "initiatorEligibility"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("initiatorEligibility"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:", &unk_1E9328388, CFSTR("lastStepToComplete"));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "sessionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "initiatorEligibility");
    initiatorEligiblityStatusToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched initiator eligibility,%@,error,%@", buf, 0x34u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if ((objc_msgSend(WeakRetained, "initializationCompletionCalled") & 1) == 0
    && objc_msgSend(WeakRetained, "receiverEligibility")
    && (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
     || objc_msgSend(WeakRetained, "initiatorEligibility") != 1
     || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
     || objc_msgSend(WeakRetained, "receiverEligibility") != 1))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    _SMSafeArray();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _SMMultiErrorCreate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "setInitializationCompletionCalled:", 1, v19, 1);
    objc_msgSend(WeakRetained, "initializationCompletion");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, void *))v18)[2](v18, 0, 0, 0, 0, objc_msgSend(WeakRetained, "initiatorEligibility"), objc_msgSend(WeakRetained, "receiverEligibility"), v17);

    objc_msgSend(WeakRetained, "setInitializationCompletion:", 0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_145(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("receiverCheckDuration"));

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "receiverEligibility") == 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("wasReceiverEligible"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:", &unk_1E93283A0, CFSTR("lastStepToComplete"));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "sessionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8B938], "convertEligibilityTypeToString:", objc_msgSend(WeakRetained, "receiverEligibility"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched receiver eligibility,%@,error,%@", buf, 0x34u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if ((objc_msgSend(WeakRetained, "initializationCompletionCalled") & 1) == 0
    && objc_msgSend(WeakRetained, "initiatorEligibility")
    && (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
     || objc_msgSend(WeakRetained, "initiatorEligibility") != 1
     || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
     || objc_msgSend(WeakRetained, "receiverEligibility") != 1))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    _SMSafeArray();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _SMMultiErrorCreate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "setInitializationCompletionCalled:", 1, v19, 1);
    objc_msgSend(WeakRetained, "initializationCompletion");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, void *))v18)[2](v18, 0, 0, 0, 0, objc_msgSend(WeakRetained, "initiatorEligibility"), objc_msgSend(WeakRetained, "receiverEligibility"), v17);

    objc_msgSend(WeakRetained, "setInitializationCompletion:", 0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_152(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  char v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("zoneSetupDuration"));

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 == 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("wasZoneSetupSuccessful"));

  if (v3)
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%d"), v11, objc_msgSend(v3, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v12, CFSTR("zoneSetupError"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:", &unk_1E93283B8, CFSTR("lastStepToComplete"));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "sessionUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = v14;
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,zone setup completed,error,%@", buf, 0x2Au);

  }
  v18 = objc_msgSend(WeakRetained, "initializationCompletionCalled");
  if (v3 && (v18 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "setInitializationCompletionCalled:", 1);
    objc_msgSend(WeakRetained, "initializationCompletion");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, id))v19)[2](v19, 0, 0, 0, 0, objc_msgSend(WeakRetained, "initiatorEligibility"), objc_msgSend(WeakRetained, "receiverEligibility"), v3);

    objc_msgSend(WeakRetained, "setInitializationCompletion:", 0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_162(uint64_t a1)
{
  id WeakRetained;
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
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
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
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setInitializationInProgress:", 0);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("initializationDuration"));

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "initializationCompletionCalled") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("initializationResult"));

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "initializationWasAborted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("wasAborted"));

  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isCellularActivated"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("isCellularActivated"));

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isStandalone"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("isStandalone"));

  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conversation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "receiverHandles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v18, CFSTR("numRecipients"));

  AnalyticsSendEvent();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "sessionUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "initializationCompletionCalled"))
    {
      v24 = objc_msgSend(WeakRetained, "initializationWasAborted");
      v25 = CFSTR("failed");
      if (v24)
        v25 = CFSTR("was aborted");
    }
    else
    {
      v25 = CFSTR("succeeded");
    }
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138413314;
    v39 = v20;
    v40 = 2112;
    v41 = v22;
    v42 = 2112;
    v43 = v23;
    v44 = 2112;
    v45 = v25;
    v46 = 2112;
    v47 = v26;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initialization %@,metric,%@", buf, 0x34u);

  }
  if ((objc_msgSend(WeakRetained, "initializationCompletionCalled") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "setInitializationCompletionCalled:", 1);
    objc_msgSend(WeakRetained, "initializationCompletion");
    v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "initiatorContact");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "allowReadToken");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "initiatorContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "safetyCacheKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "initiatorContact");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scheduleSendMessageGUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "activeSessionZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "invitationTokenMap");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, void *, uint64_t, uint64_t, _QWORD))v27)[2](v27, v28, v30, v32, v34, objc_msgSend(WeakRetained, "initiatorEligibility"), objc_msgSend(WeakRetained, "receiverEligibility"), 0);

    objc_msgSend(WeakRetained, "setInitializationCompletion:", 0);
  }
  objc_msgSend(WeakRetained, "initiatorContact");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "shouldBeCleanedUpDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    objc_msgSend(WeakRetained, "_cleanupActiveSessionZone");

}

- (void)_setupActiveSessionZone
{
  SMSafetyCacheZone *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SMSafetyCacheZone *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = [SMSafetyCacheZone alloc];
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowReadToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager defaultsManager](self, "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SMSafetyCacheZone initWithSessionID:token:defaultsManager:queue:](v4, "initWithSessionID:token:defaultsManager:queue:", v5, v8, v9, v10);
  -[SMInitiatorCacheManager setActiveSessionZone:](self, "setActiveSessionZone:", v11);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v13;
    v20 = 2112;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Setting up share zone,%@", (uint8_t *)&v18, 0x2Au);

  }
}

- (void)_setupFetchOnZoneUpdates
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v18;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,No zone to setup", buf, 0x20u);

    }
    goto LABEL_5;
  }
  -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneUpdateHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v14;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetch already active", buf, 0x20u);

    }
LABEL_5:

    return;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v9;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Registering for zone updates", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__SMInitiatorCacheManager__setupFetchOnZoneUpdates__block_invoke;
  v22[3] = &unk_1E929F4B0;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = (id)a2;
  objc_msgSend(v13, "registerForZoneUpdatesWithHandler:", v22);

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
}

void __51__SMInitiatorCacheManager__setupFetchOnZoneUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  SMCloudKitQosOptions *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "sessionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Received zone update,%@", buf, 0x2Au);

  }
  v10 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
  objc_msgSend(WeakRetained, "activeSessionZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__SMInitiatorCacheManager__setupFetchOnZoneUpdates__block_invoke_185;
  v14[3] = &unk_1E929F488;
  objc_copyWeak(v16, (id *)(a1 + 32));
  v12 = WeakRetained;
  v13 = *(void **)(a1 + 40);
  v15 = v12;
  v16[1] = v13;
  objc_msgSend(v11, "fetchSafetyCacheRecordsWithQos:completion:", v10, v14);

  objc_destroyWeak(v16);
}

void __51__SMInitiatorCacheManager__setupFetchOnZoneUpdates__block_invoke_185(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "sessionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v8;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetchSafetyCacheRecordsWithQos,error,%@", (uint8_t *)&v16, 0x2Au);

  }
  if (a2)
  {
    objc_msgSend(WeakRetained, "activeSessionZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "phoneSafetyCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "activeSessionZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "watchSafetyCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "decryptAndStoreSafetyCacheDataWithPhoneCacheData:watchCacheData:metricsDict:", v13, v15, 0);

  }
}

- (void)_teardownFetchOnZoneUpdates
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
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
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneUpdateHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Deregistering for zone updates", (uint8_t *)&v16, 0x20u);

    }
    -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject deregisterForZoneUpdates](v7, "deregisterForZoneUpdates");
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v12;
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,No fetch in progress to deregister", (uint8_t *)&v16, 0x20u);

  }
}

- (void)_setupShareZoneWithCompletion:(id)a3
{
  id v5;
  SMCloudKitQosOptions *v6;
  SMCloudKitQosOptions *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  SMCloudKitQosOptions *v12;
  NSObject *v13;
  _QWORD v14[5];
  SMCloudKitQosOptions *v15;
  id v16;
  id v17[2];
  id location[2];

  v5 = a3;
  if (v5)
  {
    objc_initWeak(location, self);
    v6 = [SMCloudKitQosOptions alloc];
    v7 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:](v6, "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, *MEMORY[0x1E0D8BBD0], 0);
    -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__SMInitiatorCacheManager__setupShareZoneWithCompletion___block_invoke;
    v14[3] = &unk_1E929F500;
    objc_copyWeak(v17, location);
    v11 = v5;
    v17[1] = (id)a2;
    v16 = v11;
    v14[4] = self;
    v12 = v7;
    v15 = v12;
    objc_msgSend(v8, "setupZoneAndShareWithConversation:qos:completion:", v10, v12, v14);

    objc_destroyWeak(v17);
    objc_destroyWeak(location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)location, 2u);
    }

  }
}

void __57__SMInitiatorCacheManager__setupShareZoneWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _BYTE *v25;
  uint64_t v26;
  uint8_t buf[16];
  _BYTE v28[24];
  os_signpost_id_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "sessionUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138413314;
      *(_QWORD *)&v28[4] = v19;
      *(_WORD *)&v28[12] = 2112;
      *(_QWORD *)&v28[14] = v21;
      *(_WORD *)&v28[22] = 2112;
      v29 = (os_signpost_id_t)v22;
      v30 = 1024;
      v31 = a2;
      v32 = 2112;
      v33 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,success,%d,error,%@", v28, 0x30u);

    }
    if (a2)
    {
      *(_QWORD *)v28 = 0;
      *(_QWORD *)&v28[8] = v28;
      *(_QWORD *)&v28[16] = 0x2020000000;
      v29 = 0;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_signpost_id_generate(v8);

      v29 = v9;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = *(_QWORD *)(*(_QWORD *)&v28[8] + 24);
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1A22000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SMInitializationSequenceSetupZoneAndShareSubscribeToZoneChanges", " enableTelemetry=YES ", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "activeSessionZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __57__SMInitiatorCacheManager__setupShareZoneWithCompletion___block_invoke_189;
      v23[3] = &unk_1E929F4D8;
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v25 = v28;
      v23[4] = v14;
      v26 = *(_QWORD *)(a1 + 64);
      v24 = *(id *)(a1 + 48);
      objc_msgSend(v13, "subscribeToZoneChangesInPrivateDatabaseWithQoS:completion:", v15, v23);

      _Block_object_dispose(v28, 8);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR("SMInitiatorCacheManger was destroyed before zone setup");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 24, v17);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __57__SMInitiatorCacheManager__setupShareZoneWithCompletion___block_invoke_189(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = a2;
    objc_msgSend(v5, "domain");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = 134349570;
    v21 = v9;
    v22 = 2082;
    v23 = objc_msgSend(v10, "UTF8String");
    v24 = 2050;
    v25 = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMInitializationSequenceSetupZoneAndShareSubscribeToZoneChanges", " enableTelemetry=YES {success:%{public, signpost.telemetry:number1}ld, errorDomain:%{public, signpost.telemetry:string1}s, errorCode:%{public, signpost.telemetry:number2}ld}", (uint8_t *)&v20, 0x20u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "activeSessionZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "zoneName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "activeSessionZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoneID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413314;
    v21 = (unint64_t)v14;
    v22 = 2112;
    v23 = (uint64_t)v16;
    v24 = 2112;
    v25 = (uint64_t)v17;
    v26 = 2112;
    v27 = v19;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@, subscribed to zone changes for zoneID %@, with error %@", (uint8_t *)&v20, 0x34u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)decryptAndStoreSafetyCacheDataWithPhoneCacheData:(id)a3 watchCacheData:(id)a4 metricsDict:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v62;
  id v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  v62 = v8;
  if (v8)
  {
    if (v12)
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v66 = v13;
      v67 = 2112;
      v68 = v15;
      v69 = 2112;
      v70 = v16;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,decrypting phone safety cache data", buf, 0x20u);

    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safetyCacheKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    +[SMCryptoUtilities decryptSafetyCache:key:sessionID:role:device:metricsDict:hashString:](SMCryptoUtilities, "decryptSafetyCache:key:sessionID:role:device:metricsDict:hashString:", v62, v18, v19, CFSTR("Initiator"), 1, a5, &v64);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v64;

    if (v20)
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v20, "logCacheForSessionID:role:deviceType:transaction:hashString:", v22, CFSTR("Initiator"), CFSTR("phone"), v10, v21);
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0D8B8F8];
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logNoCacheDataForSessionID:role:deviceType:transaction:", v22, CFSTR("Initiator"), CFSTR("phone"), v10);
    }

  }
  else
  {
    if (v12)
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v66 = v23;
      v67 = 2112;
      v68 = v25;
      v69 = 2112;
      v70 = v26;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no phone safety cache data", buf, 0x20u);

    }
    v27 = (void *)MEMORY[0x1E0D8B8F8];
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logNoCacheDataForSessionID:role:deviceType:transaction:", v21, CFSTR("Initiator"), CFSTR("phone"), v10);
    v20 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v30)
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v66 = v31;
      v67 = 2112;
      v68 = v33;
      v69 = 2112;
      v70 = v34;
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,decrypting watch safety cache data", buf, 0x20u);

    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "safetyCacheKey");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    +[SMCryptoUtilities decryptSafetyCache:key:sessionID:role:device:metricsDict:hashString:](SMCryptoUtilities, "decryptSafetyCache:key:sessionID:role:device:metricsDict:hashString:", v9, v36, v37, CFSTR("Initiator"), 2, a5, &v63);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v63;

    if (v38)
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v38, "logCacheForSessionID:role:deviceType:transaction:hashString:", v40, CFSTR("Initiator"), CFSTR("watch"), v10, v39);
    }
    else
    {
      v46 = (void *)MEMORY[0x1E0D8B8F8];
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "logNoCacheDataForSessionID:role:deviceType:transaction:", v40, CFSTR("Initiator"), CFSTR("watch"), v10);
    }

  }
  else
  {
    if (v30)
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v66 = v41;
      v67 = 2112;
      v68 = v43;
      v69 = 2112;
      v70 = v44;
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no watch safety cache data", buf, 0x20u);

    }
    if (a5)
      objc_msgSend(*a5, "setValue:forKey:", &unk_1E9328388, CFSTR("watchCacheDecryptionResult"));
    v45 = (void *)MEMORY[0x1E0D8B8F8];
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "logNoCacheDataForSessionID:role:deviceType:transaction:", v39, CFSTR("Initiator"), CFSTR("watch"), v10);
    v38 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v20 | v38)
  {
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v66 = v49;
      v67 = 2112;
      v68 = v51;
      v69 = 2112;
      v70 = v52;
      v71 = 2112;
      v72 = v20;
      v73 = 2112;
      v74 = v38;
      _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully decrypted safety cache data for,phone,%@,watch,%@", buf, 0x34u);

    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setPhoneCache:", v20);

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setWatchCache:", v38);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setSyncDate:", v55);

    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
  }
  else
  {
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (objc_class *)objc_opt_class();
      NSStringFromClass(v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v66 = v57;
      v67 = 2112;
      v68 = v59;
      v69 = 2112;
      v70 = v60;
      _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no safety cache data present", buf, 0x20u);

    }
  }

}

- (void)_checkInitiatorEligibilityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location[2];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.SafetyMonitor.InitiatorEligibility.%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v9 = dispatch_queue_create((const char *)-[NSObject UTF8String](v8, "UTF8String"), 0);
    -[SMInitiatorCacheManager setInitiatorEligibilityQueue:](self, "setInitiatorEligibilityQueue:", v9);

    objc_initWeak(location, self);
    -[SMInitiatorCacheManager initiatorEligibilityQueue](self, "initiatorEligibilityQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager authorizationManager](self, "authorizationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager messagingService](self, "messagingService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "effectivePairedDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager defaultsManager](self, "defaultsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager platform](self, "platform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__SMInitiatorCacheManager__checkInitiatorEligibilityWithCompletion___block_invoke;
    v16[3] = &unk_1E929F528;
    objc_copyWeak(&v18, location);
    v17 = v4;
    +[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePairedDevice:isHandoff:defaultsManager:platform:handler:](SMInitiatorEligibility, "checkInitiatorEligibilityWithQueue:authorizationManager:effectivePairedDevice:isHandoff:defaultsManager:platform:handler:", v10, v11, v13, 0, v14, v15, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)location, 2u);
    }
  }

}

void __68__SMInitiatorCacheManager__checkInitiatorEligibilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SMInitiatorCacheManager__checkInitiatorEligibilityWithCompletion___block_invoke_2;
    block[3] = &unk_1E92994E0;
    v14 = v7;
    v17 = a2;
    v16 = *(id *)(a1 + 32);
    v15 = v5;
    dispatch_async(v8, block);

    v9 = v14;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0D8BB70];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("SMInitiatorCacheManger was destroyed before eligibility check");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 24, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __68__SMInitiatorCacheManager__checkInitiatorEligibilityWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInitiatorEligibilityQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInitiatorEligibility:", *(_QWORD *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_checkConversationEligibilityWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location[2];

  v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    v5 = objc_alloc(MEMORY[0x1E0D8B938]);
    -[SMInitiatorCacheManager queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithQueue:", v6);

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__SMInitiatorCacheManager__checkConversationEligibilityWithCompletion___block_invoke;
    v12[3] = &unk_1E929F550;
    v10 = v7;
    v13 = v10;
    objc_copyWeak(&v15, location);
    v14 = v4;
    objc_msgSend(v10, "checkConversationEligibility:handler:", v9, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)location, 2u);
    }

  }
}

void __71__SMInitiatorCacheManager__checkConversationEligibilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setReceiverEligibility:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = *MEMORY[0x1E0D8BB70];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("SMInitiatorCacheManger was destroyed before eligibility check");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 24, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char **__ptr32 *v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  SMCloudKitQosOptions *v36;
  NSObject *v37;
  void *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  BOOL v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  objc_class *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  void *v90;
  id v91;
  void *v92;
  uint64_t v93;
  NSObject *v94;
  _BOOL4 v95;
  NSObject *v96;
  void *v97;
  objc_class *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  NSObject *v103;
  void *v104;
  objc_class *v105;
  void *v106;
  void *v107;
  void *v108;
  objc_class *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  SMCloudKitQosOptions *v114;
  NSObject *v115;
  void *v116;
  objc_class *v117;
  void *v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void (**v125)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v126;
  void *v127;
  objc_class *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  _BOOL4 v137;
  void *v138;
  void *v139;
  dispatch_group_t v140;
  _QWORD block[5];
  _QWORD v143[5];
  NSObject *v144;
  SEL v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[6];
  _QWORD v151[7];
  _BYTE v152[128];
  uint64_t v153;
  void *v154;
  uint8_t buf[4];
  void *v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  void *v160;
  __int16 v161;
  const __CFString *v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  _BOOL4 v166;
  uint64_t v167;

  v4 = a4;
  v167 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v137 = v4;
    v140 = dispatch_group_create();
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager setSessionManagerState:](self, "setSessionManagerState:", v6);
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v135 = v9;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v7, "sessionState"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v6, "sessionState"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v156 = v13;
      v157 = 2112;
      v158 = v15;
      v159 = 2112;
      v160 = v16;
      v161 = 2112;
      v162 = v17;
      v163 = 2112;
      v164 = v18;
      v165 = 1024;
      v166 = v7 == 0;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from: %@ to: %@ onBoot: %d", buf, 0x3Au);

      v9 = v135;
    }

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "earliestActiveDeviceIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
    {
      objc_msgSend(v6, "activeDeviceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEarliestActiveDeviceIdentifier:", v21);

    v23 = v140;
    if (!v20)

    objc_msgSend(v6, "activeDeviceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLatestActiveDeviceIdentifier:", v24);

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConversation:", v11);

    v27 = MEMORY[0x1E0C809B0];
    v28 = &off_1D1EEC000;
    if (v137)
    {
      if (objc_msgSend(v7, "sessionState") == 11 && objc_msgSend(v6, "sessionState") == 2)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v33 = v27;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v156 = v30;
          v157 = 2112;
          v158 = v32;
          v159 = 2112;
          v160 = v34;
          _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session started", buf, 0x20u);

          v27 = v33;
        }
        v138 = v11;

        if (-[SMInitiatorCacheManager _shouldPerformFirstCacheUpdateCKOperation](self, "_shouldPerformFirstCacheUpdateCKOperation"))
        {
          v35 = v27;
          v36 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
          v37 = objc_claimAutoreleasedReturnValue();
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = os_signpost_id_make_with_pointer(v37, v38);

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1A22000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "SMSessionCacheUploadWriteActiveSessionDetailsCKLatency", " enableTelemetry=YES ", buf, 2u);
          }

          v27 = v35;
          v151[0] = v35;
          v151[1] = 3221225472;
          v151[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke;
          v151[3] = &unk_1E92976F0;
          v151[4] = self;
          v151[5] = v39;
          v151[6] = a2;
          -[SMInitiatorCacheManager _writeActiveSessionDetails:qos:completion:](self, "_writeActiveSessionDetails:qos:completion:", 10, v36, v151);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v36 = (SMCloudKitQosOptions *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v36->super, OS_LOG_TYPE_INFO))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = (objc_class *)objc_opt_class();
            NSStringFromClass(v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v156 = v58;
            v157 = 2112;
            v158 = v60;
            v159 = 2112;
            v160 = v61;
            v161 = 2112;
            v162 = CFSTR("NO");
            _os_log_impl(&dword_1D1A22000, &v36->super, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@, Active Session Details write to CK was skipped because session should soon handoff, shouldWriteActiveSessionDetails, %@", buf, 0x2Au);

          }
        }

        -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "configuration");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "sessionType");

        v65 = v64 == 4;
        v11 = v138;
        v23 = v140;
        v28 = &off_1D1EEC000;
        if (v65)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = (objc_class *)objc_opt_class();
            NSStringFromClass(v128);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v156 = v127;
            v157 = 2112;
            v158 = v129;
            v159 = 2112;
            v160 = v130;
            _os_log_debug_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching current workout snapshot", buf, 0x20u);

            v27 = MEMORY[0x1E0C809B0];
            v28 = &off_1D1EEC000;
          }

          -[SMInitiatorCacheManager healthKitManager](self, "healthKitManager");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v150[0] = v27;
          v150[1] = *((_QWORD *)v28 + 369);
          v150[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_210;
          v150[3] = &unk_1E929F578;
          v150[4] = self;
          v150[5] = a2;
          objc_msgSend(v67, "fetchCurrentWorkoutSnapshotWithHandler:", v150);

        }
      }
      else if ((objc_msgSend(v7, "sessionState") == 2
              || objc_msgSend(v7, "sessionState") == 9
              || objc_msgSend(v7, "sessionState") == 7
              || objc_msgSend(v7, "sessionState") == 14)
             && objc_msgSend(v6, "sessionState") == 4)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (objc_class *)objc_opt_class();
          NSStringFromClass(v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v156 = v43;
          v157 = 2112;
          v158 = v45;
          v159 = 2112;
          v160 = v46;
          _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache released", buf, 0x20u);

          v27 = MEMORY[0x1E0C809B0];
          v28 = &off_1D1EEC000;
        }

        -[SMInitiatorCacheManager _transitionToCacheReleaseStateForIsSecondarySOSTrigger:](self, "_transitionToCacheReleaseStateForIsSecondarySOSTrigger:", 0);
      }
      else if (v7
             && (objc_msgSend(v7, "isEndSessionState") & 1) == 0
             && objc_msgSend(v6, "isEndSessionState"))
      {
        if (objc_msgSend(v7, "isActiveState"))
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (objc_class *)objc_opt_class();
            NSStringFromClass(v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v156 = v48;
            v157 = 2112;
            v158 = v50;
            v159 = 2112;
            v160 = v51;
            _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session has ended", buf, 0x20u);

            v27 = MEMORY[0x1E0C809B0];
            v28 = &off_1D1EEC000;
          }

          -[SMInitiatorCacheManager _deleteActiveSessionDetails:](self, "_deleteActiveSessionDetails:", 2);
          -[SMInitiatorCacheManager submitCAMetricInitiatorSession](self, "submitCAMetricInitiatorSession");
          -[SMInitiatorCacheManager submitPowerTelemetryMetricForEvent:](self, "submitPowerTelemetryMetricForEvent:", 2);
        }
        else if (-[SMInitiatorCacheManager initializationInProgress](self, "initializationInProgress")
               && !-[SMInitiatorCacheManager initializationCompletionCalled](self, "initializationCompletionCalled"))
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v115 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = (objc_class *)objc_opt_class();
            NSStringFromClass(v117);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v156 = v116;
            v157 = 2112;
            v158 = v118;
            v159 = 2112;
            v160 = v119;
            _os_log_impl(&dword_1D1A22000, v115, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session was aborted during initialization", buf, 0x20u);

          }
          -[SMInitiatorCacheManager setInitializationCompletionCalled:](self, "setInitializationCompletionCalled:", 1);
          -[SMInitiatorCacheManager setInitializationWasAborted:](self, "setInitializationWasAborted:", 1);
          v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v121 = *MEMORY[0x1E0D8BB70];
          v153 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initialization was canceled"));
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = v122;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = (void *)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 24, v123);

          -[SMInitiatorCacheManager initializationCompletion](self, "initializationCompletion");
          v125 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v125)[2](v125, 0, 0, 0, 0, 0, 0, v124);

          -[SMInitiatorCacheManager setInitializationCompletion:](self, "setInitializationCompletion:", 0);
          v27 = MEMORY[0x1E0C809B0];
          v28 = &off_1D1EEC000;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v103 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = (objc_class *)objc_opt_class();
            NSStringFromClass(v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v156 = v104;
            v157 = 2112;
            v158 = v106;
            v159 = 2112;
            v160 = v107;
            _os_log_impl(&dword_1D1A22000, v103, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session was aborted", buf, 0x20u);

            v27 = MEMORY[0x1E0C809B0];
            v28 = &off_1D1EEC000;
          }

        }
        -[SMInitiatorCacheManager _transitionToNotActiveState:](self, "_transitionToNotActiveState:", 1);
      }
      else
      {
        v52 = objc_msgSend(v7, "sessionState");
        if (v52 != objc_msgSend(v6, "sessionState")
          || (objc_msgSend(v6, "isEndSessionState") & 1) != 0
          || +[SMMessagingUtilities handlesInConversation1:canonicallyEqualsHandlesInConversation2:](SMMessagingUtilities, "handlesInConversation1:canonicallyEqualsHandlesInConversation2:", v11, v9))
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v156 = v54;
            v157 = 2112;
            v158 = v56;
            v159 = 2112;
            v160 = v57;
            _os_log_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,noop", buf, 0x20u);

            v27 = MEMORY[0x1E0C809B0];
            v28 = &off_1D1EEC000;
          }

        }
        else
        {
          v136 = v9;
          v139 = v11;
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = (objc_class *)objc_opt_class();
            NSStringFromClass(v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v156 = v69;
            v157 = 2112;
            v158 = v71;
            v159 = 2112;
            v160 = v72;
            _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,self state transition with change in conversation handles", buf, 0x20u);

          }
          v73 = (void *)MEMORY[0x1E0C99E20];
          v134 = v7;
          objc_msgSend(v7, "configuration");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "conversation");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "receiverPrimaryHandles");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setWithArray:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          v78 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v6, "configuration");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "conversation");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "receiverPrimaryHandles");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setWithArray:", v81);
          v82 = objc_claimAutoreleasedReturnValue();

          v133 = (void *)v82;
          objc_msgSend(v77, "minusSet:", v82);
          v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v77, "count"));
          v146 = 0u;
          v147 = 0u;
          v148 = 0u;
          v149 = 0u;
          v84 = v77;
          v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v146, v152, 16);
          if (v85)
          {
            v86 = v85;
            v87 = *(_QWORD *)v147;
            v88 = MEMORY[0x1E0C9AA60];
            do
            {
              for (i = 0; i != v86; ++i)
              {
                if (*(_QWORD *)v147 != v87)
                  objc_enumerationMutation(v84);
                v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B960]), "initWithPrimaryHandle:secondaryHandles:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * i), v88);
                objc_msgSend(v83, "addObject:", v90);

              }
              v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v146, v152, 16);
            }
            while (v86);
          }

          v91 = objc_alloc(MEMORY[0x1E0D8B918]);
          v92 = (void *)objc_msgSend(v83, "copy");
          v93 = objc_msgSend(v91, "initWithReceiverHandles:identifier:displayName:", v92, 0, 0);

          LODWORD(v91) = -[SMInitiatorCacheManager _isKeyReleaseScheduled](self, "_isKeyReleaseScheduled");
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v94 = objc_claimAutoreleasedReturnValue();
          v95 = os_log_type_enabled(v94, OS_LOG_TYPE_INFO);
          if ((_DWORD)v91)
          {
            v96 = v140;
            v9 = v136;
            if (v95)
            {
              -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              v98 = (objc_class *)objc_opt_class();
              NSStringFromClass(v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v131 = v93;
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v156 = v97;
              v157 = 2112;
              v158 = v99;
              v159 = 2112;
              v160 = v100;
              _os_log_impl(&dword_1D1A22000, v94, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,rescheduling key release with new recipients", buf, 0x20u);

              v93 = v131;
            }

            -[SMInitiatorCacheManager _cancelScheduledKeyReleaseForConversation:](self, "_cancelScheduledKeyReleaseForConversation:", v93);
            v101 = -[SMInitiatorCacheManager _scheduleKeyReleaseWithCompletion:](self, "_scheduleKeyReleaseWithCompletion:", &__block_literal_global_66);
            v102 = (void *)v93;
          }
          else
          {
            v132 = (void *)v93;
            v96 = v140;
            v9 = v136;
            if (v95)
            {
              -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = (objc_class *)objc_opt_class();
              NSStringFromClass(v109);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v156 = v108;
              v157 = 2112;
              v158 = v110;
              v159 = 2112;
              v160 = v111;
              _os_log_impl(&dword_1D1A22000, v94, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no key release was scheduled to begin with", buf, 0x20u);

            }
            v102 = v132;
          }
          v112 = v96;
          dispatch_group_enter(v96);
          -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
          v27 = MEMORY[0x1E0C809B0];
          v143[0] = MEMORY[0x1E0C809B0];
          v143[1] = 3221225472;
          v143[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_219;
          v143[3] = &unk_1E929F5C0;
          v143[4] = self;
          v145 = a2;
          v144 = v112;
          objc_msgSend(v113, "removeShareParticipantsInConversation:qos:withCompletion:", v102, v114, v143);

          v23 = v112;
          v28 = &off_1D1EEC000;

          v7 = v134;
          v11 = v139;
        }
      }
    }
    else if (v7
           && (objc_msgSend(v7, "isEndSessionState") & 1) == 0
           && objc_msgSend(v6, "isEndSessionState"))
    {
      -[SMInitiatorCacheManager _transitionToNotActiveState:](self, "_transitionToNotActiveState:", 0);
      -[SMInitiatorCacheManager submitCAMetricInitiatorSession](self, "submitCAMetricInitiatorSession");
    }
    -[SMInitiatorCacheManager queue](self, "queue");
    v126 = objc_claimAutoreleasedReturnValue();
    block[0] = v27;
    block[1] = *((_QWORD *)v28 + 369);
    block[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_221;
    block[3] = &unk_1E92977B8;
    block[4] = self;
    dispatch_group_notify(v23, v126, block);

    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: newState", buf, 2u);
    }
  }

}

void __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMSessionCacheUploadWriteActiveSessionDetailsCKLatency", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v11;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Active Session Details stored, calling _transitionToActiveState", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_transitionToActiveState");
    objc_msgSend(*(id *)(a1 + 32), "submitPowerTelemetryMetricForEvent:", 1);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v15;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v5;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details with error %@", (uint8_t *)&v19, 0x2Au);

    }
  }

}

void __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_210(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_2;
  v12[3] = &unk_1E9298238;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138413058;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,error with current workout snapshot fetch %@", (uint8_t *)&v15, 0x2Au);

    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v15 = 138413058;
      v16 = v5;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched current workout snapshot, %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "_onHealthKitManagerWorkoutSnapshotUpdate:", *(_QWORD *)(a1 + 48));
  }
}

void __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "participants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,remaining participants,%@", (uint8_t *)&v18, 0x2Au);

  }
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413314;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v5;
      v26 = 2112;
      v27 = v6;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to remove participants from share,%@,error,%@", (uint8_t *)&v18, 0x34u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_221(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateAndManagePeriodicCacheUpdate");
}

- (void)onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  objc_class *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: newState", (uint8_t *)&v25, 2u);
    }
    goto LABEL_14;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      goto LABEL_15;
    }
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413058;
    v26 = v17;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v8;
    v21 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,not active device transition state, %@";
    v22 = v16;
    v23 = 42;
LABEL_13:
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, v23);

    goto LABEL_14;
  }
  if (objc_msgSend(v7, "sessionState") == 4)
  {
    v9 = (void *)MEMORY[0x1E0D8BA40];
    objc_msgSend(v8, "monitorContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "isSOSTriggerCategory:", objc_msgSend(v10, "triggerCategory"));

    if ((_DWORD)v9)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412802;
        v26 = v12;
        v27 = 2112;
        v28 = v14;
        v29 = 2112;
        v30 = v15;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,secondary SOS trigger received", (uint8_t *)&v25, 0x20u);

      }
      -[SMInitiatorCacheManager _transitionToCacheReleaseStateForIsSecondarySOSTrigger:](self, "_transitionToCacheReleaseStateForIsSecondarySOSTrigger:", 1);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v17;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v21 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache released for secondary SOS Trigger";
      v22 = v16;
      v23 = 32;
      goto LABEL_13;
    }
  }
LABEL_15:

}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  void *v29;
  int v30;
  objc_class *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v7, "sessionState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138413058;
      v33 = v9;
      v34 = 2112;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,resuming state: %@", (uint8_t *)&v32, 0x2Au);

    }
    -[SMInitiatorCacheManager setSessionManagerState:](self, "setSessionManagerState:", v7);
    -[SMInitiatorCacheManager _evaluateAndManagePeriodicCacheUpdate](self, "_evaluateAndManagePeriodicCacheUpdate");
    if (a4)
    {
      -[SMInitiatorCacheManager _updateScheduledSendFireTimer](self, "_updateScheduledSendFireTimer");
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isActiveState");

      if (v15)
      {
        -[SMInitiatorCacheManager _transitionToActiveState](self, "_transitionToActiveState");
        -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "sessionState") == 4)
        {
          -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "keyReleaseMessageSendDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            -[SMInitiatorCacheManager _sendKeyReleaseMessageForIsSecondarySOSTrigger:](self, "_sendKeyReleaseMessageForIsSecondarySOSTrigger:", 0);
        }
        else
        {

        }
        goto LABEL_16;
      }
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEndSessionState");

      if (v30)
      {
        -[SMInitiatorCacheManager _transitionToNotActiveState:](self, "_transitionToNotActiveState:", 1);
        goto LABEL_16;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412802;
        v33 = v21;
        v34 = 2112;
        v35 = v23;
        v36 = 2112;
        v37 = v24;
        v25 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,noop";
        v26 = v20;
        v27 = OS_LOG_TYPE_INFO;
        v28 = 32;
        goto LABEL_14;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138413058;
        v33 = v21;
        v34 = 2112;
        v35 = v23;
        v36 = 2112;
        v37 = v24;
        v38 = 2112;
        v39 = v7;
        v25 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,not active device transition state, %@";
        v26 = v20;
        v27 = OS_LOG_TYPE_DEFAULT;
        v28 = 42;
LABEL_14:
        _os_log_impl(&dword_1D1A22000, v26, v27, v25, (uint8_t *)&v32, v28);

      }
    }

    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v32) = 0;
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", (uint8_t *)&v32, 2u);
  }

LABEL_16:
}

- (void)onBecomingActiveDevice:(id)a3
{
  id v5;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isActiveState"))
  {
    -[SMInitiatorCacheManager setSessionManagerState:](self, "setSessionManagerState:", v5);
    objc_msgSend(v5, "safetyCacheKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSafetyCacheKey:", v6);

    objc_msgSend(v5, "allowReadToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowReadToken:", v8);

    objc_msgSend(v5, "scheduledSendMessageDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setScheduledSendExpiryDate:", v10);

    objc_msgSend(v5, "scheduledSendMessageGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScheduleSendMessageGUID:", v12);

    objc_msgSend(v5, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "destination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "destinationMapItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDestinationMapItem:", v16);

    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "sessionState");

    if (v19 == 4)
    {
      objc_msgSend(v5, "sessionStateTransitionDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setKeyReleaseMessageSendDate:", v20);

    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNumberOfHandoffBecomingActive:", objc_msgSend(v22, "numberOfHandoffBecomingActive") + 1);

    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v30 = v24;
      v31 = 2112;
      v32 = v26;
      v33 = 2112;
      v34 = v27;
      v35 = 2112;
      v36 = v5;
      _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,becoming active %@", buf, 0x2Au);

    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __50__SMInitiatorCacheManager_onBecomingActiveDevice___block_invoke;
    v28[3] = &unk_1E9297BF0;
    v28[4] = self;
    v28[5] = a2;
    -[SMInitiatorCacheManager _periodicCacheUpdateWithCompletion:](self, "_periodicCacheUpdateWithCompletion:", v28);
  }
  -[SMInitiatorCacheManager _evaluateAndManagePeriodicCacheUpdate](self, "_evaluateAndManagePeriodicCacheUpdate");

}

void __50__SMInitiatorCacheManager_onBecomingActiveDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed initial cache upload", (uint8_t *)&v7, 0x20u);

  }
}

- (void)onBecomingNonActiveDevice:(id)a3
{
  void *v4;

  -[SMInitiatorCacheManager _evaluateAndManagePeriodicCacheUpdate](self, "_evaluateAndManagePeriodicCacheUpdate", a3);
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfHandoffBecomingNonActive:", objc_msgSend(v4, "numberOfHandoffBecomingNonActive") + 1);

  -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
}

- (void)cleanupNonActiveSession
{
  void *v3;
  void *v4;

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shouldBeCleanedUpDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[SMInitiatorCacheManager _transitionToNotActiveState:](self, "_transitionToNotActiveState:", -[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice"));
}

- (void)_transitionToActiveState
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
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
  NSObject *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[6];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D8B9F0];
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionTypeToString:", objc_msgSend(v11, "sessionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v59 = v5;
    v60 = 2112;
    v61 = v7;
    v62 = 2112;
    v63 = v8;
    v64 = 2112;
    v65 = v12;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,transitionToActiveState type %@", buf, 0x2Au);

  }
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "destinationMapItem");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;
  if (v14)
  {
    v16 = (void *)v14;
LABEL_7:

    goto LABEL_8;
  }
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "destination");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "destination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "destinationMapItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDestinationMapItem:", v21);

    goto LABEL_7;
  }
  v15 = 0;
LABEL_8:
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "startingLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isValid"))
  {

  }
  else
  {
    v25 = (void *)MEMORY[0x1E0D8B998];
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "location");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = objc_msgSend(v25, "isCLLocationValid:", v27);

    if ((_DWORD)v25)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "location");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "coordinate");
        v34 = v33;
        -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "location");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "coordinate");
        v38 = v37;
        -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "location");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "horizontalAccuracy");
        *(_DWORD *)buf = 138413570;
        v59 = v29;
        v60 = 2112;
        v61 = v31;
        v62 = 2112;
        v63 = v32;
        v64 = 2048;
        v65 = v34;
        v66 = 2048;
        v67 = v38;
        v68 = 2048;
        v69 = v41;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,saving starting location,lat,%.4f,lon,%.4f,hunc,%.1f", buf, 0x3Eu);

      }
      v42 = objc_alloc(MEMORY[0x1E0D8B998]);
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "location");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v42, "initWithCLLocation:", v44);
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setStartingLocation:", v45);

      goto LABEL_15;
    }
  }
  if (v15)
LABEL_15:
    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
  v47 = -[SMInitiatorCacheManager _shouldPerformFirstCacheUpdateCKOperation](self, "_shouldPerformFirstCacheUpdateCKOperation");
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "timeCacheUploadCompletion");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49 && v47)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v59 = v51;
      v60 = 2112;
      v61 = v53;
      v62 = 2112;
      v63 = v54;
      _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,starting initial cache upload", buf, 0x20u);

    }
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __51__SMInitiatorCacheManager__transitionToActiveState__block_invoke;
    v57[3] = &unk_1E9297BF0;
    v57[4] = self;
    v57[5] = a2;
    -[SMInitiatorCacheManager _periodicCacheUpdateWithCompletion:](self, "_periodicCacheUpdateWithCompletion:", v57);
  }
}

void __51__SMInitiatorCacheManager__transitionToActiveState__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed initial cache upload", (uint8_t *)&v7, 0x20u);

  }
}

- (void)_transitionToCacheReleaseStateForIsSecondarySOSTrigger:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,releasing cache", buf, 0x20u);

  }
  -[SMInitiatorCacheManager _sendKeyReleaseMessageForIsSecondarySOSTrigger:](self, "_sendKeyReleaseMessageForIsSecondarySOSTrigger:", v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__SMInitiatorCacheManager__transitionToCacheReleaseStateForIsSecondarySOSTrigger___block_invoke;
  v11[3] = &unk_1E9297BF0;
  v11[4] = self;
  v11[5] = a2;
  -[SMInitiatorCacheManager _periodicCacheUpdateWithCompletion:](self, "_periodicCacheUpdateWithCompletion:", v11);
}

void __82__SMInitiatorCacheManager__transitionToCacheReleaseStateForIsSecondarySOSTrigger___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,updated cache due to cache release", (uint8_t *)&v7, 0x20u);

  }
}

- (void)_transitionToNotActiveState:(BOOL)a3
{
  NSObject *v5;
  char *v6;
  objc_class *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  objc_class *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  char *v39;
  objc_class *v40;
  char *v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  double v50;
  __int16 v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v44 = v6;
    v45 = 2112;
    v46 = v8;
    v47 = 2112;
    v48 = (uint64_t)v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,transitioning session to not active", buf, 0x20u);

  }
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shouldBeCleanedUpDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shouldBeCleanedUpDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v44 = v13;
      v45 = 2112;
      v46 = v15;
      v47 = 2112;
      v48 = (uint64_t)v16;
      v49 = 2112;
      v50 = *(double *)&v19;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache cleanup already scheduled for after %@", buf, 0x2Au);

    }
    goto LABEL_18;
  }
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keyReleaseMessageSendDate");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "sessionEndReason");

    if (v24 == 3)
    {
      -[SMInitiatorCacheManager defaultsManager](self, "defaultsManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:value:", CFSTR("RTDefaultsSafetyCachePersistenceTimeKey"), &unk_1E932D010);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

      if (v28 != 604800.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          v44 = "-[SMInitiatorCacheManager _transitionToNotActiveState:]";
          v45 = 2080;
          v46 = "overriding cache persistence interval";
          v47 = 2048;
          v48 = 0x4122750000000000;
          v49 = 2048;
          v50 = v28;
          v51 = 2112;
          v52 = CFSTR("RTDefaultsSafetyCachePersistenceTimeKey");
          _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setShouldBeCleanedUpDate:", v30);

      v32 = (void *)MEMORY[0x1E0CB3940];
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "shouldBeCleanedUpDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringFromDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("at %@"), v35);
      v12 = objc_claimAutoreleasedReturnValue();

      -[SMInitiatorCacheManager notifyObserversSafetyCacheDidUpdate](self, "notifyObserversSafetyCacheDidUpdate");
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setShouldBeCleanedUpDate:", v36);

  v12 = CFSTR("now");
LABEL_15:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v44 = v39;
    v45 = 2112;
    v46 = v41;
    v47 = 2112;
    v48 = (uint64_t)v42;
    v49 = 2112;
    v50 = *(double *)&v12;
    _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanup cache %@", buf, 0x2Au);

  }
  -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
LABEL_18:

  -[SMInitiatorCacheManager _cleanUpInitiatorContact](self, "_cleanUpInitiatorContact");
}

- (void)processSessionStartInfoRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void (**v50)(_QWORD, _QWORD);
  void *v51;
  void *v52;
  SMCloudKitQosOptions *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  void (**v62)(_QWORD, _QWORD);
  SEL v63;
  _QWORD v64[4];
  id v65;
  id v66;
  NSObject *v67;
  id v68;
  id v69[2];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isActiveState") & 1) != 0)
      {
        v8 = -[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice");

        if (v8)
        {
          objc_msgSend(v5, "sessionID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "configuration");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sessionID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v9, "isEqual:", v12);

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
          if ((v13 & 1) != 0)
          {
            if (v15)
            {
              -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (objc_class *)objc_opt_class();
              NSStringFromClass(v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v71 = v16;
              v72 = 2112;
              v73 = v18;
              v74 = 2112;
              v75 = v19;
              _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,preparing SMSessionStartInfoMessage", buf, 0x20u);

            }
            -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "configuration");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "sessionType");

            LODWORD(v20) = v22 == 1;
            -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if ((_DWORD)v20)
            {
              objc_msgSend(v23, "configuration");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "time");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "timeBound");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = (void *)MEMORY[0x1E0C99D68];
              -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "configuration");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "time");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "timeBound");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "roundingUpDate:bucketDurationMinute:", v32, *MEMORY[0x1E0D8BB58]);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v23, "estimatedEndDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "coarseEstimatedEndDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_initWeak((id *)buf, self);
            v45 = (objc_class *)objc_opt_class();
            NSStringFromClass(v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v64[0] = MEMORY[0x1E0C809B0];
            v64[1] = 3221225472;
            v64[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke;
            v64[3] = &unk_1E929F660;
            objc_copyWeak(v69, (id *)buf);
            v48 = v47;
            v65 = v48;
            v49 = v46;
            v66 = v49;
            v69[1] = (id)a2;
            v14 = v27;
            v67 = v14;
            v58 = v33;
            v68 = v58;
            v50 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232094](v64);
            -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "invitationTokenMap");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
            {
              -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
              v53 = (SMCloudKitQosOptions *)objc_claimAutoreleasedReturnValue();
              -[SMCloudKitQosOptions invitationTokenMap](v53, "invitationTokenMap");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v50)[2](v50, v54);
            }
            else
            {
              v53 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
              -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "conversation");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v59[0] = MEMORY[0x1E0C809B0];
              v59[1] = 3221225472;
              v59[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_237;
              v59[3] = &unk_1E929F688;
              v60 = v48;
              v61 = v49;
              v63 = a2;
              v62 = v50;
              objc_msgSend(v55, "createNewInvitationTokensWithConversation:qos:completion:", v57, v53, v59);

              v54 = v60;
            }

            objc_destroyWeak(v69);
            objc_destroyWeak((id *)buf);

          }
          else if (v15)
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v71 = v41;
            v72 = 2112;
            v73 = v43;
            v74 = 2112;
            v75 = v44;
            _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sessionID does not match", buf, 0x20u);

          }
          goto LABEL_15;
        }
      }
      else
      {

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1E0D8BA28];
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "convertSessionStateToString:", objc_msgSend(v39, "sessionState"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v71 = v34;
      v72 = 2112;
      v73 = v36;
      v74 = 2112;
      v75 = v37;
      v76 = 2112;
      v77 = v40;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ignore request,state:%@", buf, 0x2Au);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionStartInfoRequest", buf, 2u);
    }
  }
LABEL_15:

}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19[2];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v11;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager is nil", buf, 0x20u);

    }
    goto LABEL_9;
  }
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: invitationTokenMap", buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_233;
  v13[3] = &unk_1E929F638;
  objc_copyWeak(v19, (id *)(a1 + 64));
  v14 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(void **)(a1 + 72);
  v15 = v7;
  v19[1] = v8;
  v16 = v3;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v6, "fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", v13);

  objc_destroyWeak(v19);
LABEL_10:

}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_233(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD block[4];
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_234;
    block[3] = &unk_1E929F610;
    v16 = v5;
    v23 = a2;
    v17 = v7;
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 80);
    v22 = v9;
    v24 = v10;
    dispatch_async(v8, block);

    v11 = v16;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during fetchDeviceConfigurationLowPowerModeWarningStateWithHandler", buf, 0x20u);

    }
  }

}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_234(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;

  if (*(_QWORD *)(a1 + 32))
    v2 = 0;
  else
    v2 = *(_QWORD *)(a1 + 88);
  v23 = objc_alloc(MEMORY[0x1E0D8BA58]);
  objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v24, "sessionType");
  v19 = *(_QWORD *)(a1 + 56);
  v20 = v3;
  v18 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "destinationType");
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationMapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v23, "initWithSessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:", v21, v22, v20, v19, v18, v7, v11, v2);

  objc_msgSend(*(id *)(a1 + 40), "messagingService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conversation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_2;
  v26[3] = &unk_1E929F5E8;
  v27 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 80);
  v17 = *(_QWORD *)(a1 + 96);
  v28 = v16;
  v29 = v17;
  objc_msgSend(v13, "sendIDSMessage:toConversation:completion:", v12, v15, v26);

}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413314;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 1024;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sendIDSMessage returned with status:%d, error:%@", (uint8_t *)&v10, 0x30u);

  }
}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_237(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a2 && (a3 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,nil Invitation Token or fetch failed, error:%@", (uint8_t *)&v12, 0x2Au);

    }
  }

}

- (void)processKeyReleaseInfoRequest:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  objc_class *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "sessionState") == 4)
    {
      v7 = -[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice");

      if (v7)
      {
        objc_msgSend(v5, "sessionID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          -[SMInitiatorCacheManager delegate](self, "delegate");
          v11 = objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke;
          v19[3] = &unk_1E929F700;
          v19[4] = self;
          v19[5] = a2;
          -[NSObject fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:](v11, "fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", v19);
LABEL_13:

          goto LABEL_14;
        }
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          goto LABEL_13;
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v13;
        v22 = 2112;
        v23 = v15;
        v24 = 2112;
        v25 = v16;
        v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,sessionID does not match";
LABEL_12:
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, v17, buf, 0x20u);

        goto LABEL_13;
      }
    }
    else
    {

    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v13;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,ignore SMKeyReleaseInfoRequestMessage";
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyReleaseInfoRequest", buf, 2u);
  }

LABEL_14:
}

void __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke_2;
  v10[3] = &unk_1E929F6D8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v7;
  v13 = a2;
  v14 = v8;
  v9 = v5;
  dispatch_async(v6, v10);

}

void __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[7];

  if (*(_QWORD *)(a1 + 32))
    v27 = 0;
  else
    v27 = *(_QWORD *)(a1 + 48);
  v2 = (void *)MEMORY[0x1E0D8BA40];
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monitorContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isSOSTriggerCategory:", objc_msgSend(v4, "triggerCategory"));

  v5 = objc_alloc(MEMORY[0x1E0D8B978]);
  objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "triggerDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "locationOfTrigger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "monitorContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v24, "triggerCategory");
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safetyCacheKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allowReadToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sessionType");
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = (_BYTE)v2;
  v28 = (void *)objc_msgSend(v5, "initWithSessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:", v30, v6, v22, v20, v19, v18, v9, objc_msgSend(v12, "destinationType"), v17, v27);

  objc_msgSend(*(id *)(a1 + 40), "messagingService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conversation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke_3;
  v31[3] = &unk_1E929F6B0;
  v16 = *(_QWORD *)(a1 + 56);
  v31[4] = *(_QWORD *)(a1 + 40);
  v31[5] = v16;
  objc_msgSend(v13, "sendIDSMessage:toConversation:completion:", v28, v15, v31);

}

void __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413314;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 1024;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sendIDSMessage returned with status:%d, error:%@", (uint8_t *)&v11, 0x30u);

  }
}

- (void)_sendKeyReleaseMessageForIsSecondarySOSTrigger:(BOOL)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34[2];
  BOOL v35;
  _BYTE location[12];
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager _cancelScheduledKeyRelease](self, "_cancelScheduledKeyRelease");
  if (a3)
    goto LABEL_2;
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyReleaseMessageSendDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shouldBeCleanedUpDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
LABEL_2:
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "monitorContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "triggerCategory");

      if (v8 == 15)
      {
        -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sessionStateTransitionDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setKeyReleaseMessageSendDate:", v10);

        -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
      }
      else
      {
        objc_initWeak((id *)location, self);
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke;
        v31[3] = &unk_1E929F7C8;
        objc_copyWeak(v34, (id *)location);
        v17 = v16;
        v32 = v17;
        v18 = v15;
        v33 = v18;
        v34[1] = (id)a2;
        v35 = a3;
        -[SMInitiatorCacheManager _fetchLocationWithCompletion:](self, "_fetchLocationWithCompletion:", v31);

        objc_destroyWeak(v34);
        objc_destroyWeak((id *)location);
      }
      return;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "keyReleaseMessageSendDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringFromDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138413314;
    *(_QWORD *)&location[4] = v22;
    v37 = 2112;
    v38 = v24;
    v39 = 2112;
    v40 = v25;
    v41 = 2112;
    v42 = v28;
    v43 = 2112;
    v44 = v30;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,either Key Release message already sent,%@,or session ended and being cleaned up,%@", location, 0x34u);

  }
}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  NSObject *v52;
  id v53[2];
  char v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "initiatorContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shouldBeCleanedUpDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v56 = v13;
        v57 = 2112;
        v58 = v12;
        v59 = 2112;
        v60 = v14;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session ended during location fetch", buf, 0x20u);

      }
    }
    else
    {
      if (v6 || !objc_msgSend(v5, "isValid"))
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v47 = *(_QWORD *)(a1 + 32);
          v46 = *(_QWORD *)(a1 + 40);
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v56 = v47;
          v57 = 2112;
          v58 = v46;
          v59 = 2112;
          v60 = v48;
          v61 = 2112;
          v62 = v6;
          _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched nil location or error:%@", buf, 0x2Au);

        }
        v30 = 0;
      }
      else
      {
        v18 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(v5, "latitude");
        v20 = v19;
        objc_msgSend(v5, "longitude");
        v22 = v21;
        objc_msgSend(v5, "hunc");
        v24 = v23;
        objc_msgSend(v5, "altitude");
        v26 = v25;
        objc_msgSend(v5, "vunc");
        v28 = v27;
        objc_msgSend(v5, "date");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v18, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", v29, 1, v20, v22, v24, v26, v28, 0.0);

      }
      if (!*(_BYTE *)(a1 + 64))
      {
        objc_msgSend(v8, "initiatorContact");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setLocationOfTrigger:", v30);

        objc_msgSend(v8, "sessionManagerState");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sessionStateTransitionDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "initiatorContact");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setTriggerDate:", v34);

        objc_msgSend(v8, "sessionManagerState");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "configuration");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "sessionStartDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeIntervalSinceNow");
        v40 = v39;
        objc_msgSend(v8, "initiatorContact");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setTimeTilCacheRelease:", -v40);

        objc_msgSend(v8, "initiatorContact");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setWasCacheReleased:", 1);

        objc_msgSend(v8, "_updateInitiatorContactInStore");
      }
      objc_msgSend(v8, "delegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_241;
      v49[3] = &unk_1E929F7A0;
      objc_copyWeak(v53, (id *)(a1 + 48));
      v50 = *(id *)(a1 + 32);
      v44 = *(id *)(a1 + 40);
      v45 = *(void **)(a1 + 56);
      v51 = v44;
      v53[1] = v45;
      v11 = v30;
      v52 = v11;
      v54 = *(_BYTE *)(a1 + 64);
      objc_msgSend(v43, "fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", v49);

      objc_destroyWeak(v53);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v56 = v16;
      v57 = 2112;
      v58 = v15;
      v59 = 2112;
      v60 = v17;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during location fetch", buf, 0x20u);

    }
  }

}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_241(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD block[4];
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21[3];
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_242;
    block[3] = &unk_1E929F778;
    v16 = v5;
    v21[1] = a2;
    v17 = v7;
    v18 = *(id *)(a1 + 48);
    objc_copyWeak(v21, (id *)(a1 + 56));
    v19 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(void **)(a1 + 64);
    v20 = v9;
    v21[2] = v10;
    v22 = *(_BYTE *)(a1 + 72);
    dispatch_async(v8, block);

    objc_destroyWeak(v21);
    v11 = v16;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during fetchDeviceConfigurationLowPowerModeWarningStateWithHandler", buf, 0x20u);

    }
  }

}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_242(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40[2];
  char v41;

  if (*(_QWORD *)(a1 + 32))
    v33 = 0;
  else
    v33 = *(_QWORD *)(a1 + 80);
  v2 = (void *)MEMORY[0x1E0D8BA40];
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monitorContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isSOSTriggerCategory:", objc_msgSend(v4, "triggerCategory"));

  v29 = objc_alloc(MEMORY[0x1E0D8B988]);
  objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sessionStateTransitionDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "monitorContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v31, "triggerCategory");
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "safetyCacheKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "allowReadToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sessionType");
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = v5;
  v34 = (void *)objc_msgSend(v29, "initWithSessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:", v6, v27, v28, v25, v24, v7, v10, objc_msgSend(v13, "destinationType"), v23, v33);

  objc_msgSend(*(id *)(a1 + 40), "messagingService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startMessageGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conversation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "summaryText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_2;
  v36[3] = &unk_1E929F750;
  objc_copyWeak(v40, (id *)(a1 + 72));
  v37 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 64);
  v21 = *(void **)(a1 + 88);
  v38 = v20;
  v40[1] = v21;
  v41 = *(_BYTE *)(a1 + 96);
  v22 = v34;
  v39 = v22;
  objc_msgSend(v14, "sendMadridMessage:associatedGUID:toConversation:summaryText:completion:", v22, v16, v18, v19, v36);

  objc_destroyWeak(v40);
}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;
  char v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_244;
    v18[3] = &unk_1E929F728;
    v19 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 64);
    v20 = v12;
    v25 = v13;
    v26 = a3;
    v21 = v7;
    v22 = v8;
    v27 = *(_BYTE *)(a1 + 72);
    v23 = v10;
    v24 = *(id *)(a1 + 48);
    dispatch_async(v11, v18);

    v14 = v19;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during message send", buf, 0x20u);

    }
  }

}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_244(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("succeeded");
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    if (!*(_BYTE *)(a1 + 88))
      v7 = CFSTR("failed");
    v12 = 138413570;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,message send %@,messageGUID,%@,error,%@", (uint8_t *)&v12, 0x3Eu);

  }
  if (!*(_BYTE *)(a1 + 89))
  {
    objc_msgSend(*(id *)(a1 + 72), "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "initiatorContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKeyReleaseMessageSendDate:", v10);

    objc_msgSend(*(id *)(a1 + 64), "_updateInitiatorContactInStore");
  }
}

- (void)_sendCacheUpdatedMessage
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  SEL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shouldBeCleanedUpDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v7;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initiatorContact should be cleaned up", buf, 0x20u);

    }
  }
  else
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keyReleaseMessageSendDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      return;
    v13 = objc_alloc(MEMORY[0x1E0D8B900]);
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v13, "initWithSessionID:", v14);

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager messagingService](self, "messagingService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "conversation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__SMInitiatorCacheManager__sendCacheUpdatedMessage__block_invoke;
    v23[3] = &unk_1E929F5E8;
    v24 = v17;
    v25 = v16;
    v26 = a2;
    v21 = v16;
    v22 = v17;
    objc_msgSend(v18, "sendIDSMessage:toConversation:completion:", v6, v20, v23);

  }
}

void __51__SMInitiatorCacheManager__sendCacheUpdatedMessage__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v12 = 138413314;
    v11 = CFSTR("failed");
    v13 = v7;
    v14 = 2112;
    if (a2)
      v11 = CFSTR("succeeded");
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,message send %@ with error %@", (uint8_t *)&v12, 0x34u);

  }
}

- (BOOL)_isEffectivePairedDeviceNearby
{
  void *v2;
  void *v3;
  char v4;

  -[SMInitiatorCacheManager messagingService](self, "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNearby");

  return v4;
}

- (BOOL)_shouldPerformFirstCacheUpdateCKOperation
{
  return 1;
}

- (id)getXpcActivityIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.routined.cacheMaintenance.periodic"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_evaluateAndManagePeriodicCacheUpdate
{
  void *v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActiveState");

  v6 = -[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice");
  v7 = !-[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice")
    && -[SMInitiatorCacheManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413826;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 1024;
    v20 = v5;
    v21 = 1024;
    v22 = v6;
    v23 = 1024;
    v24 = v7;
    v25 = 1024;
    v26 = v5 & (v6 || v7);
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,isActiveState,%d,isActiveDevice,%d,isNonActiveDeviceAndIsCompanionConnected,%d,shouldScheduleCacheUpdates,%d", (uint8_t *)&v13, 0x38u);

  }
  if (v5)
    -[SMInitiatorCacheManager _setupFetchOnZoneUpdates](self, "_setupFetchOnZoneUpdates");
  else
    -[SMInitiatorCacheManager _teardownFetchOnZoneUpdates](self, "_teardownFetchOnZoneUpdates");
  if ((v5 & (v6 || v7)) != 0)
  {
    -[SMInitiatorCacheManager _registerForGeneralNotifications](self, "_registerForGeneralNotifications");
    if (v6)
      -[SMInitiatorCacheManager _registerForActiveNotifications](self, "_registerForActiveNotifications");
    else
      -[SMInitiatorCacheManager _unregisterForActiveNotifications](self, "_unregisterForActiveNotifications");
    -[SMInitiatorCacheManager _schedulePeriodicCacheUpdate](self, "_schedulePeriodicCacheUpdate");
  }
  else
  {
    -[SMInitiatorCacheManager _unregisterForGeneralNotifications](self, "_unregisterForGeneralNotifications");
    -[SMInitiatorCacheManager _unregisterForActiveNotifications](self, "_unregisterForActiveNotifications");
    -[SMInitiatorCacheManager _stopPeriodicCacheUpdate](self, "_stopPeriodicCacheUpdate");
    -[SMInitiatorCacheManager stopCacheUpdateBackstopTimer](self, "stopCacheUpdateBackstopTimer");
  }
}

- (void)_schedulePeriodicCacheUpdate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  RTXPCActivityCriteria *v17;
  NSObject *v18;
  char *v19;
  objc_class *v20;
  char *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34[2];
  _QWORD v35[6];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  double v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!-[SMInitiatorCacheManager isPeriodicallyUpdatingCache](self, "isPeriodicallyUpdatingCache"))
  {
    -[SMInitiatorCacheManager setIsPeriodicallyUpdatingCache:](self, "setIsPeriodicallyUpdatingCache:", 1);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke;
    v35[3] = &unk_1E9297BF0;
    v35[4] = self;
    v35[5] = a2;
    -[SMInitiatorCacheManager _periodicCacheUpdateWithCompletion:](self, "_periodicCacheUpdateWithCompletion:", v35);
    v4 = (void *)MEMORY[0x1E0C99D68];
    -[SMInitiatorCacheManager getCacheUpdateBackstopTimeout](self, "getCacheUpdateBackstopTimeout");
    objc_msgSend(v4, "dateWithTimeIntervalSinceNow:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCacheUpdateBackstopExpiryDate:", v5);

    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
    -[SMInitiatorCacheManager updateCacheUpdateBackstopTimer](self, "updateCacheUpdateBackstopTimer");
    -[SMInitiatorCacheManager defaultsManager](self, "defaultsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("RTDefaultsSafetyCacheUpdateInterval"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
      v11 = 300.0;
      if (v9 != 300.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          v37 = "-[SMInitiatorCacheManager _schedulePeriodicCacheUpdate]";
          v38 = 2080;
          v39 = "overriding cache update interval";
          v40 = 2048;
          v41 = 0x4072C00000000000;
          v42 = 2048;
          v43 = v10;
          v44 = 2112;
          v45 = CFSTR("RTDefaultsSafetyCacheUpdateInterval");
          _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
        }

        v11 = v10;
      }
    }
    else
    {
      v11 = 300.0;
    }
    -[SMInitiatorCacheManager defaultsManager](self, "defaultsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("RTDefaultsSafetyCacheUpdateGracePeriod"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
    }
    else
    {
      v16 = 30.0;
    }
    LOBYTE(v30) = 0;
    v17 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:", 2, 1, 0, 51200, 51200, 1, v11, v16, v11 - v16, v30, &unk_1E93283D0);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v37 = v19;
      v38 = 2112;
      v39 = v21;
      v40 = 2112;
      v41 = (uint64_t)v22;
      v42 = 2048;
      v43 = v11;
      v44 = 2048;
      v45 = *(const __CFString **)&v16;
      v46 = 2048;
      v47 = v11 - v16;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule xpc activity,interval,%f,grace period,%f,delay,%lf", buf, 0x3Eu);

    }
    objc_initWeak((id *)buf, self);
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager getXpcActivityIdentifier](self, "getXpcActivityIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_258;
    v31[3] = &unk_1E929F7F0;
    objc_copyWeak(v34, (id *)buf);
    v28 = v25;
    v32 = v28;
    v29 = v24;
    v33 = v29;
    v34[1] = (id)a2;
    objc_msgSend(v26, "registerActivityWithIdentifier:criteria:handler:", v27, v17, v31);

    objc_destroyWeak(v34);
    objc_destroyWeak((id *)buf);

  }
}

void __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed initial cache upload", (uint8_t *)&v7, 0x20u);

  }
}

void __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_258(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_2;
    block[3] = &unk_1E9297910;
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v12 = v7;
    v14 = v8;
    v13 = v3;
    dispatch_async(v6, block);

  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "initiatorContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shouldBeCleanedUpDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "initiatorContact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shouldBeCleanedUpDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringFromDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache xpc fired,shouldBeCleanedUpDate %@", buf, 0x2Au);

    }
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
    objc_msgSend(*(id *)(a1 + 32), "_stopPeriodicCacheUpdate");
  }
  else
  {
    if (v5)
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache xpc fired", buf, 0x20u);

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_259;
    v19[3] = &unk_1E9297590;
    v16 = *(void **)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    v21 = *(id *)(a1 + 48);
    v18 = *(_OWORD *)(a1 + 56);
    v17 = (id)v18;
    v22 = v18;
    objc_msgSend(v16, "_periodicCacheUpdateWithCompletion:", v19);

  }
}

uint64_t __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_259(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache xpc completed", (uint8_t *)&v7, 0x20u);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_stopPeriodicCacheUpdate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  if (-[SMInitiatorCacheManager isPeriodicallyUpdatingCache](self, "isPeriodicallyUpdatingCache"))
  {
    -[SMInitiatorCacheManager setIsPeriodicallyUpdatingCache:](self, "setIsPeriodicallyUpdatingCache:", 0);
    -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager getXpcActivityIdentifier](self, "getXpcActivityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteDefaultsForIdentifier:", v5);

    -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager getXpcActivityIdentifier](self, "getXpcActivityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__SMInitiatorCacheManager__stopPeriodicCacheUpdate__block_invoke;
    v8[3] = &unk_1E9297628;
    v8[4] = self;
    v8[5] = a2;
    objc_msgSend(v6, "unregisterActivityWithIdentifier:handler:", v7, v8);

  }
}

void __51__SMInitiatorCacheManager__stopPeriodicCacheUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413058;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unregisterActivityWithIdentifier with error %@", (uint8_t *)&v9, 0x2Au);

  }
}

- (void)_periodicCacheUpdateWithCompletion:(id)a3
{
  void (**v5)(_QWORD);
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  dispatch_block_t v28;
  void (**v29)(_QWORD);
  id v30;
  dispatch_block_t v31;
  dispatch_time_t v32;
  NSObject *v33;
  id *v34;
  id *v35;
  NSObject *v36;
  void *v37;
  objc_class *v38;
  id v39;
  void *v40;
  _QWORD v41[7];
  id v42[2];
  _QWORD v43[7];
  id v44[2];
  _QWORD v45[4];
  id v46;
  id v47;
  id v48[2];
  _QWORD block[5];
  id v50;
  void (**v51)(_QWORD);
  id v52[2];
  id location;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v6, OS_SIGNPOST_EVENT, v8, "SMUpdateInitiatorSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  -[SMInitiatorCacheManager cacheUploadInProgress](self, "cacheUploadInProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    v17 = (void *)MEMORY[0x1E0C99D68];
    -[SMInitiatorCacheManager getCacheUpdateBackstopTimeout](self, "getCacheUpdateBackstopTimeout");
    objc_msgSend(v17, "dateWithTimeIntervalSinceNow:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCacheUpdateBackstopExpiryDate:", v18);

    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
    -[SMInitiatorCacheManager updateCacheUpdateBackstopTimer](self, "updateCacheUpdateBackstopTimer");
    v20 = (void *)objc_opt_new();
    -[SMInitiatorCacheManager setCacheUploadInProgress:](self, "setCacheUploadInProgress:", v20);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v55 = v22;
      v56 = 2112;
      v57 = v24;
      v58 = 2112;
      v59 = v25;
      v60 = 2112;
      v61 = v20;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache started %@", buf, 0x2Au);

    }
    objc_initWeak(&location, self);
    v26 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke;
    block[3] = &unk_1E929F818;
    objc_copyWeak(v52, &location);
    block[4] = self;
    v52[1] = (id)a2;
    v51 = v5;
    v27 = v20;
    v50 = v27;
    v28 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    v45[0] = v26;
    v45[1] = 3221225472;
    v45[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_261;
    v45[3] = &unk_1E929F840;
    objc_copyWeak(v48, &location);
    v29 = v28;
    v47 = v29;
    v48[1] = (id)a2;
    v30 = v27;
    v46 = v30;
    v31 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v45);
    v32 = dispatch_time(0, 60000000000);
    -[SMInitiatorCacheManager queue](self, "queue");
    v33 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v32, v33, v31);

    if (-[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice"))
    {
      if (!-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary](self, "_isEligibleForCacheUpdateAndPerformRecoveryIfNecessary"))
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v55 = v37;
          v56 = 2112;
          v57 = v39;
          v58 = 2112;
          v59 = v40;
          _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@, not eligible for cache update", buf, 0x20u);

        }
        v29[2](v29);
        goto LABEL_18;
      }
      v43[0] = v26;
      v43[1] = 3221225472;
      v43[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_262;
      v43[3] = &unk_1E929F890;
      v34 = (id *)v43;
      v35 = v44;
      objc_copyWeak(v44, &location);
      v43[5] = v31;
      v43[6] = v29;
      v44[1] = (id)a2;
      v43[4] = v30;
      -[SMInitiatorCacheManager _updateCacheDataWithCompletion:](self, "_updateCacheDataWithCompletion:", v43);
    }
    else
    {
      v41[0] = v26;
      v41[1] = 3221225472;
      v41[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_265;
      v41[3] = &unk_1E929F890;
      v34 = (id *)v41;
      v35 = v42;
      objc_copyWeak(v42, &location);
      v41[5] = v31;
      v41[6] = v29;
      v42[1] = (id)a2;
      v41[4] = v30;
      -[SMInitiatorCacheManager _updateCacheDataForNonActiveDeviceWithCompletion:](self, "_updateCacheDataForNonActiveDeviceWithCompletion:", v41);
    }

    objc_destroyWeak(v35);
LABEL_18:

    objc_destroyWeak(v48);
    objc_destroyWeak(v52);
    objc_destroyWeak(&location);

    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager cacheUploadInProgress](self, "cacheUploadInProgress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v55 = v12;
    v56 = 2112;
    v57 = v14;
    v58 = 2112;
    v59 = v15;
    v60 = 2112;
    v61 = v16;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache already in progress %@", buf, 0x2Au);

  }
  v5[2](v5);
LABEL_19:

}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(WeakRetained, "cacheUploadInProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

    if ((_DWORD)v4)
    {
      objc_msgSend(v3, "setCacheUploadInProgress:", 0);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "sessionUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        v17 = 138413058;
        v18 = v7;
        v19 = 2112;
        v20 = v9;
        v21 = 2112;
        v22 = v10;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache completed %@", (uint8_t *)&v17, 0x2Au);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released before completion called", (uint8_t *)&v17, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_261(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "sessionUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138413058;
      v10 = v4;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache timeout fired %@", (uint8_t *)&v9, 0x2Au);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_262(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "sessionUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v3;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache updateCache completed %@, cache, %@", buf, 0x34u);

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "cacheUploadInProgress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

    if ((_DWORD)v11)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_263;
      v20[3] = &unk_1E929F868;
      v21 = *(id *)(a1 + 40);
      objc_copyWeak(&v23, (id *)(a1 + 56));
      v22 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "_uploadCache:completion:", v3, v20);

      objc_destroyWeak(&v23);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "sessionUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        objc_msgSend(WeakRetained, "cacheUploadInProgress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v25 = v14;
        v26 = 2112;
        v27 = v16;
        v28 = 2112;
        v29 = v17;
        v30 = 2112;
        v31 = v18;
        v32 = 2112;
        v33 = v19;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache was canceled %@, active %@", buf, 0x34u);

      }
      dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_263(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "initiatorContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeCacheUploadCompletion:", v2);

  objc_msgSend(WeakRetained, "_updateInitiatorContactInStore");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_265(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "sessionUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v3;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,non-active uploadCache updateCache completed %@, cache, %@", buf, 0x34u);

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "cacheUploadInProgress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

    if ((_DWORD)v11)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_266;
      v20[3] = &unk_1E929F868;
      v21 = *(id *)(a1 + 40);
      objc_copyWeak(&v23, (id *)(a1 + 56));
      v22 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "_uploadCacheForNonActiveDevice:completion:", v3, v20);

      objc_destroyWeak(&v23);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "sessionUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        objc_msgSend(WeakRetained, "cacheUploadInProgress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v25 = v14;
        v26 = 2112;
        v27 = v16;
        v28 = 2112;
        v29 = v17;
        v30 = 2112;
        v31 = v18;
        v32 = 2112;
        v33 = v19;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,non-active uploadCache was canceled %@, active %@", buf, 0x34u);

      }
      dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_266(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "initiatorContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeCacheUploadCompletion:", v2);

  objc_msgSend(WeakRetained, "_updateInitiatorContactInStore");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_updateCacheDataWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  objc_class *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  objc_class *v33;
  id v34;
  id v35;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const char *aSelector;
  id v57;
  _QWORD v58[4];
  id v59;
  uint8_t *v60;
  id v61[2];
  char v62;
  _QWORD v63[4];
  id v64;
  uint8_t *v65;
  _QWORD v66[5];
  id v67;
  uint8_t *v68;
  _QWORD v69[4];
  id v70;
  uint64_t *v71;
  uint8_t *v72;
  uint8_t v73[8];
  uint8_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  if (!v57)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v73 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v73, 2u);
    }

    goto LABEL_21;
  }
  aSelector = a2;
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shouldBeCleanedUpDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 0;
    *(_QWORD *)v73 = 0;
    v74 = v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__81;
    v77 = __Block_byref_object_dispose__81;
    v78 = 0;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke;
    v69[3] = &unk_1E929F8B8;
    v71 = &v79;
    v70 = v57;
    v72 = v73;
    v38 = (void *)MEMORY[0x1D8232094](v69);
    v37 = objc_alloc(MEMORY[0x1E0D8B8F8]);
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "cache");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "identifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v55;
    if (!v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "cache");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "deviceStatus");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_opt_new();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "unlockLocation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "lockLocation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "cache");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mostRecentLocation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "startingLocation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "offWristLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "parkedCarLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "destinationMapItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "workoutEvents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    v19 = objc_msgSend(v37, "initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:", v39, v45, v44, v40, v43, v42, v41, v11, v13, v15, v18);
    v20 = (void *)*((_QWORD *)v74 + 5);
    *((_QWORD *)v74 + 5) = v19;

    if (!v55)
    if (!*((_QWORD *)v74 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v84 = v32;
        v85 = 2112;
        v86 = v34;
        v87 = 2112;
        v88 = v35;
        v89 = 2112;
        v90 = v36;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,default initializing cache due to failure to extract existing initiator contact data,%@", buf, 0x2Au);

      }
      v22 = objc_opt_new();
      v23 = (void *)*((_QWORD *)v74 + 5);
      *((_QWORD *)v74 + 5) = v22;

    }
    v24 = objc_msgSend(MEMORY[0x1E0D8B9B0], "shareAllLocations");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v84 = v26;
      v85 = 2112;
      v86 = v28;
      v87 = 2112;
      v88 = v29;
      v89 = 1024;
      LODWORD(v90) = v24;
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,updating cache data,shareAllLocations,%d", buf, 0x26u);

    }
    if (v24)
    {
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_268;
      v66[3] = &unk_1E929F8E0;
      v66[4] = self;
      v68 = v73;
      v67 = v38;
      -[SMInitiatorCacheManager _requestSmoothedLocationsWithCompletion:](self, "_requestSmoothedLocationsWithCompletion:", v66);

    }
    else
    {
      objc_msgSend(*((id *)v74 + 5), "setUnlockLocation:", 0);
      objc_msgSend(*((id *)v74 + 5), "setLockLocation:", 0);
      objc_msgSend(*((id *)v74 + 5), "setStartingLocation:", 0);
      objc_msgSend(*((id *)v74 + 5), "setOffWristLocation:", 0);
      objc_msgSend(*((id *)v74 + 5), "setParkedCarLocation:", 0);
      ++v80[3];
    }
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_2;
    v63[3] = &unk_1E929F908;
    v65 = v73;
    v30 = v38;
    v64 = v30;
    -[SMInitiatorCacheManager _fetchDeviceStatusWithCompletion:](self, "_fetchDeviceStatusWithCompletion:", v63);
    objc_initWeak((id *)buf, self);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_3;
    v58[3] = &unk_1E929F930;
    objc_copyWeak(v61, (id *)buf);
    v60 = v73;
    v61[1] = (id)aSelector;
    v62 = v24;
    v31 = v30;
    v59 = v31;
    -[SMInitiatorCacheManager _fetchLocationWithCompletion:](self, "_fetchLocationWithCompletion:", v58);

    objc_destroyWeak(v61);
    objc_destroyWeak((id *)buf);

    _Block_object_dispose(v73, 8);
    _Block_object_dispose(&v79, 8);
LABEL_21:
    v8 = v57;
    goto LABEL_22;
  }
  v7 = (void *)objc_opt_new();
  v8 = v57;
  (*((void (**)(id, void *))v57 + 2))(v57, v7);

LABEL_22:
}

_QWORD *__58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke(_QWORD *result)
{
  if (++*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) == 3)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[4] + 16))(result[4], *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40));
  return result;
}

uint64_t __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_268(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "storeCAMetricForAllLocations:", v4);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setLocationsDuringSession:", v5);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

uint64_t __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDeviceStatus:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5 && !a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMostRecentLocation:", v5);
    objc_msgSend(WeakRetained, "initiatorContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startingLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isValid") & 1) != 0)
    {

    }
    else
    {
      v9 = objc_msgSend(v5, "isValid");

      if (v9)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "sessionUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "latitude");
          v16 = v15;
          objc_msgSend(v5, "longitude");
          v18 = v17;
          objc_msgSend(v5, "hunc");
          v21 = 138413570;
          v22 = v11;
          v23 = 2112;
          v24 = v13;
          v25 = 2112;
          v26 = v14;
          v27 = 2048;
          v28 = v16;
          v29 = 2048;
          v30 = v18;
          v31 = 2048;
          v32 = v19;
          _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,saving starting location,lat,%.4f,lon,%.4f,hunc,%.1f", (uint8_t *)&v21, 0x3Eu);

        }
        objc_msgSend(WeakRetained, "initiatorContact");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setStartingLocation:", v5);

        objc_msgSend(WeakRetained, "_updateInitiatorContactInStore");
        if (*(_BYTE *)(a1 + 64))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setStartingLocation:", v5);
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_requestSmoothedLocationsWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  const char *aSelector;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30[2];
  id location;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    aSelector = a2;
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "initWithStartDate:endDate:", v9, v10);

    LOBYTE(v24) = 1;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:", v11, 1000, 0, 14, 1, 1, 250.0, 30.0, v24);
    objc_initWeak(&location, self);
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v17;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching smoothed locations", buf, 0x20u);

    }
    -[SMInitiatorCacheManager locationManager](self, "locationManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke;
    v26[3] = &unk_1E929F998;
    objc_copyWeak(v30, &location);
    v29 = v5;
    v22 = v13;
    v27 = v22;
    v23 = v15;
    v28 = v23;
    v30[1] = (id)aSelector;
    objc_msgSend(v21, "fetchStoredLocationsWithOptions:handler:", v12, v26);

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }

}

void __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke_2;
    v14[3] = &unk_1E9298128;
    v15 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 64);
    v16 = v10;
    v20 = v11;
    v17 = v6;
    v18 = v5;
    v19 = *(id *)(a1 + 48);
    dispatch_async(v9, v14);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  _RTMap *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = objc_msgSend(*(id *)(a1 + 56), "count");
    *(_DWORD *)buf = 138413314;
    v37 = v3;
    v38 = 2112;
    v39 = v4;
    v40 = 2112;
    v41 = v5;
    v42 = 2112;
    v43 = v6;
    v44 = 2048;
    v45 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched smoothed locations with Error: %@, locationCount: %lu", buf, 0x34u);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v8 = *(_QWORD *)(a1 + 64);
    v9 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = *(id *)(a1 + 56);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v11)
    {
      v13 = v11;
      v30 = *(_QWORD *)v32;
      v14 = 0x1E0D8B000uLL;
      *(_QWORD *)&v12 = 138412802;
      v28 = v12;
      do
      {
        v15 = 0;
        v29 = v13;
        do
        {
          if (*(_QWORD *)v32 != v30)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v15);
          if (objc_msgSend(*(id *)(v14 + 2456), "isCLLocationValid:", v16, v28))
          {
            objc_msgSend(v9, "addObject:", v16);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = a1;
              v19 = *(_QWORD *)(a1 + 32);
              v20 = v10;
              v21 = v9;
              v22 = *(_QWORD *)(v18 + 40);
              NSStringFromSelector(*(SEL *)(v18 + 72));
              v23 = v14;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v28;
              v37 = v19;
              v38 = 2112;
              v39 = v22;
              v9 = v21;
              v10 = v20;
              v40 = 2112;
              v41 = v24;
              _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,filtering out invalid location", buf, 0x20u);

              a1 = v18;
              v14 = v23;
              v13 = v29;
            }

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v9, "count"))
    {
      v25 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v9);
      -[_RTMap withBlock:](v25, "withBlock:", &__block_literal_global_277);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v26);
    }
    else
    {
      v27 = *(_QWORD *)(a1 + 64);
      v26 = (void *)objc_opt_new();
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v26);
    }

  }
}

id __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke_275(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D8B998];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCLLocation:", v3);

  return v4;
}

- (void)_fetchDeviceStatusWithCompletion:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  dispatch_block_t v10;
  id v11;
  id v12;
  dispatch_block_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  dispatch_time_t when;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t *v35;
  id v36[2];
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  uint8_t *v44;
  id v45[2];
  _QWORD v46[4];
  _QWORD v47[4];
  id v48;
  id v49;
  id v50[2];
  _QWORD block[4];
  id v52;
  id v53;
  id v54[2];
  uint8_t v55[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  id location;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  if (v31)
  {
    objc_initWeak(&location, self);
    *(_QWORD *)v55 = 0;
    v56 = v55;
    v57 = 0x2020000000;
    v58 = 0;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    when = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke;
    block[3] = &unk_1E929F9C0;
    objc_copyWeak(v54, &location);
    v8 = v7;
    v52 = v8;
    v9 = v6;
    v53 = v9;
    v54[1] = (id)a2;
    v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_279;
    v47[3] = &unk_1E929F9C0;
    objc_copyWeak(v50, &location);
    v11 = v8;
    v48 = v11;
    v12 = v9;
    v49 = v12;
    v50[1] = (id)a2;
    v13 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v47);
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    v46[3] = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_280;
    v37[3] = &unk_1E929F9E8;
    objc_copyWeak(v45, &location);
    v14 = v11;
    v38 = v14;
    v15 = v12;
    v39 = v15;
    v45[1] = (id)a2;
    v16 = v10;
    v40 = v16;
    v17 = v13;
    v41 = v17;
    v43 = v46;
    v44 = v55;
    v42 = v31;
    -[SMInitiatorCacheManager setDeviceStatusReturnBlock:](self, "setDeviceStatusReturnBlock:", v37);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v16;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v61 = v20;
      v62 = 2112;
      v63 = v22;
      v64 = 2112;
      v65 = v23;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching device status", buf, 0x20u);

    }
    if (-[SMInitiatorCacheManager wifiStrength](self, "wifiStrength"))
    {
      -[SMInitiatorCacheManager deviceStatusReturnBlock](self, "deviceStatusReturnBlock");
      v24 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, 2);
    }
    else
    {
      -[SMInitiatorCacheManager setWifiLinkQualityFetchInProgress:](self, "setWifiLinkQualityFetchInProgress:", 1);
      -[SMInitiatorCacheManager queue](self, "queue");
      v24 = objc_claimAutoreleasedReturnValue();
      dispatch_after(when, (dispatch_queue_t)v24, v19);
    }

    if (-[SMInitiatorCacheManager cellularStrength](self, "cellularStrength"))
    {
      -[SMInitiatorCacheManager deviceStatusReturnBlock](self, "deviceStatusReturnBlock");
      v26 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v26, 3);
    }
    else
    {
      -[SMInitiatorCacheManager setCellularLinkQualityFetchInProgress:](self, "setCellularLinkQualityFetchInProgress:", 1);
      -[SMInitiatorCacheManager queue](self, "queue");
      v26 = objc_claimAutoreleasedReturnValue();
      dispatch_after(when, (dispatch_queue_t)v26, v17);
    }

    -[SMInitiatorCacheManager batteryManager](self, "batteryManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_283;
    v32[3] = &unk_1E929FA38;
    objc_copyWeak(v36, &location);
    v28 = v14;
    v33 = v28;
    v29 = v15;
    v36[1] = (id)a2;
    v34 = v29;
    v35 = v55;
    objc_msgSend(v27, "fetchCurrentBatteryPercent:", v32);

    objc_destroyWeak(v36);
    objc_destroyWeak(v45);
    _Block_object_dispose(v46, 8);

    objc_destroyWeak(v50);
    objc_destroyWeak(v54);

    _Block_object_dispose(v55, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v55 = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v55, 2u);
    }

  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t)v3;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1D1A22000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", (uint8_t *)&v12, 0x20u);

    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1D1A22000, (os_log_t)v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,wifiDeviceStatusTimeoutBlock timeout fired", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(WeakRetained, "deviceStatusReturnBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "deviceStatusReturnBlock");
    v4 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 2);
LABEL_8:

  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_279(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t)v3;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1D1A22000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", (uint8_t *)&v12, 0x20u);

    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1D1A22000, (os_log_t)v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cellularDeviceStatusTimeoutBlock timeout fired", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(WeakRetained, "deviceStatusReturnBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "deviceStatusReturnBlock");
    v4 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 3);
LABEL_8:

  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_280(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  dispatch_block_t *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v10;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,deviceStatusReturnBlock, object has been cleaned up", buf, 0x20u);

    }
    goto LABEL_19;
  }
  if (a2 == 3)
  {
    if (!objc_msgSend(WeakRetained, "cellularLinkQualityFetchInProgress"))
      goto LABEL_11;
    objc_msgSend(v5, "setCellularLinkQualityFetchInProgress:", 0);
    v6 = (dispatch_block_t *)(a1 + 56);
    goto LABEL_10;
  }
  if (a2 == 2 && objc_msgSend(WeakRetained, "wifiLinkQualityFetchInProgress"))
  {
    objc_msgSend(v5, "setWifiLinkQualityFetchInProgress:", 0);
    v6 = (dispatch_block_t *)(a1 + 48);
LABEL_10:
    dispatch_block_cancel(*v6);
  }
LABEL_11:
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 3)
  {
    v11 = objc_alloc(MEMORY[0x1E0D8B930]);
    objc_msgSend(v5, "initiatorContact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v17 = objc_msgSend(v5, "cellularStrength");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:", v15, v16, v17, v18, objc_msgSend(v5, "wifiStrength"));

    if (!v14)
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "sessionUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v5, "wifiStrength");
      v24 = objc_msgSend(v5, "cellularStrength");
      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      *(_DWORD *)buf = 138413570;
      v28 = v20;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      v33 = 1024;
      v34 = v23;
      v35 = 1024;
      v36 = v24;
      v37 = 1024;
      v38 = v25;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,deviceStatusReturnBlock,wifistrength:%d,cellularstrength:%d,batteryRemaining:%d", buf, 0x32u);

    }
    objc_msgSend(v5, "setDeviceStatusReturnBlock:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_19:

  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_283(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_284;
    block[3] = &unk_1E929FA10;
    v15 = v5;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 64);
    v19 = a2;
    v9 = *(_QWORD *)(a1 + 48);
    v16 = v7;
    v17 = v9;
    v18 = v8;
    dispatch_async(v6, block);

    v10 = v15;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", buf, 0x20u);

    }
  }

}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_284(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_DWORD *)(a1 + 64);
    v9 = 138413058;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Updating battery percent %d", (uint8_t *)&v9, 0x26u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(int *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "deviceStatusReturnBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceStatusReturnBlock");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, 1);

  }
}

- (BOOL)_isEligibleForCacheUpdateAndPerformRecoveryIfNecessary
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  char *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaHandoffEnabled") & 1) != 0)
  {
    -[SMInitiatorCacheManager activeSessionDetailsZone](self, "activeSessionDetailsZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isActiveSessionDetailsOutOfSync");

    if (v5)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v26 = (char *)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412802;
        v34 = v26;
        v35 = 2112;
        v36 = v28;
        v37 = 2112;
        v38 = v29;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@, activeSessionDetails is out of sync", (uint8_t *)&v33, 0x20u);

      }
      -[SMInitiatorCacheManager activeSessionDetailsZone](self, "activeSessionDetailsZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateActiveSessionDetailsFromCloudKitRecord");

    }
    -[SMInitiatorCacheManager messagingService](self, "messagingService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();

    -[SMInitiatorCacheManager activeSessionDetailsZone](self, "activeSessionDetailsZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEligibleForCacheUpdateForCurrentDeviceIdentifier:sessionManagerState:", v9, v11);

    if ((v12 & 1) != 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      -[SMInitiatorCacheManager activeSessionDetailsZone](self, "activeSessionDetailsZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "getLatestActiveSessionDetails");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 136315394;
      v34 = "-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary]";
      v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, activeSessionDetails, %@, isEligible YES", (uint8_t *)&v33, 0x16u);

    }
    else
    {
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sessionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activePairedDeviceIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_alloc(MEMORY[0x1E0D8BA80]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v20, "initWithDate:messageID:sessionID:deviceToRequest:", v21, v22, v15, v19);

      -[SMInitiatorCacheManager messagingService](self, "messagingService");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sendIDSMessageToPairedDevice:completion:", v13, &__block_literal_global_288_0);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        -[SMInitiatorCacheManager activeSessionDetailsZone](self, "activeSessionDetailsZone");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "getLatestActiveSessionDetails");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 136315650;
        v34 = "-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary]";
        v35 = 2112;
        v36 = v31;
        v37 = 2112;
        v38 = v32;
        _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "%s, Error-Mismatch activeSessionDetails, %@, sessionManagerState: %@, current device thinks its active and try to perform cacheUpdate; have requested stateUpdate in order to become non-active. Stop cacheUpdate and cacheUpload.",
          (uint8_t *)&v33,
          0x20u);

      }
    }

    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  v12 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v33 = 136315138;
    v34 = "-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary]";
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s: Zelkova Handoff is not enabled; skip the check for cache upload eligibility; return YES",
      (uint8_t *)&v33,
      0xCu);
  }
LABEL_16:

  return v12;
}

void __81__SMInitiatorCacheManager__isEligibleForCacheUpdateAndPerformRecoveryIfNecessary__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary]_block_invoke";
    v8 = 1024;
    v9 = a2;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, sent state update request message with success: %d and error: %@", (uint8_t *)&v6, 0x1Cu);
  }

}

- (void)_updateInitiatorContactWithConversation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (!a3)
  {
    v7 = v3;
    v8 = v4;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", v6, 2u);
    }

  }
}

- (void)_uploadCache:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  SMCloudKitQosOptions *v31;
  void *v32;
  void *v33;
  void *v34;
  SMCloudKitQosOptions *v35;
  void (**v36)(_QWORD);
  objc_class *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  objc_class *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  objc_class *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  double v61;
  unint64_t v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  SMCAMetricCacheUpdate *v66;
  unint64_t v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  objc_class *v73;
  void *v74;
  void *v75;
  void *v76;
  SMCloudKitQosOptions *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  const char *aSelector;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  void (**v88)(_QWORD);
  id v89[2];
  _QWORD v90[5];
  id v91;
  const char *v92;
  _QWORD v93[4];
  void (**v94)(_QWORD);
  _QWORD *v95;
  _QWORD v96[4];
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  id v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (v8)
  {
    if (!v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = (objc_class *)objc_opt_class();
        NSStringFromClass(v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v98 = v72;
        v99 = 2112;
        v100 = v74;
        v101 = 2112;
        v102 = v75;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no cache to upload", buf, 0x20u);

      }
      goto LABEL_6;
    }
    aSelector = a2;
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shouldBeCleanedUpDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v98 = v12;
        v99 = 2112;
        v100 = v14;
        v101 = 2112;
        v102 = v15;
        v103 = 2112;
        v104 = (uint64_t)v16;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initiatorContact should be cleaned up,cache identifier,%@", buf, 0x2Au);

      }
LABEL_6:

      v8[2](v8);
      goto LABEL_35;
    }
    v96[0] = 0;
    v96[1] = v96;
    v96[2] = 0x2020000000;
    v96[3] = 0;
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke;
    v93[3] = &unk_1E929FA80;
    v95 = v96;
    v94 = v8;
    v18 = (void *)MEMORY[0x1D8232094](v93);
    -[SMInitiatorCacheManager _scheduleKeyReleaseWithCompletion:](self, "_scheduleKeyReleaseWithCompletion:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scheduledSendExpiryDate");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = v19;
    v78 = v23;

    -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "runningTask");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "runningTask");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager getXpcActivityIdentifier](self, "getXpcActivityIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v28 == v29;

      if (v30)
      {
        v31 = [SMCloudKitQosOptions alloc];
        -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "runningTask");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "activity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:](v31, "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 0, 0, v34);

LABEL_21:
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke_2;
        v90[3] = &unk_1E9297740;
        v90[4] = self;
        v92 = aSelector;
        v36 = v18;
        v91 = v36;
        -[SMInitiatorCacheManager _writeActiveSessionDetails:qos:completion:](self, "_writeActiveSessionDetails:qos:completion:", 2, v35, v90);
        v77 = v35;
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager queue](self, "queue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = +[SMInitiatorEligibility checkRegulatoryDomainPassedWithQueue:](SMInitiatorEligibility, "checkRegulatoryDomainPassedWithQueue:", v38);

        if (v39)
        {
          objc_msgSend(v7, "outputToDictionary");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[SMCryptoUtilities getSerializedJsonData:](SMCryptoUtilities, "getSerializedJsonData:", v40);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v76, "md5");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "hexString");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "safetyCacheKey");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          +[SMCryptoUtilities encryptSafetyCache:withKey:](SMCryptoUtilities, "encryptSafetyCache:withKey:", v76, v44);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (objc_class *)objc_opt_class();
            NSStringFromClass(v47);
            v48 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v49 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v7, "identifierHash");
            *(_DWORD *)buf = 138413314;
            v98 = v46;
            v99 = 2112;
            v100 = v48;
            v101 = 2112;
            v102 = v49;
            v103 = 2112;
            v104 = (uint64_t)v50;
            v105 = 2048;
            v106 = v51;
            _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploading cache,cache identifier,%@,hash,%lu", buf, 0x34u);

          }
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (objc_class *)objc_opt_class();
            NSStringFromClass(v54);
            v55 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v56 = (id)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v81, "length");
            +[RTRuntime footprint](RTRuntime, "footprint");
            *(_DWORD *)buf = 138413314;
            v98 = v53;
            v99 = 2112;
            v100 = v55;
            v101 = 2112;
            v102 = v56;
            v103 = 2048;
            v104 = v57;
            v105 = 2048;
            v106 = v58;
            _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploading cache,cache size,%lu, current footprint, %.4f MB", buf, 0x34u);

          }
          v59 = objc_msgSend(v81, "length");
          -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "maxCacheSize");
          LODWORD(v59) = v61 < (double)v59;

          if ((_DWORD)v59)
          {
            v62 = objc_msgSend(v81, "length");
            -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setMaxCacheSize:", (double)v62);

            -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
          }
          -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v64 == 0;

          if (v65)
          {
            v66 = objc_alloc_init(SMCAMetricCacheUpdate);
            -[SMInitiatorCacheManager setCaMetricCacheUpdate:](self, "setCaMetricCacheUpdate:", v66);

          }
          v67 = objc_msgSend(v81, "length");
          -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setCacheSize:", (double)v67);

          objc_initWeak((id *)buf, self);
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke_291;
          v83[3] = &unk_1E929FAA8;
          objc_copyWeak(v89, (id *)buf);
          v84 = v80;
          v85 = v79;
          v89[1] = (id)aSelector;
          v88 = v36;
          v86 = v7;
          v69 = v42;
          v87 = v69;
          -[SMInitiatorCacheManager updateSafetyCacheWithRetry:data:cacheReleaseTime:qos:completion:](self, "updateSafetyCacheWithRetry:data:cacheReleaseTime:qos:completion:", 2, v81, v78, v77, v83);

          objc_destroyWeak(v89);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(aSelector);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v98 = v80;
            v99 = 2112;
            v100 = v79;
            v101 = 2112;
            v102 = v71;
            _os_log_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed regulatory domain check", buf, 0x20u);

          }
          v36[2](v36);
        }

        _Block_object_dispose(v96, 8);
        goto LABEL_35;
      }
    }
    else
    {

    }
    v35 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
  }

LABEL_35:
}

uint64_t __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke(uint64_t result)
{
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == 3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  int v12;
  void *v13;
  __int16 v14;
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
      objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v7;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v4;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details with error %@", (uint8_t *)&v12, 0x2Au);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Active Session Details stored successfully", (uint8_t *)&v12, 0x20u);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke_291(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_processUploadCacheResponseForCache:hashString:success:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, v5);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413314;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 1024;
      v19 = a2;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released before update safety cache response,success,%d,error,%@", (uint8_t *)&v12, 0x30u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)_updateCacheDataForNonActiveDeviceWithCompletion:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, void *);
  uint8_t *v24;
  uint8_t v25[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  if (v5)
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shouldBeCleanedUpDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_opt_new();
      v5[2](v5, v8);

    }
    else
    {
      *(_QWORD *)v25 = 0;
      v26 = v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__81;
      v29 = __Block_byref_object_dispose__81;
      v30 = 0;
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      v13 = (void *)*((_QWORD *)v26 + 5);
      *((_QWORD *)v26 + 5) = v12;

      if (!*((_QWORD *)v26 + 5))
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v32 = v15;
          v33 = 2112;
          v34 = v17;
          v35 = 2112;
          v36 = v18;
          v37 = 2112;
          v38 = v19;
          _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,default initializing cache due to failure to extract existing initiator contact data,%@", buf, 0x2Au);

        }
        v20 = objc_opt_new();
        v21 = (void *)*((_QWORD *)v26 + 5);
        *((_QWORD *)v26 + 5) = v20;

      }
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __76__SMInitiatorCacheManager__updateCacheDataForNonActiveDeviceWithCompletion___block_invoke;
      v22[3] = &unk_1E929F908;
      v24 = v25;
      v23 = v5;
      -[SMInitiatorCacheManager _fetchDeviceStatusWithCompletion:](self, "_fetchDeviceStatusWithCompletion:", v22);

      _Block_object_dispose(v25, 8);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v25, 2u);
    }

  }
}

uint64_t __76__SMInitiatorCacheManager__updateCacheDataForNonActiveDeviceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDeviceStatus:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_uploadCacheForNonActiveDevice:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SMCloudKitQosOptions *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  double v48;
  unint64_t v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  SMCAMetricCacheUpdate *v53;
  unint64_t v54;
  void *v55;
  id v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  SMCloudKitQosOptions *v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  id v66;
  void (**v67)(_QWORD);
  id v68[2];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (v8)
  {
    if (!v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v70 = v57;
        v71 = 2112;
        v72 = v59;
        v73 = 2112;
        v74 = v60;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no cache to upload", buf, 0x20u);

      }
      goto LABEL_6;
    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shouldBeCleanedUpDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v70 = v12;
        v71 = 2112;
        v72 = v14;
        v73 = 2112;
        v74 = v15;
        v75 = 2112;
        v76 = (uint64_t)v16;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initiatorContact should be cleaned up,cache identifier,%@", buf, 0x2Au);

      }
LABEL_6:

      v8[2](v8);
      goto LABEL_27;
    }
    -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "runningTask");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "runningTask");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager getXpcActivityIdentifier](self, "getXpcActivityIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 == v23)
      {
        v24 = [SMCloudKitQosOptions alloc];
        -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "runningTask");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "activity");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:](v24, "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 0, 0, v27);

LABEL_18:
        objc_msgSend(v7, "outputToDictionary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[SMCryptoUtilities getSerializedJsonData:](SMCryptoUtilities, "getSerializedJsonData:", v28);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v63, "md5");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "hexString");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "safetyCacheKey");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SMCryptoUtilities encryptSafetyCache:withKey:](SMCryptoUtilities, "encryptSafetyCache:withKey:", v63, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v70 = v34;
          v71 = 2112;
          v72 = v36;
          v73 = 2112;
          v74 = v37;
          v75 = 2112;
          v76 = (uint64_t)v38;
          v77 = 2048;
          v78 = objc_msgSend(v7, "identifierHash");
          _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploading cache,cache identifier,%@,hash,%lu", buf, 0x34u);

        }
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v32, "length");
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413314;
          v70 = v40;
          v71 = 2112;
          v72 = v42;
          v73 = 2112;
          v74 = v43;
          v75 = 2048;
          v76 = v44;
          v77 = 2048;
          v78 = v45;
          _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploading cache,cache size,%lu, current footprint, %.4f MB", buf, 0x34u);

        }
        v46 = objc_msgSend(v32, "length");
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "maxCacheSize");
        LODWORD(v46) = v48 < (double)v46;

        if ((_DWORD)v46)
        {
          v49 = objc_msgSend(v32, "length");
          -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setMaxCacheSize:", (double)v49);

          -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
        }
        -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51 == 0;

        if (v52)
        {
          v53 = objc_alloc_init(SMCAMetricCacheUpdate);
          -[SMInitiatorCacheManager setCaMetricCacheUpdate:](self, "setCaMetricCacheUpdate:", v53);

        }
        v54 = objc_msgSend(v32, "length");
        -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setCacheSize:", (double)v54);

        objc_initWeak((id *)buf, self);
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __69__SMInitiatorCacheManager__uploadCacheForNonActiveDevice_completion___block_invoke;
        v64[3] = &unk_1E929FAD0;
        objc_copyWeak(v68, (id *)buf);
        v64[4] = self;
        v68[1] = (id)a2;
        v67 = v8;
        v65 = v7;
        v56 = v61;
        v66 = v56;
        -[SMInitiatorCacheManager updateNonActiveSafetyCacheWithRetry:data:qos:completion:](self, "updateNonActiveSafetyCacheWithRetry:data:qos:completion:", 2, v32, v62, v64);

        objc_destroyWeak(v68);
        objc_destroyWeak((id *)buf);

        goto LABEL_27;
      }
    }
    else
    {

    }
    v62 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
  }

LABEL_27:
}

void __69__SMInitiatorCacheManager__uploadCacheForNonActiveDevice_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_processUploadCacheResponseForCache:hashString:success:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, v5);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(0, "sessionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413314;
      v14 = v9;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 1024;
      v20 = a2;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released before update safety cache response,success,%d,error,%@", (uint8_t *)&v13, 0x30u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)updateSafetyCacheWithRetry:(int64_t)a3 data:(id)a4 cacheReleaseTime:(id)a5 qos:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48[3];
  uint64_t v49;
  void *v50;
  _BYTE location[12];
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v38 = v14;
  v39 = v15;
  if (v16)
  {
    if (v13 && v14 && v15)
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager cacheUploadInProgress](self, "cacheUploadInProgress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)location, self);
      -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __91__SMInitiatorCacheManager_updateSafetyCacheWithRetry_data_cacheReleaseTime_qos_completion___block_invoke;
      v40[3] = &unk_1E929FAF8;
      objc_copyWeak(v48, (id *)location);
      v22 = v19;
      v41 = v22;
      v23 = v18;
      v42 = v23;
      v48[1] = (id)a2;
      v47 = v16;
      v48[2] = (id)a3;
      v24 = v20;
      v43 = v24;
      v44 = v13;
      v45 = v38;
      v46 = v39;
      objc_msgSend(v21, "updateSafetyCacheWithData:cacheReleaseTime:qos:completion:", v44, v45, v46, v40);

      objc_destroyWeak(v48);
      objc_destroyWeak((id *)location);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138413570;
        *(_QWORD *)&location[4] = v34;
        v52 = 2112;
        v53 = v36;
        v54 = 2112;
        v55 = v37;
        v56 = 2112;
        v57 = v13;
        v58 = 2112;
        v59 = v38;
        v60 = 2112;
        v61 = v39;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,missing required fields,safetyCacheData,%@,cacheReleaseTime,%@,qos,%@", location, 0x3Eu);

      }
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v49 = *MEMORY[0x1E0CB2D50];
      v27 = (void *)MEMORY[0x1E0CB3940];
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("#SafetyCache,Initiator,sessionID:%@,%@,%@,failed due to invalid parameters"), v28, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v26, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 7, v33);

      (*((void (**)(id, _QWORD, NSObject *))v16 + 2))(v16, 0, v23);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", location, 2u);
    }
  }

}

void __91__SMInitiatorCacheManager_updateSafetyCacheWithRetry_data_cacheReleaseTime_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during safety cache update", (uint8_t *)&v30, 0x20u);

    }
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
    goto LABEL_21;
  }
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,safety cache data updated successfully", (uint8_t *)&v30, 0x20u);

    }
    goto LABEL_20;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v4))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138413058;
    v31 = v18;
    v32 = 2112;
    v33 = v19;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v4;
    v20 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data with non recoverable error %@";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v30, 0x2Au);
    goto LABEL_19;
  }
  if (*(uint64_t *)(a1 + 104) <= 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138413058;
    v31 = v21;
    v32 = 2112;
    v33 = v22;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v4;
    v20 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data after retries with recoverable error %@";
    goto LABEL_18;
  }
  v6 = *(void **)(a1 + 48);
  objc_msgSend(WeakRetained, "cacheUploadInProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,safety cache update timed out", (uint8_t *)&v30, 0x20u);
LABEL_19:

    }
LABEL_20:

    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_21:
    v14();
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 104);
    v30 = 138413314;
    v31 = v26;
    v32 = 2112;
    v33 = v27;
    v34 = 2112;
    v35 = v28;
    v36 = 2112;
    v37 = v4;
    v38 = 1024;
    v39 = v29;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v30, 0x30u);

  }
  objc_msgSend(WeakRetained, "updateSafetyCacheWithRetry:data:cacheReleaseTime:qos:completion:", *(_QWORD *)(a1 + 104) - 1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
LABEL_22:

}

- (void)updateNonActiveSafetyCacheWithRetry:(int64_t)a3 data:(id)a4 qos:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43[3];
  uint64_t v44;
  void *v45;
  _BYTE location[12];
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35 = v12;
  if (v13)
  {
    if (v11 && v12)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager cacheUploadInProgress](self, "cacheUploadInProgress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)location, self);
      -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __83__SMInitiatorCacheManager_updateNonActiveSafetyCacheWithRetry_data_qos_completion___block_invoke;
      v36[3] = &unk_1E929FB20;
      objc_copyWeak(v43, (id *)location);
      v19 = v16;
      v37 = v19;
      v20 = v15;
      v38 = v20;
      v43[1] = (id)a2;
      v42 = v13;
      v43[2] = (id)a3;
      v21 = v17;
      v39 = v21;
      v40 = v11;
      v41 = v35;
      objc_msgSend(v18, "updateSafetyCacheRecordWithData:qos:completion:", v40, v41, v36);

      objc_destroyWeak(v43);
      objc_destroyWeak((id *)location);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138413314;
        *(_QWORD *)&location[4] = v31;
        v47 = 2112;
        v48 = v33;
        v49 = 2112;
        v50 = v34;
        v51 = 2112;
        v52 = v11;
        v53 = 2112;
        v54 = v35;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,missing required fields,safetyCacheData,%@,qos,%@", location, 0x34u);

      }
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v44 = *MEMORY[0x1E0CB2D50];
      v24 = (void *)MEMORY[0x1E0CB3940];
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("#SafetyCache,Initiator,sessionID:%@,%@,%@,failed due to invalid parameters"), v25, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v23, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 7, v30);

      (*((void (**)(id, _QWORD, NSObject *))v13 + 2))(v13, 0, v20);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", location, 2u);
    }
  }

}

void __83__SMInitiatorCacheManager_updateNonActiveSafetyCacheWithRetry_data_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during safety cache update", (uint8_t *)&v30, 0x20u);

    }
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_21;
  }
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,safety cache data updated successfully", (uint8_t *)&v30, 0x20u);

    }
    goto LABEL_20;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v4))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138413058;
    v31 = v18;
    v32 = 2112;
    v33 = v19;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v4;
    v20 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data with non recoverable error %@";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v30, 0x2Au);
    goto LABEL_19;
  }
  if (*(uint64_t *)(a1 + 96) <= 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138413058;
    v31 = v21;
    v32 = 2112;
    v33 = v22;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v4;
    v20 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data after retries with recoverable error %@";
    goto LABEL_18;
  }
  v6 = *(void **)(a1 + 48);
  objc_msgSend(WeakRetained, "cacheUploadInProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,safety cache update timed out", (uint8_t *)&v30, 0x20u);
LABEL_19:

    }
LABEL_20:

    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_21:
    v14();
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 96);
    v30 = 138413314;
    v31 = v26;
    v32 = 2112;
    v33 = v27;
    v34 = 2112;
    v35 = v28;
    v36 = 2112;
    v37 = v4;
    v38 = 1024;
    v39 = v29;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v30, 0x30u);

  }
  objc_msgSend(WeakRetained, "updateNonActiveSafetyCacheWithRetry:data:qos:completion:", *(_QWORD *)(a1 + 96) - 1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
LABEL_22:

}

- (void)_processUploadCacheResponseForCache:(id)a3 hashString:(id)a4 success:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
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
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v7 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "numCacheUpdates") + 1;
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNumCacheUpdates:", v15);

    -[SMInitiatorCacheManager submitCacheUpdateCAMetricForCache:success:error:](self, "submitCacheUpdateCAMetricForCache:success:error:", v11, v7, v13);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v7)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 138412802;
        v60 = v19;
        v61 = 2112;
        v62 = v21;
        v63 = 2112;
        v64 = v22;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully uploaded cache", (uint8_t *)&v59, 0x20u);

      }
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "numberOfSuccessfulCacheUpdates") + 1;
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setNumberOfSuccessfulCacheUpdates:", v24);

      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "syncDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "syncDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceNow");
        v31 = -v30;

        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "maxTimeBetweenCacheUpdates");
        v34 = v33;

        if (v34 < v31)
        {
          -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setMaxTimeBetweenCacheUpdates:", v31);

        }
      }
      objc_msgSend(v11, "locationsDuringSession");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "maxLocationsInTrace");

      if (v37 > v39)
      {
        objc_msgSend(v11, "locationsDuringSession");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setMaxLocationsInTrace:", v41);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setSyncDate:", v43);

      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setPhoneCache:", v11);

      -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
      -[SMInitiatorCacheManager notifyObserversSafetyCacheDidUpdate](self, "notifyObserversSafetyCacheDidUpdate");
      -[SMInitiatorCacheManager _sendCacheUpdatedMessage](self, "_sendCacheUpdatedMessage");
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "phoneCache");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager cacheUploadInProgress](self, "cacheUploadInProgress");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "logCacheForSessionID:role:deviceType:transaction:hashString:", v48, CFSTR("Initiator"), CFSTR("phone"), v49, v12);

      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "watchCache");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager cacheUploadInProgress](self, "cacheUploadInProgress");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "logCacheForSessionID:role:deviceType:transaction:hashString:", v52, CFSTR("Initiator"), CFSTR("watch"), v53, v12);

    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 138413058;
        v60 = v55;
        v61 = 2112;
        v62 = v57;
        v63 = 2112;
        v64 = v58;
        v65 = 2112;
        v66 = v13;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to upload cache with error %@", (uint8_t *)&v59, 0x2Au);

      }
      -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v59) = 0;
      _os_log_error_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cache", (uint8_t *)&v59, 2u);
    }

  }
}

- (BOOL)_shouldScheduleKeyReleaseMessage
{
  void *v2;
  unint64_t v3;

  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sessionState");

  return (v3 < 0xF) & (0x4384u >> v3);
}

- (BOOL)_isKeyReleaseScheduled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduledSendExpiryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (double)_scheduledSendTimeAdvance
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[RTDefaultsManager objectForKey:value:](self->_defaultsManager, "objectForKey:value:", CFSTR("RTDefaultsSafetyCacheScheduledSendTimeAdvanceKey"), &unk_1E932D020);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  if (v5 != 7200.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v21 = 136316162;
      v22 = "-[SMInitiatorCacheManager _scheduledSendTimeAdvance]";
      v23 = 2080;
      v24 = "overriding scheduled send time advance";
      v25 = 2048;
      v26 = 0x40BC200000000000;
      v27 = 2048;
      v28 = v5;
      v29 = 2112;
      v30 = CFSTR("RTDefaultsSafetyCacheScheduledSendTimeAdvanceKey");
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v21, 0x34u);
    }

  }
  -[RTDefaultsManager objectForKey:value:](self->_defaultsManager, "objectForKey:value:", CFSTR("RTDefaultsSafetyCacheScheduledSendTimeAdvancePadding"), &unk_1E932D030);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 != 1800.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v21 = 136316162;
      v22 = "-[SMInitiatorCacheManager _scheduledSendTimeAdvance]";
      v23 = 2080;
      v24 = "overriding scheduled send time padding";
      v25 = 2048;
      v26 = 0x409C200000000000;
      v27 = 2048;
      v28 = v9;
      v29 = 2112;
      v30 = CFSTR("RTDefaultsSafetyCacheScheduledSendTimeAdvancePadding");
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v21, 0x34u);
    }

  }
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sessionType");

  if (v13 == 1)
  {
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "time");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeBound");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceNow");
    v19 = v9 + v18;

    if (v5 < v19)
      return v19;
  }
  return v5;
}

- (id)_scheduleKeyReleaseWithCompletion:(id)a3
{
  void (**v5)(_QWORD);
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  void *v39;
  objc_class *v40;
  __CFString *v41;
  void *v42;
  id v43;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  void (**v51)(_QWORD);
  id v52[2];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  -[SMInitiatorCacheManager _scheduledSendTimeAdvance](self, "_scheduledSendTimeAdvance");
  v7 = v6;
  -[SMInitiatorCacheManager requestTimeFromTimed](self, "requestTimeFromTimed");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7 + v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7 + CFAbsoluteTimeGetCurrent());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

    v14 = v9;
    goto LABEL_12;
  }
  if (!-[SMInitiatorCacheManager _shouldScheduleKeyReleaseMessage](self, "_shouldScheduleKeyReleaseMessage"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID", v45);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D8BA28];
      -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "convertSessionStateToString:", objc_msgSend(v21, "sessionState"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v54 = (uint64_t)v16;
      v55 = 2112;
      v56 = v18;
      v57 = 2112;
      v58 = v19;
      v59 = 2112;
      v60 = v22;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Scheduled Send not needed in state %@", buf, 0x2Au);

    }
    -[SMInitiatorCacheManager _cancelScheduledKeyRelease](self, "_cancelScheduledKeyRelease");
    v5[2](v5);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v23 = v14;
    goto LABEL_29;
  }
  -[SMInitiatorCacheManager defaultsManager](self, "defaultsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsSafetyCacheScheduledSendEnabledKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "BOOLValue", v45))
      v12 = objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaScheduledSendEnabled");
    else
      v12 = 0;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = CFSTR("NO");
      if (v12)
        v30 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v54 = v28;
      v55 = 2112;
      v56 = v30;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, overriding zelkova scheduled send enabled flag, BOOL value is, %@, read by defaultsManager", buf, 0x16u);

    }
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaScheduledSendEnabled", v45);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = CFSTR("NO");
      if (v12)
        v27 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v54 = v25;
      v55 = 2112;
      v56 = v27;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, zelkova scheduled send enabled feature flag, BOOL value is, %@", buf, 0x16u);

    }
  }

  if ((v12 & 1) != 0)
  {
    objc_initWeak((id *)buf, self);
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager setScheduledSendInProgress:](self, "setScheduledSendInProgress:", 1);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke;
    v46[3] = &unk_1E929FBC0;
    objc_copyWeak(v52, (id *)buf);
    v34 = v33;
    v47 = v34;
    v35 = v32;
    v48 = v35;
    v52[1] = (id)a2;
    v51 = v5;
    v36 = v9;
    v49 = v36;
    v50 = v45;
    -[SMInitiatorCacheManager _fetchLocationWithCompletion:](self, "_fetchLocationWithCompletion:", v46);
    v37 = v36;

    objc_destroyWeak(v52);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v54 = (uint64_t)v39;
      v55 = 2112;
      v56 = v41;
      v57 = 2112;
      v58 = v42;
      _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Scheduled Send not enabled", buf, 0x20u);

    }
    v5[2](v5);
    v43 = v9;
  }

  v23 = v9;
LABEL_29:

  return v23;
}

void __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51[2];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "_shouldScheduleKeyReleaseMessage") & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 40);
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v53 = v17;
        v54 = 2112;
        v55 = v16;
        v56 = 2112;
        v57 = v18;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,state change during location fetch,scheduled send no longer needed", buf, 0x20u);

      }
      goto LABEL_6;
    }
    objc_msgSend(v8, "initiatorContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shouldBeCleanedUpDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v53 = v13;
        v54 = 2112;
        v55 = v12;
        v56 = 2112;
        v57 = v14;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session ended during location fetch", buf, 0x20u);

      }
LABEL_6:

      objc_msgSend(v8, "setScheduledSendInProgress:", 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_20;
    }
    if (!v5 || v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v42 = *(_QWORD *)(a1 + 32);
        v41 = *(_QWORD *)(a1 + 40);
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v53 = v42;
        v54 = 2112;
        v55 = v41;
        v56 = 2112;
        v57 = v43;
        v58 = 2112;
        v59 = v6;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched nil location or error:%@", buf, 0x2Au);

      }
      objc_msgSend(v8, "initiatorContact");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setLocationOfTrigger:", 0);

    }
    else
    {
      v19 = objc_alloc(MEMORY[0x1E0D183B0]);
      objc_msgSend(v5, "latitude");
      v21 = v20;
      objc_msgSend(v5, "longitude");
      v23 = v22;
      objc_msgSend(v5, "hunc");
      v25 = v24;
      objc_msgSend(v5, "altitude");
      v27 = v26;
      objc_msgSend(v5, "vunc");
      v29 = v28;
      objc_msgSend(v5, "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v19, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", v30, 1, v21, v23, v25, v27, v29, 0.0);
      objc_msgSend(v8, "initiatorContact");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setLocationOfTrigger:", v31);

    }
    objc_msgSend(v8, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_305;
    v44[3] = &unk_1E929FB98;
    objc_copyWeak(v51, (id *)(a1 + 72));
    v45 = *(id *)(a1 + 32);
    v36 = *(id *)(a1 + 40);
    v37 = *(void **)(a1 + 80);
    v46 = v36;
    v51[1] = v37;
    v47 = *(id *)(a1 + 48);
    v48 = v8;
    v49 = *(id *)(a1 + 56);
    v50 = *(id *)(a1 + 64);
    objc_msgSend(v35, "fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", v44);

    objc_destroyWeak(v51);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v39 = *(_QWORD *)(a1 + 32);
      v38 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v53 = v39;
      v54 = 2112;
      v55 = v38;
      v56 = 2112;
      v57 = v40;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during location fetch", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
LABEL_20:

}

void __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_305(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD block[4];
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24[3];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_306;
    block[3] = &unk_1E929FB70;
    v16 = v5;
    v24[1] = a2;
    v17 = v7;
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(void **)(a1 + 88);
    v21 = v9;
    v24[2] = v10;
    v22 = *(id *)(a1 + 64);
    objc_copyWeak(v24, (id *)(a1 + 80));
    v23 = *(id *)(a1 + 72);
    dispatch_async(v8, block);

    objc_destroyWeak(v24);
    v11 = v16;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during fetchDeviceConfigurationLowPowerModeWarningStateWithHandler", buf, 0x20u);

    }
  }

}

void __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_306(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48[2];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    v40 = 0;
  else
    v40 = *(_QWORD *)(a1 + 104);
  v3 = (uint64_t *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerDate:", v2);

  v6 = objc_alloc(MEMORY[0x1E0D8B988]);
  objc_msgSend(*v4, "sessionUUID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *v3;
  objc_msgSend(*v4, "initiatorContact");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "locationOfTrigger");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v4, "initiatorContact");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "safetyCacheKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v4, "sessionManagerState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sessionType");
  objc_msgSend(*v4, "sessionManagerState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = 0;
  v41 = (void *)objc_msgSend(v6, "initWithSessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:", v35, v34, v33, 15, v7, 0, v10, objc_msgSend(v13, "destinationType"), v32, v40);

  if ((objc_msgSend(*v4, "_isKeyReleaseScheduled") & 1) == 0)
  {
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "initiatorContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScheduledSendExpiryDate:", v14);

  }
  objc_msgSend(*(id *)(a1 + 40), "_updateInitiatorContactInStore");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 72);
    NSStringFromSelector(*(SEL *)(a1 + 112));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "messageID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "stringFromDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v50 = v18;
    v51 = 2112;
    v52 = v17;
    v53 = 2112;
    v54 = v19;
    v55 = 2112;
    v56 = v20;
    v57 = 2112;
    v58 = v21;
    v59 = 2112;
    v60 = v41;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,messageID:%@,scheduling Key Release for %@ with message %@", buf, 0x3Eu);

  }
  objc_msgSend(*(id *)(a1 + 40), "messagingService");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "scheduleSendMessageGUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionManagerState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "startMessageGUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 40), "initiatorContact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "conversation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "summaryText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_307;
  v42[3] = &unk_1E929FB48;
  objc_copyWeak(v48, (id *)(a1 + 96));
  v43 = *(id *)(a1 + 64);
  v29 = *(id *)(a1 + 72);
  v30 = *(void **)(a1 + 112);
  v44 = v29;
  v48[1] = v30;
  v47 = *(id *)(a1 + 88);
  v45 = *(id *)(a1 + 48);
  v31 = v41;
  v46 = v31;
  objc_msgSend(v37, "scheduleMadridMessageSendForMessage:messageGUID:associatedGUID:sendDate:toConversation:summaryText:completion:", v31, v22, v24, v25, v27, v28, v42);

  objc_destroyWeak(v48);
}

void __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_307(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_308;
    v14[3] = &unk_1E929DBE0;
    v15 = v8;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v20 = a3;
    v18 = v6;
    v19 = *(id *)(a1 + 64);
    dispatch_async(v9, v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during message scheduling", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_308(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setScheduledSendInProgress:", 0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "messageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processScheduleKeyReleaseResponseScheduledSendDate:messageID:success:error:", v3, v4, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_processScheduleKeyReleaseResponseScheduledSendDate:(id)a3 messageID:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
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
  uint64_t v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  NSObject *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  const char *aSelector;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: scheduledSendDate";
LABEL_25:
    _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, v37, buf, 2u);
    goto LABEL_10;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: messageID";
    goto LABEL_25;
  }
  aSelector = a2;
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "numberOfMessageScheduling") + 1;
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfMessageScheduling:", v15);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (a5)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate");
      v63 = v13;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "scheduleSendMessageGUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v66 = v19;
      v67 = 2112;
      v68 = v21;
      v69 = 2112;
      v70 = v22;
      v71 = 2112;
      v72 = v12;
      v73 = 2112;
      v74 = (uint64_t)v23;
      v75 = 2112;
      v76 = v25;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,messageID:%@,successfully scheduled Key Release message for %@ with GUID %@", buf, 0x3Eu);

      v13 = v63;
    }

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setScheduledSendExpiryDate:", v11);

    -[SMInitiatorCacheManager delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scheduleSendMessageGUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scheduledSendExpiryDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scheduledSendMessageScheduledForSessionID:guid:date:", v28, v30, v32);

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "numberOfSuccessfulMessageScheduling") + 1;
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setNumberOfSuccessfulMessageScheduling:", v34);

    -[SMInitiatorCacheManager _updateScheduledSendFireTimer](self, "_updateScheduledSendFireTimer");
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate");
      v58 = v13;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v66 = v54;
      v67 = 2112;
      v68 = v56;
      v69 = 2112;
      v70 = v57;
      v71 = 2112;
      v72 = v12;
      v73 = 2112;
      v74 = (uint64_t)v59;
      v75 = 2112;
      v76 = v58;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,messageID:%@,failed to schedule Key Release message for %@ with error %@", buf, 0x3Eu);

      v13 = v58;
    }

    if (-[SMInitiatorCacheManager _isKeyReleaseScheduled](self, "_isKeyReleaseScheduled"))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "scheduleSendMessageGUID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "scheduledSendExpiryDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringFromDate");
        v44 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v66 = v39;
        v67 = 2112;
        v68 = v61;
        v69 = 2112;
        v70 = v41;
        v71 = 2112;
        v72 = v60;
        v73 = 2112;
        v74 = v44;
        v45 = (void *)v44;
        _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,message %@ is still scheduled for %@", buf, 0x34u);

      }
    }
  }
  -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "shouldBeCleanedUpDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {

  }
  else
  {
    v48 = -[SMInitiatorCacheManager _shouldScheduleKeyReleaseMessage](self, "_shouldScheduleKeyReleaseMessage");

    if (v48)
      goto LABEL_23;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v66 = v50;
    v67 = 2112;
    v68 = v52;
    v69 = 2112;
    v70 = v53;
    _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,state changed while scheduling message,canceling newly scheduled message and cleaning up", buf, 0x20u);

  }
  -[SMInitiatorCacheManager _cancelScheduledKeyRelease](self, "_cancelScheduledKeyRelease");
LABEL_23:

}

- (void)_cancelScheduledKeyRelease
{
  void *v3;
  id v4;

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager _cancelScheduledKeyReleaseForConversation:](self, "_cancelScheduledKeyReleaseForConversation:", v3);

}

- (void)_cancelScheduledKeyReleaseForConversation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46[2];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SMInitiatorCacheManager _stopScheduleSendCancelRetry](self, "_stopScheduleSendCancelRetry");
  if (-[SMInitiatorCacheManager _isKeyReleaseScheduled](self, "_isKeyReleaseScheduled"))
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduledSendExpiryDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99D68];
    -[SMInitiatorCacheManager requestTimeFromTimed](self, "requestTimeFromTimed");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isBeforeDate:", v9);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v48 = v13;
        v49 = 2112;
        v50 = v15;
        v51 = 2112;
        v52 = v16;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule send has already fired", buf, 0x20u);

      }
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setScheduledSendExpiryDate:", 0);

      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "shouldBeCleanedUpDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
LABEL_6:
        -[SMInitiatorCacheManager _cleanUpInitiatorContactLocalStore](self, "_cleanUpInitiatorContactLocalStore");
    }
    else
    {
      if (v12)
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v48 = v27;
        v49 = 2112;
        v50 = v29;
        v51 = 2112;
        v52 = v30;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,canceling scheduled message", buf, 0x20u);

      }
      objc_initWeak((id *)buf, self);
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scheduleSendMessageGUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[SMInitiatorCacheManager messagingService](self, "messagingService");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "scheduleSendMessageGUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __69__SMInitiatorCacheManager__cancelScheduledKeyReleaseForConversation___block_invoke;
      v42[3] = &unk_1E929FBE8;
      objc_copyWeak(v46, (id *)buf);
      v39 = v31;
      v43 = v39;
      v40 = v33;
      v44 = v40;
      v46[1] = (id)a2;
      v41 = v35;
      v45 = v41;
      objc_msgSend(v36, "cancelMadridMessageSendForMessageGUID:toConversation:completion:", v38, v5, v42);

      objc_destroyWeak(v46);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = v21;
      v49 = 2112;
      v50 = v23;
      v51 = 2112;
      v52 = v24;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no messages to cancel, early return", buf, 0x20u);

    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shouldBeCleanedUpDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      goto LABEL_6;
  }

}

void __69__SMInitiatorCacheManager__cancelScheduledKeyReleaseForConversation___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SMInitiatorCacheManager__cancelScheduledKeyReleaseForConversation___block_invoke_309;
    block[3] = &unk_1E9297D30;
    v15 = v7;
    v17 = a2;
    v16 = v5;
    dispatch_async(v8, block);

    v9 = v15;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413570;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      v26 = 1024;
      v27 = a2;
      v28 = 2112;
      v29 = v5;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released before scheduled send cancel response,GUID,%@,success,%d,error,%@", buf, 0x3Au);

    }
  }

}

uint64_t __69__SMInitiatorCacheManager__cancelScheduledKeyReleaseForConversation___block_invoke_309(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processCancelScheduledKeyReleaseResponseWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_processCancelScheduledKeyReleaseResponseWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfMessageCancelling") + 1;
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfMessageCancelling:", v9);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scheduleSendMessageGUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138413058;
      v38 = v13;
      v39 = 2112;
      v40 = v15;
      v41 = 2112;
      v42 = v16;
      v43 = 2112;
      v44 = v18;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully canceled scheduled Key Release message %@", (uint8_t *)&v37, 0x2Au);

    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setScheduledSendExpiryDate:", 0);

    -[SMInitiatorCacheManager delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scheduleSendMessageGUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scheduledSendMessageCanceledForSessionID:guid:", v21, v23);

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "numberOfSuccessfulMessageCancelling") + 1;
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfSuccessfulMessageCancelling:", v25);

    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
    -[SMInitiatorCacheManager _updateScheduledSendFireTimer](self, "_updateScheduledSendFireTimer");
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shouldBeCleanedUpDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      -[SMInitiatorCacheManager _cleanUpInitiatorContactLocalStore](self, "_cleanUpInitiatorContactLocalStore");
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "scheduleSendMessageGUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138413314;
      v38 = v31;
      v39 = 2112;
      v40 = v33;
      v41 = 2112;
      v42 = v34;
      v43 = 2112;
      v44 = v36;
      v45 = 2112;
      v46 = v7;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to cancel scheduled Key Release message %@ with error %@", (uint8_t *)&v37, 0x34u);

    }
    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "shouldBeCleanedUpDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      -[SMInitiatorCacheManager _scheduleScheduleSendCancelRetry](self, "_scheduleScheduleSendCancelRetry");
  }

}

- (id)_getScheduleSendCancelRetryXpcActivityIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.routined.scheduleSend.cancelRetry"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_scheduleScheduleSendCancelRetry
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  RTXPCActivityCriteria *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsScheduleSendCancelRetryDelay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = 60.0;
  }
  -[SMInitiatorCacheManager defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsScheduleSendCancelRetryGracePeriod"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    v11 = 60.0;
  }
  LOBYTE(v25) = 0;
  v12 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:", 2, 1, 0, 1024, 1024, 1, -1.0, v11, v7, v25, &unk_1E93283D0);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v31 = v14;
    v32 = 2112;
    v33 = v16;
    v34 = 2112;
    v35 = v17;
    v36 = 2048;
    v37 = 0xBFF0000000000000;
    v38 = 2048;
    v39 = v11;
    v40 = 2048;
    v41 = v7;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule singleshot xpc activity,interval,%f,grace period,%f,delay,%f", buf, 0x3Eu);

  }
  objc_initWeak((id *)buf, self);
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager _getScheduleSendCancelRetryXpcActivityIdentifier](self, "_getScheduleSendCancelRetryXpcActivityIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __59__SMInitiatorCacheManager__scheduleScheduleSendCancelRetry__block_invoke;
  v26[3] = &unk_1E929F7F0;
  objc_copyWeak(v29, (id *)buf);
  v23 = v20;
  v27 = v23;
  v24 = v19;
  v28 = v24;
  v29[1] = (id)a2;
  objc_msgSend(v21, "registerActivityWithIdentifier:criteria:handler:", v22, v12, v26);

  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);

}

void __59__SMInitiatorCacheManager__scheduleScheduleSendCancelRetry__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SMInitiatorCacheManager__scheduleScheduleSendCancelRetry__block_invoke_2;
    block[3] = &unk_1E9297910;
    v10 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v11 = v7;
    v14 = v8;
    v12 = v5;
    v13 = v3;
    dispatch_async(v6, block);

  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

uint64_t __59__SMInitiatorCacheManager__scheduleScheduleSendCancelRetry__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule send cancel retry xpc fired", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "_cancelScheduledKeyRelease");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_stopScheduleSendCancelRetry
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager _getScheduleSendCancelRetryXpcActivityIdentifier](self, "_getScheduleSendCancelRetryXpcActivityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteDefaultsForIdentifier:", v5);

  -[SMInitiatorCacheManager xpcActivityManager](self, "xpcActivityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager _getScheduleSendCancelRetryXpcActivityIdentifier](self, "_getScheduleSendCancelRetryXpcActivityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SMInitiatorCacheManager__stopScheduleSendCancelRetry__block_invoke;
  v8[3] = &unk_1E9297628;
  v8[4] = self;
  v8[5] = a2;
  objc_msgSend(v6, "unregisterActivityWithIdentifier:handler:", v7, v8);

}

void __55__SMInitiatorCacheManager__stopScheduleSendCancelRetry__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413058;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unregisterActivityWithIdentifier with error %@", (uint8_t *)&v9, 0x2Au);

  }
}

- (void)_updateScheduledSendFireTimer
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  RTXPCTimerAlarm *v21;
  void *v22;
  id v23;
  id v24;
  RTXPCTimerAlarm *v25;
  double Current;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  objc_class *v37;
  id v38;
  id v39;
  void *v40;
  objc_class *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53[2];
  id location;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager scheduledSendFireTimerAlarm](self, "scheduledSendFireTimerAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SMInitiatorCacheManager setScheduledSendFireTimerAlarm:](self, "setScheduledSendFireTimerAlarm:", 0);
  if (-[SMInitiatorCacheManager _isKeyReleaseScheduled](self, "_isKeyReleaseScheduled"))
  {
    -[SMInitiatorCacheManager requestTimeFromTimed](self, "requestTimeFromTimed");
    v6 = v5;
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduledSendExpiryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isBeforeDate:", v9);

    if (v10)
    {
      -[SMInitiatorCacheManager _handleScheduledSendTimerFired](self, "_handleScheduledSendTimerFired");
    }
    else
    {
      objc_initWeak(&location, self);
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.routined.SMInitiatorCacheManager.scheduledSendFireTimerAlarmIdentifier"), v20);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = [RTXPCTimerAlarm alloc];
      -[SMInitiatorCacheManager queue](self, "queue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __56__SMInitiatorCacheManager__updateScheduledSendFireTimer__block_invoke;
      v50[3] = &unk_1E929F9C0;
      objc_copyWeak(v53, &location);
      v23 = v16;
      v51 = v23;
      v24 = v18;
      v52 = v24;
      v53[1] = (id)a2;
      v25 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v21, "initWithIdentifier:queue:handler:", v48, v22, v50);
      -[SMInitiatorCacheManager setScheduledSendFireTimerAlarm:](self, "setScheduledSendFireTimerAlarm:", v25);

      Current = CFAbsoluteTimeGetCurrent();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "scheduledSendExpiryDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
      v30 = v29;

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", Current + v30 - v6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager scheduledSendFireTimerAlarm](self, "scheduledSendFireTimerAlarm");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      objc_msgSend(v32, "fireWithDate:error:", v31, &v49);
      v33 = v49;

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v33)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v39 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedDescription");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v56 = v36;
          v57 = 2112;
          v58 = v38;
          v59 = 2112;
          v60 = v39;
          v61 = 2112;
          v62 = v40;
          _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,scheduledSendFireTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);

        }
      }
      else if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v47 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "scheduledSendExpiryDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringFromDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v56 = v46;
        v57 = 2112;
        v58 = v47;
        v59 = 2112;
        v60 = v42;
        v61 = 2112;
        v62 = v45;
        _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,scheduledSendFireTimerAlarm scheduled for: %@", buf, 0x2Au);

      }
      objc_destroyWeak(v53);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v56 = v12;
      v57 = 2112;
      v58 = v14;
      v59 = 2112;
      v60 = v15;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,scheduled send not found", buf, 0x20u);

    }
  }
}

void __56__SMInitiatorCacheManager__updateScheduledSendFireTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,scheduled send timer fired", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(WeakRetained, "_handleScheduledSendTimerFired");
  }
  else
  {
    if (v4)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,self not found", (uint8_t *)&v11, 0x20u);

    }
  }

}

- (void)_handleScheduledSendTimerFired
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager scheduledSendFireTimerAlarm](self, "scheduledSendFireTimerAlarm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = v5;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,%@ expired", (uint8_t *)&v23, 0x2Au);

  }
  -[SMInitiatorCacheManager scheduledSendFireTimerAlarm](self, "scheduledSendFireTimerAlarm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  -[SMInitiatorCacheManager setScheduledSendFireTimerAlarm:](self, "setScheduledSendFireTimerAlarm:", 0);
  v12 = (void *)MEMORY[0x1E0C99D68];
  -[SMInitiatorCacheManager requestTimeFromTimed](self, "requestTimeFromTimed");
  objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scheduledSendExpiryDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v15);
  v17 = v16;

  if (v17 >= -10.0)
  {
    -[SMInitiatorCacheManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scheduledSendMessageSent:", v19);

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWasScheduledSendTriggered:", 1);

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWasCacheReleased:", 1);

    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setScheduledSendExpiryDate:", 0);

    -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
  }
  else
  {
    -[SMInitiatorCacheManager _updateScheduledSendFireTimer](self, "_updateScheduledSendFireTimer");
  }
}

- (double)requestTimeFromTimed
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  double Current;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  TMGetReferenceTime();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v13;
    v20 = 2112;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,TMGetReferenceTime returned invalid time, using time from CFAbsoluteTimeGetCurrent", buf, 0x20u);

  }
  Current = CFAbsoluteTimeGetCurrent();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", Current);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v26 = 2048;
    v27 = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,referenceTime:%@,referenceTimeUnc:%f", buf, 0x34u);

  }
  return Current;
}

- (void)updateCacheUpdateBackstopTimer
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  RTXPCTimerAlarm *v23;
  void *v24;
  id v25;
  id v26;
  RTXPCTimerAlarm *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  objc_class *v35;
  id v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void *v38;
  NSObject *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  objc_class *v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64[2];
  _QWORD v65[7];
  _BYTE location[12];
  __int16 v67;
  void *v68;
  _BYTE buf[24];
  uint64_t (*v70)(uint64_t, uint64_t);
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager stopCacheUpdateBackstopTimer](self, "stopCacheUpdateBackstopTimer");
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheUpdateBackstopExpiryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;

  if (v7 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v43 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2112;
      v70 = v43;
      _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cacheUpdateBackstopTimerAlarm expired in the past", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v70 = __Block_byref_object_copy__81;
    *(_QWORD *)&v71 = __Block_byref_object_dispose__81;
    v44 = (void *)MEMORY[0x1E0CB3940];
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR("%@-%@"), v46, v47);
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v48, "UTF8String");
    *((_QWORD *)&v71 + 1) = os_transaction_create();

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v56;
      v67 = 2112;
      v68 = v57;
      _os_log_debug_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", location, 0x16u);

    }
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke;
    v65[3] = &unk_1E929FC10;
    v65[4] = self;
    v65[5] = buf;
    v65[6] = a2;
    -[SMInitiatorCacheManager _periodicCacheUpdateWithCompletion:](self, "_periodicCacheUpdateWithCompletion:", v65);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cacheUpdateBackstopExpiryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = v10;
    -[SMInitiatorCacheManager getCacheUpdateBackstopTimeout](self, "getCacheUpdateBackstopTimeout");
    v13 = v12;

    if (v11 > v13)
    {
      v14 = (void *)MEMORY[0x1E0C99D68];
      -[SMInitiatorCacheManager getCacheUpdateBackstopTimeout](self, "getCacheUpdateBackstopTimeout");
      objc_msgSend(v14, "dateWithTimeIntervalSinceNow:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCacheUpdateBackstopExpiryDate:", v15);

      -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
    }
    objc_initWeak((id *)location, self);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.routined.SMInitiatorCacheManager.cacheUpdateBackstopTimerIdentifierBase"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = [RTXPCTimerAlarm alloc];
    -[SMInitiatorCacheManager queue](self, "queue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke_317;
    v61[3] = &unk_1E929F9C0;
    objc_copyWeak(v64, (id *)location);
    v25 = v19;
    v62 = v25;
    v26 = v18;
    v63 = v26;
    v64[1] = (id)a2;
    v27 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v23, "initWithIdentifier:queue:handler:", v22, v24, v61);
    -[SMInitiatorCacheManager setCacheUpdateBackstopTimerAlarm:](self, "setCacheUpdateBackstopTimerAlarm:", v27);

    -[SMInitiatorCacheManager cacheUpdateBackstopTimerAlarm](self, "cacheUpdateBackstopTimerAlarm");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "cacheUpdateBackstopExpiryDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v28, "fireWithDate:error:", v30, &v60);
    v31 = v60;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v36;
        *(_WORD *)&buf[22] = 2112;
        v70 = v37;
        LOWORD(v71) = 2112;
        *(_QWORD *)((char *)&v71 + 2) = v38;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cacheUpdateBackstopTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);

      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v59 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v51 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "cacheUpdateBackstopExpiryDate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringFromDate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2112;
      v70 = v51;
      LOWORD(v71) = 2112;
      *(_QWORD *)((char *)&v71 + 2) = v54;
      _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cacheUpdateBackstopTimerAlarm scheduled for: %@", buf, 0x2Au);

    }
    objc_destroyWeak(v64);

    objc_destroyWeak((id *)location);
  }
}

void __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v3;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed cache upload due to cacheUpdateBackstopTimerAlarm expiry in the past", (uint8_t *)&v9, 0x20u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke_317(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE *v25;
  uint64_t v26;
  uint8_t v27[4];
  id v28;
  __int16 v29;
  void *v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v32 = v7;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cacheUpdateBackstopTimerAlarm fired", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v32 = __Block_byref_object_copy__81;
    v33 = __Block_byref_object_dispose__81;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "UTF8String");
    v34 = (id)os_transaction_create();

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138412546;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", v27, 0x16u);

    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke_318;
    v22[3] = &unk_1E929FC38;
    v23 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 56);
    v24 = v14;
    v25 = buf;
    v26 = v15;
    objc_msgSend(WeakRetained, "_periodicCacheUpdateWithCompletion:", v22);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v32 = v21;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,self not found", buf, 0x20u);

    }
  }

}

void __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke_318(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed cache upload due to cacheUpdateBackstopTimerAlarm firing", (uint8_t *)&v8, 0x20u);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)stopCacheUpdateBackstopTimer
{
  void *v3;
  void *v4;

  -[SMInitiatorCacheManager cacheUpdateBackstopTimerAlarm](self, "cacheUpdateBackstopTimerAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMInitiatorCacheManager cacheUpdateBackstopTimerAlarm](self, "cacheUpdateBackstopTimerAlarm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SMInitiatorCacheManager setCacheUpdateBackstopTimerAlarm:](self, "setCacheUpdateBackstopTimerAlarm:", 0);
  }
}

- (void)_storeInitiatorContactInStore:(unint64_t)a3
{
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27[3];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = -[SMInitiatorCacheManager initiatorContactStoreInProgress](self, "initiatorContactStoreInProgress");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v9;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Update already in progress", buf, 0x20u);

    }
    -[SMInitiatorCacheManager setInitiatorContactUpdatePending:](self, "setInitiatorContactUpdatePending:", 1);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v13;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,storing SMInitiatorContact in store", buf, 0x20u);

    }
    -[SMInitiatorCacheManager setInitiatorContactStoreInProgress:](self, "setInitiatorContactStoreInProgress:", 1);
    objc_initWeak((id *)buf, self);
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager safetyCacheStore](self, "safetyCacheStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __57__SMInitiatorCacheManager__storeInitiatorContactInStore___block_invoke;
    v24[3] = &unk_1E929FC88;
    objc_copyWeak(v27, (id *)buf);
    v22 = v17;
    v25 = v22;
    v23 = v19;
    v26 = v23;
    v27[1] = (id)a2;
    v27[2] = (id)a3;
    objc_msgSend(v20, "storeInitiatorContact:handler:", v21, v24);

    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);
  }
}

void __57__SMInitiatorCacheManager__storeInitiatorContactInStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__SMInitiatorCacheManager__storeInitiatorContactInStore___block_invoke_319;
    v14[3] = &unk_1E929FC60;
    v15 = v5;
    v16 = v3;
    v17 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v18 = v7;
    v19 = v8;
    v20 = v9;
    dispatch_async(v6, v14);

    v10 = v15;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", buf, 0x20u);

    }
  }

}

uint64_t __57__SMInitiatorCacheManager__storeInitiatorContactInStore___block_invoke_319(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setInitiatorContactStoreInProgress:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 72);
      v16 = 138413314;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 1024;
      v25 = v15;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Stored with error %@, retries left %d", (uint8_t *)&v16, 0x30u);

    }
    v5 = *(_QWORD *)(a1 + 72);
    v6 = *(void **)(a1 + 32);
    if (v5)
      return objc_msgSend(v6, "_storeInitiatorContactInStore:", v5 - 1);
    else
      return objc_msgSend(v6, "setInitiatorContactUpdatePending:", 0);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Successfully stored InitiatorContact", (uint8_t *)&v16, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setInitiatorContactStored:", 1);
    result = objc_msgSend(*(id *)(a1 + 32), "initiatorContactUpdatePending");
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(a1 + 32), "setInitiatorContactUpdatePending:", 0);
      return objc_msgSend(*(id *)(a1 + 32), "_updateInitiatorContactInStore");
    }
  }
  return result;
}

- (void)_updateInitiatorContactInStore
{
  void *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[SMInitiatorCacheManager initiatorContactStored](self, "initiatorContactStored"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v29 = v6;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Updating InitiatorContact, transaction,%@", buf, 0x2Au);

    }
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager safetyCacheStore](self, "safetyCacheStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__SMInitiatorCacheManager__updateInitiatorContactInStore__block_invoke;
    v23[3] = &unk_1E929FCB0;
    v24 = v10;
    v25 = v12;
    v26 = v4;
    v27 = a2;
    v15 = v4;
    v16 = v12;
    v17 = v10;
    objc_msgSend(v13, "updateInitiatorContact:handler:", v14, v23);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v19;
      v30 = 2112;
      v31 = v21;
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMInitiatorContact not yet stored", buf, 0x20u);

    }
    -[SMInitiatorCacheManager _storeInitiatorContactInStore:](self, "_storeInitiatorContactInStore:", 2);
  }
}

void __57__SMInitiatorCacheManager__updateInitiatorContactInStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v13 = 138413314;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Update returned error %@, transaction,%@", (uint8_t *)&v13, 0x34u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 48);
    v13 = 138413058;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Successfully updated InitiatorContact, transaction,%@", (uint8_t *)&v13, 0x2Au);
    goto LABEL_6;
  }

}

- (void)_cleanUpInitiatorContact
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v5;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanup contact", (uint8_t *)&v13, 0x20u);

  }
  -[SMInitiatorCacheManager _cancelScheduledKeyRelease](self, "_cancelScheduledKeyRelease");
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shouldBeCleanedUpDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isBeforeDate:", v11);

  if (v12)
    -[SMInitiatorCacheManager eraseCacheData](self, "eraseCacheData");
  -[SMInitiatorCacheManager _cleanupActiveSessionZone](self, "_cleanupActiveSessionZone");
  -[SMInitiatorCacheManager _cleanUpInitiatorContactLocalStore](self, "_cleanUpInitiatorContactLocalStore");
}

- (void)eraseCacheData
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "watchCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@", (uint8_t *)&v15, 0x20u);

  }
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPhoneCache:", 0);

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWatchCache:", 0);

  -[SMInitiatorCacheManager notifyObserversSafetyCacheDidUpdate](self, "notifyObserversSafetyCacheDidUpdate");
  -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
}

- (void)_cleanupActiveSessionZone
{
  BOOL v4;
  SMCloudKitQosOptions *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10[2];
  id location;

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "cloudkitShareZoneCleanedUpSuccessfully") & 1) != 0)
  {

  }
  else
  {
    v4 = -[SMInitiatorCacheManager initializationInProgress](self, "initializationInProgress");

    if (!v4)
    {
      objc_initWeak(&location, self);
      v5 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
      -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "privateDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52__SMInitiatorCacheManager__cleanupActiveSessionZone__block_invoke;
      v9[3] = &unk_1E929FCD8;
      objc_copyWeak(v10, &location);
      v10[1] = (id)a2;
      -[SMInitiatorCacheManager deleteZoneFromDatabaseWithRetry:database:qos:withCompletion:](self, "deleteZoneFromDatabaseWithRetry:database:qos:withCompletion:", 2, v7, v5, v9);

      objc_destroyWeak(v10);
      objc_destroyWeak(&location);
    }
  }
}

void __52__SMInitiatorCacheManager__cleanupActiveSessionZone__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "sessionUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413314;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v5;
      v21 = 1024;
      v22 = a2;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanupCloudkit with error %@ and success %d", (uint8_t *)&v13, 0x30u);

    }
    objc_msgSend(WeakRetained, "initiatorContact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCloudkitShareZoneCleanedUpSuccessfully:", a2);

    objc_msgSend(WeakRetained, "_updateInitiatorContactInStore");
    objc_msgSend(WeakRetained, "_cleanUpInitiatorContactLocalStore");
  }

}

- (void)deleteZoneFromDatabaseWithRetry:(int64_t)a3 database:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39[3];
  uint64_t v40;
  void *v41;
  _BYTE location[12];
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (v11 && v12)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)location, self);
      -[SMInitiatorCacheManager activeSessionZone](self, "activeSessionZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __87__SMInitiatorCacheManager_deleteZoneFromDatabaseWithRetry_database_qos_withCompletion___block_invoke;
      v33[3] = &unk_1E929FD00;
      objc_copyWeak(v39, (id *)location);
      v18 = v16;
      v34 = v18;
      v19 = v15;
      v35 = v19;
      v39[1] = (id)a2;
      v38 = v13;
      v39[2] = (id)a3;
      v36 = v11;
      v37 = v12;
      objc_msgSend(v17, "deleteZoneFromDatabase:qos:withCompletion:", v36, v37, v33);

      objc_destroyWeak(v39);
      objc_destroyWeak((id *)location);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138413314;
        *(_QWORD *)&location[4] = v29;
        v43 = 2112;
        v44 = v31;
        v45 = 2112;
        v46 = v32;
        v47 = 2112;
        v48 = v11;
        v49 = 2112;
        v50 = v12;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,missing required fields,database,%@,qos,%@", location, 0x34u);

      }
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v40 = *MEMORY[0x1E0CB2D50];
      v22 = (void *)MEMORY[0x1E0CB3940];
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("#SafetyCache,Initiator,sessionID:%@,%@,%@,failed due to invalid parameters"), v23, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 7, v28);

      (*((void (**)(id, _QWORD, NSObject *))v13 + 2))(v13, 0, v19);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", location, 2u);
    }
  }

}

void __87__SMInitiatorCacheManager_deleteZoneFromDatabaseWithRetry_database_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412802;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during zone delete", (uint8_t *)&v27, 0x20u);

    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_18;
  }
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412802;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,zone deleted successfully", (uint8_t *)&v27, 0x20u);

    }
    goto LABEL_17;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v4))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_18:
      v10();
      goto LABEL_19;
    }
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138413058;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v4;
    v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete zone with non recoverable error %@";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v27, 0x2Au);

    goto LABEL_17;
  }
  v6 = *(_QWORD *)(a1 + 88);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6 <= 0)
  {
    if (!v8)
      goto LABEL_17;
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138413058;
    v28 = v25;
    v29 = 2112;
    v30 = v26;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v4;
    v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete zone after retries with recoverable error %@";
    goto LABEL_21;
  }
  if (v8)
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 88);
    v27 = 138413314;
    v28 = v21;
    v29 = 2112;
    v30 = v22;
    v31 = 2112;
    v32 = v23;
    v33 = 2112;
    v34 = v4;
    v35 = 1024;
    v36 = v24;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete zone with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v27, 0x30u);

  }
  objc_msgSend(WeakRetained, "deleteZoneFromDatabaseWithRetry:database:qos:withCompletion:", *(_QWORD *)(a1 + 88) - 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_19:

}

- (void)_cleanUpInitiatorContactLocalStore
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  RTXPCTimerAlarm *v40;
  void *v41;
  RTXPCTimerAlarm *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  int v76;
  id v77;
  void *v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83[2];
  id location;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88[2];
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  id v92;
  __int16 v93;
  id v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  int v98;
  __int16 v99;
  _BOOL4 v100;
  __int16 v101;
  _BOOL4 v102;
  __int16 v103;
  int v104;
  __int16 v105;
  void *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "cloudkitShareZoneCleanedUpSuccessfully"))
  {

    v4 = -[SMInitiatorCacheManager _isKeyReleaseScheduled](self, "_isKeyReleaseScheduled");
  }
  else
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startingLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99D68];
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "startingLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateWithTimeInterval:sinceDate:", v10, 604800.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isAfterDate:", v12);

    }
    else
    {
      v13 = 0;
    }

    v4 = -[SMInitiatorCacheManager _isKeyReleaseScheduled](self, "_isKeyReleaseScheduled");
    if ((v13 & 1) != 0)
    {
      v76 = 0;
      v14 = 1;
      goto LABEL_12;
    }
  }
  v14 = 0;
  if (-[SMInitiatorCacheManager initializationInProgress](self, "initializationInProgress"))
  {
    v76 = 0;
  }
  else
  {
    v76 = 0;
    if (!v4)
    {
      v4 = 0;
      v14 = 0;
      v76 = !-[SMInitiatorCacheManager scheduledSendInProgress](self, "scheduledSendInProgress");
    }
  }
LABEL_12:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SMInitiatorCacheManager scheduledSendInProgress](self, "scheduledSendInProgress");
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shouldBeCleanedUpDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414338;
    v90 = v72;
    v91 = 2112;
    v92 = v71;
    v93 = 2112;
    v94 = v70;
    v95 = 2112;
    v96 = v18;
    v97 = 1024;
    v98 = v14;
    v99 = 1024;
    v100 = v4;
    v101 = 1024;
    v102 = v19;
    v103 = 1024;
    v104 = v76;
    v105 = 2112;
    v106 = v22;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,%@, cloudkit %d, scheduleSendMsgToCancel %d, scheduledSendInProgress %d, cleanupConditionsMet %d, shouldBeCleanedUpDate %@", buf, 0x4Cu);

  }
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "shouldBeCleanedUpDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "shouldBeCleanedUpDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isBeforeDate:", v30);

      if (!v31)
      {
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "shouldBeCleanedUpDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v33, "isAfterDate:", v34) & 1) != 0)
        {
          -[SMInitiatorCacheManager cleanupCacheTimerAlarm](self, "cleanupCacheTimerAlarm");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35 == 0;

          if (v36)
          {
            objc_initWeak(&location, self);
            v37 = (void *)MEMORY[0x1E0CB3940];
            -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.routined.SMInitiatorCacheManager.cachePersistenceTimerIdentifierBase"), v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = [RTXPCTimerAlarm alloc];
            -[SMInitiatorCacheManager queue](self, "queue");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v80[2] = __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke_321;
            v80[3] = &unk_1E929F9C0;
            objc_copyWeak(v83, &location);
            v81 = v23;
            v82 = v25;
            v83[1] = (id)a2;
            v42 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v40, "initWithIdentifier:queue:handler:", v39, v41, v80);
            -[SMInitiatorCacheManager setCleanupCacheTimerAlarm:](self, "setCleanupCacheTimerAlarm:", v42);

            -[SMInitiatorCacheManager cleanupCacheTimerAlarm](self, "cleanupCacheTimerAlarm");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "shouldBeCleanedUpDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = 0;
            objc_msgSend(v43, "fireWithDate:error:", v45, &v79);
            v46 = v79;

            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v47 = objc_claimAutoreleasedReturnValue();
            v48 = v47;
            if (v46)
            {
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = (objc_class *)objc_opt_class();
                NSStringFromClass(v66);
                v67 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v68 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "localizedDescription");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v90 = v78;
                v91 = 2112;
                v92 = v67;
                v93 = 2112;
                v94 = v68;
                v95 = 2112;
                v96 = v69;
                _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cachePersistenceTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);

              }
              -[SMInitiatorCacheManager setCleanupCacheTimerAlarm:](self, "setCleanupCacheTimerAlarm:", 0);
            }
            else
            {
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = (objc_class *)objc_opt_class();
                NSStringFromClass(v61);
                v77 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v62 = (id)objc_claimAutoreleasedReturnValue();
                -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "shouldBeCleanedUpDate");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "stringFromDate");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v90 = v73;
                v91 = 2112;
                v92 = v77;
                v93 = 2112;
                v94 = v62;
                v95 = 2112;
                v96 = v65;
                _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cachePersistenceTimerAlarm scheduled for: %@", buf, 0x2Au);

              }
            }

            objc_destroyWeak(v83);
            objc_destroyWeak(&location);
          }
        }
        else
        {

        }
        goto LABEL_30;
      }
    }
    else
    {

    }
    -[SMInitiatorCacheManager _stopCleanupCacheTimerAlarm](self, "_stopCleanupCacheTimerAlarm");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v90 = v55;
      v91 = 2112;
      v92 = v57;
      v93 = 2112;
      v94 = v58;
      _os_log_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,localCleanup starting", buf, 0x20u);

    }
    objc_initWeak((id *)buf, self);
    -[SMInitiatorCacheManager safetyCacheStore](self, "safetyCacheStore");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke;
    v85[3] = &unk_1E929FD28;
    objc_copyWeak(v88, (id *)buf);
    v86 = v23;
    v87 = v25;
    v88[1] = (id)a2;
    objc_msgSend(v59, "removeInitiatorContact:handler:", v60, v85);

    objc_destroyWeak(v88);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v90 = v50;
      v91 = 2112;
      v92 = v52;
      v93 = 2112;
      v94 = v53;
      _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanup conditions not yet satisfied", buf, 0x20u);

    }
  }
LABEL_30:

}

void __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "initiatorContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke_320;
    block[3] = &unk_1E92978E8;
    v14 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v15 = v7;
    v18 = v8;
    v16 = v3;
    v17 = WeakRetained;
    dispatch_async(v6, block);

    v9 = v14;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v3;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,localCleanup finished with not valid initiatorContact %@", buf, 0x2Au);

    }
  }

}

void __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke_320(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v9 = 138413058;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,localCleanup with error %@", (uint8_t *)&v9, 0x2Au);

  }
  if (!*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "sessionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cacheManagerCleanedUpForSessionID:", v8);

  }
}

void __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke_321(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "initiatorContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "_stopCleanupCacheTimerAlarm");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule cleanup fired", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(WeakRetained, "eraseCacheData");
    objc_msgSend(WeakRetained, "_cleanUpInitiatorContactLocalStore");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule cleanup fired not valid initiatorContact", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)_stopCleanupCacheTimerAlarm
{
  void *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager cleanupCacheTimerAlarm](self, "cleanupCacheTimerAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,invalidate cleanupCacheTimerAlarm", (uint8_t *)&v11, 0x20u);

    }
    -[SMInitiatorCacheManager cleanupCacheTimerAlarm](self, "cleanupCacheTimerAlarm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[SMInitiatorCacheManager setCleanupCacheTimerAlarm:](self, "setCleanupCacheTimerAlarm:", 0);
  }
}

- (void)onDeletedMessage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message", (uint8_t *)&v21, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v5, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sessionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413314;
      v22 = v16;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      v29 = 2112;
      v30 = v6;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,wrong sessionID %@ from deleted message %@", (uint8_t *)&v21, 0x34u);

    }
LABEL_10:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138413058;
    v22 = v12;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,deletedMessage,%@", (uint8_t *)&v21, 0x2Au);

  }
  -[SMInitiatorCacheManager onDeletionCleanup](self, "onDeletionCleanup");
LABEL_11:

}

- (void)onDeletedConversation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", (uint8_t *)&v20, 2u);
    }
    goto LABEL_10;
  }
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SMMessagingUtilities handlesInConversation1:canonicallyEqualsHandlesInConversation2:](SMMessagingUtilities, "handlesInConversation1:canonicallyEqualsHandlesInConversation2:", v7, v5);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "receiverHandles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138413058;
      v21 = v15;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,wrong receiverHandles %@ from deleted conversation", (uint8_t *)&v20, 0x2Au);

    }
LABEL_10:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413058;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,deletedConversation,%@", (uint8_t *)&v20, 0x2Au);

  }
  -[SMInitiatorCacheManager onDeletionCleanup](self, "onDeletionCleanup");
LABEL_11:

}

- (void)onDeletionCleanup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shouldBeCleanedUpDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldBeCleanedUpDate:", v5);

  if (v4)
    -[SMInitiatorCacheManager _cleanUpInitiatorContact](self, "_cleanUpInitiatorContact");
}

- (void)_registerForGeneralNotifications
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[SMInitiatorCacheManager registeredForGeneralNotifications](self, "registeredForGeneralNotifications"))
  {
    -[SMInitiatorCacheManager setRegisteredForGeneralNotifications:](self, "setRegisteredForGeneralNotifications:", 1);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v5;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,register for general notifications", (uint8_t *)&v13, 0x20u);

    }
    -[SMInitiatorCacheManager networkOfInterestManager](self, "networkOfInterestManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTNetworkOfInterestManagerCellLinkQualityChangedNotification, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:", self, sel_onCellLinkQualityChangedNotification_, v10);

    -[SMInitiatorCacheManager networkOfInterestManager](self, "networkOfInterestManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTNetworkOfInterestManagerWifiLinkQualityChangedNotification, "notificationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:", self, sel_onWifiLinkQualityChangedNotification_, v12);

  }
}

- (void)_registerForActiveNotifications
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  SMScreenLockMonitor *v21;
  void *v22;
  id v23;
  id v24;
  SMScreenLockMonitor *v25;
  void *v26;
  void *v27;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34[2];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!-[SMInitiatorCacheManager registeredForActiveNotifications](self, "registeredForActiveNotifications"))
  {
    -[SMInitiatorCacheManager setRegisteredForActiveNotifications:](self, "setRegisteredForActiveNotifications:", 1);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v5;
      v38 = 2112;
      v39 = v7;
      v40 = 2112;
      v41 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,register for active notifications", buf, 0x20u);

    }
    -[SMInitiatorCacheManager locationAwarenessManager](self, "locationAwarenessManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v9, "addLocationHeartbeatRequester:interval:error:", self, &v35, 300.0);
    v10 = v35;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "code");
      objc_msgSend(v10, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v37 = v12;
      v38 = 2112;
      v39 = v14;
      v40 = 2112;
      v41 = v15;
      v42 = 2048;
      v43 = v16;
      v44 = 2112;
      v45 = v17;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Request location heartbeat error, code, %ld, description, %@", buf, 0x34u);

    }
    objc_initWeak((id *)buf, self);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [SMScreenLockMonitor alloc];
    -[SMInitiatorCacheManager queue](self, "queue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __58__SMInitiatorCacheManager__registerForActiveNotifications__block_invoke;
    v31[3] = &unk_1E929FD50;
    objc_copyWeak(v34, (id *)buf);
    v23 = v20;
    v32 = v23;
    v24 = v19;
    v33 = v24;
    v34[1] = (id)a2;
    v25 = -[SMScreenLockMonitor initWithQueue:handler:](v21, "initWithQueue:handler:", v22, v31);
    -[SMInitiatorCacheManager setScreenLockMonitor:](self, "setScreenLockMonitor:", v25);

    -[SMInitiatorCacheManager vehicleLocationProvider](self, "vehicleLocationProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:", self, sel_onVehicleEventNotification_, v27);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)handleShareAllLocationsChanged, (CFStringRef)*MEMORY[0x1E0D8BCA8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaWorkoutEnabled"))
    {
      -[SMInitiatorCacheManager healthKitManager](self, "healthKitManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTHealthKitManagerWorkoutSnapshotUpdateNotification, "notificationName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObserver:selector:name:", self, sel_onHealthKitManagerNotification_, v30);

    }
    objc_destroyWeak(v34);

    objc_destroyWeak((id *)buf);
  }
}

void __58__SMInitiatorCacheManager__registerForActiveNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "onLockStateChange:", a2);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", (uint8_t *)&v10, 0x20u);

    }
  }

}

- (void)_unregisterForGeneralNotifications
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[SMInitiatorCacheManager registeredForGeneralNotifications](self, "registeredForGeneralNotifications"))
  {
    -[SMInitiatorCacheManager setRegisteredForGeneralNotifications:](self, "setRegisteredForGeneralNotifications:", 0);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unregister for general notifications", (uint8_t *)&v10, 0x20u);

    }
    -[SMInitiatorCacheManager networkOfInterestManager](self, "networkOfInterestManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", self);

  }
}

- (void)_unregisterForActiveNotifications
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[SMInitiatorCacheManager registeredForActiveNotifications](self, "registeredForActiveNotifications"))
  {
    -[SMInitiatorCacheManager setRegisteredForActiveNotifications:](self, "setRegisteredForActiveNotifications:", 0);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unregister for active notifications", (uint8_t *)&v14, 0x20u);

    }
    -[SMInitiatorCacheManager locationAwarenessManager](self, "locationAwarenessManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLocationHeartbeatRequester:", self);

    -[SMInitiatorCacheManager screenLockMonitor](self, "screenLockMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_unregisterForLockNotification");

    -[SMInitiatorCacheManager setScreenLockMonitor:](self, "setScreenLockMonitor:", 0);
    -[SMInitiatorCacheManager vehicleLocationProvider](self, "vehicleLocationProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:", self);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D8BCA8], 0);
    if (objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaWorkoutEnabled"))
    {
      -[SMInitiatorCacheManager healthKitManager](self, "healthKitManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObserver:", self);

    }
  }
}

- (void)_fetchLocationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  RTLocationRequestOptions *v7;
  RTLocationRequestOptions *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[SMInitiatorCacheManager queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SMInitiatorEligibility checkRegulatoryDomainPassedWithQueue:](SMInitiatorEligibility, "checkRegulatoryDomainPassedWithQueue:", v5);

  if (v6)
  {
    objc_initWeak(&location, self);
    v7 = [RTLocationRequestOptions alloc];
    v8 = -[RTLocationRequestOptions initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:](v7, "initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:", 1, 1, *MEMORY[0x1E0C9E490], 35.0, 10.0, 10.0, 100.0, 600.0);
    -[SMInitiatorCacheManager locationManager](self, "locationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__SMInitiatorCacheManager__fetchLocationWithCompletion___block_invoke;
    v11[3] = &unk_1E929FD78;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    objc_msgSend(v9, "fetchCurrentLocationWithOptions:handler:", v8, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);

  }
}

void __56__SMInitiatorCacheManager__fetchLocationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__SMInitiatorCacheManager__fetchLocationWithCompletion___block_invoke_2;
    v14[3] = &unk_1E9296F70;
    v15 = v6;
    v16 = v5;
    v17 = *(id *)(a1 + 32);
    dispatch_async(v9, v14);

    v10 = v15;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = *MEMORY[0x1E0D8BB70];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("SMInitiatorCacheManger was destroyed before location fetch completed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 24, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__SMInitiatorCacheManager__fetchLocationWithCompletion___block_invoke_2(_QWORD *a1)
{
  id v2;

  if (!a1[4] && a1[5] && (objc_msgSend(MEMORY[0x1E0D8B998], "isCLLocationValid:") & 1) != 0)
  {
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B998]), "initWithCLLocation:", a1[5]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)onCellLinkQualityChangedNotification:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  SMInitiatorCacheManager *v10;
  SEL v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[SMInitiatorCacheManager queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__SMInitiatorCacheManager_onCellLinkQualityChangedNotification___block_invoke;
    block[3] = &unk_1E9297BC8;
    v9 = v5;
    v10 = self;
    v11 = a2;
    dispatch_async(v6, block);

    v7 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
  }

}

void __64__SMInitiatorCacheManager_onCellLinkQualityChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNetworkOfInterestManagerCellLinkQualityChangedNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if ((v4 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v14;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_error_impl(&dword_1D1A22000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unhandled RTNetworkOfInterestManager notification,%@", (uint8_t *)&v19, 0x2Au);

    }
    goto LABEL_9;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "linkQuality");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    RTLinkQualityToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,link quality,%@", (uint8_t *)&v19, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "setCellularStrength:", v5);
  if (objc_msgSend(*(id *)(a1 + 40), "cellularLinkQualityFetchInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 40), "deviceStatusReturnBlock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "deviceStatusReturnBlock");
      v13 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 3);
LABEL_9:

    }
  }
}

- (void)onWifiLinkQualityChangedNotification:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  SMInitiatorCacheManager *v10;
  SEL v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[SMInitiatorCacheManager queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__SMInitiatorCacheManager_onWifiLinkQualityChangedNotification___block_invoke;
    block[3] = &unk_1E9297BC8;
    v9 = v5;
    v10 = self;
    v11 = a2;
    dispatch_async(v6, block);

    v7 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
  }

}

void __64__SMInitiatorCacheManager_onWifiLinkQualityChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNetworkOfInterestManagerWifiLinkQualityChangedNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if ((v4 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v14;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_error_impl(&dword_1D1A22000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unhandled RTNetworkOfInterestManager notification,%@", (uint8_t *)&v19, 0x2Au);

    }
    goto LABEL_9;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "linkQuality");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    RTLinkQualityToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,link quality,%@", (uint8_t *)&v19, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "setWifiStrength:", v5);
  if (objc_msgSend(*(id *)(a1 + 40), "wifiLinkQualityFetchInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 40), "deviceStatusReturnBlock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "deviceStatusReturnBlock");
      v13 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 2);
LABEL_9:

    }
  }
}

- (void)onVehicleEventNotification:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  SMInitiatorCacheManager *v10;
  SEL v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[SMInitiatorCacheManager queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SMInitiatorCacheManager_onVehicleEventNotification___block_invoke;
    block[3] = &unk_1E9297BC8;
    v9 = v5;
    v10 = self;
    v11 = a2;
    dispatch_async(v6, block);

    v7 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
  }

}

void __54__SMInitiatorCacheManager_onVehicleEventNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "vehicleEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0D8B998]);
      v8 = (void *)objc_opt_new();
      objc_msgSend(v33, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "latitude");
      v11 = v10;
      objc_msgSend(v33, "location");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "longitude");
      v14 = v13;
      objc_msgSend(v33, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "horizontalUncertainty");
      v17 = v16;
      objc_msgSend(v33, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "altitude");
      v20 = v19;
      objc_msgSend(v33, "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "verticalUncertainty");
      v23 = v22;
      objc_msgSend(v33, "location");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v7, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v8, v25, v11, v14, v17, v20, v23);

    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "_updateVehicleParkingLocation:", v26);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v35 = v28;
      v36 = 2112;
      v37 = v30;
      v38 = 2112;
      v39 = v31;
      v40 = 2112;
      v41 = v32;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unhandled RTVehicleLocationProvider notification,%@", buf, 0x2Au);

    }
  }
}

- (void)_updateVehicleParkingLocation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  objc_class *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shouldBeCleanedUpDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      goto LABEL_9;
    }
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v15;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v18;
    v19 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,contact should be cleaned up";
    v20 = v8;
    v21 = 32;
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, v21);

    goto LABEL_3;
  }
  if (v5 && (objc_msgSend(v5, "isValid") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = v15;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v5;
    v19 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,parking location is not valid %@";
    v20 = v8;
    v21 = 42;
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = v10;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,updating parked car location %@", (uint8_t *)&v23, 0x2Au);

  }
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setParkedCarLocation:", v5);

  -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
LABEL_9:

}

- (void)onLockStateChange:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  NSObject *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  char *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v45;
  _QWORD v46[4];
  id v47;
  BOOL v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v45 = a3;
  v63 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = "NO";
    *(_DWORD *)buf = 138413058;
    v50 = v6;
    if (v45)
      v11 = "YES";
    v51 = 2112;
    v52 = v8;
    v53 = 2112;
    v54 = v9;
    v55 = 2080;
    v56 = v11;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,lock state changed isLocked:%s", buf, 0x2Au);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "sessionUUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unlockLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate");
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lockLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "lockState");
    *(_DWORD *)buf = 138413826;
    v50 = v42;
    v51 = 2112;
    v52 = v41;
    v53 = 2112;
    v54 = (uint64_t)v40;
    v55 = 2112;
    v56 = v39;
    v57 = 2112;
    v58 = v20;
    v59 = 1024;
    v60 = v45;
    v61 = 1024;
    v62 = v22;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,checking expected lock state, unlock date %@, lock date %@, new lock state %d, prev lock state %d ", buf, 0x40u);

  }
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v45)
  {
    objc_msgSend(v23, "lockLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isValid") & 1) == 0)
    {
LABEL_9:

LABEL_12:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v50 = v29;
        v51 = 2112;
        v52 = v31;
        v53 = 2112;
        v54 = (uint64_t)v32;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@, update lock state required", buf, 0x20u);

      }
      objc_initWeak((id *)buf, self);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __45__SMInitiatorCacheManager_onLockStateChange___block_invoke;
      v46[3] = &unk_1E929FDA0;
      objc_copyWeak(&v47, (id *)buf);
      v48 = v45;
      -[SMInitiatorCacheManager _fetchLocationWithCompletion:](self, "_fetchLocationWithCompletion:", v46);
      objc_destroyWeak(&v47);
      objc_destroyWeak((id *)buf);
      return;
    }
  }
  else
  {
    objc_msgSend(v23, "unlockLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "isValid"))
      goto LABEL_9;
  }
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "lockState");

  if (((v27 ^ v45) & 1) != 0)
    goto LABEL_12;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sessionUUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v50 = v35;
    v51 = 2112;
    v52 = v37;
    v53 = 2112;
    v54 = (uint64_t)v38;
    _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@, lock state changed no update needed", buf, 0x20u);

  }
}

void __45__SMInitiatorCacheManager_onLockStateChange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6 && !a3)
    objc_msgSend(WeakRetained, "_updateLockState:location:", *(unsigned __int8 *)(a1 + 40), v6);

}

- (void)_updateLockState:(BOOL)a3 location:(id)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v4 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isValid") & 1) != 0)
    {
      -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shouldBeCleanedUpDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v12)
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138412802;
          v31 = v13;
          v32 = 2112;
          v33 = v15;
          v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,contact should be cleaned up", (uint8_t *)&v30, 0x20u);

        }
      }
      else
      {
        if (v12)
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138413314;
          v31 = v23;
          v32 = 2112;
          v33 = v25;
          v34 = 2112;
          v35 = v26;
          v36 = 1024;
          v37 = v4;
          v38 = 2112;
          v39 = v8;
          _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,update lock state %d with location %@", (uint8_t *)&v30, 0x30u);

        }
        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v4)
          objc_msgSend(v27, "setLockLocation:", v8);
        else
          objc_msgSend(v27, "setUnlockLocation:", v8);

        -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setLockState:", v4);

        -[SMInitiatorCacheManager _updateInitiatorContactInStore](self, "_updateInitiatorContactInStore");
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412802;
        v31 = v19;
        v32 = 2112;
        v33 = v21;
        v34 = 2112;
        v35 = v22;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,invalid location", (uint8_t *)&v30, 0x20u);

      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v30) = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", (uint8_t *)&v30, 2u);
    }

  }
}

- (double)getCacheUpdateBackstopTimeout
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  double cacheUpdateBackstopTimeout;
  double result;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorCacheManager cacheUpdateBackstopTimeout](self, "cacheUpdateBackstopTimeout");
  if (v4 == 0.0)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultCacheUpdateBackstopTimeout"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "doubleValue");
    else
      v7 = 900.0;
    -[SMInitiatorCacheManager setCacheUpdateBackstopTimeout:](self, "setCacheUpdateBackstopTimeout:", v7);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      cacheUpdateBackstopTimeout = self->_cacheUpdateBackstopTimeout;
      v15 = 138413058;
      v16 = v9;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2048;
      v22 = cacheUpdateBackstopTimeout;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Cache backstop timeout %lf", (uint8_t *)&v15, 0x2Au);

    }
  }
  -[SMInitiatorCacheManager cacheUpdateBackstopTimeout](self, "cacheUpdateBackstopTimeout");
  return result;
}

- (void)onHealthKitManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMInitiatorCacheManager *v9;

  v4 = a3;
  -[SMInitiatorCacheManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SMInitiatorCacheManager_onHealthKitManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__SMInitiatorCacheManager_onHealthKitManagerNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "workoutSnapshot");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_onHealthKitManagerWorkoutSnapshotUpdate:", v2);

}

- (void)_onHealthKitManagerWorkoutSnapshotUpdate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  objc_class *v22;
  _QWORD v23[5];
  id v24;
  SEL v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    goto LABEL_12;
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isActiveState")
    || !-[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice"))
  {

LABEL_10:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v27 = v17;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v5;
      v21 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,invalid state for workout update, %@";
      goto LABEL_16;
    }
LABEL_11:

    goto LABEL_12;
  }
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sessionType");

  if (v9 != 4)
    goto LABEL_10;
  v10 = -[SMInitiatorCacheManager _shouldIncludeWorkoutSnapshotInCache:](self, "_shouldIncludeWorkoutSnapshotInCache:", v5);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v27 = v17;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v5;
      v21 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,workout update not to be included in cache, %@";
LABEL_16:
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, v21, buf, 0x2Au);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v27 = v13;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v5;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,updating workout event, %@", buf, 0x2Au);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__SMInitiatorCacheManager__onHealthKitManagerWorkoutSnapshotUpdate___block_invoke;
  v23[3] = &unk_1E929FDC8;
  v23[4] = self;
  v25 = a2;
  v24 = v5;
  -[SMInitiatorCacheManager _fetchLocationWithCompletion:](self, "_fetchLocationWithCompletion:", v23);

LABEL_12:
}

void __68__SMInitiatorCacheManager__onHealthKitManagerWorkoutSnapshotUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v62 = a2;
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138413570;
      v64 = v48;
      v65 = 2112;
      v66 = v50;
      v67 = 2112;
      v68 = v51;
      v69 = 2112;
      v70 = v52;
      v71 = 2112;
      v72 = v62;
      v73 = 2112;
      v74 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,error with fetching location for workout event, %@, location, %@ error, %@", buf, 0x3Eu);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "snapshotDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "initiatorContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workoutEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") || objc_msgSend(*(id *)(a1 + 40), "sessionState") != 2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "workoutStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 40), "workoutStartDate");
    v11 = v10;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "initiatorContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workoutEvents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v5;
  if (!v16)
    goto LABEL_24;
  objc_msgSend(v16, "sessionIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqual:](v17, "isEqual:", v18))
  {
    v19 = objc_msgSend(v16, "activityType");
    if (v19 == objc_msgSend(*(id *)(a1 + 40), "activityType") && objc_msgSend(v16, "sessionState") == 4)
    {
      v20 = objc_msgSend(*(id *)(a1 + 40), "sessionState");

      if (v20 == 2)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138413314;
          v64 = v55;
          v65 = 2112;
          v66 = v57;
          v67 = 2112;
          v68 = v58;
          v69 = 2112;
          v70 = v16;
          v71 = 2112;
          v72 = v59;
          _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@, the new event is a Resume. Last event, %@, new workout snapshot, %@", buf, 0x34u);

        }
        v21 = 1;
        goto LABEL_23;
      }
LABEL_24:
      v21 = 0;
      goto LABEL_25;
    }
  }

  v21 = 0;
LABEL_23:

LABEL_25:
  objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(*(id *)(a1 + 40), "activityType");
  v24 = objc_msgSend(*(id *)(a1 + 40), "locationType");
  v25 = objc_msgSend(*(id *)(a1 + 40), "swimmingLocationType");
  v26 = objc_msgSend(*(id *)(a1 + 40), "sessionState");
  if (v16 && v26 == 3)
  {
    if (!v22)
    {
      objc_msgSend(v16, "sessionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v16, "sessionIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (v23)
    {
      if (v24)
        goto LABEL_32;
LABEL_40:
      if (objc_msgSend(v16, "locationType"))
      {
        v24 = objc_msgSend(v16, "locationType");
        if (v25)
          goto LABEL_44;
      }
      else
      {
        v24 = 0;
        if (v25)
          goto LABEL_44;
      }
      goto LABEL_33;
    }
    if (objc_msgSend(v16, "activityType"))
    {
      v23 = objc_msgSend(v16, "activityType");
      if (!v24)
        goto LABEL_40;
    }
    else
    {
      v23 = 0;
      if (!v24)
        goto LABEL_40;
    }
LABEL_32:
    if (v25)
      goto LABEL_44;
LABEL_33:
    if (objc_msgSend(v16, "swimmingLocationType"))
      v25 = objc_msgSend(v16, "swimmingLocationType");
    else
      v25 = 0;
  }
LABEL_44:
  v27 = objc_alloc(MEMORY[0x1E0D8BAB8]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v60) = v21;
  v29 = (void *)objc_msgSend(v27, "initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:", v28, v22, v62, v23, v24, v25, objc_msgSend(*(id *)(a1 + 40), "sessionState"), v60, v10);

  if (!v29)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v64 = v36;
      v65 = 2112;
      v66 = v38;
      v67 = 2112;
      v68 = v39;
      v69 = 2112;
      v70 = v54;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to construct an SMWorkoutEvent with RTCurrentWorkoutSnapshot, %@", buf, 0x2Au);
      goto LABEL_59;
    }
LABEL_52:

    goto LABEL_57;
  }
  if (v16)
  {
    objc_msgSend(v16, "sessionIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sessionIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isEqual:", v31)
      && (v32 = objc_msgSend(v16, "activityType"), v32 == objc_msgSend(v29, "activityType")))
    {
      v33 = objc_msgSend(v16, "sessionState");
      v34 = objc_msgSend(v29, "sessionState");

      if (v33 == v34)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138413314;
          v64 = v36;
          v65 = 2112;
          v66 = v38;
          v67 = 2112;
          v68 = v39;
          v69 = 2112;
          v70 = v16;
          v71 = 2112;
          v72 = v40;
          _os_log_debug_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ignoring duplicated workout event, last event, %@, new workout snapshot, %@", buf, 0x34u);
LABEL_59:

          goto LABEL_52;
        }
        goto LABEL_52;
      }
    }
    else
    {

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v64 = v42;
    v65 = 2112;
    v66 = v44;
    v67 = 2112;
    v68 = v45;
    v69 = 2112;
    v70 = v29;
    _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,adding workout event to intiator contact, %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "initiatorContact");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "workoutEvents");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v29);

  objc_msgSend(*(id *)(a1 + 32), "_updateInitiatorContactInStore");
LABEL_57:

}

- (BOOL)_shouldIncludeWorkoutSnapshotInCache:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "sessionState");
  return (v3 < 7) & (0x5Cu >> v3);
}

- (void)submitCAMetricInitiatorSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
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
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  double v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
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
  void *v91;
  id v92;

  v92 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v7);
  v9 = v8;

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numCacheUpdates");

  if (v11 < 2)
  {
    objc_msgSend(v92, "setValue:forKey:", &unk_1E93283E8, CFSTR("averageTimeBetweenCacheUpdates"));
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithDouble:", v9 / (double)(objc_msgSend(v13, "numCacheUpdates") - 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setValue:forKey:", v14, CFSTR("averageTimeBetweenCacheUpdates"));

  }
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "maxCacheSize");
  objc_msgSend(v15, "numberWithDouble:", v17 * 0.0009765625);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v18, CFSTR("maxCacheSize"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "maxLocationsInTrace"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v21, CFSTR("maxLocationsInTrace"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "maxTimeBetweenCacheUpdates");
  objc_msgSend(v22, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v24, CFSTR("maxTimeBetweenCacheUpdates"));

  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "numCacheUpdates"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v27, CFSTR("numCacheUpdates"));

  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "configuration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sessionStartDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSinceNow");
  objc_msgSend(v28, "numberWithDouble:", v32 / -60.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v33, CFSTR("sessionDuration"));

  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "timeTilCacheRelease");
  objc_msgSend(v34, "numberWithDouble:", v36 / 60.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v37, CFSTR("timeTilCacheRelease"));

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "numCacheUpdates");

  if (v39 < 1)
  {
    v43 = 0;
  }
  else
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (double)objc_msgSend(v40, "numberOfSuccessfulCacheUpdates");
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = vcvtpd_s64_f64(v41 / (double)objc_msgSend(v42, "numCacheUpdates") * 100.0);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v44, CFSTR("percentageOfSuccessfulCacheUpdates"));

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "numberOfMessageCancelling");

  if (v46 < 1)
  {
    v50 = 0;
  }
  else
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (double)objc_msgSend(v47, "numberOfSuccessfulMessageCancelling");
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = vcvtpd_s64_f64(v48 / (double)objc_msgSend(v49, "numberOfMessageCancelling") * 100.0);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v51, CFSTR("percentageOfSuccessfulMessageCanceling"));

  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "numberOfMessageScheduling");

  if (v53 < 1)
  {
    v57 = 0;
  }
  else
  {
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (double)objc_msgSend(v54, "numberOfSuccessfulMessageScheduling");
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = vcvtpd_s64_f64(v55 / (double)objc_msgSend(v56, "numberOfMessageScheduling") * 100.0);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v58, CFSTR("percentageOfSuccessfulMessageScheduling"));

  v59 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "configuration");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "numberWithUnsignedInteger:", objc_msgSend(v61, "sessionType"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v62, CFSTR("sessionType"));

  v63 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "monitorContext");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "numberWithUnsignedInteger:", objc_msgSend(v65, "triggerCategory"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v66, CFSTR("triggerType"));

  v67 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "numberWithBool:", objc_msgSend(v68, "wasCacheReleased"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v69, CFSTR("wasCacheReleased"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D8B9B0], "shareAllLocations"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v70, CFSTR("wasLocationHistoryEnabled"));

  v71 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "numberWithBool:", objc_msgSend(v72, "wasScheduledSendTriggered"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v73, CFSTR("wasScheduledSendTriggered"));

  v74 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "numberWithInteger:", objc_msgSend(v75, "numberOfHandoffBecomingActive"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v76, CFSTR("numTakeover"));

  v77 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "numberWithInteger:", objc_msgSend(v78, "numberOfHandoffBecomingNonActive"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v79, CFSTR("numHandoff"));

  v80 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "earliestActiveDeviceIdentifier");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager messagingService](self, "messagingService");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "deviceIdentifier");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "numberWithBool:", objc_msgSend(v82, "isEqual:", v84));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v85, CFSTR("isActiveAtStart"));

  v86 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "latestActiveDeviceIdentifier");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager messagingService](self, "messagingService");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "deviceIdentifier");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "numberWithBool:", objc_msgSend(v88, "isEqual:", v90));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v91, CFSTR("isActiveAtEnd"));

  AnalyticsSendEvent();
}

- (void)storeCAMetricForAllLocations:(id)a3
{
  id v5;
  void *v6;
  SMCAMetricCacheUpdate *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  RTDistanceCalculator *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  double v43;
  __int128 v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  CLLocationDegrees v67;
  CLLocationDegrees v68;
  void *v69;
  double v70;
  CLLocationDegrees v71;
  CLLocationDegrees v72;
  double v73;
  double v74;
  id v75;
  NSObject *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  objc_class *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  double v129;
  void *v130;
  void *v131;
  double v132;
  void *v133;
  __int128 v134;
  const char *aSelector;
  RTDistanceCalculator *v136;
  id v137;
  CLLocationCoordinate2D v138;
  CLLocationCoordinate2D v139;
  uint8_t buf[4];
  void *v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  void *v145;
  __int16 v146;
  id v147;
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    v7 = objc_alloc_init(SMCAMetricCacheUpdate);
    -[SMInitiatorCacheManager setCaMetricCacheUpdate:](self, "setCaMetricCacheUpdate:", v7);

    if (!v5)
    {
LABEL_10:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v141 = v30;
        v142 = 2112;
        v143 = v32;
        v144 = 2112;
        v145 = v33;
        _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,empty list of locations", buf, 0x20u);

      }
      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setNumLocationsInTrace:", 0);

      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAverageHuncForLocationsInTrace:", -1.0);

      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAverageTimeBetweenLocationsInTrace:", -1.0);

      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAverageDistanceBetweenLocationsInTrace:", -1.0);

      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setMinHuncForLocationsInTrace:", -1.0);

      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setMaxHuncForLocationsInTrace:", -1.0);
      goto LABEL_37;
    }
  }
  if (!objc_msgSend(v5, "count"))
    goto LABEL_10;
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    aSelector = a2;
    v39 = objc_alloc_init(RTDistanceCalculator);
    v40 = objc_msgSend(v5, "count");
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setNumLocationsInTrace:", v40);

    v25 = v39;
    objc_msgSend(v5, "count");
    v42 = 0;
    v43 = 0.0;
    *(_QWORD *)&v44 = 138413058;
    v134 = v44;
    v45 = 0.0;
    v46 = 0.0;
    v136 = v39;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v42, v134);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "hunc");
      v49 = v48;
      objc_msgSend(v47, "hunc");
      v51 = v50;
      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "minHuncForLocationsInTrace");
      v54 = v53;

      if (v51 < v54)
      {
        objc_msgSend(v47, "hunc");
        v56 = v55;
        -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setMinHuncForLocationsInTrace:", v56);

      }
      objc_msgSend(v47, "hunc");
      v59 = v58;
      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "maxHuncForLocationsInTrace");
      v62 = v61;

      if (v59 > v62)
      {
        objc_msgSend(v47, "hunc");
        v64 = v63;
        -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setMaxHuncForLocationsInTrace:", v64);

      }
      v139.latitude = 0.0;
      v139.longitude = 0.0;
      objc_msgSend(v47, "latitude");
      v67 = v66;
      objc_msgSend(v47, "longitude");
      v139 = CLLocationCoordinate2DMake(v67, v68);
      objc_msgSend(v5, "objectAtIndexedSubscript:", ++v42);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v138.latitude = 0.0;
      v138.longitude = 0.0;
      objc_msgSend(v69, "latitude");
      v71 = v70;
      objc_msgSend(v69, "longitude");
      v138 = CLLocationCoordinate2DMake(v71, v72);
      v137 = 0;
      objc_msgSend(v25, "distanceFromLocationCoordinate:toLocationCoordinate:error:", &v139, &v138, &v137);
      v74 = v73;
      v75 = v137;
      if (v75)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = (objc_class *)objc_opt_class();
          NSStringFromClass(v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v134;
          v141 = v97;
          v142 = 2112;
          v143 = v99;
          v144 = 2112;
          v145 = v100;
          v146 = 2112;
          v147 = v75;
          _os_log_error_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,distanceBetweenLocations,error %@", buf, 0x2Au);

          v25 = v136;
        }

      }
      else
      {
        v45 = v45 + v74;
      }
      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "minDistanceBetweenLocationsInTrace");
      v79 = v78;

      if (v74 < v79)
      {
        -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setMinDistanceBetweenLocationsInTrace:", v74);

      }
      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "maxDistanceBetweenLocationsInTrace");
      v83 = v82;

      if (v74 > v83)
      {
        -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setMaxDistanceBetweenLocationsInTrace:", v74);

      }
      objc_msgSend(v47, "date");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "date");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "timeIntervalSinceDate:", v86);
      v88 = v87 / -60.0;

      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "minTimeBetweenLocationsInTrace");
      v91 = v90;

      if (v88 < v91)
      {
        -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setMinTimeBetweenLocationsInTrace:", v88);

      }
      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "maxTimeBetweenLocationsInTrace");
      v95 = v94;

      if (v88 > v95)
      {
        -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setMaxTimeBetweenLocationsInTrace:", v88);

      }
      v43 = v43 + v49;
      v46 = v46 + v88;

    }
    while (objc_msgSend(v5, "count") - 2 > (unint64_t)(v42 - 1));
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "hunc");
    v103 = v102;

    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "hunc");
    v106 = v105;
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "minHuncForLocationsInTrace");
    v109 = v108;

    if (v106 < v109)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "hunc");
      v112 = v111;
      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setMinHuncForLocationsInTrace:", v112);

    }
    v114 = v43 + v103;
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "hunc");
    v117 = v116;
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "maxHuncForLocationsInTrace");
    v120 = v119;

    if (v117 > v120)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "hunc");
      v123 = v122;
      -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "setMaxHuncForLocationsInTrace:", v123);

    }
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v114 / (double)objc_msgSend(v125, "numLocationsInTrace");
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setAverageHuncForLocationsInTrace:", v126);

    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v46 / (double)(objc_msgSend(v128, "numLocationsInTrace") - 1);
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setAverageTimeBetweenLocationsInTrace:", v129);

    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v45 / (double)(objc_msgSend(v131, "numLocationsInTrace") - 1);
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setAverageDistanceBetweenLocationsInTrace:", v132);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v141 = v9;
      v142 = 2112;
      v143 = v11;
      v144 = 2112;
      v145 = v12;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,one location available", buf, 0x20u);

    }
    v13 = objc_msgSend(v5, "count");
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumLocationsInTrace:", v13);

    objc_msgSend(v5, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hunc");
    v17 = v16;
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAverageHuncForLocationsInTrace:", v17);

    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAverageTimeBetweenLocationsInTrace:", -1.0);

    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAverageDistanceBetweenLocationsInTrace:", -1.0);

    objc_msgSend(v5, "objectAtIndex:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hunc");
    v23 = v22;
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMinHuncForLocationsInTrace:", v23);

    objc_msgSend(v5, "objectAtIndex:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hunc");
    v27 = v26;
    -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMaxHuncForLocationsInTrace:", v27);

  }
LABEL_37:

}

- (void)submitCacheUpdateCAMetricForCache:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  RTDistanceCalculator *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CLLocationDegrees v17;
  void *v18;
  CLLocationDegrees v19;
  void *v20;
  double v21;
  CLLocationDegrees v22;
  void *v23;
  CLLocationDegrees v24;
  double v25;
  double v26;
  id v27;
  NSObject *v28;
  RTDistanceCalculator *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  uint64_t v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
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
  objc_class *v111;
  void *v112;
  void *v113;
  RTDistanceCalculator *v114;
  id v115;
  id v116;
  CLLocationCoordinate2D v117;
  CLLocationCoordinate2D v118;
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  id v126;
  uint64_t v127;

  v6 = a4;
  v127 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v115 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(RTDistanceCalculator);
  objc_msgSend(v9, "startingLocation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        objc_msgSend(v9, "mostRecentLocation"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    objc_msgSend(v9, "startingLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "latitude");
    v17 = v16;
    objc_msgSend(v9, "startingLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "longitude");
    v118 = CLLocationCoordinate2DMake(v17, v19);

    objc_msgSend(v9, "mostRecentLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "latitude");
    v22 = v21;
    objc_msgSend(v9, "mostRecentLocation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "longitude");
    v117 = CLLocationCoordinate2DMake(v22, v24);

    v116 = 0;
    -[RTDistanceCalculator distanceFromLocationCoordinate:toLocationCoordinate:error:](v11, "distanceFromLocationCoordinate:toLocationCoordinate:error:", &v118, &v117, &v116);
    v26 = v25;
    v27 = v116;
    if (v27)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = (objc_class *)objc_opt_class();
        NSStringFromClass(v111);
        v114 = v11;
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v120 = v110;
        v121 = 2112;
        v122 = v112;
        v123 = 2112;
        v124 = v113;
        v125 = 2112;
        v126 = v27;
        _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,distanceFromStartingLocation,error %@", buf, 0x2Au);

        v11 = v114;
      }

      objc_msgSend(v10, "setValue:forKey:", &unk_1E93283E8, CFSTR("distanceFromStartingLocation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v30, CFSTR("distanceFromStartingLocation"));

    }
    v29 = v11;

  }
  else
  {
    v29 = v11;
    objc_msgSend(v10, "setValue:forKey:", &unk_1E93283E8, CFSTR("distanceFromStartingLocation"));
  }
  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "mostRecentLocation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeIntervalSinceNow");
  objc_msgSend(v31, "numberWithDouble:", -v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v35, CFSTR("mostRecentLocationAge"));

  v36 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "mostRecentLocation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "hunc");
  objc_msgSend(v36, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v38, CFSTR("mostRecentLocationHunc"));

  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "configuration");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sessionStartDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "timeIntervalSinceNow");
  objc_msgSend(v39, "numberWithDouble:", -v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v44, CFSTR("sessionDuration"));

  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "numberWithInt:", objc_msgSend(v46, "sessionState") == 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v47, CFSTR("hasCacheBeenReleased"));

  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "configuration");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v50, "sessionType"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v51, CFSTR("sessionType"));

  v52 = v115;
  if (v115)
  {
    v53 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v115, "domain");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringWithFormat:", CFSTR("%@:%d"), v54, objc_msgSend(v115, "code"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v55, CFSTR("uploadError"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v56, CFSTR("wasSuccessful"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D8B9B0], "shareAllLocations"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v57, CFSTR("wasLocationHistoryEnabled"));

  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "configuration");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "sessionType");

  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "configuration");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v60 == 1)
  {
    objc_msgSend(v62, "time");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "timeBound");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "timeIntervalSinceNow");
    v67 = v66;

    v52 = v115;
LABEL_16:

    goto LABEL_17;
  }
  v68 = objc_msgSend(v62, "sessionType");

  v67 = -1.0;
  if (v68 == 2)
  {
    -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "estimatedEndDate");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "timeIntervalSinceNow");
    v67 = v69;
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(v67 / 60.0));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v70, CFSTR("timeLeftInSession"));

  v71 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "cacheSize");
  objc_msgSend(v71, "numberWithDouble:", v73 * 0.0009765625);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v74, CFSTR("cacheSize"));

  v75 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "averageDistanceBetweenLocationsInTrace");
  objc_msgSend(v75, "numberWithDouble:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v77, CFSTR("averageDistanceBetweenLocationsInTrace"));

  v78 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "averageHuncForLocationsInTrace");
  objc_msgSend(v78, "numberWithDouble:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v80, CFSTR("averageHuncForLocationsInTrace"));

  v81 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "averageTimeBetweenLocationsInTrace");
  objc_msgSend(v81, "numberWithDouble:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v83, CFSTR("averageTimeBetweenLocationsInTrace"));

  v84 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "maxDistanceBetweenLocationsInTrace");
  objc_msgSend(v84, "numberWithDouble:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v86, CFSTR("maxDistanceBetweenLocationsInTrace"));

  v87 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "maxHuncForLocationsInTrace");
  objc_msgSend(v87, "numberWithDouble:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v89, CFSTR("maxHuncForLocationsInTrace"));

  v90 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "maxTimeBetweenLocationsInTrace");
  objc_msgSend(v90, "numberWithDouble:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v92, CFSTR("maxTimeBetweenLocationsInTrace"));

  v93 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "minDistanceBetweenLocationsInTrace");
  objc_msgSend(v93, "numberWithDouble:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v95, CFSTR("minDistanceBetweenLocationsInTrace"));

  v96 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "minHuncForLocationsInTrace");
  objc_msgSend(v96, "numberWithDouble:");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v98, CFSTR("minHuncForLocationsInTrace"));

  v99 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "minTimeBetweenLocationsInTrace");
  objc_msgSend(v99, "numberWithDouble:");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v101, CFSTR("minTimeBetweenLocationsInTrace"));

  v102 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager caMetricCacheUpdate](self, "caMetricCacheUpdate");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "numberWithInteger:", objc_msgSend(v103, "numLocationsInTrace"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v104, CFSTR("numLocationsInTrace"));

  v105 = (void *)MEMORY[0x1E0CB37E8];
  +[RTRuntime footprint](RTRuntime, "footprint");
  objc_msgSend(v105, "numberWithDouble:");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v106, CFSTR("processFootprint"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v107, CFSTR("isActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMInitiatorCacheManager isCellularActivated](self, "isCellularActivated"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v108, CFSTR("isCellularActivated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMInitiatorCacheManager isStandalone](self, "isStandalone"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v109, CFSTR("isStandalone"));

  AnalyticsSendEvent();
  -[SMInitiatorCacheManager setCaMetricCacheUpdate:](self, "setCaMetricCacheUpdate:", 0);

}

- (void)submitPowerTelemetryMetricForEvent:(int64_t)a3
{
  id v6;
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
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_100 != -1)
    dispatch_once(&_MergedGlobals_100, &__block_literal_global_427);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[SMInitiatorCacheManager getTelemetryEventStringForEvent:](SMInitiatorCacheManager, "getTelemetryEventStringForEvent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("event"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "sessionType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("sessionType"));

  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("sessionid"));

  if (a3 == 2)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "numCacheUpdates"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v16, CFSTR("numCacheUploads"));

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138413058;
    v23 = v18;
    v24 = 2112;
    v25 = v20;
    v26 = 2112;
    v27 = v21;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,eventDict:%@", (uint8_t *)&v22, 0x2Au);

  }
  PPSSendTelemetry();

}

uint64_t __62__SMInitiatorCacheManager_submitPowerTelemetryMetricForEvent___block_invoke()
{
  uint64_t result;

  result = PPSCreateTelemetryIdentifier();
  qword_1ED9429C8 = result;
  return result;
}

+ (id)getTelemetryEventStringForEvent:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 2)
    v3 = CFSTR("stop");
  if (a3 == 1)
    return CFSTR("start");
  else
    return (id)v3;
}

- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, id, void *, void *, void *, void *, _QWORD);
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
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
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, id, void *, void *, void *, void *, _QWORD))a4;
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v7);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v13;
      v36 = 2112;
      v37 = v15;
      v38 = 2112;
      v39 = v16;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Returning the initiator safety cache", buf, 0x20u);

    }
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "phoneCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "watchCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shouldBeCleanedUpDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "keyReleaseMessageSendDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v7, v18, v20, v22, v24, 0);

    v8 = (void (**)(id, id, void *, void *, void *, void *, _QWORD))v19;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v28;
      v36 = 2112;
      v37 = v30;
      v38 = 2112;
      v39 = v31;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,SessionID mismatched", buf, 0x20u);

    }
    v32 = *MEMORY[0x1E0CB2D50];
    v25 = (void *)MEMORY[0x1E0CB3940];
    -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("SessionID mismatched, requestd cache for %@, found cache for %@"), v7, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *, void *, void *, void *, void *))v8)[2](v8, v7, 0, 0, 0, 0, v18);
  }

}

- (void)_writeActiveSessionDetails:(int64_t)a3 qos:(id)a4 completion:(id)a5
{
  objc_class *v7;
  uint64_t v8;
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
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v27;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  SMInitiatorCacheManager *v35;
  id v36;
  id v37;
  id v38[3];
  id location[2];

  v27 = a4;
  v25 = a5;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v8 = objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc(MEMORY[0x1E0D8B8E8]);
  -[SMInitiatorCacheManager sessionManagerState](self, "sessionManagerState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activeDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyReleaseMessageSendDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheduleSendMessageGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager initiatorContact](self, "initiatorContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conversation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "receiverPrimaryHandles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;
  v30 = (void *)v8;
  v18 = (void *)objc_msgSend(v17, "initWithSessionID:activeDeviceIdentifier:cacheReleasedDate:scheduledSendGUID:receiverHandles:", v8, v9, v11, v13, v16);

  objc_initWeak(location, self);
  -[SMInitiatorCacheManager activeSessionDetailsZone](self, "activeSessionDetailsZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __69__SMInitiatorCacheManager__writeActiveSessionDetails_qos_completion___block_invoke;
  v32[3] = &unk_1E929FD00;
  objc_copyWeak(v38, location);
  v20 = v30;
  v33 = v20;
  v21 = v24;
  v34 = v21;
  v38[1] = (id)a2;
  v22 = v25;
  v38[2] = (id)a3;
  v37 = v22;
  v35 = self;
  v23 = v27;
  v36 = v23;
  objc_msgSend(v19, "writeActiveSessionDetailsRecord:qos:completion:", v18, v23, v32);

  objc_destroyWeak(v38);
  objc_destroyWeak(location);

}

void __69__SMInitiatorCacheManager__writeActiveSessionDetails_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412802;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during zone delete", (uint8_t *)&v27, 0x20u);

    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_18;
  }
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412802;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,active session details stored", (uint8_t *)&v27, 0x20u);

    }
    goto LABEL_17;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v4))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_18:
      v10();
      goto LABEL_19;
    }
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138413058;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v4;
    v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details with non recoverable error %@";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v27, 0x2Au);

    goto LABEL_17;
  }
  v6 = *(_QWORD *)(a1 + 88);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6 <= 0)
  {
    if (!v8)
      goto LABEL_17;
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138413058;
    v28 = v25;
    v29 = 2112;
    v30 = v26;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v4;
    v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details after retries with recoverable error %@";
    goto LABEL_21;
  }
  if (v8)
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 88);
    v27 = 138413314;
    v28 = v21;
    v29 = 2112;
    v30 = v22;
    v31 = 2112;
    v32 = v23;
    v33 = 2112;
    v34 = v4;
    v35 = 1024;
    v36 = v24;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v27, 0x30u);

  }
  objc_msgSend(*(id *)(a1 + 48), "_writeActiveSessionDetails:qos:completion:", *(_QWORD *)(a1 + 88) - 1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_19:

}

- (void)_deleteActiveSessionDetails:(int64_t)a3
{
  objc_class *v6;
  void *v7;
  void *v8;
  SMCloudKitQosOptions *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SMInitiatorCacheManager *v16;
  id v17[3];
  id location;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorCacheManager sessionUUID](self, "sessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
  objc_initWeak(&location, self);
  -[SMInitiatorCacheManager activeSessionDetailsZone](self, "activeSessionDetailsZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__SMInitiatorCacheManager__deleteActiveSessionDetails___block_invoke;
  v13[3] = &unk_1E929FE10;
  objc_copyWeak(v17, &location);
  v11 = v8;
  v14 = v11;
  v12 = v7;
  v17[1] = (id)a2;
  v17[2] = (id)a3;
  v15 = v12;
  v16 = self;
  objc_msgSend(v10, "deleteActiveSessionDetailsRecordWithQos:completion:", v9, v13);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

void __55__SMInitiatorCacheManager__deleteActiveSessionDetails___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      v12 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during zone delete";
      v13 = v7;
      v14 = 32;
LABEL_17:
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v25, v14);
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,active session details record deleted successfully", (uint8_t *)&v25, 0x20u);
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v4))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v11;
      v31 = 2112;
      v32 = v4;
      v12 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete active session details record with non recoverable error %@";
LABEL_16:
      v13 = v7;
      v14 = 42;
      goto LABEL_17;
    }
LABEL_19:

    goto LABEL_20;
  }
  v6 = *(_QWORD *)(a1 + 72);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6 <= 0)
  {
    if (v8)
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      v29 = 2112;
      v30 = v11;
      v31 = 2112;
      v32 = v4;
      v12 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete active session details record after retries with "
            "recoverable error %@";
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  if (v8)
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 72);
    v25 = 138413314;
    v26 = v21;
    v27 = 2112;
    v28 = v22;
    v29 = 2112;
    v30 = v23;
    v31 = 2112;
    v32 = v4;
    v33 = 1024;
    v34 = v24;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete active session details record with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v25, 0x30u);

  }
  objc_msgSend(*(id *)(a1 + 48), "_deleteActiveSessionDetails:", *(_QWORD *)(a1 + 72) - 1);
LABEL_20:

}

- (void)onNearbyEffectivePairedDeviceChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMInitiatorCacheManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SMInitiatorCacheManager_onNearbyEffectivePairedDeviceChangedNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __76__SMInitiatorCacheManager_onNearbyEffectivePairedDeviceChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onNearbyEffectivePairedDeviceChangedNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onNearbyEffectivePairedDeviceChangedNotification:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,on paired device notification %@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification, "notificationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
    -[SMInitiatorCacheManager _evaluateAndManagePeriodicCacheUpdate](self, "_evaluateAndManagePeriodicCacheUpdate");

}

- (SMInitiatorCacheManagerDelegateProtocol)delegate
{
  return (SMInitiatorCacheManagerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)initializationInProgress
{
  return self->_initializationInProgress;
}

- (void)setInitializationInProgress:(BOOL)a3
{
  self->_initializationInProgress = a3;
}

- (BOOL)initializationWasAborted
{
  return self->_initializationWasAborted;
}

- (void)setInitializationWasAborted:(BOOL)a3
{
  self->_initializationWasAborted = a3;
}

- (BOOL)initializationCompletionCalled
{
  return self->_initializationCompletionCalled;
}

- (void)setInitializationCompletionCalled:(BOOL)a3
{
  self->_initializationCompletionCalled = a3;
}

- (id)initializationCompletion
{
  return self->_initializationCompletion;
}

- (void)setInitializationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)initiatorEligibilityQueue
{
  return self->_initiatorEligibilityQueue;
}

- (void)setInitiatorEligibilityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorEligibilityQueue, a3);
}

- (RTXPCTimerAlarm)scheduledSendFireTimerAlarm
{
  return self->_scheduledSendFireTimerAlarm;
}

- (void)setScheduledSendFireTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledSendFireTimerAlarm, a3);
}

- (RTXPCTimerAlarm)cacheUpdateBackstopTimerAlarm
{
  return self->_cacheUpdateBackstopTimerAlarm;
}

- (void)setCacheUpdateBackstopTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_cacheUpdateBackstopTimerAlarm, a3);
}

- (BOOL)scheduledSendInProgress
{
  return self->_scheduledSendInProgress;
}

- (void)setScheduledSendInProgress:(BOOL)a3
{
  self->_scheduledSendInProgress = a3;
}

- (SMCAMetricCacheUpdate)caMetricCacheUpdate
{
  return self->_caMetricCacheUpdate;
}

- (void)setCaMetricCacheUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_caMetricCacheUpdate, a3);
}

- (id)deviceStatusReturnBlock
{
  return self->_deviceStatusReturnBlock;
}

- (void)setDeviceStatusReturnBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)wifiLinkQualityFetchInProgress
{
  return self->_wifiLinkQualityFetchInProgress;
}

- (void)setWifiLinkQualityFetchInProgress:(BOOL)a3
{
  self->_wifiLinkQualityFetchInProgress = a3;
}

- (BOOL)cellularLinkQualityFetchInProgress
{
  return self->_cellularLinkQualityFetchInProgress;
}

- (void)setCellularLinkQualityFetchInProgress:(BOOL)a3
{
  self->_cellularLinkQualityFetchInProgress = a3;
}

- (BOOL)initiatorContactStoreInProgress
{
  return self->_initiatorContactStoreInProgress;
}

- (void)setInitiatorContactStoreInProgress:(BOOL)a3
{
  self->_initiatorContactStoreInProgress = a3;
}

- (BOOL)isPeriodicallyUpdatingCache
{
  return self->_isPeriodicallyUpdatingCache;
}

- (void)setIsPeriodicallyUpdatingCache:(BOOL)a3
{
  self->_isPeriodicallyUpdatingCache = a3;
}

- (BOOL)registeredForActiveNotifications
{
  return self->_registeredForActiveNotifications;
}

- (void)setRegisteredForActiveNotifications:(BOOL)a3
{
  self->_registeredForActiveNotifications = a3;
}

- (BOOL)registeredForGeneralNotifications
{
  return self->_registeredForGeneralNotifications;
}

- (void)setRegisteredForGeneralNotifications:(BOOL)a3
{
  self->_registeredForGeneralNotifications = a3;
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120, 1);
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (SMSafetyCacheZone)activeSessionZone
{
  return self->_activeSessionZone;
}

- (void)setActiveSessionZone:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessionZone, a3);
}

- (SMInitiatorContact)initiatorContact
{
  return self->_initiatorContact;
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityManager, a3);
}

- (SMSessionManagerState)sessionManagerState
{
  return self->_sessionManagerState;
}

- (void)setSessionManagerState:(id)a3
{
  objc_storeStrong((id *)&self->_sessionManagerState, a3);
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (RTNetworkOfInterestManager)networkOfInterestManager
{
  return self->_networkOfInterestManager;
}

- (unint64_t)cellularStrength
{
  return self->_cellularStrength;
}

- (void)setCellularStrength:(unint64_t)a3
{
  self->_cellularStrength = a3;
}

- (unint64_t)wifiStrength
{
  return self->_wifiStrength;
}

- (void)setWifiStrength:(unint64_t)a3
{
  self->_wifiStrength = a3;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (BOOL)initiatorContactStored
{
  return self->_initiatorContactStored;
}

- (void)setInitiatorContactStored:(BOOL)a3
{
  self->_initiatorContactStored = a3;
}

- (BOOL)initiatorContactUpdatePending
{
  return self->_initiatorContactUpdatePending;
}

- (void)setInitiatorContactUpdatePending:(BOOL)a3
{
  self->_initiatorContactUpdatePending = a3;
}

- (NSUUID)cacheUploadInProgress
{
  return self->_cacheUploadInProgress;
}

- (void)setCacheUploadInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_cacheUploadInProgress, a3);
}

- (int64_t)initiatorEligibility
{
  return self->_initiatorEligibility;
}

- (void)setInitiatorEligibility:(int64_t)a3
{
  self->_initiatorEligibility = a3;
}

- (int64_t)receiverEligibility
{
  return self->_receiverEligibility;
}

- (void)setReceiverEligibility:(int64_t)a3
{
  self->_receiverEligibility = a3;
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (RTXPCTimerAlarm)cleanupCacheTimerAlarm
{
  return self->_cleanupCacheTimerAlarm;
}

- (void)setCleanupCacheTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_cleanupCacheTimerAlarm, a3);
}

- (SMScreenLockMonitor)screenLockMonitor
{
  return self->_screenLockMonitor;
}

- (void)setScreenLockMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_screenLockMonitor, a3);
}

- (double)cacheUpdateBackstopTimeout
{
  return self->_cacheUpdateBackstopTimeout;
}

- (void)setCacheUpdateBackstopTimeout:(double)a3
{
  self->_cacheUpdateBackstopTimeout = a3;
}

- (SMActiveSessionZone)activeSessionDetailsZone
{
  return self->_activeSessionDetailsZone;
}

- (void)setActiveSessionDetailsZone:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessionDetailsZone, a3);
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_activeSessionDetailsZone, 0);
  objc_storeStrong((id *)&self->_screenLockMonitor, 0);
  objc_storeStrong((id *)&self->_cleanupCacheTimerAlarm, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_cacheUploadInProgress, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_networkOfInterestManager, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_sessionManagerState, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_initiatorContact, 0);
  objc_storeStrong((id *)&self->_activeSessionZone, 0);
  objc_storeStrong((id *)&self->_batteryManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong(&self->_deviceStatusReturnBlock, 0);
  objc_storeStrong((id *)&self->_caMetricCacheUpdate, 0);
  objc_storeStrong((id *)&self->_cacheUpdateBackstopTimerAlarm, 0);
  objc_storeStrong((id *)&self->_scheduledSendFireTimerAlarm, 0);
  objc_storeStrong((id *)&self->_initiatorEligibilityQueue, 0);
  objc_storeStrong(&self->_initializationCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
