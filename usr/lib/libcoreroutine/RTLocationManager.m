@implementation RTLocationManager

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  -[RTLocationManager locationManager:didUpdateLocations:completion:](self, "locationManager:didUpdateLocations:completion:", a3, a4, &__block_literal_global_59);
}

+ (id)vendedClasses
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)vendedClasses_vendedClasses_1;
  if (!vendedClasses_vendedClasses_1)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    v4 = (void *)vendedClasses_vendedClasses_1;
    vendedClasses_vendedClasses_1 = v3;

    v2 = (void *)vendedClasses_vendedClasses_1;
  }
  return v2;
}

- (void)shouldMonitorLocations
{
  void *v3;
  unint64_t v4;
  double v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  NSString *locationBundlePathShortname;
  const __CFString *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  RTPowerAssertion *v21;
  NSObject *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BYTE v29[22];
  __int16 v30;
  double v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3);

  if (v4)
  {
    v5 = *MEMORY[0x1E0C9E490];
    v6 = 1;
    v7 = 2;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9E4A8];
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v8);

    v6 = v9 != 0;
    v7 = 1;
  }
  -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[RTLocationManager _activeLocationRequestsMinDesiredAccuracy](self, "_activeLocationRequestsMinDesiredAccuracy");
    if (v5 >= v12)
      v5 = v12;
    v6 = 1;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    v15 = CFSTR("NO");
    *(_QWORD *)&v29[4] = "-[RTLocationManager shouldMonitorLocations]";
    *(_DWORD *)v29 = 136315906;
    if (v6)
      v15 = CFSTR("YES");
    *(_WORD *)&v29[12] = 2112;
    *(_QWORD *)&v29[14] = locationBundlePathShortname;
    v30 = 2048;
    v31 = v5;
    v32 = 2112;
    v33 = v15;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, %@, desiredAccuracy, %.2f, shouldMonitor, %@", v29, 0x2Au);
  }

  -[RTLocationManager locationManager](self, "locationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "desiredAccuracy");
  v18 = v17;

  if (v5 != v18)
  {
    -[RTLocationManager locationManager](self, "locationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDesiredAccuracy:", v5);

  }
  -[RTLocationManager powerAssertion](self, "powerAssertion", *(_OWORD *)v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v20)
      goto LABEL_22;
    v21 = -[RTPowerAssertion initWithIdentifier:timeout:]([RTPowerAssertion alloc], "initWithIdentifier:timeout:", CFSTR("com.apple.routined.location"), 20.0);
    -[RTLocationManager setPowerAssertion:](self, "setPowerAssertion:", v21);

    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = self->_locationBundlePathShortname;
      -[RTLocationManager powerAssertion](self, "powerAssertion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 138412546;
      *(_QWORD *)&v29[4] = v23;
      *(_WORD *)&v29[12] = 1024;
      *(_DWORD *)&v29[14] = v24 != 0;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, Taking power assertion, success, %d", v29, 0x12u);

    }
  }
  else
  {
    if (!v20)
      goto LABEL_22;
    -[RTLocationManager setPowerAssertion:](self, "setPowerAssertion:", 0);
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v25 = self->_locationBundlePathShortname;
      *(_DWORD *)v29 = 138412290;
      *(_QWORD *)&v29[4] = v25;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, Releasing power assertion", v29, 0xCu);
    }
  }

LABEL_22:
  -[RTLocationManager locationManager](self, "locationManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "activityType");

  if (v7 != v27)
  {
    -[RTLocationManager locationManager](self, "locationManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActivityType:", v7);

  }
  -[RTLocationManager setMonitoringLocations:](self, "setMonitoringLocations:", v6);
}

void __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  char v6;
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
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  RTLocationManagerNotificationLocationsLeeched *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  RTLocationManagerNotificationLocationsAccuracyHundredMeters *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  RTLocationManagerNotificationLocationsAccuracyBest *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  _QWORD v47[5];

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "locationManagerRoutine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "locationManagerRoutine");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqual:", v1))
      {

        goto LABEL_11;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "locationManagerRoutine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

      if (v3)
      {

      }
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "_considerInUse");
      if (v3)
      {

      }
      if ((v6 & 1) != 0)
      {
LABEL_11:
        v7 = MEMORY[0x1E0C809B0];
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_2;
        v47[3] = &unk_1E929A988;
        v8 = *(void **)(a1 + 32);
        v47[4] = *(_QWORD *)(a1 + 40);
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v47);
        objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingComparator:", &__block_literal_global_126);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "preprocessLocationsForStorage:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v44[0] = v7;
        v44[1] = 3221225472;
        v44[2] = __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_2_127;
        v44[3] = &unk_1E929B1E0;
        v11 = *(void **)(a1 + 32);
        v12 = *(void **)(a1 + 40);
        v46 = *(_QWORD *)(a1 + 64);
        v44[4] = v12;
        v45 = v11;
        objc_msgSend(v12, "_storeLocations:handler:", v10, v44);
        v43[0] = v7;
        v43[1] = 3221225472;
        v43[2] = __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_128;
        v43[3] = &unk_1E929A988;
        v43[4] = *(_QWORD *)(a1 + 40);
        objc_msgSend(v10, "enumerateObjectsUsingBlock:", v43);
        objc_msgSend(v10, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timestamp");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "lastLocation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isOnOrAfter:", v16);

        if (v17)
        {
          objc_msgSend(v10, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setLastLocation:", v18);

        }
        v19 = *(void **)(a1 + 40);
        +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "getNumberOfObservers:", v20))
        {
          v21 = *(void **)(a1 + 40);
          +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v21, "getNumberOfObservers:", v22))
          {
            v40 = *(void **)(a1 + 40);
            +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v40, "getNumberOfObservers:", v41);

            if (!v42)
            {
LABEL_23:
              v38 = *(_QWORD *)(a1 + 56);
              if (v38)
                (*(void (**)(void))(v38 + 16))();

              return;
            }
LABEL_17:
            v23 = *(void **)(a1 + 40);
            +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "getNumberOfObservers:", v24);

            if (v25)
            {
              v26 = *(void **)(a1 + 40);
              v27 = -[RTLocationManagerNotificationLocationsLeeched initWithLocations:]([RTLocationManagerNotificationLocationsLeeched alloc], "initWithLocations:", v10);
              objc_msgSend(v26, "postNotification:", v27);

            }
            v28 = *(void **)(a1 + 40);
            +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v28, "getNumberOfObservers:", v29);

            if (v30)
            {
              v31 = *(void **)(a1 + 40);
              v32 = -[RTLocationManagerNotificationLocationsAccuracyHundredMeters initWithLocations:]([RTLocationManagerNotificationLocationsAccuracyHundredMeters alloc], "initWithLocations:", v10);
              objc_msgSend(v31, "postNotification:", v32);

            }
            v33 = *(void **)(a1 + 40);
            +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v33, "getNumberOfObservers:", v34);

            if (v35)
            {
              v36 = *(void **)(a1 + 40);
              v37 = -[RTLocationManagerNotificationLocationsAccuracyBest initWithLocations:]([RTLocationManagerNotificationLocationsAccuracyBest alloc], "initWithLocations:", v10);
              objc_msgSend(v36, "postNotification:", v37);

            }
            goto LABEL_23;
          }

        }
        goto LABEL_17;
      }
    }
  }
  v39 = *(_QWORD *)(a1 + 56);
  if (v39)
    (*(void (**)(void))(v39 + 16))();
}

- (CLLocationManagerRoutine)locationManagerRoutine
{
  return self->_locationManagerRoutine;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)_storeLocations:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSString *locationBundlePathShortname;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  NSString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("BypassPersistRawLocations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        locationBundlePathShortname = self->_locationBundlePathShortname;
        *(_DWORD *)buf = 138412290;
        v35 = locationBundlePathShortname;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, dropping leeched locations because override default is set.", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
  if (-[RTLocationManager persistingLocations](self, "persistingLocations"))
  {
    if (objc_msgSend(v7, "count"))
    {
      if (-[RTLocationManager locationStoreAvailable](self, "locationStoreAvailable"))
      {
        -[RTLocationManager locationStore](self, "locationStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __45__RTLocationManager__storeLocations_handler___block_invoke_121;
        v24[3] = &unk_1E9297568;
        v25 = v8;
        objc_msgSend(v13, "storeLocations:handler:", v7, v24);

        v14 = v25;
      }
      else
      {
        -[RTLocationManager dispatcher](self, "dispatcher");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __45__RTLocationManager__storeLocations_handler___block_invoke;
        v29[3] = &unk_1E9296F70;
        v29[4] = self;
        v30 = v7;
        v31 = v8;
        v26[0] = v20;
        v26[1] = 3221225472;
        v26[2] = __45__RTLocationManager__storeLocations_handler___block_invoke_2;
        v26[3] = &unk_1E9298E88;
        v26[4] = self;
        v28 = a2;
        v27 = v31;
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "enqueueBlock:failureBlock:description:", v29, v26, CFSTR("%@-%@"), v22, v23);

        v14 = v30;
      }

    }
    else if (v8)
    {
LABEL_13:
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    }
  }
  else if (v8)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v32 = *MEMORY[0x1E0CB2D50];
    v33 = CFSTR("Service has been disabled by user.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 2, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v18);

  }
}

- (BOOL)persistingLocations
{
  return self->_persistingLocations;
}

- (RTLocationStoreProtocol)locationStore
{
  return self->_locationStore;
}

- (BOOL)locationStoreAvailable
{
  return self->_locationStoreAvailable;
}

- (void)setLastLocation:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v15 = a3;
  -[CLLocation timestamp](self->_lastLocation, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "laterDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLLocation timestamp](self->_lastLocation, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    objc_msgSend(v15, "horizontalAccuracy");
    if (v10 >= 0.0)
    {
      objc_msgSend(v15, "horizontalAccuracy");
      if (v11 <= *MEMORY[0x1E0C9E4F8])
      {
        -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __37__RTLocationManager_setLastLocation___block_invoke;
          v16[3] = &unk_1E929E6E0;
          v16[4] = self;
          v17 = v15;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

          -[RTLocationManager _reviewActiveLocationRequests](self, "_reviewActiveLocationRequests");
        }
      }
    }
  }

}

- (id)preprocessLocationsForStorage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSString *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  NSString *v33;
  int v34;
  NSObject *v35;
  const char *v36;
  uint32_t v37;
  NSObject *v38;
  NSString *v39;
  int v40;
  objc_class *v41;
  void *v42;
  void *v43;
  NSString *locationBundlePathShortname;
  int v45;
  objc_class *v46;
  void *v47;
  void *v48;
  NSString *v49;
  int v50;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  id v59;
  RTLocationManager *v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[32];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _OWORD v76[2];
  uint8_t buf[32];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _OWORD v84[2];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61 = self;
  -[RTLocationManager effectiveLocationBundlePath](self, "effectiveLocationBundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("/System/Library/LocationBundles/Routine.bundle"));

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationManager effectiveLocationBundlePath](v61, "effectiveLocationBundlePath");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v53;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v54;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v55;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "%@, %@, bypassing preprocessor, effectiveLocationBundlePath, %@", buf, 0x20u);

    }
    goto LABEL_10;
  }
  -[RTLocationManager platform](v61, "platform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "internalInstall") & 1) == 0)
  {

    goto LABEL_12;
  }
  -[RTLocationManager defaultsManager](v61, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsLocationManagerBypassPreprocessor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!v10)
  {
LABEL_12:
    -[RTLocationManager trustedDate](v61, "trustedDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v59 = v4;
    v15 = v4;
    v64 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
    if (!v64)
      goto LABEL_40;
    v63 = *(_QWORD *)v66;
    v62 = *MEMORY[0x1E0C9E518];
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v66 != v63)
          objc_enumerationMutation(v15);
        v17 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v16);
        _rt_log_facility_get_os_log(RTLogFacilityLocation);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          locationBundlePathShortname = v61->_locationBundlePathShortname;
          v45 = objc_msgSend(v17, "integrity");
          *(_DWORD *)buf = 138413315;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v43;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = locationBundlePathShortname;
          LOWORD(v78) = 2112;
          *(_QWORD *)((char *)&v78 + 2) = v17;
          WORD5(v78) = 1025;
          HIDWORD(v78) = v45;
          _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "%@,%@, %@, processing location, %@, integrity %{private}d", buf, 0x30u);

        }
        objc_msgSend(v17, "sourceInformation");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19
          || (v20 = (void *)v19,
              objc_msgSend(v17, "sourceInformation"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v21, "isSimulatedBySoftware"),
              v21,
              v20,
              !v22))
        {
          v25 = v17;
          v26 = v25;
          if (v14
            && (-[NSObject timestamp](v25, "timestamp"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v14, "timeIntervalSinceDate:", v27),
                v29 = fabs(v28),
                v27,
                v29 <= 600.0))
          {
            _rt_log_facility_get_os_log(RTLogFacilityLocation);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              v46 = (objc_class *)objc_opt_class();
              NSStringFromClass(v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v61->_locationBundlePathShortname;
              v50 = -[NSObject integrity](v26, "integrity");
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v47;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v48;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v49;
              LOWORD(v78) = 2112;
              *(_QWORD *)((char *)&v78 + 2) = v26;
              WORD5(v78) = 1026;
              HIDWORD(v78) = v50;
              _os_log_debug_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEBUG, "%@,%@, %@, processed location, no integrity downgrade, %@, integrity, %{public}d.", buf, 0x30u);

            }
            v23 = v26;
          }
          else
          {
            v83 = 0u;
            memset(v84, 0, 28);
            v81 = 0u;
            v82 = 0u;
            v79 = 0u;
            v80 = 0u;
            v78 = 0u;
            memset(buf, 0, sizeof(buf));
            if (v26)
              -[NSObject clientLocation](v26, "clientLocation");
            LODWORD(v84[0]) = v62;
            v30 = objc_alloc(MEMORY[0x1E0C9E3B8]);
            v74 = v82;
            v75 = v83;
            v76[0] = v84[0];
            *(_OWORD *)((char *)v76 + 12) = *(_OWORD *)((char *)v84 + 12);
            v70 = v78;
            v71 = v79;
            v72 = v80;
            v73 = v81;
            *(_OWORD *)v69 = *(_OWORD *)buf;
            *(_OWORD *)&v69[16] = *(_OWORD *)&buf[16];
            v23 = objc_msgSend(v30, "initWithClientLocation:", v69);

            _rt_log_facility_get_os_log(RTLogFacilityLocation);
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            if (v14)
            {
              if (v32)
              {
                v33 = v61->_locationBundlePathShortname;
                v34 = -[NSObject integrity](v23, "integrity");
                *(_DWORD *)v69 = 138413058;
                *(_QWORD *)&v69[4] = v33;
                *(_WORD *)&v69[12] = 2112;
                *(_QWORD *)&v69[14] = v14;
                *(_WORD *)&v69[22] = 2112;
                *(_QWORD *)&v69[24] = v23;
                LOWORD(v70) = 1026;
                *(_DWORD *)((char *)&v70 + 2) = v34;
                v35 = v31;
                v36 = "%@, downgrading leeched location integrity because user-time to trusted-time offset is too large: "
                      "%@, %@, integrity, %{public}d.";
                v37 = 38;
                goto LABEL_35;
              }
            }
            else if (v32)
            {
              v39 = v61->_locationBundlePathShortname;
              v40 = -[NSObject integrity](v23, "integrity");
              *(_DWORD *)v69 = 138412802;
              *(_QWORD *)&v69[4] = v39;
              *(_WORD *)&v69[12] = 2112;
              *(_QWORD *)&v69[14] = v23;
              *(_WORD *)&v69[22] = 1026;
              *(_DWORD *)&v69[24] = v40;
              v35 = v31;
              v36 = "%@, downgrading leeched location integrity because trusted-time is unavailable, %@, integrity, %{public}d.";
              v37 = 28;
LABEL_35:
              _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEFAULT, v36, v69, v37);
            }

          }
          objc_msgSend(v13, "addObject:", v23);
          goto LABEL_38;
        }
        _rt_log_facility_get_os_log(RTLogFacilityLocation);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = v61->_locationBundlePathShortname;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v17;
          _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%@, dropping leeched location that is simulated by software, %@.", buf, 0x16u);
        }
