@implementation TAVisitSnapshot

- (void)updateLatestLocation:(id)a3
{
  TALocationLite *v4;
  TALocationLite *latestLocation;
  TALocationLite *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  TALocationLite *v13;
  NSObject *v14;

  v4 = (TALocationLite *)objc_msgSend(a3, "copy");
  latestLocation = self->_latestLocation;
  self->_latestLocation = v4;

  if (self->_latestLocation)
  {
    v6 = [TALocationLite alloc];
    -[TACLVisit getDate](self->_representativeVisit, "getDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TACLVisit coordinate](self->_representativeVisit, "coordinate");
    v9 = v8;
    -[TACLVisit coordinate](self->_representativeVisit, "coordinate");
    v11 = v10;
    -[TACLVisit horizontalAccuracy](self->_representativeVisit, "horizontalAccuracy");
    v13 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v6, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v7, v9, v11, v12);

    self->_latestLocationInsideVisit = !-[TALocationLite distanceToLocation:satisfyNSigma:satisfyMinDistance:](self->_latestLocation, "distanceToLocation:satisfyNSigma:satisfyMinDistance:", v13, self->_maxNSigmaBetweenLastLocationAndVisit, 0.0);
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
  {
    -[TAVisitSnapshot updateLatestLocation:].cold.2();
  }
  v14 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    -[TAVisitSnapshot updateLatestLocation:].cold.1((uint64_t)self, v14);
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (unint64_t)loiType
{
  return self->_loiType;
}

- (TALocationLite)latestLocation
{
  return self->_latestLocation;
}

- (TAVisitSnapshot)initWithTACLVisit:(id)a3 uniqueUTBufferCap:(unint64_t)a4 displayEventBufferSizeCap:(unint64_t)a5 maxNSigmaBetweenLastLocationAndVisit:(unint64_t)a6
{
  id v10;
  TAVisitSnapshot *v11;
  TAVisitSnapshot *v12;
  uint64_t v13;
  TACLVisit *representativeVisit;
  NSMutableDictionary *v15;
  NSMutableDictionary *latestUtAdvertisements;
  NSMutableDictionary *v17;
  NSMutableDictionary *earliestUtAdvertisements;
  NSMutableOrderedSet *v19;
  NSMutableOrderedSet *lruUtAdvertisementCache;
  NSMutableArray *v21;
  NSMutableArray *displayEvents;
  TALocationLite *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  TALocationLite *latestLocation;
  uint64_t v32;
  NSDate *lastLoiTypeUpdateTime;
  NSNumber *distanceToClosestLoi;
  NSDate *entryDurationOfConsiderationClosed;
  objc_super v37;

  v10 = a3;
  v37.receiver = self;
  v37.super_class = (Class)TAVisitSnapshot;
  v11 = -[TAVisitSnapshot init](&v37, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isClosed = 0;
    v13 = objc_msgSend(v10, "copy");
    representativeVisit = v12->_representativeVisit;
    v12->_representativeVisit = (TACLVisit *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    latestUtAdvertisements = v12->_latestUtAdvertisements;
    v12->_latestUtAdvertisements = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    earliestUtAdvertisements = v12->_earliestUtAdvertisements;
    v12->_earliestUtAdvertisements = v17;

    v19 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    lruUtAdvertisementCache = v12->_lruUtAdvertisementCache;
    v12->_lruUtAdvertisementCache = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    displayEvents = v12->_displayEvents;
    v12->_displayEvents = v21;

    v12->_uniqueUTBufferSizeCap = a4;
    v12->_displayEventBufferSizeCap = a5;
    v23 = [TALocationLite alloc];
    objc_msgSend(v10, "getDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    v26 = v25;
    objc_msgSend(v10, "coordinate");
    v28 = v27;
    objc_msgSend(v10, "horizontalAccuracy");
    v30 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v23, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v24, v26, v28, v29);
    latestLocation = v12->_latestLocation;
    v12->_latestLocation = (TALocationLite *)v30;

    v12->_loiType = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v32 = objc_claimAutoreleasedReturnValue();
    lastLoiTypeUpdateTime = v12->_lastLoiTypeUpdateTime;
    v12->_lastLoiTypeUpdateTime = (NSDate *)v32;

    distanceToClosestLoi = v12->_distanceToClosestLoi;
    v12->_distanceToClosestLoi = 0;

    v12->_latestLocationInsideVisit = 1;
    entryDurationOfConsiderationClosed = v12->_entryDurationOfConsiderationClosed;
    v12->_entryDurationOfConsiderationClosed = 0;

    v12->_maxNSigmaBetweenLastLocationAndVisit = a6;
  }

  return v12;
}

- (void)setRepresentativeVisit:(id)a3
{
  id v4;
  TACLVisit **p_representativeVisit;
  TACLVisit *representativeVisit;
  void *v7;
  void *v8;
  void *v9;
  TACLVisit *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  TACLVisit *v20;
  void *v21;

  v4 = a3;
  if (-[TAVisitSnapshot isClosed](self, "isClosed"))
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAVisitSnapshot setRepresentativeVisit:].cold.1();
  }
  else
  {
    representativeVisit = self->_representativeVisit;
    p_representativeVisit = &self->_representativeVisit;
    -[TACLVisit arrivalDate](representativeVisit, "arrivalDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "laterDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [TACLVisit alloc];
    objc_msgSend(v4, "coordinate");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v4, "horizontalAccuracy");
    v16 = v15;
    -[TACLVisit arrivalDate](*p_representativeVisit, "arrivalDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detectionDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[TACLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:](v10, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v17, v9, v18, objc_msgSend(v4, "confidence"), v12, v14, v16);
    v20 = *p_representativeVisit;
    *p_representativeVisit = (TACLVisit *)v19;

    v21 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      -[TAVisitSnapshot setRepresentativeVisit:].cold.2(v21, v4, (id *)p_representativeVisit);

  }
}

- (id)getEntryIntervalEvaluatedUntil
{
  void *displayOnCalculator;

  displayOnCalculator = self->_displayOnCalculator;
  if (displayOnCalculator)
  {
    objc_msgSend(displayOnCalculator, "evaluatedUntil");
    displayOnCalculator = (void *)objc_claimAutoreleasedReturnValue();
  }
  return displayOnCalculator;
}

- (void)addScanState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  TADisplayOnCalculator *displayOnCalculator;
  NSDate *v11;
  NSDate *v12;
  void *v13;
  NSObject *v14;
  NSDate *entryDurationOfConsiderationClosed;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    v5 = (void *)MEMORY[0x24BDD1508];
    -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createIntervalSafelyWithStartDate:endDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "getDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v8, "containsDate:", v9);

    if ((v7 & 1) != 0)
    {
      displayOnCalculator = self->_displayOnCalculator;
      objc_msgSend(v4, "getDate");
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!displayOnCalculator)
      {
        entryDurationOfConsiderationClosed = self->_entryDurationOfConsiderationClosed;
        self->_entryDurationOfConsiderationClosed = v11;

        goto LABEL_9;
      }
      -[TADisplayOnCalculator completeDisplayOnWithEndDate:](displayOnCalculator, "completeDisplayOnWithEndDate:", v11);
    }
    else
    {
      v13 = (void *)TAStatusLog;
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      v14 = v13;
      objc_msgSend(v4, "description");
      v12 = (NSDate *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = 136380931;
      v17 = -[NSDate UTF8String](v12, "UTF8String");
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_217877000, v14, OS_LOG_TYPE_DEFAULT, "#TAVisitSnapshot Scan completed: %{private}s not in valid time range %{public}@", (uint8_t *)&v16, 0x16u);

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)addUTAdvertisement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1508];
  -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createIntervalSafelyWithStartDate:endDate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "getDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "containsDate:", v9);

  if ((v7 & 1) != 0)
  {
    if (self->_latestLocationInsideVisit)
    {
      objc_msgSend(v4, "address");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableOrderedSet containsObject:](self->_lruUtAdvertisementCache, "containsObject:", v10))
        -[NSMutableOrderedSet removeObject:](self->_lruUtAdvertisementCache, "removeObject:", v10);
      while (-[NSMutableOrderedSet count](self->_lruUtAdvertisementCache, "count") >= self->_uniqueUTBufferSizeCap
           && -[NSMutableOrderedSet count](self->_lruUtAdvertisementCache, "count"))
      {
        -[NSMutableOrderedSet firstObject](self->_lruUtAdvertisementCache, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_latestUtAdvertisements, "removeObjectForKey:", v11);
        -[NSMutableDictionary removeObjectForKey:](self->_earliestUtAdvertisements, "removeObjectForKey:", v11);
        -[NSMutableOrderedSet removeObject:](self->_lruUtAdvertisementCache, "removeObject:", v11);

      }
      -[NSMutableOrderedSet addObject:](self->_lruUtAdvertisementCache, "addObject:", v10);
      -[NSMutableDictionary setObject:forKey:](self->_latestUtAdvertisements, "setObject:forKey:", v4, v10);
      -[NSMutableDictionary objectForKey:](self->_earliestUtAdvertisements, "objectForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        -[NSMutableDictionary setObject:forKey:](self->_earliestUtAdvertisements, "setObject:forKey:", v4, v10);
      goto LABEL_15;
    }
    v18 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v18;
      objc_msgSend(v4, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = 136380675;
      v20 = objc_msgSend(v10, "UTF8String");
      v15 = "#TAVisitSnapshot Advertisement %{private}s not added to snapshot due to latest location not inside visit";
      v16 = v14;
      v17 = 12;
      goto LABEL_14;
    }
  }
  else
  {
    v13 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v4, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = 136380931;
      v20 = objc_msgSend(v10, "UTF8String");
      v21 = 2114;
      v22 = v8;
      v15 = "#TAVisitSnapshot Advertisement %{private}s not in valid time range %{public}@";
      v16 = v14;
      v17 = 22;
LABEL_14:
      _os_log_impl(&dword_217877000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v17);

LABEL_15:
    }
  }

}

