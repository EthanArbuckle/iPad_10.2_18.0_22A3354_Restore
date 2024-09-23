@implementation MesaCoreAnalytics

- (MesaCoreAnalytics)init
{
  MesaCoreAnalytics *v2;
  MesaCoreAnalytics *v3;
  BioLogLegacy *bioLog;
  BiometricAutoBugCapture *biometricABC;
  uint64_t v6;
  NSMutableArray *events;
  dispatch_queue_t v8;
  OS_dispatch_queue *analyticsDispatchQueue;
  MesaCoreAnalyticsEvent *currentEvent;
  MesaCoreAnalyticsMatchEvent *preArmedMatchEvent;
  MesaCoreAnalyticsMatchEvent *v12;
  MesaCoreAnalyticsMatchEvent *matchEvent;
  MesaCoreAnalyticsUnlockEvent *v14;
  MesaCoreAnalyticsUnlockEvent *unlockEvent;
  MesaCoreAnalyticsEnrollEvent *v16;
  MesaCoreAnalyticsEnrollEvent *enrollEvent;
  MesaCoreAnalyticsFingerTouchTimeEvent *v18;
  MesaCoreAnalyticsFingerTouchTimeEvent *fingerTouchTimeEvent;
  MesaCoreAnalyticsFingerLiftTimeEvent *v20;
  MesaCoreAnalyticsFingerLiftTimeEvent *fingerLiftTimeEvent;
  MesaCoreAnalyticsDailyEvent *v22;
  MesaCoreAnalyticsDailyEvent *dailyEvent;
  MesaCoreAnalyticsWeeklyEvent *v24;
  MesaCoreAnalyticsWeeklyEvent *weeklyEvent;
  CMDeviceOrientationManager *v26;
  CMDeviceOrientationManager *orientationManager;
  NSObject *v29;
  NSObject *v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)MesaCoreAnalytics;
  v2 = -[BiometricKitDStatistics init](&v31, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_internalSensorType = 0;
    v2->_currentBioOpType = 0;
    v2->_lastMatchAttemptTimeOffset = 0;
    v2->_displayOn = 0;
    bioLog = v2->_bioLog;
    v2->_bioLog = 0;

    biometricABC = v3->_biometricABC;
    v3->_biometricABC = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    events = v3->_events;
    v3->_events = (NSMutableArray *)v6;

    v8 = dispatch_queue_create("com.apple.mesad.analytics", 0);
    analyticsDispatchQueue = v3->_analyticsDispatchQueue;
    v3->_analyticsDispatchQueue = (OS_dispatch_queue *)v8;

    if (!v3->_analyticsDispatchQueue)
    {
      v29 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v33 = "_analyticsDispatchQueue";
        v34 = 2048;
        v35 = 0;
        v36 = 2080;
        v37 = "";
        v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
        v40 = 1024;
        v41 = 76;
        _os_log_impl(&dword_24B74E000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    currentEvent = v3->_currentEvent;
    v3->_currentEvent = 0;

    preArmedMatchEvent = v3->_preArmedMatchEvent;
    v3->_preArmedMatchEvent = 0;

    v12 = objc_alloc_init(MesaCoreAnalyticsMatchEvent);
    matchEvent = v3->_matchEvent;
    v3->_matchEvent = v12;

    -[NSMutableArray addObject:](v3->_events, "addObject:", v3->_matchEvent);
    v14 = objc_alloc_init(MesaCoreAnalyticsUnlockEvent);
    unlockEvent = v3->_unlockEvent;
    v3->_unlockEvent = v14;

    -[NSMutableArray addObject:](v3->_events, "addObject:", v3->_unlockEvent);
    v16 = objc_alloc_init(MesaCoreAnalyticsEnrollEvent);
    enrollEvent = v3->_enrollEvent;
    v3->_enrollEvent = v16;

    -[NSMutableArray addObject:](v3->_events, "addObject:", v3->_enrollEvent);
    v18 = objc_alloc_init(MesaCoreAnalyticsFingerTouchTimeEvent);
    fingerTouchTimeEvent = v3->_fingerTouchTimeEvent;
    v3->_fingerTouchTimeEvent = v18;

    -[NSMutableArray addObject:](v3->_events, "addObject:", v3->_fingerTouchTimeEvent);
    v20 = objc_alloc_init(MesaCoreAnalyticsFingerLiftTimeEvent);
    fingerLiftTimeEvent = v3->_fingerLiftTimeEvent;
    v3->_fingerLiftTimeEvent = v20;

    -[NSMutableArray addObject:](v3->_events, "addObject:", v3->_fingerLiftTimeEvent);
    v22 = -[BiometricKitCoreAnalyticsEvent initWithPersistedDataWithName:]([MesaCoreAnalyticsDailyEvent alloc], "initWithPersistedDataWithName:", CFSTR("com.apple.biometrickit.mesa.dailyUpdate"));
    dailyEvent = v3->_dailyEvent;
    v3->_dailyEvent = v22;

    -[NSMutableArray addObject:](v3->_events, "addObject:", v3->_dailyEvent);
    v24 = -[BiometricKitCoreAnalyticsEvent initWithPersistedDataWithName:]([MesaCoreAnalyticsWeeklyEvent alloc], "initWithPersistedDataWithName:", CFSTR("com.apple.biometrickit.mesa.weeklyUpdate"));
    weeklyEvent = v3->_weeklyEvent;
    v3->_weeklyEvent = v24;

    -[NSMutableArray addObject:](v3->_events, "addObject:", v3->_weeklyEvent);
    if (objc_msgSend(MEMORY[0x24BDC13C0], "isAvailable"))
    {
      v26 = (CMDeviceOrientationManager *)objc_alloc_init(MEMORY[0x24BDC13C0]);
      orientationManager = v3->_orientationManager;
      v3->_orientationManager = v26;

      if (!v3->_orientationManager)
      {
        if (__osLog)
          v30 = __osLog;
        else
          v30 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v33 = "_orientationManager";
          v34 = 2048;
          v35 = 0;
          v36 = 2080;
          v37 = "";
          v38 = 2080;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
          v40 = 1024;
          v41 = 100;
          _os_log_impl(&dword_24B74E000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
    }
    v3->_totalScanCount = 0;
    v3->_totalScanGroupCount = 0;
  }
  return v3;
}

+ (id)statistics
{
  return objc_alloc_init((Class)a1);
}

- (void)updateBioLog:(id)a3
{
  BioLogLegacy *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (BioLogLegacy *)a3;
  if (self->_bioLog != v5)
  {
    objc_storeStrong((id *)&self->_bioLog, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_events;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "updateBioLog:", v5, (_QWORD)v11);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)serviceMatch
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  objc_super v5;
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics serviceMatch\n", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics serviceMatch](&v5, sel_serviceMatch);
  v4 = self;
  objc_sync_enter(v4);
  objc_sync_exit(v4);

}

- (void)initSensor
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics initSensor\n", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics initSensor](&v6, sel_initSensor);
  v4 = self;
  objc_sync_enter(v4);
  -[BiometricKitDStatistics server](v4, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalytics setInternalSensorType:](v4, "setInternalSensorType:", objc_msgSend(v5, "getSensorType"));

  objc_sync_exit(v4);
}

- (void)setBiometricABC:(id)a3
{
  BiometricAutoBugCapture *v5;
  NSObject *v6;
  NSObject *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (BiometricAutoBugCapture *)a3;
  v6 = MEMORY[0x24BDACB70];
  if (__osLog)
    v7 = __osLog;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = (const char *)v5;
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics setBiometricABC: %@\n", buf, 0xCu);
  }
  if (v5)
  {
    if (self->_biometricABC != v5)
    {
      objc_storeStrong((id *)&self->_biometricABC, a3);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = self->_events;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setBiometricABC:", v5, (_QWORD)v14);
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

    }
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v6;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "biometricABC != ((void *)0)";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
      v27 = 1024;
      v28 = 161;
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }

}

- (void)startBioOperation:(id)a3
{
  id v4;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  MesaCoreAnalyticsEvent *currentEvent;
  NSObject *analyticsDispatchQueue;
  objc_super v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics startBioOperation: %@\n", buf, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  v6->_currentBioOpType = objc_msgSend(v4, "type");
  currentEvent = v6->_currentEvent;
  v6->_currentEvent = 0;

  if (objc_msgSend(v4, "type") == 1)
    -[MesaCoreAnalytics startEnrollOperation:](v6, "startEnrollOperation:", v4);
  if (v6->_orientationManager)
  {
    analyticsDispatchQueue = v6->_analyticsDispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__MesaCoreAnalytics_startBioOperation___block_invoke;
    block[3] = &unk_251CA06E0;
    block[4] = v6;
    dispatch_async(analyticsDispatchQueue, block);
  }
  objc_sync_exit(v6);

  v9.receiver = v6;
  v9.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics startBioOperation:](&v9, sel_startBioOperation_, v4);

}

void __39__MesaCoreAnalytics_startBioOperation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 312))
  {
    v3 = *(void **)(v1 + 304);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__MesaCoreAnalytics_startBioOperation___block_invoke_2;
    v6[3] = &unk_251CA0B08;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "startDeviceOrientationUpdatesToQueue:withHandler:", v4, v6);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 312) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceOrientationBlocking");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) = objc_msgSend(v5, "orientation");

  }
}

void __39__MesaCoreAnalytics_startBioOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 296);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__MesaCoreAnalytics_startBioOperation___block_invoke_3;
  v7[3] = &unk_251CA0818;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __39__MesaCoreAnalytics_startBioOperation___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) = objc_msgSend(*(id *)(a1 + 40), "orientation");
  if (__osLog)
    v2 = __osLog;
  else
    v2 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_24B74E000, v2, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics deviceOrientationUpdate: %lu\n", (uint8_t *)&v4, 0xCu);
  }
}

- (void)stopBioOperation
{
  NSObject *v3;
  NSObject *analyticsDispatchQueue;
  _QWORD block[5];
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics stopBioOperation\n", buf, 2u);
  }
  if (self->_orientationManager)
  {
    analyticsDispatchQueue = self->_analyticsDispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__MesaCoreAnalytics_stopBioOperation__block_invoke;
    block[3] = &unk_251CA06E0;
    block[4] = self;
    dispatch_async(analyticsDispatchQueue, block);
  }
}

