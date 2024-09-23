@implementation TATrackingAvoidanceService

- (void)filterAndStageDetectionResults:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TAStore deviceRecord](self->_store, "deviceRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  +[TAFilterKnownDevices removeAndProcessBackgroundDetections:deviceRecord:](TAFilterKnownDevices, "removeAndProcessBackgroundDetections:deviceRecord:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  -[TAStore deviceRecord](self->_store, "deviceRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v6;
  +[TAFilterKnownDevices removeKnownSuspiciousDevices:deviceRecord:](TAFilterKnownDevices, "removeKnownSuspiciousDevices:deviceRecord:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[TAFilterKnownDevices removeDuplicateSuspiciousDevices:](TAFilterKnownDevices, "removeDuplicateSuspiciousDevices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[TAStore deviceRecord](self->_store, "deviceRecord");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "latestAdvertisement");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAStore clock](self->_store, "clock");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stageDevice:withCurrentDate:", v16, v17);

        -[TAStore deviceRecord](self->_store, "deviceRecord");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stageDetectionResults:", v19);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v11);
  }
  -[TATrackingAvoidanceService notifyObserversOfStagedSuspiciousDevices:](self, "notifyObserversOfStagedSuspiciousDevices:", v9);

}

- (void)notifyObserversOfStagedSuspiciousDevices:(id)a3
{
  id v4;
  void *v5;
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
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[NSHashTable allObjects](self->_observers, "allObjects");
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
            objc_msgSend(v11, "trackingAvoidanceService:didStageSuspiciousDevices:", self, v5);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_performDetection
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  TAStore *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  TAStore *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  TAStore *store;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  TAStore *v23;
  void *v24;
  NSDate *v25;
  NSDate *latestClassificationDate;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[TAStore visitState](self->_store, "visitState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6)
  {
    if (v6 == 2)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[TATrackingAvoidanceServiceSettings enableTAFilterGeneral](self->_serviceSettings, "enableTAFilterGeneral"))
      {
        v18 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217877000, v18, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService running TAFilterGeneral detector", buf, 2u);
        }
        store = self->_store;
        -[TASettings filterGeneralSettings](self->_settings, "filterGeneralSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[TAFilterGeneral filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:](TAFilterGeneral, "filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:", store, v20, v3);
        v21 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v21;
      }
      if (!-[TATrackingAvoidanceServiceSettings enableTAFilterLeavingLOI](self->_serviceSettings, "enableTAFilterLeavingLOI"))goto LABEL_23;
      v22 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217877000, v22, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService running TAFilterLeavingLOI detector", buf, 2u);
      }
      v23 = self->_store;
      -[TASettings filterLeavingLOISettings](self->_settings, "filterLeavingLOISettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:](TAFilterLeavingLOI, "filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:", v23, v15, v3);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[TATrackingAvoidanceServiceSettings enableTAFilterVisits](self->_serviceSettings, "enableTAFilterVisits"))
      {
        v9 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService running TAFilterVisits detector", buf, 2u);
        }
        v10 = self->_store;
        -[TASettings filterVisitsSettings](self->_settings, "filterVisitsSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[TAFilterVisits filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:](TAFilterVisits, "filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:", v10, v11, v3);
        v12 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v12;
      }
      if (!-[TATrackingAvoidanceServiceSettings enableTAFilterSingleVisit](self->_serviceSettings, "enableTAFilterSingleVisit"))goto LABEL_23;
      v13 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217877000, v13, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService running TAFilterSingleVisit detector", buf, 2u);
      }
      v14 = self->_store;
      -[TASettings filterSingleVisitSettings](self->_settings, "filterSingleVisitSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[TAFilterSingleVisit filterSuspiciousDeviceWithStore:singleVisitSettings:andAppendOutgoingRequestsTo:](TAFilterSingleVisit, "filterSuspiciousDeviceWithStore:singleVisitSettings:andAppendOutgoingRequestsTo:", v14, v15, v3);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_22:
      v24 = (void *)v16;

      v8 = v24;
LABEL_23:
      objc_msgSend(v4, "addObjectsFromArray:", v7);
      objc_msgSend(v4, "addObjectsFromArray:", v8);

    }
  }
  else
  {
    v17 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217877000, v17, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService not running detection in the unknown visit state", buf, 2u);
    }
  }
  v52 = v3;
  -[TAStore clock](self->_store, "clock");
  v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
  latestClassificationDate = self->_latestClassificationDate;
  self->_latestClassificationDate = v25;

  -[TATrackingAvoidanceService filterAndStageDetectionResults:](self, "filterAndStageDetectionResults:", v4);
  -[TAStore deviceRecord](self->_store, "deviceRecord");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "getDetectionResultsToPush");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  +[TAFilterKnownDevices removeDuplicateSuspiciousDevices:](TAFilterKnownDevices, "removeDuplicateSuspiciousDevices:", v51);
  v28 = objc_claimAutoreleasedReturnValue();
  -[TATrackingAvoidanceService store](self, "store");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "deviceRecord");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[TAFilterKnownDevices removeIssuedDevices:deviceRecord:](TAFilterKnownDevices, "removeIssuedDevices:deviceRecord:", v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[TAStore visitState](self->_store, "visitState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "visitSnapshotBuffer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAStore visitState](self->_store, "visitState");
  v34 = v4;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "interVisitMetricSnapshotBuffer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAStore clock](self->_store, "clock");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[TAFilterObservationAggregator aggregateObservationsThroughHistoryForDetectionResults:visitSnapshotBuffer:intervisitSnapshotBuffer:clock:](TAFilterObservationAggregator, "aggregateObservationsThroughHistoryForDetectionResults:visitSnapshotBuffer:intervisitSnapshotBuffer:clock:", v31, v33, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v34;
  v40 = (void *)v28;

  v41 = v51;
  -[TAStore deviceRecord](self->_store, "deviceRecord");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[TAFilterObservationAggregator attachAISInfo:deviceRecord:](TAFilterObservationAggregator, "attachAISInfo:deviceRecord:", v38, v42);

  if (objc_msgSend(v38, "count"))
  {
    v43 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      v44 = v43;
      v45 = objc_msgSend(v51, "count");
      v46 = objc_msgSend(v40, "count");
      v47 = objc_msgSend(v31, "count");
      v48 = objc_msgSend(v39, "count");
      *(_DWORD *)buf = 68290051;
      v54 = 0;
      v55 = 2082;
      v56 = "";
      v57 = 2049;
      v58 = v45;
      v59 = 2049;
      v60 = v46;
      v61 = 2049;
      v62 = v47;
      v63 = 2049;
      v64 = v48;
      _os_log_impl(&dword_217877000, v44, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TATrackingAvoidanceService reporting suspicious devices\", \"stagedDetectionsReadyForSubmission\":%{private}lu, \"dedupedStagedDetectionsReadyForSubmission\":%{private}lu, \"nonIssuedDedupedStagedDetectionsReadyForSubmission\":%{private}lu, \"allUnfilteredSuspiciousDevices\":%{private}lu}", buf, 0x3Au);

    }
  }
  -[TATrackingAvoidanceService store](self, "store", v51);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "deviceRecord");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "processSurfacedAlerts:", v38);

  -[TATrackingAvoidanceService notifyObserversOfRequests:](self, "notifyObserversOfRequests:", v52);
  -[TATrackingAvoidanceService notifyObserversOfSuspiciousDevices:](self, "notifyObserversOfSuspiciousDevices:", v38);

}

