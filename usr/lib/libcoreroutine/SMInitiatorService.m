@implementation SMInitiatorService

- (SMInitiatorService)initWithDefaultsManager:(id)a3 contactsManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 sessionManager:(id)a8 sessionMonitor:(id)a9 messagingService:(id)a10 safetyCacheStore:(id)a11 sessionStore:(id)a12 dataProtectionManager:(id)a13 batteryManager:(id)a14 xpcActivityManager:(id)a15 networkOfInterestManager:(id)a16 authorizationManager:(id)a17 wristStateManager:(id)a18 vehicleLocationProvider:(id)a19 starkManager:(id)a20 suggestionsManager:(id)a21 suggestionsHelper:(id)a22 learnedLocationManager:(id)a23 healthKitManager:(id)a24 deviceConfigurationChecker:(id)a25 noMovementMonitor:(id)a26 biomeManager:(id)a27
{
  id v32;
  uint64_t v33;
  NSHashTable *observers;
  uint64_t v35;
  NSMutableArray *cacheManagerArray;
  RTInvocationDispatcher *v37;
  void *v38;
  uint64_t v39;
  RTInvocationDispatcher *dispatcher;
  id *p_sessionMonitor;
  SMMessagingService *messagingService;
  void *v43;
  SMMessagingService *v44;
  void *v45;
  SMMessagingService *v46;
  void *v47;
  SMMessagingService *v48;
  void *v49;
  SMMessagingService *v50;
  void *v51;
  SMSessionMetricManager *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  SMSessionMetricManager *sessionMetricManager;
  SMInitiatorService *v60;
  SMInitiatorService *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  const char *v73;
  NSObject *v75;
  id v76;
  SMInitiatorService *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  objc_super v105;
  uint8_t buf[16];

  v104 = a3;
  v103 = a4;
  v102 = a5;
  v101 = a6;
  v100 = a7;
  v87 = a8;
  v76 = a9;
  v86 = a9;
  v99 = a10;
  v98 = a11;
  v97 = a12;
  v84 = a13;
  v83 = a14;
  v82 = a15;
  v96 = a16;
  v95 = a17;
  v81 = a18;
  v80 = a19;
  v94 = a20;
  v93 = a21;
  v92 = a22;
  v91 = a23;
  v90 = a24;
  v89 = a25;
  v88 = a26;
  v32 = a27;
  v85 = v32;
  if (v104)
  {
    if (v103)
    {
      if (v102)
      {
        if (v101)
        {
          if (v100)
          {
            if (v99)
            {
              if (v98)
              {
                if (v97)
                {
                  if (v96)
                  {
                    if (v95)
                    {
                      if (v94)
                      {
                        if (v93)
                        {
                          if (v92)
                          {
                            if (v91)
                            {
                              if (v90)
                              {
                                if (v89)
                                {
                                  if (v88)
                                  {
                                    if (v32)
                                    {
                                      v105.receiver = self;
                                      v105.super_class = (Class)SMInitiatorService;
                                      v79 = -[RTNotifier init](&v105, sel_init);
                                      if (v79)
                                      {
                                        objc_storeStrong((id *)&v79->_defaultsManager, a3);
                                        objc_storeStrong((id *)&v79->_contactsManager, a4);
                                        objc_storeStrong((id *)&v79->_locationManager, a5);
                                        objc_storeStrong((id *)&v79->_motionActivityManager, a6);
                                        objc_storeStrong((id *)&v79->_platform, a7);
                                        objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
                                        v33 = objc_claimAutoreleasedReturnValue();
                                        observers = v79->_observers;
                                        v79->_observers = (NSHashTable *)v33;

                                        objc_storeStrong((id *)&v79->_safetyCacheStore, a11);
                                        v79->_safetyCacheStoreAvailability = 0;
                                        objc_storeStrong((id *)&v79->_sessionStore, a12);
                                        v79->_sessionStoreAvailability = 0;
                                        objc_storeStrong((id *)&v79->_dataProtectionManager, a13);
                                        objc_storeStrong((id *)&v79->_xpcActivityManager, a15);
                                        objc_storeStrong((id *)&v79->_batteryManager, a14);
                                        v35 = objc_opt_new();
                                        cacheManagerArray = v79->_cacheManagerArray;
                                        v79->_cacheManagerArray = (NSMutableArray *)v35;

                                        objc_storeStrong((id *)&v79->_authorizationManager, a17);
                                        objc_storeStrong((id *)&v79->_wristStateManager, a18);
                                        objc_storeStrong((id *)&v79->_vehicleLocationProvider, a19);
                                        objc_storeStrong((id *)&v79->_starkManager, a20);
                                        objc_storeStrong((id *)&v79->_suggestionsManager, a21);
                                        objc_storeStrong((id *)&v79->_suggestionsHelper, a22);
                                        objc_storeStrong((id *)&v79->_learnedLocationManager, a23);
                                        objc_storeStrong((id *)&v79->_healthKitManager, a24);
                                        objc_storeStrong((id *)&v79->_deviceConfigurationChecker, a25);
                                        v37 = [RTInvocationDispatcher alloc];
                                        -[RTNotifier queue](v79, "queue");
                                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                                        v39 = -[RTInvocationDispatcher initWithQueue:](v37, "initWithQueue:", v38);
                                        dispatcher = v79->_dispatcher;
                                        v79->_dispatcher = (RTInvocationDispatcher *)v39;

                                        objc_storeStrong((id *)&v79->_noMovementMonitor, a26);
                                        objc_storeStrong((id *)&v79->_biomeManager, a27);
                                        if (v87)
                                        {
                                          objc_storeStrong((id *)&v79->_sessionManager, a8);
                                          -[SMSessionManager addObserver:](v79->_sessionManager, "addObserver:", v79, a9);
                                        }
                                        if (v86)
                                        {
                                          p_sessionMonitor = (id *)&v79->_sessionMonitor;
                                          objc_storeStrong((id *)&v79->_sessionMonitor, v76);
                                          if (v87)
                                          {
                                            objc_msgSend(*p_sessionMonitor, "setSessionManagerDelegate:", v79->_sessionManager);
                                            -[SMSessionManager addObserver:](v79->_sessionManager, "addObserver:", *p_sessionMonitor);
                                          }
                                        }
                                        objc_storeStrong((id *)&v79->_networkOfInterestManager, a16);
                                        objc_storeStrong((id *)&v79->_messagingService, a10);
                                        messagingService = v79->_messagingService;
                                        +[RTNotification notificationName](SMSessionStartMessageSendResultNotification, "notificationName");
                                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[RTNotifier addObserver:selector:name:](messagingService, "addObserver:selector:name:", v79, sel_onSessionStartMessageSendResult_, v43);

                                        v44 = v79->_messagingService;
                                        +[RTNotification notificationName](SMMessageReceivedNotification, "notificationName");
                                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[RTNotifier addObserver:selector:name:](v44, "addObserver:selector:name:", v79, sel_onMessageReceived_, v45);

                                        v46 = v79->_messagingService;
                                        +[RTNotification notificationName](SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification, "notificationName");
                                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[RTNotifier addObserver:selector:name:](v46, "addObserver:selector:name:", v79, sel_onNearbyEffectivePairedDeviceChangedNotification_, v47);

                                        v48 = v79->_messagingService;
                                        +[RTNotification notificationName](SMMessageDeletedNotification, "notificationName");
                                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[RTNotifier addObserver:selector:name:](v48, "addObserver:selector:name:", v79, sel_onDeletedMessage_, v49);

                                        v50 = v79->_messagingService;
                                        +[RTNotification notificationName](SMConversationDeletedNotification, "notificationName");
                                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[RTNotifier addObserver:selector:name:](v50, "addObserver:selector:name:", v79, sel_onDeletedConversation_, v51);

                                        v52 = [SMSessionMetricManager alloc];
                                        -[SMInitiatorService defaultsManager](v79, "defaultsManager");
                                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[SMInitiatorService learnedLocationManager](v79, "learnedLocationManager");
                                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[SMInitiatorService sessionStore](v79, "sessionStore");
                                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[SMInitiatorService locationManager](v79, "locationManager");
                                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[SMMessagingService deviceIdentifier](v79->_messagingService, "deviceIdentifier");
                                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                                        v58 = -[SMSessionMetricManager initWithDefaultsManager:learnedLocationManager:sessionStore:locationManager:currentDeviceIdentifier:](v52, "initWithDefaultsManager:learnedLocationManager:sessionStore:locationManager:currentDeviceIdentifier:", v53, v54, v55, v56, v57);
                                        sessionMetricManager = v79->_sessionMetricManager;
                                        v79->_sessionMetricManager = (SMSessionMetricManager *)v58;

                                        -[RTService setup](v79, "setup");
                                      }
                                      v60 = v79;
                                      v61 = v60;
                                      v62 = v104;
                                      v64 = v83;
                                      v63 = v84;
                                      v66 = v81;
                                      v65 = v82;
                                      v67 = v80;
                                      goto LABEL_67;
                                    }
                                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                    v75 = objc_claimAutoreleasedReturnValue();
                                    v62 = v104;
                                    v64 = v83;
                                    v63 = v84;
                                    v66 = v81;
                                    v65 = v82;
                                    v67 = v80;
                                    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_error_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: biomeManager", buf, 2u);
                                    }

                                    v61 = 0;
LABEL_66:
                                    v60 = self;
LABEL_67:
                                    v70 = v102;
                                    v68 = v103;
                                    goto LABEL_68;
                                  }
                                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                  v72 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)buf = 0;
                                    v73 = "Invalid parameter not satisfying: noMovementMonitor";
                                    goto LABEL_64;
                                  }
LABEL_65:

                                  v61 = 0;
                                  v62 = v104;
                                  v64 = v83;
                                  v63 = v84;
                                  v66 = v81;
                                  v65 = v82;
                                  v67 = v80;
                                  goto LABEL_66;
                                }
                                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                v72 = objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                                  goto LABEL_65;
                                *(_WORD *)buf = 0;
                                v73 = "Invalid parameter not satisfying: deviceConfigurationChecker";
                              }
                              else
                              {
                                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                v72 = objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                                  goto LABEL_65;
                                *(_WORD *)buf = 0;
                                v73 = "Invalid parameter not satisfying: healthKitManager";
                              }
                            }
                            else
                            {
                              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                              v72 = objc_claimAutoreleasedReturnValue();
                              if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                                goto LABEL_65;
                              *(_WORD *)buf = 0;
                              v73 = "Invalid parameter not satisfying: learnedLocationManager";
                            }
                          }
                          else
                          {
                            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                            v72 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                              goto LABEL_65;
                            *(_WORD *)buf = 0;
                            v73 = "Invalid parameter not satisfying: suggestionsHelper";
                          }
                        }
                        else
                        {
                          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                          v72 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                            goto LABEL_65;
                          *(_WORD *)buf = 0;
                          v73 = "Invalid parameter not satisfying: suggestionsManager";
                        }
                      }
                      else
                      {
                        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                        v72 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                          goto LABEL_65;
                        *(_WORD *)buf = 0;
                        v73 = "Invalid parameter not satisfying: starkManager";
                      }
                    }
                    else
                    {
                      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                      v72 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                        goto LABEL_65;
                      *(_WORD *)buf = 0;
                      v73 = "Invalid parameter not satisfying: authorizationManager";
                    }
                  }
                  else
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v72 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                      goto LABEL_65;
                    *(_WORD *)buf = 0;
                    v73 = "Invalid parameter not satisfying: networkOfInterestManager";
                  }
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v72 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                    goto LABEL_65;
                  *(_WORD *)buf = 0;
                  v73 = "Invalid parameter not satisfying: sessionStore";
                }
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v72 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  goto LABEL_65;
                *(_WORD *)buf = 0;
                v73 = "Invalid parameter not satisfying: safetyCacheStore";
              }
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v72 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                goto LABEL_65;
              *(_WORD *)buf = 0;
              v73 = "Invalid parameter not satisfying: messagingService";
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v72 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              goto LABEL_65;
            *(_WORD *)buf = 0;
            v73 = "Invalid parameter not satisfying: platform";
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v72 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            goto LABEL_65;
          *(_WORD *)buf = 0;
          v73 = "Invalid parameter not satisfying: motionActivityManager";
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v72 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          goto LABEL_65;
        *(_WORD *)buf = 0;
        v73 = "Invalid parameter not satisfying: locationManager";
      }
LABEL_64:
      _os_log_error_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_ERROR, v73, buf, 2u);
      goto LABEL_65;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v71 = objc_claimAutoreleasedReturnValue();
    v70 = v102;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactsManager", buf, 2u);
    }

    v61 = 0;
    v68 = 0;
    v62 = v104;
  }
  else
  {
    v68 = v103;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v61 = 0;
    v62 = 0;
    v70 = v102;
  }
  v64 = v83;
  v63 = v84;
  v66 = v81;
  v65 = v82;
  v60 = self;
  v67 = v80;
LABEL_68:

  return v61;
}

- (SMInitiatorService)initWithDefaultsManager:(id)a3 contactsManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 messagingService:(id)a8 safetyCacheStore:(id)a9 sessionStore:(id)a10 dataProtectionManager:(id)a11 batteryManager:(id)a12 xpcActivityManager:(id)a13 networkOfInterestManager:(id)a14 authorizationManager:(id)a15 wristStateManager:(id)a16 vehicleLocationProvider:(id)a17 starkManager:(id)a18 suggestionsManager:(id)a19 suggestionsHelper:(id)a20 learnedLocationManager:(id)a21 healthKitManager:(id)a22 deviceConfigurationChecker:(id)a23 noMovementMonitor:(id)a24 biomeManager:(id)a25
{
  return -[SMInitiatorService initWithDefaultsManager:contactsManager:locationManager:motionActivityManager:platform:sessionManager:sessionMonitor:messagingService:safetyCacheStore:sessionStore:dataProtectionManager:batteryManager:xpcActivityManager:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:starkManager:suggestionsManager:suggestionsHelper:learnedLocationManager:healthKitManager:deviceConfigurationChecker:noMovementMonitor:biomeManager:](self, "initWithDefaultsManager:contactsManager:locationManager:motionActivityManager:platform:sessionManager:sessionMonitor:messagingService:safetyCacheStore:sessionStore:dataProtectionManager:batteryManager:xpcActivityManager:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:starkManager:suggestionsManager:suggestionsHelper:learnedLocationManager:healthKitManager:deviceConfigurationChecker:noMovementMonitor:biomeManager:", a3, a4, a5, a6, a7, 0, 0, a8, a9, a10, a11, a12, a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

- (void)_initializeSessionReceiptZone
{
  SMSessionReceiptZone *v4;
  void *v5;
  SMSessionReceiptZone *v6;
  SMSessionReceiptZone *sessionReceiptZone;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v4 = [SMSessionReceiptZone alloc];
  -[RTNotifier queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SMSessionReceiptZone initWithQueue:](v4, "initWithQueue:", v5);
  sessionReceiptZone = self->_sessionReceiptZone;
  self->_sessionReceiptZone = v6;

  -[SMInitiatorService _startInfrequentPeriodicFetchAllZonesActivity](self, "_startInfrequentPeriodicFetchAllZonesActivity");
  -[SMInitiatorService defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsInitiatorServiceRecentCloudKitBootstrapSuccess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    -[SMInitiatorService _stopFrequentSingleShotFetchAllZonesActivity](self, "_stopFrequentSingleShotFetchAllZonesActivity");
  }
  else
  {
    -[SMInitiatorService _startFrequentSingleShotFetchAllZonesActivity](self, "_startFrequentSingleShotFetchAllZonesActivity");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SMInitiatorService__initializeSessionReceiptZone__block_invoke;
    v10[3] = &unk_1E929E208;
    v10[4] = self;
    v10[5] = a2;
    -[SMInitiatorService _fetchAllZonesFromContainerSynchronizerWithHandler:](self, "_fetchAllZonesFromContainerSynchronizerWithHandler:", v10);
  }

}

void __51__SMInitiatorService__initializeSessionReceiptZone__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    v16 = 1024;
    v17 = a3;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,_fetchAllZonesFromContainerSynchronizerWithHandler returned error:%@, inProgress:%d", (uint8_t *)&v10, 0x26u);

  }
}

