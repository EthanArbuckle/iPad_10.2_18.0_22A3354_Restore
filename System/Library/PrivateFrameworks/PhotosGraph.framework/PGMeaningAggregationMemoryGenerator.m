@implementation PGMeaningAggregationMemoryGenerator

- (PGMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGMeaningAggregationMemoryGenerator *v3;
  PGMeaningAggregationMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGMeaningAggregationMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v12, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 0;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v4->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
    +[PGOverTheYearsMemoryConfiguration defaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultOverTheYearsMemoryConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfAssetsInExtendedCuration:](v4->_overTheYearsConfiguration, "setMinimumNumberOfAssetsInExtendedCuration:", 13);
    -[PGOverTimeMemoryConfiguration setAboveMomentAverageContentScoreThreshold:](v4->_overTheYearsConfiguration, "setAboveMomentAverageContentScoreThreshold:", 0.5);
    +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFeaturedYearMemoryConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v4->_featuredYearConfiguration, "setMinimumMomentSpreadicityTimeInterval:", 604800.0);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfAssetsInExtendedCuration:](v4->_featuredYearConfiguration, "setMinimumNumberOfAssetsInExtendedCuration:", 13);
    -[PGOverTimeMemoryConfiguration setAboveMomentAverageContentScoreThreshold:](v4->_featuredYearConfiguration, "setAboveMomentAverageContentScoreThreshold:", 0.5);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 17;
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
    return 11002;
  v3 = a3;
  if (a3 == 3)
    return 11003;
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
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  PGMeaningAggregationMemoryGenerator *v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedMeaningLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = CFSTR("Lunch");
  v26[1] = CFSTR("Dinner");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBusinessNodeCollection restaurantBusinessNodesInGraph:](PGGraphBusinessNodeCollection, "restaurantBusinessNodesInGraph:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphBusinessNode momentOfBusiness](PGGraphBusinessNode, "momentOfBusiness");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMeaningNode momentOfReliableMeaning](PGGraphMeaningNode, "momentOfReliableMeaning");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "adjacencyWithSources:relation:targetsClass:", v9, v16, objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__PGMeaningAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v21[3] = &unk_1E8428D98;
  v22 = v11;
  v23 = v14;
  v24 = self;
  v25 = v6;
  v18 = v6;
  v19 = v14;
  v20 = v11;
  objc_msgSend(v17, "enumerateTargetsBySourceWithBlock:", v21);

}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGMeaningAggregationMemoryGenerator;
  -[PGMemoryGenerator curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:](&v7, sel_curationOptionsWithRequiredAssetUUIDs_eligibleAssetUUIDs_triggeredMemory_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfItems:", 15);
  objc_msgSend(v5, "setFailIfMinimumDurationNotReached:", 1);
  return v5;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
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
  objc_super v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "memoryFeatureNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "meaningLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "curationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "curationCriteriaFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "curationCriteriaWithMeaningLabel:featureNodes:inGraph:client:", v11, v8, v6, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = self;
  v18.super_class = (Class)PGMeaningAggregationMemoryGenerator;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v18, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v7, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setCurationCriteria:", v15);
  return v16;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  NSObject *log;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v84;
  void *v85;
  PGMeaningAggregationMemoryGenerator *v86;
  void *context;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  _BYTE v93[18];
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  _BYTE v98[128];
  uint64_t v99;

  v7 = a5;
  v99 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v82 = a6;
  if (objc_msgSend(v82, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v93 = 202;
      *(_WORD *)&v93[4] = 2080;
      *(_QWORD *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenerators/PGMeaningAggr"
                           "egationMemoryGenerator.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v12 = 0;
    goto LABEL_45;
  }
  v79 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v10, "memoryFeatureNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "labels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphAddressNodeCollection, "subsetInCollection:", v13);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "locations");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationCityNodeCollection, "subsetInCollection:", v13);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphAreaNodeCollection, "subsetInCollection:", v13);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "curationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "curationCriteriaFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)v16;
  objc_msgSend(v19, "curationCriteriaWithMeaningLabel:featureNodes:inGraph:client:", v16, v13, v11, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "memoryMomentNodes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "curationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "defaultAssetFetchOptionsForMemories");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = v23;
  objc_msgSend(v23, "setIncludeGuestAssets:", v7);
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "photoLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "librarySpecificFetchOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v20, "localIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fetchAssetCollectionsWithLocalIdentifiers:options:", v29, v26);
  v30 = v11;
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v31, "count");
  v78 = v20;
  if (v32 < objc_msgSend(v20, "count"))
  {
    v33 = v30;
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, log, OS_LOG_TYPE_ERROR, "[PGMeaningAggregationMemoryGenerator] Failed to fetch all momentNodes, graph is out-of-sync with the photo library.", buf, 2u);
    }
    v12 = 0;
    v34 = v74;
    goto LABEL_44;
  }
  v86 = self;
  v70 = v26;
  v71 = v13;
  v72 = v10;
  v73 = v30;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v69 = v31;
  v35 = v31;
  v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
  v37 = v76;
  v38 = v85;
  if (!v36)
    goto LABEL_35;
  v39 = v36;
  v83 = *(_QWORD *)v89;
  log = v35;
  while (2)
  {
    for (i = 0; i != v39; ++i)
    {
      if (*(_QWORD *)v89 != v83)
        objc_enumerationMutation(v35);
      v41 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
      context = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v41, v84);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0CD1390];
      -[PGMemoryGenerator memoryCurationSession](v86, "memoryCurationSession");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "curationContext");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v42, 23, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v46;
      if (objc_msgSend(v38, "count"))
      {
        +[PGCurationManager filterAssets:withLocations:maximumDistance:](PGCurationManager, "filterAssets:withLocations:maximumDistance:", v47, v38, 100.0);
        v48 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v81, "count"))
      {
        +[PGCurationManager filterAssets:inMomentNodes:forAreaNodes:withMaximumDistance:](PGCurationManager, "filterAssets:inMomentNodes:forAreaNodes:withMaximumDistance:", v47, v78, v81, 500.0);
        v48 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = v47;
        if (!objc_msgSend(v80, "count"))
          goto LABEL_21;
        +[PGCurationManager filterAssets:inMomentNodes:forCityNodes:withMaximumDistance:](PGCurationManager, "filterAssets:inMomentNodes:forCityNodes:withMaximumDistance:", v47, v78, v80, 5000.0);
        v48 = objc_claimAutoreleasedReturnValue();
      }
      v49 = (void *)v48;

