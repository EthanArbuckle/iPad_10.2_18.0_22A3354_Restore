@implementation PLRoutineService

- (PLRoutineService)initWithFetchDateInterval:(id)a3
{
  id v5;
  PLRoutineService *v6;
  PLRoutineService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRoutineService;
  v6 = -[PLRoutineService init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchDateInterval, a3);
    -[PLRoutineService _invalidateLocationsOfInterest](v7, "_invalidateLocationsOfInterest");
  }

  return v7;
}

- (void)invalidateLocationsOfInterest
{
  PLRoutineService *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PLRoutineService _invalidateLocationsOfInterest](obj, "_invalidateLocationsOfInterest");
  objc_sync_exit(obj);

}

- (void)postProcessLocationsOfInterest
{
  PLRoutineService *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PLRoutineService _pinPendingVisits](obj, "_pinPendingVisits");
  objc_sync_exit(obj);

}

- (BOOL)hasLocationsOfInterestInformation
{
  PLRoutineService *v2;
  void *v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  -[PLRoutineService visitsCache](v2, "visitsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfLocationsOfInterest") != 0;

  objc_sync_exit(v2);
  return v4;
}

- (PLLocationOfInterestCache)visitsCache
{
  PLRoutineService *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_visitsCache)
    -[PLRoutineService _buildLocationsOfInterestCache](v2, "_buildLocationsOfInterestCache");
  objc_sync_exit(v2);

  return v2->_visitsCache;
}

- (void)fetchLocationsOfInterestIfNeeded
{
  PLRoutineService *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_visitsCache)
  {
    -[PLRoutineService _invalidateLocationsOfInterest](obj, "_invalidateLocationsOfInterest");
    -[PLRoutineService _buildLocationsOfInterestCache](obj, "_buildLocationsOfInterestCache");
  }
  objc_sync_exit(obj);

}

