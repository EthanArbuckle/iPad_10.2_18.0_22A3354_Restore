@implementation RTFingerprintManager

+ (id)vendedClasses
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)vendedClasses_vendedClasses_4;
  if (!vendedClasses_vendedClasses_4)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E60]);
    v4 = objc_opt_class();
    v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
    v6 = (void *)vendedClasses_vendedClasses_4;
    vendedClasses_vendedClasses_4 = v5;

    v2 = (void *)vendedClasses_vendedClasses_4;
  }
  return v2;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[RTFingerprintManager defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsFingerprintManagerAccessPointsFetchLimit"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[RTFingerprintManager setAccessPointsFetchLimit:](self, "setAccessPointsFetchLimit:", objc_msgSend(v6, "unsignedIntegerValue"));
  -[RTFingerprintManager fingerprintStore](self, "fingerprintStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:", self, sel_onStoreAvailabilityDidChangeNotification_, v5);

}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[RTFingerprintManager setFingerprintMonitoringEnabled:](self, "setFingerprintMonitoringEnabled:", 0);
  -[RTFingerprintManager fingerprintStore](self, "fingerprintStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTFingerprintManager scanRequestTimer](self, "scanRequestTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[RTFingerprintManager setScanRequestTimer:](self, "setScanRequestTimer:", 0);
  -[RTFingerprintManager scanResultTimer](self, "scanResultTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[RTFingerprintManager setScanResultTimer:](self, "setScanResultTimer:", 0);
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    v7 = v8;
  }

}

+ (int64_t)periodicPurgePolicy
{
  return 1;
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
  v13[2] = __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "fingerprintStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke_21;
    v7[3] = &unk_1E9297568;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v6, "clearWithHandler:", v7);

    v5 = v8;
    goto LABEL_5;
  }
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "fingerprintStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v9[3] = &unk_1E9299358;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v3, "purgePredating:handler:", v10, v9);

    v5 = v10;
LABEL_5:

    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "purge entries from the fingerprint store predating, %@, error, %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "failed to clear fingerprint store with error, %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  RTFingerprintManagerNotificationAvailabilityDidChange *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTFingerprintManagerNotificationMonitorFingerprints, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[RTFingerprintManager setFingerprintMonitoringEnabled:](self, "setFingerprintMonitoringEnabled:", -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v7) != 0);
  }
  else
  {
    +[RTNotification notificationName](RTFingerprintManagerNotificationAvailabilityDidChange, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if (v11)
    {
      v12 = -[RTFingerprintManagerNotificationAvailabilityDidChange initWithAvailability:]([RTFingerprintManagerNotificationAvailabilityDidChange alloc], "initWithAvailability:", -[RTFingerprintManager available](self, "available"));
      -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v12, v6);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v14, 0xCu);
      }

    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTFingerprintManagerNotificationMonitorFingerprints, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTFingerprintManager setFingerprintMonitoringEnabled:](self, "setFingerprintMonitoringEnabled:", -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) != 0);
  }
  else
  {
    +[RTNotification notificationName](RTFingerprintManagerNotificationAvailabilityDidChange, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (RTFingerprintManager)initWithDefaultsManager:(id)a3 fingerprintStore:(id)a4 scenarioTriggerManager:(id)a5 timerManager:(id)a6 wifiManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RTFingerprintManager *v18;
  RTFingerprintManager *v19;
  RTFingerprintManager *v20;
  RTTimer *scanRequestTimer;
  RTTimer *scanResultTimer;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id obj;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  obj = a6;
  v16 = a6;
  v30 = a7;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
      v34 = 1024;
      v35 = 171;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
    v34 = 1024;
    v35 = 172;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprintStore (in %s:%d)", buf, 0x12u);
  }

  if (v15)
  {
LABEL_4:
    if (v16)
      goto LABEL_5;
LABEL_22:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
      v34 = 1024;
      v35 = 174;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timerManager (in %s:%d)", buf, 0x12u);
    }

    if (v17)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_19:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
    v34 = 1024;
    v35 = 173;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: scenarioTriggerManager (in %s:%d)", buf, 0x12u);
  }

  if (!v16)
    goto LABEL_22;
