@implementation PPTripAggregator

+ (id)tripEventsWithEvents:(id)a3 from:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "tripCandidatesWithEvents:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tripEventsFromCandidates:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v17, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", v9);
        if (v19 <= 0.0)
        {
          objc_msgSend(v17, "endDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "timeIntervalSinceDate:", v20);
          v22 = v21;

          if (v22 <= 0.0)
            objc_msgSend(v11, "addObject:", v17);
        }
        else
        {

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  return v11;
}

+ (id)tripCandidatesWithEvents:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "tripCandidatesWithEvents:supportsGroundTransportEvents:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)tripCandidatesWithEvents:(id)a3 supportsGroundTransportEvents:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(a1, "_tripCandidatesFromCategory:andEvents:", 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);
  objc_msgSend(a1, "_tripCandidatesFromCategory:andEvents:", 10, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v9);
  objc_msgSend(a1, "_tripCandidatesFromCategory:andEvents:", 2, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v10);
  if (v4)
  {
    objc_msgSend(a1, "_tripCandidatesFromCategory:andEvents:", 4, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObjectsFromArray:", v11);
    objc_msgSend(a1, "_tripCandidatesFromCategory:andEvents:", 5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObjectsFromArray:", v12);
    objc_msgSend(a1, "_tripCandidatesFromCategory:andEvents:", 3, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObjectsFromArray:", v13);
    objc_msgSend(a1, "_tripCandidatesFromCategory:andEvents:", 6, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObjectsFromArray:", v14);
    objc_msgSend(a1, "_tripCandidatesFromCategory:andEvents:", 7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObjectsFromArray:", v10);
  }
  pp_events_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v20 = 134217984;
    v21 = objc_msgSend(v7, "count");
    _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "[TripAggregator] Attempting to merge %lu trip candidates", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(a1, "mergeTripCandidates:supportsGroundTransportEvents:", v7, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  pp_events_log_handle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend(v7, "count");
    v20 = 134217984;
    v21 = v19;
    _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "[TripAggregator] Post merge: %lu trip candidates", (uint8_t *)&v20, 0xCu);
  }

  return v16;
}

+ (id)tripEventsFromCandidates:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "shouldPromoteToTripEvent", (_QWORD)v13))
        {
          objc_msgSend(v10, "tripEventFromCandidate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)mergeTripCandidates:(id)a3 supportsGroundTransportEvents:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  PPTripCandidate *v17;
  void *v18;
  void *v19;
  PPTripCandidate *v20;
  id v22;
  unint64_t v23;

  v4 = a4;
  v22 = a1;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    while (1)
    {
      v23 = v6 + 1;
      if (v6 + 1 < (unint64_t)objc_msgSend(v5, "count", v22))
        break;
LABEL_8:
      ++v6;
      if (v23 >= objc_msgSend(v5, "count"))
        goto LABEL_9;
    }
    v7 = v6 + 1;
    while (1)
    {
      v8 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "canBeMergedWithTripCandidate:supportsGroundTransportEvents:", v10, v4))
        break;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "canBeMergedWithTripCandidate:supportsGroundTransportEvents:", v12, v4);

      if ((v13 & 1) != 0)
        goto LABEL_11;
      objc_autoreleasePoolPop(v8);
      if (++v7 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_8;
    }

LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addIndex:", v7);
    objc_msgSend(v15, "removeObjectsAtIndexes:", v16);
    v17 = [PPTripCandidate alloc];
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PPTripCandidate initWithTripCandidateA:andTripCandidateB:](v17, "initWithTripCandidateA:andTripCandidateB:", v18, v19);

    objc_msgSend(v15, "insertObject:atIndex:", v20, 0);
    objc_msgSend(v22, "mergeTripCandidates:supportsGroundTransportEvents:", v15, v4);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
LABEL_9:
    v14 = v5;
  }

  return v14;
}

+ (id)mergeTripCandidates:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "mergeTripCandidates:supportsGroundTransportEvents:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_eventsFromCategory:(unsigned __int8)a3 inPool:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v6 = a4;
  objc_msgSend(a1, "keyForCategory:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_msgSend(v6, "objectForKeyedSubscript:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)keyForCategory:(unsigned __int8)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D70B30], "descriptionForSuggestedEventCategory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_componentsJoinedByString:", &stru_1E7E221D0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

+ (id)_tripCandidatesFromCategory:(unsigned __int8)a3 andEvents:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_eventsFromCategory:inPool:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if ((v4 - 1) < 0xA && ((0x27Fu >> (v4 - 1)) & 1) != 0)
    {
      v10 = (void *)objc_msgSend(objc_alloc(*off_1E7E19530[(v4 - 1)]), "initWithEventsPool:", v7);
      objc_msgSend(v10, "tripCandidatesFromEventsPool");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      pp_events_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v13 = objc_msgSend(v9, "count");
        v14 = objc_msgSend(v6, "count");
        objc_msgSend(MEMORY[0x1E0D70B30], "descriptionForSuggestedEventCategory:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218498;
        v17 = v13;
        v18 = 2048;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "[TripAggregator] Found %lu trip candidates out of %lu %@ events", (uint8_t *)&v16, 0x20u);

      }
    }
    else
    {
      pp_events_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0D70B30], "descriptionForSuggestedEventCategory:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = (uint64_t)v12;
        _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "[TripAggregator] Unsupported event category %@ while retrieving trip candidates", (uint8_t *)&v16, 0xCu);

      }
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