LABEL_21:
      if (objc_msgSend(v49, "count", v69))
      {
        if ((objc_msgSend(v37, "isEqualToString:", CFSTR("HolidayEvent")) & 1) == 0)
        {
          objc_msgSend(v77, "passingAssetsInAssets:", v49);
          v50 = objc_claimAutoreleasedReturnValue();

          v49 = (void *)v50;
        }
        v51 = objc_msgSend(v49, "count");
        if (v51 != objc_msgSend(v47, "count"))
        {
          +[PGMemoryGenerationHelper assetLocalIdentifiersFromAssets:](PGMemoryGenerationHelper, "assetLocalIdentifiersFromAssets:", v49);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGCurationManager filteredAssetsFromAssets:withContextualAssetLocalIdentifiers:approximateTimeDistance:](PGCurationManager, "filteredAssetsFromAssets:withContextualAssetLocalIdentifiers:approximateTimeDistance:", v47, v52, 300.0);
          v53 = objc_claimAutoreleasedReturnValue();

          v49 = (void *)v53;
        }
        v38 = v85;
        if ((unint64_t)objc_msgSend(v49, "count") >= 3)
          objc_msgSend(v79, "addObjectsFromArray:", v47);
        if (objc_msgSend(v82, "isCancelledWithProgress:", 0.5))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v93 = 263;
            *(_WORD *)&v93[4] = 2080;
            *(_QWORD *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenerators/P"
                                 "GMeaningAggregationMemoryGenerator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          objc_autoreleasePoolPop(context);
          v12 = 0;
          v10 = v72;
          v33 = v73;
          v26 = v70;
          v13 = v71;
          v34 = v74;
          v31 = v69;
          goto LABEL_44;
        }
      }
      else
      {
        -[PGMemoryGenerator loggingConnection](v86, "loggingConnection");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v41, "uuid");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "anyNode");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "anyNode");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413059;
          *(_QWORD *)v93 = v55;
          *(_WORD *)&v93[8] = 2113;
          *(_QWORD *)&v93[10] = v85;
          v94 = 2113;
          v95 = v56;
          v96 = 2113;
          v97 = v57;
          _os_log_impl(&dword_1CA237000, v54, OS_LOG_TYPE_INFO, "[PGMeaningAggregationMemoryGenerator] No relevant assets found for moment (%@) at locations: %{private}@, aoi: %{private}@, city: %{private}@", buf, 0x2Au);

          v35 = log;
          v37 = v76;

          v38 = v85;
        }

      }
      objc_autoreleasePoolPop(context);
    }
    v39 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
    if (v39)
      continue;
    break;
  }
