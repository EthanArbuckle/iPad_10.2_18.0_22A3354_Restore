@implementation CARDNDGeofencingObserver

- (CARDNDGeofencingObserver)init
{
  CARDNDGeofencingObserver *v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  CRWiFiCarManager *v11;
  CARDNDGeofencingObserver *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = [CARDNDGeofencingObserver alloc];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v4 = (void *)qword_1000DB828;
  v24 = qword_1000DB828;
  if (!qword_1000DB828)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100014584;
    v20[3] = &unk_1000B5320;
    v20[4] = &v21;
    sub_100014584((uint64_t)v20);
    v4 = (void *)v22[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v21, 8);
  v6 = objc_alloc_init(v5);
  v7 = objc_alloc((Class)CLLocationManager);
  v8 = CRAutomaticDNDLocationBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v7, "initWithEffectiveBundle:", v9);
  v11 = objc_alloc_init(CRWiFiCarManager);
  v12 = -[CARDNDGeofencingObserver initWithRoutineManager:locationManager:wiFiManager:](v3, "initWithRoutineManager:locationManager:wiFiManager:", v6, v10, v11);

  v17 = CarDNDWDLogging(v13, v14, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Geofencing observer initialized", (uint8_t *)v20, 2u);
  }

  return v12;
}

- (CARDNDGeofencingObserver)initWithRoutineManager:(id)a3 locationManager:(id)a4 wiFiManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  CARDNDGeofencingObserver *v11;
  CARDNDGeofencingObserver *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *monitoredRegions;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CARDNDGeofencingObserver;
  v11 = -[CARDNDGeofencingObserver init](&v19, "init");
  v12 = v11;
  if (v11)
  {
    -[CARDNDGeofencingObserver setRoutineManager:](v11, "setRoutineManager:", v8);
    -[CARDNDGeofencingObserver setLocationManager:](v12, "setLocationManager:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver locationManager](v12, "locationManager"));
    objc_msgSend(v13, "setDelegate:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver locationManager](v12, "locationManager"));
    objc_msgSend(v14, "setDesiredAccuracy:", kCLLocationAccuracyHundredMeters);

    -[CARDNDGeofencingObserver setWiFiManager:](v12, "setWiFiManager:", v10);
    v15 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    monitoredRegions = v12->_monitoredRegions;
    v12->_monitoredRegions = (NSArray *)v15;

    v12->_exitConfirmationOverride = 0;
    v12->_locationServicesEnabled = CRAutomaticDNDLocationServicesEnabled();
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, "_checkWiFiPowerForGeofences", CFSTR("CRWiFiPowerChangedNotification"), 0);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CARDNDGeofencingObserver stopMonitoringLOIs](self, "stopMonitoringLOIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CARDNDGeofencingObserver;
  -[CARDNDGeofencingObserver dealloc](&v4, "dealloc");
}

- (void)beginMonitoringLOIsWithStartingLocationGeofence:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t buf[16];
  uint8_t v31[16];

  v3 = a3;
  v5 = -[CARDNDGeofencingObserver _shouldCreateGeofences](self, "_shouldCreateGeofences");
  v6 = v5;
  v10 = CarDNDWDLogging(v5, v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning to fetch LOIs for geofencing", buf, 2u);
    }

    -[CARDNDGeofencingObserver setActivelyMonitoringGeofences:](self, "setActivelyMonitoringGeofences:", 1);
    -[CARDNDGeofencingObserver setShouldCreateGeofenceAroundStart:](self, "setShouldCreateGeofenceAroundStart:", v3);
    if (-[CARDNDGeofencingObserver shouldCreateGeofenceAroundStart](self, "shouldCreateGeofenceAroundStart")
      && !-[CARDNDGeofencingObserver didCreateGeofenceAroundStart](self, "didCreateGeofenceAroundStart"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver locationManager](self, "locationManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "location"));

      if (v14
        && (v15 = objc_msgSend(v14, "horizontalAccuracy"), v19 < 400.0)
        && (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timestamp")),
            objc_msgSend(v20, "timeIntervalSinceNow"),
            v22 = fabs(v21),
            v20,
            v22 <= 30.0))
      {
        v25 = CarDNDWDLogging(v15, v16, v17, v18);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Creating geofence around start location using cached location", v29, 2u);
        }

        objc_msgSend(v14, "coordinate");
        v24 = objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver _addCoordinatesToMonitoredRegion:identifier:radius:](self, "_addCoordinatesToMonitoredRegion:identifier:radius:", CFSTR("Start Identifier"), 100));
        -[NSObject setRegionState:](v24, "setRegionState:", 1);
        -[CARDNDGeofencingObserver setDidCreateGeofenceAroundStart:](self, "setDidCreateGeofenceAroundStart:", 1);
        -[CARDNDGeofencingObserver setIsCurrentlyInsideGeofence:](self, "setIsCurrentlyInsideGeofence:", 1);
        -[CARDNDGeofencingObserver _createGeofencesAroundPredictedLocationsFromLocation:](self, "_createGeofencesAroundPredictedLocationsFromLocation:", v14);
      }
      else
      {
        v23 = CarDNDWDLogging(v15, v16, v17, v18);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No start location geofence created, location manager doesn't have cached location or accuracy does not qualify", v28, 2u);
        }
      }

    }
    -[CARDNDGeofencingObserver _postNotificationForGeofence](self, "_postNotificationForGeofence");
    -[CARDNDGeofencingObserver _createGeofencesAroundHomeAndWork](self, "_createGeofencesAroundHomeAndWork");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver locationManager](self, "locationManager"));
    objc_msgSend(v27, "startMonitoringSignificantLocationChanges");

  }
  else
  {
    if (v12)
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not setting up geofences; posting exit confirmation.",
        v31,
        2u);
    }

    -[CARDNDGeofencingObserver _postNotificationForGeofence](self, "_postNotificationForGeofence");
  }
}

