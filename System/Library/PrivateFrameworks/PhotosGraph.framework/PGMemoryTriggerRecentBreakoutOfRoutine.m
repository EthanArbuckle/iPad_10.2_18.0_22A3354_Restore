@implementation PGMemoryTriggerRecentBreakoutOfRoutine

- (id)neighborScoreComputerWithGraph:(id)a3
{
  PGNeighborScoreComputer *neighborScoreComputer;
  PGNeighborScoreComputer *v5;
  PGNeighborScoreComputer *v6;

  neighborScoreComputer = self->_neighborScoreComputer;
  if (!neighborScoreComputer)
  {
    v5 = objc_alloc_init(PGNeighborScoreComputer);
    v6 = self->_neighborScoreComputer;
    self->_neighborScoreComputer = v5;

    neighborScoreComputer = self->_neighborScoreComputer;
  }
  return neighborScoreComputer;
}

- (unint64_t)triggerType
{
  return 22;
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
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v32 = 45;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentBreakoutOfRoutine.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v8, "localDate");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v12;
    +[PGMemoryTrigger dateNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:](PGMemoryTrigger, "dateNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:", v9, -8, -1, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "momentNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __95__PGMemoryTriggerRecentBreakoutOfRoutine_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v29[3] = &unk_1E842A450;
    v29[4] = self;
    v15 = v9;
    v30 = v15;
    objc_msgSend(v13, "filteredCollectionUsingBlock:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "memoryNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 1, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionByIntersecting:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __95__PGMemoryTriggerRecentBreakoutOfRoutine_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
    v26[3] = &unk_1E8431A78;
    v26[4] = self;
    v27 = v8;
    v21 = v20;
    v28 = v21;
    objc_msgSend(v19, "enumerateIdentifiersAsCollectionsWithBlock:", v26);
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v32 = 72;
        v33 = 2080;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentBreakoutOfRoutine.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v21;
    }

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
}

BOOL __95__PGMemoryTriggerRecentBreakoutOfRoutine_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "neighborScoreComputerWithGraph:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "neighborScoreWithMomentNode:", v6);
  v8 = v7;

  return v8 > 0.6;
}

void __95__PGMemoryTriggerRecentBreakoutOfRoutine_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
  id v15;

  v4 = a3;
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "localDateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateByAddingTimeInterval:", 691200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", 86400.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 48);
  objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v4, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObjectsFromArray:", v14);
}

@end
