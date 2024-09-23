@implementation TAStore

- (BOOL)shouldAddTALocationLite:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSDate *lastLocationDate;
  NSDate *v13;
  NSDate *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSDate *v20;
  NSDate *v21;

  v4 = a3;
  objc_msgSend(v4, "horizontalAccuracy");
  if (v5 >= 0.0)
  {
    objc_msgSend(v4, "horizontalAccuracy");
    if (v7 > 70.0)
    {
      v8 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        -[TAStore shouldAddTALocationLite:].cold.2(v8, v4);
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isSimulatedOrSpoofed"))
    {
      v9 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        -[TAStore shouldAddTALocationLite:].cold.3(v9, v4);
      goto LABEL_10;
    }
    lastLocationDate = self->_lastLocationDate;
    objc_msgSend(v4, "getDate");
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (lastLocationDate)
    {
      v15 = -[NSDate compare:](lastLocationDate, "compare:", v13);

      if (v15 != -1)
      {
LABEL_20:
        v10 = 1;
        goto LABEL_11;
      }
      objc_msgSend(v4, "getDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", self->_lastLocationDate);
      v18 = v17;

      if (v18 < 15.0)
      {
        v19 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
          -[TAStore shouldAddTALocationLite:].cold.4(v19, v4);
        goto LABEL_10;
      }
      objc_msgSend(v4, "getDate");
      v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v20 = self->_lastLocationDate;
      self->_lastLocationDate = v21;
    }
    else
    {
      v20 = self->_lastLocationDate;
      self->_lastLocationDate = v13;
    }

    goto LABEL_20;
  }
  v6 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    -[TAStore shouldAddTALocationLite:].cold.1(v6, v4);
LABEL_10:
  v10 = 0;
LABEL_11:

  return v10;
}

- (TAEventBuffer)eventBuffer
{
  return self->_eventBuffer;
}

- (TADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (TAVisitState)visitState
{
  return self->_visitState;
}

- (void)addTAEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[TAStore updateClock:](self, "updateClock:", v6);
  if (!v7)
  {
    v8 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      -[TAStore addTAEvent:andAppendOutgoingRequestsTo:].cold.1(v8);
  }
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    if (!-[TAStore shouldAddTASPAdvertisement:](self, "shouldAddTASPAdvertisement:", v6))
      goto LABEL_15;
  }
  else if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    if (!-[TAStore shouldAddTALocationLite:](self, "shouldAddTALocationLite:", v6))
      goto LABEL_15;
  }
  else if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class())
         && !-[TAStore shouldAddTACLVisit:](self, "shouldAddTACLVisit:", v6))
  {
    goto LABEL_15;
  }
  -[TAEventBuffer ingestTAEvent:](self->_eventBuffer, "ingestTAEvent:", v6);
  -[TADeviceRecord ingestTAEvent:andAppendOutgoingRequestsTo:](self->_deviceRecord, "ingestTAEvent:andAppendOutgoingRequestsTo:", v6, v7);
  -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:](self->_visitState, "ingestTAEvent:store:appendOutgoingRequestsTo:", v6, self, v7);
  if (-[TAVisitState isInSensitiveVisit](self->_visitState, "isInSensitiveVisit")
    && objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    -[TADeviceRecord forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:withReason:](self->_deviceRecord, "forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:withReason:", v6, 1);
  }
LABEL_15:
  -[TAEventBuffer purgeWithClock:](self->_eventBuffer, "purgeWithClock:", self->_clock);
  -[TAVisitState purgeWithClock:](self->_visitState, "purgeWithClock:", self->_clock);
  -[TADeviceRecord purgeWithClock:andAppendOutgoingRequestsTo:](self->_deviceRecord, "purgeWithClock:andAppendOutgoingRequestsTo:", self->_clock, v7);
  -[TADeviceRecord checkForScanRequestsWithClock:andAppendOutgoingRequestsTo:](self->_deviceRecord, "checkForScanRequestsWithClock:andAppendOutgoingRequestsTo:", self->_clock, v7);

}