uint64_t __37__MesaCoreAnalytics_stopBioOperation__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 312))
  {
    *(_BYTE *)(v1 + 312) = 0;
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 304), "stopDeviceOrientationUpdates");
  }
  return result;
}

- (void)cancel
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  objc_super v5;
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics cancel\n", buf, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  v4->_currentBioOpType = 0;
  -[BiometricKitCoreAnalyticsEvent setEventCanceled:](v4->_currentEvent, "setEventCanceled:", MEMORY[0x24BDBD1C8]);
  -[MesaCoreAnalytics stopBioOperation](v4, "stopBioOperation");
  objc_sync_exit(v4);

  v5.receiver = v4;
  v5.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics cancel](&v5, sel_cancel);
}

- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4
{
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v7 = __osLog;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v10 = a3;
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics timestampEvent: %lu absoluteTime: %llu\n", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics timestampEvent:absoluteTime:](&v8, sel_timestampEvent_absoluteTime_, a3, a4);
}

- (void)startMatchOperation:(id)a3
{
  id v4;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics startMatchOperation: %@\n", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics startMatchOperation:](&v7, sel_startMatchOperation_, v4);
  v6 = self;
  objc_sync_enter(v6);
  v6->_lastMatchAttemptTimeOffset = 0;
  -[MesaCoreAnalytics startMatchAttempt:](v6, "startMatchAttempt:", v4);
  objc_sync_exit(v6);

}

- (void)startMatchAttempt:(id)a3
{
  id v4;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  MesaCoreAnalyticsMatchEvent *matchEvent;
  void *v8;
  MesaCoreAnalyticsMatchEvent *v9;
  void *v10;
  void *v11;
  MesaCoreAnalyticsMatchEvent *v12;
  MesaCoreAnalyticsMatchEvent *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics startMatchAttempt: %@\n", (uint8_t *)&v15, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_currentEvent, v6->_matchEvent);
  -[MesaCoreAnalyticsMatchEvent reset](v6->_matchEvent, "reset");
  -[MesaCoreAnalyticsMatchEvent setMatchOperation:](v6->_matchEvent, "setMatchOperation:", v4);
  -[MesaCoreAnalyticsMatchEvent setMatchModeWith:](v6->_matchEvent, "setMatchModeWith:", -[BiometricKitDStatistics lastStartedMatch](v6, "lastStartedMatch"));
  matchEvent = v6->_matchEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[BiometricKitDStatistics lastMatchUseCase](v6, "lastMatchUseCase"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsMatchEvent setMatchUseCase:](matchEvent, "setMatchUseCase:", v8);

  -[MesaCoreAnalyticsMatchEvent setMatchTypeWith:](v6->_matchEvent, "setMatchTypeWith:", v4);
  v9 = v6->_matchEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v4, "userID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalytics getEnrolledIdentitiesCountForUser:](v6, "getEnrolledIdentitiesCountForUser:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsMatchEvent setMatchIdentityCount:](v9, "setMatchIdentityCount:", v11);

  v12 = v6->_matchEvent;
  -[BiometricKitDStatistics modulationRatio](v6, "modulationRatio");
  -[MesaCoreAnalyticsMatchEvent setSensorModulationRatioWith:](v12, "setSensorModulationRatioWith:");
  v13 = v6->_matchEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6->_displayOn);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitCoreAnalyticsEvent setDisplayOn:](v13, "setDisplayOn:", v14);

  objc_sync_exit(v6);
}

- (void)matchResult:(id)a3 withDictionary:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  MesaCoreAnalytics *v10;
  id *p_matchEvent;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MesaCoreAnalyticsMatchEvent *preArmedMatchEvent;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = a4;
  v8 = MEMORY[0x24BDACB70];
  if (__osLog)
    v9 = __osLog;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics matchResult: %@ withDictionary: %@\n", buf, 0x16u);
  }
  v10 = self;
  objc_sync_enter(v10);
  p_matchEvent = (id *)&v10->_matchEvent;
  if (v10->_currentEvent == &v10->_matchEvent->super)
  {
    if (v10->_preArmedMatchEvent)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchDetailImageMetadata"));
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = objc_msgSend(v12, "bytes");

      if (v13)
      {
        v14 = *(_QWORD *)(v13 + 59);
        -[MesaCoreAnalyticsMatchEvent imageAbsoluteTimeId](v10->_preArmedMatchEvent, "imageAbsoluteTimeId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = v14 == objc_msgSend(v15, "unsignedLongLongValue");

        if ((_DWORD)v14)
        {
          if (__osLog)
            v16 = __osLog;
          else
            v16 = v8;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics matchResult: use _preArmedMatchEvent\n", buf, 2u);
          }
          objc_msgSend(*p_matchEvent, "matchOperation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*p_matchEvent, "matchMode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*p_matchEvent, "matchUseCase");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*p_matchEvent, "matchType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*p_matchEvent, "matchIdentityCount");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)&v10->_matchEvent, v10->_preArmedMatchEvent);
          objc_storeStrong((id *)&v10->_currentEvent, *p_matchEvent);
          objc_msgSend(*p_matchEvent, "setMatchOperation:", v29);
          objc_msgSend(*p_matchEvent, "setMatchMode:", v17);
          objc_msgSend(*p_matchEvent, "setMatchUseCase:", v18);
          objc_msgSend(*p_matchEvent, "setMatchType:", v19);
          objc_msgSend(*p_matchEvent, "setMatchIdentityCount:", v20);
          objc_msgSend(*p_matchEvent, "setPreArmedMatch:", MEMORY[0x24BDBD1C8]);
          objc_msgSend(*p_matchEvent, "updateBioLog:", v10->_bioLog);

        }
      }
    }
    preArmedMatchEvent = v10->_preArmedMatchEvent;
    v10->_preArmedMatchEvent = 0;

    objc_msgSend(*p_matchEvent, "setMatchResult:withDetails:", v6, v7);
    objc_msgSend(*p_matchEvent, "matchMode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntValue") == 1;

    if (v23)
    {
      -[MesaCoreAnalyticsUnlockEvent setMatchResult:withDetails:](v10->_unlockEvent, "setMatchResult:withDetails:", v6, v7);
      -[MesaCoreAnalyticsUnlockEvent unlockResult](v10->_unlockEvent, "unlockResult");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        -[MesaCoreAnalytics unlockEventFinished](v10, "unlockEventFinished");
    }
    objc_msgSend(*p_matchEvent, "matchMode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "unsignedIntValue") == 3)
    {

LABEL_22:
      -[MesaCoreAnalytics matchEventFinished](v10, "matchEventFinished");
      goto LABEL_23;
    }
    objc_msgSend(*p_matchEvent, "preArmedMatch");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    if (v27)
      goto LABEL_22;
  }
  else
  {
    if (__osLog)
      v28 = __osLog;
    else
      v28 = v8;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v32 = "_currentEvent == _matchEvent";
      v33 = 2048;
      v34 = 0;
      v35 = 2080;
      v36 = "";
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
      v39 = 1024;
      v40 = 297;
      _os_log_impl(&dword_24B74E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
LABEL_23:
  objc_sync_exit(v10);

  v30.receiver = v10;
  v30.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics matchResult:withDictionary:](&v30, sel_matchResult_withDictionary_, v6, v7);

}

- (void)matchAttemptFinished:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  void *v7;
  int v8;
  objc_super v9;
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics matchAttemptFinished: %d\n", buf, 8u);
  }
  v9.receiver = self;
  v9.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics matchAttemptFinished:](&v9, sel_matchAttemptFinished_, v3);
  v6 = self;
  objc_sync_enter(v6);
  -[MesaCoreAnalyticsMatchEvent overallResult](v6->_matchEvent, "overallResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8 == v3)
    -[MesaCoreAnalytics matchEventFinished](v6, "matchEventFinished");
  objc_sync_exit(v6);

}

- (void)matchOperationFinished:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics matchOperationFinished: %d\n", buf, 8u);
  }
  v7.receiver = self;
  v7.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics matchOperationFinished:](&v7, sel_matchOperationFinished_, v3);
  v6 = self;
  objc_sync_enter(v6);
  v6->_lastMatchAttemptTimeOffset = 0;
  v6->_currentBioOpType = 0;
  -[MesaCoreAnalytics matchEventFinished](v6, "matchEventFinished");
  objc_sync_exit(v6);

}

