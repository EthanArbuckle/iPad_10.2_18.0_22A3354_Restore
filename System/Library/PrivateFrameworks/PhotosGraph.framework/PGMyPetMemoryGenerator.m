@implementation PGMyPetMemoryGenerator

- (PGMyPetMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGMyPetMemoryGenerator *v3;
  PGMyPetMemoryGenerator *v4;
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
  v14.super_class = (Class)PGMyPetMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v14, sel_initWithMemoryGenerationContext_, a3);
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
    +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedSeasonMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFeaturedSeasonMemoryConfiguration");
    v11 = objc_claimAutoreleasedReturnValue();
    featuredSeasonConfiguration = v4->_featuredSeasonConfiguration;
    v4->_featuredSeasonConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v11;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_featuredSeasonConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 10;
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
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjacencyWithSources:relation:targetsClass:", v10, v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PGMyPetMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v11[3] = &unk_1E84329D8;
  v12 = v5;
  v9 = v5;
  objc_msgSend(v8, "enumerateTargetsBySourceWithBlock:", v11);

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
    return a3 + 7000;
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

- (unint64_t)durationForCuration
{
  return 22;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PGMyPetMemoryGenerator;
  v5 = a3;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v14, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memoryFeatureNodes", v14.receiver, v14.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPetNodeCollection, "subsetInCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "localIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v12);

  }
  objc_msgSend(v6, "setReferencePersonLocalIdentifiers:", v10);
  objc_msgSend(v6, "setMinimumNumberOfReferencePersons:", 0);

  return v6;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint8_t v30[8];
  _QWORD v31[4];
  NSObject *v32;
  uint8_t *v33;
  uint8_t *v34;
  uint8_t v35[8];
  uint8_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v29 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPetNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") && (unint64_t)objc_msgSend(v13, "count") < 3)
  {
    objc_msgSend(v9, "memoryMomentNodes");
    v14 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v40 = buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__6028;
    v43 = __Block_byref_object_dispose__6029;
    v44 = 0;
    if (objc_msgSend(v13, "count") == 1)
    {
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v14, v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(v28, "allRelevantAssetLocalIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "mutableCopy");
        v18 = (void *)*((_QWORD *)v40 + 5);
        *((_QWORD *)v40 + 5) = v17;

        +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "count"))
        {
          +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v14, v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)*((_QWORD *)v40 + 5);
          objc_msgSend(v27, "allRelevantAssetLocalIdentifiers");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "intersectSet:", v21);

        }
        goto LABEL_16;
      }
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] No pet moment feature edges found", v35, 2u);
      }

    }
    else
    {
      *(_QWORD *)v35 = 0;
      v36 = v35;
      v37 = 0x2020000000;
      v38 = 0;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __100__PGMyPetMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke;
      v31[3] = &unk_1E84285C8;
      v32 = v14;
      v33 = v35;
      v34 = buf;
      objc_msgSend(v13, "enumerateIdentifiersAsCollectionsWithBlock:", v31);
      if (!v36[24])
      {

        _Block_object_dispose(v35, 8);
LABEL_16:
        objc_msgSend(*((id *)v40 + 5), "allObjects");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetLocalIdentifiers:memoryCurationSession:graph:allowGuestAsset:", v23, v24, v10, v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
        _Block_object_dispose(buf, 8);

        goto LABEL_22;
      }
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] No pet moment feature edges found", v30, 2u);
      }

      _Block_object_dispose(v35, 8);
    }
    v15 = 0;
    goto LABEL_21;
  }
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v13, "count");
    _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] At least one and at most two pet nodes expected, found %d", buf, 8u);
  }
  v15 = 0;
LABEL_22:

  return v15;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  PGPetMemoryTitleGenerator *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  objc_msgSend(v10, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPetNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") && (unint64_t)objc_msgSend(v13, "count") < 3)
  {
    v16 = [PGPetMemoryTitleGenerator alloc];
    objc_msgSend(v10, "memoryMomentNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "temporarySet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PGPetMemoryTitleGenerator initWithMomentNodes:type:titleGenerationContext:](v16, "initWithMomentNodes:type:titleGenerationContext:", v18, 0, v11);

    -[NSObject setPetNodes:](v14, "setPetNodes:", v13);
    +[PGGraphNodeCollection subsetInCollection:](PGGraphSeasonNodeCollection, "subsetInCollection:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "anyNode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v21, "length"))
      {
        -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "description");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138412290;
          v28 = v26;
          _os_log_error_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] No season name found for season node in collection %@", (uint8_t *)&v27, 0xCu);

        }
        v15 = 0;
        goto LABEL_18;
      }
      -[NSObject setSeasonName:](v14, "setSeasonName:", v21);

    }
    +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count") || (unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      -[NSObject setUsePetAndPersonTitle:](v14, "setUsePetAndPersonTitle:", 1);
      -[NSObject setPersonNodeAsCollection:](v14, "setPersonNodeAsCollection:", v22);
    }
    +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count") == 1)
      -[NSObject setFeaturedYearNodes:](v14, "setFeaturedYearNodes:", v23);
    v15 = v14;

LABEL_18:
    goto LABEL_19;
  }
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v27 = 67109120;
    LODWORD(v28) = objc_msgSend(v13, "count");
    _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] At least one and at most two pet nodes expected, found %d", (uint8_t *)&v27, 8u);
  }
  v15 = 0;
LABEL_19:

  return v15;
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

void __100__PGMyPetMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", a1[4], a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    objc_msgSend(v12, "allRelevantAssetLocalIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v6, "intersectSet:", v7);
    }
    else
    {
      v9 = objc_msgSend(v7, "mutableCopy");
      v10 = *(_QWORD *)(a1[6] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __80__PGMyPetMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