LABEL_38:

        ++v16;
      }
      while (v64 != v16);
      v64 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
      if (!v64)
      {
LABEL_40:

        v4 = v59;
        goto LABEL_41;
      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v57;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v58;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = CFSTR("RTDefaultsLocationManagerBypassPreprocessor");
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, bypassing preprocessor, disable: defaults delete com.apple.routined %@", buf, 0x20u);

  }
LABEL_10:
  v13 = v4;
LABEL_41:

  return v13;
}

- (id)trustedDate
{
  return -[RTTrustedTimeCache getApproximateTrustedDateNowWithUnsecureFallback](self->_trustedTimeCache, "getApproximateTrustedDateNowWithUnsecureFallback");
}

- (void)setMonitoringLocations:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSString *locationBundlePathShortname;
  void *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_monitoringLocations != a3)
  {
    v3 = a3;
    self->_monitoringLocations = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        locationBundlePathShortname = self->_locationBundlePathShortname;
        -[RTLocationManager locationManager](self, "locationManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "desiredAccuracy");
        v12 = 138412546;
        v13 = locationBundlePathShortname;
        v14 = 2048;
        v15 = v9;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, start monitoring locations, desiredAccuracy, %f", (uint8_t *)&v12, 0x16u);

      }
      -[RTLocationManager locationManager](self, "locationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startUpdatingLocation");
    }
    else
    {
      if (v6)
      {
        v11 = self->_locationBundlePathShortname;
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, stop monitoring locations", (uint8_t *)&v12, 0xCu);
      }

      -[RTLocationManager locationManager](self, "locationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stopUpdatingLocation");
    }

  }
}

- (RTPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (double)_activeLocationRequestsMinDesiredAccuracy
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSString *locationBundlePathShortname;
  void *v7;
  int v8;
  uint64_t v9;
  double v10;
  _QWORD v12[5];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = (double *)&v13;
  v3 = *MEMORY[0x1E0C9E4F8];
  v15 = 0x2020000000;
  v16 = v3;
  -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__RTLocationManager__activeLocationRequestsMinDesiredAccuracy__block_invoke;
  v12[3] = &unk_1E929E730;
  v12[4] = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = *((_QWORD *)v14 + 3);
    *(_DWORD *)buf = 136315906;
    v18 = "-[RTLocationManager _activeLocationRequestsMinDesiredAccuracy]";
    v19 = 2112;
    v20 = locationBundlePathShortname;
    v21 = 1024;
    v22 = v8;
    v23 = 2048;
    v24 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, %@, #requests, %d, min desired accuracy, %.2f", buf, 0x26u);

  }
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  RTLocationManager *v18;
  id v19;
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke;
  block[3] = &unk_1E9297910;
  v17 = v10;
  v18 = self;
  v19 = v9;
  v20 = v11;
  v21 = a2;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(v12, block);

}

void __58__RTLocationManager__activeLocationRequestTimerExpiryDate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v12 = v3;
  if (!v4)
    goto LABEL_3;
  objc_msgSend(v3, "expiryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  v8 = v12;
  if (v7)
  {
LABEL_3:
    objc_msgSend(v12, "expiryDate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v8 = v12;
  }

}

void __62__RTLocationManager__activeLocationRequestsMinDesiredAccuracy__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(a2, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "desiredAccuracy");
  v6 = v5;

  if (v3 >= v6)
    v7 = v6;
  else
    v7 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
}

void __37__RTLocationManager_setLastLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isValidLocation:options:", v7, v8);

  if ((_DWORD)v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v10, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v17 = 136316162;
      v18 = "-[RTLocationManager setLastLocation:]_block_invoke";
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v10;
      v25 = 2048;
      v26 = v14;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, %@, delta, %.2f", (uint8_t *)&v17, 0x34u);

    }
    objc_msgSend(v5, "handler");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15[2](v15, *(_QWORD *)(a1 + 40), 0);

    objc_msgSend(*(id *)(a1 + 32), "currentLocationRequests");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectAtIndex:", a3);

  }
}

void __60__RTLocationManager_fetchCachedLocationWithOptions_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastLocation");
    v2 = objc_claimAutoreleasedReturnValue();
    if (!v2)
      goto LABEL_9;
    v3 = (void *)v2;
    v4 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "lastLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "isValidLocation:options:", v5, *(_QWORD *)(a1 + 40));

    if (!(_DWORD)v4)
      goto LABEL_9;
    objc_msgSend(*(id *)(a1 + 32), "lastLocation");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = 0;
    }
    else
    {
LABEL_9:
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
        *(_DWORD *)buf = 136315394;
        v26 = "-[RTLocationManager fetchCachedLocationWithOptions:handler:]_block_invoke";
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, %@, doesn't have a valid cached location", buf, 0x16u);
      }

      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18598];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no cached location"), *MEMORY[0x1E0CB2D50]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 6, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTLocationManager fetchCachedLocationWithOptions:handler:]_block_invoke";
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, %@, doesn't have location authorization", buf, 0x16u);
    }

    v11 = *(_QWORD *)(a1 + 48);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no authorization"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 2, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v14);

  }
}

+ (BOOL)isValidLocation:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  const __CFString *v20;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "horizontalAccuracy");
  if (v8 > 0.0
    && (objc_msgSend(v5, "horizontalAccuracy"), v10 = v9, objc_msgSend(v6, "horizontalAccuracy"), v10 <= v11))
  {
    objc_msgSend(v5, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "laterDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToDate:", v7))
    {
      objc_msgSend(v5, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v15);
      v17 = v16;
      objc_msgSend(v6, "maxAge");
      v12 = v17 <= v18;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = CFSTR("NO");
    v22 = 136315906;
    v23 = "+[RTLocationManager isValidLocation:options:]";
    if (v12)
      v20 = CFSTR("YES");
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v20;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%s, location, %@, options, %@, isValid, %@", (uint8_t *)&v22, 0x2Au);
  }

  return v12;
}

void __61__RTLocationManager_fetchCurrentLocationWithOptions_handler___block_invoke(id *a1)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  RTLocationManagerLocationRequest *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1[4], "enabled") & 1) != 0)
  {
    if (objc_msgSend(a1[5], "yieldLastLocation"))
    {
      v3 = a1[4];
      v2 = a1[5];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __61__RTLocationManager_fetchCurrentLocationWithOptions_handler___block_invoke_132;
      v16[3] = &unk_1E929E708;
      v16[4] = v3;
      v17 = v2;
      v18 = a1[6];
      objc_msgSend(v3, "fetchCachedLocationWithOptions:handler:", v17, v16);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *((_QWORD *)a1[4] + 7);
        *(_DWORD *)buf = 136315394;
        v22 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]_block_invoke";
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, %@, yieldLastLocation, NO, forwarding request to CL.", buf, 0x16u);
      }

      v14 = -[RTLocationManagerLocationRequest initWithOptions:handler:]([RTLocationManagerLocationRequest alloc], "initWithOptions:handler:", a1[5], a1[6]);
      objc_msgSend(a1[4], "currentLocationRequests");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v14);

      objc_msgSend(a1[4], "_reviewActiveLocationRequests");
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *((_QWORD *)a1[4] + 7);
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]_block_invoke";
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, %@, doesn't have location authorization", buf, 0x16u);
    }

    v6 = (void (**)(id, _QWORD, void *))a1[6];
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no authorization"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);

  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)fetchCachedLocationWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v11 = "Invalid parameter not satisfying: options";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v11 = "Invalid parameter not satisfying: handler";
    goto LABEL_10;
  }
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTLocationManager_fetchCachedLocationWithOptions_handler___block_invoke;
  block[3] = &unk_1E9299330;
  block[4] = self;
  v14 = v8;
  v13 = v6;
  dispatch_async(v9, block);

LABEL_8:
}

- (void)_reviewActiveLocationRequests
{
  NSObject *v3;
  NSString *locationBundlePathShortname;
  void *v5;
  RTTimer *activeLocationRequestTimer;
  RTTimer *v7;
  void *v8;
  BOOL v9;
  void *v10;
  RTTimerManager *timerManager;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  RTTimer *v17;
  RTTimer *v18;
  RTTimer *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v23 = "-[RTLocationManager _reviewActiveLocationRequests]";
    v24 = 2112;
    v25 = locationBundlePathShortname;
    v26 = 1024;
    v27 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, %@, #location requests, %d", buf, 0x1Cu);

  }
  activeLocationRequestTimer = self->_activeLocationRequestTimer;
  if (activeLocationRequestTimer)
  {
    -[RTTimer invalidate](activeLocationRequestTimer, "invalidate");
    v7 = self->_activeLocationRequestTimer;
    self->_activeLocationRequestTimer = 0;

  }
  -[RTLocationManager shouldMonitorLocations](self, "shouldMonitorLocations");
  -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") == 0;

  if (!v9)
  {
    -[RTLocationManager _activeLocationRequestTimerExpiryDate](self, "_activeLocationRequestTimerExpiryDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    timerManager = self->_timerManager;
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.activeLocationRequestTimer"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__RTLocationManager__reviewActiveLocationRequests__block_invoke;
    v20[3] = &unk_1E92983E8;
    objc_copyWeak(&v21, (id *)buf);
    -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", v15, v16, v20);
    v17 = (RTTimer *)objc_claimAutoreleasedReturnValue();
    v18 = self->_activeLocationRequestTimer;
    self->_activeLocationRequestTimer = v17;

    v19 = self->_activeLocationRequestTimer;
    objc_msgSend(v10, "timeIntervalSinceNow");
    -[RTTimer fireWithInterval:leeway:](v19, "fireWithInterval:leeway:");
    -[RTTimer resume](self->_activeLocationRequestTimer, "resume");
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);

  }
}

- (NSMutableArray)currentLocationRequests
{
  return self->_currentLocationRequests;
}

- (id)_activeLocationRequestTimerExpiryDate
{
  void *v3;
  NSObject *v4;
  NSString *locationBundlePathShortname;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__72;
  v16 = __Block_byref_object_dispose__72;
  v17 = 0;
  -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__RTLocationManager__activeLocationRequestTimerExpiryDate__block_invoke;
  v11[3] = &unk_1E929E730;
  v11[4] = &v12;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);

  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = v13[5];
    *(_DWORD *)buf = 136315906;
    v19 = "-[RTLocationManager _activeLocationRequestTimerExpiryDate]";
    v20 = 2112;
    v21 = locationBundlePathShortname;
    v22 = 1024;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, %@, #requests, %d, min expiryDate, %@", buf, 0x26u);

  }
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "type") == 13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_fault_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_FAULT, "%@, received location of LoiOverride type, location, %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)fetchCurrentLocationWithHandler:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    objc_msgSend((id)objc_opt_class(), "defaultLocationRequestOptions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[RTLocationManager fetchCurrentLocationWithOptions:handler:](self, "fetchCurrentLocationWithOptions:handler:", v5, v4);

  }
}

- (void)fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *locationBundlePathShortname;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: options";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: handler";
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 136315650;
    v18 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]";
    v19 = 2112;
    v20 = locationBundlePathShortname;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, %@, options, %@", buf, 0x20u);
  }

  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTLocationManager_fetchCurrentLocationWithOptions_handler___block_invoke;
  block[3] = &unk_1E9299330;
  block[4] = self;
  v16 = v8;
  v15 = v6;
  dispatch_async(v11, block);

LABEL_10:
}

+ (id)defaultLocationRequestOptions
{
  RTLocationRequestOptions *v2;

  v2 = [RTLocationRequestOptions alloc];
  return -[RTLocationRequestOptions initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:](v2, "initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:", 1, 0, *MEMORY[0x1E0C9E4A8], 100.0, 3.0, 30.0, 3000.0, 0.0);
}

+ (id)stringForRegionCallbackType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E929E888[a3 - 1];
}

- (RTLocationManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAuthorizationManager_defaultsManager_locationSmoother_locationStore_platform_routineLocationManager_timerManager_);
}

