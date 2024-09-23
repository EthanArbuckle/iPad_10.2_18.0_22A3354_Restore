@implementation RTPeopleDensityRecordRunningRecentObservation

- (void)trimRunningRecordsBeforeRef:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double currentObservationIntervalSeconds;
  __int128 v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSMutableArray count](self->_runningRecords, "count");
    -[NSMutableArray firstObject](self->_runningRecords, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDatetime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    currentObservationIntervalSeconds = self->_currentObservationIntervalSeconds;
    *(_DWORD *)buf = 134218498;
    v20 = v6;
    v21 = 2112;
    v22 = v8;
    v23 = 2048;
    v24 = currentObservationIntervalSeconds;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDensityRecord trimRunningRecords count:%lu, startDatetime: %@, currentObservationInterval(s): %f", buf, 0x20u);

  }
  if ((unint64_t)-[NSMutableArray count](self->_runningRecords, "count") >= 2)
  {
    *(_QWORD *)&v10 = 138412290;
    v18 = v10;
    do
    {
      -[NSMutableArray firstObject](self->_runningRecords, "firstObject", v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDatetime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v12);
      v14 = v13;
      v15 = self->_currentObservationIntervalSeconds;

      if (v14 <= v15)
        break;
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[NSMutableArray firstObject](self->_runningRecords, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v18;
        v20 = (uint64_t)v17;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#RTPeopleDensityRecord trimRunningRecords old bundle: %@", buf, 0xCu);

      }
      -[NSMutableArray removeObjectAtIndex:](self->_runningRecords, "removeObjectAtIndex:", 0);
      -[NSMutableArray removeObjectAtIndex:](self->_runningAdvertisementsPerRecord, "removeObjectAtIndex:", 0);
    }
    while ((unint64_t)-[NSMutableArray count](self->_runningRecords, "count") > 1);
  }

}

- (void)updateHistogramWithAdvs:(id)a3
{
  -[NSMutableArray addObject:](self->_runningAdvertisementsPerRecord, "addObject:", a3);
}

- (void)addRecord:(id)a3
{
  -[NSMutableArray addObject:](self->_runningRecords, "addObject:", a3);
}

- (RTPeopleDensityRecordRunningRecentObservation)init
{
  RTPeopleDensityRecordRunningRecentObservation *v2;
  RTPeopleDensityRecordRunningRecentObservation *v3;
  NSMutableArray *v4;
  NSMutableArray *runningRecords;
  NSMutableArray *v6;
  NSMutableArray *runningAdvertisementsPerRecord;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTPeopleDensityRecordRunningRecentObservation;
  v2 = -[RTPeopleDensityRecordRunningRecentObservation init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentObservationIntervalSeconds = 300.0;
    v2->_currentConfidenceThreshold = 0.0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    runningRecords = v3->_runningRecords;
    v3->_runningRecords = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    runningAdvertisementsPerRecord = v3->_runningAdvertisementsPerRecord;
    v3->_runningAdvertisementsPerRecord = v6;

  }
  return v3;
}

- (id)getHistogram
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_runningAdvertisementsPerRecord;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              if (objc_msgSend(v15, "rssi") < 0)
                objc_msgSend(v3, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  +[RTPeopleDensityRecord computeRssiHistogramForAdvs:](RTPeopleDensityRecord, "computeRssiHistogramForAdvs:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSMutableArray)runningRecords
{
  return self->_runningRecords;
}

- (void)setRunningRecords:(id)a3
{
  objc_storeStrong((id *)&self->_runningRecords, a3);
}

- (NSMutableArray)runningAdvertisementsPerRecord
{
  return self->_runningAdvertisementsPerRecord;
}

- (void)setRunningAdvertisementsPerRecord:(id)a3
{
  objc_storeStrong((id *)&self->_runningAdvertisementsPerRecord, a3);
}

- (double)currentObservationIntervalSeconds
{
  return self->_currentObservationIntervalSeconds;
}

- (void)setCurrentObservationIntervalSeconds:(double)a3
{
  self->_currentObservationIntervalSeconds = a3;
}

- (float)currentConfidenceThreshold
{
  return self->_currentConfidenceThreshold;
}

- (void)setCurrentConfidenceThreshold:(float)a3
{
  self->_currentConfidenceThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningAdvertisementsPerRecord, 0);
  objc_storeStrong((id *)&self->_runningRecords, 0);
}

@end
