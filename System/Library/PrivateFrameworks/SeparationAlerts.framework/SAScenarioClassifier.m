@implementation SAScenarioClassifier

- (SAScenarioClassifier)initWithDeviceUuid:(id)a3
{
  return -[SAScenarioClassifier initWithDeviceUuid:scenarioClass:unsafeLocation:](self, "initWithDeviceUuid:scenarioClass:unsafeLocation:", a3, 0, 0);
}

- (SAScenarioClassifier)initWithDeviceUuid:(id)a3 scenarioClass:(unint64_t)a4 unsafeLocation:(id)a5
{
  id v8;
  id v9;
  SAScenarioClassifier *v10;
  uint64_t v11;
  NSHashTable *clients;
  uint64_t v13;
  NSDate *scenarioChangeDate;
  uint64_t v15;
  NSUUID *deviceUuid;
  NSMutableSet *v17;
  NSMutableSet *safeLocations;
  NSMutableDictionary *v19;
  NSMutableDictionary *statesBySafeLocation;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SAScenarioClassifier;
  v10 = -[SAScenarioClassifier init](&v22, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v11 = objc_claimAutoreleasedReturnValue();
    clients = v10->_clients;
    v10->_clients = (NSHashTable *)v11;

    v10->_scenarioClassification = a4;
    -[SAScenarioClassifier getCurrentTime](v10, "getCurrentTime");
    v13 = objc_claimAutoreleasedReturnValue();
    scenarioChangeDate = v10->_scenarioChangeDate;
    v10->_scenarioChangeDate = (NSDate *)v13;

    v15 = objc_msgSend(v8, "copy");
    deviceUuid = v10->_deviceUuid;
    v10->_deviceUuid = (NSUUID *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    safeLocations = v10->_safeLocations;
    v10->_safeLocations = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    statesBySafeLocation = v10->_statesBySafeLocation;
    v10->_statesBySafeLocation = v19;

    if (v10->_scenarioClassification == 2)
      objc_storeStrong((id *)&v10->_currentUnsafeLocation, a5);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CLRegion *currentUnsafeLocation;
  CLCircularRegion *currentVisit;
  CLRegion *lastUnsafeLocation;
  NSMutableDictionary *statesBySafeLocation;
  NSMutableSet *safeLocations;
  NSUUID *deviceUuid;
  NSDate *scenarioChangeDate;
  SAFenceManagerRequestProtocol *delegate;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SAScenarioClassifier currentUnsafeLocation](self, "currentUnsafeLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SAScenarioClassifier currentUnsafeLocation](self, "currentUnsafeLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAScenarioClassifier _removeUnsafeLocation:](self, "_removeUnsafeLocation:", v4);

  }
  -[SAScenarioClassifier safeLocations](self, "safeLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[SAScenarioClassifier _removeSafeLocation:](self, "_removeSafeLocation:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  currentUnsafeLocation = self->_currentUnsafeLocation;
  self->_currentUnsafeLocation = 0;

  currentVisit = self->_currentVisit;
  self->_currentVisit = 0;

  lastUnsafeLocation = self->_lastUnsafeLocation;
  self->_lastUnsafeLocation = 0;

  statesBySafeLocation = self->_statesBySafeLocation;
  self->_statesBySafeLocation = 0;

  safeLocations = self->_safeLocations;
  self->_safeLocations = 0;

  deviceUuid = self->_deviceUuid;
  self->_deviceUuid = 0;

  scenarioChangeDate = self->_scenarioChangeDate;
  self->_scenarioChangeDate = 0;

  delegate = self->_delegate;
  self->_delegate = 0;

  v20.receiver = self;
  v20.super_class = (Class)SAScenarioClassifier;
  -[SAScenarioClassifier dealloc](&v20, sel_dealloc);
}

- (BOOL)_setNewScenarioClass:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  NSDate *v7;
  NSDate *scenarioChangeDate;

  v5 = -[SAScenarioClassifier scenarioClassification](self, "scenarioClassification");
  -[SAScenarioClassifier setScenarioClassification:](self, "setScenarioClassification:", a3);
  v6 = -[SAScenarioClassifier scenarioClassification](self, "scenarioClassification");
  if (v6 != v5)
  {
    -[SAScenarioClassifier getCurrentTime](self, "getCurrentTime");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    scenarioChangeDate = self->_scenarioChangeDate;
    self->_scenarioChangeDate = v7;

    -[SAScenarioClassifier _notifyAllClientsOfScenarioChangeFrom:to:](self, "_notifyAllClientsOfScenarioChangeFrom:to:", v5, -[SAScenarioClassifier scenarioClassification](self, "scenarioClassification"));
  }
  return v6 != v5;
}

