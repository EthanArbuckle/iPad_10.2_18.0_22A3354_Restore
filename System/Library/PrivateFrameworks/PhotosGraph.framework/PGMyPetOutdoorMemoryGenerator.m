@implementation PGMyPetOutdoorMemoryGenerator

- (PGMyPetOutdoorMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGMyPetOutdoorMemoryGenerator *v3;
  PGMyPetOutdoorMemoryGenerator *v4;
  PGFeaturedTimePeriodMemoryConfiguration *featuredSeasonConfiguration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGMyPetOutdoorMemoryGenerator;
  v3 = -[PGMyPetMemoryGenerator initWithMemoryGenerationContext:](&v7, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    featuredSeasonConfiguration = v3->_featuredSeasonConfiguration;
    v3->_featuredSeasonConfiguration = 0;

  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 28;
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
    return 7005;
  v3 = a3;
  if (a3 == 3)
    return 7006;
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
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D42A68];
  v7 = a3;
  +[PGGraphMomentNode featureOfMoment](PGGraphMomentNode, "featureOfMoment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  +[PGGraphPetNode filter](PGGraphPetNode, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGMemoryGeneratorUtils outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:useMomentFeatureEdges:](PGMemoryGeneratorUtils, "outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:useMomentFeatureEdges:", v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v13, v12, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transposed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__PGMyPetOutdoorMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v17[3] = &unk_1E84329D8;
  v18 = v5;
  v16 = v5;
  objc_msgSend(v15, "enumerateTargetsBySourceWithBlock:", v17);

}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PGMyPetOutdoorMemoryGenerator;
  v13 = a3;
  -[PGMyPetMemoryGenerator titleGeneratorForTriggeredMemory:withKeyAsset:curatedAssets:extendedCuratedAssets:titleGenerationContext:inGraph:](&v18, sel_titleGeneratorForTriggeredMemory_withKeyAsset_curatedAssets_extendedCuratedAssets_titleGenerationContext_inGraph_, v13, a4, a5, a6, a7, a8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUseAdventureTitle:", 1, v18.receiver, v18.super_class);
  objc_msgSend(v13, "memoryFeatureNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count") == 1)
    objc_msgSend(v14, "setFeaturedYearNodes:", v16);

  return v14;
}

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
}

void __87__PGMyPetOutdoorMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
