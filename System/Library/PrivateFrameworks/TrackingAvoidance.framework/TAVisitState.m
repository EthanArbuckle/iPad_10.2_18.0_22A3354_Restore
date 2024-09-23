@implementation TAVisitState

- (TACircularBuffer)visitSnapshotBuffer
{
  return self->_visitSnapshotBuffer;
}

- (id)getLatestValidVisitDepartureDate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TACircularBuffer bufferCopy](self->_visitSnapshotBuffer, "bufferCopy", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isClosed") & 1) != 0)
        {
          objc_msgSend(v7, "representativeVisit");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "departureDate");
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)ingestTAEvent:(id)a3 store:(id)a4 appendOutgoingRequestsTo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  TAScanRequest *scanRequest;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  TAScanRequest *v45;
  void *v46;
  void *v47;
  id v48;
  TAVisitState *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
  {
    v48 = v10;
    v49 = self;
    v50 = v9;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[TACircularBuffer bufferCopy](self->_visitSnapshotBuffer, "bufferCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reverseObjectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v8, "getDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "representativeVisit");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "arrivalDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v18, "compare:", v20);

          if (v21 == 1)
          {
            v29 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
              -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:].cold.1(v29, v8);
            objc_msgSend(v17, "addUTAdvertisement:", v8);
            goto LABEL_21;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_21:

    self = v49;
    v9 = v50;
    v10 = v48;
    if (-[TACircularBuffer count](v49->_interVisitMetricSnapshotBuffer, "count"))
    {
      -[TACircularBuffer lastObject](v49->_interVisitMetricSnapshotBuffer, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isClosed");

      if ((v31 & 1) == 0)
      {
        scanRequest = v49->_scanRequest;
        objc_msgSend(v50, "deviceRecord");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "clock");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAScanRequest scheduleInterVisitScanForAdvertisement:deviceRecord:clock:](scanRequest, "scheduleInterVisitScanForAdvertisement:deviceRecord:clock:", v8, v22, v33);

LABEL_24:
      }
    }
  }
  else
  {
    if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
    {
      if (!-[TACircularBuffer count](self->_visitSnapshotBuffer, "count"))
        goto LABEL_47;
      -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isClosed") & 1) == 0)
      {
        objc_msgSend(v8, "getDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "latestLocation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "getDate");
        v25 = v10;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v23, "compare:", v26);

        v10 = v25;
        if (v27 == 1)
        {
          v28 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
            -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:].cold.2(v28, v8);
          objc_msgSend(v22, "updateLatestLocation:", v8);
        }
      }
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v9, "clock");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitState updateImportantLOIs:currentDate:](self, "updateImportantLOIs:currentDate:", v8, v34);

    }
    else if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
    {
      if (objc_msgSend(v8, "isTemporalOrderSensical"))
      {
        v35 = -[TAVisitState stateTransitionDecisionGivenTACLVisit:](self, "stateTransitionDecisionGivenTACLVisit:", v8);
        self->_lastStateTransition = v35;
        -[TAVisitState performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:](self, "performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:", v35, v9, v8, v10);
      }
      else
      {
        v37 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
          -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:].cold.3(v37, v8);
      }
    }
    else if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
    {
      if (objc_msgSend(v8, "systemStateType") == 2)
      {
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v36;
        if (v36)
          objc_msgSend(v36, "addSystemState:", v8);
        goto LABEL_24;
      }
    }
    else if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
    {
      if (-[TACircularBuffer count](self->_visitSnapshotBuffer, "count"))
      {
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isClosed") & 1) == 0)
        {
          objc_msgSend(v8, "getDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "representativeVisit");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "arrivalDate");
          v40 = v10;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v38, "compare:", v41);

          v10 = v40;
          if (v42 == 1)
          {
            v43 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
              -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:].cold.4(v43, v8);
            objc_msgSend(v22, "addScanState:", v8);
          }
        }
        goto LABEL_24;
      }
    }
    else if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
    {
      v44 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        v56 = 0;
        v57 = 2082;
        v58 = "";
        v59 = 2113;
        v60 = v8;
        _os_log_impl(&dword_217877000, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState adding PLOI\", \"PLOI\":\"%{private}@\"}", buf, 0x1Cu);
      }
      -[NSMutableArray addObject:](self->_nextPredictedLOIs, "addObject:", v8);
    }
  }
LABEL_47:
  v45 = self->_scanRequest;
  objc_msgSend(v9, "clock");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAScanRequest evictScheduledInterVisitScanWithClock:](v45, "evictScheduledInterVisitScanWithClock:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
    objc_msgSend(v10, "addObject:", v47);
  -[TAVisitState updateInterVisitSnapshotWithStore:](self, "updateInterVisitSnapshotWithStore:", v9);
  -[TAVisitState updateInterVisitBackupSnapshotWithStore:](self, "updateInterVisitBackupSnapshotWithStore:", v9);

}

- (void)purgeWithClock:(id)a3
{
  id v4;

  v4 = a3;
  -[TAVisitState purgeVisitSnapshotBufferWithCurrentDate:](self, "purgeVisitSnapshotBufferWithCurrentDate:", v4);
  -[TAVisitState purgeInterVisitSnapshotBufferWithCurrentDate:](self, "purgeInterVisitSnapshotBufferWithCurrentDate:", v4);

}

