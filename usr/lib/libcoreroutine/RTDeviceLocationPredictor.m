@implementation RTDeviceLocationPredictor

- (RTDeviceLocationPredictor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_learnedLocationManager_locationManager_mapServiceManager_metricManager_platform_providers_);
}

- (RTDeviceLocationPredictor)initWithQueue:(id)a3 authorizationManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 metricManager:(id)a10 platform:(id)a11 providers:(id)a12
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
  NSObject *v26;
  void *v27;
  RTDeviceLocationPredictor *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  RTDeviceLocationPredictor *v37;
  RTDeviceLocationPredictor *v38;
  RTDeviceLocationPredictor *v39;
  uint64_t v40;
  NSSet *providers;
  id obj;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  void *v50;
  objc_super v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  obj = a4;
  v18 = a4;
  v44 = a5;
  v19 = a5;
  v45 = a6;
  v20 = a6;
  v47 = a7;
  v21 = a7;
  v46 = a8;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v49 = a12;
  v50 = v18;
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLoc"
            "ationManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
      v54 = 1024;
      v55 = 116;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager (in %s:%d)", buf, 0x12u);
    }

  }
  v27 = v21;
  v28 = self;
  if (v19)
  {
    if (v20)
      goto LABEL_7;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLoc"
            "ationManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
      v54 = 1024;
      v55 = 117;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

    if (v20)
    {
LABEL_7:
      if (v27)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    v54 = 1024;
    v55 = 118;
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
  }

  if (v27)
  {
LABEL_8:
    if (v22)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_20:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    v54 = 1024;
    v55 = 119;
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager (in %s:%d)", buf, 0x12u);
  }

  if (v22)
  {
LABEL_9:
    if (v23)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_23:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    v54 = 1024;
    v55 = 120;
    _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
  }

  if (v23)
  {
LABEL_10:
    if (v24)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_26:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    v54 = 1024;
    v55 = 121;
    _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
  }

  if (v24)
  {
LABEL_11:
    if (v25)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_29:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    v54 = 1024;
    v55 = 122;
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metricManager (in %s:%d)", buf, 0x12u);
  }

  if (v25)
  {
LABEL_12:
    if (v17)
      goto LABEL_38;
    goto LABEL_35;
  }
LABEL_32:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    v54 = 1024;
    v55 = 123;
    _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform (in %s:%d)", buf, 0x12u);
  }

  if (!v17)
  {
LABEL_35:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLoc"
            "ationManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
      v54 = 1024;
      v55 = 124;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_38:
  v37 = 0;
  if (v17 && v50 && v19 && v20 && v27 && v22 && v23 && v24 && v25)
  {
    v51.receiver = self;
    v51.super_class = (Class)RTDeviceLocationPredictor;
    v38 = -[RTNotifier initWithQueue:](&v51, sel_initWithQueue_, v17);
    v39 = v38;
    if (v38)
    {
      objc_storeStrong((id *)&v38->_authorizationManager, obj);
      objc_storeStrong((id *)&v39->_defaultsManager, v44);
      objc_storeStrong((id *)&v39->_distanceCalculator, v45);
      objc_storeStrong((id *)&v39->_locationManager, v46);
      objc_storeStrong((id *)&v39->_learnedLocationManager, v47);
      objc_storeStrong((id *)&v39->_mapServiceManager, a9);
      objc_storeStrong((id *)&v39->_metricManager, a10);
      objc_storeStrong((id *)&v39->_platform, a11);
      v40 = objc_msgSend(v49, "copy");
      providers = v39->_providers;
      v39->_providers = (NSSet *)v40;

      -[RTService setup](v39, "setup");
    }
    v28 = v39;
    v37 = v28;
  }

  return v37;
}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[RTDeviceLocationPredictor authorizationManager](self, "authorizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_onAuthorizationNotification_, v4);

  -[RTDeviceLocationPredictor learnedLocationManager](self, "learnedLocationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:", self, sel_onLearnedLocationManagerNotification_, v5);

}

- (void)_unregisterForNotifications
{
  void *v3;
  void *v4;
  id v5;

  -[RTDeviceLocationPredictor authorizationManager](self, "authorizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[RTDeviceLocationPredictor learnedLocationManager](self, "learnedLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTDeviceLocationPredictor locationManager](self, "locationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)_setup
{
  -[RTDeviceLocationPredictor _registerForNotifications](self, "_registerForNotifications");
  -[RTDeviceLocationPredictor _setupEvalMode](self, "_setupEvalMode");
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[RTDeviceLocationPredictor _unregisterForNotifications](self, "_unregisterForNotifications");
  -[RTDeviceLocationPredictor nextPredictedLocationsOfInterestCache](self, "nextPredictedLocationsOfInterestCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[RTDeviceLocationPredictor setNextPredictedLocationsOfInterestCache:](self, "setNextPredictedLocationsOfInterestCache:", 0);
  -[RTDeviceLocationPredictor nextPredictedLocationsOfInterestPollLocationTimer](self, "nextPredictedLocationsOfInterestPollLocationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RTDeviceLocationPredictor nextPredictedLocationsOfInterestPollLocationTimer](self, "nextPredictedLocationsOfInterestPollLocationTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

    -[RTDeviceLocationPredictor setNextPredictedLocationsOfInterestPollLocationTimer:](self, "setNextPredictedLocationsOfInterestPollLocationTimer:", 0);
  }
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    v7 = v8;
  }

}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
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
  v13[2] = __73__RTDeviceLocationPredictor_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __73__RTDeviceLocationPredictor_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_clear");
  }
  else if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_purgeWithReferenceDate:", *(_QWORD *)(a1 + 40));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_clear
{
  id v2;

  -[RTDeviceLocationPredictor nextPredictedLocationsOfInterestCache](self, "nextPredictedLocationsOfInterestCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

- (void)clear
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__RTDeviceLocationPredictor_clear__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __34__RTDeviceLocationPredictor_clear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clear");
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)_purgeWithReferenceDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTDeviceLocationPredictor nextPredictedLocationsOfInterestCache](self, "nextPredictedLocationsOfInterestCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeWithReferenceDate:", v4);

}

