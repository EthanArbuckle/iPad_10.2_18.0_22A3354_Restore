@implementation SAWithYouDetector

- (void)ingestTAEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  id v43;

  v43 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SAWithYouDetector _updateWithYouStatusIfNecessaryOnAdvertisement:](self, "_updateWithYouStatusIfNecessaryOnAdvertisement:", v43);
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v43;
      if (objc_msgSend(v4, "state") == 1)
      {
        -[SAWithYouDetector lastLongScanRequest](self, "lastLongScanRequest");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          v6 = v4;
          if (-[SAWithYouDetector isFindingRelevantDevices](self, "isFindingRelevantDevices"))
          {
            objc_msgSend(v6, "date");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAWithYouDetector setLastRelevantDeviceFoundTime:](self, "setLastRelevantDeviceFoundTime:", v7);

            -[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "removeAllObjects");

            -[SAWithYouDetector setIsFindingRelevantDevices:](self, "setIsFindingRelevantDevices:", 0);
          }
          objc_msgSend(v6, "date");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAWithYouDetector lastLongScanRequest](self, "lastLongScanRequest");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "timeIntervalSinceDate:", v10);
          v12 = v11;

          -[SAWithYouDetector lastRelevantDeviceFoundTime](self, "lastRelevantDeviceFoundTime");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[SAWithYouDetector lastRelevantDeviceFoundTime](self, "lastRelevantDeviceFoundTime");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAWithYouDetector lastLongScanRequest](self, "lastLongScanRequest");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "timeIntervalSinceDate:", v15);
            v17 = v16;

          }
          else
          {
            v17 = 0.0;
          }

          -[SAWithYouDetector lastExtraHELEFoundTime](self, "lastExtraHELEFoundTime");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAWithYouDetector lastLongScanRequest](self, "lastLongScanRequest");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSinceDate:", v26);
          v28 = v27;

          -[SAWithYouDetector lastExtraNonHELEFoundTime](self, "lastExtraNonHELEFoundTime");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAWithYouDetector lastLongScanRequest](self, "lastLongScanRequest");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "timeIntervalSinceDate:", v30);
          v32 = v31;

          -[SAWithYouDetector sendScanContextToCoreAnalytics:isPartOfLongScan:scanDuration:relevantOnlyScanDuration:foundExtraHELECount:extraHELEScanDuration:foundExtraNonHELECount:extraNonHELEScanDuration:longScanContext:](self, "sendScanContextToCoreAnalytics:isPartOfLongScan:scanDuration:relevantOnlyScanDuration:foundExtraHELECount:extraHELEScanDuration:foundExtraNonHELECount:extraNonHELEScanDuration:longScanContext:", 2, 1, -[SAWithYouDetector extraFoundHELECount](self, "extraFoundHELECount"), -[SAWithYouDetector extraFoundNonHELECount](self, "extraFoundNonHELECount"), -[SAWithYouDetector lastLongScanContext](self, "lastLongScanContext"), v12, v17, v28, v32);
          -[SAWithYouDetector analytics](self, "analytics");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addScanDuration:", v12);

          -[SAWithYouDetector analytics](self, "analytics");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          v36 = 6.0;
          if (v17 >= 6.0)
            v36 = v17;
          objc_msgSend(v34, "addScanDurationForFindingRelevantItemsOnly:", v36);

          -[SAWithYouDetector setLastLongScanRequest:](self, "setLastLongScanRequest:", 0);
          -[SAWithYouDetector setLastRelevantDeviceFoundTime:](self, "setLastRelevantDeviceFoundTime:", 0);
          -[SAWithYouDetector setExtraFoundHELECount:](self, "setExtraFoundHELECount:", 0);
          -[SAWithYouDetector setExtraFoundNonHELECount:](self, "setExtraFoundNonHELECount:", 0);
          -[SAWithYouDetector setLastExtraHELEFoundTime:](self, "setLastExtraHELEFoundTime:", 0);
          -[SAWithYouDetector setLastExtraNonHELEFoundTime:](self, "setLastExtraNonHELEFoundTime:", 0);

        }
        -[SAWithYouDetector _updateAllWithYouStatusOnScanEndedEvent:](self, "_updateAllWithYouStatusOnScanEndedEvent:", v4);
        goto LABEL_26;
      }
      if (objc_msgSend(v4, "state") == 2)
      {
        objc_msgSend(v4, "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dateByAddingTimeInterval:", -1.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAWithYouDetector setLastStartOfScan:](self, "setLastStartOfScan:", v19);

LABEL_20:
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_27;
      v4 = v43;
      if (objc_msgSend(v4, "systemStateType") != 15)
      {
        if (objc_msgSend(v4, "systemStateType") != 11 || !objc_msgSend(v4, "isOn"))
          goto LABEL_26;
        -[SAWithYouDetector clock](self, "clock");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x1E0C99D68]);
        -[SAWithYouDetector clock](self, "clock");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "getCurrentTime");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v20, "initWithTimeInterval:sinceDate:", v22, 30.0);
        objc_msgSend(v18, "setupAlarmFireAt:forClient:", v23, self);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAWithYouDetector setNextScheduledAlarm:](self, "setNextScheduledAlarm:", v24);

        goto LABEL_20;
      }
      -[SAWithYouDetector _updateWithYouStatusOnAdvBufferEmptyEvent:](self, "_updateWithYouStatusOnAdvBufferEmptyEvent:", v4);
    }
LABEL_26:

    goto LABEL_27;
  }
  -[SAWithYouDetector _updateWithYouStatusIfNecessaryOnConnectionEvent:](self, "_updateWithYouStatusIfNecessaryOnConnectionEvent:", v43);
LABEL_27:
  if (-[SAWithYouDetector isInVehicularTravel](self, "isInVehicularTravel"))
  {
    -[SAWithYouDetector nextOpportunisticScanDate](self, "nextOpportunisticScanDate");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      objc_msgSend(v43, "getDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector nextOpportunisticScanDate](self, "nextOpportunisticScanDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "timeIntervalSinceDate:", v40);
      v42 = v41;

      if (v42 >= 0.0)
        -[SAWithYouDetector requestScanIfNeeded](self, "requestScanIfNeeded");
    }
  }

}

- (BOOL)isInVehicularTravel
{
  return self->_isInVehicularTravel;
}