- (void)purgeInterVisitSnapshotBufferWithCurrentDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  TAVisitState *v20;

  v4 = a3;
  if (-[TACircularBuffer count](self->_interVisitMetricSnapshotBuffer, "count"))
  {
    -[TACircularBuffer firstObject](self->_interVisitMetricSnapshotBuffer, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isClosed") & 1) != 0)
    {
      -[TACircularBuffer firstObject](self->_interVisitMetricSnapshotBuffer, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastUpdateTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v7);
      v9 = v8;
      -[TAVisitStateSettings snapshotBufferTimeIntervalOfRetention](self->_settings, "snapshotBufferTimeIntervalOfRetention");
      v11 = v10;

      if (v9 >= v11)
      {
        v12 = (void *)MEMORY[0x24BDD1758];
        v15 = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __61__TAVisitState_purgeInterVisitSnapshotBufferWithCurrentDate___block_invoke;
        v18 = &unk_24D815640;
        v19 = v4;
        v20 = self;
        objc_msgSend(v12, "predicateWithBlock:", &v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[TACircularBuffer removeUntilFirstPredicateFail:](self->_interVisitMetricSnapshotBuffer, "removeUntilFirstPredicateFail:", v13, v15, v16, v17, v18);

      }
    }
    else
    {

    }
  }

}

- (void)purgeVisitSnapshotBufferWithCurrentDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  TAVisitState *v21;

  v4 = a3;
  if (-[TACircularBuffer count](self->_visitSnapshotBuffer, "count"))
  {
    -[TACircularBuffer firstObject](self->_visitSnapshotBuffer, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isClosed") & 1) != 0)
    {
      -[TACircularBuffer firstObject](self->_visitSnapshotBuffer, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "representativeVisit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "departureDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v8);
      v10 = v9;
      -[TAVisitStateSettings snapshotBufferTimeIntervalOfRetention](self->_settings, "snapshotBufferTimeIntervalOfRetention");
      v12 = v11;

      if (v10 >= v12)
      {
        v13 = (void *)MEMORY[0x24BDD1758];
        v16 = MEMORY[0x24BDAC760];
        v17 = 3221225472;
        v18 = __56__TAVisitState_purgeVisitSnapshotBufferWithCurrentDate___block_invoke;
        v19 = &unk_24D815640;
        v20 = v4;
        v21 = self;
        objc_msgSend(v13, "predicateWithBlock:", &v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[TACircularBuffer removeUntilFirstPredicateFail:](self->_visitSnapshotBuffer, "removeUntilFirstPredicateFail:", v14, v16, v17, v18, v19);

      }
    }
    else
    {

    }
  }

}

- (void)updateInterVisitSnapshotWithStore:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  if (self->_state == 2)
  {
    if (-[TACircularBuffer count](self->_interVisitMetricSnapshotBuffer, "count")
      && (-[TACircularBuffer lastObject](self->_interVisitMetricSnapshotBuffer, "lastObject"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isClosed"),
          v5,
          !v6))
    {
      -[TACircularBuffer lastObject](self->_interVisitMetricSnapshotBuffer, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitState updateInterVisitSnapshot:store:](self, "updateInterVisitSnapshot:store:", v7, v4);

    }
    else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      -[TAVisitState updateInterVisitSnapshotWithStore:].cold.1();
    }
  }

}

- (void)updateInterVisitSnapshot:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
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
  NSObject *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDBCE60]);
  -[TAVisitStateSettings interVisitSnapshotUpdateInterval](self->_settings, "interVisitSnapshotUpdateInterval");
  v10 = v9;
  objc_msgSend(v6, "lastUpdateTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithTimeInterval:sinceDate:", v11, v10);

  objc_msgSend(v7, "clock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "compare:", v13);

  if (v14 == -1)
  {
    v15 = (void *)MEMORY[0x24BDD1508];
    objc_msgSend(v6, "lastUpdateTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createIntervalSafelyWithStartDate:endDate:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[TAVisitStateSettings thresholdOfLocationRelevance](self->_settings, "thresholdOfLocationRelevance");
    +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v7, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:", v19, v7, v20, 0);

    v21 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      objc_msgSend(v6, "accumulatedDeviceMetrics");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 134283521;
      v25 = objc_msgSend(v23, "count");
      _os_log_impl(&dword_217877000, v22, OS_LOG_TYPE_DEFAULT, "#TAVisitState inter-visit snapshot updated; tracking %{private}lu devices",
        (uint8_t *)&v24,
        0xCu);

    }
  }

}

- (void)updateInterVisitBackupSnapshotWithStore:(id)a3
{
  id v4;
  TAInterVisitMetricsSnapshot *interVisitMetricsSnapshotBackup;

  v4 = a3;
  if (self->_state == 1)
  {
    interVisitMetricsSnapshotBackup = self->_interVisitMetricsSnapshotBackup;
    if (interVisitMetricsSnapshotBackup
      && !-[TAInterVisitMetricsSnapshot isClosed](interVisitMetricsSnapshotBackup, "isClosed"))
    {
      -[TAVisitState updateInterVisitSnapshot:store:](self, "updateInterVisitSnapshot:store:", self->_interVisitMetricsSnapshotBackup, v4);
    }
    else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      -[TAVisitState updateInterVisitBackupSnapshotWithStore:].cold.1();
    }
  }

}

- (BOOL)isInSensitiveVisit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (self->_state != 1)
    return 0;
  -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TAVisitStateSettings sensitiveLOITypes](self->_settings, "sensitiveLOITypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[TAVisitStateSettings sensitiveLOITypes](self->_settings, "sensitiveLOITypes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD16E0];
      -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "loiType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v5, "containsObject:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)state
{
  return self->_state;
}

- (TACircularBuffer)interVisitMetricSnapshotBuffer
{
  return self->_interVisitMetricSnapshotBuffer;
}

- (TAVisitState)initWithSettings:(id)a3 scanRequestSettings:(id)a4
{
  id v7;
  id v8;
  TAVisitState *v9;
  TAVisitState *v10;
  TACircularBuffer *v11;
  TACircularBuffer *visitSnapshotBuffer;
  TACircularBuffer *v13;
  TACircularBuffer *interVisitMetricSnapshotBuffer;
  NSMutableDictionary *v15;
  NSMutableDictionary *importantLois;
  uint64_t v17;
  NSHashTable *observers;
  TAScanRequest *v19;
  TAScanRequest *scanRequest;
  TAInterVisitMetricsSnapshot *interVisitMetricsSnapshotBackup;
  NSMutableArray *v22;
  NSMutableArray *nextPredictedLOIs;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)TAVisitState;
  v9 = -[TAVisitState init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_state = 0;
    objc_storeStrong((id *)&v9->_settings, a3);
    v11 = -[TACircularBuffer initWithCapacity:]([TACircularBuffer alloc], "initWithCapacity:", -[TAVisitStateSettings visitSnapshotCapacity](v10->_settings, "visitSnapshotCapacity"));
    visitSnapshotBuffer = v10->_visitSnapshotBuffer;
    v10->_visitSnapshotBuffer = v11;

    v13 = -[TACircularBuffer initWithCapacity:]([TACircularBuffer alloc], "initWithCapacity:", -[TAVisitStateSettings interVisitMetricSnapshotCapacity](v10->_settings, "interVisitMetricSnapshotCapacity"));
    interVisitMetricSnapshotBuffer = v10->_interVisitMetricSnapshotBuffer;
    v10->_interVisitMetricSnapshotBuffer = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    importantLois = v10->_importantLois;
    v10->_importantLois = v15;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v17;

    v19 = -[TAScanRequest initWithSettings:]([TAScanRequest alloc], "initWithSettings:", v8);
    scanRequest = v10->_scanRequest;
    v10->_scanRequest = v19;

    interVisitMetricsSnapshotBackup = v10->_interVisitMetricsSnapshotBackup;
    v10->_interVisitMetricsSnapshotBackup = 0;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    nextPredictedLOIs = v10->_nextPredictedLOIs;
    v10->_nextPredictedLOIs = v22;

  }
  return v10;
}

+ (id)visitStateTypeToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Invalid");
  else
    return off_24D815660[a3];
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)notifyObserversOfStateChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
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
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v12, "visitState:didChangeStateFromType:toType:", self, a3, a4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)notifyObserversOfMetricsHint:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "visitState:didIssueMetricsSubmissionHint:", self, a3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)setState:(unint64_t)a3
{
  unint64_t state;
  void *v5;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  state = self->_state;
  self->_state = a3;
  v5 = (void *)TAStatusLog;
  if (state == a3)
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAVisitState setState:].cold.1();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v5;
      +[TAVisitState visitStateTypeToString:](TAVisitState, "visitStateTypeToString:", state);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[TAVisitState visitStateTypeToString:](TAVisitState, "visitStateTypeToString:", self->_state);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_217877000, v7, OS_LOG_TYPE_DEFAULT, "#TAVisitState changing state from %@ to %@", (uint8_t *)&v11, 0x16u);

    }
    -[NSMutableArray removeAllObjects](self->_nextPredictedLOIs, "removeAllObjects");
    -[TAVisitState notifyObserversOfStateChangeFromState:toState:](self, "notifyObserversOfStateChangeFromState:toState:", state, self->_state);
  }
  return state != a3;
}

