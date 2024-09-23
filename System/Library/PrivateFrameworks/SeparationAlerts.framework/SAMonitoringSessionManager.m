@implementation SAMonitoringSessionManager

- (void)ingestTAEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SAMonitoringSessionManager updateDevicesWithSafeLocations:](self, "updateDevicesWithSafeLocations:", v4);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SAMonitoringSessionManager updateSafeLocations:](self, "updateSafeLocations:", v4);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SAMonitoringSessionManager updateLocation:](self, "updateLocation:", v4);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SAMonitoringSessionManager handleGeofenceEvent:](self, "handleGeofenceEvent:", v4);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SAMonitoringSessionManager analytics](self, "analytics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "horizontalAccuracy");
    objc_msgSend(v6, "addVisit:withRadius:", 1, (unint64_t)v7);

    -[SAMonitoringSessionManager setCurrentVisitOrLOIEvent:](self, "setCurrentVisitOrLOIEvent:", v5);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "scenarioClassifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "ingestTAEvent:", v5);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!objc_msgSend(v5, "hasArrivalDate"))
      goto LABEL_18;
    if (objc_msgSend(v5, "hasDepartureDate"))
    {
      -[SAMonitoringSessionManager setCurrentVisitOrLOIEvent:](self, "setCurrentVisitOrLOIEvent:", 0);
      -[SAMonitoringSessionManager setPreviousVisitOrLOIEvent:](self, "setPreviousVisitOrLOIEvent:", v5);
      goto LABEL_18;
    }
    -[SAMonitoringSessionManager analytics](self, "analytics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "horizontalAccuracy");
    objc_msgSend(v15, "addVisit:withRadius:", 0, (unint64_t)v16);

    -[SAMonitoringSessionManager setCurrentVisitOrLOIEvent:](self, "setCurrentVisitOrLOIEvent:", v5);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "scenarioClassifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "ingestTAEvent:", v5);

        }
        v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v19);
    }
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SAMonitoringSessionManager handleSystemStateChanged:](self, "handleSystemStateChanged:", v4);
LABEL_19:

}

- (void)updateLocation:(id)a3
{
  id v5;
  TALocationLite *lastLocation;
  TALocationLite **p_lastLocation;
  void *v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  void *v12;
  TALocationLite *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  TALocationLite *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t buf;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_lastLocation = &self->_lastLocation;
  lastLocation = self->_lastLocation;
  if (lastLocation)
  {
    -[TALocationLite getDate](lastLocation, "getDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9) != 0;

    if (!v5)
      goto LABEL_22;
  }
  else
  {
    v10 = 1;
    if (!v5)
      goto LABEL_22;
  }
  objc_msgSend(v5, "horizontalAccuracy");
  if (!v10 || v11 >= 70.0)
  {
LABEL_22:
    v32 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      v33 = *p_lastLocation;
      v34 = v32;
      -[TALocationLite description](v33, "description");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 68289539;
      v44 = 2082;
      v45 = "";
      v46 = 2113;
      v47 = (uint64_t)v35;
      v48 = 2113;
      v49 = v36;
      _os_log_impl(&dword_1CA04F000, v34, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updateLocation update criteria not satisfied\", \"lastLocation\":\"%{private}@\", \"newLocation\":\"%{private}@\"}", (uint8_t *)&buf, 0x26u);

    }
    goto LABEL_24;
  }
  objc_storeStrong((id *)&self->_lastLocation, a3);
  v12 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v13 = *p_lastLocation;
    v14 = v12;
    -[TALocationLite description](v13, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 68289283;
    v44 = 2082;
    v45 = "";
    v46 = 2113;
    v47 = (uint64_t)v15;
    _os_log_impl(&dword_1CA04F000, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updateLocation updated\", \"lastLocation\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);

  }
  -[SAMonitoringSessionManager devicesWithToBePopulatedTrackedTravelingStartLocation](self, "devicesWithToBePopulatedTrackedTravelingStartLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289283;
      v44 = 2082;
      v45 = "";
      v46 = 2049;
      v47 = v17;
      _os_log_impl(&dword_1CA04F000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updateLocation populating tracked traveling start location\", \"device count\":%{private}lu}", (uint8_t *)&buf, 0x1Cu);
    }
    -[SAMonitoringSessionManager devicesWithToBePopulatedTrackedTravelingStartLocation](self, "devicesWithToBePopulatedTrackedTravelingStartLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v22)
    {
      v24 = v22;
      v25 = *(_QWORD *)v39;
      *(_QWORD *)&v23 = 68289283;
      v37 = v23;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v26);
          v28 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            buf = v37;
            v44 = 2082;
            v45 = "";
            v46 = 2113;
            v47 = (uint64_t)v27;
            _os_log_impl(&dword_1CA04F000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updateLocation populating tracked traveling start location\", \"device\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
          }
          -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", v37, (_QWORD)v38);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setTrackedTravelingStartLocation:", v5);

          -[SAMonitoringSessionManager devicesWithToBePopulatedTrackedTravelingStartLocation](self, "devicesWithToBePopulatedTrackedTravelingStartLocation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeObject:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v24);
    }

  }
LABEL_24:

}

- (NSMutableSet)devicesWithToBePopulatedTrackedTravelingStartLocation
{
  return self->_devicesWithToBePopulatedTrackedTravelingStartLocation;
}

- (SAMonitoringSessionManager)initWithWithYouDetector:(id)a3 fenceRequestServicer:(id)a4 fenceManager:(id)a5 travelTypeClassifier:(id)a6 clock:(id)a7 deviceRecord:(id)a8 analytics:(id)a9 persistenceManager:(id)a10 audioAccessoryManager:(id)a11
{
  SAMonitoringSessionManager *v18;
  SAMonitoringSessionManager *v19;
  SAMonitoringSessionManager *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSHashTable *clients;
  NSMutableDictionary *v25;
  NSMutableDictionary *devices;
  NSMutableDictionary *v27;
  NSMutableDictionary *safeLocations;
  NSMutableDictionary *v29;
  NSMutableDictionary *deviceUUIDtoSafeLocationUUIDs;
  NSDate *timeOfAttemptToLoadFromPersistence;
  NSMutableDictionary *v32;
  NSMutableDictionary *caLastAlertDate;
  NSMutableDictionary *v34;
  NSMutableDictionary *deviceUUIDtoAlertContext;
  NSMutableDictionary *v36;
  NSMutableDictionary *deviceUUIDtoMonitoringSession;
  NSUUID *nextScheduledAlarmForPersistenceWrite;
  TAEventProtocol *currentVisitOrLOIEvent;
  NSMutableSet *v40;
  NSMutableSet *devicesWithToBePopulatedTrackedTravelingStartLocation;
  NSMutableSet *v42;
  NSMutableSet *devicesWithPendingTransition;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;

  v53 = a3;
  v52 = a4;
  v51 = a5;
  v48 = a6;
  v50 = a7;
  v49 = a8;
  v47 = a9;
  v46 = a10;
  v45 = a11;
  v54.receiver = self;
  v54.super_class = (Class)SAMonitoringSessionManager;
  v18 = -[SAMonitoringSessionManager init](&v54, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_8;
  v20 = 0;
  if (v53 && v52 && v51 && v50 && v49)
  {
    *(_WORD *)&v18->_enabled = 0;
    objc_storeStrong((id *)&v18->_clock, a7);
    objc_storeStrong((id *)&v19->_analytics, a9);
    objc_storeStrong((id *)&v19->_withYouDetector, a3);
    -[SAMonitoringSessionManager withYouDetector](v19, "withYouDetector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addClient:", v19);

    objc_storeStrong((id *)&v19->_deviceRecord, a8);
    objc_storeStrong((id *)&v19->_fenceManager, a5);
    objc_storeStrong((id *)&v19->_fenceRequestServicer, a4);
    objc_storeStrong((id *)&v19->_travelTypeClassifier, a6);
    -[SAMonitoringSessionManager travelTypeClassifier](v19, "travelTypeClassifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addClient:", v19);

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v23 = objc_claimAutoreleasedReturnValue();
    clients = v19->_clients;
    v19->_clients = (NSHashTable *)v23;

    objc_storeStrong((id *)&v19->_persistenceManager, a10);
    objc_storeStrong((id *)&v19->_audioAccessoryManager, a11);
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    devices = v19->_devices;
    v19->_devices = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    safeLocations = v19->_safeLocations;
    v19->_safeLocations = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceUUIDtoSafeLocationUUIDs = v19->_deviceUUIDtoSafeLocationUUIDs;
    v19->_deviceUUIDtoSafeLocationUUIDs = v29;

    v19->_requestedPeriodicScan = 0;
    timeOfAttemptToLoadFromPersistence = v19->_timeOfAttemptToLoadFromPersistence;
    v19->_timeOfAttemptToLoadFromPersistence = 0;

    -[SAMonitoringSessionManager addDisableReason:](v19, "addDisableReason:", 64);
    -[SAMonitoringSessionManager addDisableReason:](v19, "addDisableReason:", 128);
    -[SAMonitoringSessionManager addDisableReason:](v19, "addDisableReason:", 1);
    -[SAMonitoringSessionManager addDisableReason:](v19, "addDisableReason:", 2);
    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    caLastAlertDate = v19->_caLastAlertDate;
    v19->_caLastAlertDate = v32;

    v19->_caBroughtOutOnTravel = -1;
    v19->_caCurrentVehicularState = 0;
    v19->_caIsVehicularBTHintOn = 0;
    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceUUIDtoAlertContext = v19->_deviceUUIDtoAlertContext;
    v19->_deviceUUIDtoAlertContext = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceUUIDtoMonitoringSession = v19->_deviceUUIDtoMonitoringSession;
    v19->_deviceUUIDtoMonitoringSession = v36;

    nextScheduledAlarmForPersistenceWrite = v19->_nextScheduledAlarmForPersistenceWrite;
    v19->_nextScheduledAlarmForPersistenceWrite = 0;

    currentVisitOrLOIEvent = v19->_currentVisitOrLOIEvent;
    v19->_currentVisitOrLOIEvent = 0;

    v19->_isCompanionConnected = 0;
    v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    devicesWithToBePopulatedTrackedTravelingStartLocation = v19->_devicesWithToBePopulatedTrackedTravelingStartLocation;
    v19->_devicesWithToBePopulatedTrackedTravelingStartLocation = v40;

    v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    devicesWithPendingTransition = v19->_devicesWithPendingTransition;
    v19->_devicesWithPendingTransition = v42;

LABEL_8:
    v20 = v19;
  }

  return v20;
}

- (void)requestToStartBackgroundScanning
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_clients;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "startBackgroundScanning", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)requestToStopBackgroundScanning
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_clients;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "stopBackgroundScanning", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)requestToFetchLastVisit
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_clients;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "fetchLastVisit", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)configureBackgroundScanning
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[SAMonitoringSessionManager enabled](self, "enabled");
  v4 = TASALog;
  v5 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl(&dword_1CA04F000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager request to start scanning\"}", (uint8_t *)&v6, 0x12u);
    }
    -[SAMonitoringSessionManager requestToStartBackgroundScanning](self, "requestToStartBackgroundScanning");
  }
  else
  {
    if (v5)
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl(&dword_1CA04F000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager request to stop scanning\"}", (uint8_t *)&v6, 0x12u);
    }
    -[SAMonitoringSessionManager requestToStopBackgroundScanning](self, "requestToStopBackgroundScanning");
  }
}

- (void)bootstrapMonitoringSessionRecord:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  os_log_t *v27;
  void *v28;
  __int128 v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v32;
    v9 = (os_log_t *)&TASALog;
    *(_QWORD *)&v6 = 68289795;
    v29 = v6;
    v30 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11, v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSessionManager fenceManager](self, "fenceManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scenarioClassifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addClient:", v14);

        -[SAMonitoringSessionManager travelTypeClassifier](self, "travelTypeClassifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scenarioClassifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addClient:", v16);

        objc_msgSend(v12, "scenarioClassifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addClient:", self);

        -[SAMonitoringSessionManager fenceManager](self, "fenceManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scenarioClassifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setDelegate:", v18);

        -[SAMonitoringSessionManager clock](self, "clock");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scenarioClassifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTimeDelegate:", v20);

        -[SAMonitoringSessionManager attemptToPopulateTrackedTravelingStartLocationForDevice:](self, "attemptToPopulateTrackedTravelingStartLocationForDevice:", v11);
        v22 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", objc_msgSend(v12, "state"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v7;
          v26 = v8;
          v27 = v9;
          +[SAScenarioClassifier convertSAScenarioClassToString:](SAScenarioClassifier, "convertSAScenarioClassToString:", objc_msgSend(v12, "scenario"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v29;
          v36 = 0;
          v37 = 2082;
          v38 = "";
          v39 = 2113;
          v40 = v11;
          v41 = 2113;
          v42 = v24;
          v43 = 2113;
          v44 = v28;
          _os_log_impl(&dword_1CA04F000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager bootstraped from persisted data\", \"uuid\":\"%{private}@\", \"state\":\"%{private}@\", \"scenario\":\"%{private}@\"}", buf, 0x30u);

          v9 = v27;
          v8 = v26;
          v7 = v25;
          v4 = v30;

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v7);
  }
  -[SAMonitoringSessionManager startPeriodicScansIfNeeded](self, "startPeriodicScansIfNeeded");

}

- (BOOL)monitoringSessionState:(unint64_t)a3 matchesWithScenarioClass:(unint64_t)a4
{
  if (a3 - 3 < 2)
    return a4 == 3;
  if (a3 != 5)
  {
    if (a3 != 1)
      return 1;
    return a4 == 3;
  }
  return a4 == 2;
}

- (void)checkForDevicesNeedingTransition
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "scenario");

        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "state");

        if (!-[SAMonitoringSessionManager monitoringSessionState:matchesWithScenarioClass:](self, "monitoringSessionState:matchesWithScenarioClass:", v16, v13))objc_msgSend(v3, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v7);
  }

  v17 = objc_msgSend(v3, "count");
  if (v17)
  {
    v18 = v17;
    v19 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 2049;
      v31 = v18;
      _os_log_impl(&dword_1CA04F000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting terminable long scan on enable with devices needing transition\", \"count of devices needing transition\":%{private}ld}", buf, 0x1Cu);
    }
    -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "forceUpdateWithYouStatusToFindDevices:withContext:", v3, 10);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t buf;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    v5 = TASALog;
    v6 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        buf = 68289026;
        v44 = 2082;
        v45 = "";
        _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager enabling sa\"}", (uint8_t *)&buf, 0x12u);
      }
      -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resetAllWithYouStatusAndScanStates");

      -[SAMonitoringSessionManager configureBackgroundScanning](self, "configureBackgroundScanning");
      -[SAMonitoringSessionManager requestToFetchLastVisit](self, "requestToFetchLastVisit");
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      -[SAMonitoringSessionManager devices](self, "devices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v37 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            -[SAMonitoringSessionManager createMonitoringDevice:](self, "createMonitoringDevice:", v13);
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v33;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v33 != v18)
                    objc_enumerationMutation(v15);
                  -[SAMonitoringSessionManager startSafeLocation:forDevice:](self, "startSafeLocation:forDevice:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j), v13);
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
              }
              while (v17);
            }

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v10);
      }

      -[SAMonitoringSessionManager startPeriodicScansIfNeeded](self, "startPeriodicScansIfNeeded");
      -[SAMonitoringSessionManager checkForDevicesNeedingTransition](self, "checkForDevicesNeedingTransition");
    }
    else
    {
      if (v6)
      {
        buf = 68289026;
        v44 = 2082;
        v45 = "";
        _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager disabling sa\"}", (uint8_t *)&buf, 0x12u);
      }
      -[SAMonitoringSessionManager stopPeriodicScans](self, "stopPeriodicScans");
      -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v29;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v29 != v25)
              objc_enumerationMutation(v22);
            -[SAMonitoringSessionManager cancelMonitoringDevice:](self, "cancelMonitoringDevice:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k), (_QWORD)v28);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v24);
      }

      -[SAMonitoringSessionManager setCurrentVisitOrLOIEvent:](self, "setCurrentVisitOrLOIEvent:", 0);
      -[SAMonitoringSessionManager configureBackgroundScanning](self, "configureBackgroundScanning");
      -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "resetAllWithYouStatusAndScanStates");

    }
  }
}

- (void)forceStandbyMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setEarlyVehicularTrigger:", 0);
    objc_msgSend(v5, "setEarlyAirplaneTrigger:", 0);
    objc_msgSend(v5, "geofence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SAMonitoringSessionManager fenceRequestServicer](self, "fenceRequestServicer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "geofence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeGeofence:", v8);

      -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setGeofence:", 0);

      -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](self, "changeMonitoringSessionState:toState:", v11, 2);
    }
  }

}

- (BOOL)allDevicesInSafeLocation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "scenario");

        if (v11 != 1)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)anyDeviceInUnsafeLocation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "scenario");

        if (v11 == 2)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)createMonitoringDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  SAMonitoringSession *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v8 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 68289026;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    v9 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager createMonitoringDevice nil UUID\"}";