- (RTLocationManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 locationSmoother:(id)a5 locationStore:(id)a6 platform:(id)a7 routineLocationManager:(id)a8 timerManager:(id)a9
{
  return -[RTLocationManager initWithAuthorizationManager:defaultsManager:locationSmoother:locationStore:platform:routineLocationManager:timerManager:effectiveLocationBundlePath:](self, "initWithAuthorizationManager:defaultsManager:locationSmoother:locationStore:platform:routineLocationManager:timerManager:effectiveLocationBundlePath:", a3, a4, a5, a6, a7, a8, a9, CFSTR("/System/Library/LocationBundles/Routine.bundle"));
}

- (RTLocationManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 locationSmoother:(id)a5 locationStore:(id)a6 platform:(id)a7 routineLocationManager:(id)a8 timerManager:(id)a9 effectiveLocationBundlePath:(id)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  RTLocationManager *v20;
  RTLocationManager *v21;
  void *v22;
  uint64_t v23;
  NSString *locationBundlePathShortname;
  uint64_t v25;
  NSMutableArray *currentLocationRequests;
  RTInvocationDispatcher *v27;
  void *v28;
  uint64_t v29;
  RTInvocationDispatcher *dispatcher;
  RTInvocationDispatcher *v31;
  void *v32;
  uint64_t v33;
  RTInvocationDispatcher *regionEventDispatcher;
  uint64_t v35;
  NSMutableDictionary *regionEventHandlerDictionary;
  RTTrustedTimeCache *v37;
  RTTrustedTimeCache *trustedTimeCache;
  RTLocationManager *v39;
  RTLocationManager *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;
  uint8_t buf[16];

  v54 = a3;
  v16 = a4;
  v17 = a5;
  v55 = a6;
  v57 = a7;
  v53 = a8;
  v56 = a9;
  v18 = a10;
  if (!v16)
  {
    v42 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v40 = 0;
    v41 = v17;
    goto LABEL_19;
  }
  v51 = v17;
  if (!v17)
  {
    v42 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationSmoother", buf, 2u);
    }

    v40 = 0;
    v41 = 0;
LABEL_19:
    v19 = v55;
LABEL_30:
    v39 = self;
    goto LABEL_31;
  }
  v19 = v55;
  if (!v55)
  {
    v42 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: locationStore";
LABEL_28:
    _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, v46, buf, 2u);
    goto LABEL_29;
  }
  if (!v57)
  {
    v42 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: platform";
    goto LABEL_28;
  }
  if (!v56)
  {
    v42 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_28;
  }
  if (!v18)
  {
    v42 = 0;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "Invalid parameter not satisfying: effectiveBundlePath";
      goto LABEL_28;
    }
LABEL_29:

    v40 = 0;
    v41 = v51;
    goto LABEL_30;
  }
  v50 = v18;
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("/System/Library/LocationBundles/Routine.bundle")))
  {
    if (v54)
    {
      if (v53)
        goto LABEL_10;
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v49 = objc_claimAutoreleasedReturnValue();
      v41 = v51;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: routineLocationManager", buf, 2u);
      }

      v40 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
      }

      v40 = 0;
      v41 = v51;
    }
    v39 = self;
    v42 = v50;
    goto LABEL_31;
  }
LABEL_10:
  v58.receiver = self;
  v58.super_class = (Class)RTLocationManager;
  v20 = -[RTNotifier init](&v58, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_authorizationManager, a3);
    objc_storeStrong((id *)&v21->_defaultsManager, a4);
    objc_storeStrong((id *)&v21->_locationSmoother, a5);
    objc_storeStrong((id *)&v21->_locationStore, a6);
    objc_storeStrong((id *)&v21->_platform, a7);
    objc_storeStrong((id *)&v21->_locationManagerRoutine, a8);
    -[CLLocationManagerRoutine setDelegate:](v21->_locationManagerRoutine, "setDelegate:", v21);
    objc_storeStrong((id *)&v21->_timerManager, a9);
    objc_storeStrong((id *)&v21->_effectiveLocationBundlePath, a10);
    objc_msgSend(v50, "componentsSeparatedByString:", CFSTR("/"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v23 = objc_claimAutoreleasedReturnValue();
    locationBundlePathShortname = v21->_locationBundlePathShortname;
    v21->_locationBundlePathShortname = (NSString *)v23;

    v25 = objc_opt_new();
    currentLocationRequests = v21->_currentLocationRequests;
    v21->_currentLocationRequests = (NSMutableArray *)v25;

    v27 = [RTInvocationDispatcher alloc];
    -[RTNotifier queue](v21, "queue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[RTInvocationDispatcher initWithQueue:](v27, "initWithQueue:", v28);
    dispatcher = v21->_dispatcher;
    v21->_dispatcher = (RTInvocationDispatcher *)v29;

    v31 = [RTInvocationDispatcher alloc];
    -[RTNotifier queue](v21, "queue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[RTInvocationDispatcher initWithQueue:](v31, "initWithQueue:", v32);
    regionEventDispatcher = v21->_regionEventDispatcher;
    v21->_regionEventDispatcher = (RTInvocationDispatcher *)v33;

    v35 = objc_opt_new();
    regionEventHandlerDictionary = v21->_regionEventHandlerDictionary;
    v21->_regionEventHandlerDictionary = (NSMutableDictionary *)v35;

    v37 = objc_alloc_init(RTTrustedTimeCache);
    trustedTimeCache = v21->_trustedTimeCache;
    v21->_trustedTimeCache = v37;

    -[RTService setup](v21, "setup");
  }
  v39 = v21;
  v40 = v39;
  v42 = v50;
  v41 = v51;
  v19 = v55;
LABEL_31:

  return v40;
}

- (void)_registerNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[RTLocationManager authorizationManager](self, "authorizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_onAuthorizationNotification_, v4);

  -[RTLocationManager locationStore](self, "locationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_onLocationStoreNotification_, v6);

  -[RTLocationManager authorizationManager](self, "authorizationManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationConsoleUserDidChange, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:", self, sel_onUserSessionChangeNotification_, v7);

}

- (void)_unregisterNotifications
{
  void *v3;
  id v4;

  -[RTLocationManager authorizationManager](self, "authorizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[RTLocationManager locationStore](self, "locationStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)_createLocationManager
{
  id v3;
  void *v4;
  void *v5;
  CLLocationManager *v6;
  CLLocationManager *locationManager;
  id v8;
  void *v9;
  void *v10;
  CLLocationManager *v11;
  CLLocationManager *rhythmicLocationManager;

  v3 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  -[RTLocationManager effectiveLocationBundlePath](self, "effectiveLocationBundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CLLocationManager *)objc_msgSend(v3, "initWithEffectiveBundlePath:delegate:onQueue:", v4, self, v5);
  locationManager = self->_locationManager;
  self->_locationManager = v6;

  -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", *MEMORY[0x1E0C9E4A8]);
  v8 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  -[RTLocationManager effectiveLocationBundlePath](self, "effectiveLocationBundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CLLocationManager *)objc_msgSend(v8, "initWithEffectiveBundlePath:delegate:onQueue:", v9, self, v10);
  rhythmicLocationManager = self->_rhythmicLocationManager;
  self->_rhythmicLocationManager = v11;

  -[CLLocationManager setDesiredAccuracy:](self->_rhythmicLocationManager, "setDesiredAccuracy:", *MEMORY[0x1E0C9E4E8]);
}

- (void)_setup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  -[RTLocationManager _createLocationManager](self, "_createLocationManager");
  -[RTLocationManager _registerNotifications](self, "_registerNotifications");
  -[RTLocationManager authorizationManager](self, "authorizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    -[RTLocationManager authorizationManager](self, "authorizationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __27__RTLocationManager__setup__block_invoke;
    v11[3] = &unk_1E929BEB0;
    v11[4] = self;
    objc_msgSend(v5, "fetchRoutineEnabledWithHandler:", v11);

    -[RTLocationManager authorizationManager](self, "authorizationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __27__RTLocationManager__setup__block_invoke_3;
    v10[3] = &unk_1E929BEB0;
    v10[4] = self;
    objc_msgSend(v6, "fetchRoutineSupportedWithHandler:", v10);

  }
  else
  {
    -[RTLocationManager setSupported:](self, "setSupported:", 1);
    -[RTLocationManager locationManager](self, "locationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationManager setEnabled:](self, "setEnabled:", objc_msgSend(v7, "authorizationStatus") == 3);

    -[RTLocationManager shouldLeechLocations](self, "shouldLeechLocations");
    -[RTLocationManager shouldPersistLocations](self, "shouldPersistLocations");
  }
  -[RTLocationManager locationStore](self, "locationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __27__RTLocationManager__setup__block_invoke_5;
  v9[3] = &unk_1E929E678;
  v9[4] = self;
  objc_msgSend(v8, "fetchLastLocationWithHandler:", v9);

}

void __27__RTLocationManager__setup__block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__RTLocationManager__setup__block_invoke_2;
  v5[3] = &unk_1E9297870;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(v4, v5);

}

uint64_t __27__RTLocationManager__setup__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "shouldLeechLocations");
  return objc_msgSend(*(id *)(a1 + 32), "shouldPersistLocations");
}

void __27__RTLocationManager__setup__block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__RTLocationManager__setup__block_invoke_4;
  v5[3] = &unk_1E9297870;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(v4, v5);

}

uint64_t __27__RTLocationManager__setup__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSupported:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "shouldLeechLocations");
  return objc_msgSend(*(id *)(a1 + 32), "shouldPersistLocations");
}

void __27__RTLocationManager__setup__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__RTLocationManager__setup__block_invoke_6;
  v6[3] = &unk_1E9297540;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __27__RTLocationManager__setup__block_invoke_6(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "lastLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "setLastLocation:", *(_QWORD *)(a1 + 40));
}

- (void)_shutdownWithHandler:(id)a3
{
  CLLocationManager *locationManager;
  RTTimer *activeLocationRequestTimer;
  RTTimer *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  activeLocationRequestTimer = self->_activeLocationRequestTimer;
  if (activeLocationRequestTimer)
  {
    -[RTTimer invalidate](activeLocationRequestTimer, "invalidate");
    v6 = self->_activeLocationRequestTimer;
    self->_activeLocationRequestTimer = 0;

  }
  -[RTLocationManager _unregisterNotifications](self, "_unregisterNotifications");
  -[RTLocationManager dispatcher](self, "dispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shutdown");

  -[RTLocationManager regionEventDispatcher](self, "regionEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shutdown");

  -[RTLocationManager setPowerAssertion:](self, "setPowerAssertion:", 0);
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    v9 = v10;
  }

}

- (void)shouldLeechLocations
{
  void *v3;
  unint64_t v4;
  _BOOL8 v5;

  v5 = 0;
  if (-[RTLocationManager supported](self, "supported"))
  {
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3);

    if (v4)
      v5 = 1;
  }
  -[RTLocationManager setLeechingLocations:](self, "setLeechingLocations:", v5);
}

- (void)setLeechingLocations:(BOOL)a3
{
  NSObject *v4;
  NSString *locationBundlePathShortname;
  const __CFString *v6;
  _BOOL4 leechingLocations;
  void *v8;
  void *v9;
  int v10;
  NSString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_leechingLocations != a3)
  {
    self->_leechingLocations = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      if (self->_leechingLocations)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v10 = 138412546;
      v11 = locationBundlePathShortname;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, leech locations, %@", (uint8_t *)&v10, 0x16u);
    }

    leechingLocations = self->_leechingLocations;
    -[RTLocationManager locationManagerRoutine](self, "locationManagerRoutine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (leechingLocations)
      objc_msgSend(v8, "startUpdatingLocation");
    else
      objc_msgSend(v8, "stopUpdatingLocation");

  }
}

- (void)shouldMonitorRhythmicLocations
{
  double v3;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;

  v3 = *MEMORY[0x1E0C9E4E8];
  -[RTLocationManager rhythmicLocationManager](self, "rhythmicLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDesiredAccuracy:", v3);

  if (-[RTLocationManager supported](self, "supported")
    && (+[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicWaking, "notificationName"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5), v5, v6))
  {
    v7 = *MEMORY[0x1E0C9E4F0];
    -[RTLocationManager rhythmicLocationManager](self, "rhythmicLocationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDesiredAccuracy:", v7);

  }
  else if (!-[RTLocationManager supported](self, "supported")
         || (+[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking, "notificationName"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v9), v9, !v10))
  {
    v11 = 0;
    goto LABEL_8;
  }
  v11 = 1;
LABEL_8:
  -[RTLocationManager setMonitoringRhythmicLocations:](self, "setMonitoringRhythmicLocations:", v11);
}

- (void)setMonitoringRhythmicLocations:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSString *locationBundlePathShortname;
  void *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_monitoringRhythmicLocations != a3)
  {
    v3 = a3;
    self->_monitoringRhythmicLocations = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        locationBundlePathShortname = self->_locationBundlePathShortname;
        v10 = 138412290;
        v11 = locationBundlePathShortname;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, start monitoring rhythmic locations", (uint8_t *)&v10, 0xCu);
      }

      -[RTLocationManager rhythmicLocationManager](self, "rhythmicLocationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startUpdatingLocation");
    }
    else
    {
      if (v6)
      {
        v9 = self->_locationBundlePathShortname;
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, stop monitoring rhythmic locations", (uint8_t *)&v10, 0xCu);
      }

      -[RTLocationManager rhythmicLocationManager](self, "rhythmicLocationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopUpdatingLocation");
    }

  }
}

- (void)shouldPersistLocations
{
  NSObject *v3;
  NSString *locationBundlePathShortname;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  int v10;
  NSString *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    v5 = -[RTAuthorizationManager shouldPersistLocations](self->_authorizationManager, "shouldPersistLocations");
    v10 = 138413058;
    v11 = locationBundlePathShortname;
    v12 = 1024;
    v13 = v5;
    v14 = 1024;
    v15 = -[RTLocationManager supported](self, "supported");
    v16 = 1024;
    v17 = -[RTLocationManager enabled](self, "enabled");
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, shouldPersistLocations %d, supported %d, enabled %d", (uint8_t *)&v10, 0x1Eu);
  }

  -[RTLocationManager authorizationManager](self, "authorizationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[RTAuthorizationManager shouldPersistLocations](self->_authorizationManager, "shouldPersistLocations");
  else
    v7 = -[RTLocationManager enabled](self, "enabled");
  v8 = v7;

  v9 = -[RTLocationManager supported](self, "supported") && -[RTLocationManager enabled](self, "enabled") && v8;
  -[RTLocationManager setPersistingLocations:](self, "setPersistingLocations:", v9);
}

