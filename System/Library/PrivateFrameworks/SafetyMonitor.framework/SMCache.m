@implementation SMCache

- (SMCache)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SMCache *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[SMCache initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:](self, "initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:", v3, v4, v5, 0, 0, 0, 0, 0, 0, 0, v6);

  return v7;
}

- (SMCache)initWithIdentifier:(id)a3 deviceStatus:(id)a4 locationsDuringSession:(id)a5 unlockLocation:(id)a6 lockLocation:(id)a7 mostRecentLocation:(id)a8 startingLocation:(id)a9 offWristLocation:(id)a10 parkedCarLocation:(id)a11 destinationMapItem:(id)a12 workoutEvents:(id)a13
{
  id v18;
  SMCache *v19;
  SMCache *v20;
  GEOLocationShifter *v21;
  GEOLocationShifter *shifter;
  SMCache *v23;
  SMCache *v24;
  NSObject *v25;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;
  uint8_t buf[16];

  v18 = a3;
  v39 = a4;
  v28 = a5;
  v38 = a5;
  v37 = a6;
  v36 = a7;
  v35 = a8;
  v34 = a9;
  v33 = a10;
  v32 = a11;
  v31 = a12;
  v30 = a13;
  if (v18)
  {
    v40.receiver = self;
    v40.super_class = (Class)SMCache;
    v19 = -[SMCache init](&v40, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      objc_storeStrong((id *)&v20->_deviceStatus, a4);
      objc_storeStrong((id *)&v20->_locationsDuringSession, v28);
      objc_storeStrong((id *)&v20->_unlockLocation, a6);
      objc_storeStrong((id *)&v20->_lockLocation, a7);
      objc_storeStrong((id *)&v20->_mostRecentLocation, a8);
      objc_storeStrong((id *)&v20->_startingLocation, a9);
      objc_storeStrong((id *)&v20->_offWristLocation, a10);
      objc_storeStrong((id *)&v20->_parkedCarLocation, a11);
      objc_storeStrong((id *)&v20->_destinationMapItem, a12);
      objc_storeStrong((id *)&v20->_workoutEvents, a13);
      v21 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x24BE3CC28]);
      shifter = v20->_shifter;
      v20->_shifter = v21;

    }
    v23 = v20;
    v24 = v23;
  }
  else
  {
    v23 = self;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v24 = 0;
  }

  return v24;
}

