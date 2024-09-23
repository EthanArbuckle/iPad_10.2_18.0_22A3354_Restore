@implementation PGChildActivityMemoryGenerator

- (PGChildActivityMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGChildActivityMemoryGenerator *v3;
  PGChildActivityMemoryGenerator *v4;
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
  v16.super_class = (Class)PGChildActivityMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v16, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v4->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 3);
    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v4->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
    +[PGOverTheYearsMemoryConfiguration defaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultOverTheYearsMemoryConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v4->_overTheYearsConfiguration, "setMinimumNumberOfMoments:", 2);
    -[PGOverTheYearsMemoryConfiguration setMinimumNumberOfMomentsForTwoConsecutiveYears:](v4->_overTheYearsConfiguration, "setMinimumNumberOfMomentsForTwoConsecutiveYears:", 4);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_overTheYearsConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
    +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFeaturedYearMemoryConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v4->_featuredYearConfiguration, "setMinimumNumberOfMoments:", 4);
    -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v4->_featuredYearConfiguration, "setMinimumMomentSpreadicityTimeInterval:", 604800.0);
    -[PGOverTimeMemoryConfiguration setMinimumOverallTimeIntervalOfMoments:](v4->_featuredYearConfiguration, "setMinimumOverallTimeIntervalOfMoments:", 7889400.0);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_featuredYearConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
    v4->_minimumNumberOfDefaultMemories = 3;
    +[PGOverTheYearsMemoryConfiguration defaultFallbackOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultFallbackOverTheYearsMemoryConfiguration");
    v11 = objc_claimAutoreleasedReturnValue();
    fallbackOverTheYearsConfiguration = v4->_fallbackOverTheYearsConfiguration;
    v4->_fallbackOverTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v11;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v4->_fallbackOverTheYearsConfiguration, "setMinimumNumberOfMoments:", 2);
    +[PGFeaturedTimePeriodMemoryConfiguration defaultFallbackFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFallbackFeaturedYearMemoryConfiguration");
    v13 = objc_claimAutoreleasedReturnValue();
    fallbackFeaturedYearConfiguration = v4->_fallbackFeaturedYearConfiguration;
    v4->_fallbackFeaturedYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v13;

    -[PGOverTimeMemoryConfiguration setMinimumOverallTimeIntervalOfMoments:](v4->_fallbackFeaturedYearConfiguration, "setMinimumOverallTimeIntervalOfMoments:", 7889400.0);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 25;
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
    return 15001;
  v3 = a3;
  if (a3 == 3)
    return 15002;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[PGGraphPersonNodeCollection personNodesInAgeCategories:includingMe:inGraph:](PGGraphPersonNodeCollection, "personNodesInAgeCategories:includingMe:inGraph:", &unk_1E84EA300, 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v30 = v6;
    -[PGChildActivityMemoryGenerator _supportedIndividualActivityLabels](self, "_supportedIndividualActivityLabels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGChildActivityMemoryGenerator _supportedCompoundActivityLabels](self, "_supportedCompoundActivityLabels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v8);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "unionSet:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
    }

    v16 = (void *)MEMORY[0x1E0D42A68];
    +[PGGraphPersonNode personActivityMeaningOfPerson](PGGraphPersonNode, "personActivityMeaningOfPerson");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v17;
    +[PGGraphPersonActivityMeaningNode filterWithActivityLabels:](PGGraphPersonActivityMeaningNode, "filterWithActivityLabels:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "relation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "chain:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v7, v21, objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0D429D8];
    objc_msgSend(v22, "targets");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "adjacencyWithSources:relation:targetsClass:", v24, v25, objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __88__PGChildActivityMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v31[3] = &unk_1E842F6F8;
    v31[4] = self;
    v32 = v11;
    v33 = v26;
    v6 = v30;
    v34 = v8;
    v35 = v30;
    v27 = v8;
    v28 = v26;
    v29 = v11;
    objc_msgSend(v22, "enumerateTargetsBySourceWithBlock:", v31);

  }
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
  v11.super_class = (Class)PGChildActivityMemoryGenerator;
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
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v21[16];
  uint8_t buf[16];

  v6 = a5;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonActivityMeaningNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v12, "count"))
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGChildActivityMemoryGenerator] One or more person activity node expected", buf, 2u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v9, "memoryMomentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v13, v12);
  v14 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject count](v14, "count"))
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "[PGChildActivityMemoryGenerator] No moment feature edges found", v21, 2u);
    }

LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  -[NSObject allRelevantAssetLocalIdentifiers](v14, "allRelevantAssetLocalIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:", v16, v17, v10, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v18;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PGChildActivityMemoryTitleGenerator *v23;
  void *v24;
  void *v25;
  id v26;
  PGChildActivityMemoryTitleGenerator *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  objc_msgSend(v10, "memoryMomentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "temporarySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "memoryFeatureNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonActivityMeaningNodeCollection, "subsetInCollection:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "personActivityMeaningLabels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v15, "personNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v17, "count") >= 2)
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v15;
        _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "[PGChildActivityMemoryGenerator] More than 1 child found in activityNode:%@", buf, 0xCu);
      }

    }
    objc_msgSend(v17, "anyNode", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "serviceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleTitleUtility nameFromPersonNode:serviceManager:](PGPeopleTitleUtility, "nameFromPersonNode:serviceManager:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = [PGChildActivityMemoryTitleGenerator alloc];
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v13;
    v25 = v13;
    v26 = v11;
    v27 = -[PGChildActivityMemoryTitleGenerator initWithMomentNodes:activityLabels:childName:titleGenerationContext:loggingConnection:](v23, "initWithMomentNodes:activityLabels:childName:titleGenerationContext:loggingConnection:", v25, v16, v22, v11, v24);

    objc_msgSend(v10, "memoryFeatureNodes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v29, "count") == 1)
      -[PGTitleGenerator setFeaturedYearNodes:](v27, "setFeaturedYearNodes:", v29);

    v11 = v26;
    v13 = v32;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)_supportedIndividualActivityLabels
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  v6[0] = CFSTR("PersonBeachWater");
  v6[1] = CFSTR("PersonToys");
  v6[2] = CFSTR("PersonPlayground");
  v6[3] = CFSTR("PersonSoccer");
  v6[4] = CFSTR("PersonMartialArts");
  v6[5] = CFSTR("PersonActionSwimming");
  v6[6] = CFSTR("PersonActionJumpingOrLeaping");
  v6[7] = CFSTR("PersonActionRunningOrJogging");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  return v4;
}

- (id)_supportedCompoundActivityLabels
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("PersonActionPlayingOnASwing"), CFSTR("PersonActionPlayingOnASlide"), 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("PersonActionHugging"), CFSTR("PersonActionKissing"), 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
}

void __88__PGChildActivityMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id obj;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v5 = a3;
  objc_msgSend(a1[4], "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v29, "localIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personActivityMeaningLabels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v8;
    v43 = 2112;
    v44 = v9;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Generate activity memories for child %@ with activity meanings:%@", buf, 0x16u);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a1[5];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(a1[4], "loggingConnection");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v14;
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Generate compound activities: %@", buf, 0xCu);
        }

        objc_msgSend(v5, "subsetWithActivityLabels:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        objc_msgSend(a1[4], "loggingConnection");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v17)
        {
          if (v19)
          {
            objc_msgSend(v16, "labels");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v42 = v20;
            _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Found compound activities: %@", buf, 0xCu);

          }
          objc_msgSend(a1[6], "targetsForSources:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "featureNodeCollection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "featureNodeCollection");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "collectionByFormingUnionWith:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(void))a1[8] + 2))();
        }
        else if (v19)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Cannot find any of the compound activities", buf, 2u);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v11);
  }

  objc_msgSend(v5, "subsetWithActivityLabels:", a1[7]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88__PGChildActivityMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_165;
  v30[3] = &unk_1E842F6D0;
  v25 = a1[7];
  v26 = a1[4];
  v31 = v25;
  v32 = v26;
  v33 = a1[6];
  v34 = v29;
  v35 = a1[8];
  v27 = v29;
  objc_msgSend(v24, "enumerateIdentifiersAsCollectionsWithBlock:", v30);

}

void __88__PGChildActivityMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_165(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "personActivityMeaningLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Generate for single activity: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "targetsForSources:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureNodeCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "featureNodeCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionByFormingUnionWith:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

@end