- (BOOL)_isInsideAnySafeLocation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
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
  -[SAScenarioClassifier safeLocations](self, "safeLocations", 0);
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
        -[SAScenarioClassifier statesBySafeLocation](self, "statesBySafeLocation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", &unk_1E83DB1E8);

        if ((v11 & 1) != 0)
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

- (BOOL)_hasAllSafeLocationStatesKnown
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
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
  -[SAScenarioClassifier safeLocations](self, "safeLocations", 0);
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
        -[SAScenarioClassifier statesBySafeLocation](self, "statesBySafeLocation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", &unk_1E83DB200);

        if ((v11 & 1) != 0)
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

+ (id)convertSAScenarioClassToString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E83D12B0[a3 - 1];
}

- (void)_notifyAllClientsOfScenarioChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t buf;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SAScenarioClassifier convertSAScenarioClassToString:](SAScenarioClassifier, "convertSAScenarioClassToString:", a3);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    +[SAScenarioClassifier convertSAScenarioClassToString:](SAScenarioClassifier, "convertSAScenarioClassToString:", a4);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    buf = 68289795;
    v26 = 2082;
    v27 = "";
    v28 = 2113;
    v29 = v9;
    v30 = 2081;
    v31 = v11;
    v32 = 2081;
    v33 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier notifyScenarioChange\", \"device\":\"%{private}@\", \"from\":\"%{private}s\", \"to\":\"%{private}s\"}", (uint8_t *)&buf, 0x30u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SAScenarioClassifier clients](self, "clients", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v17);
        -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "didChangeScenarioClassFrom:to:forDevice:", a3, a4, v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)didDetermineState:(unint64_t)a3 forUnsafeLocation:(id)a4 forDevice:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  int v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    -[SAScenarioClassifier currentUnsafeLocation](self, "currentUnsafeLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 && -[SAScenarioClassifier scenarioClassification](self, "scenarioClassification") == 2)
    {
      v13 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 68289283;
        v25 = 0;
        v26 = 2082;
        v27 = "";
        v28 = 2113;
        v29 = v9;
        _os_log_impl(&dword_1CA04F000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier setting current unsafe location from nil\", \"device\":\"%{private}@\"}", (uint8_t *)&v24, 0x1Cu);
      }
      -[SAScenarioClassifier setCurrentUnsafeLocation:](self, "setCurrentUnsafeLocation:", v8);
    }
    -[SAScenarioClassifier currentUnsafeLocation](self, "currentUnsafeLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    v18 = TASALog;
    if ((v17 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 68289539;
        v25 = 0;
        v26 = 2082;
        v27 = "";
        v28 = 2113;
        v29 = v9;
        v30 = 2049;
        v31 = a3;
        _os_log_impl(&dword_1CA04F000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier didDetermineState unsafe\", \"device\":\"%{private}@\", \"state\":%{private}ld}", (uint8_t *)&v24, 0x26u);
      }
      switch(-[SAScenarioClassifier scenarioClassification](self, "scenarioClassification"))
      {
        case 0uLL:
          if (a3 != 2)
            goto LABEL_21;
          -[SAScenarioClassifier _setNewScenarioClass:](self, "_setNewScenarioClass:", 3);
          goto LABEL_30;
        case 1uLL:
          v21 = TASALog;
          if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
            goto LABEL_27;
          v24 = 68289283;
          v25 = 0;
          v26 = 2082;
          v27 = "";
          v28 = 2113;
          v29 = v9;
          v19 = "{\"msg%{public}.0s\":\"#SAScenarioClassifier forUnsafeLocation in safe\", \"device\":\"%{private}@\"}";
          goto LABEL_25;
        case 2uLL:
          if (a3 == 2)
          {
            -[SAScenarioClassifier currentUnsafeLocation](self, "currentUnsafeLocation");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAScenarioClassifier setLastUnsafeLocation:](self, "setLastUnsafeLocation:", v22);

            -[SAScenarioClassifier setCurrentUnsafeLocation:](self, "setCurrentUnsafeLocation:", 0);
            if (-[SAScenarioClassifier _setNewScenarioClass:](self, "_setNewScenarioClass:", 3))
              goto LABEL_30;
          }
          goto LABEL_27;
        case 3uLL:
          if (a3 == 2)
          {
            v23 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
            {
              v24 = 68289283;
              v25 = 0;
              v26 = 2082;
              v27 = "";
              v28 = 2113;
              v29 = v9;
              _os_log_impl(&dword_1CA04F000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAScenarioClassifier forUnsafeLocation unexpected\", \"device\":\"%{private}@\"}", (uint8_t *)&v24, 0x1Cu);
            }
LABEL_30:
            -[SAScenarioClassifier _removeUnsafeLocation:](self, "_removeUnsafeLocation:", v8);
          }
          else
          {
LABEL_21:
            if (a3 == 1)
              -[SAScenarioClassifier _setNewScenarioClass:](self, "_setNewScenarioClass:", 2);
          }
          goto LABEL_27;
        case 4uLL:
          v21 = TASALog;
          if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
            goto LABEL_27;
          v24 = 68289283;
          v25 = 0;
          v26 = 2082;
          v27 = "";
          v28 = 2113;
          v29 = v9;
          v19 = "{\"msg%{public}.0s\":\"#SAScenarioClassifier forUnsafeLocation not supported\", \"device\":\"%{private}@\"}";
LABEL_25:
          v20 = v21;
          break;
        default:
          goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v24 = 68289283;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2113;
      v29 = v9;
      v19 = "{\"msg%{public}.0s\":\"#SAScenarioClassifier forUnsafeLocation location\", \"device\":\"%{private}@\"}";
      v20 = v18;
LABEL_26:
      _os_log_impl(&dword_1CA04F000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v24, 0x1Cu);
    }
  }
