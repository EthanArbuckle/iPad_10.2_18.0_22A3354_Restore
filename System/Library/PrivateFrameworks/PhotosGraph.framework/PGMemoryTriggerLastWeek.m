@implementation PGMemoryTriggerLastWeek

- (unint64_t)triggerType
{
  return 21;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v30 = 33;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerLastWeek.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "localDate");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v7, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v11;
    objc_msgSend(v12, "universalDateFromLocalDate:inTimeZone:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v14;
    objc_msgSend(v14, "dateByAddingTimeInterval:", -604800.0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v7, "timeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v15;
    objc_msgSend(v16, "localDateFromUniversalDate:inTimeZone:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dateNodesForLocalDate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "momentNodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "memoryNodes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 1, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "collectionByIntersecting:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "singleDayValidityIntervalWithContext:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v30 = 46;
        v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerLastWeek.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v23, v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

@end