- (void)matchEventFinished
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  MesaCoreAnalyticsMatchEvent *currentEvent;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  MesaCoreAnalyticsMatchEvent *matchEvent;
  void *v11;
  MesaCoreAnalyticsMatchEvent *v12;
  void *v13;
  MesaCoreAnalyticsMatchEvent *v14;
  void *v15;
  MesaCoreAnalyticsMatchEvent *v16;
  void *v17;
  MesaCoreAnalyticsMatchEvent *v18;
  void *v19;
  MesaCoreAnalyticsMatchEvent *v20;
  void *v21;
  MesaCoreAnalyticsMatchEvent *v22;
  void *v23;
  MesaCoreAnalyticsMatchEvent *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  _BOOL4 v30;
  MesaCoreAnalyticsMatchEvent *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  MesaCoreAnalyticsMatchEvent *v36;
  void *v37;
  MesaCoreAnalyticsMatchEvent *v38;
  MesaCoreAnalyticsMatchEvent *v39;
  MesaCoreAnalyticsDailyEvent *dailyEvent;
  void *v41;
  void *v42;
  NSObject *v43;
  MesaCoreAnalyticsEvent *v44;
  void *v45;
  NSObject *analyticsDispatchQueue;
  id v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  unsigned int v51;
  _QWORD block[4];
  id v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics matchEventFinished\n", buf, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  currentEvent = (MesaCoreAnalyticsMatchEvent *)v4->_currentEvent;
  if (currentEvent == v4->_matchEvent)
  {
    -[MesaCoreAnalyticsMatchEvent matchOperation](currentEvent, "matchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsMatchEvent overallTime](v4->_matchEvent, "overallTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v7, "unsignedIntValue");

    -[MesaCoreAnalyticsMatchEvent overallResult](v4->_matchEvent, "overallResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    matchEvent = v4->_matchEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4->_displayOn);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitCoreAnalyticsEvent setDisplayOn:](matchEvent, "setDisplayOn:", v11);

    v12 = v4->_matchEvent;
    -[MesaCoreAnalytics getWakeReason](v4, "getWakeReason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsMatchEvent setDeviceWakeReason:](v12, "setDeviceWakeReason:", v13);

    v14 = v4->_matchEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BiometricKitDStatistics pressureMitigationUsed](v4, "pressureMitigationUsed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsMatchEvent setPressureMitigationUsed:](v14, "setPressureMitigationUsed:", v15);

    v16 = v4->_matchEvent;
    -[MesaCoreAnalytics getEnrolledUsersCount](v4, "getEnrolledUsersCount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsMatchEvent setEnrolledUsersCount:](v16, "setEnrolledUsersCount:", v17);

    v18 = v4->_matchEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BiometricKitDStatistics failQuickTapsToUnlock](v4, "failQuickTapsToUnlock"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsMatchEvent setQuickTapsCount:](v18, "setQuickTapsCount:", v19);

    v20 = v4->_matchEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BiometricKitDStatistics failTouchesToUnlock](v4, "failTouchesToUnlock"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsMatchEvent setFailedUnlockAttempts:](v20, "setFailedUnlockAttempts:", v21);

    v22 = v4->_matchEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BiometricKitDStatistics failTouchesToMatch](v4, "failTouchesToMatch"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsMatchEvent setFailedMatchAttempts:](v22, "setFailedMatchAttempts:", v23);

    v24 = v4->_matchEvent;
    -[MesaCoreAnalytics deviceOrientation](v4, "deviceOrientation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setDeviceOrientation:](v24, "setDeviceOrientation:", v25);

    -[MesaCoreAnalyticsEvent deviceType](v4->_matchEvent, "deviceType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v26, "unsignedIntValue"))
    {
      -[MesaCoreAnalyticsEvent builtinSensorType](v4->_matchEvent, "builtinSensorType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27 == 0;

      if (!v28)
        goto LABEL_10;
      if (__osLog)
        v48 = __osLog;
      else
        v48 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B74E000, v48, OS_LOG_TYPE_ERROR, "matchEventFinished: missing builtinSensorType\n", buf, 2u);
      }
      if (!-[BiometricAutoBugCapture sendAutoBugCaptureEvent:](v4->_biometricABC, "sendAutoBugCaptureEvent:", 2))
      {
        v50 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v55 = "[_biometricABC sendAutoBugCaptureEvent:kMesaAbcInternalSensorTypeNotSet]";
          v56 = 2048;
          v57 = 0;
          v58 = 2080;
          v59 = "";
          v60 = 2080;
          v61 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
          v62 = 1024;
          v63 = 424;
          _os_log_impl(&dword_24B74E000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      -[BiometricKitDStatistics server](v4, "server");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalytics setInternalSensorType:](v4, "setInternalSensorType:", objc_msgSend(v26, "getSensorType"));
    }

LABEL_10:
    -[BiometricKitCoreAnalyticsEvent timeSinceLastEnrollment](v4->_matchEvent, "timeSinceLastEnrollment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      v31 = v4->_matchEvent;
      -[MesaCoreAnalytics getDaysSinceLastEnrollment](v4, "getDaysSinceLastEnrollment");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BiometricKitCoreAnalyticsEvent setTimeSinceLastEnrollment:](v31, "setTimeSinceLastEnrollment:", v32);

    }
    -[MesaCoreAnalyticsMatchEvent matchMode](v4->_matchEvent, "matchMode");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "unsignedIntValue") == 4;

    if (v34)
    {
      if (__osLog)
        v35 = __osLog;
      else
        v35 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B74E000, v35, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics matchEventFinished copy preArmedMatchEvent\n", buf, 2u);
      }
      v36 = [MesaCoreAnalyticsMatchEvent alloc];
      -[BiometricKitCoreAnalyticsEvent dictionaryRepresentationArchiving:](v4->_matchEvent, "dictionaryRepresentationArchiving:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[MesaCoreAnalyticsMatchEvent initWithDictionary:](v36, "initWithDictionary:", v37);

    }
    else
    {
      v38 = 0;
    }
    v39 = v4->_matchEvent;
    dailyEvent = v4->_dailyEvent;
    -[BiometricKitDStatistics server](v4, "server");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "identities");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v39) = -[MesaCoreAnalyticsMatchEvent postEventAndUpdateDailyValues:enrolledIdentities:](v39, "postEventAndUpdateDailyValues:enrolledIdentities:", dailyEvent, v42);

    if ((_DWORD)v39)
    {
      if (__osLog)
        v43 = __osLog;
      else
        v43 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B74E000, v43, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics matchEventFinished save _preArmedMatchEvent\n", buf, 2u);
      }
      objc_storeStrong((id *)&v4->_preArmedMatchEvent, v38);
      if ((objc_msgSend(v6, "stopOnSuccess") & v9) == 1)
      {
        v44 = v4->_currentEvent;
        v4->_currentEvent = 0;

        -[MesaCoreAnalytics stopBioOperation](v4, "stopBioOperation");
      }
      else
      {
        v4->_lastMatchAttemptTimeOffset += v51;
        -[MesaCoreAnalytics startMatchAttempt:](v4, "startMatchAttempt:", v6);
      }
      -[MesaCoreAnalyticsDailyEvent dictionaryRepresentationArchiving:](v4->_dailyEvent, "dictionaryRepresentationArchiving:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      analyticsDispatchQueue = v4->_analyticsDispatchQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__MesaCoreAnalytics_matchEventFinished__block_invoke;
      block[3] = &unk_251CA06E0;
      v53 = v45;
      v47 = v45;
      dispatch_async(analyticsDispatchQueue, block);

    }
    goto LABEL_31;
  }
  if (__osLog)
    v49 = __osLog;
  else
    v49 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v55 = "_currentEvent == _matchEvent";
    v56 = 2048;
    v57 = 0;
    v58 = 2080;
    v59 = "";
    v60 = 2080;
    v61 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
    v62 = 1024;
    v63 = 392;
    _os_log_impl(&dword_24B74E000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_31:
  objc_sync_exit(v4);

}

void __39__MesaCoreAnalytics_matchEventFinished__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("com.apple.biometrickit.mesa.dailyUpdate"));

}

- (id)getWakeReason
{
  void *v3;
  int v4;

  -[BiometricKitCoreAnalyticsEvent displayOn](self->_currentEvent, "displayOn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (!v4)
    return 0;
  if (-[BiometricKitDStatistics deviceWokeUpByHomeButton](self, "deviceWokeUpByHomeButton"))
    return &unk_251CB2A08;
  if (-[BiometricKitDStatistics deviceWokeUpByLiftToWake](self, "deviceWokeUpByLiftToWake"))
    return &unk_251CB2A20;
  if (self->_internalSensorType == 4)
    return &unk_251CB2A38;
  return &unk_251CB2A50;
}

- (void)unlockAttemptStarted:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics unlockAttemptStarted: %u\n", buf, 8u);
  }
  v7.receiver = self;
  v7.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics unlockAttemptStarted:](&v7, sel_unlockAttemptStarted_, v3);
  v6 = self;
  objc_sync_enter(v6);
  -[MesaCoreAnalyticsUnlockEvent reset](v6->_unlockEvent, "reset");
  objc_sync_exit(v6);

}

- (void)unlockAttemptCanceled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  MesaCoreAnalyticsUnlockEvent *unlockEvent;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics unlockAttemptCanceled\n", buf, 2u);
  }
  v6 = self;
  objc_sync_enter(v6);
  -[MesaCoreAnalyticsUnlockEvent setUnlockResult:](v6->_unlockEvent, "setUnlockResult:", &unk_251CB2A20);
  unlockEvent = v6->_unlockEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsUnlockEvent setCanceledByNewCommand:](unlockEvent, "setCanceledByNewCommand:", v8);

  objc_sync_exit(v6);
  v9.receiver = v6;
  v9.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics unlockAttemptCanceled:](&v9, sel_unlockAttemptCanceled_, v3);
}

- (void)unlockedByMesa
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  objc_super v5;
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics unlockedByMesa\n", buf, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  -[MesaCoreAnalyticsUnlockEvent setUnlockResult:](v4->_unlockEvent, "setUnlockResult:", &unk_251CB2A50);
  -[MesaCoreAnalyticsUnlockEvent setUnlocked:](v4->_unlockEvent, "setUnlocked:", MEMORY[0x24BDBD1C8]);
  objc_sync_exit(v4);

  v5.receiver = v4;
  v5.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics unlockedByMesa](&v5, sel_unlockedByMesa);
}

- (void)unlockedByPasscode
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  objc_super v5;
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics unlockedByPasscode\n", buf, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  -[MesaCoreAnalyticsUnlockEvent setUnlockResult:](v4->_unlockEvent, "setUnlockResult:", &unk_251CB2A08);
  -[MesaCoreAnalyticsUnlockEvent setUnlocked:](v4->_unlockEvent, "setUnlocked:", MEMORY[0x24BDBD1C8]);
  objc_sync_exit(v4);

  v5.receiver = v4;
  v5.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics unlockedByPasscode](&v5, sel_unlockedByPasscode);
}

- (void)unlockAttemptFinished
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  objc_super v5;
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics unlockAttemptFinished\n", buf, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  -[MesaCoreAnalytics unlockEventFinished](v4, "unlockEventFinished");
  objc_sync_exit(v4);

  v5.receiver = v4;
  v5.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics unlockAttemptFinished](&v5, sel_unlockAttemptFinished);
}

