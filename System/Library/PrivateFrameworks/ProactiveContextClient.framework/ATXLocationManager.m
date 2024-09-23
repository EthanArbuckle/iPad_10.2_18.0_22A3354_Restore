@implementation ATXLocationManager

- (ATXLocationManager)initWithStateStore:(id)a3 modeGlobals:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ATXLocationManager *v10;

  v6 = a4;
  v7 = a3;
  +[ATXLocationManagerGPSCoreLocation sharedInstance](ATXLocationManagerGPSCoreLocation, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = -[ATXLocationManager initWithGPS:routine:stateStore:now:modeGlobals:](self, "initWithGPS:routine:stateStore:now:modeGlobals:", v8, v9, v7, 0, v6);

  return v10;
}

- (ATXLocationManager)initWithGPS:(id)a3 routine:(id)a4 stateStore:(id)a5 now:(id)a6 modeGlobals:(id)a7
{
  id v14;
  id v15;
  id v16;
  ATXLocationManager *v17;
  ATXLocationManager *v18;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *loiUpdateQueue;
  id v27;
  void *v28;
  uint64_t v29;
  _PASLock *lock;
  _PASLock *v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  ATXLocationManager *v39;
  id v40;
  id location;
  objc_super v42;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v37 = a6;
  v36 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationManager.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("routine"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationManager.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gps"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationManager.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stateStore"));

LABEL_4:
  v42.receiver = self;
  v42.super_class = (Class)ATXLocationManager;
  v17 = -[ATXLocationManager init](&v42, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modeGlobals, a7);
    __asm { FMOV            V0.2D, #3.0 }
    *(_OWORD *)&v18->_predictedNextLOITimeout = _Q0;
    objc_storeStrong((id *)&v18->_gps, a3);
    objc_storeStrong((id *)&v18->_routine, a4);
    objc_storeStrong((id *)&v18->_stateStore, a5);
    objc_storeStrong((id *)&v18->_now, a6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("ATXLocationManager_LOIUpdateQueue", v24);
    loiUpdateQueue = v18->_loiUpdateQueue;
    v18->_loiUpdateQueue = (OS_dispatch_queue *)v25;

    v27 = objc_alloc(MEMORY[0x1E0D815F0]);
    v28 = (void *)objc_opt_new();
    v29 = objc_msgSend(v27, "initWithGuardedData:", v28);
    lock = v18->_lock;
    v18->_lock = (_PASLock *)v29;

    objc_msgSend(v14, "setDelegate:", v18);
    objc_initWeak(&location, v18);
    v31 = v18->_lock;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke;
    v38[3] = &unk_1E942E7B8;
    v39 = v18;
    objc_copyWeak(&v40, &location);
    -[_PASLock runWithLockAcquired:](v31, "runWithLockAcquired:", v38);
    objc_destroyWeak(&v40);

    objc_destroyWeak(&location);
  }

  return v18;
}

void __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke_2;
  v28[3] = &unk_1E942E790;
  objc_copyWeak(&v29, (id *)(a1 + 40));
  objc_msgSend(v4, "loadNowOrCallLater:", v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_storeStrong(v3 + 4, v5);
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "workLOI");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "coordinate");
      v8 = v7;
      objc_msgSend(v5, "workLOI");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "coordinate");
      v10 = v9;
      objc_msgSend(v5, "workLOI");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSince1970");
      v13 = v12;
      objc_msgSend(v5, "homeLOI");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "coordinate");
      v16 = v15;
      objc_msgSend(v5, "homeLOI");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "coordinate");
      v19 = v18;
      objc_msgSend(v5, "homeLOI");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timestamp");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSince1970");
      *(_DWORD *)buf = 134546945;
      v31 = v8;
      v32 = 2053;
      v33 = v10;
      v34 = 2053;
      v35 = v13;
      v36 = 2053;
      v37 = v16;
      v38 = 2053;
      v39 = v19;
      v40 = 2053;
      v41 = v22;
      _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "loaded cache, cached work LOI: %{sensitive}f, %{sensitive}f, %{sensitive}f, cached home LOI: %{sensitive}f, %{sensitive}f, %{sensitive}f", buf, 0x3Eu);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "location");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v3[1];
  v3[1] = (id)v23;

  objc_destroyWeak(&v29);
}

void __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 4);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke_3;
    v7[3] = &unk_1E942E768;
    v8 = v6;
    objc_msgSend(v5, "runWithLockAcquired:", v7);

  }
}

void __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 32), *(id *)(a1 + 32));
}

- (NSDate)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (NSDate *)(id)objc_opt_new();
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (BOOL)locationEnabled
{
  return -[ATXLocationManagerGPS locationEnabled](self->_gps, "locationEnabled");
}

- (BOOL)preciseLocationEnabled
{
  return -[ATXLocationManagerGPS preciseLocationEnabled](self->_gps, "preciseLocationEnabled");
}