- (void)_setup
{
  char v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  SMSessionStore *sessionStore;
  void *v11;
  SMSafetyCacheStore *safetyCacheStore;
  void *v13;
  RTHealthKitManager *healthKitManager;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_class *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_feature_enabled_impl();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@", (uint8_t *)&v20, 0x16u);

    }
    sessionStore = self->_sessionStore;
    +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](sessionStore, "addObserver:selector:name:", self, sel_onSessionStoreNotification_, v11);

    safetyCacheStore = self->_safetyCacheStore;
    +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](safetyCacheStore, "addObserver:selector:name:", self, sel_onSafetyCacheStoreNotification_, v13);

    if (objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaWorkoutEnabled"))
    {
      healthKitManager = self->_healthKitManager;
      +[RTNotification notificationName](RTHealthKitManagerWorkoutSnapshotUpdateNotification, "notificationName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](healthKitManager, "addObserver:selector:name:", self, sel_onHealthKitManagerNotification_, v15);

    }
    objc_msgSend(MEMORY[0x1E0D8B9B0], "migrateIfNeeded");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_SiriSettingsLockScreenPrefsDidChange, (CFStringRef)*MEMORY[0x1E0D8BCB0], 0, (CFNotificationSuspensionBehavior)0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", (uint8_t *)&v20, 0x16u);

    }
  }
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D8BCB0], 0);
  v4.receiver = self;
  v4.super_class = (Class)SMInitiatorService;
  -[SMInitiatorService dealloc](&v4, sel_dealloc);
}

- (void)_setupOncePersistenceStackAvailable
{
  NSObject *v3;
  SMSessionManager *sessionManager;
  SMSessionMonitor *sessionMonitor;
  uint64_t v6;
  NSObject *v7;
  SMSessionManager *v8;
  SMSessionMonitor *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  SMSessionManager *v14;
  __int16 v15;
  SMSessionMonitor *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      sessionManager = self->_sessionManager;
      sessionMonitor = self->_sessionMonitor;
      v6 = -[NSMutableArray count](self->_cacheManagerArray, "count");
      *(_DWORD *)buf = 136315906;
      v12 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]";
      v13 = 2112;
      v14 = sessionManager;
      v15 = 2112;
      v16 = sessionMonitor;
      v17 = 2048;
      v18 = v6;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, has already run. sessionManager, %@, sessionMonitor, %@, cacheManagerArray Count, %lu", buf, 0x2Au);
    }
LABEL_11:

    return;
  }
  if (-[SMInitiatorService sessionStoreAvailability](self, "sessionStoreAvailability") != 2
    || -[SMInitiatorService safetyCacheStoreAvailability](self, "safetyCacheStoreAvailability") != 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      +[RTStore availabilityToString:](RTStore, "availabilityToString:", -[SMInitiatorService sessionStoreAvailability](self, "sessionStoreAvailability"));
      v8 = (SMSessionManager *)objc_claimAutoreleasedReturnValue();
      +[RTStore availabilityToString:](RTStore, "availabilityToString:", -[SMInitiatorService safetyCacheStoreAvailability](self, "safetyCacheStoreAvailability"));
      v9 = (SMSessionMonitor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v12 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]";
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "%s, Deferring - Both stores are not available. Session Store, %@, Safety Cache Store, %@", buf, 0x20u);

    }
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]";
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "%s, Setting up session monitor, cache managers, and session manager", buf, 0xCu);
  }

  -[SMInitiatorService _setupSessionMonitor](self, "_setupSessionMonitor");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke;
  v10[3] = &unk_1E9297150;
  v10[4] = self;
  -[SMInitiatorService _setupCacheManagersWithHandler:](self, "_setupCacheManagersWithHandler:", v10);
}

void __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SMWatchdog *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  SMWatchdog *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = [SMWatchdog alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 88);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke_2;
  v12 = &unk_1E929E270;
  v13 = v3;
  v14 = v5;
  v7 = v3;
  v8 = -[SMWatchdog initWithDefaultsManager:handler:](v4, "initWithDefaultsManager:handler:", v6, &v9);
  objc_msgSend(*(id *)(a1 + 32), "setWatchdog:", v8, v9, v10, v11, v12);

  objc_msgSend(*(id *)(a1 + 32), "_setupSessionManager");
}

void __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315650;
    v17 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke_2";
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%s, Watch dog fired with state, %@, error, %@", (uint8_t *)&v16, 0x20u);

  }
  if (!*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(v5, "sessionState") == 10 || objc_msgSend(v5, "sessionState") == 11)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v5, "configuration");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject sessionID](v9, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancelInitializationForSessionID:handler:", v10, &__block_literal_global_58);
    }
    else
    {
      if (objc_msgSend(v5, "sessionState") == 12)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315138;
          v17 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke";
          _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "%s, Watch dog fired, transitioning to not active", (uint8_t *)&v16, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "sessionManager");
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sessionID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject terminateSessionWithSessionID:](v9, "terminateSessionWithSessionID:", v13);

        goto LABEL_8;
      }
      if (objc_msgSend(v5, "isPromptState"))
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          v16 = 136315394;
          v17 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke";
          v18 = 2112;
          v19 = v5;
          _os_log_fault_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_FAULT, "%s, Watch dog fired, logging fault for prompt state, %@", (uint8_t *)&v16, 0x16u);
        }
        goto LABEL_8;
      }
      v15 = *(void **)(a1 + 40);
      objc_msgSend(v5, "configuration");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject sessionID](v9, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endSessionForSessionID:reason:handler:", v10, 6, &__block_literal_global_117);
    }

LABEL_8:
  }

}

void __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke_114(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "%s, Watch dog fired, cancelled initialization, error %@", (uint8_t *)&v4, 0x16u);
  }

}

void __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke_116(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "%s, Watch dog fired, cancelled session, error %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)_setupSessionMonitor
{
  SMSessionMonitor *v3;
  SMSessionMonitor *sessionMonitor;

  v3 = -[SMSessionMonitor initWithDefaultsManager:dataProtectionManager:healthKitManager:locationManager:motionActivityManager:platform:sessionMetricManager:sessionStore:wristStateManager:noMovementMonitor:]([SMSessionMonitor alloc], "initWithDefaultsManager:dataProtectionManager:healthKitManager:locationManager:motionActivityManager:platform:sessionMetricManager:sessionStore:wristStateManager:noMovementMonitor:", self->_defaultsManager, self->_dataProtectionManager, self->_healthKitManager, self->_locationManager, self->_motionActivityManager, self->_platform, self->_sessionMetricManager, self->_sessionStore, self->_wristStateManager, self->_noMovementMonitor);
  sessionMonitor = self->_sessionMonitor;
  self->_sessionMonitor = v3;

}

- (void)_setupSessionManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SMCarPlayAlertManager *v11;
  void *v12;
  SMCarPlayAlertManager *v13;
  SMSessionManager *v14;
  SMSessionManager *sessionManager;
  id v16;

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v16, "addObject:", self);
  -[SMInitiatorService sessionMonitor](self, "sessionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMInitiatorService sessionMonitor](self, "sessionMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v4);

  }
  -[SMInitiatorService watchdog](self, "watchdog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SMInitiatorService watchdog](self, "watchdog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v6);

  }
  -[SMInitiatorService suggestionsManager](self, "suggestionsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMInitiatorService suggestionsManager](self, "suggestionsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v8);

  }
  -[SMInitiatorService sessionMetricManager](self, "sessionMetricManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SMInitiatorService sessionMetricManager](self, "sessionMetricManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v10);

  }
  v11 = [SMCarPlayAlertManager alloc];
  -[RTNotifier queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SMCarPlayAlertManager initWithQueue:defaultsManager:contactsManager:starkManager:](v11, "initWithQueue:defaultsManager:contactsManager:starkManager:", v12, self->_defaultsManager, self->_contactsManager, self->_starkManager);

  v14 = -[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManager:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSessionDetailsDelegate:wristStateManager:]([SMSessionManager alloc], "initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManager:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSessionDetailsDelegate:wristStateManager:", self->_authorizationManager, self->_biomeManager, self->_contactsManager, self->_defaultsManager, self->_locationManager, self->_platform, self->_sessionMetricManager, self->_sessionStore, self->_messagingService, v13, v16, self->_activeSessionDetailsZone, self->_wristStateManager);
  sessionManager = self->_sessionManager;
  self->_sessionManager = v14;

  -[SMSessionMonitor setSessionManagerDelegate:](self->_sessionMonitor, "setSessionManagerDelegate:", self->_sessionManager);
}

- (void)_setupCacheManagersWithHandler:(id)a3
{
  id v5;
  SMActiveSessionZone *v6;
  void *v7;
  void *v8;
  SMActiveSessionZone *v9;
  SMActiveSessionZone *activeSessionDetailsZone;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  SMSafetyCacheStore *safetyCacheStore;
  id v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SMInitiatorService _initializeSessionReceiptZone](self, "_initializeSessionReceiptZone");
  v6 = [SMActiveSessionZone alloc];
  -[RTNotifier queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SMActiveSessionZone initWithQueue:defaultsManager:](v6, "initWithQueue:defaultsManager:", v7, v8);
  activeSessionDetailsZone = self->_activeSessionDetailsZone;
  self->_activeSessionDetailsZone = v9;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMActiveSessionZone getLatestActiveSessionDetails](self->_activeSessionDetailsZone, "getLatestActiveSessionDetails");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, _activeSessionDetailsZone.latestActiveSessionDetails %@", buf, 0x20u);

  }
  safetyCacheStore = self->_safetyCacheStore;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__SMInitiatorService__setupCacheManagersWithHandler___block_invoke;
  v18[3] = &unk_1E9297E70;
  v19 = v5;
  v20 = a2;
  v18[4] = self;
  v17 = v5;
  -[SMSafetyCacheStore fetchInitiatorContactsWithHandler:](safetyCacheStore, "fetchInitiatorContactsWithHandler:", v18);

}

void __53__SMInitiatorService__setupCacheManagersWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SMInitiatorService__setupCacheManagersWithHandler___block_invoke_2;
  block[3] = &unk_1E9298750;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v6;
  v15 = v8;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v17 = v12;
  v16 = v5;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

uint64_t __53__SMInitiatorService__setupCacheManagersWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t (*v4)(void);
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SMInitiatorCacheManager *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  SMInitiatorCacheManager *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v49 = v28;
      v50 = 2112;
      v51 = v29;
      v52 = 2112;
      v53 = v30;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to fetch receiver contacts with error %@", buf, 0x20u);

    }
    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = *(id *)(a1 + 48);
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v44;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(obj);
          v42 = v5;
          v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v5);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "sessionUUID");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (objc_class *)objc_opt_class();
            NSStringFromClass(v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 64));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v49 = v8;
            v50 = 2112;
            v51 = v10;
            v52 = 2112;
            v53 = v11;
            _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,loaded initiator contact from disk", buf, 0x20u);

          }
          v41 = [SMInitiatorCacheManager alloc];
          v12 = *(_QWORD **)(a1 + 40);
          v39 = v12[20];
          v40 = v12[18];
          v37 = v12[5];
          v38 = v12[11];
          objc_msgSend(v12, "queue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD **)(a1 + 40);
          v34 = v13[24];
          v35 = v13[23];
          v14 = v13[15];
          v15 = v13[16];
          v16 = v13[25];
          v17 = v13[30];
          v18 = v13[31];
          v19 = v13[38];
          objc_msgSend(v13, "healthKitManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "platform");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[SMInitiatorCacheManager initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:](v41, "initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:", v6, 1, v40, v39, v38, v37, v36, v35, v34, v14, v15, v16, v17, v18, v19,
                  v20,
                  v21);

          -[SMInitiatorCacheManager setDelegate:](v22, "setDelegate:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 40), "cacheManagerArray");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v22);

          v5 = v42 + 1;
        }
        while (v33 != v42 + 1);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v33);
    }

    objc_msgSend(*(id *)(a1 + 40), "setSessionsLoadedFromDisk:", 1);
    objc_msgSend(*(id *)(a1 + 40), "deleteAllStoredDefaults");
    objc_msgSend(*(id *)(a1 + 40), "activeSessionDetailsZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isActiveSessionDetailsOutOfSync");

    if (v25)
    {
      objc_msgSend(*(id *)(a1 + 40), "activeSessionDetailsZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "updateActiveSessionDetailsFromCloudKitRecord");

    }
    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (BOOL)_hasSetupObjectsDependentOnPersistenceStack
{
  return self->_sessionManager && self->_sessionMonitor && self->_sessionManagerBootstrapped;
}

- (id)invocationError
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation - store did not become available"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D8BB70];
  v14 = *MEMORY[0x1E0CB2D50];
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)deleteAllStoredDefaults
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorService defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D8BC20];
  v6 = (void *)objc_msgSend(v4, "copyKeyListContainingString:", *MEMORY[0x1E0D8BC20]);

  if (v6 && objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[SMInitiatorService checkAndDeleteKey:forIdentifier:](self, "checkAndDeleteKey:forIdentifier:", v12, CFSTR("com.apple.routined.cacheMaintenance.periodic"), (_QWORD)v16);
          -[SMInitiatorService checkAndDeleteKey:forIdentifier:](self, "checkAndDeleteKey:forIdentifier:", v12, CFSTR("com.apple.routined.scheduleSend.cancelRetry"));
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,nil stored defaults for %@, early return", buf, 0x20u);

    }
  }

}

- (void)checkAndDeleteKey:(id)a3 forIdentifier:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *aSelector;
  SMInitiatorService *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "containsString:", v8))
  {
    v9 = objc_msgSend(v7, "rangeOfString:", v8);
    v11 = v10;
    if (objc_msgSend(v7, "length") <= (unint64_t)(v9 + v10))
    {
      -[SMInitiatorService defaultsManager](self, "defaultsManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", 0, v7);

    }
    else
    {
      aSelector = a2;
      v29 = v8;
      objc_msgSend(v7, "substringFromIndex:", v9 + v11 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v28 = self;
      -[SMInitiatorService cacheManagerArray](self, "cacheManagerArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
LABEL_5:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v17), "initiatorContact");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "sessionUUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v12);

          if ((v21 & 1) != 0)
            break;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
            if (v15)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v35 = v24;
          v36 = 2112;
          v37 = v25;
          v38 = 2112;
          v39 = v7;
          _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,deleted default for %@", buf, 0x20u);

        }
        -[SMInitiatorService defaultsManager](v28, "defaultsManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", 0, v7);
      }
      v8 = v29;

    }
  }

}

- (void)addObserverForSessionManager:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SMInitiatorService_addObserverForSessionManager___block_invoke;
    block[3] = &unk_1E9297BC8;
    block[4] = self;
    v9 = v5;
    v10 = a2;
    dispatch_async(v6, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }

  }
}

void __51__SMInitiatorService_addObserverForSessionManager___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_hasSetupObjectsDependentOnPersistenceStack");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "sessionManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(v3, "dispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SMInitiatorService_addObserverForSessionManager___block_invoke_2;
    v10[3] = &unk_1E9297540;
    v5 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueBlock:description:", v10, CFSTR("%@-%@"), v7, v8);

  }
}

void __51__SMInitiatorService_addObserverForSessionManager___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:", *(_QWORD *)(a1 + 40));

}

- (void)removeObserverForSessionManager:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SMInitiatorService_removeObserverForSessionManager___block_invoke;
    block[3] = &unk_1E9297BC8;
    block[4] = self;
    v9 = v5;
    v10 = a2;
    dispatch_async(v6, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }

  }
}