LABEL_27:

}

- (void)didDetermineState:(unint64_t)a3 forSafeLocation:(id)a4 forDevice:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  SAScenarioClassifier *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    -[SAScenarioClassifier safeLocations](self, "safeLocations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v8);

    if (v13)
    {
      v14 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 68289539;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = v9;
        v27 = 2049;
        v28 = a3;
        _os_log_impl(&dword_1CA04F000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier didDetermineState safe\", \"device\":\"%{private}@\", \"state\":%{private}ld}", (uint8_t *)&v21, 0x26u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAScenarioClassifier statesBySafeLocation](self, "statesBySafeLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v8);

      if (a3)
      {
        switch(-[SAScenarioClassifier scenarioClassification](self, "scenarioClassification"))
        {
          case 0uLL:
            if (a3 != 1 && !-[SAScenarioClassifier _isInsideAnySafeLocation](self, "_isInsideAnySafeLocation"))
              goto LABEL_13;
            goto LABEL_18;
          case 1uLL:
            if (a3 != 2
              || -[SAScenarioClassifier _isInsideAnySafeLocation](self, "_isInsideAnySafeLocation")
              || !-[SAScenarioClassifier _hasAllSafeLocationStatesKnown](self, "_hasAllSafeLocationStatesKnown"))
            {
              goto LABEL_20;
            }
LABEL_13:
            v17 = self;
            v18 = 3;
            break;
          case 2uLL:
            if (a3 != 1)
              goto LABEL_20;
            v19 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
            {
              v21 = 68289283;
              v22 = 0;
              v23 = 2082;
              v24 = "";
              v25 = 2113;
              v26 = v9;
              _os_log_impl(&dword_1CA04F000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier forSafeLocation in unsafe\", \"device\":\"%{private}@\"}", (uint8_t *)&v21, 0x1Cu);
            }
LABEL_18:
            v17 = self;
            v18 = 1;
            break;
          case 3uLL:
            if (a3 == 1)
              goto LABEL_18;
            goto LABEL_20;
          case 4uLL:
            v20 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
            {
              v21 = 68289283;
              v22 = 0;
              v23 = 2082;
              v24 = "";
              v25 = 2113;
              v26 = v9;
              _os_log_impl(&dword_1CA04F000, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAScenarioClassifier forSafeLocation not supported\", \"device\":\"%{private}@\"}", (uint8_t *)&v21, 0x1Cu);
            }
            goto LABEL_20;
          default:
            goto LABEL_20;
        }
        -[SAScenarioClassifier _setNewScenarioClass:](v17, "_setNewScenarioClass:", v18);
      }
    }
  }
LABEL_20:

}