- (id)_currentLocationAndNeedsUpdate_RequestPreciseLocation:(BOOL)a3
{
  _PASLock *lock;
  NSObject *v5;
  objc_class *v6;
  id v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[8];
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__12;
  v33 = __Block_byref_object_dispose__12;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__ATXLocationManager__currentLocationAndNeedsUpdate_RequestPreciseLocation___block_invoke;
  v17[3] = &unk_1E942E7E0;
  v18 = a3;
  v17[4] = self;
  v17[5] = &v29;
  v17[6] = &v25;
  v17[7] = &v19;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v17);
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *((unsigned __int8 *)v26 + 24);
    objc_msgSend((id)objc_opt_class(), "debugDescriptionForCLLocation:", v30[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *((unsigned __int8 *)v26 + 24);
    v11 = v20[5];
    *(_DWORD *)buf = 138413315;
    v36 = v7;
    v37 = 1024;
    v38 = v8;
    v39 = 2117;
    v40 = v9;
    v41 = 1024;
    v42 = v10;
    v43 = 2117;
    v44 = v11;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "%@ - currentLocationAndNeedsUpdate:%u returning result: %{sensitive}@ and needsLocationUpdate: %u for reason: %{sensitive}@", buf, 0x2Cu);

  }
  v12 = (void *)MEMORY[0x1E0D81638];
  v13 = v30[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v26 + 24));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tupleWithFirst:second:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __76__ATXLocationManager__currentLocationAndNeedsUpdate_RequestPreciseLocation___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  int v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 64)
    || (objc_msgSend(*(id *)(a1 + 32), "now"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "timeIntervalSinceDate:", v3[2]),
        v7 = v6,
        v8 = (double)(int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentLocationUpdateInterval"),
        v5,
        v7 >= v8))
  {
    if (!v4)
      goto LABEL_12;
    objc_msgSend(v4, "horizontalAccuracy");
    if (v15 <= 0.0)
      goto LABEL_12;
    objc_msgSend(v4, "timestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    v19 = -v18;
    v20 = (double)(int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentLocationUpdateInterval");

    if (v19 >= v20)
    {
LABEL_12:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v27 = *(void **)(v26 + 40);
      v28 = CFSTR("location nil or horizontalAccuracy too large or timestamp too old");
      goto LABEL_13;
    }
    v21 = *(unsigned __int8 *)(a1 + 64);
    objc_msgSend(v4, "horizontalAccuracy");
    if (v21)
    {
      if (v22 > 20.0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v24 = *(void **)(v23 + 40);
        v25 = CFSTR("horizontalAccuracy > kPreciseHorizontalAccuracyThreshold");
LABEL_18:
        *(_QWORD *)(v23 + 40) = v25;

      }
    }
    else if (v22 > 200.0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      v25 = CFSTR("horizontalAccuracy > kHorizontalAccuracyThreshold");
      goto LABEL_18;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_14;
    objc_storeStrong(v3 + 1, v4);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v27 = *(void **)(v26 + 40);
    v28 = CFSTR("location is valid, horizontal accuracy is valid, and last update was recent");
LABEL_13:
    *(_QWORD *)(v26 + 40) = v28;

LABEL_14:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3[1]);
    goto LABEL_15;
  }
  objc_storeStrong(v3 + 1, v4);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3[1]);
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v13 = v3[2];
    objc_msgSend((id)objc_opt_class(), "debugDescriptionForCLLocation:", v3[1]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138413059;
    v30 = v11;
    v31 = 1024;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2117;
    v36 = v14;
    _os_log_impl(&dword_1D2C00000, v9, OS_LOG_TYPE_DEFAULT, "%@ - currentLocationAndNeedsUpdate:%u lastRequestLocationDate %@ was too recent, using cached location: %{sensitive}@", (uint8_t *)&v29, 0x26u);

  }
LABEL_15:

}

- (id)getCurrentLocation
{
  return -[ATXLocationManager getCurrentLocation_RequestPreciseLocation:](self, "getCurrentLocation_RequestPreciseLocation:", 0);
}

- (id)getCurrentPreciseLocation
{
  return -[ATXLocationManager getCurrentLocation_RequestPreciseLocation:](self, "getCurrentLocation_RequestPreciseLocation:", 1);
}

- (id)getCurrentLocation_RequestPreciseLocation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  double v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  _PASLock *lock;
  _QWORD v22[4];
  id v23;
  ATXLocationManager *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if ((-[ATXLocationManagerGPS locationEnabled](self->_gps, "locationEnabled") & 1) != 0)
  {
    -[ATXLocationManager _currentLocationAndNeedsUpdate_RequestPreciseLocation:](self, "_currentLocationAndNeedsUpdate_RequestPreciseLocation:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "first");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "second");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "BOOLValue"))
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("NO");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v3)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v26 = v11;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_1D2C00000, v8, OS_LOG_TYPE_DEFAULT, "%@ getCurrentLocation_RequestPreciseLocation:%@ Updating location", buf, 0x16u);

      }
      v14 = 5.0;
      if (v3)
        v14 = 30.0;
      -[ATXLocationManagerGPS updateLocationWithTimeout:requestPreciseLocation:](self->_gps, "updateLocationWithTimeout:requestPreciseLocation:", v3, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          v9 = CFSTR("YES");
        objc_msgSend((id)objc_opt_class(), "debugDescriptionForCLLocation:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412803;
        v26 = (uint64_t)v18;
        v27 = 2112;
        v28 = v9;
        v29 = 2117;
        v30 = v19;
        _os_log_impl(&dword_1D2C00000, v16, OS_LOG_TYPE_DEFAULT, "%@ getCurrentLocation_RequestPreciseLocation:%@ Updated location: %{sensitive}@", buf, 0x20u);

      }
      lock = self->_lock;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __64__ATXLocationManager_getCurrentLocation_RequestPreciseLocation___block_invoke;
      v22[3] = &unk_1E942E808;
      v6 = v15;
      v23 = v6;
      v24 = self;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v22);

    }
  }
  else
  {
    -[ATXLocationManager clearLocationOfInterest](self, "clearLocationOfInterest");
    v6 = 0;
  }
  return v6;
}

void __64__ATXLocationManager_getCurrentLocation_RequestPreciseLocation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id *v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_storeStrong(v6 + 1, v3);
  objc_msgSend(*(id *)(a1 + 40), "now");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v6[2];
  v6[2] = (id)v4;

}

- (void)getCurrentLocationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  ATXLocationManagerGPS *gps;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if ((-[ATXLocationManagerGPS locationEnabled](self->_gps, "locationEnabled") & 1) != 0)
  {
    -[ATXLocationManager _currentLocationAndNeedsUpdate_RequestPreciseLocation:](self, "_currentLocationAndNeedsUpdate_RequestPreciseLocation:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "second");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[ATXLocationManager getCurrentLocationWithCompletionHandler:].cold.1();

      gps = self->_gps;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke;
      v10[3] = &unk_1E942E830;
      v10[4] = self;
      v11 = v4;
      -[ATXLocationManagerGPS updateLocationWithCompletionHandler:](gps, "updateLocationWithCompletionHandler:", v10);

    }
    else
    {
      (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v6, 0);
    }

  }
  else
  {
    -[ATXLocationManager clearLocationOfInterest](self, "clearLocationOfInterest");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 13, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v5);
  }

}

void __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke_cold_1(a1, (uint64_t)v5, v7);

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke_42;
  v12[3] = &unk_1E942E808;
  v13 = v5;
  v14 = v8;
  v10 = v5;
  objc_msgSend(v9, "runWithLockAcquired:", v12);
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, v6, v11);

}

void __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id *v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_storeStrong(v6 + 1, v3);
  objc_msgSend(*(id *)(a1 + 40), "now");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v6[2];
  v6[2] = (id)v4;

}

