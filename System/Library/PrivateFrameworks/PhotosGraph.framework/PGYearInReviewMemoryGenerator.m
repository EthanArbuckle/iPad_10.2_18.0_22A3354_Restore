@implementation PGYearInReviewMemoryGenerator

- (PGYearInReviewMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGYearInReviewMemoryGenerator *v3;
  PGYearInReviewMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  PGFeaturedTimePeriodMemoryConfiguration *v7;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGYearInReviewMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v10, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v4->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
    v7 = objc_alloc_init(PGFeaturedTimePeriodMemoryConfiguration);
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = v7;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfMomentsInterestingForMemories:](v4->_featuredYearConfiguration, "setMinimumNumberOfMomentsInterestingForMemories:", 1);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfAssetsInExtendedCuration:](v4->_featuredYearConfiguration, "setMinimumNumberOfAssetsInExtendedCuration:", 13);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 8;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  int v4;
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
    return 5001;
  v4 = a3;
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
    v11 = v4;
    _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);

  }
  return 0;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *, PGGraphFeatureNodeCollection *, _BYTE *);
  id v6;
  void *v7;
  PGGraphFeatureNodeCollection *v8;
  char v9;

  v9 = 0;
  v5 = (void (**)(id, void *, PGGraphFeatureNodeCollection *, _BYTE *))a4;
  v6 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAElementCollection initWithGraph:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:", v6);

  v5[2](v5, v7, v8, &v9);
}

- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[PGMemoryGenerator controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke;
  v12[3] = &unk_1E84286F8;
  v12[4] = self;
  v13 = v8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v10, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Year"), 400, v12);

}

- (id)titleGeneratorWithYear:(int64_t)a3 titleGenerationContext:(id)a4
{
  id v5;
  PGBestOfTimeMemoryTitleGenerator *v6;

  v5 = a4;
  v6 = -[PGBestOfTimeMemoryTitleGenerator initWithYear:titleGenerationContext:]([PGBestOfTimeMemoryTitleGenerator alloc], "initWithYear:titleGenerationContext:", a3, v5);

  return v6;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGYearInReviewMemoryGenerator;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v6, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefilterAssetsWithFacesThreshold:", 2.22507386e-308);
  return v4;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _DWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  objc_msgSend(a3, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "years");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    -[PGYearInReviewMemoryGenerator titleGeneratorWithYear:titleGenerationContext:](self, "titleGeneratorWithYear:titleGenerationContext:", v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = objc_msgSend(v12, "count");
      _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "[PGYearInReviewMemoryGenerator] One year node expected, found %d", (uint8_t *)v19, 8u);
    }

    v16 = 0;
  }

  return v16;
}

- (int64_t)year
{
  return self->_year;
}

- (void)setYear:(int64_t)a3
{
  self->_year = a3;
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

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, double);
  PGPotentialYearSummaryMemory *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[7];
  char v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v5 = a2;
  v6 = objc_msgSend(v5, "calendarUnitValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v6 == v7)
  {
    v9 = v6;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_2;
    v22[3] = &unk_1E842F058;
    v23 = *(id *)(a1 + 40);
    v25 = &v26;
    v11 = v10;
    v24 = v11;
    objc_msgSend(v5, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("YEAR"), 400, v22);
    if (*((_BYTE *)v27 + 24))
    {
      v21 = 0;
      objc_msgSend(*(id *)(a1 + 40), "progressBlock");
      v12 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, char *, double))v12)[2](v12, &v21, 0.25);

      if (v21)
      {
        *a3 = 1;
      }
      else if ((objc_msgSend(*(id *)(a1 + 40), "momentNodesHaveScenesProcessed:inGraph:", v11, *(_QWORD *)(a1 + 48)) & 1) != 0)
      {
        v13 = -[PGPotentialYearSummaryMemory initWithMomentNodes:]([PGPotentialYearSummaryMemory alloc], "initWithMomentNodes:", v11);
        v14 = (void *)MEMORY[0x1E0C99E60];
        +[PGFeature featureWithType:node:](PGFeature, "featureWithType:node:", 1, v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithObject:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGPotentialMemory setFeatures:](v13, "setFeatures:", v16);

        -[PGPotentialYearSummaryMemory setYear:](v13, "setYear:", v9);
        -[PGPotentialMemory computeContentScore](v13, "computeContentScore");
        -[PGPotentialMemory buildAssetCollectionUsingMemoryController:withMinimumNumberOfAssets:](v13, "buildAssetCollectionUsingMemoryController:withMinimumNumberOfAssets:", *(_QWORD *)(a1 + 40), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[PGPotentialMemory setScore:](v13, "setScore:", 1.0);
          objc_msgSend(v5, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPotentialMemory setEventName:](v13, "setEventName:", v18);

          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "loggingConnection");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: Potential Memory is too short or out-of-sync.", v20, 2u);
          }

        }
      }
    }

    _Block_object_dispose(&v26, 8);
  }

}

void __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  objc_msgSend(a2, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_3;
  v7[3] = &unk_1E8430450;
  v8 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v9 = v6;
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v7);

}

void __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "anyBlockedFeatureIsHitByEvent:") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= objc_msgSend(v3, "isInterestingForMemories");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

@end