- (unint64_t)stateTransitionDecisionGivenTACLVisit:(id)a3
{
  id v4;
  void *v5;
  unint64_t state;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = v4;
  state = self->_state;
  if (state != 2)
  {
    if (state == 1)
    {
      if (-[TACircularBuffer count](self->_visitSnapshotBuffer, "count"))
      {
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isClosed");

        if (v17)
        {
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
            -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.4();
        }
        else if ((objc_msgSend(v5, "isTemporalOrderSensical") & 1) != 0)
        {
          if ((objc_msgSend(v5, "hasDepartureDate") & 1) != 0)
          {
            v7 = 1;
            goto LABEL_41;
          }
          v19 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
            -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.5(v19, v5);
        }
        else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.6();
        }
      }
      else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      {
        -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.3();
      }
    }
    else
    {
      if (state)
      {
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.1();
        goto LABEL_40;
      }
      if (objc_msgSend(v4, "hasArrivalDate") && (objc_msgSend(v5, "hasDepartureDate") & 1) != 0)
      {
        v7 = 4;
        goto LABEL_41;
      }
      if ((objc_msgSend(v5, "hasArrivalDate") & 1) != 0)
      {
        v7 = 3;
        goto LABEL_41;
      }
      v18 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
    }
    goto LABEL_40;
  }
  -[TACircularBuffer bufferCopy](self->_visitSnapshotBuffer, "bufferCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[TACircularBuffer bufferCopy](self->_visitSnapshotBuffer, "bufferCopy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "representativeVisit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrivalDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrivalDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

    if (v14 == 1)
    {
      v15 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.9(v15, v5);
      goto LABEL_40;
    }
  }
  else
  {

  }
  if (!objc_msgSend(v5, "hasArrivalDate") || !objc_msgSend(v5, "hasDepartureDate"))
  {
    if ((objc_msgSend(v5, "hasArrivalDate") & 1) != 0)
    {
      v7 = 2;
      goto LABEL_41;
    }
    v18 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
LABEL_30:
      -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.2(v18, v5);
LABEL_40:
    v7 = 0;
    goto LABEL_41;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.7();
  v7 = 5;
LABEL_41:

  return v7;
}

- (void)performStateTransitionDecision:(unint64_t)a3 store:(id)a4 visit:(id)a5 andAppendOutgoingRequestsTo:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  TAVisitState *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  switch(a3)
  {
    case 0uLL:
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        -[TAVisitState performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:].cold.2();
      break;
    case 1uLL:
      -[TAVisitState closeVisitSnapshotWithStore:visit:](self, "closeVisitSnapshotWithStore:visit:", v10, v11);
      if (-[TAVisitState evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:](self, "evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:", v10, v12) == 1)
      {
        -[TAVisitState openInterVisitSnapshotWithStore:departureVisit:](self, "openInterVisitSnapshotWithStore:departureVisit:", v10, v11);
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:](self, "issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:", v13, v10, v12);

        -[TAVisitState notifyObserversOfMetricsHint:](self, "notifyObserversOfMetricsHint:", 0);
        -[TAVisitState notifyObserversOfMetricsHint:](self, "notifyObserversOfMetricsHint:", 2);
      }
      goto LABEL_36;
    case 2uLL:
      -[TAVisitState openVisitSnapshotWithStore:visit:andAppendOutgoingRequestsTo:](self, "openVisitSnapshotWithStore:visit:andAppendOutgoingRequestsTo:", v10, v11, v12);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      -[NSMutableDictionary allValues](self->_importantLois, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v60;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v60 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v18), "bufferCopy");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[TAVisitState labelLoiTypeForLastVisitSnapshot:](self, "labelLoiTypeForLastVisitSnapshot:", v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
        }
        while (v16);
      }

      -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clock");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitState issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:clock:andAppendOutgoingRequestsTo:](self, "issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:clock:andAppendOutgoingRequestsTo:", v20, v21, v12);

      -[TAVisitState closeLatestInterVisitSnapshotWithStore:arrivalVisit:](self, "closeLatestInterVisitSnapshotWithStore:arrivalVisit:", v10, v11);
      -[TAVisitState notifyObserversOfMetricsHint:](self, "notifyObserversOfMetricsHint:", 1);
      goto LABEL_24;
    case 3uLL:
      -[TAVisitState openVisitSnapshotWithStore:visit:andAppendOutgoingRequestsTo:](self, "openVisitSnapshotWithStore:visit:andAppendOutgoingRequestsTo:", v10, v11, v12);
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      -[NSMutableDictionary allValues](self->_importantLois, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v56;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v56 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v26), "bufferCopy");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[TAVisitState labelLoiTypeForLastVisitSnapshot:](self, "labelLoiTypeForLastVisitSnapshot:", v27);

            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        }
        while (v24);
      }

      -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clock");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitState issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:clock:andAppendOutgoingRequestsTo:](self, "issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:clock:andAppendOutgoingRequestsTo:", v28, v29, v12);

LABEL_24:
      -[TAVisitState openInterVisitBackupSnapshotWithArrivalVisit:](self, "openInterVisitBackupSnapshotWithArrivalVisit:", v11);
      v30 = self;
      v31 = 1;
      goto LABEL_37;
    case 4uLL:
      if (-[TAVisitState shouldCreateNewVisitSnapshotFromUnknownState:](self, "shouldCreateNewVisitSnapshotFromUnknownState:", v11))
      {
        -[TAVisitState openVisitSnapshotWithStore:visit:andAppendOutgoingRequestsTo:](self, "openVisitSnapshotWithStore:visit:andAppendOutgoingRequestsTo:", v10, v11, v12);
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        -[NSMutableDictionary allValues](self->_importantLois, "allValues");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v52;
          do
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v52 != v35)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v36), "bufferCopy");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[TAVisitState labelLoiTypeForLastVisitSnapshot:](self, "labelLoiTypeForLastVisitSnapshot:", v37);

              ++v36;
            }
            while (v34 != v36);
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
          }
          while (v34);
        }

        -[TAVisitState closeVisitSnapshotWithStore:visit:](self, "closeVisitSnapshotWithStore:visit:", v10, v11);
      }
      -[TAVisitState openInterVisitSnapshotWithStore:departureVisit:](self, "openInterVisitSnapshotWithStore:departureVisit:", v10, v11);
      -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:](self, "issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:", v39, v10, v12);

      }