- (void)ingestTAEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (_os_feature_enabled_impl() & 1) == 0)
    {
      v5 = v4;
      if (objc_msgSend(v5, "isPosh"))
      {
        v6 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v7 = v6;
          objc_msgSend(v5, "descriptionDictionary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 68289283;
          *(_DWORD *)v15 = 0;
          *(_WORD *)&v15[4] = 2082;
          *(_QWORD *)&v15[6] = "";
          v16 = 2113;
          v17 = v8;
          _os_log_impl(&dword_217877000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TATrackingAvoidanceService skip adv ff not enabled\", \"adv\":\"%{private}@\"}", (uint8_t *)&v14, 0x1Cu);

        }
LABEL_19:

        goto LABEL_20;
      }

    }
    v9 = TAEventsLog;
    if (os_log_type_enabled((os_log_t)TAEventsLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138477827;
      *(_QWORD *)v15 = v4;
      _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v14, 0xCu);
    }
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[TAStore addTAEvent:andAppendOutgoingRequestsTo:](self->_store, "addTAEvent:andAppendOutgoingRequestsTo:", v4, v5);
    -[TATrackingAvoidanceService sendUnstagingUpdatesAndRemoveUnstagingUpdatesRequests:](self, "sendUnstagingUpdatesAndRemoveUnstagingUpdatesRequests:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TATrackingAvoidanceService shouldPerformDetection](self, "shouldPerformDetection"))
    {
      v11 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_217877000, v11, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService significant time elapsed, performing classification now", (uint8_t *)&v14, 2u);
      }
      -[TATrackingAvoidanceService _performDetection](self, "_performDetection");
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TATrackingAvoidanceService _performUpdateIfNecessary:](self, "_performUpdateIfNecessary:", v4);
    -[TAStore deviceRecord](self->_store, "deviceRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TAFilterKnownDevices removeMetricsFromKnownDevices:deviceRecord:](TAFilterKnownDevices, "removeMetricsFromKnownDevices:deviceRecord:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TATrackingAvoidanceService notifyObserversOfRequests:](self, "notifyObserversOfRequests:", v13);
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    -[TATrackingAvoidanceService ingestTAEvent:].cold.1();
LABEL_20:

}

