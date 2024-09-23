@implementation TAInterVisitMetricsSnapshot

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (void)updateInterVisitMetric:(id)a3 store:(id)a4 withUpdatedTime:(id)a5 andCloseSnapshot:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  TAInterVisitMetricPerDevice *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  BOOL v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSMutableDictionary *firstAssociatedLocationPerDevice;
  void *v54;
  void *v55;
  NSMutableDictionary *lastAssociatedLocationPerDevice;
  void *v57;
  void *v58;
  NSMutableDictionary *lastAdvPerDevice;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  NSDate **p_lastUpdateTime;
  id v65;
  BOOL v66;
  id v67;
  id v68;
  TAInterVisitMetricsSnapshot *v69;
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id obj;
  char v77;
  _BYTE v78[15];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  int v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  v6 = a6;
  v90 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v70 = a4;
  v11 = a5;
  if (self->_isClosed)
  {
    v12 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:].cold.4(v12, v13, v14);
    goto LABEL_41;
  }
  if (-[NSDate compare:](self->_lastUpdateTime, "compare:", v11) != NSOrderedDescending)
  {
    p_lastUpdateTime = &self->_lastUpdateTime;
    v65 = a5;
    v66 = v6;
    v67 = v11;
    v68 = v10;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v10;
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    if (!v73)
      goto LABEL_38;
    v71 = *(_QWORD *)v80;
    v69 = self;
    while (1)
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v80 != v71)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v24);
        objc_msgSend(obj, "objectForKey:", v25, p_lastUpdateTime, v65);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_accumulatedDeviceMetrics, "objectForKey:", v25);
        v27 = (TAInterVisitMetricPerDevice *)objc_claimAutoreleasedReturnValue();
        if (v27)
          goto LABEL_17;
        -[TAInterVisitMetricsSnapshot accumulatedDeviceMetrics](self, "accumulatedDeviceMetrics");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");
        v30 = -[TAInterVisitMetricsSnapshot maxUniqueAddresses](self, "maxUniqueAddresses");

        if (v29 < v30)
        {
          v27 = objc_alloc_init(TAInterVisitMetricPerDevice);
          -[NSMutableDictionary setObject:forKey:](self->_accumulatedDeviceMetrics, "setObject:forKey:", v27, v25);
LABEL_17:
          objc_msgSend(v26, "deviceLocationHistory");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v31, "mutableCopy");

          -[NSMutableDictionary objectForKey:](self->_lastAssociatedLocationPerDevice, "objectForKey:", v25);
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33)
            objc_msgSend(v32, "insertObject:atIndex:", v33, 0);
          v75 = (void *)v33;
          objc_msgSend(v26, "deviceObservationInterval");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_lastAdvPerDevice, "objectForKey:", v25);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v35;
          if (v35)
          {
            v72 = v34;
            v36 = v35;
            objc_msgSend(v35, "getDate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "latestObservation");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "getDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v37, "compare:", v39);

            if (v40 == 1)
            {
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
                -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:].cold.3(&v77, v78);
              v34 = v72;
            }
            else
            {
              v41 = (void *)MEMORY[0x24BDD1508];
              objc_msgSend(v36, "getDate");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "latestObservation");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "getDate");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "createIntervalSafelyWithStartDate:endDate:", v42, v44);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          v45 = +[TAFilterGeneral locationSegments:underMaxSpeed:](TAFilterGeneral, "locationSegments:underMaxSpeed:", v32, 50.0);
          v46 = v45;
          -[TAInterVisitMetricPerDevice setSegmentSpeedExceedsLimit:](v27, "setSegmentSpeedExceedsLimit:", -[TAInterVisitMetricPerDevice segmentSpeedExceedsLimit](v27, "segmentSpeedExceedsLimit") | !v45);
          if (!v46)
          {
            v47 = TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68289283;
              v84 = 0;
              v85 = 2082;
              v86 = "";
              v87 = 2113;
              v88 = v25;
              _os_log_impl(&dword_217877000, v47, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot segment speed exceeds limit\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
            }
          }
          objc_msgSend(v26, "deviceLocationHistory");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAInterVisitMetricPerDevice accumulateNumOfAssociatedLocs:](v27, "accumulateNumOfAssociatedLocs:", objc_msgSend(v48, "count"));

          objc_msgSend(v34, "duration");
          -[TAInterVisitMetricPerDevice accumulateDuration:](v27, "accumulateDuration:");
          +[TAFilterGeneral distOfTravelAlong:](TAFilterGeneral, "distOfTravelAlong:", v32);
          -[TAInterVisitMetricPerDevice accumulateDistance:](v27, "accumulateDistance:");
          -[TAInterVisitMetricPerDevice accumulateSampledObservedLocations:](v27, "accumulateSampledObservedLocations:", v32);
          objc_msgSend(obj, "objectForKeyedSubscript:", v25);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "latestObservation");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAInterVisitMetricPerDevice accumulateLatestAdvertisement:](v27, "accumulateLatestAdvertisement:", v50);

          +[TADominantUserActivity getCumulativeUserActivityTimeInDateInterval:store:](TADominantUserActivity, "getCumulativeUserActivityTimeInDateInterval:store:", v34, v70);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAInterVisitMetricPerDevice accumulateDurationPerMotionState:](v27, "accumulateDurationPerMotionState:", v51);

          self = v69;
          if (objc_msgSend(v32, "count"))
          {
            -[NSMutableDictionary objectForKeyedSubscript:](v69->_firstAssociatedLocationPerDevice, "objectForKeyedSubscript:", v25);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v52)
            {
              firstAssociatedLocationPerDevice = v69->_firstAssociatedLocationPerDevice;
              objc_msgSend(v32, "firstObject");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = (void *)objc_msgSend(v54, "copy");
              -[NSMutableDictionary setObject:forKey:](firstAssociatedLocationPerDevice, "setObject:forKey:", v55, v25);

            }
            lastAssociatedLocationPerDevice = v69->_lastAssociatedLocationPerDevice;
            objc_msgSend(v32, "lastObject");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)objc_msgSend(v57, "copy");
            -[NSMutableDictionary setObject:forKey:](lastAssociatedLocationPerDevice, "setObject:forKey:", v58, v25);

          }
          lastAdvPerDevice = v69->_lastAdvPerDevice;
          objc_msgSend(v26, "latestObservation");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)objc_msgSend(v60, "copy");
          -[NSMutableDictionary setObject:forKey:](lastAdvPerDevice, "setObject:forKey:", v61, v25);

          goto LABEL_33;
        }
        v62 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289283;
          v84 = 0;
          v85 = 2082;
          v86 = "";
          v87 = 2113;
          v88 = v25;
          _os_log_impl(&dword_217877000, v62, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot snapshot full, not adding metrics for address\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
        }