void __54__SMInitiatorService_removeObserverForSessionManager___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_hasSetupObjectsDependentOnPersistenceStack");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "sessionManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(v3, "dispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__SMInitiatorService_removeObserverForSessionManager___block_invoke_2;
    v10[3] = &unk_1E9297540;
    v5 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueBlock:description:", v10, CFSTR("%@-%@"), v7, v8);

  }
}

void __54__SMInitiatorService_removeObserverForSessionManager___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 40));

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__SMInitiatorService_addObserver___block_invoke;
    v7[3] = &unk_1E9297540;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }

  }
}

void __34__SMInitiatorService_addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SMInitiatorService_removeObserver___block_invoke;
    v7[3] = &unk_1E9297540;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }

  }
}

void __37__SMInitiatorService_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)notifyObserversSafetyCacheDidUpdateForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v35 = v19;
    v36 = 2112;
    v37 = v20;
    v38 = 2112;
    v39 = v21;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,sessionID:%@,%@,sending safety cache update to observers", buf, 0x20u);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[SMInitiatorService observers](self, "observers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v26);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v27, "onInitiatorSafetyCacheChangeForSessionID:phoneCache:watchCache:cacheExpiryDate:cacheReleaseDate:", v28, v13, v14, v15, v16);
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
  }

}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__SMInitiatorService_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __66__SMInitiatorService_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 56))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_purgePredating:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)_purgePredating:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  NSObject *v33;
  SEL v34;
  _QWORD v35[5];
  id v36;
  id v37;
  NSObject *v38;
  SEL v39;
  _QWORD v40[5];
  id v41;
  id v42;
  NSObject *v43;
  SEL v44;

  v7 = a3;
  v8 = a4;
  v9 = dispatch_group_create();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  dispatch_group_enter(v9);
  -[SMInitiatorService sessionStore](self, "sessionStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke;
  v40[3] = &unk_1E929E298;
  v40[4] = self;
  v44 = a2;
  v13 = v7;
  v41 = v13;
  v14 = v10;
  v42 = v14;
  v15 = v9;
  v43 = v15;
  objc_msgSend(v11, "deleteSessionsPredating:handler:", v13, v40);

  dispatch_group_enter(v15);
  -[SMInitiatorService sessionStore](self, "sessionStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v12;
  v35[1] = 3221225472;
  v35[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_134;
  v35[3] = &unk_1E929E298;
  v35[4] = self;
  v39 = a2;
  v17 = v13;
  v36 = v17;
  v18 = v14;
  v37 = v18;
  v19 = v15;
  v38 = v19;
  objc_msgSend(v16, "deleteSessionMonitorStatesPredating:handler:", v17, v35);

  dispatch_group_enter(v19);
  -[SMInitiatorService sessionStore](self, "sessionStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_136;
  v30[3] = &unk_1E929E298;
  v34 = a2;
  v30[4] = self;
  v31 = v17;
  v21 = v18;
  v32 = v21;
  v33 = v19;
  v22 = v19;
  v23 = v17;
  objc_msgSend(v20, "deleteTriggerDestinationStatesPredating:handler:", v23, v30);

  -[RTNotifier queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_138;
  block[3] = &unk_1E9297650;
  v28 = v21;
  v29 = v8;
  v25 = v8;
  v26 = v21;
  dispatch_group_notify(v22, v24, block);

}

void __49__SMInitiatorService__purgePredating_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_2;
  block[3] = &unk_1E92978E8;
  v11 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(v4, block);

}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, deleted sessions, predating, %@, error, %@", (uint8_t *)&v6, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_2_135;
  block[3] = &unk_1E92978E8;
  v11 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(v4, block);

}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_2_135(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, deleted session monitor states, predating, %@, error, %@", (uint8_t *)&v6, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_136(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_2_137;
  block[3] = &unk_1E92978E8;
  v11 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(v4, block);

}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_2_137(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, deleted triggerDestinations, predating, %@, error, %@", (uint8_t *)&v6, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_138(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    _RTSafeArray();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v5 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)v5;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v4 = (void *)v5;
  }

}

- (id)getCacheManagerForSessionID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_cacheManagerArray;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "sessionUUID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqual:", v10);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)getCacheManagersForConversation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_cacheManagerArray, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_cacheManagerArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "initiatorContact");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "conversation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[SMMessagingUtilities handlesInConversation1:canonicallyEqualsHandlesInConversation2:](SMMessagingUtilities, "handlesInConversation1:canonicallyEqualsHandlesInConversation2:", v12, v4);

        if (v13)
          objc_msgSend(v16, "addObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v16, "copy");
  return v14;
}

- (id)_createInitiatorCacheManagerForSessionID:(id)a3 conversation:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SMInitiatorCacheManager *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SMInitiatorCacheManager *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SMInitiatorCacheManager *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v40 = v7;
    v41 = 2112;
    v42 = v11;
    v43 = 2112;
    v44 = v12;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@", buf, 0x20u);

  }
  -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v7);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (SMInitiatorCacheManager *)v13;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v17;
      v41 = 2112;
      v42 = v18;
      _os_log_fault_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,cache manager already exists", buf, 0x16u);

    }
  }
  else
  {
    v32 = [SMInitiatorCacheManager alloc];
    -[SMInitiatorService safetyCacheStore](self, "safetyCacheStore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService sessionStore](self, "sessionStore");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService defaultsManager](self, "defaultsManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService locationManager](self, "locationManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService batteryManager](self, "batteryManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService xpcActivityManager](self, "xpcActivityManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService messagingService](self, "messagingService");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService networkOfInterestManager](self, "networkOfInterestManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService authorizationManager](self, "authorizationManager");
    v37 = v8;
    v38 = v7;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService wristStateManager](self, "wristStateManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService vehicleLocationProvider](self, "vehicleLocationProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService activeSessionDetailsZone](self, "activeSessionDetailsZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService healthKitManager](self, "healthKitManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService platform](self, "platform");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SMInitiatorCacheManager initWithSafetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:sessionID:wristStateManager:vehicleLocationProvider:conversation:activeSessionDetailsZone:healthKitManager:platform:](v32, "initWithSafetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:sessionID:wristStateManager:vehicleLocationProvider:conversation:activeSessionDetailsZone:healthKitManager:platform:", v35, v36, v34, v33, v31, v30, v29, v28, v27, v26, v38, v25, v19, v37, v20,
            v21,
            v22);

    v8 = v37;
    v7 = v38;

    -[SMInitiatorCacheManager setDelegate:](v14, "setDelegate:", self);
    -[SMInitiatorService cacheManagerArray](self, "cacheManagerArray");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v15, "addObject:", v14);
  }

  v23 = v14;
  return v23;
}

- (void)_startInitializationProcess
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMInitiatorService _startInitializationProcess]";
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "%s, starting initialization sequence for request, %@", buf, 0x16u);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__SMInitiatorService__startInitializationProcess__block_invoke;
    v18[3] = &unk_1E929E3D0;
    v18[4] = self;
    v19 = v6;
    v8 = v6;
    objc_msgSend(v5, "initializeSessionWithCompletion:", v18);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMInitiatorService _startInitializationProcess]";
      v24 = 2112;
      v25 = v17;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%s, failed to find InitiatorCacheManager for sessionID %@", buf, 0x16u);

    }
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0D8BB70];
    v20 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find InitiatorCacheManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 0, v13);

    -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handler");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, id))v15)[2](v15, 0, 0, 0, v8);

    -[SMInitiatorService setPendingInitializationRequest:](self, "setPendingInitializationRequest:", 0);
  }

}

void __49__SMInitiatorService__startInitializationProcess__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void (**v45)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void (**v54)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v55;
  void *v56;
  id v58;
  id v59;
  _QWORD v60[5];
  id v61;
  id v62;
  id v63;
  int64x2_t v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v58 = a4;
  v59 = a5;
  v16 = a8;
  objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_13;
  v18 = (void *)v17;
  objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
  v19 = v14;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sessionID");
  v21 = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqual:", v23);

  v15 = v21;
  v14 = v19;

  if ((v24 & 1) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      initiatorEligiblityStatusToString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8B938], "convertEligibilityTypeToString:", a7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136317186;
      v66 = "-[SMInitiatorService _startInitializationProcess]_block_invoke";
      v67 = 2112;
      v68 = v26;
      v69 = 2112;
      v70 = v19;
      v71 = 2112;
      v72 = v21;
      v73 = 2112;
      v74 = v58;
      v75 = 2112;
      v76 = v27;
      v77 = 2112;
      v78 = v28;
      v79 = 2112;
      v80 = v29;
      v81 = 2112;
      v82 = v16;
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEFAULT, "%s, Session cacheManager initialization result for request, %@, allowReadToken, %@, safetyCacheKey, %@, scheduledSendGUID, %@, invitationTokens, %@, initiatorEligibility, %@, receiverEligibility, %@, error, %@", buf, 0x5Cu);

      v15 = v21;
    }

    if (a6 == 1 && a7 == 1)
    {
      v30 = *(void **)(a1 + 32);
      v14 = v19;
      if (!v59 || v16)
      {
        objc_msgSend(v30, "pendingInitializationRequest");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "sessionID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = (void *)MEMORY[0x1E0D8BAA0];
        objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "conversation");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "identifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "fileRadarWithError:conversationIdentifier:completionHandler:", v16, v52, &__block_literal_global_151);

        objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "handler");
        v54 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, uint64_t, uint64_t, id))v54)[2](v54, 0, 1, 1, v16);

        objc_msgSend(*(id *)(a1 + 32), "setPendingInitializationRequest:", 0);
        objc_msgSend(*(id *)(a1 + 32), "sessionManager");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "cancelInitializationForSessionID:handler:", v48, &__block_literal_global_152);

      }
      else
      {
        objc_msgSend(v30, "sessionManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sessionID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __49__SMInitiatorService__startInitializationProcess__block_invoke_5;
        v60[3] = &unk_1E929E3A8;
        v34 = *(void **)(a1 + 40);
        v60[4] = *(_QWORD *)(a1 + 32);
        v61 = v34;
        v62 = 0;
        v64 = vdupq_n_s64(1uLL);
        v63 = v59;
        objc_msgSend(v31, "sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:completionHandler:", v33, v19, v15, v58, v60);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sessionID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "convertEligibilityToSMErrorWithInitiator:receiver:", a6, a7);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (drand48() < 0.5)
      {
        v40 = (void *)MEMORY[0x1E0D8BAA0];
        objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "conversation");
        v56 = v38;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "fileRadarWithError:conversationIdentifier:completionHandler:", v39, v43, &__block_literal_global_149);

        v38 = v56;
      }
      objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handler");
      v45 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, uint64_t, uint64_t, void *))v45)[2](v45, 0, a6, a7, v39);

      objc_msgSend(*(id *)(a1 + 32), "setPendingInitializationRequest:", 0);
      objc_msgSend(*(id *)(a1 + 32), "sessionManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "cancelInitializationForSessionID:handler:", v38, &__block_literal_global_150);

      v14 = v19;
      v15 = v21;
    }
  }
  else
  {
LABEL_13:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v66 = "-[SMInitiatorService _startInitializationProcess]_block_invoke";
      v67 = 2112;
      v68 = v36;
      v69 = 2112;
      v70 = v16;
      _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEFAULT, "%s, request was canceled prior to finishing initialization process for request, %@, error, %@", buf, 0x20u);
    }

  }
}

void __49__SMInitiatorService__startInitializationProcess__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__startInitializationProcess__block_invoke_6;
  block[3] = &unk_1E929E380;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v12 = *(_OWORD *)(a1 + 64);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, block);

}

void __49__SMInitiatorService__startInitializationProcess__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_9;
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 56);
      v26 = 136315650;
      v27 = "-[SMInitiatorService _startInitializationProcess]_block_invoke";
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%s, sessionManager transition to ready for request, %@, error, %@", (uint8_t *)&v26, 0x20u);

    }
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v11)
    {
      objc_msgSend(v12, "handler");
      v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v25[2](v25, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 0);

      objc_msgSend(*(id *)(a1 + 32), "setPendingInitializationRequest:", 0);
      return;
    }
    objc_msgSend(v12, "sessionID");
    v14 = objc_claimAutoreleasedReturnValue();

    if (drand48() < 0.5)
    {
      v15 = (void *)MEMORY[0x1E0D8BAA0];
      v16 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileRadarWithError:conversationIdentifier:completionHandler:", v16, v19, &__block_literal_global_154);

    }
    objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handler");
    v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v21[2](v21, 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 32), "setPendingInitializationRequest:", 0);
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cancelInitializationForSessionID:handler:", v14, &__block_literal_global_156);

  }
  else
  {
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(void **)(a1 + 40);
      v24 = *(_QWORD *)(a1 + 48);
      v26 = 136315650;
      v27 = "-[SMInitiatorService _startInitializationProcess]_block_invoke_6";
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "%s, request was canceled prior to finishing transition to ready for request, %@, error, %@", (uint8_t *)&v26, 0x20u);
    }
  }

}

- (void)onSessionStartMessageSendResult:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__SMInitiatorService_onSessionStartMessageSendResult___block_invoke;
    v14[3] = &unk_1E9297540;
    v14[4] = self;
    v15 = v5;
    dispatch_async(v6, v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,unrecognized notification,%@", buf, 0x20u);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2080;
      v19 = "-[SMInitiatorService onSessionStartMessageSendResult:]";
      v20 = 1024;
      LODWORD(v21) = 1017;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __54__SMInitiatorService_onSessionStartMessageSendResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStartMessageSendResult:", *(_QWORD *)(a1 + 40));
}

- (void)_onSessionStartMessageSendResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v5 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "success");
    objc_msgSend(v5, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "onSessionStartMessageSendResultWithMessage:messageGUID:success:error:", v7, v8, v9, v10);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__SMInitiatorService__onSessionStartMessageSendResult___block_invoke;
    v15[3] = &unk_1E9297540;
    v15[4] = self;
    v16 = v5;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enqueueBlock:description:", v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __55__SMInitiatorService__onSessionStartMessageSendResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStartMessageSendResult:", *(_QWORD *)(a1 + 40));
}

- (void)onDeletedMessage:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  char *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__SMInitiatorService_onDeletedMessage___block_invoke;
    v10[3] = &unk_1E9297540;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[SMInitiatorService onDeletedMessage:]";
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "SMInitiatorService,%s,unrecognized notification,%@", buf, 0x16u);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2080;
      v15 = "-[SMInitiatorService onDeletedMessage:]";
      v16 = 1024;
      v17 = 1046;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __39__SMInitiatorService_onDeletedMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDeletedMessage:", *(_QWORD *)(a1 + 40));
}

- (void)_onDeletedMessage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    if (v5 && (objc_msgSend(v5, "message"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      -[SMInitiatorService sessionManager](self, "sessionManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "message");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "onDeletedMessage:handler:", v8, &__block_literal_global_159);

      objc_msgSend(v5, "message");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v5, "message");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject onDeletedMessage:](v11, "onDeletedMessage:", v12);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[SMInitiatorService _onDeletedMessage:]";
      v21 = 2112;
      v22 = v12;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "SMInitiatorService,%s,invalid notification,%@", buf, 0x16u);
    }

    goto LABEL_9;
  }
  -[SMInitiatorService dispatcher](self, "dispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__SMInitiatorService__onDeletedMessage___block_invoke;
  v17[3] = &unk_1E9297540;
  v17[4] = self;
  v18 = v5;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enqueueBlock:description:", v17, CFSTR("%@-%@"), v15, v16);

LABEL_10:
}

uint64_t __40__SMInitiatorService__onDeletedMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDeletedMessage:", *(_QWORD *)(a1 + 40));
}