- (id)_updateLocationsOfInterestWithCurrentLocation:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  NSObject *v7;
  ATXLocationManagerRoutine *routine;
  double v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  ATXLocationManager *v17;
  NSObject *v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = dispatch_group_create();
  objc_msgSend(v4, "horizontalAccuracy");
  if (v6 <= 200.0)
  {
    dispatch_group_enter(v5);
    routine = self->_routine;
    v9 = (double)(int)-[ATXLocationParameters locationOfInterestSearchRadius](self->_modeGlobals, "locationOfInterestSearchRadius");
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __68__ATXLocationManager__updateLocationsOfInterestWithCurrentLocation___block_invoke;
    v16 = &unk_1E942E858;
    v17 = self;
    v10 = v5;
    v18 = v10;
    -[ATXLocationManagerRoutine fetchClosestLOIWithinDistance:ofLocation:reply:](routine, "fetchClosestLOIWithinDistance:ofLocation:reply:", v4, &v13, v9);
    -[ATXLocationManager _fetchLocationOfInterest:inGroup:](self, "_fetchLocationOfInterest:inGroup:", 0, v10, v13, v14, v15, v16, v17);
    -[ATXLocationManager _fetchLocationOfInterest:inGroup:](self, "_fetchLocationOfInterest:inGroup:", 1, v10);
    -[ATXLocationManager _fetchLocationOfInterest:inGroup:](self, "_fetchLocationOfInterest:inGroup:", 2, v10);
    -[ATXLocationManager _fetchLocationOfInterest:inGroup:](self, "_fetchLocationOfInterest:inGroup:", 3, v10);
    v11 = v18;
    v7 = v10;

  }
  else
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "_updateLocationsOfInterestWithCurrentLocation: Horizontal accuracy for current location is greater than the threshold so won't fetch closest LOI", buf, 2u);
    }
  }

  return v5;
}

void __68__ATXLocationManager__updateLocationsOfInterestWithCurrentLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleRoutineError:forThing:", a3, CFSTR("current"));
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __68__ATXLocationManager__updateLocationsOfInterestWithCurrentLocation___block_invoke_cold_1((uint64_t)v5, v6, v7);

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setCurrentLOI:", v5);
    objc_msgSend(*(id *)(a1 + 32), "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastUpdateDate:", v9);

    objc_msgSend(*(id *)(a1 + 32), "gotState:", v8);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)updateCurrentLocationOfInterest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, v0, v1, "LOI fetch timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)updateCurrentLocationOfInterestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E942E830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ATXLocationManager getCurrentLocationWithCompletionHandler:](self, "getCurrentLocationWithCompletionHandler:", v6);

}

void __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[5];

  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  if (a2 && !v5)
  {
    objc_msgSend(v6, "_updateLocationsOfInterestWithCurrentLocation:", a2);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E942E880;
    v9 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v13 = v9;
    dispatch_group_notify(v7, v8, block);

LABEL_7:
    goto LABEL_8;
  }
  v10 = (void *)v6[4];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E942E768;
  v14[4] = v6;
  objc_msgSend(v10, "runWithLockAcquired:", v14);
  v11 = *(_QWORD *)(a1 + 40);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, NSObject *))(v11 + 16))(v11, v7);
    goto LABEL_7;
  }
  (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
LABEL_8:

}

void __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", v3[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[5];
  v3[5] = v4;

}

uint64_t __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E942E768;
  v5[4] = v2;
  objc_msgSend(v3, "runWithLockAcquired:", v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", v3[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[5];
  v3[5] = v4;

}

- (void)invalidateLocationOfInterestCache
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_13);
}

void __55__ATXLocationManager_invalidateLocationOfInterestCache__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "distantPast");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3[5];
  v3[5] = v4;

}

- (void)fetchLOILocationOfType:(int64_t)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  _PASLock *lock;
  NSObject *v9;
  NSObject *v10;
  ATXLocationManagerRoutine *routine;
  _QWORD v12[5];
  id v13;
  void (**v14)(id, uint64_t, _QWORD);
  int64_t v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  +[ATXLocationManager stringForLOIType:](ATXLocationManager, "stringForLOIType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  if (objc_msgSend(v7, "length"))
  {
    lock = self->_lock;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke;
    v16[3] = &unk_1E942E8C8;
    v16[4] = self;
    v18 = &v19;
    v17 = v7;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v16);

  }
  if (v20[5])
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1D2C00000, v9, OS_LOG_TYPE_DEFAULT, "Using cached %@ LOI", buf, 0xCu);
    }

    v6[2](v6, v20[5], 0);
  }
  else
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1D2C00000, v10, OS_LOG_TYPE_DEFAULT, "Fetching %@ LOI", buf, 0xCu);
    }

    routine = self->_routine;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke_51;
    v12[3] = &unk_1E942E918;
    v12[4] = self;
    v13 = v7;
    v14 = v6;
    v15 = a3;
    -[ATXLocationManagerRoutine fetchLOILocationOfType:reply:](routine, "fetchLOILocationOfType:reply:", a3, v12);

  }
  _Block_object_dispose(&v19, 8);

}

void __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*((_QWORD *)v3 + 5);
  objc_msgSend(*(id *)(a1 + 32), "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = -v7;
    _os_log_impl(&dword_1D2C00000, v8, OS_LOG_TYPE_DEFAULT, "Checking cache with age: %f", (uint8_t *)&v13, 0xCu);
  }

  if (v7 > -900.0)
  {
    objc_msgSend(*((id *)v3 + 4), "locationsOfInterest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", *(_QWORD *)(a1 + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke_51(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[16];
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  if (v6)
  {
    objc_msgSend(v7, "_handleRoutineError:forThing:", v6, a1[5]);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v19 = __Block_byref_object_copy__12;
    v20 = __Block_byref_object_dispose__12;
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[2] = __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke_2;
    v15[3] = &unk_1E942E8F0;
    v8 = (void *)a1[5];
    v9 = *(void **)(a1[4] + 32);
    v15[1] = 3221225472;
    v17 = buf;
    v16 = v8;
    objc_msgSend(v9, "runWithLockAcquired:", v15);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1D2C00000, v10, OS_LOG_TYPE_DEFAULT, "Falling back to cache because Core Routine failed", v14, 2u);
      }

      (*(void (**)(void))(a1[6] + 16))();
      _Block_object_dispose(buf, 8);

      goto LABEL_11;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(v7, "_gotLocation:forLocationOfInterest:", v5, a1[7]);
  }
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = a1[5];
    objc_msgSend((id)objc_opt_class(), "debugDescriptionForCLLocation:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412547;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2117;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1D2C00000, v11, OS_LOG_TYPE_INFO, "%@ LOI: %{sensitive}@", buf, 0x16u);

  }
  (*(void (**)(void))(a1[6] + 16))();
LABEL_11:

}

void __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a2 + 32), "locationsOfInterest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_fetchLocationOfInterest:(int64_t)a3 inGroup:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;

  v6 = a4;
  dispatch_group_enter(v6);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ATXLocationManager__fetchLocationOfInterest_inGroup___block_invoke;
  v8[3] = &unk_1E942E940;
  v9 = v6;
  v7 = v6;
  -[ATXLocationManager fetchLOILocationOfType:reply:](self, "fetchLOILocationOfType:reply:", a3, v8);

}

