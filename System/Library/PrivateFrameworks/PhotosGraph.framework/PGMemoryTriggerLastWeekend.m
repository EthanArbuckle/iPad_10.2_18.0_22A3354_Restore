@implementation PGMemoryTriggerLastWeekend

- (unint64_t)triggerType
{
  return 20;
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
  uint64_t v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  double v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v33 = 34;
      v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerLastWeekend.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "localDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D4B148], "isWeekendDate:", v11))
    {
      objc_msgSend(v11, "dateByAddingTimeInterval:", -86400.0);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    v30 = 0;
    v31 = 0.0;
    objc_msgSend(MEMORY[0x1E0D4B148], "nextWeekendLocalStartDate:interval:options:afterDate:", &v30, &v31, 4, v11);
    v13 = v31;
    v14 = v30;
    objc_msgSend(v14, "dateByAddingTimeInterval:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v15);
    +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "memoryNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v8;
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 1, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionByIntersecting:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0D4B148], "nextWeekendLocalStartDate:interval:options:afterDate:", &v28, &v29, 0, v15);
    v19 = v28;
    v20 = (void *)objc_opt_class();
    v24 = v7;
    objc_msgSend(v7, "timeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v15, v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v33 = 62;
        v34 = 2080;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerLastWeekend.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v18, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v24;

    v8 = v27;
  }

  return v10;
}

@end