- (SAWithYouDetector)initWithBluetoothScanner:(id)a3 locationRequester:(id)a4 deviceRecord:(id)a5 clock:(id)a6 analytics:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SAWithYouDetector *v17;
  SAWithYouDetector *v18;
  SAWithYouDetector *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDate *nextOpportunisticScanDate;
  void *v27;
  uint64_t v28;
  NSDate *initializationTime;
  NSMutableSet *v30;
  NSMutableSet *relevantDevicesToFindDuringLongScan;
  NSMutableDictionary *v32;
  NSMutableDictionary *foundDevicesDuringCurrentScan;
  NSDate *lastRelevantDeviceFoundTime;
  NSDate *lastExtraHELEFoundTime;
  NSDate *lastExtraNonHELEFoundTime;
  id v38;
  objc_super v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)SAWithYouDetector;
  v17 = -[SAWithYouDetector init](&v39, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_6;
  v19 = 0;
  if (v14 && v12 && v15)
  {
    -[SAWithYouDetector setClock:](v17, "setClock:", v15);
    -[SAWithYouDetector setBluetoothScanner:](v18, "setBluetoothScanner:", v12);
    -[SAWithYouDetector setLocationRequester:](v18, "setLocationRequester:", v13);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector setClients:](v18, "setClients:", v20);

    -[SAWithYouDetector setDeviceRecord:](v18, "setDeviceRecord:", v14);
    -[SAWithYouDetector setLongScanIsOngoing:](v18, "setLongScanIsOngoing:", 0);
    -[SAWithYouDetector setRequestedShortScan:](v18, "setRequestedShortScan:", 0);
    -[SAWithYouDetector setLastStartOfScan:](v18, "setLastStartOfScan:", 0);
    -[SAWithYouDetector setLastEndOfScan:](v18, "setLastEndOfScan:", 0);
    v21 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[SAWithYouDetector clock](v18, "clock");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "getCurrentTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithTimeInterval:sinceDate:", v23, 30.0);
    objc_msgSend(v15, "setupAlarmFireAt:forClient:", v24, v18);
    v38 = v16;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector setNextScheduledAlarm:](v18, "setNextScheduledAlarm:", v25);

    -[SAWithYouDetector setLastLongScanRequest:](v18, "setLastLongScanRequest:", 0);
    -[SAWithYouDetector setIsNotifyWhileTravelingEnabled:](v18, "setIsNotifyWhileTravelingEnabled:", 1);
    -[SAWithYouDetector setPreviousBufferEmptyTime:](v18, "setPreviousBufferEmptyTime:", 0);
    *(_WORD *)&v18->_isPeriodicScansNeeded = 0;
    nextOpportunisticScanDate = v18->_nextOpportunisticScanDate;
    v18->_nextOpportunisticScanDate = 0;

    -[SAWithYouDetector clock](v18, "clock");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "getCurrentTime");
    v28 = objc_claimAutoreleasedReturnValue();
    initializationTime = v18->_initializationTime;
    v18->_initializationTime = (NSDate *)v28;

    v16 = v38;
    v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    relevantDevicesToFindDuringLongScan = v18->_relevantDevicesToFindDuringLongScan;
    v18->_relevantDevicesToFindDuringLongScan = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    foundDevicesDuringCurrentScan = v18->_foundDevicesDuringCurrentScan;
    v18->_foundDevicesDuringCurrentScan = v32;

    -[SAWithYouDetector setIsFindingRelevantDevices:](v18, "setIsFindingRelevantDevices:", 0);
    lastRelevantDeviceFoundTime = v18->_lastRelevantDeviceFoundTime;
    v18->_lastRelevantDeviceFoundTime = 0;

    v18->_lastLongScanContext = 0;
    objc_storeStrong((id *)&v18->_analytics, a7);
    v18->_extraFoundHELECount = 0;
    v18->_extraFoundNonHELECount = 0;
    lastExtraHELEFoundTime = v18->_lastExtraHELEFoundTime;
    v18->_lastExtraHELEFoundTime = 0;

    lastExtraNonHELEFoundTime = v18->_lastExtraNonHELEFoundTime;
    v18->_lastExtraNonHELEFoundTime = 0;

LABEL_6:
    v19 = v18;
  }

  return v19;
}

- (void)sendScanContextToCoreAnalytics:(unint64_t)a3 isPartOfLongScan:(BOOL)a4 scanDuration:(double)a5 relevantOnlyScanDuration:(double)a6 foundExtraHELECount:(unint64_t)a7 extraHELEScanDuration:(double)a8 foundExtraNonHELECount:(unint64_t)a9 extraNonHELEScanDuration:(double)a10 longScanContext:(unint64_t)a11
{
  _BOOL8 v14;
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
  _QWORD v31[9];
  _QWORD v32[11];

  v14 = a4;
  v32[9] = *MEMORY[0x1E0C80C00];
  v31[0] = CFSTR("scanType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v19;
  v31[1] = CFSTR("isPartOfLongScan");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v20;
  v31[2] = CFSTR("scanDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v21;
  v31[3] = CFSTR("relevantOnlyScanDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v22;
  v31[4] = CFSTR("foundExtraHELECount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v23;
  v31[5] = CFSTR("extraHELEScanDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v24;
  v31[6] = CFSTR("foundExtraNonHELECount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v25;
  v31[7] = CFSTR("extraNonHELEScanDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v26;
  v31[8] = CFSTR("longScanContext");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAWithYouDetector analytics](self, "analytics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "submitEvent:content:", CFSTR("com.apple.clx.separationalerts.scan"), v28);

}

- (BOOL)allRelevantDevicesToFindAreFound
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v14 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68289283;
            v20 = 0;
            v21 = 2082;
            v22 = "";
            v23 = 2113;
            v24 = v9;
            _os_log_impl(&dword_1CA04F000, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou at least one device not found yet\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }

          return 0;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      if (v6)
        continue;
      break;
    }
  }

  v12 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou all devices found\"}", buf, 0x12u);
  }
  return 1;
}

- (BOOL)allSAEnabledDevicesAreFound
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SAWithYouDetector deviceRecord](self, "deviceRecord", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        -[SAWithYouDetector deviceRecord](self, "deviceRecord");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "getSADevice:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v17 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68289283;
              v24 = 0;
              v25 = 2082;
              v26 = "";
              v27 = 2113;
              v28 = v9;
              _os_log_impl(&dword_1CA04F000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou at least one sa enabled device not found yet\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
            }

            return 0;
          }
        }
        else
        {

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v6)
        continue;
      break;
    }
  }

  v15 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou all sa enabled devices found\"}", buf, 0x12u);
  }
  return 1;
}

- (void)forceUpdateWithYouStatus
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[SAWithYouDetector longScanIsOngoing](self, "longScanIsOngoing"))
  {
    -[SAWithYouDetector setLongScanIsOngoing:](self, "setLongScanIsOngoing:", 1);
    -[SAWithYouDetector setRequestedShortScan:](self, "setRequestedShortScan:", 1);
    v3 = -[SAWithYouDetector _isOnlyMonitoringLeashOnlyDevices](self, "_isOnlyMonitoringLeashOnlyDevices");
    v4 = TASALog;
    v5 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v10 = 68289026;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        _os_log_impl(&dword_1CA04F000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou skip requesting scan - leash-only\"}", (uint8_t *)&v10, 0x12u);
      }
      v6 = objc_alloc(MEMORY[0x1E0DC0838]);
      -[SAWithYouDetector clock](self, "clock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getCurrentTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = (id)objc_msgSend(v6, "initWithState:date:", 1, v8);

      -[SAWithYouDetector _updateAllWithYouStatusOnScanEndedEvent:](self, "_updateAllWithYouStatusOnScanEndedEvent:", WeakRetained);
    }
    else
    {
      if (v5)
      {
        v10 = 68289026;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        _os_log_impl(&dword_1CA04F000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou requesting scan to force update withyou status\"}", (uint8_t *)&v10, 0x12u);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothScanner);
      objc_msgSend(WeakRetained, "requestBluetoothScanForTypes:", 2);
    }

  }
}

