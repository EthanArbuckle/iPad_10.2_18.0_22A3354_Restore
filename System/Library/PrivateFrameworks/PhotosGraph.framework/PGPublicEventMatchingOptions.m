@implementation PGPublicEventMatchingOptions

- (PGPublicEventMatchingOptions)initWithTimeLocationTuple:(id)a3 momentNode:(id)a4 meaningfulEventProcessorCache:(id)a5 serviceManager:(id)a6
{
  id v11;
  id v12;
  PGMeaningfulEventProcessorCache *v13;
  id v14;
  PGPublicEventMatchingOptions *v15;
  PGPublicEventMatchingOptions *v16;
  CLLocationDegrees v17;
  CLLocationDegrees v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = (PGMeaningfulEventProcessorCache *)a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PGPublicEventMatchingOptions;
  v15 = -[PGPublicEventMatchingOptions init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timeLocationTuple, a3);
    objc_storeStrong((id *)&v16->_momentNode, a4);
    objc_msgSend(v11, "coordinates");
    v16->_coordinates.latitude = v17;
    v16->_coordinates.longitude = v18;
    v16->_meaningfulEventProcessorCache = v13;
    objc_storeStrong((id *)&v16->_serviceManager, a6);
  }

  return v16;
}

- (NSDateInterval)actualAttendanceDateInterval
{
  NSDateInterval *actualAttendanceDateInterval;

  actualAttendanceDateInterval = self->_actualAttendanceDateInterval;
  if (!actualAttendanceDateInterval)
  {
    -[PGPublicEventMatchingOptions _createAttendanceDateIntervals](self, "_createAttendanceDateIntervals");
    actualAttendanceDateInterval = self->_actualAttendanceDateInterval;
  }
  return actualAttendanceDateInterval;
}

- (NSDateInterval)expandedAttendanceDateInterval
{
  NSDateInterval *expandedAttendanceDateInterval;

  expandedAttendanceDateInterval = self->_expandedAttendanceDateInterval;
  if (!expandedAttendanceDateInterval)
  {
    -[PGPublicEventMatchingOptions _createAttendanceDateIntervals](self, "_createAttendanceDateIntervals");
    expandedAttendanceDateInterval = self->_expandedAttendanceDateInterval;
  }
  return expandedAttendanceDateInterval;
}

- (PGMeaningfulEventMatchingCriteria)matchingCriteria
{
  PGMeaningfulEventMatchingCriteria *matchingCriteria;
  PGMeaningfulEventMatchingCriteria *v4;
  PGMeaningfulEventMatchingCriteria *v5;

  matchingCriteria = self->_matchingCriteria;
  if (!matchingCriteria)
  {
    v4 = -[PGMeaningfulEventMatchingCriteria initWithMoment:cache:serviceManager:]([PGMeaningfulEventMatchingCriteria alloc], "initWithMoment:cache:serviceManager:", self->_momentNode, self->_meaningfulEventProcessorCache, self->_serviceManager);
    v5 = self->_matchingCriteria;
    self->_matchingCriteria = v4;

    matchingCriteria = self->_matchingCriteria;
  }
  return matchingCriteria;
}

- (NSArray)temporalClusterEvents
{
  NSArray *temporalClusterEvents;
  NSArray *v4;
  NSArray *v5;

  temporalClusterEvents = self->_temporalClusterEvents;
  if (!temporalClusterEvents)
  {
    -[PGPublicEventMatchingOptions _readTemporalClusterEvents](self, "_readTemporalClusterEvents");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_temporalClusterEvents;
    self->_temporalClusterEvents = v4;

    temporalClusterEvents = self->_temporalClusterEvents;
  }
  return temporalClusterEvents;
}

- (void)_createAttendanceDateIntervals
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDateInterval *v20;
  uint64_t v21;
  uint64_t v22;
  NSDateInterval *actualAttendanceDateInterval;
  NSDateInterval *v24;
  NSDateInterval *v25;
  NSDateInterval *expandedAttendanceDateInterval;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[CLSTimeLocationTuple startDate](self->_timeLocationTuple, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSTimeLocationTuple endDate](self->_timeLocationTuple, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v3, v4);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", self->_coordinates.latitude, self->_coordinates.longitude);
  v29 = (void *)v5;
  -[CLSServiceManager fetchLocationOfInterestVisitsAtLocation:inDateInterval:](self->_serviceManager, "fetchLocationOfInterestVisitsAtLocation:inDateInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v6, "count");
  v7 = v3;
  v8 = v4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v30 = v8;
  v31 = v7;
  v11 = v7;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v33;
    v11 = v7;
    do
    {
      v14 = 0;
      v15 = v11;
      v16 = v8;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v14), "visitInterval");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "earlierDate:", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "laterDate:", v19);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v11;
        v16 = v8;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  v20 = (NSDateInterval *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v8);
  if (!v27)
  {
    -[CLSTimeLocationTuple expandedStartDate](self->_timeLocationTuple, "expandedStartDate");
    v21 = objc_claimAutoreleasedReturnValue();

    -[CLSTimeLocationTuple expandedEndDate](self->_timeLocationTuple, "expandedEndDate");
    v22 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v21;
    v8 = (id)v22;
  }
  actualAttendanceDateInterval = self->_actualAttendanceDateInterval;
  self->_actualAttendanceDateInterval = v20;
  v24 = v20;

  v25 = (NSDateInterval *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v8);
  expandedAttendanceDateInterval = self->_expandedAttendanceDateInterval;
  self->_expandedAttendanceDateInterval = v25;

}

- (id)_readTemporalClusterEvents
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PGGraphMomentNode universalStartDate](self->_momentNode, "universalStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphMomentNode universalEndDate](self->_momentNode, "universalEndDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D4B280]);
    v14 = 0;
    objc_msgSend(v8, "eventsBetweenStartDate:endDate:error:", v3, v5, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v11 = v10;
    if (v9)
    {
      v12 = v9;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PublicEvents] Error reading temporal cluster events - %{pubilc}@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v12;

  }
  return v7;
}

- (PGMeaningfulEventProcessorCache)meaningfulEventProcessorCache
{
  return self->_meaningfulEventProcessorCache;
}

- (CLSTimeLocationTuple)timeLocationTuple
{
  return self->_timeLocationTuple;
}

- (PGGraphMomentNode)momentNode
{
  return self->_momentNode;
}

- (CLLocationCoordinate2D)coordinates
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinates.latitude;
  longitude = self->_coordinates.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalClusterEvents, 0);
  objc_storeStrong((id *)&self->_matchingCriteria, 0);
  objc_storeStrong((id *)&self->_expandedAttendanceDateInterval, 0);
  objc_storeStrong((id *)&self->_actualAttendanceDateInterval, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
  objc_storeStrong((id *)&self->_timeLocationTuple, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

@end
