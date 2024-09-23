@implementation RTPredictedLocationOfInterestProviderStateModel

- (RTPredictedLocationOfInterestProviderStateModel)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDataProtectionManager_learnedLocationManager_locationManager_metricManager_cache_);
}

- (RTPredictedLocationOfInterestProviderStateModel)initWithDataProtectionManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 metricManager:(id)a6 cache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RTPredictedLocationOfInterestProviderStateModel *v17;
  RTPredictedLocationOfInterestProviderStateModel *v18;
  RTPredictedLocationOfInterestProviderStateModel *v19;
  RTPredictedLocationOfInterestProviderStateModel *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *queue;
  id v32;
  id v33;
  id v34;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v36 = a4;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locat"
            "ionManager:metricManager:cache:]";
      v40 = 1024;
      v41 = 57;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataProtectionManager (in %s:%d)", buf, 0x12u);
    }

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locatio"
          "nManager:metricManager:cache:]";
    v40 = 1024;
    v41 = 58;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager (in %s:%d)", buf, 0x12u);
  }

  if (v14)
  {
LABEL_4:
    if (v15)
      goto LABEL_5;
LABEL_22:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locat"
            "ionManager:metricManager:cache:]";
      v40 = 1024;
      v41 = 60;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metricManager (in %s:%d)", buf, 0x12u);
    }

    if (v16)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_19:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locatio"
          "nManager:metricManager:cache:]";
    v40 = 1024;
    v41 = 59;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
  }

  if (!v15)
    goto LABEL_22;
LABEL_5:
  if (v16)
  {
LABEL_6:
    v17 = 0;
    if (v12 && v13 && v14 && v15)
    {
      v37.receiver = self;
      v37.super_class = (Class)RTPredictedLocationOfInterestProviderStateModel;
      v18 = -[RTPredictedLocationOfInterestProviderStateModel init](&v37, sel_init);
      v19 = v18;
      if (v18)
      {
        v33 = a5;
        v34 = a6;
        v20 = v18;
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = (const char *)-[RTPredictedLocationOfInterestProviderStateModel UTF8String](objc_retainAutorelease(v20), "UTF8String");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v20);
          v32 = a7;
          v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = (const char *)objc_msgSend(v28, "UTF8String");

          a7 = v32;
        }
        v29 = dispatch_queue_create(v22, v21);

        queue = v20->_queue;
        v20->_queue = (OS_dispatch_queue *)v29;

        objc_storeStrong((id *)&v20->_dataProtectionManager, a3);
        objc_storeStrong((id *)&v20->_learnedLocationManager, v36);
        objc_storeStrong((id *)&v20->_locationManager, v33);
        objc_storeStrong((id *)&v20->_metricManager, v34);
        objc_storeStrong((id *)&v20->_nextPredictedLocationsOfInterestCache, a7);
        -[RTNextPredictedLocationsOfInterestCache setDelegate:](v20->_nextPredictedLocationsOfInterestCache, "setDelegate:", v20);
      }
      self = v19;
      v17 = self;
    }
    goto LABEL_31;
  }
LABEL_25:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locatio"
          "nManager:metricManager:cache:]";
    v40 = 1024;
    v41 = 61;
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cache (in %s:%d)", buf, 0x12u);
  }

  v17 = 0;
LABEL_31:

  return v17;
}

- (void)updateEncryptedDataAvailabilityNotificationNeeded
{
  void *v3;
  uint64_t v4;

  -[RTPredictedLocationOfInterestProviderStateModel nextPredictedLocationsOfInterestCache](self, "nextPredictedLocationsOfInterestCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enabled");

  -[RTPredictedLocationOfInterestProviderStateModel setEncryptedDataAvailabilityNotificationNeeded:](self, "setEncryptedDataAvailabilityNotificationNeeded:", v4);
}

