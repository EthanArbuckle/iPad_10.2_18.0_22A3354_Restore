@implementation RTSensitiveDateClassifier

- (RTSensitiveDateClassifier)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_healthKitManager_learnedLocationStore_locationManager_motionActivityManager_timerManager_vehicleLocationProvider_wifiManager_);
}

- (RTSensitiveDateClassifier)initWithDefaultsManager:(id)a3 healthKitManager:(id)a4 learnedLocationStore:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 timerManager:(id)a8 vehicleLocationProvider:(id)a9 wifiManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  RTSensitiveDateClassifier *v20;
  uint64_t v21;
  NSMutableArray *accessPoints;
  uint64_t v23;
  RTDistanceCalculator *distanceCalculator;
  NSDateInterval *latestWorkoutDateInterval;
  uint64_t v26;
  RTSensitiveDateClassifierMetrics *metrics;
  NSDate *nearSensitiveLocationDetectionDate;
  RTSensitiveDateClassifier *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  RTSensitiveDateClassifier *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  RTSensitiveDateClassifier *v39;
  NSObject *v41;
  id v42;
  dispatch_queue_t v43;
  OS_dispatch_queue *queue;
  id v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  objc_super v53;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v49 = a5;
  v52 = a6;
  v51 = a7;
  v47 = a8;
  v50 = a9;
  v18 = a10;
  v48 = v16;
  if (!v16)
  {
    v32 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v34 = 0;
    v35 = 0;
    v19 = v49;
    goto LABEL_26;
  }
  if (!v17)
  {
    v32 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    v19 = v49;
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: healthKitManager";
LABEL_24:
    _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, v37, buf, 2u);
    goto LABEL_25;
  }
  v19 = v49;
  if (!v49)
  {
    v32 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_24;
  }
  if (!v52)
  {
    v32 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_24;
  }
  if (!v51)
  {
    v32 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_24;
  }
  if (!v50)
  {
    v32 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "Invalid parameter not satisfying: vehicleLocationProvider";
      goto LABEL_24;
    }
LABEL_25:

    v34 = 0;
    v35 = v48;
LABEL_26:
    v39 = self;
    v38 = v47;
    goto LABEL_27;
  }
  v45 = v18;
  if (v18)
  {
    v53.receiver = self;
    v53.super_class = (Class)RTSensitiveDateClassifier;
    v20 = -[RTSensitiveDateClassifier init](&v53, sel_init);
    if (v20)
    {
      v21 = objc_opt_new();
      accessPoints = v20->_accessPoints;
      v20->_accessPoints = (NSMutableArray *)v21;

      v23 = objc_opt_new();
      distanceCalculator = v20->_distanceCalculator;
      v20->_distanceCalculator = (RTDistanceCalculator *)v23;

      objc_storeStrong((id *)&v20->_defaultsManager, a3);
      objc_storeStrong((id *)&v20->_healthKitManager, a4);
      v20->_inWifiDenseArea = 0;
      latestWorkoutDateInterval = v20->_latestWorkoutDateInterval;
      v20->_latestWorkoutDateInterval = 0;

      objc_storeStrong((id *)&v20->_learnedLocationStore, a5);
      objc_storeStrong((id *)&v20->_locationManager, a6);
      v26 = objc_opt_new();
      metrics = v20->_metrics;
      v20->_metrics = (RTSensitiveDateClassifierMetrics *)v26;

      objc_storeStrong((id *)&v20->_motionActivityManager, a7);
      nearSensitiveLocationDetectionDate = v20->_nearSensitiveLocationDetectionDate;
      v20->_nearSensitiveLocationDetectionDate = 0;

      v29 = v20;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v30 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (const char *)-[RTSensitiveDateClassifier UTF8String](objc_retainAutorelease(v29), "UTF8String");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v29);
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v31 = (const char *)objc_msgSend(v42, "UTF8String");

      }
      v43 = dispatch_queue_create(v31, v30);

      queue = v29->_queue;
      v29->_queue = (OS_dispatch_queue *)v43;

      objc_storeStrong((id *)&v29->_timerManager, a8);
      objc_storeStrong((id *)&v29->_vehicleLocationProvider, a9);
      objc_storeStrong((id *)&v29->_wifiManager, a10);
    }
    v39 = v20;
    v34 = v39;
    v32 = v45;
    v35 = v48;
    v19 = v49;
    v38 = v47;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    v38 = v47;
    v35 = v48;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager", buf, 2u);
    }

    v34 = 0;
    v32 = 0;
    v39 = self;
  }
LABEL_27:

  return v34;
}

- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTSensitiveDateClassifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke;
    block[3] = &unk_1E9299330;
    block[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(v8, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierOverrideLookbackWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = a1[4];
  if (v3)
  {
    objc_msgSend(v4, "defaultsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierOverrideLookbackWindow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "stringFromDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTSensitiveDateClassifier fetchLookbackWindowStartDateWithLocation:handler:]_block_invoke";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, user override lookback window with date, %@", buf, 0x16u);

    }
    (*((void (**)(void))a1[6] + 2))();

  }
  else
  {
    objc_msgSend(v4, "_processRecentWorkoutSignal");
    v9 = a1[4];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_11;
    v10[3] = &unk_1E929AB10;
    v10[4] = v9;
    v12 = a1[6];
    v11 = a1[5];
    objc_msgSend(v9, "_fetchInWifiDenseAreaWithHandler:", v10);

  }
}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_11(id *a1, char a2)
{
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2;
  v5[3] = &unk_1E929AAE8;
  v8 = a2;
  v5[4] = a1[4];
  v7 = a1[6];
  v6 = a1[5];
  dispatch_async(v4, v5);

}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 32), "setInWifiDenseArea:", 1);
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processSignal:date:", 5, v3);

  objc_msgSend(*(id *)(a1 + 32), "latestWorkoutDateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[RTSensitiveDateClassifier fetchLookbackWindowStartDateWithLocation:handler:]_block_invoke_2";
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, wifi dense area detected, returning current date", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "submitMetricsWithLookbackWindowDate:", v15);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_3:
    v6 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v19 = 0;
      objc_msgSend(v6, "_getLookbackWindowStartDateWithLocation:error:", v5, &v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v19;
      _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "stringFromDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v21 = "-[RTSensitiveDateClassifier fetchLookbackWindowStartDateWithLocation:handler:]_block_invoke";
        v22 = 2112;
        v23 = v10;
        v24 = 2112;
        v25 = v11;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Fetched lookbackWindowStartDate, %@, currentLocation provided, %@, error, %@", buf, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addCurrentLocation:fromSource:", *(_QWORD *)(a1 + 40), 2);

      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "submitMetricsWithLookbackWindowDate:", v7);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_13;
      v17[3] = &unk_1E929AAC0;
      v17[4] = v6;
      v18 = *(id *)(a1 + 48);
      objc_msgSend(v6, "_fetchCurrentLocationWithHandler:", v17);

    }
  }
}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_13(uint64_t a1, void *a2, void *a3)
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

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2_14;
  v12[3] = &unk_1E9297EB8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2_14(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 32);
  v4 = v11;
  objc_msgSend(v2, "_getLookbackWindowStartDateWithLocation:error:", v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "stringFromDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    v13 = "-[RTSensitiveDateClassifier fetchLookbackWindowStartDateWithLocation:handler:]_block_invoke_2";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, Fetched lookbackWindowStartDate, %@, currentLocation, %@, error, %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitMetricsWithLookbackWindowDate:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)_getLookbackWindowStartDateWithLocation:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  id v8;
  NSArray *sensitiveLocations;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v47 = 0;
    -[RTSensitiveDateClassifier _sensitiveLocationsOfInterestWithError:](self, "_sensitiveLocationsOfInterestWithError:", &v47);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = v47;
    sensitiveLocations = self->_sensitiveLocations;
    self->_sensitiveLocations = v7;

    if (v8)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v8);
      goto LABEL_5;
    }
    -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassSensitiveLocationCheck"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

    }
    else
    {
      v15 = _os_feature_enabled_impl();

      if ((v15 & 1) == 0)
      {
        if (-[RTSensitiveDateClassifier _isNearSensitiveLocation:](self, "_isNearSensitiveLocation:", v6))
        {
LABEL_5:
          objc_msgSend(v6, "timestamp");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

          goto LABEL_26;
        }
LABEL_15:
        -[RTSensitiveDateClassifier _getLastParkedCarDate](self, "_getLastParkedCarDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v6, "timestamp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dateByAddingTimeInterval:", -259200.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timestamp");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v18, "initWithStartDate:endDate:", v20, v21);

        v46 = (void *)v22;
        -[RTSensitiveDateClassifier _getMotionLookbackWindowStartDateWithDateInterval:](self, "_getMotionLookbackWindowStartDateWithDateInterval:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v6, "timestamp");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "initWithStartDate:endDate:", v23, v25);

        v45 = (void *)v26;
        -[RTSensitiveDateClassifier _getLocationLookbackWindowStartDateWithDateInterval:currentLocation:](self, "_getLocationLookbackWindowStartDateWithDateInterval:currentLocation:", v26, v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v23, "stringFromDate");
          v44 = v17;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringFromDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringFromDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateInterval startDate](self->_latestWorkoutDateInterval, "startDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringFromDate");
          v43 = v23;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v49 = "-[RTSensitiveDateClassifier _getLookbackWindowStartDateWithLocation:error:]";
          v50 = 2112;
          v51 = v29;
          v52 = 2112;
          v53 = v30;
          v54 = 2112;
          v55 = v31;
          v56 = 2112;
          v57 = v33;
          _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%s, motionLookbackWindowStart, %@, locationLookbackWindowStart, %@, parkedCarDate, %@, latestWorkoutStartDate, %@", buf, 0x34u);

          v23 = v43;
          v17 = v44;
        }

        objc_msgSend(v27, "earlierDate:", v17);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "isEqualToDate:", v17))
        {
          -[RTSensitiveDateClassifier nearSensitiveLocationDetectionDate](self, "nearSensitiveLocationDetectionDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "earlierDate:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTSensitiveDateClassifier nearSensitiveLocationDetectionDate](self, "nearSensitiveLocationDetectionDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "isEqualToDate:", v37))
          {
            objc_msgSend(v27, "timeIntervalSinceDate:", v17);
            v39 = v38;

            v40 = v17;
            if (v39 <= 600.0)
              goto LABEL_24;
            goto LABEL_23;
          }

        }
LABEL_23:
        v40 = v27;
LABEL_24:
        v41 = v40;
        -[RTSensitiveDateClassifier _compareWorkoutStartDateToLookbackWindowStartDate:motionLookbackWindowStartDate:](self, "_compareWorkoutStartDateToLookbackWindowStartDate:motionLookbackWindowStartDate:", v41, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_25;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v49 = "-[RTSensitiveDateClassifier _getLookbackWindowStartDateWithLocation:error:]";
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%s, bypassing sensitive location check for all location signal, via user defaults or feature flag", buf, 0xCu);
    }

    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *a4;
    *(_DWORD *)buf = 136315394;
    v49 = "-[RTSensitiveDateClassifier _getLookbackWindowStartDateWithLocation:error:]";
    v50 = 2112;
    v51 = v12;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, lookback window passed in nil location, error, %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v10;
}

- (void)_fetchInWifiDenseAreaWithHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id location;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassWifiAccessPointsCheck"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[RTSensitiveDateClassifier _fetchInWifiDenseAreaWithHandler:]";
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, bypassing wifi access points check via user defaults or feature flag", buf, 0xCu);
    }

    v4[2](v4, 1);
    goto LABEL_7;
  }
  v7 = _os_feature_enabled_impl();

  if ((v7 & 1) != 0)
    goto LABEL_4;
  objc_initWeak(&location, self);
  -[RTSensitiveDateClassifier timerManager](self, "timerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSensitiveDateClassifier queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__RTSensitiveDateClassifier__fetchInWifiDenseAreaWithHandler___block_invoke;
  v19[3] = &unk_1E9299C38;
  v19[4] = self;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v9, "timerWithIdentifier:queue:handler:", CFSTR("RTSensitiveDateClassifierWifiScanTimer"), v10, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSensitiveDateClassifier setWifiScanTimer:](self, "setWifiScanTimer:", v11);

  -[RTSensitiveDateClassifier setWifiDenseHandler:](self, "setWifiDenseHandler:", v4);
  -[RTSensitiveDateClassifier accessPoints](self, "accessPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[RTSensitiveDateClassifier wifiManager](self, "wifiManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:", self, sel_onWifiScanResultsNotification_, v14);

  -[RTSensitiveDateClassifier wifiManager](self, "wifiManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scheduleScanWithChannels:", &unk_1E932C178);

  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[RTSensitiveDateClassifier _fetchInWifiDenseAreaWithHandler:]";
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%s, start monitoring for wifi scan results", buf, 0xCu);
  }

  -[RTSensitiveDateClassifier wifiScanTimer](self, "wifiScanTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fireAfterDelay:", 1.0);

  -[RTSensitiveDateClassifier wifiScanTimer](self, "wifiScanTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
LABEL_7:

}

void __62__RTSensitiveDateClassifier__fetchInWifiDenseAreaWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *WeakRetained;
  _BOOL4 v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "wifiDenseHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v5 = 136315138;
      v6 = "-[RTSensitiveDateClassifier _fetchInWifiDenseAreaWithHandler:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, WeakRetained, OS_LOG_TYPE_INFO, "%s, wifi timer expiry: no early exit, proceeding to process wifi access points", (uint8_t *)&v5, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _processWifiScanResults](WeakRetained, "_processWifiScanResults");
  }
  else if (v4)
  {
    v5 = 136315138;
    v6 = "-[RTSensitiveDateClassifier _fetchInWifiDenseAreaWithHandler:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, WeakRetained, OS_LOG_TYPE_INFO, "%s, wifi timer expiry: handler already returned. Exiting now.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_fetchCurrentLocationWithHandler:(id)a3
{
  void (**v3)(id, _QWORD, id);
  dispatch_semaphore_t v4;
  RTLocationRequestOptions *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint8_t buf[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, id))a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__32;
  v50 = __Block_byref_object_dispose__32;
  v51 = 0;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__32;
  v44 = __Block_byref_object_dispose__32;
  v45 = 0;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = objc_claimAutoreleasedReturnValue();
  v5 = -[RTLocationRequestOptions initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:]([RTLocationRequestOptions alloc], "initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:", 1, 1, 100.0, 100.0, 10.0, 1.0, 200.0, 240.0);
  -[RTSensitiveDateClassifier locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __62__RTSensitiveDateClassifier__fetchCurrentLocationWithHandler___block_invoke;
  v36[3] = &unk_1E929AB38;
  v38 = &v46;
  v39 = &v40;
  v7 = v4;
  v37 = v7;
  objc_msgSend(v6, "fetchCurrentLocationWithOptions:handler:", v5, v36);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v52 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v52, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

    v24 = 0;
  }
  else
  {
LABEL_6:
    v23 = 0;
    v24 = 1;
  }

  v25 = v23;
  if ((v24 & 1) == 0)
    objc_storeStrong(v41 + 5, v23);
  objc_msgSend((id)v47[5], "timestamp", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "earlierDate:", v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v47[5], "timestamp");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqualToDate:", v28);

  -[RTSensitiveDateClassifier metrics](self, "metrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29)
    v32 = 3;
  else
    v32 = 4;
  objc_msgSend(v30, "addCurrentLocation:fromSource:", v47[5], v32);

  v3[2](v3, v47[5], v41[5]);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __62__RTSensitiveDateClassifier__fetchCurrentLocationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLastParkedCarDate
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  intptr_t (*v40)(uint64_t, void *);
  void *v41;
  NSObject *v42;
  __int128 *p_buf;
  _BYTE v44[12];
  __int16 v45;
  uint64_t v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassParkedCarEventCheck"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[RTSensitiveDateClassifier _getLastParkedCarDate]";
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, bypassing parked car signal check via user defaults or feature flag, returning distant past date for parked car signal", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  v5 = _os_feature_enabled_impl();

  if ((v5 & 1) != 0)
    goto LABEL_4;
  v9 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__32;
  v50 = __Block_byref_object_dispose__32;
  v51 = 0;
  -[RTSensitiveDateClassifier vehicleLocationProvider](self, "vehicleLocationProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = MEMORY[0x1E0C809B0];
  v39 = 3221225472;
  v40 = __50__RTSensitiveDateClassifier__getLastParkedCarDate__block_invoke;
  v41 = &unk_1E9297010;
  p_buf = &buf;
  v11 = v9;
  v42 = v11;
  objc_msgSend(v10, "fetchLastVehicleEventsWithHandler:", &v38);

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v38, v39, v40, v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14))
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v44 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v44, 2u);
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  v52[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v44 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v52, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

    v28 = 0;
  }
  else
  {
LABEL_13:
    v27 = 0;
    v28 = 1;
  }

  v29 = v27;
  if ((v28 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v44 = 136315138;
      *(_QWORD *)&v44[4] = "-[RTSensitiveDateClassifier _getLastParkedCarDate]";
      _os_log_debug_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_DEBUG, "%s, Vehicle Event fetch timed out", v44, 0xCu);
    }

  }
  v31 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
  if (v31)
  {
    if (v33)
    {
      v34 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v44 = 136315394;
      *(_QWORD *)&v44[4] = "-[RTSensitiveDateClassifier _getLastParkedCarDate]";
      v45 = 2112;
      v46 = v34;
      _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%s, Vehicle Event found, %@", v44, 0x16u);
    }

    -[RTSensitiveDateClassifier metrics](self, "metrics");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "date");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "processSignal:date:", 4, v36);

    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "date");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v33)
    {
      *(_DWORD *)v44 = 136315138;
      *(_QWORD *)&v44[4] = "-[RTSensitiveDateClassifier _getLastParkedCarDate]";
      _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%s, Vehicle Event not found, returning distant past", v44, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v37;

  _Block_object_dispose(&buf, 8);
  return v7;
}

