@implementation RTAuthorizedLocationManager

- (RTAuthorizedLocationManager)initWithVisitManager:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 learnedLocationManager:(id)a6 motionActivityManager:(id)a7 visitLogStore:(id)a8 defaultsManager:(id)a9 xpcActivityManager:(id)a10 dataProtectionManager:(id)a11 persistenceMirroringManager:(id)a12 platform:(id)a13 authorizationManager:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  RTAuthorizedLocationManager *v37;
  RTAuthorizedLocationManager *v38;
  NSArray *v39;
  NSArray *authorizedLocationArr;
  uint64_t v41;
  NSDate *dateOfLastAuthorizedLocationsCuration;
  RTAuthorizedLocationStatus *overrideAuthorizedLocationStatus;
  RTTrustedTimeCache *v44;
  RTTrustedTimeCache *trustedTimeCache;
  RTAuthorizedLocationMetrics *v46;
  void *v47;
  uint64_t v48;
  RTAuthorizedLocationMetrics *metrics;
  RTAuthorizedLocationBiometricsManager *v50;
  RTAuthorizedLocationBiometricsManager *biometricsManager;
  uint64_t v52;
  NSDate *mostRecentDateAtWhichDeviceDataIsTrusted;
  RTXPCActivityCriteria *eraseInstallInitializationXpcCriteria;
  NSDate *eraseInstallInitializationStartDate;
  id v58;
  id v59;
  id v60;
  id v61;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  int v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v58 = a4;
  v20 = a4;
  v59 = a5;
  v21 = a5;
  v60 = a6;
  v22 = a6;
  v61 = a7;
  v23 = a7;
  v69 = a8;
  v68 = a9;
  v67 = a10;
  v66 = a11;
  v65 = a12;
  v64 = a13;
  v63 = a14;
  v24 = v19;
  if (v19)
  {
    if (v20)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 141;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitManager (in %s:%d)", buf, 0x12u);
    }

    if (v20)
    {
LABEL_3:
      if (v21)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager:m"
          "otionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMirrori"
          "ngManager:platform:authorizationManager:]";
    v73 = 1024;
    v74 = 142;
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
  }

  if (v21)
  {
LABEL_4:
    if (v22)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_13:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager:m"
          "otionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMirrori"
          "ngManager:platform:authorizationManager:]";
    v73 = 1024;
    v74 = 143;
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
  }

  if (v22)
  {
LABEL_5:
    if (v23)
      goto LABEL_22;
    goto LABEL_19;
  }
LABEL_16:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager:m"
          "otionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMirrori"
          "ngManager:platform:authorizationManager:]";
    v73 = 1024;
    v74 = 144;
    _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager (in %s:%d)", buf, 0x12u);
  }

  if (!v23)
  {
LABEL_19:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 145;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: motionActivityManager (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_22:
  if (!v69)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 146;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitLogStore (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v68)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 147;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v67)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 148;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v66)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 149;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataProtectionManager (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v65)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 150;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceMirroringManager (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v64)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 151;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v63)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      v73 = 1024;
      v74 = 152;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager (in %s:%d)", buf, 0x12u);
    }

  }
  v70.receiver = self;
  v70.super_class = (Class)RTAuthorizedLocationManager;
  v37 = -[RTNotifier init](&v70, sel_init);
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_platform, a13);
    v38->_isSupportedDevice = -[RTPlatform iPhoneDevice](v38->_platform, "iPhoneDevice");
    objc_storeStrong((id *)&v38->_authorizationManager, a14);
    objc_storeStrong((id *)&v38->_visitManager, a3);
    objc_storeStrong((id *)&v38->_locationManager, v58);
    objc_storeStrong((id *)&v38->_distanceCalculator, v59);
    objc_storeStrong((id *)&v38->_learnedLocationManager, v60);
    objc_storeStrong((id *)&v38->_motionActivityManager, v61);
    v39 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    authorizedLocationArr = v38->_authorizedLocationArr;
    v38->_authorizedLocationArr = v39;

    objc_storeStrong((id *)&v38->_visitLogStore, a8);
    objc_storeStrong((id *)&v38->_defaultsManager, a9);
    objc_storeStrong((id *)&v38->_xpcActivityManager, a10);
    objc_storeStrong((id *)&v38->_dataProtectionManager, a11);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v41 = objc_claimAutoreleasedReturnValue();
    dateOfLastAuthorizedLocationsCuration = v38->_dateOfLastAuthorizedLocationsCuration;
    v38->_dateOfLastAuthorizedLocationsCuration = (NSDate *)v41;

    overrideAuthorizedLocationStatus = v38->_overrideAuthorizedLocationStatus;
    v38->_overrideAuthorizedLocationStatus = 0;

    v38->_relaxTrustedTimeRequirement = 0;
    v38->_isEraseInstallDatabaseInitializationRequired = 0;
    v38->_isUnlockedSinceBoot = 0;
    v44 = objc_alloc_init(RTTrustedTimeCache);
    trustedTimeCache = v38->_trustedTimeCache;
    v38->_trustedTimeCache = v44;

    v38->_allowUnsecureTimeFallback = 0;
    v38->_forceTrustedTimeUnavailability = 0;
    v46 = [RTAuthorizedLocationMetrics alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[RTAuthorizedLocationMetrics initWithDaemonStartDate:](v46, "initWithDaemonStartDate:", v47);
    metrics = v38->_metrics;
    v38->_metrics = (RTAuthorizedLocationMetrics *)v48;

    -[RTAuthorizedLocationMetrics setLocationServicesEnabled:](v38->_metrics, "setLocationServicesEnabled:", objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"));
    -[RTAuthorizedLocationMetrics setRoutineEnabled:](v38->_metrics, "setRoutineEnabled:", -[RTAuthorizedLocationManager _isRoutineEnabled](v38, "_isRoutineEnabled"));
    v50 = -[RTAuthorizedLocationBiometricsManager initWithTrustedTimeCache:defaultsManager:]([RTAuthorizedLocationBiometricsManager alloc], "initWithTrustedTimeCache:defaultsManager:", v38->_trustedTimeCache, v38->_defaultsManager);
    biometricsManager = v38->_biometricsManager;
    v38->_biometricsManager = v50;

    v24 = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v52 = objc_claimAutoreleasedReturnValue();
    mostRecentDateAtWhichDeviceDataIsTrusted = v38->_mostRecentDateAtWhichDeviceDataIsTrusted;
    v38->_mostRecentDateAtWhichDeviceDataIsTrusted = (NSDate *)v52;

    objc_storeStrong((id *)&v38->_persistenceMirroringManager, a12);
    eraseInstallInitializationXpcCriteria = v38->_eraseInstallInitializationXpcCriteria;
    v38->_eraseInstallInitializationXpcCriteria = 0;

    v38->_eraseInstallDatabaseInitializationMaxAttemptCount = 0;
    v38->_eraseInstallDatabaseInitializationAttemptCount = 0;
    eraseInstallInitializationStartDate = v38->_eraseInstallInitializationStartDate;
    v38->_eraseInstallInitializationStartDate = 0;

    -[RTService setup](v38, "setup");
  }

  return v38;
}

- (void)_setup
{
  if (self->_isSupportedDevice)
  {
    -[RTAuthorizedLocationManager _checkConfiguration](self, "_checkConfiguration");
    -[RTAuthorizedLocationManager _loadEraseInstallInitializationXPCCriteriaFromDefaults](self, "_loadEraseInstallInitializationXPCCriteriaFromDefaults");
    -[RTAuthorizedLocationManager _setupVisitLogActivity](self, "_setupVisitLogActivity");
    -[RTAuthorizedLocationManager _registerForDeviceUnlockNotification](self, "_registerForDeviceUnlockNotification");
  }
}

- (BOOL)_isRoutineEnabled
{
  dispatch_semaphore_t v3;
  RTAuthorizationManager *authorizationManager;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint8_t buf[8];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  authorizationManager = self->_authorizationManager;
  v29 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __48__RTAuthorizedLocationManager__isRoutineEnabled__block_invoke;
  v23[3] = &unk_1E929BB30;
  v25 = &v26;
  v5 = v3;
  v24 = v5;
  -[RTAuthorizationManager fetchRoutineEnabledWithHandler:](authorizationManager, "fetchRoutineEnabledWithHandler:", v23);
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v7);
    v11 = v10;
    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "submitToCoreAnalytics:type:duration:", v16, 1, v11);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
  }

  v21 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v21;
}

intptr_t __48__RTAuthorizedLocationManager__isRoutineEnabled__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_checkConfiguration
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    -[RTAuthorizedLocationManager _checkStatusOverrideDefault](self, "_checkStatusOverrideDefault");
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsAuthorizedLocationRelaxTrustedTimeRequirement"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_relaxTrustedTimeRequirement = objc_msgSend(v4, "BOOLValue");

    if (self->_relaxTrustedTimeRequirement)
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@:%@, WARNING, defaults set to relax trusted time requirement (not requiring user time and trusted time to align).", (uint8_t *)&v17, 0x16u);

      }
    }
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsAuthorizedLocationForceTrustedTimeUnavailability"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_forceTrustedTimeUnavailability = objc_msgSend(v6, "BOOLValue");

    if (self->_forceTrustedTimeUnavailability)
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@:%@, WARNING, defaults set to force trusted time to be unavailable.", (uint8_t *)&v17, 0x16u);

      }
    }
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityAttemptCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityAttemptCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_eraseInstallDatabaseInitializationAttemptCount = objc_msgSend(v9, "integerValue");

  }
  -[RTAuthorizedLocationManager visitLogStore](self, "visitLogStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_allowUnsecureTimeFallback = objc_msgSend(v10, "wasTrustedTimeRecentlyAvailable") ^ 1;

}

- (BOOL)_isExpeditedSyncAndLearnRequired
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  void *v10;
  unint64_t eraseInstallDatabaseInitializationAttemptCount;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  RTDefaultsManager *defaultsManager;
  void *v19;
  RTDefaultsManager *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[RTAuthorizedLocationManager visitLogStore](self, "visitLogStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getEraseInstallRetroRegistrationStatus");

  if (v5 == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, expedited sync not required as it has already run.", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        eraseInstallDatabaseInitializationAttemptCount = self->_eraseInstallDatabaseInitializationAttemptCount;
        v23 = 138412802;
        v24 = v9;
        v25 = 2112;
        v26 = v10;
        v27 = 1024;
        v28 = eraseInstallDatabaseInitializationAttemptCount;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, expedited sync is required, and current running, attempt %d.", (uint8_t *)&v23, 0x1Cu);

      }
    }
    else
    {
      if (v7)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, initiating first expedited sync attempt, storing start date.", (uint8_t *)&v23, 0x16u);

      }
      self->_eraseInstallDatabaseInitializationAttemptCount = 0;
      defaultsManager = self->_defaultsManager;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", v19, CFSTR("RTAuthorizedLocationEraseInstallInitActivityAttemptCount"));

      v20 = self->_defaultsManager;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDefaultsManager setObject:forKey:](v20, "setObject:forKey:", v21, CFSTR("RTAuthorizedLocationEraseInstallInitActivityStartDate"));

      -[RTAuthorizedLocationManager visitLogStore](self, "visitLogStore");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject setEraseInstallRetroRegistrationStatus:](v6, "setEraseInstallRetroRegistrationStatus:", 1);
    }
  }

  return v5 != 2;
}

- (void)_checkStatusOverrideDefault
{
  void *v4;
  id v5;
  RTAuthorizedLocationStatus *v6;
  RTAuthorizedLocationStatus *overrideAuthorizedLocationStatus;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const char *v12;
  RTAuthorizedLocationStatus *v13;
  RTAuthorizedLocationStatus *v14;
  RTAuthorizedLocationStatus *v15;
  objc_class *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsAuthorizedLocationStatusOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("Confirmed")))
      {
        v6 = (RTAuthorizedLocationStatus *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18340]), "initWithStatus:", 2);
        overrideAuthorizedLocationStatus = self->_overrideAuthorizedLocationStatus;
        self->_overrideAuthorizedLocationStatus = v6;

        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = v10;
          v19 = 2112;
          v20 = v11;
          v12 = "%@:%@, WARNING, using defaults override of status with RTAuthorizedLocationEnumIsConfirmedAtAuthorizedLocation";
LABEL_13:
          _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v17, 0x16u);

        }
      }
      else
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("NotConfirmed")))
        {
LABEL_10:

          goto LABEL_11;
        }
        v14 = (RTAuthorizedLocationStatus *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18340]), "initWithStatus:", 1);
        v15 = self->_overrideAuthorizedLocationStatus;
        self->_overrideAuthorizedLocationStatus = v14;

        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = v10;
          v19 = 2112;
          v20 = v11;
          v12 = "%@:%@, WARNING, using defaults override of status with RTAuthorizedLocationEnumIsNotConfirmedAtAuthorizedLocation";
          goto LABEL_13;
        }
      }

      goto LABEL_10;
    }
  }
  v13 = self->_overrideAuthorizedLocationStatus;
  self->_overrideAuthorizedLocationStatus = 0;

LABEL_11:
}

- (void)_setupVisitLogActivity
{
  RTXPCActivityCriteria *v4;
  RTXPCActivityManager *xpcActivityManager;
  uint64_t v6;
  _QWORD v7[6];

  LOBYTE(v6) = 1;
  v4 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:", 1, 0, 0, 0, 0, 1, 3600.0, 900.0, 900.0, v6, 0);
  xpcActivityManager = self->_xpcActivityManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke;
  v7[3] = &unk_1E929BB80;
  v7[4] = self;
  v7[5] = a2;
  -[RTXPCActivityManager registerActivityWithIdentifier:criteria:handler:](xpcActivityManager, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.authorizedLocation.maintenance"), v4, v7);

}

void __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = CFSTR("com.apple.routined.authorizedLocation.maintenance");
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, Begin XPC Activity: %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke_27;
  block[3] = &unk_1E9298E88;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v13 = v3;
  v14 = v10;
  block[4] = v9;
  v11 = v3;
  dispatch_async(v8, block);

}

void __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke_27(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "trustedTimeNow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateMostRecentDateAtWhichDeviceDataIsTrusted");
  v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke_2;
  v9[3] = &unk_1E929BB58;
  v4 = *(_QWORD *)(a1 + 48);
  v9[4] = v3;
  v9[5] = v4;
  objc_msgSend(v3, "_updateVisitLogWithTrustedTime:isRetroRegistrationTime:handler:", v2, 0, v9);
  objc_msgSend(*(id *)(a1 + 32), "_updateReferenceTimeBoundsFromVisitLog");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = CFSTR("com.apple.routined.authorizedLocation.maintenance");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@, End XPC Activity: %@", buf, 0x20u);

  }
}

void __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
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
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, error registering visits via XPC Activity: %@.", (uint8_t *)&v14, 0x20u);

    }
  }
  else if (v7)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    v18 = 1026;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, successfully registered %{public}d visits via XPC Activity.", (uint8_t *)&v14, 0x1Cu);

  }
}

- (BOOL)_loadEraseInstallInitializationXPCCriteriaFromDefaults
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  RTXPCActivityCriteria *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  unint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  _BOOL4 v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  unint64_t eraseInstallDatabaseInitializationMaxAttemptCount;
  void *v59;
  BOOL v60;
  RTXPCActivityCriteria *eraseInstallInitializationXpcCriteria;
  uint64_t v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  _BYTE v71[14];
  __int16 v72;
  void *v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityMaxAttemptCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityMaxAttemptCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = 25;
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityIntervalSeconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityIntervalSeconds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

  }
  else
  {
    v10 = 3600.0;
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityGracePeriodSeconds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityGracePeriodSeconds"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    v15 = v14;
  }
  else
  {
    v15 = 900.0;
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityDelaySeconds"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityDelaySeconds"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;

  }
  else
  {
    v19 = 7200.0;
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityPriority"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityPriority"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    if (v22 == 1)
      v23 = 1;
    else
      v23 = 2;
  }
  else
  {
    v23 = 2;
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityInexpensiveConnectivity"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityInexpensiveConnectivity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

  }
  else
  {
    v26 = 1;
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityAllowBattery"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityAllowBattery"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLValue");

  }
  else
  {
    v29 = 1;
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityUploadSize"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityUploadSize"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v31, "integerValue");

  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityDownloadSize"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityDownloadSize"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v33, "integerValue");

  }
  if (self->_eraseInstallDatabaseInitializationAttemptCount > 1)
    v19 = v10;
  LOBYTE(v63) = 1;
  v34 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:", v23, 1, v26, v30, v32, v29, v10, v15, v19, v63, 0);
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTXPCActivityCriteria description](v34, "description");
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v65 = v37;
    v66 = 2112;
    v67 = v38;
    v68 = 2112;
    v69 = v39;
    v70 = 1026;
    *(_DWORD *)v71 = v6;
    *(_WORD *)&v71[4] = 2112;
    *(_QWORD *)&v71[6] = CFSTR("com.apple.routined.authorizedLocation.maintenance");
    _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@, Loaded XPC activity criteria, %@, maxAttemptCount, %{public}d, for activity, %@", buf, 0x30u);

  }
  v40 = 0x1ED938000uLL;
  if (!self->_eraseInstallInitializationXpcCriteria)
    goto LABEL_43;
  -[RTXPCActivityCriteria interval](v34, "interval");
  v42 = v41;
  -[RTXPCActivityCriteria interval](self->_eraseInstallInitializationXpcCriteria, "interval");
  if (v42 != v43)
    goto LABEL_40;
  -[RTXPCActivityCriteria gracePeriod](v34, "gracePeriod");
  v45 = v44;
  -[RTXPCActivityCriteria gracePeriod](self->_eraseInstallInitializationXpcCriteria, "gracePeriod");
  if (v45 != v46)
    goto LABEL_40;
  v47 = -[RTXPCActivityCriteria priority](v34, "priority");
  if (v47 == -[RTXPCActivityCriteria priority](self->_eraseInstallInitializationXpcCriteria, "priority")
    && (v48 = -[RTXPCActivityCriteria requireInexpensiveNetworkConnectivity](v34, "requireInexpensiveNetworkConnectivity"), v48 == -[RTXPCActivityCriteria requireInexpensiveNetworkConnectivity](self->_eraseInstallInitializationXpcCriteria, "requireInexpensiveNetworkConnectivity"))&& (v49 = -[RTXPCActivityCriteria networkTransferUploadSize](v34, "networkTransferUploadSize"), v49 == -[RTXPCActivityCriteria networkTransferUploadSize](self->_eraseInstallInitializationXpcCriteria, "networkTransferUploadSize"))&& (v50 = -[RTXPCActivityCriteria networkTransferDownloadSize](v34, "networkTransferDownloadSize"), v50 == -[RTXPCActivityCriteria networkTransferDownloadSize](self->_eraseInstallInitializationXpcCriteria, "networkTransferDownloadSize"))&& (v51 = -[RTXPCActivityCriteria allowBattery](v34, "allowBattery"), v51 == -[RTXPCActivityCriteria allowBattery](self->_eraseInstallInitializationXpcCriteria, "allowBattery")))
  {
LABEL_43:
    v60 = 0;
  }
  else
  {
LABEL_40:
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTXPCActivityCriteria description](self->_eraseInstallInitializationXpcCriteria, "description");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v6;
      eraseInstallDatabaseInitializationMaxAttemptCount = self->_eraseInstallDatabaseInitializationMaxAttemptCount;
      -[RTXPCActivityCriteria description](v34, "description");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v65 = v54;
      v66 = 2112;
      v67 = v55;
      v68 = 2112;
      v69 = CFSTR("com.apple.routined.authorizedLocation.maintenance");
      v70 = 2112;
      *(_QWORD *)v71 = v56;
      *(_WORD *)&v71[8] = 1026;
      *(_DWORD *)&v71[10] = eraseInstallDatabaseInitializationMaxAttemptCount;
      v6 = v57;
      v72 = 2112;
      v73 = v59;
      v74 = 1026;
      v75 = v57;
      _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_DEFAULT, "%@:%@, Detected change in XPC activity criteria for activity, %@, replacing old criteria, %@, maxAttemptCount, %{public}d, with new criteria, %@, maxAttemptCount, %{public}d.", buf, 0x40u);

      v40 = 0x1ED938000;
    }

    v60 = 1;
  }
  eraseInstallInitializationXpcCriteria = self->_eraseInstallInitializationXpcCriteria;
  self->_eraseInstallInitializationXpcCriteria = v34;

  *(Class *)((char *)&self->super.super.super.isa + *(int *)(v40 + 1256)) = (Class)v6;
  return v60;
}

- (void)_setupEraseInstallDatabaseInitializationActivity
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  RTAuthorizedLocationDatabaseInitializationMetrics *v9;
  RTXPCActivityManager *xpcActivityManager;
  RTXPCActivityCriteria *eraseInstallInitializationXpcCriteria;
  _QWORD v12[6];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTXPCActivityCriteria description](self->_eraseInstallInitializationXpcCriteria, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = CFSTR("com.apple.routined.authorizedLocation.maintenance");
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, Registering erase-install initialization XPC activity, %@, with criteria, %@", buf, 0x2Au);

  }
  v9 = objc_alloc_init(RTAuthorizedLocationDatabaseInitializationMetrics);
  -[RTAuthorizedLocationMetrics setInitializationMetrics:](self->_metrics, "setInitializationMetrics:", v9);

  xpcActivityManager = self->_xpcActivityManager;
  eraseInstallInitializationXpcCriteria = self->_eraseInstallInitializationXpcCriteria;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke;
  v12[3] = &unk_1E929BB80;
  v12[4] = self;
  v12[5] = a2;
  -[RTXPCActivityManager registerActivityWithIdentifier:criteria:handler:](xpcActivityManager, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.authorizedLocation.eraseInstallInitialization"), eraseInstallInitializationXpcCriteria, v12);
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = CFSTR("com.apple.routined.authorizedLocation.eraseInstallInitialization");
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, Begin XPC Activity: %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_50;
  block[3] = &unk_1E9298E88;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v13 = v3;
  v14 = v10;
  block[4] = v9;
  v11 = v3;
  dispatch_async(v8, block);

}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_50(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  _QWORD v36[6];
  _QWORD v37[7];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[6];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v3 + 176));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("RTAuthorizedLocationEraseInstallInitActivityAttemptCount"));

  if (!objc_msgSend(*v2, "_loadEraseInstallInitializationXPCCriteriaFromDefaults"))
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v13 = *(_QWORD **)(a1 + 32);
    v14 = MEMORY[0x1E0C809B0];
    if (v13[22] >= v13[21])
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(_QWORD *)(v20 + 176);
        v22 = *(_QWORD *)(v20 + 168);
        *(_DWORD *)buf = 138413058;
        v44 = v18;
        v45 = 2112;
        v46 = v19;
        v47 = 1026;
        LODWORD(v48[0]) = v21;
        WORD2(v48[0]) = 1026;
        *(_DWORD *)((char *)v48 + 6) = v22;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ attempt count %{public}d exceeded max retry count %{public}d, disabling erase install initialization.", buf, 0x22u);

      }
      if (!*((_BYTE *)v39 + 24))
        goto LABEL_14;
    }
    else
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_52;
      v37[3] = &unk_1E929BBA8;
      v15 = *(_QWORD *)(a1 + 48);
      v37[5] = &v38;
      v37[6] = v15;
      v37[4] = v13;
      objc_msgSend(v13, "_runEraseInstallDatabaseInitialization:", v37);
      if (!*((_BYTE *)v39 + 24))
      {
LABEL_17:
        _Block_object_dispose(&v38, 8);
        goto LABEL_18;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v25;
      v45 = 2112;
      v46 = v26;
      _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ completed successfully, disabling erase install initialization.", buf, 0x16u);

    }
