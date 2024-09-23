@implementation TASingleDeviceRecord

- (TASingleDeviceRecord)initWithDeviceAdvertisement:(id)a3 state:(unint64_t)a4 type:(unint64_t)a5 date:(id)a6 keepAliveInterval:(double)a7
{
  id v13;
  id v14;
  TASingleDeviceRecord *v15;
  TASingleDeviceRecord *v16;
  void *v17;
  uint64_t v18;
  NSData *address;
  uint64_t v20;
  NSUUID *uuid;
  uint64_t v22;
  NSDate *creationDate;
  double v24;
  NSMutableArray *v25;
  NSMutableArray *stagedDetectionResults;
  void *v27;
  uint64_t v28;
  NSDate *earliestObservationDate;
  uint64_t v30;
  NSDate *firstStagedDetectionDate;
  uint64_t v32;
  NSDate *firstSurfacedAlertDate;
  uint64_t v34;
  NSDate *lastSurfacedAlertDate;
  NSMutableSet *v36;
  NSMutableSet *backgroundDetectionTypesInTravelSession;
  NSMutableDictionary *v38;
  NSMutableDictionary *backgroundDetectionCount;
  NSMutableDictionary *v40;
  NSMutableDictionary *firstBackgroundDetectionDate;
  uint64_t v42;
  NSDate *latestBeepOnMoveDate;
  uint64_t v44;
  NSDate *firstBeepOnMoveDate;
  uint64_t v46;
  NSDate *latestPlaySoundAttemptDate;
  uint64_t v48;
  NSDate *lastAISAttemptDate;
  objc_super v51;

  v13 = a3;
  v14 = a6;
  v51.receiver = self;
  v51.super_class = (Class)TASingleDeviceRecord;
  v15 = -[TASingleDeviceRecord init](&v51, sel_init);
  if (!v15)
  {
LABEL_7:
    v16 = v15;
    goto LABEL_8;
  }
  v16 = 0;
  if (v13 && v14)
  {
    objc_msgSend(v13, "address");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    address = v15->_address;
    v15->_address = (NSData *)v18;

    -[TASingleDeviceRecord _generateTAUUID:](v15, "_generateTAUUID:", v13);
    v20 = objc_claimAutoreleasedReturnValue();
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v20;

    v15->_state = a4;
    v15->_type = a5;
    v22 = objc_msgSend(v14, "copy");
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v22;

    v24 = 0.0;
    if (a7 >= 0.0)
      v24 = a7;
    v15->_keepAliveInterval = v24;
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    stagedDetectionResults = v15->_stagedDetectionResults;
    v15->_stagedDetectionResults = v25;

    objc_storeStrong((id *)&v15->_latestAdvertisement, a3);
    objc_msgSend(v13, "scanDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "earlierDate:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    earliestObservationDate = v15->_earliestObservationDate;
    v15->_earliestObservationDate = (NSDate *)v28;

    v15->_hasSurfacedNotification = 0;
    v15->_numStagedDetections = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v30 = objc_claimAutoreleasedReturnValue();
    firstStagedDetectionDate = v15->_firstStagedDetectionDate;
    v15->_firstStagedDetectionDate = (NSDate *)v30;

    v15->_numSurfacedAlerts = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v32 = objc_claimAutoreleasedReturnValue();
    firstSurfacedAlertDate = v15->_firstSurfacedAlertDate;
    v15->_firstSurfacedAlertDate = (NSDate *)v32;

    v15->_firstSurfacedAlertType = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v34 = objc_claimAutoreleasedReturnValue();
    lastSurfacedAlertDate = v15->_lastSurfacedAlertDate;
    v15->_lastSurfacedAlertDate = (NSDate *)v34;

    v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    backgroundDetectionTypesInTravelSession = v15->_backgroundDetectionTypesInTravelSession;
    v15->_backgroundDetectionTypesInTravelSession = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    backgroundDetectionCount = v15->_backgroundDetectionCount;
    v15->_backgroundDetectionCount = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    firstBackgroundDetectionDate = v15->_firstBackgroundDetectionDate;
    v15->_firstBackgroundDetectionDate = v40;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v42 = objc_claimAutoreleasedReturnValue();
    latestBeepOnMoveDate = v15->_latestBeepOnMoveDate;
    v15->_latestBeepOnMoveDate = (NSDate *)v42;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v44 = objc_claimAutoreleasedReturnValue();
    firstBeepOnMoveDate = v15->_firstBeepOnMoveDate;
    v15->_firstBeepOnMoveDate = (NSDate *)v44;

    v15->_numBeepOnMove = 0;
    v15->_playSoundSuccessCount = 0;
    v15->_playSoundFailureCount = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v46 = objc_claimAutoreleasedReturnValue();
    latestPlaySoundAttemptDate = v15->_latestPlaySoundAttemptDate;
    v15->_latestPlaySoundAttemptDate = (NSDate *)v46;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v48 = objc_claimAutoreleasedReturnValue();
    lastAISAttemptDate = v15->_lastAISAttemptDate;
    v15->_lastAISAttemptDate = (NSDate *)v48;

    v15->_AISFetchState = 0;
    v15->_AISFetchCount = 0;
    goto LABEL_7;
  }
LABEL_8:

  return v16;
}

- (void)stageDetection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSDate *firstStagedDetectionDate;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "detection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestAdvertisement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TASingleDeviceRecord updateAdvertisement:andAppendOutgoingRequestsTo:](self, "updateAdvertisement:andAppendOutgoingRequestsTo:", v7, 0);

    v8 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v5, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v29 = v10;
      _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_DEFAULT, "#TASingleDeviceRecord staging detection:%{private}@", buf, 0xCu);

    }
    -[NSMutableArray addObject:](self->_stagedDetectionResults, "addObject:", v5);
    firstStagedDetectionDate = self->_firstStagedDetectionDate;
    ++self->_numStagedDetections;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(firstStagedDetectionDate) = -[NSDate isEqual:](firstStagedDetectionDate, "isEqual:", v12);

    if ((_DWORD)firstStagedDetectionDate)
    {
      objc_msgSend(v5, "detection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "date");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v15 = self->_firstStagedDetectionDate;
      self->_firstStagedDetectionDate = v14;

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v5, "detection", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "locationHistory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21), "timestamp");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[TASingleDeviceRecord _updateEarliestObservationDateWithDate:](self, "_updateEarliestObservationDateWithDate:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

  }
}

- (id)getStagedDetections
{
  return (id)-[NSMutableArray copy](self->_stagedDetectionResults, "copy");
}

- (void)clearAllStagedDetections
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_stagedDetectionResults;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v10 = v8;
          objc_msgSend(v9, "description");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v17 = v11;
          _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_DEFAULT, "#TASingleDeviceRecord removing staged detection:%{private}@", buf, 0xCu);

        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_stagedDetectionResults, "removeAllObjects");
}

- (NSDate)keepStagedDetectionAliveUntilDate
{
  TASPAdvertisement *latestAdvertisement;
  void *v4;
  double keepAliveInterval;
  void *v6;
  void *v7;

  latestAdvertisement = self->_latestAdvertisement;
  v4 = (void *)MEMORY[0x24BDBCE60];
  if (latestAdvertisement)
  {
    keepAliveInterval = self->_keepAliveInterval;
    -[TASPAdvertisement scanDate](latestAdvertisement, "scanDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateWithTimeInterval:sinceDate:", v6, keepAliveInterval);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v7;
}

- (id)_generateTAUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCEC8];
    objc_msgSend(v3, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "advertisementData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 == 22)
    {
      objc_msgSend(v4, "advertisementData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subdataWithRange:", 0, 16 - objc_msgSend(v11, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendData:", v12);

    }
    else
    {
      objc_msgSend(v4, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "increaseLengthBy:", 16 - objc_msgSend(v10, "length"));
    }

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") == 16)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v7), "bytes"));

      v13 = (void *)v14;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)_shouldPushStagedDetection:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _DWORD v12[2];
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[TASingleDeviceRecord _isAISFetchComplete](self, "_isAISFetchComplete");
  v6 = -[TASingleDeviceRecord _isKeepInStagingUntilComplete:](self, "_isKeepInStagingUntilComplete:", v4);

  v7 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[TASingleDeviceRecord address](self, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hexString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67240707;
    v12[1] = v5;
    v13 = 1026;
    v14 = v6;
    v15 = 2113;
    v16 = v10;
    _os_log_impl(&dword_217877000, v8, OS_LOG_TYPE_DEFAULT, "#TASingleDeviceRecord shouldPushStagedDetection _isAISFetchComplete:%{public}d _isKeepInStagingUntilComplete:%{public}d for address, %{private}@", (uint8_t *)v12, 0x18u);

  }
  return v5 && v6;
}

- (BOOL)_isKeepInStagingUntilComplete:(id)a3
{
  id v4;
  TASPAdvertisement *latestAdvertisement;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  if (!v4)
  {
    v9 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TASingleDeviceRecord _isKeepInStagingUntilComplete:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_6;
  }
  latestAdvertisement = self->_latestAdvertisement;
  if (!latestAdvertisement)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  -[TASPAdvertisement scanDate](latestAdvertisement, "scanDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keepInStagingUntil");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7) != -1;

LABEL_7:
  return v8;
}