void __55__ATXLocationManager__fetchLocationOfInterest_inGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_gotLocation:(id)a3 forLocationOfInterest:(int64_t)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  ATXLocationManager *v11;
  int64_t v12;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ATXLocationManager__gotLocation_forLocationOfInterest___block_invoke;
  v9[3] = &unk_1E942E968;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

uint64_t __57__ATXLocationManager__gotLocation_forLocationOfInterest___block_invoke(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)a2[4];
  v5 = a2;
  objc_msgSend(v4, "locationsOfInterest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  +[ATXLocationManager stringForLOIType:](ATXLocationManager, "stringForLOIType:", a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, v8);

  v9 = *(void **)(a1[5] + 24);
  v10 = a2[4];

  return objc_msgSend(v9, "write:", v10);
}

- (void)gotState:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXLocationManager *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__ATXLocationManager_gotState___block_invoke;
  v7[3] = &unk_1E942E808;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __31__ATXLocationManager_gotState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id *v10;

  v10 = a2;
  v3 = v10[4];
  if (v3)
  {
    +[ATXLocationManagerState merge:with:](ATXLocationManagerState, "merge:with:", v3, *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(id *)(a1 + 32);
  }
  v5 = v10[4];
  v10[4] = v4;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = (double)-(int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "previousLOIExpirationTime");
  objc_msgSend(*(id *)(a1 + 40), "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10[4], "expirePreviousLOIBefore:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "write:", v10[4]);

}

- (void)_handleRoutineError:(id)a3 forThing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  _PASLock *lock;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  ATXLocationManager *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D18598]);

  if (v9)
  {
    lock = self->_lock;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__ATXLocationManager__handleRoutineError_forThing___block_invoke;
    v12[3] = &unk_1E942E990;
    v13 = v6;
    v14 = v7;
    v15 = self;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);

  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXLocationManager _handleRoutineError:forThing:].cold.1((uint64_t)v7, (uint64_t)v6, v11);

  }
}

void __51__ATXLocationManager__handleRoutineError_forThing___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "code");
  if (v4 > 7)
    goto LABEL_10;
  if (((1 << v4) & 0x98) != 0)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_3();

    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(a1 + 48), "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 10.0;
LABEL_13:
    objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v7, v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v3[5];
    v3[5] = v12;

    goto LABEL_14;
  }
  if (((1 << v4) & 6) == 0)
  {
LABEL_10:
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_1();

    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(a1 + 48), "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 60.0;
    goto LABEL_13;
  }
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_2();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v3[5];
  v3[5] = v10;
LABEL_14:

}

- (void)updateCurrentLocationOfInterestIfTimeElapsed
{
  NSObject *loiUpdateQueue;
  _QWORD block[5];

  loiUpdateQueue = self->_loiUpdateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke;
  block[3] = &unk_1E942E9B8;
  block[4] = self;
  dispatch_sync(loiUpdateQueue, block);
}

void __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke_2;
  v11[3] = &unk_1E942E8F0;
  v11[4] = v2;
  v11[5] = &v12;
  objc_msgSend(v3, "runWithLockAcquired:", v11);
  v5 = v13[3];
  if (v5 > (double)(int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "locationOfInterestUpdateInterval"))
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *((_QWORD *)v13 + 3);
      *(_DWORD *)buf = 134217984;
      v17 = v7;
      _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to update location of interest since update age is %lf", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "updateCurrentLocationOfInterest");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke_52;
    v10[3] = &unk_1E942E768;
    v10[4] = v8;
    objc_msgSend(v9, "runWithLockAcquired:", v10);
  }
  _Block_object_dispose(&v12, 8);
}

void __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  id v5;

  v3 = *(void **)(a2 + 40);
  objc_msgSend(*(id *)(a1 + 32), "now");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -v4;

}

void __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke_52(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", v3[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[5];
  v3[5] = v4;

}

- (void)_updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  _PASLock *lock;
  double v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__ATXLocationManager__updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E942E8F0;
  v9[4] = self;
  v9[5] = &v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v6 = v11[3];
  if (v6 <= (double)(int)-[ATXLocationParameters locationOfInterestUpdateInterval](self->_modeGlobals, "locationOfInterestUpdateInterval"))
  {
    v4[2](v4, 0);
  }
  else
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *((_QWORD *)v11 + 3);
      *(_DWORD *)buf = 134217984;
      v15 = v8;
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to update location of interest since update age is %lf", buf, 0xCu);
    }

    -[ATXLocationManager updateCurrentLocationOfInterestWithCompletionHandler:](self, "updateCurrentLocationOfInterestWithCompletionHandler:", v4);
  }
  _Block_object_dispose(&v10, 8);

}

void __89__ATXLocationManager__updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  id v5;

  v3 = *(void **)(a2 + 40);
  objc_msgSend(*(id *)(a1 + 32), "now");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -v4;

}

- (id)cachedLocationOfInterestAtCurrentLocation
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__ATXLocationManager_cachedLocationOfInterestAtCurrentLocation__block_invoke;
  v5[3] = &unk_1E942E9E0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __63__ATXLocationManager_cachedLocationOfInterestAtCurrentLocation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 32), "currentLOI");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)locationOfInterestAtCurrentLocation
{
  -[ATXLocationManager updateCurrentLocationOfInterestIfTimeElapsed](self, "updateCurrentLocationOfInterestIfTimeElapsed");
  return -[ATXLocationManager cachedLocationOfInterestAtCurrentLocation](self, "cachedLocationOfInterestAtCurrentLocation");
}

- (void)locationOfInterestAtCurrentLocationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__ATXLocationManager_locationOfInterestAtCurrentLocationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E942EA08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ATXLocationManager _updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler:](self, "_updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler:", v6);

}

void __79__ATXLocationManager_locationOfInterestAtCurrentLocationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3032000000;
    v6[3] = __Block_byref_object_copy__12;
    v6[4] = __Block_byref_object_dispose__12;
    v7 = 0;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __79__ATXLocationManager_locationOfInterestAtCurrentLocationWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E942E9E0;
    v5[4] = v6;
    objc_msgSend(v4, "runWithLockAcquired:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _Block_object_dispose(v6, 8);

  }
}

void __79__ATXLocationManager_locationOfInterestAtCurrentLocationWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 32), "currentLOI");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)previousLOIAndCurrentLOI
{
  _PASLock *lock;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[ATXLocationManager updateCurrentLocationOfInterestIfTimeElapsed](self, "updateCurrentLocationOfInterestIfTimeElapsed");
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__ATXLocationManager_previousLOIAndCurrentLOI__block_invoke;
  v6[3] = &unk_1E942EA30;
  v6[4] = self;
  v6[5] = &v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__ATXLocationManager_previousLOIAndCurrentLOI__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v5 = a2;
  v6 = (double)-(int)objc_msgSend(v4, "previousLOIExpirationTime");
  objc_msgSend(*(id *)(a1 + 32), "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateWithTimeInterval:sinceDate:", v7, v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5[4], "expirePreviousLOIBefore:", v15);
  v8 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(v5[4], "previousLOI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5[4];

  objc_msgSend(v10, "currentLOI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tupleWithFirst:second:", v9, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)getPredictedLocationsOfInterestFromLOIName:(id)a3 startDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _PASLock *lock;
  id v10;
  NSObject *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  ATXLocationManagerRoutine *routine;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  _QWORD v26[5];
  NSObject *v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a3;
  v7 = a4;
  -[ATXLocationManager updateCurrentLocationOfInterestIfTimeElapsed](self, "updateCurrentLocationOfInterestIfTimeElapsed");
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__12;
  v42 = __Block_byref_object_dispose__12;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__12;
  v36 = __Block_byref_object_dispose__12;
  v37 = 0;
  v8 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __75__ATXLocationManager_getPredictedLocationsOfInterestFromLOIName_startDate___block_invoke;
  v29[3] = &unk_1E942E8F0;
  v31 = &v38;
  v10 = v6;
  v30 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v29);
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend((id)v39[5], "coordinate");
  v14 = v13;
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v17, v14, v16, 0.0, 5.0, 0.0);
  v19 = (void *)v39[5];
  v39[5] = v18;

  routine = self->_routine;
  v21 = v39[5];
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __75__ATXLocationManager_getPredictedLocationsOfInterestFromLOIName_startDate___block_invoke_2;
  v26[3] = &unk_1E942EA58;
  v26[4] = self;
  v28 = &v32;
  v22 = v11;
  v27 = v22;
  -[ATXLocationManagerRoutine fetchNextPredictedLOIFromLocation:startDate:timeInterval:requireHighConfidence:reply:](routine, "fetchNextPredictedLOIFromLocation:startDate:timeInterval:requireHighConfidence:reply:", v21, v7, 1, v26, 7200.0);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:timeoutSeconds:", v22, self->_predictedNextLOITimeout) == 1)
  {
    __atxlog_handle_dailyroutines();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ATXLocationManager getPredictedLocationsOfInterestFromLOIName:startDate:].cold.1();

    v24 = 0;
  }
  else
  {
    v24 = (id)v33[5];
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __75__ATXLocationManager_getPredictedLocationsOfInterestFromLOIName_startDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a2 + 32), "locationsOfInterest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__ATXLocationManager_getPredictedLocationsOfInterestFromLOIName_startDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleRoutineError:forThing:", a3, CFSTR("predictedLOIs"));
  }
  else
  {
    __atxlog_handle_dailyroutines();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_INFO, "Next Predicted LOIs: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)getPredictedExitTimesFromLOIName:(id)a3 startDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _PASLock *lock;
  id v10;
  NSObject *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  ATXLocationManagerRoutine *routine;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  _QWORD v26[5];
  NSObject *v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a3;
  v7 = a4;
  -[ATXLocationManager updateCurrentLocationOfInterestIfTimeElapsed](self, "updateCurrentLocationOfInterestIfTimeElapsed");
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__12;
  v42 = __Block_byref_object_dispose__12;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__12;
  v36 = __Block_byref_object_dispose__12;
  v37 = 0;
  v8 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __65__ATXLocationManager_getPredictedExitTimesFromLOIName_startDate___block_invoke;
  v29[3] = &unk_1E942E8F0;
  v31 = &v38;
  v10 = v6;
  v30 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v29);
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend((id)v39[5], "coordinate");
  v14 = v13;
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v17, v14, v16, 0.0, 5.0, 0.0);
  v19 = (void *)v39[5];
  v39[5] = v18;

  routine = self->_routine;
  v21 = v39[5];
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __65__ATXLocationManager_getPredictedExitTimesFromLOIName_startDate___block_invoke_2;
  v26[3] = &unk_1E942EA58;
  v26[4] = self;
  v28 = &v32;
  v22 = v11;
  v27 = v22;
  -[ATXLocationManagerRoutine fetchPredictedExitDatesFromLocation:onDate:requireHighConfidence:reply:](routine, "fetchPredictedExitDatesFromLocation:onDate:requireHighConfidence:reply:", v21, v7, 0, v26);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:timeoutSeconds:", v22, self->_predictedExitDateTimeout) == 1)
  {
    __atxlog_handle_dailyroutines();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ATXLocationManager getPredictedExitTimesFromLOIName:startDate:].cold.1();

  }
  v24 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __65__ATXLocationManager_getPredictedExitTimesFromLOIName_startDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a2 + 32), "locationsOfInterest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __65__ATXLocationManager_getPredictedExitTimesFromLOIName_startDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleRoutineError:forThing:", a3, CFSTR("predictedExitTimes"));
  }
  else
  {
    __atxlog_handle_dailyroutines();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_INFO, "Predicted Exit Times: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)predictedLocationsOfInterest
{
  _PASLock *lock;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[ATXLocationManager _updatePredictedLocationsOfInterestIfTimeElapsed](self, "_updatePredictedLocationsOfInterestIfTimeElapsed");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__12;
  v13 = __Block_byref_object_dispose__12;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__ATXLocationManager_predictedLocationsOfInterest__block_invoke;
  v8[3] = &unk_1E942E9E0;
  v8[4] = &v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

void __50__ATXLocationManager_predictedLocationsOfInterest__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 32), "predictedNextLOIs");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)predictedExitTimes
{
  _PASLock *lock;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[ATXLocationManager _updatePredictedExitTimesIfTimeElapsed](self, "_updatePredictedExitTimesIfTimeElapsed");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__12;
  v13 = __Block_byref_object_dispose__12;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__ATXLocationManager_predictedExitTimes__block_invoke;
  v8[3] = &unk_1E942E9E0;
  v8[4] = &v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

void __40__ATXLocationManager_predictedExitTimes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 32), "predictedExitTimes");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_updatePredictedLocationsOfInterestIfTimeElapsed
{
  _PASLock *lock;
  double v4;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__ATXLocationManager__updatePredictedLocationsOfInterestIfTimeElapsed__block_invoke;
  v7[3] = &unk_1E942E8F0;
  v7[4] = self;
  v7[5] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v4 = v9[3];
  if (v4 > (double)(int)-[ATXLocationParameters predictedLocationsOfInterestUpdateInterval](self->_modeGlobals, "predictedLocationsOfInterestUpdateInterval"))
  {
    __atxlog_handle_dailyroutines();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_INFO, "Updating predicted next lois in ATXLocationManager", v6, 2u);
    }

    -[ATXLocationManager updatePredictedLocationsOfInterest](self, "updatePredictedLocationsOfInterest");
  }
  _Block_object_dispose(&v8, 8);
}