- (void)stopMonitoringLOIs
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];

  v3 = CarDNDWDLogging(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stop fetching LOIs for geofencing", buf, 2u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver monitoredRegions](self, "monitoredRegions", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver locationManager](self, "locationManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "region"));
        objc_msgSend(v11, "stopMonitoringForRegion:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  -[CARDNDGeofencingObserver setDidCreateGeofenceAroundStart:](self, "setDidCreateGeofenceAroundStart:", 0);
  -[CARDNDGeofencingObserver setShouldCreateGeofenceAroundStart:](self, "setShouldCreateGeofenceAroundStart:", 0);
  -[CARDNDGeofencingObserver setIsCurrentlyInsideGeofence:](self, "setIsCurrentlyInsideGeofence:", 0);
  -[CARDNDGeofencingObserver setActivelyMonitoringGeofences:](self, "setActivelyMonitoringGeofences:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  -[CARDNDGeofencingObserver setMonitoredRegions:](self, "setMonitoredRegions:", v13);

  v16 = CarDNDWDLogging(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Geofences cleared", buf, 2u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver locationManager](self, "locationManager"));
  objc_msgSend(v18, "stopMonitoringSignificantLocationChanges");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver locationManager](self, "locationManager"));
  objc_msgSend(v19, "stopUpdatingLocation");

  -[CARDNDGeofencingObserver _postNotificationForGeofence](self, "_postNotificationForGeofence");
}

- (BOOL)currentlyInRegion
{
  NSObject *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver monitoredRegions](self, "monitoredRegions"));
  v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "regionState") == (id)1)
        {
          v12 = CarDNDWDLogging(1, v7);
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            sub_1000693A8();

          v11 = 1;
          goto LABEL_15;
        }
      }
      v4 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
        continue;
      break;
    }
  }

  v10 = CarDNDWDLogging(v8, v9);
  v2 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Not in any monitored regions", v15, 2u);
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (void)setExitConfirmationOverride:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  v5 = CarDNDWDLogging(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting exit confirmation override %@", (uint8_t *)&v8, 0xCu);

  }
  if (self->_exitConfirmationOverride != v3)
  {
    self->_exitConfirmationOverride = v3;
    -[CARDNDGeofencingObserver _postNotificationForGeofence](self, "_postNotificationForGeofence");
  }
}