- (void)setPersistingLocations:(BOOL)a3
{
  NSObject *v4;
  NSString *locationBundlePathShortname;
  const __CFString *v6;
  int v7;
  NSString *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_persistingLocations != a3)
  {
    self->_persistingLocations = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      if (self->_persistingLocations)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = 138412546;
      v8 = locationBundlePathShortname;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, persist locations, %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

uint64_t __45__RTLocationManager__storeLocations_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeLocations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __45__RTLocationManager__storeLocations_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, %@", buf, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D18598];
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);

  }
}

uint64_t __45__RTLocationManager__storeLocations_handler___block_invoke_121(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_considerInUse
{
  return -[RTLocationManager monitoringLocations](self, "monitoringLocations")
      || -[RTLocationManager monitoringRhythmicLocations](self, "monitoringRhythmicLocations");
}

uint64_t __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_2_127(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v9 = 138413058;
      v10 = v6;
      v11 = 2112;
      v12 = v8;
      v13 = 2048;
      v14 = objc_msgSend(v7, "count");
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@, %@, encountered error storing %lu locations, error, %@", (uint8_t *)&v9, 0x2Au);

    }
  }

}

void __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(v3, "toString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, received location, %@", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(v3, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isBeforeDate:", v9);

  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD **)(a1 + 32);
      v13 = v12[7];
      objc_msgSend(v12, "lastLocation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "lastLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v17);
      v19 = 138413058;
      v20 = v13;
      v21 = 2112;
      v22 = v3;
      v23 = 2112;
      v24 = v14;
      v25 = 2048;
      v26 = v18;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, current location, %@, predates last location, %@, interval, %.2f", (uint8_t *)&v19, 0x2Au);

    }
  }

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  NSObject *v6;
  NSString *locationBundlePathShortname;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    v11 = 138412546;
    v12 = locationBundlePathShortname;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, didChangeAuthorizationStatus, %ld", (uint8_t *)&v11, 0x16u);
  }

  -[RTLocationManager authorizationManager](self, "authorizationManager");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "updateRoutineEnabled:", a4 == 3);

  -[RTLocationManager effectiveLocationBundlePath](self, "effectiveLocationBundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", CFSTR("/System/Library/LocationBundles/Routine.bundle"));

  if ((v8 & 1) == 0)
  {
    -[RTLocationManager locationManager](self, "locationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationManager setEnabled:](self, "setEnabled:", objc_msgSend(v10, "authorizationStatus") == 3);

    -[RTLocationManager shouldLeechLocations](self, "shouldLeechLocations");
    -[RTLocationManager shouldPersistLocations](self, "shouldPersistLocations");
  }
}

- (void)fetchLastLocationWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  SEL v9;

  v5 = a3;
  if (v5)
  {
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__RTLocationManager_fetchLastLocationWithHandler___block_invoke;
    block[3] = &unk_1E9298E88;
    block[4] = self;
    v9 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __50__RTLocationManager_fetchLastLocationWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "lastLocation");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, %@, doesn't have location authorization", buf, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 40);
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18598];
    v13 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no authorization"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v11);

  }
}

void __61__RTLocationManager_fetchCurrentLocationWithOptions_handler___block_invoke_132(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  RTLocationManagerLocationRequest *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  RTLocationManagerLocationRequest *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  RTLocationManagerLocationRequest *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v7 = -[RTLocationManagerLocationRequest initWithOptions:handler:]([RTLocationManagerLocationRequest alloc], "initWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      objc_msgSend(v3, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceNow");
      v13 = 136316162;
      v14 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]_block_invoke";
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v3;
      v21 = 2048;
      v22 = v9;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, %@, delta, %.2f", (uint8_t *)&v13, 0x34u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v5)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v13 = 136315394;
      v14 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]_block_invoke";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, %@, yieldLastLocation, YES, doesn't have a current location, forwarding request to CL.", (uint8_t *)&v13, 0x16u);
    }

    v11 = -[RTLocationManagerLocationRequest initWithOptions:handler:]([RTLocationManagerLocationRequest alloc], "initWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "currentLocationRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

    objc_msgSend(*(id *)(a1 + 32), "_reviewActiveLocationRequests");
  }

}

void __50__RTLocationManager__reviewActiveLocationRequests__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onActiveLocationRequestTimerExpiry");

}

- (void)fetchCachedLocationWithHandler:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    objc_msgSend((id)objc_opt_class(), "defaultLocationRequestOptions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[RTLocationManager fetchCachedLocationWithOptions:handler:](self, "fetchCachedLocationWithOptions:handler:", v5, v4);

  }
}

- (void)_fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  SEL v28;
  double v29;
  unint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTLocationManager _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
      v35 = 1024;
      v36 = 1111;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
    }

    if (v15)
      goto LABEL_4;
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[RTLocationManager _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
    v35 = 1024;
    v36 = 1110;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
  }

  if (!v14)
    goto LABEL_9;
LABEL_3:
  if (v15)
  {
LABEL_4:
    if (-[RTLocationManager enabled](self, "enabled"))
    {
      -[RTLocationManager locationStore](self, "locationStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __89__RTLocationManager__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke;
      v24[3] = &unk_1E929DF98;
      v28 = a2;
      v24[4] = self;
      v25 = v13;
      v26 = v14;
      v29 = a5;
      v30 = a6;
      v27 = v15;
      objc_msgSend(v16, "fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:", v25, v26, a6, v24, a5);

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D18598];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("Service has been disabled by user.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 2, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v23);

    }
    goto LABEL_16;
  }
LABEL_12:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[RTLocationManager _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
    v35 = 1024;
    v36 = 1112;
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

LABEL_16:
}

void __89__RTLocationManager__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 40), "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "stringFromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 80);
    v13 = 138413826;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2048;
    v18 = a2;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = v11;
    v25 = 2048;
    v26 = v12;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, fetched %ld locations from date, %@, to date, %@, uncertainty, %.2f, limit, %lu", (uint8_t *)&v13, 0x48u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

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
  v19[2] = __88__RTLocationManager_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke;
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

uint64_t __88__RTLocationManager_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke(uint64_t a1)
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
      v11 = "-[RTLocationManager _fetchStoredLocationsWithOptions:handler:]";
      v12 = 1024;
      v13 = 1164;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184E8]), "initWithEnumerationOptions:", v6);
  -[RTLocationManager _fetchStoredLocationsWithContext:handler:](self, "_fetchStoredLocationsWithContext:handler:", v9, v7);

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
  block[2] = __61__RTLocationManager_fetchStoredLocationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __61__RTLocationManager_fetchStoredLocationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  RTLocationStoreProtocol *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSString *locationBundlePathShortname;
  RTLocationStoreProtocol *locationStore;
  id v32;
  id v33;
  NSString *v34;
  NSString *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  _BYTE *v44;
  SEL v45;
  uint64_t v46;
  double v47;
  _QWORD v48[4];
  _QWORD v49[5];
  id v50;
  id v51;
  SEL v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  __int128 v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (-[RTLocationManager enabled](self, "enabled"))
    {
      if (self->_locationStore)
      {
        objc_msgSend(v7, "options");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "downsampleRequired");

        if ((v10 & 1) != 0)
        {
          objc_msgSend(v7, "options");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "smoothingRequired");

          if (v12)
            v37 = (void *)objc_opt_new();
          else
            v37 = 0;
          v21 = (void *)objc_msgSend(v7, "copy");
          objc_msgSend(v21, "options");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setBatchSize:", 0);

          objc_msgSend(MEMORY[0x1E0D183B8], "createErrorFunctionWithPerpendicularDistance");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "options");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "smoothingErrorThreshold");
          v25 = v24;

          if (v25 <= *MEMORY[0x1E0D185E8])
            v25 = 5.0;
          objc_msgSend(v7, "options");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "batchSize");

          _rt_log_facility_get_os_log(RTLogFacilityLocation);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            locationBundlePathShortname = self->_locationBundlePathShortname;
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v29;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = locationBundlePathShortname;
            *(_WORD *)&buf[22] = 2112;
            v54 = (uint64_t (*)(uint64_t, uint64_t))v7;
            LOWORD(v55) = 2048;
            *(double *)((char *)&v55 + 2) = v25;
            _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, context, %@, smoothing error threshold, %f", buf, 0x2Au);

          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v54 = __Block_byref_object_copy__72;
          *(_QWORD *)&v55 = __Block_byref_object_dispose__72;
          *((_QWORD *)&v55 + 1) = objc_opt_new();
          v48[0] = 0;
          v48[1] = v48;
          v48[2] = 0x2020000000;
          v48[3] = 0;
          locationStore = self->_locationStore;
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __62__RTLocationManager__fetchStoredLocationsWithContext_handler___block_invoke_146;
          v38[3] = &unk_1E929E758;
          v45 = a2;
          v38[4] = self;
          v41 = v8;
          v43 = v48;
          v44 = buf;
          v46 = v27;
          v32 = v36;
          v42 = v32;
          v47 = v25;
          v33 = v37;
          v39 = v33;
          v40 = v7;
          -[RTLocationStoreProtocol enumerateStoredLocationsWithContext:usingBlock:](locationStore, "enumerateStoredLocationsWithContext:usingBlock:", v21, v38);

          _Block_object_dispose(v48, 8);
          _Block_object_dispose(buf, 8);

        }
        else
        {
          v20 = self->_locationStore;
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __62__RTLocationManager__fetchStoredLocationsWithContext_handler___block_invoke;
          v49[3] = &unk_1E9298550;
          v52 = a2;
          v49[4] = self;
          v50 = v7;
          v51 = v8;
          -[RTLocationStoreProtocol fetchStoredLocationsWithContext:handler:](v20, "fetchStoredLocationsWithContext:handler:", v50, v49);

        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityLocation);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v35 = self->_locationBundlePathShortname;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v35;
          _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, LocationStore was nil.", buf, 0xCu);
        }

        (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
      }
    }
    else
    {
      v56 = *MEMORY[0x1E0CB2D50];
      v57 = CFSTR("Service has been disabled by user.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, MEMORY[0x1E0C9AA60], v18);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTLocationManager _fetchStoredLocationsWithContext:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1184;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v58 = *MEMORY[0x1E0CB2D50];
    v59[0] = CFSTR("A completion handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v34 = self->_locationBundlePathShortname;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, A completion handler is a required parameter, %@", buf, 0x16u);
    }

  }
}

void __62__RTLocationManager__fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v19 = objc_msgSend(v5, "count");
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timestamp");
    v22 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v24 = v8;
    v25 = 2112;
    v26 = v21;
    v27 = 2048;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v14;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched %ld locations, context, %@, first location date, %@, last location date, %@", buf, 0x3Eu);

    v6 = v22;
  }

  objc_msgSend(*(id *)(a1 + 40), "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "smoothingRequired");

  if (v16)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "smoothLocations:", v5);
    v18 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __62__RTLocationManager__fetchStoredLocationsWithContext_handler___block_invoke_146(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  _BYTE *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v11 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "firstObject");
    v55 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromDate");
    v50 = a4;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v52 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v57 = v10;
    v58 = 2112;
    v59 = v48;
    v60 = 2048;
    v61 = v11;
    v62 = 2112;
    v63 = v14;
    v64 = 2112;
    v65 = (uint64_t)v17;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, fetched %ld locations, first location date, %@, last location date, %@, decimated, YES", buf, 0x34u);

    v7 = v52;
    v8 = v55;

    a4 = v50;
  }

  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v45 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138412546;
      v57 = v45;
      v58 = 2112;
      v59 = v8;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@, received error while fetching stored locations, %@, breaking out.", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    *a4 = 1;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v19 = *(_QWORD *)(a1 + 96);
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (objc_msgSend(v7, "count") && (v21 = v19 / v20) != 0)
    {
      v22 = objc_msgSend(v7, "count");
      objc_msgSend(MEMORY[0x1E0D183B8], "filterConvergingLocations:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v23, "count");
      v25 = *(void **)(a1 + 40);
      if (v25)
      {
        objc_msgSend(v25, "smoothLocations:", v23);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = v23;
      }
      objc_msgSend(MEMORY[0x1E0D183B8], "downsampleLocations:errorFunction:errorThreshold:outputSize:", v7, *(_QWORD *)(a1 + 64), v21, *(double *)(a1 + 104));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObjectsFromArray:", v36);
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 88));
        v38 = objc_claimAutoreleasedReturnValue();
        v47 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        v49 = (void *)v38;
        v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v51 = *(void **)(a1 + 96);
        objc_msgSend(*(id *)(a1 + 48), "options");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v54, "smoothingRequired");
        v41 = CFSTR("NO");
        if (v40)
          v41 = CFSTR("YES");
        v42 = objc_msgSend(v7, "count", v41);
        v43 = objc_msgSend(v36, "count");
        v44 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
        *(_DWORD *)buf = 138414850;
        v57 = v49;
        v58 = 2112;
        v59 = v47;
        v60 = 2048;
        v61 = v39;
        v8 = 0;
        v62 = 2048;
        v63 = v51;
        v64 = 2048;
        v65 = v21;
        v66 = 2048;
        v67 = v22;
        v68 = 2048;
        v69 = v24;
        v70 = 2112;
        v71 = v46;
        v72 = 2048;
        v73 = v42;
        v74 = 2048;
        v75 = v43;
        v76 = 2048;
        v77 = v44;
        _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, %@, itr, %lu, target output size, %lu, target sample size for itr, %lu, fetched location count, %lu, pre-filtered location count, %lu, location smoothed, %@, before downssampling location count, %lu, after downsampling count, %lu, cached location count, %lu", buf, 0x70u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D183B8], "downsampleLocations:errorFunction:errorThreshold:outputSize:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 96), *(double *)(a1 + 104));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 88));
        v53 = v7;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = a4;
        v30 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v32 = *(void **)(a1 + 96);
        v33 = objc_msgSend(v53, "count");
        v34 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
        v35 = objc_msgSend(v26, "count");
        *(_DWORD *)buf = 138413826;
        v57 = v28;
        v58 = 2112;
        v59 = v30;
        a4 = v29;
        v60 = 2048;
        v61 = v31;
        v62 = 2048;
        v63 = v32;
        v64 = 2048;
        v65 = v33;
        v66 = 2048;
        v67 = v34;
        v68 = 2048;
        v69 = v35;
        _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@, %@, no more stored locations to enumerate, breaking out, itr, %lu, target output size, %lu, fetched location count, %lu, cached location count, %lu, output location count, %lu", buf, 0x48u);

        v7 = v53;
        v8 = 0;
      }

      *a4 = 1;
    }
  }

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
  block[2] = __61__RTLocationManager_fetchStoredLocationsWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __61__RTLocationManager_fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSString *locationBundlePathShortname;
  _QWORD v19[4];
  id v20;
  RTLocationManager *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (v10)
    {
LABEL_3:
      -[RTNotifier queue](self, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__RTLocationManager_fetchEstimatedLocationAtDate_options_handler___block_invoke;
      v19[3] = &unk_1E9297EB8;
      v20 = v9;
      v21 = self;
      v22 = v8;
      v23 = v11;
      dispatch_async(v12, v19);

      v13 = v20;
      goto LABEL_12;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTLocationManager fetchEstimatedLocationAtDate:options:handler:]";
      v26 = 1024;
      LODWORD(v27) = 1336;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    if (v11)
      goto LABEL_3;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[RTLocationManager fetchEstimatedLocationAtDate:options:handler:]";
    v26 = 1024;
    LODWORD(v27) = 1337;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  v28 = *MEMORY[0x1E0CB2D50];
  v29[0] = CFSTR("A completion handler is a required parameter.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138412546;
    v25 = (const char *)locationBundlePathShortname;
    v26 = 2112;
    v27 = v16;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@, A completion handler is a required parameter, %@", buf, 0x16u);
  }

LABEL_12:
}