LABEL_10:
    _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    goto LABEL_22;
  }
  if (!-[SAMonitoringSessionManager enabled](self, "enabled"))
  {
    v8 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 68289026;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    v9 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager createMonitoringDevice while not enabled\"}";
    goto LABEL_10;
  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = TASALog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289283;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2113;
      v35 = v4;
      _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager createMonitoringDevice monitoring session already exists\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2113;
      v35 = v4;
      _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager createMonitoringDevice\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
    -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 2;
    else
      v11 = 3;

    v12 = -[SAMonitoringSession initWithDeviceUUID:state:geofence:scenario:trackedTravelingStartDate:]([SAMonitoringSession alloc], "initWithDeviceUUID:state:geofence:scenario:trackedTravelingStartDate:", v4, 0, 0, v11, 0);
    -[SAMonitoringSessionManager fenceManager](self, "fenceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSession scenarioClassifier](v12, "scenarioClassifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addClient:", v14);

    -[SAMonitoringSessionManager travelTypeClassifier](self, "travelTypeClassifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSession scenarioClassifier](v12, "scenarioClassifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addClient:", v16);

    -[SAMonitoringSession scenarioClassifier](v12, "scenarioClassifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addClient:", self);

    -[SAMonitoringSessionManager fenceManager](self, "fenceManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSession scenarioClassifier](v12, "scenarioClassifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v18);

    -[SAMonitoringSessionManager clock](self, "clock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSession scenarioClassifier](v12, "scenarioClassifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTimeDelegate:", v20);

    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, v4);

    -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](self, "changeMonitoringSessionState:toState:", v4, 2);
    -[SAMonitoringSessionManager didChangeScenarioClassFrom:to:forDevice:](self, "didChangeScenarioClassFrom:to:forDevice:", 0, v11, v4);
    -[SAMonitoringSession scenarioClassifier](v12, "scenarioClassifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ingestTAEvent:", v24);

    LOBYTE(v24) = -[SAMonitoringSessionManager standby](self, "standby");
    -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if ((v24 & 1) != 0)
    {
      objc_msgSend(v25, "forceUpdateWithYouStatusWithShortScan:", 0);
    }
    else
    {
      v29 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "forceUpdateWithYouStatusToFindDevices:withContext:", v27, 5);

    }
  }
  if (!-[SAMonitoringSessionManager standby](self, "standby"))
  {
    -[SAMonitoringSessionManager analytics](self, "analytics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActiveState:", 1);

  }
LABEL_22:

}

- (void)cancelMonitoringDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t buf;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v27 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    buf = 68289026;
    v38 = 2082;
    v39 = "";
    v28 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager cancelMonitoringDevice nil UUID\"}";
    v29 = v27;
    v30 = 18;
LABEL_20:
    _os_log_impl(&dword_1CA04F000, v29, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&buf, v30);
    goto LABEL_21;
  }
  -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](self, "changeMonitoringSessionState:toState:", v4, 6);
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v31 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    buf = 68289283;
    v38 = 2082;
    v39 = "";
    v40 = 2113;
    v41 = v4;
    v28 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager cancelMonitoringDevice monitoring session does not exist\","
          " \"uuid\":\"%{private}@\"}";
    v29 = v31;
    v30 = 28;
    goto LABEL_20;
  }
  objc_msgSend(v6, "geofence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SAMonitoringSessionManager fenceRequestServicer](self, "fenceRequestServicer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "geofence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeGeofence:", v9);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        -[SAMonitoringSessionManager stopSafeLocation:forDevice:](self, "stopSafeLocation:forDevice:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v4);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v13);
  }

  -[SAMonitoringSessionManager fenceManager](self, "fenceManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scenarioClassifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeClient:", v17);

  -[SAMonitoringSessionManager travelTypeClassifier](self, "travelTypeClassifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scenarioClassifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeClient:", v19);

  objc_msgSend(v6, "scenarioClassifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeClient:", self);

  objc_msgSend(v6, "setScenarioClassifier:", 0);
  objc_msgSend(v6, "setDeviceUUID:", 0);

  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, v4);

  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectForKey:", v4);

  v23 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289283;
    v38 = 2082;
    v39 = "";
    v40 = 2113;
    v41 = v4;
    _os_log_impl(&dword_1CA04F000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager canceled monitoring session\", \"uuid\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
  {
    -[SAMonitoringSessionManager analytics](self, "analytics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActiveState:", 0);

  }
LABEL_21:

}

- (void)attemptToPopulateTrackedTravelingStartLocationForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  int v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "state");
  if (v7 > 4 || ((1 << v7) & 0x1A) == 0)
  {
    v10 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      v20 = 68289283;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = v4;
      v11 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager attemptToPopulateTrackedTravelingStartLocationForDevice n"
            "ot in one of the traveling states\", \"uuid\":\"%{private}@\"}";
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(v6, "trackedTravelingStartLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        v20 = 68289283;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2113;
        v25 = v4;
        v11 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager attemptToPopulateTrackedTravelingStartLocationForDevice"
              " already set\", \"uuid\":\"%{private}@\"}";
LABEL_16:
        _os_log_impl(&dword_1CA04F000, v10, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v20, 0x1Cu);
      }
    }
    else
    {
      -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v14);
      v16 = v15;

      v17 = -v16;
      if (v16 >= 0.0)
        v17 = v16;
      if (v17 <= 10.0)
      {
        -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setTrackedTravelingStartLocation:", v19);
      }
      else
      {
        v18 = TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
        {
          v20 = 68289283;
          v21 = 0;
          v22 = 2082;
          v23 = "";
          v24 = 2113;
          v25 = v4;
          _os_log_impl(&dword_1CA04F000, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager attemptToPopulateTrackedTravelingStartLocationForDevice lastLocation is not recent enough, adding to set to be populated\", \"uuid\":\"%{private}@\"}", (uint8_t *)&v20, 0x1Cu);
        }
        -[SAMonitoringSessionManager devicesWithToBePopulatedTrackedTravelingStartLocation](self, "devicesWithToBePopulatedTrackedTravelingStartLocation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v4);
      }

    }
  }

}

- (void)changeMonitoringSessionState:(id)a3 toState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSHashTable *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t buf;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "state");
    v10 = (void *)TASALog;
    if (v9 == a4)
    {
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", objc_msgSend(v8, "state"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 68289795;
        v35 = 2082;
        v36 = "";
        v37 = 2113;
        v38 = v6;
        v39 = 2113;
        v40 = v12;
        v41 = 2113;
        v42 = v13;
        _os_log_impl(&dword_1CA04F000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager changeMonitoringSessionState no state change necessary\", \"uuid\":\"%{private}@\", \"fromState\":\"%{private}@\", \"toState\":\"%{private}@\"}", (uint8_t *)&buf, 0x30u);

      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v10;
        +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", objc_msgSend(v8, "state"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 68289795;
        v35 = 2082;
        v36 = "";
        v37 = 2113;
        v38 = v6;
        v39 = 2113;
        v40 = v16;
        v41 = 2113;
        v42 = v17;
        _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager changeMonitoringSessionState\", \"uuid\":\"%{private}@\", \"fromState\":\"%{private}@\", \"toState\":\"%{private}@\"}", (uint8_t *)&buf, 0x30u);

      }
      -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateMonitoringSessionState:forDeviceWithUUID:", a4, v6);

      -[SAMonitoringSessionManager devicesWithPendingTransition](self, "devicesWithPendingTransition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObject:", v6);

      if (a4 - 5 < 2 || a4 == 2)
      {
        objc_msgSend(v8, "setTrackedTravelingStartDate:", 0);
        objc_msgSend(v8, "setTrackedTravelingStartLocation:", 0);
      }
      else if (a4 == 1 && objc_msgSend(v8, "state") != 3 && objc_msgSend(v8, "state") != 4)
      {
        -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTrackedTravelingStartDate:", v20);

      }
      objc_msgSend(v8, "setState:", a4);
      -[SAMonitoringSessionManager attemptToPopulateTrackedTravelingStartLocationForDevice:](self, "attemptToPopulateTrackedTravelingStartLocationForDevice:", v6);
      objc_msgSend(v8, "setEarlyVehicularTrigger:", 0);
      objc_msgSend(v8, "setEarlyAirplaneTrigger:", 0);
      -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCaLastStateTransition:", v21);

      v28 = a4;
      if (a4 == 3)
        -[SAMonitoringSessionManager storeSeparationLocation:](self, "storeSeparationLocation:", v6);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v22 = self->_clients;
      v23 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v30 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v27, "updatedMonitoringState:forDeviceUUID:", objc_msgSend(v8, "state"), v6);
          }
          v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v24);
      }

      if (v28 <= 4 && ((1 << v28) & 0x1A) != 0)
        -[SAMonitoringSessionManager startPeriodicScans](self, "startPeriodicScans");
      else
        -[SAMonitoringSessionManager stopPeriodicScansIfNotNeeded](self, "stopPeriodicScansIfNotNeeded");
      -[SAMonitoringSessionManager scheduleNextPersistenceWrite](self, "scheduleNextPersistenceWrite");
    }
  }
  else
  {
    v14 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      buf = 68289283;
      v35 = 2082;
      v36 = "";
      v37 = 2113;
      v38 = v6;
      _os_log_impl(&dword_1CA04F000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager changeMonitoringSessionState UUID doesn't map to monitoring session\", \"uuid\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
    }
  }

}

- (int64_t)determineTrackedTravelingCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "state");

        if (v12 == 1)
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)needPeriodicScan
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[SAMonitoringSessionManager enabled](self, "enabled") || -[SAMonitoringSessionManager standby](self, "standby"))
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "state");

        if (v12 <= 4 && ((1 << v12) & 0x1A) != 0)
        {
          v3 = 1;
          goto LABEL_18;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v3 = 0;
    }
    while (v6);
  }
  else
  {
    v3 = 0;
  }
LABEL_18:

  return v3;
}

- (void)stopPeriodicScans
{
  if (-[SAMonitoringSessionManager requestedPeriodicScan](self, "requestedPeriodicScan"))
  {
    -[SAMonitoringSessionManager setRequestedPeriodicScan:](self, "setRequestedPeriodicScan:", 0);
    -[SAWithYouDetectorServiceProtocol pausePeriodicScan](self->_withYouDetector, "pausePeriodicScan");
  }
}

- (void)stopPeriodicScansIfNotNeeded
{
  if (-[SAMonitoringSessionManager requestedPeriodicScan](self, "requestedPeriodicScan"))
  {
    if (!-[SAMonitoringSessionManager needPeriodicScan](self, "needPeriodicScan"))
      -[SAMonitoringSessionManager stopPeriodicScans](self, "stopPeriodicScans");
  }
}

- (void)startPeriodicScans
{
  if (!-[SAMonitoringSessionManager requestedPeriodicScan](self, "requestedPeriodicScan")
    && -[SAMonitoringSessionManager enabled](self, "enabled")
    && !-[SAMonitoringSessionManager standby](self, "standby"))
  {
    -[SAMonitoringSessionManager setRequestedPeriodicScan:](self, "setRequestedPeriodicScan:", 1);
    -[SAWithYouDetectorServiceProtocol resumePeriodicScan](self->_withYouDetector, "resumePeriodicScan");
  }
}

- (void)startPeriodicScansIfNeeded
{
  if (!-[SAMonitoringSessionManager requestedPeriodicScan](self, "requestedPeriodicScan"))
  {
    if (-[SAMonitoringSessionManager needPeriodicScan](self, "needPeriodicScan"))
      -[SAMonitoringSessionManager startPeriodicScans](self, "startPeriodicScans");
  }
}

- (unint64_t)getMoreSpecificSADeviceType:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "deviceType");
  if (objc_msgSend(v3, "deviceType") == 1)
  {
    objc_msgSend(v3, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("iPhone"));

    if ((v6 & 1) != 0)
    {
      v4 = 64;
    }
    else
    {
      objc_msgSend(v3, "model");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("iPad"));

      if ((v8 & 1) != 0)
      {
        v4 = 32;
      }
      else
      {
        objc_msgSend(v3, "model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("MacBook"));

        if (v10)
          v4 = 128;
      }
    }
  }
  else if (objc_msgSend(v3, "deviceType") == 4)
  {
    if (objc_msgSend(v3, "isAppleAudioAccessory"))
      v4 = 256;
    else
      v4 = 4;
  }

  return v4;
}

- (int64_t)checkInEarStatus:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAMonitoringSessionManager audioAccessoryManager](self, "audioAccessoryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      objc_msgSend(v6, "setString:", v4);
      if (objc_msgSend(v6, "length"))
      {
        v7 = 0;
        do
        {
          if (3 * (v7 / 3) + 2 == (_DWORD)v7)
            objc_msgSend(v6, "insertString:atIndex:", CFSTR(":"), v7);
          ++v7;
        }
        while (objc_msgSend(v6, "length") > v7);
      }
      -[SAMonitoringSessionManager audioAccessoryManager](self, "audioAccessoryManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBTAddress:", v6);

      v18 = 0;
      v19 = 0;
      -[SAMonitoringSessionManager audioAccessoryManager](self, "audioAccessoryManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getInEarStatus:secondary:", &v19, &v18);

      v10 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289795;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2113;
        v25 = (uint64_t)v6;
        v26 = 2049;
        v27 = v19;
        v28 = 2049;
        v29 = v18;
        _os_log_impl(&dword_1CA04F000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received in ear status\", \"macAddress\":\"%{private}@\", \"primary\":%{private}ld, \"secondary\":%{private}ld}", buf, 0x30u);
      }
      -[SAMonitoringSessionManager audioAccessoryManager](self, "audioAccessoryManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "getPrimaryBudSide");

      v13 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2049;
        v25 = v12;
        _os_log_impl(&dword_1CA04F000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received primary bud side\", \"bud side\":%{private}ld}", buf, 0x1Cu);
      }
      if (v19 != 3 && v18 != 3)
      {
        v14 = 3;
LABEL_34:

        goto LABEL_35;
      }
      if (v12 == 1)
      {
        if (v19 == 3)
          v14 = 1;
        else
          v14 = 2;
        if (v19 != 3)
          goto LABEL_34;
      }
      else
      {
        if (v12)
          goto LABEL_33;
        if (v19 == 3)
          v14 = 2;
        else
          v14 = 1;
        if (v19 != 3)
          goto LABEL_34;
      }
      if (v18 != 3)
        goto LABEL_34;
LABEL_33:
      v14 = 0;
      goto LABEL_34;
    }
    v15 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v16 = "{\"msg%{public}.0s\":\"#sa check in ear status received unknown macAddress\"}";
      goto LABEL_19;
    }
  }
  else
  {
    v15 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v16 = "{\"msg%{public}.0s\":\"#sa check in ear status received unknown audioAccessoryManager\"}";
LABEL_19:
      _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    }
  }
  v14 = 0;
LABEL_35:

  return v14;
}

- (BOOL)checkIfCloseToAnySafeLocations:(id)a3 leftBehindLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  BOOL v32;
  id v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t buf;
  __int16 v43;
  const char *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a4;
  -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    buf = 68289283;
    v43 = 2082;
    v44 = "";
    v45 = 2113;
    v46 = v6;
    _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager checking if close to any safe locations before surfacing the alert\", \"uuid\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v10)
  {
    v11 = v10;
    v34 = v6;
    v12 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "latitude");
          v21 = v20;
          -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "longitude");
          v25 = (void *)objc_msgSend(v17, "initWithLatitude:longitude:", v21, v24);

          objc_msgSend(v25, "distanceFromLocation:", v36);
          v27 = v26;
          -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v14);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "radius");
          v31 = v30;

          if (v31 < 100.0)
            v31 = 100.0;

          if (v27 <= v31)
          {
            v32 = 1;
            goto LABEL_16;
          }
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v11)
        continue;
      break;
    }
    v32 = 0;
LABEL_16:
    v6 = v34;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)checkIfAlertWasTriggeredAtHome:(id)a3 isEarlyVehicularTrigger:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  _DWORD v24[2];
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v24[0] = 68289539;
    v24[1] = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2113;
    v28 = v6;
    v29 = 1025;
    v30 = v4;
    _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager checking if alert was triggered at home\", \"location\":\"%{private}@\", \"isEarlyVehicularTrigger\":%{private}d}", (uint8_t *)v24, 0x22u);
  }
  if (!v4)
  {
    -[SAMonitoringSessionManager previousVisitOrLOIEvent](self, "previousVisitOrLOIEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SAMonitoringSessionManager previousVisitOrLOIEvent](self, "previousVisitOrLOIEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_13:
    v13 = 0;
LABEL_14:
    v22 = 0;
    goto LABEL_15;
  }
  -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0)
    goto LABEL_13;
  -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = v10;
  if (!v10 || objc_msgSend(v10, "type") != 1)
    goto LABEL_14;
  v14 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v13, "latitude");
  v16 = v15;
  objc_msgSend(v13, "longitude");
  v18 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:", v16, v17);
  objc_msgSend(v6, "distanceFromLocation:", v18);
  v20 = v19;
  objc_msgSend(v18, "horizontalAccuracy");
  if (v21 < 100.0)
    v21 = 100.0;
  v22 = v20 <= v21;

LABEL_15:
  return v22;
}

- (BOOL)shouldSuppressDueToRepeatedAlertsInOneTravelingSession:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  NSObject *v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E83DB170);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E83DB170);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue") ^ 1;

  }
  else
  {
    v12 = 1;
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E83DB188);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if (v14 != 2)
  {
LABEL_20:
    v17 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v9, "lastAlertDateInCurrentTravelingSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v6;
      _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager suppressing alerts due to repeated alerts in one traveling session\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
    v17 = 1;
    goto LABEL_21;
  }
  v31 = v9;
  -[SADeviceRecord getRelatedDevices:](self->_deviceRecord, "getRelatedDevices:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18 || !objc_msgSend(v18, "count"))
  {
LABEL_15:
    v9 = v31;
    if (v12)
    {
      v27 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2113;
        v37 = v6;
        _os_log_impl(&dword_1CA04F000, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager gating number of alerts in one traveling session \", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
      }
      -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setLastAlertDateInCurrentTravelingSession:", v28);

    }
    goto LABEL_20;
  }
  v20 = 0;
  while (1)
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceUUIDtoMonitoringSession, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastAlertDateInCurrentTravelingSession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", v24);
      v26 = v25;

      if (v26 > 60.0)
        break;
    }

    if (++v20 >= (unint64_t)objc_msgSend(v19, "count"))
      goto LABEL_15;
  }
  v30 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2113;
    v37 = v6;
    v38 = 2113;
    v39 = v21;
    _os_log_impl(&dword_1CA04F000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager suppressing alerts due to related device alert in current traveling session\", \"uuid\":\"%{private}@\", \"relatedDeviceUUID\":\"%{private}@\"}", buf, 0x26u);
  }

  v17 = 1;
  v9 = v31;
