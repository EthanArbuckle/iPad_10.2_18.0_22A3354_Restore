@implementation ATXLocationManagerGPSCoreLocation

- (id)_init
{
  ATXLocationManagerGPSCoreLocation *v2;
  uint64_t v3;
  NSCondition *updateCondition;
  uint64_t v5;
  NSCondition *requestStateCondition;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *clQueue;
  NSObject *v10;
  _QWORD block[4];
  ATXLocationManagerGPSCoreLocation *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXLocationManagerGPSCoreLocation;
  v2 = -[ATXLocationManagerGPSCoreLocation init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    updateCondition = v2->_updateCondition;
    v2->_updateCondition = (NSCondition *)v3;

    v5 = objc_opt_new();
    requestStateCondition = v2->_requestStateCondition;
    v2->_requestStateCondition = (NSCondition *)v5;

    v2->_state = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("_clCallbackQueue", v7);
    clQueue = v2->_clQueue;
    v2->_clQueue = (OS_dispatch_queue *)v8;

    v10 = v2->_clQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__ATXLocationManagerGPSCoreLocation__init__block_invoke;
    block[3] = &unk_1E942E9B8;
    v13 = v2;
    dispatch_sync(v10, block);

  }
  return v2;
}

uint64_t __42__ATXLocationManagerGPSCoreLocation__init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/PrivateFrameworks/CoreParsec.framework"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDesiredAccuracy:", *MEMORY[0x1E0C9E4A8]);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "authorizationStatus") == 3;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "accuracyAuthorization");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = result == 0;
  return result;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ATXLocationManagerGPSCoreLocation_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  return (id)sharedInstance__pasExprOnceResult;
}

void __51__ATXLocationManagerGPSCoreLocation_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D82448B0]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v4 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  NSObject *clQueue;
  objc_super v4;
  _QWORD block[5];

  clQueue = self->_clQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ATXLocationManagerGPSCoreLocation_dealloc__block_invoke;
  block[3] = &unk_1E942E9B8;
  block[4] = self;
  dispatch_async(clQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ATXLocationManagerGPSCoreLocation;
  -[ATXLocationManagerGPSCoreLocation dealloc](&v4, sel_dealloc);
}

id __44__ATXLocationManagerGPSCoreLocation_dealloc__block_invoke()
{
  return (id)objc_opt_self();
}

- (BOOL)locationEnabled
{
  ATXLocationManagerGPSCoreLocation *v2;
  BOOL locationEnabled;

  v2 = self;
  objc_sync_enter(v2);
  locationEnabled = v2->_locationEnabled;
  objc_sync_exit(v2);

  return locationEnabled;
}

- (BOOL)preciseLocationEnabled
{
  ATXLocationManagerGPSCoreLocation *v2;
  BOOL preciseLocationEnabled;

  v2 = self;
  objc_sync_enter(v2);
  preciseLocationEnabled = v2->_preciseLocationEnabled;
  objc_sync_exit(v2);

  return preciseLocationEnabled;
}

- (CLLocation)location
{
  return -[CLLocationManager location](self->_locationManager, "location");
}

- (void)_startUpdateIfNeededWithPreciseLocation:(BOOL)a3
{
  NSObject *clQueue;
  _QWORD v4[5];
  BOOL v5;

  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    clQueue = self->_clQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __77__ATXLocationManagerGPSCoreLocation__startUpdateIfNeededWithPreciseLocation___block_invoke;
    v4[3] = &unk_1E942EC40;
    v4[4] = self;
    v5 = a3;
    dispatch_async(clQueue, v4);
  }
}

uint64_t __77__ATXLocationManagerGPSCoreLocation__startUpdateIfNeededWithPreciseLocation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  double *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 40))
      v6 = CFSTR("NO");
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D2C00000, v2, OS_LOG_TYPE_DEFAULT, "%@ - Querying GPS location now, requesting with precise location: %@", (uint8_t *)&v9, 0x16u);

  }
  v7 = (double *)MEMORY[0x1E0C9E490];
  if (!*(_BYTE *)(a1 + 40))
    v7 = (double *)MEMORY[0x1E0C9E4A8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDesiredAccuracy:", *v7);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestLocation");
}

