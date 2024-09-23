@implementation TADeviceRecord

- (void)purgeWithClock:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  NSMutableDictionary *deviceUUIDToAddress;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastPurgeDate);
  v10 = v9;
  -[TADeviceRecordSettings purgeTimeInterval](self->_settings, "purgeTimeInterval");
  if (v10 >= v11)
  {
    v12 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217877000, v12, OS_LOG_TYPE_DEFAULT, "#TADeviceRecord purging records", buf, 2u);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[NSMutableDictionary allKeys](self->_deviceRecord, "allKeys", &self->_lastPurgeDate, a3);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "creationDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeIntervalSinceDate:", v19);
          v21 = v20;
          -[TADeviceRecordSettings expiryTimeInterval](self->_settings, "expiryTimeInterval");
          v23 = v22;

          if (v21 > v23)
          {
            v24 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
              -[TADeviceRecord purgeWithClock:andAppendOutgoingRequestsTo:].cold.1((uint64_t)buf, v24);
            -[TADeviceRecord createTAOutgoingRequestWithExpiringTASingleDeviceRecord:withCurrentDate:](self, "createTAOutgoingRequestWithExpiringTASingleDeviceRecord:withCurrentDate:", v18, v7);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v25);
            -[NSMutableDictionary removeObjectForKey:](self->_deviceRecord, "removeObjectForKey:", v17);
            deviceUUIDToAddress = self->_deviceUUIDToAddress;
            objc_msgSend(v18, "uuid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](deviceUUIDToAddress, "removeObjectForKey:", v27);

          }
          objc_msgSend(v18, "purgeStagedDetectionsWithClock:", v7);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "count"))
          {
            -[TADeviceRecord createTAOutgoingRequestForUnstagingUpdateFor:withCurrentDate:](self, "createTAOutgoingRequestForUnstagingUpdateFor:withCurrentDate:", v28, v7);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v29);

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v14);
    }

    objc_storeStrong(v30, v31);
    -[TADeviceRecord logDeviceRecord](self, "logDeviceRecord");
  }

}

- (void)checkForScanRequestsWithClock:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  TAOutgoingRequests *v26;
  void *v27;
  TAOutgoingRequests *v28;
  TAOutgoingRequests *v29;
  void *v30;
  TAOutgoingRequests *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastScanAttemptDate);
  v10 = v9;
  -[TADeviceRecordSettings scanInterval](self->_settings, "scanInterval");
  if (v10 < v11)
    goto LABEL_22;
  v32 = v8;
  v33 = v7;
  objc_storeStrong((id *)&self->_lastScanAttemptDate, a3);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = self->_deviceRecord;
  v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (!v13)
  {
    v15 = 0;
    v16 = 0;
    goto LABEL_16;
  }
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v35 != v17)
        objc_enumerationMutation(v12);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "latestAdvertisement");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasHawkeyeAdvertisementPolicy");

      if (v21)
      {
        objc_msgSend(v19, "getStagedDetections");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v16 |= objc_msgSend(v22, "count") != 0;
      }
      else
      {
        objc_msgSend(v19, "latestAdvertisement");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "hasHawkeyeLowEnergyAdvertisementPolicy");

        if (!v24)
          goto LABEL_12;
        objc_msgSend(v19, "getStagedDetections");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v15 |= objc_msgSend(v22, "count") != 0;
      }

LABEL_12:
    }
    v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  }
  while (v14);
LABEL_16:

  v25 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289538;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    v46 = 1026;
    v47 = v16 & 1;
    v48 = 1026;
    v49 = v15 & 1;
    _os_log_impl(&dword_217877000, v25, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TADeviceRecord device record scan request\", \"shouldScanHawkeye\":%{public}hhd, \"shouldScanHawkeyeLowEnergy\":%{public}hhd}", buf, 0x1Eu);
  }
  if ((v16 & 1) != 0)
  {
    v26 = [TAOutgoingRequests alloc];
    v40 = CFSTR("ScanRequestReason");
    v41 = CFSTR("Updating device record");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v26, "initWithRequestKey:additionalInformation:date:", CFSTR("RequestingAdditionalScans"), v27, v33);

    objc_msgSend(v32, "addObject:", v28);
  }
  v8 = v32;
  v7 = v33;
  if ((v15 & 1) != 0)
  {
    v29 = [TAOutgoingRequests alloc];
    v38 = CFSTR("ScanRequestReason");
    v39 = CFSTR("Updating device record");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v29, "initWithRequestKey:additionalInformation:date:", CFSTR("RequestingAdditionalHawkeyeLowEnergyScans"), v30, v33);

    objc_msgSend(v32, "addObject:", v31);
  }
LABEL_22:

}

- (void)ingestTAEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    v8 = v6;
    objc_msgSend(v8, "advertisement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "notificationState");
    objc_msgSend(v8, "getDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TADeviceRecord _setDevice:withExternalState:withDate:](self, "_setDevice:withExternalState:withDate:", v9, v10, v11);

    objc_msgSend(v8, "advertisement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "deviceType");
    objc_msgSend(v8, "getDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TADeviceRecord _setDevice:withType:withDate:](self, "_setDevice:withType:withDate:", v12, v13, v14);

    objc_msgSend(v8, "advertisement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[TADeviceRecord _updateAdvertisement:andAppendOutgoingRequestsTo:](self, "_updateAdvertisement:andAppendOutgoingRequestsTo:", v15, v7);
  }
  else if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    -[TADeviceRecord _updateAdvertisement:andAppendOutgoingRequestsTo:](self, "_updateAdvertisement:andAppendOutgoingRequestsTo:", v6, v7);
  }
  else if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    v16 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      objc_msgSend(v6, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = 68289283;
      v19[1] = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2113;
      v23 = v18;
      _os_log_impl(&dword_217877000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord adding playsound\", \"playsound\":\"%{private}@\"}", (uint8_t *)v19, 0x1Cu);

    }
    -[TADeviceRecord _processPlaySoundSuccess:andAppendOutgoingRequestsTo:](self, "_processPlaySoundSuccess:andAppendOutgoingRequestsTo:", v6, v7);
  }
  else if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    -[TADeviceRecord _processAISFetchSuccess:andAppendOutgoingRequestsTo:](self, "_processAISFetchSuccess:andAppendOutgoingRequestsTo:", v6, v7);
  }

}

- (id)getDetectionResultsToPush
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_deviceRecord;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "getDetectionsReadyToPushAndCheckForAISFetch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        -[TADeviceRecord requestAISFetchIfNeeded:](self, "requestAISFetchIfNeeded:", v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)processSurfacedAlerts:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
          objc_msgSend(v10, "latestAdvertisement");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "date");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:](self, "_createRecordIfNecessaryWithAdvertisement:withDate:", v11, v12);

          objc_msgSend(v10, "address");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "processSurfacedAlert:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
  }

}

- (BOOL)hasSurfacedNotificationFor:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "hasSurfacedNotification");
  else
    v5 = 0;

  return v5;
}