- (void)setEncryptedDataAvailabilityNotificationNeeded:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_encryptedDataAvailabilityNotificationNeeded != a3)
  {
    self->_encryptedDataAvailabilityNotificationNeeded = a3;
    if (a3)
    {
      -[RTPredictedLocationOfInterestProviderStateModel dataProtectionManager](self, "dataProtectionManager");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:", self, sel_onDataProtectionNotification_, v4);
    }
    else
    {
      -[RTPredictedLocationOfInterestProviderStateModel setEncryptedDataAvailability:](self, "setEncryptedDataAvailability:", 1);
      -[RTPredictedLocationOfInterestProviderStateModel dataProtectionManager](self, "dataProtectionManager");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:fromNotification:", self, v4);
    }

  }
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  if (self->_encryptedDataAvailability != a3)
  {
    self->_encryptedDataAvailability = a3;
    if (a3 == 3)
    {
      -[RTPredictedLocationOfInterestProviderStateModel nextPredictedLocationsOfInterestCache](self, "nextPredictedLocationsOfInterestCache");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "enabled");

      if (v5)
      {
        -[RTPredictedLocationOfInterestProviderStateModel locationManager](self, "locationManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke;
        v8[3] = &unk_1E929E678;
        v8[4] = self;
        objc_msgSend(v6, "fetchCurrentLocationWithHandler:", v8);

      }
    }
    else if (a3 == 2)
    {
      -[RTPredictedLocationOfInterestProviderStateModel nextPredictedLocationsOfInterestCache](self, "nextPredictedLocationsOfInterestCache");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clear");

    }
  }
}

void __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_2;
  v7[3] = &unk_1E9297540;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "learnedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_3;
  v5[3] = &unk_1E929C008;
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "fetchRecentLocationsOfInterestWithHandler:", v5);

}

void __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_4;
  block[3] = &unk_1E9299D78;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_4(uint64_t a1)
{
  RTStateModel *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  RTStateModel *v10;

  v2 = [RTStateModel alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metricManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RTStateModel initWithLearnedLocationsOfInterest:metricManager:queue:](v2, "initWithLearnedLocationsOfInterest:metricManager:queue:", v3, v4, v5);

  if (objc_msgSend(*(id *)(a1 + 40), "encryptedDataAvailability") == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "nextPredictedLocationsOfInterestCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStateModel getNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:](v10, "getNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:", v7, v8, 14400.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheNextPredictedLocationsOfInterest:", v9);

  }
}

- (void)onCacheEnabledDidChange:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[RTPredictedLocationOfInterestProviderStateModel queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__RTPredictedLocationOfInterestProviderStateModel_onCacheEnabledDidChange___block_invoke;
  v6[3] = &unk_1E9297870;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __75__RTPredictedLocationOfInterestProviderStateModel_onCacheEnabledDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onCacheEnabledDidChange:", *(unsigned __int8 *)(a1 + 40));
}

