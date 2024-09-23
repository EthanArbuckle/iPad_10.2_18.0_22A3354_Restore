@implementation RTPointOfInterestSampler

- (RTPointOfInterestSampler)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_locationManager_placeInferenceManager_timerManager_wifiManager_);
}

- (RTPointOfInterestSampler)initWithDefaultsManager:(id)a3 locationManager:(id)a4 placeInferenceManager:(id)a5 timerManager:(id)a6 wifiManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RTPointOfInterestSampler *v18;
  RTPointOfInterestSampler *v19;
  uint64_t v20;
  NSMutableDictionary *requesters;
  RTTimer *samplingTimer;
  RTTimer *wifiScanTimer;
  uint64_t v24;
  NSMutableArray *accessPoints;
  RTPointOfInterestSampler *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v31;
  id v32;
  objc_super v33;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    v27 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: defaultsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v27 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_17;
  }
  if (!v15)
  {
    v27 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: placeInferenceManager";
    goto LABEL_17;
  }
  if (!v16)
  {
    v27 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_17;
    }
LABEL_18:

    v26 = 0;
    goto LABEL_19;
  }
  v32 = v17;
  if (v17)
  {
    v33.receiver = self;
    v33.super_class = (Class)RTPointOfInterestSampler;
    v18 = -[RTNotifier init](&v33, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_defaultsManager, a3);
      objc_storeStrong((id *)&v19->_locationManager, a4);
      objc_storeStrong((id *)&v19->_placeInferenceManager, a5);
      objc_storeStrong((id *)&v19->_timerManager, a6);
      objc_storeStrong((id *)&v19->_wifiManager, a7);
      v20 = objc_opt_new();
      requesters = v19->_requesters;
      v19->_requesters = (NSMutableDictionary *)v20;

      v19->_samplingInterval = 1.79769313e308;
      samplingTimer = v19->_samplingTimer;
      v19->_samplingTimer = 0;

      wifiScanTimer = v19->_wifiScanTimer;
      v19->_wifiScanTimer = 0;

      v19->_registeredForWifiScan = 0;
      v24 = objc_opt_new();
      accessPoints = v19->_accessPoints;
      v19->_accessPoints = (NSMutableArray *)v24;

      v19->_running = 0;
      v19->_shouldRun = 0;
    }
    self = v19;
    v26 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager", buf, 2u);
    }

    v26 = 0;
  }
  v27 = v32;
LABEL_19:

  return v26;
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[RTPointOfInterestSampler setRegisteredForWifiScan:](self, "setRegisteredForWifiScan:", 0);
  -[RTPointOfInterestSampler setRunning:](self, "setRunning:", 0);
  -[RTPointOfInterestSampler setShouldRun:](self, "setShouldRun:", 0);
  -[RTPointOfInterestSampler wifiScanTimer](self, "wifiScanTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[RTPointOfInterestSampler setWifiScanTimer:](self, "setWifiScanTimer:", 0);
  -[RTPointOfInterestSampler samplingTimer](self, "samplingTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[RTPointOfInterestSampler setSamplingTimer:](self, "setSamplingTimer:", 0);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (void)startSamplingPointOfInterestFromRequester:(id)a3 samplingInterval:(double)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a3;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__RTPointOfInterestSampler_startSamplingPointOfInterestFromRequester_samplingInterval___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __87__RTPointOfInterestSampler_startSamplingPointOfInterestFromRequester_samplingInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRequester:samplingInterval:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)stopSamplingPointOfInterestFromRequester:(id)a3
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
  v7[2] = __69__RTPointOfInterestSampler_stopSamplingPointOfInterestFromRequester___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __69__RTPointOfInterestSampler_stopSamplingPointOfInterestFromRequester___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeRequester:", *(_QWORD *)(a1 + 40));
}

- (void)_addRequester:(id)a3 samplingInterval:(double)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samplingInterval > 0", (uint8_t *)&v13, 2u);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v7;
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, add requester, %@, sampling interval, %.1f", (uint8_t *)&v13, 0x20u);

    }
    -[RTPointOfInterestSampler requesters](self, "requesters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, v7);

    -[RTPointOfInterestSampler _updateSamplingInterval](self, "_updateSamplingInterval");
  }

}