- (id)_getDeviceRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TADeviceRecord)init
{
  TADeviceRecordSettings *v3;
  TADeviceRecord *v4;

  v3 = objc_alloc_init(TADeviceRecordSettings);
  v4 = -[TADeviceRecord initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (TADeviceRecord)initWithSettings:(id)a3
{
  id v5;
  TADeviceRecord *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *deviceRecord;
  uint64_t v9;
  NSDate *lastPurgeDate;
  uint64_t v11;
  NSDate *lastScanAttemptDate;
  NSMutableDictionary *v13;
  NSMutableDictionary *deviceUUIDToAddress;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TADeviceRecord;
  v6 = -[TADeviceRecord init](&v16, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deviceRecord = v6->_deviceRecord;
    v6->_deviceRecord = v7;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v9 = objc_claimAutoreleasedReturnValue();
    lastPurgeDate = v6->_lastPurgeDate;
    v6->_lastPurgeDate = (NSDate *)v9;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();
    lastScanAttemptDate = v6->_lastScanAttemptDate;
    v6->_lastScanAttemptDate = (NSDate *)v11;

    objc_storeStrong((id *)&v6->_settings, a3);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deviceUUIDToAddress = v6->_deviceUUIDToAddress;
    v6->_deviceUUIDToAddress = v13;

  }
  return v6;
}

+ (id)notificationInternalStateToString:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Invalid");
  else
    return off_24D815678[a3];
}

- (id)_getDeviceRecordWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceUUIDToAddress, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceUUIDToAddress, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)getDeviceOwnershipType:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "type");
  else
    v5 = 0;

  return v5;
}

- (unint64_t)getDeviceNotificationState:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "state");
  else
    v5 = 0;

  return v5;
}

- (id)getLatestAdvertisement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "latestAdvertisement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)getAISFetchState:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "AISFetchState");
  else
    v5 = 0;

  return v5;
}

- (void)forceUpdateAISFetchState:(id)a3 state:(unint64_t)a4
{
  void *v5;
  id v6;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setAISFetchState:", a4);
    v5 = v6;
  }

}

- (id)getDeviceUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getUnknownBeacon:(id)a3
{
  id v4;
  void *v5;
  int v6;
  TAUnknownBeacon *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  TAUnknownBeacon *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[TADeviceRecord _getDeviceRecordWithUUID:](self, "_getDeviceRecordWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = +[TAUnknownBeacon instancesRespondToSelector:](TAUnknownBeacon, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:")));
      v7 = [TAUnknownBeacon alloc];
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "getDeviceType");
      objc_msgSend(v5, "accessoryInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v5, "latestAdvertisement");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isPosh");
        objc_msgSend(v5, "latestAdvertisement");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[TAUnknownBeacon initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:](v7, "initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:", v8, v9, v10, v11, v13, objc_msgSend(v14, "isApple"));

      }
      else
      {
        v15 = -[TAUnknownBeacon initWithBeaconUUID:address:deviceType:withAccessoryInfo:](v7, "initWithBeaconUUID:address:deviceType:withAccessoryInfo:", v8, v9, v10, v11);
      }

    }
    else
    {
      v17 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        v19 = 68289026;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        _os_log_impl(&dword_217877000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord fetch TAUnknownBeacon receive invalid record\"}", (uint8_t *)&v19, 0x12u);
      }
      v15 = 0;
    }

  }
  else
  {
    v16 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v19 = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      _os_log_impl(&dword_217877000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord fetch TAUnknownBeacon receive nil uuid\"}", (uint8_t *)&v19, 0x12u);
    }
    v15 = 0;
  }

  return v15;
}

+ (unint64_t)_convertTANotificationStateToTANotificationInternalState:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (id)getDeviceUUIDMapping
{
  return self->_deviceUUIDToAddress;
}

- (void)_createRecordIfNecessaryWithAdvertisement:(id)a3 withDate:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *deviceRecord;
  void *v9;
  void *v10;
  void *v11;
  TASingleDeviceRecord *v12;
  TASingleDeviceRecord *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *deviceUUIDToAddress;
  void *v17;
  void *v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    deviceRecord = self->_deviceRecord;
    objc_msgSend(v6, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](deviceRecord, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!v10)
      {
        v11 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
          -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:].cold.2(v11, v6);
        v12 = [TASingleDeviceRecord alloc];
        -[TADeviceRecordSettings keepAliveInterval](self->_settings, "keepAliveInterval");
        v13 = -[TASingleDeviceRecord initWithDeviceAdvertisement:state:type:date:keepAliveInterval:](v12, "initWithDeviceAdvertisement:state:type:date:keepAliveInterval:", v6, 0, 0, v7);
        if (v13)
        {
          v14 = self->_deviceRecord;
          objc_msgSend(v6, "address");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, v15);

          deviceUUIDToAddress = self->_deviceUUIDToAddress;
          objc_msgSend(v6, "address");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[TASingleDeviceRecord uuid](v13, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](deviceUUIDToAddress, "setObject:forKey:", v17, v18);

        }
        else
        {
          v19 = TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
            -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:].cold.1(v19);
        }

      }
    }
  }

}

- (void)_setDevice:(id)a3 withType:(unint64_t)a4 withDate:(id)a5
{
  id v8;
  NSMutableDictionary *deviceRecord;
  void *v10;
  id v11;

  if (a4 && a3)
  {
    if (a5)
    {
      v8 = a3;
      -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:](self, "_createRecordIfNecessaryWithAdvertisement:withDate:", v8, a5);
      deviceRecord = self->_deviceRecord;
      objc_msgSend(v8, "address");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKeyedSubscript:](deviceRecord, "objectForKeyedSubscript:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setType:", a4);

    }
  }
}

- (void)_setDevice:(id)a3 withExternalState:(unint64_t)a4 withDate:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  -[TADeviceRecord _setDevice:withInternalState:withDate:](self, "_setDevice:withInternalState:withDate:", v9, +[TADeviceRecord _convertTANotificationStateToTANotificationInternalState:](TADeviceRecord, "_convertTANotificationStateToTANotificationInternalState:", a4), v8);

}

