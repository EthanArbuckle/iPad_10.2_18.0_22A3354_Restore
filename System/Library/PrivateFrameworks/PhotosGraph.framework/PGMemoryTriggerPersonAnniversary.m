@implementation PGMemoryTriggerPersonAnniversary

- (unint64_t)triggerType
{
  return 15;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureNodeCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
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
  void *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v25 = 30;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerPersonAnniversary.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "localDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForLocalDate:inGraph:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "anniversaryPersonNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "featureNodeCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "memoryNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "filteredCollectionUsingBlock:", &__block_literal_global_50919);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      v23 = v12;
      +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "featureNodeCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "memoryNodes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "collectionBySubtracting:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "singleDayValidityIntervalWithContext:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v25 = 44;
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerPersonAnniversary.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v20, v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v23;

    }
    else
    {
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v25 = 37;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerPersonAnniversary.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
      v20 = v16;
    }

  }
  return v10;
}

BOOL __89__PGMemoryTriggerPersonAnniversary_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "featureNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 1;

  return v4;
}

@end
