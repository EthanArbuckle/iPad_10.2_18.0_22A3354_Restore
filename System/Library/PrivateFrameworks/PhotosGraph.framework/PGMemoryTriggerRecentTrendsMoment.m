@implementation PGMemoryTriggerRecentTrendsMoment

- (id)trendsSceneFeatureNodesInGraph:(id)a3
{
  PGGraphSceneFeatureNodeCollection *trendsSceneFeatureNodes;
  id v5;
  void *v6;
  PGGraphSceneFeatureNodeCollection *v7;
  PGGraphSceneFeatureNodeCollection *v8;

  trendsSceneFeatureNodes = self->_trendsSceneFeatureNodes;
  if (!trendsSceneFeatureNodes)
  {
    v5 = a3;
    +[PGTrendsMemoryGenerator allTrendSceneFeatureLabels](PGTrendsMemoryGenerator, "allTrendSceneFeatureLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneNames:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneNames:inGraph:", v6, v5);
    v7 = (PGGraphSceneFeatureNodeCollection *)objc_claimAutoreleasedReturnValue();

    v8 = self->_trendsSceneFeatureNodes;
    self->_trendsSceneFeatureNodes = v7;

    trendsSceneFeatureNodes = self->_trendsSceneFeatureNodes;
  }
  return trendsSceneFeatureNodes;
}

- (unint64_t)triggerType
{
  return 27;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphSceneFeatureNodeCollection, "subsetInCollection:", a3);
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v34 = 42;
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentTrendsMoment.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "localDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryTrigger dateNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:](PGMemoryTrigger, "dateNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:", v9, -8, -1, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "momentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryTriggerRecentTrendsMoment trendsSceneFeatureNodesInGraph:](self, "trendsSceneFeatureNodesInGraph:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "momentNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionByIntersecting:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(v16, "featureNodeCollection");
      v28 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "memoryNodes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "memoryNodes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "collectionByIntersecting:", v20);
      v27 = v16;
      v22 = v9;
      v23 = v17;
      v24 = v15;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __90__PGMemoryTriggerRecentTrendsMoment_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v30[3] = &unk_1E8431A78;
      v30[4] = self;
      v31 = v8;
      v32 = v29;
      objc_msgSend(v25, "enumerateIdentifiersAsCollectionsWithBlock:", v30);

      v15 = v24;
      v17 = v23;
      v9 = v22;
      v16 = v27;

      v14 = v28;
    }
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0, v27))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v34 = 75;
        v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentTrendsMoment.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v29;
    }

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendsSceneFeatureNodes, 0);
}

void __90__PGMemoryTriggerRecentTrendsMoment_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localDateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "dateByAddingTimeInterval:", 86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", 691200.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 48);
  objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v4, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObjectsFromArray:", v14);
}

@end