- (void)_setDevice:(id)a3 withInternalState:(unint64_t)a4 withDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  int v15;
  char v16;
  unsigned int v17;
  void *v18;
  BOOL v19;
  void *v20;
  TADeviceRecord *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *deviceRecord;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 && v8 && v9)
  {
    -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:](self, "_createRecordIfNecessaryWithAdvertisement:withDate:", v8, v9);
    objc_msgSend(v8, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TADeviceRecord getDeviceNotificationState:](self, "getDeviceNotificationState:", v11);

    switch(v12)
    {
      case 0:
        v13 = a4 - 1;
        if (a4 - 1 < 4)
          goto LABEL_17;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.2();
        goto LABEL_27;
      case 1:
        if (a4 - 1 < 4)
        {
          v15 = ((_BYTE)a4 - 1) & 1;
          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.3();
        goto LABEL_27;
      case 2:
        if (a4 - 1 < 4)
        {
          v15 = (((_BYTE)a4 - 1) & 0xF) == 3;
          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.4();
        goto LABEL_27;
      case 3:
        if (a4 - 1 < 4)
        {
          v16 = (a4 - 1) & 0xF;
          v17 = 11;
          goto LABEL_18;
        }
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.5();
        goto LABEL_27;
      case 4:
        v13 = a4 - 1;
        if (a4 - 1 >= 4)
        {
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
            -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.6();
LABEL_27:
          v15 = 0;
        }
        else
        {
LABEL_17:
          v16 = v13 & 0xF;
          v17 = 7;
LABEL_18:
          v15 = (v17 >> v16) & 1;
        }
LABEL_28:
        v18 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v19 = v15 == 0;
          v33 = v15;
          v20 = v10;
          v21 = self;
          if (v19)
            v22 = "not";
          else
            v22 = "is";
          v23 = v18;
          objc_msgSend(v8, "address");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "hexString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[TADeviceRecord notificationInternalStateToString:](TADeviceRecord, "notificationInternalStateToString:", v12);
          v34 = v12;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[TADeviceRecord notificationInternalStateToString:](TADeviceRecord, "notificationInternalStateToString:", a4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315907;
          v36 = v22;
          self = v21;
          v10 = v20;
          v15 = v33;
          v37 = 2113;
          v38 = v25;
          v39 = 2114;
          v40 = v26;
          v41 = 2114;
          v42 = v27;
          _os_log_impl(&dword_217877000, v23, OS_LOG_TYPE_DEFAULT, "#TADeviceRecord %s updating state for %{private}@ from %{public}@ to %{public}@", buf, 0x2Au);

          v12 = v34;
        }
        if (v15)
        {
          objc_msgSend(v8, "address");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[TADeviceRecord _performNotificationStateTransitionActionsForDevice:from:to:](self, "_performNotificationStateTransitionActionsForDevice:from:to:", v28, v12, a4);

          objc_msgSend(v8, "address");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[TADeviceRecord _updateAISStateOnNotificationStateChange:from:to:](self, "_updateAISStateOnNotificationStateChange:from:to:", v29, v12, a4);

          deviceRecord = self->_deviceRecord;
          objc_msgSend(v8, "address");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](deviceRecord, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setState:", a4);

        }
        break;
      default:
        v14 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.1(v12, v14);
        goto LABEL_27;
    }
  }

}

- (void)_updateAISStateOnNotificationStateChange:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  id v16;

  v8 = a3;
  if (a4 - 1 < 2)
  {
    if (a5 == 4)
    {
      v16 = v8;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "AISFetchState");

      v8 = v16;
      if (v13 == 8 || v13 == 4)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAISFetchState:", 0);

LABEL_15:
        v8 = v16;
      }
    }
  }
  else if ((!a4 || a4 == 4) && a5 == 3)
  {
    v16 = v8;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "AISFetchState");

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAISFetchState:", 1);

    }
    -[TADeviceRecord requestAISFetchIfNeeded:](self, "requestAISFetchIfNeeded:", v16);
    goto LABEL_15;
  }

}

- (void)_performNotificationStateTransitionActionsForDevice:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a3;
  if (a5 == 2)
  {
    v8 = v7;
    -[TADeviceRecord _clearStagedDetectionsForDevice:](self, "_clearStagedDetectionsForDevice:", v7);
    -[TADeviceRecord _didSurfaceNotificationFor:](self, "_didSurfaceNotificationFor:", v8);
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    v8 = v7;
    -[TADeviceRecord _clearStagedDetectionsForDevice:](self, "_clearStagedDetectionsForDevice:", v7);
LABEL_5:
    v7 = v8;
  }

}

- (void)_updateAdvertisement:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *deviceRecord;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "beepOnMoveHigh"))
  {
    objc_msgSend(v11, "scanDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:](self, "_createRecordIfNecessaryWithAdvertisement:withDate:", v11, v7);

  }
  deviceRecord = self->_deviceRecord;
  objc_msgSend(v11, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceRecord, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "updateAdvertisement:andAppendOutgoingRequestsTo:", v11, v6);
    -[TADeviceRecord _beepOnMoveForceAlertIfEligableForDeviceRecord:andAdvertisment:](self, "_beepOnMoveForceAlertIfEligableForDeviceRecord:andAdvertisment:", v10, v11);
  }

}

- (void)_beepOnMoveForceAlertIfEligableForDeviceRecord:(id)a3 andAdvertisment:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_msgSend(v8, "getDeviceType");
  if (-[TADeviceRecordSettings surfaceImmediatelyBeepOnMove](self->_settings, "surfaceImmediatelyBeepOnMove")
    && objc_msgSend(v6, "beepOnMoveHigh")
    && v7 == 1
    && objc_msgSend(v8, "numStagedDetections"))
  {
    -[TADeviceRecord forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:withReason:](self, "forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:withReason:", v6, 2);
  }

}

- (void)_processPlaySoundSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[NSObject processPlaySoundSuccess:andAppendOutgoingRequestsTo:](v10, "processPlaySoundSuccess:andAppendOutgoingRequestsTo:", v6, v7);
LABEL_8:

        goto LABEL_9;
      }
      v13 = (void *)TAStatusLog;
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v12 = v13;
      objc_msgSend(v6, "description");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = v14;
      _os_log_impl(&dword_217877000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord no records exist for address\", \"playsound\":\"%{private}@\"}", (uint8_t *)&v15, 0x1Cu);

LABEL_7:
      goto LABEL_8;
    }
  }
  v11 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    v10 = v11;
    objc_msgSend(v6, "description");
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = 68289283;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v12;
    _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord playsound success empty\", \"playsound\":\"%{private}@\"}", (uint8_t *)&v15, 0x1Cu);
    goto LABEL_7;
  }
LABEL_9:

}