void __40__SMInitiatorService__onDeletedMessage___block_invoke_158(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "-[SMInitiatorService _onDeletedMessage:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "SMInitiatorService,%s,sessionManager,error,%@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)onDeletedConversation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  char *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__SMInitiatorService_onDeletedConversation___block_invoke;
    v10[3] = &unk_1E9297540;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[SMInitiatorService onDeletedConversation:]";
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "SMInitiatorService,%s,unrecognized notification,%@", buf, 0x16u);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2080;
      v15 = "-[SMInitiatorService onDeletedConversation:]";
      v16 = 1024;
      v17 = 1086;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __44__SMInitiatorService_onDeletedConversation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDeletedConversation:", *(_QWORD *)(a1 + 40));
}

- (void)_onDeletedConversation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    if (v5
      && (objc_msgSend(v5, "conversation"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      -[SMInitiatorService sessionManager](self, "sessionManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "onDeletedConversation:handler:", v8, &__block_literal_global_161_0);

      objc_msgSend(v5, "conversation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorService getCacheManagersForConversation:](self, "getCacheManagersForConversation:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
            objc_msgSend(v5, "conversation");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "onDeletedConversation:", v17);

            ++v15;
          }
          while (v13 != v15);
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        }
        while (v13);
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v31 = "-[SMInitiatorService _onDeletedConversation:]";
        v32 = 2112;
        v33 = v22;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "SMInitiatorService,%s,invalid notification,%@", buf, 0x16u);

      }
    }

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __45__SMInitiatorService__onDeletedConversation___block_invoke;
    v27[3] = &unk_1E9297540;
    v27[4] = self;
    v28 = v5;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "enqueueBlock:description:", v27, CFSTR("%@-%@"), v20, v21);

  }
}

uint64_t __45__SMInitiatorService__onDeletedConversation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDeletedConversation:", *(_QWORD *)(a1 + 40));
}

void __45__SMInitiatorService__onDeletedConversation___block_invoke_160(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "-[SMInitiatorService _onDeletedConversation:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "SMInitiatorService,%s,sessionManager,error,%@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)onMessageReceived:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__SMInitiatorService_onMessageReceived___block_invoke;
    v14[3] = &unk_1E9297540;
    v14[4] = self;
    v15 = v5;
    dispatch_async(v6, v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,unrecognized notification,%@", buf, 0x20u);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2080;
      v19 = "-[SMInitiatorService onMessageReceived:]";
      v20 = 1024;
      LODWORD(v21) = 1127;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __40__SMInitiatorService_onMessageReceived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMessageReceived:", *(_QWORD *)(a1 + 40));
}

- (void)_onMessageReceived:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    objc_msgSend(v5, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend((id)objc_opt_class(), "messageType");

    switch(v7)
    {
      case 1:
      case 2:
      case 6:
      case 10:
      case 13:
      case 15:
      case 20:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          goto LABEL_9;
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v10;
        v24 = 2112;
        v25 = v11;
        v26 = 1024;
        v27 = objc_msgSend((id)objc_opt_class(), "messageType");
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,ignore message type,%d", buf, 0x1Cu);
        goto LABEL_5;
      case 3:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "from");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedSessionTypeKeyRelease:fromHandle:fromMe:](self, "receivedSessionTypeKeyRelease:fromHandle:fromMe:", v17, v18, objc_msgSend(v5, "fromMe"));
        goto LABEL_18;
      case 7:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "from");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedSessionSyncMessage:fromHandle:fromMe:](self, "receivedSessionSyncMessage:fromHandle:fromMe:", v17, v18, objc_msgSend(v5, "fromMe"));
        goto LABEL_18;
      case 8:
      case 9:
        break;
      case 11:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedEmergencyContactsNotifiedSyncMessage:](self, "receivedEmergencyContactsNotifiedSyncMessage:", v17);
        goto LABEL_19;
      case 12:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "from");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedSessionStartInfoRequestMessage:fromHandle:fromMe:](self, "receivedSessionStartInfoRequestMessage:fromHandle:fromMe:", v17, v18, objc_msgSend(v5, "fromMe"));
        goto LABEL_18;
      case 14:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "from");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedKeyReleaseInfoRequestMessage:fromHandle:fromMe:](self, "receivedKeyReleaseInfoRequestMessage:fromHandle:fromMe:", v17, v18, objc_msgSend(v5, "fromMe"));
        goto LABEL_18;
      case 16:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "from");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedSessionStateUpdateReqMessage:fromHandle:fromMe:](self, "receivedSessionStateUpdateReqMessage:fromHandle:fromMe:", v17, v18, objc_msgSend(v5, "fromMe"));
        goto LABEL_18;
      case 17:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "from");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedSessionEndRemoteControlMessage:fromHandle:fromMe:](self, "receivedSessionEndRemoteControlMessage:fromHandle:fromMe:", v17, v18, objc_msgSend(v5, "fromMe"));
        goto LABEL_18;
      case 18:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "from");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedSessionConfigurationUpdateRemoteControlMessage:fromHandle:fromMe:](self, "receivedSessionConfigurationUpdateRemoteControlMessage:fromHandle:fromMe:", v17, v18, objc_msgSend(v5, "fromMe"));
        goto LABEL_18;
      case 19:
        objc_msgSend(v5, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "from");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorService receivedResponseToTriggerPromptRemoteControlMessage:fromHandle:fromMe:](self, "receivedResponseToTriggerPromptRemoteControlMessage:fromHandle:fromMe:", v17, v18, objc_msgSend(v5, "fromMe"));
LABEL_18:

LABEL_19:
        break;
      default:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "message");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          v24 = 2112;
          v25 = v11;
          v26 = 1024;
          v27 = objc_msgSend((id)objc_opt_class(), "messageType");
          _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,unrecognized message type,%d", buf, 0x1Cu);
LABEL_5:

        }
LABEL_9:

        break;
    }
  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __41__SMInitiatorService__onMessageReceived___block_invoke;
    v20[3] = &unk_1E9297540;
    v20[4] = self;
    v21 = v5;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enqueueBlock:description:", v20, CFSTR("%@-%@"), v15, v16);

  }
}

uint64_t __41__SMInitiatorService__onMessageReceived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMessageReceived:", *(_QWORD *)(a1 + 40));
}

- (void)receivedResponseToTriggerPromptRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9;
  id v10;
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
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sourceDeviceID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413826;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v10;
      v29 = 1024;
      v30 = 1;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#RemoteControl,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d, sourceDeviceId, %@ ,message,%@", (uint8_t *)&v21, 0x44u);

    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject processResponseToTriggerPromptRemoteControlMessage:](v12, "processResponseToTriggerPromptRemoteControlMessage:", v9);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#RemoteControl,Initiator,%@,%@,message not from my own device", (uint8_t *)&v21, 0x16u);

  }
}

- (void)receivedSessionEndRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9;
  id v10;
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
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sourceDeviceID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413826;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v10;
      v29 = 1024;
      v30 = 1;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#RemoteControl,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d, sourceDeviceId, %@ ,message,%@", (uint8_t *)&v21, 0x44u);

    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject processSessionEndRemoteControlMessage:](v12, "processSessionEndRemoteControlMessage:", v9);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#RemoteControl,Initiator,%@,%@,message not from my own device", (uint8_t *)&v21, 0x16u);

  }
}

- (void)receivedSessionConfigurationUpdateRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9;
  id v10;
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
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sourceDeviceID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413826;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v10;
      v29 = 1024;
      v30 = 1;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#RemoteControl,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d, sourceDeviceId, %@ ,message,%@", (uint8_t *)&v21, 0x44u);

    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject processModifySessionConfigurationRemoteControlMessage:](v12, "processModifySessionConfigurationRemoteControlMessage:", v9);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message not from my own device", (uint8_t *)&v21, 0x16u);

  }
}

- (void)receivedSessionSyncMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
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
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138413570;
      v21 = v13;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v10;
      v28 = 1024;
      v29 = 1;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v20, 0x3Au);

    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject processStateSyncMessage:](v12, "processStateSyncMessage:", v9);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v18;
    v22 = 2112;
    v23 = v19;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message not from my own device", (uint8_t *)&v20, 0x16u);

  }
}

- (void)receivedSessionTypeKeyRelease:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
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
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138413570;
      v21 = v13;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v10;
      v28 = 1024;
      v29 = 1;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v20, 0x3Au);

    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject processSessionTypeKeyRelease:](v12, "processSessionTypeKeyRelease:", v9);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v18;
    v22 = 2112;
    v23 = v19;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message not from my own device", (uint8_t *)&v20, 0x16u);

  }
}

- (void)receivedSessionStateUpdateReqMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v22;
    v27 = 2112;
    v28 = v23;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message not from my own device", (uint8_t *)&v25, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  -[SMInitiatorService messagingService](self, "messagingService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceToRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = v22;
    v27 = 2112;
    v28 = v23;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,received state sync req message for unmatched device identifier,%@", (uint8_t *)&v25, 0x20u);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413570;
    v26 = v17;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v10;
    v33 = 1024;
    v34 = 1;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v25, 0x3Au);

  }
  -[SMInitiatorService sessionManager](self, "sessionManager");
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSObject processStateSyncUpdateReqMessage:](v16, "processStateSyncUpdateReqMessage:", v9);
LABEL_11:

}

- (void)receivedEmergencyContactsNotifiedSyncMessage:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,%@", (uint8_t *)&v11, 0x20u);

  }
  -[SMInitiatorService sessionManager](self, "sessionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processEmergencyContactsNotifiedMessage:", v5);

}

- (void)receivedSessionStartInfoRequestMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message from my own device", (uint8_t *)&v26, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v9, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v15);
    v11 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v11)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "sessionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138413570;
        v27 = v18;
        v28 = 2112;
        v29 = v20;
        v30 = 2112;
        v31 = v21;
        v32 = 2112;
        v33 = v10;
        v34 = 1024;
        v35 = 0;
        v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v26, 0x3Au);

      }
      -[NSObject processSessionStartInfoRequest:](v11, "processSessionStartInfoRequest:", v9);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "sessionID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412802;
        v27 = v22;
        v28 = 2112;
        v29 = v24;
        v30 = 2112;
        v31 = v25;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager for this session not found", (uint8_t *)&v26, 0x20u);

      }
      v11 = 0;
    }
  }

}

- (void)receivedKeyReleaseInfoRequestMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message from my own device", (uint8_t *)&v27, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v9, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v15);
    v11 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v11)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "sessionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138413570;
        v28 = v19;
        v29 = 2112;
        v30 = v21;
        v31 = 2112;
        v32 = v22;
        v33 = 2112;
        v34 = v10;
        v35 = 1024;
        v36 = 0;
        v37 = 2112;
        v38 = v9;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v27, 0x3Au);

      }
      -[NSObject processKeyReleaseInfoRequest:](v11, "processKeyReleaseInfoRequest:", v9);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "sessionID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412802;
        v28 = v23;
        v29 = 2112;
        v30 = v25;
        v31 = 2112;
        v32 = v26;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager for this session not found", (uint8_t *)&v27, 0x20u);

      }
      v11 = 0;
    }
  }

}

- (void)onSessionStoreNotification:(id)a3
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
  v7[2] = __49__SMInitiatorService_onSessionStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __49__SMInitiatorService_onSessionStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onSessionStoreNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v4, "availability");
    if (-[SMInitiatorService sessionStoreAvailability](self, "sessionStoreAvailability") != v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        +[RTStore availabilityToString:](RTStore, "availabilityToString:", self->_sessionStoreAvailability);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTStore availabilityToString:](RTStore, "availabilityToString:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315650;
        v13 = "-[SMInitiatorService _onSessionStoreNotification:]";
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%s, sessionStoreAvailability availability change from , %@, to, %@", (uint8_t *)&v12, 0x20u);

      }
      -[SMInitiatorService setSessionStoreAvailability:](self, "setSessionStoreAvailability:", v8);
      -[SMInitiatorService _setupOncePersistenceStackAvailable](self, "_setupOncePersistenceStackAvailable");
    }
  }

}

- (void)onSafetyCacheStoreNotification:(id)a3
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
  v7[2] = __53__SMInitiatorService_onSafetyCacheStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__SMInitiatorService_onSafetyCacheStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSafetyCacheStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onSafetyCacheStoreNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v4, "availability");
    if (-[SMInitiatorService safetyCacheStoreAvailability](self, "safetyCacheStoreAvailability") != v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        +[RTStore availabilityToString:](RTStore, "availabilityToString:", self->_safetyCacheStoreAvailability);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTStore availabilityToString:](RTStore, "availabilityToString:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315650;
        v13 = "-[SMInitiatorService _onSafetyCacheStoreNotification:]";
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%s, safetyCacheStoreAvailability availability change from , %@, to, %@", (uint8_t *)&v12, 0x20u);

      }
      -[SMInitiatorService setSafetyCacheStoreAvailability:](self, "setSafetyCacheStoreAvailability:", v8);
      -[SMInitiatorService _setupOncePersistenceStackAvailable](self, "_setupOncePersistenceStackAvailable");
    }
  }

}

- (void)onHealthKitManagerNotification:(id)a3
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
  v7[2] = __53__SMInitiatorService_onHealthKitManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__SMInitiatorService_onHealthKitManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onHealthKitManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onWorkoutPause
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionMonitor](self, "sessionMonitor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onWorkoutPause");

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__SMInitiatorService__onWorkoutPause__block_invoke;
    v10[3] = &unk_1E92977B8;
    v10[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__SMInitiatorService__onWorkoutPause__block_invoke_2;
    v9[3] = &unk_1E92977B8;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueBlock:failureBlock:description:", v10, v9, CFSTR("%@-%@"), v6, v7);

  }
}

uint64_t __37__SMInitiatorService__onWorkoutPause__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkoutPause");
}

void __37__SMInitiatorService__onWorkoutPause__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "invocationError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 136315394;
    v5 = "-[SMInitiatorService _onWorkoutPause]_block_invoke_2";
    v6 = 2112;
    v7 = v3;
    _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "%s, workout pause signal ended with error, %@", (uint8_t *)&v4, 0x16u);

  }
}

- (void)_onWorkoutResume
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionMonitor](self, "sessionMonitor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onWorkoutResume");

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__SMInitiatorService__onWorkoutResume__block_invoke;
    v10[3] = &unk_1E92977B8;
    v10[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__SMInitiatorService__onWorkoutResume__block_invoke_2;
    v9[3] = &unk_1E92977B8;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueBlock:failureBlock:description:", v10, v9, CFSTR("%@-%@"), v6, v7);

  }
}

uint64_t __38__SMInitiatorService__onWorkoutResume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkoutResume");
}

void __38__SMInitiatorService__onWorkoutResume__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "invocationError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 136315394;
    v5 = "-[SMInitiatorService _onWorkoutResume]_block_invoke_2";
    v6 = 2112;
    v7 = v3;
    _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "%s, workout resume signal ended with error, %@", (uint8_t *)&v4, 0x16u);

  }
}

- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3
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
  v7[2] = __61__SMInitiatorService_fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __61__SMInitiatorService_fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentWorkoutSnapshotWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  RTHealthKitManager *healthKitManager;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SMInitiatorService _fetchCurrentWorkoutSnapshotWithHandler:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  healthKitManager = self->_healthKitManager;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SMInitiatorService__fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v8[3] = &unk_1E929E438;
  v9 = v4;
  v7 = v4;
  -[RTHealthKitManager fetchCurrentWorkoutSnapshotWithHandler:](healthKitManager, "fetchCurrentWorkoutSnapshotWithHandler:", v8);

}