- (void)purgeWithReferenceDate:(id)a3
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
  v7[2] = __52__RTDeviceLocationPredictor_purgeWithReferenceDate___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__RTDeviceLocationPredictor_purgeWithReferenceDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeWithReferenceDate:", *(_QWORD *)(a1 + 40));
}

- (id)_mergedLocationOfInterest:(id)a3 otherLocationOfInterest:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        objc_msgSend(v6, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v10 = v5,
        v9))
  {
    objc_msgSend(v6, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          objc_msgSend(v5, "identifier"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v10 = v6,
          v13))
    {
      objc_msgSend(v5, "customLabel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14
        || (v15 = (void *)v14,
            objc_msgSend(v6, "customLabel"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v16,
            v15,
            v10 = v5,
            v16))
      {
        objc_msgSend(v6, "customLabel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17
          || (v18 = (void *)v17,
              objc_msgSend(v5, "customLabel"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v19,
              v18,
              v10 = v6,
              v19))
        {
          if (objc_msgSend(v5, "type") == -1 || (v20 = objc_msgSend(v6, "type"), v10 = v5, v20 != -1))
          {
            if (objc_msgSend(v6, "type") == -1 || (v21 = objc_msgSend(v5, "type"), v10 = v6, v21 != -1))
            {
              objc_msgSend(v5, "visits");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "count");
              objc_msgSend(v6, "visits");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "count");

              v10 = v5;
              if (v23 <= v25)
              {
                objc_msgSend(v6, "visits");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "count");
                objc_msgSend(v5, "visits");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "count");

                v10 = v6;
                if (v27 <= v29)
                {
                  objc_msgSend(v5, "confidence");
                  v31 = v30;
                  objc_msgSend(v6, "confidence");
                  v10 = v5;
                  if (v31 <= v32)
                  {
                    objc_msgSend(v6, "confidence");
                    v34 = v33;
                    objc_msgSend(v5, "confidence");
                    if (v34 <= v35)
                      v10 = v5;
                    else
                      v10 = v6;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v36 = v10;
  objc_msgSend(v36, "visits");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v6;
  if (!objc_msgSend(v37, "count"))
  {
    v38 = v6;
    if (v36 == v5 || (v38 = v5, v36 == v6))
    {
      objc_msgSend(v38, "visits");
      v39 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v39;
    }
  }
  v40 = objc_alloc(MEMORY[0x1E0D183C0]);
  objc_msgSend(v36, "location");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "confidence");
  v43 = v42;
  objc_msgSend(v36, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v36, "type");
  v46 = objc_msgSend(v36, "typeSource");
  objc_msgSend(v36, "customLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "mapItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v40, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v41, v44, v45, v46, v37, v47, v43, v48);

  return v49;
}

- (id)_mergePredictedLocationsOfInterest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__103;
      v36 = __Block_byref_object_dispose__103;
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationOfInterest");
      v37 = (id)objc_claimAutoreleasedReturnValue();

      v7 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke;
      v31[3] = &unk_1E92A16C0;
      v31[4] = self;
      v31[5] = &v32;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v31);
      objc_msgSend(v4, "valueForKeyPath:", CFSTR("@max.confidence"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      objc_msgSend(v4, "valueForKeyPath:", CFSTR("@min.nextEntryTime"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v29[0] = v7;
      v29[1] = 3221225472;
      v29[2] = __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke_2;
      v29[3] = &unk_1E92A16E8;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v12;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v29);
      objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E9328A00);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      if (v14 <= 0)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E9328A18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        if (v17 <= 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E9328A30);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v18, "integerValue") > 0;

        }
        else
        {
          v15 = 3;
        }
      }
      else
      {
        v15 = 2;
      }
      v24 = v7;
      v25 = 3221225472;
      v26 = __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke_29;
      v27 = &unk_1E92A16E8;
      v19 = (id)objc_opt_new();
      v28 = v19;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v24);
      v20 = objc_alloc(MEMORY[0x1E0D18450]);
      v21 = v33[5];
      if (objc_msgSend(v19, "count", v24, v25, v26, v27))
        v22 = v19;
      else
        v22 = 0;
      v5 = (void *)objc_msgSend(v20, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v21, v11, v15, v22, v10);

      _Block_object_dispose(&v32, 8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(a2, "locationOfInterest");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_mergedLocationOfInterest:otherLocationOfInterest:", v5, v9);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "modeOfTransportation"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "integerValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke_29(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sources");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)_dedupePredictedLocationsOfInterest:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v26;
  id obj;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  RTDeviceLocationPredictor *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v4)
  {
    v5 = v4;
    v29 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v7, "locationOfInterest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mapItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v10 = v28;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v34;
LABEL_9:
            v14 = 0;
            while (1)
            {
              if (*(_QWORD *)v34 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
              if ((objc_msgSend(v9, "isEqualToMapItem:", v15) & 1) != 0)
                break;
              if (v12 == ++v14)
              {
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
                if (v12)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            v16 = v15;

            if (!v16)
              goto LABEL_18;
            objc_msgSend(v10, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v7);

          }
          else
          {
LABEL_15:

LABEL_18:
            v18 = (void *)objc_opt_new();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v9);

            objc_msgSend(v10, "objectForKeyedSubscript:", v9);
            v16 = objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v16, "addObject:", v7);
          }
        }
        else
        {
          objc_msgSend(v8, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v8, "identifier");
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v7, v16);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v8;
              _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "locationOfInterest %@, has nil identifier.", buf, 0xCu);
            }
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __65__RTDeviceLocationPredictor__dedupePredictedLocationsOfInterest___block_invoke;
  v30[3] = &unk_1E92A1710;
  v21 = v20;
  v31 = v21;
  v32 = self;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v30);
  objc_msgSend(v26, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v22);

  v23 = v21;
  return v23;
}