- (void)requestAISFetchIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v15 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v12 = v15;
      objc_msgSend(v4, "hexString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 68289283;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2113;
      v39 = v13;
      v14 = "{\"msg%{public}.0s\":\"#TADeviceRecord no records exist for AIS fetch\", \"address\":\"%{private}@\"}";
      v16 = v12;
      v17 = OS_LOG_TYPE_ERROR;
LABEL_23:
      _os_log_impl(&dword_217877000, v16, v17, v14, (uint8_t *)&v34, 0x1Cu);
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (objc_msgSend(v5, "getDeviceType") == 1)
  {
    objc_msgSend(v6, "latestAdvertisement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPosh");

    if ((v8 & 1) == 0)
    {
      v26 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v26;
        objc_msgSend(v4, "hexString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 68289283;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2113;
        v39 = v13;
        v14 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip request AIS fetch - non-posh durian type\", \"address\":\"%{private}@\"}";
        goto LABEL_22;
      }
      goto LABEL_26;
    }
  }
  objc_msgSend(v6, "latestAdvertisement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isPosh"))
  {
    v10 = _os_feature_enabled_impl();

    if ((v10 & 1) == 0)
    {
      v11 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        objc_msgSend(v4, "hexString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 68289283;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2113;
        v39 = v13;
        v14 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip request AIS fetch for posh type - feature isn't enabled\", \"a"
              "ddress\":\"%{private}@\"}";
LABEL_22:
        v16 = v12;
        v17 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_23;
      }
      goto LABEL_26;
    }
  }
  else
  {

  }
  if ((unint64_t)objc_msgSend(v6, "AISFetchCount") < 0xA)
  {
    v19 = objc_msgSend(v6, "AISFetchState");
    -[TADeviceRecord delegate](self, "delegate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v19 == 5)
    {
      v27 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v27;
        objc_msgSend(v4, "hexString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 68289539;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2113;
        v39 = v29;
        v40 = 2050;
        v41 = objc_msgSend(v6, "AISFetchCount");
        _os_log_impl(&dword_217877000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord request AIS fetch\", \"address\":\"%{private}@\", \"requestedCount\":%{public}lu}", (uint8_t *)&v34, 0x26u);

      }
      objc_msgSend(v6, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADeviceRecord getUnknownBeacon:](self, "getUnknownBeacon:", v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v24 = v6;
        v25 = 6;
        goto LABEL_31;
      }
      v31 = (void *)TAStatusLog;
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
        goto LABEL_24;
    }
    else
    {
      if (v19 != 1)
      {
LABEL_25:

        goto LABEL_26;
      }
      v20 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        objc_msgSend(v4, "hexString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 68289539;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2113;
        v39 = v22;
        v40 = 2050;
        v41 = objc_msgSend(v6, "AISFetchCount");
        _os_log_impl(&dword_217877000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord request AIS fetch\", \"address\":\"%{private}@\", \"requestedCount\":%{public}lu}", (uint8_t *)&v34, 0x26u);

      }
      objc_msgSend(v6, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADeviceRecord getUnknownBeacon:](self, "getUnknownBeacon:", v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v24 = v6;
        v25 = 2;
LABEL_31:
        objc_msgSend(v24, "setAISFetchState:", v25);
        objc_msgSend(v6, "setAISFetchCount:", objc_msgSend(v6, "AISFetchCount") + 1);
        -[NSObject requestAIS:](v12, "requestAIS:", v13);
        goto LABEL_24;
      }
      v31 = (void *)TAStatusLog;
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
        goto LABEL_24;
    }
    v32 = v31;
    objc_msgSend(v4, "hexString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 68289283;
    v35 = 0;
    v36 = 2082;
    v37 = "";
    v38 = 2113;
    v39 = v33;
    _os_log_impl(&dword_217877000, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord can't construct TAUnknownBeacon for AIS fetch\", \"address\":\"%{private}@\"}", (uint8_t *)&v34, 0x1Cu);

    goto LABEL_24;
  }
  v18 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v18;
    objc_msgSend(v4, "hexString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 68289283;
    v35 = 0;
    v36 = 2082;
    v37 = "";
    v38 = 2113;
    v39 = v13;
    v14 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip request AIS fetch - reach maximum attemps\", \"address\":\"%{private}@\"}";
    goto LABEL_22;
  }
LABEL_26:

}

- (void)_updateKeepInStagingUntil:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getStagedDetections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "keepInStagingUntil");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "detection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TADeviceRecord _determineHELEKeepInStagingUntil:](self, "_determineHELEKeepInStagingUntil:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setKeepInStagingUntil:", v11);
        v12 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289539;
          v20 = 0;
          v21 = 2082;
          v22 = "";
          v23 = 2113;
          v24 = v9;
          v25 = 2113;
          v26 = v11;
          _os_log_impl(&dword_217877000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TADeviceRecord update KeepInStagingUntil for new AirPods\", \"before\":\"%{private}@\", \"after\":\"%{private}@\"}", buf, 0x26u);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v5);
  }

}

- (void)_processAISFetchSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADeviceRecord _getDeviceRecordWithUUID:](self, "_getDeviceRecordWithUUID:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)TAStatusLog;
      if (v10)
      {
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v12 = v11;
          objc_msgSend(v6, "description");
          v13 = objc_claimAutoreleasedReturnValue();
          v22 = 68289283;
          v23 = 0;
          v24 = 2082;
          v25 = "";
          v26 = 2113;
          v27 = v13;
          _os_log_impl(&dword_217877000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord received AIS fetch info for uuid\", \"AISFetch\":\"%{private}@\"}", (uint8_t *)&v22, 0x1Cu);

        }
        -[NSObject processAISFetchEvent:andAppendOutgoingRequestsTo:](v10, "processAISFetchEvent:andAppendOutgoingRequestsTo:", v6, v7);
        objc_msgSend(v6, "info");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v6, "info");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isHawkeyeAudioAccessory");

          if (v17)
          {
            -[NSObject address](v10, "address");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[TADeviceRecord _updateKeepInStagingUntil:](self, "_updateKeepInStagingUntil:", v18);

          }
        }
        goto LABEL_12;
      }
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        goto LABEL_13;
      }
      v20 = v11;
      objc_msgSend(v6, "description");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = 68289283;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2113;
      v27 = v21;
      _os_log_impl(&dword_217877000, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord AIS fetch no records exist for uuid\", \"AISFetch\":\"%{private}@\"}", (uint8_t *)&v22, 0x1Cu);

LABEL_11:
      goto LABEL_12;
    }
  }
  v19 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    v10 = v19;
    objc_msgSend(v6, "description");
    v20 = objc_claimAutoreleasedReturnValue();
    v22 = 68289283;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2113;
    v27 = v20;
    _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord AIS fetch success empty\", \"AISFetch\":\"%{private}@\"}", (uint8_t *)&v22, 0x1Cu);
    goto LABEL_11;
  }
LABEL_13:

}

