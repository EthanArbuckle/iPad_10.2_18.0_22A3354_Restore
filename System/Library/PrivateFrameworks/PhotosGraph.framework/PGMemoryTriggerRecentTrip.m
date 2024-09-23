@implementation PGMemoryTriggerRecentTrip

- (unint64_t)triggerType
{
  return 14;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", a3);
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
  id v23;
  id v24;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
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
      v32 = 38;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentTrip.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v8, "localDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryTrigger dateNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:](PGMemoryTrigger, "dateNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:", v9, -8, -1, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v14;
    objc_msgSend(v14, "momentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "highlightNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v16;
    objc_msgSend(v16, "momentNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "memoryNodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 19, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 18, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "collectionByFormingUnionWith:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "collectionByIntersecting:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __82__PGMemoryTriggerRecentTrip_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v28[3] = &unk_1E8431A78;
    v28[4] = self;
    v29 = v8;
    v24 = v23;
    v30 = v24;
    objc_msgSend(v22, "enumerateIdentifiersAsCollectionsWithBlock:", v28);
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v32 = 63;
        v33 = 2080;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentTrip.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v24;
    }

  }
  return v11;
}

void __82__PGMemoryTriggerRecentTrip_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  id v17;

  v4 = a3;
  objc_msgSend(v4, "featureNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", v5);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "highlightNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localDateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dateByAddingTimeInterval:", 691200.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "timeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 48);
  objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v4, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addObjectsFromArray:", v16);
}

@end