- (void)notifyObserversOfRequests:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            v13 = v11;
            objc_msgSend(v12, "description");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v32 = v14;
            _os_log_impl(&dword_217877000, v13, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService requesting:%{private}@", buf, 0xCu);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      }
      while (v8);
    }

    -[NSHashTable allObjects](self->_observers, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "trackingAvoidanceService:requestingAdditionalInformation:", self, v6);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

    v5 = v21;
  }

}

- (id)sendUnstagingUpdatesAndRemoveUnstagingUpdatesRequests:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("UnstagingUpdate"));

        if (v13)
        {
          objc_msgSend(v11, "additionalInformation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UnstagingUpdate"));
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v15)
            v17 = v15;
          else
            v17 = MEMORY[0x24BDBD1A8];
          objc_msgSend(v5, "addObjectsFromArray:", v17);

        }
        else
        {
          objc_msgSend(v4, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  -[TATrackingAvoidanceService notifyObserversOfUnstagedSuspiciousDevices:](self, "notifyObserversOfUnstagedSuspiciousDevices:", v5);
  v18 = (void *)objc_msgSend(v4, "copy");

  return v18;
}

- (void)notifyObserversOfUnstagedSuspiciousDevices:(id)a3
{
  id v4;
  void *v5;
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
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[NSHashTable allObjects](self->_observers, "allObjects");
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
            objc_msgSend(v11, "trackingAvoidanceService:didUnstageSuspiciousDevices:", self, v5);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)shouldPerformDetection
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[TAStore clock](self->_store, "clock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_latestClassificationDate);
  v5 = v4;

  -[TATrackingAvoidanceServiceSettings classificationTimeInterval](self->_serviceSettings, "classificationTimeInterval");
  return v5 > v6;
}

- (TAStore)store
{
  return self->_store;
}

- (void)notifyObserversOfSuspiciousDevices:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  TADeviceInformation *v22;
  void *v23;
  void *v24;
  TADeviceInformation *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id obj;
  uint64_t v33;
  TATrackingAvoidanceService *v34;
  uint64_t v35;
  uint64_t v36;
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
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v31 = v5;
    obj = v5;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v35)
    {
      v33 = *(_QWORD *)v46;
      v34 = self;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v46 != v33)
            objc_enumerationMutation(obj);
          v36 = v6;
          v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
          v8 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            v9 = v8;
            objc_msgSend(v7, "description");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v51 = v10;
            _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService found:%{private}@", buf, 0xCu);

          }
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v7, "locationHistory");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v42;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v42 != v14)
                  objc_enumerationMutation(v11);
                v16 = (void *)TAStatusLog;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
                {
                  v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v15);
                  v18 = v16;
                  objc_msgSend(v7, "address");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "description");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138478083;
                  v51 = v19;
                  v52 = 2113;
                  v53 = v20;
                  _os_log_debug_impl(&dword_217877000, v18, OS_LOG_TYPE_DEBUG, "#TATrackingAvoidanceService detection location associated with %{private}@:%{private}@", buf, 0x16u);

                }
                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
            }
            while (v13);
          }

          self = v34;
          -[TAStore deviceRecord](v34->_store, "deviceRecord");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = [TADeviceInformation alloc];
          objc_msgSend(v7, "latestAdvertisement");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "date");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[TADeviceInformation initWithTASPAdvertisement:deviceType:notificationState:date:](v22, "initWithTASPAdvertisement:deviceType:notificationState:date:", v23, 0, 1, v24);
          objc_msgSend(v21, "ingestTAEvent:andAppendOutgoingRequestsTo:", v25, 0);

          v6 = v36 + 1;
        }
        while (v36 + 1 != v35);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v35);
    }

    -[NSHashTable allObjects](self->_observers, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "trackingAvoidanceService:didFindSuspiciousDevices:", self, obj);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v28);
    }

    v5 = v31;
  }

}

