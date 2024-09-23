@implementation RTLocationStore

uint64_t __42__RTLocationStore_storeLocations_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeLocations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)storeLocations:(id)a3 handler:(id)a4
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
  block[2] = __42__RTLocationStore_storeLocations_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_storeLocations:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  OS_os_transaction *v15;
  OS_os_transaction *flushTransaction;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  if (-[RTService isShuttingDown](self, "isShuttingDown"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v31 = objc_msgSend(v7, "count");
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "Ignoring %lu locations for storage, shutdown in progress", buf, 0xCu);
    }

LABEL_15:
    if (v8)
      v8[2](v8, 0);
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "count"))
  {
    -[NSMutableArray addObjectsFromArray:](self->_locations, "addObjectsFromArray:", v7);
    if (-[NSMutableArray count](self->_locations, "count") && !self->_flushTransaction)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v12, v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "UTF8String");
      v15 = (OS_os_transaction *)os_transaction_create();
      flushTransaction = self->_flushTransaction;
      self->_flushTransaction = v15;

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = (uint64_t)v28;
        v32 = 2112;
        v33 = v29;
        _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v23 = objc_msgSend(v7, "count");
      objc_msgSend(v7, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[NSMutableArray count](self->_locations, "count");
      *(_DWORD *)buf = 134218754;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      v36 = 2048;
      v37 = v26;
      _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "added %lu locations to cache, first, %@, last, %@, total, %lu", buf, 0x2Au);

    }
    -[RTLocationStore _startFlushTimer](self, "_startFlushTimer");
    if ((unint64_t)-[NSMutableArray count](self->_locations, "count") >= 0x97)
      -[RTLocationStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", &__block_literal_global_24_0);
    goto LABEL_15;
  }
  if (v8)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D18598];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("requires valid locations.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v8)[2](v8, v22);

  }
LABEL_17:

}

- (void)_startFlushTimer
{
  RTTimerManager *timerManager;
  void *v4;
  RTTimer *v5;
  RTTimer *flushTimer;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (!self->_flushTimer)
  {
    objc_initWeak(&location, self);
    timerManager = self->_timerManager;
    -[RTNotifier queue](self, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __35__RTLocationStore__startFlushTimer__block_invoke;
    v10 = &unk_1E92983E8;
    objc_copyWeak(&v11, &location);
    -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.locationStore.flushTimer"), v4, &v7);
    v5 = (RTTimer *)objc_claimAutoreleasedReturnValue();
    flushTimer = self->_flushTimer;
    self->_flushTimer = v5;

    -[RTTimer fireAfterDelay:interval:leeway:](self->_flushTimer, "fireAfterDelay:interval:leeway:", 75.0, 75.0, 15.0, v7, v8, v9, v10);
    -[RTTimer resume](self->_flushTimer, "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __52__RTLocationStore__flushCachedLocationsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v9, 0x16u);

    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __35__RTLocationStore__startFlushTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "flushTimer timer expiry", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_flushCachedLocationsWithHandler:", &__block_literal_global_65);

}

- (void)_invalidateFlushTimer
{
  RTTimer *flushTimer;

  -[RTTimer invalidate](self->_flushTimer, "invalidate");
  flushTimer = self->_flushTimer;
  self->_flushTimer = 0;

}

- (void)_flushCachedLocationsWithHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[NSMutableArray count](self->_locations, "count"))
  {
    v6 = (void *)-[NSMutableArray copy](self->_locations, "copy");
    _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v6, "count");
      objc_msgSend(v6, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "flushing %lu locations to cache, first, %@, last, %@", buf, 0x20u);

    }
    -[NSMutableArray removeAllObjects](self->_locations, "removeAllObjects");
    -[RTLocationStore _invalidateFlushTimer](self, "_invalidateFlushTimer");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__RTLocationStore__flushCachedLocationsWithHandler___block_invoke;
    v11[3] = &unk_1E9298100;
    v11[4] = self;
    v13 = a2;
    v12 = v5;
    -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v6, v11);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

- (RTLocationStore)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_timerManager_);
}

- (RTLocationStore)initWithPersistenceManager:(id)a3
{
  id v4;
  void *v5;
  RTLocationStore *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[RTLocationStore initWithPersistenceManager:timerManager:](self, "initWithPersistenceManager:timerManager:", v4, v5);

  return v6;
}

