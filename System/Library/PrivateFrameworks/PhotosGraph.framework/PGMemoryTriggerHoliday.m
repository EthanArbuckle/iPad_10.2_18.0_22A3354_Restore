@implementation PGMemoryTriggerHoliday

- (unint64_t)triggerType
{
  return 1;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  PGGraphMemoryNodeCollection *v18;
  PGGraphMemoryNodeCollection *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v29 = 32;
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerHoliday.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    -[PGHolidayMemoryTrigger holidayService](self, "holidayService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __79__PGMemoryTriggerHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v25 = &unk_1E8431A50;
    v16 = v9;
    v26 = v16;
    v17 = v12;
    v27 = v17;
    objc_msgSend(v13, "enumerateEventRulesForAllCountriesBetweenLocalDate:andLocalDate:usingBlock:", v14, v15, &v22);

    v18 = [PGGraphMemoryNodeCollection alloc];
    v19 = -[MAElementCollection initWithGraph:elementIdentifiers:](v18, "initWithGraph:elementIdentifiers:", v16, v17, v22, v23, v24, v25);
    objc_msgSend((id)objc_opt_class(), "singleDayValidityIntervalWithContext:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v29 = 40;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerHoliday.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v19, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v11;
}

void __79__PGMemoryTriggerHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHolidayNodeCollection holidayNodesWithName:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithName:inGraph:", v3, *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  objc_msgSend(v8, "featureNodeCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memoryNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionWithIdentifierSet:", v7);

}

@end
