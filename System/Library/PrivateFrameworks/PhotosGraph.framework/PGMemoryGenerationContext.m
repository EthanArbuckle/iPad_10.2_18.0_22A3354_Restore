@implementation PGMemoryGenerationContext

- (PGMemoryGenerationContext)initWithPhotoLibrary:(id)a3 userFeedbackCalculator:(id)a4 graph:(id)a5 serviceManager:(id)a6 loggingConnection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PGMemoryProcessedScenesAndFacesCache *v17;
  PGMemoryMomentNodesWithBlockedFeatureCache *v18;
  PGGraphLocationHelper *v19;
  PGMemoryGenerationContext *v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[PGMemoryProcessedScenesAndFacesCache initWithPhotoLibrary:]([PGMemoryProcessedScenesAndFacesCache alloc], "initWithPhotoLibrary:", v16);

  v18 = -[PGMemoryMomentNodesWithBlockedFeatureCache initWithUserFeedbackCalculator:loggingConnection:]([PGMemoryMomentNodesWithBlockedFeatureCache alloc], "initWithUserFeedbackCalculator:loggingConnection:", v15, v12);
  v19 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v14);

  v20 = -[PGMemoryGenerationContext initWithProcessedScenesAndFacesCache:momentNodesWithBlockedFeatureCache:locationHelper:serviceManager:loggingConnection:](self, "initWithProcessedScenesAndFacesCache:momentNodesWithBlockedFeatureCache:locationHelper:serviceManager:loggingConnection:", v17, v18, v19, v13, v12);
  return v20;
}

- (PGMemoryGenerationContext)initWithProcessedScenesAndFacesCache:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4 locationHelper:(id)a5 serviceManager:(id)a6 loggingConnection:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PGMemoryGenerationContext *v17;
  PGMemoryGenerationContext *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PGMemoryGenerationContext;
  v17 = -[PGMemoryGenerationContext init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_processedScenesAndFacesCache, a3);
    objc_storeStrong((id *)&v18->_momentNodesWithBlockedFeatureCache, a4);
    objc_storeStrong((id *)&v18->_locationHelper, a5);
    objc_storeStrong((id *)&v18->_serviceManager, a6);
    objc_storeStrong((id *)&v18->_loggingConnection, a7);
  }

  return v18;
}

- (id)momentNodesAtSensitiveLocationsInGraph:(id)a3
{
  PGGraphMomentNodeCollection *momentNodesAtSensitiveLocations;
  id v5;
  void *v6;
  void *v7;
  PGGraphMomentNodeCollection *v8;
  PGGraphMomentNodeCollection *v9;

  momentNodesAtSensitiveLocations = self->_momentNodesAtSensitiveLocations;
  if (!momentNodesAtSensitiveLocations)
  {
    v5 = a3;
    +[PGGraphMomentNodeCollection momentNodesHappeningAtSensitiveLocationInGraph:](PGGraphMomentNodeCollection, "momentNodesHappeningAtSensitiveLocationInGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGeneratorUtils momentNodesAtHomeOrWorkOrFrequentLocationInGraph:](PGMemoryGeneratorUtils, "momentNodesAtHomeOrWorkOrFrequentLocationInGraph:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "collectionBySubtracting:", v7);
    v8 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
    v9 = self->_momentNodesAtSensitiveLocations;
    self->_momentNodesAtSensitiveLocations = v8;

    momentNodesAtSensitiveLocations = self->_momentNodesAtSensitiveLocations;
  }
  return momentNodesAtSensitiveLocations;
}

- (id)interestingWithAlternateJunkingSubsetFromMomentNodes:(id)a3
{
  id v4;
  PGGraphMomentNodeCollection *momentNodesInterestingWithAlternateJunking;
  void *v6;
  PGGraphMomentNodeCollection *v7;
  PGGraphMomentNodeCollection *v8;
  PGGraphMomentNodeCollection *v9;
  PGGraphMomentNodeCollection *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    momentNodesInterestingWithAlternateJunking = self->_momentNodesInterestingWithAlternateJunking;
    if (!momentNodesInterestingWithAlternateJunking)
    {
      objc_msgSend(v4, "graph");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphMomentNodeCollection momentNodesInterestingWithAlternateJunkingInGraph:](PGGraphMomentNodeCollection, "momentNodesInterestingWithAlternateJunkingInGraph:", v6);
      v7 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
      v8 = self->_momentNodesInterestingWithAlternateJunking;
      self->_momentNodesInterestingWithAlternateJunking = v7;

      momentNodesInterestingWithAlternateJunking = self->_momentNodesInterestingWithAlternateJunking;
    }
    objc_msgSend(v4, "collectionByIntersecting:", momentNodesInterestingWithAlternateJunking);
    v9 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = [PGGraphMomentNodeCollection alloc];
    objc_msgSend(v4, "graph");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAElementCollection initWithGraph:](v10, "initWithGraph:", v11);

  }
  return v9;
}