- (NSSet)homeLocations
{
  PLRoutineService *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[PLRoutineService visitsCache](v2, "visitsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSSet *)v4;
}

- (NSSet)workLocations
{
  PLRoutineService *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[PLRoutineService visitsCache](v2, "visitsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSSet *)v4;
}

- (NSSet)allLocationsOfInterest
{
  PLRoutineService *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[PLRoutineService visitsCache](v2, "visitsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allLocationsOfInterest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSSet *)v4;
}

- (id)locationsOfInterestOfType:(int64_t)a3
{
  PLRoutineService *v4;
  void *v5;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  -[PLRoutineService visitsCache](v4, "visitsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationsOfInterestOfType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v6;
}

- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  PLRoutineService *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[PLRoutineService visitsCache](v8, "visitsCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closestLocationOfInterestVisitToLocation:withinDistance:inDateInterval:", v6, v7, 50.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "locationOfInterest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  return v11;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  id v4;
  PLRoutineService *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[PLRoutineService visitsCache](v5, "visitsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationOfInterestAtLocation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (id)locationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  PLRoutineService *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[PLRoutineService visitsCache](v8, "visitsCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationsOfInterestVisitsAtLocation:inDateInterval:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  return v10;
}

- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  PLRoutineService *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableSet *pendingPinningVisitIdentifiers;
  uint64_t v19;
  void *v20;
  double v21;
  BOOL v22;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  PLRoutineService *obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  obj = v8;
  -[PLRoutineService visitsCache](v8, "visitsCache");
  v32 = v7;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "locationsOfInterestVisitsInDateInterval:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(v33, "earliestVisitStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

    if (v11 != 1)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v12 = v31;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v13)
      {
        v14 = 0;
        v15 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v36 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            pendingPinningVisitIdentifiers = obj->_pendingPinningVisitIdentifiers;
            objc_msgSend(v17, "identifier");
            v19 = objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](pendingPinningVisitIdentifiers, "addObject:", v19);

            objc_msgSend(v17, "locationOfInterest");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "distanceFromLocation:", v6);
            LOBYTE(v19) = v21 <= 50.0;

            v14 |= v19;
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v13);

        if ((v14 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
      v24 = v12;
      v25 = objc_msgSend(v24, "count");
      if (!v25)
      {
        v22 = 0;
        goto LABEL_21;
      }
      if (v25 > 2)
        goto LABEL_18;
      objc_msgSend(v24, "anyObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "visitInterval");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "duration");
      v29 = v28;

      if (v29 < 43200.0)
      {

LABEL_18:
        v30 = 50000.0;
LABEL_19:
        objc_msgSend(v33, "closestLocationOfInterestVisitToLocation:withinDistance:inDateInterval:", v6, v32, v30);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v22 = v24 == 0;
LABEL_21:

        goto LABEL_12;
      }

      if (v29 < 172800.0)
      {
        v30 = 200000.0;
        goto LABEL_19;
      }
    }
  }
LABEL_11:
  v22 = 0;
LABEL_12:

  objc_sync_exit(obj);
  return v22;
}

- (id)lastLocationOfInterestVisit
{
  PLRoutineService *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[PLRoutineService visitsCache](v2, "visitsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastLocationOfInterestVisit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- (void)_invalidateLocationsOfInterest
{
  PLLocationOfInterestCache *visitsCache;
  NSMutableSet *v4;
  NSMutableSet *pendingPinningVisitIdentifiers;

  self->_routineIsAvailable = 1;
  visitsCache = self->_visitsCache;
  self->_visitsCache = 0;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
  self->_pendingPinningVisitIdentifiers = v4;

}

- (void)_buildLocationsOfInterestCache
{
  PLRoutineService *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  PLLocationOfInterestLocation *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  PLLocationOfInterestLocation *v32;
  uint64_t v33;
  PLLocationOfInterest *v34;
  void *v35;
  PLLocationOfInterest *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  PLLocationOfInterestVisit *v49;
  void *v50;
  PLLocationOfInterestVisit *v51;
  PLLocationOfInterestCache *visitsCache;
  void *v53;
  void *v54;
  void *v55;
  PLRoutineService *v56;
  id obj;
  uint64_t v58;
  PLLocationOfInterestCache *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *context;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (self->_routineIsAvailable)
  {
    v2 = self;
    v59 = objc_alloc_init(PLLocationOfInterestCache);
    v3 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(getRTRoutineManagerClass(), "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLRoutineService _fetchLocationsOfInterestWithinDateInterval:routineManager:](v2, "_fetchLocationsOfInterestWithinDateInterval:routineManager:", v2->_fetchDateInterval, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2->_routineIsAvailable && v5)
    {
      v54 = v4;
      v55 = v3;
      v56 = v2;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v53 = v5;
      obj = v5;
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (v60)
      {
        v58 = *(_QWORD *)v71;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v71 != v58)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v6);
            v8 = MEMORY[0x19AEC1554]();
            v9 = v7;
            v10 = objc_msgSend(v9, "type");
            v11 = v10 + 1;
            context = (void *)v8;
            v69 = v6;
            if ((unint64_t)(v10 + 1) >= 5)
            {
              v14 = v10;
              PLBackendGetLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v80 = v14;
                _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Undefined LocationOfInterestType %ld. File a radar against Photos Media Mining.", buf, 0xCu);
              }

              v12 = -1;
              v13 = &PLRoutineServiceTypeRadiusOther;
            }
            else
            {
              v12 = qword_199B9BB38[v11];
              v13 = (&off_1E366AAE8)[v11];
            }
            v16 = *(double *)v13;
            objc_msgSend(v9, "location", v53, v54, v55, v56);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_alloc(MEMORY[0x1E0C9E3B8]);
            objc_msgSend(v17, "latitude");
            v20 = v19;
            objc_msgSend(v17, "longitude");
            v22 = objc_msgSend(v18, "initWithLatitude:longitude:", v20, v21);
            v23 = [PLLocationOfInterestLocation alloc];
            v66 = v17;
            objc_msgSend(v17, "horizontalUncertainty");
            v65 = (void *)v22;
            v24 = -[PLLocationOfInterestLocation initWithLocation:uncertainty:](v23, "initWithLocation:uncertainty:", v22);
            objc_msgSend(v9, "mapItem");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "location");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = objc_alloc(MEMORY[0x1E0C9E3B8]);
            objc_msgSend(v26, "latitude");
            v29 = v28;
            objc_msgSend(v26, "longitude");
            v31 = objc_msgSend(v27, "initWithLatitude:longitude:", v29, v30);
            v32 = [PLLocationOfInterestLocation alloc];
            v63 = v26;
            objc_msgSend(v26, "horizontalUncertainty");
            v62 = (void *)v31;
            v33 = -[PLLocationOfInterestLocation initWithLocation:uncertainty:](v32, "initWithLocation:uncertainty:", v31);
            v34 = [PLLocationOfInterest alloc];
            objc_msgSend(v9, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = (void *)v24;
            v61 = (void *)v33;
            v36 = -[PLLocationOfInterest initWithIdentifier:locationOfInterestType:typeRadius:routineLocation:mapItemLocation:](v34, "initWithIdentifier:locationOfInterestType:typeRadius:routineLocation:mapItemLocation:", v35, v12, v24, v33, v16);

            v76 = 0u;
            v77 = 0u;
            v74 = 0u;
            v75 = 0u;
            v67 = v9;
            objc_msgSend(v9, "visits");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, buf, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v75;
              do
              {
                for (i = 0; i != v39; ++i)
                {
                  if (*(_QWORD *)v75 != v40)
                    objc_enumerationMutation(v37);
                  v42 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                  v43 = objc_alloc(MEMORY[0x1E0CB3588]);
                  objc_msgSend(v42, "entryDate");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "exitDate");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = (void *)objc_msgSend(v43, "initWithStartDate:endDate:", v44, v45);

                  objc_msgSend(v42, "locationOfInterestConfidence");
                  v48 = v47;
                  v49 = [PLLocationOfInterestVisit alloc];
                  objc_msgSend(v42, "identifier");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = -[PLLocationOfInterestVisit initWithIdentifier:visitInterval:confidence:](v49, "initWithIdentifier:visitInterval:confidence:", v50, v46, v48);

                  -[PLLocationOfInterest addVisit:](v36, "addVisit:", v51);
                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, buf, 16);
              }
              while (v39);
            }

            -[PLLocationOfInterestCache addLocationOfInterest:](v59, "addLocationOfInterest:", v36);
            objc_autoreleasePoolPop(context);
            v6 = v69 + 1;
          }
          while (v69 + 1 != v60);
          v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        }
        while (v60);
      }

      v3 = v55;
      v2 = v56;
      v5 = v53;
      v4 = v54;
    }

    objc_autoreleasePoolPop(v3);
    visitsCache = v2->_visitsCache;
    v2->_visitsCache = v59;

  }
}