void __65__RTDeviceLocationPredictor__dedupePredictedLocationsOfInterest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count") == 1)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  else
  {
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_fault_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_FAULT, "unexpected count of LOIs assocaited to mapItem, %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "_mergePredictedLocationsOfInterest:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);
    }

  }
}

- (id)_sortPredictedLocationsOfInterest:(id)a3
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  objc_class *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id obj;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_81);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_opt_new();
  v51 = (void *)objc_opt_new();
  v46 = (void *)objc_opt_new();
  v50 = (void *)objc_opt_new();
  v47 = (void *)objc_opt_new();
  v45 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v3;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v53; i = v26 + 1)
      {
        if (*(_QWORD *)v61 != v52)
          objc_enumerationMutation(obj);
        v54 = i;
        v5 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v45);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v55 = v5;
        objc_msgSend(v5, "sources");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v57;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v57 != v10)
                objc_enumerationMutation(v7);
              objc_opt_class();
              if (((objc_opt_isKindOfClass() & 1) != 0
                 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                && (v12 = (objc_class *)objc_opt_class(),
                    NSStringFromClass(v12),
                    (v13 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v14 = v13;
                v15 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v6, "objectForKeyedSubscript:", v13);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") + 1);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v14);

              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
                {
                  v18 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v65 = v55;
                  v66 = 2112;
                  v67 = v19;
                  _os_log_fault_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_FAULT, "unhandled PLOI source, ploi, %@, source, %@", buf, 0x16u);

                }
              }

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          }
          while (v9);
        }

        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "unsignedIntegerValue"))
        {
          objc_msgSend(v55, "confidence");
          v24 = v23;

          v25 = v50;
          v26 = v54;
          if (v24 > 0.0)
            goto LABEL_31;
        }
        else
        {

          v26 = v54;
        }
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "unsignedIntegerValue");

        v25 = v51;
        if (!v30)
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "unsignedIntegerValue");

          v25 = v48;
          if (!v34)
          {
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "unsignedIntegerValue");

            v25 = v47;
            if (!v38)
            {
              v39 = (objc_class *)objc_opt_class();
              NSStringFromClass(v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKeyedSubscript:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "unsignedIntegerValue");

              if (v42)
                v25 = v46;
              else
                v25 = v45;
            }
          }
        }
LABEL_31:
        objc_msgSend(v25, "addObject:", v55);

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v53);
  }

  v43 = (void *)objc_opt_new();
  objc_msgSend(v43, "addObjectsFromArray:", v50);
  objc_msgSend(v43, "addObjectsFromArray:", v51);
  objc_msgSend(v43, "addObjectsFromArray:", v48);
  objc_msgSend(v43, "addObjectsFromArray:", v47);
  objc_msgSend(v43, "addObjectsFromArray:", v46);
  objc_msgSend(v43, "addObjectsFromArray:", v45);

  return v43;
}

