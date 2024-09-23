@implementation RTHintManager

void __37__RTHintManager__storeHints_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityHint);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218242;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "store %lu hints, error, %@", buf, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__RTHintManager__storeHints_handler___block_invoke_65;
  v8[3] = &unk_1E92A3A78;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__RTHintManager__submitHintFromSource_location_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  int8x16_t v10;
  _QWORD block[4];
  int8x16_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "An error, %@, has occurred while storing hint, %@", buf, 0x16u);
    }

    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__RTHintManager__submitHintFromSource_location_handler___block_invoke_75;
    block[3] = &unk_1E9297540;
    v10 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    dispatch_async(v7, block);

    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);

  }
}

+ (id)vendedClasses
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)vendedClasses_vendedClasses_5;
  if (!vendedClasses_vendedClasses_5)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    v4 = (void *)vendedClasses_vendedClasses_5;
    vendedClasses_vendedClasses_5 = v3;

    v2 = (void *)vendedClasses_vendedClasses_5;
  }
  return v2;
}

uint64_t __38__RTHintManager_onCameraNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onCameraNotification:", *(_QWORD *)(a1 + 40));
}

- (void)onCameraNotification:(id)a3
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
  v7[2] = __38__RTHintManager_onCameraNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__RTHintManager__submitHintFromSource___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitHintFromSource:location:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

void __39__RTHintManager__submitHintFromSource___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD block[5];
  id v11;
  uint64_t v12;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E0D183B0];
    v4 = a2;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithCLLocation:", v4);

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__RTHintManager__submitHintFromSource___block_invoke_2;
  block[3] = &unk_1E9297BC8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v8;
  block[4] = v7;
  v9 = v5;
  dispatch_async(v6, block);

}

- (void)_submitHintFromSource:(int64_t)a3 location:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  void *v21;
  RTHintManager *v22;
  id v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x1E0D183A0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithLocation:source:date:", v8, a3, v11);

    v24 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__RTHintManager__submitHintFromSource_location_handler___block_invoke;
    v20[3] = &unk_1E9299068;
    v21 = v12;
    v22 = self;
    v23 = v9;
    v14 = v12;
    -[RTHintManager _storeHints:handler:](self, "_storeHints:handler:", v13, v20);

    v15 = v21;
LABEL_7:

    goto LABEL_8;
  }
  _rt_log_facility_get_os_log(RTLogFacilityHint);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D183A0], "hintSourceToString:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v17;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "could not get location, dropping hint, source, %@", buf, 0xCu);

  }
  if (v9)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("No location, dropping hint");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_storeHints:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  RTHintStore *hintStore;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  hintStore = self->_hintStore;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__RTHintManager__storeHints_handler___block_invoke;
  v11[3] = &unk_1E9299358;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[RTHintStore storeHints:handler:](hintStore, "storeHints:handler:", v10, v11);

}

- (void)_onCameraNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTCameraManagerNotificationCameraPowerChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (objc_msgSend(v4, "powerState") == 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityHint);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "received camera notification.", (uint8_t *)&v10, 2u);
      }

      -[RTHintManager _submitHintFromSource:](self, "_submitHintFromSource:", 5);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412802;
      v11 = v4;
      v12 = 2080;
      v13 = "-[RTHintManager _onCameraNotification:]";
      v14 = 1024;
      v15 = 533;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (void)_submitHintFromSource:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[RTHintManager locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__RTHintManager__submitHintFromSource___block_invoke;
  v6[3] = &unk_1E929ECD8;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "fetchCurrentLocationWithHandler:", v6);

}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTHintManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager_);
}