LABEL_36:
      v30 = self;
      v31 = 2;
LABEL_37:
      -[TAVisitState setState:](v30, "setState:", v31);
      break;
    case 5uLL:
      -[TAVisitState closeLatestInterVisitSnapshotWithStore:arrivalVisit:](self, "closeLatestInterVisitSnapshotWithStore:arrivalVisit:", v10, v11);
      -[TAVisitState notifyObserversOfMetricsHint:](self, "notifyObserversOfMetricsHint:", 1);
      -[TAVisitState openVisitSnapshotWithStore:visit:andAppendOutgoingRequestsTo:](self, "openVisitSnapshotWithStore:visit:andAppendOutgoingRequestsTo:", v10, v11, v12);
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[NSMutableDictionary allValues](self->_importantLois, "allValues", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v48;
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v48 != v43)
              objc_enumerationMutation(v40);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v44), "bufferCopy");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[TAVisitState labelLoiTypeForLastVisitSnapshot:](self, "labelLoiTypeForLastVisitSnapshot:", v45);

            ++v44;
          }
          while (v42 != v44);
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        }
        while (v42);
      }

      -[TAVisitState openInterVisitBackupSnapshotWithArrivalVisit:](self, "openInterVisitBackupSnapshotWithArrivalVisit:", v11);
      -[TAVisitState closeVisitSnapshotWithStore:visit:](self, "closeVisitSnapshotWithStore:visit:", v10, v11);
      if (-[TAVisitState evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:](self, "evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:", v10, v12) == 1)
      {
        -[TAVisitState openInterVisitSnapshotWithStore:departureVisit:](self, "openInterVisitSnapshotWithStore:departureVisit:", v10, v11);
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:](self, "issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:", v46, v10, v12);

        -[TAVisitState notifyObserversOfMetricsHint:](self, "notifyObserversOfMetricsHint:", 0);
        -[TAVisitState notifyObserversOfMetricsHint:](self, "notifyObserversOfMetricsHint:", 2);
      }
      break;
    default:
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
        -[TAVisitState performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:].cold.1();
      break;
  }

}

- (void)openVisitSnapshotWithStore:(id)a3 visit:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  TAVisitSnapshot *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[16];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v29 = a5;
  v10 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_DEFAULT, "#TAVisitState creating new snapshot", buf, 2u);
  }
  v11 = -[TAVisitSnapshot initWithTACLVisit:uniqueUTBufferCap:displayEventBufferSizeCap:maxNSigmaBetweenLastLocationAndVisit:]([TAVisitSnapshot alloc], "initWithTACLVisit:uniqueUTBufferCap:displayEventBufferSizeCap:maxNSigmaBetweenLastLocationAndVisit:", v9, -[TAVisitStateSettings uniqueUTObservationCapPerVisit](self->_settings, "uniqueUTObservationCapPerVisit"), -[TAVisitStateSettings visitDisplayBufferCapacity](self->_settings, "visitDisplayBufferCapacity"), -[TAVisitStateSettings maxNSigmaBetweenLastLocationAndVisit](self->_settings, "maxNSigmaBetweenLastLocationAndVisit"));
  v12 = (void *)MEMORY[0x24BDD1508];
  objc_msgSend(v9, "arrivalDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "departureDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createIntervalSafelyWithStartDate:endDate:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "eventBuffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "getAllTAEventsOf:between:", objc_opt_class(), v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        -[TAVisitSnapshot addUTAdvertisement:](v11, "addUTAdvertisement:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v20);
  }

  -[TAVisitState getDisplayEventsWithFirstPrecedingInInterval:store:](self, "getDisplayEventsWithFirstPrecedingInInterval:store:", v15, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
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
        -[TAVisitSnapshot addSystemState:](v11, "addSystemState:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v27++));
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v25);
  }
  v28 = -[TACircularBuffer add:](self->_visitSnapshotBuffer, "add:", v11);

}

- (void)closeVisitSnapshotWithStore:(id)a3 visit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  TACircularBuffer *visitSnapshotBuffer;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(v5, "hasDepartureDate") & 1) != 0)
  {
    -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isClosed");

      if (v8)
      {
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TAVisitState closeVisitSnapshotWithStore:visit:].cold.2();
      }
      else
      {
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "setDepartureVisit:", v5);

        if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TAVisitState closeVisitSnapshotWithStore:visit:].cold.3();
        v27 = v5;
        v11 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          visitSnapshotBuffer = self->_visitSnapshotBuffer;
          v13 = v11;
          -[TACircularBuffer lastObject](visitSnapshotBuffer, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "latestUtAdvertisements");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134349056;
          v34 = objc_msgSend(v15, "count");
          _os_log_impl(&dword_217877000, v13, OS_LOG_TYPE_DEFAULT, "#TAVisitState closing snapshot. Closed snapshot has %{public}lu objects.", buf, 0xCu);

        }
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "latestUtAdvertisements");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "allKeys");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v29 != v21)
                objc_enumerationMutation(v18);
              v23 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
              {
                v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                v25 = v23;
                objc_msgSend(v24, "hexString");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v34 = (uint64_t)v26;
                _os_log_impl(&dword_217877000, v25, OS_LOG_TYPE_DEFAULT, "#TAVisitState keys in snapshot:%{private}@", buf, 0xCu);

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v20);
        }

        v5 = v27;
      }
    }
    else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      -[TAVisitState closeVisitSnapshotWithStore:visit:].cold.1();
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
  {
    -[TAVisitState closeVisitSnapshotWithStore:visit:].cold.4();
  }

}

