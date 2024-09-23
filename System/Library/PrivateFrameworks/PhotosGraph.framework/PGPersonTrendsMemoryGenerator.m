@implementation PGPersonTrendsMemoryGenerator

- (PGPersonTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  PGPersonTrendsMemoryGenerator *v4;
  PGPersonTrendsMemoryGenerator *v5;
  PGMemoryMomentRequirements *v6;
  PGMemoryMomentRequirements *momentRequirements;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGPersonTrendsMemoryGenerator;
  v4 = -[PGTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:](&v9, sel_initWithMemoryGenerationContext_configurations_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_requireFaceProcessingMeetsThresholdOverTime = 1;
    v4->_intersectRelevantAssetsForFeatures = 1;
    v6 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v5->_momentRequirements;
    v5->_momentRequirements = v6;

    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v5->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 2);
    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v5->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
  }
  return v5;
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
    return 16003;
  v3 = a3;
  if (a3 == 3)
    return 16004;
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

- (id)trendType
{
  return CFSTR("Person");
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
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  PGPersonTrendsMemoryGenerator *v27;
  id v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGTrendsMemoryGenerator validSceneFeatureNodesInGraph:](self, "validSceneFeatureNodesInGraph:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x1E0D42A68];
    +[PGGraphMomentNode featureOfMoment](PGGraphMomentNode, "featureOfMoment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v10;
    +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chain:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphPersonNodeCollection personNodesInAgeCategories:includingMe:inGraph:](PGGraphPersonNodeCollection, "personNodesInAgeCategories:includingMe:inGraph:", &unk_1E84EA1B0, 0, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPersonTrendsMemoryGenerator childOnlyPersonTrends](self, "childOnlyPersonTrends");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "adjacencyWithSources:relation:targetsClass:", v8, v18, objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __87__PGPersonTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v23[3] = &unk_1E842EB48;
    v24 = v14;
    v25 = v16;
    v26 = v15;
    v27 = self;
    v28 = v6;
    v29 = v7;
    v20 = v15;
    v21 = v16;
    v22 = v14;
    objc_msgSend(v19, "enumerateTargetsBySourceWithBlock:", v23);

  }
}

- (id)childOnlyPersonTrends
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PlayTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __87__PGPersonTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;

  v7 = a2;
  v8 = (void *)MEMORY[0x1E0D429D8];
  v9 = *(_QWORD *)(a1 + 32);
  v10 = a3;
  objc_msgSend(v8, "adjacencyWithSources:relation:targetsClass:", v10, v9, objc_opt_class());
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "transposed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__PGPersonTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v17[3] = &unk_1E842EB20;
  v18 = *(id *)(a1 + 40);
  v19 = v7;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(void **)(a1 + 64);
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = *(id *)(a1 + 72);
  v24 = a4;
  v15 = v7;
  objc_msgSend(v11, "enumerateTargetsBySourceWithBlock:", v17);

}

void __87__PGPersonTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v7 = a3;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "labels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", v10))
  {
    v11 = objc_msgSend(*(id *)(a1 + 48), "intersectsCollection:", v19);

    if ((v11 & 1) == 0)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "featureNodeCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "featureNodeCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionByFormingUnionWith:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "labels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredMomentNodes:withSceneLabel:inGraph:", v7, v17, *(_QWORD *)(a1 + 64));
  v18 = objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  **(_BYTE **)(a1 + 80) = *a4;

  v7 = (id)v18;
LABEL_6:

}

@end