- (void)unlockEventFinished
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  void *v5;
  char v6;
  MesaCoreAnalyticsUnlockEvent *unlockEvent;
  void *v8;
  MesaCoreAnalyticsUnlockEvent *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  MesaCoreAnalyticsUnlockEvent *v15;
  void *v16;
  MesaCoreAnalyticsUnlockEvent *v17;
  void *v18;
  MesaCoreAnalyticsUnlockEvent *v19;
  void *v20;
  MesaCoreAnalyticsUnlockEvent *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics unlockEventFinished\n", buf, 2u);
  }
  v23.receiver = self;
  v23.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics unlockAttemptFinished](&v23, sel_unlockAttemptFinished);
  v4 = self;
  objc_sync_enter(v4);
  -[MesaCoreAnalyticsUnlockEvent eventFinished](v4->_unlockEvent, "eventFinished");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    unlockEvent = v4->_unlockEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BiometricKitDStatistics failQuickTapsToUnlock](v4, "failQuickTapsToUnlock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsUnlockEvent setQuickTapsCount:](unlockEvent, "setQuickTapsCount:", v8);

    v9 = v4->_unlockEvent;
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = -[BiometricKitDStatistics failTouchesToUnlock](v4, "failTouchesToUnlock");
    v12 = -[BiometricKitDStatistics failQuickTapsToUnlock](v4, "failQuickTapsToUnlock");
    -[MesaCoreAnalyticsUnlockEvent unlockResult](v4->_unlockEvent, "unlockResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInteger:", v12 + v11 + objc_msgSend(v13, "isEqualToNumber:", &unk_251CB2A50));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsUnlockEvent setTouchesToUnlock:](v9, "setTouchesToUnlock:", v14);

    v15 = v4->_unlockEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BiometricKitDStatistics failTouchesToUnlock](v4, "failTouchesToUnlock"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsUnlockEvent setFailedUnlockAttempts:](v15, "setFailedUnlockAttempts:", v16);

    v17 = v4->_unlockEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4->_displayOn);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitCoreAnalyticsEvent setDisplayOn:](v17, "setDisplayOn:", v18);

    v19 = v4->_unlockEvent;
    -[MesaCoreAnalytics getDaysSinceLastEnrollment](v4, "getDaysSinceLastEnrollment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitCoreAnalyticsEvent setTimeSinceLastEnrollment:](v19, "setTimeSinceLastEnrollment:", v20);

    v21 = v4->_unlockEvent;
    -[MesaCoreAnalytics deviceOrientation](v4, "deviceOrientation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setDeviceOrientation:](v21, "setDeviceOrientation:", v22);

  }
  -[MesaCoreAnalyticsUnlockEvent postEvent](v4->_unlockEvent, "postEvent");
  objc_sync_exit(v4);

}

- (void)startEnrollOperation:(id)a3
{
  id v4;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  MesaCoreAnalyticsEnrollEvent *enrollEvent;
  void *v8;
  MesaCoreAnalyticsEnrollEvent *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics startEnrollOperation\n", v11, 2u);
  }
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_currentEvent, v6->_enrollEvent);
  -[MesaCoreAnalyticsEnrollEvent reset](v6->_enrollEvent, "reset");
  enrollEvent = v6->_enrollEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v4, "userID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsEnrollEvent setUserID:](enrollEvent, "setUserID:", v8);

  v9 = v6->_enrollEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6->_displayOn);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitCoreAnalyticsEvent setDisplayOn:](v9, "setDisplayOn:", v10);

  objc_sync_exit(v6);
}

- (void)enrollProgress:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  MesaCoreAnalytics *v7;
  MesaCoreAnalyticsEnrollEvent *currentEvent;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics enrollProgress: %@\n", (uint8_t *)&v11, 0xCu);
  }
  if (v4)
  {
    v7 = self;
    objc_sync_enter(v7);
    currentEvent = (MesaCoreAnalyticsEnrollEvent *)v7->_currentEvent;
    if (currentEvent != v7->_enrollEvent)
    {
      if (!-[MesaCoreAnalyticsEnrollEvent isWaitingForFinish](v7->_enrollEvent, "isWaitingForFinish"))
      {
        if (__osLog)
          v10 = __osLog;
        else
          v10 = v5;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = 136316162;
          v12 = "_currentEvent == _enrollEvent || [_enrollEvent isWaitingForFinish]";
          v13 = 2048;
          v14 = 0;
          v15 = 2080;
          v16 = "";
          v17 = 2080;
          v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
          v19 = 1024;
          v20 = 614;
          _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
        }
        goto LABEL_11;
      }
      currentEvent = v7->_enrollEvent;
    }
    -[MesaCoreAnalyticsEnrollEvent enrollProgress:](currentEvent, "enrollProgress:", v4);
LABEL_11:
    objc_sync_exit(v7);

    goto LABEL_12;
  }
  if (__osLog)
    v9 = __osLog;
  else
    v9 = v5;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = 136316162;
    v12 = "alignmentData";
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
    v19 = 1024;
    v20 = 610;
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
  }
LABEL_12:

}

