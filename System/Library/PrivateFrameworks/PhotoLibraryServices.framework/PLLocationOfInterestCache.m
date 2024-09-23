@implementation PLLocationOfInterestCache

- (PLLocationOfInterestCache)init
{
  PLLocationOfInterestCache *v2;
  uint64_t v3;
  NSMutableDictionary *visitsCache;
  uint64_t v5;
  NSMutableSet *allLocationsOfInterest;
  uint64_t v7;
  NSMutableSet *homeLocations;
  uint64_t v9;
  NSMutableSet *workLocations;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLLocationOfInterestCache;
  v2 = -[PLLocationOfInterestCache init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    visitsCache = v2->_visitsCache;
    v2->_visitsCache = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    allLocationsOfInterest = v2->_allLocationsOfInterest;
    v2->_allLocationsOfInterest = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    homeLocations = v2->_homeLocations;
    v2->_homeLocations = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    workLocations = v2->_workLocations;
    v2->_workLocations = (NSMutableSet *)v9;

  }
  return v2;
}

- (void)addLocationOfInterest:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  id *p_lastLocationOfInterestVisit;
  id *location;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLocationOfInterestCache.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationOfInterest != nil"));

  }
  objc_msgSend(v5, "visits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_allLocationsOfInterest, "containsObject:", v5) & 1) != 0)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "[RoutineCache] LOI already existing in cache. %@", buf, 0xCu);
    }
    goto LABEL_38;
  }
  self->_numberOfLocationsOfInterestVisits += objc_msgSend(v6, "count");
  -[NSMutableSet addObject:](self->_allLocationsOfInterest, "addObject:", v5);
  if (!objc_msgSend(v5, "type"))
  {
    v8 = 24;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "type") == 1)
  {
    v8 = 32;
LABEL_10:
    objc_msgSend(*(id *)((char *)&self->super.isa + v8), "addObject:", v5);
  }
  v33 = v6;
  v34 = v5;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v6;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  v7 = 0;
  if (v37)
  {
    v36 = *(_QWORD *)v52;
    p_lastLocationOfInterestVisit = (id *)&self->_lastLocationOfInterestVisit;
    location = (id *)&self->_earliestVisitStartDate;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v9);
        objc_msgSend(v10, "visitInterval");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*location || objc_msgSend(*location, "compare:", v12) == 1)
          objc_storeStrong(location, v12);
        v43 = v11;
        v44 = v9;
        v41 = v13;
        v42 = v12;
        if (!*p_lastLocationOfInterestVisit || -[NSObject compare:](v7, "compare:", v13) == -1)
        {
          objc_storeStrong(p_lastLocationOfInterestVisit, v10);
          v14 = v13;

          v45 = v14;
        }
        else
        {
          v45 = v7;
        }
        objc_msgSend(v10, "visitInterval");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pl_validDateForDate:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pl_validDateForDate:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "pl_startOfDayForDate:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v40 = (void *)v18;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "compare:", v20) == -1)
        {
          do
          {
            objc_msgSend(v16, "components:fromDate:", 28, v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld-%ld"), objc_msgSend(v23, "year"), objc_msgSend(v23, "month"), objc_msgSend(v23, "day"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addObject:", v24);
            objc_msgSend(v16, "dateByAddingUnit:value:toDate:options:", 16, 1, v21, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = v22;
          }
          while (objc_msgSend(v22, "compare:", v20) == -1);
        }
        else
        {
          v22 = v21;
        }

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v25 = v46;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v48 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_visitsCache, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v31)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_visitsCache, "setObject:forKeyedSubscript:", v31, v30);
              }
              objc_msgSend(v31, "addObject:", v10);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          }
          while (v27);
        }

        v7 = v45;
        v9 = v44 + 1;
      }
      while (v44 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v37);
  }

  v6 = v33;
  v5 = v34;
LABEL_38:

}

