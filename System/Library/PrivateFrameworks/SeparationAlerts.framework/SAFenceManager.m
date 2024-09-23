@implementation SAFenceManager

- (void)ingestTAEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v7;
    v5 = objc_msgSend(v4, "eventType");
    objc_msgSend(v4, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SAFenceManager handleFenceEvent:forRegion:](self, "handleFenceEvent:forRegion:", v5, v6);
  }

}

- (SAFenceManager)init
{
  SAFenceManager *v2;
  uint64_t v3;
  NSHashTable *clients;
  NSMutableDictionary *v5;
  NSMutableDictionary *deviceUUIDsByUnsafeRegionIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *deviceUUIDsBySafeLocation;
  NSMutableDictionary *v9;
  NSMutableDictionary *safeLocationsByRegionIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *statesByRegionIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *regionsByRegionIdentifier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SAFenceManager;
  v2 = -[SAFenceManager init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceUUIDsByUnsafeRegionIdentifier = v2->_deviceUUIDsByUnsafeRegionIdentifier;
    v2->_deviceUUIDsByUnsafeRegionIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceUUIDsBySafeLocation = v2->_deviceUUIDsBySafeLocation;
    v2->_deviceUUIDsBySafeLocation = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    safeLocationsByRegionIdentifier = v2->_safeLocationsByRegionIdentifier;
    v2->_safeLocationsByRegionIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    statesByRegionIdentifier = v2->_statesByRegionIdentifier;
    v2->_statesByRegionIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    regionsByRegionIdentifier = v2->_regionsByRegionIdentifier;
    v2->_regionsByRegionIdentifier = v13;

  }
  return v2;
}

- (unint64_t)getSafeLocationCount
{
  void *v2;
  unint64_t v3;

  -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)getUnsafeLocationCount
{
  void *v2;
  unint64_t v3;

  -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)getRegionForSafeLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SAFenceManager safeLocationsByRegionIdentifier](self, "safeLocationsByRegionIdentifier", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        -[SAFenceManager safeLocationsByRegionIdentifier](self, "safeLocationsByRegionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          -[SAFenceManager regionsByRegionIdentifier](self, "regionsByRegionIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v7)
        continue;
      break;
    }
  }

  v14 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289026;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    _os_log_impl(&dword_1CA04F000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Could not find region for safe location\"}", buf, 0x12u);
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)startMonitorSafeLocation:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v59;
  void *v60;
  SAFenceManager *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t buf;
  __int16 v75;
  const char *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v60 = 0;
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "latitude");
    v16 = v15;
    objc_msgSend(v6, "longitude");
    v18 = v17;
    objc_msgSend(v6, "radius");
    if (v19 >= 100.0)
      v20 = v19;
    else
      v20 = 100.0;
    v59 = (void *)v14;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E368]), "initForLowPowerWithCenter:radius:identifier:", v14, v16, v18, v20);
    objc_msgSend(v21, "setGeoReferenceFrame:", objc_msgSend(v6, "referenceFrame"));
    v22 = v21;
    v63 = v7;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v7, 0);
    -[SAFenceManager regionsByRegionIdentifier](self, "regionsByRegionIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v22, v25);

    -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v23, v6);

    -[SAFenceManager safeLocationsByRegionIdentifier](self, "safeLocationsByRegionIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v6;
    objc_msgSend(v27, "setObject:forKey:", v6, v28);

    -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", &unk_1E83DB158, v31);

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[SAFenceManager clients](self, "clients");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v65;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v65 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v36);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v37, "addGeofence:", v22);
          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v34);
    }

    v6 = v29;
    goto LABEL_33;
  }
  -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "containsObject:", v7))
  {
    v59 = v11;
    v60 = v9;
    -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", v6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v7;
    objc_msgSend(v39, "addObject:", v7);

    -[SAFenceManager getRegionForSafeLocation:](self, "getRegionForSafeLocation:", v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKey:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKey:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqual:", &unk_1E83DB158);

      if ((v47 & 1) == 0)
      {
        v61 = self;
        v62 = v6;
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        -[SAFenceManager clients](self, "clients");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v69;
          do
          {
            v52 = 0;
            do
            {
              if (*(_QWORD *)v69 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v52);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[SAFenceManager statesByRegionIdentifier](v61, "statesByRegionIdentifier");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "identifier");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "objectForKey:", v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "didDetermineState:forSafeLocation:forDevice:", objc_msgSend(v56, "unsignedIntegerValue"), v62, v63);

              }
              ++v52;
            }
            while (v50 != v52);
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
          }
          while (v50);
        }

        v6 = v62;
      }
    }
    else
    {
      v57 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        buf = 68289026;
        v75 = 2082;
        v76 = "";
        _os_log_impl(&dword_1CA04F000, v57, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Safe location state should have been set to unknown at least\"}", (uint8_t *)&buf, 0x12u);
      }
    }