- (void)addSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "systemStateType") == 2)
  {
    v5 = (void *)MEMORY[0x24BDD1508];
    if (-[NSMutableArray count](self->_displayEvents, "count"))
      -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createIntervalSafelyWithStartDate:endDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "getDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v8, "containsDate:", v9);

    if ((v7 & 1) == 0)
    {
      v19 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v22 = 67240450;
        v23 = objc_msgSend(v4, "isOn");
        v24 = 2114;
        v25 = v8;
        _os_log_impl(&dword_217877000, v20, OS_LOG_TYPE_DEFAULT, "#TAVisitSnapshot System display state isOn: %{public}d not in valid time range %{public}@", (uint8_t *)&v22, 0x12u);

      }
      goto LABEL_16;
    }
    -[NSMutableArray lastObject](self->_displayEvents, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "getDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:", v13);

      if (v14 == 1)
      {
        v15 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          v17 = objc_msgSend(v4, "isOn");
          objc_msgSend(v11, "getDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 67240450;
          v23 = v17;
          v24 = 2114;
          v25 = v18;
          _os_log_impl(&dword_217877000, v16, OS_LOG_TYPE_DEFAULT, "#TAVisitSnapshot System display state isOn: %{public}d received out of order, after %{public}@", (uint8_t *)&v22, 0x12u);

        }
        goto LABEL_15;
      }
      v21 = objc_msgSend(v11, "isOn");
      if (v21 == objc_msgSend(v4, "isOn"))
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
    }
    -[NSMutableArray addObject:](self->_displayEvents, "addObject:", v4);
    if (-[NSMutableArray count](self->_displayEvents, "count") > self->_displayEventBufferSizeCap)
      -[TAVisitSnapshot pruneDisplayEvents](self, "pruneDisplayEvents");
    goto LABEL_15;
  }
LABEL_17:

}

- (BOOL)setDepartureVisit:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v4 = a3;
  if (-[TAVisitSnapshot isClosed](self, "isClosed"))
  {
    v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAVisitSnapshot setDepartureVisit:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "hasDepartureDate"))
  {
    v13 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAVisitSnapshot setDepartureVisit:].cold.3((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "isTemporalOrderSensical"))
  {
    v20 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAVisitSnapshot setDepartureVisit:].cold.2(v20, v4);
    goto LABEL_11;
  }
  -[TAVisitSnapshot setRepresentativeVisit:](self, "setRepresentativeVisit:", v4);
  -[TAVisitSnapshot closeSnapshotCleanup](self, "closeSnapshotCleanup");
  v12 = 1;
  self->_isClosed = 1;
LABEL_12:

  return v12;
}

