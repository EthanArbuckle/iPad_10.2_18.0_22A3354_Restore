@implementation PPTripCandidate

- (PPTripCandidate)initWithTripCandidateA:(id)a3 andTripCandidateB:(id)a4
{
  id v6;
  id v7;
  PPTripCandidate *v8;
  void *v9;
  void *v10;
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
  void *v22;
  void *v23;
  NSArray *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *groundTransports;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PPTripCandidate;
  v8 = -[PPTripCandidate init](&v31, sel_init);
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v6, "flights");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "flights");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v11);

    }
    objc_msgSend(v7, "flights");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v7, "flights");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v13);

    }
    objc_storeStrong((id *)&v8->_flights, v9);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v6, "hotels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v6, "hotels");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v16);

    }
    objc_msgSend(v7, "hotels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "hotels");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v18);

    }
    objc_storeStrong((id *)&v8->_hotels, v14);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v6, "others");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "others");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v21);

    }
    objc_msgSend(v7, "others");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v7, "others");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v23);

    }
    objc_storeStrong((id *)&v8->_others, v19);
    v24 = (NSArray *)objc_opt_new();
    objc_msgSend(v6, "groundTransports");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v6, "groundTransports");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v24, "addObjectsFromArray:", v26);

    }
    objc_msgSend(v7, "groundTransports");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v7, "groundTransports");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v24, "addObjectsFromArray:", v28);

    }
    groundTransports = v8->_groundTransports;
    v8->_groundTransports = v24;

  }
  return v8;
}

- (BOOL)canBeMergedWithTripCandidate:(id)a3 supportsGroundTransportEvents:(BOOL)a4
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  id v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSObject *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v49;
  _BOOL4 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[16];
  _BYTE v56[128];
  uint64_t v57;
  NSRange v58;
  NSRange v59;

  v6 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PPTripCandidate flights](self, "flights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    objc_msgSend(v8, "hotels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "count");
    v12 = v11 != 0;
    if (v11 || !v6)
      goto LABEL_11;
  }
  else if (!v6)
  {
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "hotels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {

    v12 = 0;
    if (!v10)
      goto LABEL_12;
    goto LABEL_11;
  }
  -[PPTripCandidate groundTransports](self, "groundTransports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "count") != 0;

  if (v10)
LABEL_11:

LABEL_12:
  -[PPTripCandidate flights](self, "flights");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  if (v15)
  {
    objc_msgSend(v8, "others");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {

      goto LABEL_32;
    }
    v50 = v12;
  }
  else
  {
    v50 = v12;
  }
  -[PPTripCandidate hotels](self, "hotels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17)
  {
    objc_msgSend(v8, "others");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v5, "count");
    v19 = v18 != 0;
    if (v18 || !v6)
      goto LABEL_27;
  }
  else if (!v6)
  {
    v19 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v8, "others");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "count"))
  {

    v19 = 0;
    if (!v17)
      goto LABEL_28;
    goto LABEL_27;
  }
  -[PPTripCandidate groundTransports](self, "groundTransports");
  v49 = v8;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v21, "count") != 0;

  v8 = v49;
  if (v17)
LABEL_27:

LABEL_28:
  if (v15)
  {

    v12 = v50;
    if ((v19 & 1) == 0)
    {
      v19 = 0;
      goto LABEL_44;
    }
  }
  else
  {

    v12 = v50;
    if (!v19)
      goto LABEL_44;
  }
LABEL_32:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v8, "others");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v52;
    v26 = 1;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v52 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "structuredLocation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "geoLocation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
          v26 = 0;
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v24);
    v19 = v26 & 1;
  }
  else
  {
    v19 = 1;
  }

