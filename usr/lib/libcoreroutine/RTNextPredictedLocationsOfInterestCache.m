@implementation RTNextPredictedLocationsOfInterestCache

+ (id)cachePath
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", CFSTR("nextPloi.archive"));
}

- (RTNextPredictedLocationsOfInterestCache)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_dataProtectionManager_starkManager_);
}

- (RTNextPredictedLocationsOfInterestCache)initWithQueue:(id)a3 dataProtectionManager:(id)a4 starkManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  RTNextPredictedLocationsOfInterestCache *v12;
  RTNextPredictedLocationsOfInterestCache *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSArray *nextPredictedLocationsOfInterest;
  NSObject *v28;
  RTDataProtectionManager *dataProtectionManager;
  void *v30;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)RTNextPredictedLocationsOfInterestCache;
  v12 = -[RTNextPredictedLocationsOfInterestCache init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_dataProtectionManager, a4);
    objc_storeStrong((id *)&v13->_starkManager, a5);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0C99D50];
      +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dataWithContentsOfFile:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0C99E60];
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      v23 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v24, v19, &v32);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v32;
      nextPredictedLocationsOfInterest = v13->_nextPredictedLocationsOfInterest;
      v13->_nextPredictedLocationsOfInterest = (NSArray *)v25;

      if (v26)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v26;
          _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "error while decoding NPLOI archive, %@", buf, 0xCu);
        }

      }
    }
    dataProtectionManager = v13->_dataProtectionManager;
    +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](dataProtectionManager, "addObserver:selector:name:", v13, sel_onDataProtectionNotification_, v30);

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[RTNotifier removeObserver:](self->_dataProtectionManager, "removeObserver:", self);
  -[RTNotifier removeObserver:](self->_starkManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RTNextPredictedLocationsOfInterestCache;
  -[RTNextPredictedLocationsOfInterestCache dealloc](&v3, sel_dealloc);
}

- (void)cacheNextPredictedLocationsOfInterest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNextPredictedLocationsOfInterestCache setNextPredictedLocationsOfInterest:](self, "setNextPredictedLocationsOfInterest:", v7);

    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNextPredictedLocationsOfInterestCache nextPredictedLocationsOfInterest](self, "nextPredictedLocationsOfInterest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v9;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "caching next predicted location of interest, %@, at, %@", buf, 0x16u);

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    -[RTNextPredictedLocationsOfInterestCache nextPredictedLocationsOfInterest](self, "nextPredictedLocationsOfInterest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v13, *MEMORY[0x1E0CB2CD0]);

    objc_msgSend(v12, "finishEncoding");
    v21 = *MEMORY[0x1E0CB2AD8];
    v22 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "createFileAtPath:contents:attributes:", v16, v17, v14);

    if ((v18 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "failed to create file at %@", buf, 0xCu);

      }
      -[RTNextPredictedLocationsOfInterestCache clear](self, "clear");
    }

  }
  else
  {
    -[RTNextPredictedLocationsOfInterestCache clear](self, "clear");
  }

}

- (void)clear
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[RTNextPredictedLocationsOfInterestCache setNextPredictedLocationsOfInterest:](self, "setNextPredictedLocationsOfInterest:", 0);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "clearing next predicted locations of interesting cache at %@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", v8, 0);

  }
}

- (void)purgeWithReferenceDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNextPredictedLocationsOfInterestCache cachePath](RTNextPredictedLocationsOfInterestCache, "cachePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributesOfItemAtPath:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v4, -86400.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2A38]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "stringFromDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "purge cache predating, %@, file date, %@", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(v11, "earlierDate:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToDate:", v12);

    if (v17)
      -[RTNextPredictedLocationsOfInterestCache clear](self, "clear");

  }
}

- (void)onDataProtectionNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTNextPredictedLocationsOfInterestCache queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__RTNextPredictedLocationsOfInterestCache_onDataProtectionNotification___block_invoke;
    v9[3] = &unk_1E9297540;
    v9[4] = self;
    v10 = v4;
    dispatch_async(v8, v9);

  }
}

uint64_t __72__RTNextPredictedLocationsOfInterestCache_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUnlockedSinceBoot:", objc_msgSend(*(id *)(a1 + 40), "unlockedSinceBoot"));
}

- (void)handleUnlockedSinceBoot:(BOOL)a3
{
  RTDataProtectionManager *dataProtectionManager;
  void *v5;
  RTStarkManager *starkManager;
  id v7;

  if (a3)
  {
    dataProtectionManager = self->_dataProtectionManager;
    +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier removeObserver:fromNotification:](dataProtectionManager, "removeObserver:fromNotification:", self, v5);

    starkManager = self->_starkManager;
    +[RTNotification notificationName](RTStarkManagerNotificationTrustedConnectionEstablished, "notificationName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](starkManager, "addObserver:selector:name:", self, sel_onStarkNotification_, v7);

  }
}

- (void)onStarkNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStarkManagerNotificationTrustedConnectionEstablished, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTNextPredictedLocationsOfInterestCache queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__RTNextPredictedLocationsOfInterestCache_onStarkNotification___block_invoke;
    v9[3] = &unk_1E9297540;
    v9[4] = self;
    v10 = v4;
    dispatch_async(v8, v9);

  }
}

uint64_t __63__RTNextPredictedLocationsOfInterestCache_onStarkNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStarkTrustedConnectionEstablished:", objc_msgSend(*(id *)(a1 + 40), "trustedConnectionEstablished"));
}

- (void)setEnabled:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_enabled)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "next predicted location of interest cache, enabled, %@", (uint8_t *)&v7, 0xCu);
    }

    -[RTNextPredictedLocationsOfInterestCache delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "onCacheEnabledDidChange:", self->_enabled);

  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (RTNextPredictedLocationsOfInterestCacheDelegate)delegate
{
  return (RTNextPredictedLocationsOfInterestCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSArray)nextPredictedLocationsOfInterest
{
  return self->_nextPredictedLocationsOfInterest;
}

- (void)setNextPredictedLocationsOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterest, a3);
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionManager, a3);
}

- (RTStarkManager)starkManager
{
  return self->_starkManager;
}

- (void)setStarkManager:(id)a3
{
  objc_storeStrong((id *)&self->_starkManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starkManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