- (void)enrollEventFinished
{
  NSObject *v3;
  NSObject *v4;
  MesaCoreAnalytics *v5;
  MesaCoreAnalyticsEnrollEvent *currentEvent;
  MesaCoreAnalyticsEnrollEvent *enrollEvent;
  void *v8;
  MesaCoreAnalyticsEnrollEvent *v9;
  void *v10;
  void *v11;
  MesaCoreAnalyticsEnrollEvent *v12;
  void *v13;
  MesaCoreAnalyticsEnrollEvent *v14;
  void *v15;
  void *v16;
  MesaCoreAnalyticsDailyEvent *dailyEvent;
  void *v18;
  MesaCoreAnalyticsWeeklyEvent *weeklyEvent;
  void *v20;
  MesaCoreAnalyticsDailyEvent *v21;
  void *v22;
  MesaCoreAnalyticsWeeklyEvent *v23;
  void *v24;
  MesaCoreAnalyticsDailyEvent *v25;
  void *v26;
  MesaCoreAnalyticsWeeklyEvent *v27;
  void *v28;
  MesaCoreAnalyticsDailyEvent *v29;
  void *v30;
  MesaCoreAnalyticsWeeklyEvent *v31;
  void *v32;
  MesaCoreAnalyticsEnrollEvent *v33;
  NSObject *v34;
  int v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v35) = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics enrollEventFinished\n", (uint8_t *)&v35, 2u);
  }
  v5 = self;
  objc_sync_enter(v5);
  currentEvent = (MesaCoreAnalyticsEnrollEvent *)v5->_currentEvent;
  enrollEvent = v5->_enrollEvent;
  if (currentEvent == enrollEvent)
    goto LABEL_9;
  if (-[MesaCoreAnalyticsEnrollEvent isWaitingForFinish](enrollEvent, "isWaitingForFinish"))
  {
    currentEvent = v5->_enrollEvent;
LABEL_9:
    -[MesaCoreAnalytics getEnrolledUsersCount](v5, "getEnrolledUsersCount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEnrollEvent setEnrolledUsersCount:](currentEvent, "setEnrolledUsersCount:", v8);

    v9 = v5->_enrollEvent;
    -[MesaCoreAnalyticsEnrollEvent userID](v9, "userID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalytics getEnrolledIdentitiesCountForUser:](v5, "getEnrolledIdentitiesCountForUser:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEnrollEvent setEnrolledIdentityUserCount:](v9, "setEnrolledIdentityUserCount:", v11);

    v12 = v5->_enrollEvent;
    -[MesaCoreAnalytics getEnrolledIdentitiesCountTotal](v5, "getEnrolledIdentitiesCountTotal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEnrollEvent setEnrolledIdentityTotalCount:](v12, "setEnrolledIdentityTotalCount:", v13);

    v14 = v5->_enrollEvent;
    -[MesaCoreAnalytics deviceOrientation](v5, "deviceOrientation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setDeviceOrientation:](v14, "setDeviceOrientation:", v15);

    -[MesaCoreAnalyticsEnrollEvent overallResult](v5->_enrollEvent, "overallResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "BOOLValue");

    if ((_DWORD)v14)
    {
      dailyEvent = v5->_dailyEvent;
      -[MesaCoreAnalyticsEnrollEvent touchesCount](v5->_enrollEvent, "touchesCount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setLastEnrollmentTouchesCount:](dailyEvent, "setLastEnrollmentTouchesCount:", v18);

      weeklyEvent = v5->_weeklyEvent;
      -[MesaCoreAnalyticsEnrollEvent touchesCount](v5->_enrollEvent, "touchesCount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setLastEnrollmentTouchesCount:](weeklyEvent, "setLastEnrollmentTouchesCount:", v20);

      v21 = v5->_dailyEvent;
      -[MesaCoreAnalyticsEvent deviceOrientation](v5->_enrollEvent, "deviceOrientation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setLastEnrollmentDeviceOrientation:](v21, "setLastEnrollmentDeviceOrientation:", v22);

      v23 = v5->_weeklyEvent;
      -[MesaCoreAnalyticsEvent deviceOrientation](v5->_enrollEvent, "deviceOrientation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setLastEnrollmentDeviceOrientation:](v23, "setLastEnrollmentDeviceOrientation:", v24);

      v25 = v5->_dailyEvent;
      -[MesaCoreAnalyticsEnrollEvent scanCount](v5->_enrollEvent, "scanCount");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setLastEnrollmentScanCount:](v25, "setLastEnrollmentScanCount:", v26);

      v27 = v5->_weeklyEvent;
      -[MesaCoreAnalyticsEnrollEvent scanCount](v5->_enrollEvent, "scanCount");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setLastEnrollmentScanCount:](v27, "setLastEnrollmentScanCount:", v28);

      v29 = v5->_dailyEvent;
      -[MesaCoreAnalyticsEnrollEvent scanGroupCount](v5->_enrollEvent, "scanGroupCount");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setLastEnrollmentScanGroupCount:](v29, "setLastEnrollmentScanGroupCount:", v30);

      v31 = v5->_weeklyEvent;
      -[MesaCoreAnalyticsEnrollEvent scanGroupCount](v5->_enrollEvent, "scanGroupCount");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setLastEnrollmentScanGroupCount:](v31, "setLastEnrollmentScanGroupCount:", v32);

    }
    if (-[MesaCoreAnalyticsEnrollEvent postEvent](v5->_enrollEvent, "postEvent"))
    {
      v33 = (MesaCoreAnalyticsEnrollEvent *)v5->_currentEvent;
      if (v33 == v5->_enrollEvent)
      {
        v5->_currentEvent = 0;

        -[MesaCoreAnalytics stopBioOperation](v5, "stopBioOperation");
      }
    }
    goto LABEL_14;
  }
  if (__osLog)
    v34 = __osLog;
  else
    v34 = v3;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = 136316162;
    v36 = "_currentEvent == _enrollEvent || [_enrollEvent isWaitingForFinish]";
    v37 = 2048;
    v38 = 0;
    v39 = 2080;
    v40 = "";
    v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
    v43 = 1024;
    v44 = 629;
    _os_log_impl(&dword_24B74E000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v35, 0x30u);
  }
LABEL_14:
  objc_sync_exit(v5);

}

- (void)postDailyAndWeeklyUpdates
{
  NSObject *v3;
  void *v4;
  MesaCoreAnalytics *v5;
  MesaCoreAnalyticsDailyEvent *dailyEvent;
  void *v7;
  MesaCoreAnalyticsDailyEvent *v8;
  void *v9;
  MesaCoreAnalyticsDailyEvent *v10;
  void *v11;
  MesaCoreAnalyticsDailyEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  MesaCoreAnalyticsDailyEvent *v16;
  void *v17;
  void *v18;
  MesaCoreAnalyticsDailyEvent *v19;
  void *v20;
  MesaCoreAnalyticsDailyEvent *v21;
  void *v22;
  MesaCoreAnalyticsWeeklyEvent *weeklyEvent;
  void *v24;
  MesaCoreAnalyticsWeeklyEvent *v25;
  void *v26;
  MesaCoreAnalyticsWeeklyEvent *v27;
  void *v28;
  MesaCoreAnalyticsWeeklyEvent *v29;
  void *v30;
  MesaCoreAnalyticsWeeklyEvent *v31;
  void *v32;
  void *v33;
  void *v34;
  MesaCoreAnalyticsWeeklyEvent *v35;
  void *v36;
  MesaCoreAnalyticsWeeklyEvent *v37;
  void *v38;
  void *v39;
  MesaCoreAnalyticsDailyEvent *v40;
  void *v41;
  MesaCoreAnalyticsWeeklyEvent *v42;
  void *v43;
  MesaCoreAnalyticsDailyEvent *v44;
  void *v45;
  MesaCoreAnalyticsWeeklyEvent *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  NSObject *analyticsDispatchQueue;
  id v53;
  id v54;
  NSObject *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics postDailyAndWeeklyUpdates\n", buf, 2u);
  }
  -[MesaCoreAnalytics getProtectedConfigurationMergedForAllUsers](self, "getProtectedConfigurationMergedForAllUsers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  dailyEvent = v5->_dailyEvent;
  objc_msgSend(v4, "objectForKey:", CFSTR("BKUserCfgEffectiveTouchIDUnlockEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setUnlockEnabled:](dailyEvent, "setUnlockEnabled:", v7);

  v8 = v5->_dailyEvent;
  objc_msgSend(v4, "objectForKey:", CFSTR("BKUserCfgEffectiveTouchIDApplePayEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setApplePayEnabled:](v8, "setApplePayEnabled:", v9);

  v10 = v5->_dailyEvent;
  -[MesaCoreAnalytics getEnrolledUsersCount](v5, "getEnrolledUsersCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setEnrolledUserCount:](v10, "setEnrolledUserCount:", v11);

  v12 = v5->_dailyEvent;
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[BiometricKitDStatistics server](v5, "server");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "getEnrollmentCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setTemplateEnrollmentsCount:](v12, "setTemplateEnrollmentsCount:", v15);

  v16 = v5->_dailyEvent;
  -[BiometricKitDStatistics server](v5, "server");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsEvent setMatchCountsFromIdentityList:](v16, "setMatchCountsFromIdentityList:", v18);

  v19 = v5->_dailyEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5->_totalScanCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setTotalScanCount:](v19, "setTotalScanCount:", v20);

  v21 = v5->_dailyEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5->_totalScanGroupCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setTotalScanGroupCount:](v21, "setTotalScanGroupCount:", v22);

  weeklyEvent = v5->_weeklyEvent;
  objc_msgSend(v4, "objectForKey:", CFSTR("BKUserCfgEffectiveTouchIDUnlockEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setUnlockEnabled:](weeklyEvent, "setUnlockEnabled:", v24);

  v25 = v5->_weeklyEvent;
  objc_msgSend(v4, "objectForKey:", CFSTR("BKUserCfgEffectiveTouchIDApplePayEnabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setApplePayEnabled:](v25, "setApplePayEnabled:", v26);

  v27 = v5->_weeklyEvent;
  -[MesaCoreAnalytics getEnrolledIdentitiesCountTotal](v5, "getEnrolledIdentitiesCountTotal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setEnrolledIdentityCount:](v27, "setEnrolledIdentityCount:", v28);

  v29 = v5->_weeklyEvent;
  -[MesaCoreAnalytics getEnrolledUsersCount](v5, "getEnrolledUsersCount");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setEnrolledUserCount:](v29, "setEnrolledUserCount:", v30);

  v31 = v5->_weeklyEvent;
  v32 = (void *)MEMORY[0x24BDD16E0];
  -[BiometricKitDStatistics server](v5, "server");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "getEnrollmentCount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setTemplateEnrollmentsCount:](v31, "setTemplateEnrollmentsCount:", v34);

  v35 = v5->_weeklyEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5->_totalScanCount);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setTotalScanCount:](v35, "setTotalScanCount:", v36);

  v37 = v5->_weeklyEvent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5->_totalScanGroupCount);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent setTotalScanGroupCount:](v37, "setTotalScanGroupCount:", v38);

  -[MesaCoreAnalyticsWeeklyEvent addDailyEvent:](v5->_weeklyEvent, "addDailyEvent:", v5->_dailyEvent);
  -[MesaCoreAnalytics getDaysSinceEnrollment](v5, "getDaysSinceEnrollment");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "count"))
  {
    v40 = v5->_dailyEvent;
    objc_msgSend(v39, "objectAtIndex:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitCoreAnalyticsEvent setTimeSinceLastEnrollment:](v40, "setTimeSinceLastEnrollment:", v41);

    v42 = v5->_weeklyEvent;
    objc_msgSend(v39, "objectAtIndex:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitCoreAnalyticsEvent setTimeSinceLastEnrollment:](v42, "setTimeSinceLastEnrollment:", v43);

  }
  if ((unint64_t)objc_msgSend(v39, "count") >= 2)
  {
    v44 = v5->_dailyEvent;
    objc_msgSend(v39, "objectAtIndex:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setTimeSinceSecondLastEnrollment:](v44, "setTimeSinceSecondLastEnrollment:", v45);

    v46 = v5->_weeklyEvent;
    objc_msgSend(v39, "objectAtIndex:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setTimeSinceSecondLastEnrollment:](v46, "setTimeSinceSecondLastEnrollment:", v47);

  }
  -[MesaCoreAnalyticsDailyEvent unlockMatchAttemptsFailed](v5->_dailyEvent, "unlockMatchAttemptsFailed");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "unsignedIntValue") > 0x3E7;

  if (v49 && !-[BiometricAutoBugCapture sendAutoBugCaptureEvent:](v5->_biometricABC, "sendAutoBugCaptureEvent:", 1))
  {
    if (__osLog)
      v55 = __osLog;
    else
      v55 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v60 = "[_biometricABC sendAutoBugCaptureEvent:kMesaAbcExcessiveUnlockAttemptCount]";
      v61 = 2048;
      v62 = 0;
      v63 = 2080;
      v64 = "";
      v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
      v67 = 1024;
      v68 = 721;
      _os_log_impl(&dword_24B74E000, v55, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  -[MesaCoreAnalyticsEvent postEvent](v5->_dailyEvent, "postEvent");
  -[MesaCoreAnalyticsWeeklyEvent postEvent](v5->_weeklyEvent, "postEvent");
  -[MesaCoreAnalyticsDailyEvent dictionaryRepresentationArchiving:](v5->_dailyEvent, "dictionaryRepresentationArchiving:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsWeeklyEvent dictionaryRepresentationArchiving:](v5->_weeklyEvent, "dictionaryRepresentationArchiving:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  analyticsDispatchQueue = v5->_analyticsDispatchQueue;
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __46__MesaCoreAnalytics_postDailyAndWeeklyUpdates__block_invoke;
  v56[3] = &unk_251CA0818;
  v57 = v50;
  v58 = v51;
  v53 = v51;
  v54 = v50;
  dispatch_async(analyticsDispatchQueue, v56);

  objc_sync_exit(v5);
}

void __46__MesaCoreAnalytics_postDailyAndWeeklyUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("com.apple.biometrickit.mesa.dailyUpdate"));

  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("com.apple.biometrickit.mesa.weeklyUpdate"));

}

- (void)templateUpdate:(id)a3 withDictionary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__osLog)
    v8 = __osLog;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics templateUpdate: %@ withDictionary: %@\n", buf, 0x16u);
  }
  v9.receiver = self;
  v9.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics templateUpdate:withDictionary:](&v9, sel_templateUpdate_withDictionary_, v6, v7);

}

- (void)addIdentitity:(id)a3
{
  id v4;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MesaCoreAnalyticsEnrollEvent *enrollEvent;
  void *v12;
  MesaCoreAnalyticsEnrollEvent *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics addIdentitity: %@ \n", buf, 0xCu);
  }
  v15.receiver = self;
  v15.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics addIdentitity:](&v15, sel_addIdentitity_, v4);
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_currentEvent == &v6->_enrollEvent->super)
  {
    -[BiometricKitDStatistics templateStats](v6, "templateStats");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    enrollEvent = v6->_enrollEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", objc_msgSend(v10, "totalNodeCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEnrollEvent setScanCount:](enrollEvent, "setScanCount:", v12);

    v13 = v6->_enrollEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", objc_msgSend(v10, "clusterCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEnrollEvent setScanGroupCount:](v13, "setScanGroupCount:", v14);

    -[MesaCoreAnalytics enrollEventFinished](v6, "enrollEventFinished");
  }
  objc_sync_exit(v6);

}

- (void)removeIdentity:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics removeIdentity: %@ \n", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics removeIdentity:](&v6, sel_removeIdentity_, v4);

}

- (void)removeAllIdentities
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics removeAllIdentities\n", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics removeAllIdentities](&v4, sel_removeAllIdentities);
}