- (id)updateLocationWithTimeout:(double)a3 requestPreciseLocation:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationManagerGPS.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeout > 0"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXLocationManagerGPSCoreLocation preciseLocationEnabled](self, "preciseLocationEnabled");
  -[NSCondition lock](self->_updateCondition, "lock");
  -[ATXLocationManagerGPSCoreLocation _startUpdateIfNeededWithPreciseLocation:](self, "_startUpdateIfNeededWithPreciseLocation:", v8 & v4);
  while (self->_updatePending)
  {
    if (!-[NSCondition waitUntilDate:](self->_updateCondition, "waitUntilDate:", v7))
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_1D2C00000, v9, OS_LOG_TYPE_DEFAULT, "%@ - Timeout waiting for location update", buf, 0xCu);

      }
      break;
    }
  }
  -[NSCondition unlock](self->_updateCondition, "unlock");
  -[ATXLocationManagerGPSCoreLocation location](self, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)updateLocationWithCompletionHandler:(id)a3
{
  NSMutableSet *locationBlocksToInvoke;
  NSMutableSet *v5;
  NSMutableSet *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSCondition lock](self->_updateCondition, "lock");
  locationBlocksToInvoke = self->_locationBlocksToInvoke;
  if (!locationBlocksToInvoke)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_locationBlocksToInvoke;
    self->_locationBlocksToInvoke = v5;

    locationBlocksToInvoke = self->_locationBlocksToInvoke;
  }
  v7 = (void *)MEMORY[0x1D8244A3C](v8);
  -[NSMutableSet addObject:](locationBlocksToInvoke, "addObject:", v7);

  -[ATXLocationManagerGPSCoreLocation _startUpdateIfNeededWithPreciseLocation:](self, "_startUpdateIfNeededWithPreciseLocation:", 0);
  -[NSCondition unlock](self->_updateCondition, "unlock");

}

- (void)beginMonitoringRegion:(id)a3
{
  id v4;
  NSObject *clQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clQueue = self->_clQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ATXLocationManagerGPSCoreLocation_beginMonitoringRegion___block_invoke;
  v7[3] = &unk_1E942EC68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clQueue, v7);

}

uint64_t __59__ATXLocationManagerGPSCoreLocation_beginMonitoringRegion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startMonitoringForRegion:", *(_QWORD *)(a1 + 40));
}

- (int64_t)stateForRegion:(id)a3 withTimeout:(double)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  CLRegion *regionRequested;
  NSObject *v11;
  void *v12;
  int64_t state;
  int64_t v14;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationManagerGPS.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeout > 0"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCondition lock](self->_requestStateCondition, "lock");
  -[ATXLocationManagerGPSCoreLocation _requestStateIfNeededForRegion:](self, "_requestStateIfNeededForRegion:", v7);
  while (self->_regionRequested)
  {
    if (!-[NSCondition waitUntilDate:](self->_requestStateCondition, "waitUntilDate:", v8))
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2C00000, v9, OS_LOG_TYPE_DEFAULT, "Timeout waiting for region state update", buf, 2u);
      }

      regionRequested = self->_regionRequested;
      self->_regionRequested = 0;
      self->_state = 0;

      break;
    }
  }
  -[NSCondition unlock](self->_requestStateCondition, "unlock");
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    state = self->_state;
    *(_DWORD *)buf = 136315650;
    v18 = "-[ATXLocationManagerGPSCoreLocation stateForRegion:withTimeout:]";
    v19 = 2112;
    v20 = v12;
    v21 = 2048;
    v22 = state;
    _os_log_impl(&dword_1D2C00000, v11, OS_LOG_TYPE_DEFAULT, "%s: region: %@, state: %ld", buf, 0x20u);

  }
  v14 = self->_state;

  return v14;
}

- (void)_requestStateIfNeededForRegion:(id)a3
{
  id v5;
  NSObject *clQueue;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  if (!self->_regionRequested)
  {
    objc_storeStrong((id *)&self->_regionRequested, a3);
    self->_state = 0;
    clQueue = self->_clQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__ATXLocationManagerGPSCoreLocation__requestStateIfNeededForRegion___block_invoke;
    v7[3] = &unk_1E942EC68;
    v7[4] = self;
    v8 = v5;
    dispatch_async(clQueue, v7);

  }
}