- (id)createTAOutgoingRequestWithExpiringTASingleDeviceRecord:(id)a3 withCurrentDate:(id)a4
{
  id v5;
  id v6;
  TAOutgoingRequests *v7;
  TAOutgoingRequests *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "address");
    v7 = (TAOutgoingRequests *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [TAOutgoingRequests alloc];
      objc_msgSend(v5, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v13[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v8, "initWithRequestKey:additionalInformation:date:", CFSTR("ExpiringRecordMetrics"), v10, v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createTAOutgoingRequestForUnstagingUpdateFor:(id)a3 withCurrentDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TAOutgoingRequests *v14;
  void *v15;
  TAOutgoingRequests *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "detection", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

  v14 = [TAOutgoingRequests alloc];
  v22 = CFSTR("UnstagingUpdate");
  v23 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v14, "initWithRequestKey:additionalInformation:date:", CFSTR("UnstagingUpdate"), v15, v6);

  return v16;
}

+ (BOOL)_isKnownDevice:(unint64_t)a3
{
  return a3 == 3;
}

- (BOOL)isKnownDevice:(id)a3
{
  return +[TADeviceRecord _isKnownDevice:](TADeviceRecord, "_isKnownDevice:", -[TADeviceRecord getDeviceOwnershipType:](self, "getDeviceOwnershipType:", a3));
}

- (void)updateDeviceRecordOnSessionChange:(id)a3 WithCurrentDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  TADeviceRecord *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52[16];
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217877000, v8, OS_LOG_TYPE_DEFAULT, "#TADeviceRecord updateDeviceRecordOnSessionChange called", buf, 2u);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[NSMutableDictionary allKeys](self->_deviceRecord, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    v41 = self;
    v44 = v7;
    v45 = *(_QWORD *)v49;
    do
    {
      v12 = 0;
      v46 = v10;
      do
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateSingleDeviceRecordOnSessionChangeWithCurrentDate:", v7);
        if (!v6)
          goto LABEL_21;
        if (objc_msgSend(v6, "lastStateTransition") != 3)
          goto LABEL_15;
        objc_msgSend(v6, "getLatestValidVisit");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_15;
        v16 = (void *)v15;
        objc_msgSend(v6, "getLatestValidVisit");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "arrivalDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 == v19)
          goto LABEL_14;
        v42 = v17;
        objc_msgSend(v6, "getLatestValidVisit");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrivalDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastSurfacedAlertDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "compare:", v22) != -1)
        {

          self = v41;
          v17 = v42;
          v7 = v44;
LABEL_14:

          v11 = v45;
          v10 = v46;
          goto LABEL_15;
        }
        if (objc_msgSend(v14, "state") == 2)
        {

          self = v41;
          v7 = v44;
          v11 = v45;
          v10 = v46;
LABEL_36:
          v33 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
          {
            v32 = v33;
            objc_msgSend(v13, "hexString");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68289283;
            v54 = 0;
            v55 = 2082;
            v56 = "";
            v57 = 2113;
            v58 = v34;
            v35 = v32;
            v36 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip reprompting since we have issued an alert upon arrival\", "
                  "\"address\":\"%{private}@\"}";
LABEL_41:
            _os_log_impl(&dword_217877000, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0x1Cu);

            v7 = v44;
LABEL_28:

            goto LABEL_29;
          }
          goto LABEL_29;
        }
        v39 = objc_msgSend(v14, "state");

        self = v41;
        v7 = v44;
        v11 = v45;
        v10 = v46;
        if (v39 == 1)
          goto LABEL_36;
LABEL_15:
        if (objc_msgSend(v6, "lastStateTransition") != 4)
          goto LABEL_21;
        objc_msgSend(v6, "getLatestValidVisit");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_21;
        v24 = (void *)v23;
        objc_msgSend(v6, "getLatestValidVisit");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "departureDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26 == v27)
          goto LABEL_20;
        v43 = v25;
        objc_msgSend(v6, "getLatestValidVisit");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "departureDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastSurfacedAlertDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "compare:", v30) != -1)
        {

          self = v41;
          v25 = v43;
          v7 = v44;
LABEL_20:

          v11 = v45;
          v10 = v46;
LABEL_21:
          if ((objc_msgSend(v14, "state") == 2 || objc_msgSend(v14, "state") == 1 || objc_msgSend(v14, "state") == 3)
            && !+[TADeviceRecord _isKnownDevice:](TADeviceRecord, "_isKnownDevice:", objc_msgSend(v14, "type")))
          {
            v31 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
              -[TADeviceRecord updateDeviceRecordOnSessionChange:WithCurrentDate:].cold.1((uint64_t)v52, v31);
            objc_msgSend(v14, "latestAdvertisement");
            v32 = objc_claimAutoreleasedReturnValue();
            -[TADeviceRecord _setDevice:withInternalState:withDate:](self, "_setDevice:withInternalState:withDate:", v32, 4, v7);
            goto LABEL_28;
          }
          goto LABEL_29;
        }
        if (objc_msgSend(v14, "state") == 2)
        {

          self = v41;
          v7 = v44;
          v11 = v45;
          v10 = v46;
        }
        else
        {
          v40 = objc_msgSend(v14, "state");

          self = v41;
          v7 = v44;
          v11 = v45;
          v10 = v46;
          if (v40 != 1)
            goto LABEL_21;
        }
        v37 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        {
          v32 = v37;
          objc_msgSend(v13, "hexString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68289283;
          v54 = 0;
          v55 = 2082;
          v56 = "";
          v57 = 2113;
          v58 = v34;
          v35 = v32;
          v36 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip reprompting since we have issued an alert upon departure\", "
                "\"address\":\"%{private}@\"}";
          goto LABEL_41;
        }
LABEL_29:

        ++v12;
      }
      while (v10 != v12);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
      v10 = v38;
    }
    while (v38);
  }

  -[TADeviceRecord logDeviceRecord](self, "logDeviceRecord");
}

- (void)stageDevice:(id)a3 withCurrentDate:(id)a4
{
  -[TADeviceRecord _setDevice:withInternalState:withDate:](self, "_setDevice:withInternalState:withDate:", a3, 3, a4);
}

- (void)logDeviceRecord
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_deviceRecord, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v10 = v8;
          objc_msgSend(v9, "hexString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v19 = v11;
          v20 = 2113;
          v21 = v13;
          _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_DEFAULT, "#TADeviceRecord status for %{private}@:%{private}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v5);
  }

}

- (void)_clearStagedDetectionsForDevice:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "clearAllStagedDetections");
  }
  else
  {
    v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TADeviceRecord _clearStagedDetectionsForDevice:].cold.1(v5, v6, v7);
  }

}