- (id)_fetchLocationsOfInterestWithinDateInterval:(id)a3 routineManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PLRoutineServiceResult *v12;
  void *v13;
  void *v14;
  PLRoutineServiceResult *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  _QWORD v24[4];
  PLRoutineServiceResult *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLRoutineService _fetchHomeAndWorkLocationsOfInterestWithRoutineManager:](self, "_fetchHomeAndWorkLocationsOfInterestWithRoutineManager:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_routineIsAvailable)
  {
    if (v8)
    {
      v10 = objc_msgSend(v8, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    if (v6)
    {
      v12 = objc_alloc_init(PLRoutineServiceResult);
      objc_msgSend(v6, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __79__PLRoutineService__fetchLocationsOfInterestWithinDateInterval_routineManager___block_invoke;
      v24[3] = &unk_1E366AA88;
      v15 = v12;
      v25 = v15;
      objc_msgSend(v7, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v13, v14, v24);

      if (-[PLRoutineServiceResult waitForReplyWithTimeout:](v15, "waitForReplyWithTimeout:", 2))
      {
        -[PLRoutineServiceResult result](v15, "result");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLRoutineServiceResult error](v15, "error");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PLBackendGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v17 || !v16)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v17, "userInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v27 = (uint64_t)v17;
            v28 = 2112;
            v29 = v22;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "CoreRoutine error getting lois, error: %@, userInfo: %@", buf, 0x16u);

          }
          self->_routineIsAvailable = 0;
        }
        else
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v20 = objc_msgSend(v16, "count");
            *(_DWORD *)buf = 134217984;
            v27 = v20;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "CoreRoutine found %lu lois", buf, 0xCu);
          }

          objc_msgSend(v11, "addObjectsFromArray:", v16);
        }

      }
      else
      {
        PLBackendGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Timeout getting loi information from CoreRoutine", buf, 2u);
        }

        self->_routineIsAvailable = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_fetchHomeAndWorkLocationsOfInterestWithRoutineManager:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  PLRoutineService *v16;

  v4 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __75__PLRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke;
  v14 = &unk_1E366AAB0;
  v15 = v4;
  v16 = self;
  v5 = v4;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](&v11);
  v6[2](v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_routineIsAvailable)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v6[2](v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_routineIsAvailable)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = (void *)objc_msgSend(v7, "mutableCopy", v11, v12, v13, v14, v15, v16);
  objc_msgSend(v9, "addObjectsFromArray:", v8);