intptr_t __50__RTSensitiveDateClassifier__getLastParkedCarDate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLocationLookbackWindowStartDateWithDateInterval:(id)a3 currentLocation:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  id v27;
  void *i;
  id v29;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[7];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  const char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v44 = a4;
  objc_msgSend(v43, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__32;
  v54 = __Block_byref_object_dispose__32;
  v41 = v6;
  v55 = v41;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v8 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v44, "coordinate");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v44, "altitude");
  v14 = v13;
  objc_msgSend(v44, "verticalAccuracy");
  v16 = v15;
  objc_msgSend(v44, "timestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v8, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v17, v10, v12, v14, 250000.0, v16);

  -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassCurrentLocationCheck"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

  }
  else
  {
    v21 = _os_feature_enabled_impl();

    if ((v21 & 1) == 0)
      goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[RTSensitiveDateClassifier _getLocationLookbackWindowStartDateWithDateInterval:currentLocation:]";
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%s, bypassing current location distance fetch via user defaults or feature flags", buf, 0xCu);
  }

  v18 = 0;
LABEL_7:
  -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager", v41);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassSensitiveLocationCheck"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {

LABEL_10:
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[RTSensitiveDateClassifier _getLocationLookbackWindowStartDateWithDateInterval:currentLocation:]";
      _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%s, bypassing sensitive location check for all location signal, via user defaults or feature flag", buf, 0xCu);
    }

    v27 = 0;
    i = v42;
    goto LABEL_13;
  }
  v25 = _os_feature_enabled_impl();

  if ((v25 & 1) != 0)
    goto LABEL_10;
  v27 = 0;
  for (i = v42; ; i = v27)
  {
    v31 = objc_msgSend(i, "timeIntervalSinceDate:", v7);
    if (v32 <= 0.0 || *((_BYTE *)v47 + 24))
      break;
    v33 = (void *)MEMORY[0x1D8231EA8](v31);
    objc_msgSend(i, "dateByAddingTimeInterval:", -3600.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "laterDate:", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v35, i);
    -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassCurrentLocationCheck"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {

      v18 = 0;
    }
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v36, 3600, v18, 250.0);
    -[RTSensitiveDateClassifier _locationsForOptions:](self, "_locationsForOptions:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __97__RTSensitiveDateClassifier__getLocationLookbackWindowStartDateWithDateInterval_currentLocation___block_invoke;
    v45[3] = &unk_1E929AB60;
    v45[4] = self;
    v45[5] = &v46;
    v45[6] = &v50;
    objc_msgSend(v40, "enumerateObjectsWithOptions:usingBlock:", 2, v45);
    v27 = v35;

    objc_autoreleasePoolPop(v33);
  }
LABEL_13:
  v29 = (id)v51[5];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  return v29;
}