LABEL_5:
  if (v17)
  {
LABEL_6:
    v18 = 0;
    if (v13 && v14 && v15 && v16)
    {
      v31.receiver = self;
      v31.super_class = (Class)RTFingerprintManager;
      v19 = -[RTNotifier init](&v31, sel_init);
      v20 = v19;
      if (v19)
      {
        v19->_accessPointsCollectedPerFingerprint = 0;
        v19->_accessPointsFetchLimit = 1500;
        v19->_available = 0;
        objc_storeStrong((id *)&v19->_defaultsManager, a3);
        v20->_fingerprintMonitoringEnabled = 0;
        objc_storeStrong((id *)&v20->_fingerprintStore, a4);
        objc_storeStrong((id *)&v20->_scenarioTriggerManager, a5);
        objc_storeStrong((id *)&v20->_timerManager, obj);
        objc_storeStrong((id *)&v20->_wifiManager, v30);
        scanRequestTimer = v20->_scanRequestTimer;
        v20->_scanRequestTimer = 0;

        scanResultTimer = v20->_scanResultTimer;
        v20->_scanResultTimer = 0;

        -[RTService setup](v20, "setup");
      }
      self = v20;
      v18 = self;
    }
    goto LABEL_28;
  }
LABEL_25:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
    v34 = 1024;
    v35 = 175;
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager (in %s:%d)", buf, 0x12u);
  }

  v18 = 0;
LABEL_28:

  return v18;
}

- (void)fetchFingerprintsInDateInterval:(id)a3 filteredBySettledState:(unint64_t)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, NSObject *);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(id, _QWORD, NSObject *);
  unint64_t v21;
  uint8_t buf[8];
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, NSObject *))a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_10;
  }
  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("requires a dateInterval.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (const __CFString **)v26;
    v16 = &v25;
LABEL_9:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v17);
    v11 = objc_claimAutoreleasedReturnValue();

    v9[2](v9, 0, v11);
LABEL_10:

    goto LABEL_11;
  }
  if (a4 >= 3)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("requires a valid settledState.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v24;
    v16 = &v23;
    goto LABEL_9;
  }
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__RTFingerprintManager_fetchFingerprintsInDateInterval_filteredBySettledState_handler___block_invoke;
  v18[3] = &unk_1E9297590;
  v18[4] = self;
  v19 = v8;
  v21 = a4;
  v20 = v9;
  dispatch_async(v10, v18);

LABEL_11:
}

void __87__RTFingerprintManager_fetchFingerprintsInDateInterval_filteredBySettledState_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "fingerprintStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:", v2, v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__RTFingerprintManager_fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __97__RTFingerprintManager_fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fingerprintStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)fetchWifiAccessPointsForFingerprint:(id)a3 handler:(id)a4
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
  block[2] = __68__RTFingerprintManager_fetchWifiAccessPointsForFingerprint_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__RTFingerprintManager_fetchWifiAccessPointsForFingerprint_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fingerprintStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchWifiAccessPointsForFingerprint:fetchLimit:handler:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "accessPointsFetchLimit"), *(_QWORD *)(a1 + 48));

}

- (void)setAvailable:(BOOL)a3
{
  NSObject *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  RTFingerprintManagerNotificationAvailabilityDidChange *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_available != a3)
  {
    self->_available = a3;
    _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (self->_available)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, available, %@", (uint8_t *)&v10, 0x16u);

    }
    v9 = -[RTFingerprintManagerNotificationAvailabilityDidChange initWithAvailability:]([RTFingerprintManagerNotificationAvailabilityDidChange alloc], "initWithAvailability:", self->_available);
    -[RTNotifier postNotification:](self, "postNotification:", v9);

  }
}

- (void)setFingerprintMonitoringEnabled:(BOOL)a3
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_fingerprintMonitoringEnabled != a3)
  {
    self->_fingerprintMonitoringEnabled = a3;
    _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_fingerprintMonitoringEnabled)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "fingerprint monitoring enabled, %@", (uint8_t *)&v16, 0xCu);
    }

    if (self->_fingerprintMonitoringEnabled)
    {
      -[RTFingerprintManager setSettledState:](self, "setSettledState:", 0);
      -[RTFingerprintManager scenarioTriggerManager](self, "scenarioTriggerManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTScenarioTriggerManagerNotificationSettled, "notificationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:", self, sel_onSettledNotification_, v8);

      -[RTFingerprintManager scenarioTriggerManager](self, "scenarioTriggerManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTScenarioTriggerManagerNotificationUnsettled, "notificationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:", self, sel_onUnsettledNotification_, v10);

    }
    else
    {
      -[RTFingerprintManager scenarioTriggerManager](self, "scenarioTriggerManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObserver:", self);

      _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v13;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, stop scan snd invalidate scan timers", (uint8_t *)&v16, 0xCu);

      }
      -[RTFingerprintManager scanRequestTimer](self, "scanRequestTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invalidate");

      -[RTFingerprintManager setScanRequestTimer:](self, "setScanRequestTimer:", 0);
      -[RTFingerprintManager scanResultTimer](self, "scanResultTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "invalidate");

      -[RTFingerprintManager setScanResultTimer:](self, "setScanResultTimer:", 0);
    }
  }
}