- (BOOL)_isAISFetchComplete
{
  uint64_t *p_AISFetchState;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;

  if (-[TASingleDeviceRecord getDeviceType](self, "getDeviceType") == 1
    && !-[TASPAdvertisement isPosh](self->_latestAdvertisement, "isPosh"))
  {
    v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TASingleDeviceRecord _isAISFetchComplete].cold.3(v5, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_11;
  }
  if (-[TASPAdvertisement isPosh](self->_latestAdvertisement, "isPosh") && (_os_feature_enabled_impl() & 1) == 0)
  {
    v13 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TASingleDeviceRecord _isAISFetchComplete].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_11:
    LOBYTE(v4) = 1;
    return v4;
  }
  p_AISFetchState = (uint64_t *)&self->_AISFetchState;
  LOBYTE(v4) = 1;
  switch(self->_AISFetchState)
  {
    case 0uLL:
      LOBYTE(v4) = 0;
      v22 = 1;
      goto LABEL_18;
    case 1uLL:
    case 2uLL:
    case 5uLL:
    case 6uLL:
      goto LABEL_6;
    case 3uLL:
    case 7uLL:
    case 8uLL:
      return v4;
    case 4uLL:
      if (self->_AISFetchCount <= 9)
      {
        LOBYTE(v4) = 0;
        v22 = 5;
LABEL_18:
        *p_AISFetchState = v22;
      }
      return v4;
    default:
      v21 = TAStatusLog;
      v4 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR);
      if (!v4)
        return v4;
      -[TASingleDeviceRecord _isAISFetchComplete].cold.1(p_AISFetchState, v21);
LABEL_6:
      LOBYTE(v4) = 0;
      break;
  }
  return v4;
}

- (id)purgeStagedDetectionsWithClock:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  _BOOL4 v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_stagedDetectionResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v8 |= -[TASingleDeviceRecord _shouldPushStagedDetection:](self, "_shouldPushStagedDetection:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[TASingleDeviceRecord keepStagedDetectionAliveUntilDate](self, "keepStagedDetectionAliveUntilDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "compare:", v4);

  v13 = -[NSMutableArray count](self->_stagedDetectionResults, "count");
  v14 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240704;
    v25 = v13 != 0;
    v26 = 1026;
    v27 = v8 & 1;
    v28 = 1026;
    v29 = v12 == 1;
    _os_log_debug_impl(&dword_217877000, v14, OS_LOG_TYPE_DEBUG, "#TASingleDeviceRecord purgeStagedDetetionsWithClock hasStagedDevices:%{public}d hasStagedDetectionReadyToPush:%{public}d shouldKeepStagedDetectionsAlive:%{public}d", buf, 0x14u);
  }
  v15 = v13 == 0;
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (((v15 | v8) & 1) == 0 && v12 != 1)
  {
    -[TASingleDeviceRecord getStagedDetections](self, "getStagedDetections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v17);

    -[TASingleDeviceRecord clearAllStagedDetections](self, "clearAllStagedDetections");
  }
  v18 = (void *)objc_msgSend(v16, "copy", (_QWORD)v20);

  return v18;
}