void __62__SMInitiatorService__fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(v5, "sessionState");
    v8 = (v7 < 6) & (0x34u >> v7);
    v9 = objc_alloc(MEMORY[0x1E0D8B920]);
    objc_msgSend(v5, "sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithSessionIdentifier:activityType:isWorkoutOngoing:isFirstPartyWorkout:", v10, objc_msgSend(v5, "activityType"), v8, objc_msgSend(v5, "isFirstPartyWorkout"));

  }
  else
  {
    v11 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[SMInitiatorService _fetchCurrentWorkoutSnapshotWithHandler:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "%s, calling handler", (uint8_t *)&v13, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchAllZonesFromContainerSynchronizerWithHandler:(id)a3
{
  void (**v5)(id, void *, uint64_t);
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, void *, uint64_t);
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, uint64_t))a3;
  if (-[SMInitiatorService fetchAllZonesFromContainerInProgress](self, "fetchAllZonesFromContainerInProgress"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 1024;
      v27 = -[SMInitiatorService fetchAllZonesFromContainerInProgress](self, "fetchAllZonesFromContainerInProgress");
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, fetchAllZonesFromContainerInProgress:%d,early return", buf, 0x1Cu);

    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("FetchAllZoneFromContainer in progress");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v12, 1);

  }
  else
  {
    -[SMInitiatorService setFetchAllZonesFromContainerInProgress:](self, "setFetchAllZonesFromContainerInProgress:", 1);
    -[SMInitiatorService setFetchAllZonesRetried:](self, "setFetchAllZonesRetried:", 0);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 1024;
      v27 = -[SMInitiatorService fetchAllZonesFromContainerInProgress](self, "fetchAllZonesFromContainerInProgress");
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, fetchAllZonesFromContainerInProgress:%d,Attempt fetching all zones", buf, 0x1Cu);

    }
    objc_initWeak((id *)buf, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__SMInitiatorService__fetchAllZonesFromContainerSynchronizerWithHandler___block_invoke;
    v17[3] = &unk_1E929E460;
    objc_copyWeak(&v19, (id *)buf);
    v18 = v5;
    -[SMInitiatorService _fetchAllZonesFromContainerWithHandler:](self, "_fetchAllZonesFromContainerWithHandler:", v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

void __73__SMInitiatorService__fetchAllZonesFromContainerSynchronizerWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setFetchAllZonesFromContainerInProgress:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchAllZonesFromContainerWithHandler:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SMCloudKitQosOptions *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService sessionReceiptZone](self, "sessionReceiptZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService sessionReceiptZone](self, "sessionReceiptZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "privateDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__SMInitiatorService__fetchAllZonesFromContainerWithHandler___block_invoke;
  v15[3] = &unk_1E929E488;
  objc_copyWeak(v18, &location);
  v13 = v7;
  v16 = v13;
  v18[1] = (id)a2;
  v14 = v5;
  v17 = v14;
  +[SMCloudKitZone fetchAllZonesFromContainer:database:qos:withCompletion:](SMCloudKitZone, "fetchAllZonesFromContainer:database:qos:withCompletion:", v9, v11, v12, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __61__SMInitiatorService__fetchAllZonesFromContainerWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SMInitiatorService__fetchAllZonesFromContainerWithHandler___block_invoke_170;
    block[3] = &unk_1E9297910;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 56);
    v19 = v8;
    v23 = v9;
    v20 = v4;
    v21 = v6;
    v22 = *(id *)(a1 + 40);
    dispatch_async(v7, block);

    v10 = v19;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,nil self", buf, 0x16u);

    }
    v12 = *(_QWORD *)(a1 + 40);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("self is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 5, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);

  }
}

uint64_t __61__SMInitiatorService__fetchAllZonesFromContainerWithHandler___block_invoke_170(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v19 = 138412802;
    v20 = v3;
    v21 = 2112;
    v22 = v4;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,CloudKit (Fetch) Operation for initialize using PCS Identities, error %@", (uint8_t *)&v19, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40)
    && +[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:")
    && (objc_msgSend(*(id *)(a1 + 48), "fetchAllZonesRetried") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      v18 = objc_msgSend(*(id *)(a1 + 48), "fetchAllZonesRetried");
      v19 = 138413058;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 1024;
      v26 = v18;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, fetchAllZonesFromContainer,error:%@,fetchAllZonesRetried:%d, retry once more", (uint8_t *)&v19, 0x26u);

    }
    objc_msgSend(*(id *)(a1 + 48), "setFetchAllZonesRetried:", 1);
    return objc_msgSend(*(id *)(a1 + 48), "_fetchAllZonesFromContainerWithHandler:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = objc_msgSend(*(id *)(a1 + 48), "fetchAllZonesRetried");
      v19 = 138413058;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 1024;
      v26 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, fetchAllZonesFromContainer,error:%@,fetchAllZonesRetried:%d, not retrying", (uint8_t *)&v19, 0x26u);

    }
    v11 = *(void **)(a1 + 48);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v11, "_startFrequentSingleShotFetchAllZonesActivity");
    }
    else
    {
      objc_msgSend(v11, "defaultsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("RTDefaultsInitiatorServiceRecentCloudKitBootstrapSuccess"));

      objc_msgSend(*(id *)(a1 + 48), "_stopFrequentSingleShotFetchAllZonesActivity");
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)_startFrequentSingleShotFetchAllZonesActivity
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  RTXPCActivityCriteria *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[SMInitiatorService frequentSingleShotFetchAllZonesInProgress](self, "frequentSingleShotFetchAllZonesInProgress"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v6;
      v30 = 2112;
      v31 = v7;
      v32 = 1024;
      LODWORD(v33) = -[SMInitiatorService frequentSingleShotFetchAllZonesInProgress](self, "frequentSingleShotFetchAllZonesInProgress");
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, frequentSingleShotFetchAllZonesInProgress:%d,early return", buf, 0x1Cu);

    }
  }
  else
  {
    -[SMInitiatorService setFrequentSingleShotFetchAllZonesInProgress:](self, "setFrequentSingleShotFetchAllZonesInProgress:", 1);
    -[SMInitiatorService defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsInitiatorServiceSingleShotFetchAllZonesGracePeriod"));
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NSObject doubleValue](v4, "doubleValue");
      v10 = v9;
    }
    else
    {
      v10 = 60.0;
    }
    -[SMInitiatorService defaultsManager](self, "defaultsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("RTDefaultsInitiatorServicePeriodicFetchAllZonesDelay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      v14 = v13;
    }
    else
    {
      v14 = 1800.0;
    }
    LOBYTE(v24) = 1;
    v15 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:", 2, 1, 0, 10240, 10240, 1, 0.0, v10, v14, v24, &unk_1E93282E0);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      v32 = 2048;
      v33 = 0;
      v34 = 2048;
      v35 = v10;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,schedule single shot fetch all zones xpc activity,interval,%f,grace period,%f", buf, 0x2Au);

    }
    objc_initWeak((id *)buf, self);
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService xpcActivityManager](self, "xpcActivityManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke;
    v25[3] = &unk_1E929E4D8;
    objc_copyWeak(v27, (id *)buf);
    v23 = v21;
    v26 = v23;
    v27[1] = (id)a2;
    objc_msgSend(v22, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.cloudkit.frequentFetchAllZones"), v15, v25);

    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);

  }
}

void __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke_2;
    v9[3] = &unk_1E9297590;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = v7;
    v13 = v8;
    v11 = v5;
    v12 = v3;
    dispatch_async(v6, v9);

  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,single shot fetch all zones xpc fired", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setFrequentSingleShotFetchAllZonesInProgress:", 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke_178;
  v8[3] = &unk_1E929E4B0;
  v5 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 48);
  v6 = (id)v7;
  v10 = v7;
  objc_msgSend(v5, "_fetchAllZonesFromContainerSynchronizerWithHandler:", v8);

}

void __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke_178(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 1024;
    v17 = a3;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,_fetchAllZonesFromContainerSynchronizerWithHandler, error:%@, inProgress:%d", (uint8_t *)&v10, 0x26u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);

}

- (void)_startInfrequentPeriodicFetchAllZonesActivity
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
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SMInitiatorService defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsInitiatorServicePeriodicFetchAllZonesInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = 86400.0;
  }
  -[SMInitiatorService defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsInitiatorServicePeriodicFetchAllZonesGracePeriod"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    v11 = 1800.0;
  }
  v12 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 2, 1, 0, 3, 1, 1, v7, v11);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v25 = v15;
    v26 = 2112;
    v27 = v16;
    v28 = 2048;
    v29 = v7;
    v30 = 2048;
    v31 = v11;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,schedule periodic fetch all zones xpc activity,interval,%f,grace period,%f", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService xpcActivityManager](self, "xpcActivityManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke;
  v21[3] = &unk_1E929E4D8;
  objc_copyWeak(v23, (id *)buf);
  v20 = v18;
  v22 = v20;
  v23[1] = (id)a2;
  objc_msgSend(v19, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.cloudkit.infrequentFetchAllZones"), v12, v21);

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);

}

void __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke_2;
    v9[3] = &unk_1E9297590;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = v7;
    v13 = v8;
    v11 = v5;
    v12 = v3;
    dispatch_async(v6, v9);

  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,periodic fetch all zones xpc fired", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsInitiatorServiceRecentCloudKitBootstrapSuccess"));

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke_184;
  v9[3] = &unk_1E929E4B0;
  v6 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 48);
  v7 = (id)v8;
  v11 = v8;
  objc_msgSend(v6, "_fetchAllZonesFromContainerSynchronizerWithHandler:", v9);

}

void __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke_184(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 1024;
    v17 = a3;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,_fetchAllZonesFromContainerSynchronizerWithHandler, error:%@, inProgress:%d", (uint8_t *)&v10, 0x26u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);

}

- (void)_stopFrequentSingleShotFetchAllZonesActivity
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@", buf, 0x16u);

  }
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService xpcActivityManager](self, "xpcActivityManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SMInitiatorService__stopFrequentSingleShotFetchAllZonesActivity__block_invoke;
  v12[3] = &unk_1E9297628;
  v13 = v9;
  v14 = a2;
  v11 = v9;
  objc_msgSend(v10, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.cloudkit.frequentFetchAllZones"), v12);

}

void __66__SMInitiatorService__stopFrequentSingleShotFetchAllZonesActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,unregisterActivityWithIdentifier with error %@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)onNearbyEffectivePairedDeviceChangedNotification:(id)a3
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
  v7[2] = __71__SMInitiatorService_onNearbyEffectivePairedDeviceChangedNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __71__SMInitiatorService_onNearbyEffectivePairedDeviceChangedNotification___block_invoke(uint64_t a1)
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
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,on paired device notification %@", (uint8_t *)&v16, 0x20u);

  }
  objc_msgSend(v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification, "notificationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    v13 = v5;
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "processNearbyEffectivePairedDeviceChanged:", v15);
  }

}

- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SMInitiatorService initializeSessionWithConversation:handler:]";
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%s, User requested to initialize the session", buf, 0xCu);
  }

  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SMInitiatorService_initializeSessionWithConversation_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __64__SMInitiatorService_initializeSessionWithConversation_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeSessionWithConversation:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  SMInitiatorSessionInitializationRequest *v19;
  void *v20;
  SMInitiatorSessionInitializationRequest *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_18;
  }
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    if (v7 && (conversationHandlesValid() & 1) != 0)
    {
      -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v47 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]";
          v48 = 2112;
          v49 = v11;
          _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, canceling previous initialization request %@", buf, 0x16u);

        }
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v13 = *MEMORY[0x1E0D8BB70];
        v42 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled due to new request"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 22, v15);

        -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handler");
        v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v18)[2](v18, 0, 0, 0, v16);

        -[SMInitiatorService setPendingInitializationRequest:](self, "setPendingInitializationRequest:", 0);
      }
      v19 = [SMInitiatorSessionInitializationRequest alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SMInitiatorSessionInitializationRequest initWithSessionID:conversation:handler:](v19, "initWithSessionID:conversation:handler:", v20, v7, v8);
      -[SMInitiatorService setPendingInitializationRequest:](self, "setPendingInitializationRequest:", v21);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v47 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]";
        v48 = 2112;
        v49 = v23;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEFAULT, "%s, request a transition to initializing for request, %@", buf, 0x16u);

      }
      -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorService sessionManager](self, "sessionManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke_190;
      v37[3] = &unk_1E929A538;
      v37[4] = self;
      v38 = v24;
      v27 = v24;
      objc_msgSend(v25, "initializeSessionWithSessionID:conversation:handler:", v26, v7, v37);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]";
        v48 = 2112;
        v49 = v7;
        _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%s, invalid conversation %@", buf, 0x16u);
      }

      v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D8BB70];
      v44 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid conversation"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 7, v36);

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, NSObject *))v8 + 2))(v8, 0, 0, 0, v27);
    }
LABEL_18:

    goto LABEL_19;
  }
  -[SMInitiatorService dispatcher](self, "dispatcher");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke;
  v39[3] = &unk_1E9296F70;
  v39[4] = self;
  v40 = v7;
  v41 = v8;
  v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "enqueueBlock:description:", v39, CFSTR("%@-%@"), v30, v31);

LABEL_19:
}

uint64_t __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeSessionWithConversation:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke_190(uint64_t a1, void *a2)
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
  block[2] = __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke_2;
  block[3] = &unk_1E9299D78;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

void __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingInitializationRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v17 = 136315650;
      v18 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]_block_invoke";
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%s, sessionManager finished attempting state change to initialization for request, %@, error, %@", (uint8_t *)&v17, 0x20u);

    }
    v11 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v11, "pendingInitializationRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, 0, 0, *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 32), "setPendingInitializationRequest:", 0);
    }
    else
    {
      objc_msgSend(v11, "_startInitializationProcess");
    }
  }
  else
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v17 = 136315650;
      v18 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]_block_invoke_2";
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "%s, request was canceled prior to finishing transition to initializing for request, %@, error, %@", (uint8_t *)&v17, 0x20u);
    }

  }
}

- (void)cancelInitializationWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SMInitiatorService cancelInitializationWithHandler:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, User requested to cancel initialization", buf, 0xCu);
  }

  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SMInitiatorService_cancelInitializationWithHandler___block_invoke;
  v8[3] = &unk_1E9297650;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __54__SMInitiatorService_cancelInitializationWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelInitializationWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_cancelInitializationWithHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v29 = "-[SMInitiatorService _cancelInitializationWithHandler:]";
        v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, responding to previous initialization request %@", buf, 0x16u);

      }
      v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v10 = *MEMORY[0x1E0D8BB70];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initialization canceled"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 42, v12);

      -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handler");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v15)[2](v15, 0, 0, 0, v13);

      -[SMInitiatorService setPendingInitializationRequest:](self, "setPendingInitializationRequest:", 0);
    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cancelInitializationWithHandler:", v5);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55__SMInitiatorService__cancelInitializationWithHandler___block_invoke;
    v24[3] = &unk_1E9297650;
    v24[4] = self;
    v25 = v5;
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __55__SMInitiatorService__cancelInitializationWithHandler___block_invoke_2;
    v22[3] = &unk_1E9297678;
    v22[4] = self;
    v23 = v25;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enqueueBlock:failureBlock:description:", v24, v22, CFSTR("%@-%@"), v20, v21);

  }
}

uint64_t __55__SMInitiatorService__cancelInitializationWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelInitializationWithHandler:", *(_QWORD *)(a1 + 40));
}

void __55__SMInitiatorService__cancelInitializationWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SMInitiatorService cancelInitializationForSessionID:handler:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, User requested to cancel initialization with session ID %@", buf, 0x16u);
  }

  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SMInitiatorService_cancelInitializationForSessionID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __63__SMInitiatorService_cancelInitializationForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelInitializationForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v7);

      if (v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v37 = "-[SMInitiatorService _cancelInitializationForSessionID:handler:]";
          v38 = 2112;
          v39 = v15;
          _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, responding to previous initialization request %@", buf, 0x16u);

        }
        v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D8BB70];
        v34 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initialization canceled"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v19);

        -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handler");
        v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v22)[2](v22, 0, 0, 0, v20);

        -[SMInitiatorService setPendingInitializationRequest:](self, "setPendingInitializationRequest:", 0);
      }
    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cancelInitializationForSessionID:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __64__SMInitiatorService__cancelInitializationForSessionID_handler___block_invoke;
    v31[3] = &unk_1E9296F70;
    v31[4] = self;
    v32 = v7;
    v33 = v8;
    v29[0] = v25;
    v29[1] = 3221225472;
    v29[2] = __64__SMInitiatorService__cancelInitializationForSessionID_handler___block_invoke_2;
    v29[3] = &unk_1E9297678;
    v29[4] = self;
    v30 = v33;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "enqueueBlock:failureBlock:description:", v31, v29, CFSTR("%@-%@"), v27, v28);

  }
}