- (void)closeSnapshotCleanup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_earliestUtAdvertisements, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_earliestUtAdvertisements, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "getDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "compare:", v11);

        if (v12 == 1)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_latestUtAdvertisements, "removeObjectForKey:", v8);
          -[NSMutableDictionary removeObjectForKey:](self->_earliestUtAdvertisements, "removeObjectForKey:", v8);
          -[NSMutableOrderedSet removeObject:](self->_lruUtAdvertisementCache, "removeObject:", v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }
  v13 = -[NSMutableArray count](self->_displayEvents, "count");
  if (v13 >= 1)
  {
    v14 = v13 + 1;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_displayEvents, "objectAtIndexedSubscript:", (v14 - 2));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "compare:", v17);

      if (v18 != 1)
        break;
      -[NSMutableArray removeLastObject](self->_displayEvents, "removeLastObject");

      if ((unint64_t)--v14 <= 1)
        goto LABEL_16;
    }

  }
LABEL_16:

}

- (void)calculateExitIntervalWithDisplayOnBudget:(double)a3
{
  NSDate *v5;
  NSDate *exitIntervalBeginning;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSDate *v14;
  NSDate *v15;
  id v16;
  id v18;
  id v19;

  if (-[TAVisitSnapshot isClosed](self, "isClosed"))
  {
    if (!self->_exitIntervalBeginning)
    {
      -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
      v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
      exitIntervalBeginning = self->_exitIntervalBeginning;
      self->_exitIntervalBeginning = v5;

      if (-[NSMutableArray count](self->_displayEvents, "count"))
      {
        -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NSMutableArray count](self->_displayEvents, "count");
        if (a3 <= 0.0 || v8 < 1)
        {
          v16 = v7;
        }
        else
        {
          v9 = v8;
          while (1)
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_displayEvents, "objectAtIndexedSubscript:", (v9 - 1));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "isOn"))
            {
              objc_msgSend(v10, "getDate");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "timeIntervalSinceDate:", v11);
              v13 = v12;

              if (v13 > 0.0)
              {
                if (v13 > a3)
                {
                  objc_msgSend(v7, "dateByAddingTimeInterval:", -a3);
                  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  v15 = self->_exitIntervalBeginning;
                  self->_exitIntervalBeginning = v14;

                }
                a3 = a3 - v13;
              }
            }
            objc_msgSend(v10, "getDate");
            v18 = (id)objc_claimAutoreleasedReturnValue();

            if (a3 <= 0.0)
              break;
            v16 = v18;
            v7 = v18;
            if (v9-- <= 1)
              goto LABEL_20;
          }
          v16 = v18;
        }
LABEL_20:
        v19 = v16;
        -[NSMutableArray removeAllObjects](self->_displayEvents, "removeAllObjects");

      }
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TAVisitSnapshot calculateExitIntervalWithDisplayOnBudget:].cold.1();
  }
}

- (double)getDisplayOnTimeUntilEndDate:(id)a3
{
  id v4;
  TADisplayOnCalculator *v5;
  void *v6;
  TADisplayOnCalculator *v7;
  NSMutableArray *displayEvents;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  v5 = [TADisplayOnCalculator alloc];
  -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TADisplayOnCalculator initWithStartTime:](v5, "initWithStartTime:", v6);

  displayEvents = self->_displayEvents;
  -[NSMutableDictionary allValues](self->_latestUtAdvertisements, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TADisplayOnCalculator calculateDisplayOnWithEvents:advertisements:endDate:](v7, "calculateDisplayOnWithEvents:advertisements:endDate:", displayEvents, v9, v4);
  v11 = v10;

  return v11;
}

- (void)updateEntryIntervalWithDisplayOnBudget:(double)a3 evaluateToEnd:(BOOL)a4
{
  _BOOL4 v4;
  TADisplayOnCalculator *v7;
  void *v8;
  TADisplayOnCalculator *v9;
  TADisplayOnCalculator *displayOnCalculator;
  NSDate *entryDurationOfConsiderationClosed;
  NSDate *v12;
  void *v13;
  TADisplayOnCalculator *v14;
  NSMutableArray *displayEvents;
  void *v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  if (!self->_displayOnCalculator)
  {
    v7 = [TADisplayOnCalculator alloc];
    -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TADisplayOnCalculator initWithStartTime:budget:](v7, "initWithStartTime:budget:", v8, a3);
    displayOnCalculator = self->_displayOnCalculator;
    self->_displayOnCalculator = v9;

  }
  entryDurationOfConsiderationClosed = self->_entryDurationOfConsiderationClosed;
  if (entryDurationOfConsiderationClosed)
  {
    v12 = entryDurationOfConsiderationClosed;
LABEL_5:
    v13 = v12;
LABEL_6:
    v14 = self->_displayOnCalculator;
    displayEvents = self->_displayEvents;
    -[NSMutableDictionary allValues](self->_latestUtAdvertisements, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TADisplayOnCalculator calculateDisplayOnWithEvents:advertisements:endDate:](v14, "calculateDisplayOnWithEvents:advertisements:endDate:", displayEvents, v16, v13);

    if (self->_entryDurationOfConsiderationClosed)
      -[TADisplayOnCalculator completeDisplayOnWithEndDate:](self->_displayOnCalculator, "completeDisplayOnWithEndDate:");
    goto LABEL_8;
  }
  if (!v4)
  {
    -[TAVisitSnapshot mostRecentAdvertisementDate](self, "mostRecentAdvertisementDate", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TADisplayOnCalculator evaluatedUntil](self->_displayOnCalculator, "evaluatedUntil");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "compare:", v17);

    if (v18 != 1)
      goto LABEL_8;
    goto LABEL_6;
  }
  if (-[TAVisitSnapshot isClosed](self, "isClosed", a3))
  {
    -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    -[TAVisitSnapshot updateEntryIntervalWithDisplayOnBudget:evaluateToEnd:].cold.1();
  v13 = 0;
LABEL_8:

}

- (id)getEntryAdvertisementsWithDisplayOnBudget:(double)a3
{
  void *v4;
  id v5;
  NSMutableDictionary *earliestUtAdvertisements;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  -[TAVisitSnapshot updateEntryIntervalWithDisplayOnBudget:evaluateToEnd:](self, "updateEntryIntervalWithDisplayOnBudget:evaluateToEnd:", 0, a3);
  -[TADisplayOnCalculator evaluatedUntil](self->_displayOnCalculator, "evaluatedUntil");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    earliestUtAdvertisements = self->_earliestUtAdvertisements;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__TAVisitSnapshot_getEntryAdvertisementsWithDisplayOnBudget___block_invoke;
    v11[3] = &unk_24D815760;
    v11[4] = self;
    v7 = v5;
    v12 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](earliestUtAdvertisements, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = v12;
    v9 = v7;

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __61__TAVisitSnapshot_getEntryAdvertisementsWithDisplayOnBudget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "getDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "evaluatedUntil");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (v8 != 1)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v9);

}

