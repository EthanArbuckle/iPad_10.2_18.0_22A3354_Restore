@implementation PGMemoryTriggerSameWeekInHistory

- (unint64_t)triggerType
{
  return 7;
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
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v34 = 32;
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerSameWeekInHistory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "localDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 8196, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "year");
    v32 = v12;
    +[PGGraphWeekOfYearNodeCollection weekOfYearNodesForWeekOfYear:inGraph:](PGGraphWeekOfYearNodeCollection, "weekOfYearNodesForWeekOfYear:inGraph:", objc_msgSend(v12, "weekOfYear"), v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dateNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "monthDayNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v15;
    objc_msgSend(v15, "featureNodeCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "memoryNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", v13, v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dateNodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "momentNodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "memoryNodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "collectionBySubtracting:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "endOfWeekForDate:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v11;
      objc_msgSend(MEMORY[0x1E0D4B130], "startOfWeekForDate:", v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_opt_class();
      objc_msgSend(v7, "timeZone");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v23, v22, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v34 = 57;
          v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerSameWeekInHistory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v21, v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v28;

    }
    else
    {
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v34 = 50;
        v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerSameWeekInHistory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v10;
}

@end