- (void)updateClock:(id)a3
{
  NSDate *clock;
  NSDate *v5;
  NSDate *v6;
  id v7;

  clock = self->_clock;
  objc_msgSend(a3, "getDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDate laterDate:](clock, "laterDate:", v7);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v6 = self->_clock;
  self->_clock = v5;

}

- (NSDate)clock
{
  return self->_clock;
}

- (BOOL)shouldAddTASPAdvertisement:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;

  v3 = a3;
  if (objc_msgSend(v3, "getDeviceType") != 1
    && objc_msgSend(v3, "getDeviceType") != 2
    && objc_msgSend(v3, "getDeviceType") != 3
    && objc_msgSend(v3, "getDeviceType") != 4)
  {
    v16 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      -[TAStore shouldAddTASPAdvertisement:].cold.4(v16, v3);
    goto LABEL_17;
  }
  v4 = objc_msgSend(v3, "getType");
  switch(v4)
  {
    case 2:
      v6 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        -[TAStore shouldAddTASPAdvertisement:].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);
      break;
    case 1:
      v15 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        -[TAStore shouldAddTASPAdvertisement:].cold.2(v15, v3);
      goto LABEL_17;
    case 0:
      v5 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        -[TAStore shouldAddTASPAdvertisement:].cold.1(v5, v3);
LABEL_17:
      v14 = 0;
      goto LABEL_18;
  }
  v14 = 1;
LABEL_18:

  return v14;
}

- (TAStore)initWithEventBufferSettings:(id)a3 scanRequestSettings:(id)a4 visitStateSettings:(id)a5 deviceRecordSettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TAStore *v14;
  uint64_t v15;
  NSDate *clock;
  TAVisitState *v17;
  TAVisitState *visitState;
  TADeviceRecord *v19;
  TADeviceRecord *deviceRecord;
  TAEventBuffer *v21;
  TAEventBuffer *eventBuffer;
  uint64_t v23;
  NSHashTable *observers;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TAStore;
  v14 = -[TAStore init](&v26, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v15 = objc_claimAutoreleasedReturnValue();
    clock = v14->_clock;
    v14->_clock = (NSDate *)v15;

    v17 = -[TAVisitState initWithSettings:scanRequestSettings:]([TAVisitState alloc], "initWithSettings:scanRequestSettings:", v12, v11);
    visitState = v14->_visitState;
    v14->_visitState = v17;

    v19 = -[TADeviceRecord initWithSettings:]([TADeviceRecord alloc], "initWithSettings:", v13);
    deviceRecord = v14->_deviceRecord;
    v14->_deviceRecord = v19;

    -[TADeviceRecord setDelegate:](v14->_deviceRecord, "setDelegate:", v14);
    v21 = -[TAEventBuffer initWithSettings:]([TAEventBuffer alloc], "initWithSettings:", v10);
    eventBuffer = v14->_eventBuffer;
    v14->_eventBuffer = v21;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v23 = objc_claimAutoreleasedReturnValue();
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v23;

    -[TAVisitState addObserver:](v14->_visitState, "addObserver:", v14);
  }

  return v14;
}

- (id)fetchTAUnknownBeacon:(id)a3
{
  return -[TADeviceRecord getUnknownBeacon:](self->_deviceRecord, "getUnknownBeacon:", a3);
}

- (void)requestAIS:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v21 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_217877000, v6, OS_LOG_TYPE_DEFAULT, "#TAStore request for AIS fetch %{public}s", buf, 0xCu);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TAStore observers](self, "observers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "didRequestAIS:", v4);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
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

- (void)visitState:(id)a3 didChangeStateFromType:(unint64_t)a4 toType:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    -[TAStore visitState:didChangeStateFromType:toType:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  -[TADeviceRecord updateDeviceRecordOnSessionChange:WithCurrentDate:](self->_deviceRecord, "updateDeviceRecordOnSessionChange:WithCurrentDate:", v8, self->_clock);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
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
        v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v21);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v22, "visitState:didChangeStateFromType:toType:", v8, a4, a5);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

}

