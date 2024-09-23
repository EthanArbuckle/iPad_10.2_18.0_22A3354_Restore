@implementation RTWiFiFootprintMonitor

- (RTWiFiFootprintMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithWiFiManager_);
}

- (RTWiFiFootprintMonitor)initWithWiFiManager:(id)a3
{
  id v5;
  RTWiFiFootprintMonitor *v6;
  RTWiFiFootprintMonitor *v7;
  uint64_t v8;
  NSMutableArray *scanResults;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTWiFiFootprintMonitor;
  v6 = -[RTNotifier init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wifiManager, a3);
    v7->_footprintState = -1;
    v8 = objc_opt_new();
    scanResults = v7->_scanResults;
    v7->_scanResults = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)_start
{
  RTWiFiManager *wifiManager;
  void *v4;
  RTWiFiManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  RTPersistentTimer *v13;
  void *v14;
  void *v15;
  RTPersistentTimer *v16;
  _QWORD v17[5];

  wifiManager = self->_wifiManager;
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier addObserver:selector:name:](wifiManager, "addObserver:selector:name:", self, sel_onWiFiManagerNotificationScanResults_, v4);

  v5 = self->_wifiManager;
  +[RTNotification notificationName](RTWiFiManagerNotificationPowerStatusChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier addObserver:selector:name:](v5, "addObserver:selector:name:", self, sel_onWiFiManagerNotificationPowerStatusChanged_, v6);

  +[RTNotification notificationName](RTWiFiFootprintStateNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultsDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@-%@"), v9, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [RTPersistentTimer alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __32__RTWiFiFootprintMonitor__start__block_invoke;
  v17[3] = &unk_1E92977B8;
  v17[4] = self;
  v16 = -[RTPersistentTimer initWithFireDate:interval:serviceIdentifier:queue:handler:](v13, "initWithFireDate:interval:serviceIdentifier:queue:handler:", v14, v12, v15, v17, 30.0);
  -[RTWiFiFootprintMonitor setScanTimer:](self, "setScanTimer:", v16);

}

uint64_t __32__RTWiFiFootprintMonitor__start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "scheduleScan");
}

- (void)_stop
{
  void *v3;

  -[RTNotifier removeObserver:](self->_wifiManager, "removeObserver:", self);
  -[RTWiFiManager cancelScan](self->_wifiManager, "cancelScan");
  -[RTWiFiFootprintMonitor scanTimer](self, "scanTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[RTWiFiFootprintMonitor setScanTimer:](self, "setScanTimer:", 0);
  -[RTWiFiFootprintMonitor setFootprintState:](self, "setFootprintState:", -1);
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RTWiFiFootprintMonitor _stop](self, "_stop");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTWiFiFootprintStateNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) == 1)
      -[RTWiFiFootprintMonitor _start](self, "_start");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTWiFiFootprintStateNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
      -[RTWiFiFootprintMonitor _stop](self, "_stop");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)onWiFiManagerNotificationScanResults:(id)a3
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
  v7[2] = __63__RTWiFiFootprintMonitor_onWiFiManagerNotificationScanResults___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __63__RTWiFiFootprintMonitor_onWiFiManagerNotificationScanResults___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scanResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_processScanResults:", v2);

}

- (void)onWiFiManagerNotificationPowerStatusChanged:(id)a3
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
  v7[2] = __70__RTWiFiFootprintMonitor_onWiFiManagerNotificationPowerStatusChanged___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __70__RTWiFiFootprintMonitor_onWiFiManagerNotificationPowerStatusChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePowerStatusChanged:", objc_msgSend(*(id *)(a1 + 40), "powerStatus"));
}

- (void)_handlePowerStatusChanged:(unint64_t)a3
{
  -[RTWiFiFootprintMonitor setFootprintState:](self, "setFootprintState:", -1);
}

- (void)setFootprintState:(int64_t)a3
{
  int64_t footprintState;
  NSObject *v5;
  void *v6;
  void *v7;
  RTWiFiFootprintStateNotification *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  footprintState = self->_footprintState;
  if (footprintState != a3)
  {
    self->_footprintState = a3;
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      +[RTWiFiFootprintMonitor footprintStateToString:](RTWiFiFootprintMonitor, "footprintStateToString:", footprintState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWiFiFootprintMonitor footprintStateToString:](RTWiFiFootprintMonitor, "footprintStateToString:", self->_footprintState);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "footprint state changed from, %@, to, %@.", (uint8_t *)&v9, 0x16u);

    }
    v8 = -[RTWiFiFootprintStateNotification initWithFootprintState:]([RTWiFiFootprintStateNotification alloc], "initWithFootprintState:", self->_footprintState);
    -[RTNotifier postNotification:](self, "postNotification:", v8);

  }
}

- (void)fetchConstantFootprintStatusForScanResults:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__RTWiFiFootprintMonitor_fetchConstantFootprintStatusForScanResults_withHandler___block_invoke;
    block[3] = &unk_1E9298DC0;
    v11 = v7;
    block[4] = self;
    v10 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __81__RTWiFiFootprintMonitor_fetchConstantFootprintStatusForScanResults_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "_footprintStateForScanResults:", *(_QWORD *)(a1 + 40)));
}