uint64_t __63__RTDeviceLocationPredictor__sortPredictedLocationsOfInterest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "confidence");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "confidence");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)_sortAndDedupePredictedLocationsOfInterest:(id)a3
{
  void *v4;
  void *v5;

  -[RTDeviceLocationPredictor _dedupePredictedLocationsOfInterest:](self, "_dedupePredictedLocationsOfInterest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDeviceLocationPredictor _sortPredictedLocationsOfInterest:](self, "_sortPredictedLocationsOfInterest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *p_super;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString **v27;
  uint64_t *v28;
  NSObject *v29;
  void *v30;
  RTPredictedLocationsOfInterestCriteria *v31;
  double v32;
  NSObject *v33;
  void *v34;
  NSSet *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void (**v49)(id, _QWORD, void *);
  id v50;
  id v51;
  id v52;
  RTPredictedLocationsOfInterestCriteria *v53;
  _QWORD block[4];
  id v55;
  id v56;
  RTDeviceLocationPredictor *v57;
  void (**v58)(id, _QWORD, void *);
  _QWORD v59[6];
  id v60;
  NSObject *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  double v73;
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  _QWORD v81[4];

  v81[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  if (v15)
  {
    if (v12)
    {
      objc_msgSend(v12, "horizontalUncertainty");
      if (v16 > 250.0)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0D18598];
        v78 = *MEMORY[0x1E0CB2D50];
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "horizontalUncertainty");
        objc_msgSend(v19, "stringWithFormat:", CFSTR("Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f,"), v20, 0x406F400000000000);
        p_super = objc_claimAutoreleasedReturnValue();
        v79 = p_super;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 7, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, 0, v23);

        goto LABEL_31;
      }
      if (v13)
      {
        if (a5 > 0.0)
        {
          v49 = v15;
          _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "stringFromDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v69 = (const char *)v12;
            v70 = 2112;
            v71 = v30;
            v72 = 2048;
            v73 = a5 / 3600.0;
            _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "Predict device location wrt location, %@, startDate, %@, timeInterval, %.2f hrs", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[RTPredictedLocationsOfInterestCriteria initWithDistanceCalculator:]([RTPredictedLocationsOfInterestCriteria alloc], "initWithDistanceCalculator:", self->_distanceCalculator);
          v51 = v13;
          -[RTPredictedLocationsOfInterestCriteria setReferenceDate:](v31, "setReferenceDate:", v13);
          v52 = v12;
          -[RTPredictedLocationsOfInterestCriteria setReferenceLocation:](v31, "setReferenceLocation:", v12);
          -[RTPredictedLocationsOfInterestCriteria setWindowDuration:](v31, "setWindowDuration:", a5);
          v32 = a5 * 20.0;
          if (a5 <= 0.0)
            v32 = 72000.0;
          -[RTPredictedLocationsOfInterestCriteria setMaximumDistance:](v31, "setMaximumDistance:", v32);
          -[RTPredictedLocationsOfInterestCriteria setMinimumDistance:](v31, "setMinimumDistance:", 700.0);
          v50 = v14;
          -[RTPredictedLocationsOfInterestCriteria setClientIdentifier:](v31, "setClientIdentifier:", v14);
          v33 = dispatch_group_create();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v35 = self->_providers;
          v36 = -[NSSet countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          v53 = v31;
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v64;
            do
            {
              for (i = 0; i != v37; ++i)
              {
                if (*(_QWORD *)v64 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                if (objc_msgSend(v40, "requiresRoutineEnablement")
                  && !-[RTDeviceLocationPredictor routineEnabled](self, "routineEnabled"))
                {
                  _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    v43 = objc_opt_class();
                    *(_DWORD *)buf = 138412290;
                    v69 = (const char *)v43;
                    _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "skipping provider %@ due to routine disablement", buf, 0xCu);
                  }

                  v31 = v53;
                }
                else
                {
                  dispatch_group_enter(v33);
                  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                  v59[0] = MEMORY[0x1E0C809B0];
                  v59[1] = 3221225472;
                  v59[2] = __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke;
                  v59[3] = &unk_1E92A1758;
                  v59[4] = self;
                  v59[5] = v40;
                  v62 = v41;
                  v60 = v34;
                  v61 = v33;
                  objc_msgSend(v40, "fetchNextPredictedLocationsOfInterestWithCriteria:handler:", v31, v59);

                }
              }
              v37 = -[NSSet countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
            }
            while (v37);
          }

          -[RTNotifier queue](self, "queue");
          v44 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_51;
          block[3] = &unk_1E9297EB8;
          v15 = v49;
          v55 = v34;
          v56 = v48;
          v57 = self;
          v58 = v49;
          v45 = v48;
          v46 = v34;
          dispatch_group_notify(v33, v44, block);

          p_super = &v53->super;
          v13 = v51;
          v12 = v52;
          v14 = v50;
          goto LABEL_31;
        }
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0D18598];
        v74 = *MEMORY[0x1E0CB2D50];
        v75 = CFSTR("requires a valid interval.");
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v75;
        v28 = &v74;
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0D18598];
        v76 = *MEMORY[0x1E0CB2D50];
        v77 = CFSTR("requires a valid date.");
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v77;
        v28 = &v76;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D18598];
      v80 = *MEMORY[0x1E0CB2D50];
      v81[0] = CFSTR("requires a valid location.");
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = (const __CFString **)v81;
      v28 = &v80;
    }
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
    p_super = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 7, p_super);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v47);

    goto LABEL_31;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[RTDeviceLocationPredictor _fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientId"
          "entifier:handler:]";
    v70 = 1024;
    LODWORD(v71) = 511;
    _os_log_error_impl(&dword_1D1A22000, p_super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_31:

}

void __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_2;
  v12[3] = &unk_1E9298A20;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v13 = v6;
  v14 = v8;
  v12[1] = 3221225472;
  v15 = v5;
  v18 = *(_QWORD *)(a1 + 64);
  v16 = v9;
  v17 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "provider %@, encountered error, %@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = objc_opt_class();
      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v8 = v7 - *(double *)(a1 + 72);
      v11 = 138412802;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "provider %@, returned %lu next PLOIs, latency, %.3f", (uint8_t *)&v11, 0x20u);
    }

    if (objc_msgSend(*(id *)(a1 + 48), "count"))
      objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_51(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  double v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
    v6 = 134218240;
    v7 = v3;
    v8 = 2048;
    v9 = -v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "all providers returned a total of %lu next PLOIs, latency, %.3f", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_sortAndDedupePredictedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 handler:(id)a6
{
  -[RTDeviceLocationPredictor fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientIdentifier:handler:](self, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientIdentifier:handler:", a3, a4, 0, a6, a5);
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;
  double v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (v16)
  {
    -[RTNotifier queue](self, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __127__RTDeviceLocationPredictor_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke;
    block[3] = &unk_1E92A1780;
    block[4] = self;
    v24 = a2;
    v23 = v16;
    v20 = v13;
    v21 = v14;
    v25 = a5;
    v22 = v15;
    dispatch_async(v17, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTDeviceLocationPredictor fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientI"
            "dentifier:handler:]";
      v28 = 1024;
      v29 = 621;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __127__RTDeviceLocationPredictor_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  __CFString *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "evalPredictedLocationsOfInterest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "~~~ %@, EVAL MODE ~~~", (uint8_t *)&v9, 0xCu);

    }
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = CFSTR("Eval");
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "mobile$ defaults delete com.apple.routined %@", (uint8_t *)&v9, 0xCu);
    }

    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = CFSTR("Eval");
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "root$ notifyutil -p %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "evalPredictedLocationsOfInterest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 80));
  }
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v8, "dateByAddingTimeInterval:", -7200.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", 7200.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDeviceLocationPredictor fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:](self, "fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:", v11, v12, v9, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[RTDeviceLocationPredictor fetchPredictedLocationsOfInterestOnDate:clientIdentifier:withHandler:]";
      v16 = 1024;
      v17 = 653;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

  }
}