- (id)getDetectionsReadyToPushAndCheckForAISFetch
{
  NSMutableArray *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableArray *stagedDetectionResults;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_stagedDetectionResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[TASingleDeviceRecord _isKeepInStagingUntilComplete:](self, "_isKeepInStagingUntilComplete:", v10, (_QWORD)v15)&& -[TASingleDeviceRecord _isAISFetchComplete](self, "_isAISFetchComplete"))
        {
          objc_msgSend(v10, "detection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        else
        {
          -[NSMutableArray addObject:](v3, "addObject:", v10);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  stagedDetectionResults = self->_stagedDetectionResults;
  self->_stagedDetectionResults = v3;

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (void)_updateEarliestObservationDateWithDate:(id)a3
{
  id v5;
  NSDate **p_earliestObservationDate;
  NSDate *earliestObservationDate;
  id v8;

  v5 = a3;
  earliestObservationDate = self->_earliestObservationDate;
  p_earliestObservationDate = &self->_earliestObservationDate;
  v8 = v5;
  if (-[NSDate compare:](earliestObservationDate, "compare:") == NSOrderedDescending)
    objc_storeStrong((id *)p_earliestObservationDate, a3);

}

- (void)updateAdvertisement:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v7;
  id v8;
  TASPAdvertisement *latestAdvertisement;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  NSDate *latestBeepOnMoveDate;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  TAOutgoingRequests *v24;
  void *v25;
  TAOutgoingRequests *v26;
  NSDate *v27;
  void *v28;
  uint64_t v29;
  NSDate *v30;
  NSDate *v31;
  NSDate *firstBeepOnMoveDate;
  void *v33;
  NSDate *v34;
  NSDate *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  latestAdvertisement = self->_latestAdvertisement;
  if (latestAdvertisement)
  {
    -[TASPAdvertisement scanDate](latestAdvertisement, "scanDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scanDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (v12 != -1)
      goto LABEL_5;
    objc_msgSend(v7, "scanDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TASingleDeviceRecord purgeStagedDetectionsWithClock:](self, "purgeStagedDetectionsWithClock:", v13);

  }
  objc_storeStrong((id *)&self->_latestAdvertisement, a3);
LABEL_5:
  if (objc_msgSend(v7, "beepOnMoveHigh"))
  {
    objc_msgSend(v7, "scanDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", self->_latestBeepOnMoveDate);
    v17 = v16;

    latestBeepOnMoveDate = self->_latestBeepOnMoveDate;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NSDate isEqual:](latestBeepOnMoveDate, "isEqual:", v19);

    if (v17 > 3600.0)
    {
      ++self->_numBeepOnMove;
      if ((v20 & 1) == 0)
      {
        v37[0] = CFSTR("timeSinceBOM");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = CFSTR("productInfo");
        v38[0] = v21;
        -[TASingleDeviceRecord productName](self, "productName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = [TAOutgoingRequests alloc];
        objc_msgSend(v7, "scanDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v24, "initWithRequestKey:additionalInformation:date:", CFSTR("BOMObservationMetrics"), v23, v25);

        objc_msgSend(v8, "addObject:", v26);
      }
    }
    v27 = self->_latestBeepOnMoveDate;
    objc_msgSend(v7, "scanDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSDate compare:](v27, "compare:", v28);

    if (v29 == -1)
    {
      objc_msgSend(v7, "scanDate");
      v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v31 = self->_latestBeepOnMoveDate;
      self->_latestBeepOnMoveDate = v30;

    }
    firstBeepOnMoveDate = self->_firstBeepOnMoveDate;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(firstBeepOnMoveDate) = -[NSDate isEqual:](firstBeepOnMoveDate, "isEqual:", v33);

    if ((_DWORD)firstBeepOnMoveDate)
    {
      objc_msgSend(v7, "scanDate");
      v34 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v35 = self->_firstBeepOnMoveDate;
      self->_firstBeepOnMoveDate = v34;

    }
  }
  objc_msgSend(v7, "scanDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[TASingleDeviceRecord _updateEarliestObservationDateWithDate:](self, "_updateEarliestObservationDateWithDate:", v36);

}

- (void)mergeWithAnotherSingleDeviceRecord:(id)a3
{
  id v4;
  NSData *address;
  NSData *v6;
  NSUUID *v7;
  NSUUID *uuid;
  TAAccessoryInformation *v9;
  TAAccessoryInformation *accessoryInfo;
  NSDate *creationDate;
  void *v12;
  NSDate *v13;
  NSDate *v14;
  NSMutableArray *stagedDetectionResults;
  void *v16;
  void *v17;
  TASPAdvertisement *latestAdvertisement;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSData *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  void *v28;
  TASPAdvertisement *v29;
  void *v30;
  NSData *v31;
  TASPAdvertisement *v32;
  TASPAdvertisement *v33;
  NSMutableSet *backgroundDetectionTypesInTravelSession;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSDate *v51;
  NSDate *latestBeepOnMoveDate;
  void *v53;
  uint64_t v54;
  NSDate *v55;
  NSDate *v56;
  void *v57;
  NSData *v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  void *v62;
  NSDate *firstBeepOnMoveDate;
  NSDate *v64;
  void *v65;
  uint64_t v66;
  NSDate *v67;
  NSDate *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSDate *firstStagedDetectionDate;
  void *v80;
  uint64_t v81;
  NSDate *v82;
  NSDate *v83;
  NSDate *firstSurfacedAlertDate;
  void *v85;
  uint64_t v86;
  NSDate *v87;
  NSDate *v88;
  NSDate *lastSurfacedAlertDate;
  void *v90;
  uint64_t v91;
  NSDate *v92;
  NSDate *v93;
  void *v94;
  uint64_t v95;
  NSDate *latestPlaySoundAttemptDate;
  void *v97;
  uint64_t v98;
  NSDate *v99;
  NSDate *v100;
  NSDate *lastAISAttemptDate;
  void *v102;
  uint64_t v103;
  NSDate *v104;
  NSDate *v105;
  id obj;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t buf;
  __int16 v118;
  const char *v119;
  __int16 v120;
  uint64_t v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  address = self->_address;
  objc_msgSend(v4, "address");
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();

  if (address != v6)
    goto LABEL_53;
  objc_msgSend(v4, "uuid");
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v7;

  self->_AISFetchState = objc_msgSend(v4, "AISFetchState");
  self->_AISFetchCount += objc_msgSend(v4, "AISFetchCount");
  objc_msgSend(v4, "accessoryInfo");
  v9 = (TAAccessoryInformation *)objc_claimAutoreleasedReturnValue();
  accessoryInfo = self->_accessoryInfo;
  self->_accessoryInfo = v9;

  self->_state = objc_msgSend(v4, "state");
  self->_type = objc_msgSend(v4, "type");
  creationDate = self->_creationDate;
  objc_msgSend(v4, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate earlierDate:](creationDate, "earlierDate:", v12);
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v14 = self->_creationDate;
  self->_creationDate = v13;

  stagedDetectionResults = self->_stagedDetectionResults;
  objc_msgSend(v4, "stagedDetectionResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](stagedDetectionResults, "addObjectsFromArray:", v16);

  objc_msgSend(v4, "latestAdvertisement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    latestAdvertisement = self->_latestAdvertisement;

    if (latestAdvertisement)
    {
      -[TASPAdvertisement scanDate](self->_latestAdvertisement, "scanDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "latestAdvertisement");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scanDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "compare:", v21);

      if (v22 != -1)
      {
        v23 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        {
          v24 = self->_address;
          v25 = v23;
          -[NSData hexString](v24, "hexString");
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          buf = 68289283;
          v118 = 2082;
          v119 = "";
          v120 = 2081;
          v121 = objc_msgSend(v26, "UTF8String");
          v27 = "{\"msg%{public}.0s\":\"#TASingleDeviceRecord retaining latest advertisement as it is more recent\", \"ad"
                "dress\":\"%{private}s\"}";
LABEL_11:
          _os_log_impl(&dword_217877000, v25, OS_LOG_TYPE_DEBUG, v27, (uint8_t *)&buf, 0x1Cu);

          goto LABEL_13;
        }
        goto LABEL_13;
      }
LABEL_12:
      objc_msgSend(v4, "latestAdvertisement");
      v32 = (TASPAdvertisement *)objc_claimAutoreleasedReturnValue();
      v33 = self->_latestAdvertisement;
      self->_latestAdvertisement = v32;

      goto LABEL_13;
    }
  }
  objc_msgSend(v4, "latestAdvertisement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = self->_latestAdvertisement;

    if (!v29)
      goto LABEL_12;
  }
  v30 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v31 = self->_address;
    v25 = v30;
    -[NSData hexString](v31, "hexString");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    buf = 68289283;
    v118 = 2082;
    v119 = "";
    v120 = 2081;
    v121 = objc_msgSend(v26, "UTF8String");
    v27 = "{\"msg%{public}.0s\":\"#TASingleDeviceRecord other record has no latest advertisement\", \"address\":\"%{private}s\"}";
    goto LABEL_11;
  }
LABEL_13:
  backgroundDetectionTypesInTravelSession = self->_backgroundDetectionTypesInTravelSession;
  objc_msgSend(v4, "backgroundDetectionTypesInTravelSession");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](backgroundDetectionTypesInTravelSession, "unionSet:", v35);

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  objc_msgSend(v4, "backgroundDetectionCount");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v112;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v112 != v38)
          objc_enumerationMutation(obj);
        v40 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * i);
        objc_msgSend(v4, "backgroundDetectionCount");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundDetectionCount, "objectForKeyedSubscript:", v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          v44 = (void *)MEMORY[0x24BDD16E0];
          -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundDetectionCount, "objectForKeyedSubscript:", v40);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v4;
          v47 = objc_msgSend(v45, "unsignedIntegerValue");
          v48 = objc_msgSend(v42, "unsignedIntegerValue") + v47;
          v4 = v46;
          objc_msgSend(v44, "numberWithUnsignedInteger:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKey:](self->_backgroundDetectionCount, "setObject:forKey:", v49, v40);
        }
        else
        {
          -[NSMutableDictionary setObject:forKey:](self->_backgroundDetectionCount, "setObject:forKey:", v42, v40);
        }

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
    }
    while (v37);
  }

  objc_msgSend(v4, "latestBeepOnMoveDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50 && (v51 = self->_latestBeepOnMoveDate, v50, v51))
  {
    latestBeepOnMoveDate = self->_latestBeepOnMoveDate;
    objc_msgSend(v4, "latestBeepOnMoveDate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[NSDate compare:](latestBeepOnMoveDate, "compare:", v53);

    if (v54 == -1)
    {
      objc_msgSend(v4, "latestBeepOnMoveDate");
      v55 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v56 = self->_latestBeepOnMoveDate;
      self->_latestBeepOnMoveDate = v55;

    }
  }
  else
  {
    v57 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v58 = self->_address;
      v59 = v57;
      -[NSData hexString](v58, "hexString");
      v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v61 = objc_msgSend(v60, "UTF8String");
      buf = 68289283;
      v118 = 2082;
      v119 = "";
      v120 = 2081;
      v121 = v61;
      _os_log_impl(&dword_217877000, v59, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord merging nil latestBeepOnMoveDate\", \"address\":\"%{private}s\"}", (uint8_t *)&buf, 0x1Cu);

    }
  }
  objc_msgSend(v4, "firstBeepOnMoveDate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    firstBeepOnMoveDate = self->_firstBeepOnMoveDate;

    if (firstBeepOnMoveDate)
    {
      v64 = self->_firstBeepOnMoveDate;
      objc_msgSend(v4, "firstBeepOnMoveDate");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = -[NSDate compare:](v64, "compare:", v65);

      if (v66 == 1)
      {
        objc_msgSend(v4, "firstBeepOnMoveDate");
        v67 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v68 = self->_firstBeepOnMoveDate;
        self->_firstBeepOnMoveDate = v67;

      }
    }
  }
  self->_numBeepOnMove += objc_msgSend(v4, "numBeepOnMove");
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend(v4, "firstBackgroundDetectionDate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v108;
    do
    {
      for (j = 0; j != v71; ++j)
      {
        if (*(_QWORD *)v108 != v72)
          objc_enumerationMutation(v69);
        v74 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j);
        objc_msgSend(v4, "firstBackgroundDetectionDate");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "objectForKeyedSubscript:", v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_firstBackgroundDetectionDate, "objectForKeyedSubscript:", v74);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v77;
        if (!v77 || objc_msgSend(v77, "compare:", v76) == 1)
          -[NSMutableDictionary setObject:forKey:](self->_firstBackgroundDetectionDate, "setObject:forKey:", v76, v74);

      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    }
    while (v71);
  }

  firstStagedDetectionDate = self->_firstStagedDetectionDate;
  objc_msgSend(v4, "firstStagedDetectionDate");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = -[NSDate compare:](firstStagedDetectionDate, "compare:", v80);

  if (v81 == 1)
  {
    objc_msgSend(v4, "firstStagedDetectionDate");
    v82 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v83 = self->_firstStagedDetectionDate;
    self->_firstStagedDetectionDate = v82;

  }
  self->_numStagedDetections += objc_msgSend(v4, "numStagedDetections");
  firstSurfacedAlertDate = self->_firstSurfacedAlertDate;
  objc_msgSend(v4, "firstSurfacedAlertDate");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[NSDate compare:](firstSurfacedAlertDate, "compare:", v85);

  if (v86 == 1)
  {
    objc_msgSend(v4, "firstSurfacedAlertDate");
    v87 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v88 = self->_firstSurfacedAlertDate;
    self->_firstSurfacedAlertDate = v87;

    self->_firstSurfacedAlertType = objc_msgSend(v4, "firstSurfacedAlertType");
  }
  lastSurfacedAlertDate = self->_lastSurfacedAlertDate;
  objc_msgSend(v4, "lastSurfacedAlertDate");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = -[NSDate compare:](lastSurfacedAlertDate, "compare:", v90);

  if (v91 == -1)
  {
    objc_msgSend(v4, "lastSurfacedAlertDate");
    v92 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v93 = self->_lastSurfacedAlertDate;
    self->_lastSurfacedAlertDate = v92;

  }
  self->_numSurfacedAlerts += objc_msgSend(v4, "numSurfacedAlerts");
  objc_msgSend(v4, "earliestObservationDate");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[TASingleDeviceRecord _updateEarliestObservationDateWithDate:](self, "_updateEarliestObservationDateWithDate:", v94);

  self->_playSoundSuccessCount += objc_msgSend(v4, "playSoundSuccessCount");
  v95 = objc_msgSend(v4, "playSoundFailureCount");
  latestPlaySoundAttemptDate = self->_latestPlaySoundAttemptDate;
  self->_playSoundFailureCount += v95;
  objc_msgSend(v4, "latestPlaySoundAttemptDate");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = -[NSDate compare:](latestPlaySoundAttemptDate, "compare:", v97);

  if (v98 == -1)
  {
    objc_msgSend(v4, "latestPlaySoundAttemptDate");
    v99 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v100 = self->_latestPlaySoundAttemptDate;
    self->_latestPlaySoundAttemptDate = v99;

  }
  lastAISAttemptDate = self->_lastAISAttemptDate;
  objc_msgSend(v4, "lastAISAttemptDate");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = -[NSDate compare:](lastAISAttemptDate, "compare:", v102);

  if (v103 == -1)
  {
    objc_msgSend(v4, "lastAISAttemptDate");
    v104 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v105 = self->_lastAISAttemptDate;
    self->_lastAISAttemptDate = v104;

  }
LABEL_53:

}

- (BOOL)hasStagedImmediateDetections
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TASingleDeviceRecord stagedDetectionResults](self, "stagedDetectionResults", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "detection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "immediacyType");

        if (v7 == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)updateSingleDeviceRecordOnSessionChangeWithCurrentDate:(id)a3
{
  NSObject *v4;
  NSMutableSet *backgroundDetectionTypesInTravelSession;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  NSMutableSet *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    backgroundDetectionTypesInTravelSession = self->_backgroundDetectionTypesInTravelSession;
    v6[0] = 68289283;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2113;
    v10 = backgroundDetectionTypesInTravelSession;
    _os_log_impl(&dword_217877000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord session changed\", \"prevSessionTypes\":\"%{private}@\"}", (uint8_t *)v6, 0x1Cu);
  }
  -[NSMutableSet removeAllObjects](self->_backgroundDetectionTypesInTravelSession, "removeAllObjects");
}

- (unint64_t)getDeviceType
{
  return -[TASPAdvertisement getDeviceType](self->_latestAdvertisement, "getDeviceType");
}

- (id)productName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  TASPAdvertisement *latestAdvertisement;

  -[TASingleDeviceRecord accessoryInfo](self, "accessoryInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TASingleDeviceRecord accessoryInfo](self, "accessoryInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TASPAdvertisement getLatestAdvTypeToString:](self->_latestAdvertisement, "getLatestAdvTypeToString:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryTypeNameWithAdvTypeString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    latestAdvertisement = self->_latestAdvertisement;
    +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", -[TASPAdvertisement getDeviceType](latestAdvertisement, "getDeviceType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TASPAdvertisement getLatestAdvTypeToString:](latestAdvertisement, "getLatestAdvTypeToString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)processSurfacedAlert:(id)a3
{
  id v4;
  NSDate *firstSurfacedAlertDate;
  void *v6;
  NSDate *v7;
  NSDate *v8;
  NSDate *lastSurfacedAlertDate;
  void *v10;
  uint64_t v11;
  NSDate *v12;
  NSDate *v13;
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
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  firstSurfacedAlertDate = self->_firstSurfacedAlertDate;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(firstSurfacedAlertDate) = -[NSDate isEqual:](firstSurfacedAlertDate, "isEqual:", v6);

  if ((_DWORD)firstSurfacedAlertDate)
  {
    objc_msgSend(v4, "date");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v8 = self->_firstSurfacedAlertDate;
    self->_firstSurfacedAlertDate = v7;

    self->_firstSurfacedAlertType = objc_msgSend(v4, "detectionType");
  }
  lastSurfacedAlertDate = self->_lastSurfacedAlertDate;
  objc_msgSend(v4, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSDate compare:](lastSurfacedAlertDate, "compare:", v10);

  if (v11 == -1)
  {
    objc_msgSend(v4, "date");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v13 = self->_lastSurfacedAlertDate;
    self->_lastSurfacedAlertDate = v12;

  }
  ++self->_numSurfacedAlerts;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "locationHistory", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "timestamp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASingleDeviceRecord _updateEarliestObservationDateWithDate:](self, "_updateEarliestObservationDateWithDate:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

}

- (void)processBackgroundDetection:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *backgroundDetectionTypesInTravelSession;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  NSMutableSet *v10;
  void *v11;
  NSMutableDictionary *backgroundDetectionCount;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *firstBackgroundDetectionDate;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    backgroundDetectionTypesInTravelSession = self->_backgroundDetectionTypesInTravelSession;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "detectionType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](backgroundDetectionTypesInTravelSession, "containsObject:", v7) & 1) == 0
      && -[TASingleDeviceRecord state](self, "state") != 2)
    {
      v8 = -[TASingleDeviceRecord state](self, "state");

      if (v8 == 1)
        goto LABEL_11;
      v9 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 68289283;
        *(_WORD *)v31 = 2082;
        *(_QWORD *)&v31[2] = "";
        *(_WORD *)&v31[10] = 2113;
        *(_QWORD *)&v31[12] = v5;
        _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord adding background detection to record\", \"detection\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);
      }
      v10 = self->_backgroundDetectionTypesInTravelSession;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v10, "addObject:", v11);

      backgroundDetectionCount = self->_backgroundDetectionCount;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](backgroundDetectionCount, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = self->_backgroundDetectionCount;
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v18, v19);

      }
      else
      {
        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", &unk_24D824FE0, v7);
      }
    }

