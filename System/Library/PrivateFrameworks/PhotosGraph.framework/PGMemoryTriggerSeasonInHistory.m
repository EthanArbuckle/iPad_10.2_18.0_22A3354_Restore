@implementation PGMemoryTriggerSeasonInHistory

- (unint64_t)triggerType
{
  return 9;
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    objc_msgSend(v7, "localDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 12, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "month");
    v14 = objc_msgSend(v12, "year");
    objc_msgSend(MEMORY[0x1E0D4B130], "seasonNameForLocalDate:locale:", v11, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v37 = 46;
        v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerSeasonInHistory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_27;
    }
    v32 = v12;
    if (v13 == 12)
      v16 = v14 + 1;
    else
      v16 = v14;
    v35 = v15;
    +[PGGraphSeasonNodeCollection seasonNodesForSeasonName:inGraph:](PGGraphSeasonNodeCollection, "seasonNodesForSeasonName:inGraph:", v15, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", v16, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v17;
    objc_msgSend(v17, "featureNodeCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "memoryNodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v18;
    objc_msgSend(v18, "featureNodeCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "memoryNodes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "collectionBySubtracting:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v23;
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "localStartDateForNextSeasonAfterLocalDate:", v11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dateByAddingTimeInterval:", -0.01);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "localStartSeasonDateForLocalDate:", v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_opt_class();
      objc_msgSend(v7, "timeZone");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v26, v25, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v37 = 65;
          v38 = 2080;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerSeasonInHistory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v24, v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
      {
        v15 = v35;
        v12 = v32;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v37 = 57;
          v38 = 2080;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerSeasonInHistory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_26;
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
    v15 = v35;
    v12 = v32;
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v37 = 32;
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "oryTriggers/PGMemoryTriggerSeasonInHistory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = (void *)MEMORY[0x1E0C9AA60];
LABEL_28:

  return v10;
}

@end