- (void)onStoreAvailabilityDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTFingerprintManager *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__RTFingerprintManager_onStoreAvailabilityDidChangeNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__RTFingerprintManager_onStoreAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setAvailable:", objc_msgSend(*(id *)(a1 + 32), "availability") == 2);
}

- (void)onSettledNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTFingerprintManager_onSettledNotification___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __46__RTFingerprintManager_onSettledNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSettledState:", 2);
}

- (void)onUnsettledNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__RTFingerprintManager_onUnsettledNotification___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __48__RTFingerprintManager_onUnsettledNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSettledState:", 1);
}

- (void)setSettledState:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t settledState;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  _QWORD v39[6];
  _QWORD v40[5];
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (self->_settledState != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", self->_settledState);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v7;
      v44 = 2112;
      v45 = v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "settled state transitioned from, %@, to, %@", buf, 0x16u);

    }
    settledState = self->_settledState;
    if (settledState == 1)
    {
      if (a3 != 2)
        goto LABEL_27;
    }
    else if (a3 != 2 || settledState)
    {
      if (a3 != 1 || settledState != 2)
      {
        if (a3 == 1 && !settledState)
          -[RTFingerprintManager _startScanRequestForUnsettledState](self, "_startScanRequestForUnsettledState");
        goto LABEL_27;
      }
      -[RTFingerprintManager wifiManager](self, "wifiManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObserver:", self);

      -[RTFingerprintManager timerManager](self, "timerManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.scanRequestTimer"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier queue](self, "queue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __40__RTFingerprintManager_setSettledState___block_invoke_2;
      v39[3] = &unk_1E9297BF0;
      v39[4] = self;
      v39[5] = a2;
      objc_msgSend(v23, "timerWithIdentifier:queue:handler:", v27, v28, v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTFingerprintManager setScanRequestTimer:](self, "setScanRequestTimer:", v29);

      _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v43 = v31;
        _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, scanRequestTimer start", buf, 0xCu);

      }
      -[RTFingerprintManager defaultsManager](self, "defaultsManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", CFSTR("RTDefaultsFingerprintManagerScanRequestTimerDuration"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        -[RTFingerprintManager defaultsManager](self, "defaultsManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", CFSTR("RTDefaultsFingerprintManagerScanRequestTimerDuration"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v37 = v36;

      }
      else
      {
        v37 = 300.0;
      }

      -[RTFingerprintManager scanRequestTimer](self, "scanRequestTimer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "fireAfterDelay:interval:leeway:", v37, INFINITY, 1.0);

      -[RTFingerprintManager scanRequestTimer](self, "scanRequestTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resume");
      goto LABEL_26;
    }
    _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v11;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, invalidate scan timers for unsettled state", buf, 0xCu);

    }
    -[RTFingerprintManager scanRequestTimer](self, "scanRequestTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[RTFingerprintManager setScanRequestTimer:](self, "setScanRequestTimer:", 0);
    -[RTFingerprintManager scanResultTimer](self, "scanResultTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[RTFingerprintManager wifiManager](self, "wifiManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObserver:", self);

      -[RTFingerprintManager scanResultTimer](self, "scanResultTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "invalidate");

      -[RTFingerprintManager setScanResultTimer:](self, "setScanResultTimer:", 0);
    }
    if (-[RTFingerprintManager fingerprintMonitoringEnabled](self, "fingerprintMonitoringEnabled"))
    {
      v16 = objc_alloc(MEMORY[0x1E0D18398]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithIdentifier:settledState:start:accessPoints:", v17, 2, v18, 0);

      -[RTFingerprintManager fingerprintStore](self, "fingerprintStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __40__RTFingerprintManager_setSettledState___block_invoke;
      v40[3] = &unk_1E9297150;
      v40[4] = self;
      objc_msgSend(v20, "storeFingerprints:handler:", v21, v40);

LABEL_26:
LABEL_27:
      self->_settledState = a3;
    }
  }
}

void __40__RTFingerprintManager_setSettledState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "failed to save settled transition with error, %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__RTFingerprintManager_setSettledState___block_invoke_43;
    block[3] = &unk_1E92977B8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);

  }
}

void __40__RTFingerprintManager_setSettledState___block_invoke_43(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setStartCollectAccessPoints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:", v3, sel_onWiFiScanNotification_, v4);

  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleScan");

}

uint64_t __40__RTFingerprintManager_setSettledState___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, scanRequestTimer expiry", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "scanRequestTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setScanRequestTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_startScanRequestForUnsettledState");
}

- (void)_startScanRequestForUnsettledState
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[RTFingerprintManager fingerprintMonitoringEnabled](self, "fingerprintMonitoringEnabled"))
  {
    v4 = objc_alloc(MEMORY[0x1E0D18398]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithIdentifier:settledState:start:accessPoints:", v5, 1, v6, 0);

    -[RTFingerprintManager fingerprintStore](self, "fingerprintStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke;
    v10[3] = &unk_1E9297628;
    v10[4] = self;
    v10[5] = a2;
    objc_msgSend(v8, "storeFingerprints:handler:", v9, v10);

  }
}

void __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  __int128 v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "failed to save unsettled transition with error, %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_51;
    v6[3] = &unk_1E9297BF0;
    v7 = *(_OWORD *)(a1 + 32);
    dispatch_async(v5, v6);

  }
}

