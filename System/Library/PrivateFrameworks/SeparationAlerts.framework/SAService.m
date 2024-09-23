@implementation SAService

- (void)ingestTAEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = 68289283;
    v15[1] = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2113;
    v19 = v7;
    _os_log_impl(&dword_1CA04F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Ingesting event\", \"Event\":\"%{private}@\"}", (uint8_t *)v15, 0x1Cu);

  }
  +[SALoggingUtilities logTAEvent:](SALoggingUtilities, "logTAEvent:", v4);
  -[SAService clock](self, "clock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ingestTAEvent:", v4);

  -[SAService deviceRecord](self, "deviceRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ingestTAEvent:", v4);

  -[SAService withYouDetector](self, "withYouDetector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ingestTAEvent:", v4);

  -[SAService monitoringSessionManager](self, "monitoringSessionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ingestTAEvent:", v4);

  -[SAService fenceManager](self, "fenceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ingestTAEvent:", v4);

  -[SAService travelTypeClassifier](self, "travelTypeClassifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ingestTAEvent:", v4);

  -[SAService powerLogger](self, "powerLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ingestTAEvent:", v4);

}

- (SAWithYouDetector)withYouDetector
{
  return self->_withYouDetector;
}

- (SATravelTypeClassifier)travelTypeClassifier
{
  return self->_travelTypeClassifier;
}

- (SAPowerLog)powerLogger
{
  return self->_powerLogger;
}

- (SAMonitoringSessionManager)monitoringSessionManager
{
  return self->_monitoringSessionManager;
}

- (SAFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (SADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (SATime)clock
{
  return self->_clock;
}

- (SAService)initWithAnalytics:(id)a3 isReplay:(BOOL)a4 audioAccessoryManager:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  SAService *v10;
  uint64_t v11;
  NSHashTable *clients;
  SATime *v13;
  SATime *clock;
  SADeviceRecord *v15;
  SADeviceRecord *deviceRecord;
  SATravelTypeClassifier *v17;
  SATravelTypeClassifier *travelTypeClassifier;
  SAWithYouDetector *v19;
  SAWithYouDetector *withYouDetector;
  SAFenceManager *v21;
  SAFenceManager *fenceManager;
  SAPersistenceManager *v23;
  SAPersistenceManagerSettings *v24;
  uint64_t v25;
  SAPersistenceManager *persistenceManager;
  SAMonitoringSessionManager *v27;
  SAMonitoringSessionManager *monitoringSessionManager;
  SAPowerLog *v29;
  SAPowerLog *powerLogger;
  objc_super v32;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)SAService;
  v10 = -[SAService init](&v32, sel_init);
  if (v10)
  {
    TARegisterLogs();
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v11 = objc_claimAutoreleasedReturnValue();
    clients = v10->_clients;
    v10->_clients = (NSHashTable *)v11;

    v13 = -[SATime initWithExternalTimer:isReplay:]([SATime alloc], "initWithExternalTimer:isReplay:", v10, v6);
    clock = v10->_clock;
    v10->_clock = v13;

    v15 = -[SADeviceRecord initWithClock:analytics:]([SADeviceRecord alloc], "initWithClock:analytics:", v10->_clock, v8);
    deviceRecord = v10->_deviceRecord;
    v10->_deviceRecord = v15;

    v17 = -[SATravelTypeClassifier initWithClock:]([SATravelTypeClassifier alloc], "initWithClock:", v10->_clock);
    travelTypeClassifier = v10->_travelTypeClassifier;
    v10->_travelTypeClassifier = v17;

    v19 = -[SAWithYouDetector initWithBluetoothScanner:locationRequester:deviceRecord:clock:analytics:]([SAWithYouDetector alloc], "initWithBluetoothScanner:locationRequester:deviceRecord:clock:analytics:", v10, v10, v10->_deviceRecord, v10->_clock, v8);
    withYouDetector = v10->_withYouDetector;
    v10->_withYouDetector = v19;

    v21 = objc_alloc_init(SAFenceManager);
    fenceManager = v10->_fenceManager;
    v10->_fenceManager = v21;

    v23 = [SAPersistenceManager alloc];
    v24 = objc_alloc_init(SAPersistenceManagerSettings);
    v25 = -[SAPersistenceManager initWithSettings:](v23, "initWithSettings:", v24);
    persistenceManager = v10->_persistenceManager;
    v10->_persistenceManager = (SAPersistenceManager *)v25;

    v27 = -[SAMonitoringSessionManager initWithWithYouDetector:fenceRequestServicer:fenceManager:travelTypeClassifier:clock:deviceRecord:analytics:persistenceManager:audioAccessoryManager:]([SAMonitoringSessionManager alloc], "initWithWithYouDetector:fenceRequestServicer:fenceManager:travelTypeClassifier:clock:deviceRecord:analytics:persistenceManager:audioAccessoryManager:", v10->_withYouDetector, v10, v10->_fenceManager, v10->_travelTypeClassifier, v10->_clock, v10->_deviceRecord, v8, v10->_persistenceManager, v9);
    monitoringSessionManager = v10->_monitoringSessionManager;
    v10->_monitoringSessionManager = v27;

    v29 = -[SAPowerLog initWithClock:isReplay:]([SAPowerLog alloc], "initWithClock:isReplay:", v10->_clock, v6);
    powerLogger = v10->_powerLogger;
    v10->_powerLogger = v29;

    -[SAPowerLog addClient:](v10->_powerLogger, "addClient:", v10);
    -[SAMonitoringSessionManager addClient:](v10->_monitoringSessionManager, "addClient:", v10);
    -[SAFenceManager addClient:](v10->_fenceManager, "addClient:", v10);
    -[SATravelTypeClassifier addClient:](v10->_travelTypeClassifier, "addClient:", v10->_withYouDetector);
  }

  return v10;
}