void __66__RTLocationManager_fetchEstimatedLocationAtDate_options_handler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = v2;
    v4 = objc_alloc_init(MEMORY[0x1E0D18380]);

    v3 = v4;
  }
  v6 = v3;
  objc_msgSend(*(id *)(a1 + 40), "_fetchEstimatedLocationAtDate:options:handler:", *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56));

}

- (void)_fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  void (**v10)(id, void *, _QWORD);
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSString *locationBundlePathShortname;
  dispatch_semaphore_t v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id *v25;
  dispatch_time_t v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  NSString *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  NSString *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  NSString *v67;
  void *v68;
  NSString *v69;
  void *v70;
  id obj;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *dsema;
  _QWORD v79[4];
  id v80;
  RTLocationManager *v81;
  SEL v82;
  _QWORD v83[5];
  NSObject *v84;
  uint64_t *v85;
  _BYTE *v86;
  SEL v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint8_t v94[16];
  uint64_t v95;
  const __CFString *v96;
  _BYTE v97[12];
  __int16 v98;
  NSString *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  _BYTE buf[24];
  uint64_t (*v105)(uint64_t, uint64_t);
  __int128 v106;
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  const __CFString *v110;
  uint64_t v111;
  const __CFString *v112;
  _QWORD v113[4];

  v113[1] = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTLocationManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1362;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTLocationManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1363;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTLocationManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1364;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  if (-[RTLocationManager enabled](self, "enabled"))
  {
    if (self->_locationStore)
    {
      if (-[RTLocationManager locationStoreAvailable](self, "locationStoreAvailable"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityLocation);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          locationBundlePathShortname = self->_locationBundlePathShortname;
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = locationBundlePathShortname;
          *(_WORD *)&buf[22] = 2112;
          v105 = v8;
          LOWORD(v106) = 2112;
          *(_QWORD *)((char *)&v106 + 2) = v9;
          _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, date, %@, options, %@", buf, 0x2Au);

        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v105 = __Block_byref_object_copy__72;
        *(_QWORD *)&v106 = __Block_byref_object_dispose__72;
        *((_QWORD *)&v106 + 1) = 0;
        v88 = 0;
        v89 = &v88;
        v90 = 0x3032000000;
        v91 = __Block_byref_object_copy__72;
        v92 = __Block_byref_object_dispose__72;
        v93 = 0;
        v17 = dispatch_semaphore_create(0);
        objc_msgSend(v9, "timeInterval");
        if (v18 >= 0.0)
          v19 = v18;
        else
          v19 = 30.0;
        v20 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v8, "dateByAddingTimeInterval:", -v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dateByAddingTimeInterval:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)objc_msgSend(v20, "initWithStartDate:endDate:", v21, v22);

        v23 = objc_alloc(MEMORY[0x1E0D184F0]);
        v75 = (void *)objc_msgSend(v23, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v76, 100, 0, *MEMORY[0x1E0C9E4A8]);
        v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184E8]), "initWithEnumerationOptions:", v75);
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __67__RTLocationManager__fetchEstimatedLocationAtDate_options_handler___block_invoke;
        v83[3] = &unk_1E929B0C8;
        v85 = &v88;
        v86 = buf;
        v87 = a2;
        v83[4] = self;
        v24 = v17;
        v84 = v24;
        -[RTLocationManager _fetchStoredLocationsWithContext:limit:referenceDate:handler:](self, "_fetchStoredLocationsWithContext:limit:referenceDate:handler:", v74, 50, v8, v83);
        v25 = (id *)(*(_QWORD *)&buf[8] + 40);
        obj = *(id *)(*(_QWORD *)&buf[8] + 40);
        dsema = v24;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(dsema, v26))
          goto LABEL_33;
        objc_msgSend(MEMORY[0x1E0C99D68], "now", obj);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "timeIntervalSinceDate:", v73);
        v28 = v27;
        v29 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_555);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "filteredArrayUsingPredicate:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "submitToCoreAnalytics:type:duration:", v33, 1, v28);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v94 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v94, 2u);
        }

        v35 = (void *)MEMORY[0x1E0CB35C8];
        v113[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v97 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v113, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v38 = objc_retainAutorelease(v37);

          objc_storeStrong(v25, v38);
          _rt_log_facility_get_os_log(RTLogFacilityLocation);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = self->_locationBundlePathShortname;
            v70 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v97 = 138412802;
            *(_QWORD *)&v97[4] = v68;
            v98 = 2112;
            v99 = v69;
            v100 = 2112;
            v101 = v70;
            _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "%@, %@, error, %@", v97, 0x20u);

          }
        }
        else
        {
LABEL_33:

          objc_storeStrong(v25, obj);
          if (objc_msgSend((id)v89[5], "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v89[5], "count"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (void *)v89[5];
            v79[0] = MEMORY[0x1E0C809B0];
            v79[1] = 3221225472;
            v79[2] = __67__RTLocationManager__fetchEstimatedLocationAtDate_options_handler___block_invoke_155;
            v79[3] = &unk_1E929E780;
            v49 = v47;
            v81 = self;
            v82 = a2;
            v80 = v49;
            objc_msgSend(v48, "enumerateObjectsUsingBlock:", v79);
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "averageSpeed");
            if (v51 >= 0.0)
            {
              v52 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v9, "averageSpeed");
              objc_msgSend(v52, "numberWithDouble:");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setObject:forKey:", v53, CFSTR("kRTLocationSmootherAverageMovingSpeed"));

            }
            if (objc_msgSend(v9, "enableFallbackModel", obj))
              objc_msgSend(v50, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kRTLocationSmootherEnableFallbackModel"));
            _rt_log_facility_get_os_log(RTLogFacilityLocation);
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v55 = (id)objc_claimAutoreleasedReturnValue();
              v56 = self->_locationBundlePathShortname;
              objc_msgSend(v8, "stringFromDate");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v97 = 138413058;
              *(_QWORD *)&v97[4] = v55;
              v98 = 2112;
              v99 = v56;
              v100 = 2112;
              v101 = v57;
              v102 = 2112;
              v103 = v50;
              _os_log_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_INFO, "%@, %@, date, %@, parameters, %@", v97, 0x2Au);

            }
            -[RTLocationManager locationSmoother](self, "locationSmoother");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "timeIntervalSinceReferenceDate");
            objc_msgSend(v58, "estimateLocationWithLocations:timestamp:parameters:meta:", v49, v50, 0);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityLocation);
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v61 = (id)objc_claimAutoreleasedReturnValue();
              v62 = self->_locationBundlePathShortname;
              objc_msgSend(v8, "stringFromDate");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v97 = 138413058;
              *(_QWORD *)&v97[4] = v61;
              v98 = 2112;
              v99 = v62;
              v100 = 2112;
              v101 = v59;
              v102 = 2112;
              v103 = v63;
              _os_log_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_INFO, "%@, %@, estimated location, %@, on date, %@", v97, 0x2Au);

            }
            if (v59 && (objc_msgSend(v59, "horizontalAccuracy"), v64 > 0.0))
            {
              v10[2](v10, v59, 0);
            }
            else
            {
              v95 = *MEMORY[0x1E0CB2D50];
              v96 = CFSTR("Failed to estimate a location.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 6, v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(id, void *, void *))v10)[2](v10, 0, v66);

            }
            goto LABEL_48;
          }
        }
        v10[2](v10, 0, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
LABEL_48:

        _Block_object_dispose(&v88, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_49;
      }
      v107 = *MEMORY[0x1E0CB2D50];
      v108 = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v46);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v67 = self->_locationBundlePathShortname;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v67;
        _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "%@, LocationStore was nil.", buf, 0xCu);
      }

      v109 = *MEMORY[0x1E0CB2D50];
      v110 = CFSTR("Service error: location store is nil.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v44);

    }
  }
  else
  {
    v111 = *MEMORY[0x1E0CB2D50];
    v112 = CFSTR("Service has been disabled by user.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v41);

  }
LABEL_49:

}

void __67__RTLocationManager__fetchEstimatedLocationAtDate_options_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v11 = objc_msgSend(v6, "count");
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v13 = 138413058;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2048;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, stored locations, %ld, error, %@", (uint8_t *)&v13, 0x2Au);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __67__RTLocationManager__fetchEstimatedLocationAtDate_options_handler___block_invoke_155(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[2];
  uint8_t buf[32];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "horizontalAccuracy");
  if (v6 <= 30.0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "horizontalAccuracy");
    if (v7 <= 165.0)
      v8 = 4;
    else
      v8 = 0;
  }
  memset(v15, 0, 28);
  v14 = 0u;
  if (v5)
    objc_msgSend(v5, "clientLocation");
  LODWORD(v14) = v8;
  v9 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  v21 = v14;
  v22 = 0u;
  v23[0] = v15[0];
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v15 + 12);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  memset(buf, 0, sizeof(buf));
  v10 = (void *)objc_msgSend(v9, "initWithClientLocation:", buf);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v10;
    LOWORD(v17) = 2048;
    *(_QWORD *)((char *)&v17 + 2) = a3;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, input location, %@, idx, %ld", buf, 0x2Au);

  }
}

- (void)_fetchStoredLocationsWithContext:(id)a3 limit:(unint64_t)a4 referenceDate:(id)a5 handler:(id)a6
{
  id v8;
  void *v9;
  dispatch_semaphore_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  id v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  char v38;
  id v39;
  NSString *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSString *v46;
  void *v47;
  NSString *locationBundlePathShortname;
  id v49;
  void (**v50)(id, id, _QWORD);
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v62;
  id v63;
  void *context;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  NSObject *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  id *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE buf[12];
  __int16 v90;
  NSString *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  unint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  _QWORD v106[4];

  v106[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v58 = a5;
  v50 = (void (**)(id, id, _QWORD))a6;
  v59 = v8;
  objc_msgSend(v8, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v9, "batchSize");

  v57 = (void *)objc_opt_new();
  v56 = (void *)objc_opt_new();
  v53 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  v79 = 0;
  v80 = (id *)&v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__72;
  v83 = __Block_byref_object_dispose__72;
  v84 = 0;
  v54 = *MEMORY[0x1E0D18598];
  v55 = *MEMORY[0x1E0CB2D50];
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0;
    v10 = dispatch_semaphore_create(0);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __82__RTLocationManager__fetchStoredLocationsWithContext_limit_referenceDate_handler___block_invoke;
    v66[3] = &unk_1E929E7A8;
    v71 = &v79;
    v72 = &v85;
    v60 = v58;
    v67 = v60;
    v63 = v57;
    v68 = v63;
    v11 = v56;
    v73 = &v75;
    v74 = a4;
    v62 = v11;
    v69 = v11;
    v12 = v10;
    v70 = v12;
    v13 = (void *)MEMORY[0x1D8232094](v66);
    v14 = objc_alloc(MEMORY[0x1E0D184E8]);
    objc_msgSend(v59, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithEnumerationOptions:offset:", v15, v86[3]);

    -[RTLocationManager _fetchStoredLocationsWithContext:handler:](self, "_fetchStoredLocationsWithContext:handler:", v16, v13);
    v17 = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v17, v19))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceDate:", v18);
    v22 = v21;
    v23 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_555);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "filteredArrayUsingPredicate:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "submitToCoreAnalytics:type:duration:", v27, 1, v22);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v29 = (void *)MEMORY[0x1E0CB35C8];
    v106[0] = v55;
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v106, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v54, 15, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = objc_retainAutorelease(v31);

      v33 = 0;
    }
    else
    {
LABEL_7:
      v32 = 0;
      v33 = 1;
    }

    v34 = v32;
    if ((v33 & 1) == 0)
      objc_storeStrong(v80 + 5, v32);
    v35 = v80[5];
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v35)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        locationBundlePathShortname = self->_locationBundlePathShortname;
        v49 = v80[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v47;
        v90 = 2112;
        v91 = locationBundlePathShortname;
        v92 = 2112;
        v93 = v49;
        _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, %@, stop fetching due to error, %@", buf, 0x20u);

      }