- (void)resetMatchCounts
{
  NSObject *v3;
  MesaCoreAnalytics *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MesaCoreAnalyticsTemplateMatchCountsEvent *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;
  __int128 v45;
  __int128 v46;
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
  uint8_t buf[8];
  _BYTE v58[128];
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics resetMatchCounts - Count template match counts per user\n", buf, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_totalScanCount = 0;
  v4->_totalScanGroupCount = 0;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[BiometricKitDStatistics templateStats](v4, "templateStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v7)
  {
    v41 = *(_QWORD *)v54;
    v43 = 0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v9, "userID", obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (v12)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "userID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v13, v14);

          ++v43;
        }
        objc_msgSend(v9, "userID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "matchCount"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

        v4->_totalScanCount += (int)objc_msgSend(v9, "totalNodeCount");
        v4->_totalScanGroupCount += (int)objc_msgSend(v9, "clusterCount");
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v7);
  }
  else
  {
    v43 = 0;
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v5, "keyEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v20)
  {
    v42 = *(_QWORD *)v50;
    obj = v18;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v50 != v42)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0, obj);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sortedArrayUsingDescriptors:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_alloc_init(MesaCoreAnalyticsTemplateMatchCountsEvent);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4->_internalSensorType);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MesaCoreAnalyticsEvent setBuiltinSensorType:](v27, "setBuiltinSensorType:", v28);

        -[MesaCoreAnalyticsEvent deviceType](v4->_dailyEvent, "deviceType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MesaCoreAnalyticsEvent setDeviceType:](v27, "setDeviceType:", v29);

        -[MesaCoreAnalyticsEvent setMatchCounts:totalMatchCount:](v27, "setMatchCounts:totalMatchCount:", v26, 0);
        objc_msgSend(v40, "addObject:", v27);
        -[MesaCoreAnalyticsEvent template1MatchCount](v27, "template1MatchCount");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "unsignedIntegerValue") != 0;

        v19 += v31;
      }
      v18 = obj;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v20);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v32 = v40;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(v32);
        v36 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v43, obj);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setEnrolledUsersCount:", v37);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setActiveUsersCount:", v38);

        objc_msgSend(v36, "postEvent");
      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v33);
  }

  objc_sync_exit(v4);
  -[MesaCoreAnalytics postDailyAndWeeklyUpdates](v4, "postDailyAndWeeklyUpdates");
  v44.receiver = v4;
  v44.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics resetMatchCounts](&v44, sel_resetMatchCounts);
}

- (id)getDaysSinceEnrollment
{
  MesaCoreAnalytics *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitDStatistics templateStats](v2, "templateStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keysSortedByValueUsingComparator:", &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  v7 = *MEMORY[0x24BDBCA18];
  *(_QWORD *)&v8 = 136316162;
  v20 = v8;
  while (objc_msgSend(v5, "count", v20) > v6)
  {
    -[BiometricKitDStatistics templateStats](v2, "templateStats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "creationTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD16E0];
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE48]), "initWithCalendarIdentifier:", v7);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "components:fromDate:toDate:options:", 16, v12, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v16, "day"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v17);
    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v20;
        v22 = "lastEnrollmentDate";
        v23 = 2048;
        v24 = 0;
        v25 = 2080;
        v26 = "";
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
        v29 = 1024;
        v30 = 861;
        _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v17 = 0;
    }

    ++v6;
  }
  objc_sync_exit(v2);

  return v3;
}

uint64_t __43__MesaCoreAnalytics_getDaysSinceEnrollment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "creationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)getDaysSinceLastEnrollment
{
  MesaCoreAnalytics *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[BiometricKitDStatistics templateStats](v2, "templateStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keysSortedByValueUsingComparator:", &__block_literal_global_81);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count"))
  {
LABEL_9:
    v8 = 0;
    v14 = 0;
    goto LABEL_10;
  }
  -[BiometricKitDStatistics templateStats](v2, "templateStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creationTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = "lastEnrollmentDate";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
      v26 = 1024;
      v27 = 889;
      _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    goto LABEL_9;
  }
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_alloc(MEMORY[0x24BDBCE48]);
  v11 = (void *)objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:toDate:options:", 16, v8, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v13, "day"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  objc_sync_exit(v2);

  v16 = v14;
  return v16;
}

uint64_t __47__MesaCoreAnalytics_getDaysSinceLastEnrollment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "creationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)getEnrolledUserIDs
{
  void *v3;
  MesaCoreAnalytics *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BiometricKitDStatistics templateStats](v4, "templateStats", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "userID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)getEnrolledUsersCount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[MesaCoreAnalytics getEnrolledUserIDs](self, "getEnrolledUserIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getEnrolledIdentitiesCountForUser:(id)a3
{
  id v4;
  MesaCoreAnalytics *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (objc_msgSend(v4, "intValue") == -1)
    {
      -[MesaCoreAnalytics getEnrolledIdentitiesCountTotal](v5, "getEnrolledIdentitiesCountTotal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[BiometricKitDStatistics templateStats](v5, "templateStats", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v18;
        v10 = &unk_251CB2A68;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "userID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToNumber:", v4);

            if (v13)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v10, "unsignedIntValue") + 1);
              v14 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v14;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }
      else
      {
        v10 = &unk_251CB2A68;
      }

    }
    objc_sync_exit(v5);

  }
  else
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "userID";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
      v30 = 1024;
      v31 = 922;
      _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = &unk_251CB2A68;
  }

  return v10;
}

- (id)getEnrolledIdentitiesCountTotal
{
  MesaCoreAnalytics *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[BiometricKitDStatistics templateStats](v2, "templateStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v5;
}

- (id)getProtectedConfigurationMergedForAllUsers
{
  MesaCoreAnalytics *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MesaCoreAnalytics getEnrolledUserIDs](v2, "getEnrolledUserIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[BiometricKitDStatistics server](v2, "server");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "getProtectedConfigurationForUser:withClient:", objc_msgSend(v4, "unsignedIntValue"), 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v23 != v9)
                objc_enumerationMutation(v7);
              v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v7, "objectForKey:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKey:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = (void *)MEMORY[0x24BDD16E0];
              if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
                v15 = 1;
              else
                v15 = objc_msgSend(v13, "BOOLValue");
              objc_msgSend(v14, "numberWithInt:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v16, v11);

            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v8);
        }

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

  objc_sync_exit(v2);
  return v3;
}

- (void)statusMessage:(unsigned int)a3 withData:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  MesaCoreAnalyticsFingerTouchTimeEvent *fingerTouchTimeEvent;
  void *v9;
  MesaCoreAnalyticsFingerLiftTimeEvent *fingerLiftTimeEvent;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (__osLog)
    v7 = __osLog;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics statusMessage: %u\n", buf, 8u);
  }
  -[MesaCoreAnalyticsFingerTouchTimeEvent handleStatusMessage:forOperation:displayOn:](self->_fingerTouchTimeEvent, "handleStatusMessage:forOperation:displayOn:", v4, LOBYTE(self->_currentBioOpType), self->_displayOn);
  fingerTouchTimeEvent = self->_fingerTouchTimeEvent;
  -[MesaCoreAnalytics deviceOrientation](self, "deviceOrientation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsEvent setDeviceOrientation:](fingerTouchTimeEvent, "setDeviceOrientation:", v9);

  -[MesaCoreAnalyticsFingerLiftTimeEvent handleStatusMessage:forOperation:](self->_fingerLiftTimeEvent, "handleStatusMessage:forOperation:", v4, LOBYTE(self->_currentBioOpType));
  fingerLiftTimeEvent = self->_fingerLiftTimeEvent;
  -[MesaCoreAnalytics deviceOrientation](self, "deviceOrientation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsEvent setDeviceOrientation:](fingerLiftTimeEvent, "setDeviceOrientation:", v11);

  -[MesaCoreAnalyticsEvent handleStatusMessage:withData:](self->_currentEvent, "handleStatusMessage:withData:", v4, v6);
  v12.receiver = self;
  v12.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics statusMessage:](&v12, sel_statusMessage_, v4);

}