- (void)forceUpdateWithYouStatusToFindDevices:(id)a3 withContext:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t buf;
  __int16 v40;
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v8 = v7;
    +[SAWithYouDetector convertSAWithYouLongScanContextToString:](SAWithYouDetector, "convertSAWithYouLongScanContextToString:", a4);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    buf = 68289539;
    v40 = 2082;
    v41 = "";
    v42 = 2113;
    v43 = v6;
    v44 = 2081;
    v45 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou force update to find devices\", \"device list\":\"%{private}@\", \"context\":\"%{private}s\"}", (uint8_t *)&buf, 0x26u);

  }
  -[SAWithYouDetector setLastLongScanContext:](self, "setLastLongScanContext:", a4);
  if (-[SAWithYouDetector _isOnlyMonitoringLeashOnlyDevices](self, "_isOnlyMonitoringLeashOnlyDevices"))
    goto LABEL_31;
  -[SAWithYouDetector forceUpdateWithYouStatusWithShortScan:](self, "forceUpdateWithYouStatusWithShortScan:", 1);
  -[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v6);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((-[SADeviceRecord getConnectionState:](self->_deviceRecord, "getConnectionState:", v16, (_QWORD)v34) & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAWithYouDetector _updateLastWithYouDateAndLocation:forCurrentDate:](self, "_updateLastWithYouDateAndLocation:forCurrentDate:", v16, v17);

          -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v16);

            -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAWithYouDetector setLastRelevantDeviceFoundTime:](self, "setLastRelevantDeviceFoundTime:", v22);

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v13);
  }

  v23 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v24 = v23;
    -[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 68289539;
    v40 = 2082;
    v41 = "";
    v42 = 2113;
    v43 = v25;
    v44 = 2113;
    v45 = (uint64_t)v26;
    _os_log_impl(&dword_1CA04F000, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou devices to find\", \"devices to find\":\"%{private}@\", \"devices found\":\"%{private}@\"}", (uint8_t *)&buf, 0x26u);

  }
  if (!-[SAWithYouDetector allRelevantDevicesToFindAreFound](self, "allRelevantDevicesToFindAreFound", (_QWORD)v34))
  {
    -[SAWithYouDetector setIsFindingRelevantDevices:](self, "setIsFindingRelevantDevices:", 1);
    v32 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      buf = 68289026;
      v40 = 2082;
      v41 = "";
      v33 = "{\"msg%{public}.0s\":\"#sa #withyou some remaining devices to find, requesting long aggressive scan if not a"
            "lready ongoing\"}";
LABEL_30:
      _os_log_impl(&dword_1CA04F000, v32, OS_LOG_TYPE_DEBUG, v33, (uint8_t *)&buf, 0x12u);
    }
LABEL_31:
    -[SAWithYouDetector forceUpdateWithYouStatus](self, "forceUpdateWithYouStatus");
    goto LABEL_32;
  }
  if (-[SAWithYouDetector isFindingRelevantDevices](self, "isFindingRelevantDevices"))
  {
    -[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeAllObjects");

    v28 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v40 = 2082;
      v41 = "";
      _os_log_impl(&dword_1CA04F000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou no more devices to find, recording time of last device found for metrics\"}", (uint8_t *)&buf, 0x12u);
    }
    -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector setLastRelevantDeviceFoundTime:](self, "setLastRelevantDeviceFoundTime:", v29);

    -[SAWithYouDetector setIsFindingRelevantDevices:](self, "setIsFindingRelevantDevices:", 0);
  }
  if (!-[SAWithYouDetector allSAEnabledDevicesAreFound](self, "allSAEnabledDevicesAreFound"))
  {
    v32 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      buf = 68289026;
      v40 = 2082;
      v41 = "";
      v33 = "{\"msg%{public}.0s\":\"#sa #withyou some remaining sa enabled devices to find, requesting long aggressive sc"
            "an if not already ongoing\"}";
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  if (-[SAWithYouDetector longScanIsOngoing](self, "longScanIsOngoing"))
  {
    v30 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v40 = 2082;
      v41 = "";
      _os_log_impl(&dword_1CA04F000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou no more sa enabled devices to find while long scan is ongoing, requesting to stop long aggressive scan\"}", (uint8_t *)&buf, 0x12u);
    }
    -[SAWithYouDetector setLongScanIsOngoing:](self, "setLongScanIsOngoing:", 0);
    -[SAWithYouDetector bluetoothScanner](self, "bluetoothScanner");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stopLongAggressiveScan");

  }
LABEL_32:

}

- (void)forceUpdateWithYouStatusWithShortScan:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  int v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[SAWithYouDetector lastLongScanRequest](self, "lastLongScanRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && v3)
  {
    -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector setLastLongScanRequest:](self, "setLastLongScanRequest:", v6);

    -[SAWithYouDetector lastLongScanRequest](self, "lastLongScanRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[SAWithYouDetector setLastExtraHELEFoundTime:](self, "setLastExtraHELEFoundTime:", v8);

    -[SAWithYouDetector lastLongScanRequest](self, "lastLongScanRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[SAWithYouDetector setLastExtraNonHELEFoundTime:](self, "setLastExtraNonHELEFoundTime:", v10);

  }
  if (!-[SAWithYouDetector requestedShortScan](self, "requestedShortScan"))
  {
    -[SAWithYouDetector setRequestedShortScan:](self, "setRequestedShortScan:", 1);
    v11 = -[SAWithYouDetector _isOnlyMonitoringLeashOnlyDevices](self, "_isOnlyMonitoringLeashOnlyDevices");
    v12 = TASALog;
    v13 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v20 = 68289026;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou skip requesting short scan - leash-only\"}", (uint8_t *)&v20, 0x12u);
      }
      v14 = objc_alloc(MEMORY[0x1E0DC0838]);
      -[SAWithYouDetector clock](self, "clock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getCurrentTime");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithState:date:", 1, v16);

      -[SAWithYouDetector _updateAllWithYouStatusOnScanEndedEvent:](self, "_updateAllWithYouStatusOnScanEndedEvent:", v17);
      goto LABEL_13;
    }
    if (v13)
    {
      v20 = 68289026;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou requesting short scan to force update withyou status\"}", (uint8_t *)&v20, 0x12u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothScanner);
    objc_msgSend(WeakRetained, "requestBluetoothScanForTypes:", 1);

    -[SAWithYouDetector sendScanContextToCoreAnalytics:isPartOfLongScan:scanDuration:relevantOnlyScanDuration:foundExtraHELECount:extraHELEScanDuration:foundExtraNonHELECount:extraNonHELEScanDuration:longScanContext:](self, "sendScanContextToCoreAnalytics:isPartOfLongScan:scanDuration:relevantOnlyScanDuration:foundExtraHELECount:extraHELEScanDuration:foundExtraNonHELECount:extraNonHELEScanDuration:longScanContext:", 1, v3, 0, 0, 0, 6.0, 0.0, 0.0, 0.0);
    if (!v3)
    {
      -[SAWithYouDetector analytics](self, "analytics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addScanDuration:", 6.0);

      -[SAWithYouDetector analytics](self, "analytics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addScanDurationForFindingRelevantItemsOnly:", 6.0);
LABEL_13:

    }
  }
}