LABEL_33:

        ++v24;
      }
      while (v73 != v24);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
      v73 = v63;
      if (!v63)
      {
LABEL_38:

        objc_storeStrong((id *)p_lastUpdateTime, v65);
        self->_isClosed = v66;
        v11 = v67;
        v10 = v68;
        goto LABEL_41;
      }
    }
  }
  v15 = TAStatusLog;
  v16 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v16)
      -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:].cold.1(v15, v17, v18, v19, v20, v21, v22, v23);
    self->_isClosed = v6;
  }
  else if (v16)
  {
    -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:].cold.2(v15, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_41:

}

- (NSMutableDictionary)accumulatedDeviceMetrics
{
  return self->_accumulatedDeviceMetrics;
}

- (TAInterVisitMetricsSnapshot)initWithTime:(id)a3 maxUniqueAddresses:(unint64_t)a4
{
  id v6;
  TAInterVisitMetricsSnapshot *v7;
  uint64_t v8;
  NSDate *initialTime;
  uint64_t v10;
  NSDate *lastUpdateTime;
  uint64_t v12;
  NSMutableDictionary *accumulatedDeviceMetrics;
  uint64_t v14;
  NSMutableDictionary *firstAssociatedLocationPerDevice;
  uint64_t v16;
  NSMutableDictionary *lastAssociatedLocationPerDevice;
  uint64_t v18;
  NSMutableDictionary *lastAdvPerDevice;
  TAInterVisitMetricsSnapshot *v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TAInterVisitMetricsSnapshot;
  v7 = -[TAInterVisitMetricsSnapshot init](&v22, sel_init);
  if (v7)
  {
    if (!v6)
    {
      v20 = 0;
      goto LABEL_6;
    }
    v8 = objc_msgSend(v6, "copy");
    initialTime = v7->_initialTime;
    v7->_initialTime = (NSDate *)v8;

    v10 = objc_msgSend(v6, "copy");
    lastUpdateTime = v7->_lastUpdateTime;
    v7->_lastUpdateTime = (NSDate *)v10;

    v7->_maxUniqueAddresses = a4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    accumulatedDeviceMetrics = v7->_accumulatedDeviceMetrics;
    v7->_accumulatedDeviceMetrics = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    firstAssociatedLocationPerDevice = v7->_firstAssociatedLocationPerDevice;
    v7->_firstAssociatedLocationPerDevice = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    lastAssociatedLocationPerDevice = v7->_lastAssociatedLocationPerDevice;
    v7->_lastAssociatedLocationPerDevice = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    lastAdvPerDevice = v7->_lastAdvPerDevice;
    v7->_lastAdvPerDevice = (NSMutableDictionary *)v18;

    v7->_isClosed = 0;
  }
  v20 = v7;
LABEL_6:

  return v20;
}