LABEL_11:
    firstBackgroundDetectionDate = self->_firstBackgroundDetectionDate;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](firstBackgroundDetectionDate, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v5, "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "compare:", v23);

      if (v24 != 1)
      {
LABEL_19:

        goto LABEL_20;
      }
      v25 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      {
        v30 = 68289283;
        *(_WORD *)v31 = 2082;
        *(_QWORD *)&v31[2] = "";
        *(_WORD *)&v31[10] = 2113;
        *(_QWORD *)&v31[12] = v5;
        v26 = "{\"msg%{public}.0s\":\"#TASingleDeviceRecord updating first background detection date\", \"detection\":\"%{private}@\"}";
LABEL_17:
        _os_log_impl(&dword_217877000, v25, OS_LOG_TYPE_DEBUG, v26, (uint8_t *)&v30, 0x1Cu);
      }
    }
    else
    {
      v25 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      {
        v30 = 68289283;
        *(_WORD *)v31 = 2082;
        *(_QWORD *)&v31[2] = "";
        *(_WORD *)&v31[10] = 2113;
        *(_QWORD *)&v31[12] = v5;
        v26 = "{\"msg%{public}.0s\":\"#TASingleDeviceRecord setting first background detection date\", \"detection\":\"%{private}@\"}";
        goto LABEL_17;
      }
    }
    v27 = self->_firstBackgroundDetectionDate;
    objc_msgSend(v5, "date", v30, *(_OWORD *)v31, *(_QWORD *)&v31[16]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v28, v29);

    goto LABEL_19;
  }
LABEL_20:

}

- (unint64_t)backgroundDetectionCountForDetectionType:(unint64_t)a3
{
  NSMutableDictionary *backgroundDetectionCount;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  backgroundDetectionCount = self->_backgroundDetectionCount;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](backgroundDetectionCount, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  v8 = self->_backgroundDetectionCount;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  return v11;
}

- (id)firstDetectionDateForDetectionType:(unint64_t)a3
{
  NSMutableDictionary *firstBackgroundDetectionDate;
  void *v4;
  void *v5;

  firstBackgroundDetectionDate = self->_firstBackgroundDetectionDate;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](firstBackgroundDetectionDate, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)preparePlaySoundTAOutgoingRequest:(id)a3 lastPlaySoundDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  TAOutgoingRequests *v51;
  void *v52;
  TAOutgoingRequests *v53;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v8, "setObject:forKey:", &unk_24D824FF8, CFSTR("firstSeenMinutes"));
  objc_msgSend(v8, "setObject:forKey:", &unk_24D824FF8, CFSTR("firstAlertMinutes"));
  objc_msgSend(v8, "setObject:forKey:", &unk_24D824FF8, CFSTR("lastAlertMinutes"));
  objc_msgSend(v8, "setObject:forKey:", &unk_24D824FF8, CFSTR("lastAttemptMinutes"));
  objc_msgSend(v8, "setObject:forKey:", &unk_24D824FF8, CFSTR("soundMinutes"));
  objc_msgSend(v8, "setObject:forKey:", &stru_24D815B48, CFSTR("productInfo"));
  objc_msgSend(v8, "setObject:forKey:", &unk_24D825010, CFSTR("soundCount"));
  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("success"));
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[TASingleDeviceRecord earliestObservationDate](self, "earliestObservationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "getMinutesSinceStartOfDay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("firstSeenMinutes"));

  -[TASingleDeviceRecord firstSurfacedAlertDate](self, "firstSurfacedAlertDate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[TASingleDeviceRecord firstSurfacedAlertDate](self, "firstSurfacedAlertDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      -[TASingleDeviceRecord firstSurfacedAlertDate](self, "firstSurfacedAlertDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TASingleDeviceRecord earliestObservationDate](self, "earliestObservationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", v19);
      objc_msgSend(v17, "numberWithInt:", ((int)v20 / 60));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v21, CFSTR("firstAlertMinutes"));

    }
  }
  -[TASingleDeviceRecord lastSurfacedAlertDate](self, "lastSurfacedAlertDate");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[TASingleDeviceRecord lastSurfacedAlertDate](self, "lastSurfacedAlertDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x24BDD16E0];
      -[TASingleDeviceRecord lastSurfacedAlertDate](self, "lastSurfacedAlertDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TASingleDeviceRecord earliestObservationDate](self, "earliestObservationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceDate:", v29);
      objc_msgSend(v27, "numberWithInt:", ((int)v30 / 60));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v31, CFSTR("lastAlertMinutes"));

    }
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v32) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v7, "isEqual:", v33);

      if ((v34 & 1) != 0)
        goto LABEL_12;
      v35 = (void *)MEMORY[0x24BDD16E0];
      -[TASingleDeviceRecord earliestObservationDate](self, "earliestObservationDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v32);
      objc_msgSend(v35, "numberWithInt:", ((int)v36 / 60));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v37, CFSTR("lastAttemptMinutes"));

    }
  }
LABEL_12:
  objc_msgSend(v6, "date");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    objc_msgSend(v6, "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v40, "isEqual:", v41) & 1) != 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v6, "date");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "isEqual:", v43);

    if ((v44 & 1) == 0)
    {
      v45 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "date");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[TASingleDeviceRecord earliestObservationDate](self, "earliestObservationDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "timeIntervalSinceDate:", v40);
      objc_msgSend(v45, "numberWithInt:", ((int)v46 / 60));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v41, CFSTR("soundMinutes"));
      goto LABEL_16;
    }
  }
LABEL_17:
  -[TASingleDeviceRecord productName](self, "productName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v47, CFSTR("productInfo"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TASingleDeviceRecord playSoundAttemptCount](self, "playSoundAttemptCount"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v48, CFSTR("soundCount"));

  v49 = objc_msgSend(v6, "successType") == 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v50, CFSTR("success"));

  v51 = [TAOutgoingRequests alloc];
  objc_msgSend(v6, "date");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v51, "initWithRequestKey:additionalInformation:date:", CFSTR("PlaySoundWithDetectionMetrics"), v8, v52);

  return v53;
}

- (void)processPlaySoundSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSDate *v15;
  NSDate *latestPlaySoundAttemptDate;
  void *v17;
  uint64_t v18;
  NSDate *v19;
  NSDate *v20;
  void *v21;
  _DWORD v22[2];
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_14;
  objc_msgSend(v6, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_14;
  objc_msgSend(v6, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TASingleDeviceRecord address](self, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = objc_msgSend(v6, "successType");
    if (v12 == 1)
    {
      v13 = 160;
    }
    else
    {
      if (v12)
      {
LABEL_11:
        v15 = self->_latestPlaySoundAttemptDate;
        latestPlaySoundAttemptDate = self->_latestPlaySoundAttemptDate;
        objc_msgSend(v6, "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[NSDate compare:](latestPlaySoundAttemptDate, "compare:", v17);

        if (v18 == -1)
        {
          objc_msgSend(v6, "date");
          v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
          v20 = self->_latestPlaySoundAttemptDate;
          self->_latestPlaySoundAttemptDate = v19;

        }
        -[TASingleDeviceRecord preparePlaySoundTAOutgoingRequest:lastPlaySoundDate:](self, "preparePlaySoundTAOutgoingRequest:lastPlaySoundDate:", v6, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v21);

        goto LABEL_14;
      }
      v13 = 168;
    }
    ++*(Class *)((char *)&self->super.isa + v13);
    goto LABEL_11;
  }
  v14 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    v22[0] = 68289283;
    v22[1] = 0;
    v23 = 2082;
    v24 = "";
    v25 = 2113;
    v26 = v6;
    _os_log_impl(&dword_217877000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord mismatched address\", \"playsoundSuccess\":\"%{private}@\"}", (uint8_t *)v22, 0x1Cu);
  }
LABEL_14:

}