- (void)_performUpdateIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  TASuspiciousDevice *v18;
  void *v19;
  void *v20;
  TAMetricsDetection *v21;
  void *v22;
  void *v23;
  void *v24;
  TASuspiciousDevice *v25;
  void *v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TAStore deviceRecord](self->_store, "deviceRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasSurfacedNotificationFor:", v6);

  if (v7)
  {
    -[TAStore eventBuffer](self->_store, "eventBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getLatestElementOf:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "scanDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v11);
      v13 = v12;

      -[TASettings filterGeneralSettings](self->_settings, "filterGeneralSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "thresholdOfLocationRelevance");
      v16 = v15;

      if (v13 <= v16)
      {
        v18 = [TASuspiciousDevice alloc];
        objc_msgSend(v4, "getDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[TAMetricsDetection initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:]([TAMetricsDetection alloc], "initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:", 0, 0, 0, 0, v4);
        -[TAStore deviceRecord](self->_store, "deviceRecord");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "address");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "getAccessoryInfo:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v18, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v4, &unk_24D8250C0, v19, v20, v21, 0, 0, v24, 0);

        -[TATrackingAvoidanceService notifyObserversOfSuspiciousDeviceUpdate:](self, "notifyObserversOfSuspiciousDeviceUpdate:", v25);
      }
      else
      {
        v17 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289539;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          v31 = 2113;
          v32 = v4;
          v33 = 2113;
          v34 = v9;
          _os_log_impl(&dword_217877000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TATrackingAvoidanceService location too stale to update\", \"advertisement\":\"%{private}@\", \"latestLocation\":\"%{private}@\"}", buf, 0x26u);
        }
      }
    }

  }
}

- (TATrackingAvoidanceService)init
{
  return -[TATrackingAvoidanceService initWithSettings:](self, "initWithSettings:", MEMORY[0x24BDBD1B8]);
}