- (id)_determineFirstObservationDateWithTASuspiciousDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableDictionary *deviceRecord;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "locationHistory", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "getDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "earlierDate:", v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  deviceRecord = self->_deviceRecord;
  objc_msgSend(v4, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceRecord, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "earliestObservationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earlierDate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_determineHELEKeepInStagingUntil:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
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
  id v23;

  v4 = a3;
  -[TADeviceRecord _determineFirstObservationDateWithTASuspiciousDevice:](self, "_determineFirstObservationDateWithTASuspiciousDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  -[TADeviceRecord settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxExpectedHELEWildInterval");
  objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TADeviceRecord settings](self, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "shouldAlertHELEImmediatelyForImmediateTypes"))
  {

LABEL_5:
    objc_msgSend(v4, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDBCE60];
    -[TADeviceRecordSettings minimumHELEStagingInterval](self->_settings, "minimumHELEStagingInterval");
    objc_msgSend(v13, "dateWithTimeInterval:sinceDate:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "laterDate:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[TADeviceRecord settings](self, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "stagingHELEBackstopHour");

    if (v17 >= 25)
    {
      v12 = v15;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v11, "getNextDateAtHour:", -[TADeviceRecordSettings assumedKeyRollHour](self->_settings, "assumedKeyRollHour"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getNextDateAtHour:", -[TADeviceRecordSettings stagingHELEBackstopHour](self->_settings, "stagingHELEBackstopHour"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "compare:", v18) == -1)
    {
      objc_msgSend(v15, "earlierDate:", v19);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[TADeviceRecordSettings surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll](self->_settings, "surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"))
      {
        v20 = (void *)MEMORY[0x24BDBCE60];
        -[TADeviceRecord settings](self, "settings");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hyperHELEStagingInterval");
        objc_msgSend(v20, "dateWithTimeInterval:sinceDate:", v5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        objc_msgSend(v8, "laterDate:", v22);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      v23 = v15;
    }
    v22 = v23;
    goto LABEL_13;
  }
  v10 = objc_msgSend(v4, "immediacyType");

  if (v10 != 2)
    goto LABEL_5;
  objc_msgSend(v4, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "laterDate:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v12;
}

- (id)_determineKeepInStagingUntil:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  objc_msgSend(v4, "latestAdvertisement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "getDeviceType") != 3)
  {
    objc_msgSend(v4, "accessoryInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "accessoryInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isHawkeyeAudioAccessory");

      if (v9)
        goto LABEL_5;
    }
    else
    {

    }
    -[TADeviceRecord _determineFirstObservationDateWithTASuspiciousDevice:](self, "_determineFirstObservationDateWithTASuspiciousDevice:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCE60];
    -[TADeviceRecord settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "maxExpectedDurianWildInterval");
    objc_msgSend(v12, "dateWithTimeInterval:sinceDate:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v4, "immediacyType");
    objc_msgSend(v4, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == 2)
    {
      objc_msgSend(v14, "laterDate:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v16, "getNextDateAtHour:", -[TADeviceRecordSettings assumedKeyRollHour](self->_settings, "assumedKeyRollHour"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDBCE60];
    -[TADeviceRecordSettings minimumStagingInterval](self->_settings, "minimumStagingInterval");
    objc_msgSend(v18, "dateWithTimeInterval:sinceDate:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "laterDate:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "getNextDateAtHour:", -[TADeviceRecordSettings stagingBackstopHour](self->_settings, "stagingBackstopHour"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "compare:", v17) == -1)
    {
      objc_msgSend(v20, "earlierDate:", v21);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[TADeviceRecordSettings surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll](self->_settings, "surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"))
      {
        v22 = (void *)MEMORY[0x24BDBCE60];
        -[TADeviceRecord settings](self, "settings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "hyperStagingInterval");
        objc_msgSend(v22, "dateWithTimeInterval:sinceDate:", v11);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
        objc_msgSend(v14, "laterDate:", v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      v25 = v20;
    }
    v24 = v25;
    goto LABEL_15;
  }

LABEL_5:
  -[TADeviceRecord _determineHELEKeepInStagingUntil:](self, "_determineHELEKeepInStagingUntil:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v10;
}

- (void)stageDetectionResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *deviceRecord;
  void *v11;
  void *v12;
  void *v13;
  TAStagedSuspiciousDevice *v14;
  NSObject *v15;
  NSObject *v16;
  _BYTE *v17;
  uint8_t v18;
  _BYTE v19[7];
  uint8_t v20;
  _BYTE v21[15];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v17 = v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        deviceRecord = self->_deviceRecord;
        objc_msgSend(v9, "address", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](deviceRecord, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (objc_msgSend(v12, "state") == 3)
          {
            -[TADeviceRecord _determineKeepInStagingUntil:](self, "_determineKeepInStagingUntil:", v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[TAStagedSuspiciousDevice initWithDetection:keepInStagingUntil:]([TAStagedSuspiciousDevice alloc], "initWithDetection:keepInStagingUntil:", v9, v13);
            objc_msgSend(v12, "stageDetection:", v14);

          }
          else
          {
            v16 = TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
              -[TADeviceRecord stageDetectionResults:].cold.2(&v18, v17, v16);
          }
        }
        else
        {
          v15 = TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
            -[TADeviceRecord stageDetectionResults:].cold.1(&v20, v21, v15);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

}

- (void)mergeWithAnotherDeviceRecord:(id)a3
{
  id v4;
  NSObject *v5;
  TADeviceRecordSettings *settings;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSDate *lastPurgeDate;
  void *v16;
  NSDate *v17;
  NSDate *v18;
  NSDate *lastScanAttemptDate;
  void *v20;
  NSDate *v21;
  NSDate *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *deviceUUIDToAddress;
  void *v36;
  void *v37;
  void *v38;
  TADeviceRecordSettings *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  NSObject *log;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t buf;
  __int16 v70;
  const char *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = TAStatusLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      settings = self->_settings;
      log = v5;
      -[TADeviceRecordSettings description](settings, "description");
      v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v57 = objc_msgSend(v63, "UTF8String");
      -[NSDate getDateString](self->_lastPurgeDate, "getDateString");
      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v55 = objc_msgSend(v62, "UTF8String");
      -[NSDate getDateString](self->_lastScanAttemptDate, "getDateString");
      v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v54 = objc_msgSend(v60, "UTF8String");
      v53 = -[NSMutableDictionary count](self->_deviceRecord, "count");
      v52 = -[NSMutableDictionary count](self->_deviceUUIDToAddress, "count");
      objc_msgSend(v4, "settings");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "description");
      v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v51 = objc_msgSend(v58, "UTF8String");
      objc_msgSend(v4, "lastPurgeDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "getDateString");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "UTF8String");
      objc_msgSend(v4, "lastScanAttemptDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getDateString");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      objc_msgSend(v4, "deviceRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      objc_msgSend(v4, "deviceUUIDToAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 68291586;
      v70 = 2082;
      v71 = "";
      v72 = 2082;
      v73 = v57;
      v74 = 2082;
      v75 = v55;
      v76 = 2082;
      v77 = v54;
      v78 = 2050;
      v79 = v53;
      v80 = 2050;
      v81 = v52;
      v82 = 2082;
      v83 = v51;
      v84 = 2082;
      v85 = v8;
      v86 = 2082;
      v87 = v11;
      v88 = 2050;
      v89 = v13;
      v90 = 2050;
      v91 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_217877000, log, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TADeviceRecord merging with other record\", \"self.settings\":\"%{public}s\", \"self.lastPurgeDate\":\"%{public}s\", \"self.lastScanAttemptDate\":\"%{public}s\", \"self.deviceRecord.count\":%{public}lu, \"self.deviceUUIDToAddress.count\":%{public}lu, \"other.settings\":\"%{public}s\", \"other.lastPurgeDate\":\"%{public}s\", \"other.lastScanAttemptDate\":\"%{public}s\", \"other.deviceRecord.count\":%{public}lu, \"other.deviceUUIDToAddress.count\":%{public}lu}", (uint8_t *)&buf, 0x76u);

    }
    lastPurgeDate = self->_lastPurgeDate;
    objc_msgSend(v4, "lastPurgeDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate laterDate:](lastPurgeDate, "laterDate:", v16);
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v18 = self->_lastPurgeDate;
    self->_lastPurgeDate = v17;

    lastScanAttemptDate = self->_lastScanAttemptDate;
    objc_msgSend(v4, "lastScanAttemptDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate laterDate:](lastScanAttemptDate, "laterDate:", v20);
    v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v22 = self->_lastScanAttemptDate;
    self->_lastScanAttemptDate = v21;

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v4, "deviceRecord");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v65 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "deviceRecord");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v28);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "mergeWithAnotherSingleDeviceRecord:", v32);
          }
          else
          {
            objc_msgSend(v4, "deviceRecord");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v28);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceRecord, "setObject:forKeyedSubscript:", v32, v28);
          }

          -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "uuid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            deviceUUIDToAddress = self->_deviceUUIDToAddress;
            -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v28);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "uuid");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](deviceUUIDToAddress, "setObject:forKeyedSubscript:", v28, v37);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      }
      while (v25);
    }

    v38 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      v39 = self->_settings;
      v40 = v38;
      -[TADeviceRecordSettings description](v39, "description");
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v42 = objc_msgSend(v41, "UTF8String");
      -[NSDate getDateString](self->_lastPurgeDate, "getDateString");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend(v43, "UTF8String");
      -[NSDate getDateString](self->_lastScanAttemptDate, "getDateString");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v46 = objc_msgSend(v45, "UTF8String");
      v47 = -[NSMutableDictionary count](self->_deviceRecord, "count");
      v48 = -[NSMutableDictionary count](self->_deviceUUIDToAddress, "count");
      buf = 68290306;
      v70 = 2082;
      v71 = "";
      v72 = 2082;
      v73 = v42;
      v74 = 2082;
      v75 = v44;
      v76 = 2082;
      v77 = v46;
      v78 = 2050;
      v79 = v47;
      v80 = 2050;
      v81 = v48;
      _os_log_impl(&dword_217877000, v40, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TADeviceRecord new record stats\", \"self.settings\":\"%{public}s\", \"self.lastPurgeDate\":\"%{public}s\", \"self.lastScanAttemptDate\":\"%{public}s\", \"self.deviceRecord.count\":%{public}lu, \"self.deviceUUIDToAddress.count\":%{public}lu}", (uint8_t *)&buf, 0x44u);

    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TADeviceRecord mergeWithAnotherDeviceRecord:].cold.1(v5, v49, v50);
  }

}

