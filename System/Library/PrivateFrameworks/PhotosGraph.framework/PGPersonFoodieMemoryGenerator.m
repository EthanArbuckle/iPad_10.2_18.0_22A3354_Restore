@implementation PGPersonFoodieMemoryGenerator

- (PGPersonFoodieMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGPersonFoodieMemoryGenerator *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGPersonFoodieMemoryGenerator;
  result = -[PGFoodieMemoryGenerator initWithMemoryGenerationContext:](&v4, sel_initWithMemoryGenerationContext_, a3);
  if (result)
    result->_requireFaceProcessingMeetsThresholdOverTime = 1;
  return result;
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
    return 6003;
  v3 = a3;
  if (a3 == 3)
    return 6004;
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
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];

  v34[3] = *MEMORY[0x1E0C80C00];
  v28 = a4;
  v5 = a3;
  +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneName:inGraph:", CFSTR("Food"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentFeaturesEdge filter](PGGraphMomentFeaturesEdge, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outRelation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v9;
  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  +[PGGraphPersonNode filterNameNotEmpty](PGGraphPersonNode, "filterNameNotEmpty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "relation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chain:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v27, v15, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:](PGFoodieMemoryGenerator, "incompatibleMomentNodesInGraph:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "subtractingSourcesWith:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "sources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __87__PGPersonFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v32[3] = &unk_1E8433910;
  v33 = v18;
  v21 = v18;
  objc_msgSend(v19, "filteredCollectionUsingBlock:", v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "intersectingSourcesWith:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "transposed");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  v29[1] = 3221225472;
  v29[2] = __87__PGPersonFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v29[3] = &unk_1E8431E30;
  v30 = v6;
  v31 = v28;
  v25 = v28;
  v26 = v6;
  objc_msgSend(v24, "enumerateTargetsBySourceWithBlock:", v29);

}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

BOOL __87__PGPersonFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "targetsForSources:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") < 6;

  return v3;
}

void __87__PGPersonFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "featureNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureNodeCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "collectionByFormingUnionWith:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