LABEL_13:

      v38 = 0;
      goto LABEL_18;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = self->_locationBundlePathShortname;
      objc_msgSend(v60, "stringFromDate");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = v86[3];
      v43 = objc_msgSend(v63, "count");
      v44 = objc_msgSend(v62, "count");
      *(_DWORD *)buf = 138414338;
      *(_QWORD *)&buf[4] = v39;
      v90 = 2112;
      v91 = v40;
      v92 = 2112;
      v93 = v41;
      v94 = 2048;
      v95 = v51;
      v96 = 2048;
      v97 = a4;
      v98 = 2048;
      v99 = v42;
      v100 = 2048;
      v101 = v43;
      v102 = 2048;
      v103 = v44;
      v104 = 2048;
      v105 = ++v53;
      _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, %@, date, %@, batchSize, %lu, limit, %lu, offset, %lu, locs.before.date, %lu, locs.after.date, %lu, idx, %lu", buf, 0x5Cu);

    }
    if (!*((_BYTE *)v76 + 24))
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = self->_locationBundlePathShortname;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v45;
        v90 = 2112;
        v91 = v46;
        _os_log_debug_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_DEBUG, "%@, %@, no more locations to fetch.", buf, 0x16u);

      }
      goto LABEL_13;
    }
    v38 = 1;
LABEL_18:

    _Block_object_dispose(&v75, 8);
    objc_autoreleasePoolPop(context);
  }
  while ((v38 & 1) != 0);
  objc_msgSend(v63, "addObjectsFromArray:", v62);
  ((void (**)(id, id, id))v50)[2](v50, v63, v80[5]);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v85, 8);
}

void __82__RTLocationManager__fetchStoredLocationsWithContext_limit_referenceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  v7 = objc_msgSend(v5, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += v7;
  if (v7)
  {
    v19 = v6;
    v21 = v5;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "timestamp", v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isBeforeDate:", *(_QWORD *)(a1 + 32));

          if (v15)
            v16 = 40;
          else
            v16 = 48;
          objc_msgSend(*(id *)(a1 + v16), "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") > *(_QWORD *)(a1 + 88))
      objc_msgSend(*(id *)(a1 + 40), "removeObjectsInRange:", 0, objc_msgSend(*(id *)(a1 + 40), "count") - *(_QWORD *)(a1 + 88));
    v17 = objc_msgSend(*(id *)(a1 + 48), "count", v19);
    v18 = *(_QWORD *)(a1 + 88);
    v6 = v20;
    if (v17 > v18)
      objc_msgSend(*(id *)(a1 + 48), "removeObjectsInRange:", v18, objc_msgSend(*(id *)(a1 + 48), "count") - *(_QWORD *)(a1 + 88));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "count") != *(_QWORD *)(a1 + 88);
    v5 = v21;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (void)onActiveLocationRequestTimerExpiry
{
  NSObject *v3;
  NSString *locationBundlePathShortname;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v14 = "-[RTLocationManager onActiveLocationRequestTimerExpiry]";
    v15 = 2112;
    v16 = locationBundlePathShortname;
    v17 = 1024;
    v18 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, %@, #location requests, %d", buf, 0x1Cu);

  }
  -[RTLocationManager activeLocationRequestTimer](self, "activeLocationRequestTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTLocationManager activeLocationRequestTimer](self, "activeLocationRequestTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[RTLocationManager setActiveLocationRequestTimer:](self, "setActiveLocationRequestTimer:", 0);
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__RTLocationManager_onActiveLocationRequestTimerExpiry__block_invoke;
  v11[3] = &unk_1E929E7D0;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

  -[RTLocationManager _handleExpiredLocationRequestsWithIndexes:](self, "_handleExpiredLocationRequestsWithIndexes:", v10);
  -[RTLocationManager _reviewActiveLocationRequests](self, "_reviewActiveLocationRequests");

}

void __55__RTLocationManager_onActiveLocationRequestTimerExpiry__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a2, "expiryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;

  if (v7 <= 0.0)
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
}

- (void)_handleExpiredLocationRequestsWithIndexes:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *locationBundlePathShortname;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 136315650;
    v10 = "-[RTLocationManager _handleExpiredLocationRequestsWithIndexes:]";
    v11 = 2112;
    v12 = locationBundlePathShortname;
    v13 = 1024;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, %@, #expired requests, %d", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke;
  v8[3] = &unk_1E929E7F8;
  v8[4] = self;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v8);
  -[RTLocationManager currentLocationRequests](self, "currentLocationRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsAtIndexes:", v4);

}

void __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentLocationRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fallback");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3588]);
    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v5, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fallbackMaxAge");
    objc_msgSend(v9, "dateWithTimeIntervalSinceNow:", -v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v8, "initWithStartDate:endDate:", v12, v13);

    v15 = objc_alloc(MEMORY[0x1E0D184F0]);
    objc_msgSend(v5, "options");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fallbackHorizontalAccuracy");
    v17 = (void *)objc_msgSend(v15, "initWithDateInterval:horizontalAccuracy:batchSize:ascending:", v14, 1, 0);

    v18 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke_2;
    v27[3] = &unk_1E929C008;
    v27[4] = v18;
    v28 = v5;
    objc_msgSend(v18, "_fetchStoredLocationsWithOptions:handler:", v17, v27);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v5, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceNow");
      *(_DWORD *)buf = 136315906;
      v32 = "-[RTLocationManager _handleExpiredLocationRequestsWithIndexes:]_block_invoke";
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v5;
      v37 = 2048;
      v38 = v22;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, nil, delta, %.2f", buf, 0x2Au);

    }
    objc_msgSend(v5, "handler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D18598];
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not get current location"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 6, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v26);

  }
}

void __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke_2(uint64_t a1, void *a2)
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
  block[2] = __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke_3;
  block[3] = &unk_1E9299D78;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke_3(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(void **)(a1 + 48);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v2, "timestamp");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      *(_DWORD *)buf = 136316162;
      v22 = "-[RTLocationManager _handleExpiredLocationRequestsWithIndexes:]_block_invoke_3";
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v4;
      v27 = 2112;
      v28 = v2;
      v29 = 2048;
      v30 = v8;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, %@, delta, %.2f", buf, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 48), "handler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, v2, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(a1 + 48);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v11, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      *(_DWORD *)buf = 136315906;
      v22 = "-[RTLocationManager _handleExpiredLocationRequestsWithIndexes:]_block_invoke";
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v11;
      v27 = 2048;
      v28 = v14;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, nil, delta, %.2f", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 48), "handler");
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not get any locations after fallback"), *MEMORY[0x1E0CB2D50]);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v2)[2](v2, 0, v18);

  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  NSString *locationBundlePathShortname;
  int v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v5) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      v16 = 138412546;
      v17 = locationBundlePathShortname;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, unsupported notification, %@", (uint8_t *)&v16, 0x16u);
    }

  }
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    -[RTLocationManager shouldLeechLocations](self, "shouldLeechLocations");
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v9))
  {

  }
  else
  {
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_11;
  }
  -[RTLocationManager shouldMonitorLocations](self, "shouldMonitorLocations");
LABEL_11:
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking, "notificationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v12))
  {

LABEL_14:
    -[RTLocationManager shouldMonitorRhythmicLocations](self, "shouldMonitorRhythmicLocations");
    goto LABEL_15;
  }
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicWaking, "notificationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isEqualToString:", v13);

  if (v14)
    goto LABEL_14;
LABEL_15:

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  NSString *locationBundlePathShortname;
  int v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v5) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      v16 = 138412546;
      v17 = locationBundlePathShortname;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, unsupported notification, %@", (uint8_t *)&v16, 0x16u);
    }

  }
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    -[RTLocationManager shouldLeechLocations](self, "shouldLeechLocations");
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v9))
  {

  }
  else
  {
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_11;
  }
  -[RTLocationManager shouldMonitorLocations](self, "shouldMonitorLocations");
LABEL_11:
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking, "notificationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v12))
  {

LABEL_14:
    -[RTLocationManager shouldMonitorRhythmicLocations](self, "shouldMonitorRhythmicLocations");
    goto LABEL_15;
  }
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicWaking, "notificationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isEqualToString:", v13);

  if (v14)
    goto LABEL_14;
LABEL_15:

}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", v7) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking, "notificationName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isEqualToString:", v8) & 1) != 0)
        {
          v5 = 1;
        }
        else
        {
          +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicWaking, "notificationName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "isEqualToString:", v9) & 1) != 0)
          {
            v5 = 1;
          }
          else
          {
            +[RTNotification notificationName](RTAuthorizationManagerNotificationConsoleUserDidChange, "notificationName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = objc_msgSend(v3, "isEqualToString:", v10);

          }
        }

      }
    }

  }
  return v5;
}

- (void)_removeLocationsPredating:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  if (-[RTLocationManager locationStoreAvailable](self, "locationStoreAvailable"))
  {
    -[RTLocationManager locationStore](self, "locationStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__RTLocationManager__removeLocationsPredating_handler___block_invoke_166;
    v16[3] = &unk_1E9297568;
    v17 = v8;
    objc_msgSend(v9, "removeLocationsPredating:handler:", v7, v16);

    v10 = v17;
  }
  else
  {
    -[RTLocationManager dispatcher](self, "dispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __55__RTLocationManager__removeLocationsPredating_handler___block_invoke;
    v21[3] = &unk_1E9296F70;
    v21[4] = self;
    v22 = v7;
    v23 = v8;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __55__RTLocationManager__removeLocationsPredating_handler___block_invoke_2;
    v18[3] = &unk_1E9298E88;
    v18[4] = self;
    v20 = a2;
    v19 = v23;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enqueueBlock:failureBlock:description:", v21, v18, CFSTR("%@-%@"), v14, v15);

    v10 = v22;
  }

}

uint64_t __55__RTLocationManager__removeLocationsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLocationsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __55__RTLocationManager__removeLocationsPredating_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, %@", buf, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D18598];
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);

  }
}

uint64_t __55__RTLocationManager__removeLocationsPredating_handler___block_invoke_166(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setLocationStoreAvailable:(BOOL)a3
{
  NSObject *v4;
  NSString *locationBundlePathShortname;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_locationStoreAvailable != a3)
  {
    self->_locationStoreAvailable = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      if (self->_locationStoreAvailable)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v10 = 138412546;
      v11 = locationBundlePathShortname;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, locationStore available, %@", (uint8_t *)&v10, 0x16u);
    }

    -[RTLocationManager dispatcher](self, "dispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "invocationsPending");

    if (v8)
    {
      -[RTLocationManager dispatcher](self, "dispatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dispatchPendingInvocations");

    }
  }
}

- (void)onLocationStoreNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  RTLocationManager *v10;
  SEL v11;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__RTLocationManager_onLocationStoreNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __49__RTLocationManager_onLocationStoreNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setLocationStoreAvailable:", objc_msgSend(*(id *)(a1 + 32), "availability") == 2);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(*(id *)(a1 + 32), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138413314;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2080;
      v16 = "-[RTLocationManager onLocationStoreNotification:]_block_invoke";
      v17 = 1024;
      v18 = 1839;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@, %@, unhandled notification, %@ (in %s:%d)", (uint8_t *)&v9, 0x30u);

    }
  }
}

- (void)onUserSessionChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTLocationManager *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__RTLocationManager_onUserSessionChangeNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__RTLocationManager_onUserSessionChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationConsoleUserDidChange, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
      v7 = objc_msgSend(*(id *)(a1 + 32), "activeUser");
      v10 = 138412546;
      v11 = v6;
      v12 = 1024;
      LODWORD(v13) = v7;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, active user did change: is active user: %d", (uint8_t *)&v10, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 40), "shouldPersistLocations");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v9;
      v12 = 2080;
      v13 = "-[RTLocationManager onUserSessionChangeNotification:]_block_invoke";
      v14 = 1024;
      v15 = 1853;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unhandled notification name, %@ (in %s:%d)", (uint8_t *)&v10, 0x1Cu);

    }
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  RTLocationManager *v16;
  id v17;
  int64_t v18;
  SEL v19;

  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTLocationManager_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E929A420;
  v15 = v9;
  v16 = self;
  v18 = a3;
  v19 = a2;
  v17 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(v11, block);

}

void __65__RTLocationManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  if (*(_QWORD *)(a1 + 56) <= 2uLL && (v2 = *(id *)(a1 + 32)) != 0)
  {
    v3 = v2;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__RTLocationManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v6[3] = &unk_1E92984B0;
    v10 = *(_QWORD *)(a1 + 64);
    v4 = *(void **)(a1 + 48);
    v7 = *(id *)(a1 + 40);
    v8 = v2;
    v9 = v4;
    v5 = v3;
    objc_msgSend(v7, "_removeLocationsPredating:handler:", v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __65__RTLocationManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 40), "stringFromDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413058;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, purged locations predating, %@, %@", (uint8_t *)&v8, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)onAuthorizationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTLocationManager *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__RTLocationManager_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__RTLocationManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
    objc_msgSend(*(id *)(a1 + 40), "shouldPersistLocations");
  }
}

- (void)submitHarvestSample:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__RTLocationManager_submitHarvestSample_handler___block_invoke;
  v11[3] = &unk_1E9297650;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __49__RTLocationManager_submitHarvestSample_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "submitSample:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

}

+ (id)errorUsedDelimiter
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Region monitoring Requires an identifier not containing character with ascii value: %02X"), 31);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v4 = *MEMORY[0x1E0D18598];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 7, v5);

  return v6;
}

+ (id)errorDuplicateClientIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = *MEMORY[0x1E0D18598];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Given region monitoring client identifier:%@ is already in use."), v4, *MEMORY[0x1E0CB2D50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 7, v8);

  return v9;
}

+ (id)errorUnregisteredClientIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Client Identifier: %@ received is not registered", buf, 0xCu);
  }

  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = *MEMORY[0x1E0D18598];
  v11 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Given region monitoring client identifier:%@ is not registered."), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 7, v8);

  return v9;
}

+ (id)regionIdentifierDelimiterString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), 31);
}

+ (BOOL)isValidIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "regionIdentifierDelimiterString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v3, "containsString:", v4) ^ 1;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", v7, 2u);
    }

    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (id)regionWithModifiedIdentifier:(id)a3 forRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  objc_class *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    LOWORD(v27) = 0;
    v11 = "Invalid parameter not satisfying: identifier";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v27, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    LOWORD(v27) = 0;
    v11 = "Invalid parameter not satisfying: region";
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (objc_class *)MEMORY[0x1E0C9E460];
LABEL_12:
    v13 = v8;
    v14 = [v9 alloc];
    objc_msgSend(v13, "center");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v13, "radius");
    v12 = (void *)objc_msgSend(v14, "initForLowPowerWithCenter:radius:identifier:", v6, v16, v18, v19);