uint64_t __68__ATXLocationManagerGPSCoreLocation__requestStateIfNeededForRegion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestStateForRegion:", *(_QWORD *)(a1 + 40));
}

- (id)_existingRegionWithIdentifierOnCLQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CLLocationManager monitoredRegions](self->_locationManager, "monitoredRegions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)stopMonitoringRegionWithIdentifier:(id)a3
{
  id v4;
  NSObject *clQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clQueue = self->_clQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ATXLocationManagerGPSCoreLocation_stopMonitoringRegionWithIdentifier___block_invoke;
  v7[3] = &unk_1E942EC68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clQueue, v7);

}

void __72__ATXLocationManagerGPSCoreLocation_stopMonitoringRegionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_existingRegionWithIdentifierOnCLQueue:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopMonitoringForRegion:", v2);
    v2 = v3;
  }

}

- (void)_updateConditionAndInvokeLocationBlocks:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *locationBlocksToInvoke;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSCondition lock](self->_updateCondition, "lock");
  self->_updatePending = 0;
  -[NSCondition broadcast](self->_updateCondition, "broadcast");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_locationBlocksToInvoke;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  locationBlocksToInvoke = self->_locationBlocksToInvoke;
  self->_locationBlocksToInvoke = 0;

  -[NSCondition unlock](self->_updateCondition, "unlock", (_QWORD)v14);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "lastObject", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    v10 = v9;
    objc_msgSend(v5, "coordinate");
    v12 = 138412803;
    v13 = v8;
    v14 = 2053;
    v15 = v10;
    v16 = 2053;
    v17 = v11;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Got location update: %{sensitive}f, %{sensitive}f", (uint8_t *)&v12, 0x20u);

  }
  -[ATXLocationManagerGPSCoreLocation _updateConditionAndInvokeLocationBlocks:error:](self, "_updateConditionAndInvokeLocationBlocks:error:", v5, 0);

}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "Started monitoring region: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a4;
  v7 = a5;
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[ATXLocationManagerGPSCoreLocation locationManager:monitoringDidFailForRegion:withError:].cold.1(v6, (uint64_t)v7, v8);

}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  NSObject *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject identifier](v6, "identifier");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject center](v6, "center");
      v10 = v9;
      -[NSObject center](v6, "center");
      v12 = v11;
      -[NSObject radius](v6, "radius");
      *(_DWORD *)buf = 138413058;
      v19 = v8;
      v20 = 2048;
      v21 = v10;
      v22 = 2048;
      v23 = v12;
      v24 = 2048;
      v25 = v13;
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "did enter region: %@, region center: (%f, %f), region radius: %f", buf, 0x2Au);

    }
    goto LABEL_6;
  }
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = objc_opt_class();
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "did enter region: %@, class: %@", buf, 0x16u);
LABEL_6:

  }
  dispatch_get_global_queue(9, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__ATXLocationManagerGPSCoreLocation_locationManager_didEnterRegion___block_invoke;
  v16[3] = &unk_1E942EC68;
  v16[4] = self;
  v17 = v5;
  v15 = v5;
  dispatch_async(v14, v16);

}

void __68__ATXLocationManagerGPSCoreLocation_locationManager_didEnterRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationManagerGPS:didEnterRegionWithIdentifier:", v2, v3);

}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  NSObject *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject identifier](v6, "identifier");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject center](v6, "center");
      v10 = v9;
      -[NSObject center](v6, "center");
      v12 = v11;
      -[NSObject radius](v6, "radius");
      *(_DWORD *)buf = 138413058;
      v19 = v8;
      v20 = 2048;
      v21 = v10;
      v22 = 2048;
      v23 = v12;
      v24 = 2048;
      v25 = v13;
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "did exit region: %@, region center: (%f, %f), region radius: %f", buf, 0x2Au);

    }
    goto LABEL_6;
  }
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = objc_opt_class();
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "did exit region: %@, class: %@", buf, 0x16u);
LABEL_6:

  }
  dispatch_get_global_queue(9, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__ATXLocationManagerGPSCoreLocation_locationManager_didExitRegion___block_invoke;
  v16[3] = &unk_1E942EC68;
  v16[4] = self;
  v17 = v5;
  v15 = v5;
  dispatch_async(v14, v16);

}