LABEL_21:

  return v17;
}

- (void)handleSeparationForDeviceUUID:(id)a3 withSafeLocationRecommendation:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  int64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  _BOOL4 v35;
  NSObject *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  int v59;
  void *v60;
  void *v61;
  double v62;
  int v63;
  int v64;
  void *v65;
  id v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  uint64_t v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  double v91;
  void *v92;
  uint64_t v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  _BOOL8 v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  void *v118;
  id *p_isa;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t i;
  void *v138;
  void *v139;
  char v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  unsigned int v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  _BOOL4 v159;
  void *v160;
  void *v161;
  void *v162;
  unsigned int v163;
  void *v164;
  unsigned int v165;
  void *v166;
  unsigned int v167;
  void *v168;
  unsigned int v169;
  void *v170;
  unsigned int v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  uint64_t v182;
  void *v183;
  unint64_t v184;
  id v185;
  void *v186;
  unsigned int v187;
  void *v188;
  unsigned int v189;
  _BOOL4 v190;
  _BOOL4 v191;
  NSObject *v192;
  SAMonitoringSessionManager *v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  uint8_t v198[128];
  uint8_t buf[4];
  int v200;
  __int16 v201;
  const char *v202;
  __int16 v203;
  int64_t v204;
  __int16 v205;
  void *v206;
  __int16 v207;
  uint64_t v208;
  __int16 v209;
  uint64_t v210;
  __int16 v211;
  void *v212;
  _QWORD v213[27];
  _QWORD v214[27];
  _QWORD v215[16];
  _QWORD v216[19];

  v216[16] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SAMonitoringSessionManager devices](self, "devices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v191 = -[SAMonitoringSessionManager checkIfCloseToAnySafeLocations:leftBehindLocation:](self, "checkIfCloseToAnySafeLocations:leftBehindLocation:", v8, v9);
  v13 = -[SAMonitoringSessionManager shouldSuppressDueToRepeatedAlertsInOneTravelingSession:context:](self, "shouldSuppressDueToRepeatedAlertsInOneTravelingSession:context:", v8, v10);
  if (v12)
  {
    v190 = v13;
    if (!objc_msgSend(v12, "isAppleAudioAccessory"))
    {
      v189 = 0;
      v187 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v12, "macAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SAMonitoringSessionManager checkInEarStatus:](self, "checkInEarStatus:", v14);

    v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v200 = 0;
      v201 = 2082;
      v202 = "";
      v203 = 2049;
      v204 = v15;
      _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager in ear status before notifying\", \"state\":%{private}ld}", buf, 0x1Cu);
    }
    switch(v15)
    {
      case 1:
        objc_msgSend(v12, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("left"));

        if ((v20 & 1) != 0)
          goto LABEL_16;
        break;
      case 2:
        objc_msgSend(v12, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("right"));

        if (v23)
          goto LABEL_16;
        break;
      case 3:
        objc_msgSend(v12, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("left")))
        {

LABEL_16:
          v24 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            v25 = v24;
            objc_msgSend(v12, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "UUIDString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68289283;
            v200 = 0;
            v201 = 2082;
            v202 = "";
            v203 = 2113;
            v204 = (int64_t)v27;
            _os_log_impl(&dword_1CA04F000, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa separation for classically connected device\", \"device\":\"%{private}@\"}", buf, 0x1Cu);

          }
          v21 = 1;
LABEL_19:
          v28 = objc_msgSend(v12, "productId") - 8212;
          v187 = v21;
          if (v28 > 0x10 || ((1 << v28) & 0x10013) == 0)
          {
            v189 = 0;
LABEL_33:
            v184 = -[SAMonitoringSessionManager getMoreSpecificSADeviceType:](self, "getMoreSpecificSADeviceType:", v12);
            -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", v8);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E83DB188);
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "caLastStateTransition");
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            v47 = -1.0;
            v48 = -1.0;
            if (v46)
            {
              -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "caLastStateTransition");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "timeIntervalSinceDate:", v50);
              v48 = v51;

            }
            -[SAMonitoringSessionManager caLastAlertDate](self, "caLastAlertDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectForKeyedSubscript:", v8);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            v178 = v45;
            if (v53)
            {
              -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[SAMonitoringSessionManager caLastAlertDate](self, "caLastAlertDate");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectForKeyedSubscript:", v8);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "timeIntervalSinceDate:", v56);
              v47 = v57;

              v45 = v178;
            }
            if (v9)
            {
              objc_msgSend(v9, "horizontalAccuracy");
              v59 = (int)v58;
              objc_msgSend(v45, "caSeparationLocation");
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              if (v60)
              {
                objc_msgSend(v45, "caSeparationLocation");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "distanceFromLocation:", v61);
                v63 = (int)v62;

                v169 = v63;
                v64 = v63 - v59;
              }
              else
              {
                v64 = -1;
                v169 = -1;
              }
              v167 = v64;
              -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
              v65 = (void *)objc_claimAutoreleasedReturnValue();

              if (v65)
              {
                v66 = objc_alloc(MEMORY[0x1E0C9E3B8]);
                -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "latitude");
                v69 = v68;
                -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "longitude");
                v72 = (void *)objc_msgSend(v66, "initWithLatitude:longitude:", v69, v71);

                objc_msgSend(v9, "distanceFromLocation:", v72);
                v163 = (int)v73;
                v165 = (int)v73 - v59;

LABEL_45:
                -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "getLatestAdvertisement:", v8);
                v75 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v75, "scanDate");
                v76 = objc_claimAutoreleasedReturnValue();
                if (v76)
                {
                  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "timeIntervalSinceDate:", v76);
                  v79 = v78;

                }
                else
                {
                  v79 = -1.0;
                }
                v179 = objc_msgSend(v75, "rssi");
                v177 = v75;
                v171 = v59;
                if (v75)
                  v182 = objc_msgSend(v75, "getBatteryState");
                else
                  v182 = -1;
                -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "getLatestNOAdvertisement:", v8);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "scanDate");
                v82 = objc_claimAutoreleasedReturnValue();

                v83 = -1.0;
                v84 = -1.0;
                if (v82)
                {
                  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "timeIntervalSinceDate:", v82);
                  v84 = v86;

                }
                v175 = (void *)v82;
                -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "getLatestWildAdvertisement:", v8);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "scanDate");
                v89 = objc_claimAutoreleasedReturnValue();

                if (v89)
                {
                  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "timeIntervalSinceDate:", v89);
                  v83 = v91;

                }
                -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "getLastWithYouDate:", v8);
                v93 = objc_claimAutoreleasedReturnValue();

                if (v93)
                {
                  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "timeIntervalSinceDate:", v93);
                  v96 = v95;

                }
                else
                {
                  v96 = -1.0;
                }
                objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E83DB170);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                if (v97)
                {
                  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E83DB170);
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v98 = &unk_1E83DB1A0;
                }
                v173 = (void *)v93;

                objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E83DB1B8);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v185 = v8;
                v186 = v12;
                v176 = (void *)v76;
                v174 = (void *)v89;
                if (v99)
                {
                  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E83DB1B8);
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  v101 = objc_msgSend(v100, "BOOLValue");

                }
                else
                {
                  v101 = 0;
                }
                v149 = v101;

                v102 = -[SAMonitoringSessionManager checkIfAlertWasTriggeredAtHome:isEarlyVehicularTrigger:](self, "checkIfAlertWasTriggeredAtHome:isEarlyVehicularTrigger:", v9, v101);
                v159 = v102;
                v216[0] = v188;
                v215[0] = CFSTR("lastAlertType");
                v215[1] = CFSTR("lastAlert");
                -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                v216[1] = v160;
                v215[2] = CFSTR("tLastWithYou");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v96);
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                v216[2] = v157;
                v216[3] = v9;
                v215[3] = CFSTR("lLastWithYou");
                v215[4] = CFSTR("lastAlertIsBookendingTravel");
                v181 = v98;
                v216[4] = v98;
                v215[5] = CFSTR("lastAlertIsEarlyVehicularTrigger");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v101);
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                v216[5] = v155;
                v215[6] = CFSTR("lastAlertVehicularState");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAMonitoringSessionManager caCurrentVehicularState](self, "caCurrentVehicularState"));
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                v216[6] = v153;
                v215[7] = CFSTR("lastAlertIsVehicularBTHintOn");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SAMonitoringSessionManager caIsVehicularBTHintOn](self, "caIsVehicularBTHintOn"));
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                v216[7] = v151;
                v215[8] = CFSTR("lastAlertIsClassicallyConnected");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v187);
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                v216[8] = v147;
                v215[9] = CFSTR("noCaseAdvSuppressed");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v189);
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                v216[9] = v145;
                v215[10] = CFSTR("lastAlertBatteryState");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v182);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                v216[10] = v103;
                v215[11] = CFSTR("closeToAnySafeLocations");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v191);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                v216[11] = v104;
                v215[12] = CFSTR("timeSinceLastAlert");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v216[12] = v105;
                v215[13] = CFSTR("triggeredAtHome");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v102);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                v216[13] = v106;
                v215[14] = CFSTR("lastAlertRssiValue");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v179);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                v216[14] = v107;
                v215[15] = CFSTR("travelingSuppressed");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v190);
                v193 = self;
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v216[15] = v108;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v216, v215, 16);
                v162 = (void *)objc_claimAutoreleasedReturnValue();

                -[SAMonitoringSessionManager deviceUUIDtoAlertContext](v193, "deviceUUIDtoAlertContext");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "setObject:forKeyedSubscript:", v162, v8);

                v214[0] = v188;
                v213[0] = CFSTR("alertType");
                v213[1] = CFSTR("itemType");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v184);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                v214[1] = v161;
                v213[2] = CFSTR("productID");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "productId"));
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                v214[2] = v158;
                v213[3] = CFSTR("vendorId");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "vendorId"));
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                v214[3] = v156;
                v213[4] = CFSTR("tSinceLastTransition");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                v214[4] = v154;
                v213[5] = CFSTR("tSincePriorAlert");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                v214[5] = v152;
                v213[6] = CFSTR("radius");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v171);
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                v214[6] = v172;
                v213[7] = CFSTR("t1centerDistance");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v169);
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                v214[7] = v170;
                v213[8] = CFSTR("t1boundaryDistance");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v167);
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                v214[8] = v168;
                v213[9] = CFSTR("t2centerDistance");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v163);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                v214[9] = v164;
                v213[10] = CFSTR("t2boundaryDistance");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v165);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                v214[10] = v166;
                v213[11] = CFSTR("lastUpdateAge");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v79);
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                v214[11] = v148;
                v213[12] = CFSTR("lastAdvRSSI");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v179);
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                v214[12] = v180;
                v213[13] = CFSTR("airplaneEnabled");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SAMonitoringSessionManager isInAirplaneMode](v193, "isInAirplaneMode"));
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                v214[13] = v146;
                v214[14] = v181;
                v213[14] = CFSTR("isBookendingTravel");
                v213[15] = CFSTR("isEarlyVehicularTrigger");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v149);
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                v214[15] = v150;
                v213[16] = CFSTR("vehicularState");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAMonitoringSessionManager caCurrentVehicularState](v193, "caCurrentVehicularState"));
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                v214[16] = v144;
                v213[17] = CFSTR("isVehicularBTHintOn");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SAMonitoringSessionManager caIsVehicularBTHintOn](v193, "caIsVehicularBTHintOn"));
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                v214[17] = v143;
                v213[18] = CFSTR("lastNOAdvertisementAge");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v84);
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                v214[18] = v142;
                v213[19] = CFSTR("lastWildAdvertisementAge");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v83);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                v214[19] = v141;
                v213[20] = CFSTR("classicallyConnected");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v187);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v214[20] = v110;
                v213[21] = CFSTR("noCaseAdvSuppressed");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v189);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                v214[21] = v111;
                v213[22] = CFSTR("lastBatteryStateBeforeAlert");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v182);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                v214[22] = v112;
                v213[23] = CFSTR("closeToAnySafeLocations");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v191);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                v214[23] = v113;
                v213[24] = CFSTR("systemVersion");
                objc_msgSend(v12, "systemVersion");
                v114 = objc_claimAutoreleasedReturnValue();
                v115 = (void *)v114;
                v116 = CFSTR("unknown");
                if (v114)
                  v116 = (const __CFString *)v114;
                v214[24] = v116;
                v213[25] = CFSTR("isHome");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v159);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                v214[25] = v117;
                v213[26] = CFSTR("hasSurfacedInCurrentTravelingSession");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v190);
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                v214[26] = v118;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v214, v213, 27);
                v183 = (void *)objc_claimAutoreleasedReturnValue();

                p_isa = (id *)&v193->super.isa;
                v8 = v185;

                -[SAMonitoringSessionManager analytics](v193, "analytics");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "submitEvent:content:", CFSTR("com.apple.clx.alert.alertEvent"), v183);

                -[SAMonitoringSessionManager analytics](v193, "analytics");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v184);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "submitAlertRateEvent:alertType:", v122, v188);

                if (((v189 | v187 | v191 | v190) & 1) == 0)
                {
                  v123 = (void *)TASALog;
                  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
                  {
                    v192 = v123;
                    objc_msgSend(v12, "identifier");
                    v124 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "name");
                    v125 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E83DB188);
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    v127 = objc_msgSend(v126, "integerValue");
                    v128 = -[SAMonitoringSessionManager getMoreSpecificSADeviceType:](v193, "getMoreSpecificSADeviceType:", v12);
                    objc_msgSend(v12, "systemVersion");
                    v129 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 68290307;
                    v200 = 0;
                    v201 = 2082;
                    v202 = "";
                    v203 = 2113;
                    v204 = (int64_t)v124;
                    v205 = 2113;
                    v206 = v125;
                    v207 = 2049;
                    v208 = v127;
                    v209 = 2049;
                    v210 = v128;
                    v211 = 2113;
                    v212 = v129;
                    p_isa = (id *)&v193->super.isa;
                    _os_log_impl(&dword_1CA04F000, v192, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa notify separation\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\", \"type\":%{private}ld, \"deviceType\":%{private}ld, \"systemVersion\":\"%{private}@\"}", buf, 0x44u);

                    v12 = v186;
                  }
                  objc_msgSend(p_isa[2], "getCurrentTime");
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(p_isa, "caLastAlertDate");
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v131, "setObject:forKeyedSubscript:", v130, v185);

                  v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v12, 0);
                  v194 = 0u;
                  v195 = 0u;
                  v196 = 0u;
                  v197 = 0u;
                  v133 = p_isa[6];
                  v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v194, v198, 16);
                  if (v134)
                  {
                    v135 = v134;
                    v136 = *(_QWORD *)v195;
                    do
                    {
                      for (i = 0; i != v135; ++i)
                      {
                        if (*(_QWORD *)v195 != v136)
                          objc_enumerationMutation(v133);
                        v138 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * i);
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          objc_msgSend(v138, "notifySeparationsForDevices:withLocation:withContext:", v132, v9, v10);
                      }
                      v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v194, v198, 16);
                    }
                    while (v135);
                  }

                  v8 = v185;
                  v12 = v186;
                }
                goto LABEL_79;
              }
            }
            else
            {
              v59 = -1;
              v169 = -1;
              v167 = -1;
            }
            v163 = -1;
            v165 = -1;
            goto LABEL_45;
          }
          -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "getLatestCaseAdvertisementDate:", v8);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "timeIntervalSinceDate:", v30);
            v33 = v32;

            v34 = (void *)TASALog;
            v35 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
            if (v33 <= 129600.0)
            {
              if (v35)
              {
                v41 = v34;
                objc_msgSend(v12, "identifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "UUIDString");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 68289283;
                v200 = 0;
                v201 = 2082;
                v202 = "";
                v203 = 2113;
                v204 = (int64_t)v43;
                _os_log_impl(&dword_1CA04F000, v41, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa separation for device with recent case advertisement\", \"device\":\"%{private}@\"}", buf, 0x1Cu);

              }
              v189 = 0;
              goto LABEL_32;
            }
            if (v35)
            {
              v36 = v34;
              objc_msgSend(v12, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "UUIDString");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 68289283;
              v200 = 0;
              v201 = 2082;
              v202 = "";
              v203 = 2113;
              v204 = (int64_t)v38;
              v39 = "{\"msg%{public}.0s\":\"#sa separation for device with too old case advertisement - suppressing alert"
                    "\", \"device\":\"%{private}@\"}";
LABEL_27:
              _os_log_impl(&dword_1CA04F000, v36, OS_LOG_TYPE_DEFAULT, v39, buf, 0x1Cu);

            }
          }
          else
          {
            v40 = (void *)TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
            {
              v36 = v40;
              objc_msgSend(v12, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "UUIDString");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 68289283;
              v200 = 0;
              v201 = 2082;
              v202 = "";
              v203 = 2113;
              v204 = (int64_t)v38;
              v39 = "{\"msg%{public}.0s\":\"#sa separation for device with no recent case advertisement - suppressing ale"
                    "rt\", \"device\":\"%{private}@\"}";
              goto LABEL_27;
            }
          }
          v189 = 1;
LABEL_32:

          goto LABEL_33;
        }
        objc_msgSend(v12, "name");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = objc_msgSend(v139, "isEqualToString:", CFSTR("right"));

        if ((v140 & 1) != 0)
          goto LABEL_16;
        break;
    }
    v21 = 0;
    goto LABEL_19;
  }
  v18 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289283;
    v200 = 0;
    v201 = 2082;
    v202 = "";
    v203 = 2113;
    v204 = (int64_t)v8;
    _os_log_impl(&dword_1CA04F000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#sa Service tried to notify with no corresponding device\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
  }
LABEL_79:

}

- (void)handleGeofenceExitedForDeviceUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SAMonitoringSessionManager standby](self, "standby"))
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager travel exit while in standby\"}", buf, 0x12u);
    }
    -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](self, "changeMonitoringSessionState:toState:", v4, 2);
  }
  else
  {
    -[SAMonitoringSessionManager clock](self, "clock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getCurrentTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTravelingGeofenceExitDate:", v7);

    -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](self, "changeMonitoringSessionState:toState:", v4, 4);
    if (-[SAMonitoringSessionManager _isOnlyMonitoringDisconnectedCompanionDevice](self, "_isOnlyMonitoringDisconnectedCompanionDevice"))
    {
      v10 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        _os_log_impl(&dword_1CA04F000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager is only monitoring disconnected companion device, skipping force update all WithYouStatus\"}", buf, 0x12u);
      }
      -[SAMonitoringSessionManager didForceUpdateWithYouStatus](self, "didForceUpdateWithYouStatus");
    }
    else
    {
      -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "forceUpdateWithYouStatusToFindDevices:withContext:", v12, 3);

    }
  }

}

- (BOOL)_isOnlyMonitoringDisconnectedCompanionDevice
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v16;
  uint64_t v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10, (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_msgSend(v13, "state");
          if (v14 <= 5 && ((1 << v14) & 0x3A) != 0)
          {
            -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "deviceType");

            if (v17 != 8)
            {

              v18 = 0;
              goto LABEL_17;
            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (BOOL)addTravelFenceForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TALocationLite *v9;
  TALocationLite *lastLocation;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v27;
  int v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v22 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
    {
      v28 = 68289283;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2113;
      v33 = v4;
      v23 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to set while traveling fence due to no session\", "
            "\"uuid\":\"%{private}@\"}";
      v24 = v22;
      v25 = OS_LOG_TYPE_FAULT;
LABEL_8:
      _os_log_impl(&dword_1CA04F000, v24, v25, v23, (uint8_t *)&v28, 0x1Cu);
    }
LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstNotWithYouLocation");
  v9 = (TALocationLite *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    lastLocation = self->_lastLocation;
    if (lastLocation)
    {
      v9 = lastLocation;
      goto LABEL_5;
    }
    v27 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v28 = 68289283;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2113;
      v33 = v4;
      v23 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to set while traveling fence due to no last locati"
            "on\", \"uuid\":\"%{private}@\"}";
      v24 = v27;
      v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_5:
  -[TALocationLite latitude](v9, "latitude");
  v12 = v11;
  -[TALocationLite longitude](v9, "longitude");
  v14 = v13;
  v15 = objc_alloc(MEMORY[0x1E0C9E368]);
  objc_msgSend(v4, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithCenter:radius:identifier:", v16, v12, v14, 100.0);

  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setGeofence:", v17);

  -[SAMonitoringSessionManager fenceRequestServicer](self, "fenceRequestServicer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addGeofence:", v17);

  v21 = 1;
LABEL_10:

  return v21;
}

- (void)removeTravelFenceForDevice:(id)a3
{
  id v4;
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
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "geofence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SAMonitoringSessionManager fenceRequestServicer](self, "fenceRequestServicer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "geofence");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeGeofence:", v13);

    }
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setGeofence:", 0);

  }
  else
  {
    v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
    {
      v17[0] = 68289283;
      v17[1] = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = v4;
      _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to remove while traveling fence due to no session\", \"uuid\":\"%{private}@\"}", (uint8_t *)v17, 0x1Cu);
    }
  }

}

- (void)storeSeparationLocation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v8 = v7;
    -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "longitude");
    v11 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:", v8, v10);
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCaSeparationLocation:", v11);

  }
}

- (void)notifyWhileTraveling:(id)a3 isBookendingTravel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  TALocationLite *lastLocation;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[SAMonitoringSessionManager standby](self, "standby"))
  {
    v7 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager standby notify\"}", (uint8_t *)&v26, 0x12u);
    }
    -[SAMonitoringSessionManager removeTravelFenceForDevice:](self, "removeTravelFenceForDevice:", v6);
    goto LABEL_16;
  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E83DB1B8, &unk_1E83DB188);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, &unk_1E83DB170);

    -[SADeviceRecord getLastWithYouLocation:](self->_deviceRecord, "getLastWithYouLocation:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "geofence");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v12 = v15;
      }
      else
      {
        lastLocation = self->_lastLocation;
        if (!lastLocation)
        {
          v25 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
          {
            v26 = 68289026;
            v27 = 0;
            v28 = 2082;
            v29 = "";
            _os_log_impl(&dword_1CA04F000, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager notifyWhileTraveling with nil location\"}", (uint8_t *)&v26, 0x12u);
          }
          goto LABEL_15;
        }
        -[TALocationLite latitude](lastLocation, "latitude");
        v19 = v18;
        -[TALocationLite longitude](self->_lastLocation, "longitude");
        v21 = v20;
        v22 = objc_alloc(MEMORY[0x1E0C9E368]);
        objc_msgSend(v6, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v22, "initWithCenter:radius:identifier:", v23, v19, v21, 100.0);

      }
    }
    -[SAMonitoringSessionManager createLocationFromCircularRegion:forDevice:withContext:](self, "createLocationFromCircularRegion:forDevice:withContext:", v12, v6, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSessionManager removeTravelFenceForDevice:](self, "removeTravelFenceForDevice:", v6);
    -[SAMonitoringSessionManager handleSeparationForDeviceUUID:withSafeLocationRecommendation:context:](self, "handleSeparationForDeviceUUID:withSafeLocationRecommendation:context:", v6, v24, v10);

LABEL_15:
    goto LABEL_16;
  }
  v16 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
  {
    v26 = 68289283;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    v30 = 2113;
    v31 = v6;
    _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to notify while traveling due to no session\", \"uuid\":\"%{private}@\"}", (uint8_t *)&v26, 0x1Cu);
  }
LABEL_16:

}

- (void)notifyWhenLeftBehind:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SAMonitoringSessionManager standby](self, "standby"))
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v6 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager standby notify\"}";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 18;
LABEL_13:
      _os_log_impl(&dword_1CA04F000, v7, v8, v6, (uint8_t *)&v19, v9);
    }
  }
  else
  {
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SADeviceRecord getLastWithYouLocation:](self->_deviceRecord, "getLastWithYouLocation:", v4);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scenarioClassifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastUnsafeLocation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v12 = v17;

      }
      -[SAMonitoringSessionManager notifyLeftBehind:withRegion:isEarlyVehicularTrigger:](self, "notifyLeftBehind:withRegion:isEarlyVehicularTrigger:", v4, v12, 0);

    }
    else
    {
      v18 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        v19 = 68289283;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2113;
        v24 = v4;
        v6 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to notify when left behind due to no session\", \"
             "uuid\":\"%{private}@\"}";
        v7 = v18;
        v8 = OS_LOG_TYPE_FAULT;
        v9 = 28;
        goto LABEL_13;
      }
    }
  }

}

- (void)notifyLeftBehind:(id)a3 withRegion:(id)a4 isEarlyVehicularTrigger:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t isKindOfClass;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  double v20;
  CLLocationDegrees v21;
  CLLocationDegrees v22;
  CLLocationCoordinate2D v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E83DB170, &unk_1E83DB188);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, &unk_1E83DB1B8);

  if (v9)
    goto LABEL_10;
  -[SAMonitoringSessionManager previousVisitOrLOIEvent](self, "previousVisitOrLOIEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[SAMonitoringSessionManager previousVisitOrLOIEvent](self, "previousVisitOrLOIEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("unsafe_%@"), v16);

    objc_msgSend(v14, "horizontalAccuracy");
    v18 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(v14, "coordinate");
    v9 = (id)objc_msgSend(v18, "initWithCenter:radius:identifier:", v17);
  }
  else
  {
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0)
      goto LABEL_12;
    -[SAMonitoringSessionManager previousVisitOrLOIEvent](self, "previousVisitOrLOIEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "latitude");
    v21 = v20;
    objc_msgSend(v14, "longitude");
    v23 = CLLocationCoordinate2DMake(v21, v22);
    objc_msgSend(v14, "horizontalAccuracy");
    if (v24 >= 100.0)
      v25 = v24;
    else
      v25 = 100.0;
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("unsafe_%@"), v27);

    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E368]), "initWithCenter:radius:identifier:", v17, v23.latitude, v23.longitude, v25);
    objc_msgSend(v9, "setGeoReferenceFrame:", objc_msgSend(v14, "referenceFrame"));
  }

  if (v9)
  {
LABEL_10:
    -[SAMonitoringSessionManager createLocationFromCircularRegion:forDevice:withContext:](self, "createLocationFromCircularRegion:forDevice:withContext:", v9, v8, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSessionManager handleSeparationForDeviceUUID:withSafeLocationRecommendation:context:](self, "handleSeparationForDeviceUUID:withSafeLocationRecommendation:context:", v8, v28, v10);

    goto LABEL_11;
  }
LABEL_12:
  v29 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289026;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    _os_log_impl(&dword_1CA04F000, v29, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager notifyWhenLeftBehind without suggesting location\"}", buf, 0x12u);
  }
LABEL_11:

}

- (void)notifyEarlyLeftBehind:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SAMonitoringSessionManager standby](self, "standby"))
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v6 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager standby notify early\"}";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 18;
LABEL_13:
      _os_log_impl(&dword_1CA04F000, v7, v8, v6, (uint8_t *)&v19, v9);
    }
  }
  else
  {
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SADeviceRecord getLastWithYouLocation:](self->_deviceRecord, "getLastWithYouLocation:", v4);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scenarioClassifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentUnsafeLocation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v12 = v17;

      }
      -[SAMonitoringSessionManager notifyLeftBehind:withRegion:isEarlyVehicularTrigger:](self, "notifyLeftBehind:withRegion:isEarlyVehicularTrigger:", v4, v12, 1);

    }
    else
    {
      v18 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        v19 = 68289283;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2113;
        v24 = v4;
        v6 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to notify early left behind due to no session\", "
             "\"uuid\":\"%{private}@\"}";
        v7 = v18;
        v8 = OS_LOG_TYPE_FAULT;
        v9 = 28;
        goto LABEL_13;
      }
    }
  }

}

- (id)createLocationFromCircularRegion:(id)a3 forDevice:(id)a4 withContext:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _DWORD v24[2];
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v8, "radius");
  v11 = 75.0;
  if (v10 >= 75.0)
  {
    v11 = v10;
    if (v10 <= 0.0)
      goto LABEL_5;
  }
  v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v8, "center");
  v14 = v13;
  v16 = v15;
  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v17, objc_msgSend(v8, "geoReferenceFrame"), v14, v16, 0.0, v11, -1.0);

  if (!v18)
  {
LABEL_5:
    v19 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      v21 = v19;
      objc_msgSend(v20, "numberWithUnsignedInteger:", a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = 68289539;
      v24[1] = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2113;
      v28 = v9;
      v29 = 2113;
      v30 = v22;
      _os_log_impl(&dword_1CA04F000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to create/recommend location\", \"uuid\":\"%{private}@\", \"context\":\"%{private}@\"}", (uint8_t *)v24, 0x26u);

    }
    v18 = 0;
  }

  return v18;
}

- (void)addDevice:(id)a3 isLastDeviceEvent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  SADeviceUpdateEvent *v12;
  void *v13;
  SADeviceUpdateEvent *v14;
  void *v15;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMonitoringSessionManager devices](self, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  v9 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = 68289539;
    v16[1] = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v7;
    v21 = 2113;
    v22 = v11;
    _os_log_impl(&dword_1CA04F000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager new device\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\"}", (uint8_t *)v16, 0x26u);

  }
  v12 = [SADeviceUpdateEvent alloc];
  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SADeviceUpdateEvent initWithDevice:eventType:lastEvent:date:](v12, "initWithDevice:eventType:lastEvent:date:", v6, 0, v4, v13);

  -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ingestTAEvent:", v14);

  if (-[SAMonitoringSessionManager enabled](self, "enabled"))
    -[SAMonitoringSessionManager createMonitoringDevice:](self, "createMonitoringDevice:", v7);

}

- (void)removeDeviceWithUUID:(id)a3 isLastDeviceEvent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SADeviceUpdateEvent *v15;
  void *v16;
  SADeviceUpdateEvent *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SAMonitoringSessionManager devices](self, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = 68289539;
    v19[1] = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2113;
    v23 = v6;
    v24 = 2113;
    v25 = v11;
    _os_log_impl(&dword_1CA04F000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager remove device\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\"}", (uint8_t *)v19, 0x26u);

  }
  -[SAMonitoringSessionManager removeAndStopSafeLocationsForDeviceUUID:](self, "removeAndStopSafeLocationsForDeviceUUID:", v6);
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[SAMonitoringSessionManager cancelMonitoringDevice:](self, "cancelMonitoringDevice:", v6);
  -[SAMonitoringSessionManager devices](self, "devices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v6);

  v15 = [SADeviceUpdateEvent alloc];
  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SADeviceUpdateEvent initWithDevice:eventType:lastEvent:date:](v15, "initWithDevice:eventType:lastEvent:date:", v8, 1, v4, v16);

  -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ingestTAEvent:", v17);

}

- (void)setSafeLocations:(id)a3 forDeviceUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  __int128 v50;
  id v51;
  void *v52;
  id obj;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  _BYTE v77[14];
  __int16 v78;
  id v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];
  uint8_t v83[4];
  uint64_t v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v6 = a4;
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v73;
    *(_QWORD *)&v10 = 138477827;
    v50 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v73 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v15 = v54;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v69;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v69 != v18)
                objc_enumerationMutation(v15);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "isEqual:", v14, v50) & 1) != 0)
              {

                goto LABEL_18;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
            if (v17)
              continue;
            break;
          }
        }

        v20 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v21 = v20;
          objc_msgSend(v14, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v50;
          *(_QWORD *)v77 = v22;
          _os_log_impl(&dword_1CA04F000, v21, OS_LOG_TYPE_DEFAULT, "#SAMonitoringSessionManager found removed location, for deviceId, %{private}@", buf, 0xCu);

        }
        objc_msgSend(v51, "addObject:", v14, v50);
LABEL_18:
        ;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    }
    while (v11);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v23 = v51;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v65 != v26)
          objc_enumerationMutation(v23);
        -[SAMonitoringSessionManager stopSafeLocation:forDevice:](self, "stopSafeLocation:forDevice:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k), v6);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
    }
    while (v25);
  }
  v52 = v23;

  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v55 = v54;
  v29 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v61;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v61 != v31)
          objc_enumerationMutation(v55);
        v33 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v32);
        -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v6);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "containsObject:", v33);

        if ((v36 & 1) == 0)
        {
          -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            objc_msgSend(v28, "addObject:", v33);
          }
          else
          {
            v39 = (void *)TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
              -[SAMonitoringSessionManager setSafeLocations:forDeviceUUID:].cold.1(v83, v39, v6, &v84);
          }

        }
        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
    }
    while (v30);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v40 = v28;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v82, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v57;
    do
    {
      for (m = 0; m != v42; ++m)
      {
        if (*(_QWORD *)v57 != v43)
          objc_enumerationMutation(v40);
        -[SAMonitoringSessionManager startSafeLocation:forDevice:](self, "startSafeLocation:forDevice:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * m), v6);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v82, 16);
    }
    while (v42);
  }

  v45 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v46 = v45;
    v47 = objc_msgSend(v40, "count");
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)v77 = 0;
    *(_WORD *)&v77[4] = 2082;
    *(_QWORD *)&v77[6] = "";
    v78 = 2113;
    v79 = v6;
    v80 = 2049;
    v81 = v47;
    _os_log_impl(&dword_1CA04F000, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager update safe locations\", \"device\":\"%{private}@\", \"count\":%{private}ld}", buf, 0x26u);

  }
  v48 = (void *)objc_msgSend(v55, "copy");
  -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, v6);

}

- (void)removeSafeLocation:(id)a3 forDeviceUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (v18)
  {
    if (v6)
    {
      -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v18);

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0C99E20];
        -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithSet:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v18;
        if (v15)
        {
          -[SAMonitoringSessionManager stopSafeLocation:forDevice:](self, "stopSafeLocation:forDevice:", v18, v6);
          v16 = v18;
        }
        objc_msgSend(v13, "removeObject:", v16);
        -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v6);

      }
    }
  }

}

- (void)removeAndStopSafeLocationsForDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          -[SAMonitoringSessionManager stopSafeLocation:forDevice:](self, "stopSafeLocation:forDevice:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), v4, (_QWORD)v16);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
  -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs", (_QWORD)v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)startSafeLocation:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SASafeLocationUpdateEvent *v12;
  void *v13;
  SASafeLocationUpdateEvent *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  int v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v20 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v25 = 68289539;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2113;
    v30 = v6;
    v31 = 2113;
    v32 = v7;
    v21 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager start location error\", \"location\":\"%{private}@\", \"dev"
          "ice\":\"%{private}@\"}";
    v22 = v20;
    v23 = 38;
LABEL_10:
    _os_log_impl(&dword_1CA04F000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v25, v23);
    goto LABEL_11;
  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v24 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v25 = 68289283;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2113;
    v30 = v7;
    v21 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager start location device error\", \"device\":\"%{private}@\"}";
    v22 = v24;
    v23 = 28;
    goto LABEL_10;
  }
  v12 = [SASafeLocationUpdateEvent alloc];
  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SASafeLocationUpdateEvent initWithSafeLocation:eventType:lastEvent:date:](v12, "initWithSafeLocation:eventType:lastEvent:date:", v9, 0, 1, v13);

  v15 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v25 = 68289795;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2113;
    v30 = v6;
    v31 = 2113;
    v32 = v7;
    v33 = 2049;
    v34 = objc_msgSend(v9, "referenceFrame");
    _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager start location\", \"location\":\"%{private}@\", \"device\":\"%{private}@\", \"refFrame\":%{private}lu}", (uint8_t *)&v25, 0x30u);

  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scenarioClassifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ingestTAEvent:", v14);