LABEL_35:

  v58 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(v79, "allObjects");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "photoLibrary");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v84, "fetchPropertySets");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setWithArray:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v58, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v59, v60, 0, v63, 0, 0);

  -[PGMemoryGenerator memoryCurationSession](v86, "memoryCurationSession");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v64, v65, v73);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  log = v64;
  v33 = v73;
  if (objc_msgSend(v82, "isCancelledWithProgress:", 1.0))
  {
    v26 = v70;
    v13 = v71;
    v34 = v74;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v93 = 269;
      *(_WORD *)&v93[4] = 2080;
      *(_QWORD *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenerators/PGMeaningAggr"
                           "egationMemoryGenerator.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v12 = 0;
    v10 = v72;
  }
  else
  {
    v12 = v66;
    v13 = v71;
    v10 = v72;
    v34 = v74;
    v26 = v70;
  }
  v31 = v69;

LABEL_44:
  v11 = v33;
LABEL_45:

  return v12;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  PGMeaningfulEventAggregationMemoryTitleGenerator *v23;
  void *v24;
  NSObject *v25;
  PGCelebrationOverTimeMemoryTitleGenerator *v26;
  uint8_t v28[16];

  v10 = a3;
  v11 = a7;
  objc_msgSend(v10, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "meaningLabels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = +[PGGraph meaningForMeaningLabel:](PGGraph, "meaningForMeaningLabel:", v15);
  v17 = v16;
  if (v16 > 12)
  {
    if (v16 == 13)
    {
      v26 = [PGCelebrationOverTimeMemoryTitleGenerator alloc];
      objc_msgSend(v10, "memoryMomentNodes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "set");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[PGCelebrationOverTimeMemoryTitleGenerator initWithMomentNodes:titleGenerationContext:](v26, "initWithMomentNodes:titleGenerationContext:", v22, v11);
LABEL_19:

      goto LABEL_20;
    }
    if (v16 == 15)
    {
      v19 = +[PGMeaningAggregationMemoryGenerator _extendedMeaningForRestaurantMeaningLabel:](PGMeaningAggregationMemoryGenerator, "_extendedMeaningForRestaurantMeaningLabel:", v15);
      if (v19)
        v17 = v19;
      else
        v17 = 15;
    }
LABEL_12:
    objc_msgSend(v12, "allFeatures");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "memoryMomentNodes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[PGMeaningfulEventAggregationMemoryTitleGenerator initWithMeaning:features:meaningfulEvents:titleGenerationContext:]([PGMeaningfulEventAggregationMemoryTitleGenerator alloc], "initWithMeaning:features:meaningfulEvents:titleGenerationContext:", v17, v20, v22, v11);
    -[PGMeaningfulEventAggregationMemoryTitleGenerator setUnreliableMeaningRatioThresholdForSpecificTitle:](v23, "setUnreliableMeaningRatioThresholdForSpecificTitle:", 0.8);
    +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count") == 1)
      -[PGTitleGenerator setFeaturedYearNodes:](v23, "setFeaturedYearNodes:", v24);

    goto LABEL_19;
  }
  if (v16)
  {
    if (v16 == 1)
    {
      v18 = +[PGMeaningAggregationMemoryGenerator _extendedMeaningForActivityMeaningLabel:](PGMeaningAggregationMemoryGenerator, "_extendedMeaningForActivityMeaningLabel:", v15);
      if (v18 <= 1)
        v17 = 1;
      else
        v17 = v18;
    }
    goto LABEL_12;
  }
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v28 = 0;
    _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "[PGMeaningAggregationMemoryGenerator] memory should have a meaning", v28, 2u);
  }

  v23 = 0;
LABEL_20:

  return v23;
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

- (PGMemoryMomentRequirements)momentRequirements
{
  return self->_momentRequirements;
}

- (void)setMomentRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_momentRequirements, a3);
}

- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (void)setOverTheYearsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, a3);
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (void)setFeaturedYearConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __93__PGMeaningAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v13 = a2;
  v7 = a3;
  if (!objc_msgSend(v13, "intersectsCollection:", *(_QWORD *)(a1 + 32))
    || (objc_msgSend(v7, "collectionByIntersecting:", *(_QWORD *)(a1 + 40)),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 = v8,
        objc_msgSend(v8, "count")))
  {
    objc_msgSend((id)objc_opt_class(), "requiredFeatureRelation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v7, v9, objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transposed");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __93__PGMeaningAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
      v14[3] = &unk_1E8428D70;
      v15 = v13;
      v16 = *(id *)(a1 + 56);
      v17 = a4;
      objc_msgSend(v11, "enumerateTargetsBySourceWithBlock:", v14);

    }
    else
    {
      v12 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v13, "featureNodeCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *, uint64_t))(v12 + 16))(v12, v7, v10, a4);
    }

  }
}

void __93__PGMeaningAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  id v9;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = a3;
  objc_msgSend(a2, "collectionByFormingUnionWith:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  *a4 = **(_BYTE **)(a1 + 48);
}

+ (id)supportedMeaningLabels
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Hiking");
  v3[1] = CFSTR("Climbing");
  v3[2] = CFSTR("Beaching");
  v3[3] = CFSTR("Diving");
  v3[4] = CFSTR("WinterSport");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)requiredFeatureRelation
{
  return 0;
}