- (void)addClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAScenarioClassifier clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAScenarioClassifier clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)ingestTAEvent:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  SAScenarioClassifier *v8;
  uint64_t v9;
  id v10;
  double v11;
  CLLocationDegrees v12;
  CLLocationDegrees v13;
  CLLocationCoordinate2D v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  CLLocationDegrees v25;
  CLLocationDegrees v26;
  CLLocationCoordinate2D v27;
  void *v28;
  int v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  NSObject *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "eventType");
    if (!v6)
    {
      objc_msgSend(v5, "safeLocation");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[SAScenarioClassifier _addSafeLocation:](self, "_addSafeLocation:", v7);
      goto LABEL_29;
    }
    if (v6 == 1)
    {
      objc_msgSend(v5, "safeLocation");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[SAScenarioClassifier _removeSafeLocation:](self, "_removeSafeLocation:", v7);
      if (-[SAScenarioClassifier _isInsideAnySafeLocation](self, "_isInsideAnySafeLocation"))
      {
        v8 = self;
        v9 = 1;
LABEL_6:
        -[SAScenarioClassifier _setNewScenarioClass:](v8, "_setNewScenarioClass:", v9);
LABEL_29:

LABEL_40:
        goto LABEL_41;
      }
      if (-[SAScenarioClassifier scenarioClassification](self, "scenarioClassification") != 1)
        goto LABEL_29;
      objc_msgSend(v7, "latitude");
      v25 = v24;
      objc_msgSend(v7, "longitude");
      v27 = CLLocationCoordinate2DMake(v25, v26);
      -[SAScenarioClassifier currentVisit](self, "currentVisit");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "containsCoordinate:", v27.latitude, v27.longitude);

      if (!v29)
      {
        v8 = self;
        v9 = 3;
        goto LABEL_6;
      }
      -[SAScenarioClassifier _setNewScenarioClass:](self, "_setNewScenarioClass:", 2);
      -[SAScenarioClassifier currentVisit](self, "currentVisit");
      v30 = objc_claimAutoreleasedReturnValue();
      -[SAScenarioClassifier _addUnsafeLocation:](self, "_addUnsafeLocation:", v30);