- (BOOL)_isOnlyMonitoringLeashOnlyDevices
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SADeviceRecord getAllUUIDs](self->_deviceRecord, "getAllUUIDs");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 && !-[SAWithYouDetector _deviceIsWatch:](self, "_deviceIsWatch:", v8))
        {
          v10 = 0;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (void)resetAllWithYouStatusAndScanStates
{
  -[SADeviceRecord resetAllWithYouStatus](self->_deviceRecord, "resetAllWithYouStatus");
  -[SAWithYouDetector setLongScanIsOngoing:](self, "setLongScanIsOngoing:", 0);
  -[SAWithYouDetector setRequestedShortScan:](self, "setRequestedShortScan:", 0);
  -[SAWithYouDetector setLastStartOfScan:](self, "setLastStartOfScan:", 0);
  -[SAWithYouDetector setLastEndOfScan:](self, "setLastEndOfScan:", 0);
  -[SAWithYouDetector setPreviousBufferEmptyTime:](self, "setPreviousBufferEmptyTime:", 0);
  -[SAWithYouDetector setIsFindingRelevantDevices:](self, "setIsFindingRelevantDevices:", 0);
  -[SAWithYouDetector setLastRelevantDeviceFoundTime:](self, "setLastRelevantDeviceFoundTime:", 0);
  -[SAWithYouDetector setLastLongScanContext:](self, "setLastLongScanContext:", 0);
  -[SAWithYouDetector setExtraFoundHELECount:](self, "setExtraFoundHELECount:", 0);
  -[SAWithYouDetector setExtraFoundNonHELECount:](self, "setExtraFoundNonHELECount:", 0);
  -[SAWithYouDetector setLastExtraHELEFoundTime:](self, "setLastExtraHELEFoundTime:", 0);
  -[SAWithYouDetector setLastExtraNonHELEFoundTime:](self, "setLastExtraNonHELEFoundTime:", 0);
}

- (unint64_t)statusForDeviceWithUUID:(id)a3
{
  return -[SADeviceRecord getWithYouStatus:](self->_deviceRecord, "getWithYouStatus:", a3);
}

- (BOOL)isPeriodicScansAllowed
{
  _BOOL4 v3;

  v3 = -[SAWithYouDetector isNotifyWhileTravelingEnabled](self, "isNotifyWhileTravelingEnabled");
  if (v3)
    LOBYTE(v3) = -[SAWithYouDetector isPeriodicScansNeeded](self, "isPeriodicScansNeeded");
  return v3;
}

- (void)resumePeriodicScan
{
  -[SAWithYouDetector setIsPeriodicScansNeeded:](self, "setIsPeriodicScansNeeded:", 1);
  -[SAWithYouDetector requestScanIfNeeded](self, "requestScanIfNeeded");
}

- (void)pausePeriodicScan
{
  -[SAWithYouDetector setIsPeriodicScansNeeded:](self, "setIsPeriodicScansNeeded:", 0);
}

- (void)addClient:(id)a3
{
  -[NSHashTable addObject:](self->_clients, "addObject:", a3);
}

- (void)removeClient:(id)a3
{
  -[NSHashTable removeObject:](self->_clients, "removeObject:", a3);
}

- (void)_notifyAllClientsOfWithYouStatusUpdate:(unint64_t)a3 forDeviceWithUUID:(id)a4
{
  id v6;
  unint64_t v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[SAWithYouDetector statusForDeviceWithUUID:](self, "statusForDeviceWithUUID:", v6);
  -[SADeviceRecord updatedWithYouStatusFrom:to:forDeviceWithUUID:](self->_deviceRecord, "updatedWithYouStatusFrom:to:forDeviceWithUUID:", v7, a3, v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_clients;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updatedWithYouStatusFrom:to:forDeviceWithUUID:", v7, a3, v6, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_updateWithYouStatusIfNecessaryOnConnectionEvent:(id)a3
{
  id v4;
  SADeviceRecord *deviceRecord;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _DWORD v22[2];
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  deviceRecord = self->_deviceRecord;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADeviceRecord getSADevice:](deviceRecord, "getSADevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SAWithYouDetector statusForDeviceWithUUID:](self, "statusForDeviceWithUUID:", v8);

    v10 = objc_msgSend(v4, "state");
    if ((unint64_t)(v10 - 2) >= 2)
    {
      if (v10 != 1)
        goto LABEL_12;
      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SAWithYouDetector _deviceIsWatch:](self, "_deviceIsWatch:", v14);

      if (v15)
        v13 = 2;
      else
        v13 = 4;
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector _updateLastWithYouDateAndLocation:forCurrentDate:](self, "_updateLastWithYouDateAndLocation:forCurrentDate:", v11, v12);

      v13 = 1;
    }
    if (v9 != v13)
    {
      v16 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        objc_msgSend(v4, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = 68289795;
        v22[1] = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = v18;
        v27 = 2113;
        v28 = v19;
        v29 = 2113;
        v30 = v20;
        _os_log_impl(&dword_1CA04F000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated connection state changed\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", (uint8_t *)v22, 0x30u);

      }
      objc_msgSend(v4, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector _notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:](self, "_notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:", v13, v21);

    }
  }
LABEL_12:

}

- (double)_maxAgeOfWithYouAdvertisementForDeviceUUID:(id)a3
{
  SADeviceRecord *deviceRecord;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  double v10;

  deviceRecord = self->_deviceRecord;
  v5 = a3;
  -[SADeviceRecord getSADevice:](deviceRecord, "getSADevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceType");
  v8 = -[SADeviceRecord getMonitoringSessionState:](self->_deviceRecord, "getMonitoringSessionState:", v5);

  if (!objc_msgSend(v6, "isAppleAudioAccessory"))
    goto LABEL_9;
  if (v8 > 4 || ((1 << v8) & 0x1A) == 0)
  {
    if (v7 == 16)
    {
      v10 = 120.0;
      goto LABEL_10;
    }
LABEL_9:
    v10 = 30.0;
    goto LABEL_10;
  }
  v10 = 360.0;
LABEL_10:

  return v10;
}

- (void)_updateLastWithYouDateAndLocation:(id)a3 forCurrentDate:(id)a4
{
  SADeviceRecord *deviceRecord;
  id v7;

  deviceRecord = self->_deviceRecord;
  v7 = a3;
  -[SADeviceRecord updateLastWithYouDate:forDeviceWithUUID:](deviceRecord, "updateLastWithYouDate:forDeviceWithUUID:", a4, v7);
  -[SADeviceRecord updateLastWithYouLocation:forDeviceWithUUID:](self->_deviceRecord, "updateLastWithYouLocation:forDeviceWithUUID:", 0, v7);

}

- (BOOL)_isRecentEnoughAdvertisement:(id)a3 forCurrentDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "scanDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = v9;

  objc_msgSend(v7, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAWithYouDetector _maxAgeOfWithYouAdvertisementForDeviceUUID:](self, "_maxAgeOfWithYouAdvertisementForDeviceUUID:", v11);
  LOBYTE(v7) = v10 <= v12;

  return (char)v7;
}