void __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_51(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setStartCollectAccessPoints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:", v3, sel_onWiFiScanNotification_, v4);

  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleScan");

  objc_msgSend(*(id *)(a1 + 32), "timerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.scanResultTimer"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_2;
  v17[3] = &unk_1E9297BF0;
  v18 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v6, "timerWithIdentifier:queue:handler:", v10, v11, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setScanResultTimer:", v12);

  _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, scanResultTimer start", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "scanResultTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fireAfterDelay:interval:leeway:", 10.0, INFINITY, 1.0);

  objc_msgSend(*(id *)(a1 + 32), "scanResultTimer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resume");

}

void __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, scanResultTimer expiry", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "scanResultTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setScanResultTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "timerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.scanRequestTimer"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_54;
  v23[3] = &unk_1E9297BF0;
  v24 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v6, "timerWithIdentifier:queue:handler:", v10, v11, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setScanRequestTimer:", v12);

  _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, scanRequestTimer start", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("RTDefaultsFingerprintManagerScanRequestTimerDuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("RTDefaultsFingerprintManagerScanRequestTimerDuration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

  }
  else
  {
    v20 = 300.0;
  }

  objc_msgSend(*(id *)(a1 + 32), "scanRequestTimer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fireAfterDelay:interval:leeway:", v20, INFINITY, 1.0);

  objc_msgSend(*(id *)(a1 + 32), "scanRequestTimer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resume");

}

uint64_t __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_54(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, scanRequestTimer expiry", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "scanRequestTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setScanRequestTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_startScanRequestForUnsettledState");
}

- (void)onWiFiScanNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  RTFingerprintManager *v10;
  SEL v11;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTFingerprintManager_onWiFiScanNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __47__RTFingerprintManager_onWiFiScanNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "startCollectAccessPoints");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "startCollectAccessPoints");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceNow");
      if (v4 < -300.0)
      {

LABEL_11:
        objc_msgSend(*(id *)(a1 + 40), "wifiManager");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObserver:", *(_QWORD *)(a1 + 40));

        return;
      }
      v6 = objc_msgSend(*(id *)(a1 + 40), "accessPointsCollectedPerFingerprint");
      v7 = objc_msgSend(*(id *)(a1 + 40), "accessPointsFetchLimit");

      if (v6 >= v7)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setStartCollectAccessPoints:", v5);

      objc_msgSend(*(id *)(a1 + 40), "setAccessPointsCollectedPerFingerprint:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "scanResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v10 = objc_msgSend(*(id *)(a1 + 40), "accessPointsCollectedPerFingerprint") + v9;
    if (v10 > objc_msgSend(*(id *)(a1 + 40), "accessPointsFetchLimit"))
    {
      objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(*(id *)(a1 + 40), "accessPointsFetchLimit")- objc_msgSend(*(id *)(a1 + 40), "accessPointsCollectedPerFingerprint"));
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "wifiManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObserver:", *(_QWORD *)(a1 + 40));

      v8 = (void *)v11;
    }
    objc_msgSend(*(id *)(a1 + 40), "fingerprintStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__RTFingerprintManager_onWiFiScanNotification___block_invoke_2;
    v18[3] = &unk_1E929B1E0;
    v15 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v19 = v8;
    v20 = v14;
    v18[4] = v15;
    v16 = v8;
    objc_msgSend(v13, "appendWiFiAccessPointsToLastFingerprint:handler:", v16, v18);

  }
}