- (void)visitEntryDelayCorrection:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  __int128 v9;
  uint64_t v10;
  os_log_t *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSDate *lastUpdateTime;
  TAInterVisitMetricsSnapshot *v16;
  os_log_t *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  BOOL v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  __int128 v44;
  TAInterVisitMetricsSnapshot *v45;
  id v46;
  NSMutableDictionary *obj;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  _BOOL4 v73;
  __int16 v74;
  _BOOL4 v75;
  __int16 v76;
  double v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v51 = v6;
  if (objc_msgSend(v6, "hasArrivalDate") && !objc_msgSend(v6, "hasDepartureDate"))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = self->_accumulatedDeviceMetrics;
    v54 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
    if (v54)
    {
      v10 = *(_QWORD *)v63;
      v11 = (os_log_t *)&TAStatusLog;
      *(_QWORD *)&v9 = 68289026;
      v44 = v9;
      v45 = self;
      v46 = v7;
      v53 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v63 != v10)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_lastAdvPerDevice, "objectForKeyedSubscript:", v13, v44);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v55 = v13;
            lastUpdateTime = self->_lastUpdateTime;
            objc_msgSend(v51, "arrivalDate");
            v16 = self;
            v17 = v11;
            v18 = v7;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[NSDate compare:](lastUpdateTime, "compare:", v19);

            objc_msgSend(v14, "getDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "arrivalDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v21, "compare:", v22);

            v23 = (void *)MEMORY[0x24BDD1508];
            objc_msgSend(v51, "arrivalDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v14;
            objc_msgSend(v14, "getDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "createIntervalSafelyWithStartDate:endDate:", v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v18;
            v11 = v17;
            self = v16;
            objc_msgSend(v26, "duration");
            v28 = v27;
            +[TADominantUserActivity getCumulativeUserActivityTimeInDateInterval:store:](TADominantUserActivity, "getCumulativeUserActivityTimeInDateInterval:store:", v26, v7);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v20;
            v30 = v20 == -1;
            v10 = v53;
            if (!v30 && v57 != -1)
            {
              v50 = v26;
              -[NSMutableDictionary objectForKeyedSubscript:](v16->_accumulatedDeviceMetrics, "objectForKeyedSubscript:", v55);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "accumulateDuration:", -v28);
              v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v58 = 0u;
              v59 = 0u;
              v60 = 0u;
              v61 = 0u;
              v49 = v29;
              v32 = v29;
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v59;
                do
                {
                  for (j = 0; j != v34; ++j)
                  {
                    if (*(_QWORD *)v59 != v35)
                      objc_enumerationMutation(v32);
                    v37 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
                    v38 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend(v32, "objectForKeyedSubscript:", v37);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "doubleValue");
                    objc_msgSend(v38, "numberWithDouble:", -v40);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "setObject:forKeyedSubscript:", v41, v37);

                  }
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
                }
                while (v34);
              }

              objc_msgSend(v48, "accumulateDurationPerMotionState:", v31);
              self = v45;
              v7 = v46;
              v10 = v53;
              v11 = (os_log_t *)&TAStatusLog;
              v29 = v49;
              v26 = v50;
            }
            v42 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68290307;
              v67 = 0;
              v68 = 2082;
              v69 = "";
              v70 = 2113;
              v71 = v55;
              v72 = 1026;
              v73 = v52 != -1;
              v74 = 1026;
              v75 = v57 != -1;
              v76 = 2050;
              v77 = v28;
              v78 = 2114;
              v79 = v29;
              _os_log_impl(&dword_217877000, v42, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot visitEntryDelayCorrection evaluating metric\", \"address\":\"%{private}@\", \"updatedAfterVisitEntry\":%{public}hhd, \"hasAdvertisementAfterVisitEntry\":%{public}hhd, \"durationCorrection\":\"%{public}f\", \"motionStatesCorrection\":\"%{public}@\"}", buf, 0x3Cu);
            }

            v14 = v56;
          }
          else
          {
            v43 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v44;
              v67 = 0;
              v68 = 2082;
              v69 = "";
              _os_log_impl(&dword_217877000, v43, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot missing latest advertisement for address in accumulatedDeviceMetrics\"}", buf, 0x12u);
            }
          }

        }
        v54 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
      }
      while (v54);
    }

  }
  else
  {
    v8 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      _os_log_impl(&dword_217877000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot got invalid visit in visitEntryDelayCorrection\"}", buf, 0x12u);
    }
  }

}