- (RTLocationStore)initWithPersistenceManager:(id)a3 timerManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RTLocationStore *v9;
  RTLocationStore *v10;
  uint64_t v11;
  NSMutableArray *locations;
  RTLocationStore *v13;
  NSObject *v14;
  const char *v15;
  objc_super v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v13 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: persistenceManager";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_12;
  }
  v17.receiver = self;
  v17.super_class = (Class)RTLocationStore;
  v9 = -[RTStore initWithPersistenceManager:](&v17, sel_initWithPersistenceManager_, v6);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timerManager, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    locations = v10->_locations;
    v10->_locations = (NSMutableArray *)v11;

  }
  self = v10;
  v13 = self;
LABEL_10:

  return v13;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__RTLocationStore__shutdownWithHandler___block_invoke;
  v6[3] = &unk_1E9297568;
  v7 = v4;
  v5 = v4;
  -[RTLocationStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", v6);

}

uint64_t __40__RTLocationStore__shutdownWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __35__RTLocationStore__startFlushTimer__block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "flushed cached locations, error, %@", (uint8_t *)&v4, 0xCu);
  }

}

void __43__RTLocationStore__storeLocations_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "flushed cached locations, error, %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  double v38;
  unint64_t v39;
  SEL v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[RTLocationStore _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
      v47 = 1024;
      v48 = 235;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
    }

    if (v15)
      goto LABEL_4;
LABEL_14:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[RTLocationStore _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
      v47 = 1024;
      v48 = 236;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[RTLocationStore _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
    v47 = 1024;
    v48 = 234;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
  }

  if (!v14)
    goto LABEL_11;
LABEL_3:
  if (!v15)
    goto LABEL_14;
LABEL_4:
  if (v13 && v14)
  {
    if (objc_msgSend(v13, "compare:", v14) != 1)
    {
      v28 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke;
      v34[3] = &unk_1E929F2E8;
      v35 = v13;
      v36 = v14;
      v38 = a5;
      v39 = a6;
      v40 = a2;
      v29 = v15;
      v37 = v29;
      v31[0] = v28;
      v31[1] = 3221225472;
      v31[2] = __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_44;
      v31[3] = &unk_1E929F310;
      v31[4] = self;
      v32 = (id)MEMORY[0x1D8232094](v34);
      v33 = v29;
      v30 = v32;
      -[RTLocationStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", v31);

      v19 = v35;
      goto LABEL_19;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D18598];
    v41 = *MEMORY[0x1E0CB2D50];
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "stringFromDate");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("fromDate, %@, postdates toDate, %@"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v23);

  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D18598];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR("requires valid dates.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 7, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v20);
  }

LABEL_19:
}

void __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  _QWORD v28[3];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTCLLocationMO fetchRequest](RTCLLocationMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 1);
  v29[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ <= %K"), *(_QWORD *)(a1 + 32), CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timestamp"), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("horizontalAccuracy"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v14);

  objc_msgSend(v4, "setFetchBatchSize:", 3600);
  objc_msgSend(v4, "setFetchLimit:", *(_QWORD *)(a1 + 64));
  v19 = 0;
  v15 = objc_msgSend(v3, "countForFetchRequest:error:", v4, &v19);

  v16 = v19;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = v18;
    v22 = 2112;
    v23 = v4;
    v24 = 2048;
    v25 = v15;
    v26 = 2112;
    v27 = v16;
    _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_2;
  block[3] = &unk_1E929B4A8;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_3;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
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
  double v23;
  unint64_t v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__RTLocationStore_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke;
  v19[3] = &unk_1E9297E20;
  v19[4] = self;
  v20 = v12;
  v23 = a5;
  v24 = a6;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, v19);

}

uint64_t __86__RTLocationStore_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTLocationStore _fetchStoredLocationsWithOptions:handler:]";
      v12 = 1024;
      v13 = 321;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184E8]), "initWithEnumerationOptions:", v6);
  -[RTLocationStore _fetchStoredLocationsWithContext:handler:](self, "_fetchStoredLocationsWithContext:handler:", v9, v7);

}

- (void)fetchLastLocationWithHandler:(id)a3
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
  v7[2] = __48__RTLocationStore_fetchLastLocationWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__RTLocationStore_fetchLastLocationWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLastLocationWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchLastLocationWithHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke;
    v18[3] = &unk_1E929DC08;
    v20 = a2;
    v8 = v5;
    v19 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v18);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_49;
    v15[3] = &unk_1E929F338;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v10 = v9;
    -[RTLocationStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", v15);

    v11 = v19;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTLocationStore _fetchLastLocationWithHandler:]";
      v25 = 1024;
      v26 = 338;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("A handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v11);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "A handler is a required parameter, %@", buf, 0xCu);
    }

  }
}