- (void)_fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  NSObject *v25;
  char *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  RTDeviceLocationPredictor *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSSet *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  void (**v49)(id, _QWORD, void *);
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  void (**v54)(id, _QWORD, void *);
  _QWORD v55[6];
  id v56;
  NSObject *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (v11)
  {
    if (v9)
    {
      objc_msgSend(v9, "horizontalUncertainty");
      if (v12 > 250.0)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v14 = *MEMORY[0x1E0D18598];
        v70 = *MEMORY[0x1E0CB2D50];
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "horizontalUncertainty");
        objc_msgSend(v15, "stringWithFormat:", CFSTR("Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f,"), v16, 0x406F400000000000);
        v17 = objc_claimAutoreleasedReturnValue();
        v71 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0, v19);

        goto LABEL_21;
      }
      if (v10)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "coordinateToString");
          v26 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringFromDate");
          v27 = v10;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v65 = v26;
          v66 = 2112;
          v67 = v28;
          _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "Predict exit dates from location, %@, onDate, %@", buf, 0x16u);

          v10 = v27;
        }

        -[RTDeviceLocationPredictor evalPredictedExitDates](self, "evalPredictedExitDates");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v31 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v65 = v31;
            _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "~~~ %@, EVAL MODE ~~~", buf, 0xCu);

          }
          _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v65 = CFSTR("Eval");
            _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "mobile$ defaults delete com.apple.routined %@", buf, 0xCu);
          }

          _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v65 = CFSTR("Eval");
            _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "root$ notifyutil -p %@", buf, 0xCu);
          }

          -[RTDeviceLocationPredictor evalPredictedExitDates](self, "evalPredictedExitDates");
          v17 = objc_claimAutoreleasedReturnValue();
          ((void (**)(id, NSObject *, void *))v11)[2](v11, v17, 0);
        }
        else
        {
          v49 = v11;
          v35 = objc_opt_new();
          v50 = v10;
          -[NSObject setReferenceDate:](v35, "setReferenceDate:", v10);
          v51 = v9;
          -[NSObject setReferenceLocation:](v35, "setReferenceLocation:", v9);
          v36 = self;
          v37 = v35;
          -[NSObject setWindowDuration:](v35, "setWindowDuration:", INFINITY);
          v38 = dispatch_group_create();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v40 = v36->_providers;
          v41 = -[NSSet countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v42; ++i)
              {
                if (*(_QWORD *)v60 != v43)
                  objc_enumerationMutation(v40);
                v45 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                if (!objc_msgSend(v45, "requiresRoutineEnablement")
                  || -[RTDeviceLocationPredictor routineEnabled](v36, "routineEnabled"))
                {
                  dispatch_group_enter(v38);
                  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                  v55[0] = MEMORY[0x1E0C809B0];
                  v55[1] = 3221225472;
                  v55[2] = __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke;
                  v55[3] = &unk_1E92A1758;
                  v55[4] = v36;
                  v55[5] = v45;
                  v58 = v46;
                  v56 = v39;
                  v57 = v38;
                  objc_msgSend(v45, "fetchPredictedExitDatesWithCriteria:handler:", v37, v55);

                }
              }
              v42 = -[NSSet countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
            }
            while (v42);
          }

          -[RTNotifier queue](v36, "queue");
          v47 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_55;
          block[3] = &unk_1E9297678;
          v11 = v49;
          v53 = v39;
          v54 = v49;
          v48 = v39;
          dispatch_group_notify(v38, v47, block);

          v10 = v50;
          v9 = v51;
          v17 = v37;
        }
        goto LABEL_21;
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D18598];
      v68 = *MEMORY[0x1E0CB2D50];
      v69 = CFSTR("requires a valid date.");
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v69;
      v24 = &v68;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D18598];
      v72 = *MEMORY[0x1E0CB2D50];
      v73[0] = CFSTR("requires a valid location.");
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = (const __CFString **)v73;
      v24 = &v72;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 7, v17);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v34);

    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v65 = "-[RTDeviceLocationPredictor _fetchPredictedExitDatesFromLocation:onDate:withHandler:]";
    v66 = 1024;
    LODWORD(v67) = 672;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_21:

}