LABEL_14:
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "convertToDictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v28;
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEFAULT, "Metric, eraseInstallInitialization, %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "submitToCoreAnalytics");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setInitializationMetrics:", 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = 0;
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(void **)(v29 + 128);
    v36[0] = v14;
    v36[1] = 3221225472;
    v36[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_54;
    v36[3] = &unk_1E9297628;
    v31 = *(_QWORD *)(a1 + 48);
    v36[4] = v29;
    v36[5] = v31;
    objc_msgSend(v30, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.authorizedLocation.eraseInstallInitialization"), v36);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setEraseInstallRetroRegistrationStatus:", 2);
    goto LABEL_17;
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 128);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_2;
  v42[3] = &unk_1E9297628;
  v8 = *(_QWORD *)(a1 + 48);
  v42[4] = v6;
  v42[5] = v8;
  objc_msgSend(v7, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.authorizedLocation.eraseInstallInitialization"), v42);
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v44 = v11;
    v45 = 2112;
    v46 = v12;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@, erase-install initialization XPC activity due to criteria change.", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setupEraseInstallDatabaseInitializationActivity");
LABEL_18:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v44 = v34;
    v45 = 2112;
    v46 = v35;
    v47 = 2112;
    v48[0] = CFSTR("com.apple.routined.authorizedLocation.maintenance");
    _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@, End XPC Activity: %@", buf, 0x20u);

  }
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413058;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = CFSTR("com.apple.routined.authorizedLocation.maintenance");
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, unregistered erase-install initialization XPC activity due to criteria change: %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_52(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = a2;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, _runEraseInstallDatabaseInitialization completed status: %d", (uint8_t *)&v10, 0x1Cu);

  }
  if (!a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413058;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = CFSTR("com.apple.routined.authorizedLocation.maintenance");
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, unregistered erase-install initialization XPC activity due to successful completion or max-retry limit: %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
}

- (void)_registerForDeviceUnlockNotification
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ invoked.", (uint8_t *)&v10, 0x16u);

  }
  -[RTAuthorizedLocationManager dataProtectionManager](self, "dataProtectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:", self, sel_onDataProtectionNotification_, v9);

}

- (void)onDataProtectionNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  RTAuthorizedLocationManager *v10;
  SEL v11;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTAuthorizedLocationManager_onDataProtectionNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __60__RTAuthorizedLocationManager_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ invoked with notification RTDataProtectionManagerNotificationUnlockedSinceBoot", (uint8_t *)&v13, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 136);
    +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:fromNotification:", v9, v11);

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 33) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 35) = objc_msgSend(*(id *)(a1 + 40), "_isExpeditedSyncAndLearnRequired");
    v12 = *(_BYTE **)(a1 + 40);
    if (v12[35])
      objc_msgSend(v12, "_setupEraseInstallDatabaseInitializationActivity");
  }
}

- (BOOL)_oneTimeRetroactivelyRegisterAllStoredVisits
{
  _BOOL4 isUnlockedSinceBoot;
  _BOOL4 v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  objc_class *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id *v16;
  id v17;
  void *v18;
  dispatch_time_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  dispatch_semaphore_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  id *v39;
  NSObject *v40;
  void *v41;
  dispatch_time_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  BOOL v61;
  objc_class *v62;
  id v63;
  void *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  NSObject *dsema;
  uint64_t v70;
  uint64_t v71;
  NSObject *log;
  void *v75;
  uint64_t v76;
  _QWORD v77[5];
  id v78;
  NSObject *v79;
  _BYTE *v80;
  uint64_t *v81;
  SEL v82;
  _QWORD v83[4];
  NSObject *v84;
  _BYTE *v85;
  _BYTE v86[24];
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE buf[24];
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint64_t v98;
  uint8_t v99[8];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  isUnlockedSinceBoot = self->_isUnlockedSinceBoot;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  log = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (!isUnlockedSinceBoot)
  {
    if (v3)
    {
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v56;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v57;
      _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_DEFAULT, "%@:%@, device not unlocked since last boot, unable to execute retro-registration.", buf, 0x16u);

    }
    goto LABEL_35;
  }
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_DEFAULT, "%@:%@ invoked.", buf, 0x16u);

  }
  -[RTAuthorizedLocationManager trustedTimeNow](self, "trustedTimeNow");
  log = objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!log)
  {
    if (v8)
    {
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v67;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trustedTimeNow, not retroactively registering visit logs.", buf, 0x16u);

    }
    log = 0;
LABEL_35:
    v61 = 0;
    goto LABEL_36;
  }
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@, WARNING, attempting to retroactively register all stored visits. This will be run one time after software upgrade.", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v95 = __Block_byref_object_copy__46;
  v96 = __Block_byref_object_dispose__46;
  v97 = 0;
  v12 = dispatch_semaphore_create(0);
  -[RTAuthorizedLocationManager visitLogStore](self, "visitLogStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __75__RTAuthorizedLocationManager__oneTimeRetroactivelyRegisterAllStoredVisits__block_invoke;
  v83[3] = &unk_1E9297038;
  v85 = buf;
  v15 = v12;
  v84 = v15;
  objc_msgSend(v13, "purgeVisitLogsPredating:handler:", v14, v83);

  v16 = (id *)(*(_QWORD *)&buf[8] + 40);
  v17 = *(id *)(*(_QWORD *)&buf[8] + 40);
  dsema = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v19))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceDate:", v18);
    v22 = v21;
    v23 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "filteredArrayUsingPredicate:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "submitToCoreAnalytics:type:duration:", v27, 1, v22);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v86 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v86, 2u);
    }

    v29 = (void *)MEMORY[0x1E0CB35C8];
    v90 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v86 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v90, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v17 = objc_retainAutorelease(v31);

    }
  }

  objc_storeStrong(v16, v17);
  -[RTAuthorizedLocationManager _updateMostRecentDateAtWhichDeviceDataIsTrusted](self, "_updateMostRecentDateAtWhichDeviceDataIsTrusted");
  -[NSObject timeIntervalSinceDate:](log, "timeIntervalSinceDate:", self->_mostRecentDateAtWhichDeviceDataIsTrusted);
  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  v76 = (uint64_t)(v32 / 86400.0);
  if (v76 < 0)
    goto LABEL_27;
  v33 = v32 + (double)(uint64_t)(v32 / 86400.0) * 86400.0;
  v70 = *MEMORY[0x1E0D18598];
  v71 = *MEMORY[0x1E0CB2D50];
  do
  {
    *(_QWORD *)v86 = 0;
    *(_QWORD *)&v86[8] = v86;
    *(_QWORD *)&v86[16] = 0x3032000000;
    v87 = __Block_byref_object_copy__46;
    v88 = __Block_byref_object_dispose__46;
    v89 = 0;
    v34 = dispatch_semaphore_create(0);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", log, -(v33 + (double)v76 * 86400.0 + 3600.0));
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __75__RTAuthorizedLocationManager__oneTimeRetroactivelyRegisterAllStoredVisits__block_invoke_2;
    v77[3] = &unk_1E929BBD0;
    v80 = v86;
    v77[4] = self;
    v81 = &v90;
    v82 = a2;
    v36 = v35;
    v78 = v36;
    v37 = v34;
    v79 = v37;
    -[RTAuthorizedLocationManager _updateVisitLogWithTrustedTime:isRetroRegistrationTime:handler:](self, "_updateVisitLogWithTrustedTime:isRetroRegistrationTime:handler:", v36, 1, v77);
    v39 = (id *)(*(_QWORD *)&v86[8] + 40);
    v38 = *(id *)(*(_QWORD *)&v86[8] + 40);
    v40 = v37;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v40, v42))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "timeIntervalSinceDate:", v41);
      v44 = v43;
      v45 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "filteredArrayUsingPredicate:", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "submitToCoreAnalytics:type:duration:", v49, 1, v44);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v99 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v99, 2u);
      }

      v51 = (void *)MEMORY[0x1E0CB35C8];
      v98 = v71;
      *(_QWORD *)v99 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, &v98, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", v70, 15, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        v38 = objc_retainAutorelease(v53);

      }
    }

    objc_storeStrong(v39, v38);
    _Block_object_dispose(v86, 8);

  }
  while (v76-- > 0);
  if (!v91[3])
  {
LABEL_27:
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v63 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v86 = 138412546;
      *(_QWORD *)&v86[4] = v63;
      *(_WORD *)&v86[12] = 2112;
      *(_QWORD *)&v86[14] = v64;
      _os_log_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to register any visits, will try again, not disabling visit retro-registration for next launch.", v86, 0x16u);

    }
    v61 = 0;
  }
  else
  {
    -[RTAuthorizedLocationMetrics initializationMetrics](self->_metrics, "initializationMetrics");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      v61 = 1;
      goto LABEL_31;
    }
    v59 = v91[3];
    -[RTAuthorizedLocationMetrics initializationMetrics](self->_metrics, "initializationMetrics");
    v60 = objc_claimAutoreleasedReturnValue();
    -[NSObject setNumberOfVisitsRegisteredDuringEraseInstallInitialization:](v60, "setNumberOfVisitsRegisteredDuringEraseInstallInitialization:", v59);
    v61 = 1;
  }

LABEL_31:
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(buf, 8);
LABEL_36:

  return v61;
}

void __75__RTAuthorizedLocationManager__oneTimeRetroactivelyRegisterAllStoredVisits__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __75__RTAuthorizedLocationManager__oneTimeRetroactivelyRegisterAllStoredVisits__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  _BOOL4 v13;
  objc_class *v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v18 = 138412802;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v12 = "%@:%@, error retroactively registering visits %@.";
LABEL_9:
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, 0x20u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v13)
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 72));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        v18 = 138412802;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        v22 = 2112;
        v23 = v15;
        v12 = "%@:%@, successfully registered visits with registrationDate: %@";
        goto LABEL_9;
      }
    }
    else if (v13)
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      v18 = 138412802;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v17;
      v12 = "%@:%@, no visits to register for registrationDate: %@";
      goto LABEL_9;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)trustedTimeNow
{
  void *v2;

  if (self->_relaxTrustedTimeRequirement)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_allowUnsecureTimeFallback)
  {
    -[RTTrustedTimeCache getApproximateTrustedDateNowWithUnsecureFallback](self->_trustedTimeCache, "getApproximateTrustedDateNowWithUnsecureFallback");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_forceTrustedTimeUnavailability)
      return 0;
    -[RTTrustedTimeCache getApproximateTrustedDateNow](self->_trustedTimeCache, "getApproximateTrustedDateNow");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_updateReferenceTimeBoundsFromVisitLog
{
  id v3;
  void *v4;
  uint64_t v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id v10;
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
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  RTAuthorizedLocationVisitLogFetchOptions *v32;
  void *v33;
  _QWORD v35[5];
  NSObject *v36;
  uint64_t *v37;
  uint64_t *v38;
  SEL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint8_t buf[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithTimeInterval:sinceDate:", v4, -120.0);

  v30 = (void *)v5;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v33, v5);
  v32 = -[RTAuthorizedLocationVisitLogFetchOptions initWithAscending:dateInterval:limit:]([RTAuthorizedLocationVisitLogFetchOptions alloc], "initWithAscending:dateInterval:limit:", 0, v31, &unk_1E9327CB0);
  v6 = dispatch_semaphore_create(0);
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__46;
  v50 = __Block_byref_object_dispose__46;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__46;
  v44 = __Block_byref_object_dispose__46;
  v45 = 0;
  -[RTAuthorizedLocationManager visitLogStore](self, "visitLogStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __69__RTAuthorizedLocationManager__updateReferenceTimeBoundsFromVisitLog__block_invoke;
  v35[3] = &unk_1E929B0C8;
  v37 = &v46;
  v38 = &v40;
  v35[4] = self;
  v39 = a2;
  v8 = v6;
  v36 = v8;
  objc_msgSend(v7, "fetchVisitLogsWithOptions:handler:", v32, v35);

  v9 = (id *)(v47 + 5);
  v10 = (id)v47[5];
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v11, v13))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
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
    v52 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v52, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v10 = objc_retainAutorelease(v25);

    }
  }

  objc_storeStrong(v9, v10);
  v26 = (void *)v41[5];
  if (v26)
  {
    v27 = v26;
    v28 = objc_alloc(MEMORY[0x1E0C99D68]);
    v29 = (void *)objc_msgSend(v28, "initWithTimeInterval:sinceDate:", v41[5], 259200.0);
    -[RTTrustedTimeCache setBoundsForReferenceTimeWithMinimumDate:maximumDate:](self->_trustedTimeCache, "setBoundsForReferenceTimeWithMinimumDate:maximumDate:", v27, v29);

  }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __69__RTAuthorizedLocationManager__updateReferenceTimeBoundsFromVisitLog__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (!v6 && objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registrationDate");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@:%@, setting bound from date %@", (uint8_t *)&v16, 0x20u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (unint64_t)_locationAvailabilityFromCLLocation:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  int v6;
  unint64_t v7;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  v5 = objc_msgSend(v3, "integrity");
  v6 = objc_msgSend(v4, "type");
  if (v6 == 1)
  {
    v7 = 1;
    goto LABEL_10;
  }
  if (v6 == 11 || v6 == 4)
  {
    if (v5 >= *MEMORY[0x1E0C9E508])
      v7 = 6;
    else
      v7 = 2;
  }
  else
  {
LABEL_8:
    v7 = 0;
  }
LABEL_10:

  return v7;
}

- (unint64_t)_computeLocationTechnologyAvailabilityForDateInterval:(id)a3
{
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t (*v5)(uint64_t, uint64_t);
  double v6;
  objc_class *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  NSObject *v18;
  id *v19;
  id v20;
  NSObject *v21;
  dispatch_time_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  char v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v45;
  void *v46;
  void *v47;
  const char *aSelector;
  uint64_t v49;
  uint64_t v50;
  void *v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void *v54;
  void *v55;
  void *v56;
  NSObject *log;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  NSObject *v63;
  _BYTE *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint8_t v72[128];
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  uint8_t v78[8];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v53 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v47;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v74) = 0;
      _os_log_debug_impl(&dword_1D1A22000, log, OS_LOG_TYPE_DEBUG, "%@:%@, skipping nil dateInterval, locationTechnologyAvailability, %{public}08x.", buf, 0x1Cu);

    }
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v4, "duration");
  if (v6 < 7200.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v74 = v53;
      LOWORD(v75) = 1026;
      *(_DWORD *)((char *)&v75 + 2) = 0;
      _os_log_debug_impl(&dword_1D1A22000, log, OS_LOG_TYPE_DEBUG, "%@:%@, skipping short dateInterval %@, locationTechnologyAvailability, %{public}08x.", buf, 0x26u);

    }
LABEL_7:
    v10 = 0;
    goto LABEL_27;
  }
  aSelector = a2;
  objc_msgSend(v5, "startDate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  log = 0;
  v49 = *MEMORY[0x1E0D18598];
  v50 = *MEMORY[0x1E0CB2D50];
  do
  {
    v11 = log;
    log = v56;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", log, 1800.0);
    objc_msgSend(v53, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "earlierDate:", v13);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0D184F0]);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", log, v56);
    v55 = (void *)objc_msgSend(v14, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v15, 0, 0, 100.0);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v74 = __Block_byref_object_copy__46;
    v75 = __Block_byref_object_dispose__46;
    v76 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__46;
    v70 = __Block_byref_object_dispose__46;
    v71 = 0;
    v16 = dispatch_semaphore_create(0);
    -[RTAuthorizedLocationManager locationManager](self, "locationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __85__RTAuthorizedLocationManager__computeLocationTechnologyAvailabilityForDateInterval___block_invoke;
    v62[3] = &unk_1E9296EE0;
    v64 = buf;
    v65 = &v66;
    v18 = v16;
    v63 = v18;
    objc_msgSend(v17, "fetchStoredLocationsWithOptions:handler:", v55, v62);

    v19 = (id *)(*(_QWORD *)&buf[8] + 40);
    v20 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v21 = v18;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v21, v22))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "timeIntervalSinceDate:", v54);
      v24 = v23;
      v25 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "filteredArrayUsingPredicate:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "submitToCoreAnalytics:type:duration:", v29, 1, v24);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v78 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v78, 2u);
      }

      v31 = (void *)MEMORY[0x1E0CB35C8];
      v77 = v50;
      *(_QWORD *)v78 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v49, 15, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v20 = objc_retainAutorelease(v33);

      }
    }

    objc_storeStrong(v19, v20);
    if (v67[5])
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v34 = (id)v67[5];
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v59 != v36)
              objc_enumerationMutation(v34);
            v10 |= +[RTAuthorizedLocationManager _locationAvailabilityFromCLLocation:](RTAuthorizedLocationManager, "_locationAvailabilityFromCLLocation:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
          }
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
        }
        while (v35);
      }

    }
    _Block_object_dispose(&v66, 8);

    _Block_object_dispose(buf, 8);
    objc_msgSend(v53, "endDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v56, "isBeforeDate:", v38);

  }
  while ((v39 & 1) != 0);
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v42;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v43;
    *(_WORD *)&buf[22] = 2112;
    v74 = v53;
    LOWORD(v75) = 1026;
    *(_DWORD *)((char *)&v75 + 2) = v10;
    _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_DEFAULT, "%@:%@, dateInterval %@, locationTechnologyAvailability, %{public}08x.", buf, 0x26u);

  }
LABEL_27:

  return v10;
}

void __85__RTAuthorizedLocationManager__computeLocationTechnologyAvailabilityForDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (unint64_t)_computeLocationTechnologyExpectationFromHistoricalAvailability:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  uint64_t v12;
  double v13;
  double v14;
  objc_class *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 0xA)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v5)
    {
      v7 = 0;
      v8 = *(_QWORD *)v20;
      v9 = 0.0;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v19);
          if (v12)
          {
            ++v7;
            if ((v12 & 1) != 0)
              v13 = 1.0;
            else
              v13 = 0.0;
            v10 = v10 + v13;
            if ((v12 & 4) != 0)
              v14 = 1.0;
            else
              v14 = 0.0;
            v9 = v9 + v14;
          }
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v5);

      if (!v7)
        goto LABEL_2;
      v5 = (v10 / (double)v7 > 0.8) | (4 * (v9 / (double)v7 > 0.8)) | 2;
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        v27 = 1026;
        v28 = (v10 / (double)v7 > 0.8) | (4 * (v9 / (double)v7 > 0.8)) | 2;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, technology expectation bitset %{public}08x.", buf, 0x1Cu);

      }
    }

    goto LABEL_22;
  }
LABEL_2:
  v5 = 0;
LABEL_22:

  return v5;
}