LABEL_44:
  if ((v12 | v19) == 1)
  {
    v30 = v8;
    if (self)
    {
      v31 = -[PPTripCandidate eventsTimeRange](self);
      v33 = v32;
      v59.location = (NSUInteger)-[PPTripCandidate eventsTimeRange](v30);
      v59.length = v34;
      v58.location = (NSUInteger)v31;
      v58.length = v33;
      if (NSIntersectionRange(v58, v59).length)
      {
        pp_events_log_handle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C392E000, v35, OS_LOG_TYPE_DEBUG, "[TripCandidate canBeMergedWithTripCandidate] Found events that fits into other events", buf, 2u);
        }
        v36 = 1;
      }
      else
      {
        -[PPTripCandidate allEvents](self);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "startDate");
        v35 = objc_claimAutoreleasedReturnValue();

        -[PPTripCandidate allEvents](self);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_pas_leftFoldWithInitialObject:accumulate:", 0, &__block_literal_global_8222);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPTripCandidate allEvents](v30);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "startDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPTripCandidate allEvents](v30);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "_pas_leftFoldWithInitialObject:accumulate:", 0, &__block_literal_global_8222);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "timeIntervalSinceDate:", v43);
        v36 = 1;
        if (fabs(v46) >= 28800.0)
        {
          -[NSObject timeIntervalSinceDate:](v35, "timeIntervalSinceDate:", v45);
          if (fabs(v47) >= 28800.0)
            v36 = 0;
        }

      }
    }
    else
    {
      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (BOOL)canBeMergedWithTripCandidate:(id)a3
{
  return -[PPTripCandidate canBeMergedWithTripCandidate:supportsGroundTransportEvents:](self, "canBeMergedWithTripCandidate:supportsGroundTransportEvents:", a3, 0);
}

- (BOOL)shouldPromoteToTripEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  __int16 v23;
  __int16 v24;
  uint8_t buf[16];

  -[PPTripCandidate flights](self, "flights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {

    goto LABEL_7;
  }
  -[PPTripCandidate hotels](self, "hotels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
LABEL_7:
    -[PPTripCandidate flights](self, "flights");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pp_airports");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "first");
    v6 = objc_claimAutoreleasedReturnValue();

    -[PPTripCandidate flights](self, "flights");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pp_airports");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "second");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PPTripCandidate flights](self, "flights");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v15, "count") >= 2
      && v6
      && v14
      && !-[NSObject isEqualToPPFlightAirport:](v6, "isEqualToPPFlightAirport:", v14))
    {
      -[PPTripCandidate hotels](self, "hotels");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (!v20)
      {
        pp_events_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          goto LABEL_14;
        v24 = 0;
        v21 = "[TripCandidate shouldPromoteToTripEvent] discarding candidate: Flight round trip doesn't start and end at the same place.";
        v22 = (uint8_t *)&v24;
        goto LABEL_22;
      }
    }
    else
    {

    }
    -[PPTripCandidate eventsTimeRange](self);
    if ((double)v16 / 60.0 / 60.0 / 24.0 <= 120.0)
    {
      v7 = 1;
      goto LABEL_16;
    }
    pp_events_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
LABEL_14:

      v7 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v23 = 0;
    v21 = "[TripCandidate shouldPromoteToTripEvent] discarding candidate: Candidate longer than 2 months";
    v22 = (uint8_t *)&v23;
LABEL_22:
    _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, v21, v22, 2u);
    goto LABEL_14;
  }
  pp_events_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "[TripCandidate shouldPromoteToTripEvent] discarding candidate: Single flight with no hotel", buf, 2u);
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (id)tripEventFromCandidate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[PPTripCandidate allEvents](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v7)
  {
    v8 = v7;
    LOBYTE(v9) = 0;
    v52 = v6;
    v53 = *(_QWORD *)v55;
    v49 = v5;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v55 != v53)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "pp_suggestedCategory");
        v13 = v12;
        if ((_BYTE)v9)
        {
          v14 = v9;
          if (v9 == 1 && v12 == 1)
          {
            v15 = objc_msgSend(v6, "indexOfObject:", v11) - 1;
            if (v15 >= 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              if (self)
              {
                v18 = v16;
                objc_msgSend(v11, "startDate");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "endDate");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v19, "timeIntervalSinceDate:", v20);
                v22 = v21;

              }
              else
              {
                v22 = 0.0;
              }
              if (v22 / 60.0 / 60.0 <= 24.0)
              {
                objc_msgSend(v4, "addObject:", v11);
              }
              else
              {
                -[PPTripCandidate partFromEvents:tripMode:takingLocationFromEvent:]((uint64_t)self, v4, 1, v11);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:");
                v23 = (void *)objc_opt_new();

                v50 = v23;
                objc_msgSend(v23, "addObject:", v11);
                objc_msgSend(v17, "endDate");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "startDate");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v11;
                v27 = v24;
                v28 = v25;
                if (self)
                {
                  objc_msgSend(v26, "structuredLocation");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "geoLocation");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PPTripCandidate reverseGeocodedLocation:](v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  v32 = objc_alloc(MEMORY[0x1E0D70CF8]);
                  v33 = v32;
                  if (v31)
                  {
                    v34 = (void *)objc_msgSend(v32, "initWithStartDate:endDate:eventIdentifiers:mode:location:fallbackLocationString:", v27, v28, MEMORY[0x1E0C9AA60], 2, v31, 0);
                  }
                  else
                  {
                    objc_msgSend(v26, "pp_locationString");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = (void *)objc_msgSend(v33, "initWithStartDate:endDate:eventIdentifiers:mode:location:fallbackLocationString:", v27, v28, MEMORY[0x1E0C9AA60], 2, 0, v38);

                  }
                }
                else
                {
                  v34 = 0;
                }
                v5 = v49;

                objc_msgSend(v49, "addObject:", v34);
                v4 = v50;
              }
              v6 = v52;

            }
            v9 = 1;
          }
          else
          {
            objc_msgSend(v4, "lastObject");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[PPTripCandidate partFromEvents:tripMode:takingLocationFromEvent:]((uint64_t)self, v4, v14, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "addObject:", v36);
            v37 = (void *)objc_opt_new();

            objc_msgSend(v37, "addObject:", v11);
            if (self && (v13 - 1) <= 9)
              v9 = byte_1C3AE518A[(v13 - 1)];
            else
              v9 = 0;

            v4 = v37;
            v6 = v52;
          }
        }
        else
        {
          if (self && (v12 - 1) <= 9)
            v9 = byte_1C3AE518A[(v12 - 1)];
          else
            v9 = 0;
          objc_msgSend(v4, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v39 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      v8 = v39;
    }
    while (v39);
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "lastObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPTripCandidate partFromEvents:tripMode:takingLocationFromEvent:]((uint64_t)self, v4, v9, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v41);
  }
  v42 = objc_alloc(MEMORY[0x1E0D70CE8]);
  objc_msgSend(v6, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "startDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "endDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v42, "initWithStartDate:endDate:tripParts:", v44, v46, v5);

  return v47;
}