- (id)interestingForMemoriesSubsetFromMomentNodes:(id)a3
{
  id v4;
  PGGraphMomentNodeCollection *momentNodesInterestingForMemories;
  void *v6;
  PGGraphMomentNodeCollection *v7;
  PGGraphMomentNodeCollection *v8;
  PGGraphMomentNodeCollection *v9;
  PGGraphMomentNodeCollection *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    momentNodesInterestingForMemories = self->_momentNodesInterestingForMemories;
    if (!momentNodesInterestingForMemories)
    {
      objc_msgSend(v4, "graph");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphMomentNodeCollection momentNodesInterestingForMemoriesInGraph:](PGGraphMomentNodeCollection, "momentNodesInterestingForMemoriesInGraph:", v6);
      v7 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
      v8 = self->_momentNodesInterestingForMemories;
      self->_momentNodesInterestingForMemories = v7;

      momentNodesInterestingForMemories = self->_momentNodesInterestingForMemories;
    }
    objc_msgSend(v4, "collectionByIntersecting:", momentNodesInterestingForMemories);
    v9 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = [PGGraphMomentNodeCollection alloc];
    objc_msgSend(v4, "graph");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAElementCollection initWithGraph:](v10, "initWithGraph:", v11);

  }
  return v9;
}

- (unint64_t)numberOfAssetsInExtendedCurationForMomentNodes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *numberOfAssetsInExtendedCurationByMomentNodeIdentifier;
  NSDictionary *v11;
  unint64_t v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  NSDictionary *v20;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = MEMORY[0x1E0C809B0];
    if (!self->_numberOfAssetsInExtendedCurationByMomentNodeIdentifier)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v4, "graph");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = v5;
      v19[1] = 3221225472;
      v19[2] = __76__PGMemoryGenerationContext_numberOfAssetsInExtendedCurationForMomentNodes___block_invoke;
      v19[3] = &unk_1E842E828;
      v9 = (NSDictionary *)v6;
      v20 = v9;
      objc_msgSend(v8, "enumerateNumberOfAssetsInExtendedCurationUsingBlock:", v19);
      numberOfAssetsInExtendedCurationByMomentNodeIdentifier = self->_numberOfAssetsInExtendedCurationByMomentNodeIdentifier;
      self->_numberOfAssetsInExtendedCurationByMomentNodeIdentifier = v9;
      v11 = v9;

    }
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __76__PGMemoryGenerationContext_numberOfAssetsInExtendedCurationForMomentNodes___block_invoke_2;
    v14[3] = &unk_1E84342A8;
    v14[4] = self;
    v14[5] = &v15;
    objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v14);
    v12 = v16[3];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)averageContentScoreForMomentNodes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *contentScoreByMomentNodeIdentifier;
  NSDictionary *v11;
  double v12;
  double v13;
  _QWORD v15[6];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  NSDictionary *v21;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = MEMORY[0x1E0C809B0];
    if (!self->_contentScoreByMomentNodeIdentifier)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v4, "graph");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __63__PGMemoryGenerationContext_averageContentScoreForMomentNodes___block_invoke;
      v20[3] = &unk_1E842D750;
      v9 = (NSDictionary *)v6;
      v21 = v9;
      objc_msgSend(v8, "enumerateContentScoresUsingBlock:", v20);
      contentScoreByMomentNodeIdentifier = self->_contentScoreByMomentNodeIdentifier;
      self->_contentScoreByMomentNodeIdentifier = v9;
      v11 = v9;

    }
    v16 = 0;
    v17 = (double *)&v16;
    v18 = 0x2020000000;
    v19 = 0;
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __63__PGMemoryGenerationContext_averageContentScoreForMomentNodes___block_invoke_2;
    v15[3] = &unk_1E84342A8;
    v15[4] = self;
    v15[5] = &v16;
    objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v15);
    v12 = v17[3];
    v13 = v12 / (double)(unint64_t)objc_msgSend(v4, "count");
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (id)yearNodesByMomentNodeInGraph:(id)a3
{
  MABinaryAdjacency *yearNodesByMomentNode;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MABinaryAdjacency *v12;
  MABinaryAdjacency *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  yearNodesByMomentNode = self->_yearNodesByMomentNode;
  if (!yearNodesByMomentNode)
  {
    -[PGMemoryGenerationContext _yearNodesInGraph:](self, "_yearNodesInGraph:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D42A68];
    +[PGGraphYearNodeCollection dateOfYear](PGGraphYearNodeCollection, "dateOfYear");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    +[PGGraphDateNode momentOfDate](PGGraphDateNode, "momentOfDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chain:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v5, v10, objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transposed");
    v12 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v13 = self->_yearNodesByMomentNode;
    self->_yearNodesByMomentNode = v12;

    yearNodesByMomentNode = self->_yearNodesByMomentNode;
  }
  return yearNodesByMomentNode;
}

- (id)yearNodesForMomentNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerationContext yearNodesByMomentNodeInGraph:](self, "yearNodesByMomentNodeInGraph:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetsForSources:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)yearsForYearNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *yearByYearNodeIdentifier;
  NSDictionary *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  NSDictionary *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_yearByYearNodeIdentifier)
  {
    objc_msgSend(v4, "graph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerationContext _yearNodesInGraph:](self, "_yearNodesInGraph:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __47__PGMemoryGenerationContext_yearsForYearNodes___block_invoke;
    v25[3] = &unk_1E8431D48;
    v9 = (NSDictionary *)v8;
    v26 = v9;
    objc_msgSend(v7, "enumerateYearsUsingBlock:", v25);
    yearByYearNodeIdentifier = self->_yearByYearNodeIdentifier;
    self->_yearByYearNodeIdentifier = v9;
    v11 = v9;

  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "elementIdentifiers", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        -[NSDictionary objectForKeyedSubscript:](self->_yearByYearNodeIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v16);
  }

  return v12;
}