- (void)updateWithInterVisitMetricsSnapshot:(id)a3 store:(id)a4
{
  id v6;
  NSDate *v7;
  NSDate *lastUpdateTime;
  uint64_t i;
  uint64_t v10;
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
  uint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
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
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSMutableDictionary *firstAssociatedLocationPerDevice;
  void *v48;
  void *v49;
  void *v50;
  NSMutableDictionary *lastAssociatedLocationPerDevice;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableDictionary *lastAdvPerDevice;
  void *v57;
  void *v58;
  _BYTE *v59;
  id v60;
  TAInterVisitMetricsSnapshot *v61;
  id v62;
  id obj;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  char v68;
  _BYTE v69[15];
  char v70;
  _BYTE v71[7];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[2];
  uint8_t buf[4];
  int v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  uint64_t v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v60 = a4;
  objc_msgSend(v6, "lastUpdateTime");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v7;

  self->_isClosed = objc_msgSend(v6, "isClosed");
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v6, "accumulatedDeviceMetrics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v73;
    v59 = v71;
    v61 = self;
    v62 = v6;
    do
    {
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)v73 != v65)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v6, "accumulatedDeviceMetrics", v59);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](self->_accumulatedDeviceMetrics, "objectForKey:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_accumulatedDeviceMetrics, "objectForKey:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "accumulateNumOfAssociatedLocs:", objc_msgSend(v12, "numOfAssociatedLocs"));
          -[NSMutableDictionary objectForKeyedSubscript:](self->_lastAdvPerDevice, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "lastAdvPerDevice");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v67 = v15;
          if (v15 && v17)
          {
            objc_msgSend(v15, "getDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "getDate");
            v19 = v17;
            v20 = v15;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v18, "compare:", v21);

            if (v22 == 1)
            {
              v17 = v19;
              self = v61;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
                -[TAInterVisitMetricsSnapshot updateWithInterVisitMetricsSnapshot:store:].cold.2(&v70, v59);
            }
            else
            {
              v28 = (void *)MEMORY[0x24BDD1508];
              objc_msgSend(v20, "getDate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "getDate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "createIntervalSafelyWithStartDate:endDate:", v29, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "duration");
              objc_msgSend(v13, "accumulateDuration:");
              +[TADominantUserActivity getCumulativeUserActivityTimeInDateInterval:store:](TADominantUserActivity, "getCumulativeUserActivityTimeInDateInterval:store:", v31, v60);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "accumulateDurationPerMotionState:", v32);

              v17 = v19;
              self = v61;
            }
          }
          else
          {
            objc_msgSend(v12, "duration");
            objc_msgSend(v13, "accumulateDuration:");
            objc_msgSend(v12, "durationPerMotionState");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "accumulateDurationPerMotionState:", v26);

          }
          objc_msgSend(v12, "distance");
          objc_msgSend(v13, "accumulateDistance:");
          -[NSMutableDictionary objectForKeyedSubscript:](self->_lastAssociatedLocationPerDevice, "objectForKeyedSubscript:", v10);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "firstAssociatedLocationPerDevice");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v10);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33 && v35)
          {
            v64 = v17;
            objc_msgSend(v33, "getDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "getDate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v36, "compare:", v37);

            if (v38 == -1)
            {
              v76[0] = v33;
              v76[1] = v35;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 2);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              +[TAFilterGeneral distOfTravelAlong:](TAFilterGeneral, "distOfTravelAlong:", v39);
              v41 = v40;

              objc_msgSend(v13, "accumulateDistance:", v41);
              v6 = v62;
              v17 = v64;
            }
            else
            {
              v6 = v62;
              v17 = v64;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
                -[TAInterVisitMetricsSnapshot updateWithInterVisitMetricsSnapshot:store:].cold.1(&v68, v69);
            }
          }
          objc_msgSend(v12, "sampledObservedLocations");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "accumulateSampledObservedLocations:", v42);

          objc_msgSend(v12, "latestAdvertisement");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "accumulateLatestAdvertisement:", v43);