void __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_2;
  v12[3] = &unk_1E9298A20;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v13 = v6;
  v14 = v8;
  v12[1] = 3221225472;
  v15 = v5;
  v18 = *(_QWORD *)(a1 + 64);
  v16 = v9;
  v17 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "provider %@, encountered error, %@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = objc_opt_class();
      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v8 = v7 - *(double *)(a1 + 72);
      v11 = 138412802;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "provider %@, returned %lu predicted exit dates, latency, %.3f", (uint8_t *)&v11, 0x20u);
    }

    if (objc_msgSend(*(id *)(a1 + 48), "count"))
      objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[RTNotifier queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__RTDeviceLocationPredictor_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke;
    v13[3] = &unk_1E9297EB8;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(v11, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTDeviceLocationPredictor fetchPredictedExitDatesFromLocation:onDate:withHandler:]";
      v19 = 1024;
      v20 = 761;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __84__RTDeviceLocationPredictor_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPredictedExitDatesFromLocation:onDate:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  NSObject *p_super;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  char *v25;
  void *v26;
  double v27;
  double v28;
  RTPredictedLocationsOfInterestCriteria *v29;
  double v30;
  NSObject *v31;
  void *v32;
  NSSet *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  void (**v42)(id, _QWORD, void *);
  void *v43;
  void *v44;
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  void (**v49)(id, _QWORD, void *);
  _QWORD v50[6];
  id v51;
  NSObject *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  const __CFString *v66;
  uint64_t v67;
  _QWORD v68[4];

  v68[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (v13)
  {
    if (!v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v60 = "-[RTDeviceLocationPredictor _fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:]";
        v61 = 1024;
        LODWORD(v62) = 786;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v67 = *MEMORY[0x1E0CB2D50];
      v68[0] = CFSTR("requires a valid startDate.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = (const __CFString **)v68;
      v19 = &v67;
      goto LABEL_14;
    }
    if (!v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v60 = "-[RTDeviceLocationPredictor _fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:]";
        v61 = 1024;
        LODWORD(v62) = 795;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v65 = *MEMORY[0x1E0CB2D50];
      v66 = CFSTR("requires a valid endDate.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v66;
      v19 = &v65;
      goto LABEL_14;
    }
    objc_msgSend(v11, "timeIntervalSinceDate:", v10);
    if (v14 < 0.0)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v63 = *MEMORY[0x1E0CB2D50];
      v64 = CFSTR("requires a valid startDate and endDate.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v64;
      v19 = &v63;
LABEL_14:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
      p_super = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, p_super);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v23);

      goto LABEL_15;
    }
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "stringFromDate");
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v60 = v25;
      v61 = 2112;
      v62 = v26;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "Predicting LOIs the device may travel to between startDate, %@, endDate, %@", buf, 0x16u);

    }
    v43 = v11;
    objc_msgSend(v11, "timeIntervalSinceDate:", v10);
    v28 = v27;
    v29 = -[RTPredictedLocationsOfInterestCriteria initWithDistanceCalculator:]([RTPredictedLocationsOfInterestCriteria alloc], "initWithDistanceCalculator:", self->_distanceCalculator);
    v44 = v10;
    -[RTPredictedLocationsOfInterestCriteria setReferenceDate:](v29, "setReferenceDate:", v10);
    -[RTPredictedLocationsOfInterestCriteria setReferenceLocation:](v29, "setReferenceLocation:", 0);
    -[RTPredictedLocationsOfInterestCriteria setWindowDuration:](v29, "setWindowDuration:", v28);
    v30 = v28 * 20.0;
    if (v28 <= 0.0)
      v30 = 72000.0;
    -[RTPredictedLocationsOfInterestCriteria setMaximumDistance:](v29, "setMaximumDistance:", v30, v13);
    -[RTPredictedLocationsOfInterestCriteria setMinimumDistance:](v29, "setMinimumDistance:", 700.0);
    p_super = &v29->super;
    -[RTPredictedLocationsOfInterestCriteria setClientIdentifier:](v29, "setClientIdentifier:", v12);
    v31 = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v33 = self->_providers;
    v34 = -[NSSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v55 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          if (!objc_msgSend(v38, "requiresRoutineEnablement")
            || -[RTDeviceLocationPredictor routineEnabled](self, "routineEnabled"))
          {
            dispatch_group_enter(v31);
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke;
            v50[3] = &unk_1E92A1758;
            v50[4] = self;
            v50[5] = v38;
            v53 = v39;
            v51 = v32;
            v52 = v31;
            objc_msgSend(v38, "fetchPredictedLocationsOfInterestWithCriteria:handler:", p_super, v50);

          }
        }
        v35 = -[NSSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v35);
    }

    -[RTNotifier queue](self, "queue");
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke_62;
    block[3] = &unk_1E9297F08;
    block[4] = self;
    v46 = v32;
    v10 = v44;
    v47 = v44;
    v11 = v43;
    v48 = v43;
    v13 = v42;
    v49 = v42;
    v41 = v32;
    dispatch_group_notify(v31, v40, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[RTDeviceLocationPredictor _fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:]";
      v61 = 1024;
      LODWORD(v62) = 781;
      _os_log_error_impl(&dword_1D1A22000, p_super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_15:

}

void __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke_2;
  v12[3] = &unk_1E9298A20;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v13 = v6;
  v14 = v8;
  v12[1] = 3221225472;
  v15 = v5;
  v18 = *(_QWORD *)(a1 + 64);
  v16 = v9;
  v17 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "provider %@, encountered error, %@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = objc_opt_class();
      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v8 = v7 - *(double *)(a1 + 72);
      v11 = 138412802;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "provider %@, returned %lu PLOIs, latency, %.3f", (uint8_t *)&v11, 0x20u);
    }

    if (objc_msgSend(*(id *)(a1 + 48), "count"))
      objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke_62(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_sortAndDedupePredictedLocationsOfInterest:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(v2, "count");
    objc_msgSend(*(id *)(a1 + 48), "stringFromDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "stringFromDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218498;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "in total, found %lu predicted LOIs the device may travel to from all data sources between start date, %@, end date, %@", (uint8_t *)&v7, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[RTNotifier queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__RTDeviceLocationPredictor_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke;
  block[3] = &unk_1E9297F08;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __116__RTDeviceLocationPredictor_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_setupEvalMode
{
  void *v3;
  int v4;
  const char *v5;
  NSObject *v6;
  _QWORD v7[5];
  int out_token;

  -[RTDeviceLocationPredictor platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "internalInstall");

  if (v4)
  {
    out_token = 0;
    v5 = (const char *)objc_msgSend(CFSTR("Eval"), "UTF8String");
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__RTDeviceLocationPredictor__setupEvalMode__block_invoke;
    v7[3] = &unk_1E92A17A8;
    v7[4] = self;
    notify_register_dispatch(v5, &out_token, v6, v7);

    -[RTDeviceLocationPredictor _updateEvalMode](self, "_updateEvalMode");
  }
}

uint64_t __43__RTDeviceLocationPredictor__setupEvalMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEvalMode");
}

- (void)_updateEvalMode
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[RTDeviceLocationPredictor setEvalPredictedLocationsOfInterest:](self, "setEvalPredictedLocationsOfInterest:", 0);
  -[RTDeviceLocationPredictor setEvalPredictedExitDates:](self, "setEvalPredictedExitDates:", 0);
  -[RTDeviceLocationPredictor platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "internalInstall");

  if (v4)
  {
    -[RTDeviceLocationPredictor defaultsManager](self, "defaultsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("Eval"));
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v15);

    v8 = (void *)v15;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("RTPredictedLocationsOfInterest"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTDeviceLocationPredictor setEvalPredictedLocationsOfInterest:](self, "setEvalPredictedLocationsOfInterest:", v11);

        }
        v12 = MEMORY[0x1E0C809B0];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke;
        v17[3] = &unk_1E92A17D0;
        v17[4] = self;
        objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);
        objc_msgSend(v9, "objectForKey:", CFSTR("RTPredictedExitDates"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)objc_opt_new();
          -[RTDeviceLocationPredictor setEvalPredictedExitDates:](self, "setEvalPredictedExitDates:", v14);

        }
        v16[0] = v12;
        v16[1] = 3221225472;
        v16[2] = __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke_120;
        v16[3] = &unk_1E92A17D0;
        v16[4] = self;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

      }
      v8 = (void *)v15;
    }

  }
}