- (id)getExitAdvertisementsWithDisplayOnBudget:(double)a3
{
  id v4;
  NSMutableDictionary *latestUtAdvertisements;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  if (!self->_exitIntervalBeginning)
  {
    -[TAVisitSnapshot calculateExitIntervalWithDisplayOnBudget:](self, "calculateExitIntervalWithDisplayOnBudget:", a3);
    if (!self->_exitIntervalBeginning)
      return objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  latestUtAdvertisements = self->_latestUtAdvertisements;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__TAVisitSnapshot_getExitAdvertisementsWithDisplayOnBudget___block_invoke;
  v10[3] = &unk_24D815760;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](latestUtAdvertisements, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __60__TAVisitSnapshot_getExitAdvertisementsWithDisplayOnBudget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(v5, "getDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (v8 != 1)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v9);

}

- (double)getDurationOfVisitExitConsideredWithDisplayOnBudget:(double)a3
{
  void *v5;
  double v6;
  double v7;

  if (-[TAVisitSnapshot isClosed](self, "isClosed"))
  {
    -[TAVisitSnapshot calculateExitIntervalWithDisplayOnBudget:](self, "calculateExitIntervalWithDisplayOnBudget:", a3);
    if (self->_exitIntervalBeginning)
    {
      -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", self->_exitIntervalBeginning);
      v7 = v6;

      return v7;
    }
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      -[TAVisitSnapshot getDurationOfVisitExitConsideredWithDisplayOnBudget:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TAVisitSnapshot getDurationOfVisitExitConsideredWithDisplayOnBudget:].cold.2();
  }
  return 0.0;
}

- (double)getDurationOfVisitEntryConsideredWithDisplayOnBudget:(double)a3
{
  TADisplayOnCalculator *displayOnCalculator;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (-[TAVisitSnapshot isClosed](self, "isClosed"))
  {
    -[TAVisitSnapshot updateEntryIntervalWithDisplayOnBudget:evaluateToEnd:](self, "updateEntryIntervalWithDisplayOnBudget:evaluateToEnd:", 1, a3);
    displayOnCalculator = self->_displayOnCalculator;
    if (displayOnCalculator)
    {
      -[TADisplayOnCalculator evaluatedUntil](displayOnCalculator, "evaluatedUntil");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      v9 = v8;

      return v9;
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TAVisitSnapshot getDurationOfVisitEntryConsideredWithDisplayOnBudget:].cold.1();
  }
  return 0.0;
}

- (id)mostRecentAdvertisementDate
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableOrderedSet lastObject](self->_lruUtAdvertisementCache, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_latestUtAdvertisements, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)pruneDisplayEvents
{
  int v3;

  v3 = -[NSMutableArray count](self->_displayEvents, "count") - LODWORD(self->_displayEventBufferSizeCap);
  if (v3 >= 1)
  {
    do
    {
      -[NSMutableArray removeObjectAtIndex:](self->_displayEvents, "removeObjectAtIndex:", 0);
      --v3;
    }
    while (v3);
  }
}

- (void)updateLoiType:(id)a3
{
  id v4;
  TALocationLite *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TALocationLite *v12;
  TALocationLite *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  TALocationLite *v20;
  double v21;
  double v22;
  id *p_lastLoiTypeUpdateTime;
  NSDate *lastLoiTypeUpdateTime;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSNumber *distanceToClosestLoi;
  double v32;
  double v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSDate *v37;
  NSDate *v38;
  NSNumber *v39;
  NSNumber *v40;
  int v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TALocationLite alloc];
  -[TACLVisit getDate](self->_representativeVisit, "getDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit coordinate](self->_representativeVisit, "coordinate");
  v8 = v7;
  -[TACLVisit coordinate](self->_representativeVisit, "coordinate");
  v10 = v9;
  -[TACLVisit horizontalAccuracy](self->_representativeVisit, "horizontalAccuracy");
  v12 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v5, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v6, v8, v10, v11);

  v13 = [TALocationLite alloc];
  objc_msgSend(v4, "getDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latitude");
  v16 = v15;
  objc_msgSend(v4, "longitude");
  v18 = v17;
  objc_msgSend(v4, "horizontalAccuracy");
  v20 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v13, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v14, v16, v18, v19);

  -[TALocationLite distanceFromLocation:](v12, "distanceFromLocation:", v20);
  v22 = v21;
  if (v21 < 250.0)
  {
    p_lastLoiTypeUpdateTime = (id *)&self->_lastLoiTypeUpdateTime;
    lastLoiTypeUpdateTime = self->_lastLoiTypeUpdateTime;
    objc_msgSend(v4, "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDate compare:](lastLoiTypeUpdateTime, "compare:", v25) != NSOrderedAscending)
    {
      v26 = *p_lastLoiTypeUpdateTime;
      objc_msgSend(v4, "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "compare:", v27))
      {

        goto LABEL_5;
      }
      distanceToClosestLoi = self->_distanceToClosestLoi;
      if (distanceToClosestLoi)
      {
        -[NSNumber doubleValue](distanceToClosestLoi, "doubleValue");
        v33 = v32;

        if (v22 >= v33)
        {
LABEL_5:
          v28 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
            -[TAVisitSnapshot updateLoiType:].cold.1(v28, v4, p_lastLoiTypeUpdateTime);
          goto LABEL_17;
        }
        goto LABEL_14;
      }

    }
LABEL_14:
    v34 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      TALocationOfInterestTypeToString(objc_msgSend(v4, "type"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138477827;
      v42 = *(double *)&v36;
      _os_log_impl(&dword_217877000, v35, OS_LOG_TYPE_DEFAULT, "#TAVisitSnapshot update visit snapshot with LOI type %{private}@", (uint8_t *)&v41, 0xCu);

    }
    self->_loiType = objc_msgSend(v4, "type");
    objc_msgSend(v4, "date");
    v37 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v38 = self->_lastLoiTypeUpdateTime;
    self->_lastLoiTypeUpdateTime = v37;

    v39 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", v22);
    v40 = self->_distanceToClosestLoi;
    self->_distanceToClosestLoi = v39;

    goto LABEL_17;
  }
  v29 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v30 = v29;
    v41 = 134284033;
    v42 = v22;
    v43 = 2049;
    v44 = objc_msgSend(v4, "type");
    v45 = 2049;
    v46 = v22 - 250.0;
    _os_log_debug_impl(&dword_217877000, v30, OS_LOG_TYPE_DEBUG, "#TAVisitSnapshot the visit snapshot located %{private}f meters away from %{private}lu LOI type with %{private}f residual", (uint8_t *)&v41, 0x20u);

  }
LABEL_17:

}

- (id)getArrivalDelay
{
  TACLVisit *representativeVisit;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  representativeVisit = self->_representativeVisit;
  if (!representativeVisit)
    goto LABEL_5;
  -[TACLVisit detectionDate](representativeVisit, "detectionDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  v5 = (void *)v4;
  -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit detectionDate](self->_representativeVisit, "detectionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (v9 != 1)
  {
    v12 = (void *)MEMORY[0x24BDD1508];
    -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TACLVisit detectionDate](self->_representativeVisit, "detectionDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createIntervalSafelyWithStartDate:endDate:", v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v10 = 0;
  }
  return v10;
}

- (id)getDepartureDelay
{
  TACLVisit *representativeVisit;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  representativeVisit = self->_representativeVisit;
  if (!representativeVisit)
    goto LABEL_5;
  -[TACLVisit detectionDate](representativeVisit, "detectionDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  v5 = (void *)v4;
  -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit detectionDate](self->_representativeVisit, "detectionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (v9 != 1)
  {
    v12 = (void *)MEMORY[0x24BDD1508];
    -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TACLVisit detectionDate](self->_representativeVisit, "detectionDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createIntervalSafelyWithStartDate:endDate:", v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v10 = 0;
  }
  return v10;
}

- (unint64_t)evaluateSnapshotQualityWithMinDwellDuration:(double)a3 minDisplayOnDuration:(double)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  double v14;

  if (-[TAVisitSnapshot isClosed](self, "isClosed"))
  {
    -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TACLVisit arrivalDate](self->_representativeVisit, "arrivalDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    if (v10 >= a3)
    {
      -[TACLVisit departureDate](self->_representativeVisit, "departureDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitSnapshot getDisplayOnTimeUntilEndDate:](self, "getDisplayOnTimeUntilEndDate:", v12);
      v14 = v13;

      if (v14 >= a4)
        return 1;
      else
        return 2;
    }
    else
    {
      return 2;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAVisitSnapshot evaluateSnapshotQualityWithMinDwellDuration:minDisplayOnDuration:].cold.1();
    return 0;
  }
}

- (id)getLocationRepresentingSnapshot
{
  TALocationLite *v3;
  _BOOL4 v4;
  TACLVisit *representativeVisit;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TALocationLite *v12;

  v3 = [TALocationLite alloc];
  v4 = -[TACLVisit hasDepartureDate](self->_representativeVisit, "hasDepartureDate");
  representativeVisit = self->_representativeVisit;
  if (v4)
    -[TACLVisit departureDate](representativeVisit, "departureDate");
  else
    -[TACLVisit arrivalDate](representativeVisit, "arrivalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit coordinate](self->_representativeVisit, "coordinate");
  v8 = v7;
  -[TACLVisit coordinate](self->_representativeVisit, "coordinate");
  v10 = v9;
  -[TACLVisit horizontalAccuracy](self->_representativeVisit, "horizontalAccuracy");
  v12 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v3, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v6, v8, v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAVisitSnapshot *v6;
  TAVisitSnapshot *v7;
  _BOOL4 v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;

  v6 = (TAVisitSnapshot *)a3;
  if (self == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = -[TAVisitSnapshot isClosed](self, "isClosed");
      if (v8 != -[TAVisitSnapshot isClosed](v7, "isClosed"))
      {
        v9 = 0;
LABEL_78:

        goto LABEL_79;
      }
      -[TAVisitSnapshot representativeVisit](self, "representativeVisit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitSnapshot representativeVisit](v7, "representativeVisit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[TAVisitSnapshot representativeVisit](self, "representativeVisit");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot representativeVisit](v7, "representativeVisit");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v4, "isEqual:", v3))
        {
          v9 = 0;
          goto LABEL_76;
        }
      }
      -[TAVisitSnapshot latestLocation](self, "latestLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAVisitSnapshot latestLocation](v7, "latestLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[TAVisitSnapshot latestLocation](self, "latestLocation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot latestLocation](v7, "latestLocation");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqual:"))
        {
          v9 = 0;
          goto LABEL_74;
        }
        v95 = v14;
      }
      v15 = -[TAVisitSnapshot loiType](self, "loiType");
      if (v15 == -[TAVisitSnapshot loiType](v7, "loiType"))
      {
        -[TAVisitSnapshot latestUtAdvertisements](self, "latestUtAdvertisements");
        v16 = objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot latestUtAdvertisements](v7, "latestUtAdvertisements");
        v93 = v3;
        v94 = (void *)v16;
        v91 = v13;
        v92 = objc_claimAutoreleasedReturnValue();
        v90 = v12;
        if (v16 != v92)
        {
          -[TAVisitSnapshot latestUtAdvertisements](self, "latestUtAdvertisements");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot latestUtAdvertisements](v7, "latestUtAdvertisements");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v17;
          if (!objc_msgSend(v17, "isEqual:"))
          {
            v9 = 0;
            v18 = (void *)v16;
            v19 = (void *)v92;
            v14 = v95;
LABEL_72:

LABEL_73:
            v12 = v90;
            v13 = v91;
            v3 = v93;
            if (v90 == v91)
              goto LABEL_75;
            goto LABEL_74;
          }
        }
        -[TAVisitSnapshot earliestUtAdvertisements](self, "earliestUtAdvertisements");
        v20 = objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot earliestUtAdvertisements](v7, "earliestUtAdvertisements");
        v88 = objc_claimAutoreleasedReturnValue();
        v89 = (void *)v20;
        if (v20 != v88)
        {
          -[TAVisitSnapshot earliestUtAdvertisements](self, "earliestUtAdvertisements");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot earliestUtAdvertisements](v7, "earliestUtAdvertisements");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v21;
          if (!objc_msgSend(v21, "isEqual:"))
          {
            v9 = 0;
            v22 = (void *)v88;
            v23 = v89;
            v14 = v95;
            goto LABEL_70;
          }
        }
        v24 = -[TAVisitSnapshot latestLocationInsideVisit](self, "latestLocationInsideVisit");
        if (v24 != -[TAVisitSnapshot latestLocationInsideVisit](v7, "latestLocationInsideVisit"))
        {
          v9 = 0;
          v22 = (void *)v88;
          v23 = v89;
          v14 = v95;
          if (v89 == (void *)v88)
          {
LABEL_71:

            v18 = v94;
            v19 = (void *)v92;
            if (v94 == (void *)v92)
              goto LABEL_73;
            goto LABEL_72;
          }
LABEL_70:

          goto LABEL_71;
        }
        -[TAVisitSnapshot lruUtAdvertisementCache](self, "lruUtAdvertisementCache");
        v25 = objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot lruUtAdvertisementCache](v7, "lruUtAdvertisementCache");
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = (void *)v25;
        if (v25 != v82)
        {
          -[TAVisitSnapshot lruUtAdvertisementCache](self, "lruUtAdvertisementCache");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot lruUtAdvertisementCache](v7, "lruUtAdvertisementCache");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v26;
          if (!objc_msgSend(v26, "isEqual:"))
          {
            v9 = 0;
            v27 = v89;
            v29 = (void *)v82;
            v28 = v83;
LABEL_68:

LABEL_69:
            v22 = (void *)v88;
            v14 = v95;
            v23 = v27;
            if (v27 == (void *)v88)
              goto LABEL_71;
            goto LABEL_70;
          }
        }
        v30 = -[TAVisitSnapshot uniqueUTBufferSizeCap](self, "uniqueUTBufferSizeCap");
        if (v30 != -[TAVisitSnapshot uniqueUTBufferSizeCap](v7, "uniqueUTBufferSizeCap")
          || (v31 = -[TAVisitSnapshot displayEventBufferSizeCap](self, "displayEventBufferSizeCap"),
              v31 != -[TAVisitSnapshot displayEventBufferSizeCap](v7, "displayEventBufferSizeCap")))
        {
          v9 = 0;
          goto LABEL_67;
        }
        -[TAVisitSnapshot displayEvents](self, "displayEvents");
        v32 = objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot displayEvents](v7, "displayEvents");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = (void *)v32;
        if ((void *)v32 != v78)
        {
          -[TAVisitSnapshot displayEvents](self, "displayEvents");
          v33 = objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot displayEvents](v7, "displayEvents");
          v34 = objc_claimAutoreleasedReturnValue();
          v76 = (void *)v33;
          v35 = (void *)v33;
          v36 = (void *)v34;
          if (!objc_msgSend(v35, "isEqual:", v34))
          {
            v9 = 0;
            v40 = v78;
            goto LABEL_64;
          }
          v73 = v36;
        }
        -[TAVisitSnapshot exitIntervalBeginning](self, "exitIntervalBeginning");
        v37 = objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot exitIntervalBeginning](v7, "exitIntervalBeginning");
        v75 = objc_claimAutoreleasedReturnValue();
        v77 = (void *)v37;
        if (v37 != v75)
        {
          -[TAVisitSnapshot exitIntervalBeginning](self, "exitIntervalBeginning");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot exitIntervalBeginning](v7, "exitIntervalBeginning");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v38;
          if (!objc_msgSend(v38, "isEqual:"))
          {
            v9 = 0;
            v39 = (void *)v75;
LABEL_62:

LABEL_63:
            v40 = v78;
            v36 = v73;
            if (v79 == v78)
            {

              goto LABEL_66;
            }
LABEL_64:
            v55 = v40;

LABEL_66:
LABEL_67:
            v29 = (void *)v82;
            v28 = v83;
            v27 = v89;
            if (v83 == (void *)v82)
              goto LABEL_69;
            goto LABEL_68;
          }
        }
        -[TAVisitSnapshot displayOnCalculator](self, "displayOnCalculator");
        v41 = objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot displayOnCalculator](v7, "displayOnCalculator");
        v72 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)v41;
        if (v41 != v72)
        {
          -[TAVisitSnapshot displayOnCalculator](self, "displayOnCalculator");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot displayOnCalculator](v7, "displayOnCalculator");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v42;
          if (!objc_msgSend(v42, "isEqual:"))
          {
            v9 = 0;
            v43 = (void *)v72;
LABEL_60:

LABEL_61:
            v39 = (void *)v75;
            if (v77 == (void *)v75)
              goto LABEL_63;
            goto LABEL_62;
          }
        }
        -[TAVisitSnapshot distanceToClosestLoi](self, "distanceToClosestLoi");
        v44 = objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot distanceToClosestLoi](v7, "distanceToClosestLoi");
        v66 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v44;
        if (v44 != v66)
        {
          -[TAVisitSnapshot distanceToClosestLoi](self, "distanceToClosestLoi");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot distanceToClosestLoi](v7, "distanceToClosestLoi");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v45;
          if (!objc_msgSend(v45, "isEqual:"))
          {
            v9 = 0;
            v46 = (void *)v66;
LABEL_58:

LABEL_59:
            v43 = (void *)v72;
            if (v74 == (void *)v72)
              goto LABEL_61;
            goto LABEL_60;
          }
        }
        -[TAVisitSnapshot entryDurationOfConsiderationClosed](self, "entryDurationOfConsiderationClosed");
        v47 = objc_claimAutoreleasedReturnValue();
        -[TAVisitSnapshot entryDurationOfConsiderationClosed](v7, "entryDurationOfConsiderationClosed");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)v47;
        if ((void *)v47 != v64)
        {
          -[TAVisitSnapshot entryDurationOfConsiderationClosed](self, "entryDurationOfConsiderationClosed");
          v48 = objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot entryDurationOfConsiderationClosed](v7, "entryDurationOfConsiderationClosed");
          v49 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v48;
          v50 = (void *)v48;
          v51 = (void *)v49;
          if (!objc_msgSend(v50, "isEqual:", v49))
          {
            v9 = 0;
            goto LABEL_55;
          }
          v60 = v51;
        }
        v52 = -[TAVisitSnapshot maxNSigmaBetweenLastLocationAndVisit](self, "maxNSigmaBetweenLastLocationAndVisit");
        if (v52 == -[TAVisitSnapshot maxNSigmaBetweenLastLocationAndVisit](v7, "maxNSigmaBetweenLastLocationAndVisit"))
        {
          -[TAVisitSnapshot lastLoiTypeUpdateTime](self, "lastLoiTypeUpdateTime");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVisitSnapshot lastLoiTypeUpdateTime](v7, "lastLoiTypeUpdateTime");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v53;
          if (v53 == v58)
          {

            v9 = 1;
          }
          else
          {
            -[TAVisitSnapshot lastLoiTypeUpdateTime](self, "lastLoiTypeUpdateTime");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[TAVisitSnapshot lastLoiTypeUpdateTime](v7, "lastLoiTypeUpdateTime");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v57, "isEqual:", v54);

          }
        }
        else
        {
          v9 = 0;
        }
        v51 = v60;
        if (v65 == v64)
        {

LABEL_57:
          v46 = (void *)v66;
          if (v69 == (void *)v66)
            goto LABEL_59;
          goto LABEL_58;
        }