- (BOOL)isExtraDeviceFound:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  if (-[SAWithYouDetector isFindingRelevantDevices](self, "isFindingRelevantDevices")
    || (-[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", v6),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 0;
  }
  else
  {
    -[SAWithYouDetector lastStartOfScan](self, "lastStartOfScan");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingTimeInterval:", 7.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SAWithYouDetector lastRelevantDeviceFoundTime](self, "lastRelevantDeviceFoundTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[SAWithYouDetector lastRelevantDeviceFoundTime](self, "lastRelevantDeviceFoundTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "laterDate:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
    if (objc_msgSend(v12, "compare:", v7) == -1)
    {
      -[SAWithYouDetector deviceRecord](self, "deviceRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "getMonitoringSessionState:", v6);

      -[SAWithYouDetector deviceRecord](self, "deviceRecord");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "getScenarioClass:", v6);

      v10 = v17 == 2 && (v19 & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)updateExtraDeviceInformation:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SAWithYouDetector deviceRecord](self, "deviceRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSADevice:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceType");

  if (v6 == 16)
  {
    -[SAWithYouDetector setExtraFoundHELECount:](self, "setExtraFoundHELECount:", -[SAWithYouDetector extraFoundHELECount](self, "extraFoundHELECount") + 1);
    -[SAWithYouDetector lastExtraHELEFoundTime](self, "lastExtraHELEFoundTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "laterDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector setLastExtraHELEFoundTime:](self, "setLastExtraHELEFoundTime:", v10);
  }
  else
  {
    -[SAWithYouDetector setExtraFoundNonHELECount:](self, "setExtraFoundNonHELECount:", -[SAWithYouDetector extraFoundNonHELECount](self, "extraFoundNonHELECount") + 1);
    -[SAWithYouDetector lastExtraNonHELEFoundTime](self, "lastExtraNonHELEFoundTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "laterDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector setLastExtraNonHELEFoundTime:](self, "setLastExtraNonHELEFoundTime:", v10);
  }

}

- (void)_deviceWithUUID:(id)a3 isWithYouDuringLongScanOnAdvertisement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
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
  -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SAWithYouDetector lastStartOfScan](self, "lastStartOfScan");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_4;
    v11 = (void *)v10;
    objc_msgSend(v7, "getDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector lastStartOfScan](self, "lastStartOfScan");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v13);
    v15 = v14;

    if (v15 >= 0.0)
    {
LABEL_4:
      v16 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        v32 = 68289283;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2113;
        v37 = v6;
        _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou found new device\", \"uuid\":\"%{private}@\"}", (uint8_t *)&v32, 0x1Cu);
      }
      objc_msgSend(v7, "getDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v6);

      objc_msgSend(v7, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SAWithYouDetector isExtraDeviceFound:onDate:](self, "isExtraDeviceFound:onDate:", v19, v20);

      if (v21)
      {
        objc_msgSend(v7, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAWithYouDetector updateExtraDeviceInformation:](self, "updateExtraDeviceInformation:", v22);

      }
    }
    v23 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      v24 = v23;
      -[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 68289539;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v25;
      v38 = 2113;
      v39 = v26;
      _os_log_impl(&dword_1CA04F000, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou devices to find\", \"devices to find\":\"%{private}@\", \"devices found\":\"%{private}@\"}", (uint8_t *)&v32, 0x26u);

    }
    if (-[SAWithYouDetector isFindingRelevantDevices](self, "isFindingRelevantDevices")
      && -[SAWithYouDetector allRelevantDevicesToFindAreFound](self, "allRelevantDevicesToFindAreFound"))
    {
      -[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeAllObjects");

      v28 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 68289026;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        _os_log_impl(&dword_1CA04F000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou no more devices to find while long scan is ongoing, recording time of last device found for metrics\"}", (uint8_t *)&v32, 0x12u);
      }
      -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector setLastRelevantDeviceFoundTime:](self, "setLastRelevantDeviceFoundTime:", v29);

      -[SAWithYouDetector setIsFindingRelevantDevices:](self, "setIsFindingRelevantDevices:", 0);
    }
    if (-[SAWithYouDetector allSAEnabledDevicesAreFound](self, "allSAEnabledDevicesAreFound"))
    {
      v30 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 68289026;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        _os_log_impl(&dword_1CA04F000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou no more sa enabled devices to find while long scan is ongoing, requesting to stop long aggressive scan\"}", (uint8_t *)&v32, 0x12u);
      }
      -[SAWithYouDetector setLongScanIsOngoing:](self, "setLongScanIsOngoing:", 0);
      -[SAWithYouDetector bluetoothScanner](self, "bluetoothScanner");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stopLongAggressiveScan");

    }
  }

}

- (void)_updateWithYouStatusIfNecessaryOnAdvertisement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  SADeviceRecord *deviceRecord;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _DWORD v25[2];
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    deviceRecord = self->_deviceRecord;
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SADeviceRecord getSADevice:](deviceRecord, "getSADevice:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scanDate");
      v11 = objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector _updateLastWithYouDateAndLocation:forCurrentDate:](self, "_updateLastWithYouDateAndLocation:forCurrentDate:", v10, v11);

      objc_msgSend(v4, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = -[SAWithYouDetector _deviceIsWatch:](self, "_deviceIsWatch:", v12);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(v4, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SAWithYouDetector statusForDeviceWithUUID:](self, "statusForDeviceWithUUID:", v13);

        -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[SAWithYouDetector _isRecentEnoughAdvertisement:forCurrentDate:](self, "_isRecentEnoughAdvertisement:forCurrentDate:", v4, v15);

        v17 = v16;
        if (-[SAWithYouDetector longScanIsOngoing](self, "longScanIsOngoing") && v16)
        {
          objc_msgSend(v4, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAWithYouDetector _deviceWithUUID:isWithYouDuringLongScanOnAdvertisement:](self, "_deviceWithUUID:isWithYouDuringLongScanOnAdvertisement:", v18, v4);

        }
        if (v17 && v14 != v17)
        {
          v19 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v19;
            objc_msgSend(v4, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v14);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = 68289795;
            v25[1] = 0;
            v26 = 2082;
            v27 = "";
            v28 = 2113;
            v29 = v21;
            v30 = 2113;
            v31 = v22;
            v32 = 2113;
            v33 = v23;
            _os_log_impl(&dword_1CA04F000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated observed advertisement\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", (uint8_t *)v25, 0x30u);

          }
          objc_msgSend(v4, "uuid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAWithYouDetector _notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:](self, "_notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:", 1, v24);

        }
        -[SAWithYouDetector _updateWithYouStatusOfRelatedDevices:](self, "_updateWithYouStatusOfRelatedDevices:", v4);
      }
    }
  }

}