LABEL_13:
    objc_msgSend(v12, "setNotifyOnEntry:", objc_msgSend(v13, "notifyOnEntry"));
    objc_msgSend(v12, "setNotifyOnExit:", objc_msgSend(v13, "notifyOnExit"));
    objc_msgSend(v12, "setGeoReferenceFrame:", objc_msgSend(v13, "geoReferenceFrame"));
    v20 = objc_msgSend(v13, "conservativeEntry");

    objc_msgSend(v12, "setConservativeEntry:", v20);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (objc_class *)MEMORY[0x1E0C9E368];
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (objc_class *)MEMORY[0x1E0C9E458];
    v13 = v8;
    v23 = [v22 alloc];
    objc_msgSend(v13, "vertices");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v23, "initWithVertices:identifier:", v24, v6);

    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412546;
    v28 = v26;
    v29 = 2112;
    v30 = objc_opt_class();
    _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "%@, received region class of type: %@", (uint8_t *)&v27, 0x16u);

  }
LABEL_9:
  v12 = 0;
LABEL_14:

  return v12;
}

+ (id)clientRegionForRegion:(id)a3 clientIdentifierPrefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
    LOWORD(v18) = 0;
    v14 = "Invalid parameter not satisfying: region";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v18) = 0;
    v14 = "Invalid parameter not satisfying: clientIdentifierPrefix";
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v17;
        v20 = 2112;
        v21 = objc_opt_class();
        _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "%@, received region class of type: %@", (uint8_t *)&v18, 0x16u);

      }
      goto LABEL_10;
    }
  }
  v9 = (void *)objc_opt_class();
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v8, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "regionWithModifiedIdentifier:forRegion:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v12;
}

- (BOOL)_isClientIdentifierAvailable:(id)a3
{
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_regionEventHandlerDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 == 0;
}

- (id)_prefixForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier", v11, 2u);
    }

LABEL_8:
    v7 = 0;
    goto LABEL_10;
  }
  if (!-[RTLocationManager _isClientIdentifierAvailable:](self, "_isClientIdentifierAvailable:", v6))
  {
    objc_msgSend((id)objc_opt_class(), "regionIdentifierDelimiterString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_8;
  objc_msgSend((id)objc_opt_class(), "errorUnregisteredClientIdentifier:", v6);
  v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

- (id)_fullIdentifierForClientIdentifier:(id)a3 regionIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  -[RTLocationManager _prefixForClientIdentifier:error:](self, "_prefixForClientIdentifier:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_regionForClientRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  id v22;
  _QWORD v23[5];
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: clientRegion";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_10;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: clientIdentifier";
    goto LABEL_21;
  }
  v11 = objc_opt_class();
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend((id)v11, "isValidIdentifier:", v12);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[RTLocationManager _fullIdentifierForClientIdentifier:regionIdentifier:error:](self, "_fullIdentifierForClientIdentifier:regionIdentifier:error:", v10, v13, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;

    if (v15)
    {
      if (!a5)
      {
        v17 = 0;
        goto LABEL_19;
      }
      v16 = objc_retainAutorelease(v15);
      v17 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "regionWithModifiedIdentifier:forRegion:", v14, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a5)
      {
LABEL_19:

        goto LABEL_15;
      }
    }
    *a5 = v15;
    goto LABEL_19;
  }
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__72;
  v28 = __Block_byref_object_dispose__72;
  v29 = 0;
  objc_msgSend((id)objc_opt_class(), "errorUsedDelimiter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__RTLocationManager__regionForClientRegion_clientIdentifier_error___block_invoke;
  v23[3] = &unk_1E929BC48;
  v23[4] = buf;
  -[RTLocationManager _performCallbackForClientRegion:clientIdentifier:regionEvent:callbackError:handler:](self, "_performCallbackForClientRegion:clientIdentifier:regionEvent:callbackError:handler:", v8, v10, 4, v20, v23);

  if (a5)
    *a5 = objc_retainAutorelease(*((id *)v25 + 5));
  _Block_object_dispose(buf, 8);

LABEL_14:
  v17 = 0;
LABEL_15:

  return v17;
}

void __67__RTLocationManager__regionForClientRegion_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_clientIdentifierForRegion:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  NSMutableDictionary *regionEventHandlerDictionary;
  id v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  NSMutableDictionary *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  if (v17)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableDictionary allKeys](self->_regionEventHandlerDictionary, "allKeys");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v18 = 0;
          -[RTLocationManager _prefixForClientIdentifier:error:](self, "_prefixForClientIdentifier:error:", v9, &v18);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v18;
          if (!v11)
          {
            objc_msgSend(v17, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "hasPrefix:", v10);

            if ((v13 & 1) != 0)
            {
              v15 = v9;

              goto LABEL_17;
            }
          }

        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v6)
          continue;
        break;
      }
    }

    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      regionEventHandlerDictionary = self->_regionEventHandlerDictionary;
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = regionEventHandlerDictionary;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Region: %@ received does not contain any of the registered client identifier prefixes: %@", buf, 0x16u);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region", buf, 2u);
    }
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (void)performCallbackForRegion:(id)a3 regionEvent:(int64_t)a4 callbackError:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__RTLocationManager_performCallbackForRegion_regionEvent_callbackError_handler___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __80__RTLocationManager_performCallbackForRegion_regionEvent_callbackError_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCallbackForRegion:regionEvent:callbackError:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)_performCallbackForRegion:(id)a3 regionEvent:(int64_t)a4 callbackError:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, id);
  NSObject *v14;
  const char *v15;
  BOOL v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSString *locationBundlePathShortname;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v30;
  _QWORD v31[5];
  void (**v32)(id, id);
  SEL v33;
  _QWORD v34[4];
  id v35;
  id v36;
  void (**v37)(id, id);
  id v38[2];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = (void (**)(id, id))a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Invalid parameter not satisfying: region";
      goto LABEL_16;
    }
LABEL_6:
    v16 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)a4 >= 6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Invalid parameter not satisfying: callbackType >= RTRegionCallbackTypeFirst() && callbackType <= RTRegionCallbackTypeLast()";
LABEL_16:
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  -[RTLocationManager _clientIdentifierForRegion:](self, "_clientIdentifierForRegion:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v30 = 0;
    -[RTLocationManager _prefixForClientIdentifier:error:](self, "_prefixForClientIdentifier:error:", v14, &v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v30;
    if (v18)
      v13[2](v13, v18);
    objc_msgSend((id)objc_opt_class(), "clientRegionForRegion:clientIdentifierPrefix:", v11, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[RTLocationManager _performCallbackForClientRegion:clientIdentifier:regionEvent:callbackError:handler:](self, "_performCallbackForClientRegion:clientIdentifier:regionEvent:callbackError:handler:", v19, v14, a4, v12, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      locationBundlePathShortname = self->_locationBundlePathShortname;
      objc_msgSend((id)objc_opt_class(), "stringForRegionCallbackType:", a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v40 = v21;
      v41 = 2112;
      v42 = locationBundlePathShortname;
      v43 = 2112;
      v44 = v11;
      v45 = 2112;
      v46 = v23;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, defer callback until client registers, region, %@, regionEvent, %@", buf, 0x2Au);

    }
    objc_initWeak((id *)buf, self);
    -[RTLocationManager regionEventDispatcher](self, "regionEventDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __81__RTLocationManager__performCallbackForRegion_regionEvent_callbackError_handler___block_invoke;
    v34[3] = &unk_1E929E820;
    objc_copyWeak(v38, (id *)buf);
    v35 = v11;
    v38[1] = (id)a4;
    v36 = v12;
    v37 = v13;
    v31[0] = v25;
    v31[1] = 3221225472;
    v31[2] = __81__RTLocationManager__performCallbackForRegion_regionEvent_callbackError_handler___block_invoke_2;
    v31[3] = &unk_1E9298E88;
    v31[4] = self;
    v33 = a2;
    v32 = v37;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "enqueueBlock:failureBlock:description:", v34, v31, CFSTR("%@-%@"), v27, v28);

    objc_destroyWeak(v38);
    objc_destroyWeak((id *)buf);
    v14 = 0;
    v16 = 1;
  }
LABEL_14:

  return v16;
}

void __81__RTLocationManager__performCallbackForRegion_regionEvent_callbackError_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_performCallbackForRegion:regionEvent:callbackError:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __81__RTLocationManager__performCallbackForRegion_regionEvent_callbackError_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D18598];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);

  }
}

- (BOOL)_performCallbackForClientRegion:(id)a3 clientIdentifier:(id)a4 regionEvent:(int64_t)a5 callbackError:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  NSString *locationBundlePathShortname;
  void *v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      v18 = "Invalid parameter not satisfying: clientRegion";
      goto LABEL_7;
    }
LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)a5 >= 6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      v18 = "Invalid parameter not satisfying: callbackType >= RTRegionCallbackTypeFirst() && callbackType <= RTRegionCallbackTypeLast()";
LABEL_7:
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v27, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    locationBundlePathShortname = self->_locationBundlePathShortname;
    objc_msgSend((id)objc_opt_class(), "stringForRegionCallbackType:", a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138413570;
    v28 = v20;
    v29 = 2112;
    v30 = locationBundlePathShortname;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v14;
    v35 = 2112;
    v36 = v22;
    v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@, %@, region, %@, identifier, %@, regionEvent, %@, error, %@", (uint8_t *)&v27, 0x3Eu);

  }
  -[NSMutableDictionary objectForKey:](self->_regionEventHandlerDictionary, "objectForKey:", v14);
  v23 = objc_claimAutoreleasedReturnValue();
  v17 = v23;
  if (!v23)
  {
    objc_msgSend((id)objc_opt_class(), "errorUnregisteredClientIdentifier:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v25);

    goto LABEL_13;
  }
  (*(void (**)(uint64_t, id, int64_t, id))(v23 + 16))(v23, v13, a5, v15);
  v16[2](v16, 0);
  v24 = 1;
LABEL_14:

  return v24;
}

- (void)registerForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4
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
  block[2] = __73__RTLocationManager_registerForRegionEventsWithClientIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __73__RTLocationManager_registerForRegionEventsWithClientIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForRegionEventsWithClientIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_registerForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  NSMutableDictionary *regionEventHandlerDictionary;
  void *v16;
  void *v17;
  __int16 v18;
  uint8_t buf[2];
  __int16 v20;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v20 = 0;
    v12 = "Invalid parameter not satisfying: clientIdentifier";
    v13 = (uint8_t *)&v20;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_13;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: handler";
    v13 = buf;
    goto LABEL_10;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isValidIdentifier:", v6) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "errorUsedDelimiter");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[NSMutableDictionary objectForKey:](self->_regionEventHandlerDictionary, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "errorDuplicateClientIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v11 = v10;
    v8[2](v8, 0, 3, v10);
    goto LABEL_13;
  }
  -[NSMutableDictionary objectForKey:](self->_regionEventHandlerDictionary, "objectForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v18 = 0;
    v12 = "Invalid parameter not satisfying: [_regionEventHandlerDictionary objectForKey:clientIdentifier] == nil";
    v13 = (uint8_t *)&v18;
    goto LABEL_10;
  }
  regionEventHandlerDictionary = self->_regionEventHandlerDictionary;
  v16 = (void *)MEMORY[0x1D8232094](v8);
  -[NSMutableDictionary setObject:forKey:](regionEventHandlerDictionary, "setObject:forKey:", v16, v6);

  -[RTLocationManager regionEventDispatcher](self, "regionEventDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v17, "invocationsPending");

  if (!(_DWORD)v16)
    goto LABEL_14;
  -[RTLocationManager regionEventDispatcher](self, "regionEventDispatcher");
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSObject dispatchPendingInvocations](v11, "dispatchPendingInvocations");
LABEL_13:

LABEL_14:
}

- (void)unregisterForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4
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
  block[2] = __75__RTLocationManager_unregisterForRegionEventsWithClientIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __75__RTLocationManager_unregisterForRegionEventsWithClientIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterForRegionEventsWithClientIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_unregisterForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v13;
  __int16 v14;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v14 = 0;
    v11 = "Invalid parameter not satisfying: clientIdentifier";
    v12 = (uint8_t *)&v14;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_13;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v13 = 0;
    v11 = "Invalid parameter not satisfying: handler";
    v12 = (uint8_t *)&v13;
    goto LABEL_10;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isValidIdentifier:", v6) & 1) != 0)
  {
    if (!-[RTLocationManager _isClientIdentifierAvailable:](self, "_isClientIdentifierAvailable:", v6))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_regionEventHandlerDictionary, "removeObjectForKey:", v6);
      v8[2](v8, 0);
      goto LABEL_14;
    }
    objc_msgSend((id)objc_opt_class(), "errorUnregisteredClientIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "errorUsedDelimiter");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v8[2](v8, v9);
LABEL_13:

LABEL_14:
}

- (BOOL)startMonitoringForRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSString *locationBundlePathShortname;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  _QWORD block[5];
  uint64_t (*v20)(uint64_t, uint64_t);
  id v21;
  _QWORD *v22;
  _BYTE *v23;
  _QWORD v24[5];
  id v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientRegion", buf, 2u);
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier", buf, 2u);
    }
LABEL_13:

    v16 = 0;
    goto LABEL_14;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = locationBundlePathShortname;
    *(_WORD *)&buf[22] = 2112;
    v27 = v9;
    LOWORD(v28) = 2112;
    *(_QWORD *)((char *)&v28 + 2) = v11;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, region, %@, clientIdentifier, %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__72;
  *(_QWORD *)&v28 = __Block_byref_object_dispose__72;
  *((_QWORD *)&v28 + 1) = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__72;
  v24[4] = __Block_byref_object_dispose__72;
  v25 = 0;
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__RTLocationManager_startMonitoringForRegion_clientIdentifier_error___block_invoke;
  block[3] = &unk_1E929E848;
  v22 = v24;
  block[4] = self;
  v20 = v9;
  v21 = v11;
  v23 = buf;
  dispatch_sync(v15, block);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:
  return v16;
}