- (id)_yearNodesInGraph:(id)a3
{
  PGGraphYearNodeCollection *yearNodes;
  PGGraphYearNodeCollection *v5;
  PGGraphYearNodeCollection *v6;

  yearNodes = self->_yearNodes;
  if (!yearNodes)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphYearNodeCollection, "nodesInGraph:", a3);
    v5 = (PGGraphYearNodeCollection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_yearNodes;
    self->_yearNodes = v5;

    yearNodes = self->_yearNodes;
  }
  return yearNodes;
}

- (PGMemoryProcessedScenesAndFacesCache)processedScenesAndFacesCache
{
  return self->_processedScenesAndFacesCache;
}

- (PGMemoryMomentNodesWithBlockedFeatureCache)momentNodesWithBlockedFeatureCache
{
  return self->_momentNodesWithBlockedFeatureCache;
}

- (PGGraphLocationHelper)locationHelper
{
  return self->_locationHelper;
}

- (CLSServiceManager)serviceManager
{
  return self->_serviceManager;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeatureCache, 0);
  objc_storeStrong((id *)&self->_processedScenesAndFacesCache, 0);
  objc_storeStrong((id *)&self->_yearNodes, 0);
  objc_storeStrong((id *)&self->_yearByYearNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_yearNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_contentScoreByMomentNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_numberOfAssetsInExtendedCurationByMomentNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_momentNodesInterestingForMemories, 0);
  objc_storeStrong((id *)&self->_momentNodesInterestingWithAlternateJunking, 0);
  objc_storeStrong((id *)&self->_momentNodesAtSensitiveLocations, 0);
}

void __47__PGMemoryGenerationContext_yearsForYearNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

void __63__PGMemoryGenerationContext_averageContentScoreForMomentNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

void __63__PGMemoryGenerationContext_averageContentScoreForMomentNodes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

void __76__PGMemoryGenerationContext_numberOfAssetsInExtendedCurationForMomentNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

void __76__PGMemoryGenerationContext_numberOfAssetsInExtendedCurationForMomentNodes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v4, "unsignedIntegerValue");

}

@end
