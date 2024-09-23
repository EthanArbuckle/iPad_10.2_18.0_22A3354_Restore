@implementation PPFlightEventsAggregator

- (id)tripCandidatesFromEventsPool
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self)
    -[PPEventsAggregator dedupeEventsInPoolForCategory:](self, 1);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[PPFlightEventsAggregator _multiDestinationsFlights](self, "_multiDestinationsFlights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setFlights:", v12, (_QWORD)v15);
        objc_msgSend(v3, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v3;
}

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  return objc_msgSend(a3, "pp_isDupeOfFlightEvent:", a4);
}

- (id)_simpleRoundTripFlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PPEventsAggregator eventsPool](self, "eventsPool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compareStartDateWithEvent_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
        {
          -[PPEventsAggregator eventsPool](self, "eventsPool");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPFlightEventsAggregator _returningFlightForFlight:inPool:](self, "_returningFlightForFlight:inPool:", v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v4, "addObject:", v13);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v11, v13, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v14);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v3;
}

- (id)_multiDestinationsFlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[PPEventsAggregator eventsPool](self, "eventsPool");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compareStartDateWithEvent_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pp_airports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        v13 = v10;
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (!objc_msgSend(v4, "count")
          || v7 && objc_msgSend(v13, "isEqualToPPFlightAirport:", v7)
          || (objc_msgSend(v4, "lastObject"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v15, "lastObject"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "pp_isConnectionFromFlight:", v14),
              v16,
              v15,
              !v17))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v19);

          objc_msgSend(v14, "pp_airports");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "first");
          v20 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v20;
        }
        else
        {
          objc_msgSend(v4, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v14);
        }

        objc_msgSend(v14, "pp_airports");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "second");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);

  }
  return v4;
}

- (id)_returningFlightForFlight:(id)a3 inPool:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "pp_airports");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    v26 = v8;
    do
    {
      v12 = 0;
      v27 = v10;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * v12);
        if (v13 != v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v12), "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "startDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 >= v15)
          {
            objc_msgSend(v13, "pp_airports");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "first");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "second");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "isEqualToPPFlightAirport:", v18) & 1) != 0)
            {
              objc_msgSend(v16, "second");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "first");
              v20 = v11;
              v21 = v5;
              v22 = v7;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v19, "isEqualToPPFlightAirport:", v23);

              v7 = v22;
              v5 = v21;
              v11 = v20;
              v10 = v27;

              v8 = v26;
              if ((v28 & 1) != 0)
              {
                v24 = v13;

                goto LABEL_16;
              }
            }
            else
            {

            }
          }
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }
  v24 = 0;
LABEL_16:

  return v24;
}

@end