- (void)updateImportantLOIs:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *importantLois;
  void *v9;
  TACircularBuffer *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  TAVisitState *v32;

  v6 = a3;
  v7 = a4;
  importantLois = self->_importantLois;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](importantLois, "objectForKey:", v9);
  v10 = (TACircularBuffer *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = -[TACircularBuffer initWithCapacity:]([TACircularBuffer alloc], "initWithCapacity:", -[TAVisitStateSettings loiBufferPerTypeCapacity](self->_settings, "loiBufferPerTypeCapacity"));
    v11 = self->_importantLois;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, v12);

  }
  -[TACircularBuffer bufferCopy](v10, "bufferCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, -[TACircularBuffer count](v10, "count"), 1024, &__block_literal_global_3);

  if (v14 >= -[TACircularBuffer count](v10, "count"))
    v16 = -[TACircularBuffer add:](v10, "add:", v6);
  else
    v15 = -[TACircularBuffer insert:at:](v10, "insert:at:", v6, v14);
  -[TACircularBuffer firstObject](v10, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v18);
  v20 = v19;
  -[TAVisitStateSettings loiBufferTimeIntervalOfRetention](self->_settings, "loiBufferTimeIntervalOfRetention");
  v22 = v21;

  if (v20 >= v22)
  {
    v23 = (void *)MEMORY[0x24BDD1758];
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __48__TAVisitState_updateImportantLOIs_currentDate___block_invoke_2;
    v30 = &unk_24D815640;
    v31 = v7;
    v32 = self;
    objc_msgSend(v23, "predicateWithBlock:", &v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[TACircularBuffer removeUntilFirstPredicateFail:](v10, "removeUntilFirstPredicateFail:", v24, v27, v28, v29, v30);

  }
  -[TACircularBuffer bufferCopy](v10, "bufferCopy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAVisitState labelLoiTypeForLastVisitSnapshot:](self, "labelLoiTypeForLastVisitSnapshot:", v26);

}

uint64_t __48__TAVisitState_updateImportantLOIs_currentDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "getDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

BOOL __48__TAVisitState_updateImportantLOIs_currentDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "getDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "loiBufferTimeIntervalOfRetention");
  v8 = v6 > v7;

  return v8;
}

- (void)labelLoiTypeForLastVisitSnapshot:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
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
  if (-[TACircularBuffer count](self->_visitSnapshotBuffer, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
          -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateLoiType:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:(id)a3 clock:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  -[TAScanRequest evaluateVisitEntry:clock:](self->_scanRequest, "evaluateVisitEntry:clock:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v9, "addObject:", v8);

}

- (void)issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:(id)a3 store:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  TAScanRequest *scanRequest;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isClosed") & 1) != 0)
  {
    objc_msgSend(v8, "representativeVisit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "departureDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "clock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "compare:", v12);

    if (v14 == -1)
    {
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        -[TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:].cold.1();
    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD1508];
      objc_msgSend(v9, "clock");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v12;
      objc_msgSend(v15, "createIntervalSafelyWithStartDate:endDate:", v12, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      scanRequest = self->_scanRequest;
      -[TAVisitState getDisplayEventsWithFirstPrecedingInInterval:store:](self, "getDisplayEventsWithFirstPrecedingInInterval:store:", v17, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "eventBuffer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "getAllTAEventsOf:between:", objc_opt_class(), v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deviceRecord");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clock");
      v23 = v10;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAScanRequest evaluateInterVisitAfterVisitExit:displayEvents:advertisements:deviceRecord:clock:](scanRequest, "evaluateInterVisitAfterVisitExit:displayEvents:advertisements:deviceRecord:clock:", v8, v19, v21, v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v23;
      if (v25)
        objc_msgSend(v23, "addObject:", v25);

      v12 = v26;
    }

  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
  {
    -[TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:].cold.2();
  }

}

- (void)openInterVisitSnapshotWithStore:(id)a3 departureVisit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TAInterVisitMetricsSnapshot *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "departureDate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1508];
  objc_msgSend(v6, "departureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "createIntervalSafelyWithStartDate:endDate:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TAInterVisitMetricsSnapshot initWithTime:maxUniqueAddresses:]([TAInterVisitMetricsSnapshot alloc], "initWithTime:maxUniqueAddresses:", v16, -[TAVisitStateSettings uniqueUTObservationCapPerVisit](self->_settings, "uniqueUTObservationCapPerVisit"));
  -[TAVisitStateSettings thresholdOfLocationRelevance](self->_settings, "thresholdOfLocationRelevance");
  +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v7, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:](v12, "updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:", v13, v7, v14, 0);

  v15 = -[TACircularBuffer add:](self->_interVisitMetricSnapshotBuffer, "add:", v12);
}

- (void)closeLatestInterVisitSnapshotWithStore:(id)a3 arrivalVisit:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (-[TACircularBuffer count](self->_interVisitMetricSnapshotBuffer, "count"))
  {
    -[TACircularBuffer lastObject](self->_interVisitMetricSnapshotBuffer, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isClosed");

    if ((v8 & 1) == 0)
    {
      -[TACircularBuffer lastObject](self->_interVisitMetricSnapshotBuffer, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastUpdateTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrivalDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "laterDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BDD1508];
      objc_msgSend(v9, "lastUpdateTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createIntervalSafelyWithStartDate:endDate:", v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[TAVisitStateSettings thresholdOfLocationRelevance](self->_settings, "thresholdOfLocationRelevance");
      +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v17, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:", v16, v17, v12, 1);

      objc_msgSend(v9, "visitEntryDelayCorrection:store:", v6, v17);
    }
  }

}

- (void)openInterVisitBackupSnapshotWithArrivalVisit:(id)a3
{
  TAInterVisitMetricsSnapshot *v4;
  TAInterVisitMetricsSnapshot *interVisitMetricsSnapshotBackup;
  id v6;

  objc_msgSend(a3, "arrivalDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[TAInterVisitMetricsSnapshot initWithTime:maxUniqueAddresses:]([TAInterVisitMetricsSnapshot alloc], "initWithTime:maxUniqueAddresses:", v6, -[TAVisitStateSettings uniqueUTObservationCapPerVisit](self->_settings, "uniqueUTObservationCapPerVisit"));
  interVisitMetricsSnapshotBackup = self->_interVisitMetricsSnapshotBackup;
  self->_interVisitMetricsSnapshotBackup = v4;

}

- (void)resetInterVisitBackupSnapshot
{
  TAInterVisitMetricsSnapshot *interVisitMetricsSnapshotBackup;

  interVisitMetricsSnapshotBackup = self->_interVisitMetricsSnapshotBackup;
  self->_interVisitMetricsSnapshotBackup = 0;

}

- (unint64_t)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  int v27;
  _DWORD v28[7];

  *(_QWORD *)&v28[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[TACircularBuffer count](self->_visitSnapshotBuffer, "count"))
  {
    -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isClosed");

    if ((v9 & 1) != 0)
    {
      -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitStateSettings qualitySnapshotDwellDuration](self->_settings, "qualitySnapshotDwellDuration");
      v12 = v11;
      -[TAVisitStateSettings qualitySnapshotDisplayOnDuration](self->_settings, "qualitySnapshotDisplayOnDuration");
      v14 = objc_msgSend(v10, "evaluateSnapshotQualityWithMinDwellDuration:minDisplayOnDuration:", v12, v13);
      v15 = v14;
      if (v14 == 1)
      {
        v22 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_217877000, v22, OS_LOG_TYPE_DEFAULT, "#TAVisitState Visit snapshot quality is good.", (uint8_t *)&v27, 2u);
        }
        goto LABEL_24;
      }
      if (v14 != 2)
      {
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
          -[TAVisitState evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:].cold.2();
        goto LABEL_24;
      }
      v16 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        objc_msgSend(v10, "representativeVisit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138477827;
        *(_QWORD *)v28 = v19;
        _os_log_impl(&dword_217877000, v17, OS_LOG_TYPE_DEFAULT, "#TAVisitState Visit snapshot quality is bad. Performing operations to remove bad visit: %{private}@", (uint8_t *)&v27, 0xCu);

      }
      -[TACircularBuffer lastObject](self->_interVisitMetricSnapshotBuffer, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[TACircularBuffer lastObject](self->_interVisitMetricSnapshotBuffer, "lastObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "updateWithInterVisitMetricsSnapshot:store:", self->_interVisitMetricsSnapshotBackup, v6);
      }
      else
      {
        if (!self->_interVisitMetricsSnapshotBackup)
        {
LABEL_23:
          v25 = -[TACircularBuffer removeLastObject](self->_visitSnapshotBuffer, "removeLastObject");
LABEL_24:
          -[TAVisitState resetInterVisitBackupSnapshot](self, "resetInterVisitBackupSnapshot");

          goto LABEL_25;
        }
        v23 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 68289026;
          v28[0] = 0;
          LOWORD(v28[1]) = 2082;
          *(_QWORD *)((char *)&v28[1] + 2) = "";
          _os_log_impl(&dword_217877000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState using intervisit backup for first intervisit snapshot\"}", (uint8_t *)&v27, 0x12u);
        }
        v24 = -[TACircularBuffer add:](self->_interVisitMetricSnapshotBuffer, "add:", self->_interVisitMetricsSnapshotBackup);
        -[TACircularBuffer lastObject](self->_visitSnapshotBuffer, "lastObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:](self, "issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:", v21, v6, v7);
      }

      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      -[TAVisitState evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:].cold.3();
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
  {
    -[TAVisitState evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:].cold.1();
  }
  v15 = 0;
LABEL_25:

  return v15;
}

- (id)getDisplayEventsWithFirstPrecedingInInterval:(id)a3 store:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "eventBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAllTAEventsOf:andEventSubtype:between:", objc_opt_class(), 2, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD1508];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "createIntervalSafelyWithStartDate:endDate:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "eventBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "getAllTAEventsOf:andEventSubtype:between:", objc_opt_class(), 2, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v14, "count")
    || objc_msgSend(v14, "count")
    && objc_msgSend(v8, "count")
    && (objc_msgSend(v14, "lastObject"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "firstObject"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "isEqual:", v16),
        v16,
        v15,
        v17))
  {
    v18 = v8;
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v14, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithObject:", v20);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObjectsFromArray:", v8);
  }

  return v18;
}