- (void)_removeRequester:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[RTPointOfInterestSampler requesters](self, "requesters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, remove requester, %@", (uint8_t *)&v13, 0x16u);

    }
    -[RTPointOfInterestSampler requesters](self, "requesters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v5);

    -[RTPointOfInterestSampler _updateSamplingInterval](self, "_updateSamplingInterval");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, requester not found, %@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)_updateSamplingInterval
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[RTPointOfInterestSampler requesters](self, "requesters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = 1.79769313e308;
    v20 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v9 = *(double *)(*((_QWORD *)&v22 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPointOfInterestSampler requesters](self, "requesters");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", *(_QWORD *)&v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v27 = v15;
          v28 = 2112;
          v29 = v9;
          v30 = 2112;
          v31 = v17;
          v32 = 2048;
          v33 = v7;
          _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, requester, %@, interval, %@, interval min, %.1f", buf, 0x2Au);

          v3 = v20;
        }

        -[RTPointOfInterestSampler requesters](self, "requesters");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", *(_QWORD *)&v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        if (v14 < v7)
          v7 = v14;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1.79769313e308;
  }

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v19;
    v28 = 2048;
    v29 = v7;
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, updated interval, %.1f", buf, 0x16u);

  }
  -[RTPointOfInterestSampler setSamplingInterval:](self, "setSamplingInterval:", v7);
}

- (void)setSamplingInterval:(double)a3
{
  NSObject *v3;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 > 0.0)
  {
    if (vabdd_f64(self->_samplingInterval, a3) >= 0.1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v8;
        v11 = 2048;
        v12 = a3;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, updated interval, %.1f", (uint8_t *)&v9, 0x16u);

      }
      self->_samplingInterval = a3;
      if (a3 == 1.79769313e308)
      {
        -[RTPointOfInterestSampler setShouldRun:](self, "setShouldRun:", 0);
      }
      else
      {
        -[RTPointOfInterestSampler setShouldRun:](self, "setShouldRun:", 1);
        if (!-[RTPointOfInterestSampler running](self, "running"))
          -[RTPointOfInterestSampler _startSampling](self, "_startSampling");
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samplingInterval > 0", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)_startSampling
{
  void *v4;
  _QWORD v5[6];

  if (!-[RTPointOfInterestSampler running](self, "running"))
  {
    -[RTPointOfInterestSampler setRunning:](self, "setRunning:", 1);
    -[RTPointOfInterestSampler locationManager](self, "locationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke;
    v5[3] = &unk_1E929ECD8;
    v5[4] = self;
    v5[5] = a2;
    objc_msgSend(v4, "fetchCurrentLocationWithHandler:", v5);

  }
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_2;
  v11[3] = &unk_1E9298238;
  v8 = *(_QWORD *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  _QWORD v32[6];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "running"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v34 = v3;
      v35 = 2112;
      v36 = v4;
      v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, current location, %@, error, %@", buf, 0x20u);

    }
    v6 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v6, "timerManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_10;
      v32[3] = &unk_1E9297BF0;
      v9 = *(_QWORD *)(a1 + 56);
      v32[4] = *(_QWORD *)(a1 + 32);
      v32[5] = v9;
      objc_msgSend(v7, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.poisampler.sampling.timer"), v8, v32);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSamplingTimer:", v10);

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "samplingInterval");
        *(_DWORD *)buf = 138412802;
        v34 = v12;
        v35 = 2112;
        v36 = v13;
        v37 = 2048;
        v38 = v14;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, sampling timer start, timer, %@, interval, %.1f", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "samplingInterval");
      objc_msgSend(v15, "fireAfterDelay:");

      objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resume");
    }
    else
    {
      objc_msgSend(v6, "accessPoints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeAllObjects");

      objc_msgSend(*(id *)(a1 + 32), "setRegisteredForWifiScan:", 1);
      objc_msgSend(*(id *)(a1 + 32), "wifiManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scheduleActiveScan");

      objc_msgSend(*(id *)(a1 + 32), "timerManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_11;
      v29[3] = &unk_1E9297BC8;
      v21 = *(_QWORD *)(a1 + 56);
      v22 = *(void **)(a1 + 40);
      v29[4] = *(_QWORD *)(a1 + 32);
      v31 = v21;
      v29[1] = 3221225472;
      v30 = v22;
      objc_msgSend(v19, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.poisampler.wifiscan.timer"), v20, v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setWifiScanTimer:", v23);

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "wifiScanTimer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v25;
        v35 = 2112;
        v36 = v26;
        v37 = 2048;
        v38 = 0x4014000000000000;
        _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, wifi scan timer start, timer, %@, interval, %.1f", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "wifiScanTimer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fireAfterDelay:", 5.0);

      objc_msgSend(*(id *)(a1 + 32), "wifiScanTimer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "resume");

      v16 = v30;
    }

  }
}

uint64_t __42__RTPointOfInterestSampler__startSampling__block_invoke_10(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "running");
  if ((_DWORD)result)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, sampling timer expiry, timer, %@", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setSamplingTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setRunning:", 0);
    result = objc_msgSend(*(id *)(a1 + 32), "shouldRun");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "_startSampling");
  }
  return result;
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[6];
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "running"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "wifiScanTimer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, wifi scan timer expiry, timer, %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "wifiManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelScan");

    objc_msgSend(*(id *)(a1 + 32), "wifiScanTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setWifiScanTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setRegisteredForWifiScan:", 0);
    v7 = objc_alloc(MEMORY[0x1E0D18428]);
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFidelityPolicy:locations:accessPoints:clientIdentifier:", 32, v8, v9, CFSTR("com.apple.CoreRoutine.poisampler"));

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, run placeInference with options, %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "placeInferenceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_14;
    v15[3] = &unk_1E9299970;
    v14 = *(_QWORD *)(a1 + 48);
    v15[4] = *(_QWORD *)(a1 + 32);
    v15[5] = v14;
    objc_msgSend(v13, "fetchPlaceInferencesForOptions:handler:", v10, v15);

  }
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_2_15;
  v11[3] = &unk_1E9298238;
  v8 = *(_QWORD *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_2_15(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "running"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(*(id *)(a1 + 40), "count");
      v5 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v21 = v3;
      v22 = 2048;
      v23 = v4;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, placeInference count, %lu, error, %@", buf, 0x20u);

    }
    v6 = *(void **)(a1 + 40);
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_16;
    v19[3] = &__block_descriptor_40_e33_v32__0__RTPlaceInference_8Q16_B24l;
    v19[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
    objc_msgSend(*(id *)(a1 + 32), "timerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __42__RTPointOfInterestSampler__startSampling__block_invoke_18;
    v18[3] = &unk_1E9297BF0;
    v10 = *(_QWORD *)(a1 + 56);
    v18[4] = *(_QWORD *)(a1 + 32);
    v18[5] = v10;
    objc_msgSend(v8, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.poisampler.sampling.timer"), v9, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSamplingTimer:", v11);

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "samplingInterval");
      *(_DWORD *)buf = 138412802;
      v21 = v13;
      v22 = 2112;
      v23 = (uint64_t)v14;
      v24 = 2048;
      v25 = v15;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, sampling timer start, timer, %@, interval, %.1f", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "samplingInterval");
    objc_msgSend(v16, "fireAfterDelay:");

    objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resume");

  }
}