- (id)_addCoordinatesToMonitoredRegion:(CLLocationCoordinate2D)a3 identifier:(id)a4 radius:(unint64_t)a5
{
  double longitude;
  double latitude;
  id v9;
  _CARDNDRegion *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  id v26;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a4;
  v10 = objc_alloc_init(_CARDNDRegion);
  v11 = objc_msgSend(objc_alloc((Class)CLCircularRegion), "initWithCenter:radius:identifier:", v9, latitude, longitude, (double)a5);
  -[_CARDNDRegion setRegion:](v10, "setRegion:", v11);

  v14 = CarDNDWDLogging(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_100069448(v15, latitude, longitude);

  v18 = CarDNDWDLogging(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Creating geofence for [%@]", (uint8_t *)&v25, 0xCu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver monitoredRegions](self, "monitoredRegions"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arrayByAddingObject:", v10));
  -[CARDNDGeofencingObserver setMonitoredRegions:](self, "setMonitoredRegions:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver locationManager](self, "locationManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_CARDNDRegion region](v10, "region"));
  objc_msgSend(v22, "startMonitoringForRegion:", v23);

  return v10;
}

- (void)_postNotificationForGeofence
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  CFStringRef *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  _BOOL8 v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v27;
  const __CFString *v28;
  _BOOL8 v29;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  uint8_t v39[2];
  uint8_t buf[2];

  v3 = -[CARDNDGeofencingObserver exitConfirmationOverride](self, "exitConfirmationOverride");
  if (!v3)
  {
    v10 = -[CARDNDGeofencingObserver isDNDActive](self, "isDNDActive");
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver wiFiManager](self, "wiFiManager"));
      v13 = objc_msgSend(v12, "isPowered");

      if ((v13 & 1) == 0)
      {
        v31 = CarDNDWDLogging(v14, v15);
        v6 = objc_claimAutoreleasedReturnValue(v31);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_5;
        v38 = 0;
        v7 = "Posting Exit Confirmation Enabled because WiFi is powered off.";
        v8 = (uint8_t *)&v38;
        goto LABEL_4;
      }
      v16 = -[CARDNDGeofencingObserver locationServicesEnabled](self, "locationServicesEnabled");
      if (!v16)
      {
        v32 = CarDNDWDLogging(v16, v17);
        v6 = objc_claimAutoreleasedReturnValue(v32);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_5;
        v37 = 0;
        v7 = "Posting Exit Confirmation Enabled because Location Services are disabled";
        v8 = (uint8_t *)&v37;
        goto LABEL_4;
      }
      v18 = -[CARDNDGeofencingObserver activelyMonitoringGeofences](self, "activelyMonitoringGeofences");
      if (!v18)
      {
        v33 = CarDNDWDLogging(v18, v19);
        v6 = objc_claimAutoreleasedReturnValue(v33);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v36 = 0;
        v25 = "Posting Exit Confirmation Disabled because we are not monitoring geofences";
        v26 = (uint8_t *)&v36;
        goto LABEL_15;
      }
      v20 = -[CARDNDGeofencingObserver isCurrentlyInsideGeofence](self, "isCurrentlyInsideGeofence");
      v21 = v20;
      v23 = CarDNDWDLogging(v20, v22);
      v6 = objc_claimAutoreleasedReturnValue(v23);
      v24 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (!v21)
      {
        if (!v24)
          goto LABEL_5;
        LOWORD(v34) = 0;
        v7 = "Posting Exit Confirmation Enabled because we are not in a geofence";
        v8 = (uint8_t *)&v34;
        goto LABEL_4;
      }
      if (v24)
      {
        v35 = 0;
        v25 = "Posting Exit Confirmation Disabled because we are in a geofence";
        v26 = (uint8_t *)&v35;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v25, v26, 2u);
      }
    }
    else
    {
      v27 = CarDNDWDLogging(v10, v11);
      v6 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        v25 = "Posting Exit Confirmation Disabled because the Driving mode is not active";
        v26 = v39;
        goto LABEL_15;
      }
    }
LABEL_16:
    v9 = (CFStringRef *)&CARAutomaticDNDExitConfirmationDisabledNotification;
    goto LABEL_17;
  }
  v5 = CarDNDWDLogging(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "Posting Exit Confirmation Enabled because of override.";
    v8 = buf;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
  }
LABEL_5:
  v9 = (CFStringRef *)&CARAutomaticDNDExitConfirmationEnabledNotification;
LABEL_17:

  v28 = *v9;
  v29 = CFStringCompare(*v9, CARAutomaticDNDExitConfirmationEnabledNotification, 0) == kCFCompareEqualTo;
  -[CARDNDGeofencingObserver setExitConfirmationActive:](self, "setExitConfirmationActive:", v29, v34);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v28, 0, 0, 1u);
}