- (void)_updateWithYouStatusOfRelatedDevices:(id)a3
{
  id v4;
  SADeviceRecord *deviceRecord;
  void *v6;
  void *v7;
  unint64_t v8;
  __int128 v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  __int128 v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  deviceRecord = self->_deviceRecord;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADeviceRecord getRelatedDevices:](deviceRecord, "getRelatedDevices:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "count");
    v10 = v8;
    if (v8 > 3)
    {
      v29 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        v30 = v29;
        objc_msgSend(v4, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68289539;
        v34 = 0;
        v35 = 2082;
        v36 = "";
        v37 = 2113;
        v38 = v31;
        v39 = 2049;
        v40 = v10;
        _os_log_impl(&dword_1CA04F000, v30, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#sa #withyou detected a device with more than maximum allowable related beacons\", \"uuid\":\"%{private}@\", \"count\":%{private}ld}", buf, 0x26u);

      }
    }
    else if (v8)
    {
      v11 = 0;
      *(_QWORD *)&v9 = 68289795;
      v32 = v9;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v11, v32);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAWithYouDetector deviceRecord](self, "deviceRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "getSADevice:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "partIdentifier");

        -[SAWithYouDetector deviceRecord](self, "deviceRecord");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "getSADevice:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "partIdentifier");

        if (-[SAWithYouDetector _isValidPartID:](self, "_isValidPartID:", v16)
          && -[SAWithYouDetector _isValidPartID:](self, "_isValidPartID:", v19)
          && v19 != v16)
        {
          v20 = v19 <= v16 ? v19 - v16 + 3 : v19 + ~v16;
          if (-[SAWithYouDetector _isStatusBitSetForRelatedDeviceWithShiftIndex:fromAdvertisement:](self, "_isStatusBitSetForRelatedDeviceWithShiftIndex:fromAdvertisement:", v20, v4))
          {
            objc_msgSend(v4, "scanDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAWithYouDetector _updateLastWithYouDateAndLocation:forCurrentDate:](self, "_updateLastWithYouDateAndLocation:forCurrentDate:", v12, v21);

            v22 = -[SAWithYouDetector statusForDeviceWithUUID:](self, "statusForDeviceWithUUID:", v12);
            -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[SAWithYouDetector _isRecentEnoughAdvertisement:forCurrentDate:](self, "_isRecentEnoughAdvertisement:forCurrentDate:", v4, v23);

            -[SADeviceRecord updateLatestAdvertisement:forDeviceWithUUID:](self->_deviceRecord, "updateLatestAdvertisement:forDeviceWithUUID:", v4, v12);
            if (-[SAWithYouDetector longScanIsOngoing](self, "longScanIsOngoing") && v24)
              -[SAWithYouDetector _deviceWithUUID:isWithYouDuringLongScanOnAdvertisement:](self, "_deviceWithUUID:isWithYouDuringLongScanOnAdvertisement:", v12, v4);
            if (v24 && v22 != v24)
            {
              v25 = (void *)TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                v26 = v25;
                +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v22);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", 1);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v32;
                v34 = 0;
                v35 = 2082;
                v36 = "";
                v37 = 2113;
                v38 = v12;
                v39 = 2113;
                v40 = (unint64_t)v27;
                v41 = 2113;
                v42 = v28;
                _os_log_impl(&dword_1CA04F000, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated observed advertisement from related device\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", buf, 0x30u);

              }
              -[SAWithYouDetector _notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:](self, "_notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:", 1, v12);
            }
          }
        }

        ++v11;
      }
      while (v10 != v11);
    }
  }

}

- (BOOL)_isValidPartID:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

- (BOOL)_isStatusBitSetForRelatedDeviceWithShiftIndex:(unint64_t)a3 fromAdvertisement:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  int v9;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3 < 3)
  {
    v9 = dword_1CA0805A8[a3];
    v8 = (objc_msgSend(v5, "status") >> v9) & 1;
  }
  else
  {
    v7 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
    {
      v11[0] = 68289026;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#sa #withyou trying to get status bit of related device at out of bound index\"}", (uint8_t *)v11, 0x12u);
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)_finalizeToBeVerifiedStatus:(unint64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3 != 3)
    v3 = a3;
  if (a3 == 4)
    return 2;
  else
    return v3;
}

- (BOOL)_enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:(id)a3
{
  SADeviceRecord *deviceRecord;
  id v5;
  void *v6;
  unint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;

  deviceRecord = self->_deviceRecord;
  v5 = a3;
  -[SADeviceRecord getSADevice:](deviceRecord, "getSADevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SADeviceRecord getMonitoringSessionState:](self->_deviceRecord, "getMonitoringSessionState:", v5);

  if (!objc_msgSend(v6, "isAppleAudioAccessory"))
    goto LABEL_10;
  if (v7 > 4 || ((1 << v7) & 0x1A) == 0)
  {
    if (objc_msgSend(v6, "deviceType") == 16)
    {
      -[SAWithYouDetector clock](self, "clock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getCurrentTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector initializationTime](self, "initializationTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v11);
      v13 = 120.0;
      goto LABEL_7;
    }
LABEL_10:
    v14 = 1;
    goto LABEL_11;
  }
  -[SAWithYouDetector clock](self, "clock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getCurrentTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAWithYouDetector initializationTime](self, "initializationTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = 360.0;
LABEL_7:
  v14 = v12 >= v13;

LABEL_11:
  return v14;
}

- (void)_updateAllWithYouStatusOnScanEndedEvent:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSHashTable *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  _BOOL4 v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  objc_msgSend(v42, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAWithYouDetector setLastEndOfScan:](self, "setLastEndOfScan:", v4);

  -[SADeviceRecord getAllUUIDs](self->_deviceRecord, "getAllUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  v41 = v5;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v9);
        -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = -[SADeviceRecord getConnectionState:](self->_deviceRecord, "getConnectionState:", v10);
          v13 = -[SAWithYouDetector statusForDeviceWithUUID:](self, "statusForDeviceWithUUID:", v10);
          if (-[SAWithYouDetector _deviceIsWatch:](self, "_deviceIsWatch:", v10))
          {
            if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              objc_msgSend(v42, "date");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[SAWithYouDetector _updateLastWithYouDateAndLocation:forCurrentDate:](self, "_updateLastWithYouDateAndLocation:forCurrentDate:", v10, v14);

              v17 = 1;
            }
            else
            {
              v17 = 2;
            }
            goto LABEL_24;
          }
          if ((v12 & 0xFFFFFFFFFFFFFFFELL) != 2)
          {
            -[SADeviceRecord getLatestAdvertisement:](self->_deviceRecord, "getLatestAdvertisement:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              if (-[SAWithYouDetector _enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:](self, "_enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:", v10))
              {
                v16 = 2;
              }
              else
              {
                v16 = v13;
              }
              goto LABEL_23;
            }
            -[SAWithYouDetector lastStartOfScan](self, "lastStartOfScan");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v13;
            if (v19)
            {
              -[SADeviceRecord getLatestAdvertisement:](self->_deviceRecord, "getLatestAdvertisement:", v10);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "scanDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[SAWithYouDetector lastStartOfScan](self, "lastStartOfScan");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "timeIntervalSinceDate:", v22);
              if (v23 >= 0.0)
              {

              }
              else
              {
                -[SADeviceRecord getLatestAdvertisement:](self->_deviceRecord, "getLatestAdvertisement:", v10);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "date");
                v40 = v20;
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = -[SAWithYouDetector _isRecentEnoughAdvertisement:forCurrentDate:](self, "_isRecentEnoughAdvertisement:forCurrentDate:", v24, v25);

                v5 = v41;
                if (!v39)
                {
                  v16 = 2;
                  goto LABEL_23;
                }
              }
LABEL_14:
              v16 = 1;
            }
LABEL_23:
            v17 = -[SAWithYouDetector _finalizeToBeVerifiedStatus:](self, "_finalizeToBeVerifiedStatus:", v16);
LABEL_24:
            if (v13 != v17 && v17 != 0)
            {
              v27 = (void *)TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                v28 = v27;
                +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v13);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v17);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 68289795;
                v53 = 0;
                v54 = 2082;
                v55 = "";
                v56 = 2113;
                v57 = v10;
                v58 = 2113;
                v59 = v29;
                v60 = 2113;
                v61 = v30;
                _os_log_impl(&dword_1CA04F000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated end of scan\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", buf, 0x30u);

                v5 = v41;
              }
              -[SAWithYouDetector _notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:](self, "_notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:", v17, v10);
            }
            goto LABEL_31;
          }
          objc_msgSend(v42, "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAWithYouDetector _updateLastWithYouDateAndLocation:forCurrentDate:](self, "_updateLastWithYouDateAndLocation:forCurrentDate:", v10, v15);

          goto LABEL_14;
        }