- (RTHintManager)initWithBatteryManager:(id)a3 bluetoothManager:(id)a4 cameraManager:(id)a5 hintStore:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 navigationManager:(id)a10 reachabilityManager:(id)a11 walletManager:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  RTHintManager *v27;
  uint64_t v28;
  RTDarwinNotificationHelper *notificationHelper;
  RTDarwinNotificationHelper *v30;
  NSObject *v31;
  RTHintManager *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  _QWORD block[4];
  RTHintManager *v49;
  _QWORD v50[4];
  id v51;
  id location;
  objc_super v53;

  v17 = a3;
  v39 = a4;
  v18 = a4;
  v40 = a5;
  v44 = a5;
  v41 = a6;
  v19 = a6;
  v42 = a7;
  v20 = a7;
  v43 = a8;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v45 = v25;
  v46 = v17;
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: batteryManager", (uint8_t *)&location, 2u);
    }

    v32 = 0;
    v17 = 0;
    v26 = v44;
    goto LABEL_36;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    v26 = v44;
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: bluetoothManager";
LABEL_33:
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&location, 2u);
    goto LABEL_34;
  }
  v26 = v44;
  if (!v44)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: cameraManager";
    goto LABEL_33;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: hintStore";
    goto LABEL_33;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_33;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_33;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: metricManager";
    goto LABEL_33;
  }
  if (!v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    LOWORD(location) = 0;
    v35 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_33;
  }
  if (!v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      v35 = "Invalid parameter not satisfying: reachabilityManager";
      goto LABEL_33;
    }
LABEL_34:

    v32 = 0;
LABEL_35:
    v17 = v46;
    goto LABEL_36;
  }
  if (v25)
  {
    v53.receiver = self;
    v53.super_class = (Class)RTHintManager;
    v27 = -[RTNotifier init](&v53, sel_init);
    if (v27)
    {
      objc_initWeak(&location, v27);
      v28 = objc_opt_new();
      notificationHelper = v27->_notificationHelper;
      v27->_notificationHelper = (RTDarwinNotificationHelper *)v28;

      v30 = v27->_notificationHelper;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke;
      v50[3] = &unk_1E92983E8;
      objc_copyWeak(&v51, &location);
      -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](v30, "addObserverForNotificationName:handler:", CFSTR("HKHealthDaemonActiveWorkoutServersDidUpdateNotification"), v50);
      objc_storeStrong((id *)&v27->_batteryManager, a3);
      objc_storeStrong((id *)&v27->_bluetoothManager, v39);
      objc_storeStrong((id *)&v27->_cameraManager, v40);
      objc_storeStrong((id *)&v27->_hintStore, v41);
      objc_storeStrong((id *)&v27->_learnedLocationManager, v42);
      objc_storeStrong((id *)&v27->_locationManager, v43);
      objc_storeStrong((id *)&v27->_metricManager, a9);
      objc_storeStrong((id *)&v27->_navigationManager, a10);
      objc_storeStrong((id *)&v27->_reachabilityManager, a11);
      objc_storeStrong((id *)&v27->_walletManager, a12);
      -[RTNotifier queue](v27, "queue");
      v31 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke_3;
      block[3] = &unk_1E92977B8;
      v49 = v27;
      dispatch_async(v31, block);

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
    }
    v32 = v27;
    self = v32;
    goto LABEL_35;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    LOWORD(location) = 0;
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: walletManager", (uint8_t *)&location, 2u);
  }

  v32 = 0;
LABEL_36:

  return v32;
}

void __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke_2;
    block[3] = &unk_1E92977B8;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitHintFromSource:", 6);
}