BOOL __56__TAVisitState_purgeVisitSnapshotBufferWithCurrentDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  void *v12;

  v3 = a2;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = v3;
    if (objc_msgSend(v4, "isClosed"))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v4, "representativeVisit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "departureDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v7);
      v9 = v8;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "snapshotBufferTimeIntervalOfRetention");
      v11 = v9 > v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v12 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      __56__TAVisitState_purgeVisitSnapshotBufferWithCurrentDate___block_invoke_cold_1(v12);
    v11 = 1;
  }

  return v11;
}

BOOL __61__TAVisitState_purgeInterVisitSnapshotBufferWithCurrentDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;
  void *v11;

  v3 = a2;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = v3;
    if (objc_msgSend(v4, "isClosed"))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v4, "lastUpdateTime");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      v8 = v7;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "snapshotBufferTimeIntervalOfRetention");
      v10 = v8 > v9;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v11 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      __61__TAVisitState_purgeInterVisitSnapshotBufferWithCurrentDate___block_invoke_cold_1(v11);
    v10 = 1;
  }

  return v10;
}

- (id)getLatestValidVisitArrivalDate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TACircularBuffer bufferCopy](self->_visitSnapshotBuffer, "bufferCopy", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isClosed") & 1) != 0)
        {
          objc_msgSend(v7, "representativeVisit");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "arrivalDate");
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)getLatestValidVisit
{
  void *v2;
  void *v3;
  void *v4;
  _OWORD v6[4];
  _BYTE v7[128];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, sizeof(v6));
  -[TACircularBuffer bufferCopy](self->_visitSnapshotBuffer, "bufferCopy", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v6, v7, 16))
  {
    objc_msgSend(**((id **)&v6[0] + 1), "representativeVisit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)mergeWithAnotherTAVisitState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  void *v37;
  TACircularBuffer *visitSnapshotBuffer;
  NSObject *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  uint8_t buf[4];
  int v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  unint64_t v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v47 = a3;
  objc_msgSend(v47, "visitSnapshotBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bufferCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        if (objc_msgSend(v12, "isClosed"))
        {
          v13 = -[TACircularBuffer insert:at:](self->_visitSnapshotBuffer, "insert:at:", v12, 0);
          ++v9;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v47, "interVisitMetricSnapshotBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bufferCopy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reverseObjectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v57 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        if (objc_msgSend(v22, "isClosed"))
        {
          v23 = -[TACircularBuffer insert:at:](self->_interVisitMetricSnapshotBuffer, "insert:at:", v22, 0);
          ++v19;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }
  v43 = v19;
  v44 = v9;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v47, "importantLois");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v79, 16);
  if (v24)
  {
    v25 = v24;
    v46 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v53 != v46)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k);
        objc_msgSend(v47, "importantLois");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v29, "bufferCopy");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v78, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v49;
          do
          {
            for (m = 0; m != v32; ++m)
            {
              if (*(_QWORD *)v49 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * m);
              objc_msgSend(v35, "getDate");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[TAVisitState updateImportantLOIs:currentDate:](self, "updateImportantLOIs:currentDate:", v35, v36);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v78, 16);
          }
          while (v32);
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v79, 16);
    }
    while (v25);
  }

  v37 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    visitSnapshotBuffer = self->_visitSnapshotBuffer;
    v39 = v37;
    v40 = -[TACircularBuffer count](visitSnapshotBuffer, "count");
    v41 = -[TACircularBuffer count](self->_interVisitMetricSnapshotBuffer, "count");
    -[TAVisitState importantLois](self, "importantLois");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68290307;
    v65 = 0;
    v66 = 2082;
    v67 = "";
    v68 = 2049;
    v69 = v44;
    v70 = 2049;
    v71 = v43;
    v72 = 2049;
    v73 = v40;
    v74 = 2049;
    v75 = v41;
    v76 = 2113;
    v77 = v42;
    _os_log_impl(&dword_217877000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState merging with other TAVisitState\", \"numVisitSnapshotsAttemptedToAdd\":%{private}llu, \"numInterVisitSnapshotsAttemptedToAdded\":%{private}llu, \"self.numVisitSnapshot\":%{private}lu, \"self.numInterVisitSnapshot\":%{private}lu, \"self.importantLois\":\"%{private}@\"}", buf, 0x44u);

  }
}

