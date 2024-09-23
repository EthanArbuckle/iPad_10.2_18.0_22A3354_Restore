@implementation PGMemoryTriggerRecentMeaningfulEvent

- (unint64_t)triggerType
{
  return 19;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", a3);
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
  id v21;
  id v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  PGMemoryTriggerRecentMeaningfulEvent *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v36 = 31;
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentMeaningfulEvent.m";
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

    v28 = v14;
    objc_msgSend(v14, "momentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryTriggerRecentMeaningfulEvent meaningNodesSupportedForTriggerInGraph:](self, "meaningNodesSupportedForTriggerInGraph:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "momentNodes");
    v27 = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionByIntersecting:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "memoryNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 16, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionByIntersecting:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 17, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v29[3] = &unk_1E84327F8;
    v30 = v20;
    v31 = v9;
    v32 = self;
    v33 = v8;
    v22 = v21;
    v34 = v22;
    v23 = v20;
    objc_msgSend(v19, "enumerateIdentifiersAsCollectionsWithBlock:", v29);
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v36 = 90;
        v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentMeaningfulEvent.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v22;
    }

  }
  return v11;
}

- (id)meaningNodesSupportedForTriggerInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeaningNodeCollection, "nodesInGraph:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("HolidayEvent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collectionBySubtracting:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PGGraphFeatureNodeCollection *v13;
  PGGraphMemoryNodeCollection *v14;
  uint64_t v15;
  PGGraphMemoryNodeCollection *v16;
  PGGraphMemoryNodeCollection *v17;
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
  id v29;
  _QWORD v30[4];
  PGGraphFeatureNodeCollection *v31;

  v29 = a3;
  objc_msgSend(v29, "featureNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "featureNodeCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "memoryNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionByIntersecting:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v5, "meaningLabels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMeaningAggregationMemoryGenerator featureRelationWithMeaningLabel:](PGMeaningAggregationMemoryGenerator, "featureRelationWithMeaningLabel:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v29, "momentNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFeatureNodeCollection, "nodesRelatedToNodes:withRelation:", v12, v11);
      v13 = (PGGraphFeatureNodeCollection *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = -[MAElementCollection initWithGraph:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:", *(_QWORD *)(a1 + 40));
    }
    v14 = -[MAElementCollection initWithGraph:]([PGGraphMemoryNodeCollection alloc], "initWithGraph:", *(_QWORD *)(a1 + 40));
    if (-[MAElementCollection count](v13, "count"))
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
      v30[3] = &unk_1E8432790;
      v31 = v13;
      objc_msgSend(v8, "filteredCollectionUsingBlock:", v30);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (PGGraphMemoryNodeCollection *)v15;
    }
    if (-[MAElementCollection count](v14, "count"))
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v8, "filteredCollectionUsingBlock:", &__block_literal_global_55631);
      v16 = (PGGraphMemoryNodeCollection *)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    v8 = v17;
  }
  objc_msgSend(v29, "momentNodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dateNodes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localDateInterval");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "dateByAddingTimeInterval:", 691200.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 56), "timeZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v21, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "collectionByFormingUnionWith:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(a1 + 64);
  objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v26, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObjectsFromArray:", v28);

}

uint64_t __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "featureNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "intersectsCollection:", v3);

  return v4;
}

BOOL __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "featureNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 2;

  return v3;
}

@end