uint64_t __64__SMInitiatorService__cancelInitializationForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelInitializationForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __64__SMInitiatorService__cancelInitializationForSessionID_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SMInitiatorService_startSessionWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __60__SMInitiatorService_startSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSessionWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_startSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startSessionWithConfiguration:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__SMInitiatorService__startSessionWithConfiguration_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __61__SMInitiatorService__startSessionWithConfiguration_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __61__SMInitiatorService__startSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSessionWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __61__SMInitiatorService__startSessionWithConfiguration_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SMInitiatorService_initializeAndStartSessionWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __73__SMInitiatorService_initializeAndStartSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__SMInitiatorService_initializeAndStartSessionWithConfiguration_handler___block_invoke_2;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_initializeAndStartSessionWithConfiguration:handler:", v2, v3);

}

void __73__SMInitiatorService_initializeAndStartSessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D8BB70]);

    if (v5)
    {
      v6 = objc_msgSend(v10, "code");
      if (v6 == 42)
        goto LABEL_7;
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D8B9E8], "sendMessageFailureAlertCannotSendTitle");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0D8B9E8], "sendValidityAlertMessageForSMError:", v6);
    objc_msgSend(MEMORY[0x1E0D8B9E8], "sendMessageFailureAlertOKButtonText");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v7, v8, v9, 0, 0, 0);

  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    objc_msgSend(v7, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_3;
    v18[3] = &unk_1E929E570;
    v19 = v7;
    v20 = v8;
    v18[4] = self;
    v10 = v7;
    -[SMInitiatorService _initializeSessionWithConversation:handler:](self, "_initializeSessionWithConversation:handler:", v9, v18);

    v11 = v20;
  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke;
    v23[3] = &unk_1E9296F70;
    v23[4] = self;
    v24 = v7;
    v25 = v8;
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_2;
    v21[3] = &unk_1E9297678;
    v21[4] = self;
    v22 = v25;
    v14 = v7;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueueBlock:failureBlock:description:", v23, v21, CFSTR("%@-%@"), v16, v17);

    v11 = v24;
  }

}

uint64_t __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeAndStartSessionWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (v7)
  {
    v9 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_197;
    v18[3] = &unk_1E929E548;
    v22 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v19 = v10;
    v20 = v11;
    v21 = v7;
    objc_msgSend(v9, "_fetchCurrentSessionStateWithHandler:", v18);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke_3";
      _os_log_fault_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_FAULT, "%s, missing invitation token with no error", buf, 0xCu);
    }

    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0D8BB70];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing invitation token with no error"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 0, v16);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_197(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke";
      v30 = 2112;
      v31 = v8;
      _os_log_fault_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_FAULT, "%s, ready state fetch error, %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (objc_msgSend(v7, "sessionState") == 11 && (a3 & 1) != 0)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v7, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "copyConfigurationWithNewSessionID:", v12);

      v14 = *(void **)(a1 + 40);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_200;
      v22[3] = &unk_1E929E520;
      v15 = *(id *)(a1 + 56);
      v16 = *(_QWORD *)(a1 + 40);
      v25 = v15;
      v22[4] = v16;
      v23 = v7;
      v24 = *(id *)(a1 + 48);
      objc_msgSend(v14, "_startSessionWithConfiguration:handler:", v13, v22);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v29 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke";
        v30 = 2112;
        v31 = v7;
        v32 = 2048;
        v33 = a3;
        _os_log_fault_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_FAULT, "%s, expected ready state but got unexpected state, %@, activeDevice, %ld", buf, 0x20u);
      }

      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v19 = *MEMORY[0x1E0D8BB70];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected state during initialization"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 41, v21);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_200(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315394;
      v9 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_fault_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_FAULT, "%s, start error, %@", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cancelInitializationForSessionID:handler:", v7, &__block_literal_global_202);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_sendSessionStartMessageWithInvitationTokenMap:", *(_QWORD *)(a1 + 48));
  }

}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_201(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, cancel initialization after start failure with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)_sendSessionStartMessageWithInvitationTokenMap:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke;
  v6[3] = &unk_1E929E5D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SMInitiatorService _fetchCurrentSessionStateWithHandler:](self, "_fetchCurrentSessionStateWithHandler:", v6);

}

void __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMInitiatorService _sendSessionStartMessageWithInvitationTokenMap:]_block_invoke";
      v22 = 2112;
      v23 = v8;
      v10 = "%s, fetch error, %@";
      v11 = v9;
      v12 = 22;
LABEL_9:
      _os_log_fault_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_FAULT, v10, buf, v12);
    }
  }
  else if (objc_msgSend(v7, "sessionState") == 2 && (a3 & 1) != 0)
  {
    v13 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke_205;
    v16[3] = &unk_1E929CAA0;
    v17 = v7;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v18 = v14;
    v19 = v15;
    objc_msgSend(v13, "_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", v16);

    v9 = v17;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[SMInitiatorService _sendSessionStartMessageWithInvitationTokenMap:]_block_invoke";
      v22 = 2112;
      v23 = v7;
      v24 = 2048;
      v25 = a3;
      v10 = "%s, expected monitoring state but got unexpected state, %@, activeDevice, %ld";
      v11 = v9;
      v12 = 32;
      goto LABEL_9;
    }
  }

}

void __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke_205(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
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
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;

  if (a3)
    a2 = 0;
  v23 = a2;
  v5 = objc_alloc(MEMORY[0x1E0D8BA68]);
  objc_msgSend(*(id *)(a1 + 32), "sessionStateTransitionDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sessionID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v27, "sessionType");
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "estimatedEndDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "coarseEstimatedEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "destinationType");
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destinationMapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v5, "initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:", v29, v6, v24, v30, v22, v21, v7, v10, v13, v23);

  objc_msgSend(*(id *)(a1 + 48), "messagingService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "madridMessenger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "conversation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "summaryText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMadridMessage:associatedGUID:toConversation:summaryText:completion:", v31, 0, v17, v18, &__block_literal_global_208);

  v19 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_endSessionEarlyIfNecessaryWithConfiguration:", v20);

}

void __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v18 = "-[SMInitiatorService _sendSessionStartMessageWithInvitationTokenMap:]_block_invoke_2";
    v19 = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = a3;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%s, sent start message with GUID, %@, success, %ld, error, %@", buf, 0x2Au);
  }

  if (v7)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0D8BB70];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to send message"), *MEMORY[0x1E0CB2D50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 5, v12);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SMInitiatorService _sendSessionStartMessageWithInvitationTokenMap:]_block_invoke";
      v19 = 2112;
      v20 = v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%s, messages unable to send start message, error: %@", buf, 0x16u);
    }

  }
}

- (void)_endSessionEarlyIfNecessaryWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, starting", buf, 0xCu);
  }

  if (objc_msgSend(v4, "sessionType") == 4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SMInitiatorService__endSessionEarlyIfNecessaryWithConfiguration___block_invoke;
    v7[3] = &unk_1E929E600;
    v7[4] = self;
    v8 = v4;
    -[SMInitiatorService _fetchCurrentWorkoutSnapshotWithHandler:](self, "_fetchCurrentWorkoutSnapshotWithHandler:", v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]";
      _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%s, not ending session because not workout-bound", buf, 0xCu);
    }

  }
}

void __67__SMInitiatorService__endSessionEarlyIfNecessaryWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 1024;
    v20 = objc_msgSend(v5, "isWorkoutOngoing");
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, workoutSnapshot: %@, isWorkoutOngoing: %{Bool}d", buf, 0x1Cu);
  }

  if (v5 && (objc_msgSend(v5, "isWorkoutOngoing") & 1) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, session continuing", buf, 0xCu);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, ending session because there no longer a workout", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__SMInitiatorService__endSessionEarlyIfNecessaryWithConfiguration___block_invoke_212;
    v12[3] = &unk_1E929A538;
    v13 = *(id *)(a1 + 40);
    v14 = v6;
    objc_msgSend(v10, "_endSessionForSessionID:reason:handler:", v11, 8, v12);

    v8 = v13;
  }

}

void __67__SMInitiatorService__endSessionEarlyIfNecessaryWithConfiguration___block_invoke_212(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 136315650;
    v6 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "%s, session ended for sessionID, %@, error, %@", (uint8_t *)&v5, 0x20u);

  }
}

- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SMInitiatorService_modifySessionWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __61__SMInitiatorService_modifySessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifySessionWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modifySessionWithConfiguration:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__SMInitiatorService__modifySessionWithConfiguration_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __62__SMInitiatorService__modifySessionWithConfiguration_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __62__SMInitiatorService__modifySessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifySessionWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __62__SMInitiatorService__modifySessionWithConfiguration_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SMInitiatorService_handoffSessionForSessionID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __57__SMInitiatorService_handoffSessionForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handoffSessionForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handoffSessionForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handoffSessionForSessionID:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__SMInitiatorService__handoffSessionForSessionID_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __58__SMInitiatorService__handoffSessionForSessionID_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __58__SMInitiatorService__handoffSessionForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handoffSessionForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __58__SMInitiatorService__handoffSessionForSessionID_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__SMInitiatorService_endSessionForSessionID_reason_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __60__SMInitiatorService_endSessionForSessionID_reason_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSessionForSessionID:reason:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;

  v9 = a3;
  v10 = a5;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endSessionForSessionID:reason:handler:", v9, a4, v10);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__SMInitiatorService__endSessionForSessionID_reason_handler___block_invoke;
    v19[3] = &unk_1E9297590;
    v19[4] = self;
    v20 = v9;
    v22 = a4;
    v21 = v10;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __61__SMInitiatorService__endSessionForSessionID_reason_handler___block_invoke_2;
    v17[3] = &unk_1E9297678;
    v17[4] = self;
    v18 = v21;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueueBlock:failureBlock:description:", v19, v17, CFSTR("%@-%@"), v15, v16);

  }
}

uint64_t __61__SMInitiatorService__endSessionForSessionID_reason_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSessionForSessionID:reason:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __61__SMInitiatorService__endSessionForSessionID_reason_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SMInitiatorService_sendSafetyCacheForSessionID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __58__SMInitiatorService_sendSafetyCacheForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSafetyCacheForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSafetyCacheForSessionID:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__SMInitiatorService__sendSafetyCacheForSessionID_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __59__SMInitiatorService__sendSafetyCacheForSessionID_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __59__SMInitiatorService__sendSafetyCacheForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSafetyCacheForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __59__SMInitiatorService__sendSafetyCacheForSessionID_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SMInitiatorService_respondToTriggerPromptForSessionID_response_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __74__SMInitiatorService_respondToTriggerPromptForSessionID_response_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_respondToTriggerPromptForSessionID:response:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  int64_t v22;

  v9 = a3;
  v10 = a5;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "respondToTriggerPromptForSessionID:response:handler:", v9, a4, v10);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__SMInitiatorService__respondToTriggerPromptForSessionID_response_handler___block_invoke;
    v19[3] = &unk_1E9297590;
    v19[4] = self;
    v20 = v9;
    v22 = a4;
    v21 = v10;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __75__SMInitiatorService__respondToTriggerPromptForSessionID_response_handler___block_invoke_2;
    v17[3] = &unk_1E9297678;
    v17[4] = self;
    v18 = v21;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueueBlock:failureBlock:description:", v19, v17, CFSTR("%@-%@"), v15, v16);

  }
}

uint64_t __75__SMInitiatorService__respondToTriggerPromptForSessionID_response_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_respondToTriggerPromptForSessionID:response:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __75__SMInitiatorService__respondToTriggerPromptForSessionID_response_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SMInitiatorService_promptDestinationAnomalyVerificationWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __78__SMInitiatorService_promptDestinationAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptDestinationAnomalyVerificationWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "promptDestinationAnomalyVerificationWithContext:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__SMInitiatorService__promptDestinationAnomalyVerificationWithContext_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __79__SMInitiatorService__promptDestinationAnomalyVerificationWithContext_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __79__SMInitiatorService__promptDestinationAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptDestinationAnomalyVerificationWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __79__SMInitiatorService__promptDestinationAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SMInitiatorService_promptTimerEndedVerificationWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __70__SMInitiatorService_promptTimerEndedVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptTimerEndedVerificationWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "promptTimerEndedVerificationWithContext:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__SMInitiatorService__promptTimerEndedVerificationWithContext_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __71__SMInitiatorService__promptTimerEndedVerificationWithContext_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __71__SMInitiatorService__promptTimerEndedVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptTimerEndedVerificationWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __71__SMInitiatorService__promptTimerEndedVerificationWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SMInitiatorService_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __76__SMInitiatorService_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptRoundTripAnomalyVerificationWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "promptRoundTripAnomalyVerificationWithContext:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__SMInitiatorService__promptRoundTripAnomalyVerificationWithContext_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __77__SMInitiatorService__promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __77__SMInitiatorService__promptRoundTripAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptRoundTripAnomalyVerificationWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __77__SMInitiatorService__promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SMInitiatorService_promptSafeArrivalWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__SMInitiatorService_promptSafeArrivalWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptSafeArrivalWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "promptSafeArrivalWithContext:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__SMInitiatorService__promptSafeArrivalWithContext_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __60__SMInitiatorService__promptSafeArrivalWithContext_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __60__SMInitiatorService__promptSafeArrivalWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptSafeArrivalWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __60__SMInitiatorService__promptSafeArrivalWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SMInitiatorService_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__SMInitiatorService_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptWorkoutAnomalyVerificationWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "promptWorkoutAnomalyVerificationWithContext:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__SMInitiatorService__promptWorkoutAnomalyVerificationWithContext_handler___block_invoke;
    v17[3] = &unk_1E9296F70;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __75__SMInitiatorService__promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_2;
    v15[3] = &unk_1E9297678;
    v15[4] = self;
    v16 = v19;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueBlock:failureBlock:description:", v17, v15, CFSTR("%@-%@"), v13, v14);

  }
}

uint64_t __75__SMInitiatorService__promptWorkoutAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptWorkoutAnomalyVerificationWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __75__SMInitiatorService__promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)fetchCurrentSessionStateWithHandler:(id)a3
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
  v7[2] = __58__SMInitiatorService_fetchCurrentSessionStateWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__SMInitiatorService_fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentSessionStateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchCurrentSessionStateWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchCurrentSessionStateWithHandler:", v5);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__SMInitiatorService__fetchCurrentSessionStateWithHandler___block_invoke;
    v14[3] = &unk_1E9297650;
    v14[4] = self;
    v15 = v5;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __59__SMInitiatorService__fetchCurrentSessionStateWithHandler___block_invoke_2;
    v12[3] = &unk_1E9297678;
    v12[4] = self;
    v13 = v15;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueBlock:failureBlock:description:", v14, v12, CFSTR("%@-%@"), v10, v11);

  }
}

uint64_t __59__SMInitiatorService__fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentSessionStateWithHandler:", *(_QWORD *)(a1 + 40));
}

void __59__SMInitiatorService__fetchCurrentSessionStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
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
  v7[2] = __82__SMInitiatorService_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __82__SMInitiatorService_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService deviceConfigurationChecker](self, "deviceConfigurationChecker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", v5);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__SMInitiatorService__fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
    v14[3] = &unk_1E9297650;
    v14[4] = self;
    v15 = v5;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __83__SMInitiatorService__fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2;
    v12[3] = &unk_1E9297678;
    v12[4] = self;
    v13 = v15;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueBlock:failureBlock:description:", v14, v12, CFSTR("%@-%@"), v10, v11);

  }
}