- (void)onDataProtectionNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTPredictedLocationOfInterestProviderStateModel *v9;

  v4 = a3;
  -[RTPredictedLocationOfInterestProviderStateModel queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__RTPredictedLocationOfInterestProviderStateModel_onDataProtectionNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __80__RTPredictedLocationOfInterestProviderStateModel_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setEncryptedDataAvailability:", objc_msgSend(*(id *)(a1 + 32), "availability"));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "unhandled RTDataProtectionManager notification, %@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (BOOL)requiresRoutineEnablement
{
  return 1;
}

- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "referenceLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "referenceDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowDuration");
  v11 = v10;
  -[RTPredictedLocationOfInterestProviderStateModel learnedLocationManager](self, "learnedLocationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __109__RTPredictedLocationOfInterestProviderStateModel_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke;
  v17[3] = &unk_1E92A39F8;
  v17[4] = self;
  v18 = v8;
  v19 = v6;
  v20 = v9;
  v22 = v11;
  v21 = v7;
  v13 = v7;
  v14 = v9;
  v15 = v6;
  v16 = v8;
  objc_msgSend(v12, "fetchRecentLocationsOfInterestWithHandler:", v17);

}

void __109__RTPredictedLocationOfInterestProviderStateModel_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__RTPredictedLocationOfInterestProviderStateModel_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2;
  v12[3] = &unk_1E92A39D0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v9;
  v16 = *(id *)(a1 + 48);
  v17 = v5;
  v18 = *(id *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 72);
  v19 = *(id *)(a1 + 64);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __109__RTPredictedLocationOfInterestProviderStateModel_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  RTStateModel *v4;
  RTStateModel *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  RTStateModel *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  RTStateModel *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "fetch cached next PLOIs", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "nextPredictedLocationsOfInterestCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getCachedNextPredictedLocationsOfInterest");
    v4 = (RTStateModel *)objc_claimAutoreleasedReturnValue();

    if (-[RTStateModel count](v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v24 = v4;
      v5 = v4;
      v6 = -[RTStateModel countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v27 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 48), "latitude");
            objc_msgSend(*(id *)(a1 + 48), "longitude");
            objc_msgSend(v10, "locationOfInterest");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "location");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "latitude");
            objc_msgSend(v10, "locationOfInterest");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "location");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "longitude");
            RTCommonCalculateDistanceHighPrecision();
            v16 = v15;

            objc_msgSend(*(id *)(a1 + 56), "minimumDistance");
            if (v16 <= v17)
            {
              _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v10;
                _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "dropping ploi, %@, too close to current location", buf, 0xCu);
              }

            }
            else
            {
              objc_msgSend(v25, "addObject:", v10);
            }
          }
          v7 = -[RTStateModel countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v7);
      }

      v19 = v25;
      v4 = v24;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v20 = [RTStateModel alloc];
    v21 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "metricManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[RTStateModel initWithLearnedLocationsOfInterest:metricManager:queue:](v20, "initWithLearnedLocationsOfInterest:metricManager:queue:", v21, v22, v23);

    -[RTStateModel getNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:](v4, "getNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(double *)(a1 + 88));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[RTPredictedLocationOfInterestProviderStateModel learnedLocationManager](self, "learnedLocationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedLocationsOfInterestWithCriteria_handler___block_invoke;
  v12[3] = &unk_1E9298550;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "fetchRecentLocationsOfInterestWithHandler:", v12);

}

void __105__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedLocationsOfInterestWithCriteria_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  __int128 v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2;
  block[3] = &unk_1E9297910;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v13 = v6;
  v9 = *(_OWORD *)(a1 + 48);
  v7 = (id)v9;
  v14 = v9;
  v8 = v3;
  dispatch_async(v4, block);

}

void __105__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2(uint64_t a1)
{
  RTStateModel *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  RTStateModel *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = [RTStateModel alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metricManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTStateModel initWithLearnedLocationsOfInterest:metricManager:queue:](v2, "initWithLearnedLocationsOfInterest:metricManager:queue:", v3, v4, v5);

  -[RTStateModel getPredictedLocationsOfInterestWithCriteria:](v6, "getPredictedLocationsOfInterestWithCriteria:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2048;
    v13 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@ found %lu PLOIs from state model", (uint8_t *)&v10, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTPredictedLocationOfInterestProviderStateModel learnedLocationManager](self, "learnedLocationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedExitDatesWithCriteria_handler___block_invoke;
  v11[3] = &unk_1E92A3A20;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "fetchRecentLocationsOfInterestWithHandler:", v11);

}

void __95__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedExitDatesWithCriteria_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedExitDatesWithCriteria_handler___block_invoke_2;
  block[3] = &unk_1E9299380;
  v13 = v6;
  v17 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v5;
  v15 = v8;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __95__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedExitDatesWithCriteria_handler___block_invoke_2(uint64_t a1)
{
  RTStateModel *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  RTStateModel *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
  }
  else
  {
    v2 = [RTStateModel alloc];
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "metricManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[RTStateModel initWithLearnedLocationsOfInterest:metricManager:queue:](v2, "initWithLearnedLocationsOfInterest:metricManager:queue:", v3, v4, v5);

    objc_msgSend(*(id *)(a1 + 56), "referenceLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "referenceDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStateModel getPredictedExitDatesFromLocation:onDate:](v6, "getPredictedExitDatesFromLocation:onDate:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "found %lu predicted exit dates", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (RTNextPredictedLocationsOfInterestCache)nextPredictedLocationsOfInterestCache
{
  return self->_nextPredictedLocationsOfInterestCache;
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (BOOL)encryptedDataAvailabilityNotificationNeeded
{
  return self->_encryptedDataAvailabilityNotificationNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterestCache, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
