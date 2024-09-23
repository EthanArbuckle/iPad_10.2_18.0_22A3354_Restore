@implementation PGMemoryTriggerRecentHolidayCelebration

- (unint64_t)triggerType
{
  return 12;
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  PGGraphMemoryNodeCollection *v29;
  id v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v44 = 42;
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentHolidayCelebration.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v8, "localDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v12;
    objc_msgSend(v13, "universalDateFromLocalDate:inTimeZone:", v12, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -10, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -3, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v16;
    objc_msgSend(v18, "localDateFromUniversalDate:inTimeZone:", v16, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v17;
    objc_msgSend(v21, "localDateFromUniversalDate:inTimeZone:", v17, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    -[PGHolidayMemoryTrigger holidayService](self, "holidayService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __96__PGMemoryTriggerRecentHolidayCelebration_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v40[3] = &unk_1E8431A50;
    v27 = v9;
    v41 = v27;
    v28 = v24;
    v42 = v28;
    objc_msgSend(v25, "enumerateEventRulesForAllCountriesBetweenLocalDate:andLocalDate:usingBlock:", v20, v23, v40);

    v29 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMemoryNodeCollection alloc], "initWithGraph:elementIdentifiers:", v27, v28);
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37[0] = v26;
    v37[1] = 3221225472;
    v37[2] = __96__PGMemoryTriggerRecentHolidayCelebration_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
    v37[3] = &unk_1E8431A78;
    v37[4] = self;
    v38 = v8;
    v31 = v30;
    v39 = v31;
    -[MAElementCollection enumerateIdentifiersAsCollectionsWithBlock:](v29, "enumerateIdentifiersAsCollectionsWithBlock:", v37);
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v44 = 88;
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentHolidayCelebration.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v31;
    }

  }
  return v11;
}

void __96__PGMemoryTriggerRecentHolidayCelebration_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHolidayNodeCollection holidayNodesWithName:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithName:inGraph:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v7;
  objc_msgSend(v7, "featureNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "memoryNodes");
  v9 = objc_claimAutoreleasedReturnValue();

  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 16, *(_QWORD *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v9;
  objc_msgSend(v22, "collectionByIntersecting:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14)), *(_QWORD *)(a1 + 32));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateNodes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "momentNodes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "memoryNodes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "elementIdentifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "elementIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifierSetByIntersectingIdentifierSet:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "unionWithIdentifierSet:", v21);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

}

void __96__PGMemoryTriggerRecentHolidayCelebration_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v19;

  v4 = a3;
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "featureNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphHolidayNodeCollection, "subsetInCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "collectionByIntersecting:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dateByAddingTimeInterval:", 864000.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", 259200.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v13, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(void **)(a1 + 48);
  objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v4, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addObjectsFromArray:", v18);
}

@end