uint64_t __83__SMInitiatorService__fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", *(_QWORD *)(a1 + 40));
}

void __83__SMInitiatorService__fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3
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
  v7[2] = __63__SMInitiatorService_fetchCurrentLocalSessionStateWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __63__SMInitiatorService_fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentLocalSessionStateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchCurrentLocalSessionStateWithHandler:", v5);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__SMInitiatorService__fetchCurrentLocalSessionStateWithHandler___block_invoke;
    v14[3] = &unk_1E9297650;
    v14[4] = self;
    v15 = v5;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __64__SMInitiatorService__fetchCurrentLocalSessionStateWithHandler___block_invoke_2;
    v12[3] = &unk_1E9297678;
    v12[4] = self;
    v13 = v15;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueBlock:failureBlock:description:", v14, v12, CFSTR("%@-%@"), v10, v11);

  }
}

uint64_t __64__SMInitiatorService__fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentLocalSessionStateWithHandler:", *(_QWORD *)(a1 + 40));
}

void __64__SMInitiatorService__fetchCurrentLocalSessionStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)sendHeartbeatForSessionID:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SMInitiatorService_sendHeartbeatForSessionID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __56__SMInitiatorService_sendHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendHeartbeatForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SMInitiatorService _sendHeartbeatForSessionID:handler:]";
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, heartbeat received for sessionID, %@", buf, 0x16u);
  }

  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService watchdog](self, "watchdog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "receiveHeartbeatForSessionID:handler:", v7, v8);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__SMInitiatorService__sendHeartbeatForSessionID_handler___block_invoke;
    v18[3] = &unk_1E9296F70;
    v18[4] = self;
    v19 = v7;
    v20 = v8;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __57__SMInitiatorService__sendHeartbeatForSessionID_handler___block_invoke_2;
    v16[3] = &unk_1E9297678;
    v16[4] = self;
    v17 = v20;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enqueueBlock:failureBlock:description:", v18, v16, CFSTR("%@-%@"), v14, v15);

  }
}

uint64_t __57__SMInitiatorService__sendHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendHeartbeatForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57__SMInitiatorService__sendHeartbeatForSessionID_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)fetchSOSReceiversWithCompletion:(id)a3
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
  v7[2] = __54__SMInitiatorService_fetchSOSReceiversWithCompletion___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __54__SMInitiatorService_fetchSOSReceiversWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSOSReceiversWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchSOSReceiversWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[5];
  id v14;
  SEL v15;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke;
  block[3] = &unk_1E9298E88;
  block[4] = self;
  v8 = v5;
  v14 = v8;
  v15 = a2;
  dispatch_async(v6, block);

  -[SMInitiatorService sessionManager](self, "sessionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_4;
  v11[3] = &unk_1E9299760;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "fetchSOSReceiversWithCompletion:", v11);

}

void __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasSetupObjectsDependentOnPersistenceStack") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dispatcher");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_2;
    v11[3] = &unk_1E9297650;
    v4 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v4;
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_3;
    v9[3] = &unk_1E9297678;
    v5 = *(id *)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enqueueBlock:failureBlock:description:", v11, v9, CFSTR("%@-%@"), v7, v8);

  }
}

uint64_t __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSOSReceiversWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, MEMORY[0x1E0C9AA60], v2);

}

uint64_t __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SMInitiatorService_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __71__SMInitiatorService_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchInitiatorSafetyCacheForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  SMInitiatorService *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v36[5];
  id v37;
  void (**v38)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: completion";
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v7, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v13;
        v43 = 2112;
        v44 = v15;
        v45 = 2112;
        v46 = v16;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching initiator safety cache", buf, 0x20u);

      }
      -[NSObject fetchInitiatorSafetyCacheForSessionID:completion:](v10, "fetchInitiatorSafetyCacheForSessionID:completion:", v7, v9);
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v7, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v23;
        v43 = 2112;
        v44 = v25;
        v45 = 2112;
        v46 = v26;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,No CacheManager found Invalid", buf, 0x20u);

      }
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D8BB70];
      v39 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No CacheManager found Invalid session id"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 7, v30);

      ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v9)[2](v9, 0, 0, 0, 0, 0, v31);
    }
    goto LABEL_17;
  }
  -[SMInitiatorService dispatcher](self, "dispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __72__SMInitiatorService__fetchInitiatorSafetyCacheForSessionID_completion___block_invoke;
  v36[3] = &unk_1E9296F70;
  v36[4] = self;
  v37 = v7;
  v38 = v9;
  v32[0] = v19;
  v32[1] = 3221225472;
  v32[2] = __72__SMInitiatorService__fetchInitiatorSafetyCacheForSessionID_completion___block_invoke_2;
  v32[3] = &unk_1E9298DC0;
  v35 = v38;
  v33 = v37;
  v34 = self;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enqueueBlock:failureBlock:description:", v36, v32, CFSTR("%@-%@"), v21, v22);

LABEL_18:
}

uint64_t __72__SMInitiatorService__fetchInitiatorSafetyCacheForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchInitiatorSafetyCacheForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __72__SMInitiatorService__fetchInitiatorSafetyCacheForSessionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "invocationError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v2 + 16))(v2, v1, 0, 0, 0, 0, v3);

}

- (void)fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching session receipt", buf, 0x20u);

  }
  -[RTNotifier queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SMInitiatorService_fetchSessionReceiptForSessionID_completion___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v18 = v7;
  v19 = v8;
  v15 = v8;
  v16 = v7;
  dispatch_async(v14, block);

}

uint64_t __65__SMInitiatorService_fetchSessionReceiptForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSessionReceiptForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SMSessionReceiptZone *sessionReceiptZone;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  SMCloudKitQosOptions *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  SMInitiatorService *v26;
  id v27;
  SEL v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: sessionID";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_12;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: completion";
    goto LABEL_17;
  }
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    sessionReceiptZone = self->_sessionReceiptZone;
    if (!sessionReceiptZone)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v33 = v12;
        v34 = 2112;
        v35 = v14;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,No _sessionReceiptZone Object found", buf, 0x20u);

      }
      -[SMInitiatorService _initializeSessionReceiptZone](self, "_initializeSessionReceiptZone");
      sessionReceiptZone = self->_sessionReceiptZone;
    }
    v16 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__SMInitiatorService__fetchSessionReceiptForSessionID_completion___block_invoke_216;
    v24[3] = &unk_1E929E628;
    v25 = v7;
    v26 = self;
    v28 = a2;
    v27 = v9;
    -[SMSessionReceiptZone fetchSessionReceiptRecordWithSessionID:qos:completion:](sessionReceiptZone, "fetchSessionReceiptRecordWithSessionID:qos:completion:", v25, v16, v24);

    v17 = v25;
  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __66__SMInitiatorService__fetchSessionReceiptForSessionID_completion___block_invoke;
    v29[3] = &unk_1E9296F70;
    v29[4] = self;
    v30 = v7;
    v31 = v9;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "enqueueBlock:description:", v29, CFSTR("%@-%@"), v22, v23);

    v17 = v30;
  }

LABEL_15:
}

uint64_t __66__SMInitiatorService__fetchSessionReceiptForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSessionReceiptForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __66__SMInitiatorService__fetchSessionReceiptForSessionID_completion___block_invoke_216(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
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
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v7;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session receipt fetch failed with error %@", (uint8_t *)&v18, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v10;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session receipt fetch success", (uint8_t *)&v18, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)scheduledSendMessageScheduledForSessionID:(id)a3 guid:(id)a4 date:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
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
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: guid";
    goto LABEL_12;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: date";
    goto LABEL_12;
  }
  if (!-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74__SMInitiatorService_scheduledSendMessageScheduledForSessionID_guid_date___block_invoke;
    v19[3] = &unk_1E929E650;
    v19[4] = self;
    v20 = v9;
    v21 = v10;
    v22 = v12;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enqueueBlock:description:", v19, CFSTR("%@-%@"), v17, v18);

    goto LABEL_14;
  }
  -[SMInitiatorService sessionManager](self, "sessionManager");
  v13 = objc_claimAutoreleasedReturnValue();
  -[NSObject onScheduledSendMessageScheduledForSessionID:guid:date:](v13, "onScheduledSendMessageScheduledForSessionID:guid:date:", v9, v10, v12);
LABEL_13:

LABEL_14:
}

uint64_t __74__SMInitiatorService_scheduledSendMessageScheduledForSessionID_guid_date___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduledSendMessageScheduledForSessionID:guid:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)scheduledSendMessageCanceledForSessionID:(id)a3 guid:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v11 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    goto LABEL_8;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v11 = "Invalid parameter not satisfying: guid";
    goto LABEL_12;
  }
  if (!-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__SMInitiatorService_scheduledSendMessageCanceledForSessionID_guid___block_invoke;
    v16[3] = &unk_1E9299D78;
    v16[4] = self;
    v17 = v7;
    v18 = v9;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueueBlock:description:", v16, CFSTR("%@-%@"), v14, v15);

    goto LABEL_9;
  }
  -[SMInitiatorService sessionManager](self, "sessionManager");
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSObject onScheduledSendMessageCanceledForSessionID:guid:](v10, "onScheduledSendMessageCanceledForSessionID:guid:", v7, v9);
LABEL_8:

LABEL_9:
}

uint64_t __68__SMInitiatorService_scheduledSendMessageCanceledForSessionID_guid___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduledSendMessageCanceledForSessionID:guid:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)scheduledSendMessageSent:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    if (!-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
    {
      -[SMInitiatorService dispatcher](self, "dispatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __47__SMInitiatorService_scheduledSendMessageSent___block_invoke;
      v11[3] = &unk_1E9297540;
      v11[4] = self;
      v12 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enqueueBlock:description:", v11, CFSTR("%@-%@"), v9, v10);

      goto LABEL_8;
    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject onScheduledSendForSessionID:](v6, "onScheduledSendForSessionID:", v5);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
  }

LABEL_8:
}

uint64_t __47__SMInitiatorService_scheduledSendMessageSent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduledSendMessageSent:", *(_QWORD *)(a1 + 40));
}

- (void)cacheManagerCleanedUpForSessionID:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
    goto LABEL_13;
  }
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SMInitiatorService cacheManagerArray](self, "cacheManagerArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v6);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject sessionUUID](v6, "sessionUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v9;
        v25 = 2112;
        v26 = v11;
        v27 = 2112;
        v28 = v12;
        v13 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,remove SMInitiatorCacheManager";
        v14 = v8;
        v15 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
        _os_log_impl(&dword_1D1A22000, v14, v15, v13, buf, 0x20u);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v9;
        v25 = 2112;
        v26 = v11;
        v27 = 2112;
        v28 = v12;
        v13 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,no SMInitiatorCacheManager to remove";
        v14 = v8;
        v15 = OS_LOG_TYPE_INFO;
        goto LABEL_11;
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  -[SMInitiatorService dispatcher](self, "dispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__SMInitiatorService_cacheManagerCleanedUpForSessionID___block_invoke;
  v21[3] = &unk_1E9297540;
  v21[4] = self;
  v22 = v5;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enqueueBlock:description:", v21, CFSTR("%@-%@"), v18, v19);

LABEL_14:
}

uint64_t __56__SMInitiatorService_cacheManagerCleanedUpForSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacheManagerCleanedUpForSessionID:", *(_QWORD *)(a1 + 40));
}

- (void)iMessageGroupMembershipChangedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,responding to change in group membership", (uint8_t *)&v11, 0x16u);

    }
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject iMessageGroupMembershipChangedFor:](v10, "iMessageGroupMembershipChangedFor:", v5);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", (uint8_t *)&v11, 2u);
    }
  }

}

- (void)iMessageGroupDisplayNameChangedFor:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject iMessageGroupDisplayNameChangedFor:](v5, "iMessageGroupDisplayNameChangedFor:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", v6, 2u);
    }
  }

}

- (void)kickedFromIMessageGroupWith:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject kickedFromIMessageGroupWith:](v5, "kickedFromIMessageGroupWith:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", v6, 2u);
    }
  }

}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SMInitiatorService_onSessionStateChanged_forActiveDevice___block_invoke;
  block[3] = &unk_1E9297D30;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __60__SMInitiatorService_onSessionStateChanged_forActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStateChanged:forActiveDevice:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  char *v36;
  objc_class *v37;
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
  uint64_t v50;
  SMMessagingService *messagingService;
  RTNetworkOfInterestManager *networkOfInterestManager;
  RTAuthorizationManager *authorizationManager;
  RTWatchWristStateManager *wristStateManager;
  RTVehicleLocationProvider *vehicleLocationProvider;
  SMActiveSessionZone *activeSessionDetailsZone;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  objc_class *v66;
  char *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  char *v71;
  objc_class *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  RTAuthorizationManager *v76;
  uint64_t v77;
  uint64_t v78;
  const char *aSelector;
  RTXPCActivityManager *xpcActivityManager;
  RTBatteryManager *batteryManager;
  void *v82;
  RTLocationManager *locationManager;
  RTDefaultsManager *defaultsManager;
  SMSessionStore *sessionStore;
  SMSafetyCacheStore *safetyCacheStore;
  id v87;
  uint64_t v88;
  void *v89;
  SMInitiatorCacheManager *v90;
  _QWORD v91[5];
  NSObject *v92;
  BOOL v93;
  uint8_t buf[4];
  const char *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  NSObject *v101;
  uint64_t v102;
  _QWORD v103[3];

  v4 = a4;
  v103[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    if (v4)
    {
      if (-[NSObject sessionState](v7, "sessionState") == 1)
      {
        -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sessionID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject configuration](v7, "configuration");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sessionID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "isEqual:", v13);

          if (v14)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v95 = "-[SMInitiatorService _onSessionStateChanged:forActiveDevice:]";
              v96 = 2112;
              v97 = v16;
              _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "%s, responding to previous initialization request %@", buf, 0x16u);

            }
            v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v18 = *MEMORY[0x1E0D8BB70];
            v102 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transitioned to NotActive for unknown reason"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v103[0] = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, &v102, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 0, v20);

            -[SMInitiatorService pendingInitializationRequest](self, "pendingInitializationRequest");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "handler");
            v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v23)[2](v23, 0, 0, 0, v21);

            -[SMInitiatorService setPendingInitializationRequest:](self, "setPendingInitializationRequest:", 0);
          }
        }
      }
      v24 = -[NSObject sessionState](v7, "sessionState");
      -[NSObject configuration](v7, "configuration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sessionID");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v24 != 10)
      {
        -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v26);
        v29 = objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          if ((-[NSObject isEndSessionState](v7, "isEndSessionState") & 1) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              -[NSObject configuration](v7, "configuration");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "sessionID");
              v71 = (char *)objc_claimAutoreleasedReturnValue();
              v72 = (objc_class *)objc_opt_class();
              NSStringFromClass(v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = -[SMInitiatorService sessionsLoadedFromDisk](self, "sessionsLoadedFromDisk");
              *(_DWORD *)buf = 138413058;
              v95 = v71;
              v96 = 2112;
              v97 = v73;
              v98 = 2112;
              v99 = v74;
              v100 = 1024;
              LODWORD(v101) = v75;
              _os_log_error_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,loaded,%d,could not find SMInitiatorCacheManager", buf, 0x26u);

            }
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              v66 = (objc_class *)objc_opt_class();
              NSStringFromClass(v66);
              v67 = (char *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = -[SMInitiatorService sessionsLoadedFromDisk](self, "sessionsLoadedFromDisk");
              *(_DWORD *)buf = 138412802;
              v95 = v67;
              v96 = 2112;
              v97 = v68;
              v98 = 1024;
              LODWORD(v99) = v69;
              _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,loaded,%d,SMInitiatorCacheManager does not exist", buf, 0x1Cu);

            }
            goto LABEL_24;
          }
          v29 = 0;
        }
LABEL_23:
        -[NSObject onSessionStateChanged:forActiveDevice:](v29, "onSessionStateChanged:forActiveDevice:", v7, v4);
        -[SMInitiatorService handleSessionStateForNonActiveSessions:](self, "handleSessionStateForNonActiveSessions:", v7);
