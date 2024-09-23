@implementation PGSingleMomentMemoryGenerator

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interestingForMemoriesSubset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "momentNodesWithMinimumNumberOfExtendedCuratedAssets:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 16, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "momentNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionBySubtracting:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator momentNodesWithBlockedFeatureCache](self, "momentNodesWithBlockedFeatureCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "momentNodesWithBlockedFeature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "collectionBySubtracting:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "momentNodesAtSensitiveLocationsInGraph:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "collectionBySubtracting:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0D42A68];
    +[PGGraphMomentNode dateOfMoment](PGGraphMomentNode, "dateOfMoment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    +[PGGraphDateNode monthDayOfDate](PGGraphDateNode, "monthDayOfDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "chain:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v9, v22, objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __85__PGSingleMomentMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
    v27[3] = &unk_1E842B8F8;
    v24 = v6;
    v28 = v24;
    objc_msgSend(v23, "enumerateTargetsBySourceWithBlock:", v27);
    v25 = v24;

  }
  else
  {
    v25 = (id)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  PGTitleGenerator *v25;
  void *v26;
  void *v27;
  PGThrowbackThursdayMemoryTitleGenerator *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  objc_super v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v14, "triggerTypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsIndex:", 4);

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v14, "creationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithStartDate:duration:", v23, 0.0);

    v25 = [PGTitleGenerator alloc];
    objc_msgSend(v14, "memoryMomentNodes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](v25, "initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", v27, v24, 0, 0, 0, 1, v18);

  }
  else
  {
    objc_msgSend(v14, "triggerTypes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "containsIndex:", 11);

    if (!v30)
    {
      v39.receiver = self;
      v39.super_class = (Class)PGSingleMomentMemoryGenerator;
      -[PGMemoryGenerator titleGeneratorForTriggeredMemory:withKeyAsset:curatedAssets:extendedCuratedAssets:titleGenerationContext:inGraph:](&v39, sel_titleGeneratorForTriggeredMemory_withKeyAsset_curatedAssets_extendedCuratedAssets_titleGenerationContext_inGraph_, v14, v15, v16, v17, v18, v19);
      v28 = (PGThrowbackThursdayMemoryTitleGenerator *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v31 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v14, "creationDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "yearFromDate:", v32);

    objc_msgSend(v14, "memoryMomentNodes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "anyNode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v24, "universalStartDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "yearFromDate:", v36);

    v28 = -[PGThrowbackThursdayMemoryTitleGenerator initWithMomentNode:numberOfYearsAgo:titleGenerationContext:]([PGThrowbackThursdayMemoryTitleGenerator alloc], "initWithMomentNode:numberOfYearsAgo:titleGenerationContext:", v24, v33 - v37, v18);
  }

LABEL_7:
  return v28;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  objc_super v27;

  v7 = a5;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PGSingleMomentMemoryGenerator;
  -[PGMemoryGenerator relevantFeederForTriggeredMemory:inGraph:allowGuestAsset:progressReporter:](&v27, sel_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter_, a3, v10, v7, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetFetchResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CD1390];
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "curationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v12, 22, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v16, "count") > 0xC)
  {
    +[PGMemoryGeneratorUtils filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:withGraph:](PGMemoryGeneratorUtils, "filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:withGraph:", v16, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v26, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchPropertySets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v18, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v19, v20, v21, v22, 0, 0);

    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v23, v24, v10);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v11;
  }

  return v17;
}

void __85__PGSingleMomentMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PGGraphMemory *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "featureNodeCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "collectionByFormingUnionWith:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", 1, 1001, v6, v10);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

@end