+ (id)allMeaningAggregationMemoryGeneratorClasses
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)featureRelationWithMeaningLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "allMeaningAggregationMemoryGeneratorClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "supportedMeaningLabels", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v4);

        if (v14)
        {
          objc_msgSend(v12, "requiredFeatureRelation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D42A68], "union:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (unint64_t)_extendedMeaningForMeaning:(unint64_t)a3 meaningfulEvent:(id)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;

  v6 = a4;
  if (a3 == 1)
  {
    v7 = objc_msgSend(a1, "_extendedMeaningForActivityEvent:", v6);
  }
  else
  {
    if (a3 != 15)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = objc_msgSend(a1, "_extendedMeaningForRestaurantEvent:", v6);
  }
  v8 = v7;
LABEL_7:

  return v8;
}

+ (unint64_t)_extendedMeaningForRestaurantEvent:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PGMeaningAggregationMemoryGenerator__extendedMeaningForRestaurantEvent___block_invoke;
  v7[3] = &unk_1E8428DC0;
  v7[4] = &v8;
  v7[5] = a1;
  objc_msgSend(v4, "enumerateMeaningNodesUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (unint64_t)_extendedMeaningForRestaurantMeaningLabel:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Breakfast")) & 1) != 0)
  {
    v4 = 1000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Lunch")) & 1) != 0)
  {
    v4 = 1001;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Dinner")))
  {
    v4 = 1002;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (unint64_t)_extendedMeaningForActivityEvent:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PGMeaningAggregationMemoryGenerator__extendedMeaningForActivityEvent___block_invoke;
  v7[3] = &unk_1E8428DC0;
  v7[4] = &v8;
  v7[5] = a1;
  objc_msgSend(v4, "enumerateMeaningNodesUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (unint64_t)_extendedMeaningForActivityMeaningLabel:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Hiking")) & 1) != 0)
  {
    v4 = 2000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Beaching")) & 1) != 0)
  {
    v4 = 2001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Diving")) & 1) != 0)
  {
    v4 = 2002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WinterSport")) & 1) != 0)
  {
    v4 = 2003;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Climbing")))
  {
    v4 = 2004;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)mostSpecificLabelForMeaning:(unint64_t)a3
{
  __CFString *v3;
  __CFString **v4;

  v3 = CFSTR("Unknown");
  if ((uint64_t)a3 > 1000)
  {
    switch(a3)
    {
      case 0x7D0uLL:
        v4 = kPGGraphNodeMeaningHiking;
        break;
      case 0x7D1uLL:
        v4 = kPGGraphNodeMeaningBeaching;
        break;
      case 0x7D2uLL:
        v4 = kPGGraphNodeMeaningDiving;
        break;
      case 0x7D3uLL:
        v4 = kPGGraphNodeMeaningWinterSport;
        break;
      case 0x7D4uLL:
        v4 = kPGGraphNodeMeaningClimbing;
        break;
      default:
        if (a3 == 1001)
        {
          v4 = kPGGraphNodeMeaningLunch;
        }
        else
        {
          if (a3 != 1002)
            return v3;
          v4 = kPGGraphNodeMeaningDinner;
        }
        break;
    }
  }
  else
  {
    v4 = kPGGraphNodeMeaningActivity;
    switch(a3)
    {
      case 1uLL:
        break;
      case 2uLL:
        v4 = kPGGraphNodeMeaningEntertainment;
        break;
      case 3uLL:
        v4 = kPGGraphNodeMeaningSportEvent;
        break;
      case 4uLL:
        v4 = kPGGraphNodeMeaningAmusementPark;
        break;
      case 5uLL:
        v4 = kPGGraphNodeMeaningPerformance;
        break;
      case 6uLL:
        v4 = kPGGraphNodeMeaningConcert;
        break;
      case 7uLL:
        v4 = kPGGraphNodeMeaningFestival;
        break;
      case 8uLL:
        v4 = kPGGraphNodeMeaningNightOut;
        break;
      case 9uLL:
        v4 = kPGGraphNodeMeaningMuseum;
        break;
      case 0xAuLL:
        v4 = kPGGraphNodeMeaningCelebration;
        break;
      case 0xBuLL:
        v4 = kPGGraphNodeMeaningAnniversary;
        break;
      case 0xCuLL:
        v4 = kPGGraphNodeMeaningBirthday;
        break;
      case 0xDuLL:
        v4 = kPGGraphNodeMeaningHolidayEvent;
        break;
      case 0xEuLL:
        v4 = kPGGraphNodeMeaningWedding;
        break;
      case 0xFuLL:
        v4 = kPGGraphNodeMeaningRestaurant;
        break;
      case 0x10uLL:
        v4 = kPGGraphNodeMeaningGathering;
        break;
      default:
        if (a3 != 1000)
          return v3;
        v4 = &kPGGraphNodeMeaningBreakfast;
        break;
    }
  }
  v3 = *v4;
  return v3;
}

void __72__PGMeaningAggregationMemoryGenerator__extendedMeaningForActivityEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a2, "label");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "_extendedMeaningForActivityMeaningLabel:");
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v6 + 24))
    {
      *(_QWORD *)(v6 + 24) = 0;
      *a3 = 1;
    }
    else
    {
      *(_QWORD *)(v6 + 24) = v5;
    }
  }

}

void __74__PGMeaningAggregationMemoryGenerator__extendedMeaningForRestaurantEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a2, "label");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "_extendedMeaningForRestaurantMeaningLabel:");
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v6 + 24))
    {
      *(_QWORD *)(v6 + 24) = 0;
      *a3 = 1;
    }
    else
    {
      *(_QWORD *)(v6 + 24) = v5;
    }
  }

}

@end