- (void)visitState:(id)a3 didIssueMetricsSubmissionHint:(unint64_t)a4
{
  id v6;
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
  v6 = a3;
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
          objc_msgSend(v12, "visitState:didIssueMetricsSubmissionHint:", v6, a4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)shouldAddTACLVisit:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "confidence") != 2)
  {
    v5 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      -[TAStore shouldAddTACLVisit:].cold.2(v5, v3);
    goto LABEL_8;
  }
  if ((objc_msgSend(v3, "isTemporalOrderSensical") & 1) == 0)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAStore shouldAddTACLVisit:].cold.1(v6, v3);
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  v4 = 1;
LABEL_9:

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSDate hash](self->_clock, "hash");
  v4 = -[TAEventBuffer hash](self->_eventBuffer, "hash") ^ v3;
  v5 = -[TADeviceRecord hash](self->_deviceRecord, "hash");
  return v4 ^ v5 ^ -[TAVisitState hash](self->_visitState, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
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

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[TAStore eventBuffer](self, "eventBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      -[TAStore eventBuffer](self, "eventBuffer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventBuffer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v9;
      if (!objc_msgSend(v9, "isEqual:", v3))
      {
        v10 = 0;
        goto LABEL_23;
      }
    }
    -[TAStore deviceRecord](self, "deviceRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != v12)
    {
      -[TAStore deviceRecord](self, "deviceRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceRecord");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:"))
      {
        v10 = 0;
LABEL_21:

LABEL_22:
        if (v7 == v8)
        {
LABEL_24:

          goto LABEL_25;
        }
LABEL_23:

        goto LABEL_24;
      }
      v29 = v13;
    }
    -[TAStore visitState](self, "visitState");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visitState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v14;
    if ((void *)v14 == v15)
    {
      v25 = v12;
      v26 = v11;
    }
    else
    {
      -[TAStore visitState](self, "visitState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "visitState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v16;
      if (!objc_msgSend(v16, "isEqual:"))
      {
        v10 = 0;
        v22 = v31;
        goto LABEL_19;
      }
      v25 = v12;
      v26 = v11;
    }
    -[TAStore clock](self, "clock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clock");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v18)
    {

      v10 = 1;
    }
    else
    {
      v19 = (void *)v18;
      -[TAStore clock](self, "clock");
      v24 = v3;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clock");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v20, "isEqual:", v21);

      v3 = v24;
    }
    v22 = v31;
    v12 = v25;
    v11 = v26;
    if (v31 == v15)
    {
LABEL_20:

      v13 = v29;
      if (v11 == v12)
        goto LABEL_22;
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  v10 = 0;
LABEL_25:

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[TAStore clock](self, "clock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; clock: '%@'>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_visitState, 0);
  objc_storeStrong((id *)&self->_eventBuffer, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_lastLocationDate, 0);
}

- (void)visitState:(uint64_t)a3 didChangeStateFromType:(uint64_t)a4 toType:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_217877000, a1, a3, "#TAStore received visit state update", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)shouldAddTASPAdvertisement:(void *)a1 .cold.1(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_5(&dword_217877000, v10, v11, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)shouldAddTASPAdvertisement:(void *)a1 .cold.2(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_5(&dword_217877000, v10, v11, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)shouldAddTASPAdvertisement:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_217877000, a1, a3, "#TAStore WILD advertisement found, adding to store", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)shouldAddTASPAdvertisement:(void *)a1 .cold.4(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_5(&dword_217877000, v10, v11, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)shouldAddTALocationLite:(void *)a1 .cold.1(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_5(&dword_217877000, v10, v11, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)shouldAddTALocationLite:(void *)a1 .cold.2(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_5(&dword_217877000, v10, v11, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)shouldAddTALocationLite:(void *)a1 .cold.3(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_5(&dword_217877000, v10, v11, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)shouldAddTALocationLite:(void *)a1 .cold.4(void *a1, void *a2)
{
  void *v2;
  void *v3;
  NSObject *v5;
  objc_class *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = OUTLINED_FUNCTION_12(v7, v8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sampling policy at one location every %.2lf seconds"), 0x402E000000000000);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = OUTLINED_FUNCTION_16(v10, v11);
  objc_msgSend(a2, "description");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_DWORD *)buf = 136446723;
  v15 = v9;
  v16 = 2081;
  v17 = v12;
  v18 = 2081;
  v19 = objc_msgSend(v13, "UTF8String");
  _os_log_debug_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "#TAStore not adding %{public}s due to %{private}s:%{private}s", buf, 0x20u);

}

- (void)shouldAddTACLVisit:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v2;
  void *v3;
  objc_class *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint8_t v10[40];

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
  _os_log_error_impl(&dword_217877000, v2, OS_LOG_TYPE_ERROR, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v10, 0x20u);

  OUTLINED_FUNCTION_5_2();
}

- (void)shouldAddTACLVisit:(void *)a1 .cold.2(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_5(&dword_217877000, v10, v11, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_5_2();
}

- (void)addTAEvent:(os_log_t)log andAppendOutgoingRequestsTo:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_217877000, log, OS_LOG_TYPE_FAULT, "#TAStore addTAEvent called with nil requests parameter", v1, 2u);
  OUTLINED_FUNCTION_1_3();
}

@end