LABEL_33:
    v7 = v63;
    v11 = v59;
    v9 = v60;
    goto LABEL_34;
  }
  v12 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    buf = 68289026;
    v75 = 2082;
    v76 = "";
    _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Safe location already used for this device\"}", (uint8_t *)&buf, 0x12u);
  }
LABEL_34:

  return v9 == 0;
}

- (BOOL)stopMonitorSafeLocation:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t buf;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v30 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      buf = 68289026;
      v39 = 2082;
      v40 = "";
      _os_log_impl(&dword_1CA04F000, v30, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Can't remove a non-existent safe location\"}", (uint8_t *)&buf, 0x12u);
    }
    goto LABEL_15;
  }
  -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v7);

  -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
LABEL_15:
    v29 = 0;
    goto LABEL_16;
  }
  v32 = v7;
  -[SAFenceManager getRegionForSafeLocation:](self, "getRegionForSafeLocation:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", v17);

  -[SAFenceManager safeLocationsByRegionIdentifier](self, "safeLocationsByRegionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v19);

  -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", v6);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[SAFenceManager clients](self, "clients");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v26, "removeGeofence:", v15);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v23);
  }

  -[SAFenceManager regionsByRegionIdentifier](self, "regionsByRegionIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeObjectForKey:", v28);

  v29 = 1;
  v7 = v32;
LABEL_16:

  return v29;
}

- (BOOL)startMonitorUnsafeLocationExit:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  SAFenceManager *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  id v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t buf;
  __int16 v65;
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
  if (!objc_msgSend(v10, "containsObject:", v7))
    goto LABEL_6;
  v11 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    buf = 68289026;
    v65 = 2082;
    v66 = "";
    _os_log_impl(&dword_1CA04F000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Unsafe location already used for this device\"}", (uint8_t *)&buf, 0x12u);
  }
  -[SAFenceManager stopMonitorUnsafeLocationExit:forDevice:](self, "stopMonitorUnsafeLocationExit:forDevice:", v6, v7);
  -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v14;
  if (v14)
  {
LABEL_6:
    -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v7);

    -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v51 = v10;
      -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqual:", &unk_1E83DB158);

      if ((v24 & 1) != 0)
      {
        v25 = 0;
        v10 = v51;
      }
      else
      {
        v52 = v7;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        -[SAFenceManager clients](self, "clients");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v59 != v43)
                objc_enumerationMutation(obj);
              v45 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
                v46 = self;
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "identifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "objectForKey:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "didDetermineState:forUnsafeLocation:forDevice:", objc_msgSend(v49, "unsignedIntegerValue"), v6, v52);

                self = v46;
              }
            }
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
          }
          while (v42);
        }

        v25 = 0;
        v10 = v51;
        v7 = v52;
      }
    }
    else
    {
      v40 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        buf = 68289026;
        v65 = 2082;
        v66 = "";
        _os_log_impl(&dword_1CA04F000, v40, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Unsafe location state should have been set to unknown at least\"}", (uint8_t *)&buf, 0x12u);
      }
      v25 = 0;
    }
  }
  else
  {
LABEL_9:
    v26 = v7;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v7, 0);
    -[SAFenceManager regionsByRegionIdentifier](self, "regionsByRegionIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", v6, v29);

    -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v27, v31);

    -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", &unk_1E83DB158, v33);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[SAFenceManager clients](self, "clients");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v55 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v39, "addGeofence:", v6);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v36);
    }

    v10 = 0;
    v25 = 1;
    v7 = v26;
  }

  return v25;
}