LABEL_31:
        ++v9;
      }
      while (v7 != v9);
      v31 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      v7 = v31;
    }
    while (v31);
  }
  -[SAWithYouDetector foundDevicesDuringCurrentScan](self, "foundDevicesDuringCurrentScan");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "removeAllObjects");

  -[SAWithYouDetector relevantDevicesToFindDuringLongScan](self, "relevantDevicesToFindDuringLongScan");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeAllObjects");

  -[SAWithYouDetector setIsFindingRelevantDevices:](self, "setIsFindingRelevantDevices:", 0);
  if (-[SAWithYouDetector longScanIsOngoing](self, "longScanIsOngoing")
    || -[SAWithYouDetector requestedShortScan](self, "requestedShortScan"))
  {
    -[SAWithYouDetector setLongScanIsOngoing:](self, "setLongScanIsOngoing:", 0);
    -[SAWithYouDetector setRequestedShortScan:](self, "setRequestedShortScan:", 0);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v34 = self->_clients;
    v35 = -[NSHashTable countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v44 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "didForceUpdateWithYouStatus");
        }
        v36 = -[NSHashTable countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v36);
    }

    v5 = v41;
  }
  -[SAWithYouDetector requestScanIfNeeded](self, "requestScanIfNeeded");

}

- (void)_updateWithYouStatusOnAdvBufferEmptyEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAWithYouDetector previousBufferEmptyTime](self, "previousBufferEmptyTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAWithYouDetector setPreviousBufferEmptyTime:](self, "setPreviousBufferEmptyTime:", v30);

    goto LABEL_28;
  }
  v31 = v4;
  -[SADeviceRecord getAllUUIDs](self->_deviceRecord, "getAllUUIDs");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (!v6)
    goto LABEL_26;
  v7 = v6;
  v8 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v34 != v8)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
      -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "deviceType");

        if (v13 == 16)
        {
          v14 = -[SAWithYouDetector statusForDeviceWithUUID:](self, "statusForDeviceWithUUID:", v10);
          -[SAWithYouDetector previousBufferEmptyTime](self, "previousBufferEmptyTime");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAWithYouDetector lastEndOfScan](self, "lastEndOfScan");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[SAWithYouDetector previousBufferEmptyTime](self, "previousBufferEmptyTime");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAWithYouDetector lastEndOfScan](self, "lastEndOfScan");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "laterDate:", v18);
            v19 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v19;
          }
          -[SADeviceRecord getLatestAdvertisement:](self->_deviceRecord, "getLatestAdvertisement:", v10);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20
            && (v21 = (void *)v20,
                -[SADeviceRecord getLatestAdvertisement:](self->_deviceRecord, "getLatestAdvertisement:", v10),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v23 = -[SAWithYouDetector _isRecentEnoughAdvertisement:forCurrentDate:](self, "_isRecentEnoughAdvertisement:forCurrentDate:", v22, v15), v22, v21, v23))
          {
            v24 = 1;
LABEL_18:
            if (v14 != v24 && v24)
            {
              v25 = (void *)TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                v26 = v25;
                +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v14);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                +[SAWithYouDetector convertSAWithYouStatusToString:](SAWithYouDetector, "convertSAWithYouStatusToString:", v24);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 68289795;
                v38 = 0;
                v39 = 2082;
                v40 = "";
                v41 = 2113;
                v42 = v10;
                v43 = 2113;
                v44 = v27;
                v45 = 2113;
                v46 = v28;
                _os_log_impl(&dword_1CA04F000, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated on adv buffer empty event\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", buf, 0x30u);

              }
              -[SAWithYouDetector _notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:](self, "_notifyAllClientsOfWithYouStatusUpdate:forDeviceWithUUID:", v24, v10);
            }
          }
          else if (v14 != 2)
          {
            if (-[SAWithYouDetector _enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:](self, "_enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:", v10))
            {
              v24 = 4;
            }
            else
            {
              v24 = v14;
            }
            goto LABEL_18;
          }

          continue;
        }
      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  }
  while (v7);
LABEL_26:
  v4 = v31;
  objc_msgSend(v31, "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAWithYouDetector setPreviousBufferEmptyTime:](self, "setPreviousBufferEmptyTime:", v29);

LABEL_28:
}

- (void)_scheduleNextAlarmForScanAfterDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[SAWithYouDetector isPeriodicScansAllowed](self, "isPeriodicScansAllowed"))
  {
    -[SAWithYouDetector nextScheduledAlarm](self, "nextScheduledAlarm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[SAWithYouDetector clock](self, "clock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector nextScheduledAlarm](self, "nextScheduledAlarm");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancelAlarmWithUUID:", v6);

      -[SAWithYouDetector setNextScheduledAlarm:](self, "setNextScheduledAlarm:", 0);
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v12, 300.0);
    v8 = -[SAWithYouDetector isInVehicularTravel](self, "isInVehicularTravel");
    v9 = v7;
    if (!v8)
    {
      -[SAWithYouDetector clock](self, "clock", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setupAlarmFireAt:forClient:", v7, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWithYouDetector setNextScheduledAlarm:](self, "setNextScheduledAlarm:", v11);

      v9 = 0;
    }
    -[SAWithYouDetector setNextOpportunisticScanDate:](self, "setNextOpportunisticScanDate:", v9);

  }
  else
  {
    -[SAWithYouDetector setNextOpportunisticScanDate:](self, "setNextOpportunisticScanDate:", 0);
  }

}

- (void)requestScanIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[SAWithYouDetector deviceRecord](self, "deviceRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[SAWithYouDetector setNextOpportunisticScanDate:](self, "setNextOpportunisticScanDate:", 0);
    return;
  }
  -[SAWithYouDetector lastEndOfScan](self, "lastEndOfScan");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_5;
  -[SAWithYouDetector clock](self, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v14);
  v9 = v8;

  if (v9 < 300.0)
  {
    v10 = 0;
  }
  else
  {
LABEL_5:
    -[SAWithYouDetector clock](self, "clock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getCurrentTime");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = 1;
    v14 = (id)v12;
  }
  if (-[SAWithYouDetector isPeriodicScansAllowed](self, "isPeriodicScansAllowed"))
  {
    -[SAWithYouDetector _scheduleNextAlarmForScanAfterDate:](self, "_scheduleNextAlarmForScanAfterDate:", v14);
    if (!v10)
      goto LABEL_13;
LABEL_11:
    -[SAWithYouDetector forceUpdateWithYouStatusWithShortScan:](self, "forceUpdateWithYouStatusWithShortScan:", 0);
    if (!-[SAWithYouDetector isInVehicularTravel](self, "isInVehicularTravel"))
    {
      -[SAWithYouDetector locationRequester](self, "locationRequester");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "requestLocationForType:", 0);

    }
    goto LABEL_13;
  }
  -[SAWithYouDetector setNextOpportunisticScanDate:](self, "setNextOpportunisticScanDate:", 0);
  if (v10)
    goto LABEL_11;
LABEL_13:

}

- (BOOL)_deviceIsWatch:(id)a3
{
  void *v3;
  BOOL v4;

  -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceType") == 8;

  return v4;
}

+ (id)convertSAWithYouStatusToString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E83D1100[a3 - 1];
}