LABEL_55:

        goto LABEL_57;
      }
      v9 = 0;
      v14 = v95;
      if (v12 == v13)
      {
LABEL_75:

        if (v10 == v11)
        {
LABEL_77:

          goto LABEL_78;
        }
LABEL_76:

        goto LABEL_77;
      }
LABEL_74:

      goto LABEL_75;
    }
    v9 = 0;
  }
LABEL_79:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVisitSnapshot)initWithCoder:(id)a3
{
  id v4;
  TAVisitSnapshot *v5;
  uint64_t v6;
  TACLVisit *representativeVisit;
  uint64_t v8;
  TALocationLite *latestLocation;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *latestUtAdvertisements;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *earliestUtAdvertisements;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableOrderedSet *lruUtAdvertisementCache;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSMutableArray *displayEvents;
  uint64_t v32;
  NSDate *exitIntervalBeginning;
  uint64_t v34;
  TADisplayOnCalculator *displayOnCalculator;
  uint64_t v36;
  NSNumber *distanceToClosestLoi;
  uint64_t v38;
  NSDate *entryDurationOfConsiderationClosed;
  uint64_t v40;
  NSDate *lastLoiTypeUpdateTime;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)TAVisitSnapshot;
  v5 = -[TAVisitSnapshot init](&v43, sel_init);
  if (v5)
  {
    v5->_isClosed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Closed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RepVisit"));
    v6 = objc_claimAutoreleasedReturnValue();
    representativeVisit = v5->_representativeVisit;
    v5->_representativeVisit = (TACLVisit *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LatestLoc"));
    v8 = objc_claimAutoreleasedReturnValue();
    latestLocation = v5->_latestLocation;
    v5->_latestLocation = (TALocationLite *)v8;

    v5->_loiType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LOI"));
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("LatestAdv"));
    v14 = objc_claimAutoreleasedReturnValue();
    latestUtAdvertisements = v5->_latestUtAdvertisements;
    v5->_latestUtAdvertisements = (NSMutableDictionary *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("EarliestAdv"));
    v20 = objc_claimAutoreleasedReturnValue();
    earliestUtAdvertisements = v5->_earliestUtAdvertisements;
    v5->_earliestUtAdvertisements = (NSMutableDictionary *)v20;

    v5->_latestLocationInsideVisit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LatestLocInside"));
    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("LRUAdv"));
    v25 = objc_claimAutoreleasedReturnValue();
    lruUtAdvertisementCache = v5->_lruUtAdvertisementCache;
    v5->_lruUtAdvertisementCache = (NSMutableOrderedSet *)v25;

    v5->_uniqueUTBufferSizeCap = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numUnique"));
    v5->_displayEventBufferSizeCap = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numDisplay"));
    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("displayEvents"));
    v30 = objc_claimAutoreleasedReturnValue();
    displayEvents = v5->_displayEvents;
    v5->_displayEvents = (NSMutableArray *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exitBegin"));
    v32 = objc_claimAutoreleasedReturnValue();
    exitIntervalBeginning = v5->_exitIntervalBeginning;
    v5->_exitIntervalBeginning = (NSDate *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayOnCalc"));
    v34 = objc_claimAutoreleasedReturnValue();
    displayOnCalculator = v5->_displayOnCalculator;
    v5->_displayOnCalculator = (TADisplayOnCalculator *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distanceToLOI"));
    v36 = objc_claimAutoreleasedReturnValue();
    distanceToClosestLoi = v5->_distanceToClosestLoi;
    v5->_distanceToClosestLoi = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryDuration"));
    v38 = objc_claimAutoreleasedReturnValue();
    entryDurationOfConsiderationClosed = v5->_entryDurationOfConsiderationClosed;
    v5->_entryDurationOfConsiderationClosed = (NSDate *)v38;

    v5->_maxNSigmaBetweenLastLocationAndVisit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxNSigma"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LoiUpdateTime"));
    v40 = objc_claimAutoreleasedReturnValue();
    lastLoiTypeUpdateTime = v5->_lastLoiTypeUpdateTime;
    v5->_lastLoiTypeUpdateTime = (NSDate *)v40;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isClosed;
  id v5;

  isClosed = self->_isClosed;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isClosed, CFSTR("Closed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_representativeVisit, CFSTR("RepVisit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestLocation, CFSTR("LatestLoc"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_loiType, CFSTR("LOI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestUtAdvertisements, CFSTR("LatestAdv"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_earliestUtAdvertisements, CFSTR("EarliestAdv"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_latestLocationInsideVisit, CFSTR("LatestLocInside"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lruUtAdvertisementCache, CFSTR("LRUAdv"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_uniqueUTBufferSizeCap, CFSTR("numUnique"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayEventBufferSizeCap, CFSTR("numDisplay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayEvents, CFSTR("displayEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exitIntervalBeginning, CFSTR("exitBegin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayOnCalculator, CFSTR("displayOnCalc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_distanceToClosestLoi, CFSTR("distanceToLOI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entryDurationOfConsiderationClosed, CFSTR("entryDuration"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxNSigmaBetweenLastLocationAndVisit, CFSTR("maxNSigma"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastLoiTypeUpdateTime, CFSTR("LoiUpdateTime"));

}

- (TACLVisit)representativeVisit
{
  return self->_representativeVisit;
}

- (NSMutableDictionary)latestUtAdvertisements
{
  return self->_latestUtAdvertisements;
}

- (NSMutableDictionary)earliestUtAdvertisements
{
  return self->_earliestUtAdvertisements;
}

- (BOOL)latestLocationInsideVisit
{
  return self->_latestLocationInsideVisit;
}

- (NSMutableOrderedSet)lruUtAdvertisementCache
{
  return self->_lruUtAdvertisementCache;
}

- (void)setLruUtAdvertisementCache:(id)a3
{
  objc_storeStrong((id *)&self->_lruUtAdvertisementCache, a3);
}

- (unint64_t)uniqueUTBufferSizeCap
{
  return self->_uniqueUTBufferSizeCap;
}

- (void)setUniqueUTBufferSizeCap:(unint64_t)a3
{
  self->_uniqueUTBufferSizeCap = a3;
}

- (unint64_t)displayEventBufferSizeCap
{
  return self->_displayEventBufferSizeCap;
}

- (void)setDisplayEventBufferSizeCap:(unint64_t)a3
{
  self->_displayEventBufferSizeCap = a3;
}

- (NSMutableArray)displayEvents
{
  return self->_displayEvents;
}

- (void)setDisplayEvents:(id)a3
{
  objc_storeStrong((id *)&self->_displayEvents, a3);
}

- (NSDate)exitIntervalBeginning
{
  return self->_exitIntervalBeginning;
}

- (void)setExitIntervalBeginning:(id)a3
{
  objc_storeStrong((id *)&self->_exitIntervalBeginning, a3);
}

- (TADisplayOnCalculator)displayOnCalculator
{
  return self->_displayOnCalculator;
}

- (void)setDisplayOnCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_displayOnCalculator, a3);
}

- (NSNumber)distanceToClosestLoi
{
  return self->_distanceToClosestLoi;
}

- (void)setDistanceToClosestLoi:(id)a3
{
  objc_storeStrong((id *)&self->_distanceToClosestLoi, a3);
}

- (NSDate)entryDurationOfConsiderationClosed
{
  return self->_entryDurationOfConsiderationClosed;
}

- (void)setEntryDurationOfConsiderationClosed:(id)a3
{
  objc_storeStrong((id *)&self->_entryDurationOfConsiderationClosed, a3);
}

- (unint64_t)maxNSigmaBetweenLastLocationAndVisit
{
  return self->_maxNSigmaBetweenLastLocationAndVisit;
}

- (void)setMaxNSigmaBetweenLastLocationAndVisit:(unint64_t)a3
{
  self->_maxNSigmaBetweenLastLocationAndVisit = a3;
}

- (NSDate)lastLoiTypeUpdateTime
{
  return self->_lastLoiTypeUpdateTime;
}

- (void)setLastLoiTypeUpdateTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastLoiTypeUpdateTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoiTypeUpdateTime, 0);
  objc_storeStrong((id *)&self->_entryDurationOfConsiderationClosed, 0);
  objc_storeStrong((id *)&self->_distanceToClosestLoi, 0);
  objc_storeStrong((id *)&self->_displayOnCalculator, 0);
  objc_storeStrong((id *)&self->_exitIntervalBeginning, 0);
  objc_storeStrong((id *)&self->_displayEvents, 0);
  objc_storeStrong((id *)&self->_lruUtAdvertisementCache, 0);
  objc_storeStrong((id *)&self->_earliestUtAdvertisements, 0);
  objc_storeStrong((id *)&self->_latestUtAdvertisements, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);
  objc_storeStrong((id *)&self->_representativeVisit, 0);
}

- (void)setRepresentativeVisit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitSnapshot not setting representative visit because snapshot already closed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)setRepresentativeVisit:(id *)a3 .cold.2(void *a1, void *a2, id *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "#TAVisitSnapshot _setRepresentativeVisit with input %@ and adjusted representativeVisit to %@", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_1_2();
}

- (void)setDepartureVisit:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_217877000, a2, a3, "#TAVisitSnapshot departure POI populated already; drop TACLVisit %{private}@",
    a5,
    a6,
    a7,
    a8,
    3u);
  OUTLINED_FUNCTION_5_0();
}

