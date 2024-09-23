@implementation PGMemoryTriggerSameDayInHistory

- (unint64_t)triggerType
{
  return 4;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
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
  void *v24;
  void *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v27 = 31;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerSameDayInHistory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "localDate");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForLocalDate:inGraph:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v13;
    objc_msgSend(v13, "featureNodeCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "memoryNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)v11;
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 4, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", objc_msgSend(v16, "year"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateNodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "momentNodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "memoryNodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "collectionBySubtracting:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "singleDayValidityIntervalWithContext:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v27 = 44;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerSameDayInHistory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v21, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

@end