void __47__RTFingerprintManager_onWiFiScanNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", objc_msgSend(*(id *)(a1 + 32), "settledState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");
    v8 = objc_msgSend(*(id *)(a1 + 32), "accessPointsCollectedPerFingerprint");
    v9 = objc_msgSend(*(id *)(a1 + 32), "accessPointsCollectedPerFingerprint");
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 138413570;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = v7;
    v22 = 2048;
    v23 = v8;
    v24 = 2048;
    v25 = v10 + v9;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, settledState, %@, scan result count, %lu, accessPointsCollectedPerFingerprint before, %lu, after, %lu, error, %@", buf, 0x3Eu);

  }
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "failed to save wifi access points with error, %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__RTFingerprintManager_onWiFiScanNotification___block_invoke_55;
    v14[3] = &unk_1E9297540;
    v13 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v13;
    dispatch_async(v12, v14);

  }
}

uint64_t __47__RTFingerprintManager_onWiFiScanNotification___block_invoke_55(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessPointsCollectedPerFingerprint:", objc_msgSend(*(id *)(a1 + 40), "count")+ objc_msgSend(*(id *)(a1 + 32), "accessPointsCollectedPerFingerprint"));
}

- (void)injectFingerprints:(id)a3 handler:(id)a4
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
  block[2] = __51__RTFingerprintManager_injectFingerprints_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __51__RTFingerprintManager_injectFingerprints_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fingerprintStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeFingerprints:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)injectWifiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4
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
  block[2] = __72__RTFingerprintManager_injectWifiAccessPointsToLastFingerprint_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __72__RTFingerprintManager_injectWifiAccessPointsToLastFingerprint_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fingerprintStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendWiFiAccessPointsToLastFingerprint:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  RTFingerprintManager *v14;
  id v15;
  unint64_t v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__RTFingerprintManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E92994E0;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v16 = a4;
    dispatch_async(v10, v12);

    v11 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __73__RTFingerprintManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("options cannot be nil");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (const __CFString **)v24;
    v10 = &v23;
LABEL_7:
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v13 = v7;
    v14 = 7;
    goto LABEL_9;
  }
  v3 = objc_msgSend(v2, "enumeratedType");
  objc_msgSend((id)objc_opt_class(), "vendedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "member:", v3);

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("the type specified by options is not vended by this manager");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v22;
    v10 = &v21;
    goto LABEL_7;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "available") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "fingerprintStore");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchEnumerableObjectsWithOptions:offset:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

    return;
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *MEMORY[0x1E0D18598];
  v19 = *MEMORY[0x1E0CB2D50];
  v20 = CFSTR("store is not available");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  v13 = v16;
  v14 = 5;
LABEL_9:
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)available
{
  return self->_available;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTFingerprintStore)fingerprintStore
{
  return self->_fingerprintStore;
}

- (RTTimer)scanRequestTimer
{
  return self->_scanRequestTimer;
}

- (void)setScanRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scanRequestTimer, a3);
}

- (RTTimer)scanResultTimer
{
  return self->_scanResultTimer;
}

- (void)setScanResultTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scanResultTimer, a3);
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (unint64_t)accessPointsFetchLimit
{
  return self->_accessPointsFetchLimit;
}

- (void)setAccessPointsFetchLimit:(unint64_t)a3
{
  self->_accessPointsFetchLimit = a3;
}

- (unint64_t)accessPointsCollectedPerFingerprint
{
  return self->_accessPointsCollectedPerFingerprint;
}

- (void)setAccessPointsCollectedPerFingerprint:(unint64_t)a3
{
  self->_accessPointsCollectedPerFingerprint = a3;
}

- (NSDate)startCollectAccessPoints
{
  return self->_startCollectAccessPoints;
}

- (void)setStartCollectAccessPoints:(id)a3
{
  objc_storeStrong((id *)&self->_startCollectAccessPoints, a3);
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (BOOL)fingerprintMonitoringEnabled
{
  return self->_fingerprintMonitoringEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCollectAccessPoints, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_scanResultTimer, 0);
  objc_storeStrong((id *)&self->_scanRequestTimer, 0);
  objc_storeStrong((id *)&self->_fingerprintStore, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
