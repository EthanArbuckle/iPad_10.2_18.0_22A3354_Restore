@implementation PGMemoryTriggerUpcomingAnniversary

- (unint64_t)triggerType
{
  return 25;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (id)upcomingAnniversaryDateFromLocalDate:(id)a3 originalAnniversaryDate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D4B130];
  v7 = a3;
  v8 = objc_msgSend(v6, "yearFromDate:", v7);
  objc_msgSend(MEMORY[0x1E0D4B130], "dateBySettingYear:ofDate:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x1E0D4B130], "numberOfDaysBetweenDate:andDate:", v7, v9);

  if (v10 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "dateBySettingYear:ofDate:", v8 + 1, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  return v9;
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
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  PGMemoryTriggerUpcomingAnniversary *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v35 = 48;
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerUpcomingAnniversary.m";
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
    +[PGMemoryTrigger monthDayNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:](PGMemoryTrigger, "monthDayNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:", v9, 1, 3, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anniversaryPersonNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionBySubtracting:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __91__PGMemoryTriggerUpcomingAnniversary_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v27 = &unk_1E842EC10;
    v28 = v15;
    v29 = v9;
    v30 = self;
    v31 = v12;
    v32 = v13;
    v19 = v18;
    v33 = v19;
    v20 = v15;
    v21 = v12;
    v22 = v13;
    objc_msgSend(v17, "enumerateNodesUsingBlock:", &v24);
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0, v24, v25, v26, v27))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v35 = 79;
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerUpcomingAnniversary.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v19;
    }

  }
  return v11;
}

void __91__PGMemoryTriggerUpcomingAnniversary_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__PGMemoryTriggerUpcomingAnniversary_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
  v19[3] = &unk_1E8433910;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v5, "filteredCollectionUsingBlock:", v19);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "memoryNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 1, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionByIntersecting:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "anniversaryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "upcomingAnniversaryDateFromLocalDate:originalAnniversaryDate:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "dateByAddingTimeInterval:", -86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", -259200.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "validityIntervalForLocalStartDate:localEndDate:timeZone:", v14, v13, *(_QWORD *)(a1 + 64));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 72);
  objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v8, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

}

BOOL __91__PGMemoryTriggerUpcomingAnniversary_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "personNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionBySubtracting:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count") == 1;
  return v5;
}

@end
