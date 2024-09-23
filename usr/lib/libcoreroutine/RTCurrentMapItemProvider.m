@implementation RTCurrentMapItemProvider

- (RTCurrentMapItemProvider)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFingerprintManager_locationManager_mapServiceManager_wifiManager_);
}

- (RTCurrentMapItemProvider)initWithFingerprintManager:(id)a3 locationManager:(id)a4 mapServiceManager:(id)a5 wifiManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RTCurrentMapItemProvider *v15;
  RTCurrentMapItemProvider *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id obj;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]";
      v32 = 1024;
      v33 = 121;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprintManager (in %s:%d)", buf, 0x12u);
    }

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_17:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]";
        v32 = 1024;
        v33 = 123;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
      }

      if (v14)
        goto LABEL_5;
      goto LABEL_20;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]";
    v32 = 1024;
    v33 = 122;
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
  }

  if (!v13)
    goto LABEL_17;
LABEL_4:
  if (v14)
  {
LABEL_5:
    v15 = 0;
    if (v11 && v12 && v13)
    {
      v29.receiver = self;
      v29.super_class = (Class)RTCurrentMapItemProvider;
      v16 = -[RTCurrentMapItemProvider init](&v29, sel_init);
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v16);
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v28 = a6;
        v18 = (const char *)objc_msgSend(v17, "UTF8String");
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        obj = a5;
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = dispatch_queue_create(v18, v19);
        queue = v16->_queue;
        v16->_queue = (OS_dispatch_queue *)v20;

        objc_storeStrong((id *)&v16->_fingerprintManager, a3);
        objc_storeStrong((id *)&v16->_locationManager, a4);
        objc_storeStrong((id *)&v16->_mapServiceManager, obj);
        objc_storeStrong((id *)&v16->_wifiManager, v28);
      }
      self = v16;
      v15 = self;
    }
    goto LABEL_23;
  }
LABEL_20:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]";
    v32 = 1024;
    v33 = 124;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager (in %s:%d)", buf, 0x12u);
  }

  v15 = 0;
LABEL_23:

  return v15;
}

+ (id)convertMapItemsToPredictedLocationsOfInterest:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  RTLearnedPlace *v9;
  void *v10;
  void *v11;
  void *v12;
  RTLearnedPlace *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  RTLearnedLocation *v21;
  RTLearnedLocationOfInterest *v22;
  void *v23;
  RTLearnedLocationOfInterest *v24;
  void *v25;
  void *v26;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
        v9 = [RTLearnedPlace alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v9, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v10, 0, 0, v8, 0, v11, v12);

        v14 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(v8, "location");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "latitude");
        v17 = v16;
        objc_msgSend(v8, "location");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "longitude");
        v20 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v17, v19, 100.0);

        v21 = -[RTLearnedLocation initWithLocation:dataPointCount:type:]([RTLearnedLocation alloc], "initWithLocation:dataPointCount:type:", v20, 0, 2);
        v22 = [RTLearnedLocationOfInterest alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v22, "initWithIdentifier:location:place:visits:transitions:", v23, v21, v13, 0, 0);

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLearnedLocationOfInterest:", v24);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18450]), "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v25, 0, 0, 0, 0.0);
        objc_msgSend(v29, "addObject:", v26);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v5);
  }

  return v29;
}

+ (void)logMapItems:(id)a3 prestring:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v6;
      v25 = 2048;
      v26 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@ %lu RTMapItems", buf, 0x16u);
    }
    v16 = v6;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            ++v11;
            *(_DWORD *)buf = 134218242;
            v24 = v11;
            v25 = 2112;
            v26 = v14;
            _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "RTMapItem %lu, %@", buf, 0x16u);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v6 = v16;
    v5 = v17;
  }

}