void __70__ATXLocationManager__updatePredictedLocationsOfInterestIfTimeElapsed__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  id v5;

  v3 = *(void **)(a2 + 56);
  objc_msgSend(*(id *)(a1 + 32), "now");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -v4;

}

- (void)_updatePredictedExitTimesIfTimeElapsed
{
  _PASLock *lock;
  double v4;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ATXLocationManager__updatePredictedExitTimesIfTimeElapsed__block_invoke;
  v7[3] = &unk_1E942E8F0;
  v7[4] = self;
  v7[5] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v4 = v9[3];
  if (v4 > (double)(int)-[ATXLocationParameters predictedExitTimesUpdateInterval](self->_modeGlobals, "predictedExitTimesUpdateInterval"))
  {
    __atxlog_handle_dailyroutines();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_INFO, "Updating predicted exit times in ATXLocationManager", v6, 2u);
    }

    -[ATXLocationManager updatePredictedExitTimes](self, "updatePredictedExitTimes");
  }
  _Block_object_dispose(&v8, 8);
}

void __60__ATXLocationManager__updatePredictedExitTimesIfTimeElapsed__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  id v5;

  v3 = *(void **)(a2 + 64);
  objc_msgSend(*(id *)(a1 + 32), "now");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -v4;

}

- (void)updatePredictedLocationsOfInterest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, v0, v1, "Next Predicted LOIs no current location", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __56__ATXLocationManager_updatePredictedLocationsOfInterest__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleRoutineError:forThing:", a3, CFSTR("predictedLOIs"));
  }
  else
  {
    __atxlog_handle_dailyroutines();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_INFO, "Next Predicted LOIs: %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = objc_opt_new();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPredictedNextLOIs:", v5);
    objc_msgSend(*(id *)(a1 + 32), "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setLastUpdateDate:", v10);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __56__ATXLocationManager_updatePredictedLocationsOfInterest__block_invoke_60(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", v3[7]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[7];
  v3[7] = v4;

}

- (void)updatePredictedExitTimes
{
  void *v3;
  void *v4;
  double v5;
  NSObject *v6;
  NSObject *v7;
  ATXLocationManagerRoutine *routine;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _PASLock *lock;
  _QWORD v15[5];
  _QWORD v16[5];
  NSObject *v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  -[ATXLocationManager getCurrentLocation](self, "getCurrentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "horizontalAccuracy");
    if (v5 <= 200.0)
    {
      v7 = dispatch_group_create();
      dispatch_group_enter(v7);
      *(_QWORD *)buf = 0;
      v20 = buf;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__12;
      v23 = __Block_byref_object_dispose__12;
      v24 = 0;
      routine = self->_routine;
      -[ATXLocationManager now](self, "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __46__ATXLocationManager_updatePredictedExitTimes__block_invoke;
      v16[3] = &unk_1E942EA58;
      v16[4] = self;
      v18 = buf;
      v6 = v7;
      v17 = v6;
      -[ATXLocationManagerRoutine fetchPredictedExitDatesFromLocation:onDate:requireHighConfidence:reply:](routine, "fetchPredictedExitDatesFromLocation:onDate:requireHighConfidence:reply:", v4, v9, 0, v16);

      if (objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:timeoutSeconds:", v6, self->_predictedExitDateTimeout) == 1)
      {
        __atxlog_handle_dailyroutines();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[ATXLocationManager getPredictedExitTimesFromLOIName:startDate:].cold.1();

        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "setPredictedExitTimes:", MEMORY[0x1E0C9AA60]);
        -[ATXLocationManager now](self, "now");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setLastUpdateDate:", v13);

        -[ATXLocationManager gotState:](self, "gotState:", v12);
      }
      else if (*((_QWORD *)v20 + 5))
      {
        -[ATXLocationManager gotState:](self, "gotState:");
      }
      lock = self->_lock;
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __46__ATXLocationManager_updatePredictedExitTimes__block_invoke_61;
      v15[3] = &unk_1E942E768;
      v15[4] = self;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      __atxlog_handle_dailyroutines();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "updatePredictedExitTimes: Returned because horizontal accuracy is greater than threshold", buf, 2u);
      }
    }

  }
}

void __46__ATXLocationManager_updatePredictedExitTimes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleRoutineError:forThing:", a3, CFSTR("predictedExitTimes"));
  }
  else
  {
    __atxlog_handle_dailyroutines();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_INFO, "Predicted Exit Times: %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = objc_opt_new();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPredictedExitTimes:", v5);
    objc_msgSend(*(id *)(a1 + 32), "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setLastUpdateDate:", v10);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __46__ATXLocationManager_updatePredictedExitTimes__block_invoke_61(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", v3[8]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[8];
  v3[8] = v4;

}

