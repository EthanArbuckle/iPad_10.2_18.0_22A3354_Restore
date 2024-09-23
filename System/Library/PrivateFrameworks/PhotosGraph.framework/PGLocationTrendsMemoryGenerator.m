@implementation PGLocationTrendsMemoryGenerator

- (PGLocationTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  PGLocationTrendsMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGLocationTrendsMemoryGenerator;
  v4 = -[PGTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:](&v8, sel_initWithMemoryGenerationContext_configurations_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v4->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 2);
    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v4->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
  }
  return v4;
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
    return 16005;
  v3 = a3;
  if (a3 == 3)
    return 16006;
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
  return CFSTR("Location");
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v11 = a3;
  v6 = a4;
  -[PGTrendsMemoryGenerator validSceneFeatureNodesInGraph:](self, "validSceneFeatureNodesInGraph:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjacencyWithSources:relation:targetsClass:", v7, v9, objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __89__PGLocationTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v12[3] = &unk_1E8434280;
    v12[4] = self;
    v13 = v11;
    v14 = v6;
    objc_msgSend(v10, "enumerateTargetsBySourceWithBlock:", v12);

  }
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __89__PGLocationTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;

  v7 = a2;
  v8 = (void *)MEMORY[0x1E0D429D8];
  v9 = a3;
  +[PGGraphMomentNode cityOfMoment](PGGraphMomentNode, "cityOfMoment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjacencyWithSources:relation:targetsClass:", v9, v10, objc_opt_class());
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "transposed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__PGLocationTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v16[3] = &unk_1E8434258;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v17 = v7;
  v18 = v12;
  v19 = v13;
  v20 = *(id *)(a1 + 48);
  v21 = a4;
  v14 = v7;
  objc_msgSend(v11, "enumerateTargetsBySourceWithBlock:", v16);

}

void __89__PGLocationTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "featureNodeCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "featureNodeCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "collectionByFormingUnionWith:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "labels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredMomentNodes:withSceneLabel:inGraph:", v8, v15, *(_QWORD *)(a1 + 48));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  **(_BYTE **)(a1 + 64) = *a4;

}

@end