- (BOOL)shouldCreateNewVisitSnapshotFromUnknownState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isTemporalOrderSensical") && objc_msgSend(v4, "hasDepartureDate"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[TAVisitState visitSnapshotBuffer](self, "visitSnapshotBuffer", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bufferCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "representativeVisit");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dateInterval");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "dateInterval");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "intersectsDateInterval:", v14);

          if ((v15 & 1) != 0)
          {
            v16 = 0;
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_14:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)recoverInterVisitSnapshotWithArrivalVisit:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TAInterVisitMetricsSnapshot *v13;
  void *v14;
  TAInterVisitMetricsSnapshot *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "eventBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getEarliestEventDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrivalDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 && v10 && objc_msgSend(v10, "compare:", v9) != -1)
  {
    objc_msgSend(MEMORY[0x24BDD1508], "createIntervalSafelyWithStartDate:endDate:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [TAInterVisitMetricsSnapshot alloc];
    objc_msgSend(v12, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TAInterVisitMetricsSnapshot initWithTime:maxUniqueAddresses:](v13, "initWithTime:maxUniqueAddresses:", v14, -[TAVisitStateSettings uniqueUTObservationCapPerVisit](self->_settings, "uniqueUTObservationCapPerVisit"));

    -[TAVisitStateSettings thresholdOfLocationRelevance](self->_settings, "thresholdOfLocationRelevance");
    +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v7, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:](v15, "updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:", v16, v7, v17, 1);

    v18 = -[TACircularBuffer add:](self->_interVisitMetricSnapshotBuffer, "add:", v15);
    v19 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = v12;
      v27 = 2113;
      v28 = v6;
      _os_log_impl(&dword_217877000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState recovered intervisit snapshot\", \"interval\":\"%{private}@\", \"arrivalVisit\":\"%{private}@\"}", (uint8_t *)&v21, 0x26u);
    }

  }
  else
  {
    v20 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 68289026;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      _os_log_impl(&dword_217877000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState aborting intervisit snapshot recovery due unreasonable dates\"}", (uint8_t *)&v21, 0x12u);
    }
  }

}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("StateType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("State");
  v15[0] = v4;
  +[TAVisitState visitStateTypeToString:](TAVisitState, "visitStateTypeToString:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v8)
  {
    v9 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAVisitState description].cold.1(v9, (uint64_t)self, (uint64_t)v8);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TAVisitState *v5;
  TAVisitState *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v5 = (TAVisitState *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[TAVisitState state](self, "state");
      if (v7 != -[TAVisitState state](v6, "state"))
      {
        v11 = 0;
LABEL_40:

        goto LABEL_41;
      }
      -[TAVisitState visitSnapshotBuffer](self, "visitSnapshotBuffer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitState visitSnapshotBuffer](v6, "visitSnapshotBuffer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[TAVisitState visitSnapshotBuffer](self, "visitSnapshotBuffer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState visitSnapshotBuffer](v6, "visitSnapshotBuffer");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v10;
        if (!objc_msgSend(v10, "isEqual:"))
        {
          v11 = 0;
          goto LABEL_38;
        }
      }
      -[TAVisitState interVisitMetricSnapshotBuffer](self, "interVisitMetricSnapshotBuffer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitState interVisitMetricSnapshotBuffer](v6, "interVisitMetricSnapshotBuffer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[TAVisitState interVisitMetricSnapshotBuffer](self, "interVisitMetricSnapshotBuffer");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState interVisitMetricSnapshotBuffer](v6, "interVisitMetricSnapshotBuffer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v11 = 0;
LABEL_36:

LABEL_37:
          if (v8 == v9)
          {
LABEL_39:

            goto LABEL_40;
          }
LABEL_38:

          goto LABEL_39;
        }
      }
      -[TAVisitState importantLois](self, "importantLois");
      v14 = objc_claimAutoreleasedReturnValue();
      -[TAVisitState importantLois](v6, "importantLois");
      v15 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v14;
      v16 = v14 == v15;
      v17 = (void *)v15;
      if (!v16)
      {
        -[TAVisitState importantLois](self, "importantLois");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState importantLois](v6, "importantLois");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v11 = 0;
          v19 = v47;
LABEL_34:

LABEL_35:
          if (v12 == v13)
            goto LABEL_37;
          goto LABEL_36;
        }
      }
      -[TAVisitState settings](self, "settings");
      v20 = objc_claimAutoreleasedReturnValue();
      -[TAVisitState settings](v6, "settings");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v20;
      v44 = v17;
      if (v20 == v45)
      {
        v38 = v13;
      }
      else
      {
        v21 = v3;
        -[TAVisitState settings](self, "settings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState settings](v6, "settings");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v22;
        if (!objc_msgSend(v22, "isEqual:"))
        {
          v11 = 0;
          v25 = (void *)v45;
          v3 = v21;
LABEL_32:

LABEL_33:
          v17 = v44;
          v19 = v47;
          if (v47 == v44)
            goto LABEL_35;
          goto LABEL_34;
        }
        v38 = v13;
        v3 = v21;
      }
      -[TAVisitState scanRequest](self, "scanRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitState scanRequest](v6, "scanRequest");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v23 == (void *)v39)
      {
        v34 = v3;
        v35 = v12;
      }
      else
      {
        -[TAVisitState scanRequest](self, "scanRequest");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState scanRequest](v6, "scanRequest");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v24;
        if (!objc_msgSend(v24, "isEqual:"))
        {
          v11 = 0;
          v13 = v38;
          v31 = (void *)v39;
          goto LABEL_30;
        }
        v34 = v3;
        v35 = v12;
      }
      -[TAVisitState interVisitMetricsSnapshotBackup](self, "interVisitMetricsSnapshotBackup");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitState interVisitMetricsSnapshotBackup](v6, "interVisitMetricsSnapshotBackup");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

        v11 = 1;
      }
      else
      {
        v28 = (void *)v27;
        -[TAVisitState interVisitMetricsSnapshotBackup](self, "interVisitMetricsSnapshotBackup");
        v33 = v23;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitState interVisitMetricsSnapshotBackup](v6, "interVisitMetricsSnapshotBackup");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v29, "isEqual:", v30);

        v23 = v33;
      }
      v13 = v38;
      v31 = (void *)v39;
      v3 = v34;
      v12 = v35;
      if (v23 == (void *)v39)
      {
LABEL_31:

        v25 = (void *)v45;
        if (v46 == (void *)v45)
          goto LABEL_33;
        goto LABEL_32;
      }
LABEL_30:

      goto LABEL_31;
    }
    v11 = 0;
  }