LABEL_25:
          -[NSMutableDictionary objectForKeyedSubscript:](self->_firstAssociatedLocationPerDevice, "objectForKeyedSubscript:", v10);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
LABEL_28:

          }
          else
          {
            objc_msgSend(v6, "firstAssociatedLocationPerDevice");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", v10);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
            {
              firstAssociatedLocationPerDevice = self->_firstAssociatedLocationPerDevice;
              objc_msgSend(v6, "firstAssociatedLocationPerDevice");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectForKeyedSubscript:", v10);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](firstAssociatedLocationPerDevice, "setObject:forKey:", v48, v10);

              goto LABEL_28;
            }
          }
          objc_msgSend(v6, "lastAssociatedLocationPerDevice");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", v10);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            lastAssociatedLocationPerDevice = self->_lastAssociatedLocationPerDevice;
            objc_msgSend(v6, "lastAssociatedLocationPerDevice");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectForKeyedSubscript:", v10);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](lastAssociatedLocationPerDevice, "setObject:forKey:", v53, v10);

          }
          objc_msgSend(v6, "lastAdvPerDevice");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", v10);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
          {
            lastAdvPerDevice = self->_lastAdvPerDevice;
            objc_msgSend(v6, "lastAdvPerDevice");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectForKeyedSubscript:", v10);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](lastAdvPerDevice, "setObject:forKey:", v58, v10);

          }
          goto LABEL_33;
        }
        -[TAInterVisitMetricsSnapshot accumulatedDeviceMetrics](self, "accumulatedDeviceMetrics");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");
        v25 = -[TAInterVisitMetricsSnapshot maxUniqueAddresses](self, "maxUniqueAddresses");

        if (v24 < v25)
        {
          -[NSMutableDictionary setObject:forKey:](self->_accumulatedDeviceMetrics, "setObject:forKey:", v12, v10);
          goto LABEL_25;
        }
        v27 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289283;
          v78 = 0;
          v79 = 2082;
          v80 = "";
          v81 = 2113;
          v82 = v10;
          _os_log_impl(&dword_217877000, v27, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot snapshot full, not adding metrics for address\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
        }
LABEL_33:

      }
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    }
    while (v66);
  }

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TAInterVisitMetricsSnapshot *v5;
  TAInterVisitMetricsSnapshot *v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
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

  v5 = (TAInterVisitMetricsSnapshot *)a3;
  if (self == v5)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[TAInterVisitMetricsSnapshot isClosed](self, "isClosed");
      if (v7 != -[TAInterVisitMetricsSnapshot isClosed](v6, "isClosed"))
      {
        v8 = 0;
LABEL_40:

        goto LABEL_41;
      }
      -[TAInterVisitMetricsSnapshot initialTime](self, "initialTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricsSnapshot initialTime](v6, "initialTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[TAInterVisitMetricsSnapshot initialTime](self, "initialTime");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricsSnapshot initialTime](v6, "initialTime");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v11;
        if (!objc_msgSend(v11, "isEqual:"))
        {
          v8 = 0;
          goto LABEL_38;
        }
      }
      -[TAInterVisitMetricsSnapshot lastUpdateTime](self, "lastUpdateTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricsSnapshot lastUpdateTime](v6, "lastUpdateTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[TAInterVisitMetricsSnapshot lastUpdateTime](self, "lastUpdateTime");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricsSnapshot lastUpdateTime](v6, "lastUpdateTime");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v8 = 0;