void __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_semaphore_t v26;
  id v27;
  objc_class *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  dispatch_time_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  char v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD v104[4];
  NSObject *v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  id *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  void *v120;
  _BYTE buf[12];
  __int16 v122;
  id v123;
  _QWORD v124[4];

  v124[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_32;
  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Latitude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("Longitude"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("Uncertainty"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("Confidence"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("Type"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");

  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("TypeSource"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v24, "integerValue");

  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("MapItemAddress"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = 0;
  v115 = (id *)&v114;
  v116 = 0x3032000000;
  v117 = __Block_byref_object_copy__103;
  v118 = __Block_byref_object_dispose__103;
  v119 = 0;
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__103;
  v112 = __Block_byref_object_dispose__103;
  v113 = 0;
  v26 = dispatch_semaphore_create(0);
  v27 = objc_alloc(MEMORY[0x1E0D183F8]);
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_msgSend(v27, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v29);

  v30 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke_2;
  v104[3] = &unk_1E9296EE0;
  v106 = &v114;
  v107 = &v108;
  v31 = v26;
  v105 = v31;
  objc_msgSend(v30, "fetchMapItemsFromAddressString:options:handler:", v101, v102, v104);
  v32 = v31;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v32, v34))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "timeIntervalSinceDate:", v33);
  v37 = v36;
  v38 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_330);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "filteredArrayUsingPredicate:", v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "submitToCoreAnalytics:type:duration:", v42, 1, v37);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v44 = (void *)MEMORY[0x1E0CB35C8];
  v124[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v124, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = objc_retainAutorelease(v46);

    v48 = 0;
  }
  else
  {
LABEL_7:
    v47 = 0;
    v48 = 1;
  }

  v97 = v47;
  if ((v48 & 1) == 0)
    objc_storeStrong(v115 + 5, v47);
  if (v115[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = objc_msgSend((id)v109[5], "count");
      v51 = v115[5];
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v50;
      v122 = 2112;
      v123 = v51;
      _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "error geocoding eval mapItems, %lu, error, %@", buf, 0x16u);
    }

  }
  objc_msgSend(v2, "objectForKey:", CFSTR("RTLocationOfInterest"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKey:", CFSTR("CustomLabel"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v7, v11, v15);
  v54 = objc_alloc(MEMORY[0x1E0D183C0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v109[5], "firstObject");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v54, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v53, v55, v22, v98, 0, v100, v19, v56);

  objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceCoreRoutineLearnedLocation"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
    goto LABEL_15;
  objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceCoreRoutineVehicleEvent"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    v61 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "initWithLatitude:longitude:horizontalUncertainty:date:", v62, v7, v11, v15);

    v64 = objc_alloc(MEMORY[0x1E0D18570]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v95) = 1;
    v67 = (void *)objc_msgSend(v64, "initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:", v65, v63, CFSTR("el camino"), 0, CFSTR("You got a fast car. Is it fast enough so we can fly away?"), v66, 0, 0, v95);

    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184A0]), "initWithVehicleEvent:", v67);
    goto LABEL_20;
  }
  objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceEventKit"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceEventKit"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKey:", CFSTR("EventTitle"));
    v63 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceEventKit"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "objectForKey:", CFSTR("EventLocation"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v96 = objc_alloc(MEMORY[0x1E0D184A8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "UUIDString");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 7200.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v96, "initWithEventIdentifier:startDate:endDate:title:location:allDay:sharingStatus:", v72, v73, v74, v63, v71, 0, 0);

    goto LABEL_20;
  }
  objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceMapsSupportFavoritePlace"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v86)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceMapsSupportHistoryEntryRoute"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (v87)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceMapsSupportHistoryEntryRoute"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "objectForKey:", CFSTR("NavigationWasInterrupted"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v89, "BOOLValue");

      v91 = objc_alloc(MEMORY[0x1E0D184C8]);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 900.0);
      v63 = objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v91, "initWithUsageDate:navigationWasInterrupted:", v63, v90);
    }
    else
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("RTSourceMapsSupportHistoryEntryPlaceDisplay"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v93)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v2;
          _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "unsupported eval ploi, %@", buf, 0xCu);
        }
        v59 = 0;
        goto LABEL_20;
      }
      v94 = objc_alloc(MEMORY[0x1E0D184C0]);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -900.0);
      v63 = objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v94, "initWithUsageDate:", v63);
    }
    v59 = (void *)v92;
LABEL_20:

    goto LABEL_21;
  }
LABEL_15:
  v59 = (void *)objc_opt_new();