- (TATrackingAvoidanceService)initWithSettings:(id)a3
{
  id v4;
  TASettings *v5;
  TATrackingAvoidanceService *v6;

  v4 = a3;
  v5 = -[TASettings initWithSettings:]([TASettings alloc], "initWithSettings:", v4);

  v6 = -[TATrackingAvoidanceService initWithTASettings:](self, "initWithTASettings:", v5);
  return v6;
}

- (TATrackingAvoidanceService)initWithTASettings:(id)a3
{
  id v5;
  TATrackingAvoidanceService *v6;
  TATrackingAvoidanceService *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  TATrackingAvoidanceServiceSettings *serviceSettings;
  uint64_t v17;
  NSHashTable *observers;
  TAStore *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  TAStore *store;
  uint64_t v26;
  NSDate *latestClassificationDate;
  TAOutgoingRequests *stagedIntervisitMetrics;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)TATrackingAvoidanceService;
  v6 = -[TATrackingAvoidanceService init](&v30, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    TARegisterLogs();
    v8 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      -[TATrackingAvoidanceService initWithTASettings:].cold.1((uint64_t)&v7->_settings, v8, v9, v10, v11, v12, v13, v14);
    -[TASettings serviceSettings](v7->_settings, "serviceSettings");
    v15 = objc_claimAutoreleasedReturnValue();
    serviceSettings = v7->_serviceSettings;
    v7->_serviceSettings = (TATrackingAvoidanceServiceSettings *)v15;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v17;

    v19 = [TAStore alloc];
    -[TASettings eventBufferSettings](v7->_settings, "eventBufferSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TASettings scanRequestSettings](v7->_settings, "scanRequestSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TASettings visitStateSettings](v7->_settings, "visitStateSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TASettings deviceRecordSettings](v7->_settings, "deviceRecordSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[TAStore initWithEventBufferSettings:scanRequestSettings:visitStateSettings:deviceRecordSettings:](v19, "initWithEventBufferSettings:scanRequestSettings:visitStateSettings:deviceRecordSettings:", v20, v21, v22, v23);
    store = v7->_store;
    v7->_store = (TAStore *)v24;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v26 = objc_claimAutoreleasedReturnValue();
    latestClassificationDate = v7->_latestClassificationDate;
    v7->_latestClassificationDate = (NSDate *)v26;

    -[TAStore addObserver:](v7->_store, "addObserver:", v7);
    stagedIntervisitMetrics = v7->_stagedIntervisitMetrics;
    v7->_stagedIntervisitMetrics = 0;

  }
  return v7;
}

- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v6)
  {
    -[TAStore fetchTAUnknownBeacon:](self->_store, "fetchTAUnknownBeacon:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      -[TATrackingAvoidanceService fetchTAUnknownBeacon:withCompletion:].cold.2((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    v7[2](v7, v8);

  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TATrackingAvoidanceService fetchTAUnknownBeacon:withCompletion:].cold.1();
  }

}

- (void)didRequestAIS:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138477827;
    v20 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (-[TASettings aisFetchEnabled](self->_settings, "aisFetchEnabled"))
          {
            objc_msgSend(v11, "trackingAvoidanceService:didRequestAIS:", self, v4);
            continue;
          }
          v17 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v17;
            objc_msgSend(v4, "description");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v26 = v14;
            v15 = v13;
            v16 = "#TATrackingAvoidanceService AIS fetch disabled :%{private}@";
            goto LABEL_13;
          }
        }
        else
        {
          v12 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v12;
            objc_msgSend(v4, "description");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v26 = v14;
            v15 = v13;
            v16 = "#TATrackingAvoidanceService AIS fetch not implemented on connection stack :%{private}@";
LABEL_13:
            _os_log_impl(&dword_217877000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);

          }
        }
        -[TAStore deviceRecord](self->_store, "deviceRecord", v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "address");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "forceUpdateAISFetchState:state:", v19, 8);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)bootstrapDeviceRecord:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[TAStore deviceRecord](self->_store, "deviceRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mergeWithAnotherDeviceRecord:", v4);

  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TATrackingAvoidanceService bootstrapDeviceRecord:].cold.1();
  }

}

