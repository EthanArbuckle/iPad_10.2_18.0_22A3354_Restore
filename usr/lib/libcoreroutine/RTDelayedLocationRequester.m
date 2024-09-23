@implementation RTDelayedLocationRequester

- (RTDelayedLocationRequester)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocationManager_timerManager_maxHorizontalAccuracy_queue_);
}

- (RTDelayedLocationRequester)initWithLocationManager:(id)a3 maxHorizontalAccuracy:(double)a4 queue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  RTDelayedLocationRequester *v11;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = -[RTDelayedLocationRequester initWithLocationManager:timerManager:maxHorizontalAccuracy:queue:](self, "initWithLocationManager:timerManager:maxHorizontalAccuracy:queue:", v9, v10, v8, a4);

  return v11;
}

- (RTDelayedLocationRequester)initWithLocationManager:(id)a3 timerManager:(id)a4 maxHorizontalAccuracy:(double)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  RTDelayedLocationRequester *v15;
  RTDelayedLocationRequester *v16;
  RTDelayedLocationRequester *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: locationManager";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_14;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_13;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: queue";
      goto LABEL_13;
    }
LABEL_14:

    v17 = 0;
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTDelayedLocationRequester;
  v15 = -[RTDelayedLocationRequester init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_locationManager, a3);
    objc_storeStrong((id *)&v16->_timerManager, a4);
    v16->_maxHorizontalAccuracy = a5;
    objc_storeStrong((id *)&v16->_queue, a6);
  }
  self = v16;
  v17 = self;
LABEL_15:

  return v17;
}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  RTTimer *delayTimer;
  RTTimer *activeTimer;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, %@", (uint8_t *)&v12, 0x16u);

  }
  -[RTTimer invalidate](self->_delayTimer, "invalidate");
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  -[RTTimer invalidate](self->_activeTimer, "invalidate");
  activeTimer = self->_activeTimer;
  self->_activeTimer = 0;

  -[RTNotifier removeObserver:](self->_locationManager, "removeObserver:", self);
  if (v5)
    v5[2](v5, 0);

}

- (void)shutdownWithHandler:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__162;
  v20[4] = __Block_byref_object_dispose__162;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v21 = (id)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  -[RTDelayedLocationRequester queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTDelayedLocationRequester_shutdownWithHandler___block_invoke;
  block[3] = &unk_1E92A5468;
  block[4] = self;
  v18 = v5;
  v19 = v20;
  v13 = v5;
  dispatch_async(v12, block);

  _Block_object_dispose(v20, 8);
}

void __50__RTDelayedLocationRequester_shutdownWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__RTDelayedLocationRequester_shutdownWithHandler___block_invoke_2;
  v5[3] = &unk_1E92A5440;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "_shutdownWithHandler:", v5);

}

void __50__RTDelayedLocationRequester_shutdownWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)shutdown
{
  -[RTDelayedLocationRequester shutdownWithHandler:](self, "shutdownWithHandler:", 0);
}

- (void)_onLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "horizontalUncertainty");
    v6 = v5;
    -[RTDelayedLocationRequester maxHorizontalAccuracy](self, "maxHorizontalAccuracy");
    v4 = v11;
    if (v6 <= v7)
    {
      -[RTDelayedLocationRequester delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[RTDelayedLocationRequester delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "onLocation:error:", v11, 0);

      }
      -[RTDelayedLocationRequester _stopUpdatingLocation](self, "_stopUpdatingLocation");
      v4 = v11;
    }
  }

}

- (void)onLocationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTDelayedLocationRequester *v9;

  v4 = a3;
  -[RTDelayedLocationRequester queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__RTDelayedLocationRequester_onLocationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__RTDelayedLocationRequester_onLocationNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(*(id *)(a1 + 32), "locations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v5, "initWithCLLocation:", v7);

    objc_msgSend(*(id *)(a1 + 40), "_onLocation:", v10);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v9;
      v13 = 2080;
      v14 = "-[RTDelayedLocationRequester onLocationNotification:]_block_invoke";
      v15 = 1024;
      v16 = 139;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unhandled notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }
}

- (void)_startUpdatingLocation
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDelayedLocationRequester setActiveStartDate:](self, "setActiveStartDate:", v4);

  -[RTDelayedLocationRequester locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_onLocationNotification_, v6);

  -[RTDelayedLocationRequester activeTimer](self, "activeTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTDelayedLocationRequester activeTimer](self, "activeTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[RTDelayedLocationRequester setActiveTimer:](self, "setActiveTimer:", 0);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, 15.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[RTDelayedLocationRequester timerManager](self, "timerManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDelayedLocationRequester queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __52__RTDelayedLocationRequester__startUpdatingLocation__block_invoke;
  v25 = &unk_1E92A2468;
  v13 = v9;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v11, "timerWithIdentifier:queue:handler:", CFSTR("RTDelayedLocationRequesterActiveTimer"), v12, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDelayedLocationRequester setActiveTimer:](self, "setActiveTimer:", v15, v22, v23, v24, v25);

  -[RTDelayedLocationRequester activeTimer](self, "activeTimer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fireAfterDelay:", 15.0);

  -[RTDelayedLocationRequester activeTimer](self, "activeTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resume");

  _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[RTDelayedLocationRequester fireDate](self, "fireDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v31 = v19;
    v32 = 2112;
    v33 = CFSTR("RTDelayedLocationRequesterActiveTimer");
    v34 = 2112;
    v35 = v21;
    v36 = 2048;
    v37 = 0x402E000000000000;
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, %@, fireDate, %@, interval, %.2f", buf, 0x2Au);

  }
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
}