LABEL_21:
  objc_msgSend(v2, "objectForKey:", CFSTR("Confidence"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "doubleValue");
  v77 = v76;

  objc_msgSend(v2, "objectForKey:", CFSTR("NextEntryTime"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "doubleValue");
  v80 = v79;

  if (v80 <= 0.0)
  {
    v81 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v82 = objc_alloc(MEMORY[0x1E0D18450]);
  if (v59)
  {
    v120 = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v83 = 0;
  }
  v84 = (void *)objc_msgSend(v82, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v57, v81, 0, v83, v77);
  if (v59)

  if (v84)
  {
    objc_msgSend(*(id *)(a1 + 32), "evalPredictedLocationsOfInterest");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addObject:", v84);

  }
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(&v114, 8);
LABEL_32:

}

void __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke_120(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("ExitDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  if (v6 <= 0.0)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("Uncertainty"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v3, "objectForKey:", CFSTR("Confidence"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = (void *)v16;
  if (v16)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18448]), "initWithDate:uncertainty:confidence:", v16, v9, v12);
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "evalPredictedExitDates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v14);

    }
    v13 = (void *)v16;
  }

}

- (void)_onAuthorizationNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[RTDeviceLocationPredictor setRoutineEnabled:](self, "setRoutineEnabled:", objc_msgSend(v5, "enabled"));
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[RTDeviceLocationPredictor routineEnabled](self, "routineEnabled");
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Updated routine enabled %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

- (void)_onLearnedLocationManagerNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[RTDeviceLocationPredictor learnedLocationManager](self, "learnedLocationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__RTDeviceLocationPredictor__onLearnedLocationManagerNotification___block_invoke;
    v13[3] = &unk_1E929C008;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v9, "fetchRecentLocationsOfInterestWithHandler:", v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", buf, 0x16u);

    }
  }

}

void __67__RTDeviceLocationPredictor__onLearnedLocationManagerNotification___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __67__RTDeviceLocationPredictor__onLearnedLocationManagerNotification___block_invoke_2;
  block[3] = &unk_1E9299D78;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __67__RTDeviceLocationPredictor__onLearnedLocationManagerNotification___block_invoke_2(uint64_t a1)
{
  RTStateModel *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  RTStateModel *v6;

  v2 = [RTStateModel alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metricManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTStateModel initWithLearnedLocationsOfInterest:metricManager:queue:](v2, "initWithLearnedLocationsOfInterest:metricManager:queue:", v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 48), "intervalSinceLastUpdate");
  -[RTStateModel collectMetricsWithIntervalSinceLastUpdate:](v6, "collectMetricsWithIntervalSinceLastUpdate:");

}

- (void)onAuthorizationNotification:(id)a3
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
  v7[2] = __57__RTDeviceLocationPredictor_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__RTDeviceLocationPredictor_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onAuthorizationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)onLearnedLocationManagerNotification:(id)a3
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
  v7[2] = __66__RTDeviceLocationPredictor_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __66__RTDeviceLocationPredictor_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (RTNextPredictedLocationsOfInterestCache)nextPredictedLocationsOfInterestCache
{
  return self->_nextPredictedLocationsOfInterestCache;
}

- (void)setNextPredictedLocationsOfInterestCache:(id)a3
{
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterestCache, a3);
}

- (BOOL)encryptedDataAvailabilityNotificationNeeded
{
  return self->_encryptedDataAvailabilityNotificationNeeded;
}

- (void)setEncryptedDataAvailabilityNotificationNeeded:(BOOL)a3
{
  self->_encryptedDataAvailabilityNotificationNeeded = a3;
}

- (BOOL)pendingNextPredictedLocationsOfInterestRequest
{
  return self->_pendingNextPredictedLocationsOfInterestRequest;
}

- (void)setPendingNextPredictedLocationsOfInterestRequest:(BOOL)a3
{
  self->_pendingNextPredictedLocationsOfInterestRequest = a3;
}

- (OS_dispatch_source)nextPredictedLocationsOfInterestPollLocationTimer
{
  return self->_nextPredictedLocationsOfInterestPollLocationTimer;
}

- (void)setNextPredictedLocationsOfInterestPollLocationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterestPollLocationTimer, a3);
}

- (NSArray)nextPredictedLocationsOfInterest
{
  return self->_nextPredictedLocationsOfInterest;
}

- (void)setNextPredictedLocationsOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterest, a3);
}

- (double)nextPredictedLocationsOfInterestProcessInterval
{
  return self->_nextPredictedLocationsOfInterestProcessInterval;
}

- (void)setNextPredictedLocationsOfInterestProcessInterval:(double)a3
{
  self->_nextPredictedLocationsOfInterestProcessInterval = a3;
}

- (double)nextPredictedLocationsOfInterestPollLocationInterval
{
  return self->_nextPredictedLocationsOfInterestPollLocationInterval;
}

- (void)setNextPredictedLocationsOfInterestPollLocationInterval:(double)a3
{
  self->_nextPredictedLocationsOfInterestPollLocationInterval = a3;
}

- (NSMutableArray)evalPredictedLocationsOfInterest
{
  return self->_evalPredictedLocationsOfInterest;
}

- (void)setEvalPredictedLocationsOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_evalPredictedLocationsOfInterest, a3);
}

- (NSMutableArray)evalPredictedExitDates
{
  return self->_evalPredictedExitDates;
}

- (void)setEvalPredictedExitDates:(id)a3
{
  objc_storeStrong((id *)&self->_evalPredictedExitDates, a3);
}

- (NSSet)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
  objc_storeStrong((id *)&self->_providers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_evalPredictedExitDates, 0);
  objc_storeStrong((id *)&self->_evalPredictedLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterestPollLocationTimer, 0);
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterestCache, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
}

@end