- (void)bootstrapVisitState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[TAStore visitState](self->_store, "visitState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mergeWithAnotherTAVisitState:", v4);

  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TATrackingAvoidanceService bootstrapVisitState:].cold.1();
  }

}

- (void)notifyObserversOfSuspiciousDeviceUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(v4, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v38 = v7;
      _os_log_impl(&dword_217877000, v6, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService update:%{private}@", buf, 0xCu);

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v4, "locationHistory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v32;
      *(_QWORD *)&v10 = 138478083;
      v26 = v10;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v8);
          v14 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
          {
            v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
            v16 = v14;
            objc_msgSend(v4, "address");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "description");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            v38 = v17;
            v39 = 2113;
            v40 = v18;
            _os_log_debug_impl(&dword_217877000, v16, OS_LOG_TYPE_DEBUG, "#TATrackingAvoidanceService update location associated with %{private}@:%{private}@", buf, 0x16u);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v11);
    }

    -[NSHashTable allObjects](self->_observers, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v35 = v4;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1, v26);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "trackingAvoidanceService:didUpdateSuspiciousDevices:", self, v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v21);
    }

  }
}

- (void)notifyObserversOfVisitStateChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "visitStateChangedForTrackingAvoidanceService:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)visitState:(id)a3 didChangeStateFromType:(unint64_t)a4 toType:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    -[TATrackingAvoidanceService visitState:didChangeStateFromType:toType:].cold.1();
  -[TATrackingAvoidanceService _performDetection](self, "_performDetection");
  -[TATrackingAvoidanceService notifyObserversOfVisitStateChange](self, "notifyObserversOfVisitStateChange");
}

- (void)visitState:(id)a3 didIssueMetricsSubmissionHint:(unint64_t)a4
{
  id v6;
  TAStore *store;
  void *v8;
  void *v9;
  NSObject *v10;
  TAOutgoingRequests *v11;
  void *v12;
  TAOutgoingRequests *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  TAOutgoingRequests *v17;
  void *v18;
  NSObject *v19;
  TAOutgoingRequests *v20;
  void *v21;
  TAOutgoingRequests *v22;
  TAOutgoingRequests *v23;
  NSObject *v24;
  uint8_t v25[8];
  TAOutgoingRequests *stagedIntervisitMetrics;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  switch(a4)
  {
    case 2uLL:
      if (self->_stagedIntervisitMetrics)
      {
        v15 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_217877000, v15, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService reporting the previous intervisit-based metrics", v25, 2u);
        }
        stagedIntervisitMetrics = self->_stagedIntervisitMetrics;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &stagedIntervisitMetrics, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TATrackingAvoidanceService notifyObserversOfRequests:](self, "notifyObserversOfRequests:", v16);

        v17 = self->_stagedIntervisitMetrics;
        self->_stagedIntervisitMetrics = 0;

      }
      break;
    case 1uLL:
      +[TACoreAnalyticMetricManager computeMetricsInterVisit:](TACoreAnalyticMetricManager, "computeMetricsInterVisit:", self->_store);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v18;
      if (v18 && objc_msgSend(v18, "count"))
      {
        v19 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_217877000, v19, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService staging previous inter-visit metrics", v25, 2u);
        }
        v20 = [TAOutgoingRequests alloc];
        -[TAStore clock](self->_store, "clock");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v20, "initWithRequestKey:additionalInformation:date:", CFSTR("DonatingInterVisitMetrics"), v9, v21);
        v23 = self->_stagedIntervisitMetrics;
        self->_stagedIntervisitMetrics = v22;

      }
      goto LABEL_18;
    case 0uLL:
      store = self->_store;
      -[TASettings filterVisitsSettings](self->_settings, "filterVisitsSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[TACoreAnalyticMetricManager computeMetricsVisit:withFilterVisitsSettings:](TACoreAnalyticMetricManager, "computeMetricsVisit:withFilterVisitsSettings:", store, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && objc_msgSend(v9, "count"))
      {
        v10 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService reporting the previous visit-based metrics", v25, 2u);
        }
        v11 = [TAOutgoingRequests alloc];
        -[TAStore clock](self->_store, "clock");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v11, "initWithRequestKey:additionalInformation:date:", CFSTR("DonatingVisitMetrics"), v9, v12);

        v27[0] = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TATrackingAvoidanceService notifyObserversOfRequests:](self, "notifyObserversOfRequests:", v14);

      }