- (void)_updateVisitLogWithTrustedTime:(id)a3 isRetroRegistrationTime:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  id *v13;
  id v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  id v37;
  id v38;
  uint64_t v39;
  dispatch_semaphore_t v40;
  void *v41;
  NSObject *v42;
  id *v43;
  id v44;
  void *v45;
  dispatch_time_t v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  objc_class *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  _BOOL8 v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  char v74;
  NSObject *v75;
  objc_class *v76;
  id v77;
  id v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void *v80;
  void *v81;
  BOOL v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  RTAuthorizedLocationVisitLog *v87;
  void *v88;
  RTAuthorizedLocationVisitLog *v89;
  dispatch_semaphore_t v90;
  void *v91;
  NSObject *v92;
  id v93;
  id *v94;
  NSObject *v95;
  dispatch_time_t v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  objc_class *v109;
  id v110;
  void *v111;
  dispatch_semaphore_t v112;
  void *v113;
  NSObject *v114;
  id *v115;
  id v116;
  NSObject *v117;
  void *v118;
  dispatch_time_t v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  objc_class *v132;
  id v133;
  void *v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  objc_class *v136;
  id v137;
  void *v138;
  uint64_t (*v139)(uint64_t, uint64_t);
  NSObject *v140;
  RTAuthorizedLocationVisitLogFetchOptions *v141;
  void *v142;
  id obj;
  uint64_t (*v144)(uint64_t, uint64_t);
  id v145;
  void (**v146)(id, _QWORD, uint64_t);
  void *v147;
  uint64_t v148;
  NSObject *dsema;
  uint64_t v150;
  uint64_t i;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  id v155;
  void *v157;
  uint64_t v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  _QWORD v164[4];
  NSObject *v165;
  _BYTE *v166;
  _QWORD v167[5];
  NSObject *v168;
  NSObject *v169;
  _BYTE *v170;
  SEL v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _QWORD v180[4];
  NSObject *v181;
  uint64_t *v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t (*v187)(uint64_t, uint64_t);
  void (*v188)(uint64_t);
  id v189;
  _QWORD v190[4];
  id v191;
  NSObject *v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t (*v197)(uint64_t, uint64_t);
  void (*v198)(uint64_t);
  id v199;
  _BYTE v200[128];
  uint8_t v201[128];
  _BYTE buf[24];
  uint64_t (*v203)(uint64_t, uint64_t);
  _BYTE v204[20];
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  uint64_t (*v208)(uint64_t, uint64_t);
  void (*v209)(uint64_t);
  id v210;
  uint64_t v211;
  uint8_t v212[8];
  uint64_t v213;

  v6 = a4;
  v213 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v146 = (void (**)(id, _QWORD, uint64_t))a5;
  if (!v146)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTAuthorizedLocationManager _updateVisitLogWithTrustedTime:isRetroRegistrationTime:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 846;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v147 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v7, -2592000.0);
    v145 = v7;
    v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v144, v145);
    v141 = -[RTAuthorizedLocationVisitLogFetchOptions initWithAscending:dateInterval:limit:]([RTAuthorizedLocationVisitLogFetchOptions alloc], "initWithAscending:dateInterval:limit:", 1, v142, 0);
    v10 = dispatch_semaphore_create(0);
    v194 = 0;
    v195 = &v194;
    v196 = 0x3032000000;
    v197 = __Block_byref_object_copy__46;
    v198 = __Block_byref_object_dispose__46;
    v199 = 0;
    -[RTAuthorizedLocationManager visitLogStore](self, "visitLogStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = MEMORY[0x1E0C809B0];
    v190[1] = 3221225472;
    v190[2] = __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke;
    v190[3] = &unk_1E929BBF8;
    v193 = &v194;
    v159 = v9;
    v191 = v159;
    v12 = v10;
    v192 = v12;
    objc_msgSend(v11, "fetchVisitLogsWithOptions:handler:", v141, v190);

    v13 = (id *)(v195 + 5);
    v14 = (id)v195[5];
    dsema = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v16))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", v15);
      v19 = v18;
      v20 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v26 = (void *)MEMORY[0x1E0CB35C8];
      v205 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v205, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v14 = objc_retainAutorelease(v28);

      }
    }

    objc_storeStrong(v13, v14);
    v29 = v195[5];
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v132 = (objc_class *)objc_opt_class();
        NSStringFromClass(v132);
        v133 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = (uint64_t (*)(uint64_t, uint64_t))v195[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v133;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v134;
        *(_WORD *)&buf[22] = 2112;
        v203 = v135;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch visit logs: %@.", buf, 0x20u);

      }
      v146[2](v146, 0, v195[5]);
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v159, "count");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2050;
        v203 = (uint64_t (*)(uint64_t, uint64_t))v39;
        *(_WORD *)v204 = 2112;
        *(_QWORD *)&v204[2] = v142;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld visit logs for interval: %@.", buf, 0x2Au);

      }
      v205 = 0;
      v206 = &v205;
      v207 = 0x3032000000;
      v208 = __Block_byref_object_copy__46;
      v209 = __Block_byref_object_dispose__46;
      v210 = 0;
      v184 = 0;
      v185 = &v184;
      v186 = 0x3032000000;
      v187 = __Block_byref_object_copy__46;
      v188 = __Block_byref_object_dispose__46;
      v189 = 0;
      v40 = dispatch_semaphore_create(0);
      -[RTAuthorizedLocationManager learnedLocationManager](self, "learnedLocationManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v180[0] = MEMORY[0x1E0C809B0];
      v180[1] = 3221225472;
      v180[2] = __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_64;
      v180[3] = &unk_1E9296EE0;
      v182 = &v205;
      v183 = &v184;
      v42 = v40;
      v181 = v42;
      objc_msgSend(v41, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v144, v145, v180);

      v43 = (id *)(v206 + 5);
      v44 = (id)v206[5];
      v140 = v42;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v140, v46))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "timeIntervalSinceDate:", v45);
        v49 = v48;
        v50 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "filteredArrayUsingPredicate:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "firstObject");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "submitToCoreAnalytics:type:duration:", v54, 1, v49);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v56 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)v212 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v212, 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          v44 = objc_retainAutorelease(v58);

        }
      }

      objc_storeStrong(v43, v44);
      v59 = v206[5];
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = v60;
      if (v59)
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v136 = (objc_class *)objc_opt_class();
          NSStringFromClass(v136);
          v137 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = (uint64_t (*)(uint64_t, uint64_t))v206[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v137;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v138;
          *(_WORD *)&buf[22] = 2112;
          v203 = v139;
          _os_log_error_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch historical locations of interest: %@.", buf, 0x20u);

        }
        v146[2](v146, 0, v206[5]);
      }
      else
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          v63 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v64 = (id)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend((id)v185[5], "count");
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v63;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v64;
          *(_WORD *)&buf[22] = 2050;
          v203 = (uint64_t (*)(uint64_t, uint64_t))v65;
          *(_WORD *)v204 = 2112;
          *(_QWORD *)&v204[2] = v144;
          *(_WORD *)&v204[10] = 2112;
          *(_QWORD *)&v204[12] = v145;
          _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld historical locations of interest between %@ and %@.", buf, 0x34u);

        }
        -[RTTrustedTimeCache getApproximateTrustedDateNow](self->_trustedTimeCache, "getApproximateTrustedDateNow");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66 != 0;

        +[RTAuthorizedLocationVisitLog encodeTimeSourceWithValue:isTrusted:isRetroRegistration:](RTAuthorizedLocationVisitLog, "encodeTimeSourceWithValue:isTrusted:isRetroRegistration:", v145, v67, v6);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = 0u;
        v179 = 0u;
        v176 = 0u;
        v177 = 0u;
        obj = (id)v185[5];
        v150 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v201, 16);
        if (v150)
        {
          v158 = 0;
          v148 = *(_QWORD *)v177;
          v152 = *MEMORY[0x1E0D18598];
          v153 = *MEMORY[0x1E0CB2D50];
          do
          {
            for (i = 0; i != v150; ++i)
            {
              if (*(_QWORD *)v177 != v148)
                objc_enumerationMutation(obj);
              v68 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * i);
              v172 = 0u;
              v173 = 0u;
              v174 = 0u;
              v175 = 0u;
              objc_msgSend(v68, "visits");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v172, v200, 16);
              if (v70)
              {
                v160 = *(_QWORD *)v173;
                v155 = v69;
                do
                {
                  v161 = v70;
                  for (j = 0; j != v161; ++j)
                  {
                    if (*(_QWORD *)v173 != v160)
                      objc_enumerationMutation(v155);
                    v72 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * j);
                    objc_msgSend(v72, "identifier");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    v74 = objc_msgSend(v159, "containsObject:", v73);

                    if ((v74 & 1) != 0)
                    {
                      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                      v75 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                      {
                        v76 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v76);
                        v77 = (id)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        v78 = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v72, "identifier");
                        v79 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)&buf[4] = v77;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v78;
                        *(_WORD *)&buf[22] = 2112;
                        v203 = v79;
                        _os_log_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_DEFAULT, "%@:%@, visit already registered: %@", buf, 0x20u);

                      }
                    }
                    else
                    {
                      objc_msgSend(v72, "entryDate");
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v80)
                      {
                        objc_msgSend(v72, "exitDate");
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        v82 = v81 == 0;

                        if (v82)
                        {
                          v80 = 0;
                        }
                        else
                        {
                          v83 = objc_alloc(MEMORY[0x1E0CB3588]);
                          objc_msgSend(v72, "entryDate");
                          v84 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v72, "exitDate");
                          v85 = (void *)objc_claimAutoreleasedReturnValue();
                          v86 = (void *)objc_msgSend(v83, "initWithStartDate:endDate:", v84, v85);

                          v80 = -[RTAuthorizedLocationManager _computeLocationTechnologyAvailabilityForDateInterval:](self, "_computeLocationTechnologyAvailabilityForDateInterval:", v86);
                        }
                      }
                      v87 = [RTAuthorizedLocationVisitLog alloc];
                      objc_msgSend(v72, "identifier");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      v89 = -[RTAuthorizedLocationVisitLog initWithVisitIdentifier:registrationDate:locationTechnologyAvailability:](v87, "initWithVisitIdentifier:registrationDate:locationTechnologyAvailability:", v88, v154, v80);

                      v90 = dispatch_semaphore_create(0);
                      *(_QWORD *)buf = 0;
                      *(_QWORD *)&buf[8] = buf;
                      *(_QWORD *)&buf[16] = 0x3032000000;
                      v203 = __Block_byref_object_copy__46;
                      *(_QWORD *)v204 = __Block_byref_object_dispose__46;
                      *(_QWORD *)&v204[8] = 0;
                      -[RTAuthorizedLocationManager visitLogStore](self, "visitLogStore");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      v167[0] = MEMORY[0x1E0C809B0];
                      v167[1] = 3221225472;
                      v167[2] = __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_66;
                      v167[3] = &unk_1E929A5F8;
                      v170 = buf;
                      v167[4] = self;
                      v171 = a2;
                      v75 = v89;
                      v168 = v75;
                      v92 = v90;
                      v169 = v92;
                      objc_msgSend(v91, "storeVisitLog:handler:", v75, v167);

                      v94 = (id *)(*(_QWORD *)&buf[8] + 40);
                      v93 = *(id *)(*(_QWORD *)&buf[8] + 40);
                      v95 = v92;
                      objc_msgSend(MEMORY[0x1E0C99D68], "now");
                      v162 = (void *)objc_claimAutoreleasedReturnValue();
                      v96 = dispatch_time(0, 3600000000000);
                      if (dispatch_semaphore_wait(v95, v96))
                      {
                        objc_msgSend(MEMORY[0x1E0C99D68], "now");
                        v157 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v157, "timeIntervalSinceDate:", v162);
                        v98 = v97;
                        v99 = (void *)objc_opt_new();
                        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
                        v100 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                        v101 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v101, "filteredArrayUsingPredicate:", v100);
                        v102 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v102, "firstObject");
                        v103 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v99, "submitToCoreAnalytics:type:duration:", v103, 1, v98);
                        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                        v104 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
                        {
                          *(_WORD *)v212 = 0;
                          _os_log_fault_impl(&dword_1D1A22000, v104, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v212, 2u);
                        }

                        v105 = (void *)MEMORY[0x1E0CB35C8];
                        v211 = v153;
                        *(_QWORD *)v212 = CFSTR("semaphore wait timeout");
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v212, &v211, 1);
                        v106 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v105, "errorWithDomain:code:userInfo:", v152, 15, v106);
                        v107 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v107)
                        {
                          v93 = objc_retainAutorelease(v107);

                        }
                      }

                      objc_storeStrong(v94, v93);
                      _Block_object_dispose(buf, 8);

                      ++v158;
                    }

                  }
                  v69 = v155;
                  v70 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v172, v200, 16);
                }
                while (v70);
              }

            }
            v150 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v201, 16);
          }
          while (v150);
        }
        else
        {
          v158 = 0;
        }

        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v109 = (objc_class *)objc_opt_class();
          NSStringFromClass(v109);
          v110 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v110;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v111;
          *(_WORD *)&buf[22] = 2112;
          v203 = v144;
          _os_log_impl(&dword_1D1A22000, v108, OS_LOG_TYPE_DEFAULT, "%@:%@, purging visit logs predating: %@", buf, 0x20u);

        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v203 = __Block_byref_object_copy__46;
        *(_QWORD *)v204 = __Block_byref_object_dispose__46;
        *(_QWORD *)&v204[8] = 0;
        v112 = dispatch_semaphore_create(0);
        -[RTAuthorizedLocationManager visitLogStore](self, "visitLogStore");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v164[0] = MEMORY[0x1E0C809B0];
        v164[1] = 3221225472;
        v164[2] = __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_67;
        v164[3] = &unk_1E9297038;
        v166 = buf;
        v114 = v112;
        v165 = v114;
        objc_msgSend(v113, "purgeVisitLogsPredating:handler:", v144, v164);

        v115 = (id *)(*(_QWORD *)&buf[8] + 40);
        v116 = *(id *)(*(_QWORD *)&buf[8] + 40);
        v117 = v114;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v117, v119))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "timeIntervalSinceDate:", v118);
          v122 = v121;
          v123 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "filteredArrayUsingPredicate:", v124);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "firstObject");
          v127 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v123, "submitToCoreAnalytics:type:duration:", v127, 1, v122);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v212 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v128, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v212, 2u);
          }

          v129 = (void *)MEMORY[0x1E0CB35C8];
          v211 = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)v212 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v212, &v211, 1);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v130);
          v131 = (void *)objc_claimAutoreleasedReturnValue();

          if (v131)
          {
            v116 = objc_retainAutorelease(v131);

          }
        }

        objc_storeStrong(v115, v116);
        v146[2](v146, v158, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

        _Block_object_dispose(buf, 8);
      }

      _Block_object_dispose(&v184, 8);
      _Block_object_dispose(&v205, 8);

    }
    _Block_object_dispose(&v194, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v35;
      _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@, nil trusted time, not updating visit logs.", buf, 0x16u);

    }
    v146[2](v146, 0, 0);
  }

}

void __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (!v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "visitIdentifier", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_66(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@, registered visit: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_67(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_curateAuthorizedLocationsWithHandler:(id)a3
{
  RTAuthorizedLocationManager *v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSArray *authorizedLocationArr;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  RTAuthorizedLocationCurationMetrics *v19;
  dispatch_semaphore_t v20;
  void *v21;
  NSObject *v22;
  id *v23;
  id v24;
  void *v25;
  dispatch_time_t v26;
  void *v27;
  double v28;
  double v29;
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
  id v40;
  NSObject *v41;
  NSObject *v42;
  objc_class *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  dispatch_semaphore_t v49;
  void *v50;
  id v51;
  NSObject *v52;
  id *v53;
  id v54;
  void *v55;
  dispatch_time_t v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  int v76;
  double v77;
  double v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  double v86;
  objc_class *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  objc_class *v91;
  id v92;
  id v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  _BOOL4 v98;
  objc_class *v99;
  id v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  int v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  objc_class *v111;
  id v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  unint64_t v130;
  uint64_t v131;
  void *v132;
  _BOOL4 v133;
  void *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  objc_class *v138;
  id v139;
  id v140;
  void *v141;
  void *v142;
  double v143;
  id v144;
  void *v145;
  double v146;
  double v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  char v152;
  unint64_t v153;
  RTAuthorizedLocation *v154;
  objc_class *v155;
  id v156;
  void *v157;
  NSObject *v158;
  objc_class *v159;
  id v160;
  id v161;
  void *v162;
  double v163;
  void *v164;
  void *v165;
  void *v166;
  double v167;
  NSObject *v168;
  objc_class *v169;
  id v170;
  id v171;
  objc_class *v172;
  id v173;
  id v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  double v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  double v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  dispatch_semaphore_t v195;
  void *v196;
  void *v197;
  NSObject *v198;
  id *v199;
  id v200;
  NSObject *v201;
  void *v202;
  dispatch_time_t v203;
  void *v204;
  double v205;
  double v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  NSObject *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  double v218;
  double v219;
  void *v220;
  uint64_t v221;
  NSDate *v222;
  NSObject *p_super;
  objc_class *v224;
  id v225;
  void *v226;
  uint64_t v227;
  objc_class *v228;
  id v229;
  id v230;
  uint64_t v231;
  NSDate *dateOfLastAuthorizedLocationsCuration;
  void *v233;
  void *v234;
  double v235;
  void *v236;
  unint64_t v237;
  void *v238;
  double v239;
  double v240;
  void *v241;
  double v242;
  void *v243;
  uint64_t v244;
  void *v245;
  NSArray *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t m;
  uint64_t v250;
  NSObject *v251;
  objc_class *v252;
  id v253;
  id v254;
  _BOOL8 v255;
  double v256;
  void *v257;
  float v258;
  void *v259;
  int v260;
  NSObject *v261;
  objc_class *v262;
  id v263;
  id v264;
  void *v265;
  _BOOL4 allowUnsecureTimeFallback;
  const char *v267;
  RTAuthorizedLocationVisitLogFetchOptions *v268;
  NSObject *v269;
  id v270;
  NSDate *v271;
  void *v272;
  NSObject *dsema;
  void (**v274)(id, id);
  uint64_t v275;
  uint64_t v276;
  id v277;
  int v278;
  int v279;
  void *v280;
  uint64_t j;
  void *v282;
  id obj;
  void *v284;
  void *v285;
  int v286;
  id v288;
  void *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  id v295;
  id v296;
  id v297;
  uint64_t v298;
  uint64_t v299;
  id v300;
  RTAuthorizedLocationManager *v301;
  void *v302;
  uint64_t v303;
  void *v304;
  uint64_t v305;
  int64_t v306;
  void *v307;
  void *v308;
  uint64_t k;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  _QWORD v314[5];
  NSObject *v315;
  _BYTE *v316;
  uint64_t *v317;
  SEL v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  _QWORD v335[4];
  id v336;
  id v337;
  NSObject *v338;
  uint64_t *v339;
  _QWORD v340[4];
  NSObject *v341;
  uint64_t *v342;
  uint64_t *v343;
  uint64_t v344;
  uint64_t *v345;
  uint64_t v346;
  uint64_t (*v347)(uint64_t, uint64_t);
  void (*v348)(uint64_t);
  id v349;
  uint64_t v350;
  uint64_t *v351;
  uint64_t v352;
  uint64_t (*v353)(uint64_t, uint64_t);
  void (*v354)(uint64_t);
  id v355;
  _BYTE v356[128];
  uint64_t v357;
  uint64_t *v358;
  uint64_t v359;
  uint64_t (*v360)(uint64_t, uint64_t);
  void (*v361)(uint64_t);
  id v362;
  _BYTE v363[128];
  void *v364;
  _BYTE v365[128];
  void *v366;
  uint8_t v367[128];
  _BYTE buf[24];
  _BYTE v369[30];
  __int16 v370;
  int v371;
  _BYTE v372[128];
  uint64_t v373;
  uint64_t *v374;
  uint64_t v375;
  uint64_t (*v376)(uint64_t, uint64_t);
  void (*v377)(uint64_t);
  id v378;
  uint64_t v379;
  uint8_t v380[8];
  uint64_t v381;

  v381 = *MEMORY[0x1E0C80C00];
  v274 = (void (**)(id, id))a3;
  if (!v274)
  {
    v4 = self;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTAuthorizedLocationManager _curateAuthorizedLocationsWithHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 961;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    self = v4;
  }
  v301 = self;
  -[RTAuthorizedLocationManager trustedTimeNow](self, "trustedTimeNow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v294 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_dateOfLastAuthorizedLocationsCuration);
    v8 = v7;
    if (v7 > 86400.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2050;
        *(double *)v369 = v8;
        *(_WORD *)&v369[8] = 2050;
        *(_QWORD *)&v369[10] = 0x40F5180000000000;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: time since last authorized location curation %{public}.0f seconds, greater than threshold %{public}.0f seconds. Clearing authorized location list.", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v13 = objc_claimAutoreleasedReturnValue();
      authorizedLocationArr = v301->_authorizedLocationArr;
      v301->_authorizedLocationArr = (NSArray *)v13;

LABEL_14:
      v19 = objc_alloc_init(RTAuthorizedLocationCurationMetrics);
      -[RTAuthorizedLocationMetrics setCurationMetrics:](v301->_metrics, "setCurationMetrics:", v19);

      -[RTAuthorizedLocationManager _updateReferenceTimeBoundsFromVisitLog](v301, "_updateReferenceTimeBoundsFromVisitLog");
      v272 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v294, -2592000.0);
      v271 = v301->_mostRecentDateAtWhichDeviceDataIsTrusted;
      v282 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v272, v271);
      v350 = 0;
      v351 = &v350;
      v352 = 0x3032000000;
      v353 = __Block_byref_object_copy__46;
      v354 = __Block_byref_object_dispose__46;
      v355 = 0;
      v344 = 0;
      v345 = &v344;
      v346 = 0x3032000000;
      v347 = __Block_byref_object_copy__46;
      v348 = __Block_byref_object_dispose__46;
      v349 = 0;
      v20 = dispatch_semaphore_create(0);
      -[RTAuthorizedLocationManager learnedLocationManager](v301, "learnedLocationManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v340[0] = MEMORY[0x1E0C809B0];
      v340[1] = 3221225472;
      v340[2] = __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke;
      v340[3] = &unk_1E9296EE0;
      v342 = &v350;
      v343 = &v344;
      v22 = v20;
      v341 = v22;
      objc_msgSend(v21, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v272, v271, v340);

      v23 = (id *)(v351 + 5);
      v24 = (id)v351[5];
      dsema = v22;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(dsema, v26))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceDate:", v25);
        v29 = v28;
        v30 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "filteredArrayUsingPredicate:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "submitToCoreAnalytics:type:duration:", v34, 1, v29);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v36 = (void *)MEMORY[0x1E0CB35C8];
        v373 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v373, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v24 = objc_retainAutorelease(v38);

        }
      }

      objc_storeStrong(v23, v24);
      if (v351[5])
      {
        v39 = (void *)v345[5];
        v345[5] = 0;

        v40 = (id)v351[5];
        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v224 = (objc_class *)objc_opt_class();
          NSStringFromClass(v224);
          v225 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          v227 = v351[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v225;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v226;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)v369 = v227;
          _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch historical locations of interest: %@.", buf, 0x20u);

        }
        v274[2](v274, v40);
LABEL_160:

        _Block_object_dispose(&v344, 8);
        _Block_object_dispose(&v350, 8);

        goto LABEL_161;
      }
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v45 = (id)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend((id)v345[5], "count");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v45;
        *(_WORD *)&buf[22] = 2050;
        *(_QWORD *)v369 = v46;
        *(_WORD *)&v369[8] = 2112;
        *(_QWORD *)&v369[10] = v272;
        *(_WORD *)&v369[18] = 2112;
        *(_QWORD *)&v369[20] = v271;
        _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld historical locations of interest between %@ and %@.", buf, 0x34u);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v268 = -[RTAuthorizedLocationVisitLogFetchOptions initWithAscending:dateInterval:limit:]([RTAuthorizedLocationVisitLogFetchOptions alloc], "initWithAscending:dateInterval:limit:", 1, v282, 0);
      v49 = dispatch_semaphore_create(0);
      v373 = 0;
      v374 = &v373;
      v375 = 0x3032000000;
      v376 = __Block_byref_object_copy__46;
      v377 = __Block_byref_object_dispose__46;
      v378 = 0;
      -[RTAuthorizedLocationManager visitLogStore](v301, "visitLogStore");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v335[0] = MEMORY[0x1E0C809B0];
      v335[1] = 3221225472;
      v335[2] = __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke_71;
      v335[3] = &unk_1E9297060;
      v339 = &v373;
      v297 = v47;
      v336 = v297;
      v51 = v48;
      v337 = v51;
      v52 = v49;
      v338 = v52;
      objc_msgSend(v50, "fetchVisitLogsWithOptions:handler:", v268, v335);

      v53 = (id *)(v374 + 5);
      v54 = (id)v374[5];
      v269 = v52;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v269, v56))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "timeIntervalSinceDate:", v55);
        v59 = v58;
        v60 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "filteredArrayUsingPredicate:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "firstObject");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "submitToCoreAnalytics:type:duration:", v64, 1, v59);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v66 = (void *)MEMORY[0x1E0CB35C8];
        v357 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v357, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          v54 = objc_retainAutorelease(v68);

        }
      }

      objc_storeStrong(v53, v54);
      v333 = 0u;
      v334 = 0u;
      v331 = 0u;
      v332 = 0u;
      obj = v51;
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v331, v372, 16);
      if (v69)
      {
        v284 = 0;
        v285 = 0;
        v70 = 0;
        v71 = 0;
        v286 = 0;
        v72 = *(_QWORD *)v332;
        do
        {
          for (i = 0; i != v69; ++i)
          {
            if (*(_QWORD *)v332 != v72)
              objc_enumerationMutation(obj);
            v74 = *(void **)(*((_QWORD *)&v331 + 1) + 8 * i);
            -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "ageDaysRegistry");

            if (v76 < 0)
            {
              objc_msgSend(v294, "timeIntervalSinceDate:", v74);
              v78 = v77;
              -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v80) = llround(v78 / 86400.0);
              objc_msgSend(v79, "setAgeDaysRegistry:", v80);

            }
            buf[0] = 0;
            LOBYTE(v357) = 0;
            if (+[RTAuthorizedLocationVisitLog decodeTimeSourceWithValue:isRetroRegistration:isTrusted:](RTAuthorizedLocationVisitLog, "decodeTimeSourceWithValue:isRetroRegistration:isTrusted:", v74, &v357, buf))
            {
              if (buf[0])
              {
                v81 = v284;
                if (!v284 || (v81 = v284, objc_msgSend(v284, "isOnOrAfter:", v74)))
                {
                  v82 = v74;

                  v284 = v82;
                }
                ++v71;
                v83 = v285;
                if (!v285 || (v83 = v285, objc_msgSend(v285, "isOnOrBefore:", v74)))
                {
                  v84 = v74;

                  v285 = v84;
                }
              }
              ++v286;
              v70 += v357;
            }
          }
          v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v331, v372, 16);
        }
        while (v69);

        if (v286 < 1)
          goto LABEL_55;
        -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v86 = (float)v71 / (float)v286;
        objc_msgSend(v85, "setRegistrationUsesBestTimeFraction:", v86);
      }
      else
      {
        v286 = 0;
        v71 = 0;
        v70 = 0;
        v284 = 0;
        v285 = 0;
        v85 = obj;
      }