- (id)locationsOfInterestOfType:(int64_t)a3
{
  void *v3;

  if (a3 == -1)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[PLLocationOfInterestCache workLocations](self, "workLocations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[PLLocationOfInterestCache homeLocations](self, "homeLocations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)closestLocationOfInterestVisitToLocation:(id)a3 withinDistance:(double)a4 inDateInterval:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  double v16;
  void *i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLocationOfInterestCache.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLocationOfInterestCache.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateInterval != nil"));

LABEL_3:
  -[PLLocationOfInterestCache locationsOfInterestVisitsInDateInterval:](self, "locationsOfInterestVisitsInDateInterval:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  v14 = 0;
  if (v13)
  {
    v15 = *(_QWORD *)v27;
    v16 = 1.79769313e308;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "locationOfInterest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "distanceFromLocation:", v9);
        if (v20 < v16)
        {
          v21 = v20;
          v22 = v18;

          v16 = v21;
          v14 = v22;
        }

      }
      v13 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
    if (v14 && v16 - a4 <= 2.22044605e-16)
    {
      v14 = v14;
      v13 = v14;
    }
  }

  return v13;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  id v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLocationOfInterestCache.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location != nil"));

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PLLocationOfInterestCache allLocationsOfInterest](self, "allLocationsOfInterest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "centerDistanceFromLocation:", v5);
        if (v13 <= 2.22044605e-16)
        {
          v14 = v12;

          v9 = v14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)locationsOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  id obj;
  uint64_t v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pl_validDateForDate:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pl_validDateForDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)v11;
  objc_msgSend(v9, "pl_startOfDayForDate:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "compare:", v13) == -1)
  {
    v39 = v13;
    do
    {
      objc_msgSend(v9, "components:fromDate:", 28, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld-%ld"), objc_msgSend(v17, "year"), objc_msgSend(v17, "month"), objc_msgSend(v17, "day"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v18);
      objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, 1, v14, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v39;
      v14 = v16;
    }
    while (objc_msgSend(v16, "compare:", v39) == -1);
  }
  else
  {
    v16 = v14;
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v15;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v45;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(obj);
        v38 = v19;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_visitsCache, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v19));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v41 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v25, "visitInterval");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "intersectsDateInterval:", v8);

              if (v27)
              {
                if (v5)
                {
                  objc_msgSend(v25, "locationOfInterest");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = v28;
                  if (v28)
                  {
                    objc_msgSend(v28, "centerDistanceFromLocation:", v5);
                    if (v30 <= 2.22044605e-16)
                      objc_msgSend(v7, "addObject:", v25);
                  }
                  else
                  {
                    PLBackendGetLog();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138477827;
                      v49 = v25;
                      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "LOI nil for visit %{private}@", buf, 0xCu);
                    }

                  }
                }
                else
                {
                  objc_msgSend(v7, "addObject:", v25);
                }
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          }
          while (v22);
        }

        v19 = v38 + 1;
      }
      while (v38 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v36);
  }

  return v7;
}

- (id)locationsOfInterestVisitsInDateInterval:(id)a3
{
  return -[PLLocationOfInterestCache locationsOfInterestVisitsAtLocation:inDateInterval:](self, "locationsOfInterestVisitsAtLocation:inDateInterval:", 0, a3);
}

- (unint64_t)numberOfLocationsOfInterest
{
  void *v2;
  unint64_t v3;

  -[PLLocationOfInterestCache allLocationsOfInterest](self, "allLocationsOfInterest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSMutableDictionary)visitsCache
{
  return self->_visitsCache;
}

- (void)setVisitsCache:(id)a3
{
  objc_storeStrong((id *)&self->_visitsCache, a3);
}

- (NSMutableSet)allLocationsOfInterest
{
  return self->_allLocationsOfInterest;
}

- (void)setAllLocationsOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_allLocationsOfInterest, a3);
}

- (NSMutableSet)homeLocations
{
  return self->_homeLocations;
}

- (void)setHomeLocations:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocations, a3);
}

- (NSMutableSet)workLocations
{
  return self->_workLocations;
}

- (void)setWorkLocations:(id)a3
{
  objc_storeStrong((id *)&self->_workLocations, a3);
}

- (unint64_t)numberOfLocationsOfInterestVisits
{
  return self->_numberOfLocationsOfInterestVisits;
}

- (NSDate)earliestVisitStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (PLLocationOfInterestVisit)lastLocationOfInterestVisit
{
  return (PLLocationOfInterestVisit *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)numberOfLocationsOfInterestTransitions
{
  return self->_numberOfLocationsOfInterestTransitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationOfInterestVisit, 0);
  objc_storeStrong((id *)&self->_earliestVisitStartDate, 0);
  objc_storeStrong((id *)&self->_workLocations, 0);
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_allLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_visitsCache, 0);
}

@end