LABEL_36:

LABEL_37:
          if (v9 == v10)
          {
LABEL_39:

            goto LABEL_40;
          }
LABEL_38:

          goto LABEL_39;
        }
      }
      -[TAInterVisitMetricsSnapshot accumulatedDeviceMetrics](self, "accumulatedDeviceMetrics");
      v14 = objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricsSnapshot accumulatedDeviceMetrics](v6, "accumulatedDeviceMetrics");
      v15 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v14;
      v16 = v14 == v15;
      v17 = (void *)v15;
      if (!v16)
      {
        -[TAInterVisitMetricsSnapshot accumulatedDeviceMetrics](self, "accumulatedDeviceMetrics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricsSnapshot accumulatedDeviceMetrics](v6, "accumulatedDeviceMetrics");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v8 = 0;
          v19 = v47;
LABEL_34:

LABEL_35:
          if (v12 == v13)
            goto LABEL_37;
          goto LABEL_36;
        }
      }
      -[TAInterVisitMetricsSnapshot firstAssociatedLocationPerDevice](self, "firstAssociatedLocationPerDevice");
      v20 = objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricsSnapshot firstAssociatedLocationPerDevice](v6, "firstAssociatedLocationPerDevice");
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
        -[TAInterVisitMetricsSnapshot firstAssociatedLocationPerDevice](self, "firstAssociatedLocationPerDevice");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricsSnapshot firstAssociatedLocationPerDevice](v6, "firstAssociatedLocationPerDevice");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v22;
        if (!objc_msgSend(v22, "isEqual:"))
        {
          v8 = 0;
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
      -[TAInterVisitMetricsSnapshot lastAssociatedLocationPerDevice](self, "lastAssociatedLocationPerDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricsSnapshot lastAssociatedLocationPerDevice](v6, "lastAssociatedLocationPerDevice");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v23 == (void *)v39)
      {
        v34 = v3;
        v35 = v12;
      }
      else
      {
        -[TAInterVisitMetricsSnapshot lastAssociatedLocationPerDevice](self, "lastAssociatedLocationPerDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricsSnapshot lastAssociatedLocationPerDevice](v6, "lastAssociatedLocationPerDevice");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v24;
        if (!objc_msgSend(v24, "isEqual:"))
        {
          v8 = 0;
          v13 = v38;
          v31 = (void *)v39;
          goto LABEL_30;
        }
        v34 = v3;
        v35 = v12;
      }
      -[TAInterVisitMetricsSnapshot lastAdvPerDevice](self, "lastAdvPerDevice");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricsSnapshot lastAdvPerDevice](v6, "lastAdvPerDevice");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

        v8 = 1;
      }
      else
      {
        v28 = (void *)v27;
        -[TAInterVisitMetricsSnapshot lastAdvPerDevice](self, "lastAdvPerDevice");
        v33 = v23;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricsSnapshot lastAdvPerDevice](v6, "lastAdvPerDevice");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v29, "isEqual:", v30);

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
    v8 = 0;
  }
