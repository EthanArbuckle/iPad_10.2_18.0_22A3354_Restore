@implementation PGDayInHistoryAggregationMemoryGenerator

- (PGDayInHistoryAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGDayInHistoryAggregationMemoryGenerator *v3;
  PGDayInHistoryAggregationMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  PGOverTheYearsMemoryConfiguration *v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGDayInHistoryAggregationMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v10, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setMinimumNumberOfAssetsInExtendedCuration:](v4->_momentRequirements, "setMinimumNumberOfAssetsInExtendedCuration:", 7);
    -[PGMemoryMomentRequirements setFilterUninterestingForMemories:](v4->_momentRequirements, "setFilterUninterestingForMemories:", 1);
    v7 = objc_alloc_init(PGOverTheYearsMemoryConfiguration);
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = v7;

    -[PGOverTheYearsMemoryConfiguration setMinimumNumberOfYears:](v4->_overTheYearsConfiguration, "setMinimumNumberOfYears:", 3);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v4->_overTheYearsConfiguration, "setMinimumNumberOfMoments:", 3);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfAssetsInExtendedCuration:](v4->_overTheYearsConfiguration, "setMinimumNumberOfAssetsInExtendedCuration:", 15);
    -[PGOverTimeMemoryConfiguration setAllMomentsMustHaveFacesProcessed:](v4->_overTheYearsConfiguration, "setAllMomentsMustHaveFacesProcessed:", 1);
    -[PGOverTimeMemoryConfiguration setAllMomentsMustHaveScenesProcessed:](v4->_overTheYearsConfiguration, "setAllMomentsMustHaveScenesProcessed:", 1);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 23;
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
  if (a3 == 3)
    return 1002;
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
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMonthDayNodeCollection, "nodesInGraph:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMonthDayNodeCollection dateOfMonthDay](PGGraphMonthDayNodeCollection, "dateOfMonthDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  +[PGGraphDateNode momentOfDate](PGGraphDateNode, "momentOfDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v6, v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PGDayInHistoryAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v14[3] = &unk_1E842EAD8;
  v15 = v5;
  v13 = v5;
  objc_msgSend(v12, "enumerateTargetsBySourceWithBlock:", v14);

}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PGDayInHistoryAggregationMemoryTitleGenerator *v15;
  void *v16;
  void *v17;
  PGDayInHistoryAggregationMemoryTitleGenerator *v18;

  v9 = (objc_class *)MEMORY[0x1E0CB3588];
  v10 = a7;
  v11 = a3;
  v12 = [v9 alloc];
  objc_msgSend(v11, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithStartDate:duration:", v13, 0.0);

  v15 = [PGDayInHistoryAggregationMemoryTitleGenerator alloc];
  objc_msgSend(v11, "memoryMomentNodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PGDayInHistoryAggregationMemoryTitleGenerator initWithMomentNodes:referenceDateInterval:titleGenerationContext:](v15, "initWithMomentNodes:referenceDateInterval:titleGenerationContext:", v17, v14, v10);

  return v18;
}

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  id v7;
  PGYearChapterTitleGenerator *v8;

  v7 = a3;
  v8 = -[PGYearChapterTitleGenerator initWithTriggeredMemory:]([PGYearChapterTitleGenerator alloc], "initWithTriggeredMemory:", v7);

  return v8;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __98__PGDayInHistoryAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
