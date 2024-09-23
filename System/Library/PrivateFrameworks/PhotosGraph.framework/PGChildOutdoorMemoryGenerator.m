@implementation PGChildOutdoorMemoryGenerator

- (PGChildOutdoorMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGChildOutdoorMemoryGenerator *v3;
  PGChildOutdoorMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  uint64_t v11;
  PGOverTheYearsMemoryConfiguration *fallbackOverTheYearsConfiguration;
  uint64_t v13;
  PGFeaturedTimePeriodMemoryConfiguration *fallbackFeaturedYearConfiguration;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PGChildOutdoorMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v16, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v4->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 2);
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
    v4->_minimumNumberOfDefaultMemories = 3;
    +[PGOverTheYearsMemoryConfiguration defaultFallbackOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultFallbackOverTheYearsMemoryConfiguration");
    v11 = objc_claimAutoreleasedReturnValue();
    fallbackOverTheYearsConfiguration = v4->_fallbackOverTheYearsConfiguration;
    v4->_fallbackOverTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v11;

    +[PGFeaturedTimePeriodMemoryConfiguration defaultFallbackFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFallbackFeaturedYearMemoryConfiguration");
    v13 = objc_claimAutoreleasedReturnValue();
    fallbackFeaturedYearConfiguration = v4->_fallbackFeaturedYearConfiguration;
    v4->_fallbackFeaturedYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v13;

  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 30;
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
    return 15005;
  v3 = a3;
  if (a3 == 3)
    return 15006;
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

- (id)outdoorROINodesInGraph:(id)a3
{
  PGGraphROINodeCollection *outdoorROINodes;
  PGGraphROINodeCollection *v5;
  PGGraphROINodeCollection *v6;

  outdoorROINodes = self->_outdoorROINodes;
  if (!outdoorROINodes)
  {
    +[PGMemoryGeneratorUtils outdoorROINodesInGraph:](PGMemoryGeneratorUtils, "outdoorROINodesInGraph:", a3);
    v5 = (PGGraphROINodeCollection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_outdoorROINodes;
    self->_outdoorROINodes = v5;

    outdoorROINodes = self->_outdoorROINodes;
  }
  return outdoorROINodes;
}

- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int v19;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PGOverTimeMemoryGenerator intersectRelevantAssetsForFeatures](self, "intersectRelevantAssetsForFeatures"))
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20[0]) = 0;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Cannot set intersectRelevantAssetsForFeatures=YES and override this superclass method", (uint8_t *)v20, 2u);
    }

  }
  if (objc_msgSend(v6, "count"))
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 1)
    {
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v6, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "graph");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGChildOutdoorMemoryGenerator outdoorROINodesInGraph:](self, "outdoorROINodesInGraph:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v6, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allRelevantAssetUUIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      -[NSObject allRelevantAssetUUIDs](v10, "allRelevantAssetUUIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "intersectSet:", v16);
      v17 = objc_msgSend(v15, "count");

    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_msgSend(v9, "count");
        v20[0] = 67109120;
        v20[1] = v19;
        _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "[PGChildOutdoorMemoryGenerator] One person node expected, found %d", (uint8_t *)v20, 8u);
      }
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
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
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PGMemoryGeneratorUtils babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:](PGMemoryGeneratorUtils, "babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    +[PGMemoryGeneratorUtils outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:useMomentFeatureEdges:](PGMemoryGeneratorUtils, "outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:useMomentFeatureEdges:", v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)MEMORY[0x1E0D42A68];
      +[PGGraphMomentNode featureOfMoment](PGGraphMomentNode, "featureOfMoment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      +[PGGraphPersonNode filter](PGGraphPersonNode, "filter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "relation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chain:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v8, v14, objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "intersectingTargetsWith:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "transposed");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __87__PGChildOutdoorMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
      v18[3] = &unk_1E84294C8;
      v19 = v6;
      objc_msgSend(v17, "enumerateTargetsBySourceWithBlock:", v18);

    }
  }

}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PGChildOutdoorMemoryGenerator;
  v5 = a3;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v11, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReferencePersonLocalIdentifiers:", v9);

  return v6;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  NSObject *v26;
  void *v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v6 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v9, "memoryMomentNodes");
    v13 = objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      -[PGChildOutdoorMemoryGenerator outdoorROINodesInGraph:](self, "outdoorROINodesInGraph:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "allRelevantAssetUUIDs");
        v25 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v15;
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        objc_msgSend(v14, "allRelevantAssetUUIDs");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "intersectSet:", v19);
        objc_msgSend(v18, "allObjects");
        v27 = v14;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:", v20, v21, v10, v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v27;
        v16 = v25;

        v15 = v26;
      }
      else
      {
        -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA237000, v23, OS_LOG_TYPE_ERROR, "[PGChildOutdoorMemoryGenerator] No outdoor ROI moment feature edges found", buf, 2u);
        }

        v22 = 0;
      }

    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "[PGChildOutdoorMemoryGenerator] No person moment feature edges found", buf, 2u);
      }
      v22 = 0;
    }

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v29 = objc_msgSend(v12, "count");
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGChildOutdoorMemoryGenerator] One person node expected, found %d", buf, 8u);
    }
    v22 = 0;
  }

  return v22;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  PGChildOutdoorMemoryTitleGenerator *v13;
  void *v14;
  void *v15;
  void *v16;
  PGChildOutdoorMemoryTitleGenerator *v17;
  void *v18;
  void *v19;
  uint8_t v21[16];

  v9 = a3;
  v10 = a7;
  objc_msgSend(v9, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 1)
  {
    v13 = [PGChildOutdoorMemoryTitleGenerator alloc];
    objc_msgSend(v9, "memoryMomentNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "temporarySet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PGChildOutdoorMemoryTitleGenerator initWithMomentNodes:personNode:type:titleGenerationContext:](v13, "initWithMomentNodes:personNode:type:titleGenerationContext:", v15, v16, 0, v10);

    objc_msgSend(v9, "memoryFeatureNodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count") == 1)
      -[PGTitleGenerator setFeaturedYearNodes:](v17, "setFeaturedYearNodes:", v19);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to generate ChildOutdoor memory title because personNodeAsCollection count is not equal to 1", v21, 2u);
    }
    v17 = 0;
  }

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

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

- (unint64_t)minimumNumberOfDefaultMemories
{
  return self->_minimumNumberOfDefaultMemories;
}

- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3
{
  self->_minimumNumberOfDefaultMemories = a3;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (id)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (id)fallbackOverTheYearsConfiguration
{
  return self->_fallbackOverTheYearsConfiguration;
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (id)fallbackFeaturedYearConfiguration
{
  return self->_fallbackFeaturedYearConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_outdoorROINodes, 0);
}

void __87__PGChildOutdoorMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