void __67__ATXLocationManagerGPSCoreLocation_locationManager_didExitRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationManagerGPS:didExitRegionWithIdentifier:", v2, v3);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  ATXLocationManagerGPSCoreLocation *v5;
  int locationEnabled;
  int v7;
  int preciseLocationEnabled;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  char v14;
  _QWORD block[5];
  char v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  locationEnabled = v5->_locationEnabled;
  v7 = objc_msgSend(v4, "authorizationStatus") == 3;
  v5->_locationEnabled = v7;
  preciseLocationEnabled = v5->_preciseLocationEnabled;
  v9 = objc_msgSend(v4, "accuracyAuthorization") == 0;
  v5->_preciseLocationEnabled = v9;
  objc_sync_exit(v5);

  v10 = MEMORY[0x1E0C809B0];
  if (locationEnabled != v7)
  {
    dispatch_get_global_queue(9, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __75__ATXLocationManagerGPSCoreLocation_locationManagerDidChangeAuthorization___block_invoke;
    block[3] = &unk_1E942EC40;
    block[4] = v5;
    v16 = v7;
    dispatch_async(v11, block);

  }
  if (preciseLocationEnabled != v9)
  {
    dispatch_get_global_queue(9, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __75__ATXLocationManagerGPSCoreLocation_locationManagerDidChangeAuthorization___block_invoke_2;
    v13[3] = &unk_1E942EC40;
    v13[4] = v5;
    v14 = v9;
    dispatch_async(v12, v13);

  }
}

void __75__ATXLocationManagerGPSCoreLocation_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangeLocationEnabled:", *(unsigned __int8 *)(a1 + 40));

}

void __75__ATXLocationManagerGPSCoreLocation_locationManagerDidChangeAuthorization___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangePreciseLocationEnabled:", *(unsigned __int8 *)(a1 + 40));

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ATXLocationManagerGPSCoreLocation locationManager:didFailWithError:].cold.1((uint64_t)v5, v6);

  -[ATXLocationManagerGPSCoreLocation _updateConditionAndInvokeLocationBlocks:error:](self, "_updateConditionAndInvokeLocationBlocks:error:", 0, v5);
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  CLRegion *regionRequested;
  CLRegion *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[ATXLocationManagerGPSCoreLocation locationManager:didDetermineState:forRegion:]";
    v14 = 2112;
    v15 = v9;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1D2C00000, v8, OS_LOG_TYPE_DEFAULT, "%s: region: %@, state: %ld", (uint8_t *)&v12, 0x20u);

  }
  -[NSCondition lock](self->_requestStateCondition, "lock");
  regionRequested = self->_regionRequested;
  if (regionRequested && -[CLRegion isEqual:](regionRequested, "isEqual:", v7))
  {
    v11 = self->_regionRequested;
    self->_regionRequested = 0;

    self->_state = a4;
    -[NSCondition broadcast](self->_requestStateCondition, "broadcast");
  }
  -[NSCondition unlock](self->_requestStateCondition, "unlock");

}

- (ATXLocationManagerGPSDelegate)delegate
{
  return (ATXLocationManagerGPSDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_regionRequested, 0);
  objc_storeStrong((id *)&self->_requestStateCondition, 0);
  objc_storeStrong((id *)&self->_locationBlocksToInvoke, 0);
  objc_storeStrong((id *)&self->_updateCondition, 0);
  objc_storeStrong((id *)&self->_clQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)locationManager:(void *)a1 monitoringDidFailForRegion:(uint64_t)a2 withError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D2C00000, a3, OS_LOG_TYPE_ERROR, "Failed to start monitoring region: %@ error: %@", (uint8_t *)&v6, 0x16u);

}

- (void)locationManager:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_ERROR, "Location error %@", (uint8_t *)&v2, 0xCu);
}

@end