- (void)_updateState:(int64_t)a3 forRegion:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  int64_t v30;
  int64_t v31;
  uint64_t v32;
  __int128 v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int64_t v47;
  _BYTE v48[128];

  v5 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver monitoredRegions](self, "monitoredRegions"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v37;
    *(_QWORD *)&v7 = 138413058;
    v33 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "region", v33));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
        {
          v18 = CarDNDWDLogging(v16, v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
            objc_msgSend(v5, "center");
            v31 = v30;
            objc_msgSend(v5, "center");
            *(_DWORD *)buf = v33;
            v41 = v29;
            v42 = 2048;
            v43 = v31;
            v44 = 2048;
            v45 = v32;
            v46 = 2048;
            v47 = a3;
            _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Updating region state for [%@] lat/long: {%f, %f}: %ld", buf, 0x2Au);

          }
          v22 = CarDNDWDLogging(v20, v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
            *(_DWORD *)buf = 138412546;
            v41 = v24;
            v42 = 2048;
            v43 = a3;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updating region state for geofence [%@]: %ld", buf, 0x16u);

          }
          objc_msgSend(v11, "setRegionState:", a3);
          v25 = -[CARDNDGeofencingObserver currentlyInRegion](self, "currentlyInRegion");
          if (v25 != -[CARDNDGeofencingObserver isCurrentlyInsideGeofence](self, "isCurrentlyInsideGeofence"))
          {
            -[CARDNDGeofencingObserver setIsCurrentlyInsideGeofence:](self, "setIsCurrentlyInsideGeofence:", v25);
            -[CARDNDGeofencingObserver _postNotificationForGeofence](self, "_postNotificationForGeofence");
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver delegate](self, "delegate"));
          v27 = objc_opt_respondsToSelector(v26, "geofencingObserver:didUpdateRegionState:");

          if ((v27 & 1) != 0)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver delegate](self, "delegate"));
            objc_msgSend(v28, "geofencingObserver:didUpdateRegionState:", self, a3);

          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v8);
  }

}

- (void)_createGeofenceForLOI:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  CLLocationDegrees v21;
  void *v22;
  CLLocationDegrees v23;
  CLLocationCoordinate2D v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CARDNDGeofencingObserver *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v4 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver monitoredRegions](self, "monitoredRegions"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "region"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
        v14 = objc_msgSend(v11, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {

          v30 = CarDNDWDLogging(v28, v29);
          v19 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            sub_10006956C();
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v7)
        continue;
      break;
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver monitoredRegions](v32, "monitoredRegions"));
  v16 = objc_msgSend(v15, "count");

  if ((unint64_t)v16 > 0x13)
  {
    v31 = CarDNDWDLogging(v17, v18);
    v19 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_1000694CC();
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    -[NSObject latitude](v19, "latitude");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    objc_msgSend(v22, "longitude");
    v24 = CLLocationCoordinate2DMake(v21, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
    v27 = -[CARDNDGeofencingObserver _addCoordinatesToMonitoredRegion:identifier:radius:](v32, "_addCoordinatesToMonitoredRegion:identifier:radius:", v26, 400, v24.latitude, v24.longitude);

  }
LABEL_15:

}