- (BOOL)stopMonitorUnsafeLocationExit:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t buf;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v31 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      buf = 68289026;
      v39 = 2082;
      v40 = "";
      _os_log_impl(&dword_1CA04F000, v31, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Can't remove a non-existent unsafe location\"}", (uint8_t *)&buf, 0x12u);
    }
    goto LABEL_15;
  }
  -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObject:", v7);

  -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
LABEL_15:
    v30 = 0;
    goto LABEL_16;
  }
  -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v19);

  -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", v21);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[SAFenceManager clients](self, "clients", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v27, "removeGeofence:", v6);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v24);
  }

  -[SAFenceManager regionsByRegionIdentifier](self, "regionsByRegionIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeObjectForKey:", v29);

  v30 = 1;
LABEL_16:

  return v30;
}

- (void)removeLocationsForDeviceUuid:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v9);
        -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v4);

        if (v13)
        {
          -[SAFenceManager regionsByRegionIdentifier](self, "regionsByRegionIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v15);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v7);
  }

  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v46;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v46 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v20);
        -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsObject:", v4);

        if (v24)
          objc_msgSend(v35, "addObject:", v21);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v18);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v36;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        -[SAFenceManager stopMonitorUnsafeLocationExit:forDevice:](self, "stopMonitorUnsafeLocationExit:forDevice:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v29++), v4);
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v27);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = v35;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v38;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(v30);
        -[SAFenceManager stopMonitorSafeLocation:forDevice:](self, "stopMonitorSafeLocation:forDevice:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v34++), v4);
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v32);
  }

}

- (void)handleFenceEvent:(unint64_t)a3 forRegion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  SAFenceManager *v21;
  uint64_t v22;
  void *v23;
  SAFenceManager *v24;
  uint64_t v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(a3)
  {
    case 0uLL:
    case 5uLL:
      -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v9, "setObject:forKey:", &unk_1E83DB158, v10);
      goto LABEL_3;
    case 1uLL:
    case 4uLL:
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("unsafe_")))
      {
        -[NSMutableDictionary objectForKey:](self->_deviceUUIDsByUnsafeRegionIdentifier, "objectForKey:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("unsafe_"), "length"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);

          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v14, 0);
          -[SAFenceManager regionsByRegionIdentifier](self, "regionsByRegionIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v6, v17);

          -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v15, v19);

          v20 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289283;
            v27 = 0;
            v28 = 2082;
            v29 = "";
            v30 = 2113;
            v31 = v14;
            _os_log_impl(&dword_1CA04F000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #fencemgr handleFenceEvent for unsafe location not in dictionary\", \"deviceUUID\":\"%{private}@\"}", buf, 0x1Cu);
          }

        }
      }
      switch(a3)
      {
        case 1uLL:
        case 3uLL:
          goto LABEL_10;
        case 2uLL:
        case 4uLL:
          goto LABEL_12;
        default:
          goto LABEL_20;
      }
      goto LABEL_20;
    case 2uLL:
LABEL_12:
      if (-[SAFenceManager isSafeLocation:](self, "isSafeLocation:", v6))
      {
        v21 = self;
        v22 = 2;
        goto LABEL_14;
      }
      v24 = self;
      v25 = 2;
      goto LABEL_19;
    case 3uLL:
LABEL_10:
      if (-[SAFenceManager isSafeLocation:](self, "isSafeLocation:", v6))
      {
        v21 = self;
        v22 = 1;
LABEL_14:
        -[SAFenceManager notifyState:forSafeLocationRegion:](v21, "notifyState:forSafeLocationRegion:", v22, v6);
      }
      else
      {
        v24 = self;
        v25 = 1;
LABEL_19:
        -[SAFenceManager notifyState:forUnsafeLocationRegion:](v24, "notifyState:forUnsafeLocationRegion:", v25, v6);
      }
LABEL_20:

      return;
    case 6uLL:
      v23 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        v9 = v23;
        objc_msgSend(v6, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68289283;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 2113;
        v31 = v10;
        _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, region monitoring error\", \"regionUUID\":\"%{private}@\"}", buf, 0x1Cu);