LABEL_41:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAInterVisitMetricsSnapshot)initWithCoder:(id)a3
{
  id v4;
  TAInterVisitMetricsSnapshot *v5;
  uint64_t v6;
  NSDate *initialTime;
  uint64_t v8;
  NSDate *lastUpdateTime;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *accumulatedDeviceMetrics;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *firstAssociatedLocationPerDevice;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSMutableDictionary *lastAssociatedLocationPerDevice;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSMutableDictionary *lastAdvPerDevice;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TAInterVisitMetricsSnapshot;
  v5 = -[TAInterVisitMetricsSnapshot init](&v35, sel_init);
  if (v5)
  {
    v5->_isClosed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsClosed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InitTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    initialTime = v5->_initialTime;
    v5->_initialTime = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastUpdateTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastUpdateTime = v5->_lastUpdateTime;
    v5->_lastUpdateTime = (NSDate *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("accumMetrics"));
    v14 = objc_claimAutoreleasedReturnValue();
    accumulatedDeviceMetrics = v5->_accumulatedDeviceMetrics;
    v5->_accumulatedDeviceMetrics = (NSMutableDictionary *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("firstLoc"));
    v20 = objc_claimAutoreleasedReturnValue();
    firstAssociatedLocationPerDevice = v5->_firstAssociatedLocationPerDevice;
    v5->_firstAssociatedLocationPerDevice = (NSMutableDictionary *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("lastLoc"));
    v26 = objc_claimAutoreleasedReturnValue();
    lastAssociatedLocationPerDevice = v5->_lastAssociatedLocationPerDevice;
    v5->_lastAssociatedLocationPerDevice = (NSMutableDictionary *)v26;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("LastAdv"));
    v32 = objc_claimAutoreleasedReturnValue();
    lastAdvPerDevice = v5->_lastAdvPerDevice;
    v5->_lastAdvPerDevice = (NSMutableDictionary *)v32;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isClosed;
  id v5;

  isClosed = self->_isClosed;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isClosed, CFSTR("IsClosed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialTime, CFSTR("InitTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdateTime, CFSTR("LastUpdateTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accumulatedDeviceMetrics, CFSTR("accumMetrics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstAssociatedLocationPerDevice, CFSTR("firstLoc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastAssociatedLocationPerDevice, CFSTR("lastLoc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastAdvPerDevice, CFSTR("LastAdv"));

}

- (NSDate)initialTime
{
  return self->_initialTime;
}

- (unint64_t)maxUniqueAddresses
{
  return self->_maxUniqueAddresses;
}

- (NSMutableDictionary)firstAssociatedLocationPerDevice
{
  return self->_firstAssociatedLocationPerDevice;
}

- (NSMutableDictionary)lastAssociatedLocationPerDevice
{
  return self->_lastAssociatedLocationPerDevice;
}

- (NSMutableDictionary)lastAdvPerDevice
{
  return self->_lastAdvPerDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAdvPerDevice, 0);
  objc_storeStrong((id *)&self->_lastAssociatedLocationPerDevice, 0);
  objc_storeStrong((id *)&self->_firstAssociatedLocationPerDevice, 0);
  objc_storeStrong((id *)&self->_accumulatedDeviceMetrics, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_initialTime, 0);
}

- (void)updateInterVisitMetric:(uint64_t)a3 store:(uint64_t)a4 withUpdatedTime:(uint64_t)a5 andCloseSnapshot:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_217877000, a1, a3, "#TAInterVisitMetricsSnapshot receiving updates from the past to close the snapshot; ignore the update content but cl"
    "ose the snapshot",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1_3();
}

- (void)updateInterVisitMetric:(uint64_t)a3 store:(uint64_t)a4 withUpdatedTime:(uint64_t)a5 andCloseSnapshot:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_217877000, a1, a3, "#TAInterVisitMetricsSnapshot receiving updates from the past; ignore them",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1_3();
}

- (void)updateInterVisitMetric:(_BYTE *)a1 store:(_BYTE *)a2 withUpdatedTime:andCloseSnapshot:.cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_2(&dword_217877000, v2, (uint64_t)v2, "#TAInterVisitMetricsSnapshot observing out-of-order advertisements; use the observation interval in the summary",
    v3);
}

- (void)updateInterVisitMetric:(uint64_t)a3 store:withUpdatedTime:andCloseSnapshot:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_2(&dword_217877000, a1, a3, "#TAInterVisitMetricsSnapshot attempting to close inter-visit snapshot multiple times; ignore this update",
    v3);
  OUTLINED_FUNCTION_1_3();
}

- (void)updateWithInterVisitMetricsSnapshot:(_BYTE *)a1 store:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_2(&dword_217877000, v2, (uint64_t)v2, "#TAInterVisitMetricsSnapshot latestest current location and earliest next location out of order", v3);
}

- (void)updateWithInterVisitMetricsSnapshot:(_BYTE *)a1 store:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  os_log_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  _os_log_fault_impl(&dword_217877000, v2, OS_LOG_TYPE_FAULT, "#TAInterVisitMetricsSnapshot latestest advertisements out of order", v3, 2u);
}

@end