- (void)statisticsMessage:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  MesaCoreAnalytics *v7;
  NSObject *v8;
  unsigned int var0;
  uint64_t v10;
  MesaCoreAnalyticsMatchEvent *currentEvent;
  void *v12;
  MesaCoreAnalyticsMatchEvent *v13;
  void *v14;
  _BOOL4 v15;
  unint64_t v16;
  unint64_t v17;
  MesaCoreAnalyticsMatchEvent *v18;
  void *v19;
  MesaCoreAnalyticsMatchEvent *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  int v25;
  MesaCoreAnalyticsMatchEvent *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  MesaCoreAnalyticsMatchEvent *v32;
  void *v33;
  void *v34;
  MesaCoreAnalyticsMatchEvent *v35;
  MesaCoreAnalyticsMatchEvent *v36;
  void *v37;
  _BOOL4 v38;
  unint64_t v39;
  unint64_t v40;
  MesaCoreAnalyticsMatchEvent *v41;
  void *v42;
  MesaCoreAnalyticsMatchEvent *matchEvent;
  unint64_t lastMatchAttemptTimeOffset;
  unint64_t v45;
  void *v46;
  MesaCoreAnalyticsMatchEvent *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  _BOOL4 v51;
  unint64_t v52;
  unint64_t v53;
  MesaCoreAnalyticsMatchEvent *v54;
  void *v55;
  MesaCoreAnalyticsMatchEvent *v56;
  void *v57;
  _BOOL4 v58;
  unint64_t v59;
  unint64_t v60;
  MesaCoreAnalyticsMatchEvent *v61;
  void *v62;
  MesaCoreAnalyticsMatchEvent *v63;
  void *v64;
  int v65;
  void *v66;
  _BOOL4 v67;
  MesaCoreAnalyticsMatchEvent *v68;
  void *v69;
  MesaCoreAnalyticsEnrollEvent *enrollEvent;
  void *v71;
  MesaCoreAnalyticsMatchEvent *v72;
  void *v73;
  MesaCoreAnalyticsMatchEvent *v74;
  void *v75;
  MesaCoreAnalyticsMatchEvent *v76;
  void *v77;
  _BOOL4 v78;
  MesaCoreAnalyticsMatchEvent *v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  int v83;
  _BYTE v84[28];
  __int16 v85;
  const char *v86;
  __int16 v87;
  int v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v83 = 134217984;
    *(_QWORD *)v84 = a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics statisticsMessage: %p\n", (uint8_t *)&v83, 0xCu);
  }
  v7 = self;
  objc_sync_enter(v7);
  if (__osLog)
    v8 = __osLog;
  else
    v8 = v5;
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v10 = *(_QWORD *)(&a3->var0 + 1);
      v83 = 67109632;
      *(_DWORD *)v84 = var0;
      *(_WORD *)&v84[4] = 2048;
      *(_QWORD *)&v84[6] = v10;
      *(_WORD *)&v84[14] = 2048;
      *(_QWORD *)&v84[16] = v10;
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics statisticsMessage: type %d fixed: %lld floating: %f\n", (uint8_t *)&v83, 0x1Cu);
    }
    switch(a3->var0)
    {
      case 0x13u:
        currentEvent = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (currentEvent == v7->_matchEvent)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(&a3->var0 + 1));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MesaCoreAnalyticsMatchEvent setSensorRecoveryReason:](currentEvent, "setSensorRecoveryReason:", v12);

        }
        break;
      case 0x19u:
        matchEvent = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (matchEvent == v7->_matchEvent)
        {
          lastMatchAttemptTimeOffset = v7->_lastMatchAttemptTimeOffset;
          v45 = *(_QWORD *)(&a3->var0 + 1);
          if (lastMatchAttemptTimeOffset > v45)
          {
            lastMatchAttemptTimeOffset = 0;
            v7->_lastMatchAttemptTimeOffset = 0;
            matchEvent = v7->_matchEvent;
            v45 = *(_QWORD *)(&a3->var0 + 1);
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v45 - lastMatchAttemptTimeOffset);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[MesaCoreAnalyticsMatchEvent setFingerDetectEndTime:](matchEvent, "setFingerDetectEndTime:", v46);

        }
        break;
      case 0x1Au:
        v13 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v13 == v7->_matchEvent)
        {
          -[MesaCoreAnalyticsMatchEvent firstCaptureEndTime](v13, "firstCaptureEndTime");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            v16 = *(_QWORD *)(&a3->var0 + 1);
            v17 = v7->_lastMatchAttemptTimeOffset;
            if (v16 <= v17)
            {
              if (__osLog)
                v82 = __osLog;
              else
                v82 = v5;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                v83 = 136316162;
                *(_QWORD *)v84 = "stats->value.fixed > _lastMatchAttemptTimeOffset";
                *(_WORD *)&v84[8] = 2048;
                *(_QWORD *)&v84[10] = 0;
                *(_WORD *)&v84[18] = 2080;
                *(_QWORD *)&v84[20] = "";
                v85 = 2080;
                v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
                v87 = 1024;
                v88 = 1119;
                goto LABEL_112;
              }
            }
            else
            {
              v18 = v7->_matchEvent;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16 - v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[MesaCoreAnalyticsMatchEvent setFirstCaptureEndTime:](v18, "setFirstCaptureEndTime:", v19);

            }
          }
        }
        break;
      case 0x1Bu:
        v47 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v47 == v7->_matchEvent)
        {
          -[MesaCoreAnalyticsMatchEvent imageProcessingEndTime](v47, "imageProcessingEndTime");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48 == 0;

          if (v49)
          {
            -[MesaCoreAnalyticsMatchEvent firstCaptureEndTime](v7->_matchEvent, "firstCaptureEndTime");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v50 == 0;

            if (v51)
            {
              if (__osLog)
                v82 = __osLog;
              else
                v82 = v5;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                v83 = 136316162;
                *(_QWORD *)v84 = "_matchEvent.firstCaptureEndTime";
                *(_WORD *)&v84[8] = 2048;
                *(_QWORD *)&v84[10] = 0;
                *(_WORD *)&v84[18] = 2080;
                *(_QWORD *)&v84[20] = "";
                v85 = 2080;
                v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
                v87 = 1024;
                v88 = 1126;
                goto LABEL_112;
              }
            }
            else
            {
              v52 = *(_QWORD *)(&a3->var0 + 1);
              v53 = v7->_lastMatchAttemptTimeOffset;
              if (v52 <= v53)
              {
                if (__osLog)
                  v82 = __osLog;
                else
                  v82 = v5;
                if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                {
                  v83 = 136316162;
                  *(_QWORD *)v84 = "stats->value.fixed > _lastMatchAttemptTimeOffset";
                  *(_WORD *)&v84[8] = 2048;
                  *(_QWORD *)&v84[10] = 0;
                  *(_WORD *)&v84[18] = 2080;
                  *(_QWORD *)&v84[20] = "";
                  v85 = 2080;
                  v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
                  v87 = 1024;
                  v88 = 1127;
                  goto LABEL_112;
                }
              }
              else
              {
                v54 = v7->_matchEvent;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v52 - v53);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                -[MesaCoreAnalyticsMatchEvent setImageProcessingEndTime:](v54, "setImageProcessingEndTime:", v55);

              }
            }
          }
        }
        break;
      case 0x1Cu:
        v56 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v56 == v7->_matchEvent)
        {
          -[MesaCoreAnalyticsMatchEvent imageProcessingEndTime](v56, "imageProcessingEndTime");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v57 == 0;

          if (v58)
          {
            if (__osLog)
              v82 = __osLog;
            else
              v82 = v5;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v83 = 136316162;
              *(_QWORD *)v84 = "_matchEvent.imageProcessingEndTime";
              *(_WORD *)&v84[8] = 2048;
              *(_QWORD *)&v84[10] = 0;
              *(_WORD *)&v84[18] = 2080;
              *(_QWORD *)&v84[20] = "";
              v85 = 2080;
              v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
              v87 = 1024;
              v88 = 1133;
              goto LABEL_112;
            }
          }
          else
          {
            v59 = *(_QWORD *)(&a3->var0 + 1);
            v60 = v7->_lastMatchAttemptTimeOffset;
            if (v59 <= v60)
            {
              if (__osLog)
                v82 = __osLog;
              else
                v82 = v5;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                v83 = 136316162;
                *(_QWORD *)v84 = "stats->value.fixed > _lastMatchAttemptTimeOffset";
                *(_WORD *)&v84[8] = 2048;
                *(_QWORD *)&v84[10] = 0;
                *(_WORD *)&v84[18] = 2080;
                *(_QWORD *)&v84[20] = "";
                v85 = 2080;
                v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
                v87 = 1024;
                v88 = 1134;
                goto LABEL_112;
              }
            }
            else
            {
              v61 = v7->_matchEvent;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v59 - v60);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[MesaCoreAnalyticsMatchEvent setMatcherEndTime:](v61, "setMatcherEndTime:", v62);

            }
          }
        }
        else
        {
          if (__osLog)
            v82 = __osLog;
          else
            v82 = v5;
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            v83 = 136316162;
            *(_QWORD *)v84 = "_currentEvent == _matchEvent";
            *(_WORD *)&v84[8] = 2048;
            *(_QWORD *)&v84[10] = 0;
            *(_WORD *)&v84[18] = 2080;
            *(_QWORD *)&v84[20] = "";
            v85 = 2080;
            v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
            v87 = 1024;
            v88 = 1132;
            goto LABEL_112;
          }
        }
        break;
      case 0x1Du:
        v20 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v20 == v7->_matchEvent)
        {
          v21 = *(_QWORD *)(&a3->var0 + 1);
          v22 = v7->_lastMatchAttemptTimeOffset;
          if (v21 <= v22)
          {
            if (__osLog)
              v82 = __osLog;
            else
              v82 = v5;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v83 = 136316162;
              *(_QWORD *)v84 = "stats->value.fixed > _lastMatchAttemptTimeOffset";
              *(_WORD *)&v84[8] = 2048;
              *(_QWORD *)&v84[10] = 0;
              *(_WORD *)&v84[18] = 2080;
              *(_QWORD *)&v84[20] = "";
              v85 = 2080;
              v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
              v87 = 1024;
              v88 = 1140;
              goto LABEL_112;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21 - v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MesaCoreAnalyticsMatchEvent setOverallTime:](v20, "setOverallTime:", v23);

            -[MesaCoreAnalyticsEvent fingerDetected](v7->_matchEvent, "fingerDetected");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "BOOLValue");

            if (v25)
            {
              v26 = v7->_matchEvent;
              v27 = (void *)MEMORY[0x24BDD16E0];
              -[MesaCoreAnalyticsMatchEvent overallTime](v26, "overallTime");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "unsignedIntValue");
              -[MesaCoreAnalyticsMatchEvent fingerDetectEndTime](v7->_matchEvent, "fingerDetectEndTime");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "numberWithUnsignedInt:", v29 - objc_msgSend(v30, "unsignedIntValue"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[MesaCoreAnalyticsMatchEvent setOverallTimeFingerOn:](v26, "setOverallTimeFingerOn:", v31);

            }
            -[MesaCoreAnalytics matchEventFinished](v7, "matchEventFinished");
          }
        }
        break;
      case 0x1Eu:
        v63 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v63 == v7->_matchEvent)
        {
          -[MesaCoreAnalyticsMatchEvent requestFingerOff](v63, "requestFingerOff");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "BOOLValue");

          if (v65)
          {
            if (*(_QWORD *)(&a3->var0 + 1) > v7->_lastMatchAttemptTimeOffset)
            {
              -[MesaCoreAnalyticsMatchEvent fingerDetectEndTime](v7->_matchEvent, "fingerDetectEndTime");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = v66 == 0;

              if (v67)
              {
                v68 = v7->_matchEvent;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(&a3->var0 + 1) - v7->_lastMatchAttemptTimeOffset);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                -[MesaCoreAnalyticsMatchEvent setRequestFingerOffEndTime:](v68, "setRequestFingerOffEndTime:", v69);

                v7->_lastMatchAttemptTimeOffset = *(_QWORD *)(&a3->var0 + 1);
              }
            }
          }
        }
        break;
      case 0x1Fu:
        enrollEvent = v7->_enrollEvent;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(&a3->var0 + 1));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[MesaCoreAnalyticsEnrollEvent setOverallTime:](enrollEvent, "setOverallTime:", v71);

        -[MesaCoreAnalytics enrollEventFinished](v7, "enrollEventFinished");
        break;
      case 0x20u:
        v72 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v72 == v7->_matchEvent)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(&a3->var0 + 1));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[MesaCoreAnalyticsMatchEvent setCaptureTime:](v72, "setCaptureTime:", v73);

        }
        break;
      case 0x21u:
        v74 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v74 == v7->_matchEvent)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(&a3->var0 + 1));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[MesaCoreAnalyticsMatchEvent setImageProcessingTime:](v74, "setImageProcessingTime:", v75);

        }
        break;
      case 0x22u:
        v32 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v32 == v7->_matchEvent)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(&a3->var0 + 1));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[MesaCoreAnalyticsMatchEvent setMatcherTime:](v32, "setMatcherTime:", v33);

        }
        break;
      case 0x23u:
        +[MesaCoreAnalyticsHelper mesaCaDeviceTypeFromBioDeviceType:](MesaCoreAnalyticsHelper, "mesaCaDeviceTypeFromBioDeviceType:", *(&a3->var0 + 1));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MesaCoreAnalyticsEvent setDeviceType:](v7->_currentEvent, "setDeviceType:", v34);
        -[MesaCoreAnalyticsEvent setDeviceType:](v7->_unlockEvent, "setDeviceType:", v34);
        -[MesaCoreAnalyticsEvent setDeviceType:](v7->_dailyEvent, "setDeviceType:", v34);
        -[MesaCoreAnalyticsEvent setDeviceType:](v7->_weeklyEvent, "setDeviceType:", v34);
        -[MesaCoreAnalyticsEvent setDeviceType:](v7->_fingerTouchTimeEvent, "setDeviceType:", v34);
        -[MesaCoreAnalyticsEvent setDeviceType:](v7->_fingerLiftTimeEvent, "setDeviceType:", v34);

        break;
      case 0x24u:
        v35 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v35 == v7->_matchEvent)
          -[MesaCoreAnalyticsMatchEvent setTidButtonStateWith:](v35, "setTidButtonStateWith:", *(_QWORD *)(&a3->var0 + 1));
        break;
      case 0x25u:
        v36 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v36 == v7->_matchEvent)
        {
          -[MesaCoreAnalyticsMatchEvent imageProcessingEndTime](v36, "imageProcessingEndTime");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37 == 0;

          if (v38)
          {
            if (__osLog)
              v82 = __osLog;
            else
              v82 = v5;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v83 = 136316162;
              *(_QWORD *)v84 = "_matchEvent.imageProcessingEndTime";
              *(_WORD *)&v84[8] = 2048;
              *(_QWORD *)&v84[10] = 0;
              *(_WORD *)&v84[18] = 2080;
              *(_QWORD *)&v84[20] = "";
              v85 = 2080;
              v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
              v87 = 1024;
              v88 = 1202;
              goto LABEL_112;
            }
          }
          else
          {
            v39 = *(_QWORD *)(&a3->var0 + 1);
            v40 = v7->_lastMatchAttemptTimeOffset;
            if (v39 <= v40)
            {
              if (__osLog)
                v82 = __osLog;
              else
                v82 = v5;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                v83 = 136316162;
                *(_QWORD *)v84 = "stats->value.fixed > _lastMatchAttemptTimeOffset";
                *(_WORD *)&v84[8] = 2048;
                *(_QWORD *)&v84[10] = 0;
                *(_WORD *)&v84[18] = 2080;
                *(_QWORD *)&v84[20] = "";
                v85 = 2080;
                v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
                v87 = 1024;
                v88 = 1203;
                goto LABEL_112;
              }
            }
            else
            {
              v41 = v7->_matchEvent;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v39 - v40);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[MesaCoreAnalyticsMatchEvent setMatcherEndTimeWithRetry:](v41, "setMatcherEndTimeWithRetry:", v42);

            }
          }
        }
        break;
      case 0x26u:
        v76 = (MesaCoreAnalyticsMatchEvent *)v7->_currentEvent;
        if (v76 == v7->_matchEvent)
        {
          -[MesaCoreAnalyticsMatchEvent matcherTime](v76, "matcherTime");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v77 == 0;

          if (v78)
          {
            if (__osLog)
              v82 = __osLog;
            else
              v82 = v5;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v83 = 136316162;
              *(_QWORD *)v84 = "_matchEvent.matcherTime";
              *(_WORD *)&v84[8] = 2048;
              *(_QWORD *)&v84[10] = 0;
              *(_WORD *)&v84[18] = 2080;
              *(_QWORD *)&v84[20] = "";
              v85 = 2080;
              v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
              v87 = 1024;
              v88 = 1209;
LABEL_112:
              v81 = v82;
              goto LABEL_113;
            }
          }
          else
          {
            v79 = v7->_matchEvent;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(&a3->var0 + 1));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[MesaCoreAnalyticsMatchEvent setMatcherTimeWithRetry:](v79, "setMatcherTimeWithRetry:", v80);

          }
        }
        break;
      default:
        break;
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v83 = 136316162;
    *(_QWORD *)v84 = "stats";
    *(_WORD *)&v84[8] = 2048;
    *(_QWORD *)&v84[10] = 0;
    *(_WORD *)&v84[18] = 2080;
    *(_QWORD *)&v84[20] = "";
    v85 = 2080;
    v86 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalytics.m";
    v87 = 1024;
    v88 = 1102;
    v81 = v8;