LABEL_55:
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        v91 = (objc_class *)objc_opt_class();
        NSStringFromClass(v91);
        v92 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v93 = (id)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v297, "count");
        -[RTAuthorizedLocationVisitLogFetchOptions dateInterval](v268, "dateInterval");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413826;
        *(_QWORD *)&buf[4] = v92;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v93;
        *(_WORD *)&buf[22] = 2050;
        *(_QWORD *)v369 = v94;
        *(_WORD *)&v369[8] = 2112;
        *(_QWORD *)&v369[10] = v95;
        *(_WORD *)&v369[18] = 1026;
        *(_DWORD *)&v369[20] = v71;
        *(_WORD *)&v369[24] = 1026;
        *(_DWORD *)&v369[26] = v286;
        v370 = 1026;
        v371 = v70;
        _os_log_impl(&dword_1D1A22000, v90, OS_LOG_TYPE_DEFAULT, "%@:%@, found %{public}zu UUIDs in visit log store for interval %@ with %{public}d/%{public}d (%{public}d) sources", buf, 0x3Cu);

      }
      v96 = objc_msgSend(v297, "count");
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v97 = objc_claimAutoreleasedReturnValue();
      v98 = os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
      if (v96)
      {
        if (v98)
        {
          v99 = (objc_class *)objc_opt_class();
          NSStringFromClass(v99);
          v100 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v101 = (id)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend((id)v345[5], "count");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v100;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v101;
          *(_WORD *)&buf[22] = 2050;
          *(_QWORD *)v369 = v102;
          _os_log_impl(&dword_1D1A22000, v97, OS_LOG_TYPE_DEFAULT, "%@:%@, starting visit curation, processing %{public}lu LOIs", buf, 0x20u);

        }
        v277 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v329 = 0u;
        v330 = 0u;
        v327 = 0u;
        v328 = 0u;
        v270 = (id)v345[5];
        v103 = objc_msgSend(v270, "countByEnumeratingWithState:objects:count:", &v327, v367, 16);
        if (v103)
        {
          v104 = 0;
          v105 = 0;
          v275 = *(_QWORD *)v328;
          v276 = v103;
          do
          {
            for (j = 0; j != v276; ++j)
            {
              v279 = v105;
              if (*(_QWORD *)v328 != v275)
                objc_enumerationMutation(v270);
              v280 = *(void **)(*((_QWORD *)&v327 + 1) + 8 * j);
              objc_msgSend(v280, "visits");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 1);
              v366 = v107;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v366, 1);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "sortedArrayUsingDescriptors:", v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();

              _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              v110 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
              {
                v111 = (objc_class *)objc_opt_class();
                NSStringFromClass(v111);
                v112 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v113 = (id)objc_claimAutoreleasedReturnValue();
                v114 = objc_msgSend(v109, "count");
                *(_DWORD *)buf = 138413058;
                *(_QWORD *)&buf[4] = v112;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v113;
                *(_WORD *)&buf[22] = 2050;
                *(_QWORD *)v369 = v114;
                *(_WORD *)&v369[8] = 2112;
                *(_QWORD *)&v369[10] = v280;
                _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_DEFAULT, "%@:%@, processing %{public}lu visits for LOI %@.", buf, 0x2Au);

              }
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v304 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v289 = (void *)objc_claimAutoreleasedReturnValue();
              v278 = objc_msgSend(v109, "count");
              v325 = 0u;
              v326 = 0u;
              v323 = 0u;
              v324 = 0u;
              v288 = v109;
              v115 = 0;
              v116 = 0;
              v117 = 0;
              v118 = 0;
              v119 = objc_msgSend(v288, "countByEnumeratingWithState:objects:count:", &v323, v365, 16);
              if (v119)
              {
                v302 = 0;
                v292 = *(_QWORD *)v324;
                v120 = 0.0;
                v121 = -1;
                v299 = -1;
                do
                {
                  v122 = 0;
                  v295 = (id)v119;
                  do
                  {
                    if (*(_QWORD *)v324 != v292)
                      objc_enumerationMutation(v288);
                    v308 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * v122);
                    objc_msgSend(v308, "entryDate");
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v294, "timeIntervalSinceDate:", v123);
                    v125 = v124;
                    v298 = v122;

                    objc_msgSend(v308, "exitDate");
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v308, "entryDate");
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v126, "timeIntervalSinceDate:", v127);
                    v129 = v128;

                    v130 = llround(v125 / 86400.0);
                    v131 = v299;
                    v306 = v130;
                    if (v299 < 0)
                      v131 = v130;
                    v299 = v131;
                    -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                    v132 = (void *)objc_claimAutoreleasedReturnValue();
                    v133 = v306 > (int)objc_msgSend(v132, "ageDaysFirstAnyLoiVisit");

                    if (v133)
                    {
                      -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v134, "setAgeDaysFirstAnyLoiVisit:", v306);

                    }
                    objc_msgSend(v308, "identifier");
                    v135 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v297, "objectForKey:", v135);
                    v136 = (void *)objc_claimAutoreleasedReturnValue();

                    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                    v137 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
                    {
                      v138 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v138);
                      v139 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      v140 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413314;
                      *(_QWORD *)&buf[4] = v139;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v140;
                      *(_WORD *)&buf[22] = 1026;
                      *(_DWORD *)v369 = v136 != 0;
                      *(_WORD *)&v369[4] = 2050;
                      *(double *)&v369[6] = v129;
                      *(_WORD *)&v369[14] = 2112;
                      *(_QWORD *)&v369[16] = v308;
                      _os_log_impl(&dword_1D1A22000, v137, OS_LOG_TYPE_INFO, "%@:%@, processing visit, isRegistered, %{public}d, dwell, %{public}.1f: %@", buf, 0x30u);

                    }
                    if (v136)
                    {
                      objc_msgSend(v308, "entryDate");
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v141, "startOfDay");
                      v142 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v142, "timeIntervalSinceDate:", v304);
                      if (v143 > 86340.0)
                      {
                        v144 = v142;

                        ++v118;
                        v304 = v144;
                      }
                      objc_msgSend(v308, "exitDate");
                      v145 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v145, "startOfDay");
                      v302 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v302, "timeIntervalSinceDate:", v304);
                      v147 = v146;
                      if (v146 > 86340.0)
                      {
                        v148 = v302;

                        v118 = (unint64_t)(ceil(v147 / 86400.0) + (double)v118);
                        v304 = v148;
                      }
                      if (v121 < 0)
                        v121 = v306;
                      objc_msgSend(v308, "identifier");
                      v149 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v297, "objectForKey:", v149);
                      v150 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v150, "locationTechnologyAvailability"));
                      v151 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v289, "addObject:", v151);

                      if (objc_msgSend(v150, "locationTechnologyAvailability"))
                        ++v115;
                      v152 = objc_msgSend(v150, "locationTechnologyAvailability");
                      v153 = objc_msgSend(v150, "locationTechnologyAvailability");

                      v120 = v120 + v129;
                      ++v104;
                      v116 += v152 & 1;
                      v117 += (v153 >> 2) & 1;
                    }
                    v122 = v298 + 1;
                  }
                  while (v295 != (id)(v298 + 1));
                  v119 = objc_msgSend(v288, "countByEnumeratingWithState:objects:count:", &v323, v365, 16);
                }
                while (v119);
              }
              else
              {
                v302 = 0;
                v120 = 0.0;
                v121 = -1;
                v299 = -1;
              }

              v154 = -[RTAuthorizedLocation initWithLoi:dwellTime:numberOfDaysVisited:ageDaysFirstVisit:ageDaysFirstRegisteredVisit:locationTechnologyAvailability:visitsWithTechnologyAnnotation:visitsWithGPS:visitsWithWiFiHI:]([RTAuthorizedLocation alloc], "initWithLoi:dwellTime:numberOfDaysVisited:ageDaysFirstVisit:ageDaysFirstRegisteredVisit:locationTechnologyAvailability:visitsWithTechnologyAnnotation:visitsWithGPS:visitsWithWiFiHI:", v280, v118, v299, v121, -[RTAuthorizedLocationManager _computeLocationTechnologyExpectationFromHistoricalAvailability:](v301, "_computeLocationTechnologyExpectationFromHistoricalAvailability:", v289), v115, v120, v116, v117);
              objc_msgSend(v277, "addObject:", v154);

              v105 = v279 + v278;
            }
            v276 = objc_msgSend(v270, "countByEnumeratingWithState:objects:count:", &v327, v367, 16);
          }
          while (v276);
        }
        else
        {
          v104 = 0;
          v105 = 0;
        }

        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v158 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
        {
          v159 = (objc_class *)objc_opt_class();
          NSStringFromClass(v159);
          v160 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v161 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v160;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v161;
          *(_WORD *)&buf[22] = 1026;
          *(_DWORD *)v369 = v104;
          *(_WORD *)&v369[4] = 1026;
          *(_DWORD *)&v369[6] = v105;
          _os_log_impl(&dword_1D1A22000, v158, OS_LOG_TYPE_DEFAULT, "%@:%@ %{public}d/%{public}d visits registered", buf, 0x22u);

        }
        if (v105 >= 1)
        {
          -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v163 = (float)v104 / (float)v105;
          objc_msgSend(v162, "setVisitRegistrationFraction:", v163);

        }
        v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("dwellTime_s"), 0);
        v364 = v164;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v364, 1);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v277, "sortUsingDescriptors:", v165);

        v296 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v321 = 0u;
        v322 = 0u;
        v319 = 0u;
        v320 = 0u;
        v300 = v277;
        v305 = objc_msgSend(v300, "countByEnumeratingWithState:objects:count:", &v319, v363, 16);
        if (v305)
        {
          v290 = 0;
          v303 = *(_QWORD *)v320;
          v291 = *MEMORY[0x1E0D18598];
          v293 = *MEMORY[0x1E0CB2D50];
          do
          {
            for (k = 0; k != v305; ++k)
            {
              if (*(_QWORD *)v320 != v303)
                objc_enumerationMutation(v300);
              v166 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * k);
              objc_msgSend(v166, "dwellTime_s");
              if (v167 <= 86400.0
                || objc_msgSend(v166, "numberOfDaysVisited") < 4
                || (unint64_t)objc_msgSend(v296, "count") > 3)
              {
                _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                v168 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
                {
                  v172 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v172);
                  v173 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v174 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v173;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v174;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)v369 = v166;
                  _os_log_impl(&dword_1D1A22000, v168, OS_LOG_TYPE_DEFAULT, "%@:%@, skipping ALOI, %@.", buf, 0x20u);

                }
              }
              else
              {
                ++v290;
                objc_msgSend(v166, "setRank:");
                objc_msgSend(v296, "addObject:", v166);
                _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                v168 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
                {
                  v169 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v169);
                  v170 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v171 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v170;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v171;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)v369 = v166;
                  _os_log_impl(&dword_1D1A22000, v168, OS_LOG_TYPE_DEFAULT, "%@:%@, appending ALOI, %@.", buf, 0x20u);

                }
              }

              if (objc_msgSend(v166, "rank") == 1)
              {
                -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                v175 = (void *)objc_claimAutoreleasedReturnValue();

                if (v175)
                {
                  v176 = objc_msgSend(v166, "ageDaysFirstVisit");
                  -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                  v177 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v177, "setAgeDaysFirstTopLoiVisit:", v176);

                  v178 = objc_msgSend(v166, "ageDaysFirstRegisteredVisit");
                  -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                  v179 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v179, "setAgeDaysFirstTopLoiRegisteredVisit:", v178);

                  v180 = objc_msgSend(v166, "visitsWithTechnologyAnnotation");
                  -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                  v181 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v181, "setVisitsToTopLOIWithTechAvailabilityKnown:", v180);

                  if (objc_msgSend(v166, "visitsWithTechnologyAnnotation") >= 1)
                  {
                    v182 = objc_msgSend(v166, "visitsWithGPS");
                    v183 = objc_msgSend(v166, "visitsWithTechnologyAnnotation");
                    -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                    v184 = (void *)objc_claimAutoreleasedReturnValue();
                    *(float *)&v185 = (float)v182 / (float)v183;
                    objc_msgSend(v184, "setFractionOfVisitsToTopLOIWithGPS:", v185);

                    v186 = objc_msgSend(v166, "visitsWithWiFiHI");
                    v187 = objc_msgSend(v166, "visitsWithTechnologyAnnotation");
                    -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                    v188 = (void *)objc_claimAutoreleasedReturnValue();
                    *(float *)&v189 = (float)v186 / (float)v187;
                    objc_msgSend(v188, "setFractionOfVisitsToTopLOIWithWiFiHI:", v189);

                  }
                }
                -[RTAuthorizedLocationManager learnedLocationManager](v301, "learnedLocationManager");
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v190, "learnedLocationStore");
                v191 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "loi");
                v192 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v192, "location");
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v193, "location");
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v191, "predicateForVisitsWithinDistance:location:", v194, 200.0);
                v307 = (void *)objc_claimAutoreleasedReturnValue();

                v195 = dispatch_semaphore_create(0);
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x3032000000;
                *(_QWORD *)v369 = __Block_byref_object_copy__46;
                *(_QWORD *)&v369[8] = __Block_byref_object_dispose__46;
                *(_QWORD *)&v369[16] = 0;
                v357 = 0;
                v358 = &v357;
                v359 = 0x3032000000;
                v360 = __Block_byref_object_copy__46;
                v361 = __Block_byref_object_dispose__46;
                v362 = 0;
                -[RTAuthorizedLocationManager learnedLocationManager](v301, "learnedLocationManager");
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v196, "learnedLocationStore");
                v197 = (void *)objc_claimAutoreleasedReturnValue();
                v314[0] = MEMORY[0x1E0C809B0];
                v314[1] = 3221225472;
                v314[2] = __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke_78;
                v314[3] = &unk_1E929B0C8;
                v316 = buf;
                v314[4] = v301;
                v317 = &v357;
                v318 = a2;
                v198 = v195;
                v315 = v198;
                objc_msgSend(v197, "fetchVisitsWithPredicate:ascending:dateInterval:limit:handler:", v307, 1, v282, &unk_1E9327CB0, v314);

                v199 = (id *)(*(_QWORD *)&buf[8] + 40);
                v200 = *(id *)(*(_QWORD *)&buf[8] + 40);
                v201 = v198;
                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v202 = (void *)objc_claimAutoreleasedReturnValue();
                v203 = dispatch_time(0, 3600000000000);
                if (dispatch_semaphore_wait(v201, v203))
                {
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v204 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v204, "timeIntervalSinceDate:", v202);
                  v206 = v205;
                  v207 = (void *)objc_opt_new();
                  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v209, "filteredArrayUsingPredicate:", v208);
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v210, "firstObject");
                  v211 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v207, "submitToCoreAnalytics:type:duration:", v211, 1, v206);
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v212 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v212, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)v380 = 0;
                    _os_log_fault_impl(&dword_1D1A22000, v212, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v380, 2u);
                  }

                  v213 = (void *)MEMORY[0x1E0CB35C8];
                  v379 = v293;
                  *(_QWORD *)v380 = CFSTR("semaphore wait timeout");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v380, &v379, 1);
                  v214 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v213, "errorWithDomain:code:userInfo:", v291, 15, v214);
                  v215 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v215)
                  {
                    v200 = objc_retainAutorelease(v215);

                  }
                }

                objc_storeStrong(v199, v200);
                v216 = (void *)v358[5];
                if (v216)
                {
                  objc_msgSend(v216, "entryDate");
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v294, "timeIntervalSinceDate:", v217);
                  v219 = v218;
                  -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
                  v220 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v221) = llround(v219 / 86400.0);
                  objc_msgSend(v220, "setAgeDaysFirstTopLoiGeoVisit:", v221);

                }
                _Block_object_dispose(&v357, 8);

                _Block_object_dispose(buf, 8);
              }
            }
            v305 = objc_msgSend(v300, "countByEnumeratingWithState:objects:count:", &v319, v363, 16);
          }
          while (v305);
        }

        if (objc_msgSend(v296, "count"))
        {
          objc_storeStrong((id *)&v301->_authorizedLocationArr, v296);
          v222 = v294;
          p_super = &v301->_dateOfLastAuthorizedLocationsCuration->super;
          v301->_dateOfLastAuthorizedLocationsCuration = v222;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            v228 = (objc_class *)objc_opt_class();
            NSStringFromClass(v228);
            v229 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v230 = (id)objc_claimAutoreleasedReturnValue();
            v231 = -[NSArray count](v301->_authorizedLocationArr, "count");
            dateOfLastAuthorizedLocationsCuration = v301->_dateOfLastAuthorizedLocationsCuration;
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = v229;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v230;
            *(_WORD *)&buf[22] = 2050;
            *(_QWORD *)v369 = v231;
            *(_WORD *)&v369[8] = 2112;
            *(_QWORD *)&v369[10] = dateOfLastAuthorizedLocationsCuration;
            *(_WORD *)&v369[18] = 2050;
            *(double *)&v369[20] = v8;
            _os_log_impl(&dword_1D1A22000, p_super, OS_LOG_TYPE_DEFAULT, "%@:%@, zero authorized locations created during current curation, retaining previously generated list of length %{public}lu, creation, %@, age, %{public}.1f.", buf, 0x34u);

          }
        }

        -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
        v233 = (void *)objc_claimAutoreleasedReturnValue();

        if (v233)
        {
          -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v235) = 0;
          objc_msgSend(v234, "setMaxCumulativeDwellTimeForNotFamiliarLoiHours:", v235);

          -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v236, "setMaxUniqueVisitDaysForNotFamiliarLois:", 0);

          v237 = objc_msgSend(v300, "count");
          if (v237 > -[NSArray count](v301->_authorizedLocationArr, "count"))
          {
            objc_msgSend(v300, "objectAtIndexedSubscript:", -[NSArray count](v301->_authorizedLocationArr, "count"));
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "dwellTime_s");
            v240 = v239;
            -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v242 = v240;
            objc_msgSend(v241, "setMaxCumulativeDwellTimeForNotFamiliarLoiHours:", v242);

            objc_msgSend(v300, "objectAtIndexedSubscript:", -[NSArray count](v301->_authorizedLocationArr, "count"));
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            v244 = objc_msgSend(v243, "numberOfDaysVisited");
            -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v245, "setMaxUniqueVisitDaysForNotFamiliarLois:", v244);

          }
        }
        v312 = 0u;
        v313 = 0u;
        v310 = 0u;
        v311 = 0u;
        v246 = v301->_authorizedLocationArr;
        v247 = -[NSArray countByEnumeratingWithState:objects:count:](v246, "countByEnumeratingWithState:objects:count:", &v310, v356, 16);
        if (v247)
        {
          v248 = *(_QWORD *)v311;
          do
          {
            for (m = 0; m != v247; ++m)
            {
              if (*(_QWORD *)v311 != v248)
                objc_enumerationMutation(v246);
              v250 = *(_QWORD *)(*((_QWORD *)&v310 + 1) + 8 * m);
              _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              v251 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
              {
                v252 = (objc_class *)objc_opt_class();
                NSStringFromClass(v252);
                v253 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v254 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v253;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v254;
                *(_WORD *)&buf[22] = 2112;
                *(_QWORD *)v369 = v250;
                _os_log_impl(&dword_1D1A22000, v251, OS_LOG_TYPE_DEFAULT, "%@:%@: Ranked Authorized Locations: %@.", buf, 0x20u);

              }
            }
            v247 = -[NSArray countByEnumeratingWithState:objects:count:](v246, "countByEnumeratingWithState:objects:count:", &v310, v356, 16);
          }
          while (v247);
        }

        v255 = 0;
        if (v285)
        {
          if (v284)
          {
            objc_msgSend(v285, "timeIntervalSinceDate:", v284);
            v255 = 0;
            if (v256 > 604800.0 && v286 >= 21)
            {
              -[RTAuthorizedLocationMetrics curationMetrics](v301->_metrics, "curationMetrics");
              v257 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v257, "registrationUsesBestTimeFraction");
              v255 = v258 > 0.999999;

            }
          }
        }
        if (v301->_allowUnsecureTimeFallback == v255)
        {
          -[RTAuthorizedLocationManager visitLogStore](v301, "visitLogStore");
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          v260 = objc_msgSend(v259, "setTrustedTimeRecentAvailability:", v255);

          if (v260)
          {
            _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            v261 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
            {
              v262 = (objc_class *)objc_opt_class();
              NSStringFromClass(v262);
              v263 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v264 = (id)objc_claimAutoreleasedReturnValue();
              v265 = v264;
              allowUnsecureTimeFallback = v301->_allowUnsecureTimeFallback;
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v263;
              if (allowUnsecureTimeFallback)
                v267 = "YES";
              else
                v267 = "NO";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v264;
              *(_WORD *)&buf[22] = 2082;
              *(_QWORD *)v369 = v267;
              _os_log_impl(&dword_1D1A22000, v261, OS_LOG_TYPE_DEFAULT, "%@:%@ changing allowUnsecureTimeFallback flag to %{public}s", buf, 0x20u);

            }
            v301->_allowUnsecureTimeFallback = !v255;
          }
        }
        v274[2](v274, 0);

      }
      else
      {
        if (v98)
        {
          v155 = (objc_class *)objc_opt_class();
          NSStringFromClass(v155);
          v156 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v156;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v157;
          _os_log_impl(&dword_1D1A22000, v97, OS_LOG_TYPE_DEFAULT, "%@:%@, unable to curate authorized locations with empty visit log.", buf, 0x16u);

        }
        v274[2](v274, 0);
      }

      _Block_object_dispose(&v373, 8);
      v40 = 0;
      goto LABEL_160;
    }
    if (v7 > 3600.0)
      goto LABEL_14;
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v87 = (objc_class *)objc_opt_class();
      NSStringFromClass(v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v88;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v89;
      *(_WORD *)&buf[22] = 2050;
      *(double *)v369 = v8;
      *(_WORD *)&v369[8] = 2050;
      *(_QWORD *)&v369[10] = 0x40AC200000000000;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: time since last authorized location curation %{public}.0f seconds, less than threshold %{public}.0f seconds. Not regenerating authorized location list.", buf, 0x2Au);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time now. Not regenerating authorized location list.", buf, 0x16u);

    }
  }

  v274[2](v274, 0);
  v40 = 0;