void __97__RTSensitiveDateClassifier__getLocationLookbackWindowStartDateWithDateInterval_currentLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isNearSensitiveLocation:"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v9, "timestamp");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)_getMotionLookbackWindowStartDateWithDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  id v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  __int128 *p_buf;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[5];
  id v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v5;
  -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassMotionCheck"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    v9 = _os_feature_enabled_impl();

    if ((v9 & 1) == 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__32;
      v38 = __Block_byref_object_dispose__32;
      v12 = v23;
      v14 = 0;
      v39 = v12;
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x3032000000;
      v33[3] = __Block_byref_object_copy__32;
      v33[4] = __Block_byref_object_dispose__32;
      v34 = 0;
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      v15 = MEMORY[0x1E0C809B0];
      while (1)
      {
        v16 = objc_msgSend(v12, "timeIntervalSinceDate:", v6);
        if (v17 <= 0.0 || *((_BYTE *)v30 + 24))
          break;
        v18 = (void *)MEMORY[0x1D8231EA8](v16);
        objc_msgSend(v12, "dateByAddingTimeInterval:", -3600.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "laterDate:", v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v20, v12);
        -[RTSensitiveDateClassifier _motionsForDateInterval:](self, "_motionsForDateInterval:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v15;
        v24[1] = 3221225472;
        v24[2] = __79__RTSensitiveDateClassifier__getMotionLookbackWindowStartDateWithDateInterval___block_invoke;
        v24[3] = &unk_1E929AB88;
        v24[4] = self;
        p_buf = &buf;
        v27 = &v29;
        v28 = v33;
        v25 = v6;
        objc_msgSend(v22, "enumerateObjectsWithOptions:usingBlock:", 2, v24);
        v14 = v20;

        objc_autoreleasePoolPop(v18);
        v12 = v14;
      }
      v11 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(v33, 8);

      _Block_object_dispose(&buf, 8);
      goto LABEL_7;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[RTSensitiveDateClassifier _getMotionLookbackWindowStartDateWithDateInterval:]";
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, bypassing motion check via user defaults or feature flag", (uint8_t *)&buf, 0xCu);
  }

  v11 = v6;
  v12 = v23;
LABEL_7:

  return v11;
}

void __79__RTSensitiveDateClassifier__getMotionLookbackWindowStartDateWithDateInterval___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "_sensitiveMotionSignalDetectedForMotion:startDate:endDate:", v7, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  if ((_DWORD)v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315394;
      v21 = "-[RTSensitiveDateClassifier _getMotionLookbackWindowStartDateWithDateInterval:]_block_invoke";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, driving motion detected, driving motion activity start date, %@", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "processSignal:date:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    v14 = objc_msgSend(v7, "type");
    if (v14 != objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "type")
      || (v15 = objc_msgSend(v7, "confidence"),
          v15 != objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "confidence")))
    {
      objc_msgSend(v7, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "laterDate:", *(_QWORD *)(a1 + 40));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }

}

- (void)_processRecentWorkoutSignal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -3600.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTSensitiveDateClassifier healthKitManager](self, "healthKitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v5, "getLatestWorkoutDateIntervalWithStartDate:error:", v4, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSensitiveDateClassifier setLatestWorkoutDateInterval:](self, "setLatestWorkoutDateInterval:", v6);

}

- (BOOL)_isNearSensitiveLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  const char *v9;
  BOOL v10;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSArray *sensitiveLocations;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t, _BYTE *);
  void *v29;
  RTSensitiveDateClassifier *v30;
  NSObject *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint8_t v46[4];
  const char *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassSensitiveLocationCheck"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_7:
      v10 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
    v9 = "%s, bypassing sensitive location check for LOI and signal environment, via user defaults or feature flag";
LABEL_6:
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
    goto LABEL_7;
  }
  v7 = _os_feature_enabled_impl();

  if ((v7 & 1) != 0)
    goto LABEL_4;
  -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassSignalEnvironmentCheck"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, bypassing signal environment check via user defaults or feature flag", buf, 0xCu);
    }

    goto LABEL_15;
  }
  v14 = _os_feature_enabled_impl();

  if ((v14 & 1) != 0)
    goto LABEL_12;
  if (objc_msgSend(v4, "signalEnvironmentType") == 3
    || objc_msgSend(v4, "signalEnvironmentType") == 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%s, sensitive signal environment detected for location, %@", buf, 0x16u);
    }

    -[RTSensitiveDateClassifier metrics](self, "metrics");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject processSignal:date:](v8, "processSignal:date:", 3, v20);

    v10 = 1;
    goto LABEL_8;
  }
LABEL_15:
  -[RTSensitiveDateClassifier defaultsManager](self, "defaultsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("RTDefaultsSensitiveDateClassifierBypassSensitiveLOICheck"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

LABEL_18:
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
    v9 = "%s, bypassing sensitive LOI check via user defaults or feature flag";
    goto LABEL_6;
  }
  v18 = _os_feature_enabled_impl();

  if ((v18 & 1) != 0)
    goto LABEL_18;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v4);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v53 = __Block_byref_object_copy__32;
  v54 = __Block_byref_object_dispose__32;
  v55 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__32;
  v40 = __Block_byref_object_dispose__32;
  v41 = 0;
  sensitiveLocations = self->_sensitiveLocations;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __54__RTSensitiveDateClassifier__isNearSensitiveLocation___block_invoke;
  v29 = &unk_1E929ABB0;
  v30 = self;
  v8 = v21;
  v31 = v8;
  v33 = &v36;
  v34 = &v42;
  v35 = buf;
  v23 = v4;
  v32 = v23;
  -[NSArray enumerateObjectsUsingBlock:](sensitiveLocations, "enumerateObjectsUsingBlock:", &v26);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    -[RTSensitiveDateClassifier setNearSensitiveLocationDetectionDate:](self, "setNearSensitiveLocationDetectionDate:", v26, v27, v28, v29, v30, v31);
  if (v37[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = v37[5];
      *(_DWORD *)v46 = 136315650;
      v47 = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
      v48 = 2112;
      v49 = v25;
      v50 = 2112;
      v51 = v23;
      _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "%s, error for near sensitive location check: error, %@, location, %@", v46, 0x20u);
    }

    v10 = 0;
  }
  else
  {
    v10 = *((_BYTE *)v43 + 24) != 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v42, 8);