- (double)_distanceOfCurrentLocationFrom:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  -[ATXLocationManager updateCurrentLocationOfInterestIfTimeElapsed](self, "updateCurrentLocationOfInterestIfTimeElapsed");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__12;
  v26 = __Block_byref_object_dispose__12;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12;
  v20 = __Block_byref_object_dispose__12;
  v21 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__ATXLocationManager__distanceOfCurrentLocationFrom___block_invoke;
  v12[3] = &unk_1E942EA80;
  v14 = &v22;
  v15 = &v16;
  v6 = v4;
  v13 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  v7 = (void *)v23[5];
  v8 = -1.0;
  if (v7 && v17[5])
  {
    objc_msgSend(v7, "distanceFromLocation:");
    v8 = v9;
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXLocationManager _distanceOfCurrentLocationFrom:].cold.1((uint64_t)v6, v10, v8);

  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v8;
}

void __53__ATXLocationManager__distanceOfCurrentLocationFrom___block_invoke(_QWORD *a1, id *a2)
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2[1]);
  v4 = a2;
  objc_msgSend(v4[4], "locationsOfInterest");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", a1[4]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (double)distanceFromHomeOfCurrentLocationInMeters
{
  double result;

  -[ATXLocationManager _distanceOfCurrentLocationFrom:](self, "_distanceOfCurrentLocationFrom:", CFSTR("Home"));
  return result;
}

- (double)distanceFromWorkOfCurrentLocationInMeters
{
  double result;

  -[ATXLocationManager _distanceOfCurrentLocationFrom:](self, "_distanceOfCurrentLocationFrom:", CFSTR("Work"));
  return result;
}

- (double)distanceFromSchoolOfCurrentLocationInMeters
{
  double result;

  -[ATXLocationManager _distanceOfCurrentLocationFrom:](self, "_distanceOfCurrentLocationFrom:", CFSTR("School"));
  return result;
}

- (double)distanceFromGymOfCurrentLocationInMeters
{
  double result;

  -[ATXLocationManager _distanceOfCurrentLocationFrom:](self, "_distanceOfCurrentLocationFrom:", CFSTR("Gym"));
  return result;
}

+ (id)debugDescriptionForCLLocation:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3940];
    v4 = a3;
    v5 = [v3 alloc];
    objc_msgSend(v4, "coordinate");
    v7 = v6;
    objc_msgSend(v4, "coordinate");
    v9 = v8;
    objc_msgSend(v4, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<CLLocation: lat: %f, long: %f, timestamp: %f>"), v7, v9, v11);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)stringForLOIType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return &stru_1E942FC10;
  else
    return *off_1E942EAF0[a3];
}

- (BOOL)isAvailableLocationOfInterestType:(int64_t)a3
{
  void *v5;
  _PASLock *lock;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[ATXLocationManager updateCurrentLocationOfInterestIfTimeElapsed](self, "updateCurrentLocationOfInterestIfTimeElapsed");
  +[ATXLocationManager stringForLOIType:](ATXLocationManager, "stringForLOIType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ATXLocationManager_isAvailableLocationOfInterestType___block_invoke;
  v9[3] = &unk_1E942EA30;
  v7 = v5;
  v10 = v7;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  LOBYTE(lock) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)lock;
}

void __56__ATXLocationManager_isAvailableLocationOfInterestType___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a2 + 32), "locationsOfInterest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;
}

- (void)fetchAllLocationsOfInterest:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)MEMORY[0x1E0C99D68];
  -[ATXLocationManager now](self, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateWithTimeInterval:sinceDate:", v8, -4233600.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXLocationManager now](self, "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "initWithStartDate:endDate:", v9, v10);

  -[ATXLocationManagerRoutine fetchLOIVisitedDuring:reply:](self->_routine, "fetchLOIVisitedDuring:reply:", v11, v5);
}

- (void)fetchLocationsOfInterestVisitedDuring:(id)a3 handler:(id)a4
{
  -[ATXLocationManagerRoutine fetchLOIVisitedDuring:reply:](self->_routine, "fetchLOIVisitedDuring:reply:", a3, a4);
}

- (BOOL)isNearKnownTypeLocationOfInterest
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ATXLocationManager locationOfInterestAtCurrentLocation](self, "locationOfInterestAtCurrentLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "type") != -1;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isLocationNearKnownTypeLocationOfInterest:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__ATXLocationManager_isLocationNearKnownTypeLocationOfInterest___block_invoke;
  v17[3] = &unk_1E942E9E0;
  v17[4] = &v18;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)v19[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        if (*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i))
        {
          objc_msgSend(v4, "distanceFromLocation:", (_QWORD)v13);
          if (v10 <= (double)(int)-[ATXLocationParameters locationOfInterestSearchRadius](self->_modeGlobals, "locationOfInterestSearchRadius"))
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __64__ATXLocationManager_isLocationNearKnownTypeLocationOfInterest___block_invoke(uint64_t a1, void *a2)
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
  id *v15;

  v15 = a2;
  objc_msgSend(v15[4], "homeLOI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v15[4], "homeLOI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  objc_msgSend(v15[4], "workLOI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v15[4], "workLOI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_msgSend(v15[4], "schoolLOI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v15[4], "schoolLOI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  objc_msgSend(v15[4], "gymLOI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v15[4], "gymLOI");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (BOOL)isNearFrequentLocationOfInterest
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[ATXLocationManager locationOfInterestAtCurrentLocation](self, "locationOfInterestAtCurrentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "visits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = v6 >= (int)-[ATXLocationParameters frequentLOIMinimumVisits](self->_modeGlobals, "frequentLOIMinimumVisits");

  }
  else
  {
    v7 = 0;
  }
  __atxlog_handle_hero();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    objc_msgSend(v4, "visits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[ATXLocationManager isNearFrequentLocationOfInterest]";
    v14 = 2112;
    v15 = v9;
    v16 = 2048;
    v17 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1D2C00000, v8, OS_LOG_TYPE_DEFAULT, "%s Location of interest is a frequently visited location: %@. Number of visits: %lu", (uint8_t *)&v12, 0x20u);

  }
  return v7;
}

- (BOOL)isNearKnownTypeOrFrequentLocationOfInterest
{
  return -[ATXLocationManager isNearKnownTypeLocationOfInterest](self, "isNearKnownTypeLocationOfInterest")
      || -[ATXLocationManager isNearFrequentLocationOfInterest](self, "isNearFrequentLocationOfInterest");
}

- (void)clearLocationOfInterest
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__ATXLocationManager_clearLocationOfInterest__block_invoke;
  v3[3] = &unk_1E942E768;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

uint64_t __45__ATXLocationManager_clearLocationOfInterest__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "clear");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "clear");
}