LABEL_11:
}

- (void)stopSafeLocation:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SASafeLocationUpdateEvent *v12;
  void *v13;
  SASafeLocationUpdateEvent *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  int v24;
  _BYTE v25[24];
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v19 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v24 = 68289539;
    *(_DWORD *)v25 = 0;
    *(_WORD *)&v25[4] = 2082;
    *(_QWORD *)&v25[6] = "";
    *(_WORD *)&v25[14] = 2113;
    *(_QWORD *)&v25[16] = v6;
    v26 = 2113;
    v27 = v7;
    v20 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager stop location error\", \"location\":\"%{private}@\", \"devi"
          "ce\":\"%{private}@\"}";
    v21 = v19;
    v22 = 38;
LABEL_10:
    _os_log_impl(&dword_1CA04F000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);
    goto LABEL_11;
  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v23 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v24 = 68289283;
    *(_DWORD *)v25 = 0;
    *(_WORD *)&v25[4] = 2082;
    *(_QWORD *)&v25[6] = "";
    *(_WORD *)&v25[14] = 2113;
    *(_QWORD *)&v25[16] = v7;
    v20 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager stop location device error\", \"device\":\"%{private}@\"}";
    v21 = v23;
    v22 = 28;
    goto LABEL_10;
  }
  v12 = [SASafeLocationUpdateEvent alloc];
  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SASafeLocationUpdateEvent initWithSafeLocation:eventType:lastEvent:date:](v12, "initWithSafeLocation:eventType:lastEvent:date:", v9, 1, 1, v13);

  v15 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138478083;
    *(_QWORD *)v25 = v6;
    *(_WORD *)&v25[8] = 2113;
    *(_QWORD *)&v25[10] = v7;
    _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_DEFAULT, "#SAMonitoringSessionManager stop location %{private}@ for device %{private}@", (uint8_t *)&v24, 0x16u);
  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scenarioClassifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ingestTAEvent:", v14);

LABEL_11:
}

- (void)removeDevicesIfNeededPerEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t ii;
  __int128 v46;
  id v47;
  id obj;
  id obja;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[SAMonitoringSessionManager devices](self, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v72 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v50, "devices");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v68;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v68 != v13)
                objc_enumerationMutation(v10);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "isEqual:", v9) & 1) != 0)
              {

                goto LABEL_18;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
            if (v12)
              continue;
            break;
          }
        }

        v15 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          objc_msgSend(v9, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v80 = v17;
          _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_DEFAULT, "#SAMonitoringSessionManager found unpaired device, clearing deviceId, %{private}@", buf, 0xCu);

        }
        objc_msgSend(obj, "addObject:", v9);
LABEL_18:
        ;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    }
    while (v6);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v18 = obj;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v64 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
        objc_msgSend(v18, "lastObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSessionManager removeDeviceWithUUID:isLastDeviceEvent:](self, "removeDeviceWithUUID:isLastDeviceEvent:", v23, v23 == v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
    }
    while (v20);
  }

  -[SAMonitoringSessionManager devices](self, "devices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeObjectsForKeys:", v18);

  -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeObjectsForKeys:", v18);

  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
  if (v27)
  {
    v29 = v27;
    v30 = *(_QWORD *)v60;
    *(_QWORD *)&v28 = 138477827;
    v46 = v28;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v60 != v30)
          objc_enumerationMutation(obja);
        v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v50, "devices", v46);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v56;
          while (2)
          {
            for (n = 0; n != v35; ++n)
            {
              if (*(_QWORD *)v56 != v36)
                objc_enumerationMutation(v33);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * n), "isEqual:", v32) & 1) != 0)
              {

                goto LABEL_44;
              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
            if (v35)
              continue;
            break;
          }
        }

        v38 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v39 = v38;
          objc_msgSend(v32, "UUIDString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v46;
          v80 = v40;
          _os_log_impl(&dword_1CA04F000, v39, OS_LOG_TYPE_DEFAULT, "#SAMonitoringSessionManager found unpaired device in monitoring session record, clearing deviceId, %{private}@", buf, 0xCu);

        }
        objc_msgSend(v47, "addObject:", v32);
LABEL_44:
        ;
      }
      v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
    }
    while (v29);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v41 = v47;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v51, v75, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v52;
    do
    {
      for (ii = 0; ii != v43; ++ii)
      {
        if (*(_QWORD *)v52 != v44)
          objc_enumerationMutation(v41);
        -[SAMonitoringSessionManager cancelMonitoringDevice:](self, "cancelMonitoringDevice:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * ii));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v51, v75, 16);
    }
    while (v43);
  }

}

- (void)addDevicesIfNeededPerEvent:(id)a3
{
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id obj;
  id v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v4, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v45;
    v35 = v4;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v4, "devices");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[SAMonitoringSessionManager devices](self, "devices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (objc_msgSend(v10, "isReallyEqual:", v8))
          {
            objc_msgSend(v4, "safeLocations");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v6);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAMonitoringSessionManager deviceUUIDtoSafeLocationUUIDs](self, "deviceUUIDtoSafeLocationUUIDs");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v12, "isEqualToSet:", v14);

            v4 = v35;
            if ((v15 & 1) != 0)
              goto LABEL_13;
            objc_msgSend(v35, "safeLocations");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAMonitoringSessionManager removeSafeLocationsIfNeededPerNewSet:forDevice:](self, "removeSafeLocationsIfNeededPerNewSet:forDevice:", v17, v6);

            objc_msgSend(v35, "safeLocations");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAMonitoringSessionManager addSafeLocationsIfNeededPerNewSet:forDevice:](self, "addSafeLocationsIfNeededPerNewSet:forDevice:", v19, v6);
          }
          else
          {
            -[SAMonitoringSessionManager removeAndStopSafeLocationsForDeviceUUID:](self, "removeAndStopSafeLocationsForDeviceUUID:", v6);
            -[SAMonitoringSessionManager devices](self, "devices");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v21);

            objc_msgSend(v4, "devices");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v19);
          }

        }
        else
        {
          objc_msgSend(v37, "addObject:", v8);
        }
LABEL_13:

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v39);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = v37;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v22, "lastObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSessionManager addDevice:isLastDeviceEvent:](self, "addDevice:isLastDeviceEvent:", v27, v27 == v28);

        objc_msgSend(v4, "safeLocations");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSessionManager setSafeLocations:forDeviceUUID:](self, "setSafeLocations:forDeviceUUID:", v31, v32);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v24);
  }

  -[SAMonitoringSessionManager devices](self, "devices");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
    -[SAMonitoringSessionManager removeDisableReason:](self, "removeDisableReason:", 64);
  else
    -[SAMonitoringSessionManager addDisableReason:](self, "addDisableReason:", 64);

}

- (void)removeSafeLocationsIfNeededPerNewSet:(id)a3 forDevice:(id)a4
{
  -[SAMonitoringSessionManager removeAndStopSafeLocationsForDeviceUUID:](self, "removeAndStopSafeLocationsForDeviceUUID:", a4);
}

- (BOOL)isWithinCurrentVisitOrLOI:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  char v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;

  v4 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "latitude");
  v8 = v7;
  objc_msgSend(v5, "longitude");
  v10 = v9;

  v11 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:", v8, v10);
  -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v14, "coordinate");
    v17 = v16;
    objc_msgSend(v14, "coordinate");
  }
  else
  {
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0)
    {
      v26 = 0;
      goto LABEL_9;
    }
    -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v14, "latitude");
    v17 = v20;
    objc_msgSend(v14, "longitude");
    v18 = v21;
  }
  v22 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:", v17, v18);
  objc_msgSend(v22, "distanceFromLocation:", v11);
  v24 = v23;
  objc_msgSend(v14, "horizontalAccuracy");
  if (v25 < 100.0)
    v25 = 100.0;
  v26 = v24 <= v25;

LABEL_9:
  return v26;
}

- (BOOL)shouldIssueBookendedNotificationBasedOnLocationForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "trackedTravelingStartLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  if (v7 && v6)
    LODWORD(v8) = !-[SAMonitoringSessionManager isWithinCurrentVisitOrLOI:](self, "isWithinCurrentVisitOrLOI:", v6);

  return (char)v8;
}

- (BOOL)shouldIssueBookendedNotificationBasedOnTimeForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  int v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "trackedTravelingStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scenarioClassifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scenarioChangeDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v9, "timeIntervalSinceDate:", v7);
    v11 = v10 >= 360.0;
  }
  else
  {
    v11 = 1;
  }
  -[SAMonitoringSessionManager timeOfAttemptToLoadFromPersistence](self, "timeOfAttemptToLoadFromPersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v13);
  v15 = v14;

  if (v15 < 0.0)
    v15 = -v15;
  if (!v7)
  {
    v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v20 = 68289026;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager no tracked traveling start date\"}", (uint8_t *)&v20, 0x12u);
    }
  }
  v17 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v20 = 68289539;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 1025;
    v25 = v11;
    v26 = 1025;
    v27 = v15 >= 150.0;
    _os_log_impl(&dword_1CA04F000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager shouldIssueBookendedNotificationBasedOnTimeForDevice\", \"min travel satisified\":%{private}hhd, \"min duration after persistence\":%{private}hhd}", (uint8_t *)&v20, 0x1Eu);
  }
  v18 = v15 >= 150.0 && v11;

  return v18;
}

- (BOOL)shouldIssueBookendedNotificationForDevice:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SAMonitoringSessionManager shouldIssueBookendedNotificationBasedOnLocationForDevice:](self, "shouldIssueBookendedNotificationBasedOnLocationForDevice:", v4);
  v6 = -[SAMonitoringSessionManager shouldIssueBookendedNotificationBasedOnTimeForDevice:](self, "shouldIssueBookendedNotificationBasedOnTimeForDevice:", v4);

  v7 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v9[0] = 68289539;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1025;
    v13 = v5;
    v14 = 1025;
    v15 = v6;
    _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager shouldIssueBookendedNotificationForDevice\", \"based on location\":%{private}hhd, \"based on time\":%{private}hhd}", (uint8_t *)v9, 0x1Eu);
  }
  return v5 && v6;
}

- (void)updateDevicesWithSafeLocations:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "devices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 68289283;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2049;
    v12 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1CA04F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager update devices\", \"count\":%{private}ld}", (uint8_t *)v8, 0x1Cu);

  }
  -[SAMonitoringSessionManager removeDevicesIfNeededPerEvent:](self, "removeDevicesIfNeededPerEvent:", v4);
  -[SAMonitoringSessionManager addDevicesIfNeededPerEvent:](self, "addDevicesIfNeededPerEvent:", v4);

}

- (id)computeRemovedSafeLocations:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[SAMonitoringSessionManager safeLocations](self, "safeLocations"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    v9 = (void *)MEMORY[0x1E0C99E20];
    -[SAMonitoringSessionManager safeLocations](self, "safeLocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && objc_msgSend(v4, "count"))
      objc_msgSend(v12, "minusSet:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)updateSafeLocations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "safeLocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMonitoringSessionManager computeRemovedSafeLocations:](self, "computeRemovedSafeLocations:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v28 = v9;
    v29 = v4;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v14);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          -[SAMonitoringSessionManager devices](self, "devices", v28, v29, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "allKeys");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v31;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v31 != v20)
                  objc_enumerationMutation(v17);
                -[SAMonitoringSessionManager removeSafeLocation:forDeviceUUID:](self, "removeSafeLocation:forDeviceUUID:", v15, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v21++));
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
            }
            while (v19);
          }

          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v12);
    }

    v9 = v28;
    v4 = v29;
  }
  v22 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    objc_msgSend(v4, "safeLocations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 68289283;
    v39 = 0;
    v40 = 2082;
    v41 = "";
    v42 = 2049;
    v43 = v25;
    _os_log_impl(&dword_1CA04F000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager update safe locations\", \"count\":%{private}ld}", buf, 0x1Cu);

  }
  objc_msgSend(v4, "safeLocations", v28, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  -[SAMonitoringSessionManager setSafeLocations:](self, "setSafeLocations:", v27);

}

- (void)handleGeofenceEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "region");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "region");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          objc_msgSend(v5, "description");
          v12 = objc_claimAutoreleasedReturnValue();
          v30 = 68289283;
          v31 = 0;
          v32 = 2082;
          v33 = "";
          v34 = 2113;
          v35 = v12;
          _os_log_impl(&dword_1CA04F000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager handleGeofenceEvent received geofenceEvent\", \"geofence\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);

        }
        v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v5, "region");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "initWithUUIDString:", v15);

        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = objc_msgSend(v5, "eventType");
          if (v19 == 2 || v19 == 4)
          {
            objc_msgSend(v18, "geofence");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              -[SAMonitoringSessionManager fenceRequestServicer](self, "fenceRequestServicer");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "geofence");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "removeGeofence:", v28);

            }
            if (objc_msgSend(v18, "state") == 3)
            {
              -[SAMonitoringSessionManager handleGeofenceExitedForDeviceUUID:](self, "handleGeofenceExitedForDeviceUUID:", v16);
            }
            else if (objc_msgSend(v5, "eventType") == 4)
            {
              v29 = TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
              {
                v30 = 68289283;
                v31 = 0;
                v32 = 2082;
                v33 = "";
                v34 = 2113;
                v35 = v16;
                _os_log_impl(&dword_1CA04F000, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager handleGeofenceEvent ignored (recent crash?)\", \"geofence\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);
              }
            }
          }
          else if (v19 == 6)
          {
            objc_msgSend(v18, "geofence");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              objc_msgSend(v18, "setGeofence:", 0);
            if (objc_msgSend(v18, "state") == 3)
              -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](self, "changeMonitoringSessionState:toState:", v16, 1);
          }
        }
        else
        {
          v23 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
          {
            v24 = v23;
            objc_msgSend(v5, "description");
            v25 = objc_claimAutoreleasedReturnValue();
            v30 = 68289283;
            v31 = 0;
            v32 = 2082;
            v33 = "";
            v34 = 2113;
            v35 = v25;
            _os_log_impl(&dword_1CA04F000, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager handleGeofenceEvent geofenceEvent cannot be mapped to monitoring session\", \"geofence\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);

          }
        }

        goto LABEL_26;
      }
    }
  }
  v21 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
  {
    v16 = v21;
    objc_msgSend(v5, "description");
    v22 = objc_claimAutoreleasedReturnValue();
    v30 = 68289283;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    v34 = 2113;
    v35 = v22;
    _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager handleGeofenceEvent invalid geofenceEvent\", \"geofence\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);

LABEL_26:
  }

}

- (void)setUpTravelingGeofencesOnAirplaneModeToggleOffIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "state") == 1)
        {
          objc_msgSend(v10, "firstNotWithYouLocation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            if (-[SAMonitoringSessionManager addTravelFenceForDevice:](self, "addTravelFenceForDevice:", v8))
              -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](self, "changeMonitoringSessionState:toState:", v8, 3);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)removeDisableReason:(unint64_t)a3
{
  NSObject *v5;
  unint64_t disabledReasons;
  unint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2049;
    v12 = a3;
    _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager removeDisableReason\", \"reason\":%{private}lu}", (uint8_t *)v8, 0x1Cu);
  }
  disabledReasons = self->_disabledReasons;
  if ((disabledReasons & a3) != 0)
  {
    v7 = disabledReasons & ~a3;
    self->_disabledReasons = v7;
    if (!v7)
      -[SAMonitoringSessionManager setEnabled:](self, "setEnabled:", 1);
  }
}

- (void)addDisableReason:(unint64_t)a3
{
  NSObject *v5;
  unint64_t disabledReasons;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2049;
    v11 = a3;
    _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager addDisableReason\", \"reason\":%{private}lu}", (uint8_t *)v7, 0x1Cu);
  }
  disabledReasons = self->_disabledReasons;
  if ((disabledReasons & a3) == 0)
  {
    if (a3)
    {
      if (!disabledReasons)
      {
        -[SAMonitoringSessionManager setEnabled:](self, "setEnabled:", 0);
        disabledReasons = self->_disabledReasons;
      }
    }
    self->_disabledReasons = disabledReasons | a3;
  }
}

- (void)handleSystemStateChanged:(id)a3
{
  id v4;
  _BOOL4 isInAirplaneMode;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  SAMonitoringSessionManager *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SAMonitoringSessionManager *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  isInAirplaneMode = self->_isInAirplaneMode;
  switch(objc_msgSend(v4, "systemStateType"))
  {
    case 3:
      -[SAMonitoringSessionManager setIsInAirplaneMode:](self, "setIsInAirplaneMode:", objc_msgSend(v4, "isOn"));
      if (!-[SAMonitoringSessionManager standby](self, "standby"))
      {
        if (isInAirplaneMode && (objc_msgSend(v4, "isOn") & 1) == 0)
          -[SAMonitoringSessionManager setUpTravelingGeofencesOnAirplaneModeToggleOffIfNeeded](self, "setUpTravelingGeofencesOnAirplaneModeToggleOffIfNeeded");
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v36;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v36 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v13);
              -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", (_QWORD)v35);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v16, "state") == 1)
              {
                objc_msgSend(v16, "setEarlyAirplaneTrigger:", 1);
                objc_msgSend(v6, "addObject:", v14);
              }

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          }
          while (v11);
        }

        v17 = objc_msgSend(v6, "count");
        if (v17)
        {
          v18 = v17;
          v19 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289283;
            v40 = 0;
            v41 = 2082;
            v42 = "";
            v43 = 2049;
            v44 = v18;
            _os_log_impl(&dword_1CA04F000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting terminable long aggressive scan on Airplane Mode toggle\", \"count of devices to find\":%{private}ld}", buf, 0x1Cu);
          }
          -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector", (_QWORD)v35);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "forceUpdateWithYouStatusToFindDevices:withContext:", v6, 6);

        }
      }
      goto LABEL_38;
    case 5:
      if (objc_msgSend(v4, "isOn"))
      {
        v21 = self;
        v22 = 2;
        goto LABEL_31;
      }
      v33 = self;
      v34 = 2;
      goto LABEL_37;
    case 6:
      if (objc_msgSend(v4, "isOn"))
      {
        v21 = self;
        v22 = 4;
        goto LABEL_31;
      }
      v33 = self;
      v34 = 4;
      goto LABEL_37;
    case 8:
      if (objc_msgSend(v4, "isOn"))
      {
        v21 = self;
        v22 = 1;
        goto LABEL_31;
      }
      v33 = self;
      v34 = 1;
      goto LABEL_37;
    case 11:
      if (objc_msgSend(v4, "isOn"))
      {
        -[SAMonitoringSessionManager timeOfAttemptToLoadFromPersistence](self, "timeOfAttemptToLoadFromPersistence");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAMonitoringSessionManager setTimeOfAttemptToLoadFromPersistence:](self, "setTimeOfAttemptToLoadFromPersistence:", v24);

          -[SAMonitoringSessionManager persistenceManager](self, "persistenceManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "load");

          if (v26)
          {
            -[SAMonitoringSessionManager persistenceManager](self, "persistenceManager");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "store");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "monitoringSessionRecord");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAMonitoringSessionManager setDeviceUUIDtoMonitoringSession:](self, "setDeviceUUIDtoMonitoringSession:", v29);

            -[SAMonitoringSessionManager persistenceManager](self, "persistenceManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "store");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "monitoringSessionRecord");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAMonitoringSessionManager bootstrapMonitoringSessionRecord:](self, "bootstrapMonitoringSessionRecord:", v32);

          }
        }
        v21 = self;
        v22 = 128;