LABEL_24:

        goto LABEL_25;
      }
      -[NSObject configuration](v7, "configuration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "conversation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorService _createInitiatorCacheManagerForSessionID:conversation:](self, "_createInitiatorCacheManagerForSessionID:conversation:", v26, v28);
      v29 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject configuration](v7, "configuration");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "sessionID");
        v36 = (char *)objc_claimAutoreleasedReturnValue();
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v95 = v36;
        v96 = 2112;
        v97 = v38;
        v98 = 2112;
        v99 = v39;
        v100 = 2112;
        v101 = v7;
        _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,not active device transition state, %@", buf, 0x2Au);

      }
      -[NSObject configuration](v7, "configuration");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "sessionID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v41);
      v29 = objc_claimAutoreleasedReturnValue();

      if (!-[NSObject isActiveState](v7, "isActiveState") || v29)
        goto LABEL_23;
      aSelector = a2;
      v87 = objc_alloc(MEMORY[0x1E0D8B968]);
      v42 = (void *)objc_opt_new();
      -[NSObject configuration](v7, "configuration");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "conversation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject configuration](v7, "configuration");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sessionID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject safetyCacheKey](v7, "safetyCacheKey");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject allowReadToken](v7, "allowReadToken");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject scheduledSendMessageGUID](v7, "scheduledSendMessageGUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_opt_new();
      LOBYTE(v78) = 1;
      LOWORD(v77) = 0;
      v88 = objc_msgSend(v87, "initWithIdentifier:conversation:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:", v42, v43, 0, 0, 0, 0, -1.0, -1.0, -1.0,
              0,
              0,
              0,
              v45,
              v46,
              v47,
              v48,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              -1,
              -1,
              -1,
              -1,
              -1,
              -1,
              -1,
              v77,
              0,
              0,
              v78,
              0,
              v49,
              0,
              0,
              0,
              0);

      v90 = [SMInitiatorCacheManager alloc];
      sessionStore = self->_sessionStore;
      safetyCacheStore = self->_safetyCacheStore;
      defaultsManager = self->_defaultsManager;
      locationManager = self->_locationManager;
      -[RTNotifier queue](self, "queue");
      v50 = objc_claimAutoreleasedReturnValue();
      batteryManager = self->_batteryManager;
      v82 = (void *)v50;
      xpcActivityManager = self->_xpcActivityManager;
      messagingService = self->_messagingService;
      networkOfInterestManager = self->_networkOfInterestManager;
      authorizationManager = self->_authorizationManager;
      wristStateManager = self->_wristStateManager;
      vehicleLocationProvider = self->_vehicleLocationProvider;
      activeSessionDetailsZone = self->_activeSessionDetailsZone;
      -[SMInitiatorService healthKitManager](self, "healthKitManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorService platform](self, "platform");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = authorizationManager;
      v25 = (void *)v88;
      v29 = -[SMInitiatorCacheManager initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:](v90, "initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:", v88, 0, safetyCacheStore, sessionStore, defaultsManager, locationManager, v82, batteryManager, xpcActivityManager, messagingService, networkOfInterestManager, v76, wristStateManager, vehicleLocationProvider, activeSessionDetailsZone,
              v57,
              v58);

      -[NSObject setDelegate:](v29, "setDelegate:", self);
      -[NSObject _setupFetchOnZoneUpdates](v29, "_setupFetchOnZoneUpdates");
      -[SMInitiatorService cacheManagerArray](self, "cacheManagerArray");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObject:", v29);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject configuration](v7, "configuration");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "sessionID");
        v61 = (char *)objc_claimAutoreleasedReturnValue();
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v95 = v61;
        v96 = 2112;
        v97 = v63;
        v98 = 2112;
        v99 = v64;
        v100 = 2112;
        v101 = v29;
        _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,created non-active cache manager, %@", buf, 0x2Au);

      }
      v4 = 0;
    }

    goto LABEL_23;
  }
  -[SMInitiatorService dispatcher](self, "dispatcher");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __61__SMInitiatorService__onSessionStateChanged_forActiveDevice___block_invoke;
  v91[3] = &unk_1E9297D30;
  v91[4] = self;
  v92 = v7;
  v93 = v4;
  v31 = (objc_class *)objc_opt_class();
  NSStringFromClass(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "enqueueBlock:description:", v91, CFSTR("%@-%@"), v32, v33);

LABEL_25:
}

uint64_t __61__SMInitiatorService__onSessionStateChanged_forActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStateChanged:forActiveDevice:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SMInitiatorService_onSessionResumedWithState_forActiveDevice___block_invoke;
  block[3] = &unk_1E9297D30;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __64__SMInitiatorService_onSessionResumedWithState_forActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionResumedWithState:forActiveDevice:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  char *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  char *v23;
  void *v24;
  _BOOL4 v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[SMInitiatorService setSessionManagerBootstrapped:](self, "setSessionManagerBootstrapped:", 1);
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || (objc_msgSend(v7, "isEndSessionState") & 1) != 0)
  {
    objc_msgSend(v10, "onSessionResumedWithState:forActiveDevice:", v7, v4);
    -[SMInitiatorService handleSessionStateForNonActiveSessions:](self, "handleSessionStateForNonActiveSessions:", v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sessionID");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138413058;
      v27 = v18;
      v28 = 2112;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      v32 = 1024;
      v33 = -[SMInitiatorService sessionsLoadedFromDisk](self, "sessionsLoadedFromDisk");
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,loaded,%d,could not find SMInitiatorCacheManager", (uint8_t *)&v26, 0x26u);

    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[SMInitiatorService sessionsLoadedFromDisk](self, "sessionsLoadedFromDisk");
      v26 = 138412802;
      v27 = v23;
      v28 = 2112;
      v29 = v24;
      v30 = 1024;
      LODWORD(v31) = v25;
      _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,loaded,%d,SMInitiatorCacheManager does not exist", (uint8_t *)&v26, 0x1Cu);

    }
  }
  -[SMInitiatorService dispatcher](self, "dispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "invocationsPending");

  if (v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v26 = 136315138;
      v27 = "-[SMInitiatorService _onSessionResumedWithState:forActiveDevice:]";
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, dispatching work on SMInitiatorService queue", (uint8_t *)&v26, 0xCu);
    }

    -[SMInitiatorService dispatcher](self, "dispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dispatchPendingInvocations");

  }
}

- (void)handleSessionStateForNonActiveSessions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SMInitiatorService cacheManagerArray](self, "cacheManagerArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v24;
    *(_QWORD *)&v7 = 138412802;
    v21 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        objc_msgSend(v4, "configuration", v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sessionID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sessionUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) == 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "sessionUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v28 = v17;
            v29 = 2112;
            v30 = v19;
            v31 = 2112;
            v32 = v20;
            _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanup this non active session", buf, 0x20u);

          }
          objc_msgSend(v11, "cleanupNonActiveSession");
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v8);
  }

}

- (void)onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SMInitiatorService_onSecondarySOSTriggerWithState_forActiveDevice___block_invoke;
  block[3] = &unk_1E9297D30;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __69__SMInitiatorService_onSecondarySOSTriggerWithState_forActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSecondarySOSTriggerWithState:forActiveDevice:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
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
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    if (objc_msgSend(v7, "sessionState") == 4)
    {
      objc_msgSend(v8, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "onSecondarySOSTriggerWithState:forActiveDevice:", v8, 1);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,not active device transition state, %@", (uint8_t *)&v18, 0x2Au);

    }
  }

}

- (void)onBecomingActiveDevice:(id)a3
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
  v7[2] = __45__SMInitiatorService_onBecomingActiveDevice___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __45__SMInitiatorService_onBecomingActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBecomingActiveDevice:", *(_QWORD *)(a1 + 40));
}

- (void)_onBecomingActiveDevice:(id)a3
{
  id v5;
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
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v5, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService _createInitiatorCacheManagerForSessionID:conversation:](self, "_createInitiatorCacheManagerForSessionID:conversation:", v10, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "onBecomingActiveDevice:", v5);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "sessionUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v14;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,notify cache manager to become active", (uint8_t *)&v18, 0x20u);

  }
}

- (void)onBecomingNonActiveDevice:(id)a3
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
  v7[2] = __48__SMInitiatorService_onBecomingNonActiveDevice___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__SMInitiatorService_onBecomingNonActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBecomingNonActiveDevice:", *(_QWORD *)(a1 + 40));
}

- (void)_onBecomingNonActiveDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorService getCacheManagerForSessionID:](self, "getCacheManagerForSessionID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "sessionUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v19;
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,becoming non-active but there is no cache manager,creating one...", (uint8_t *)&v23, 0x20u);

    }
    objc_msgSend(v5, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMInitiatorService _createInitiatorCacheManagerForSessionID:conversation:](self, "_createInitiatorCacheManagerForSessionID:conversation:", v11, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "onBecomingNonActiveDevice:", v5);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "sessionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v15;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,notify cache manager to become non-active", (uint8_t *)&v23, 0x20u);

  }
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[RTNotifier queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__SMInitiatorService_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke;
  block[3] = &unk_1E9297F08;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __101__SMInitiatorService_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (-[SMInitiatorService _hasSetupObjectsDependentOnPersistenceStack](self, "_hasSetupObjectsDependentOnPersistenceStack"))
  {
    -[SMInitiatorService sessionManager](self, "sessionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:", v11, v12, v13, v14);

  }
  else
  {
    -[SMInitiatorService dispatcher](self, "dispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __102__SMInitiatorService__respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke;
    v20[3] = &unk_1E9297F08;
    v20[4] = self;
    v21 = v11;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enqueueBlock:description:", v20, CFSTR("%@-%@"), v18, v19);

  }
}

uint64_t __102__SMInitiatorService__respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (id)convertEligibilityToSMErrorWithInitiator:(int64_t)a3 receiver:(int64_t)a4
{
  int64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    if (a4 == 1)
      return 0;
    v5 = -[SMInitiatorService convertReceiverEligibilityToSMError:](self, "convertReceiverEligibilityToSMError:", a4);
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = *MEMORY[0x1E0D8BB70];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Receiver eligibility failure"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v15;
    v11 = &v14;
  }
  else
  {
    v5 = -[SMInitiatorService convertInitiatorEligibilityToSMError:](self, "convertInitiatorEligibilityToSMError:", a3, a4);
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = *MEMORY[0x1E0D8BB70];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initiator eligibility failure"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = (void **)v17;
    v11 = &v16;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, v5, v12);

  return v13;
}

- (int64_t)convertInitiatorEligibilityToSMError:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0xA)
    return 25;
  else
    return qword_1D1EED6D8[a3 - 2];
}

- (int64_t)convertReceiverEligibilityToSMError:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 6)
    return 34;
  else
    return a3 + 33;
}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SMSessionMetricManager *sessionMetricManager;
  uint8_t v13[16];

  v4 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Shutdown Initiator Service", v13, 2u);
  }

  -[SMInitiatorService sessionStore](self, "sessionStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[SMInitiatorService safetyCacheStore](self, "safetyCacheStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[SMInitiatorService sessionManager](self, "sessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  -[SMInitiatorService dispatcher](self, "dispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shutdown");

  -[SMInitiatorService messagingService](self, "messagingService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  -[SMInitiatorService healthKitManager](self, "healthKitManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", self);

  sessionMetricManager = self->_sessionMetricManager;
  self->_sessionMetricManager = 0;

  v4[2](v4, 0);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (SMSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)fetchAllZonesRetried
{
  return self->_fetchAllZonesRetried;
}

- (void)setFetchAllZonesRetried:(BOOL)a3
{
  self->_fetchAllZonesRetried = a3;
}

- (BOOL)frequentSingleShotFetchAllZonesInProgress
{
  return self->_frequentSingleShotFetchAllZonesInProgress;
}

- (void)setFrequentSingleShotFetchAllZonesInProgress:(BOOL)a3
{
  self->_frequentSingleShotFetchAllZonesInProgress = a3;
}

- (BOOL)fetchAllZonesFromContainerInProgress
{
  return self->_fetchAllZonesFromContainerInProgress;
}

- (void)setFetchAllZonesFromContainerInProgress:(BOOL)a3
{
  self->_fetchAllZonesFromContainerInProgress = a3;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (void)setLocationAwarenessManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationAwarenessManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (SMSessionMonitor)sessionMonitor
{
  return self->_sessionMonitor;
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (RTNetworkOfInterestManager)networkOfInterestManager
{
  return self->_networkOfInterestManager;
}

- (NSMutableArray)cacheManagerArray
{
  return self->_cacheManagerArray;
}

- (void)setCacheManagerArray:(id)a3
{
  objc_storeStrong((id *)&self->_cacheManagerArray, a3);
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (unint64_t)safetyCacheStoreAvailability
{
  return self->_safetyCacheStoreAvailability;
}

- (void)setSafetyCacheStoreAvailability:(unint64_t)a3
{
  self->_safetyCacheStoreAvailability = a3;
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (unint64_t)sessionStoreAvailability
{
  return self->_sessionStoreAvailability;
}

- (void)setSessionStoreAvailability:(unint64_t)a3
{
  self->_sessionStoreAvailability = a3;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (SMDeviceConfigurationChecker)deviceConfigurationChecker
{
  return self->_deviceConfigurationChecker;
}

- (BOOL)sessionsLoadedFromDisk
{
  return self->_sessionsLoadedFromDisk;
}

- (void)setSessionsLoadedFromDisk:(BOOL)a3
{
  self->_sessionsLoadedFromDisk = a3;
}

- (BOOL)sessionManagerBootstrapped
{
  return self->_sessionManagerBootstrapped;
}

- (void)setSessionManagerBootstrapped:(BOOL)a3
{
  self->_sessionManagerBootstrapped = a3;
}

- (SMSessionReceiptZone)sessionReceiptZone
{
  return self->_sessionReceiptZone;
}

- (void)setSessionReceiptZone:(id)a3
{
  objc_storeStrong((id *)&self->_sessionReceiptZone, a3);
}

- (SMInitiatorSessionInitializationRequest)pendingInitializationRequest
{
  return self->_pendingInitializationRequest;
}

- (void)setPendingInitializationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInitializationRequest, a3);
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (RTStarkManager)starkManager
{
  return self->_starkManager;
}

- (SMSuggestionsManager)suggestionsManager
{
  return self->_suggestionsManager;
}

- (SMSuggestionsHelper)suggestionsHelper
{
  return self->_suggestionsHelper;
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (SMWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
  objc_storeStrong((id *)&self->_watchdog, a3);
}

- (SMActiveSessionZone)activeSessionDetailsZone
{
  return self->_activeSessionDetailsZone;
}

- (void)setActiveSessionDetailsZone:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessionDetailsZone, a3);
}

- (NSTimer)workoutSessionEndBufferTimerAlarm
{
  return self->_workoutSessionEndBufferTimerAlarm;
}

- (void)setWorkoutSessionEndBufferTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_workoutSessionEndBufferTimerAlarm, a3);
}

- (SMCMNoMovementMonitor)noMovementMonitor
{
  return self->_noMovementMonitor;
}

- (void)setNoMovementMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_noMovementMonitor, a3);
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_noMovementMonitor, 0);
  objc_storeStrong((id *)&self->_workoutSessionEndBufferTimerAlarm, 0);
  objc_storeStrong((id *)&self->_activeSessionDetailsZone, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_suggestionsHelper, 0);
  objc_storeStrong((id *)&self->_suggestionsManager, 0);
  objc_storeStrong((id *)&self->_starkManager, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_pendingInitializationRequest, 0);
  objc_storeStrong((id *)&self->_sessionReceiptZone, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationChecker, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_batteryManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong((id *)&self->_cacheManagerArray, 0);
  objc_storeStrong((id *)&self->_networkOfInterestManager, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_sessionMonitor, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