uint64_t __186__RTHintManager_initWithBatteryManager_bluetoothManager_cameraManager_hintStore_learnedLocationManager_locationManager_metricManager_navigationManager_reachabilityManager_walletManager___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForNotifications");
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RTHintManager _unregisterForNotifications](self, "_unregisterForNotifications");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)_registerForNotifications
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[RTHintManager bluetoothManager](self, "bluetoothManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTBluetoothManagerNotificationConnected, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_onBluetoothNotification_, v4);

  -[RTHintManager bluetoothManager](self, "bluetoothManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTBluetoothManagerNotificationDisconnected, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_onBluetoothNotification_, v6);

  -[RTHintManager batteryManager](self, "batteryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTBatteryManagerNotificationChargerConnected, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:", self, sel_onBatteryNotification_, v8);

  -[RTHintManager navigationManager](self, "navigationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:", self, sel_onNavigationNotification_, v10);

  -[RTHintManager reachabilityManager](self, "reachabilityManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:", self, sel_onReachabilityChange_, v12);

  -[RTHintManager cameraManager](self, "cameraManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTCameraManagerNotificationCameraPowerChanged, "notificationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:", self, sel_onCameraNotification_, v14);

  -[RTHintManager walletManager](self, "walletManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWalletManagerNotificationPassUsed, "notificationName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:", self, sel_onWalletNotification_, v16);

  -[RTHintManager walletManager](self, "walletManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWalletManagerNotificationPaymentUsed, "notificationName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:", self, sel_onWalletNotification_, v18);

  -[RTHintManager learnedLocationManager](self, "learnedLocationManager");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:", self, sel_onLearnedLocationNotification_, v19);

}

- (void)_unregisterForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[RTHintManager bluetoothManager](self, "bluetoothManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[RTHintManager batteryManager](self, "batteryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTHintManager navigationManager](self, "navigationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[RTHintManager reachabilityManager](self, "reachabilityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[RTHintManager cameraManager](self, "cameraManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[RTHintManager walletManager](self, "walletManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  -[RTHintManager learnedLocationManager](self, "learnedLocationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  -[RTHintManager notificationHelper](self, "notificationHelper");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserverForNotificationName:", CFSTR("HKHealthDaemonActiveWorkoutServersDidUpdateNotification"));

}

- (void)storeHints:(id)a3 handler:(id)a4
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
  block[2] = __36__RTHintManager_storeHints_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __36__RTHintManager_storeHints_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeHints:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __37__RTHintManager__storeHints_handler___block_invoke_65(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityHint);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 134218498;
    v9 = a3 + 1;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "hint %lu, %@, error, %@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)submitHintFromSource:(int64_t)a3 location:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTHintManager_submitHintFromSource_location___block_invoke;
  block[3] = &unk_1E9297BC8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __47__RTHintManager_submitHintFromSource_location___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitHintFromSource:location:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

- (void)submitHintFromSource:(int64_t)a3 location:(id)a4 handler:(id)a5
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
  v13[2] = __55__RTHintManager_submitHintFromSource_location_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __55__RTHintManager_submitHintFromSource_location_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitHintFromSource:location:handler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __56__RTHintManager__submitHintFromSource_location_handler___block_invoke_75(uint64_t a1)
{
  void *v2;
  RTHintManagerNotificationDidUpdate *v3;
  void *v4;
  RTHintManagerNotificationDidUpdate *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = [RTHintManagerNotificationDidUpdate alloc];
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTHintManagerNotificationDidUpdate initWithHints:](v3, "initWithHints:", v4);
  objc_msgSend(v2, "postNotification:", v5);

}

- (void)storeHintSignificantRegion:(id)a3 hintSource:(int64_t)a4 handler:(id)a5
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
  v13[2] = __63__RTHintManager_storeHintSignificantRegion_hintSource_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __63__RTHintManager_storeHintSignificantRegion_hintSource_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeHintSignificantRegion:hintSource:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_storeHintSignificantRegion:(id)a3 hintSource:(int64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  RTLearnedLocationManager *learnedLocationManager;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;
  int64_t v18;

  v9 = a3;
  v10 = a5;
  learnedLocationManager = self->_learnedLocationManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke;
  v14[3] = &unk_1E9298460;
  v14[4] = self;
  v15 = v9;
  v17 = a2;
  v18 = a4;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  -[RTLearnedLocationManager fetchLocationOfInterestForRegion:handler:](learnedLocationManager, "fetchLocationOfInterestForRegion:handler:", v13, v14);

}

void __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_2;
  block[3] = &unk_1E9298438;
  v8 = *(_QWORD *)(a1 + 56);
  v15 = v5;
  v20 = v8;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v11 = *(_QWORD *)(a1 + 64);
  v18 = v6;
  v21 = v11;
  v19 = *(id *)(a1 + 48);
  v12 = v6;
  v13 = v5;
  dispatch_async(v7, block);

}

void __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v2, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[2] = __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_80;
    v22[3] = &unk_1E92A3AA0;
    v7 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    v22[4] = *(_QWORD *)(a1 + 48);
    v26 = v7;
    v27 = v8;
    v22[1] = 3221225472;
    v23 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v25 = *(id *)(a1 + 64);
    objc_msgSend(v3, "submitHintFromSource:location:handler:", v4, v6, v22);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 138413314;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v13;
      v38 = 2048;
      v39 = v14;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, Could not find location of interest matching significant region, %@, to client, %@, fetch error, %@, hintSource, %lld", buf, 0x34u);

    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("No LocationOfIntrest can be found for region.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(void **)(a1 + 56);
    if (v19)
    {
      v20 = v19;

      v18 = v20;
    }
    v21 = *(_QWORD *)(a1 + 64);
    if (v21)
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v18);
    +[RTSignificantRegionHintInjectionMetrics submitMetricsWithHintSource:region:locationOfInterest:hintSubmitted:matchingError:](RTSignificantRegionHintInjectionMetrics, "submitMetricsWithHintSource:region:locationOfInterest:hintSubmitted:matchingError:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), 0, 0, v18);

  }
}

void __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_2_81;
  block[3] = &unk_1E9297DD0;
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v10 = v3;
  v15 = v5;
  v16 = v6;
  block[1] = 3221225472;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v3;
  dispatch_async(v4, block);

}

uint64_t __64__RTHintManager__storeHintSignificantRegion_hintSource_handler___block_invoke_2_81(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 80);
      v8 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      v20 = 138413314;
      v21 = v5;
      v22 = 2048;
      v23 = v6;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, Unable to store significant region hint for source, %lld, location of interest, %@, matching region, %@, store error, %@", (uint8_t *)&v20, 0x34u);

    }
    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (v4)
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 80);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v20 = 138413570;
      v21 = v12;
      v22 = 2048;
      v23 = v13;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, Storing significant region hint for source, %lld, location of interest, %@, matching region, %@, to client, %@, store error, %@", (uint8_t *)&v20, 0x3Eu);

    }
    v18 = *(_QWORD *)(a1 + 64);
    if (v18)
    {
      v11 = *(void (**)(void))(v18 + 16);
      goto LABEL_10;
    }
  }
  return +[RTSignificantRegionHintInjectionMetrics submitMetricsWithHintSource:region:locationOfInterest:hintSubmitted:matchingError:](RTSignificantRegionHintInjectionMetrics, "submitMetricsWithHintSource:region:locationOfInterest:hintSubmitted:matchingError:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v2 == 0, *(_QWORD *)(a1 + 32));
}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  if ((unint64_t)a3 <= 2 && (v9 = v11) != 0)
  {
    v10 = v9;
    -[RTHintStore purgeHintsPredating:handler:](self->_hintStore, "purgeHintsPredating:handler:", v9, v8);

  }
  else if (v8)
  {
    v8[2](v8, 0);
  }

}