void __52__RTDelayedLocationRequester__startUpdatingLocation__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v5 = v4;
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v8 = 138412802;
    v9 = CFSTR("RTDelayedLocationRequesterActiveTimer");
    v10 = 2048;
    v11 = v5;
    v12 = 2048;
    v13 = v6;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@ expiry, %.2f since created, %.2f since fireDate", (uint8_t *)&v8, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_onActiveTimerExpiry");

}

- (void)_stopUpdatingLocation
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDelayedLocationRequester activeStartDate](self, "activeStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v13 = 138412546;
    v14 = v5;
    v15 = 2048;
    v16 = v8;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, duration, %.2f", (uint8_t *)&v13, 0x16u);

  }
  -[RTDelayedLocationRequester setActiveStartDate:](self, "setActiveStartDate:", 0);
  -[RTDelayedLocationRequester locationManager](self, "locationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:fromNotification:", self, v10);

  -[RTDelayedLocationRequester activeTimer](self, "activeTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[RTDelayedLocationRequester activeTimer](self, "activeTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[RTDelayedLocationRequester setActiveTimer:](self, "setActiveTimer:", 0);
  }
  -[RTDelayedLocationRequester _updateDelayTimer](self, "_updateDelayTimer");
}

- (void)_updateDelayTimer
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  RTDelayedLocationRequester *v29;
  id v30;
  id location;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[RTDelayedLocationRequester delayTimer](self, "delayTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTDelayedLocationRequester delayTimer](self, "delayTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[RTDelayedLocationRequester setDelayTimer:](self, "setDelayTimer:", 0);
  }
  -[RTDelayedLocationRequester fireDate](self, "fireDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTDelayedLocationRequester fireDate](self, "fireDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isBeforeDate:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDelayedLocationRequester fireDate](self, "fireDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceNow");
      v13 = v12;

      objc_initWeak(&location, self);
      -[RTDelayedLocationRequester timerManager](self, "timerManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDelayedLocationRequester queue](self, "queue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __47__RTDelayedLocationRequester__updateDelayTimer__block_invoke;
      v27 = &unk_1E92A2468;
      v16 = v10;
      v28 = v16;
      v29 = self;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v14, "timerWithIdentifier:queue:handler:", CFSTR("RTDelayedLocationRequesterDelayTimer"), v15, &v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDelayedLocationRequester setDelayTimer:](self, "setDelayTimer:", v17, v24, v25, v26, v27);

      -[RTDelayedLocationRequester delayTimer](self, "delayTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fireAfterDelay:", v13);

      -[RTDelayedLocationRequester delayTimer](self, "delayTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resume");

      _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        -[RTDelayedLocationRequester fireDate](self, "fireDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringFromDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v33 = v21;
        v34 = 2112;
        v35 = CFSTR("RTDelayedLocationRequesterDelayTimer");
        v36 = 2112;
        v37 = v23;
        v38 = 2048;
        v39 = v13;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, fireDate, %@, interval, %.2f", buf, 0x2Au);

      }
      objc_destroyWeak(&v30);

      objc_destroyWeak(&location);
    }
  }
}

void __47__RTDelayedLocationRequester__updateDelayTimer__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDelayedLocationRequester);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "fireDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v6);
    v9 = 138412802;
    v10 = CFSTR("RTDelayedLocationRequesterDelayTimer");
    v11 = 2048;
    v12 = v5;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@ expiry, %.2f since created, %.2f since fireDate", (uint8_t *)&v9, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_onDelayTimerExpiry");

}

- (void)updateFireDate:(id)a3
{
  -[RTDelayedLocationRequester updateFireDate:handler:](self, "updateFireDate:handler:", a3, 0);
}

- (void)_updateFireDate:(id)a3 handler:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[RTDelayedLocationRequester fireDate](self, "fireDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToDate:", v9);

  if ((v8 & 1) == 0)
  {
    -[RTDelayedLocationRequester setFireDate:](self, "setFireDate:", v9);
    -[RTDelayedLocationRequester _updateDelayTimer](self, "_updateDelayTimer");
  }
  if (v6)
    v6[2](v6, 0);

}

- (void)updateFireDate:(id)a3 handler:(id)a4
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
  -[RTDelayedLocationRequester queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTDelayedLocationRequester_updateFireDate_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __53__RTDelayedLocationRequester_updateFireDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFireDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (RTDelayedLocationRequesterDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTTimer)delayTimer
{
  return self->_delayTimer;
}

- (void)setDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayTimer, a3);
}

- (RTTimer)activeTimer
{
  return self->_activeTimer;
}

- (void)setActiveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activeTimer, a3);
}

- (double)maxHorizontalAccuracy
{
  return self->_maxHorizontalAccuracy;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_fireDate, a3);
}

- (NSDate)activeStartDate
{
  return self->_activeStartDate;
}

- (void)setActiveStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_activeStartDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeStartDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeTimer, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