- (void)forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:(id)a3 withReason:(unint64_t)a4
{
  id v5;
  NSMutableDictionary *deviceRecord;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t buf;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  deviceRecord = self->_deviceRecord;
  objc_msgSend(v5, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceRecord, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "getStagedDetections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      if (objc_msgSend(v5, "getDeviceType") != 3
        || -[TADeviceRecordSettings shouldAlertHELEImmediatelyForImmediateTypes](self->_settings, "shouldAlertHELEImmediatelyForImmediateTypes"))
      {
        v11 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v12 = v11;
          objc_msgSend(v5, "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          buf = 68289539;
          v43 = 2082;
          v44 = "";
          v45 = 2113;
          v46 = v13;
          v47 = 2113;
          v48 = v14;
          _os_log_impl(&dword_217877000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord forcing staged detections to surface immediately\", \"advertisement\":\"%{private}@\", \"singleDeviceRecord\":\"%{private}@\"}", (uint8_t *)&buf, 0x26u);

        }
        v32 = v5;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v34 = v8;
        objc_msgSend(v8, "getStagedDetections");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v16 = a4;
        if (v15)
        {
          v17 = v15;
          v36 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v38 != v36)
                objc_enumerationMutation(obj);
              v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v19, "detection");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[TADeviceRecord _determineFirstObservationDateWithTASuspiciousDevice:](self, "_determineFirstObservationDateWithTASuspiciousDevice:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "detection");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "updateForceReasonWith:", v16);

              objc_msgSend(v19, "detection");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "latestAdvertisement");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "getDeviceType") == 3)
              {

LABEL_16:
                v29 = (void *)MEMORY[0x24BDBCE60];
                -[TADeviceRecord settings](self, "settings");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "maxExpectedHELEWildInterval");
                goto LABEL_19;
              }
              objc_msgSend(v34, "accessoryInfo");
              v25 = objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                v26 = (void *)v25;
                objc_msgSend(v34, "accessoryInfo");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isHawkeyeAudioAccessory");

                v16 = a4;
                if (v28)
                  goto LABEL_16;
              }
              else
              {

              }
              v29 = (void *)MEMORY[0x24BDBCE60];
              -[TADeviceRecord settings](self, "settings");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "maxExpectedDurianWildInterval");
LABEL_19:
              objc_msgSend(v29, "dateWithTimeInterval:sinceDate:", v21);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "setKeepInStagingUntil:", v31);
            }
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v17);
        }

        v5 = v32;
        v8 = v34;
      }
    }
  }

}

- (void)_didSurfaceNotificationFor:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setHasSurfacedNotification:", 1);
    v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      v11 = 68289283;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2113;
      v16 = v4;
      v6 = "{\"msg%{public}.0s\":\"#TADeviceRecord didSurfaceNotificationFor called and record updated\", \"singleDeviceR"
           "ecord\":\"%{private}@\"}";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEBUG;
      v9 = 28;
LABEL_6:
      _os_log_impl(&dword_217877000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    v10 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      v11 = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v6 = "{\"msg%{public}.0s\":\"#TADeviceRecord didSurfaceNotificationFor called with non-existant record\"}";
      v7 = v10;
      v8 = OS_LOG_TYPE_FAULT;
      v9 = 18;
      goto LABEL_6;
    }
  }

}

- (BOOL)hasStagedImmediateDetections:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "hasStagedImmediateDetections");
  else
    v5 = 0;

  return v5;
}

- (unint64_t)getNumStagedDetections:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "numStagedDetections");
  else
    v5 = 0;

  return v5;
}

- (id)getFirstStagedDetectionDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "firstStagedDetectionDate");
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)getNumOfAISFetch:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "AISFetchCount");
  else
    v5 = 0;

  return v5;
}

- (BOOL)isAISFetchSuccessful:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "AISFetchState") == 3 || objc_msgSend(v4, "AISFetchState") == 7;
  else
    v5 = 0;

  return v5;
}

- (void)processBackgroundDetection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "latestAdvertisement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:](self, "_createRecordIfNecessaryWithAdvertisement:withDate:", v5, v6);

    objc_msgSend(v4, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "processBackgroundDetection:", v4);
  }
}

- (id)getLatestBeepOnMoveDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "latestBeepOnMoveDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)getDeviceType:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "getDeviceType");
  else
    v5 = 0;

  return v5;
}

- (id)getAccessoryInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TADeviceRecord _getDeviceRecord:](self, "_getDeviceRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessoryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)removeDevice:(id)a3
{
  id v4;

  v4 = a3;
  -[TADeviceRecord _clearStagedDetectionsForDevice:](self, "_clearStagedDetectionsForDevice:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceRecord, "removeObjectForKey:", v4);

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TADeviceRecord *v5;
  TADeviceRecord *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = (TADeviceRecord *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[TADeviceRecord deviceRecord](self, "deviceRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADeviceRecord deviceRecord](v6, "deviceRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[TADeviceRecord deviceRecord](self, "deviceRecord");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TADeviceRecord deviceRecord](v6, "deviceRecord");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_25;
        }
      }
      -[TADeviceRecord lastPurgeDate](self, "lastPurgeDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADeviceRecord lastPurgeDate](v6, "lastPurgeDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[TADeviceRecord lastPurgeDate](self, "lastPurgeDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TADeviceRecord lastPurgeDate](v6, "lastPurgeDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      -[TADeviceRecord lastScanAttemptDate](self, "lastScanAttemptDate");
      v14 = objc_claimAutoreleasedReturnValue();
      -[TADeviceRecord lastScanAttemptDate](v6, "lastScanAttemptDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        -[TADeviceRecord lastScanAttemptDate](self, "lastScanAttemptDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TADeviceRecord lastScanAttemptDate](v6, "lastScanAttemptDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      -[TADeviceRecord settings](self, "settings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADeviceRecord settings](v6, "settings");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v18)
      {

        v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        -[TADeviceRecord settings](self, "settings");
        v24 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[TADeviceRecord settings](v6, "settings");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v20, "isEqual:", v21);

        v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12)
          goto LABEL_24;
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    v10 = 0;
  }
LABEL_27:

  return v10;
}

