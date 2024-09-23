@implementation PGPersonMemoryGenerator

- (PGPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGPersonMemoryGenerator *v3;
  PGPersonMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  uint64_t v11;
  PGFeaturedTimePeriodMemoryConfiguration *featuredSeasonConfiguration;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PGPersonMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v14, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
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
    -[PGOverTimeMemoryConfiguration setAboveMomentAverageContentScoreThreshold:](v4->_overTheYearsConfiguration, "setAboveMomentAverageContentScoreThreshold:", 0.5);
    +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "strictDefaultFeaturedYearMemoryConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_featuredYearConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
    -[PGOverTimeMemoryConfiguration setAboveMomentAverageContentScoreThreshold:](v4->_featuredYearConfiguration, "setAboveMomentAverageContentScoreThreshold:", 0.5);
    +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedSeasonMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFeaturedSeasonMemoryConfiguration");
    v11 = objc_claimAutoreleasedReturnValue();
    featuredSeasonConfiguration = v4->_featuredSeasonConfiguration;
    v4->_featuredSeasonConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v11;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_featuredSeasonConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
    -[PGOverTimeMemoryConfiguration setAboveMomentAverageContentScoreThreshold:](v4->_featuredSeasonConfiguration, "setAboveMomentAverageContentScoreThreshold:", 0.5);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 3;
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

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (a3 - 1 < 3)
    return a3 + 2000;
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
  +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjacencyWithSources:relation:targetsClass:", v10, v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PGPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v11[3] = &unk_1E84294C8;
  v12 = v5;
  v9 = v5;
  objc_msgSend(v8, "enumerateTargetsBySourceWithBlock:", v11);

}

- (unint64_t)durationForCuration
{
  return 22;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (BOOL)semanticalDedupingEnabledForExtendedCuration
{
  return 0;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v21[16];

  v6 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "memoryMomentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "allRelevantAssetLocalIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:", v16, v17, v9, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] No moment feature edges found", v21, 2u);
    }

    v18 = 0;
  }

  return v18;
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
  v11.super_class = (Class)PGPersonMemoryGenerator;
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

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  PGPeopleMemoryTitleGenerator *v19;
  void *v20;
  void *v21;
  void *v22;
  PGPeopleMemoryTitleGenerator *v23;
  void *v24;
  PGPeopleMemoryTitleGenerator *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  objc_msgSend(v10, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v10, "memoryMomentNodes");
    v13 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v13, "count"))
    {
      +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v14, "count"))
      {
        -[NSObject anyNode](v14, "anyNode");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          +[PGGraphNodeCollection subsetInCollection:](PGGraphSeasonNodeCollection, "subsetInCollection:", v12);
          v16 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v16, "count"))
          {
            -[NSObject anyNode](v16, "anyNode");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v18, "length"))
            {
              v19 = [PGPeopleMemoryTitleGenerator alloc];
              -[NSObject temporarySet](v13, "temporarySet");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
              v35 = v16;
              v21 = v18;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[PGPeopleMemoryTitleGenerator initWithMomentNodes:personNodes:seasonName:type:titleGenerationContext:](v19, "initWithMomentNodes:personNodes:seasonName:type:titleGenerationContext:", v20, v22, v21, 4, v11);

              v18 = v21;
              v16 = v35;

            }
            else
            {
              -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                -[NSObject description](v16, "description");
                v31 = v16;
                v32 = v18;
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v38 = v33;
                _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] No season name found for season node in collection %@", buf, 0xCu);

                v18 = v32;
                v16 = v31;
              }

              v23 = 0;
            }
          }
          else
          {
            -[NSObject temporarySet](v13, "temporarySet");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGPeopleMemoryTitleGenerator peopleOverTimeTimeTitleOptionsWithMomentNodes:](PGPeopleMemoryTitleGenerator, "peopleOverTimeTimeTitleOptionsWithMomentNodes:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v12);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v36, "count") == 1)
              objc_msgSend(v24, "setFeaturedYearNodes:", v36);
            v25 = [PGPeopleMemoryTitleGenerator alloc];
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v24;
            v34 = v24;
            v28 = (void *)v26;
            v23 = -[PGPeopleMemoryTitleGenerator initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:](v25, "initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:", v18, v26, v27, 0, v11);

          }
        }
        else
        {
          -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] unable to cast personNodeCollection.anyNode to PGGraphPersonNode", buf, 2u);
          }
          v23 = 0;
        }

      }
      else
      {
        -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] personNodeCollection is empty", buf, 2u);
        }
        v23 = 0;
      }

    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] momentNodes is empty", buf, 2u);
      }
      v23 = 0;
    }

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] featureNodes is empty", buf, 2u);
    }
    v23 = 0;
  }

  return v23;
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

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __81__PGPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