LABEL_28:

      goto LABEL_29;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    if (objc_msgSend(v7, "hasArrivalDate") && (objc_msgSend(v7, "hasDepartureDate") & 1) == 0)
    {
      v31 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "UUIDString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("unsafe_%@"), v33);

      v35 = objc_alloc(MEMORY[0x1E0C9E368]);
      objc_msgSend(v7, "coordinate");
      v5 = (id)objc_msgSend(v35, "initWithCenter:radius:identifier:", v34);
      -[SAScenarioClassifier setCurrentVisit:](self, "setCurrentVisit:", v5);

    }
    else
    {
      v5 = 0;
    }
    if (-[SAScenarioClassifier scenarioClassification](self, "scenarioClassification") == 1)
    {
      v36 = (void *)TASALog;
      if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v30 = v36;
      -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
      v37 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68289283;
      v43 = 0;
      v44 = 2082;
      v45 = "";
      v46 = 2113;
      v47 = v37;
      _os_log_impl(&dword_1CA04F000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier visit while in safe\", \"device\":\"%{private}@\"}", buf, 0x1Cu);

      goto LABEL_28;
    }
    if (-[SAScenarioClassifier scenarioClassification](self, "scenarioClassification") != 2)
      goto LABEL_38;
    v38 = (void *)TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    v20 = v38;
    -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
    v39 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289283;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    v46 = 2113;
    v47 = v39;
    _os_log_impl(&dword_1CA04F000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier visit while in unsafe\", \"device\":\"%{private}@\"}", buf, 0x1Cu);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_41;
    v10 = v4;
    objc_msgSend(v10, "latitude");
    v12 = v11;
    objc_msgSend(v10, "longitude");
    v14 = CLLocationCoordinate2DMake(v12, v13);
    objc_msgSend(v10, "horizontalAccuracy");
    if (v15 >= 100.0)
      v16 = v15;
    else
      v16 = 100.0;
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithFormat:", CFSTR("unsafe_%@"), v19);

    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E368]), "initWithCenter:radius:identifier:", v20, v14.latitude, v14.longitude, v16);
    objc_msgSend(v5, "setGeoReferenceFrame:", objc_msgSend(v10, "referenceFrame"));
    -[SAScenarioClassifier setCurrentVisit:](self, "setCurrentVisit:", v5);
    if (-[SAScenarioClassifier scenarioClassification](self, "scenarioClassification") == 1)
    {
      v21 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
        v23 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68289283;
        v43 = 0;
        v44 = 2082;
        v45 = "";
        v46 = 2113;
        v47 = v23;
        _os_log_impl(&dword_1CA04F000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier LOI while in safe\", \"device\":\"%{private}@\"}", buf, 0x1Cu);

      }
      goto LABEL_40;
    }
    if (-[SAScenarioClassifier scenarioClassification](self, "scenarioClassification") != 2)
      goto LABEL_37;
    v40 = (void *)TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v39 = v40;
    -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
    v41 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289283;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    v46 = 2113;
    v47 = v41;
    _os_log_impl(&dword_1CA04F000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier LOI while in unsafe\", \"device\":\"%{private}@\"}", buf, 0x1Cu);

  }
LABEL_37:

LABEL_38:
  if (v5)
  {
    -[SAScenarioClassifier _addUnsafeLocation:](self, "_addUnsafeLocation:", v5);
    goto LABEL_40;
  }
LABEL_41:

}

- (void)_addUnsafeLocation:(id)a3
{
  CLRegion *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CLRegion *currentUnsafeLocation;
  CLRegion *v16;
  CLRegion *v17;
  void *v18;
  void *v19;
  _DWORD v20[2];
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (CLRegion *)a3;
  -[SAScenarioClassifier currentUnsafeLocation](self, "currentUnsafeLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAScenarioClassifier currentUnsafeLocation](self, "currentUnsafeLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLRegion identifier](v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = 68289795;
      v20[1] = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2113;
      v24 = v8;
      v25 = 2113;
      v26 = v10;
      v27 = 2113;
      v28 = v11;
      _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAScenarioClassifier addUnsafeLocation replacing already existing unsafe\", \"device\":\"%{private}@\", \"old\":\"%{private}@\", \"new\":\"%{private}@\"}", (uint8_t *)v20, 0x30u);

    }
    -[SAScenarioClassifier delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAScenarioClassifier currentUnsafeLocation](self, "currentUnsafeLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopMonitorUnsafeLocationExit:forDevice:", v13, v14);

    currentUnsafeLocation = self->_currentUnsafeLocation;
    self->_currentUnsafeLocation = 0;

  }
  v16 = self->_currentUnsafeLocation;
  self->_currentUnsafeLocation = v4;
  v17 = v4;

  -[SAScenarioClassifier delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startMonitorUnsafeLocationExit:forDevice:", v17, v19);

}