+ (void)logPredictedLocationsOfInterest:(id)a3 prestring:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v6;
      v25 = 2048;
      v26 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@ %lu RTPredictedLocationsOfInterest", buf, 0x16u);
    }
    v16 = v6;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            ++v11;
            *(_DWORD *)buf = 134218242;
            v24 = v11;
            v25 = 2112;
            v26 = v14;
            _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "RTPredictedLocationOfInterest %lu, %@", buf, 0x16u);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v6 = v16;
    v5 = v17;
  }

}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  RTLocationManager *locationManager;
  void *v5;
  RTWiFiManager *wifiManager;
  void *v7;
  RTWiFiManager *v8;
  id v9;

  if (self->_registeredForNotifications != a3)
  {
    self->_registeredForNotifications = a3;
    locationManager = self->_locationManager;
    if (a3)
    {
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](locationManager, "addObserver:selector:name:", self, sel_onLocationNotification_, v5);

      wifiManager = self->_wifiManager;
      +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](wifiManager, "addObserver:selector:name:", self, sel_onWiFiScanNotification_);
    }
    else
    {
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier removeObserver:fromNotification:](locationManager, "removeObserver:fromNotification:", self, v7);

      v8 = self->_wifiManager;
      +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier removeObserver:fromNotification:](v8, "removeObserver:fromNotification:", self);
    }

  }
}

- (id)_filterLocations:(id)a3
{
  return a3;
}

- (id)_filterWiFiAccessPoints:(id)a3
{
  return a3;
}