LABEL_8:

  return v10;
}

void __54__RTSensitiveDateClassifier__isNearSensitiveLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v6, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "distanceFromLocation:toLocation:error:", v7, v10, &v24);
  v12 = v11;
  v13 = v24;
  v14 = v24;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);
  if (v12 <= 1000.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v26 = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]_block_invoke";
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v18;
      v31 = 2048;
      v32 = v12;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, near sensitive location detected, currentLocation, %@, sensitiveLocation, %@, distance, %.2f", buf, 0x2Au);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "date");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "timestamp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "processSignal:date:", 2, v23);

  }
}

- (id)_locationsForOptions:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  RTLocationManager *locationManager;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE buf[12];
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  _QWORD v62[4];

  v62[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0;
  v48 = (id *)&v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__32;
  v51 = __Block_byref_object_dispose__32;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__32;
  v45 = __Block_byref_object_dispose__32;
  v46 = (id)objc_opt_new();
  v5 = dispatch_semaphore_create(0);
  locationManager = self->_locationManager;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __50__RTSensitiveDateClassifier__locationsForOptions___block_invoke;
  v37[3] = &unk_1E9296EE0;
  v39 = &v47;
  v40 = &v41;
  v7 = v5;
  v38 = v7;
  -[RTLocationManager fetchStoredLocationsWithOptions:handler:](locationManager, "fetchStoredLocationsWithOptions:handler:", v4, v37);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v62[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v62, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

    v24 = 0;
  }
  else
  {
LABEL_6:
    v23 = 0;
    v24 = 1;
  }

  v25 = v23;
  if ((v24 & 1) == 0)
    objc_storeStrong(v48 + 5, v23);
  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v36 = objc_msgSend((id)v42[5], "count");
    objc_msgSend(v4, "dateInterval");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "startDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringFromDate");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateInterval");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "endDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringFromDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v48[5];
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[RTSensitiveDateClassifier _locationsForOptions:]";
    v54 = 2048;
    v55 = v36;
    v56 = 2112;
    v57 = v31;
    v58 = 2112;
    v59 = v34;
    v60 = 2112;
    v61 = v35;
    _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "%s, Fetched %lu locations, batch from, %@, to, %@, error, %@", buf, 0x34u);

  }
  if (v48[5])
    v27 = 0;
  else
    v27 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v27;
}

void __50__RTSensitiveDateClassifier__locationsForOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_motionsForDateInterval:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  RTMotionActivityManager *motionActivityManager;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE buf[12];
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0;
  v48 = (id *)&v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__32;
  v51 = __Block_byref_object_dispose__32;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__32;
  v45 = __Block_byref_object_dispose__32;
  v46 = (id)objc_opt_new();
  v5 = dispatch_semaphore_create(0);
  motionActivityManager = self->_motionActivityManager;
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __53__RTSensitiveDateClassifier__motionsForDateInterval___block_invoke;
  v37[3] = &unk_1E9296EE0;
  v39 = &v41;
  v40 = &v47;
  v9 = v5;
  v38 = v9;
  -[RTMotionActivityManager fetchMotionActivitiesFromStartDate:endDate:handler:](motionActivityManager, "fetchMotionActivitiesFromStartDate:endDate:handler:", v7, v8, v37);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v62[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v62, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_retainAutorelease(v24);

    v26 = 0;
  }
  else
  {
LABEL_6:
    v25 = 0;
    v26 = 1;
  }

  v27 = v25;
  if ((v26 & 1) == 0)
    objc_storeStrong(v48 + 5, v25);
  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v31 = objc_msgSend((id)v42[5], "count");
    objc_msgSend(v4, "startDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromDate");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringFromDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v48[5];
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[RTSensitiveDateClassifier _motionsForDateInterval:]";
    v54 = 2048;
    v55 = v31;
    v56 = 2112;
    v57 = v33;
    v58 = 2112;
    v59 = v35;
    v60 = 2112;
    v61 = v36;
    _os_log_debug_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEBUG, "%s, Fetched %lu motion activities, batch from, %@, to, %@, error, %@", buf, 0x34u);

  }
  if (v48[5])
    v29 = 0;
  else
    v29 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v29;
}