LABEL_41:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVisitState)initWithCoder:(id)a3
{
  id v4;
  TAVisitState *v5;
  uint64_t v6;
  TAVisitStateSettings *settings;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  TACircularBuffer *visitSnapshotBuffer;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  TACircularBuffer *interVisitMetricSnapshotBuffer;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSMutableDictionary *importantLois;
  uint64_t v28;
  NSHashTable *observers;
  uint64_t v30;
  TAScanRequest *scanRequest;
  uint64_t v32;
  TAInterVisitMetricsSnapshot *interVisitMetricsSnapshotBackup;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TAVisitState;
  v5 = -[TAVisitState init](&v35, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Settings"));
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (TAVisitStateSettings *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("VisitBuffer"));
    v12 = objc_claimAutoreleasedReturnValue();
    visitSnapshotBuffer = v5->_visitSnapshotBuffer;
    v5->_visitSnapshotBuffer = (TACircularBuffer *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("InterVisitBuffer"));
    v18 = objc_claimAutoreleasedReturnValue();
    interVisitMetricSnapshotBuffer = v5->_interVisitMetricSnapshotBuffer;
    v5->_interVisitMetricSnapshotBuffer = (TACircularBuffer *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("LOIs"));
    v26 = objc_claimAutoreleasedReturnValue();
    importantLois = v5->_importantLois;
    v5->_importantLois = (NSMutableDictionary *)v26;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v28 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScanReq"));
    v30 = objc_claimAutoreleasedReturnValue();
    scanRequest = v5->_scanRequest;
    v5->_scanRequest = (TAScanRequest *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InterBackup"));
    v32 = objc_claimAutoreleasedReturnValue();
    interVisitMetricsSnapshotBackup = v5->_interVisitMetricsSnapshotBackup;
    v5->_interVisitMetricsSnapshotBackup = (TAInterVisitMetricsSnapshot *)v32;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("State"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_settings, CFSTR("Settings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visitSnapshotBuffer, CFSTR("VisitBuffer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interVisitMetricSnapshotBuffer, CFSTR("InterVisitBuffer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_importantLois, CFSTR("LOIs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scanRequest, CFSTR("ScanReq"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interVisitMetricsSnapshotBackup, CFSTR("InterBackup"));

}

- (unint64_t)lastStateTransition
{
  return self->_lastStateTransition;
}

- (NSMutableDictionary)importantLois
{
  return self->_importantLois;
}

- (NSMutableArray)nextPredictedLOIs
{
  return self->_nextPredictedLOIs;
}

- (void)setNextPredictedLOIs:(id)a3
{
  objc_storeStrong((id *)&self->_nextPredictedLOIs, a3);
}

- (TAVisitStateSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (TAScanRequest)scanRequest
{
  return self->_scanRequest;
}

- (void)setScanRequest:(id)a3
{
  objc_storeStrong((id *)&self->_scanRequest, a3);
}

- (TAInterVisitMetricsSnapshot)interVisitMetricsSnapshotBackup
{
  return self->_interVisitMetricsSnapshotBackup;
}

- (void)setInterVisitMetricsSnapshotBackup:(id)a3
{
  objc_storeStrong((id *)&self->_interVisitMetricsSnapshotBackup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interVisitMetricsSnapshotBackup, 0);
  objc_storeStrong((id *)&self->_scanRequest, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_nextPredictedLOIs, 0);
  objc_storeStrong((id *)&self->_importantLois, 0);
  objc_storeStrong((id *)&self->_interVisitMetricSnapshotBuffer, 0);
  objc_storeStrong((id *)&self->_visitSnapshotBuffer, 0);
}

- (void)ingestTAEvent:(void *)a1 store:(void *)a2 appendOutgoingRequestsTo:.cold.1(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_6(a1);
  objc_msgSend(a2, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_19(v4, v5);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_217877000, v6, v7, "#TAVisitState Considering to add %{private}s for snapshot", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4();
}

- (void)ingestTAEvent:(void *)a1 store:(void *)a2 appendOutgoingRequestsTo:.cold.2(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_6(a1);
  objc_msgSend(a2, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_19(v4, v5);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_217877000, v6, v7, "Updating %{private}s to snapshot", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4();
}

- (void)ingestTAEvent:(void *)a1 store:(void *)a2 appendOutgoingRequestsTo:.cold.3(void *a1, void *a2)
{
  void *v2;
  void *v3;
  objc_class *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  OUTLINED_FUNCTION_13(a1);
  v5 = (objc_class *)OUTLINED_FUNCTION_10();
  NSStringFromClass(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_12(v6, v7);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "description");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_16(v8, v9);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_2(&dword_217877000, v10, v11, "#TAVisitState not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)ingestTAEvent:(void *)a1 store:(void *)a2 appendOutgoingRequestsTo:.cold.4(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_6(a1);
  objc_msgSend(a2, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_19(v4, v5);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_217877000, v6, v7, "#TAVisitState Adding %{private}s to snapshot", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4();
}

- (void)setState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitState update did not change state on update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState unexpected state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)stateTransitionDecisionGivenTACLVisit:(void *)a1 .cold.2(void *a1, void *a2)
{
  void *v2;
  void *v3;
  objc_class *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  OUTLINED_FUNCTION_13(a1);
  v5 = (objc_class *)OUTLINED_FUNCTION_10();
  NSStringFromClass(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_12(v6, v7);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "description");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_16(v8, v9);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_2(&dword_217877000, v10, v11, "#TAVisitState not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState inside visit state without snapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState inside visit state with a closed snapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)stateTransitionDecisionGivenTACLVisit:(void *)a1 .cold.5(void *a1, void *a2)
{
  void *v2;
  void *v3;
  objc_class *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  OUTLINED_FUNCTION_13(a1);
  v5 = (objc_class *)OUTLINED_FUNCTION_10();
  NSStringFromClass(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_12(v6, v7);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "description");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_16(v8, v9);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_2(&dword_217877000, v10, v11, "#TAVisitState not considering %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitState received out of order departure and arrival date", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitState got a departure visit while outside a visit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)stateTransitionDecisionGivenTACLVisit:(void *)a1 .cold.9(void *a1, void *a2)
{
  void *v2;
  void *v3;
  objc_class *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  OUTLINED_FUNCTION_13(a1);
  v5 = (objc_class *)OUTLINED_FUNCTION_10();
  NSStringFromClass(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_12(v6, v7);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "description");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_16(v8, v9);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_2(&dword_217877000, v10, v11, "#TAVisitState not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState unrecognizable transition decision", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_217877000, v0, OS_LOG_TYPE_DEBUG, "#TAVisitState maintaining current state", v1, 2u);
  OUTLINED_FUNCTION_1_3();
}

- (void)closeVisitSnapshotWithStore:visit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState attempted to close visit snapshot that doesnt exist!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)closeVisitSnapshotWithStore:visit:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState attempted to close visit snapshot that is already closed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)closeVisitSnapshotWithStore:visit:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState failed to set departure visit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)closeVisitSnapshotWithStore:visit:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState attempted to close visit snapshot without valid visit departure date", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot called with a date in the future", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot called with an open snapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)updateInterVisitSnapshotWithStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitState Attempted to update inter-visit snapshot but there is no viable one. Something is wrong.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)updateInterVisitBackupSnapshotWithStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState Attempted to update inter-visit backup snapshot but there is no viable one.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState attempting to evaluate visit snapshot quality without visit snapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitState snapshot evaluation error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitState attempting to evaluate visit snapshot quality with an open visit snapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void __56__TAVisitState_purgeVisitSnapshotBufferWithCurrentDate___block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_4(&dword_217877000, v4, v5, "#TAVisitState seeing class type %@ in a predicate supposed to be used for TAVisitSnapshot object only", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

void __61__TAVisitState_purgeInterVisitSnapshotBufferWithCurrentDate___block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_4(&dword_217877000, v4, v5, "#TAVisitState seeing class type %@ in a predicate supposed to be used for TAInterVisitMetricsSnapshot object only", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)description
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v4 = OUTLINED_FUNCTION_6(a1);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  v8 = 2112;
  v9 = a3;
  _os_log_error_impl(&dword_217877000, v4, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", v7, 0x16u);

}

@end