LABEL_31:
        -[SAMonitoringSessionManager removeDisableReason:](v21, "removeDisableReason:", v22);
      }
      else
      {
        v33 = self;
        v34 = 128;
LABEL_37:
        -[SAMonitoringSessionManager addDisableReason:](v33, "addDisableReason:", v34);
      }
LABEL_38:

      return;
    case 16:
      -[SAMonitoringSessionManager setIsCompanionConnected:](self, "setIsCompanionConnected:", objc_msgSend(v4, "isOn"));
      goto LABEL_38;
    default:
      goto LABEL_38;
  }
}

- (void)didChangeScenarioClassFrom:(unint64_t)a3 to:(unint64_t)a4 forDevice:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  BOOL v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  BOOL v45;
  NSObject *v46;
  _BOOL4 v47;
  _BOOL8 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint8_t buf[4];
  int v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state");

  if (v11 == 6)
  {
    v12 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v66 = 0;
      v67 = 2082;
      v68 = "";
      _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager didChangeScenarioClass end monitoring skip\"}", buf, 0x12u);
    }
    goto LABEL_59;
  }
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "scenario");

  if (v15 == a4)
    goto LABEL_59;
  if (a3 == 3)
  {
    v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      v66 = 0;
      v67 = 2082;
      v68 = "";
      v69 = 2113;
      v70 = v8;
      _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager end current traveling session\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLastAlertDateInCurrentTravelingSession:", 0);

  }
  v19 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", -[SAMonitoringSessionManager stateForDeviceUUID:](self, "stateForDeviceUUID:", v8));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[SAScenarioClassifier convertSAScenarioClassToString:](SAScenarioClassifier, "convertSAScenarioClassToString:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SAScenarioClassifier convertSAScenarioClassToString:](SAScenarioClassifier, "convertSAScenarioClassToString:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68290051;
    v66 = 0;
    v67 = 2082;
    v68 = "";
    v69 = 2113;
    v70 = v21;
    v71 = 2113;
    v72 = v22;
    v73 = 2113;
    v74 = v23;
    v75 = 2113;
    v76 = v8;
    _os_log_impl(&dword_1CA04F000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager didChangeScenarioClass\", \"sessionState\":\"%{private}@\", \"fromScenario\":\"%{private}@\", \"toScenario\":\"%{private}@\", \"uuid\":\"%{private}@\"}", buf, 0x3Au);

  }
  -[SAMonitoringSessionManager deviceRecord](self, "deviceRecord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "updateScenario:forDeviceWithUUID:", a4, v8);

  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setScenario:", a4);

  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "state");

  -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "statusForDeviceWithUUID:", v8);

  if (a4 - 2 < 3 || !a4)
  {
    switch(a3)
    {
      case 3uLL:
        v38 = -[SAMonitoringSessionManager standby](self, "standby");
        v39 = TASALog;
        v40 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
        if (!v38 && (v29 & 0xFFFFFFFFFFFFFFFDLL) == 1)
        {
          if (v40)
          {
            *(_DWORD *)buf = 68289283;
            v66 = 0;
            v67 = 2082;
            v68 = "";
            v69 = 2113;
            v70 = v8;
            _os_log_impl(&dword_1CA04F000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting a terminable long aggressive scan to find tracked device when ending traveling scenario\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
          -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v36;
          v43 = v41;
          v44 = 2;
          goto LABEL_36;
        }
        if (v40)
        {
          *(_DWORD *)buf = 68289283;
          v66 = 0;
          v67 = 2082;
          v68 = "";
          v69 = 2113;
          v70 = v8;
          _os_log_impl(&dword_1CA04F000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting short aggressive scan, ending traveling scenario and device is not tracked\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
        }
        -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[SAMonitoringSessionManager isAnyTrackedWhileTraveling](self, "isAnyTrackedWhileTraveling");
        break;
      case 2uLL:
        v45 = -[SAMonitoringSessionManager standby](self, "standby");
        v46 = TASALog;
        v47 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
        if (!v45 && v29 == 5)
        {
          if (v47)
          {
            *(_DWORD *)buf = 68289283;
            v66 = 0;
            v67 = 2082;
            v68 = "";
            v69 = 2113;
            v70 = v8;
            _os_log_impl(&dword_1CA04F000, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting a terminable long aggressive scan to find tracked device when exiting unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
          -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v36;
          v43 = v41;
          v44 = 1;
LABEL_36:
          objc_msgSend(v42, "forceUpdateWithYouStatusToFindDevices:withContext:", v43, v44);

LABEL_45:
          goto LABEL_46;
        }
        if (v47)
        {
          *(_DWORD *)buf = 68289283;
          v66 = 0;
          v67 = 2082;
          v68 = "";
          v69 = 2113;
          v70 = v8;
          _os_log_impl(&dword_1CA04F000, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting short aggressive scan, exiting unsafe location and device is not tracked\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
        }
        -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[SAMonitoringSessionManager isAnyInTrackedInUnsafeLocation](self, "isAnyInTrackedInUnsafeLocation");
        break;
      case 1uLL:
        v34 = TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289283;
          v66 = 0;
          v67 = 2082;
          v68 = "";
          v69 = 2113;
          v70 = v8;
          _os_log_impl(&dword_1CA04F000, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting short aggressive scan, exiting safe location for device\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
        }
        -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        v37 = 0;
        goto LABEL_44;
      default:
LABEL_46:
        switch(a4)
        {
          case 0uLL:
          case 4uLL:
            goto LABEL_55;
          case 1uLL:
            goto LABEL_47;
          case 2uLL:
            -[SAMonitoringSessionManager analytics](self, "analytics");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setInTravelState:", 0);

            -[SAMonitoringSessionManager analytics](self, "analytics");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setInSafeLocationState:", 0);

            -[SAMonitoringSessionManager analytics](self, "analytics");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v53;
            v55 = 1;
            goto LABEL_57;
          case 3uLL:
            -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (v56)
            {
              v57 = (void *)TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                v58 = v57;
                -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 68289283;
                v66 = 0;
                v67 = 2082;
                v68 = "";
                v69 = 2113;
                v70 = v59;
                _os_log_impl(&dword_1CA04F000, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager removing currentVisitOrLOIEvent due to scenario change\", \"currentVisitOrLOIEvent\":\"%{private}@\"}", buf, 0x1Cu);

              }
              -[SAMonitoringSessionManager currentVisitOrLOIEvent](self, "currentVisitOrLOIEvent");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              -[SAMonitoringSessionManager setPreviousVisitOrLOIEvent:](self, "setPreviousVisitOrLOIEvent:", v60);

              -[SAMonitoringSessionManager setCurrentVisitOrLOIEvent:](self, "setCurrentVisitOrLOIEvent:", 0);
            }
            -[SAMonitoringSessionManager analytics](self, "analytics");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setInTravelState:", 1);

LABEL_55:
            -[SAMonitoringSessionManager analytics](self, "analytics");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setInSafeLocationState:", 0);

            if (!-[SAMonitoringSessionManager anyDeviceInUnsafeLocation](self, "anyDeviceInUnsafeLocation"))
              goto LABEL_56;
            goto LABEL_58;
          default:
            goto LABEL_58;
        }
    }
    v37 = v48;
    v35 = v36;
LABEL_44:
    objc_msgSend(v35, "forceUpdateWithYouStatusWithShortScan:", v37);
    goto LABEL_45;
  }
  if (a4 == 1)
  {
    v32 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      v66 = 0;
      v67 = 2082;
      v68 = "";
      v69 = 2113;
      v70 = v8;
      _os_log_impl(&dword_1CA04F000, v32, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager not requesting aggressive scan, entering safe location for device\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
    v33 = v31 == 1 ? 1 : 2;
    -[SAMonitoringSessionManager updatedWithYouStatusFrom:to:forDeviceWithUUID:](self, "updatedWithYouStatusFrom:to:forDeviceWithUUID:", v33, v33, v8);
LABEL_47:
    if (-[SAMonitoringSessionManager allDevicesInSafeLocation](self, "allDevicesInSafeLocation"))
    {
      -[SAMonitoringSessionManager analytics](self, "analytics");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setInTravelState:", 0);

      -[SAMonitoringSessionManager analytics](self, "analytics");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setInSafeLocationState:", 1);

LABEL_56:
      -[SAMonitoringSessionManager analytics](self, "analytics");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      v55 = 0;
LABEL_57:
      objc_msgSend(v53, "setInUnsafeLocationState:", v55);

    }
  }
LABEL_58:
  -[SAMonitoringSessionManager scheduleNextPersistenceWrite](self, "scheduleNextPersistenceWrite");
LABEL_59:

}

- (BOOL)isAnyInTrackedInUnsafeLocation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_deviceUUIDtoMonitoringSession, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "state") == 5)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isAnyTrackedWhileTraveling
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_deviceUUIDtoMonitoringSession, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "state") == 1 || objc_msgSend(v7, "state") == 3)
        {
          v8 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void)addClient:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SAMonitoringSessionManager clients](self, "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[SAMonitoringSessionManager configureBackgroundScanning](self, "configureBackgroundScanning");
}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAMonitoringSessionManager clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (unint64_t)stateForDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "state");
  else
    v7 = 0;

  return v7;
}

- (unint64_t)scenarioClassForDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "scenario");
  else
    v7 = 0;

  return v7;
}

- (int64_t)earlyVehicularTriggerForDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "earlyVehicularTrigger");
  else
    v7 = -1;

  return v7;
}

+ (id)convertSAMonitoringSessionStateToString:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("Unknown");
  else
    return off_1E83D10D0[a3 - 1];
}

- (void)didForceUpdateWithYouStatus
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_deviceUUIDtoMonitoringSession, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 68289283;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = -[SAWithYouDetectorServiceProtocol statusForDeviceWithUUID:](self->_withYouDetector, "statusForDeviceWithUUID:", v9, v17);
        v11 = v10;
        if ((unint64_t)(v10 - 1) < 2)
        {
          -[SAMonitoringSessionManager updatedWithYouStatusFrom:to:forDeviceWithUUID:](self, "updatedWithYouStatusFrom:to:forDeviceWithUUID:", v10, v10, v9);
          continue;
        }
        if ((unint64_t)(v10 - 3) >= 2)
        {
          if (v10)
            continue;
          v15 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = 0;
            v24 = 2082;
            v25 = "";
            v26 = 2113;
            v27 = v9;
            _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager got unknown with-you status\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
        }
        else
        {
          v12 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v12;
            +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68289539;
            v23 = 0;
            v24 = 2082;
            v25 = "";
            v26 = 2113;
            v27 = v9;
            v28 = 2113;
            v29 = v14;
            _os_log_impl(&dword_1CA04F000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager got to be verified with-you status at the end of a force update\", \"uuid\":\"%{private}@\", \"status\":\"%{private}@\"}", buf, 0x26u);

          }
        }
        -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSessionManager scheduleNextForceUpdateWithYouStatusFromReferenceDate:forAlertForDevice:alertType:](self, "scheduleNextForceUpdateWithYouStatusFromReferenceDate:forAlertForDevice:alertType:", v16, v9, 0);

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v6);
  }

}