- (id)_pickMinimumHorizontalUncertainty:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "horizontalUncertainty");
        if (v10 > 0.0)
        {
          if (v6)
          {
            objc_msgSend(v9, "horizontalUncertainty");
            v12 = v11;
            objc_msgSend(v6, "horizontalUncertainty");
            if (v12 < v13)
            {
              v14 = v9;

              v6 = v14;
            }
          }
          else
          {
            v6 = v9;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_fetchCurrentMapItemsLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__RTCurrentMapItemProvider__fetchCurrentMapItemsLookingBack_lookingAhead_handler___block_invoke;
  v11[3] = &unk_1E929E9A8;
  v12 = v8;
  v9 = v8;
  v10 = (void *)MEMORY[0x1D8232094](v11);
  -[RTCurrentMapItemProvider _performBluePOIQueryLookingBack:lookingAhead:handler:](self, "_performBluePOIQueryLookingBack:lookingAhead:handler:", v10, a3, a4);

}

uint64_t __82__RTCurrentMapItemProvider__fetchCurrentMapItemsLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCurrentMapItemsLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  double v13;
  double v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v8)
  {
    -[RTCurrentMapItemProvider queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__RTCurrentMapItemProvider_fetchCurrentMapItemsLookingBack_lookingAhead_handler___block_invoke;
    v11[3] = &unk_1E9299248;
    v11[4] = self;
    v13 = a3;
    v14 = a4;
    v12 = v8;
    dispatch_async(v9, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTCurrentMapItemProvider fetchCurrentMapItemsLookingBack:lookingAhead:handler:]";
      v17 = 1024;
      v18 = 315;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __81__RTCurrentMapItemProvider_fetchCurrentMapItemsLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentMapItemsLookingBack:lookingAhead:handler:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *futureLocations;
  NSMutableArray *v22;
  NSMutableArray *futureAccessPoints;
  NSObject *v24;
  void *v25;
  void *v26;
  RTLocationManager *locationManager;
  uint64_t v28;
  NSObject *v29;
  RTFingerprintManager *fingerprintManager;
  NSObject *v31;
  dispatch_time_t v32;
  NSObject *v33;
  id v34;
  id v35;
  NSObject *v36;
  _QWORD block[4];
  NSObject *v38;
  RTCurrentMapItemProvider *v39;
  id v40;
  id v41;
  id v42;
  _BYTE *v43;
  _QWORD *v44;
  _QWORD v45[5];
  NSObject *v46;
  _QWORD *v47;
  _QWORD v48[5];
  NSObject *v49;
  _BYTE *v50;
  _QWORD v51[5];
  id v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v8)
  {
    if (a3 < 0.0 || a4 < 0.0)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requires nonnegative numbers for backwardsSeconds and forwardsSeconds"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, 0, v17);

    }
    else if (-[RTCurrentMapItemProvider registeredForNotifications](self, "registeredForNotifications"))
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v57 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is busy"), self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, 0, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingTimeInterval:", -a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      futureLocations = self->_futureLocations;
      self->_futureLocations = v20;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      futureAccessPoints = self->_futureAccessPoints;
      self->_futureAccessPoints = v22;

      -[RTCurrentMapItemProvider setRegisteredForNotifications:](self, "setRegisteredForNotifications:", 1);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v54 = __Block_byref_object_copy__74;
      v55 = __Block_byref_object_dispose__74;
      v56 = 0;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x3032000000;
      v51[3] = __Block_byref_object_copy__74;
      v51[4] = __Block_byref_object_dispose__74;
      v52 = 0;
      v24 = dispatch_group_create();
      dispatch_group_enter(v24);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v19, v18);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v25, 199, 0, 199.0);
      locationManager = self->_locationManager;
      v28 = MEMORY[0x1E0C809B0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke;
      v48[3] = &unk_1E9297C38;
      v48[4] = self;
      v50 = buf;
      v29 = v24;
      v49 = v29;
      -[RTLocationManager fetchStoredLocationsWithOptions:handler:](locationManager, "fetchStoredLocationsWithOptions:handler:", v26, v48);
      dispatch_group_enter(v29);
      fingerprintManager = self->_fingerprintManager;
      v45[0] = v28;
      v45[1] = 3221225472;
      v45[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_3;
      v45[3] = &unk_1E9297C38;
      v45[4] = self;
      v47 = v51;
      v31 = v29;
      v46 = v31;
      -[RTFingerprintManager fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:](fingerprintManager, "fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:", v19, v18, 2, v45);
      v32 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      -[RTCurrentMapItemProvider queue](self, "queue");
      v33 = objc_claimAutoreleasedReturnValue();
      block[0] = v28;
      block[1] = 3221225472;
      block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_5;
      block[3] = &unk_1E929EA70;
      v38 = v31;
      v39 = self;
      v43 = buf;
      v44 = v51;
      v40 = v19;
      v41 = v18;
      v42 = v8;
      v34 = v18;
      v35 = v19;
      v36 = v31;
      dispatch_after(v32, v33, block);

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTCurrentMapItemProvider _performBluePOIQueryLookingBack:lookingAhead:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 338;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_2;
  block[3] = &unk_1E929E9D0;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v12 = objc_alloc(MEMORY[0x1E0D183B0]);
        v13 = (void *)objc_msgSend(v12, "initWithCLLocation:", v10, (_QWORD)v14);
        objc_msgSend(v11, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_4;
  block[3] = &unk_1E929E9D0;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "accessPoints", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  __int128 v9;

  v2 = *(NSObject **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_6;
  v5[3] = &unk_1E929EA48;
  v4 = *(void **)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[1] = 3221225472;
  v9 = *(_OWORD *)(a1 + 72);
  v6 = v4;
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  dispatch_group_notify(v2, v3, v5);

}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_6(uint64_t a1)
{
  id *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  _QWORD *v35;
  _QWORD v36[5];
  NSObject *v37;
  _BYTE *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  const __CFString *v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setRegisteredForNotifications:", 0);
  v3 = *(id *)(*((_QWORD *)v2[4] + 1) + 40);
  v4 = *(id *)(*((_QWORD *)v2[5] + 1) + 40);
  objc_msgSend(v3, "addObjectsFromArray:", *((_QWORD *)*v2 + 7));
  objc_msgSend(v4, "addObjectsFromArray:", *((_QWORD *)*v2 + 8));
  v5 = (void *)*((_QWORD *)*v2 + 7);
  *((_QWORD *)*v2 + 7) = 0;

  v6 = (void *)*((_QWORD *)*v2 + 8);
  *((_QWORD *)*v2 + 8) = 0;

  v29 = v3;
  objc_msgSend(*v2, "_filterLocations:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "_filterWiFiAccessPoints:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v10 = v7;
  v11 = v8;
  logArrayRTLocations(CFSTR("Preprocessed Locations"), v29);
  logArrayRTWiFiAccessPoints(CFSTR("Preprocessed Access Points"), v9);
  v28 = v9;

  logArrayRTLocations(CFSTR("Processed Locations"), v10);
  logArrayRTWiFiAccessPoints(CFSTR("Processed Access Points"), v11);

  objc_msgSend(*v2, "_pickMinimumHorizontalUncertainty:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = CFSTR("Reference Location:");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);
    }

  }
  if (v12)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v14, "addObject:", v12);
    objc_msgSend(v14, "addObjectsFromArray:", v10);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__74;
    v46 = __Block_byref_object_dispose__74;
    v47 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__74;
    v40[4] = __Block_byref_object_dispose__74;
    v41 = 0;
    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_7;
    v36[3] = &unk_1E92995B0;
    v36[4] = *(_QWORD *)(a1 + 32);
    v38 = buf;
    v39 = v40;
    v16 = v15;
    v37 = v16;
    v17 = (void *)MEMORY[0x1D8232094](v36);
    v18 = objc_alloc(MEMORY[0x1E0D183F8]);
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v20);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "fetchMapItemsFromLocations:accessPoints:startDate:endDate:options:handler:", v14, v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v21, v17);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_9;
    block[3] = &unk_1E929EA20;
    v31 = v14;
    v33 = *(id *)(a1 + 56);
    v32 = v11;
    v34 = buf;
    v35 = v40;
    v23 = v14;
    dispatch_group_notify(v16, v22, block);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v24 = *(_QWORD *)(a1 + 56);
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = CFSTR("Nil reference location.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v24 + 16))(v24, 0, 0, 0, v27);

  }
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_8;
  block[3] = &unk_1E929E9F8;
  v16 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_9(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        v10 = (void *)objc_msgSend(v9, "initWithRTLocation:", v8, (_QWORD)v11);
        objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  double v13;
  double v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v8)
  {
    -[RTCurrentMapItemProvider queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__RTCurrentMapItemProvider_performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke;
    v11[3] = &unk_1E9299248;
    v11[4] = self;
    v13 = a3;
    v14 = a4;
    v12 = v8;
    dispatch_async(v9, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTCurrentMapItemProvider performBluePOIQueryLookingBack:lookingAhead:handler:]";
      v17 = 1024;
      v18 = 479;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __80__RTCurrentMapItemProvider_performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performBluePOIQueryLookingBack:lookingAhead:handler:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)onLocationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTCurrentMapItemProvider *v9;

  v4 = a3;
  -[RTCurrentMapItemProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RTCurrentMapItemProvider_onLocationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__RTCurrentMapItemProvider_onLocationNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if (v4)
  {
    v5 = *(id *)(a1 + 32);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSObject locations](v5, "locations", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
          objc_msgSend(v11, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v8);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unhandled notification, %@", buf, 0xCu);

    }
  }

}

- (void)onWiFiScanNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTCurrentMapItemProvider *v9;

  v4 = a3;
  -[RTCurrentMapItemProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RTCurrentMapItemProvider_onWiFiScanNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__RTCurrentMapItemProvider_onWiFiScanNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    v7 = v5;
    objc_msgSend(v7, "scanResults");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:");

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unhandled notification, %@", buf, 0xCu);

    }
  }
}

- (void)shutdown
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  void *v13;
  _QWORD block[6];
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__74;
  v15[4] = __Block_byref_object_dispose__74;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");
  v16 = (id)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  -[RTCurrentMapItemProvider queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__RTCurrentMapItemProvider_shutdown__block_invoke;
  block[3] = &unk_1E92977E0;
  block[4] = self;
  block[5] = v15;
  dispatch_async(v10, block);

  _Block_object_dispose(v15, 8);
}

void __36__RTCurrentMapItemProvider_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_shutdown");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)_shutdown
{
  -[RTCurrentMapItemProvider setRegisteredForNotifications:](self, "setRegisteredForNotifications:", 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (NSMutableArray)futureLocations
{
  return self->_futureLocations;
}

- (NSMutableArray)futureAccessPoints
{
  return self->_futureAccessPoints;
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureAccessPoints, 0);
  objc_storeStrong((id *)&self->_futureLocations, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