- (void)_removeUnsafeLocation:(id)a3
{
  CLRegion *currentUnsafeLocation;
  id v5;
  void *v6;
  id v7;

  currentUnsafeLocation = self->_currentUnsafeLocation;
  self->_currentUnsafeLocation = 0;
  v5 = a3;

  -[SAScenarioClassifier delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopMonitorUnsafeLocationExit:forDevice:", v5, v6);

}

- (id)_findSafeLocationWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SAScenarioClassifier safeLocations](self, "safeLocations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_addSafeLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAScenarioClassifier _findSafeLocationWithUUID:](self, "_findSafeLocationWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = 68289539;
      v15[1] = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = v9;
      v20 = 2113;
      v21 = v10;
      _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier addSafeLocation replacing\", \"device\":\"%{private}@\", \"location\":\"%{private}@\"}", (uint8_t *)v15, 0x26u);

    }
    -[SAScenarioClassifier _removeSafeLocation:](self, "_removeSafeLocation:", v6);
  }
  -[SAScenarioClassifier safeLocations](self, "safeLocations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v4);

  -[SAScenarioClassifier statesBySafeLocation](self, "statesBySafeLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E83DB200, v4);

  -[SAScenarioClassifier delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startMonitorSafeLocation:forDevice:", v4, v14);

}

- (void)_removeSafeLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAScenarioClassifier _findSafeLocationWithUUID:](self, "_findSafeLocationWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SAScenarioClassifier delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopMonitorSafeLocation:forDevice:", v6, v8);

    -[SAScenarioClassifier statesBySafeLocation](self, "statesBySafeLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v6);

    -[SAScenarioClassifier safeLocations](self, "safeLocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v6);

  }
  else
  {
    v11 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      -[SAScenarioClassifier deviceUuid](self, "deviceUuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = 68289539;
      v15[1] = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = v13;
      v20 = 2113;
      v21 = v14;
      _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAScenarioClassifier removeSafeLocation not in set\", \"device\":\"%{private}@\", \"location\":\"%{private}@\"}", (uint8_t *)v15, 0x26u);

    }
  }

}

- (id)getCurrentTime
{
  void *v3;
  void *v4;
  void *v5;

  -[SAScenarioClassifier timeDelegate](self, "timeDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SAScenarioClassifier timeDelegate](self, "timeDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getCurrentTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (CLRegion)currentUnsafeLocation
{
  return self->_currentUnsafeLocation;
}

- (void)setCurrentUnsafeLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CLRegion)lastUnsafeLocation
{
  return self->_lastUnsafeLocation;
}

- (void)setLastUnsafeLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)deviceUuid
{
  return self->_deviceUuid;
}

- (void)setDeviceUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)scenarioClassification
{
  return self->_scenarioClassification;
}

- (void)setScenarioClassification:(unint64_t)a3
{
  self->_scenarioClassification = a3;
}

- (NSDate)scenarioChangeDate
{
  return self->_scenarioChangeDate;
}

- (SAFenceManagerRequestProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (SATimeServiceProtocol)timeDelegate
{
  return self->_timeDelegate;
}

- (void)setTimeDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_timeDelegate, a3);
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSMutableSet)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
  objc_storeStrong((id *)&self->_safeLocations, a3);
}

- (NSMutableDictionary)statesBySafeLocation
{
  return self->_statesBySafeLocation;
}

- (void)setStatesBySafeLocation:(id)a3
{
  objc_storeStrong((id *)&self->_statesBySafeLocation, a3);
}

- (CLCircularRegion)currentVisit
{
  return self->_currentVisit;
}

- (void)setCurrentVisit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVisit, 0);
  objc_storeStrong((id *)&self->_statesBySafeLocation, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_timeDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_scenarioChangeDate, 0);
  objc_storeStrong((id *)&self->_deviceUuid, 0);
  objc_storeStrong((id *)&self->_lastUnsafeLocation, 0);
  objc_storeStrong((id *)&self->_currentUnsafeLocation, 0);
}

@end