- (id)prepareAISFetchTAOutgoingRequest:(id)a3 lastAISFetchDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  TAOutgoingRequests *v20;
  void *v21;
  TAOutgoingRequests *v22;
  void *v24;
  void *v25;
  double v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = objc_msgSend(v6, "successType") == 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("success"));

  -[TASingleDeviceRecord productName](self, "productName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("deviceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_AISFetchCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("fetchCount"));

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TASingleDeviceRecord earliestObservationDate](self, "earliestObservationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v15);
  objc_msgSend(v13, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("firstSeenSeconds"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v17))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v7, "isEqual:", v18);

      if ((v19 & 1) == 0)
      {
        v24 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v6, "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSinceDate:", v7);
        objc_msgSend(v24, "numberWithInt:", ((int)v26 / 60));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v27, CFSTR("lastAttemptMinutes"));

        goto LABEL_6;
      }
    }
  }
  objc_msgSend(v8, "setObject:forKey:", &unk_24D824FF8, CFSTR("lastAttemptMinutes"));
LABEL_6:
  v20 = [TAOutgoingRequests alloc];
  objc_msgSend(v6, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v20, "initWithRequestKey:additionalInformation:date:", CFSTR("AISFetchMetrics"), v8, v21);

  return v22;
}

- (void)processAISFetchEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  unint64_t AISFetchState;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSDate *v19;
  NSDate *lastAISAttemptDate;
  void *v21;
  uint64_t v22;
  NSDate *v23;
  NSDate *v24;
  void *v25;
  _DWORD v26[2];
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_19;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_19;
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TASingleDeviceRecord uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v6, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TASingleDeviceRecord setAccessoryInfo:](self, "setAccessoryInfo:", v12);

    v13 = objc_msgSend(v6, "successType");
    AISFetchState = self->_AISFetchState;
    if (v13 == 1)
    {
      if (AISFetchState == 2)
      {
        v15 = 3;
        goto LABEL_15;
      }
      if (AISFetchState == 6)
      {
        v15 = 7;
LABEL_15:
        self->_AISFetchState = v15;
      }
    }
    else
    {
      if (AISFetchState == 2)
      {
        v15 = 4;
        goto LABEL_15;
      }
      if (AISFetchState == 6)
      {
        v15 = 8;
        goto LABEL_15;
      }
    }
    v19 = self->_lastAISAttemptDate;
    lastAISAttemptDate = self->_lastAISAttemptDate;
    objc_msgSend(v6, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NSDate compare:](lastAISAttemptDate, "compare:", v21);

    if (v22 == -1)
    {
      objc_msgSend(v6, "date");
      v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v24 = self->_lastAISAttemptDate;
      self->_lastAISAttemptDate = v23;

    }
    -[TASingleDeviceRecord prepareAISFetchTAOutgoingRequest:lastAISFetchDate:](self, "prepareAISFetchTAOutgoingRequest:lastAISFetchDate:", v6, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v25);

    goto LABEL_19;
  }
  v16 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    v17 = v16;
    objc_msgSend(v6, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = 68289283;
    v26[1] = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2113;
    v30 = v18;
    _os_log_impl(&dword_217877000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord mismatched uuid\", \"AISFetchEvent\":\"%{private}@\"}", (uint8_t *)v26, 0x1Cu);

  }
LABEL_19:

}