LABEL_6:

  return v9;
}

- (void)_pinPendingVisits
{
  uint64_t v3;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  PLRoutineServiceResult *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSObject *v27;
  NSMutableSet *v28;
  NSMutableSet *pendingPinningVisitIdentifiers;
  PLRoutineServiceResult *v30;
  NSMutableSet *v31;
  NSObject *v32;
  NSObject *v33;
  NSMutableSet *v34;
  double v35;
  NSMutableSet *v36;
  NSMutableSet *v37;
  _QWORD v38[4];
  NSMutableSet *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  double v49;
  __int16 v50;
  double v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableSet count](self->_pendingPinningVisitIdentifiers, "count");
  if (self->_routineIsAvailable && v3 != 0)
  {
    v5 = v3;
    -[PLRoutineService visitsCache](self, "visitsCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfLocationsOfInterestVisits");

    v8 = (double)v5;
    v9 = (double)v7;
    if ((double)v7 * 0.8 <= (double)v5)
    {
      -[PLRoutineService visitsCache](self, "visitsCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "locationsOfInterestOfType:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v45 != v16)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "visits");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v15 += objc_msgSend(v18, "count");

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      -[PLRoutineService visitsCache](self, "visitsCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "locationsOfInterestOfType:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v21 = v20;
      v22 = -[PLRoutineServiceResult countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v41 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "visits");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v15 += objc_msgSend(v26, "count");

          }
          v23 = -[PLRoutineServiceResult countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        }
        while (v23);
      }

      if (v9 * 0.9 > (double)v15)
      {
        PLBackendGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v49 = v8 / v9;
          v50 = 2048;
          v51 = (double)v15 / v9;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Safeguard Pinning. Not pinning any visits. total %f, homeWork %f", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v28 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
        self->_pendingPinningVisitIdentifiers = v28;
LABEL_35:

        return;
      }

    }
    objc_msgSend(getRTRoutineManagerClass(), "defaultManager");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc_init(PLRoutineServiceResult);
    v31 = self->_pendingPinningVisitIdentifiers;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __37__PLRoutineService__pinPendingVisits__block_invoke;
    v38[3] = &unk_1E3674D50;
    v21 = v30;
    v39 = (NSMutableSet *)v21;
    objc_msgSend(v12, "extendLifetimeOfVisitsWithIdentifiers:handler:", v31, v38);
    if (-[PLRoutineServiceResult waitForReplyWithTimeout:](v21, "waitForReplyWithTimeout:", 2))
    {
      -[PLRoutineServiceResult error](v21, "error");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        PLBackendGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = self->_pendingPinningVisitIdentifiers;
          -[NSObject localizedDescription](v32, "localizedDescription");
          v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412546;
          v49 = *(double *)&v34;
          v50 = 2112;
          v51 = v35;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Could not pin visit with UUIDs %@. \"%@\", buf, 0x16u);

        }
      }
    }
    else
    {
      PLBackendGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Timeout pinning visits CoreRoutine", buf, 2u);
      }
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v37 = self->_pendingPinningVisitIdentifiers;
    self->_pendingPinningVisitIdentifiers = v36;

    pendingPinningVisitIdentifiers = v39;
    goto LABEL_35;
  }
}