- (NSArray)flights
{
  return self->_flights;
}

- (void)setFlights:(id)a3
{
  objc_storeStrong((id *)&self->_flights, a3);
}

- (NSArray)hotels
{
  return self->_hotels;
}

- (void)setHotels:(id)a3
{
  objc_storeStrong((id *)&self->_hotels, a3);
}

- (NSArray)others
{
  return self->_others;
}

- (void)setOthers:(id)a3
{
  objc_storeStrong((id *)&self->_others, a3);
}

- (NSArray)groundTransports
{
  return self->_groundTransports;
}

- (void)setGroundTransports:(id)a3
{
  objc_storeStrong((id *)&self->_groundTransports, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groundTransports, 0);
  objc_storeStrong((id *)&self->_others, 0);
  objc_storeStrong((id *)&self->_hotels, 0);
  objc_storeStrong((id *)&self->_flights, 0);
}

- (id)allEvents
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v1, "flights");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v3);

    objc_msgSend(v1, "hotels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v4);

    objc_msgSend(v1, "others");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v5);

    objc_msgSend(v1, "groundTransports");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v6);

    objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compareStartDateWithEvent_);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)partFromEvents:(uint64_t)a3 tripMode:(void *)a4 takingLocationFromEvent:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    objc_msgSend(v8, "structuredLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "geoLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPTripCandidate reverseGeocodedLocation:](v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0D70CF8]);
    objc_msgSend(v7, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("eventIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v19 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:eventIdentifiers:mode:location:fallbackLocationString:", v15, v17, v18, a3, v12, 0);
    }
    else
    {
      objc_msgSend(v9, "pp_locationString");
      v22 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:eventIdentifiers:mode:location:fallbackLocationString:", v15, v17, v18, a3, 0, v20);

      v9 = v22;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)reverseGeocodedLocation:(void *)a1
{
  id v1;
  id v2;
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  intptr_t (*v9)(uint64_t, void *);
  void *v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v1 = a1;
  if (v1)
  {
    v3 = (void *)objc_opt_new();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__8211;
    v17 = __Block_byref_object_dispose__8212;
    v18 = 0;
    v4 = dispatch_semaphore_create(0);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __43__PPTripCandidate_reverseGeocodedLocation___block_invoke;
    v10 = &unk_1E7E1B6E8;
    v12 = &v13;
    v5 = v4;
    v11 = v5;
    objc_msgSend(v3, "reverseGeocodeLocation:completionHandler:", v1, &v7);
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v5, 1.0, v7, v8, v9, v10) == 1)
      v2 = 0;
    else
      v2 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

intptr_t __43__PPTripCandidate_reverseGeocodedLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)eventsTimeRange
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  v1 = a1;
  if (a1)
  {
    -[PPTripCandidate allEvents](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PPTripCandidate allEvents](v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v1 = (id)v8;
    objc_msgSend(v7, "timeIntervalSinceDate:", v4);

  }
  return v1;
}

id __37__PPTripCandidate_lastDateForEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (!v4
    || (objc_msgSend(v5, "endDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v4, "compare:", v7),
        v7,
        v8 == -1))
  {
    objc_msgSend(v6, "endDate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v4;
  }
  v10 = v9;

  return v10;
}

@end