+ (id)convertSAWithYouLongScanContextToString:(unint64_t)a3
{
  if (a3 - 1 > 9)
    return CFSTR("Unknown");
  else
    return off_1E83D1120[a3 - 1];
}

- (void)didChangeTravelTypeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5
{
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 68289539;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = v10;
    v17 = 2113;
    v18 = v11;
    _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou travel type change\", \"from\":\"%{private}@\", \"to\":\"%{private}@\"}", (uint8_t *)v12, 0x26u);

  }
  if (a4 == 2)
  {
    -[SAWithYouDetector setIsInVehicularTravel:](self, "setIsInVehicularTravel:", 0);
    if (-[SAWithYouDetector isPeriodicScansAllowed](self, "isPeriodicScansAllowed"))
      -[SAWithYouDetector requestScanIfNeeded](self, "requestScanIfNeeded");
  }
  else if (a4 == 1)
  {
    -[SAWithYouDetector setIsInVehicularTravel:](self, "setIsInVehicularTravel:", 1);
  }
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (SABluetoothScanRequestProtocol)bluetoothScanner
{
  return (SABluetoothScanRequestProtocol *)objc_loadWeakRetained((id *)&self->_bluetoothScanner);
}

- (void)setBluetoothScanner:(id)a3
{
  objc_storeWeak((id *)&self->_bluetoothScanner, a3);
}

- (SALocationRequestProtocol)locationRequester
{
  return (SALocationRequestProtocol *)objc_loadWeakRetained((id *)&self->_locationRequester);
}

- (void)setLocationRequester:(id)a3
{
  objc_storeWeak((id *)&self->_locationRequester, a3);
}

- (SAAnalyticsServiceProtocol)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (SADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRecord, a3);
}

- (BOOL)longScanIsOngoing
{
  return self->_longScanIsOngoing;
}

- (void)setLongScanIsOngoing:(BOOL)a3
{
  self->_longScanIsOngoing = a3;
}

- (BOOL)requestedShortScan
{
  return self->_requestedShortScan;
}

- (void)setRequestedShortScan:(BOOL)a3
{
  self->_requestedShortScan = a3;
}

- (NSDate)lastLongScanRequest
{
  return self->_lastLongScanRequest;
}

- (void)setLastLongScanRequest:(id)a3
{
  objc_storeStrong((id *)&self->_lastLongScanRequest, a3);
}

- (NSDate)lastStartOfScan
{
  return self->_lastStartOfScan;
}

- (void)setLastStartOfScan:(id)a3
{
  objc_storeStrong((id *)&self->_lastStartOfScan, a3);
}

- (NSDate)lastEndOfScan
{
  return self->_lastEndOfScan;
}

- (void)setLastEndOfScan:(id)a3
{
  objc_storeStrong((id *)&self->_lastEndOfScan, a3);
}

- (BOOL)isNotifyWhileTravelingEnabled
{
  return self->_isNotifyWhileTravelingEnabled;
}

- (void)setIsNotifyWhileTravelingEnabled:(BOOL)a3
{
  self->_isNotifyWhileTravelingEnabled = a3;
}

- (BOOL)isPeriodicScansNeeded
{
  return self->_isPeriodicScansNeeded;
}

- (void)setIsPeriodicScansNeeded:(BOOL)a3
{
  self->_isPeriodicScansNeeded = a3;
}

- (void)setIsInVehicularTravel:(BOOL)a3
{
  self->_isInVehicularTravel = a3;
}

- (NSDate)nextOpportunisticScanDate
{
  return self->_nextOpportunisticScanDate;
}

- (void)setNextOpportunisticScanDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextOpportunisticScanDate, a3);
}

- (NSUUID)nextScheduledAlarm
{
  return self->_nextScheduledAlarm;
}

- (void)setNextScheduledAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_nextScheduledAlarm, a3);
}

- (NSDate)previousBufferEmptyTime
{
  return self->_previousBufferEmptyTime;
}

- (void)setPreviousBufferEmptyTime:(id)a3
{
  objc_storeStrong((id *)&self->_previousBufferEmptyTime, a3);
}

- (NSDate)initializationTime
{
  return self->_initializationTime;
}

- (void)setInitializationTime:(id)a3
{
  objc_storeStrong((id *)&self->_initializationTime, a3);
}

- (NSMutableSet)relevantDevicesToFindDuringLongScan
{
  return self->_relevantDevicesToFindDuringLongScan;
}

- (void)setRelevantDevicesToFindDuringLongScan:(id)a3
{
  objc_storeStrong((id *)&self->_relevantDevicesToFindDuringLongScan, a3);
}

- (NSMutableDictionary)foundDevicesDuringCurrentScan
{
  return self->_foundDevicesDuringCurrentScan;
}

- (void)setFoundDevicesDuringCurrentScan:(id)a3
{
  objc_storeStrong((id *)&self->_foundDevicesDuringCurrentScan, a3);
}

- (BOOL)isFindingRelevantDevices
{
  return self->_isFindingRelevantDevices;
}

- (void)setIsFindingRelevantDevices:(BOOL)a3
{
  self->_isFindingRelevantDevices = a3;
}

- (NSDate)lastRelevantDeviceFoundTime
{
  return self->_lastRelevantDeviceFoundTime;
}

- (void)setLastRelevantDeviceFoundTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastRelevantDeviceFoundTime, a3);
}

- (unint64_t)lastLongScanContext
{
  return self->_lastLongScanContext;
}

- (void)setLastLongScanContext:(unint64_t)a3
{
  self->_lastLongScanContext = a3;
}

- (unint64_t)extraFoundHELECount
{
  return self->_extraFoundHELECount;
}

- (void)setExtraFoundHELECount:(unint64_t)a3
{
  self->_extraFoundHELECount = a3;
}

- (unint64_t)extraFoundNonHELECount
{
  return self->_extraFoundNonHELECount;
}

- (void)setExtraFoundNonHELECount:(unint64_t)a3
{
  self->_extraFoundNonHELECount = a3;
}

- (NSDate)lastExtraHELEFoundTime
{
  return self->_lastExtraHELEFoundTime;
}

- (void)setLastExtraHELEFoundTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastExtraHELEFoundTime, a3);
}

- (NSDate)lastExtraNonHELEFoundTime
{
  return self->_lastExtraNonHELEFoundTime;
}

- (void)setLastExtraNonHELEFoundTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastExtraNonHELEFoundTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExtraNonHELEFoundTime, 0);
  objc_storeStrong((id *)&self->_lastExtraHELEFoundTime, 0);
  objc_storeStrong((id *)&self->_lastRelevantDeviceFoundTime, 0);
  objc_storeStrong((id *)&self->_foundDevicesDuringCurrentScan, 0);
  objc_storeStrong((id *)&self->_relevantDevicesToFindDuringLongScan, 0);
  objc_storeStrong((id *)&self->_initializationTime, 0);
  objc_storeStrong((id *)&self->_previousBufferEmptyTime, 0);
  objc_storeStrong((id *)&self->_nextScheduledAlarm, 0);
  objc_storeStrong((id *)&self->_nextOpportunisticScanDate, 0);
  objc_storeStrong((id *)&self->_lastEndOfScan, 0);
  objc_storeStrong((id *)&self->_lastStartOfScan, 0);
  objc_storeStrong((id *)&self->_lastLongScanRequest, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_destroyWeak((id *)&self->_locationRequester);
  objc_destroyWeak((id *)&self->_bluetoothScanner);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end