void __53__RTSensitiveDateClassifier__motionsForDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_sensitiveLocationsOfInterestWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  dispatch_semaphore_t v6;
  RTLearnedLocationStore *learnedLocationStore;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v38[5];
  NSObject *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  id *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  uint8_t buf[16];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v3 = objc_msgSend(&unk_1E932C190, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v3)
  {
    v35 = *(_QWORD *)v55;
    v33 = *MEMORY[0x1E0D18598];
    v34 = *MEMORY[0x1E0CB2D50];
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v55 != v35)
          objc_enumerationMutation(&unk_1E932C190);
        v5 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v4);
        v48 = 0;
        v49 = (id *)&v48;
        v50 = 0x3032000000;
        v51 = __Block_byref_object_copy__32;
        v52 = __Block_byref_object_dispose__32;
        v53 = 0;
        v42 = 0;
        v43 = &v42;
        v44 = 0x3032000000;
        v45 = __Block_byref_object_copy__32;
        v46 = __Block_byref_object_dispose__32;
        v47 = 0;
        v6 = dispatch_semaphore_create(0);
        learnedLocationStore = self->_learnedLocationStore;
        v8 = objc_msgSend(v5, "unsignedIntegerValue");
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __68__RTSensitiveDateClassifier__sensitiveLocationsOfInterestWithError___block_invoke;
        v38[3] = &unk_1E92995B0;
        v38[4] = v5;
        v40 = &v48;
        v41 = &v42;
        v9 = v6;
        v39 = v9;
        -[RTLearnedLocationStore fetchLocationsOfInterestWithPlaceType:handler:](learnedLocationStore, "fetchLocationsOfInterestWithPlaceType:handler:", v8, v38);
        v10 = v9;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v10, v12))
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v11);
        v15 = v14;
        v16 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v22 = (void *)MEMORY[0x1E0CB35C8];
        v59 = v34;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v59, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v33, 15, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = objc_retainAutorelease(v24);

          v26 = 0;
        }
        else
        {
LABEL_11:
          v25 = 0;
          v26 = 1;
        }

        v27 = v25;
        if ((v26 & 1) == 0)
          objc_storeStrong(v49 + 5, v25);
        v28 = v49[5];
        if (v28)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v28);
        }
        else if (v43[5])
        {
          objc_msgSend(v32, "addObjectsFromArray:");
        }

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v48, 8);

        if (v28)
        {
          v30 = 0;
          v29 = v32;
          goto LABEL_24;
        }
        ++v4;
      }
      while (v3 != v4);
      v3 = objc_msgSend(&unk_1E932C190, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v3)
        continue;
      break;
    }
  }
  v29 = v32;
  v30 = v32;
LABEL_24:

  return v30;
}

void __68__RTSensitiveDateClassifier__sensitiveLocationsOfInterestWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v5, "count");
    v9 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
    v16 = 136315650;
    v17 = "-[RTSensitiveDateClassifier _sensitiveLocationsOfInterestWithError:]_block_invoke";
    v18 = 2048;
    v19 = v8;
    v20 = 2048;
    v21 = v9;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, fetched %lu learned location of interest from learned location store, of placeType, %lu", (uint8_t *)&v16, 0x20u);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;
  v15 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_sensitiveMotionSignalDetectedForMotion:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  BOOL v12;
  uint64_t v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "type") != 4)
    goto LABEL_6;
  objc_msgSend(v9, "timeIntervalSinceDate:", v8);
  v11 = v10;
  if (v10 >= 180.0 && objc_msgSend(v7, "confidence") == 3)
  {
LABEL_12:
    v12 = 1;
    goto LABEL_13;
  }
  if (v11 >= 240.0)
  {
    v13 = objc_msgSend(v7, "confidence");
    if (v11 < 300.0 && v13 != 2)
      goto LABEL_6;
    goto LABEL_12;
  }
  if (v11 >= 300.0)
    goto LABEL_12;
LABEL_6:
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)_compareWorkoutStartDateToLookbackWindowStartDate:(id)a3 motionLookbackWindowStartDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  _BOOL4 v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[RTSensitiveDateClassifier latestWorkoutDateInterval](self, "latestWorkoutDateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTSensitiveDateClassifier latestWorkoutDateInterval](self, "latestWorkoutDateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTSensitiveDateClassifier nearSensitiveLocationDetectionDate](self, "nearSensitiveLocationDetectionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[RTSensitiveDateClassifier nearSensitiveLocationDetectionDate](self, "nearSensitiveLocationDetectionDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "laterDate:", v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v7;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "stringFromDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate");
    v34 = v6;
    v35 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTSensitiveDateClassifier nearSensitiveLocationDetectionDate](self, "nearSensitiveLocationDetectionDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringFromDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate");
    v33 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromDate");
    v21 = v14;
    v22 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v37 = "-[RTSensitiveDateClassifier _compareWorkoutStartDateToLookbackWindowStartDate:motionLookbackWindowStartDate:]";
    v38 = 2112;
    v39 = v16;
    v40 = 2112;
    v41 = v17;
    v42 = 2112;
    v43 = v19;
    v44 = 2112;
    v45 = v20;
    v46 = 2112;
    v47 = v23;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, workoutStartDate, %@, workoutEndDate, %@, nearSensitiveLocationDetectionDate, %@, motionLookbackWindowStartDate, %@, gatingSignalStartDate, %@", buf, 0x3Eu);

    v7 = v22;
    v14 = v21;

    v11 = v33;
    v6 = v34;
    v9 = v35;

  }
  -[RTSensitiveDateClassifier latestWorkoutDateInterval](self, "latestWorkoutDateInterval");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_18;
  v25 = (void *)v24;
  v26 = objc_msgSend(v6, "compare:", v9);

  if (v26 == -1)
    goto LABEL_18;
  if (!v11 || objc_msgSend(v11, "compare:", v14) != -1)
  {
    objc_msgSend(v9, "laterDate:", v14);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v28 = -[RTSensitiveDateClassifier inWifiDenseArea](self, "inWifiDenseArea");
  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (!v28)
  {
    if (v30)
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[RTSensitiveDateClassifier _compareWorkoutStartDateToLookbackWindowStartDate:motionLookbackWindowStartDate:]";
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%s, workout end date precedes sensitive LOI or driving motion, lookbackWindowStartDate not altered", buf, 0xCu);
    }

LABEL_18:
    v27 = v6;
    goto LABEL_19;
  }
  if (v30)
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[RTSensitiveDateClassifier _compareWorkoutStartDateToLookbackWindowStartDate:motionLookbackWindowStartDate:]";
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%s, workout end date precedes sensitive LOI or driving motion, returning current date due to wifi dense area detection", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  v31 = v27;

  return v31;
}