LABEL_161:

}

void __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (!v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v12, "visitIdentifier", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v12, v14);

          v15 = *(void **)(a1 + 40);
          objc_msgSend(v12, "registrationDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v15 = 138412802;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@, earliest visit to vicinity of LOI: %@.", (uint8_t *)&v15, 0x20u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)curateAuthorizedLocationsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTAuthorizedLocationManager curateAuthorizedLocationsWithHandler:]";
      v12 = 1024;
      v13 = 1302;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__RTAuthorizedLocationManager_curateAuthorizedLocationsWithHandler___block_invoke;
  v8[3] = &unk_1E9297650;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __68__RTAuthorizedLocationManager_curateAuthorizedLocationsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_curateAuthorizedLocationsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_assertMotionConsistencyForLocations:(id)a3 positionUncertaintyRate:(double)a4
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  _BOOL4 v34;
  objc_class *v35;
  BOOL v36;
  objc_class *v37;
  void *v38;
  void *v39;
  int v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 <= 1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138412546;
      v42 = v11;
      v43 = 2112;
      v44 = v12;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@:%@ invoked with fewer than two locations, returning NO.", (uint8_t *)&v41, 0x16u);
LABEL_9:

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138413058;
    v42 = v14;
    v43 = 2112;
    v44 = v15;
    v45 = 2112;
    v46 = *(double *)&v16;
    v47 = 2112;
    v48 = *(double *)&v17;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ invoked with two or more locations, start location, %@, end location, %@.", (uint8_t *)&v41, 0x2Au);

  }
  objc_msgSend(v6, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timestamp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v21);
  v23 = fabs(v22);

  objc_msgSend(v6, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "distanceFromLocation:", v25);
  v27 = v26;

  objc_msgSend(v6, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "horizontalAccuracy");
  v30 = v29;
  objc_msgSend(v6, "lastObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "horizontalAccuracy");
  v33 = (v30 + v32) * 3.0;

  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  v34 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v27 > v33 + a4 * v23)
  {
    if (v34)
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138413826;
      v42 = v11;
      v43 = 2112;
      v44 = v12;
      v45 = 2050;
      v46 = v27;
      v47 = 2050;
      v48 = v23;
      v49 = 2050;
      v50 = v33;
      v51 = 2050;
      v52 = a4;
      v53 = 2050;
      v54 = v33 + a4 * v23;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ distance, %{public}.1f, duration, %{public}.1f, accuracy, %{public}.1f, position uncertainty rate, %{public}.2f, distance threshold, %{public}.1f, location batch is not consistent.", (uint8_t *)&v41, 0x48u);
      goto LABEL_9;
    }
LABEL_10:
    v36 = 0;
    goto LABEL_14;
  }
  if (v34)
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138413826;
    v42 = v38;
    v43 = 2112;
    v44 = v39;
    v45 = 2050;
    v46 = v27;
    v47 = 2050;
    v48 = v23;
    v49 = 2050;
    v50 = v33;
    v51 = 2050;
    v52 = a4;
    v53 = 2050;
    v54 = v33 + a4 * v23;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ distance, %{public}.1f, duration, %{public}.1f, accuracy, %{public}.1f, position uncertainty rate, %{public}.2f, distance threshold, %{public}.1f, location batch is consistent.", (uint8_t *)&v41, 0x48u);

  }
  v36 = 1;
LABEL_14:

  return v36;
}

- (double)_positionUncertaintyRateFromMotionActivity:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  RTMotionActivityHistogram *v11;
  void *v12;
  void *v13;
  RTMotionActivityHistogram *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  double v32;
  objc_class *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  const char *v42;
  objc_class *v43;
  NSObject *p_super;
  id v46;
  id v47;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  _BYTE v59[14];
  __int16 v60;
  double v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v55 = v9;
    v56 = 2112;
    v57 = v10;
    v58 = 2112;
    *(_QWORD *)v59 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@, processing motion activity on date interval %@.", buf, 0x20u);

  }
  if (v5)
  {
    v11 = [RTMotionActivityHistogram alloc];
    objc_msgSend(v6, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v6;
    objc_msgSend(v6, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v5;
    v14 = -[RTMotionActivityHistogram initWithActivites:betweenDate:andDate:](v11, "initWithActivites:betweenDate:andDate:", v5, v12, v13);

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    p_super = &v14->super;
    -[RTMotionActivityHistogram binsSortedByInterval](v14, "binsSortedByInterval");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v51;
      v18 = 40.0;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v51 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "type");
          if (v21 > 6)
            v22 = 40.0;
          else
            v22 = dbl_1D1EED398[v21];
          objc_msgSend(v20, "interval");
          v24 = v23;
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v20, "type");
            objc_msgSend(v20, "interval");
            *(_DWORD *)buf = 138413314;
            v55 = v27;
            v56 = 2112;
            v57 = v28;
            v58 = 1026;
            *(_DWORD *)v59 = v29;
            *(_WORD *)&v59[4] = 2048;
            *(_QWORD *)&v59[6] = v30;
            v60 = 2048;
            v61 = v22;
            _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@, motion activity, %{public}d, cumulative interval %.3f s, position uncertainty rate, %.3f.", buf, 0x30u);

          }
          v18 = v18 + v22 * v24;

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 40.0;
    }

    v31 = p_super;
    -[NSObject totalInterval](p_super, "totalInterval");
    if (v36 <= 0.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v38 = objc_claimAutoreleasedReturnValue();
      v32 = 2.0;
      v5 = v47;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v55 = v40;
        v56 = 2112;
        v57 = v41;
        v58 = 2050;
        *(_QWORD *)v59 = 0x4000000000000000;
        v42 = "%@:%@, using default position uncertainty rate, %{public}f mps.";
        goto LABEL_25;
      }
    }
    else
    {
      -[NSObject totalInterval](p_super, "totalInterval");
      v32 = v18 / v37;
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v38 = objc_claimAutoreleasedReturnValue();
      v5 = v47;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v55 = v40;
        v56 = 2112;
        v57 = v41;
        v58 = 2050;
        *(double *)v59 = v32;
        v42 = "%@:%@, using weighted average position uncertainty rate from motion activity, %{public}f mps.";
LABEL_25:
        _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEFAULT, v42, buf, 0x20u);

      }
    }

    v6 = v46;
    goto LABEL_27;
  }
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = 2.0;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v55 = v34;
    v56 = 2112;
    v57 = v35;
    v58 = 2050;
    *(_QWORD *)v59 = 0x4000000000000000;
    _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@, no motion activity, defaulting to %{public}f mps.", buf, 0x20u);

  }
LABEL_27:

  return v32;
}

- (BOOL)_assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation:(id)a3 visit:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  id v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  objc_class *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void *v37;
  void *v38;
  __int128 v39;
  dispatch_semaphore_t v40;
  RTLocationManager *locationManager;
  NSObject *v42;
  id v43;
  id *v44;
  NSObject *v45;
  void *v46;
  dispatch_time_t v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  BOOL v77;
  dispatch_semaphore_t v78;
  RTMotionActivityManager *motionActivityManager;
  void *v80;
  void *v81;
  NSObject *v82;
  id *v83;
  id v84;
  void *v85;
  dispatch_time_t v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  int v102;
  NSObject *v103;
  objc_class *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  char v110;
  objc_class *v111;
  id v112;
  id v113;
  uint64_t v114;
  double v115;
  double v116;
  NSObject *v117;
  objc_class *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  id v128;
  void *v129;
  void *v130;
  uint64_t v131;
  id v132;
  void *v133;
  uint64_t v134;
  objc_class *v135;
  id v136;
  void *v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  double v139;
  NSObject *v140;
  objc_class *v141;
  id v142;
  void *v143;
  void *v144;
  objc_class *v145;
  id v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  __int128 v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  id v157;
  NSObject *v158;
  void *v159;
  uint64_t v161;
  uint64_t v162;
  NSObject *dsema;
  uint64_t v164;
  void *v165;
  NSObject *log;
  void *v167;
  void *v168;
  RTAuthorizedLocationManager *v169;
  NSObject *v170;
  int v171;
  _QWORD v172[4];
  NSObject *v173;
  uint64_t *v174;
  _BYTE *v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _QWORD v180[4];
  NSObject *v181;
  _BYTE *v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t (*v187)(uint64_t, uint64_t);
  void (*v188)(uint64_t);
  id v189;
  _BYTE v190[12];
  __int16 v191;
  id v192;
  __int16 v193;
  uint64_t v194;
  __int16 v195;
  NSObject *v196;
  uint64_t v197;
  uint64_t *v198;
  uint64_t v199;
  uint64_t (*v200)(uint64_t, uint64_t);
  void (*v201)(uint64_t);
  id v202;
  _BYTE v203[24];
  uint64_t (*v204)(uint64_t, uint64_t);
  __int128 v205;
  uint8_t v206[128];
  _BYTE buf[24];
  uint64_t (*v208)(uint64_t, uint64_t);
  _BYTE v209[20];
  _QWORD v210[4];

  v210[1] = *MEMORY[0x1E0C80C00];
  v154 = a3;
  v157 = a4;
  v169 = self;
  -[RTAuthorizedLocationManager trustedTimeNow](self, "trustedTimeNow");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v159)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v28;
      _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time now, cannot verify motion and location consistency.", buf, 0x16u);

    }
    v29 = 0;
    goto LABEL_92;
  }
  objc_msgSend(v157, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_10;
  v7 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v157, "entry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTimeInterval:sinceDate:", v8, 300.0);

  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate");
    v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v208 = v14;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@, setting endTime to currentVisit.entry: %@.", buf, 0x20u);

  }
  if (v9)
  {
    if (objc_msgSend(v159, "isBeforeDate:", v9))
    {
      v15 = v159;

      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringFromDate");
        v20 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v208 = v20;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@, trustedNow is before user-time currentVisit.entry, overriding endTime with trustedNow: %@.", buf, 0x20u);

      }
    }
    else
    {
      v15 = v9;
    }
  }
  else
  {
LABEL_10:
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "stringFromDate");
      v25 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      v208 = v25;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@, currentVisit.entry has no value setting endTime to trustedNow: %@.", buf, 0x20u);

    }
    v15 = v159;
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v15, -21600.0);
  v158 = v15;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v158, -5400.0);
  v167 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v158, -1200.0);
  objc_msgSend(v30, "laterDate:", v169->_mostRecentDateAtWhichDeviceDataIsTrusted);
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "laterDate:", v169->_mostRecentDateAtWhichDeviceDataIsTrusted);
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "stringFromDate");
    v36 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "stringFromDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject stringFromDate](v158, "stringFromDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    v208 = v36;
    *(_WORD *)v209 = 2112;
    *(_QWORD *)&v209[2] = v37;
    *(_WORD *)&v209[10] = 2112;
    *(_QWORD *)&v209[12] = v38;
    _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@, applying check between lookbackStartEpoch %@,  stringentLookbackStartEpoch %@ and endTime %@.", buf, 0x34u);

  }
  v164 = 0;
  v161 = *MEMORY[0x1E0D18598];
  v162 = *MEMORY[0x1E0CB2D50];
  v171 = *MEMORY[0x1E0C9E518];
  *(_QWORD *)&v39 = 138412802;
  v152 = v39;
  log = v158;
  do
  {
    v170 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v167, log);
    v168 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:ascending:", v170, 0, 1, 100.0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v208 = __Block_byref_object_copy__46;
    *(_QWORD *)v209 = __Block_byref_object_dispose__46;
    *(_QWORD *)&v209[8] = 0;
    v184 = 0;
    v185 = &v184;
    v186 = 0x3032000000;
    v187 = __Block_byref_object_copy__46;
    v188 = __Block_byref_object_dispose__46;
    v189 = 0;
    v40 = dispatch_semaphore_create(0);
    locationManager = v169->_locationManager;
    v180[0] = MEMORY[0x1E0C809B0];
    v180[1] = 3221225472;
    v180[2] = __117__RTAuthorizedLocationManager__assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation_visit___block_invoke;
    v180[3] = &unk_1E9296EE0;
    v182 = buf;
    v183 = &v184;
    v42 = v40;
    v181 = v42;
    -[RTLocationManager fetchStoredLocationsWithOptions:handler:](locationManager, "fetchStoredLocationsWithOptions:handler:", v168, v180);
    v44 = (id *)(*(_QWORD *)&buf[8] + 40);
    v43 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v45 = v42;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v45, v47))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "timeIntervalSinceDate:", v46);
      v50 = v49;
      v51 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "filteredArrayUsingPredicate:", v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "submitToCoreAnalytics:type:duration:", v55, 1, v50);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v203 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v203, 2u);
      }

      v57 = (void *)MEMORY[0x1E0CB35C8];
      v197 = v162;
      *(_QWORD *)v203 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v203, &v197, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "errorWithDomain:code:userInfo:", v161, 15, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        v43 = objc_retainAutorelease(v59);

      }
    }

    objc_storeStrong(v44, v43);
    v60 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (!v60)
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v65 = (objc_class *)objc_opt_class();
        NSStringFromClass(v65);
        v66 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend((id)v185[5], "count");
        *(_DWORD *)v203 = 138413058;
        *(_QWORD *)&v203[4] = v66;
        *(_WORD *)&v203[12] = 2112;
        *(_QWORD *)&v203[14] = v67;
        *(_WORD *)&v203[22] = 2050;
        v204 = (uint64_t (*)(uint64_t, uint64_t))v68;
        LOWORD(v205) = 2112;
        *(_QWORD *)((char *)&v205 + 2) = v170;
        _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld locations for date interval %@.", v203, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = 0u;
      v179 = 0u;
      v176 = 0u;
      v177 = 0u;
      v69 = (id)v185[5];
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v176, v206, 16);
      if (!v70)
        goto LABEL_44;
      v71 = *(_QWORD *)v177;
LABEL_34:
      v72 = 0;
      while (1)
      {
        if (*(_QWORD *)v177 != v71)
          objc_enumerationMutation(v69);
        v73 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * v72);
        objc_msgSend(v73, "sourceInformation", v152);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "isSimulatedBySoftware");

        if (v75)
        {
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v103 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            v104 = (objc_class *)objc_opt_class();
            NSStringFromClass(v104);
            v105 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v203 = 138412546;
            *(_QWORD *)&v203[4] = v105;
            *(_WORD *)&v203[12] = 2112;
            *(_QWORD *)&v203[14] = v106;
            _os_log_impl(&dword_1D1A22000, v103, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection 9.", v203, 0x16u);

          }
          -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if (v107)
          {
            -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "setRejectionReasonCode:", 9);

          }
          goto LABEL_61;
        }
        objc_msgSend(v73, "sourceInformation");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v76, "isProducedByAccessory") & 1) != 0)
          break;
        v77 = objc_msgSend(v73, "integrity") == v171;

        if (!v77)
          goto LABEL_41;
LABEL_42:
        if (v70 == ++v72)
        {
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v176, v206, 16);
          if (v70)
            goto LABEL_34;
LABEL_44:

          *(_QWORD *)v203 = 0;
          *(_QWORD *)&v203[8] = v203;
          *(_QWORD *)&v203[16] = 0x3032000000;
          v204 = __Block_byref_object_copy__46;
          *(_QWORD *)&v205 = __Block_byref_object_dispose__46;
          *((_QWORD *)&v205 + 1) = 0;
          v197 = 0;
          v198 = &v197;
          v199 = 0x3032000000;
          v200 = __Block_byref_object_copy__46;
          v201 = __Block_byref_object_dispose__46;
          v202 = 0;
          v78 = dispatch_semaphore_create(0);
          motionActivityManager = v169->_motionActivityManager;
          -[NSObject startDate](v170, "startDate");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject endDate](v170, "endDate");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v172[0] = MEMORY[0x1E0C809B0];
          v172[1] = 3221225472;
          v172[2] = __117__RTAuthorizedLocationManager__assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation_visit___block_invoke_82;
          v172[3] = &unk_1E9296EE0;
          v174 = &v197;
          v175 = v203;
          v82 = v78;
          v173 = v82;
          -[RTMotionActivityManager fetchMotionActivitiesFromStartDate:endDate:handler:](motionActivityManager, "fetchMotionActivitiesFromStartDate:endDate:handler:", v80, v81, v172);

          v83 = (id *)(v198 + 5);
          v84 = (id)v198[5];
          dsema = v82;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = dispatch_time(0, 3600000000000);
          if (dispatch_semaphore_wait(dsema, v86))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "timeIntervalSinceDate:", v85);
            v88 = v87;
            v155 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "filteredArrayUsingPredicate:", v89);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "firstObject");
            v92 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v155, "submitToCoreAnalytics:type:duration:", v92, 1, v88);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v93 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v190 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v93, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v190, 2u);
            }

            v94 = (void *)MEMORY[0x1E0CB35C8];
            v210[0] = v162;
            *(_QWORD *)v190 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v190, v210, 1);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "errorWithDomain:code:userInfo:", v161, 15, v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();

            if (v96)
            {
              v84 = objc_retainAutorelease(v96);

            }
          }

          objc_storeStrong(v83, v84);
          v97 = v198[5];
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v98 = objc_claimAutoreleasedReturnValue();
          v99 = v98;
          if (v97)
          {
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              v145 = (objc_class *)objc_opt_class();
              NSStringFromClass(v145);
              v146 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              v148 = v198[5];
              *(_DWORD *)v190 = v152;
              *(_QWORD *)&v190[4] = v146;
              v191 = 2112;
              v192 = v147;
              v193 = 2112;
              v194 = v148;
              _os_log_error_impl(&dword_1D1A22000, v99, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch motion activity: %@.", v190, 0x20u);

            }
            -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
            v100 = (void *)objc_claimAutoreleasedReturnValue();

            if (v100)
            {
              -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "setHistoricalRejectionReasonCode:", 8);
              goto LABEL_54;
            }
LABEL_85:
            v102 = 1;
LABEL_88:

            _Block_object_dispose(&v197, 8);
            _Block_object_dispose(v203, 8);

LABEL_62:
            goto LABEL_63;
          }
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            v111 = (objc_class *)objc_opt_class();
            NSStringFromClass(v111);
            v112 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v113 = (id)objc_claimAutoreleasedReturnValue();
            v114 = objc_msgSend(*(id *)(*(_QWORD *)&v203[8] + 40), "count");
            *(_DWORD *)v190 = 138413058;
            *(_QWORD *)&v190[4] = v112;
            v191 = 2112;
            v192 = v113;
            v193 = 2050;
            v194 = v114;
            v195 = 2112;
            v196 = v170;
            _os_log_impl(&dword_1D1A22000, v99, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld motion activities for date interval %@.", v190, 0x2Au);

          }
          -[RTAuthorizedLocationManager _positionUncertaintyRateFromMotionActivity:dateInterval:](v169, "_positionUncertaintyRateFromMotionActivity:dateInterval:", *(_QWORD *)(*(_QWORD *)&v203[8] + 40), v170);
          v116 = v115;
          if (!-[RTAuthorizedLocationManager _assertMotionConsistencyForLocations:positionUncertaintyRate:](v169, "_assertMotionConsistencyForLocations:positionUncertaintyRate:", v64)&& (unint64_t)objc_msgSend(v64, "count") >= 2)
          {
            _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            v117 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
            {
              v118 = (objc_class *)objc_opt_class();
              NSStringFromClass(v118);
              v119 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v190 = v152;
              *(_QWORD *)&v190[4] = v119;
              v191 = 2112;
              v192 = v120;
              v193 = 2112;
              v194 = (uint64_t)v170;
              _os_log_impl(&dword_1D1A22000, v117, OS_LOG_TYPE_DEFAULT, "%@:%@, motion-derived position uncertainty rate inconsistent with locations for date interval %@.", v190, 0x20u);

            }
            -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
            v121 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v121)
              goto LABEL_85;
            -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v123 = v116;
            objc_msgSend(v122, "setHistoricalRejectionSpeedMps:", v123);

            -[NSObject timeIntervalSinceDate:](v158, "timeIntervalSinceDate:", log);
            v125 = v124;
            -[NSObject timeIntervalSinceDate:](v158, "timeIntervalSinceDate:", v167);
            v127 = v126;
            -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "setMotionSpeedLimitRejectionCodeFromLookbackHours:", (v125 + v127) * 0.5 / 3600.0);
            goto LABEL_54;
          }
          ++v164;
          if ((unint64_t)objc_msgSend(v64, "count", v152) < 2)
          {
            -[NSObject timeIntervalSinceDate:](log, "timeIntervalSinceDate:", v167);
            if (v139 > 3600.0 && objc_msgSend(v167, "isOnOrAfter:", v153))
            {
              _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              v140 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
              {
                v141 = (objc_class *)objc_opt_class();
                NSStringFromClass(v141);
                v142 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v190 = 138413058;
                *(_QWORD *)&v190[4] = v142;
                v191 = 2112;
                v192 = v143;
                v193 = 2112;
                v194 = (uint64_t)v167;
                v195 = 2112;
                v196 = log;
                _os_log_impl(&dword_1D1A22000, v140, OS_LOG_TYPE_DEFAULT, "%@:%@, no locations recorded on interval between %@ and %@, cannot assert location history.", v190, 0x2Au);

              }
              -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
              v144 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v144)
                goto LABEL_85;
              -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "setHistoricalRejectionReasonCode:", 7);
LABEL_54:
              v102 = 1;
            }
            else
            {
              v102 = 0;
              v101 = v167;
              v167 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v167, -1200.0);
            }
          }
          else
          {
            v128 = objc_alloc(MEMORY[0x1E0C99D68]);
            objc_msgSend(v64, "firstObject");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "timestamp");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = objc_msgSend(v128, "initWithTimeInterval:sinceDate:", v130, -1200.0);

            v132 = objc_alloc(MEMORY[0x1E0C99D68]);
            objc_msgSend(v64, "firstObject");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "timestamp");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = objc_msgSend(v132, "initWithTimeInterval:sinceDate:", v133, 0.01);

            v102 = 0;
            log = v134;
            v167 = (void *)v131;
          }

          goto LABEL_88;
        }
      }