- (void)onBluetoothNotification:(id)a3
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
  v7[2] = __41__RTHintManager_onBluetoothNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __41__RTHintManager_onBluetoothNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBluetoothNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onBluetoothNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTBluetoothManagerNotificationConnected, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

LABEL_4:
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "received bluetooth notification, %@", (uint8_t *)&v13, 0xCu);

    }
    -[RTHintManager _submitHintFromSource:](self, "_submitHintFromSource:", 0);
    goto LABEL_10;
  }
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTBluetoothManagerNotificationDisconnected, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    goto LABEL_4;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = 138412802;
    v14 = v4;
    v15 = 2080;
    v16 = "-[RTHintManager _onBluetoothNotification:]";
    v17 = 1024;
    v18 = 439;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);
  }

LABEL_10:
}

- (void)onBatteryNotification:(id)a3
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
  v7[2] = __39__RTHintManager_onBatteryNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__RTHintManager_onBatteryNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBatteryNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onBatteryNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTBatteryManagerNotificationChargerConnected, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "received battery notification, %@", (uint8_t *)&v11, 0xCu);

    }
    -[RTHintManager _submitHintFromSource:](self, "_submitHintFromSource:", 3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412802;
      v12 = v4;
      v13 = 2080;
      v14 = "-[RTHintManager _onBatteryNotification:]";
      v15 = 1024;
      v16 = 458;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v11, 0x1Cu);
    }

  }
}

- (void)onNavigationNotification:(id)a3
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
  v7[2] = __42__RTHintManager_onNavigationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __42__RTHintManager_onNavigationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onNavigationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onNavigationNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v18;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "received navigation notification, %@", (uint8_t *)&v19, 0xCu);

    }
    v9 = v4;
    v10 = objc_alloc(MEMORY[0x1E0D183B0]);
    -[NSObject destinationLatitude](v9, "destinationLatitude");
    v12 = v11;
    -[NSObject destinationLongitude](v9, "destinationLongitude");
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v10, "initWithLatitude:longitude:horizontalUncertainty:date:", v15, v12, v14, 0.0);

    -[RTHintManager _submitHintFromSource:location:handler:](self, "_submitHintFromSource:location:handler:", 1, v16, 0);
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v19) = 0;
      _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "submitting maps navigation hint", (uint8_t *)&v19, 2u);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412802;
      v20 = v4;
      v21 = 2080;
      v22 = "-[RTHintManager _onNavigationNotification:]";
      v23 = 1024;
      v24 = 487;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v19, 0x1Cu);
    }
  }

}