void __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTCLLocationMO fetchRequest](RTCLLocationMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 0);
  v23[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  objc_msgSend(v4, "setFetchLimit:", 1);
  v14 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 138413058;
    v16 = v12;
    v17 = 2112;
    v18 = v4;
    v19 = 2048;
    v20 = v13;
    v21 = 2112;
    v22 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9E3B8], "createWithManagedObject:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_49(id *a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (a2)
  {
    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    objc_msgSend(a1[4], "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_2;
    block[3] = &unk_1E929B4A8;
    block[4] = a1[4];
    v5 = a1[6];
    v6 = a1[5];
    dispatch_async(v3, block);

  }
}

void __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_3;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __59__RTLocationStore_fetchStoredLocationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__RTLocationStore_fetchStoredLocationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  RTLocationStore *v22;
  id v23;
  SEL v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke;
    v20[3] = &unk_1E92979A0;
    v21 = v7;
    v22 = self;
    v24 = a2;
    v10 = v8;
    v23 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v20);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_50;
    v17[3] = &unk_1E929F338;
    v17[4] = self;
    v18 = v10;
    v19 = v11;
    v12 = v11;
    -[RTLocationStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", v17);

    v13 = v21;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTLocationStore _fetchStoredLocationsWithContext:handler:]";
      v29 = 1024;
      v30 = 406;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("A handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "A handler is a required parameter, %@", buf, 0xCu);
    }

  }
}

void __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestFromStoredLocationOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOffset:", objc_msgSend(*(id *)(a1 + 32), "offset"));
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v35 = objc_msgSend(v9, "fetchLimit");
    v36 = 2048;
    v37 = objc_msgSend(v9, "fetchOffset");
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "using options fetch limit, %lu, fetch offset, %lu", buf, 0x16u);
  }

  v32 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v9, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 138413058;
    v35 = (uint64_t)v23;
    v36 = 2112;
    v37 = (uint64_t)v9;
    v38 = 2048;
    v39 = v24;
    v40 = 2112;
    v41 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "fetchLimit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v25 = a1;
    v26 = v6;
    v27 = v3;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0C9E3B8], "createWithManagedObject:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v14, "addObject:", v22);

          objc_autoreleasePoolPop(v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v17);
    }

    v6 = v26;
    v3 = v27;
    a1 = v25;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_50(id *a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (a2)
  {
    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    objc_msgSend(a1[4], "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_2;
    block[3] = &unk_1E929B4A8;
    block[4] = a1[4];
    v5 = a1[6];
    v6 = a1[5];
    dispatch_async(v3, block);

  }
}

void __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_3;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
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
  block[2] = __59__RTLocationStore_fetchStoredLocationsWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__RTLocationStore_fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)enumerateStoredLocationsWithContext:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD block[5];
  NSObject *v45;
  SEL v46;
  char v47;
  _BYTE buf[12];
  __int16 v49;
  NSObject *v50;
  uint64_t v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v47 = 0;
    if (v7)
    {
      v9 = dispatch_semaphore_create(0);
      -[RTNotifier queue](self, "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke;
      block[3] = &unk_1E9297BC8;
      block[4] = self;
      v46 = a2;
      v12 = v9;
      v45 = v12;
      dispatch_async(v10, block);

      v13 = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v13, v15))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v14;
        objc_msgSend(v40, "timeIntervalSinceDate:", v14);
        v17 = v16;
        v18 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_181);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v18;
        objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0D18598];
        v53[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        v26 = 1;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v53, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 15, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = objc_retainAutorelease(v28);

          v26 = 0;
        }
        else
        {
          v29 = 0;
        }
        v11 = MEMORY[0x1E0C809B0];
        v14 = v41;
      }
      else
      {
        v29 = 0;
        v26 = 1;
      }

      v34 = v29;
      if ((v26 & 1) != 0)
      {
        objc_msgSend(v7, "options");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationStore fetchRequestFromStoredLocationOptions:](self, "fetchRequestFromStoredLocationOptions:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v42[0] = v11;
        v42[1] = 3221225472;
        v42[2] = __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_53;
        v42[3] = &unk_1E929F360;
        v43 = v8;
        v37 = (void *)MEMORY[0x1D8232094](v42);
        -[RTStore enumerateType:fetchRequest:enumerationBlock:](self, "enumerateType:fetchRequest:enumerationBlock:", objc_opt_class(), v36, v37);

      }
      else
      {
        (*((void (**)(id, _QWORD, id, char *))v8 + 2))(v8, MEMORY[0x1E0C9AA60], v34, &v47);
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0D18598];
      v51 = *MEMORY[0x1E0CB2D50];
      v52 = CFSTR("requires non-nil options.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 7, v32);
      v13 = objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v38;
        v49 = 2112;
        v50 = v13;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      (*((void (**)(id, _QWORD, NSObject *, char *))v8 + 2))(v8, MEMORY[0x1E0C9AA60], v13, &v47);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }

}