LABEL_41:
      objc_msgSend(v64, "addObject:", v73);
      goto LABEL_42;
    }
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v135 = (objc_class *)objc_opt_class();
      NSStringFromClass(v135);
      v136 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v203 = v152;
      *(_QWORD *)&v203[4] = v136;
      *(_WORD *)&v203[12] = 2112;
      *(_QWORD *)&v203[14] = v137;
      *(_WORD *)&v203[22] = 2112;
      v204 = v138;
      _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch location: %@.", v203, 0x20u);

    }
    -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setHistoricalRejectionReasonCode:", 8);
LABEL_61:
      v102 = 1;
      goto LABEL_62;
    }
    v102 = 1;
LABEL_63:

    _Block_object_dispose(&v184, 8);
    _Block_object_dispose(buf, 8);

    v29 = v102 == 0;
    if (v102)
      goto LABEL_91;
    v109 = objc_msgSend(v167, "isAfterDate:", v165);
    if (v164 < 20)
      v110 = v109;
    else
      v110 = 0;
  }
  while ((v110 & 1) != 0);
  -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  if (v149)
  {
    -[RTAuthorizedLocationMetrics queryMetrics](v169->_metrics, "queryMetrics");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setHistoricalRejectionReasonCode:", 0);

  }
LABEL_91:

LABEL_92:
  return v29;
}

void __117__RTAuthorizedLocationManager__assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation_visit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __117__RTAuthorizedLocationManager__assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation_visit___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_assertRecentLocationTechnologyQualityForAuthorizedLocation:(id)a3 visit:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  objc_class *v13;
  id v14;
  id v15;
  dispatch_semaphore_t v16;
  RTLocationManager *locationManager;
  NSObject *v18;
  id *v19;
  id v20;
  void *v21;
  dispatch_time_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  objc_class *v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  int v56;
  double v57;
  double v58;
  double v59;
  double v60;
  NSObject *v61;
  objc_class *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  NSObject *v71;
  BOOL v72;
  NSObject *v73;
  objc_class *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  int v80;
  unsigned int v81;
  int v82;
  int v83;
  BOOL v84;
  char v85;
  NSObject *v86;
  objc_class *v87;
  id v88;
  id v89;
  NSObject *v90;
  objc_class *v91;
  id v92;
  id v93;
  NSObject *v94;
  objc_class *v95;
  id v96;
  id v97;
  objc_class *v98;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  NSObject *v104;
  objc_class *v105;
  void *v106;
  void *v107;
  void *v108;
  BOOL v109;
  NSObject *v110;
  objc_class *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  NSObject *v117;
  objc_class *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  char v125;
  _BOOL8 v126;
  NSObject *v127;
  _BOOL4 v128;
  objc_class *v129;
  id v130;
  void *v131;
  void *v132;
  NSObject *v133;
  objc_class *v134;
  id v135;
  void *v136;
  void *v137;
  objc_class *v138;
  id v139;
  void *v140;
  void *v141;
  _BOOL4 v142;
  objc_class *v143;
  id v144;
  id v145;
  int v146;
  objc_class *v147;
  id v148;
  id v149;
  uint64_t v150;
  objc_class *v151;
  id v152;
  void *v153;
  void *v154;
  objc_class *v155;
  id v156;
  id v157;
  int v158;
  void *v159;
  void *v160;
  objc_class *v161;
  id v162;
  void *v163;
  void *v164;
  char v166;
  unsigned int v167;
  BOOL v168;
  char v169;
  uint64_t v170;
  char v171;
  uint64_t v172;
  char v173;
  char v174;
  void *v175;
  void *v176;
  id v177;
  int v178;
  id v179;
  void *v180;
  void *v181;
  NSObject *dsema;
  id v184;
  void *v185;
  NSObject *obj;
  char v187;
  void *v188;
  RTAuthorizedLocationManager *v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _QWORD v194[6];
  _QWORD v195[4];
  NSObject *v196;
  uint64_t *v197;
  uint64_t *v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  uint64_t (*v202)(uint64_t, uint64_t);
  void (*v203)(uint64_t);
  id v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  uint64_t (*v208)(uint64_t, uint64_t);
  void (*v209)(uint64_t);
  id v210;
  _BYTE buf[12];
  __int16 v212;
  id v213;
  __int16 v214;
  _BYTE v215[18];
  __int16 v216;
  double v217;
  __int16 v218;
  double v219;
  _BYTE v220[128];
  uint64_t v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t (*v224)(uint64_t, uint64_t);
  void (*v225)(uint64_t);
  id v226;
  uint64_t v227;

  v227 = *MEMORY[0x1E0C80C00];
  v184 = a3;
  v179 = a4;
  v189 = self;
  -[RTAuthorizedLocationManager trustedTimeNow](self, "trustedTimeNow");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v185)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = (objc_class *)objc_opt_class();
      NSStringFromClass(v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v106;
      v212 = 2112;
      v213 = v107;
      _os_log_impl(&dword_1D1A22000, v104, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time.", buf, 0x16u);

    }
    -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (v108)
    {
      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setRejectionReasonCode:", 1);
      v109 = 0;

    }
    else
    {
      v109 = 0;
    }
    goto LABEL_153;
  }
  objc_msgSend(v184, "loi");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "horizontalUncertainty");
  v10 = v9;

  v11 = fmax(fmin(v10 * 3.0, 200.0), 40.0);
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v14;
    v212 = 2112;
    v213 = v15;
    v214 = 2050;
    *(double *)v215 = v11;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@, threshold for INSIDE authorized location: %{public}f m", buf, 0x20u);

  }
  v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v185, -3600.0);
  v177 = v185;
  v176 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v180, v177);
  v175 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:ascending:", v176, 0, 1, 100.0);
  v205 = 0;
  v206 = &v205;
  v207 = 0x3032000000;
  v208 = __Block_byref_object_copy__46;
  v209 = __Block_byref_object_dispose__46;
  v210 = 0;
  v199 = 0;
  v200 = &v199;
  v201 = 0x3032000000;
  v202 = __Block_byref_object_copy__46;
  v203 = __Block_byref_object_dispose__46;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v204 = (id)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_semaphore_create(0);
  locationManager = v189->_locationManager;
  v195[0] = MEMORY[0x1E0C809B0];
  v195[1] = 3221225472;
  v195[2] = __97__RTAuthorizedLocationManager__assertRecentLocationTechnologyQualityForAuthorizedLocation_visit___block_invoke;
  v195[3] = &unk_1E9296EE0;
  v197 = &v205;
  v198 = &v199;
  v18 = v16;
  v196 = v18;
  -[RTLocationManager fetchStoredLocationsWithOptions:handler:](locationManager, "fetchStoredLocationsWithOptions:handler:", v175, v195);
  v19 = (id *)(v206 + 5);
  v20 = (id)v206[5];
  dsema = v18;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v22))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v21);
    v25 = v24;
    v26 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "filteredArrayUsingPredicate:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "submitToCoreAnalytics:type:duration:", v30, 1, v25);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v32 = (void *)MEMORY[0x1E0CB35C8];
    v221 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v221, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v20 = objc_retainAutorelease(v34);

    }
  }

  objc_storeStrong(v19, v20);
  if (v206[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v147 = (objc_class *)objc_opt_class();
      NSStringFromClass(v147);
      v148 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v149 = (id)objc_claimAutoreleasedReturnValue();
      v150 = v206[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v148;
      v212 = 2112;
      v213 = v149;
      v214 = 2112;
      *(_QWORD *)v215 = v150;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch locations: %@.", buf, 0x20u);

    }
  }
  v221 = 0;
  v222 = &v221;
  v223 = 0x3032000000;
  v224 = __Block_byref_object_copy__46;
  v225 = __Block_byref_object_dispose__46;
  v226 = 0;
  v194[0] = MEMORY[0x1E0C809B0];
  v194[1] = 3221225472;
  v194[2] = __97__RTAuthorizedLocationManager__assertRecentLocationTechnologyQualityForAuthorizedLocation_visit___block_invoke_83;
  v194[3] = &unk_1E929BC20;
  v194[4] = &v221;
  v194[5] = &v199;
  -[RTAuthorizedLocationManager _fetchCurrentLocationWithHandler:](v189, "_fetchCurrentLocationWithHandler:", v194);
  if (v222[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v222[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v38;
      v212 = 2112;
      v213 = v39;
      v214 = 2112;
      *(_QWORD *)v215 = v40;
      _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_DEFAULT, "%@:%@ failed to fetch current location (%@).", buf, 0x20u);

    }
  }
  if (!objc_msgSend((id)v200[5], "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v117 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      v118 = (objc_class *)objc_opt_class();
      NSStringFromClass(v118);
      v119 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v119;
      v212 = 2112;
      v213 = v120;
      _os_log_impl(&dword_1D1A22000, v117, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 5.", buf, 0x16u);

    }
    -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v121)
    {
      v109 = 0;
      goto LABEL_152;
    }
    -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setRejectionReasonCode:", 5);
    v188 = v122;
    goto LABEL_103;
  }
  v41 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v184, "loi");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "location");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "location");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = (void *)objc_msgSend(v41, "initWithRTLocation:", v44);

  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend((id)v200[5], "count");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v47;
    v212 = 2112;
    v213 = v48;
    v214 = 2050;
    *(_QWORD *)v215 = v49;
    *(_WORD *)&v215[8] = 2050;
    *(double *)&v215[10] = v11;
    _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_DEFAULT, "%@:%@, processing %{public}zu locations using INSIDE distance threshold %{public}f m.", buf, 0x2Au);

  }
  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  obj = (id)v200[5];
  v50 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v190, v220, 16);
  if (!v50)
  {

    v51 = 0;
    v103 = 0;
    v173 = 0;
    v170 = 0;
    LOBYTE(v172) = 0;
    v166 = 0;
    v174 = 0;
    v187 = 0;
    v102 = 0;
    goto LABEL_105;
  }
  v51 = 0;
  v169 = 0;
  v173 = 0;
  v170 = 0;
  v172 = 0;
  v166 = 0;
  v174 = 0;
  v187 = 0;
  v52 = *(_QWORD *)v191;
  v178 = *MEMORY[0x1E0C9E518];
  v167 = *MEMORY[0x1E0C9E508];
  while (2)
  {
    for (i = 0; i != v50; ++i)
    {
      if (*(_QWORD *)v191 != v52)
        objc_enumerationMutation(obj);
      v54 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * i);
      objc_msgSend(v54, "sourceInformation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isSimulatedBySoftware");

      if (v56)
      {
        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
          v111 = (objc_class *)objc_opt_class();
          NSStringFromClass(v111);
          v112 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v112;
          v212 = 2112;
          v213 = v113;
          _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection 9.", buf, 0x16u);

        }
        -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
        v114 = (void *)objc_claimAutoreleasedReturnValue();

        if (v114)
        {
          -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "setRejectionReasonCode:", 9);

        }
        v109 = 0;
        v116 = obj;
        goto LABEL_150;
      }
      objc_msgSend(v188, "distanceFromLocation:", v54);
      v58 = v57;
      objc_msgSend(v54, "horizontalAccuracy");
      v60 = v11 + v59 * 2.0;
      if (v58 > v60)
      {
        if ((v51 & 1) != 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = (objc_class *)objc_opt_class();
            NSStringFromClass(v62);
            v63 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v64 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v184, "loi");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "location");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "location");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413570;
            *(_QWORD *)&buf[4] = v63;
            v212 = 2112;
            v213 = v64;
            v214 = 2112;
            *(_QWORD *)v215 = v54;
            *(_WORD *)&v215[8] = 2112;
            *(_QWORD *)&v215[10] = v67;
            v216 = 2050;
            v217 = v58;
            v218 = 2050;
            v219 = v60;
            _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_DEFAULT, "%@:%@, distance from location, %@, to ALOI location, %@, of %{public}.2f is greater than threshold, %{public}.2f m. Setting state to OUTSIDE.", buf, 0x3Eu);

          }
        }
        -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v58 / v11;
          *(float *)&v70 = v58 / v11;
          objc_msgSend(v69, "setNormalizedDistanceToCentroid:", v70);

        }
        v51 = 0;
      }
      objc_msgSend(v54, "sourceInformation");
      v71 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isProducedByAccessory](v71, "isProducedByAccessory") & 1) != 0)
      {
        v187 = 1;
LABEL_36:

        continue;
      }
      v72 = objc_msgSend(v54, "type") == 3;

      if (v72)
      {
        v187 = 1;
      }
      else if (objc_msgSend(v54, "type") == 1
             || objc_msgSend(v54, "type") == 4
             || objc_msgSend(v54, "type") == 11
             || objc_msgSend(v54, "type") == 13)
      {
        if (objc_msgSend(v54, "integrity") == v178)
        {
          v174 = 1;
        }
        else if (v58 <= 200.0)
        {
          if (v58 <= v11)
          {
            if ((v51 & 1) == 0)
            {
              _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                v74 = (objc_class *)objc_opt_class();
                NSStringFromClass(v74);
                v75 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413570;
                *(_QWORD *)&buf[4] = v75;
                v212 = 2112;
                v213 = v76;
                v214 = 2112;
                *(_QWORD *)v215 = v54;
                *(_WORD *)&v215[8] = 2112;
                *(_QWORD *)&v215[10] = v184;
                v216 = 2050;
                v217 = v58;
                v218 = 2050;
                v219 = v11;
                _os_log_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_DEFAULT, "%@:%@, distance from location, %@, to ALOI, %@, of %{public}.2f is less than threshold, %{public}.2f m. Setting state to INSIDE.", buf, 0x3Eu);

              }
            }
            -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            if (v77)
            {
              -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = v58 / v11;
              *(float *)&v79 = v58 / v11;
              objc_msgSend(v78, "setNormalizedDistanceToCentroid:", v79);

            }
            v51 = 1;
          }
          v80 = objc_msgSend(v54, "type");
          v81 = objc_msgSend(v54, "integrity");
          v82 = objc_msgSend(v54, "type") == 4 || objc_msgSend(v54, "type") == 11;
          v83 = objc_msgSend(v54, "type");
          v84 = v83 == 13;
          if (v81 >= v167)
            v85 = v82;
          else
            v85 = 0;
          v171 = v85;
          if (v81 < v167)
            v84 = 0;
          v168 = v84;
          if (!((v80 != 1) | v172 & 1))
          {
            _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              v87 = (objc_class *)objc_opt_class();
              NSStringFromClass(v87);
              v88 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v89 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v88;
              v212 = 2112;
              v213 = v89;
              v214 = 1026;
              *(_DWORD *)v215 = 1;
              *(_WORD *)&v215[4] = 2112;
              *(_QWORD *)&v215[6] = v54;
              _os_log_impl(&dword_1D1A22000, v86, OS_LOG_TYPE_DEFAULT, "%@:%@, found technology (%{public}d): %@", buf, 0x26u);

            }
            v172 = 1;
          }
          if (!((v83 != 13) & ~v82 | BYTE4(v170) & 1))
          {
            _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            v90 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              v91 = (objc_class *)objc_opt_class();
              NSStringFromClass(v91);
              v92 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v93 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v92;
              v212 = 2112;
              v213 = v93;
              v214 = 1026;
              *(_DWORD *)v215 = 2;
              *(_WORD *)&v215[4] = 2112;
              *(_QWORD *)&v215[6] = v54;
              _os_log_impl(&dword_1D1A22000, v90, OS_LOG_TYPE_DEFAULT, "%@:%@, found technology (%{public}d): %@", buf, 0x26u);

            }
            BYTE4(v170) = 1;
          }
          if (!(v173 & 1 | ((v171 & 1) == 0)))
          {
            _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            v94 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
            {
              v95 = (objc_class *)objc_opt_class();
              NSStringFromClass(v95);
              v96 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v97 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v96;
              v212 = 2112;
              v213 = v97;
              v214 = 1026;
              *(_DWORD *)v215 = 4;
              *(_WORD *)&v215[4] = 2112;
              *(_QWORD *)&v215[6] = v54;
              _os_log_impl(&dword_1D1A22000, v94, OS_LOG_TYPE_DEFAULT, "%@:%@, found technology (%{public}d): %@", buf, 0x26u);

            }
            v173 = 1;
          }
          if (!(v169 & 1 | !v168))
          {
            _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              v98 = (objc_class *)objc_opt_class();
              NSStringFromClass(v98);
              v99 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v100 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v99;
              v212 = 2112;
              v213 = v100;
              v214 = 1026;
              *(_DWORD *)v215 = 8;
              *(_WORD *)&v215[4] = 2112;
              *(_QWORD *)&v215[6] = v54;
              _os_log_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_DEFAULT, "%@:%@, found technology (%{public}  d): %@", buf, 0x26u);

            }
            v169 = 1;
            LOBYTE(v170) = 1;
            goto LABEL_36;
          }
          LOBYTE(v170) = 1;
        }
      }
      else
      {
        v166 = 1;
      }
    }
    v50 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v190, v220, 16);
    if (v50)
      continue;
    break;
  }

  v101 = 2;
  if ((v172 & 1) != 0)
    v101 = 3;
  if ((v170 & 0x100000000) != 0)
    v102 = v101;
  else
    v102 = v172;
  if ((v173 & 1) != 0)
  {
    v102 |= 4uLL;
    if ((v169 & 1) == 0)
    {
      v103 = 0;
      v173 = 1;
      goto LABEL_105;
    }
    goto LABEL_155;
  }
  if ((v169 & 1) != 0)
  {
LABEL_155:
    v102 |= 8uLL;
    v103 = 1;
    goto LABEL_105;
  }
  v103 = 0;
  v173 = 0;
LABEL_105:
  -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  if (v123)
  {
    -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setTechnologyAvailability:", v102);

  }
  if ((v170 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v127 = objc_claimAutoreleasedReturnValue();
    v128 = os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT);
    if ((v174 & 1) != 0)
    {
      if (v128)
      {
        v129 = (objc_class *)objc_opt_class();
        NSStringFromClass(v129);
        v130 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v130;
        v212 = 2112;
        v213 = v131;
        _os_log_impl(&dword_1D1A22000, v127, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 7.", buf, 0x16u);

      }
      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v132)
        goto LABEL_103;
      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v116 = objc_claimAutoreleasedReturnValue();
      -[NSObject setRejectionReasonCode:](v116, "setRejectionReasonCode:", 7);
    }
    else if ((v166 & 1) != 0)
    {
      if (v128)
      {
        v138 = (objc_class *)objc_opt_class();
        NSStringFromClass(v138);
        v139 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v139;
        v212 = 2112;
        v213 = v140;
        _os_log_impl(&dword_1D1A22000, v127, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 8.", buf, 0x16u);

      }
      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v141)
        goto LABEL_103;
      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v116 = objc_claimAutoreleasedReturnValue();
      -[NSObject setRejectionReasonCode:](v116, "setRejectionReasonCode:", 8);
    }
    else
    {
      if ((v187 & 1) == 0)
      {
        if (v128)
        {
          v161 = (objc_class *)objc_opt_class();
          NSStringFromClass(v161);
          v162 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v162;
          v212 = 2112;
          v213 = v163;
          _os_log_impl(&dword_1D1A22000, v127, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 5.", buf, 0x16u);

        }
        -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
        v164 = (void *)objc_claimAutoreleasedReturnValue();

        if (v164)
        {
          -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
          v116 = objc_claimAutoreleasedReturnValue();
          -[NSObject setRejectionReasonCode:](v116, "setRejectionReasonCode:", 5);
          goto LABEL_149;
        }
        goto LABEL_103;
      }
      if (v128)
      {
        v151 = (objc_class *)objc_opt_class();
        NSStringFromClass(v151);
        v152 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v152;
        v212 = 2112;
        v213 = v153;
        _os_log_impl(&dword_1D1A22000, v127, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 10.", buf, 0x16u);

      }
      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v154 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v154)
        goto LABEL_103;
      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v116 = objc_claimAutoreleasedReturnValue();
      -[NSObject setRejectionReasonCode:](v116, "setRejectionReasonCode:", 10);
    }
LABEL_149:
    v109 = 0;
    goto LABEL_150;
  }
  if ((v51 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v133 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      v134 = (objc_class *)objc_opt_class();
      NSStringFromClass(v134);
      v135 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v135;
      v212 = 2112;
      v213 = v136;
      _os_log_impl(&dword_1D1A22000, v133, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 6.", buf, 0x16u);

    }
    -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v137)
      goto LABEL_103;
    -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
    v116 = objc_claimAutoreleasedReturnValue();
    -[NSObject setRejectionReasonCode:](v116, "setRejectionReasonCode:", 6);
    goto LABEL_149;
  }
  if (v172 & 1 | ((v170 & 0x100000000) == 0))
    v125 = BYTE4(v170);
  else
    v125 = v103 | v173;
  v126 = objc_msgSend(v184, "locationTechnologyAvailability")
      && (objc_msgSend(v184, "locationTechnologyAvailability") & 1) == 0
      && (objc_msgSend(v184, "locationTechnologyAvailability") & 4) == 0;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v116 = objc_claimAutoreleasedReturnValue();
  v142 = os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT);
  if ((v125 & 1) == 0)
  {
    if (v142)
    {
      v155 = (objc_class *)objc_opt_class();
      NSStringFromClass(v155);
      v156 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v157 = (id)objc_claimAutoreleasedReturnValue();
      v158 = objc_msgSend(v184, "locationTechnologyAvailability");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v156;
      v212 = 2112;
      v213 = v157;
      v214 = 1026;
      *(_DWORD *)v215 = v102;
      *(_WORD *)&v215[4] = 1026;
      *(_DWORD *)&v215[6] = v158;
      _os_log_impl(&dword_1D1A22000, v116, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 11 (%{public}08x,%{public}08x)", buf, 0x22u);

    }
    -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    if (v159)
    {
      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "setRejectionReasonCode:", 11);

      -[RTAuthorizedLocationMetrics queryMetrics](v189->_metrics, "queryMetrics");
      v116 = objc_claimAutoreleasedReturnValue();
      -[NSObject setIsHistoricallyALowDiversityLocation:](v116, "setIsHistoricallyALowDiversityLocation:", v126);
      goto LABEL_149;
    }
LABEL_103:
    v109 = 0;
    goto LABEL_151;
  }
  if (v142)
  {
    v143 = (objc_class *)objc_opt_class();
    NSStringFromClass(v143);
    v144 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v145 = (id)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v184, "locationTechnologyAvailability");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v144;
    v212 = 2112;
    v213 = v145;
    v214 = 1026;
    *(_DWORD *)v215 = v102;
    *(_WORD *)&v215[4] = 1026;
    *(_DWORD *)&v215[6] = v146;
    _os_log_impl(&dword_1D1A22000, v116, OS_LOG_TYPE_DEFAULT, "%@:%@ passed 11 (%{public}08x,%{public}08x)", buf, 0x22u);

  }
  v109 = 1;
