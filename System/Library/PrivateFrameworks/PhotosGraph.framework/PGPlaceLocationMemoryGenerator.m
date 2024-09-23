@implementation PGPlaceLocationMemoryGenerator

- (PGPlaceLocationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGPlaceLocationMemoryGenerator *v3;
  PGPlaceLocationMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGPlaceLocationMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v12, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setFilterUninterestingForMemories:](v4->_momentRequirements, "setFilterUninterestingForMemories:", 1);
    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v4->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
    +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "strictDefaultOverTheYearsMemoryConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_overTheYearsConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
    +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "strictDefaultFeaturedYearMemoryConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_featuredYearConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 12;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return 9001;
  v3 = a3;
  if (a3 == 3)
    return 9002;
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = v3;
    _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);

  }
  return 0;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  -[PGPlaceLocationMemoryGenerator _addressNodesByCityNodeInGraph:](self, "_addressNodesByCityNodeInGraph:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D429D8];
  objc_msgSend(v12, "sources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationCityNode momentInCity](PGGraphLocationCityNode, "momentInCity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", v8, v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__PGPlaceLocationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v13[3] = &unk_1E8431258;
  v14 = v6;
  v11 = v6;
  objc_msgSend(v10, "enumerateTargetsBySourceWithBlock:", v13);

}

- (id)_addressNodesByCityNodeInGraph:(id)a3
{
  MABinaryAdjacency *addressNodesByCityNode;
  id v5;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PGGraphAddressNodeCollection *v20;
  MABinaryAdjacency *v21;
  MABinaryAdjacency *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  addressNodesByCityNode = self->_addressNodesByCityNode;
  if (!addressNodesByCityNode)
  {
    v5 = a3;
    objc_msgSend(v5, "interestingCityNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphLocationCityNode filter](PGGraphLocationCityNode, "filter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNamedLocationNode filterBySettingNameNotEmptyPropertyOnFilter:](PGGraphNamedLocationNode, "filterBySettingNameNotEmptyPropertyOnFilter:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "relation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationCityNodeCollection, "nodesRelatedToNodes:withRelation:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addressNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preciseSubset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "meNodeCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "homeOrWorkNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addressNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "collectionBySubtracting:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphEdgeCollection edgesToNodes:](PGGraphAddressEdgeCollection, "edgesToNodes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__PGPlaceLocationMemoryGenerator__addressNodesByCityNodeInGraph___block_invoke;
    v27[3] = &unk_1E8431280;
    v28 = v15;
    v16 = v15;
    objc_msgSend(v14, "enumerateEdgesUsingBlock:", v27);
    v17 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphLocationCityNode addressOfCity](PGGraphLocationCityNode, "addressOfCity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "adjacencyWithSources:relation:targetsClass:", v9, v18, objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphAddressNodeCollection alloc], "initWithGraph:elementIdentifiers:", v5, v16);
    objc_msgSend(v19, "intersectingTargetsWith:", v20);
    v21 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v22 = self->_addressNodesByCityNode;
    self->_addressNodesByCityNode = v21;

    addressNodesByCityNode = self->_addressNodesByCityNode;
  }
  return addressNodesByCityNode;
}

- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationCityNodeCollection, "subsetInCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPlaceLocationMemoryGenerator _addressNodesByCityNodeInGraph:](self, "_addressNodesByCityNodeInGraph:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetsForSources:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:toNodes:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "numberOfAssets");

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGPlaceLocationMemoryGenerator;
  -[PGMemoryGenerator curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:](&v7, sel_curationOptionsWithRequiredAssetUUIDs_eligibleAssetUUIDs_triggeredMemory_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfItems:", 15);
  objc_msgSend(v5, "setFailIfMinimumDurationNotReached:", 1);
  return v5;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
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
  NSObject *v21;
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationCityNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v9, "memoryMomentNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "curationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curationManager:progressReporter:](PGMemoryGenerationHelper, "assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curationManager:progressReporter:", v14, v15, 0, v17, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v18, v19, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 67109120;
      v23[1] = objc_msgSend(v13, "count");
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[PGPlaceLocationMemoryGenerator] One city node expected, %d found", (uint8_t *)v23, 8u);
    }

    v20 = 0;
  }

  return v20;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGPlaceMemoryTitleGenerator *v14;
  void *v15;
  void *v16;
  PGPlaceMemoryTitleGenerator *v17;
  void *v18;

  v9 = a7;
  v10 = a3;
  objc_msgSend(v10, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationCityNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "memoryMomentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [PGPlaceMemoryTitleGenerator alloc];
  objc_msgSend(v13, "temporarySet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyNode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGPlaceMemoryTitleGenerator initWithMomentNodes:placeNode:titleGenerationContext:](v14, "initWithMomentNodes:placeNode:titleGenerationContext:", v15, v16, v9);

  +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count") == 1)
    -[PGTitleGenerator setFeaturedYearNodes:](v17, "setFeaturedYearNodes:", v18);

  return v17;
}

- (BOOL)requireSceneProcessingMeetsThresholdOverTime
{
  return self->_requireSceneProcessingMeetsThresholdOverTime;
}

- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireSceneProcessingMeetsThresholdOverTime = a3;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (id)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_addressNodesByCityNode, 0);
}

void __65__PGPlaceLocationMemoryGenerator__addressNodesByCityNodeInGraph___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "relevance");
  if (v3 == 1.0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "targetNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addIdentifier:", objc_msgSend(v5, "identifier"));

  }
}

void __88__PGPlaceLocationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "featureNodeCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);

}

@end