- (void)checkReunion:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
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
  void *v76;
  id v77;
  _QWORD v78[25];
  _QWORD v79[25];
  uint64_t buf;
  __int16 v81;
  const char *v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[SAMonitoringSessionManager deviceUUIDtoAlertContext](self, "deviceUUIDtoAlertContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SAMonitoringSessionManager deviceUUIDtoAlertContext](self, "deviceUUIDtoAlertContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lastAlert"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v14);
    v16 = v15;

    if (v16 <= 86400.0)
    {
      if (a3 != 2 || a4 != 1)
      {
LABEL_24:

        goto LABEL_25;
      }
      v37 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289283;
        v81 = 2082;
        v82 = "";
        v83 = 2113;
        v84 = v8;
        _os_log_impl(&dword_1CA04F000, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager reunion update\", \"uuid\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SAMonitoringSessionManager getMoreSpecificSADeviceType:](self, "getMoreSpecificSADeviceType:", v17);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("tLastWithYou"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v22 = v16 < 0.0 || v21 < 0.0;
    v23 = -1.0;
    if (v22)
      v24 = -1.0;
    else
      v24 = v16 + v21;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lLastWithYou"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_lastLocation)
    {
      -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TALocationLite timestamp](self->_lastLocation, "timestamp");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", v27);
      v29 = v28;

      v30 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      -[TALocationLite latitude](self->_lastLocation, "latitude");
      v32 = v31;
      -[TALocationLite longitude](self->_lastLocation, "longitude");
      v34 = (void *)objc_msgSend(v30, "initWithLatitude:longitude:", v32, v33);
      objc_msgSend(v34, "horizontalAccuracy");
      v36 = v35;
    }
    else
    {
      v34 = 0;
      v29 = -1.0;
      v36 = -1.0;
    }
    v38 = -1.0;
    if (v25)
    {
      objc_msgSend(v25, "horizontalAccuracy");
      v38 = v39;
      objc_msgSend(v34, "distanceFromLocation:", v25);
      v23 = v40;
    }
    -[SADeviceRecord getLatestAdvertisement:](self->_deviceRecord, "getLatestAdvertisement:", v8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v25;
    v77 = v8;
    v74 = v41;
    v75 = v34;
    if (v41)
      v42 = objc_msgSend(v41, "getBatteryState");
    else
      v42 = -1;
    v78[0] = CFSTR("deviceType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v73;
    v78[1] = CFSTR("productId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "productId"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v72;
    v78[2] = CFSTR("vendorId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "vendorId"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v71;
    v78[3] = CFSTR("tReunion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v79[3] = v70;
    v78[4] = CFSTR("tLastObserved");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v79[4] = v69;
    v78[5] = CFSTR("tMissingAdv");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v79[5] = v68;
    v78[6] = CFSTR("leftBehindReunionDistance");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v79[6] = v67;
    v78[7] = CFSTR("reunionAge");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v79[7] = v66;
    v78[8] = CFSTR("lastLeftBehindRadius");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v79[8] = v65;
    v78[9] = CFSTR("reunionRadius");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v79[9] = v64;
    v78[10] = CFSTR("lastAlertType");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v79[10] = v63;
    v78[11] = CFSTR("lastAlertIsBookendingTravel");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v79[11] = v62;
    v78[12] = CFSTR("lastAlertIsEarlyVehicularTrigger");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v79[12] = v61;
    v78[13] = CFSTR("lastAlertVehicularState");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v79[13] = v59;
    v78[14] = CFSTR("lastAlertIsVehicularBTHintOn");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v79[14] = v58;
    v78[15] = CFSTR("classicallyConnected");
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lastAlertIsClassicallyConnected"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v79[15] = v57;
    v78[16] = CFSTR("noCaseAdvSuppressed");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v79[16] = v56;
    v78[17] = CFSTR("lastBatteryStateBeforeAlert");
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lastAlertBatteryState"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v79[17] = v43;
    v78[18] = CFSTR("reunionBatteryState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v79[18] = v44;
    v78[19] = CFSTR("closeToAnySafeLocations");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v79[19] = v45;
    v78[20] = CFSTR("systemVersion");
    objc_msgSend(v17, "systemVersion");
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v46;
    v48 = CFSTR("unknown");
    if (v46)
      v48 = (const __CFString *)v46;
    v79[20] = v48;
    v78[21] = CFSTR("timeSinceLastAlert");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v79[21] = v49;
    v78[22] = CFSTR("triggeredAtHome");
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v79[22] = v50;
    v78[23] = CFSTR("rssi");
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lastAlertRssiValue"));
    v60 = v17;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v79[23] = v51;
    v78[24] = CFSTR("hasSurfacedInCurrentTravelingSession");
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("travelingSuppressed"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v79[24] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 25);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    -[SAMonitoringSessionManager analytics](self, "analytics");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "submitEvent:content:", CFSTR("com.apple.clx.alert.reunionEvent"), v55);

    -[SAMonitoringSessionManager deviceUUIDtoAlertContext](self, "deviceUUIDtoAlertContext");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v77;
    objc_msgSend(v54, "setObject:forKeyedSubscript:", 0, v77);

    goto LABEL_24;
  }
LABEL_25:

}

- (BOOL)deviceShouldTransitionWithLastScenarioChangeDate:(id)a3 lastWithYouDate:(id)a4
{
  double v4;

  objc_msgSend(a4, "timeIntervalSinceDate:", a3);
  return v4 >= 0.0;
}

- (void)updatedWithYouStatusFrom:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5
{
  id v8;
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
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  SAMonitoringSessionManager *v45;
  SAMonitoringSessionManager *v46;
  uint64_t v47;
  SAMonitoringSessionManager *v48;
  NSObject *v49;
  SAMonitoringSessionManager *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  const char *v62;
  NSObject *v63;
  os_log_type_t v64;
  SAMonitoringSessionManager *v65;
  SAMonitoringSessionManager *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  SAMonitoringSessionManager *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  id v90;
  void *v91;
  NSObject *v92;
  SAMonitoringSessionManager *v93;
  id v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  SAMonitoringSessionManager *v98;
  id v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  id v104;
  uint64_t v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  unint64_t v110;
  SAMonitoringSessionManager *v111;
  unint64_t v112;
  unint64_t v113;
  uint8_t buf[4];
  int v115;
  __int16 v116;
  const char *v117;
  __int16 v118;
  id v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  id v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[SAMonitoringSessionManager checkReunion:to:forDeviceWithUUID:](self, "checkReunion:to:forDeviceWithUUID:", a3, a4, v8);
  v110 = a3;
  if (a3 != a4)
  {
    -[SAMonitoringSessionManager devicesWithPendingTransition](self, "devicesWithPendingTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v8);

  }
  v113 = -[SAMonitoringSessionManager stateForDeviceUUID:](self, "stateForDeviceUUID:", v8);
  v112 = -[SAMonitoringSessionManager scenarioClassForDeviceUUID:](self, "scenarioClassForDeviceUUID:", v8);
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scenarioClassifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scenarioChangeDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "travelingGeofenceExitDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "earlyVehicularStateChangeDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SADeviceRecord getLastWithYouDate:](self->_deviceRecord, "getLastWithYouDate:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)TASALog;
  v111 = self;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", v113);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v20;
    v24 = v19;
    v25 = v16;
    v26 = v13;
    v27 = v8;
    +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v110);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[SAScenarioClassifier convertSAScenarioClassToString:](SAScenarioClassifier, "convertSAScenarioClassToString:", v112);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68290307;
    v115 = 0;
    v116 = 2082;
    v117 = "";
    v118 = 2113;
    v119 = v23;
    v120 = 2113;
    v121 = v28;
    v122 = 2113;
    v123 = v29;
    v124 = 2113;
    v125 = v30;
    v126 = 2113;
    v127 = v27;
    _os_log_impl(&dword_1CA04F000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updatedWithYouStatus\", \"sessionState\":\"%{private}@\", \"fromStatus\":\"%{private}@\", \"toStatus\":\"%{private}@\", \"scenario\":\"%{private}@\", \"uuid\":\"%{private}@\"}", buf, 0x44u);

    v8 = v27;
    v13 = v26;
    v16 = v25;
    v19 = v24;
    v20 = v109;

    self = v111;
  }
  switch(a4)
  {
    case 0uLL:
      v38 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        v39 = v8;
        v40 = v38;
        +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", v113);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v110);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68290051;
        v115 = 0;
        v116 = 2082;
        v117 = "";
        v118 = 2113;
        v119 = v41;
        v120 = 2113;
        v121 = v42;
        v122 = 2113;
        v123 = v43;
        v124 = 2113;
        v125 = v39;
        _os_log_impl(&dword_1CA04F000, v40, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager Unknown signal state\", \"sessionState\":\"%{private}@\", \"fromStatus\":\"%{private}@\", \"toStatus\":\"%{private}@\", \"uuid\":\"%{private}@\"}", buf, 0x3Au);

        v8 = v39;
LABEL_100:

      }
      goto LABEL_132;
    case 2uLL:
      -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
      v31 = v8;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstNotWithYouLocation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v31;
      if (!v34)
      {
        -[SAMonitoringSessionManager lastLocation](self, "lastLocation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setFirstNotWithYouLocation:", v35);

        v8 = v31;
LABEL_13:

      }
      break;
    case 1uLL:
      -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFirstNotWithYouLocation:", 0);
      goto LABEL_13;
  }
  switch(v113)
  {
    case 1uLL:
      switch(v112)
      {
        case 3uLL:
          if ((a4 == 4 || a4 == 2)
            && !-[SAMonitoringSessionManager standby](v111, "standby")
            && !-[SAMonitoringSessionManager isInAirplaneMode](v111, "isInAirplaneMode")
            && -[SAMonitoringSessionManager addTravelFenceForDevice:](v111, "addTravelFenceForDevice:", v8))
          {
            -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 3);
          }
          -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](v111, "deviceUUIDtoMonitoringSession");
          v74 = v8;
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "objectForKeyedSubscript:", v74);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setEarlyAirplaneTrigger:", 0);

          v8 = v74;
          break;
        case 2uLL:
          if (a4 == 1)
          {
            v46 = v111;
            if (!-[SAMonitoringSessionManager deviceShouldTransitionWithLastScenarioChangeDate:lastWithYouDate:](v111, "deviceShouldTransitionWithLastScenarioChangeDate:lastWithYouDate:", v13, v20))goto LABEL_117;
            -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 5);
            -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](v111, "deviceUUIDtoMonitoringSession");
            v77 = v8;
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "objectForKeyedSubscript:", v77);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "scenarioClassifier");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "currentUnsafeLocation");
            v81 = (void *)objc_claimAutoreleasedReturnValue();

            -[SAMonitoringSessionManager deviceRecord](v111, "deviceRecord");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v77;
            v84 = v111;
            objc_msgSend(v82, "updateLastWithYouLocation:forDeviceWithUUID:", v81, v77);

          }
          else
          {
            if (v110 != 2 || a4 != 2)
              goto LABEL_132;
            v84 = v111;
            if (-[SAMonitoringSessionManager shouldIssueBookendedNotificationForDevice:](v111, "shouldIssueBookendedNotificationForDevice:", v8))
            {
              if (-[SAMonitoringSessionManager enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:](v111, "enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:", v13, v8, 2))
              {
                v92 = TASALog;
                if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 68289283;
                  v115 = 0;
                  v116 = 2082;
                  v117 = "";
                  v118 = 2113;
                  v119 = v8;
                  _os_log_impl(&dword_1CA04F000, v92, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager issuing travel bookending notification into an unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
                }
                -[SAMonitoringSessionManager storeSeparationLocation:](v111, "storeSeparationLocation:", v8);
                -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 2);
                v83 = v8;
                -[SAMonitoringSessionManager notifyWhileTraveling:isBookendingTravel:](v111, "notifyWhileTraveling:isBookendingTravel:", v8, 1);
              }
              else
              {
                v83 = v8;
                -[SAMonitoringSessionManager scheduleNextForceUpdateWithYouStatusFromReferenceDate:forAlertForDevice:alertType:](v111, "scheduleNextForceUpdateWithYouStatusFromReferenceDate:forAlertForDevice:alertType:", v13, v8, 2);
              }
            }
            else
            {
              v106 = TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68289283;
                v115 = 0;
                v116 = 2082;
                v117 = "";
                v118 = 2113;
                v119 = v8;
                _os_log_impl(&dword_1CA04F000, v106, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager not issuing travel bookending notification into an unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
              }
              v83 = v8;
              -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 5);
            }
          }
          if ((-[SAMonitoringSessionManager caBroughtOutOnTravel](v84, "caBroughtOutOnTravel") & 0x8000000000000000) == 0)
          {
            -[SAMonitoringSessionManager analytics](v84, "analytics");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "addNumDevicesWithYou:", -[SAMonitoringSessionManager caBroughtOutOnTravel](v84, "caBroughtOutOnTravel"));

          }
          -[SAMonitoringSessionManager setCaBroughtOutOnTravel:](v84, "setCaBroughtOutOnTravel:", -1);
          v8 = v83;
          break;
        case 1uLL:
          if (a4 == 2)
          {
            v44 = TASALog;
            v45 = v111;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289283;
              v115 = 0;
              v116 = 2082;
              v117 = "";
              v118 = 2113;
              v119 = v8;
              _os_log_impl(&dword_1CA04F000, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager travel bookending into a safe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
            }
            -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 2);
            -[SAMonitoringSessionManager removeTravelFenceForDevice:](v111, "removeTravelFenceForDevice:", v8);
          }
          else
          {
            v45 = v111;
            -[SAMonitoringSessionManager removeTravelFenceForDevice:](v111, "removeTravelFenceForDevice:", v8);
            -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 2);
          }
          if ((-[SAMonitoringSessionManager caBroughtOutOnTravel](v45, "caBroughtOutOnTravel") & 0x8000000000000000) == 0)
          {
            -[SAMonitoringSessionManager analytics](v45, "analytics");
            v90 = v8;
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addNumDevicesWithYou:", -[SAMonitoringSessionManager caBroughtOutOnTravel](v45, "caBroughtOutOnTravel"));

            v8 = v90;
          }
          v48 = v45;
          v47 = -1;
          goto LABEL_85;
      }
      goto LABEL_132;
    case 2uLL:
      if (v112 == 2)
      {
        if (a4 == 1)
        {
          v65 = v111;
          if (-[SAMonitoringSessionManager deviceShouldTransitionWithLastScenarioChangeDate:lastWithYouDate:](v111, "deviceShouldTransitionWithLastScenarioChangeDate:lastWithYouDate:", v13, v20))
          {
            goto LABEL_61;
          }
          v98 = v111;
          goto LABEL_118;
        }
      }
      else if (v112 == 3)
      {
        v46 = v111;
        if (a4 == 1)
        {
          if (!-[SAMonitoringSessionManager deviceShouldTransitionWithLastScenarioChangeDate:lastWithYouDate:](v111, "deviceShouldTransitionWithLastScenarioChangeDate:lastWithYouDate:", v13, v20))goto LABEL_117;
          -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 1);
        }
        v47 = -[SAMonitoringSessionManager determineTrackedTravelingCount](v111, "determineTrackedTravelingCount");
        v48 = v111;
LABEL_85:
        -[SAMonitoringSessionManager setCaBroughtOutOnTravel:](v48, "setCaBroughtOutOnTravel:", v47);
      }
      goto LABEL_132;
    case 3uLL:
      if (a4 == 1)
        goto LABEL_53;
      if (a4 == 2)
      {
        if (v112 == 2)
        {
          if (v110 == 2)
          {
            if (!-[SAMonitoringSessionManager shouldIssueBookendedNotificationForDevice:](v111, "shouldIssueBookendedNotificationForDevice:", v8))
            {
              v107 = TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68289283;
                v115 = 0;
                v116 = 2082;
                v117 = "";
                v118 = 2113;
                v119 = v8;
                _os_log_impl(&dword_1CA04F000, v107, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager not issuing travel bookending notification into an unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
              }
              v66 = v111;
              v88 = v8;
              v89 = 5;
              goto LABEL_114;
            }
            if (!-[SAMonitoringSessionManager enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:](v111, "enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:", v13, v8, 2))
            {
              v98 = v111;
              v103 = v13;
              goto LABEL_136;
            }
            v97 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289283;
              v115 = 0;
              v116 = 2082;
              v117 = "";
              v118 = 2113;
              v119 = v8;
              _os_log_impl(&dword_1CA04F000, v97, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager issuing travel bookending notification into an unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
            }
            -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 2);
            v93 = v111;
            v94 = v8;
            v95 = 1;
            goto LABEL_107;
          }
        }
        else if (v112 == 1)
        {
          v49 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289283;
            v115 = 0;
            v116 = 2082;
            v117 = "";
            v118 = 2113;
            v119 = v8;
            _os_log_impl(&dword_1CA04F000, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager travel bookending into a safe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
          -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 2);
          -[SAMonitoringSessionManager removeTravelFenceForDevice:](v111, "removeTravelFenceForDevice:", v8);
        }
      }
      goto LABEL_132;
    case 4uLL:
      if (a4 - 3 < 2)
      {
        v67 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
        {
          v60 = v8;
          v40 = v67;
          +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", a4);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68289539;
          v115 = 0;
          v116 = 2082;
          v117 = "";
          v118 = 2113;
          v119 = v60;
          v120 = 2113;
          v121 = v61;
          v62 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager received unexpected status in verification stage\", \"
                "uuid\":\"%{private}@\", \"status\":\"%{private}@\"}";
          goto LABEL_98;
        }
      }
      else if (a4 == 1)
      {
LABEL_53:
        v65 = v111;
        -[SAMonitoringSessionManager removeTravelFenceForDevice:](v111, "removeTravelFenceForDevice:", v8);
        switch(v112)
        {
          case 3uLL:
            v66 = v111;
            goto LABEL_80;
          case 2uLL:
LABEL_61:
            -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v65, "changeMonitoringSessionState:toState:", v8, 5);
            -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](v65, "deviceUUIDtoMonitoringSession");
            v68 = v8;
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKeyedSubscript:", v68);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "scenarioClassifier");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "currentUnsafeLocation");
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            -[SAMonitoringSessionManager deviceRecord](v65, "deviceRecord");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "updateLastWithYouLocation:forDeviceWithUUID:", v72, v68);

            v8 = v68;
            break;
          case 1uLL:
            v66 = v111;
            goto LABEL_113;
        }
      }
      else if (a4 == 2)
      {
        if (v112 == 1)
        {
          v50 = v111;
          -[SAMonitoringSessionManager removeTravelFenceForDevice:](v111, "removeTravelFenceForDevice:", v8);
          goto LABEL_112;
        }
        if (v110 == 2)
        {
          if (!-[SAMonitoringSessionManager enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:](v111, "enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:", v16, v8, 2))
          {
            v98 = v111;
            v103 = v16;
LABEL_136:
            v104 = v8;
            v105 = 2;
            goto LABEL_119;
          }
          -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v8, 2);
          v93 = v111;
          v94 = v8;
          v95 = 0;
LABEL_107:
          -[SAMonitoringSessionManager notifyWhileTraveling:isBookendingTravel:](v93, "notifyWhileTraveling:isBookendingTravel:", v94, v95);
        }
      }
      goto LABEL_132;
    case 5uLL:
      if (v112 == 1)
      {
        if (a4 == 2)
        {
          v85 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68289283;
            v115 = 0;
            v116 = 2082;
            v117 = "";
            v118 = 2113;
            v119 = v8;
            _os_log_impl(&dword_1CA04F000, v85, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager lost from unsafe to safe\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
        }
        v66 = v111;
        goto LABEL_113;
      }
      if (v112 == 2)
      {
        if (a4 != 2)
          goto LABEL_132;
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](v111, "deviceUUIDtoMonitoringSession");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKeyedSubscript:", v8);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v87, "earlyVehicularTrigger"))
        {

        }
        else
        {
          -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](v111, "deviceUUIDtoMonitoringSession");
          v99 = v8;
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "objectForKeyedSubscript:", v99);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v101, "earlyAirplaneTrigger");

          v8 = v99;
          if (!v102)
            goto LABEL_132;
        }
        v50 = v111;
        if (!-[SAMonitoringSessionManager enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:](v111, "enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:", v19, v8, 1))
        {
          v98 = v111;
          v103 = v19;
          v104 = v8;
          v105 = 1;
          goto LABEL_119;
        }
        -[SAMonitoringSessionManager storeSeparationLocation:](v111, "storeSeparationLocation:", v8);
        -[SAMonitoringSessionManager notifyEarlyLeftBehind:](v111, "notifyEarlyLeftBehind:", v8);
LABEL_112:
        v66 = v50;
LABEL_113:
        v88 = v8;
        v89 = 2;
LABEL_114:
        -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v66, "changeMonitoringSessionState:toState:", v88, v89);
        goto LABEL_132;
      }
      if (v112 != 3)
        goto LABEL_132;
      if (a4 - 3 >= 2)
      {
        if (a4 != 1)
        {
          if (a4 == 2 && v110 == 2)
          {
            v51 = v13;
            -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](v111, "deviceUUIDtoMonitoringSession");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v8;
            v54 = v52;
            v55 = v53;
            objc_msgSend(v52, "objectForKeyedSubscript:");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "earlyVehicularTrigger");

            if (v57)
            {
              objc_msgSend(v19, "earlierDate:", v51);
              v58 = objc_claimAutoreleasedReturnValue();

              v51 = (id)v58;
            }
            v8 = v55;
            if (-[SAMonitoringSessionManager enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:](v111, "enoughTimeHasPassedBeforeSurfacingAlert:forAlertForDevice:alertType:", v51, v55, 1))
            {
              -[SAMonitoringSessionManager storeSeparationLocation:](v111, "storeSeparationLocation:", v55);
              -[SAMonitoringSessionManager notifyWhenLeftBehind:](v111, "notifyWhenLeftBehind:", v55);
              -[SAMonitoringSessionManager changeMonitoringSessionState:toState:](v111, "changeMonitoringSessionState:toState:", v55, 2);
            }
            else
            {
              -[SAMonitoringSessionManager scheduleNextForceUpdateWithYouStatusFromReferenceDate:forAlertForDevice:alertType:](v111, "scheduleNextForceUpdateWithYouStatusFromReferenceDate:forAlertForDevice:alertType:", v51, v55, 1);
            }

          }
          goto LABEL_132;
        }
        v46 = v111;
        if (-[SAMonitoringSessionManager deviceShouldTransitionWithLastScenarioChangeDate:lastWithYouDate:](v111, "deviceShouldTransitionWithLastScenarioChangeDate:lastWithYouDate:", v13, v20))
        {
          v66 = v111;
LABEL_80:
          v88 = v8;
          v89 = 1;
          goto LABEL_114;
        }
LABEL_117:
        v98 = v46;
LABEL_118:
        v103 = 0;
        v104 = v8;
        v105 = 0;