void __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_2;
  v4[3] = &unk_1E9297628;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_flushCachedLocationsWithHandler:", v4);

}

void __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_53(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3 || !objc_msgSend(v7, "count"))
    *a4 = 1;

}

- (void)_removeLocationsPredating:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    v8 = a4;
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("timestamp"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray filterUsingPredicate:](self->_locations, "filterUsingPredicate:", v9);
    v17 = CFSTR("timestamp");
    v16 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTStore purgePredating:predicateMappings:purgeLimit:handler:](self, "purgePredating:predicateMappings:purgeLimit:handler:", v6, v11, 43200, v8);
  }
  else
  {
    v12 = (void (**)(id, void *))a4;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTLocationStore _removeLocationsPredating:handler:]";
      v23 = 1024;
      v24 = 538;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("requires a valid date.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);
  }

}

- (void)removeLocationsPredating:(id)a3 handler:(id)a4
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
  block[2] = __52__RTLocationStore_removeLocationsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __52__RTLocationStore_removeLocationsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLocationsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchMetricsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  SEL v23;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(v7, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke;
      v20[3] = &unk_1E9297A08;
      v21 = v7;
      v23 = a2;
      v11 = v8;
      v22 = v11;
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_72;
      v17[3] = &unk_1E929F310;
      v17[4] = self;
      v18 = (id)MEMORY[0x1D8232094](v20);
      v19 = v11;
      v12 = v18;
      -[RTLocationStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", v17);

      v13 = v21;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0D18598];
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("requires valid dateInterval.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  NSObject *v53;
  NSObject *v54;
  double v55;
  double v56;
  const char *v57;
  double v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  char *v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  char *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *context;
  id v76;
  id v77;
  void *v78;
  id obja;
  id obj;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  id v101;
  _BYTE v102[128];
  _QWORD v103[3];
  _QWORD v104[4];

  v104[1] = *MEMORY[0x1E0C80C00];
  v77 = a2;
  v3 = (void *)objc_opt_new();
  v81 = (void *)objc_opt_new();
  +[RTCLLocationMO fetchRequest](RTCLLocationMO, "fetchRequest");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:");
  v104[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setSortDescriptors:", v5);

  v78 = (void *)MEMORY[0x1E0CB3528];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a1;
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "startDate");
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%@ <= %K"), obja, CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v8;
  v9 = (void *)MEMORY[0x1E0CB3880];
  v82 = v7;
  objc_msgSend(*(id *)(v7 + 32), "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timestamp"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v12;
  v13 = (void *)MEMORY[0x1E0CB3880];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(v7 + 32), "uncertaintyThreshold");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("horizontalAccuracy"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v74;
  objc_msgSend(v74, "setPredicate:", v18);

  objc_msgSend(v74, "setIncludesPendingChanges:", 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("latitude"), CFSTR("longitude"), CFSTR("timestamp"), 0);
  if (objc_msgSend(*(id *)(v82 + 32), "includeFixMetrics"))
  {
    objc_msgSend(v20, "addObject:", CFSTR("type"));
    objc_msgSend(v20, "addObject:", CFSTR("horizontalAccuracy"));
  }
  if (objc_msgSend(*(id *)(v82 + 32), "includeSignalEnvironment"))
    objc_msgSend(v20, "addObject:", CFSTR("signalEnvironmentType"));
  v73 = v20;
  objc_msgSend(v74, "setPropertiesToFetch:", v20);
  objc_msgSend(v74, "setResultType:", 2);
  objc_msgSend(v74, "setFetchLimit:", 3600);
  v21 = objc_msgSend(v74, "setFetchOffset:", 0);
  v22 = 0;
  v23 = 0;
  obj = 0;
  v24 = 0;
  v25 = 1.79769313e308;
  v26 = -1.79769313e308;
  v27 = -1.79769313e308;
  v28 = 1.79769313e308;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8](v21);
    v91 = 0;
    objc_msgSend(v77, "executeFetchRequest:error:", v19, &v91);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v91;

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v29;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
    if (v30)
    {
      v31 = v30;
      v32 = 0;
      v84 = *(_QWORD *)v88;
      do
      {
        v33 = 0;
        do
        {
          v34 = v24;
          v35 = v22;
          if (*(_QWORD *)v88 != v84)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v33);
          if (!((objc_msgSend(v3, "count") != 0) | v32 & 1))
          {
            if (objc_msgSend(*(id *)(v82 + 32), "includeFixMetrics"))
            {
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("type"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setFirstFixType:", objc_msgSend(v37, "unsignedIntValue"));

              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              objc_msgSend(v3, "setFirstFixHorizontalUncertainty:");

              _rt_log_facility_get_os_log(RTLogFacilityLocation);
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                v40 = objc_msgSend(v3, "firstFixType");
                objc_msgSend(v3, "firstFixHorizontalUncertainty");
                *(_DWORD *)buf = 134218240;
                v93 = (const char *)v40;
                v94 = 2048;
                v95 = v41;
                _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "type, %lu, uncertainty %f", buf, 0x16u);
              }

            }
            if (objc_msgSend(*(id *)(v82 + 32), "includeSignalEnvironment"))
            {
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("signalEnvironmentType"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setSignalEnvironment:", objc_msgSend(v42, "unsignedIntValue"));

            }
            v32 = 1;
          }
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("timestamp"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            if (!v34)
              goto LABEL_24;
LABEL_21:
            objc_msgSend(v43, "timeIntervalSinceDate:", v34);
            v45 = v44;
            objc_msgSend(v3, "maxIntervalBetweenLocations");
            if (v45 >= v46)
              v46 = v45;
            objc_msgSend(v3, "setMaxIntervalBetweenLocations:", v46);
            goto LABEL_24;
          }
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v93 = "-[RTLocationStore _fetchMetricsWithOptions:handler:]_block_invoke";
            v94 = 1024;
            LODWORD(v95) = 655;
            _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timestamp (in %s:%d)", buf, 0x12u);
          }

          if (v34)
            goto LABEL_21;
LABEL_24:
          v24 = v43;

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("latitude"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "doubleValue");
          v49 = v48;

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("longitude"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "doubleValue");
          v52 = v51;

          if (v49 == 0.0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v93 = "-[RTLocationStore _fetchMetricsWithOptions:handler:]_block_invoke";
              v94 = 1024;
              LODWORD(v95) = 666;
              _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: latitude (in %s:%d)", buf, 0x12u);
            }

          }
          if (v52 == 0.0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v93 = "-[RTLocationStore _fetchMetricsWithOptions:handler:]_block_invoke";
              v94 = 1024;
              LODWORD(v95) = 667;
              _os_log_error_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: longitude (in %s:%d)", buf, 0x12u);
            }

          }
          if (v49 < v28)
            v28 = v49;
          if (v49 > v27)
            v27 = v49;
          if (v52 < v25)
            v25 = v52;
          if (v52 > v26)
            v26 = v52;
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v49, v52, 0.0);
          if (v35)
          {
            v86 = v23;
            objc_msgSend(v81, "distanceFromLocation:toLocation:error:", v35, v22, &v86);
            v56 = v55;
            v57 = v86;

            objc_msgSend(v3, "distanceTraveled");
            objc_msgSend(v3, "setDistanceTraveled:", v56 + v58);
            if (v57)
            {
              _rt_log_facility_get_os_log(RTLogFacilityLocation);
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v93 = v57;
                _os_log_debug_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
              }

              v23 = (char *)v57;
            }
            else
            {
              v23 = 0;
            }
          }

          ++v33;
        }
        while (v31 != v33);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
      }
      while (v31);
    }

    objc_msgSend(v3, "setCount:", objc_msgSend(v3, "count") + objc_msgSend(obj, "count"));
    v19 = v74;
    objc_msgSend(v74, "setFetchOffset:", objc_msgSend(v3, "count"));
    objc_msgSend(v77, "reset");
    objc_autoreleasePoolPop(context);
    v21 = objc_msgSend(obj, "count");
  }
  while (v21 && !v76);
  if (v28 == 1.79769313e308 || v25 == 1.79769313e308 || v27 == -2.22507386e-308 || v26 == -2.22507386e-308)
  {
    v65 = v23;
  }
  else
  {
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v28, v25, 0.0);
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v27, v26, 0.0);
    v85 = v23;
    objc_msgSend(v81, "distanceFromLocation:toLocation:error:", v61, v62, &v85);
    v64 = v63;
    v65 = v85;

    objc_msgSend(v3, "setSpread:", v64 * 0.5);
    if (v65)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v93 = v65;
        _os_log_debug_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
      }

      v19 = v74;
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v82 + 48));
    v71 = (char *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v19, "fetchOffset");
    *(_DWORD *)buf = 138413314;
    v93 = v71;
    v94 = 2112;
    v95 = v19;
    v96 = 2048;
    v97 = v72;
    v98 = 2112;
    v99 = v3;
    v100 = 2112;
    v101 = v76;
    _os_log_debug_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, metrics, %@, error, %@", buf, 0x34u);

  }
  v68 = *(_QWORD *)(v82 + 40);
  _RTSafeArray();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v68 + 16))(v68, v3, v70);

}

