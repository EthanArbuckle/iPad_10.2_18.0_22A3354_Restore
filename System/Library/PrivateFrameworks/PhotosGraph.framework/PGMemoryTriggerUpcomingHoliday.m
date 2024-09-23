@implementation PGMemoryTriggerUpcomingHoliday

- (PGMemoryTriggerUpcomingHoliday)initWithLoggingConnection:(id)a3 holidayService:(id)a4
{
  PGMemoryTriggerUpcomingHoliday *v4;
  PGMemoryTriggerUpcomingHoliday *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSSet *validHolidaysNames;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PGMemoryTriggerUpcomingHoliday;
  v4 = -[PGHolidayMemoryTrigger initWithLoggingConnection:holidayService:](&v24, sel_initWithLoggingConnection_holidayService_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PGHolidayMemoryTrigger holidayService](v4, "holidayService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGHolidayMemoryTrigger holidayService](v5, "holidayService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "countryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerHolidaysForCountryCode:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "name", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v14);
    }

    validHolidaysNames = v5->_validHolidaysNames;
    v5->_validHolidaysNames = v11;

  }
  return v5;
}

- (unint64_t)triggerType
{
  return 17;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphHolidayNodeCollection, "subsetInCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureNodeCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSSet *validHolidaysNames;
  id v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v42 = 53;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerUpcomingHoliday.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v8, "timeZone");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localDate");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "universalDateFromLocalDate:inTimeZone:", v13, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 7, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:", v15, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v16;
    v29 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:", v16, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v13;
    v19 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v13);
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 16, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PGHolidayMemoryTrigger holidayService](self, "holidayService");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v9;
    v24 = (void *)v22;
    validHolidaysNames = self->_validHolidaysNames;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __87__PGMemoryTriggerUpcomingHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v35[3] = &unk_1E8429278;
    v35[4] = self;
    v30 = v23;
    v36 = v23;
    v37 = v20;
    v40 = v19;
    v38 = v8;
    v26 = v21;
    v39 = v26;
    v27 = v20;
    objc_msgSend(v24, "enumerateEventRulesForAllCountriesWithNames:betweenLocalDate:andLocalDate:usingBlock:", validHolidaysNames, v17, v18, v35);

    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v42 = 103;
        v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerUpcomingHoliday.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v26;
    }
    v9 = v30;

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validHolidaysNames, 0);
}

void __87__PGMemoryTriggerUpcomingHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", v6))
  {
    +[PGGraphHolidayNodeCollection holidayNodesWithName:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithName:inGraph:", v6, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v43 = v7;
      v44 = v6;
      objc_msgSend(v7, "featureNodeCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "memoryNodes");
      v9 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)v9;
      objc_msgSend(*(id *)(a1 + 48), "collectionByIntersecting:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "momentNodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "yearNodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v41 = v13;
      objc_msgSend(v13, "years");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v51 != v18)
              objc_enumerationMutation(v14);
            v20 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "integerValue");
            if (v17 < v20 && *(_QWORD *)(a1 + 72) >= v20)
              v17 = v20;
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v16);
      }
      else
      {
        v17 = 0;
      }

      +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", v17, *(_QWORD *)(a1 + 40));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateNodes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "momentNodes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "memoryNodes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "collectionByIntersecting:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v25, "count"))
      {
        v38 = v24;
        v39 = v21;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v40 = v5;
        obj = v5;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v47 != v28)
                objc_enumerationMutation(obj);
              v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
              objc_msgSend(v30, "dateByAddingTimeInterval:", -86400.0, v38, v39, v40);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "dateByAddingTimeInterval:", -604800.0);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_opt_class();
              objc_msgSend(*(id *)(a1 + 56), "timeZone");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v32, v31, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              v36 = *(void **)(a1 + 64);
              objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v25, v35);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "addObjectsFromArray:", v37);

            }
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v27);
        }

        v21 = v39;
        v5 = v40;
        v24 = v38;
      }

      v6 = v44;
    }
    else
    {

    }
  }

}

@end