LABEL_119:
        -[SAMonitoringSessionManager scheduleNextForceUpdateWithYouStatusFromReferenceDate:forAlertForDevice:alertType:](v98, "scheduleNextForceUpdateWithYouStatusFromReferenceDate:forAlertForDevice:alertType:", v103, v104, v105);
        goto LABEL_132;
      }
      v96 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        v60 = v8;
        v40 = v96;
        +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", a4);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68289539;
        v115 = 0;
        v116 = 2082;
        v117 = "";
        v118 = 2113;
        v119 = v60;
        v120 = 2113;
        v121 = v61;
        v62 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager received unexpected status in left location stage\", \"
              "uuid\":\"%{private}@\", \"status\":\"%{private}@\"}";
LABEL_98:
        v63 = v40;
        v64 = OS_LOG_TYPE_ERROR;
        goto LABEL_99;
      }
LABEL_132:

      return;
    case 6uLL:
      v59 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        v60 = v8;
        v40 = v59;
        +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", 6);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68289539;
        v115 = 0;
        v116 = 2082;
        v117 = "";
        v118 = 2113;
        v119 = v61;
        v120 = 2113;
        v121 = v60;
        v62 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager session already finished\", \"sessionState\":\"%{privat"
              "e}@\", \"uuid\":\"%{private}@\"}";
        v63 = v40;
        v64 = OS_LOG_TYPE_FAULT;
LABEL_99:
        _os_log_impl(&dword_1CA04F000, v63, v64, v62, buf, 0x26u);

        v8 = v60;
        goto LABEL_100;
      }
      goto LABEL_132;
    default:
      goto LABEL_132;
  }
}

- (id)getLastScenarioChangeDateAmongAllDevices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "scenarioClassifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scenarioChangeDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v5, "compare:", v15) == -1)
        {
          v16 = v15;

          v5 = v16;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)scheduleNextForceUpdateWithYouStatusFromReferenceDate:(id)a3 forAlertForDevice:(id)a4 alertType:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  -[SAMonitoringSessionManager devicesWithPendingTransition](self, "devicesWithPendingTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  if (!self->_scheduledAlarmForForceUpdateWithYouStatus)
  {
    v10 = (uint64_t)v22;
    if (!v22)
    {
      -[SAMonitoringSessionManager getLastScenarioChangeDateAmongAllDevices](self, "getLastScenarioChangeDateAmongAllDevices");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (id)v10;
    if (-[SAMonitoringSessionManager _isOnlyMonitoringCompanionDevice](self, "_isOnlyMonitoringCompanionDevice"))
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      v12 = 30.0;
    }
    else
    {
      if (-[SAMonitoringSessionManager standby](self, "standby"))
        v13 = 6.0;
      else
        v13 = 39.0;
      v14 = (void *)MEMORY[0x1E0C99D68];
      -[SAMonitoringSessionManager timeDelayForRetryScanForAlertForDeviceUUID:alertType:](self, "timeDelayForRetryScanForAlertForDeviceUUID:alertType:", v8, a5);
      v12 = v15 - v13;
      v11 = v14;
    }
    objc_msgSend(v11, "dateWithTimeInterval:sinceDate:", v22, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "compare:", v17);

    if (v18 == -1)
    {
      v20 = -[SAMonitoringSessionManager standby](self, "standby");
      -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      if (v20)
        objc_msgSend(v21, "forceUpdateWithYouStatusWithShortScan:", 0);
      else
        objc_msgSend(v21, "forceUpdateWithYouStatus");
    }
    else
    {
      -[SATimeServiceProtocol setupAlarmFireAt:forClient:](self->_clock, "setupAlarmFireAt:forClient:", v16, self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAMonitoringSessionManager setScheduledAlarmForForceUpdateWithYouStatus:](self, "setScheduledAlarmForForceUpdateWithYouStatus:", v19);
    }

  }
}

- (BOOL)_isOnlyMonitoringCompanionDevice
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "deviceType");

          if (v13 != 8)
          {
            v14 = 0;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (void)scheduleNextPersistenceWrite
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SAMonitoringSessionManager nextScheduledAlarmForPersistenceWrite](self, "nextScheduledAlarmForPersistenceWrite");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SAMonitoringSessionManager clock](self, "clock");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99D68];
    -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateWithTimeInterval:sinceDate:", v5, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupAlarmFireAt:forClient:", v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMonitoringSessionManager setNextScheduledAlarmForPersistenceWrite:](self, "setNextScheduledAlarmForPersistenceWrite:", v7);

  }
}

- (double)timeDelayForRetryScanForAlertForDeviceUUID:(id)a3 alertType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  double v11;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SAMonitoringSessionManager devices](self, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SAWithYouDetectorServiceProtocol statusForDeviceWithUUID:](self->_withYouDetector, "statusForDeviceWithUUID:", v6);
  v10 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v13[0] = 68289795;
    v13[1] = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v6;
    v18 = 2049;
    v19 = a4;
    v20 = 2049;
    v21 = v9;
    _os_log_impl(&dword_1CA04F000, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager schedule retry scan\", \"uuid\":\"%{private}@\", \"alertType\":%{private}ld, \"withYouStatus\":%{private}ld}", (uint8_t *)v13, 0x30u);
  }
  if (!objc_msgSend(v8, "isAppleAudioAccessory")
    || (v11 = 360.0, a4 != 2) && (a4 || (v9 & 0xFFFFFFFFFFFFFFFBLL) != 0))
  {
    v11 = 120.0;
  }

  return v11;
}

- (BOOL)enoughTimeHasPassedBeforeSurfacingAlert:(id)a3 forAlertForDevice:(id)a4 alertType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  if (!a3)
    return 1;
  v8 = a4;
  v9 = a3;
  -[SAMonitoringSessionManager clock](self, "clock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getCurrentTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;

  -[SAMonitoringSessionManager minimumTimeSinceScenarioTransitionForAlertForDeviceUUID:alertType:](self, "minimumTimeSinceScenarioTransitionForAlertForDeviceUUID:alertType:", v8, a5);
  v15 = v14;

  v16 = v13 >= v15;
  return v16;
}

- (double)minimumTimeSinceScenarioTransitionForAlertForDeviceUUID:(id)a3 alertType:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  double v8;
  double v9;

  -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceType");
  v7 = objc_msgSend(v5, "isAppleAudioAccessory");
  v8 = 108.0;
  if (v6 != 16)
    v8 = 30.0;
  if (((a4 == 2) & v7) != 0)
    v9 = 324.0;
  else
    v9 = v8;

  return v9;
}

- (void)alarmFiredForUUID:(id)a3
{
  id v4;
  SAPersistenceManager *persistenceManager;
  void *v6;
  NSUUID *nextScheduledAlarmForPersistenceWrite;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  SAWithYouDetectorServiceProtocol *withYouDetector;
  void *v14;
  void *v15;
  NSUUID *scheduledAlarmForForceUpdateWithYouStatus;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_nextScheduledAlarmForPersistenceWrite))
  {
    persistenceManager = self->_persistenceManager;
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAPersistenceManager onUpdatedMonitoringSessionRecord:](persistenceManager, "onUpdatedMonitoringSessionRecord:", v6);

    nextScheduledAlarmForPersistenceWrite = self->_nextScheduledAlarmForPersistenceWrite;
    self->_nextScheduledAlarmForPersistenceWrite = 0;

  }
  if (objc_msgSend(v4, "isEqual:", self->_scheduledAlarmForForceUpdateWithYouStatus))
  {
    -[SAMonitoringSessionManager devicesWithPendingTransition](self, "devicesWithPendingTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = -[SAMonitoringSessionManager standby](self, "standby");
      v11 = TASALog;
      v12 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          v17 = 68289026;
          v18 = 0;
          v19 = 2082;
          v20 = "";
          _os_log_impl(&dword_1CA04F000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager alarm fired while standby, requesting short aggressive scan\"}", (uint8_t *)&v17, 0x12u);
        }
        -[SAWithYouDetectorServiceProtocol forceUpdateWithYouStatusWithShortScan:](self->_withYouDetector, "forceUpdateWithYouStatusWithShortScan:", 0);
      }
      else
      {
        if (v12)
        {
          v17 = 68289283;
          v18 = 0;
          v19 = 2082;
          v20 = "";
          v21 = 2049;
          v22 = v9;
          _os_log_impl(&dword_1CA04F000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager alarm fired while not standby, requesting a terminable long aggressive scan\", \"devices pending transition count\":%{private}ld}", (uint8_t *)&v17, 0x1Cu);
        }
        withYouDetector = self->_withYouDetector;
        -[SAMonitoringSessionManager devicesWithPendingTransition](self, "devicesWithPendingTransition");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAWithYouDetectorServiceProtocol forceUpdateWithYouStatusToFindDevices:withContext:](withYouDetector, "forceUpdateWithYouStatusToFindDevices:withContext:", v15, 8);

      }
    }
    scheduledAlarmForForceUpdateWithYouStatus = self->_scheduledAlarmForForceUpdateWithYouStatus;
    self->_scheduledAlarmForForceUpdateWithYouStatus = 0;

  }
}

- (void)didChangeTravelTypeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5
{
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[SAMonitoringSessionManager setCaCurrentVehicularState:](self, "setCaCurrentVehicularState:", a4);
  -[SAMonitoringSessionManager setCaIsVehicularBTHintOn:](self, "setCaIsVehicularBTHintOn:", (a5 >> 4) & 1);
  v8 = -[SAMonitoringSessionManager standby](self, "standby");
  if (a4 == 1 && !v8 && -[SAMonitoringSessionManager enabled](self, "enabled"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v37;
      *(_QWORD *)&v13 = 68289026;
      v34 = v13;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v16);
          -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession", v34);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[SAMonitoringSessionManager devices](self, "devices");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            if (objc_msgSend(v19, "state") == 5)
            {
              objc_msgSend(v19, "setEarlyVehicularTrigger:", 1);
              -[SAMonitoringSessionManager clock](self, "clock");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "getCurrentTime");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setEarlyVehicularStateChangeDate:", v23);

              objc_msgSend(v9, "addObject:", v17);
            }
          }
          else
          {
            v24 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              v45 = 0;
              v46 = 2082;
              v47 = "";
              _os_log_impl(&dword_1CA04F000, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager device found in monitoringSession list, but not in devices list\"}", buf, 0x12u);
            }
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v14);
    }

    v25 = objc_msgSend(v9, "count");
    if (v25)
    {
      v26 = v25;
      v27 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        v45 = 0;
        v46 = 2082;
        v47 = "";
        v48 = 2049;
        v49 = v26;
        _os_log_impl(&dword_1CA04F000, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting terminable long aggressive scan on travel type change\", \"count of devices to find\":%{private}ld}", buf, 0x1Cu);
      }
      -[SAMonitoringSessionManager withYouDetector](self, "withYouDetector");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "forceUpdateWithYouStatusToFindDevices:withContext:", v9, 7);

    }
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[SAMonitoringSessionManager deviceUUIDtoMonitoringSession](self, "deviceUUIDtoMonitoringSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allValues");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v41;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v41 != v32)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v33++), "setEarlyVehicularTrigger:", 0);
        }
        while (v31 != v33);
        v31 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v31);
    }
  }

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)standby
{
  return self->_standby;
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (SAWithYouDetectorServiceProtocol)withYouDetector
{
  return self->_withYouDetector;
}

- (void)setWithYouDetector:(id)a3
{
  objc_storeStrong((id *)&self->_withYouDetector, a3);
}

- (SAGeoFenceRequestProtocol)fenceRequestServicer
{
  return self->_fenceRequestServicer;
}

- (void)setFenceRequestServicer:(id)a3
{
  objc_storeStrong((id *)&self->_fenceRequestServicer, a3);
}

- (SAFenceManagerServiceProtocol)fenceManager
{
  return self->_fenceManager;
}

- (void)setFenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_fenceManager, a3);
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSMutableDictionary)deviceUUIDtoMonitoringSession
{
  return self->_deviceUUIDtoMonitoringSession;
}

- (void)setDeviceUUIDtoMonitoringSession:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUIDtoMonitoringSession, a3);
}

- (TALocationLite)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (SADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRecord, a3);
}

- (SAAnalyticsServiceProtocol)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (SATravelTypeClassifierServiceProtocol)travelTypeClassifier
{
  return self->_travelTypeClassifier;
}

- (void)setTravelTypeClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_travelTypeClassifier, a3);
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSMutableDictionary)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
  objc_storeStrong((id *)&self->_safeLocations, a3);
}

- (NSMutableDictionary)deviceUUIDtoSafeLocationUUIDs
{
  return self->_deviceUUIDtoSafeLocationUUIDs;
}

- (void)setDeviceUUIDtoSafeLocationUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUIDtoSafeLocationUUIDs, a3);
}

- (BOOL)requestedPeriodicScan
{
  return self->_requestedPeriodicScan;
}

- (void)setRequestedPeriodicScan:(BOOL)a3
{
  self->_requestedPeriodicScan = a3;
}

- (unint64_t)disabledReasons
{
  return self->_disabledReasons;
}

- (void)setDisabledReasons:(unint64_t)a3
{
  self->_disabledReasons = a3;
}

- (NSMutableDictionary)caLastAlertDate
{
  return self->_caLastAlertDate;
}

- (void)setCaLastAlertDate:(id)a3
{
  objc_storeStrong((id *)&self->_caLastAlertDate, a3);
}

- (int64_t)caBroughtOutOnTravel
{
  return self->_caBroughtOutOnTravel;
}

- (void)setCaBroughtOutOnTravel:(int64_t)a3
{
  self->_caBroughtOutOnTravel = a3;
}

- (NSMutableDictionary)deviceUUIDtoAlertContext
{
  return self->_deviceUUIDtoAlertContext;
}

- (void)setDeviceUUIDtoAlertContext:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUIDtoAlertContext, a3);
}

- (unint64_t)caCurrentVehicularState
{
  return self->_caCurrentVehicularState;
}

- (void)setCaCurrentVehicularState:(unint64_t)a3
{
  self->_caCurrentVehicularState = a3;
}

- (BOOL)caIsVehicularBTHintOn
{
  return self->_caIsVehicularBTHintOn;
}

- (void)setCaIsVehicularBTHintOn:(BOOL)a3
{
  self->_caIsVehicularBTHintOn = a3;
}

- (SAPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (SAAudioAccessory)audioAccessoryManager
{
  return self->_audioAccessoryManager;
}

- (void)setAudioAccessoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioAccessoryManager, a3);
}

- (NSUUID)nextScheduledAlarmForPersistenceWrite
{
  return self->_nextScheduledAlarmForPersistenceWrite;
}

- (void)setNextScheduledAlarmForPersistenceWrite:(id)a3
{
  objc_storeStrong((id *)&self->_nextScheduledAlarmForPersistenceWrite, a3);
}

- (NSUUID)scheduledAlarmForForceUpdateWithYouStatus
{
  return self->_scheduledAlarmForForceUpdateWithYouStatus;
}

- (void)setScheduledAlarmForForceUpdateWithYouStatus:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledAlarmForForceUpdateWithYouStatus, a3);
}

- (TAEventProtocol)currentVisitOrLOIEvent
{
  return self->_currentVisitOrLOIEvent;
}

- (void)setCurrentVisitOrLOIEvent:(id)a3
{
  objc_storeStrong((id *)&self->_currentVisitOrLOIEvent, a3);
}

- (TAEventProtocol)previousVisitOrLOIEvent
{
  return self->_previousVisitOrLOIEvent;
}

- (void)setPreviousVisitOrLOIEvent:(id)a3
{
  objc_storeStrong((id *)&self->_previousVisitOrLOIEvent, a3);
}

- (NSDate)timeOfAttemptToLoadFromPersistence
{
  return self->_timeOfAttemptToLoadFromPersistence;
}

- (void)setTimeOfAttemptToLoadFromPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfAttemptToLoadFromPersistence, a3);
}

- (BOOL)isCompanionConnected
{
  return self->_isCompanionConnected;
}

- (void)setIsCompanionConnected:(BOOL)a3
{
  self->_isCompanionConnected = a3;
}

- (void)setDevicesWithToBePopulatedTrackedTravelingStartLocation:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWithToBePopulatedTrackedTravelingStartLocation, a3);
}

- (NSMutableSet)devicesWithPendingTransition
{
  return self->_devicesWithPendingTransition;
}

- (void)setDevicesWithPendingTransition:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWithPendingTransition, a3);
}

- (BOOL)isInAirplaneMode
{
  return self->_isInAirplaneMode;
}

- (void)setIsInAirplaneMode:(BOOL)a3
{
  self->_isInAirplaneMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesWithPendingTransition, 0);
  objc_storeStrong((id *)&self->_devicesWithToBePopulatedTrackedTravelingStartLocation, 0);
  objc_storeStrong((id *)&self->_timeOfAttemptToLoadFromPersistence, 0);
  objc_storeStrong((id *)&self->_previousVisitOrLOIEvent, 0);
  objc_storeStrong((id *)&self->_currentVisitOrLOIEvent, 0);
  objc_storeStrong((id *)&self->_scheduledAlarmForForceUpdateWithYouStatus, 0);
  objc_storeStrong((id *)&self->_nextScheduledAlarmForPersistenceWrite, 0);
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_deviceUUIDtoAlertContext, 0);
  objc_storeStrong((id *)&self->_caLastAlertDate, 0);
  objc_storeStrong((id *)&self->_deviceUUIDtoSafeLocationUUIDs, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_travelTypeClassifier, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_deviceUUIDtoMonitoringSession, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
  objc_storeStrong((id *)&self->_fenceRequestServicer, 0);
  objc_storeStrong((id *)&self->_withYouDetector, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

- (void)setSafeLocations:(void *)a3 forDeviceUUID:(_QWORD *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138477827;
  *a4 = v8;
  _os_log_error_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_ERROR, "#SAMonitoringSessionManager attempted adding non-existing location, for deviceId, %{private}@", a1, 0xCu);

}

@end