- (void)onReachabilityChange:(id)a3
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
  v7[2] = __38__RTHintManager_onReachabilityChange___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __38__RTHintManager_onReachabilityChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onReachabilityChange:", *(_QWORD *)(a1 + 40));
}

- (void)_onReachabilityChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v4, "reachability");
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134217984;
      v13 = v8;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "Received reachability change, %ld", (uint8_t *)&v12, 0xCu);
    }

    if ((v8 & 1) != 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityHint);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "submitting reachability hint for reachability change.", (uint8_t *)&v12, 2u);
      }

      -[RTHintManager _submitHintFromSource:](self, "_submitHintFromSource:", 4);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = (uint64_t)v4;
      v14 = 2080;
      v15 = "-[RTHintManager _onReachabilityChange:]";
      v16 = 1024;
      v17 = 511;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }

  }
}

- (void)onWalletNotification:(id)a3
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
  v7[2] = __38__RTHintManager_onWalletNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __38__RTHintManager_onWalletNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWalletNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onWalletNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWalletManagerNotificationPassUsed, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

LABEL_4:
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "received wallet notification.", (uint8_t *)&v12, 2u);
    }

    -[RTHintManager _submitHintFromSource:](self, "_submitHintFromSource:", -1);
    goto LABEL_10;
  }
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWalletManagerNotificationPaymentUsed, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    goto LABEL_4;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412802;
    v13 = v4;
    v14 = 2080;
    v15 = "-[RTHintManager _onWalletNotification:]";
    v16 = 1024;
    v17 = 553;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
  }

LABEL_10:
}

- (void)onLearnedLocationNotification:(id)a3
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
  v7[2] = __47__RTHintManager_onLearnedLocationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __47__RTHintManager_onLearnedLocationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLearnedLocationNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "received learnedLocation notification.", (uint8_t *)&v10, 2u);
    }

    -[RTHintManager hintStore](self, "hintStore");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject regenerateLOIHintsWithHandler:](v9, "regenerateLOIHintsWithHandler:", &__block_literal_global_106);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412802;
      v11 = v4;
      v12 = 2080;
      v13 = "-[RTHintManager _onLearnedLocationNotification:]";
      v14 = 1024;
      v15 = 579;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v10, 0x1Cu);
    }
  }

}

void __48__RTHintManager__onLearnedLocationNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityHint);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_fault_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_FAULT, "Regenerated hints error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = 0;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Regenerated hints error: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  RTHintManager *v14;
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
    v12[2] = __66__RTHintManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
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

void __66__RTHintManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
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
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "enumeratedType");
    objc_msgSend((id)objc_opt_class(), "vendedClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "member:", v3);

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "hintStore");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchEnumerableObjectsWithOptions:offset:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

      return;
    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = CFSTR("the type specified by options is not vended by this manager");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v15;
    v10 = &v14;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("options cannot be nil");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (const __CFString **)v17;
    v10 = &v16;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (void)setBatteryManager:(id)a3
{
  objc_storeStrong((id *)&self->_batteryManager, a3);
}

- (RTBluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (void)setBluetoothManager:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManager, a3);
}

- (RTCameraManager)cameraManager
{
  return self->_cameraManager;
}

- (void)setCameraManager:(id)a3
{
  objc_storeStrong((id *)&self->_cameraManager, a3);
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (RTHintStore)hintStore
{
  return self->_hintStore;
}

- (void)setHintStore:(id)a3
{
  objc_storeStrong((id *)&self->_hintStore, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void)setNavigationManager:(id)a3
{
  objc_storeStrong((id *)&self->_navigationManager, a3);
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (RTReachabilityManager)reachabilityManager
{
  return self->_reachabilityManager;
}

- (void)setReachabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityManager, a3);
}

- (RTWalletManager)walletManager
{
  return self->_walletManager;
}

- (void)setWalletManager:(id)a3
{
  objc_storeStrong((id *)&self->_walletManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletManager, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_hintStore, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_cameraManager, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_storeStrong((id *)&self->_batteryManager, 0);
}

@end
