@implementation PGPlaceAreaMemoryGenerator

- (PGPlaceAreaMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGPlaceAreaMemoryGenerator *v3;
  PGPlaceAreaMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGPlaceAreaMemoryGenerator;
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
  return 14;
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
    return 9003;
  v3 = a3;
  if (a3 == 3)
    return 9004;
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
  id v7;
  void *v8;
  void *v9;
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
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PGPlaceAreaMemoryGenerator _addressNodesByAreaNodeInGraph:](self, "_addressNodesByAreaNodeInGraph:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphAreaNode addressOfArea](PGGraphAreaNode, "addressOfArea");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  +[PGGraphAddressNode momentOfAddress](PGGraphAddressNode, "momentOfAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chain:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D429D8];
  objc_msgSend(v8, "sources");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "adjacencyWithSources:relation:targetsClass:", v15, v13, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addressNodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "momentNodes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subtractingTargetsWith:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__PGPlaceAreaMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v22[3] = &unk_1E8428BF0;
  v23 = v6;
  v21 = v6;
  objc_msgSend(v20, "enumerateTargetsBySourceWithBlock:", v22);

}

- (id)_addressNodesByAreaNodeInGraph:(id)a3
{
  MABinaryAdjacency *addressNodesByAreaNode;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MABinaryAdjacency *v14;
  MABinaryAdjacency *v15;

  addressNodesByAreaNode = self->_addressNodesByAreaNode;
  if (!addressNodesByAreaNode)
  {
    v5 = a3;
    objc_msgSend(v5, "supersetCityNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphAreaNode nonBlockedFilter](PGGraphAreaNode, "nonBlockedFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNamedLocationNode filterBySettingNameNotEmptyPropertyOnFilter:](PGGraphNamedLocationNode, "filterBySettingNameNotEmptyPropertyOnFilter:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphAreaNodeCollection, "nodesMatchingFilter:inGraph:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphAreaNode addressOfArea](PGGraphAreaNode, "addressOfArea");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "adjacencyWithSources:relation:targetsClass:", v10, v12, objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "subtractingTargetsWith:", v7);
    v14 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v15 = self->_addressNodesByAreaNode;
    self->_addressNodesByAreaNode = v14;

    addressNodesByAreaNode = self->_addressNodesByAreaNode;
  }
  return addressNodesByAreaNode;
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
    +[PGGraphNodeCollection subsetInCollection:](PGGraphAreaNodeCollection, "subsetInCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPlaceAreaMemoryGenerator _addressNodesByAreaNodeInGraph:](self, "_addressNodesByAreaNodeInGraph:", v9);
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
  v7.super_class = (Class)PGPlaceAreaMemoryGenerator;
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
  +[PGGraphNodeCollection subsetInCollection:](PGGraphAreaNodeCollection, "subsetInCollection:", v12);
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
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[PGPlaceAreaMemoryGenerator] One AOI node expected, found %d", (uint8_t *)v23, 8u);
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
  +[PGGraphNodeCollection subsetInCollection:](PGGraphAreaNodeCollection, "subsetInCollection:", v11);
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
  objc_storeStrong((id *)&self->_addressNodesByAreaNode, 0);
}

void __84__PGPlaceAreaMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