- (unint64_t)getCurrentRoutineModeWithCurrentDate:(id)a3
{
  id v4;
  _PASLock *lock;
  uint64_t v6;
  double v7;
  unint64_t v8;
  void *v9;
  _PASLock *v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  lock = self->_lock;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__ATXLocationManager_getCurrentRoutineModeWithCurrentDate___block_invoke;
  v15[3] = &unk_1E942EAA8;
  v15[4] = &v20;
  v15[5] = &v16;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);
  if (v21[5] && (objc_msgSend(v4, "timeIntervalSinceDate:"), v7 < 3600.0))
  {
    v8 = v17[3];
  }
  else
  {
    -[ATXLocationManager getCurrentLocation](self, "getCurrentLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = -[ATXLocationManagerRoutine fetchRoutineModeFromLocation:](self->_routine, "fetchRoutineModeFromLocation:", v9);
    else
      v8 = 0;
    v10 = self->_lock;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __59__ATXLocationManager_getCurrentRoutineModeWithCurrentDate___block_invoke_2;
    v12[3] = &unk_1E942EAD0;
    v13 = v4;
    v14 = v8;
    -[_PASLock runWithLockAcquired:](v10, "runWithLockAcquired:", v12);

  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __59__ATXLocationManager_getCurrentRoutineModeWithCurrentDate___block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2[6]);
  v4 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4[3];

}

void __59__ATXLocationManager_getCurrentRoutineModeWithCurrentDate___block_invoke_2(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 6, *(id *)(a1 + 32));
  v4 = a2;
  v4[3] = *(id *)(a1 + 40);

}

- (BOOL)isTourist
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ATXLocationManager isTouristWithCurrentDate:](self, "isTouristWithCurrentDate:", v3);

  return (char)self;
}

- (BOOL)isTouristWithCurrentDate:(id)a3
{
  return -[ATXLocationManager getCurrentRoutineModeWithCurrentDate:](self, "getCurrentRoutineModeWithCurrentDate:", a3) == 1;
}

- (void)didChangeLocationEnabled:(BOOL)a3
{
  if (a3)
    -[ATXLocationManager updateCurrentLocationOfInterestIfTimeElapsed](self, "updateCurrentLocationOfInterestIfTimeElapsed");
  else
    -[ATXLocationManager clearLocationOfInterest](self, "clearLocationOfInterest");
}

- (void)locationManagerGPS:(id)a3 didEnterRegionWithIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[ATXLocationManager updatePredictedLocationsOfInterest](self, "updatePredictedLocationsOfInterest");
  v6 = objc_alloc(MEMORY[0x1E0CB37C0]);
  v10 = CFSTR("ATXLocationManagerRegionIdentifierUserInfoKey");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:object:userInfo:", CFSTR("ATXLocationManagerDidEnterRegionNotification"), self, v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "postNotification:", v8);
}

- (void)locationManagerGPS:(id)a3 didExitRegionWithIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[ATXLocationManager updatePredictedLocationsOfInterest](self, "updatePredictedLocationsOfInterest");
  v6 = objc_alloc(MEMORY[0x1E0CB37C0]);
  v10 = CFSTR("ATXLocationManagerRegionIdentifierUserInfoKey");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:object:userInfo:", CFSTR("ATXLocationManagerDidExitRegionNotification"), self, v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "postNotification:", v8);
}

- (void)beginMonitoringRegion:(id)a3
{
  -[ATXLocationManagerGPS beginMonitoringRegion:](self->_gps, "beginMonitoringRegion:", a3);
}

- (void)stopMonitoringRegionWithIdentifier:(id)a3
{
  -[ATXLocationManagerGPS stopMonitoringRegionWithIdentifier:](self->_gps, "stopMonitoringRegionWithIdentifier:", a3);
}

- (int64_t)stateForRegion:(id)a3 withTimeout:(double)a4
{
  return -[ATXLocationManagerGPS stateForRegion:withTimeout:](self->_gps, "stateForRegion:withTimeout:", a3, a4);
}

- (double)predictedNextLOITimeout
{
  return self->_predictedNextLOITimeout;
}

- (void)setPredictedNextLOITimeout:(double)a3
{
  self->_predictedNextLOITimeout = a3;
}

- (double)predictedExitDateTimeout
{
  return self->_predictedExitDateTimeout;
}

- (void)setPredictedExitDateTimeout:(double)a3
{
  self->_predictedExitDateTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_modeGlobals, 0);
  objc_storeStrong((id *)&self->_loiUpdateQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_stateStore, 0);
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_gps, 0);
}

- (void)getCurrentLocationWithCompletionHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_1D2C00000, v0, OS_LOG_TYPE_DEBUG, "Updating location", v1, 2u);
  OUTLINED_FUNCTION_1_4();
}

void __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "debugDescriptionForCLLocation:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138739971;
  v7 = v4;
  OUTLINED_FUNCTION_7_0(&dword_1D2C00000, a3, v5, "Updated location: %{sensitive}@", (uint8_t *)&v6);

}

void __68__ATXLocationManager__updateLocationsOfInterestWithCurrentLocation___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_7_0(&dword_1D2C00000, a2, a3, "Current LOI at %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_handleRoutineError:(NSObject *)a3 forThing:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_5(&dword_1D2C00000, a2, a3, "Non-RT error fetching %{public}@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_5(&dword_1D2C00000, v0, v1, "Error fetching %{public}@: %@");
  OUTLINED_FUNCTION_1();
}

void __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_5(&dword_1D2C00000, v0, v1, "Disabling LOI updates due to error fetching %{public}@: %@");
  OUTLINED_FUNCTION_1();
}

void __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_1D2C00000, v0, OS_LOG_TYPE_FAULT, "RT misuse fetching %{public}@: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)getPredictedLocationsOfInterestFromLOIName:startDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, v0, v1, "Next predicted LOIs fetch timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)getPredictedExitTimesFromLOIName:startDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, v0, v1, "Predicted exit times fetch timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)_distanceOfCurrentLocationFrom:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_DEBUG, "Distance to %@ LOI: %f meters", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