LABEL_3:

      }
      goto LABEL_20;
    default:
      goto LABEL_20;
  }
}

- (BOOL)isSafeLocation:(id)a3
{
  id v3;
  id v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v4, "isLowPower");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)notifyState:(unint64_t)a3 forSafeLocationRegion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id obj;
  uint64_t v31;
  SAFenceManager *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t buf;
  __int16 v46;
  const char *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v9);

  -[SAFenceManager safeLocationsByRegionIdentifier](self, "safeLocationsByRegionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    objc_msgSend(v6, "identifier");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    -[SAFenceManager clients](self, "clients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    v46 = 2082;
    v47 = "";
    v19 = "Yes";
    buf = 68289795;
    if (!v12)
      v19 = "No";
    v48 = 2081;
    v49 = v16;
    v50 = 2049;
    v51 = v18;
    v52 = 2081;
    v53 = v19;
    _os_log_impl(&dword_1CA04F000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #fencemgr, notify state for safe\", \"regionUUID\":\"%{private}s\", \"Clients\":%{private}ld, \"Found\":\"%{private}s\"}", (uint8_t *)&buf, 0x30u);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[SAFenceManager clients](self, "clients", v6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v40;
    v32 = self;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v34 = v20;
        v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v20);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        -[SAFenceManager deviceUUIDsBySafeLocation](self, "deviceUUIDsBySafeLocation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v36;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v36 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v27);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v21, "didDetermineState:forSafeLocation:forDevice:", a3, v12, v28);
              ++v27;
            }
            while (v25 != v27);
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v25);
        }

        v20 = v34 + 1;
        self = v32;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v33);
  }

}

- (void)notifyState:(unint64_t)a3 forUnsafeLocationRegion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  SAFenceManager *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t buf;
  __int16 v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SAFenceManager statesByRegionIdentifier](self, "statesByRegionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v9);

  v10 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v6, "identifier");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "UTF8String");
    -[SAFenceManager clients](self, "clients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 68289539;
    v41 = 2082;
    v42 = "";
    v43 = 2081;
    v44 = v13;
    v45 = 2049;
    v46 = objc_msgSend(v14, "count");
    _os_log_impl(&dword_1CA04F000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #fencemgr, notify state for unsafe\", \"regionUUID\":\"%{private}s\", \"Clients\":%{private}ld}", (uint8_t *)&buf, 0x26u);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[SAFenceManager clients](self, "clients");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v35;
    v27 = self;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        v29 = v15;
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        -[SAFenceManager deviceUUIDsByUnsafeRegionIdentifier](self, "deviceUUIDsByUnsafeRegionIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v31;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v31 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v16, "didDetermineState:forUnsafeLocation:forDevice:", a3, v6, v24);
              ++v23;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v21);
        }

        v15 = v29 + 1;
        self = v27;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v28);
  }

}

- (void)addClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAFenceManager clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAFenceManager clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSMutableDictionary)deviceUUIDsByUnsafeRegionIdentifier
{
  return self->_deviceUUIDsByUnsafeRegionIdentifier;
}

- (void)setDeviceUUIDsByUnsafeRegionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUIDsByUnsafeRegionIdentifier, a3);
}

- (NSMutableDictionary)deviceUUIDsBySafeLocation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceUUIDsBySafeLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)safeLocationsByRegionIdentifier
{
  return self->_safeLocationsByRegionIdentifier;
}

- (void)setSafeLocationsByRegionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_safeLocationsByRegionIdentifier, a3);
}

- (NSMutableDictionary)statesByRegionIdentifier
{
  return self->_statesByRegionIdentifier;
}

- (void)setStatesByRegionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_statesByRegionIdentifier, a3);
}

- (NSMutableDictionary)regionsByRegionIdentifier
{
  return self->_regionsByRegionIdentifier;
}

- (void)setRegionsByRegionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_regionsByRegionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionsByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_statesByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_safeLocationsByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUUIDsBySafeLocation, 0);
  objc_storeStrong((id *)&self->_deviceUUIDsByUnsafeRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