void __42__RTPointOfInterestSampler__startSampling__block_invoke_16(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, placeInference, %@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __42__RTPointOfInterestSampler__startSampling__block_invoke_18(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "running");
  if ((_DWORD)result)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, sampling timer expiry, timer, %@", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setSamplingTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setRunning:", 0);
    result = objc_msgSend(*(id *)(a1 + 32), "shouldRun");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "_startSampling");
  }
  return result;
}

- (void)setRegisteredForWifiScan:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _BOOL4 registeredForWifiScan;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_registeredForWifiScan != a3)
  {
    self->_registeredForWifiScan = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (self->_registeredForWifiScan)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, registeredForWifiScan, %@", (uint8_t *)&v12, 0x16u);

    }
    registeredForWifiScan = self->_registeredForWifiScan;
    -[RTPointOfInterestSampler wifiManager](self, "wifiManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
    if (registeredForWifiScan)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:", self, sel_onWiFiScanNotification_, v11);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:fromNotification:", self, v11);
    }

  }
}

- (void)onWiFiScanNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  RTPointOfInterestSampler *v10;
  SEL v11;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__RTPointOfInterestSampler_onWiFiScanNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v10 = self;
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __51__RTPointOfInterestSampler_onWiFiScanNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanResults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v2, "count");
      objc_msgSend(*(id *)(a1 + 40), "accessPoints");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      objc_msgSend(*(id *)(a1 + 40), "accessPoints");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      v11 = 138413058;
      v12 = v4;
      v13 = 2048;
      v14 = v5;
      v15 = 2048;
      v16 = v7;
      v17 = 2048;
      v18 = objc_msgSend(v2, "count") + v9;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, received scan result count, %lu, total count, before, %lu, after, %lu", (uint8_t *)&v11, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "accessPoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v2);

  }
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (NSMutableDictionary)requesters
{
  return self->_requesters;
}

- (void)setRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_requesters, a3);
}

- (RTTimer)samplingTimer
{
  return self->_samplingTimer;
}

- (void)setSamplingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_samplingTimer, a3);
}

- (RTTimer)wifiScanTimer
{
  return self->_wifiScanTimer;
}

- (void)setWifiScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScanTimer, a3);
}

- (BOOL)registeredForWifiScan
{
  return self->_registeredForWifiScan;
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
  objc_storeStrong((id *)&self->_accessPoints, a3);
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)shouldRun
{
  return self->_shouldRun;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_wifiScanTimer, 0);
  objc_storeStrong((id *)&self->_samplingTimer, 0);
  objc_storeStrong((id *)&self->_requesters, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