- (id)descriptionDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allKeys](self->_deviceRecord, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "descriptionDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hexString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(0, "setObject:forKey:", v10, v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return (id)objc_msgSend(0, "copy");
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

  -[TADeviceRecord descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TADeviceRecord description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
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

- (TADeviceRecord)initWithCoder:(id)a3
{
  id v4;
  TADeviceRecord *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *deviceRecord;
  uint64_t v12;
  NSDate *lastPurgeDate;
  void *v14;
  uint64_t v15;
  NSDate *lastScanAttemptDate;
  uint64_t v17;
  TADeviceRecordSettings *settings;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *deviceUUIDToAddress;
  NSObject *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)TADeviceRecord;
  v5 = -[TADeviceRecord init](&v47, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("DeviceRecord"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceRecord = v5->_deviceRecord;
    v5->_deviceRecord = (NSMutableDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastPurgeDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastPurgeDate = v5->_lastPurgeDate;
    v5->_lastPurgeDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastScanAttemptDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastScanAttemptDate"));
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v15 = objc_claimAutoreleasedReturnValue();
    lastScanAttemptDate = v5->_lastScanAttemptDate;
    v5->_lastScanAttemptDate = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Settings"));
    v17 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (TADeviceRecordSettings *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("UUIDToAddress"));
    v23 = objc_claimAutoreleasedReturnValue();
    deviceUUIDToAddress = v5->_deviceUUIDToAddress;
    v5->_deviceUUIDToAddress = (NSMutableDictionary *)v23;

    if (!v5->_deviceUUIDToAddress)
    {
      v25 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v49 = 0;
        v50 = 2082;
        v51 = "";
        _os_log_impl(&dword_217877000, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord initWithCoder doesn't have deviceUUIDToAddress key due to old version\"}", buf, 0x12u);
      }
      v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v27 = v5->_deviceUUIDToAddress;
      v5->_deviceUUIDToAddress = v26;

    }
    v42 = v4;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[NSMutableDictionary allKeys](v5->_deviceRecord, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_deviceRecord, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "uuid");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            v36 = v5->_deviceUUIDToAddress;
            objc_msgSend(v34, "uuid");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v33, v37);

          }
          else
          {
            v38 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
            {
              v39 = v38;
              objc_msgSend(v33, "hexString");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 68289283;
              v49 = 0;
              v50 = 2082;
              v51 = "";
              v52 = 2113;
              v53 = v40;
              _os_log_impl(&dword_217877000, v39, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord found a record with address but no uuid\", \"address\":\"%{private}@\"}", buf, 0x1Cu);

            }
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v30);
    }

    v4 = v42;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *deviceRecord;
  id v5;

  deviceRecord = self->_deviceRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceRecord, CFSTR("DeviceRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastPurgeDate, CFSTR("LastPurgeDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastScanAttemptDate, CFSTR("LastScanAttemptDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_settings, CFSTR("Settings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUUIDToAddress, CFSTR("UUIDToAddress"));

}

- (TAStoreRequestProtocol)delegate
{
  return (TAStoreRequestProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRecord, a3);
}

- (NSMutableDictionary)deviceUUIDToAddress
{
  return self->_deviceUUIDToAddress;
}

- (void)setDeviceUUIDToAddress:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUIDToAddress, a3);
}

- (NSDate)lastPurgeDate
{
  return self->_lastPurgeDate;
}

- (void)setLastPurgeDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPurgeDate, a3);
}

- (NSDate)lastScanAttemptDate
{
  return self->_lastScanAttemptDate;
}

- (void)setLastScanAttemptDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastScanAttemptDate, a3);
}

- (TADeviceRecordSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_lastScanAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastPurgeDate, 0);
  objc_storeStrong((id *)&self->_deviceUUIDToAddress, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_createRecordIfNecessaryWithAdvertisement:(os_log_t)log withDate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_217877000, log, OS_LOG_TYPE_FAULT, "#TADeviceRecord failed to create record in _createRecordIfNecessaryWithAddress:withDate:", v1, 2u);
  OUTLINED_FUNCTION_1_3();
}

- (void)_createRecordIfNecessaryWithAdvertisement:(void *)a1 withDate:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138477827;
  v7 = v5;
  _os_log_debug_impl(&dword_217877000, v3, OS_LOG_TYPE_DEBUG, "#TADeviceRecord creating new record for %{private}@", (uint8_t *)&v6, 0xCu);

  OUTLINED_FUNCTION_1_2();
}

- (void)_setDevice:(uint64_t)a1 withInternalState:(NSObject *)a2 withDate:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_217877000, a2, OS_LOG_TYPE_FAULT, "#TADeviceRecord unknown old state %lu", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5_0();
}

- (void)_setDevice:withInternalState:withDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_217877000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)_setDevice:withInternalState:withDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_217877000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)_setDevice:withInternalState:withDate:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_217877000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)_setDevice:withInternalState:withDate:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_217877000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)_setDevice:withInternalState:withDate:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_217877000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)purgeWithClock:(uint64_t)a1 andAppendOutgoingRequestsTo:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_1(a1, a2);
  objc_msgSend(v3, "hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138412290;
  *v2 = v6;
  OUTLINED_FUNCTION_0(&dword_217877000, v7, v8, "#TADeviceRecord expiring %@ from record");

  OUTLINED_FUNCTION_2();
}

- (void)updateDeviceRecordOnSessionChange:(uint64_t)a1 WithCurrentDate:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_1(a1, a2);
  objc_msgSend(v3, "hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138412290;
  *v2 = v6;
  OUTLINED_FUNCTION_0(&dword_217877000, v7, v8, "#TADeviceRecord resetting %@ status to reprompt");

  OUTLINED_FUNCTION_2();
}

- (void)_clearStagedDetectionsForDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_2(&dword_217877000, a1, a3, "#TADeviceRecord record not found when clearing staged detections", v3);
  OUTLINED_FUNCTION_1_3();
}

- (void)stageDetectionResults:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_2(&dword_217877000, a3, (uint64_t)a3, "#TADeviceRecord no record for stageDetectionResults", a1);
}

- (void)stageDetectionResults:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_2(&dword_217877000, a3, (uint64_t)a3, "#TADeviceRecord device not in staged state for stageDetectionResults", a1);
}

- (void)mergeWithAnotherDeviceRecord:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_2(&dword_217877000, a1, a3, "#TADeviceRecord attempted to merge with nil record", v3);
  OUTLINED_FUNCTION_1_3();
}

- (void)description
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_217877000, v4, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1_2();
}

@end