- (unint64_t)playSoundAttemptCount
{
  unint64_t v3;

  v3 = -[TASingleDeviceRecord playSoundSuccessCount](self, "playSoundSuccessCount");
  return -[TASingleDeviceRecord playSoundFailureCount](self, "playSoundFailureCount") + v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  TASingleDeviceRecord *v5;
  TASingleDeviceRecord *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  char v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  BOOL v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
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
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  _QWORD v100[7];
  _QWORD v101[3];

  v5 = (TASingleDeviceRecord *)a3;
  if (self == v5)
  {
    v14 = 1;
    goto LABEL_72;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_72;
  }
  v6 = v5;
  -[TASingleDeviceRecord address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TASingleDeviceRecord address](v6, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8
    || (-[TASingleDeviceRecord address](self, "address"),
        v9 = objc_claimAutoreleasedReturnValue(),
        -[TASingleDeviceRecord address](v6, "address"),
        v97 = (void *)objc_claimAutoreleasedReturnValue(),
        v98 = (void *)v9,
        objc_msgSend((id)v9, "isEqual:")))
  {
    -[TASingleDeviceRecord uuid](self, "uuid");
    v15 = objc_claimAutoreleasedReturnValue();
    -[TASingleDeviceRecord uuid](v6, "uuid");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = (void *)v15;
    v16 = v15 != (_QWORD)v95;
    if ((void *)v15 == v95
      || (-[TASingleDeviceRecord uuid](self, "uuid"),
          v9 = objc_claimAutoreleasedReturnValue(),
          -[TASingleDeviceRecord uuid](v6, "uuid"),
          v93 = (void *)objc_claimAutoreleasedReturnValue(),
          v94 = (void *)v9,
          objc_msgSend((id)v9, "isEqual:")))
    {
      v9 = -[TASingleDeviceRecord state](self, "state");
      HIDWORD(v100[6]) = v16;
      if (v9 == -[TASingleDeviceRecord state](v6, "state")
        && (v9 = -[TASingleDeviceRecord type](self, "type"), v9 == -[TASingleDeviceRecord type](v6, "type")))
      {
        -[TASingleDeviceRecord creationDate](self, "creationDate");
        v9 = objc_claimAutoreleasedReturnValue();
        -[TASingleDeviceRecord creationDate](v6, "creationDate");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)v9;
        v3 = v9 != (_QWORD)v91;
        if ((void *)v9 == v91
          || (-[TASingleDeviceRecord creationDate](self, "creationDate"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              -[TASingleDeviceRecord creationDate](v6, "creationDate"),
              v89 = (void *)objc_claimAutoreleasedReturnValue(),
              v90 = v17,
              objc_msgSend(v17, "isEqual:")))
        {
          -[TASingleDeviceRecord keepAliveInterval](self, "keepAliveInterval");
          v25 = v24;
          -[TASingleDeviceRecord keepAliveInterval](v6, "keepAliveInterval");
          LODWORD(v100[6]) = v9 != (_QWORD)v91;
          if (v25 == v26)
          {
            -[TASingleDeviceRecord stagedDetectionResults](self, "stagedDetectionResults");
            v27 = objc_claimAutoreleasedReturnValue();
            -[TASingleDeviceRecord stagedDetectionResults](v6, "stagedDetectionResults");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = (void *)v27;
            v28 = v27 == (_QWORD)v87;
            v29 = v27 != (_QWORD)v87;
            if (v28
              || (-[TASingleDeviceRecord stagedDetectionResults](self, "stagedDetectionResults"),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[TASingleDeviceRecord stagedDetectionResults](v6, "stagedDetectionResults"),
                  v83 = (void *)objc_claimAutoreleasedReturnValue(),
                  v84 = v30,
                  objc_msgSend(v30, "isEqual:")))
            {
              -[TASingleDeviceRecord latestAdvertisement](self, "latestAdvertisement");
              v31 = objc_claimAutoreleasedReturnValue();
              -[TASingleDeviceRecord latestAdvertisement](v6, "latestAdvertisement");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = (void *)v31;
              HIDWORD(v101[2]) = v31 != (_QWORD)v85;
              HIDWORD(v100[5]) = v29;
              if ((void *)v31 == v85
                || (-[TASingleDeviceRecord latestAdvertisement](self, "latestAdvertisement"),
                    v32 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[TASingleDeviceRecord latestAdvertisement](v6, "latestAdvertisement"),
                    v79 = (void *)objc_claimAutoreleasedReturnValue(),
                    v80 = v32,
                    objc_msgSend(v32, "isEqual:")))
              {
                -[TASingleDeviceRecord earliestObservationDate](self, "earliestObservationDate");
                v33 = objc_claimAutoreleasedReturnValue();
                -[TASingleDeviceRecord earliestObservationDate](v6, "earliestObservationDate");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v101[2]) = v33 != (_QWORD)v81;
                v82 = (void *)v33;
                if ((void *)v33 == v81
                  || (-[TASingleDeviceRecord earliestObservationDate](self, "earliestObservationDate"),
                      v34 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[TASingleDeviceRecord earliestObservationDate](v6, "earliestObservationDate"),
                      v77 = (void *)objc_claimAutoreleasedReturnValue(),
                      v78 = v34,
                      objc_msgSend(v34, "isEqual:")))
                {
                  v9 = -[TASingleDeviceRecord hasSurfacedNotification](self, "hasSurfacedNotification");
                  if ((_DWORD)v9 == -[TASingleDeviceRecord hasSurfacedNotification](v6, "hasSurfacedNotification"))
                  {
                    -[TASingleDeviceRecord backgroundDetectionCount](self, "backgroundDetectionCount");
                    v35 = objc_claimAutoreleasedReturnValue();
                    -[TASingleDeviceRecord backgroundDetectionCount](v6, "backgroundDetectionCount");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = (void *)v35;
                    if ((void *)v35 == v75
                      || (-[TASingleDeviceRecord backgroundDetectionCount](self, "backgroundDetectionCount"),
                          v9 = objc_claimAutoreleasedReturnValue(),
                          -[TASingleDeviceRecord backgroundDetectionCount](v6, "backgroundDetectionCount"),
                          v71 = (void *)objc_claimAutoreleasedReturnValue(),
                          v72 = (void *)v9,
                          objc_msgSend((id)v9, "isEqual:")))
                    {
                      -[TASingleDeviceRecord firstBackgroundDetectionDate](self, "firstBackgroundDetectionDate");
                      v9 = objc_claimAutoreleasedReturnValue();
                      -[TASingleDeviceRecord firstBackgroundDetectionDate](v6, "firstBackgroundDetectionDate");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      HIDWORD(v101[1]) = v9 != (_QWORD)v73;
                      LODWORD(v100[5]) = v35 != (_QWORD)v75;
                      v74 = (void *)v9;
                      if ((void *)v9 == v73
                        || (-[TASingleDeviceRecord firstBackgroundDetectionDate](self, "firstBackgroundDetectionDate"),
                            v36 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[TASingleDeviceRecord firstBackgroundDetectionDate](v6, "firstBackgroundDetectionDate"),
                            v67 = (void *)objc_claimAutoreleasedReturnValue(),
                            v68 = v36,
                            objc_msgSend(v36, "isEqual:")))
                      {
                        -[TASingleDeviceRecord backgroundDetectionTypesInTravelSession](self, "backgroundDetectionTypesInTravelSession");
                        v37 = objc_claimAutoreleasedReturnValue();
                        -[TASingleDeviceRecord backgroundDetectionTypesInTravelSession](v6, "backgroundDetectionTypesInTravelSession");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        v70 = (void *)v37;
                        LODWORD(v101[1]) = v37 != (_QWORD)v69;
                        if ((void *)v37 == v69
                          || (-[TASingleDeviceRecord backgroundDetectionTypesInTravelSession](self, "backgroundDetectionTypesInTravelSession"), v38 = (void *)objc_claimAutoreleasedReturnValue(), -[TASingleDeviceRecord backgroundDetectionTypesInTravelSession](v6, "backgroundDetectionTypesInTravelSession"), v63 = (void *)objc_claimAutoreleasedReturnValue(), v64 = v38, objc_msgSend(v38, "isEqual:")))
                        {
                          -[TASingleDeviceRecord latestBeepOnMoveDate](self, "latestBeepOnMoveDate");
                          v39 = objc_claimAutoreleasedReturnValue();
                          -[TASingleDeviceRecord latestBeepOnMoveDate](v6, "latestBeepOnMoveDate");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          v66 = (void *)v39;
                          HIDWORD(v101[0]) = v39 != (_QWORD)v65;
                          if ((void *)v39 == v65
                            || (-[TASingleDeviceRecord latestBeepOnMoveDate](self, "latestBeepOnMoveDate"),
                                v40 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[TASingleDeviceRecord latestBeepOnMoveDate](v6, "latestBeepOnMoveDate"),
                                v59 = (void *)objc_claimAutoreleasedReturnValue(),
                                v60 = v40,
                                objc_msgSend(v40, "isEqual:")))
                          {
                            -[TASingleDeviceRecord firstBeepOnMoveDate](self, "firstBeepOnMoveDate");
                            v41 = objc_claimAutoreleasedReturnValue();
                            -[TASingleDeviceRecord firstBeepOnMoveDate](v6, "firstBeepOnMoveDate");
                            v61 = (void *)objc_claimAutoreleasedReturnValue();
                            v62 = (void *)v41;
                            v28 = v41 == (_QWORD)v61;
                            v9 = v41 != (_QWORD)v61;
                            if (v28)
                            {
                              HIDWORD(v100[4]) = v9;
                            }
                            else
                            {
                              -[TASingleDeviceRecord firstBeepOnMoveDate](self, "firstBeepOnMoveDate");
                              v42 = (void *)objc_claimAutoreleasedReturnValue();
                              -[TASingleDeviceRecord firstBeepOnMoveDate](v6, "firstBeepOnMoveDate");
                              v57 = (void *)objc_claimAutoreleasedReturnValue();
                              v58 = v42;
                              if (!objc_msgSend(v42, "isEqual:"))
                              {
                                v11 = 0;
                                LODWORD(v101[0]) = 0;
                                v12 = 0;
                                v13 = 0;
                                v14 = 0;
                                v100[4] = 0x100000000;
                                v100[3] = 0x100000001;
                                v100[2] = 0x100000001;
                                v10 = 1;
                                v100[1] = 0x100000001;
                                v100[0] = 0x100000000;
                                v99 = 0x100000001;
                                goto LABEL_17;
                              }
                              HIDWORD(v100[4]) = v9;
                            }
                            v9 = -[TASingleDeviceRecord numBeepOnMove](self, "numBeepOnMove");
                            if (v9 == -[TASingleDeviceRecord numBeepOnMove](v6, "numBeepOnMove"))
                            {
                              -[TASingleDeviceRecord firstStagedDetectionDate](self, "firstStagedDetectionDate");
                              v43 = objc_claimAutoreleasedReturnValue();
                              -[TASingleDeviceRecord firstStagedDetectionDate](v6, "firstStagedDetectionDate");
                              v55 = (void *)objc_claimAutoreleasedReturnValue();
                              v56 = (void *)v43;
                              v28 = v43 == (_QWORD)v55;
                              v9 = v43 != (_QWORD)v55;
                              if (v28)
                              {
                                LODWORD(v100[4]) = v9;
                              }
                              else
                              {
                                -[TASingleDeviceRecord firstStagedDetectionDate](self, "firstStagedDetectionDate");
                                v44 = (void *)objc_claimAutoreleasedReturnValue();
                                -[TASingleDeviceRecord firstStagedDetectionDate](v6, "firstStagedDetectionDate");
                                v53 = (void *)objc_claimAutoreleasedReturnValue();
                                v54 = v44;
                                if (!objc_msgSend(v44, "isEqual:"))
                                {
                                  v11 = 0;
                                  LODWORD(v101[0]) = 0;
                                  v12 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v100[3] = 0x100000001;
                                  v100[2] = 0x100000001;
                                  v100[1] = 0x100000001;
                                  v10 = 1;
                                  v100[0] = 0x100000001;
                                  v99 = 0x100000001;
                                  LODWORD(v100[4]) = 1;
                                  goto LABEL_17;
                                }
                                LODWORD(v100[4]) = v9;
                              }
                              v9 = -[TASingleDeviceRecord numStagedDetections](self, "numStagedDetections");
                              if (v9 == -[TASingleDeviceRecord numStagedDetections](v6, "numStagedDetections"))
                              {
                                -[TASingleDeviceRecord firstSurfacedAlertDate](self, "firstSurfacedAlertDate");
                                v45 = objc_claimAutoreleasedReturnValue();
                                -[TASingleDeviceRecord firstSurfacedAlertDate](v6, "firstSurfacedAlertDate");
                                v51 = (void *)objc_claimAutoreleasedReturnValue();
                                v52 = (void *)v45;
                                LODWORD(v101[0]) = v45 != (_QWORD)v51;
                                if ((void *)v45 == v51
                                  || (-[TASingleDeviceRecord firstSurfacedAlertDate](self, "firstSurfacedAlertDate"),
                                      v9 = objc_claimAutoreleasedReturnValue(),
                                      -[TASingleDeviceRecord firstSurfacedAlertDate](v6, "firstSurfacedAlertDate"),
                                      v49 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v50 = (void *)v9,
                                      objc_msgSend((id)v9, "isEqual:")))
                                {
                                  v9 = -[TASingleDeviceRecord firstSurfacedAlertType](self, "firstSurfacedAlertType");
                                  if (v9 == -[TASingleDeviceRecord firstSurfacedAlertType](v6, "firstSurfacedAlertType"))
                                  {
                                    -[TASingleDeviceRecord accessoryInfo](self, "accessoryInfo");
                                    v9 = objc_claimAutoreleasedReturnValue();
                                    -[TASingleDeviceRecord accessoryInfo](v6, "accessoryInfo");
                                    v47 = objc_claimAutoreleasedReturnValue();
                                    v48 = (void *)v9;
                                    if (v9 == v47)
                                    {
                                      v13 = 0;
                                      v100[3] = 0x100000001;
                                      v100[2] = 0x100000001;
                                      v100[1] = 0x100000001;
                                      v10 = 1;
                                      v100[0] = 0x100000001;
                                      v99 = 0x100000001;
                                      v11 = 1;
                                      v46 = (void *)v9;
                                      v12 = 1;
                                      v14 = 1;
                                    }
                                    else
                                    {
                                      -[TASingleDeviceRecord accessoryInfo](self, "accessoryInfo", v47);
                                      v3 = objc_claimAutoreleasedReturnValue();
                                      -[TASingleDeviceRecord accessoryInfo](v6, "accessoryInfo");
                                      v9 = objc_claimAutoreleasedReturnValue();
                                      v14 = objc_msgSend((id)v3, "isEqual:", v9);
                                      v13 = 1;
                                      v100[3] = 0x100000001;
                                      v100[2] = 0x100000001;
                                      v100[1] = 0x100000001;
                                      v10 = 1;
                                      v100[0] = 0x100000001;
                                      v99 = 0x100000001;
                                      v11 = 1;
                                      v12 = 1;
                                    }
                                  }
                                  else
                                  {
                                    v12 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v100[3] = 0x100000001;
                                    v100[2] = 0x100000001;
                                    v100[1] = 0x100000001;
                                    v10 = 1;
                                    v100[0] = 0x100000001;
                                    v99 = 0x100000001;
                                    v11 = 1;
                                  }
                                }
                                else
                                {
                                  v12 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v100[3] = 0x100000001;
                                  v100[2] = 0x100000001;
                                  v100[1] = 0x100000001;
                                  v10 = 1;
                                  v100[0] = 0x100000001;
                                  v99 = 0x100000001;
                                  v11 = 1;
                                  LODWORD(v101[0]) = 1;
                                }
                              }
                              else
                              {
                                v11 = 0;
                                LODWORD(v101[0]) = 0;
                                v12 = 0;
                                v13 = 0;
                                v14 = 0;
                                v100[3] = 0x100000001;
                                v100[2] = 0x100000001;
                                v100[1] = 0x100000001;
                                v10 = 1;
                                v99 = 0x100000001;
                                v100[0] = 0x100000001;
                              }
                              goto LABEL_17;
                            }
                            v11 = 0;
                            LODWORD(v101[0]) = 0;
                            v12 = 0;
                            v13 = 0;
                            v14 = 0;
                            *(_QWORD *)((char *)&v100[3] + 4) = 1;
                            LODWORD(v100[3]) = 1;
                            v100[2] = 0x100000001;
                            v10 = 1;
                            v100[1] = 0x100000001;
                            v100[0] = 0x100000000;
                            v99 = 0x100000001;
                          }
                          else
                          {
                            v100[4] = 0;
                            v11 = 0;
                            v12 = 0;
                            v13 = 0;
                            v14 = 0;
                            v100[3] = 0x100000001;
                            v100[2] = 0x100000001;
                            v100[1] = 0x100000001;
                            v10 = 1;
                            v100[0] = 0x100000000;
                            v99 = 0x100000000;
                            v101[0] = 0x100000000;
                          }
                        }
                        else
                        {
                          v99 = 0;
                          v101[0] = 0;
                          v100[4] = 0;
                          v11 = 0;
                          v12 = 0;
                          v13 = 0;
                          v14 = 0;
                          v100[3] = 0x100000001;
                          v100[2] = 0x100000001;
                          v100[1] = 0x100000001;
                          v10 = 1;
                          v100[0] = 0x100000000;
                          LODWORD(v101[1]) = 1;
                        }
                      }
                      else
                      {
                        v99 = 0;
                        v100[0] = 0;
                        *(_QWORD *)((char *)v101 + 4) = 0;
                        v100[4] = 0;
                        v11 = 0;
                        LODWORD(v101[0]) = 0;
                        v12 = 0;
                        v13 = 0;
                        v14 = 0;
                        v100[3] = 0x100000001;
                        v100[2] = 0x100000001;
                        v100[1] = 0x100000001;
                        v10 = 1;
                        HIDWORD(v101[1]) = 1;
                      }
                    }
                    else
                    {
                      *(_QWORD *)((char *)v100 + 4) = 0;
                      v101[0] = 0;
                      v101[1] = 0;
                      v99 = 0;
                      v100[4] = 0;
                      LODWORD(v100[0]) = 0;
                      v11 = 0;
                      v12 = 0;
                      v13 = 0;
                      v14 = 0;
                      v100[3] = 0x100000001;
                      v100[2] = 0x100000001;
                      HIDWORD(v100[1]) = 1;
                      v10 = 1;
                      LODWORD(v100[5]) = 1;
                    }
                  }
                  else
                  {
                    v10 = 0;
                    *(_QWORD *)((char *)v100 + 4) = 0;
                    v101[0] = 0;
                    v101[1] = 0;
                    v99 = 0;
                    LODWORD(v100[0]) = 0;
                    v11 = 0;
                    v12 = 0;
                    v13 = 0;
                    v14 = 0;
                    *(_OWORD *)((char *)&v100[3] + 4) = 1uLL;
                    LODWORD(v100[3]) = 1;
                    HIDWORD(v100[1]) = 1;
                    v100[2] = 0x100000001;
                  }
                }
                else
                {
                  v10 = 0;
                  *(_QWORD *)((char *)&v100[4] + 4) = 0;
                  *(_QWORD *)((char *)v100 + 4) = 0;
                  v101[0] = 0;
                  v101[1] = 0;
                  v99 = 0;
                  LODWORD(v100[0]) = 0;
                  v11 = 0;
                  v12 = 0;
                  v13 = 0;
                  v14 = 0;
                  LODWORD(v100[4]) = 0;
                  v100[3] = 0x100000001;
                  HIDWORD(v100[1]) = 1;
                  v100[2] = 0x100000001;
                  LODWORD(v101[2]) = 1;
                }
              }
              else
              {
                v100[0] = 0;
                v100[1] = 0;
                v10 = 0;
                *(_QWORD *)((char *)&v100[4] + 4) = 0;
                v99 = 0;
                v11 = 0;
                memset(v101, 0, 20);
                v12 = 0;
                v13 = 0;
                v14 = 0;
                LODWORD(v100[4]) = 0;
                v100[3] = 0x100000001;
                v100[2] = 0x100000001;
                HIDWORD(v101[2]) = 1;
              }
            }
            else
            {
              v10 = 0;
              *(_QWORD *)((char *)&v100[4] + 4) = 0;
              v99 = 0;
              memset(v101, 0, sizeof(v101));
              memset(v100, 0, 20);
              v11 = 0;
              v12 = 0;
              v13 = 0;
              v14 = 0;
              LODWORD(v100[4]) = 0;
              HIDWORD(v100[2]) = 1;
              v100[3] = 0x100000001;
              HIDWORD(v100[5]) = 1;
            }
          }
          else
          {
            v100[4] = 0;
            v100[5] = 0;
            v10 = 0;
            v99 = 0;
            memset(v100, 0, 24);
            memset(v101, 0, sizeof(v101));
            v11 = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v100[3] = 0x100000001;
          }
        }
        else
        {
          v100[4] = 0;
          v100[5] = 0;
          v10 = 0;
          v99 = 0;
          memset(v100, 0, 24);
          memset(v101, 0, sizeof(v101));
          v11 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v100[3] = 0x100000001;
          LODWORD(v100[6]) = 1;
        }
      }
      else
      {
        v10 = 0;
        *(_OWORD *)((char *)&v100[4] + 4) = 0uLL;
        v99 = 0;
        memset(v101, 0, sizeof(v101));
        memset(v100, 0, 28);
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        *(_QWORD *)((char *)&v100[3] + 4) = 1;
      }
    }
    else
    {
      v10 = 0;
      v99 = 0;
      memset(v101, 0, sizeof(v101));
      memset(v100, 0, 28);
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      HIDWORD(v100[3]) = 1;
      memset(&v100[4], 0, 20);
      HIDWORD(v100[6]) = 1;
    }
  }
  else
  {
    memset(v100, 0, sizeof(v100));
    v10 = 0;
    v99 = 0;
    memset(v101, 0, sizeof(v101));
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
LABEL_17:
  if (v13)
  {
    v18 = v11;
    v19 = v8;
    v20 = v7;
    v21 = v10;
    v22 = v12;

    v12 = v22;
    v10 = v21;
    v7 = v20;
    v8 = v19;
    v11 = v18;
  }
  if (v12)
  {

  }
  if (LODWORD(v101[0]))
  {

  }
  if (v11)
  {

  }
  if (LODWORD(v100[4]))
  {

  }
  if (LODWORD(v100[0]))
  {

  }
  if (HIDWORD(v100[4]))
  {

  }
  if ((_DWORD)v99)
  {

  }
  if (HIDWORD(v101[0]))
  {

  }
  if (HIDWORD(v99))
  {

  }
  if (LODWORD(v101[1]))
  {

  }
  if (HIDWORD(v100[0]))
  {

  }
  if (HIDWORD(v101[1]))
  {

  }
  if (LODWORD(v100[1]))
  {

  }
  if (LODWORD(v100[5]))
  {

  }
  if (v10)
  {

  }
  if (LODWORD(v101[2]))
  {

  }
  if (HIDWORD(v100[1]))
  {

  }
  if (HIDWORD(v101[2]))
  {

  }
  if (LODWORD(v100[2]))
  {

  }
  if (HIDWORD(v100[5]))
  {

  }
  if (HIDWORD(v100[2]))
  {

  }
  if (LODWORD(v100[6]))
  {

  }
  if (LODWORD(v100[3]))
  {

  }
  if (HIDWORD(v100[6]))
  {

  }
  if (HIDWORD(v100[3]))
  {

  }
  if (v7 != v8)
  {

  }
LABEL_72:

  return v14;
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("Address");
  -[NSData hexString](self->_address, "hexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("State");
  +[TADeviceRecord notificationInternalStateToString:](TADeviceRecord, "notificationInternalStateToString:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("Type");
  +[TADeviceInformation deviceTypeToString:](TADeviceInformation, "deviceTypeToString:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("CreationDate");
  -[NSDate getDateString](self->_creationDate, "getDateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("Surfaced");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasSurfacedNotification);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("AISState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_AISFetchState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[TASingleDeviceRecord descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAOutgoingRequests description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TASingleDeviceRecord)initWithCoder:(id)a3
{
  id v4;
  TASingleDeviceRecord *v5;
  uint64_t v6;
  NSData *address;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  NSDate *creationDate;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *stagedDetectionResults;
  uint64_t v18;
  TASPAdvertisement *latestAdvertisement;
  uint64_t v20;
  NSUUID *v21;
  uint64_t v22;
  NSDate *earliestObservationDate;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSMutableSet *backgroundDetectionTypesInTravelSession;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSMutableDictionary *backgroundDetectionCount;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSMutableDictionary *firstBackgroundDetectionDate;
  uint64_t v40;
  NSDate *latestBeepOnMoveDate;
  uint64_t v42;
  NSDate *firstBeepOnMoveDate;
  uint64_t v44;
  NSDate *firstStagedDetectionDate;
  uint64_t v46;
  NSDate *firstSurfacedAlertDate;
  uint64_t v48;
  NSDate *lastSurfacedAlertDate;
  uint64_t v50;
  NSDate *latestPlaySoundAttemptDate;
  uint64_t v52;
  NSDate *lastAISAttemptDate;
  uint64_t v54;
  TAAccessoryInformation *accessoryInfo;
  uint64_t v56;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)TASingleDeviceRecord;
  v5 = -[TASingleDeviceRecord init](&v58, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Address"));
    v6 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("KeepAliveInterval"));
    v5->_keepAliveInterval = v12;
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("StagedResults"));
    v16 = objc_claimAutoreleasedReturnValue();
    stagedDetectionResults = v5->_stagedDetectionResults;
    v5->_stagedDetectionResults = (NSMutableArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LatestAdvert"));
    v18 = objc_claimAutoreleasedReturnValue();
    latestAdvertisement = v5->_latestAdvertisement;
    v5->_latestAdvertisement = (TASPAdvertisement *)v18;

    if (!v5->_uuid)
    {
      -[TASingleDeviceRecord _generateTAUUID:](v5, "_generateTAUUID:", v5->_latestAdvertisement);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_uuid;
      v5->_uuid = (NSUUID *)v20;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstObsDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    earliestObservationDate = v5->_earliestObservationDate;
    v5->_earliestObservationDate = (NSDate *)v22;

    v5->_hasSurfacedNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Surfaced"));
    v24 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("BackgroundSet"));
    v27 = objc_claimAutoreleasedReturnValue();
    backgroundDetectionTypesInTravelSession = v5->_backgroundDetectionTypesInTravelSession;
    v5->_backgroundDetectionTypesInTravelSession = (NSMutableSet *)v27;

    v29 = (void *)MEMORY[0x24BDBCF20];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("BackgroundCount"));
    v32 = objc_claimAutoreleasedReturnValue();
    backgroundDetectionCount = v5->_backgroundDetectionCount;
    v5->_backgroundDetectionCount = (NSMutableDictionary *)v32;

    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("BackgroundDate"));
    v38 = objc_claimAutoreleasedReturnValue();
    firstBackgroundDetectionDate = v5->_firstBackgroundDetectionDate;
    v5->_firstBackgroundDetectionDate = (NSMutableDictionary *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beepOnMove"));
    v40 = objc_claimAutoreleasedReturnValue();
    latestBeepOnMoveDate = v5->_latestBeepOnMoveDate;
    v5->_latestBeepOnMoveDate = (NSDate *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fBOM"));
    v42 = objc_claimAutoreleasedReturnValue();
    firstBeepOnMoveDate = v5->_firstBeepOnMoveDate;
    v5->_firstBeepOnMoveDate = (NSDate *)v42;

    v5->_numBeepOnMove = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nBOM"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagedDate"));
    v44 = objc_claimAutoreleasedReturnValue();
    firstStagedDetectionDate = v5->_firstStagedDetectionDate;
    v5->_firstStagedDetectionDate = (NSDate *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstSurfaceDate"));
    v46 = objc_claimAutoreleasedReturnValue();
    firstSurfacedAlertDate = v5->_firstSurfacedAlertDate;
    v5->_firstSurfacedAlertDate = (NSDate *)v46;

    v5->_firstSurfacedAlertType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fsat"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lsad"));
    v48 = objc_claimAutoreleasedReturnValue();
    lastSurfacedAlertDate = v5->_lastSurfacedAlertDate;
    v5->_lastSurfacedAlertDate = (NSDate *)v48;

    v5->_numStagedDetections = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nStaged"));
    v5->_numSurfacedAlerts = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nSurfaced"));
    v5->_playSoundSuccessCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nPSS"));
    v5->_playSoundFailureCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nPSF"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lpsad"));
    v50 = objc_claimAutoreleasedReturnValue();
    latestPlaySoundAttemptDate = v5->_latestPlaySoundAttemptDate;
    v5->_latestPlaySoundAttemptDate = (NSDate *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("laisad"));
    v52 = objc_claimAutoreleasedReturnValue();
    lastAISAttemptDate = v5->_lastAISAttemptDate;
    v5->_lastAISAttemptDate = (NSDate *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AISInfo"));
    v54 = objc_claimAutoreleasedReturnValue();
    accessoryInfo = v5->_accessoryInfo;
    v5->_accessoryInfo = (TAAccessoryInformation *)v54;

    v56 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AISState"));
    v5->_AISFetchState = v56;
    if ((v56 | 4) == 6)
      v5->_AISFetchState = 0;
    v5->_AISFetchCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AISCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *address;
  id v5;

  address = self->_address;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", address, CFSTR("Address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("UUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("State"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("KeepAliveInterval"), self->_keepAliveInterval);
  objc_msgSend(v5, "encodeObject:forKey:", self->_stagedDetectionResults, CFSTR("StagedResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestAdvertisement, CFSTR("LatestAdvert"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_earliestObservationDate, CFSTR("firstObsDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSurfacedNotification, CFSTR("Surfaced"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundDetectionTypesInTravelSession, CFSTR("BackgroundSet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundDetectionCount, CFSTR("BackgroundCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstBackgroundDetectionDate, CFSTR("BackgroundDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestBeepOnMoveDate, CFSTR("beepOnMove"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstBeepOnMoveDate, CFSTR("fBOM"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numBeepOnMove, CFSTR("nBOM"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstStagedDetectionDate, CFSTR("stagedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstSurfacedAlertDate, CFSTR("firstSurfaceDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_firstSurfacedAlertType, CFSTR("fsat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSurfacedAlertDate, CFSTR("lsad"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numStagedDetections, CFSTR("nStaged"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numSurfacedAlerts, CFSTR("nSurfaced"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_playSoundSuccessCount, CFSTR("nPSS"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_playSoundFailureCount, CFSTR("nPSF"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestPlaySoundAttemptDate, CFSTR("lpsad"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryInfo, CFSTR("AISInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_AISFetchState, CFSTR("AISState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_AISFetchCount, CFSTR("AISCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastAISAttemptDate, CFSTR("laisad"));

}

- (NSData)address
{
  return self->_address;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TAAccessoryInformation)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void)setAccessoryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)AISFetchState
{
  return self->_AISFetchState;
}

- (void)setAISFetchState:(unint64_t)a3
{
  self->_AISFetchState = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (NSDate)earliestObservationDate
{
  return self->_earliestObservationDate;
}

- (BOOL)hasSurfacedNotification
{
  return self->_hasSurfacedNotification;
}

- (void)setHasSurfacedNotification:(BOOL)a3
{
  self->_hasSurfacedNotification = a3;
}

- (unint64_t)numStagedDetections
{
  return self->_numStagedDetections;
}

- (NSDate)firstStagedDetectionDate
{
  return self->_firstStagedDetectionDate;
}

- (NSDate)latestBeepOnMoveDate
{
  return self->_latestBeepOnMoveDate;
}

- (NSDate)firstBeepOnMoveDate
{
  return self->_firstBeepOnMoveDate;
}

- (unint64_t)numBeepOnMove
{
  return self->_numBeepOnMove;
}

- (unint64_t)numSurfacedAlerts
{
  return self->_numSurfacedAlerts;
}

- (NSDate)firstSurfacedAlertDate
{
  return self->_firstSurfacedAlertDate;
}

- (unint64_t)firstSurfacedAlertType
{
  return self->_firstSurfacedAlertType;
}

- (NSDate)lastSurfacedAlertDate
{
  return self->_lastSurfacedAlertDate;
}

- (unint64_t)playSoundSuccessCount
{
  return self->_playSoundSuccessCount;
}

- (unint64_t)playSoundFailureCount
{
  return self->_playSoundFailureCount;
}

- (NSDate)latestPlaySoundAttemptDate
{
  return self->_latestPlaySoundAttemptDate;
}

- (unint64_t)AISFetchCount
{
  return self->_AISFetchCount;
}

- (void)setAISFetchCount:(unint64_t)a3
{
  self->_AISFetchCount = a3;
}

- (NSDate)lastAISAttemptDate
{
  return self->_lastAISAttemptDate;
}

- (double)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (void)setKeepAliveInterval:(double)a3
{
  self->_keepAliveInterval = a3;
}

- (NSMutableArray)stagedDetectionResults
{
  return self->_stagedDetectionResults;
}

- (void)setStagedDetectionResults:(id)a3
{
  objc_storeStrong((id *)&self->_stagedDetectionResults, a3);
}

- (NSMutableSet)backgroundDetectionTypesInTravelSession
{
  return self->_backgroundDetectionTypesInTravelSession;
}

- (void)setBackgroundDetectionTypesInTravelSession:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDetectionTypesInTravelSession, a3);
}

- (NSMutableDictionary)backgroundDetectionCount
{
  return self->_backgroundDetectionCount;
}

- (void)setBackgroundDetectionCount:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDetectionCount, a3);
}

- (NSMutableDictionary)firstBackgroundDetectionDate
{
  return self->_firstBackgroundDetectionDate;
}

- (void)setFirstBackgroundDetectionDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstBackgroundDetectionDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstBackgroundDetectionDate, 0);
  objc_storeStrong((id *)&self->_backgroundDetectionCount, 0);
  objc_storeStrong((id *)&self->_backgroundDetectionTypesInTravelSession, 0);
  objc_storeStrong((id *)&self->_stagedDetectionResults, 0);
  objc_storeStrong((id *)&self->_lastAISAttemptDate, 0);
  objc_storeStrong((id *)&self->_latestPlaySoundAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastSurfacedAlertDate, 0);
  objc_storeStrong((id *)&self->_firstSurfacedAlertDate, 0);
  objc_storeStrong((id *)&self->_firstBeepOnMoveDate, 0);
  objc_storeStrong((id *)&self->_latestBeepOnMoveDate, 0);
  objc_storeStrong((id *)&self->_firstStagedDetectionDate, 0);
  objc_storeStrong((id *)&self->_earliestObservationDate, 0);
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (void)_isKeepInStagingUntilComplete:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_217877000, a1, a3, "#TASingleDeviceRecord nil detection in _isKeepInStagingUntilComplete", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)_isAISFetchComplete
{
  OUTLINED_FUNCTION_0_2(&dword_217877000, a1, a3, "#TASingleDeviceRecord receiving _isAISFetchComplete for a non-posh accessory", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

@end