LABEL_18:

      break;
    default:
      v24 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        -[TATrackingAvoidanceService visitState:didIssueMetricsSubmissionHint:].cold.1(a4, v24);
      break;
  }

}

+ (id)createRandomBytes:(unint64_t)a3
{
  char *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v4 = (char *)v6 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0);
  arc4random_buf(v4, a3);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)debugStageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  TASPAdvertisement *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  TASPAdvertisement *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  TASPAdvertisement *v27;
  void *v28;
  void *v29;
  TASPAdvertisement *v30;
  void *v31;
  id v32;
  TALocationLite *v33;
  TASuspiciousDevice *v34;
  void *v35;
  TAMetricsDetection *v36;
  TASuspiciousDevice *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  TASuspiciousDevice *v47;
  TASuspiciousDevice *v48;
  TALocationLite *v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)TAStatusLog;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v8, "hexString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v51 = v11;
      _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService start stageTADetection for address: %{private}@ ", buf, 0xCu);

    }
    -[TAStore deviceRecord](self->_store, "deviceRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeDevice:", v8);

    if (a4 >= 4)
      v13 = 0;
    else
      v13 = 0xF4E4D400 >> (8 * a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = &unk_24D824F38;
    if (a5 == 3)
      v15 = &unk_24D824F68;
    if (a5 == 1)
      v16 = &unk_24D824F50;
    else
      v16 = v15;
    v17 = [TASPAdvertisement alloc];
    +[TATrackingAvoidanceService createRandomBytes:](TATrackingAvoidanceService, "createRandomBytes:", 22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[TATrackingAvoidanceService createRandomBytes:](TATrackingAvoidanceService, "createRandomBytes:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13 & 0x3FC;
    LODWORD(v44) = a5;
    v46 = (void *)v14;
    v21 = -[TASPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:](v17, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:", v8, v18, v20, v19, -55, v14, v44, 0, v16);

    -[TAStore deviceRecord](self->_store, "deviceRecord");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TASPAdvertisement getDate](v21, "getDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stageDevice:withCurrentDate:", v21, v23);

    -[TAStore deviceRecord](self->_store, "deviceRecord");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v24, "ingestTAEvent:andAppendOutgoingRequestsTo:", v21, v25);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v14, -5400.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = [TASPAdvertisement alloc];
    +[TATrackingAvoidanceService createRandomBytes:](TATrackingAvoidanceService, "createRandomBytes:", 22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[TATrackingAvoidanceService createRandomBytes:](TATrackingAvoidanceService, "createRandomBytes:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = a5;
    v30 = -[TASPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:](v27, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:", v8, v28, v20, v29, -55, v26, v45, 0, v16);

    -[TAStore deviceRecord](self->_store, "deviceRecord");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v31, "ingestTAEvent:andAppendOutgoingRequestsTo:", v30, v32);

    v33 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:]([TALocationLite alloc], "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v26, 37.3348314, -122.008961, 100.0);
    v34 = [TASuspiciousDevice alloc];
    v49 = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[TAMetricsDetection initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:]([TAMetricsDetection alloc], "initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:", 1, 0, 0, 0, v21);
    v37 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v34, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v21, &unk_24D8250E8, v46, v35, v36, 1, 1, 0, 0);

    -[TAStore deviceRecord](self->_store, "deviceRecord");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stageDetectionResults:", v39);

    v47 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[TATrackingAvoidanceService notifyObserversOfStagedSuspiciousDevices:](self, "notifyObserversOfStagedSuspiciousDevices:", v40);

    v41 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      objc_msgSend(v8, "hexString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v51 = v43;
      _os_log_impl(&dword_217877000, v42, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService end stageDevice %{private}@", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TATrackingAvoidanceService debugStageTADetection:deviceType:detailsBitmask:].cold.1();
  }

}

- (void)debugForceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __int16 v12;
  TASPAdvertisement *v13;
  void *v14;
  void *v15;
  void *v16;
  TASPAdvertisement *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v8, "hexString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v23 = v11;
    _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService forceSurfaceStagedDetections for address: %{private}@", buf, 0xCu);

  }
  if (a4 >= 4)
    v12 = 0;
  else
    v12 = 0xF4E4D400 >> (8 * a4);
  v13 = [TASPAdvertisement alloc];
  +[TATrackingAvoidanceService createRandomBytes:](TATrackingAvoidanceService, "createRandomBytes:", 22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[TATrackingAvoidanceService createRandomBytes:](TATrackingAvoidanceService, "createRandomBytes:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = a5;
  v17 = -[TASPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:](v13, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:", v8, v14, v12 & 0x3FC, v15, -55, v16, v21, 0, 0);

  -[TAStore deviceRecord](self->_store, "deviceRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v18, "ingestTAEvent:andAppendOutgoingRequestsTo:", v17, v19);

  -[TAStore deviceRecord](self->_store, "deviceRecord");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:withReason:", v17, 0);

  -[TATrackingAvoidanceService _performDetection](self, "_performDetection");
}

- (TASettings)settings
{
  return self->_settings;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSDate)latestClassificationDate
{
  return self->_latestClassificationDate;
}

- (void)setLatestClassificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestClassificationDate, a3);
}

- (TATrackingAvoidanceServiceSettings)serviceSettings
{
  return self->_serviceSettings;
}

- (void)setServiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSettings, a3);
}

- (TAOutgoingRequests)stagedIntervisitMetrics
{
  return self->_stagedIntervisitMetrics;
}

- (void)setStagedIntervisitMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_stagedIntervisitMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedIntervisitMetrics, 0);
  objc_storeStrong((id *)&self->_serviceSettings, 0);
  objc_storeStrong((id *)&self->_latestClassificationDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)initWithTASettings:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_217877000, a2, a3, "#TATrackingAvoidanceService settings %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_5_0();
}

- (void)fetchTAUnknownBeacon:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TATrackingAvoidanceService received nil uuid for beacon fetch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)fetchTAUnknownBeacon:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_217877000, a2, a3, "#TATrackingAvoidanceService fetch unknown beacon successfully %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_5_0();
}

- (void)bootstrapDeviceRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TATrackingAvoidanceService received nil device record for bootstrap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)bootstrapVisitState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TATrackingAvoidanceService received nil visit state for bootstrap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)visitState:didChangeStateFromType:toType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_217877000, v0, v1, "#TATrackingAvoidanceService received state change notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)visitState:(uint64_t)a1 didIssueMetricsSubmissionHint:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_217877000, a2, OS_LOG_TYPE_ERROR, "#TATrackingAvoidanceService unrecognized metrics hint %lu", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5_0();
}

- (void)ingestTAEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_217877000, v0, v1, "#TATrackingAvoidanceService nil event given, not ingesting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)debugStageTADetection:deviceType:detailsBitmask:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TATrackingAvoidanceService received nil address for debugStageTAUnknownBeacon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

@end