- (int64_t)_footprintStateForScanResults:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  int64_t v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[4];
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  _QWORD v37[4];
  uint8_t buf[4];
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -125.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v6 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke;
  v34[3] = &unk_1E929CB30;
  v7 = v5;
  v35 = v7;
  v36 = v37;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v34);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_2;
  v29[3] = &unk_1E929CB80;
  v31 = v33;
  v32 = v37;
  v8 = v4;
  v30 = v8;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v29);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_4;
  v16[3] = &unk_1E929CBD0;
  v16[4] = &v21;
  v16[5] = &v17;
  v16[6] = v37;
  v16[7] = &v25;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);
  v9 = v22[3];
  v10 = v18[3] + v9;
  if (v10)
  {
    v11 = (double)v9 / (double)v10;
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v39 = v11;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "access point results, overall Duty Cycle, %f", buf, 0xCu);
    }

    v13 = v11 > 0.4;
  }
  else
  {
    v13 = 0;
  }
  v14 = (unint64_t)v26[3] > 1 && v13;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v37, 8);

  return v14;
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__56;
  v14 = __Block_byref_object_dispose__56;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -3153600000.0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_24;
  v9[3] = &unk_1E929CB08;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend((id)v11[5], "laterDate:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToDate:", v11[5]);

  if (v8)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  else
    *a4 = 1;
  _Block_object_dispose(&v10, 8);

}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_24(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v11, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "laterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if (v7)
  {
    objc_msgSend(v11, "date");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;

  v6 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24))
  {
    *a4 = 1;
  }
  else
  {
    v9[1] = 3221225472;
    v9[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_3;
    v9[3] = &unk_1E929CB58;
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v10 = v7;
    v11 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

    v6 = v8;
  }

}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = (void *)a1[4];
  v13 = v3;
  objc_msgSend(v3, "mac");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "rssi"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      v8 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 500);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

        ++v8;
      }
      while (v8 < *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "rssi"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v10, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));

    v11 = (void *)a1[4];
    objc_msgSend(v13, "mac");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v12);

  }
}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_5;
  v15[3] = &unk_1E929CBA8;
  v15[4] = &v28;
  v15[5] = &v24;
  v15[6] = &v20;
  v15[7] = &v16;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
  v7 = v21;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v21[3];
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += v17[3];
  v8 = v7[3];
  if (v8 >= 1)
  {
    v9 = (double)v29[3] / (double)v8;
    v10 = sqrt((double)v25[3] / (double)v8 - v9 * v9);
    v11 = (double)v8 / (double)*(unint64_t *)(*(_QWORD *)(a1[6] + 8) + 24);
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = v21[3];
      v14 = v17[3];
      *(_DWORD *)buf = 138413570;
      v33 = v5;
      v34 = 2048;
      v35 = v9;
      v36 = 2048;
      v37 = v10;
      v38 = 1024;
      v39 = v13;
      v40 = 1024;
      v41 = v14;
      v42 = 2048;
      v43 = v11;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "access point results, mac, %@, exp, %f, std, %f, valid Samples, %d, invalid Samples, %d, settled Feature, %.2f", buf, 0x36u);
    }

    if (v9 >= -75.0 && v11 >= 0.7 && v21[3] >= 3 && v10 < 5.0)
      ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

void __56__RTWiFiFootprintMonitor__footprintStateForScanResults___block_invoke_5(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "integerValue") > 499)
  {
    v4 = a1[7];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += objc_msgSend(v5, "integerValue");
    v3 = objc_msgSend(v5, "integerValue");
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v5, "integerValue") * v3;
    v4 = a1[6];
  }
  ++*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);

}

- (void)_checkFootprint
{
  void *v3;

  -[RTWiFiFootprintMonitor scanResults](self, "scanResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWiFiFootprintMonitor setFootprintState:](self, "setFootprintState:", -[RTWiFiFootprintMonitor _footprintStateForScanResults:](self, "_footprintStateForScanResults:", v3));

  -[RTWiFiFootprintMonitor _pruneScanResults](self, "_pruneScanResults");
}

- (void)_processScanResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityWiFi);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v12 = objc_msgSend(v4, "count");
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "process %lu scan results", buf, 0xCu);
  }

  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__RTWiFiFootprintMonitor__processScanResults___block_invoke;
  v9[3] = &unk_1E929CBF8;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  if (objc_msgSend(v7, "count"))
  {
    -[RTWiFiFootprintMonitor scanResults](self, "scanResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
  -[RTWiFiFootprintMonitor _checkFootprint](self, "_checkFootprint");

}

void __46__RTWiFiFootprintMonitor__processScanResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  double v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityWiFi);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218242;
    v9 = a3 + 1;
    v10 = 2112;
    v11 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%lu, %@", (uint8_t *)&v8, 0x16u);
  }

  if (objc_msgSend(v5, "rssi") >= -84)
  {
    objc_msgSend(v5, "age");
    if (v7 < 5.0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

- (void)_pruneScanResults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -125.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  -[RTWiFiFootprintMonitor scanResults](self, "scanResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__RTWiFiFootprintMonitor__pruneScanResults__block_invoke;
  v9[3] = &unk_1E92973B8;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v8 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  -[RTWiFiFootprintMonitor scanResults](self, "scanResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsInArray:", v6);

}

void __43__RTWiFiFootprintMonitor__pruneScanResults__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v5 = a2;
  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__RTWiFiFootprintMonitor__pruneScanResults__block_invoke_2;
  v6[3] = &unk_1E92973B8;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  v8 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(v5, "removeObjectsInArray:", v4);
  if (!objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __43__RTWiFiFootprintMonitor__pruneScanResults__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earlierDate:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToDate:", v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

+ (id)footprintStateToString:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2)
    return CFSTR("Unknown");
  else
    return off_1E929CC18[a3 + 1];
}

- (int64_t)footprintState
{
  return self->_footprintState;
}

- (RTPersistentTimer)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scanTimer, a3);
}

- (NSMutableArray)scanResults
{
  return self->_scanResults;
}

- (void)setScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_scanResults, a3);
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_scanResults, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
}

@end
