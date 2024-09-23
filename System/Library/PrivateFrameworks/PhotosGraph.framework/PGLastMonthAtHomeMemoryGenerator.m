@implementation PGLastMonthAtHomeMemoryGenerator

+ (id)lastMonthAtHomeMemoriesForMonth:(int64_t)a3 year:(int64_t)a4 inGraph:(id)a5 momentNodesWithBlockedFeatureCache:(id)a6 photoLibrary:(id)a7 loggingConnection:(id)a8 progressReporter:(id)a9
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  PGMemoryProcessedScenesAndFacesCache *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  PGMemoryProcessedScenesAndFacesCache *v54;
  id v55;
  id v56;
  int64_t v57;
  _QWORD v58[4];
  PGMemoryProcessedScenesAndFacesCache *v59;
  id v60;
  NSObject *v61;
  uint8_t buf[4];
  int v63;
  __int16 v64;
  int v65;
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  if (v16)
  {
    v19 = -[PGMemoryProcessedScenesAndFacesCache initWithPhotoLibrary:]([PGMemoryProcessedScenesAndFacesCache alloc], "initWithPhotoLibrary:", v16);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] +lastMonthAtHomeMemoriesForMonth: was passed in a nil photoLibrary, not checking if moments have their scenes processed.", buf, 2u);
    }
    v19 = 0;
  }
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
  {
    v57 = a3;
    objc_msgSend(v21, "homeNodes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v54 = v19;
      v55 = v16;
      v56 = v18;
      v23 = v22;
      v52 = v15;
      +[PGGraphMonthNodeCollection monthNodesForMonth:inGraph:](PGGraphMonthNodeCollection, "monthNodesForMonth:inGraph:", v57, v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", a4, v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v24;
      objc_msgSend(v24, "dateNodes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v25;
      objc_msgSend(v25, "dateNodes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "collectionByIntersecting:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = v28;
      objc_msgSend(v28, "momentNodes");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0D42A68];
      +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v31;
      +[PGGraphAddressNode homeOfAddress](PGGraphAddressNode, "homeOfAddress");
      v46 = a4;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "chain:", v33);
      v34 = objc_claimAutoreleasedReturnValue();

      v47 = (void *)v34;
      v48 = (void *)v29;
      objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v29, v34, objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v23;
      objc_msgSend(v35, "intersectingTargetsWith:", v23);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v36, "sourcesCount"))
      {
        objc_msgSend(v52, "momentNodesWithBlockedFeatureInGraph:progressReporter:", v14, v56);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "subtractingSourcesWith:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "transposed");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __164__PGLastMonthAtHomeMemoryGenerator_lastMonthAtHomeMemoriesForMonth_year_inGraph_momentNodesWithBlockedFeatureCache_photoLibrary_loggingConnection_progressReporter___block_invoke;
        v58[3] = &unk_1E842C8B0;
        v19 = v54;
        v59 = v54;
        v40 = v20;
        v60 = v40;
        v61 = v17;
        objc_msgSend(v39, "enumerateTargetsBySourceWithBlock:", v58);

        v41 = v40;
        v15 = v52;

        v36 = v38;
        v16 = v55;
        v18 = v56;
      }
      else
      {
        v15 = v52;
        v18 = v56;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          v63 = v57;
          v64 = 1024;
          v65 = v46;
          _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] No moments detected at home in month: %d year: %d", buf, 0xEu);
        }
        v44 = v20;
        v19 = v54;
        v16 = v55;
      }
      v22 = v53;

    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] No home nodes found for me node. Not generating last month at home memories.", buf, 2u);
      }
      v43 = v20;
    }

  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] No me node found in graph. Not generating last month at home memories.", buf, 2u);
    }
    v42 = v20;
  }

  return v20;
}

void __164__PGLastMonthAtHomeMemoryGenerator_lastMonthAtHomeMemoriesForMonth_year_inGraph_momentNodesWithBlockedFeatureCache_photoLibrary_loggingConnection_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  PGGraphMemory *v11;
  void *v12;
  PGGraphMemory *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "interestingWithAlternateJunkingSubset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionByIntersecting:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 2)
  {
    v14 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      v17[0] = 67109632;
      v17[1] = v9;
      v18 = 1024;
      v19 = objc_msgSend(v6, "count");
      v20 = 1024;
      v21 = 2;
      _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] Only %d interesting moments out of %d for home node, but excepted at least %d. Not generating memory.", (uint8_t *)v17, 0x14u);

    }
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    if (v10 && !objc_msgSend(v10, "allMomentNodesInCollectionHaveScenesProcessed:", v6))
    {
      v16 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] Not all moments for home node have scenes processed, not generating memory.", (uint8_t *)v17, 2u);
      }
    }
    else
    {
      v11 = [PGGraphMemory alloc];
      objc_msgSend(v5, "featureNodeCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:](v11, "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", 7, 4001, v6, v12);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
    }
  }

}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  id v10;
  PGHomeAggregationMemoryTitleGenerator *v11;
  void *v12;
  void *v13;
  PGHomeAggregationMemoryTitleGenerator *v14;

  v9 = a7;
  v10 = a3;
  v11 = [PGHomeAggregationMemoryTitleGenerator alloc];
  objc_msgSend(v10, "memoryMomentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "temporarySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PGHomeAggregationMemoryTitleGenerator initWithMomentNodes:titleGenerationContext:](v11, "initWithMomentNodes:titleGenerationContext:", v13, v9);

  return v14;
}

@end