- (SMCache)initWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  SMLocation *v12;
  SMLocation *v13;
  void *v14;
  SMLocation *v15;
  void *v16;
  SMLocation *v17;
  void *v18;
  SMDeviceStatus *v19;
  void *v20;
  SMLocation *v21;
  void *v22;
  SMLocation *v23;
  void *v24;
  SMLocation *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  SMWorkoutEvent *v36;
  SMLocation *v38;
  SMLocation *v39;
  SMLocation *v40;
  SMDeviceStatus *v41;
  SMLocation *v42;
  SMLocation *v43;
  SMLocation *v44;
  SMCache *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  v6 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v3, "valueForKey:", CFSTR("locationsDuringSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v7);
        v12 = -[SMLocation initWithDictionary:]([SMLocation alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v9);
  }

  v13 = [SMLocation alloc];
  objc_msgSend(v3, "valueForKey:", CFSTR("unlockLocation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[SMLocation initWithDictionary:](v13, "initWithDictionary:", v14);

  v15 = [SMLocation alloc];
  objc_msgSend(v3, "valueForKey:", CFSTR("lockLocation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[SMLocation initWithDictionary:](v15, "initWithDictionary:", v16);

  v17 = [SMLocation alloc];
  objc_msgSend(v3, "valueForKey:", CFSTR("mostRecentLocation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[SMLocation initWithDictionary:](v17, "initWithDictionary:", v18);

  v19 = [SMDeviceStatus alloc];
  objc_msgSend(v3, "valueForKey:", CFSTR("deviceStatus"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[SMDeviceStatus initWithDictionary:](v19, "initWithDictionary:", v20);

  v21 = [SMLocation alloc];
  objc_msgSend(v3, "valueForKey:", CFSTR("startingLocation"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[SMLocation initWithDictionary:](v21, "initWithDictionary:", v22);

  v23 = [SMLocation alloc];
  objc_msgSend(v3, "valueForKey:", CFSTR("offWristLocation"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[SMLocation initWithDictionary:](v23, "initWithDictionary:", v24);

  v25 = [SMLocation alloc];
  objc_msgSend(v3, "valueForKey:", CFSTR("parkedCar"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[SMLocation initWithDictionary:](v25, "initWithDictionary:", v26);

  objc_msgSend(v3, "valueForKey:", CFSTR("destinationMapItem"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v3, "valueForKey:", CFSTR("destinationMapItem"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v28, "initWithBase64EncodedString:options:", v29, 0);

  }
  v30 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v3, "valueForKey:", CFSTR("workoutEvents"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v49 != v34)
          objc_enumerationMutation(v31);
        v36 = -[SMWorkoutEvent initWithDictionary:]([SMWorkoutEvent alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
        objc_msgSend(v30, "addObject:", v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v33);
  }

  v46 = -[SMCache initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:](self, "initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:", v47, v41, v6, v44, v43, v42, v40, v39, v38, v27, v30);
  return v46;
}

- (id)outputToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
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
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SMCache identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  v6 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[SMCache locationsDuringSession](self, "locationsDuringSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v11), "outputToDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("locationsDuringSession"));
  -[SMCache unlockLocation](self, "unlockLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SMCache unlockLocation](self, "unlockLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outputToDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("unlockLocation"));

  }
  -[SMCache lockLocation](self, "lockLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SMCache lockLocation](self, "lockLocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "outputToDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("lockLocation"));

  }
  -[SMCache mostRecentLocation](self, "mostRecentLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SMCache mostRecentLocation](self, "mostRecentLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "outputToDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("mostRecentLocation"));

  }
  -[SMCache startingLocation](self, "startingLocation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[SMCache startingLocation](self, "startingLocation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "outputToDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("startingLocation"));

  }
  -[SMCache offWristLocation](self, "offWristLocation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[SMCache offWristLocation](self, "offWristLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "outputToDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("offWristLocation"));

  }
  -[SMCache parkedCarLocation](self, "parkedCarLocation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SMCache parkedCarLocation](self, "parkedCarLocation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "outputToDictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("parkedCar"));

  }
  -[SMCache destinationMapItem](self, "destinationMapItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[SMCache destinationMapItem](self, "destinationMapItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "base64EncodedStringWithOptions:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("destinationMapItem"));

  }
  -[SMCache deviceStatus](self, "deviceStatus");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[SMCache deviceStatus](self, "deviceStatus");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "outputToDictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("deviceStatus"));

  }
  v37 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[SMCache workoutEvents](self, "workoutEvents", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v46;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v46 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v42), "outputToDictionary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v43);

        ++v42;
      }
      while (v40 != v42);
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v40);
  }

  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("workoutEvents"));
  return v3;
}

- (unint64_t)identifierHash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
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
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[SMCache identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[SMCache locationsDuringSession](self, "locationsDuringSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4 ^= objc_msgSend(v10, "hash");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v7);
  }

  -[SMCache unlockLocation](self, "unlockLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SMCache unlockLocation](self, "unlockLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 ^= objc_msgSend(v13, "hash");

  }
  -[SMCache lockLocation](self, "lockLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SMCache lockLocation](self, "lockLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4 ^= objc_msgSend(v16, "hash");

  }
  -[SMCache mostRecentLocation](self, "mostRecentLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[SMCache mostRecentLocation](self, "mostRecentLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v4 ^= objc_msgSend(v19, "hash");

  }
  -[SMCache deviceStatus](self, "deviceStatus");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash") ^ v4;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SMCache workoutEvents](self, "workoutEvents", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v31;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27), "location");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v22 ^= objc_msgSend(v28, "hash");

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v25);
  }

  return v22;
}

- (void)logCacheForSessionID:(id)a3 role:(id)a4 deviceType:(id)a5 transaction:(id)a6 hashString:(id)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  NSObject *v47;
  void *v48;
  SMCache *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v53 = a3;
  v52 = a4;
  v51 = a5;
  v50 = a6;
  v12 = a7;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  v49 = self;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[SMCache identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCache locationsDuringSession](self, "locationsDuringSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    -[SMCache destinationMapItem](v49, "destinationMapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCache deviceStatus](v49, "deviceStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCache workoutEvents](v49, "workoutEvents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414594;
    v65 = v52;
    v66 = 2112;
    v67 = v53;
    v68 = 2112;
    v69 = v50;
    v70 = 2112;
    v71 = v51;
    v72 = 2112;
    v73 = v12;
    v74 = 2112;
    v75 = v14;
    v76 = 2048;
    v77 = v16;
    v78 = 2112;
    v79 = v17;
    v80 = 2112;
    v81 = v18;
    v82 = 2048;
    v83 = objc_msgSend(v19, "count");
    _os_log_impl(&dword_245521000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,hash,%@,identifier,%@,locationsDuringSessionCount,%lu,destinationMapItem,%@,deviceStatus,%@,workoutEventsCount,%lu", buf, 0x66u);

    self = v49;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    -[SMCache mostRecentLocation](self, "mostRecentLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v65 = v52;
    v66 = 2112;
    v67 = v53;
    v68 = 2112;
    v69 = v50;
    v70 = 2112;
    v71 = v51;
    v72 = 2112;
    v73 = v21;
    _os_log_impl(&dword_245521000, v20, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,mostRecentLocation,%@", buf, 0x34u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    -[SMCache startingLocation](self, "startingLocation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v65 = v52;
    v66 = 2112;
    v67 = v53;
    v68 = 2112;
    v69 = v50;
    v70 = 2112;
    v71 = v51;
    v72 = 2112;
    v73 = v23;
    _os_log_impl(&dword_245521000, v22, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,startingLocation,%@", buf, 0x34u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    -[SMCache unlockLocation](self, "unlockLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v65 = v52;
    v66 = 2112;
    v67 = v53;
    v68 = 2112;
    v69 = v50;
    v70 = 2112;
    v71 = v51;
    v72 = 2112;
    v73 = v25;
    _os_log_impl(&dword_245521000, v24, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,unlockLocation,%@", buf, 0x34u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    -[SMCache lockLocation](self, "lockLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v65 = v52;
    v66 = 2112;
    v67 = v53;
    v68 = 2112;
    v69 = v50;
    v70 = 2112;
    v71 = v51;
    v72 = 2112;
    v73 = v27;
    _os_log_impl(&dword_245521000, v26, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,lockLocation,%@", buf, 0x34u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    -[SMCache parkedCarLocation](self, "parkedCarLocation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v65 = v52;
    v66 = 2112;
    v67 = v53;
    v68 = 2112;
    v69 = v50;
    v70 = 2112;
    v71 = v51;
    v72 = 2112;
    v73 = v29;
    _os_log_impl(&dword_245521000, v28, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,parkedCarLocation,%@", buf, 0x34u);

  }
  v48 = v12;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    -[SMCache offWristLocation](self, "offWristLocation", v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v65 = v52;
    v66 = 2112;
    v67 = v53;
    v68 = 2112;
    v69 = v50;
    v70 = 2112;
    v71 = v51;
    v72 = 2112;
    v73 = v31;
    _os_log_impl(&dword_245521000, v30, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,offWristLocation,%@", buf, 0x34u);

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[SMCache locationsDuringSession](self, "locationsDuringSession");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v59 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413570;
          v65 = v52;
          v66 = 2112;
          v67 = v53;
          v68 = 2112;
          v69 = v50;
          v70 = 2112;
          v71 = v51;
          v72 = 2048;
          v73 = (id)(v35 + i);
          v74 = 2112;
          v75 = v38;
          _os_log_impl(&dword_245521000, v39, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,locationsDuringSession,location,%lu,%@", buf, 0x3Eu);
        }

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      v35 += i;
    }
    while (v34);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[SMCache workoutEvents](v49, "workoutEvents");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v41)
  {
    v42 = v41;
    v43 = 0;
    v44 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(v40);
        v46 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413570;
          v65 = v52;
          v66 = 2112;
          v67 = v53;
          v68 = 2112;
          v69 = v50;
          v70 = 2112;
          v71 = v51;
          v72 = 2048;
          v73 = (id)(v43 + j);
          v74 = 2112;
          v75 = v46;
          _os_log_impl(&dword_245521000, v47, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,workoutEvents,workoutEvent,%lu,%@", buf, 0x3Eu);
        }

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      v43 += j;
    }
    while (v42);
  }

}

+ (void)logNoCacheDataForSessionID:(id)a3 role:(id)a4 deviceType:(id)a5 transaction:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 138413058;
    v15 = v10;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_245521000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,no cache data", (uint8_t *)&v14, 0x2Au);
  }

}

- (BOOL)shiftRequiredForLocation:(id)a3
{
  id v3;
  void *v4;
  char v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "referenceFrame") != 2)
  {
    objc_msgSend(v4, "latitude");
    v7 = v6;
    objc_msgSend(v4, "longitude");
    v5 = objc_msgSend(MEMORY[0x24BE3CC28], "isLocationShiftRequiredForCoordinate:", v7, v8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)shiftLocation:(id)a3 queue:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  GEOLocationShifter *shifter;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "latitude");
  v12 = v11;
  objc_msgSend(v8, "longitude");
  v14 = v13;
  v15 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__SMCache_shiftLocation_queue_withHandler___block_invoke;
  aBlock[3] = &unk_25166E300;
  v16 = v8;
  v26 = v16;
  v17 = v10;
  v27 = v17;
  v18 = _Block_copy(aBlock);
  if (-[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v16))
  {
    shifter = self->_shifter;
    objc_msgSend(v16, "hunc");
    v21 = v20;
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __43__SMCache_shiftLocation_queue_withHandler___block_invoke_43;
    v22[3] = &unk_25166E348;
    v24 = v17;
    v23 = v16;
    -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](shifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v18, &__block_literal_global_2, v22, v9, v12, v14, v21);

  }
  else
  {
    (*((void (**)(id, id))v17 + 2))(v17, v16);
  }

}

void __43__SMCache_shiftLocation_queue_withHandler___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  SMLocation *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  SMLocation *v15;

  v8 = [SMLocation alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "altitude");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "vunc");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SMLocation initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:](v8, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v9, v14, a2, a3, a4, v11, v13);

  -[SMLocation setReferenceFrame:](v15, "setReferenceFrame:", 2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __43__SMCache_shiftLocation_queue_withHandler___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_245521000, v0, OS_LOG_TYPE_INFO, "Had to go to network for shift", v1, 2u);
  }

}

void __43__SMCache_shiftLocation_queue_withHandler___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "Error shifting coordinate: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)shiftLocationsOnQueue:(id)a3 handler:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  NSObject *group;
  NSObject *queue;
  _QWORD block[5];
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  NSObject *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  NSObject *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  NSObject *v73;
  _QWORD v74[5];
  NSObject *v75;
  _QWORD v76[5];
  NSObject *v77;
  _QWORD v78[5];
  NSObject *v79;
  _QWORD v80[5];
  NSObject *v81;
  _QWORD v82[5];
  NSObject *v83;
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  queue = a3;
  v50 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SMCache identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v87 = v7;
    _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_DEFAULT, "shifting locations for cache %@", buf, 0xCu);

  }
  group = dispatch_group_create();
  dispatch_group_enter(group);
  -[SMCache unlockLocation](self, "unlockLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v8);

  if (v9)
  {
    dispatch_group_enter(group);
    -[SMCache unlockLocation](self, "unlockLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke;
    v82[3] = &unk_25166E370;
    v82[4] = self;
    v83 = group;
    -[SMCache shiftLocation:queue:withHandler:](self, "shiftLocation:queue:withHandler:", v10, queue, v82);

  }
  -[SMCache lockLocation](self, "lockLocation", v50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v11);

  if (v12)
  {
    dispatch_group_enter(group);
    -[SMCache lockLocation](self, "lockLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_46;
    v80[3] = &unk_25166E370;
    v80[4] = self;
    v81 = group;
    -[SMCache shiftLocation:queue:withHandler:](self, "shiftLocation:queue:withHandler:", v13, queue, v80);

  }
  -[SMCache mostRecentLocation](self, "mostRecentLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v14);

  if (v15)
  {
    dispatch_group_enter(group);
    -[SMCache mostRecentLocation](self, "mostRecentLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_47;
    v78[3] = &unk_25166E370;
    v78[4] = self;
    v79 = group;
    -[SMCache shiftLocation:queue:withHandler:](self, "shiftLocation:queue:withHandler:", v16, queue, v78);

  }
  -[SMCache startingLocation](self, "startingLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v17);

  if (v18)
  {
    dispatch_group_enter(group);
    -[SMCache startingLocation](self, "startingLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_48;
    v76[3] = &unk_25166E370;
    v76[4] = self;
    v77 = group;
    -[SMCache shiftLocation:queue:withHandler:](self, "shiftLocation:queue:withHandler:", v19, queue, v76);

  }
  -[SMCache offWristLocation](self, "offWristLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v20);

  if (v21)
  {
    dispatch_group_enter(group);
    -[SMCache offWristLocation](self, "offWristLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = MEMORY[0x24BDAC760];
    v74[1] = 3221225472;
    v74[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_49;
    v74[3] = &unk_25166E370;
    v74[4] = self;
    v75 = group;
    -[SMCache shiftLocation:queue:withHandler:](self, "shiftLocation:queue:withHandler:", v22, queue, v74);

  }
  -[SMCache parkedCarLocation](self, "parkedCarLocation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v23);

  if (v24)
  {
    dispatch_group_enter(group);
    -[SMCache parkedCarLocation](self, "parkedCarLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_50;
    v72[3] = &unk_25166E370;
    v72[4] = self;
    v73 = group;
    -[SMCache shiftLocation:queue:withHandler:](self, "shiftLocation:queue:withHandler:", v25, queue, v72);

  }
  v26 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[SMCache locationsDuringSession](self, "locationsDuringSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithCapacity:", objc_msgSend(v27, "count"));

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[SMCache locationsDuringSession](self, "locationsDuringSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v69 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        if (-[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v34))
        {
          dispatch_group_enter(group);
          v65[0] = MEMORY[0x24BDAC760];
          v65[1] = 3221225472;
          v65[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_51;
          v65[3] = &unk_25166E370;
          v66 = v28;
          v67 = group;
          -[SMCache shiftLocation:queue:withHandler:](self, "shiftLocation:queue:withHandler:", v34, queue, v65);

        }
        else
        {
          objc_msgSend(v28, "addObject:", v34);
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
    }
    while (v31);
  }

  v35 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[SMCache workoutEvents](self, "workoutEvents");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithCapacity:", objc_msgSend(v36, "count"));

  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  v61 = 0u;
  -[SMCache workoutEvents](self, "workoutEvents");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v84, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v62 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        objc_msgSend(v43, "location");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[SMCache shiftRequiredForLocation:](self, "shiftRequiredForLocation:", v44);

        if (v45)
        {
          dispatch_group_enter(group);
          objc_msgSend(v43, "location");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = MEMORY[0x24BDAC760];
          v58[1] = 3221225472;
          v58[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_52;
          v58[3] = &unk_25166E398;
          v58[4] = v43;
          v59 = v37;
          v60 = group;
          -[SMCache shiftLocation:queue:withHandler:](self, "shiftLocation:queue:withHandler:", v46, queue, v58);

        }
        else
        {
          objc_msgSend(v37, "addObject:", v43);
        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v84, 16);
    }
    while (v40);
  }

  dispatch_group_leave(group);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_53;
  block[3] = &unk_25166E3C0;
  block[4] = self;
  v55 = v28;
  v56 = v37;
  v57 = v51;
  v47 = v51;
  v48 = v37;
  v49 = v28;
  dispatch_group_notify(group, queue, block);

}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    v8 = 134283777;
    v9 = v6;
    v10 = 2049;
    v11 = v7;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "shifted unlockLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setUnlockLocation:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    v8 = 134283777;
    v9 = v6;
    v10 = 2049;
    v11 = v7;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "shifted lockLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setLockLocation:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    v8 = 134283777;
    v9 = v6;
    v10 = 2049;
    v11 = v7;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "shifted mostRecentLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setMostRecentLocation:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    v8 = 134283777;
    v9 = v6;
    v10 = 2049;
    v11 = v7;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "shifted startingLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setStartingLocation:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    v8 = 134283777;
    v9 = v6;
    v10 = 2049;
    v11 = v7;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "shifted offWristLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setOffWristLocation:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    v8 = 134283777;
    v9 = v6;
    v10 = 2049;
    v11 = v7;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "shifted parkedCarLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setParkedCarLocation:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    v8 = 134283777;
    v9 = v6;
    v10 = 2049;
    v11 = v7;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "shifted locationDuringSession to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  SMWorkoutEvent *v16;
  uint64_t v17;
  SMWorkoutEvent *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    *(_DWORD *)buf = 134283777;
    v20 = v6;
    v21 = 2049;
    v22 = v7;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "shifted workoutEvent's location to %{private}f,%{private}f", buf, 0x16u);
  }

  v18 = [SMWorkoutEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 32), "activityType");
  v11 = objc_msgSend(*(id *)(a1 + 32), "locationType");
  v12 = objc_msgSend(*(id *)(a1 + 32), "swimmingLocationType");
  v13 = objc_msgSend(*(id *)(a1 + 32), "sessionState");
  v14 = objc_msgSend(*(id *)(a1 + 32), "isResumedSessionState");
  objc_msgSend(*(id *)(a1 + 32), "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = v14;
  v16 = -[SMWorkoutEvent initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:](v18, "initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:", v8, v9, v3, v10, v11, v12, v13, v17, v15);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_53(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setLocationsDuringSession:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setWorkoutEvents:", v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMCache)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  SMCache *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v22, CFSTR("locationsDuringSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unlockLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockLocation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentLocation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startingLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offWristLocation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parkedCar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationMapItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("workoutEvents"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[SMCache initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:](self, "initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:", v23, v4, v7, v8, v21, v18, v9, v17, v10, v11, v15);
  return v20;
}

- (void)encodeWithCoder:(id)a3
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
  id v15;

  v4 = a3;
  -[SMCache identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SMCache deviceStatus](self, "deviceStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceStatus"));

  -[SMCache locationsDuringSession](self, "locationsDuringSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("locationsDuringSession"));

  -[SMCache unlockLocation](self, "unlockLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("unlockLocation"));

  -[SMCache lockLocation](self, "lockLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lockLocation"));

  -[SMCache mostRecentLocation](self, "mostRecentLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("mostRecentLocation"));

  -[SMCache startingLocation](self, "startingLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("startingLocation"));

  -[SMCache offWristLocation](self, "offWristLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("offWristLocation"));

  -[SMCache parkedCarLocation](self, "parkedCarLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("parkedCar"));

  -[SMCache destinationMapItem](self, "destinationMapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("destinationMapItem"));

  -[SMCache workoutEvents](self, "workoutEvents");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("workoutEvents"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUUID *identifier;
  id v6;
  NSSet *locationsDuringSession;
  SMLocation *unlockLocation;
  SMLocation *lockLocation;
  SMLocation *mostRecentLocation;
  NSData *destinationMapItem;
  SMLocation *parkedCarLocation;
  void *v13;
  void *v14;
  __int128 v16;
  void *v17;

  v17 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  identifier = self->_identifier;
  v6 = -[SMDeviceStatus copyWithZone:](self->_deviceStatus, "copyWithZone:", a3);
  locationsDuringSession = self->_locationsDuringSession;
  unlockLocation = self->_unlockLocation;
  lockLocation = self->_lockLocation;
  mostRecentLocation = self->_mostRecentLocation;
  v16 = *(_OWORD *)&self->_startingLocation;
  parkedCarLocation = self->_parkedCarLocation;
  destinationMapItem = self->_destinationMapItem;
  v13 = (void *)-[NSArray copyWithZone:](self->_workoutEvents, "copyWithZone:", a3);
  v14 = (void *)objc_msgSend(v17, "initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:", identifier, v6, locationsDuringSession, unlockLocation, lockLocation, mostRecentLocation, v16, parkedCarLocation, destinationMapItem, v13);

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  id v16;
  void *v17;

  v15 = (id)MEMORY[0x24BDD17C8];
  -[SMCache identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache deviceStatus](self, "deviceStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache locationsDuringSession](self, "locationsDuringSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v17, "count");
  -[SMCache unlockLocation](self, "unlockLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache lockLocation](self, "lockLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache mostRecentLocation](self, "mostRecentLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache startingLocation](self, "startingLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache offWristLocation](self, "offWristLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache parkedCarLocation](self, "parkedCarLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache destinationMapItem](self, "destinationMapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCache workoutEvents](self, "workoutEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("identifier, %@, deviceStatus, %@, locationsDuringSession, %lu, unlockLocation %@, lockLocation %@, mostRecentLocation %@, startingLocation %@, offWristLocation %@, parkedCarLocation, %@, destinationMapItem, %@, workoutEvents, %lu"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_msgSend(v12, "count"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (SMDeviceStatus)deviceStatus
{
  return self->_deviceStatus;
}

- (void)setDeviceStatus:(id)a3
{
  objc_storeStrong((id *)&self->_deviceStatus, a3);
}

- (NSSet)locationsDuringSession
{
  return self->_locationsDuringSession;
}

- (void)setLocationsDuringSession:(id)a3
{
  objc_storeStrong((id *)&self->_locationsDuringSession, a3);
}

- (SMLocation)unlockLocation
{
  return self->_unlockLocation;
}

- (void)setUnlockLocation:(id)a3
{
  objc_storeStrong((id *)&self->_unlockLocation, a3);
}

- (SMLocation)lockLocation
{
  return self->_lockLocation;
}

- (void)setLockLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lockLocation, a3);
}

- (SMLocation)mostRecentLocation
{
  return self->_mostRecentLocation;
}

- (void)setMostRecentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentLocation, a3);
}

- (SMLocation)startingLocation
{
  return self->_startingLocation;
}

- (void)setStartingLocation:(id)a3
{
  objc_storeStrong((id *)&self->_startingLocation, a3);
}

- (SMLocation)offWristLocation
{
  return self->_offWristLocation;
}

- (void)setOffWristLocation:(id)a3
{
  objc_storeStrong((id *)&self->_offWristLocation, a3);
}

- (SMLocation)parkedCarLocation
{
  return self->_parkedCarLocation;
}

- (void)setParkedCarLocation:(id)a3
{
  objc_storeStrong((id *)&self->_parkedCarLocation, a3);
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void)setDestinationMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_destinationMapItem, a3);
}

- (NSArray)workoutEvents
{
  return self->_workoutEvents;
}

- (void)setWorkoutEvents:(id)a3
{
  objc_storeStrong((id *)&self->_workoutEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_parkedCarLocation, 0);
  objc_storeStrong((id *)&self->_offWristLocation, 0);
  objc_storeStrong((id *)&self->_startingLocation, 0);
  objc_storeStrong((id *)&self->_mostRecentLocation, 0);
  objc_storeStrong((id *)&self->_lockLocation, 0);
  objc_storeStrong((id *)&self->_unlockLocation, 0);
  objc_storeStrong((id *)&self->_locationsDuringSession, 0);
  objc_storeStrong((id *)&self->_deviceStatus, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_shifter, 0);
}

@end