void __69__RTLocationManager_startMonitoringForRegion_clientIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_regionForClientRegion:clientIdentifier:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startMonitoringForRegion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  }
}

- (BOOL)stopMonitoringForRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSString *locationBundlePathShortname;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  _QWORD block[5];
  uint64_t (*v20)(uint64_t, uint64_t);
  id v21;
  _QWORD *v22;
  _BYTE *v23;
  _QWORD v24[5];
  id v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientRegion", buf, 2u);
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier", buf, 2u);
    }
LABEL_13:

    v16 = 0;
    goto LABEL_14;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = locationBundlePathShortname;
    *(_WORD *)&buf[22] = 2112;
    v27 = v9;
    LOWORD(v28) = 2112;
    *(_QWORD *)((char *)&v28 + 2) = v11;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, region %@, clientIdentifier, %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__72;
  *(_QWORD *)&v28 = __Block_byref_object_dispose__72;
  *((_QWORD *)&v28 + 1) = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__72;
  v24[4] = __Block_byref_object_dispose__72;
  v25 = 0;
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTLocationManager_stopMonitoringForRegion_clientIdentifier_error___block_invoke;
  block[3] = &unk_1E929E848;
  v22 = v24;
  block[4] = self;
  v20 = v9;
  v21 = v11;
  v23 = buf;
  dispatch_sync(v15, block);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:
  return v16;
}

void __68__RTLocationManager_stopMonitoringForRegion_clientIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_regionForClientRegion:clientIdentifier:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopMonitoringForRegion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  }
}

- (BOOL)stopMonitoringAllRegionsForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  _QWORD block[5];
  id v12;
  uint8_t *v13;
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__72;
    v18 = __Block_byref_object_dispose__72;
    v19 = 0;
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__RTLocationManager_stopMonitoringAllRegionsForClientIdentifier_error___block_invoke;
    block[3] = &unk_1E9297AD0;
    block[4] = self;
    v12 = v6;
    v13 = buf;
    dispatch_sync(v7, block);

    if (a4)
      *a4 = objc_retainAutorelease(*((id *)v15 + 5));
    v8 = *((_QWORD *)v15 + 5) == 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

void __71__RTLocationManager_stopMonitoringAllRegionsForClientIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_stopMonitoringAllRegionsForClientIdentifier:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (BOOL)_stopMonitoringAllRegionsForClientIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  NSString *locationBundlePathShortname;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  id *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138412802;
    v31 = v9;
    v32 = 2112;
    v33 = locationBundlePathShortname;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, clientIdentifier, %@", buf, 0x20u);

  }
  v11 = -[RTLocationManager _isClientIdentifierAvailable:](self, "_isClientIdentifierAvailable:", v7);
  if (v11)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorUnregisteredClientIdentifier:", v7);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      *a4 = v12;
    }
  }
  else
  {
    v24 = a4;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[RTLocationManager locationManager](self, "locationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "monitoredRegions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[RTLocationManager _clientIdentifierForRegion:](self, "_clientIdentifierForRegion:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v7);

          if (v21)
          {
            -[RTLocationManager locationManager](self, "locationManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stopMonitoringForRegion:", v19);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v16);
    }

    a4 = v24;
    if (v24)
    {
      v12 = 0;
      goto LABEL_17;
    }
  }

  return !v11;
}

- (BOOL)isMonitoringForRegionWithClientIdentifier:(id)a3 regionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v10 = 0;
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: clientIdentifier";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: regionIdentifier";
    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x2020000000;
  v21 = 0;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__RTLocationManager_isMonitoringForRegionWithClientIdentifier_regionIdentifier___block_invoke;
  v14[3] = &unk_1E92987D0;
  v17 = buf;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  dispatch_sync(v9, v14);

  v10 = v19[24] != 0;
  _Block_object_dispose(buf, 8);
LABEL_8:

  return v10;
}

uint64_t __80__RTLocationManager_isMonitoringForRegionWithClientIdentifier_regionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isMonitoringForRegionWithClientIdentifier:regionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_isMonitoringForRegionWithClientIdentifier:(id)a3 regionIdentifier:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  char *v10;
  NSString *locationBundlePathShortname;
  NSObject *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138412802;
    v31 = v10;
    v32 = 2112;
    v33 = locationBundlePathShortname;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, clientIdentifier, %@", buf, 0x20u);

  }
  if (-[RTLocationManager _isClientIdentifierAvailable:](self, "_isClientIdentifierAvailable:", v7))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "errorUnregisteredClientIdentifier:", v7);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[RTLocationManager _isMonitoringForRegionWithClientIdentifier:regionIdentifier:]";
      v32 = 2112;
      v33 = v13;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%s, failed with error, %@", buf, 0x16u);

    }
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[RTLocationManager locationManager](self, "locationManager", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "monitoredRegions");
    v12 = objc_claimAutoreleasedReturnValue();

    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[RTLocationManager _clientIdentifierForRegion:](self, "_clientIdentifierForRegion:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isEqualToString:", v7) & 1) != 0)
          {
            objc_msgSend(v19, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "containsString:", v8);

            if ((v22 & 1) != 0)
            {
              v23 = 1;
              goto LABEL_18;
            }
          }
          else
          {

          }
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v16);
    }
  }
  v23 = 0;
LABEL_18:

  return v23;
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSString *locationBundlePathShortname;
  _QWORD v17[5];
  id v18;
  SEL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9
    || (-[RTLocationManager locationManager](self, "locationManager"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v9, "isEqual:", v12),
        v12,
        v13))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      locationBundlePathShortname = self->_locationBundlePathShortname;
      *(_DWORD *)buf = 138413058;
      v21 = v15;
      v22 = 2112;
      v23 = locationBundlePathShortname;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, region, %@, error, %@", buf, 0x2Au);

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__RTLocationManager_locationManager_monitoringDidFailForRegion_withError___block_invoke;
    v17[3] = &unk_1E929B1E0;
    v19 = a2;
    v17[4] = self;
    v18 = v10;
    -[RTLocationManager performCallbackForRegion:regionEvent:callbackError:handler:](self, "performCallbackForRegion:regionEvent:callbackError:handler:", v18, 4, v11, v17);

  }
}

void __74__RTLocationManager_locationManager_monitoringDidFailForRegion_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend((id)objc_opt_class(), "stringForRegionCallbackType:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138413314;
      v10 = v5;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, performCallback, region, %@, regionEvent, %@, error, %@", (uint8_t *)&v9, 0x34u);

    }
  }

}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSString *locationBundlePathShortname;
  _QWORD v14[5];
  id v15;
  SEL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7
    || (-[RTLocationManager locationManager](self, "locationManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v7, "isEqual:", v9),
        v9,
        v10))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      locationBundlePathShortname = self->_locationBundlePathShortname;
      *(_DWORD *)buf = 138412802;
      v18 = v12;
      v19 = 2112;
      v20 = locationBundlePathShortname;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, region, %@", buf, 0x20u);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__RTLocationManager_locationManager_didStartMonitoringForRegion___block_invoke;
    v14[3] = &unk_1E929B1E0;
    v16 = a2;
    v14[4] = self;
    v15 = v8;
    -[RTLocationManager performCallbackForRegion:regionEvent:callbackError:handler:](self, "performCallbackForRegion:regionEvent:callbackError:handler:", v15, 5, 0, v14);

  }
}

void __65__RTLocationManager_locationManager_didStartMonitoringForRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend((id)objc_opt_class(), "stringForRegionCallbackType:", 5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138413314;
      v10 = v5;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, performCallback, region, %@, regionEvent, %@, error, %@", (uint8_t *)&v9, 0x34u);

    }
  }

}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSString *locationBundlePathShortname;
  const __CFString *v17;
  id *v18;
  id v19;
  uint64_t *v20;
  RTLocationManager *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  RTLocationManager *v27;
  _QWORD v28[2];
  _QWORD v29[5];
  _QWORD v30[2];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9
    || (-[RTLocationManager locationManager](self, "locationManager"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v9, "isEqual:", v11),
        v11,
        v12))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      locationBundlePathShortname = self->_locationBundlePathShortname;
      v17 = CFSTR("Unknown");
      if (a4 == 2)
        v17 = CFSTR("Outside");
      *(_DWORD *)buf = 138413058;
      v32 = v14;
      v34 = locationBundlePathShortname;
      v33 = 2112;
      if (a4 == 1)
        v17 = CFSTR("Inside");
      v35 = 2112;
      v36 = v17;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, state, %@, region, %@", buf, 0x2Au);

    }
    if (a4 == 2)
    {
      if (objc_msgSend(v10, "notifyOnExit"))
      {
        v23 = MEMORY[0x1E0C809B0];
        v24 = 3221225472;
        v25 = __65__RTLocationManager_locationManager_didDetermineState_forRegion___block_invoke_183;
        v26 = &unk_1E929B1E0;
        v28[1] = a2;
        v27 = self;
        v18 = (id *)v28;
        v19 = v10;
        v28[0] = v19;
        v20 = &v23;
        v21 = self;
        v22 = 2;
        goto LABEL_15;
      }
    }
    else if (a4 == 1 && objc_msgSend(v10, "notifyOnEntry"))
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __65__RTLocationManager_locationManager_didDetermineState_forRegion___block_invoke;
      v29[3] = &unk_1E929B1E0;
      v30[1] = a2;
      v29[4] = self;
      v18 = (id *)v30;
      v19 = v10;
      v30[0] = v19;
      v20 = v29;
      v21 = self;
      v22 = 1;
LABEL_15:
      -[RTLocationManager performCallbackForRegion:regionEvent:callbackError:handler:](v21, "performCallbackForRegion:regionEvent:callbackError:handler:", v19, v22, 0, v20, v23, v24, v25, v26, v27, v28[0]);

    }
  }

}

void __65__RTLocationManager_locationManager_didDetermineState_forRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend((id)objc_opt_class(), "stringForRegionCallbackType:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138413314;
      v10 = v5;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, performCallback, region, %@, regionEvent, %@, error, %@", (uint8_t *)&v9, 0x34u);

    }
  }

}

void __65__RTLocationManager_locationManager_didDetermineState_forRegion___block_invoke_183(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend((id)objc_opt_class(), "stringForRegionCallbackType:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138413314;
      v10 = v5;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, performCallback, region, %@, regionEvent, %@, error, %@", (uint8_t *)&v9, 0x34u);

    }
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSString *locationBundlePathShortname;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    v8 = 138412546;
    v9 = locationBundlePathShortname;
    v10 = 2112;
    v11 = v5;
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, locationManager didFailWithError: %@", (uint8_t *)&v8, 0x16u);
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
  RTLocationManager *v14;
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
    v12[2] = __70__RTLocationManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
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

void __70__RTLocationManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("options cannot be nil");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (const __CFString **)v24;
    v10 = &v23;
LABEL_7:
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v13 = v7;
    v14 = 7;
    goto LABEL_9;
  }
  v3 = objc_msgSend(v2, "enumeratedType");
  objc_msgSend((id)objc_opt_class(), "vendedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "member:", v3);

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("the type specified by options is not vended by this manager");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v22;
    v10 = &v21;
    goto LABEL_7;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "locationStoreAvailable") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "locationStore");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchEnumerableObjectsWithOptions:offset:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

    return;
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *MEMORY[0x1E0D18598];
  v19 = *MEMORY[0x1E0CB2D50];
  v20 = CFSTR("store is not available");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  v13 = v16;
  v14 = 5;
LABEL_9:
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)setCurrentLocationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocationRequests, a3);
}

- (BOOL)leechingLocations
{
  return self->_leechingLocations;
}

- (BOOL)monitoringLocations
{
  return self->_monitoringLocations;
}

- (BOOL)monitoringRhythmicLocations
{
  return self->_monitoringRhythmicLocations;
}

- (NSString)effectiveLocationBundlePath
{
  return self->_effectiveLocationBundlePath;
}

- (void)setEffectiveLocationBundlePath:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveLocationBundlePath, a3);
}

- (NSString)locationBundlePathShortname
{
  return self->_locationBundlePathShortname;
}

- (RTTimer)activeLocationRequestTimer
{
  return self->_activeLocationRequestTimer;
}

- (void)setActiveLocationRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activeLocationRequestTimer, a3);
}

- (void)setPowerAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_powerAssertion, a3);
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (CLLocationManager)rhythmicLocationManager
{
  return self->_rhythmicLocationManager;
}

- (void)setRhythmicLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_rhythmicLocationManager, a3);
}

- (void)setLocationManagerRoutine:(id)a3
{
  objc_storeStrong((id *)&self->_locationManagerRoutine, a3);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
}

- (RTLocationSmoother)locationSmoother
{
  return self->_locationSmoother;
}

- (void)setLocationSmoother:(id)a3
{
  objc_storeStrong((id *)&self->_locationSmoother, a3);
}

- (void)setLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_locationStore, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTTrustedTimeCache)trustedTimeCache
{
  return self->_trustedTimeCache;
}

- (NSMutableDictionary)regionEventHandlerDictionary
{
  return self->_regionEventHandlerDictionary;
}

- (void)setRegionEventHandlerDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_regionEventHandlerDictionary, a3);
}

- (RTInvocationDispatcher)regionEventDispatcher
{
  return self->_regionEventDispatcher;
}

- (void)setRegionEventDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_regionEventDispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionEventDispatcher, 0);
  objc_storeStrong((id *)&self->_regionEventHandlerDictionary, 0);
  objc_storeStrong((id *)&self->_trustedTimeCache, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_locationSmoother, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_locationManagerRoutine, 0);
  objc_storeStrong((id *)&self->_rhythmicLocationManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_activeLocationRequestTimer, 0);
  objc_storeStrong((id *)&self->_locationBundlePathShortname, 0);
  objc_storeStrong((id *)&self->_effectiveLocationBundlePath, 0);
  objc_storeStrong((id *)&self->_currentLocationRequests, 0);
}

- (void)injectLocations:(id)a3 handler:(id)a4
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
  block[2] = __57__RTLocationManager_Evaluation__injectLocations_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __57__RTLocationManager_Evaluation__injectLocations_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "locationStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeLocations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