- (NSDateInterval)fetchDateInterval
{
  return self->_fetchDateInterval;
}

- (void)setFetchDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_fetchDateInterval, a3);
}

- (void)setVisitsCache:(id)a3
{
  objc_storeStrong((id *)&self->_visitsCache, a3);
}

- (NSMutableSet)pendingPinningVisitIdentifiers
{
  return self->_pendingPinningVisitIdentifiers;
}

- (void)setPendingPinningVisitIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPinningVisitIdentifiers, a3);
}

- (BOOL)routineIsAvailable
{
  return self->_routineIsAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPinningVisitIdentifiers, 0);
  objc_storeStrong((id *)&self->_visitsCache, 0);
  objc_storeStrong((id *)&self->_fetchDateInterval, 0);
}

uint64_t __37__PLRoutineService__pinPendingVisits__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "receivedReplyWithResult:error:", 0, a2);
}

id __75__PLRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke(uint64_t a1, uint64_t a2)
{
  PLRoutineServiceResult *v4;
  void *v5;
  PLRoutineServiceResult *v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v19[4];
  PLRoutineServiceResult *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(PLRoutineServiceResult);
  v5 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__PLRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke_2;
  v19[3] = &unk_1E366AA88;
  v6 = v4;
  v20 = v6;
  objc_msgSend(v5, "fetchLocationsOfInterestOfType:withHandler:", a2, v19);
  if (-[PLRoutineServiceResult waitForReplyWithTimeout:](v6, "waitForReplyWithTimeout:", 2))
  {
    -[PLRoutineServiceResult error](v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "userInfo");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = (uint64_t)v7;
        v23 = 2112;
        v24 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "CoreRoutine error getting lois, error: %@, userInfo: %@", buf, 0x16u);

      }
      v10 = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 0;
LABEL_19:

      goto LABEL_20;
    }
    if ((unint64_t)(a2 + 1) >= 5)
    {
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v22 = a2;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Undefined LocationOfInterestType %ld. File a radar against Photos Media Mining.", buf, 0xCu);
      }

      v12 = 0;
    }
    else
    {
      v12 = qword_199B9BB38[a2 + 1] + 1;
      if (v12 > 2)
      {
        v13 = 0;
LABEL_16:
        v15 = v13;
        -[PLRoutineServiceResult result](v6, "result");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PLBackendGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = objc_msgSend(v10, "count");
          *(_DWORD *)buf = 134218242;
          v22 = v17;
          v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "CoreRoutine found %lu lois for type %@", buf, 0x16u);
        }

        goto LABEL_19;
      }
    }
    v13 = off_1E3677FF0[v12];
    goto LABEL_16;
  }
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Timeout getting loi information from CoreRoutine", buf, 2u);
  }

  v10 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 0;
LABEL_20:

  return v10;
}

uint64_t __75__PLRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "receivedReplyWithResult:error:", a2, a3);
}

uint64_t __79__PLRoutineService__fetchLocationsOfInterestWithinDateInterval_routineManager___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "receivedReplyWithResult:error:", a2, a3);
}

@end