LABEL_150:

LABEL_151:
LABEL_152:
  _Block_object_dispose(&v221, 8);

  _Block_object_dispose(&v199, 8);
  _Block_object_dispose(&v205, 8);

LABEL_153:
  return v109;
}

void __97__RTAuthorizedLocationManager__assertRecentLocationTechnologyQualityForAuthorizedLocation_visit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __97__RTAuthorizedLocationManager__assertRecentLocationTechnologyQualityForAuthorizedLocation_visit___block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

}

- (BOOL)_assertUserTimeAndTrustedTimeAreConsistent
{
  void *v4;
  NSObject *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  objc_class *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[RTAuthorizedLocationManager trustedTimeNow](self, "trustedTimeNow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = -3.0;
      objc_msgSend(v15, "setUserTimeOffsetHours:", v16);

    }
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection reason 1 (unavailable).", (uint8_t *)&v26, 0x16u);

    }
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSObject timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v4);
  v7 = v6;
  -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RTTrustedTimeCache getApproximateTrustedDateNow](self->_trustedTimeCache, "getApproximateTrustedDateNow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v13 = v11;
      v10 = v7 / 3600.0;
      *(float *)&v12 = v10;
    }
    else
    {
      v13 = v11;
      LODWORD(v12) = 3.0;
    }
    objc_msgSend(v11, "setUserTimeOffsetHours:", v12);

  }
  if (fabs(v7) > 36000.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v23;
      v28 = 2112;
      v29 = v24;
      v30 = 2050;
      v31 = v7;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection reason 1 (%{public}.1f).", (uint8_t *)&v26, 0x20u);

    }
LABEL_16:
    v20 = 0;
    goto LABEL_17;
  }
  v20 = 1;
LABEL_17:

  return v20;
}

- (id)_getCurrentVisit
{
  id v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
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
  NSObject *v25;
  id v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  objc_class *v33;
  id v34;
  void *v35;
  uint64_t v36;
  objc_class *v37;
  id v38;
  void *v39;
  objc_class *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *log;
  void *v48;
  _QWORD v49[4];
  NSObject *v50;
  _BYTE *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[12];
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  _BYTE buf[24];
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD v68[4];

  v68[1] = *MEMORY[0x1E0C80C00];
  -[RTAuthorizedLocationManager trustedTimeNow](self, "trustedTimeNow");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v3 = objc_alloc(MEMORY[0x1E0D18508]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E9327CC8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    log = objc_msgSend(v3, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 0, v4, 0, 1, &unk_1E9327CB0, v5);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v65 = __Block_byref_object_copy__46;
    v66 = __Block_byref_object_dispose__46;
    v67 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__46;
    v57 = __Block_byref_object_dispose__46;
    v58 = 0;
    v6 = dispatch_semaphore_create(0);
    -[RTAuthorizedLocationManager visitManager](self, "visitManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __47__RTAuthorizedLocationManager__getCurrentVisit__block_invoke;
    v49[3] = &unk_1E9296EE0;
    v51 = buf;
    v52 = &v53;
    v8 = v6;
    v50 = v8;
    objc_msgSend(v7, "fetchStoredVisitsWithOptions:handler:", log, v49);

    v9 = (id *)(*(_QWORD *)&buf[8] + 40);
    v10 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v11 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v11, v13))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSinceDate:", v12);
      v15 = v14;
      v16 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
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
        *(_WORD *)v59 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
      }

      v22 = (void *)MEMORY[0x1E0CB35C8];
      v68[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v59 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v68, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v10 = objc_retainAutorelease(v24);

      }
    }

    objc_storeStrong(v9, v10);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v59 = 138412802;
        *(_QWORD *)&v59[4] = v42;
        v60 = 2112;
        v61 = v43;
        v62 = 2112;
        v63 = v44;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v59, 0x20u);

      }
      objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), *(id *)(*(_QWORD *)&buf[8] + 40));
      v26 = 0;
    }
    else
    {
      v30 = v54[5];
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v32)
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v54[5];
          *(_DWORD *)v59 = 138412802;
          *(_QWORD *)&v59[4] = v34;
          v60 = 2112;
          v61 = v35;
          v62 = 2112;
          v63 = v36;
          _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ fetched visit %@.", v59, 0x20u);

        }
      }
      else if (v32)
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v59 = 138412546;
        *(_QWORD *)&v59[4] = v38;
        v60 = 2112;
        v61 = v39;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ no available visit, cannot compute settled time.", v59, 0x16u);

      }
      v26 = (id)v54[5];
    }

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v29;
      _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time now, cannot yield current visit.", buf, 0x16u);

    }
    v26 = 0;
  }

  return v26;
}

void __47__RTAuthorizedLocationManager__getCurrentVisit__block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v10 = obj;
  v6 = a2;
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_fetchCurrentLocationWithHandler:(id)a3
{
  NSObject *v4;
  dispatch_semaphore_t v5;
  RTLocationManager *locationManager;
  NSObject *v7;
  id *v8;
  id v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  objc_class *v32;
  id v33;
  id v34;
  id v35;
  int v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  _BOOL4 v47;
  objc_class *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  objc_class *v55;
  id v56;
  id v57;
  void *v58;
  objc_class *v59;
  id v60;
  void *v61;
  uint64_t v62;
  objc_class *v63;
  id v64;
  void *v65;
  const char *aSelectora;
  RTLocationRequestOptions *v68;
  id v69;
  void *v70;
  NSObject *dsema;
  _QWORD v72[4];
  NSObject *v73;
  _BYTE *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _BYTE v82[12];
  __int16 v83;
  id v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  void *v88;
  _BYTE buf[24];
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _QWORD v93[4];

  v93[1] = *MEMORY[0x1E0C80C00];
  v69 = a3;
  if (!v69)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTAuthorizedLocationManager _fetchCurrentLocationWithHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1938;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTAuthorizedLocationManager trustedTimeNow](self, "trustedTimeNow", a2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v68 = -[RTLocationRequestOptions initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:]([RTLocationRequestOptions alloc], "initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:", 1, 0, 100.0, 100.0, 3600.0, 1.5, 1.0, 1.0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v90 = __Block_byref_object_copy__46;
    v91 = __Block_byref_object_dispose__46;
    v92 = 0;
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__46;
    v80 = __Block_byref_object_dispose__46;
    v81 = 0;
    v5 = dispatch_semaphore_create(0);
    locationManager = self->_locationManager;
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __64__RTAuthorizedLocationManager__fetchCurrentLocationWithHandler___block_invoke;
    v72[3] = &unk_1E929AB38;
    v74 = buf;
    v75 = &v76;
    v7 = v5;
    v73 = v7;
    -[RTLocationManager fetchCurrentLocationWithOptions:handler:](locationManager, "fetchCurrentLocationWithOptions:handler:", v68, v72);
    v8 = (id *)(*(_QWORD *)&buf[8] + 40);
    v9 = *(id *)(*(_QWORD *)&buf[8] + 40);
    dsema = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v11))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v10);
      v14 = v13;
      v15 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "submitToCoreAnalytics:type:duration:", v19, 1, v14);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v82 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v82, 2u);
      }

      v21 = (void *)MEMORY[0x1E0CB35C8];
      v93[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v82 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v93, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v9 = objc_retainAutorelease(v23);

      }
    }

    objc_storeStrong(v8, v9);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v59 = (objc_class *)objc_opt_class();
        NSStringFromClass(v59);
        v60 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelectora);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v82 = 138412802;
        *(_QWORD *)&v82[4] = v60;
        v83 = 2112;
        v84 = v61;
        v85 = 2112;
        v86 = v62;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch location: %@.", v82, 0x20u);

      }
      (*((void (**)(id, _QWORD, _QWORD))v69 + 2))(v69, 0, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    }
    else
    {
      v29 = v77[5];
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v29)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelectora);
          v34 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v77[5], "description");
          v35 = (id)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend((id)v77[5], "integrity");
          *(_DWORD *)v82 = 138413058;
          *(_QWORD *)&v82[4] = v33;
          v83 = 2112;
          v84 = v34;
          v85 = 2112;
          v86 = (uint64_t)v35;
          v87 = 1026;
          LODWORD(v88) = v36;
          _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ fetched location: %@, integrity, %{public}d", v82, 0x26u);

        }
        -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend((id)v77[5], "timestamp");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "timeIntervalSinceDate:", v38);
          v40 = v39;
          -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = llround(v40 / 60.0);
          objc_msgSend(v41, "setLocationAgeMinutes:", v42);

        }
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v70, -3600.0);
        objc_msgSend((id)v77[5], "timestamp");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isOnOrBefore:", v43);

        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
        if (v45)
        {
          if (v47)
          {
            v48 = (objc_class *)objc_opt_class();
            NSStringFromClass(v48);
            v49 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelectora);
            v50 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v77[5], "description");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v82 = 138413058;
            *(_QWORD *)&v82[4] = v49;
            v83 = 2112;
            v84 = v50;
            v85 = 2050;
            v86 = 0x40AC200000000000;
            v87 = 2112;
            v88 = v51;
            _os_log_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_DEFAULT, "%@:%@, most recent location is older than %{public}.0f seconds, %@.", v82, 0x2Au);

          }
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v53 = (void *)objc_msgSend(v52, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, 0);
          (*((void (**)(id, _QWORD, void *))v69 + 2))(v69, 0, v53);

        }
        else
        {
          if (v47)
          {
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            v56 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelectora);
            v57 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v77[5], "toVerboseString");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v82 = 138412802;
            *(_QWORD *)&v82[4] = v56;
            v83 = 2112;
            v84 = v57;
            v85 = 2112;
            v86 = (uint64_t)v58;
            _os_log_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_DEFAULT, "%@:%@ fetched current location: %@", v82, 0x20u);

          }
          (*((void (**)(id, uint64_t, _QWORD))v69 + 2))(v69, v77[5], 0);
        }
      }
      else
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v63 = (objc_class *)objc_opt_class();
          NSStringFromClass(v63);
          v64 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelectora);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v82 = 138412546;
          *(_QWORD *)&v82[4] = v64;
          v83 = 2112;
          v84 = v65;
          _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@:%@, fetched nil location.", v82, 0x16u);

        }
        v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = (void *)objc_msgSend(v54, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, 0);
        (*((void (**)(id, _QWORD, void *))v69 + 2))(v69, 0, v43);
      }

    }
    _Block_object_dispose(&v76, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelectora);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v28;
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time now, not fetching current location.", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD))v69 + 2))(v69, 0, 0);
  }

}

void __64__RTAuthorizedLocationManager__fetchCurrentLocationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_assertWeAreAtAuthorizedLocation:(id)a3
{
  id v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  void *v9;
  CLLocationDegrees v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CLLocationDegrees v19;
  void *v20;
  void *v21;
  void *v22;
  CLLocationDegrees v23;
  CLLocationCoordinate2D v24;
  NSObject *v25;
  __int128 v26;
  uint64_t v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  CLLocationDegrees v34;
  void *v35;
  void *v36;
  void *v37;
  CLLocationDegrees v38;
  RTDistanceCalculator *distanceCalculator;
  double v40;
  double v41;
  id v42;
  double v43;
  NSObject *v44;
  RTDistanceCalculator *v45;
  double v46;
  double v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  float v64;
  void *v65;
  double v66;
  NSObject *v67;
  objc_class *v68;
  void *v69;
  void *v70;
  objc_class *v72;
  void *v73;
  void *v74;
  __int128 v75;
  id v76;
  const char *aSelector;
  int v78;
  NSObject *v79;
  id v80;
  id v81;
  CLLocationCoordinate2D v82;
  CLLocationCoordinate2D v83;
  CLLocationCoordinate2D v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  CLLocationDegrees latitude;
  __int16 v91;
  _QWORD v92[3];

  *(_QWORD *)((char *)&v92[1] + 6) = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[NSArray count](self->_authorizedLocationArr, "count"))
  {
    aSelector = a2;
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v8 = v7;
    objc_msgSend(v5, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "longitude");
    v84 = CLLocationCoordinate2DMake(v8, v10);

    v83 = CLLocationCoordinate2DMake(0.0, 0.0);
    objc_msgSend(v5, "placeInference");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_7;
    v12 = (void *)v11;
    objc_msgSend(v5, "placeInference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v5, "placeInference");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mapItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "latitude");
      v19 = v18;
      objc_msgSend(v5, "placeInference");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mapItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "location");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "longitude");
      v24 = CLLocationCoordinate2DMake(v19, v23);
      v83 = v24;

      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v72 = (objc_class *)objc_opt_class();
        NSStringFromClass(v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413059;
        v86 = v73;
        v87 = 2112;
        v88 = v74;
        v89 = 2049;
        latitude = v24.latitude;
        v91 = 2049;
        v92[0] = *(_QWORD *)&v24.longitude;
        _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "%@:%@, also using visit map item (%{private}.6f, %{private}.6f)", buf, 0x2Au);

      }
      v78 = 1;
    }
    else
    {
LABEL_7:
      v78 = 0;
    }
    v76 = v5;
    if (-[NSArray count](self->_authorizedLocationArr, "count"))
    {
      v79 = 0;
      v27 = 0;
      v28 = 1000000000.0;
      *(_QWORD *)&v26 = 138412802;
      v75 = v26;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_authorizedLocationArr, "objectAtIndexedSubscript:", v27, v75);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v82.latitude = 0.0;
        v82.longitude = 0.0;
        objc_msgSend(v29, "loi");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "location");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "location");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "latitude");
        v34 = v33;
        objc_msgSend(v29, "loi");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "location");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "location");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "longitude");
        v82 = CLLocationCoordinate2DMake(v34, v38);

        distanceCalculator = self->_distanceCalculator;
        v81 = 0;
        -[RTDistanceCalculator distanceFromLocationCoordinate:toLocationCoordinate:error:](distanceCalculator, "distanceFromLocationCoordinate:toLocationCoordinate:error:", &v82, &v84, &v81);
        v41 = v40;
        v42 = v81;
        if (v42)
        {
          v43 = *(double *)&v42;
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v52 = (objc_class *)objc_opt_class();
            NSStringFromClass(v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v75;
            v86 = v53;
            v87 = 2112;
            v88 = v54;
            v89 = 2112;
            latitude = v43;
            _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "%@:%@, failed to compute distance: %@.", buf, 0x20u);

          }
          goto LABEL_13;
        }
        if (!v78)
          goto LABEL_21;
        v45 = self->_distanceCalculator;
        v80 = 0;
        -[RTDistanceCalculator distanceFromLocationCoordinate:toLocationCoordinate:error:](v45, "distanceFromLocationCoordinate:toLocationCoordinate:error:", &v82, &v83, &v80);
        v47 = v46;
        v48 = v80;
        if (v48)
        {
          v43 = *(double *)&v48;
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v75;
            v86 = v56;
            v87 = 2112;
            v88 = v57;
            v89 = 2112;
            latitude = v43;
            _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, "%@:%@, failed to compute distance: %@.", buf, 0x20u);

          }
          goto LABEL_22;
        }
        if (v47 < v41)
        {
          v43 = 0.0;
          v41 = v47;
        }
        else
        {
LABEL_21:
          v43 = 0.0;
        }
LABEL_22:
        if (v41 >= v28)
          goto LABEL_26;
        v50 = v29;

        -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51)
        {
          v28 = v41;
          v79 = v50;
          goto LABEL_26;
        }
        -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
        v44 = objc_claimAutoreleasedReturnValue();
        -[NSObject setLoiFamiliarityRank:](v44, "setLoiFamiliarityRank:", (v27 + 1));
        v28 = v41;
        v79 = v50;
LABEL_13:

LABEL_26:
        if (++v27 >= -[NSArray count](self->_authorizedLocationArr, "count"))
          goto LABEL_32;
      }
    }
    v79 = 0;
    v28 = 1000000000.0;
LABEL_32:
    -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v28 / 200.0;
      *(float *)&v66 = v64;
      objc_msgSend(v65, "setNormalizedDistanceToCentroid:", v66);

    }
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v67 = objc_claimAutoreleasedReturnValue();
    v5 = v76;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = (objc_class *)objc_opt_class();
      NSStringFromClass(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v86 = v69;
      v87 = 2112;
      v88 = v70;
      v89 = 2050;
      latitude = v28;
      v91 = 1026;
      LODWORD(v92[0]) = v28 < 200.0;
      WORD2(v92[0]) = 2050;
      *(_QWORD *)((char *)v92 + 6) = 0x4069000000000000;
      _os_log_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_DEFAULT, "%@:%@ distance, %{public}.3f, matched, %{public}d, threshold %{public}.3f", buf, 0x30u);

    }
    if (v28 >= 200.0)
    {
      v62 = 0;
      v58 = v79;
    }
    else
    {
      v58 = v79;
      v62 = v79;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v86 = v60;
      v87 = 2112;
      v88 = v61;
      _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_DEFAULT, "%@:%@, no available authorized locations: is not considered at authorized location.", buf, 0x16u);

    }
    v62 = 0;
  }

  return v62;
}

- (void)_updateMostRecentDateAtWhichDeviceDataIsTrusted
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSDate *v7;
  NSDate *mostRecentDateAtWhichDeviceDataIsTrusted;
  objc_class *v9;
  NSObject *v10;
  void *v11;
  NSDate *v12;
  NSDate *v13;
  void *v14;
  NSDate *v15;
  NSDate *v16;
  objc_class *v17;
  NSObject *v18;
  void *v19;
  NSDate *v20;
  int v21;
  NSObject *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSDate *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[RTAuthorizedLocationManager trustedTimeNow](self, "trustedTimeNow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RTAuthorizedLocationManager biometricsManager](self, "biometricsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateDateOfLastSuccessfulBiometricAuthentication");
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v6, -3600.0);
      mostRecentDateAtWhichDeviceDataIsTrusted = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
      self->_mostRecentDateAtWhichDeviceDataIsTrusted = v7;

    }
    v13 = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v4, -604800.0);
    -[NSDate laterDate:](v13, "laterDate:", v14);
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v16 = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
    self->_mostRecentDateAtWhichDeviceDataIsTrusted = v15;

    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
      v21 = 138412802;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Setting learning data age threshold to %{public}@", (uint8_t *)&v21, 0x20u);

    }
    goto LABEL_8;
  }
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
    v21 = 138412802;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, unable to fetch trustedNow, leaving _mostRecentDateAtWhichDeviceDataIsTrusted unchanged at %@", (uint8_t *)&v21, 0x20u);

LABEL_8:
  }

}

- (void)_fetchAuthorizedLocationExtendedStatus:(id)a3
{
  NSObject *v4;
  RTAuthorizedLocationStatus *overrideAuthorizedLocationStatus;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  NSObject *v15;
  objc_class *v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  char *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  _BOOL4 v52;
  objc_class *v53;
  char *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  objc_class *v61;
  char *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  objc_class *v66;
  char *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  objc_class *v72;
  char *v73;
  void *v74;
  void *v75;
  objc_class *v76;
  char *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSArray *obj;
  void (**v84)(id, void *, uint64_t, _QWORD);
  RTAuthorizedLocationManager *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[5];
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  id v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  void *v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v84 = (void (**)(id, void *, uint64_t, _QWORD))a3;
  v86 = self;
  if (!v84)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v99 = "-[RTAuthorizedLocationManager _fetchAuthorizedLocationExtendedStatus:]";
      v100 = 1024;
      LODWORD(v101) = 2134;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  if (!self->_overrideAuthorizedLocationStatus
    || (-[RTAuthorizedLocationManager _checkStatusOverrideDefault](self, "_checkStatusOverrideDefault"),
        (overrideAuthorizedLocationStatus = self->_overrideAuthorizedLocationStatus) == 0))
  {
    -[RTAuthorizedLocationMetrics setLocationServicesEnabled:](self->_metrics, "setLocationServicesEnabled:", objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"));
    -[RTAuthorizedLocationMetrics setRoutineEnabled:](self->_metrics, "setRoutineEnabled:", -[RTAuthorizedLocationManager _isRoutineEnabled](self, "_isRoutineEnabled"));
    v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18340]), "initWithStatus:", 1);
    if (!-[RTAuthorizedLocationManager _assertUserTimeAndTrustedTimeAreConsistent](self, "_assertUserTimeAndTrustedTimeAreConsistent"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v99 = v24;
        v100 = 2112;
        v101 = v25;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 1.", buf, 0x16u);

      }
      -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setRejectionReasonCode:", 1);

      }
      v84[2](v84, v82, 1, 0);
      goto LABEL_32;
    }
    -[RTAuthorizedLocationManager _updateMostRecentDateAtWhichDeviceDataIsTrusted](self, "_updateMostRecentDateAtWhichDeviceDataIsTrusted");
    -[RTAuthorizedLocationManager _getCurrentVisit](self, "_getCurrentVisit");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v81
      || !objc_msgSend(v81, "type")
      || objc_msgSend(v81, "type") == 3
      || (objc_msgSend(v81, "entry"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = v6 == 0,
          v6,
          v7))
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v99 = v30;
        v100 = 2112;
        v101 = v31;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 2.", buf, 0x16u);

      }
      -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setRejectionReasonCode:", 2);

      }
      v84[2](v84, v82, 2, 0);
      goto LABEL_31;
    }
    -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "entry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v10);
      v12 = v11;
      -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 / 60.0;
      *(float *)&v14 = v12 / 60.0;
      objc_msgSend(v13, "setVisitDwellMinutes:", v14);

    }
    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = __Block_byref_object_copy__46;
    v96 = __Block_byref_object_dispose__46;
    v97 = 0;
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __70__RTAuthorizedLocationManager__fetchAuthorizedLocationExtendedStatus___block_invoke;
    v91[3] = &unk_1E929BC48;
    v91[4] = &v92;
    -[RTAuthorizedLocationManager _curateAuthorizedLocationsWithHandler:](v86, "_curateAuthorizedLocationsWithHandler:", v91);
    if (v93[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (char *)(id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v99 = v17;
        v100 = 2112;
        v101 = v18;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 3.", buf, 0x16u);

      }
      -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v21 = 3;
        goto LABEL_55;
      }
      -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 3;
      objc_msgSend(v20, "setRejectionReasonCode:", 3);
    }
    else
    {
      -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v35 = -[NSArray count](v86->_authorizedLocationArr, "count");
        -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setNumFamiliarLois:", v35);

      }
      if (-[NSArray count](v86->_authorizedLocationArr, "count"))
      {
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        obj = v86->_authorizedLocationArr;
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v108, 16);
        if (v37)
        {
          v38 = *(_QWORD *)v88;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v88 != v38)
                objc_enumerationMutation(obj);
              v40 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
              _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                v42 = (objc_class *)objc_opt_class();
                NSStringFromClass(v42);
                v43 = (char *)(id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v44 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "dwellTime_s");
                v46 = v45;
                v47 = objc_msgSend(v40, "numberOfDaysVisited");
                objc_msgSend(v40, "loi");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413314;
                v99 = v43;
                v100 = 2112;
                v101 = v44;
                v102 = 2050;
                v103 = v46;
                v104 = 2050;
                v105 = v47;
                v106 = 2112;
                v107 = v48;
                _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_DEFAULT, "%@:%@, Authorized Locations: total visit dwell, %{public}.0f, number of unique days visited, %{public}ld, Authorized Location, %@.", buf, 0x34u);

              }
            }
            v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v108, 16);
          }
          while (v37);
        }

        -[RTAuthorizedLocationManager _assertWeAreAtAuthorizedLocation:](v86, "_assertWeAreAtAuthorizedLocation:", v81);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          if (-[RTAuthorizedLocationManager _assertRecentLocationTechnologyQualityForAuthorizedLocation:visit:](v86, "_assertRecentLocationTechnologyQualityForAuthorizedLocation:visit:", v49, v81))
          {
            v50 = -[RTAuthorizedLocationManager _assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation:visit:](v86, "_assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation:visit:", v49, v81);
            _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
            if (v50)
            {
              if (v52)
              {
                v53 = (objc_class *)objc_opt_class();
                NSStringFromClass(v53);
                v54 = (char *)(id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v99 = v54;
                v100 = 2112;
                v101 = v55;
                _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_DEFAULT, "%@:%@, confirmed at authorized location.", buf, 0x16u);

              }
              v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18340]), "initWithStatus:", 2);

              -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              if (v57)
              {
                -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "setRejectionReasonCode:", 0);

                -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "setResponseValue:", 1);

              }
              v84[2](v84, (void *)v56, 0, 0);
              v82 = (void *)v56;
            }
            else
            {
              if (v52)
              {
                v76 = (objc_class *)objc_opt_class();
                NSStringFromClass(v76);
                v77 = (char *)(id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v99 = v77;
                v100 = 2112;
                v101 = v78;
                _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection 14.", buf, 0x16u);

              }
              -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              if (v79)
              {
                -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "setRejectionReasonCode:", 14);

              }
              v84[2](v84, v82, 14, 0);
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              v72 = (objc_class *)objc_opt_class();
              NSStringFromClass(v72);
              v73 = (char *)(id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v99 = v73;
              v100 = 2112;
              v101 = v74;
              _os_log_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_DEFAULT, "%@:%@, rejected by 5,7-12.", buf, 0x16u);

            }
            -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v84[2](v84, v82, (int)objc_msgSend(v75, "rejectionReasonCode"), 0);

          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v66 = (objc_class *)objc_opt_class();
            NSStringFromClass(v66);
            v67 = (char *)(id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v99 = v67;
            v100 = 2112;
            v101 = v68;
            _os_log_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection 6.", buf, 0x16u);

          }
          -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69)
          {
            -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setRejectionReasonCode:", 6);

          }
          v84[2](v84, v82, 6, 0);
        }

        goto LABEL_75;
      }
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (objc_class *)objc_opt_class();
        NSStringFromClass(v61);
        v62 = (char *)(id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v99 = v62;
        v100 = 2112;
        v101 = v63;
        _os_log_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_DEFAULT, "%@:%@: rejection 4.", buf, 0x16u);

      }
      -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v64)
      {
        v21 = 4;
        goto LABEL_55;
      }
      -[RTAuthorizedLocationMetrics queryMetrics](v86->_metrics, "queryMetrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 4;
      objc_msgSend(v20, "setRejectionReasonCode:", 4);
    }