void __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E929B4A8;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_3;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMetricsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __51__RTLocationStore_fetchMetricsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __51__RTLocationStore_fetchMetricsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMetricsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

LABEL_8:
    v21 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    v10 = objc_opt_class();
    if (v10 == objc_opt_class())
    {
      -[RTLocationStore fetchRequestFromStoredLocationOptions:](self, "fetchRequestFromStoredLocationOptions:", v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFetchOffset:", a4);
      goto LABEL_13;
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("error of type, %@, is not supported"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutorelease(v18);
    *a5 = v19;

    goto LABEL_8;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
  }

  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("options"));
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v21;
}

- (id)fetchRequestFromStoredLocationOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
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
  void *v35;
  void *v36;
  void *v37;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  id v63;
  uint8_t buf[16];
  _QWORD v65[4];
  _QWORD v66[3];
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[RTCLLocationMO fetchRequest](RTCLLocationMO, "fetchRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), objc_msgSend(v3, "ascending"));
    v67[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v4;
    objc_msgSend(v4, "setSortDescriptors:", v6);

    objc_msgSend(v3, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    objc_msgSend(v3, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v3, "horizontalAccuracy");
    if (v18 == 0.0)
    {
      v20 = 1.79769313e308;
    }
    else
    {
      objc_msgSend(v3, "horizontalAccuracy");
      v20 = v19;
    }
    if (objc_msgSend(v3, "batchSize"))
    {
      v21 = objc_msgSend(v3, "batchSize");
      v22 = 3600;
      if (v21 < 0xE10)
        v22 = v21;
    }
    else
    {
      v22 = 3600;
    }
    v60 = v22;
    v59 = objc_msgSend(v3, "type");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3528];
    v62 = v12;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ <= %K"), v12, CFSTR("timestamp"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v25;
    v61 = v17;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timestamp"), v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v26;
    v27 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("horizontalAccuracy"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "andPredicateWithSubpredicates:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v23;
    objc_msgSend(v23, "addObject:", v31);
    objc_msgSend(v3, "boundingBoxLocation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      *(_QWORD *)buf = 0;
      objc_msgSend(v3, "boundingBoxLocation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "coordinate");
      objc_msgSend(v3, "boundingBoxLocation");
      v58 = v23;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "coordinate");
      objc_msgSend(v3, "boundingBoxLocation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "horizontalAccuracy");
      RTCommonCalculateBoundingBox();

      v55 = (void *)MEMORY[0x1E0CB3528];
      v37 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v31;
      objc_msgSend(v37, "predicateWithFormat:", CFSTR("%@ <= %K"), v56, CFSTR("longitude"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v38;
      v39 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("longitude"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v41;
      v42 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "predicateWithFormat:", CFSTR("%@ <= %K"), v43, CFSTR("latitude"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = v44;
      v45 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("latitude"), v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v65[3] = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 4);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "andPredicateWithSubpredicates:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v57;
      v32 = v58;

      objc_msgSend(v58, "addObject:", v49);
    }
    if (v59 <= 0xD)
    {
      v50 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("type"), v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "addObject:", v52);
    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v32);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setPredicate:", v53);

    objc_msgSend(v63, "setFetchBatchSize:", 100);
    objc_msgSend(v63, "setFetchLimit:", v60);

    v11 = v62;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }
    v63 = 0;
  }

  return v63;
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (RTTimer)flushTimer
{
  return self->_flushTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_flushTransaction, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end
