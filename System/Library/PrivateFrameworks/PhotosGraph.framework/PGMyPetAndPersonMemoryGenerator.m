@implementation PGMyPetAndPersonMemoryGenerator

- (PGMyPetAndPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGMyPetAndPersonMemoryGenerator *v3;
  PGMemoryMomentRequirements *v4;
  PGMemoryMomentRequirements *momentRequirements;
  PGFeaturedTimePeriodMemoryConfiguration *featuredSeasonConfiguration;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGMyPetAndPersonMemoryGenerator;
  v3 = -[PGMyPetMemoryGenerator initWithMemoryGenerationContext:](&v9, sel_initWithMemoryGenerationContext_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v3->_momentRequirements;
    v3->_momentRequirements = v4;

    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v3->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 1);
    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v3->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
    featuredSeasonConfiguration = v3->_featuredSeasonConfiguration;
    v3->_featuredSeasonConfiguration = 0;

    featuredYearConfiguration = v3->_featuredYearConfiguration;
    v3->_featuredYearConfiguration = 0;

    v3->_intersectRelevantAssetsForFeatures = 1;
  }
  return v3;
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
    return 7004;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjacencyWithSources:relation:targetsClass:", v7, v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode featureOfMoment](PGGraphMomentNode, "featureOfMoment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v12;
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "relation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chain:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v18 = (void *)MEMORY[0x1E0D429D8];
  objc_msgSend(v10, "targets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "adjacencyWithSources:relation:targetsClass:", v19, v16, objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transposed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v27[3] = &unk_1E8434858;
  v28 = v17;
  v29 = v21;
  v31 = v10;
  v32 = v6;
  v30 = v5;
  v22 = v10;
  v23 = v5;
  v24 = v6;
  v25 = v21;
  v26 = v17;
  objc_msgSend(v22, "enumerateTargetsBySourceWithBlock:", v27);

}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  PGGraphPetNodeCollection *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v7, "elementIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIdentifier:", objc_msgSend(v10, "firstElement"));

  objc_msgSend(*(id *)(a1 + 40), "intersectingTargetsWith:", v9);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v23[3] = &unk_1E8434808;
  v25 = *(id *)(a1 + 64);
  v12 = v7;
  v24 = v12;
  v26 = a4;
  objc_msgSend(v18, "enumerateTargetsBySourceWithBlock:", v23);
  v13 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphPetNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 56), "intersectingTargetsWith:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "subtractingSourcesWith:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_3;
  v19[3] = &unk_1E8434830;
  v16 = *(id *)(a1 + 64);
  v20 = v12;
  v21 = v16;
  v22 = a4;
  v17 = v12;
  objc_msgSend(v15, "enumerateTargetsBySourceWithBlock:", v19);

}

void __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "featureNodeCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featureNodeCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "collectionByFormingUnionWith:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _BYTE *))(v7 + 16))(v7, v9, v13, a4);

  **(_BYTE **)(a1 + 48) = *a4;
}

void __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_3(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)a1[4];
  v7 = a1[5];
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "featureNodeCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featureNodeCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "collectionByFormingUnionWith:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _QWORD))(v7 + 16))(v7, v9, v13, a1[6]);

  *(_BYTE *)a1[6] = *a4;
}

@end