- (void)_createGeofencesAroundPredictedLocationsFromLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver routineManager](self, "routineManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000132B0;
  v7[3] = &unk_1000B5488;
  v7[4] = self;
  objc_msgSend(v5, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:", v4, v6, v7, 28800.0);

}

- (void)_createGeofencesAroundHomeAndWork
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[16];

  v3 = CarDNDWDLogging(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching home LOI", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver routineManager](self, "routineManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000135E0;
  v12[3] = &unk_1000B5488;
  v12[4] = self;
  objc_msgSend(v5, "fetchLocationsOfInterestOfType:withHandler:", 0, v12);

  v8 = CarDNDWDLogging(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching work LOI", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver routineManager](self, "routineManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001380C;
  v11[3] = &unk_1000B5488;
  v11[4] = self;
  objc_msgSend(v10, "fetchLocationsOfInterestOfType:withHandler:", 1, v11);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013A90;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  CARDNDGeofencingObserver *v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013C24;
  v6[3] = &unk_1000B5390;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lastObject", a3));
  v8 = self;
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = a4;
  v6 = CarDNDWDLogging(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10006960C();

  v10 = CarDNDWDLogging(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Begin monitoring for [%@]", (uint8_t *)&v13, 0xCu);

  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;

  v5 = a4;
  v7 = CarDNDWDLogging(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_10006967C();

  v11 = CarDNDWDLogging(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    *(_DWORD *)buf = 138412290;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Entered region for [%@]", buf, 0xCu);

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001402C;
  v15[3] = &unk_1000B5390;
  v15[4] = self;
  v16 = v5;
  v14 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;

  v5 = a4;
  v7 = CarDNDWDLogging(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000696EC();

  v11 = CarDNDWDLogging(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    *(_DWORD *)buf = 138412290;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Exited region for [%@]", buf, 0xCu);

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100014180;
  v15[3] = &unk_1000B5390;
  v15[4] = self;
  v16 = v5;
  v14 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int64_t v19;

  v7 = a5;
  v9 = CarDNDWDLogging(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    *(_DWORD *)buf = 138412546;
    v17 = v11;
    v18 = 2048;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Determined state for [%@]: %ld", buf, 0x16u);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000142C4;
  block[3] = &unk_1000B54B0;
  v14 = v7;
  v15 = a4;
  block[4] = self;
  v12 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a4;
  v6 = CarDNDWDLogging(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    sub_10006975C((uint64_t)v4, v7);

}

- (BOOL)_shouldCreateGeofences
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  __int16 v15;
  __int16 v16;

  v3 = -[CARDNDGeofencingObserver locationServicesEnabled](self, "locationServicesEnabled");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver wiFiManager](self, "wiFiManager"));
    v6 = objc_msgSend(v5, "isPowered");

    if ((v6 & 1) != 0)
      return 1;
    v14 = CarDNDWDLogging(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v12 = "WiFi is powered off.";
      v13 = (uint8_t *)&v15;
      goto LABEL_8;
    }
  }
  else
  {
    v10 = CarDNDWDLogging(v3, v4);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v12 = "Location services are not enabled.";
      v13 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
  }

  return 0;
}

- (void)_checkWiFiPowerForGeofences
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDGeofencingObserver wiFiManager](self, "wiFiManager"));
  v4 = objc_msgSend(v3, "isPowered");

  if ((v4 & 1) == 0)
    -[CARDNDGeofencingObserver stopMonitoringLOIs](self, "stopMonitoringLOIs");
}

- (BOOL)isDNDActive
{
  return self->_DNDActive;
}

- (void)setDNDActive:(BOOL)a3
{
  self->_DNDActive = a3;
}

- (CARDNDGeofencingObserverDelegate)delegate
{
  return (CARDNDGeofencingObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)didCreateGeofenceAroundStart
{
  return self->_didCreateGeofenceAroundStart;
}

- (void)setDidCreateGeofenceAroundStart:(BOOL)a3
{
  self->_didCreateGeofenceAroundStart = a3;
}

- (BOOL)shouldCreateGeofenceAroundStart
{
  return self->_shouldCreateGeofenceAroundStart;
}

- (void)setShouldCreateGeofenceAroundStart:(BOOL)a3
{
  self->_shouldCreateGeofenceAroundStart = a3;
}

- (BOOL)isCurrentlyInsideGeofence
{
  return self->_isCurrentlyInsideGeofence;
}

- (void)setIsCurrentlyInsideGeofence:(BOOL)a3
{
  self->_isCurrentlyInsideGeofence = a3;
}

- (BOOL)activelyMonitoringGeofences
{
  return self->_activelyMonitoringGeofences;
}

- (void)setActivelyMonitoringGeofences:(BOOL)a3
{
  self->_activelyMonitoringGeofences = a3;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (BOOL)exitConfirmationActive
{
  return self->_exitConfirmationActive;
}

- (void)setExitConfirmationActive:(BOOL)a3
{
  self->_exitConfirmationActive = a3;
}

- (BOOL)locationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (NSArray)monitoredRegions
{
  return self->_monitoredRegions;
}

- (void)setMonitoredRegions:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredRegions, a3);
}

- (CRWiFiCarManager)wiFiManager
{
  return self->_wiFiManager;
}

- (void)setWiFiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wiFiManager, a3);
}

- (BOOL)exitConfirmationOverride
{
  return self->_exitConfirmationOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wiFiManager, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