LABEL_113:
    _os_log_impl(&dword_24B74E000, v81, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v83, 0x30u);
  }
  objc_sync_exit(v7);

}

- (void)homeButtonStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics homeButtonStateChanged: %u\n", buf, 8u);
  }
  v6.receiver = self;
  v6.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics homeButtonStateChanged:](&v6, sel_homeButtonStateChanged_, v3);
}

- (void)lockStateUpdated:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  v9 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics lockStateUpdated: %u\n", buf, 8u);
  }
  v6.receiver = self;
  v6.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics lockStateUpdated:](&v6, sel_lockStateUpdated_, v3);
}

- (void)displayStatusChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  MesaCoreAnalytics *v6;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics displayStatusChanged: %u\n", buf, 8u);
  }
  v7.receiver = self;
  v7.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics displayStatusChanged:](&v7, sel_displayStatusChanged_, v3);
  v6 = self;
  objc_sync_enter(v6);
  v6->_displayOn = v3;
  objc_sync_exit(v6);

}

- (void)catacombCorrupted:(int64_t)a3
{
  NSObject *v4;
  int v5;
  int64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = a3;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics catacombCorrupted: %lld\n", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setInternalSensorType:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v5;
  MesaCoreAnalyticsMatchEvent *matchEvent;
  void *v7;
  MesaCoreAnalyticsUnlockEvent *unlockEvent;
  void *v9;
  MesaCoreAnalyticsEnrollEvent *enrollEvent;
  void *v11;
  MesaCoreAnalyticsFingerTouchTimeEvent *fingerTouchTimeEvent;
  void *v13;
  MesaCoreAnalyticsFingerLiftTimeEvent *fingerLiftTimeEvent;
  void *v15;
  MesaCoreAnalyticsDailyEvent *dailyEvent;
  void *v17;
  MesaCoreAnalyticsWeeklyEvent *weeklyEvent;
  void *v19;
  _DWORD v20[2];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v20[0] = 67109120;
    v20[1] = v3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics setSensorType: %d\n", (uint8_t *)v20, 8u);
  }
  if (self->_internalSensorType != (_DWORD)v3)
  {
    self->_internalSensorType = v3;
    matchEvent = self->_matchEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setBuiltinSensorType:](matchEvent, "setBuiltinSensorType:", v7);

    unlockEvent = self->_unlockEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_internalSensorType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setBuiltinSensorType:](unlockEvent, "setBuiltinSensorType:", v9);

    enrollEvent = self->_enrollEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_internalSensorType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setBuiltinSensorType:](enrollEvent, "setBuiltinSensorType:", v11);

    fingerTouchTimeEvent = self->_fingerTouchTimeEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_internalSensorType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setBuiltinSensorType:](fingerTouchTimeEvent, "setBuiltinSensorType:", v13);

    fingerLiftTimeEvent = self->_fingerLiftTimeEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_internalSensorType);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setBuiltinSensorType:](fingerLiftTimeEvent, "setBuiltinSensorType:", v15);

    dailyEvent = self->_dailyEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_internalSensorType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setBuiltinSensorType:](dailyEvent, "setBuiltinSensorType:", v17);

    weeklyEvent = self->_weeklyEvent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_internalSensorType);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setBuiltinSensorType:](weeklyEvent, "setBuiltinSensorType:", v19);

  }
}

- (void)wakeGestureUpdate:(int64_t)a3
{
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v8 = a3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalytics wakeGestureUpdate: %ld\n", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)MesaCoreAnalytics;
  -[BiometricKitDStatistics wakeGestureUpdate:](&v6, sel_wakeGestureUpdate_, a3);
}

- (id)deviceOrientation
{
  NSObject *analyticsDispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  analyticsDispatchQueue = self->_analyticsDispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__MesaCoreAnalytics_deviceOrientation__block_invoke;
  v5[3] = &unk_251CA0A70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(analyticsDispatchQueue, v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__MesaCoreAnalytics_deviceOrientation__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 320);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_analyticsDispatchQueue, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_biometricABC, 0);
  objc_storeStrong((id *)&self->_bioLog, 0);
  objc_storeStrong((id *)&self->_preArmedMatchEvent, 0);
  objc_storeStrong((id *)&self->_weeklyEvent, 0);
  objc_storeStrong((id *)&self->_dailyEvent, 0);
  objc_storeStrong((id *)&self->_fingerLiftTimeEvent, 0);
  objc_storeStrong((id *)&self->_fingerTouchTimeEvent, 0);
  objc_storeStrong((id *)&self->_enrollEvent, 0);
  objc_storeStrong((id *)&self->_unlockEvent, 0);
  objc_storeStrong((id *)&self->_matchEvent, 0);
  objc_storeStrong((id *)&self->_currentEvent, 0);
}

@end
