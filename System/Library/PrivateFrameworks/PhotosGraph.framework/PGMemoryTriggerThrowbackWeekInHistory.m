@implementation PGMemoryTriggerThrowbackWeekInHistory

- (unint64_t)triggerType
{
  return 11;
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
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  PGGraphMemoryNodeCollection *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
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
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v42 = 34;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerThrowbackWeekInHistory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "localDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 8220, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "year");
    v35 = v12;
    +[PGGraphWeekOfYearNodeCollection weekOfYearNodesForWeekOfYear:inGraph:](PGGraphWeekOfYearNodeCollection, "weekOfYearNodesForWeekOfYear:inGraph:", objc_msgSend(v12, "weekOfYear"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 1, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    +[PGGraphNodeCollection nodesInGraph:](PGGraphYearNodeCollection, "nodesInGraph:", v8);
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __94__PGMemoryTriggerThrowbackWeekInHistory_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v36[3] = &unk_1E842D700;
    v40 = v13;
    v20 = v15;
    v37 = v20;
    v21 = v16;
    v38 = v21;
    v22 = v17;
    v39 = v22;
    v34 = v19;
    objc_msgSend(v19, "enumerateIdentifiersAsCollectionsWithBlock:", v36);
    if (objc_msgSend(v22, "count"))
    {
      v33 = v21;
      v31 = v8;
      v23 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMemoryNodeCollection alloc], "initWithGraph:elementIdentifiers:", v8, v22);
      objc_msgSend(MEMORY[0x1E0D4B130], "endOfWeekForDate:", v11);
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "startOfWeekForDate:", v11);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_opt_class();
      objc_msgSend(v18, "timeZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v25;
      v32 = (void *)v24;
      objc_msgSend(v26, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v25, v24, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v18;
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v42 = 67;
          v43 = 2080;
          v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerThrowbackWeekInHistory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v23, v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v31;

      v21 = v33;
    }
    else
    {
      v7 = v18;
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v42 = 59;
        v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerThrowbackWeekInHistory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v10;
}

void __94__PGMemoryTriggerThrowbackWeekInHistory_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "calendarUnitValue");
  v6 = a1[7] - 2;

  if (v5 <= v6)
  {
    v7 = (void *)a1[4];
    objc_msgSend(v15, "dateNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionByIntersecting:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "momentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "memoryNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "collectionByIntersecting:", a1[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)a1[6];
    objc_msgSend(v12, "elementIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionWithIdentifierSet:", v14);

  }
}

@end