LABEL_55:
    v84[2](v84, v82, v21, 0);
LABEL_75:
    _Block_object_dispose(&v92, 8);

LABEL_31:
LABEL_32:

    goto LABEL_33;
  }
  v84[2](v84, overrideAuthorizedLocationStatus, -2, 0);
LABEL_33:

}

void __70__RTAuthorizedLocationManager__fetchAuthorizedLocationExtendedStatus___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_fetchAuthorizedLocationExtendedStatusWithMetrics:(id)a3
{
  id v4;
  RTAuthorizedLocationQueryMetrics *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(RTAuthorizedLocationQueryMetrics);
  -[RTAuthorizedLocationMetrics setQueryMetrics:](self->_metrics, "setQueryMetrics:", v5);

  -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTimer");

  -[RTAuthorizedLocationManager _fetchAuthorizedLocationExtendedStatus:](self, "_fetchAuthorizedLocationExtendedStatus:", v4);
  -[RTAuthorizedLocationMetrics queryMetrics](self->_metrics, "queryMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endTimer");

  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[RTAuthorizedLocationMetrics convertToDictionary](self->_metrics, "convertToDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "Metric, query, %@", (uint8_t *)&v11, 0xCu);

  }
  -[RTAuthorizedLocationMetrics timeSinceLastQueryMetricsSubmission](self->_metrics, "timeSinceLastQueryMetricsSubmission");
  if (v10 > 3600.0)
    -[RTAuthorizedLocationMetrics submitToCoreAnalytics](self->_metrics, "submitToCoreAnalytics");
  -[RTAuthorizedLocationMetrics setQueryMetrics:](self->_metrics, "setQueryMetrics:", 0);
}

- (void)fetchAuthorizedLocationExtendedStatus:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  char *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTAuthorizedLocationManager fetchAuthorizedLocationExtendedStatus:]";
      v17 = 1024;
      LODWORD(v18) = 2282;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__RTAuthorizedLocationManager_fetchAuthorizedLocationExtendedStatus___block_invoke;
    v13[3] = &unk_1E9297650;
    v13[4] = self;
    v14 = v5;
    dispatch_async(v7, v13);

  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18340]), "initWithStatus:", 0);
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ feature not enabled or device not supported.", buf, 0x16u);

    }
    (*((void (**)(id, void *, uint64_t, _QWORD))v5 + 2))(v5, v8, -1, 0);

  }
}

uint64_t __69__RTAuthorizedLocationManager_fetchAuthorizedLocationExtendedStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAuthorizedLocationExtendedStatusWithMetrics:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchAuthorizedLocations:(id)a3
{
  RTAuthorizedLocationManager *v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSArray *obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  uint8_t v41[128];
  _BYTE v42[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  if (!v27)
  {
    v4 = self;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v42 = 136315394;
      *(_QWORD *)&v42[4] = "-[RTAuthorizedLocationManager _fetchAuthorizedLocations:]";
      *(_WORD *)&v42[12] = 1024;
      *(_DWORD *)&v42[14] = 2300;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v42, 0x12u);
    }

    self = v4;
  }
  -[RTAuthorizedLocationManager _updateMostRecentDateAtWhichDeviceDataIsTrusted](self, "_updateMostRecentDateAtWhichDeviceDataIsTrusted");
  *(_QWORD *)v42 = 0;
  *(_QWORD *)&v42[8] = v42;
  *(_QWORD *)&v42[16] = 0x3032000000;
  v43 = __Block_byref_object_copy__46;
  v44 = __Block_byref_object_dispose__46;
  v45 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __57__RTAuthorizedLocationManager__fetchAuthorizedLocations___block_invoke;
  v34[3] = &unk_1E929BC48;
  v34[4] = v42;
  -[RTAuthorizedLocationManager _curateAuthorizedLocationsWithHandler:](self, "_curateAuthorizedLocationsWithHandler:", v34);
  if (*(_QWORD *)(*(_QWORD *)&v42[8] + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)&v42[8] + 40);
      *(_DWORD *)buf = 138412802;
      v36 = v8;
      v37 = 2112;
      v38 = v9;
      v39 = 2112;
      v40 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, error curating authorized locations: %@", buf, 0x20u);

    }
    (*((void (**)(id, _QWORD, _QWORD))v27 + 2))(v27, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = self->_authorizedLocationArr;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v15, "loi");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v16);

          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v36 = v19;
            v37 = 2112;
            v38 = v20;
            v39 = 2112;
            v40 = (uint64_t)v15;
            _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: Authorized Locations: %@.", buf, 0x20u);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      }
      while (v12);
    }

    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 138412802;
      v36 = v23;
      v37 = 2112;
      v38 = v24;
      v39 = 2048;
      v40 = v25;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ Returning %zu available authorized locations.", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v27 + 2))(v27, v26, 0);

  }
  _Block_object_dispose(v42, 8);

}

void __57__RTAuthorizedLocationManager__fetchAuthorizedLocations___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)fetchAuthorizedLocations:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  char *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTAuthorizedLocationManager fetchAuthorizedLocations:]";
      v16 = 1024;
      LODWORD(v17) = 2330;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__RTAuthorizedLocationManager_fetchAuthorizedLocations___block_invoke;
    v12[3] = &unk_1E9297650;
    v12[4] = self;
    v13 = v5;
    dispatch_async(v7, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: feature not enabled or device not supported.", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

uint64_t __56__RTAuthorizedLocationManager_fetchAuthorizedLocations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAuthorizedLocations:", *(_QWORD *)(a1 + 40));
}

- (void)_runEraseInstallDatabaseInitialization:(id)a3
{
  void *v4;
  RTAuthorizedLocationDatabaseInitializationMetrics *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  unint64_t eraseInstallDatabaseInitializationAttemptCount;
  dispatch_semaphore_t v17;
  RTPersistenceMirroringManager *persistenceMirroringManager;
  NSObject *v19;
  id *v20;
  id v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  dispatch_semaphore_t v36;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v38;
  id *v39;
  id v40;
  NSObject *v41;
  void *v42;
  dispatch_time_t v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL8 v55;
  void *v56;
  NSUInteger v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  objc_class *v70;
  id v71;
  void *v72;
  unint64_t v73;
  uint64_t v74;
  objc_class *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void (**v80)(id, _BOOL8, _QWORD);
  NSObject *dsema;
  _QWORD v83[7];
  _QWORD v84[5];
  NSObject *v85;
  _BYTE *v86;
  SEL v87;
  _QWORD v88[5];
  NSObject *v89;
  _BYTE *v90;
  SEL v91;
  _BYTE v92[12];
  __int16 v93;
  void *v94;
  __int16 v95;
  int v96;
  __int16 v97;
  _BOOL4 v98;
  __int16 v99;
  uint64_t v100;
  _BYTE buf[24];
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  _QWORD v105[4];

  v105[1] = *MEMORY[0x1E0C80C00];
  v80 = (void (**)(id, _BOOL8, _QWORD))a3;
  -[RTAuthorizedLocationMetrics initializationMetrics](self->_metrics, "initializationMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(RTAuthorizedLocationDatabaseInitializationMetrics);
    -[RTAuthorizedLocationMetrics setInitializationMetrics:](self->_metrics, "setInitializationMetrics:", v5);

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v79 = (void *)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v75 = (objc_class *)objc_opt_class();
    NSStringFromClass(v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v76;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v77;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    eraseInstallDatabaseInitializationAttemptCount = self->_eraseInstallDatabaseInitializationAttemptCount;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v102) = eraseInstallDatabaseInitializationAttemptCount;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@: started, attempt count, %d.", buf, 0x1Cu);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v102 = __Block_byref_object_copy__46;
  v103 = __Block_byref_object_dispose__46;
  v104 = 0;
  v17 = dispatch_semaphore_create(0);
  persistenceMirroringManager = self->_persistenceMirroringManager;
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke;
  v88[3] = &unk_1E929BC70;
  v88[4] = self;
  v90 = buf;
  v91 = a2;
  v19 = v17;
  v89 = v19;
  -[RTPersistenceMirroringManager performPeriodicSyncWithHandler:](persistenceMirroringManager, "performPeriodicSyncWithHandler:", v88);
  v20 = (id *)(*(_QWORD *)&buf[8] + 40);
  v21 = *(id *)(*(_QWORD *)&buf[8] + 40);
  dsema = v19;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v23))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v22);
    v26 = v25;
    v27 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "submitToCoreAnalytics:type:duration:", v31, 1, v26);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v92 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
    }

    v33 = (void *)MEMORY[0x1E0CB35C8];
    v105[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v92 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v105, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v21 = objc_retainAutorelease(v35);

    }
  }

  objc_storeStrong(v20, v21);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    goto LABEL_21;
  v36 = dispatch_semaphore_create(0);
  learnedLocationManager = self->_learnedLocationManager;
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke_98;
  v84[3] = &unk_1E929BC70;
  v86 = buf;
  v84[4] = self;
  v87 = a2;
  v38 = v36;
  v85 = v38;
  -[RTLearnedLocationManager trainForReason:mode:handler:](learnedLocationManager, "trainForReason:mode:handler:", 1, 1, v84);
  v39 = (id *)(*(_QWORD *)&buf[8] + 40);
  v40 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v41 = v38;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v41, v43))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "timeIntervalSinceDate:", v42);
    v45 = v44;
    v46 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "filteredArrayUsingPredicate:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "firstObject");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "submitToCoreAnalytics:type:duration:", v50, 1, v45);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v92 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
    }

    v52 = (void *)MEMORY[0x1E0CB35C8];
    v105[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v92 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v105, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v40 = objc_retainAutorelease(v54);

    }
  }

  objc_storeStrong(v39, v40);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40)
    || !-[RTAuthorizedLocationManager _oneTimeRetroactivelyRegisterAllStoredVisits](self, "_oneTimeRetroactivelyRegisterAllStoredVisits"))
  {
LABEL_21:
    v55 = 0;
  }
  else
  {
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke_99;
    v83[3] = &unk_1E929BC98;
    v83[4] = self;
    v83[5] = buf;
    v83[6] = a2;
    -[RTAuthorizedLocationManager _curateAuthorizedLocationsWithHandler:](self, "_curateAuthorizedLocationsWithHandler:", v83);
    v55 = -[NSArray count](self->_authorizedLocationArr, "count") != 0;
  }
  -[RTAuthorizedLocationMetrics initializationMetrics](self->_metrics, "initializationMetrics");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = -[NSArray count](self->_authorizedLocationArr, "count");
    -[RTAuthorizedLocationMetrics initializationMetrics](self->_metrics, "initializationMetrics");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setNumberOfALOIsGeneratedDuringEraseInstallInitialization:", v57);

    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityAttemptCount"));
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend((id)v59, "integerValue");
    -[RTAuthorizedLocationMetrics initializationMetrics](self->_metrics, "initializationMetrics");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setEraseInstallInitializationAttemptCount:", v60);

    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityStartDate"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v59) = v62 == 0;

    if ((v59 & 1) == 0)
    {
      -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTAuthorizedLocationEraseInstallInitActivityStartDate"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "timeIntervalSinceDate:", v63);
      v66 = v65;

      -[RTAuthorizedLocationMetrics initializationMetrics](self->_metrics, "initializationMetrics");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v68) = vcvtmd_s64_f64(v66 / 3600.0);
      objc_msgSend(v67, "setEraseInstallInitializationCompletionTimeHours:", v68);

    }
    -[RTAuthorizedLocationMetrics setLocationServicesEnabled:](self->_metrics, "setLocationServicesEnabled:", objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"));
    -[RTAuthorizedLocationMetrics setRoutineEnabled:](self->_metrics, "setRoutineEnabled:", -[RTAuthorizedLocationManager _isRoutineEnabled](self, "_isRoutineEnabled"));
  }
  v80[2](v80, v55, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    v70 = (objc_class *)objc_opt_class();
    NSStringFromClass(v70);
    v71 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = self->_eraseInstallDatabaseInitializationAttemptCount;
    v74 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v92 = 138413314;
    *(_QWORD *)&v92[4] = v71;
    v93 = 2112;
    v94 = v72;
    v95 = 1024;
    v96 = v73;
    v97 = 1024;
    v98 = v55;
    v99 = 2112;
    v100 = v74;
    _os_log_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_DEFAULT, "%@:%@: finished, attempt count, %d, status, %d, error, %@.", v92, 0x2Cu);

  }
  _Block_object_dispose(buf, 8);

}

void __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: sync executed, error: %@.", (uint8_t *)&v9, 0x20u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke_98(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: hindsight learning executed, error: %@.", (uint8_t *)&v9, 0x20u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke_99(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
    v10 = 138413058;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 1024;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: curate authorized locations executed, created %d authorized locations, error: %@.", (uint8_t *)&v10, 0x26u);

  }
}

- (void)runEraseInstallDatabaseInitialization:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  char *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTAuthorizedLocationManager runEraseInstallDatabaseInitialization:]";
      v16 = 1024;
      LODWORD(v17) = 2426;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: databaseInitCompletionHandler (in %s:%d)", buf, 0x12u);
    }

  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__RTAuthorizedLocationManager_runEraseInstallDatabaseInitialization___block_invoke;
    v12[3] = &unk_1E9297650;
    v12[4] = self;
    v13 = v5;
    dispatch_async(v7, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: feature not enabled or device not supported.", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

uint64_t __69__RTAuthorizedLocationManager_runEraseInstallDatabaseInitialization___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_runEraseInstallDatabaseInitialization:", *(_QWORD *)(a1 + 40));
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "convertToDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "Metric, eraseInstallInitialization, %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "submitToCoreAnalytics");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setInitializationMetrics:", 0);
}

- (void)eraseVisitLogDatabase:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  char *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTAuthorizedLocationManager eraseVisitLogDatabase:]";
      v16 = 1024;
      LODWORD(v17) = 2447;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__RTAuthorizedLocationManager_eraseVisitLogDatabase___block_invoke;
    v12[3] = &unk_1E9297650;
    v12[4] = self;
    v13 = v5;
    dispatch_async(v7, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: feature not enabled or device not supported.", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

void __53__RTAuthorizedLocationManager_eraseVisitLogDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "visitLogStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purgeVisitLogsPredating:handler:", v2, *(_QWORD *)(a1 + 40));

}

- (void)fetchVisitLogsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  char *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTAuthorizedLocationManager fetchVisitLogsWithOptions:handler:]";
      v20 = 1024;
      LODWORD(v21) = 2465;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__RTAuthorizedLocationManager_fetchVisitLogsWithOptions_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v16 = v7;
    v17 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: feature not enabled or device not supported.", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __65__RTAuthorizedLocationManager_fetchVisitLogsWithOptions_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "visitLogStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchVisitLogsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (RTPlatform)platform
{
  return self->_platform;
}

- (BOOL)isSupportedDevice
{
  return self->_isSupportedDevice;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (NSArray)authorizedLocationArr
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAuthorizedLocationArr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (NSDate)dateOfLastAuthorizedLocationsCuration
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDateOfLastAuthorizedLocationsCuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (RTAuthorizedLocationVisitLogStore)visitLogStore
{
  return self->_visitLogStore;
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (BOOL)isUnlockedSinceBoot
{
  return self->_isUnlockedSinceBoot;
}

- (void)setIsUnlockedSinceBoot:(BOOL)a3
{
  self->_isUnlockedSinceBoot = a3;
}

- (RTTrustedTimeCache)trustedTimeCache
{
  return self->_trustedTimeCache;
}

- (BOOL)allowUnsecureTimeFallback
{
  return self->_allowUnsecureTimeFallback;
}

- (void)setAllowUnsecureTimeFallback:(BOOL)a3
{
  self->_allowUnsecureTimeFallback = a3;
}

- (RTAuthorizedLocationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (RTPersistenceMirroringManager)persistenceMirroringManager
{
  return self->_persistenceMirroringManager;
}

- (BOOL)isEraseInstallDatabaseInitializationRequired
{
  return self->_isEraseInstallDatabaseInitializationRequired;
}

- (void)setIsEraseInstallDatabaseInitializationRequired:(BOOL)a3
{
  self->_isEraseInstallDatabaseInitializationRequired = a3;
}

- (unint64_t)eraseInstallDatabaseInitializationMaxAttemptCount
{
  return self->_eraseInstallDatabaseInitializationMaxAttemptCount;
}

- (void)setEraseInstallDatabaseInitializationMaxAttemptCount:(unint64_t)a3
{
  self->_eraseInstallDatabaseInitializationMaxAttemptCount = a3;
}

- (unint64_t)eraseInstallDatabaseInitializationAttemptCount
{
  return self->_eraseInstallDatabaseInitializationAttemptCount;
}

- (void)setEraseInstallDatabaseInitializationAttemptCount:(unint64_t)a3
{
  self->_eraseInstallDatabaseInitializationAttemptCount = a3;
}

- (NSDate)eraseInstallInitializationStartDate
{
  return self->_eraseInstallInitializationStartDate;
}

- (void)setEraseInstallInitializationStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_eraseInstallInitializationStartDate, a3);
}

- (RTXPCActivityCriteria)eraseInstallInitializationXpcCriteria
{
  return self->_eraseInstallInitializationXpcCriteria;
}

- (void)setEraseInstallInitializationXpcCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_eraseInstallInitializationXpcCriteria, a3);
}

- (RTAuthorizedLocationStatus)overrideAuthorizedLocationStatus
{
  return (RTAuthorizedLocationStatus *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOverrideAuthorizedLocationStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (BOOL)relaxTrustedTimeRequirement
{
  return self->_relaxTrustedTimeRequirement;
}

- (void)setRelaxTrustedTimeRequirement:(BOOL)a3
{
  self->_relaxTrustedTimeRequirement = a3;
}

- (BOOL)forceTrustedTimeUnavailability
{
  return self->_forceTrustedTimeUnavailability;
}

- (void)setForceTrustedTimeUnavailability:(BOOL)a3
{
  self->_forceTrustedTimeUnavailability = a3;
}

- (RTAuthorizedLocationBiometricsManager)biometricsManager
{
  return self->_biometricsManager;
}

- (NSDate)mostRecentDateAtWhichDeviceDataIsTrusted
{
  return self->_mostRecentDateAtWhichDeviceDataIsTrusted;
}

- (void)setMostRecentDateAtWhichDeviceDataIsTrusted:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentDateAtWhichDeviceDataIsTrusted, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentDateAtWhichDeviceDataIsTrusted, 0);
  objc_storeStrong((id *)&self->_biometricsManager, 0);
  objc_storeStrong((id *)&self->_overrideAuthorizedLocationStatus, 0);
  objc_storeStrong((id *)&self->_eraseInstallInitializationXpcCriteria, 0);
  objc_storeStrong((id *)&self->_eraseInstallInitializationStartDate, 0);
  objc_storeStrong((id *)&self->_persistenceMirroringManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_trustedTimeCache, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_visitLogStore, 0);
  objc_storeStrong((id *)&self->_dateOfLastAuthorizedLocationsCuration, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_authorizedLocationArr, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

@end