- (void)addClient:(id)a3
{
  -[NSHashTable addObject:](self->_clients, "addObject:", a3);
}

- (void)removeClient:(id)a3
{
  -[NSHashTable removeObject:](self->_clients, "removeObject:", a3);
}

- (void)enableMonitoringForSeparations:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v18 = v3;
    _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service enableMonitoringForSeparations: %{public}d", buf, 8u);
  }
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "separationAlertsService:enableMonitoringForSeparations:", self, v3);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)notifySeparationsForDevices:(id)a3 withLocation:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v11 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      *(_DWORD *)buf = 134283521;
      v26 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_DEFAULT, "#sa Service notifyAboutDevices:%{private}lu", buf, 0xCu);

    }
    -[SAService powerLogger](self, "powerLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "increaseSeparationAlertsCount:", objc_msgSend(v8, "count"));

    -[NSHashTable allObjects](self->_clients, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v19, "separationAlertsService:notifySeparationsForDevices:withLocation:withContext:", self, v8, v9, v10);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

  }
}

- (void)requestBluetoothScanForTypes:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283521;
    v19 = a3;
    _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service requestBluetoothScan:%{private}#lx", buf, 0xCu);
  }
  -[SAService powerLogger](self, "powerLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "increaseBTScanCount");

  -[NSHashTable allObjects](self->_clients, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "separationAlertsService:requestBluetoothScanForTypes:", self, a3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)requestLocationForType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283521;
    v19 = a3;
    _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service requestLocationForType:%{private}#lx", buf, 0xCu);
  }
  if (a3 == 1)
  {
    -[SAService powerLogger](self, "powerLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "increaseWifiLocationRequestCount");
  }
  else
  {
    if (a3)
      goto LABEL_8;
    -[SAService powerLogger](self, "powerLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "increaseGpsLocationRequestCount");
  }

LABEL_8:
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "separationAlertsService:requestLocationForType:", self, a3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)addGeofence:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service addGeofence", buf, 2u);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isLowPower") & 1) == 0)
      {
        -[SAService powerLogger](self, "powerLogger");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "increaseGeofenceCount");

      }
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "separationAlertsService:addGeofence:", self, v4);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)removeGeofence:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service removeGeofence", buf, 2u);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "separationAlertsService:removeGeofence:", self, v4);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)requestStateForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service requestStateForRegion", buf, 2u);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "separationAlertsService:requestStateForRegion:", self, v4);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)scheduleSATimeEvent:(double)a3 forAlarm:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v20 = a3;
    _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_DEFAULT, "#sa Service scheduleSATimeEvent:%{public}#lf", buf, 0xCu);
  }
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "separationAlertsService:scheduleSATimeEvent:forAlarm:", self, v6, a3);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)cancelSATimeEventForAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t buf;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289282;
    v18 = 2082;
    v19 = "";
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service cancelSATimeEventForAlarm\", \"uuid\":\"%{public}@\"}", (uint8_t *)&buf, 0x1Cu);
  }
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "separationAlertsService:cancelSATimeEventForAlarm:", self, v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)startBackgroundScanning
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t buf;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v16 = 2082;
    v17 = "";
    _os_log_impl(&dword_1CA04F000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service startBackgroundScanning\"}", (uint8_t *)&buf, 0x12u);
  }
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "separationAlertsServiceStartBackgroundScanning:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)stopBackgroundScanning
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t buf;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v16 = 2082;
    v17 = "";
    _os_log_impl(&dword_1CA04F000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service stopBackgroundScanning\"}", (uint8_t *)&buf, 0x12u);
  }
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "separationAlertsServiceStopBackgroundScanning:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)stopLongAggressiveScan
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t buf;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v16 = 2082;
    v17 = "";
    _os_log_impl(&dword_1CA04F000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service stopLongAggressiveScan\"}", (uint8_t *)&buf, 0x12u);
  }
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "separationAlertsServiceStopLongAggressiveScan:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)fetchLastVisit
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t buf;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v16 = 2082;
    v17 = "";
    _os_log_impl(&dword_1CA04F000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service fetchLastVisit\"}", (uint8_t *)&buf, 0x12u);
  }
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "separationAlertsServiceFetchLastVisit:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)updatedMonitoringState:(unint64_t)a3 forDeviceUUID:(id)a4
{
  id v5;
  id v6;

  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v5 = a4;
    -[SAService powerLogger](self, "powerLogger");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addMonitoredDevice:", v5);

  }
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (void)setDeviceRecord:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRecord, a3);
}

- (void)setWithYouDetector:(id)a3
{
  objc_storeStrong((id *)&self->_withYouDetector, a3);
}

- (void)setMonitoringSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_monitoringSessionManager, a3);
}

- (void)setFenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_fenceManager, a3);
}

- (void)setTravelTypeClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_travelTypeClassifier, a3);
}

- (void)setPowerLogger:(id)a3
{
  objc_storeStrong((id *)&self->_powerLogger, a3);
}

- (SAPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_powerLogger, 0);
  objc_storeStrong((id *)&self->_travelTypeClassifier, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
  objc_storeStrong((id *)&self->_monitoringSessionManager, 0);
  objc_storeStrong((id *)&self->_withYouDetector, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
