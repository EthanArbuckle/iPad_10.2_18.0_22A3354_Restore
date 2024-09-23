@implementation PGPlaceRegionMemoryGenerator

- (PGPlaceRegionMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGPlaceRegionMemoryGenerator *v3;
  PGPlaceRegionMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGPlaceRegionMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v12, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setFilterUninterestingForMemories:](v4->_momentRequirements, "setFilterUninterestingForMemories:", 1);
    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v4->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 1);
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
  return 13;
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
    return 10001;
  v3 = a3;
  if (a3 == 3)
    return 10002;
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
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphROINodeCollection, "nodesInGraph:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjacencyWithSources:relation:targetsClass:", v10, v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__PGPlaceRegionMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v11[3] = &unk_1E842AD78;
  v12 = v5;
  v9 = v5;
  objc_msgSend(v8, "enumerateTargetsBySourceWithBlock:", v11);

}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)relevantFeederWithScenedAssetLocalIdentifiers:(id)a3 assetFetchResult:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v23[16];

  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "fetchedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCurationManager filteredAssetsFromAssets:withContextualAssetLocalIdentifiers:approximateTimeDistance:](PGCurationManager, "filteredAssetsFromAssets:withContextualAssetLocalIdentifiers:approximateTimeDistance:", v12, v13, 300.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    v15 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v9, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchPropertySets");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, v16, 0, v17, 0, 0);

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
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[PGPlaceRegionMemoryGenerator] No extended scened assets found", v23, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGPlaceRegionMemoryGenerator;
  -[PGMemoryGenerator curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:](&v7, sel_curationOptionsWithRequiredAssetUUIDs_eligibleAssetUUIDs_triggeredMemory_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfItems:", 15);
  objc_msgSend(v5, "setFailIfMinimumDurationNotReached:", 1);
  return v5;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  id v8;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _BOOL4 v28;
  id v29;
  void *v30;

  v28 = a5;
  v29 = a4;
  v8 = a3;
  objc_msgSend(v8, "memoryFeatureNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphROINodeCollection, "subsetInCollection:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "memoryMomentNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v10, v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "allRelevantAssetLocalIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v8, "memoryMomentNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "localIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchAssetCollectionsWithLocalIdentifiers:options:", v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "curationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "defaultAssetFetchOptionsForMemories");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setIncludeGuestAssets:", v28);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollections:options:", v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPlaceRegionMemoryGenerator relevantFeederWithScenedAssetLocalIdentifiers:assetFetchResult:graph:allowGuestAsset:](self, "relevantFeederWithScenedAssetLocalIdentifiers:assetFetchResult:graph:allowGuestAsset:", v12, v24, v29, v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _DWORD v22[2];
  uint64_t v23;

  v7 = a6;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphROINodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") != 1)
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22[0] = 67109120;
      v22[1] = objc_msgSend(v13, "count");
      _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "[PGPlaceRegionMemoryGenerator] One ROI node expected, found %d", (uint8_t *)v22, 8u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v10, "memoryMomentNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v14, v13);
  v15 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject count](v15, "count"))
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22[0]) = 0;
      _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "[PGPlaceRegionMemoryGenerator] No moment feature edges found", (uint8_t *)v22, 2u);
    }

LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  -[NSObject allRelevantAssetLocalIdentifiers](v15, "allRelevantAssetLocalIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:", v17, v18, v11, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v19;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGPlaceRegionMemoryTitleGenerator *v14;
  void *v15;
  void *v16;
  PGPlaceRegionMemoryTitleGenerator *v17;
  void *v18;

  v9 = a7;
  v10 = a3;
  objc_msgSend(v10, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphROINodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "memoryMomentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [PGPlaceRegionMemoryTitleGenerator alloc];
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
}

void __86__PGPlaceRegionMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