- (BOOL)_accessPointsConditionsMet
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[RTSensitiveDateClassifier accessPoints](self, "accessPoints");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[RTSensitiveDateClassifier accessPoints](self, "accessPoints"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[RTSensitiveDateClassifier accessPoints](self, "accessPoints");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      -[RTSensitiveDateClassifier accessPoints](self, "accessPoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v26 = "-[RTSensitiveDateClassifier _accessPointsConditionsMet]";
      v27 = 2048;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, wifi access points count, %lu, accessPoints, %@", buf, 0x20u);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[RTSensitiveDateClassifier accessPoints](self, "accessPoints", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v11);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "rssi") > -96)
            ++v14;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    -[RTSensitiveDateClassifier metrics](self, "metrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateWifiAccessPointCount:", v14);

    return v14 > 7;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[RTSensitiveDateClassifier _accessPointsConditionsMet]";
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%s, no wifi access points received", buf, 0xCu);
    }

    return 0;
  }
}

- (void)_processWifiScanResults
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  -[RTSensitiveDateClassifier wifiDenseHandler](self, "wifiDenseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTSensitiveDateClassifier _stopMonitoringWifiScans](self, "_stopMonitoringWifiScans");
    -[RTSensitiveDateClassifier wifiDenseHandler](self, "wifiDenseHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v4)[2](v4, -[RTSensitiveDateClassifier _accessPointsConditionsMet](self, "_accessPointsConditionsMet"));

    -[RTSensitiveDateClassifier setWifiDenseHandler:](self, "setWifiDenseHandler:", 0);
  }
}

- (void)_stopMonitoringWifiScans
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[RTSensitiveDateClassifier wifiManager](self, "wifiManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelScan");

  -[RTSensitiveDateClassifier wifiManager](self, "wifiManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:fromNotification:", self, v5);

  _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[RTSensitiveDateClassifier _stopMonitoringWifiScans]";
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, stop monitoring for wifi scan results", (uint8_t *)&v8, 0xCu);
  }

  -[RTSensitiveDateClassifier wifiScanTimer](self, "wifiScanTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[RTSensitiveDateClassifier setWifiScanTimer:](self, "setWifiScanTimer:", 0);
}

- (void)onWifiScanResultsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTSensitiveDateClassifier *v9;

  v4 = a3;
  -[RTSensitiveDateClassifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__RTSensitiveDateClassifier_onWifiScanResultsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__RTSensitiveDateClassifier_onWifiScanResultsNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanResults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accessPoints");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v3);

    objc_msgSend(*(id *)(a1 + 40), "_processWifiScanResults");
  }
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTSensitiveDateClassifierMetrics)metrics
{
  return self->_metrics;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)inWifiDenseArea
{
  return self->_inWifiDenseArea;
}

- (void)setInWifiDenseArea:(BOOL)a3
{
  self->_inWifiDenseArea = a3;
}

- (NSDateInterval)latestWorkoutDateInterval
{
  return self->_latestWorkoutDateInterval;
}

- (void)setLatestWorkoutDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_latestWorkoutDateInterval, a3);
}

- (NSArray)sensitiveLocations
{
  return self->_sensitiveLocations;
}

- (void)setSensitiveLocations:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveLocations, a3);
}

- (NSDate)nearSensitiveLocationDetectionDate
{
  return self->_nearSensitiveLocationDetectionDate;
}

- (void)setNearSensitiveLocationDetectionDate:(id)a3
{
  objc_storeStrong((id *)&self->_nearSensitiveLocationDetectionDate, a3);
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
  objc_storeStrong((id *)&self->_accessPoints, a3);
}

- (RTTimer)wifiScanTimer
{
  return self->_wifiScanTimer;
}

- (void)setWifiScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScanTimer, a3);
}

- (id)wifiDenseHandler
{
  return self->_wifiDenseHandler;
}

- (void)setWifiDenseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wifiDenseHandler, 0);
  objc_storeStrong((id *)&self->_wifiScanTimer, 0);
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_nearSensitiveLocationDetectionDate, 0);
  objc_storeStrong((id *)&self->_sensitiveLocations, 0);
  objc_storeStrong((id *)&self->_latestWorkoutDateInterval, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