- (void)setDepartureVisit:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "departureDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "arrivalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = v4;
  v8 = 2113;
  v9 = v5;
  _os_log_error_impl(&dword_217877000, v3, OS_LOG_TYPE_ERROR, "#TAVisitSnapshot dropping departure POI b/c the departure date %{private}@ is earlier than the arrival date %{private}@ of the current snapshot", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_1_2();
}

- (void)setDepartureVisit:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_217877000, a2, a3, "#TAVisitSnapshot dropping departure POI b/c there is no departure date: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_5_0();
}

- (void)calculateExitIntervalWithDisplayOnBudget:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitSnapshot requested exit interval calculation but snapshot is not closed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)updateEntryIntervalWithDisplayOnBudget:evaluateToEnd:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitSnapshot requested getEntryAdvertisementsWithDisplayOnBudget evaluation to end on a snapshot that isn't closed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)getDurationOfVisitExitConsideredWithDisplayOnBudget:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitSnapshot requested getDurationOfVisitExitConsidered but interval could not be calculated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)getDurationOfVisitExitConsideredWithDisplayOnBudget:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitSnapshot requested getDurationOfVisitExitConsidered but snapshot is not closed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)getDurationOfVisitEntryConsideredWithDisplayOnBudget:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitSnapshot requested getDurationOfVisitEntryConsideredWithDisplayOnBudget but snapshot is not closed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)updateLatestLocation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 9))
    v2 = "is";
  else
    v2 = "not";
  v3 = 136446210;
  v4 = v2;
  _os_log_debug_impl(&dword_217877000, a2, OS_LOG_TYPE_DEBUG, "#TAVisitSnapshot latestLocation %{public}s inside visit", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5_0();
}

- (void)updateLatestLocation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_217877000, v0, v1, "#TAVisitSnapshot encountered null latestLocation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)updateLoiType:(id *)a3 .cold.1(void *a1, void *a2, id *a3)
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = objc_msgSend(a2, "type");
  objc_msgSend(a2, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getDateString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "getDateString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 134284035;
  v11 = v6;
  v12 = 2113;
  v13 = v8;
  v14 = 2113;
  v15 = v9;
  _os_log_debug_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "#TAVisitSnapshot skip updating LOI type %{private}lu as it was too old: incoming loi date %{private}@, current loiType update date, %{private}@", (uint8_t *)&v10, 0x20u);

}

- (void)evaluateSnapshotQualityWithMinDwellDuration:minDisplayOnDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_217877000, v0, v1, "#TAVisitSnapshot visit snapshot quality requested when snapshot open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

@end
