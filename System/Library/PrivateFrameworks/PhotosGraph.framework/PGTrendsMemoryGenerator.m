@implementation PGTrendsMemoryGenerator

- (PGTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  id v7;
  PGTrendsMemoryGenerator *v8;
  PGTrendsMemoryGenerator *v9;
  PGMemoryMomentRequirements *v10;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v12;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v14;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  uint64_t v16;
  PGFeaturedTimePeriodMemoryConfiguration *fallbackFeaturedYearConfiguration;
  uint64_t v18;
  PGOverTheYearsMemoryConfiguration *fallbackOverTheYearsConfiguration;
  objc_super v21;

  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PGTrendsMemoryGenerator;
  v8 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v21, sel_initWithMemoryGenerationContext_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configurations, a4);
    v9->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v9->_requireFaceProcessingMeetsThresholdOverTime = 0;
    v10 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v9->_momentRequirements;
    v9->_momentRequirements = v10;

    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v9->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 2);
    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v9->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
    +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "strictDefaultOverTheYearsMemoryConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    overTheYearsConfiguration = v9->_overTheYearsConfiguration;
    v9->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v12;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v9->_overTheYearsConfiguration, "setMinimumNumberOfMoments:", 5);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v9->_overTheYearsConfiguration, "setMinimumNumberOfRelevantAssets:", 15);
    +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "strictDefaultFeaturedYearMemoryConfiguration");
    v14 = objc_claimAutoreleasedReturnValue();
    featuredYearConfiguration = v9->_featuredYearConfiguration;
    v9->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v14;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v9->_featuredYearConfiguration, "setMinimumNumberOfRelevantAssets:", 15);
    +[PGFeaturedTimePeriodMemoryConfiguration defaultFallbackFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFallbackFeaturedYearMemoryConfiguration");
    v16 = objc_claimAutoreleasedReturnValue();
    fallbackFeaturedYearConfiguration = v9->_fallbackFeaturedYearConfiguration;
    v9->_fallbackFeaturedYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v16;

    +[PGOverTheYearsMemoryConfiguration defaultFallbackOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultFallbackOverTheYearsMemoryConfiguration");
    v18 = objc_claimAutoreleasedReturnValue();
    fallbackOverTheYearsConfiguration = v9->_fallbackOverTheYearsConfiguration;
    v9->_fallbackOverTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v18;

    v9->_minimumNumberOfDefaultMemories = 3;
  }

  return v9;
}

- (unint64_t)memoryCategory
{
  return 27;
}

- (id)trendType
{
  return CFSTR("Generic");
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
    return 16001;
  v3 = a3;
  if (a3 == 3)
    return 16002;
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
    v12[2] = __81__PGTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v12[3] = &unk_1E8434280;
    v12[4] = self;
    v13 = v11;
    v14 = v6;
    objc_msgSend(v10, "enumerateTargetsBySourceWithBlock:", v12);

  }
}

- (id)validSceneFeatureNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  PGGraphSceneFeatureNodeCollection *v15;
  PGGraphSceneFeatureNodeCollection *v16;
  id v18;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PGTrendsMemoryGenerator configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "featureLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "validTrendTypes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGTrendsMemoryGenerator trendType](self, "trendType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "containsObject:", v13);

          if (v14)
            objc_msgSend(v4, "addObject:", v11);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] sceneFeatureLabel should not be nil", buf, 2u);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneNames:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneNames:inGraph:", v4, v18);
    v15 = (PGGraphSceneFeatureNodeCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = -[MAElementCollection initWithGraph:]([PGGraphSceneFeatureNodeCollection alloc], "initWithGraph:", v18);
  }
  v16 = v15;

  return v16;
}

- (id)filteredMomentNodes:(id)a3 withSceneLabel:(id)a4 inGraph:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGGraphMomentNodeCollection *winterSportMomentNodes;
  void *v12;
  void *v13;
  PGGraphMomentNodeCollection *v14;
  PGGraphMomentNodeCollection *v15;
  uint64_t v16;
  PGGraphMomentNodeCollection *restaurantMomentNodes;
  void *v18;
  PGGraphMomentNodeCollection *v19;
  PGGraphMomentNodeCollection *v20;
  uint64_t v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Snow")))
  {
    winterSportMomentNodes = self->_winterSportMomentNodes;
    if (!winterSportMomentNodes)
    {
      v23[0] = CFSTR("WinterSport");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "momentNodes");
      v14 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
      v15 = self->_winterSportMomentNodes;
      self->_winterSportMomentNodes = v14;

      winterSportMomentNodes = self->_winterSportMomentNodes;
    }
    objc_msgSend(v8, "collectionBySubtracting:", winterSportMomentNodes);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v16;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Cooking")))
  {
    restaurantMomentNodes = self->_restaurantMomentNodes;
    if (!restaurantMomentNodes)
    {
      +[PGGraphBusinessNodeCollection restaurantBusinessNodesInGraph:](PGGraphBusinessNodeCollection, "restaurantBusinessNodesInGraph:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "momentNodes");
      v19 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
      v20 = self->_restaurantMomentNodes;
      self->_restaurantMomentNodes = v19;

      restaurantMomentNodes = self->_restaurantMomentNodes;
    }
    objc_msgSend(v8, "collectionBySubtracting:", restaurantMomentNodes);
    v21 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v21;
  }

  return v8;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PGTrendsMemoryGenerator;
  v5 = a3;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v11, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "localIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReferencePersonLocalIdentifiers:", v9);

    objc_msgSend(v6, "setMinimumNumberOfReferencePersons:", 0);
  }

  return v6;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGTrendsMemoryGenerator;
  -[PGMemoryGenerator curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:](&v7, sel_curationOptionsWithRequiredAssetUUIDs_eligibleAssetUUIDs_triggeredMemory_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfItems:", 15);
  objc_msgSend(v5, "setFailIfMinimumDurationNotReached:", 1);
  return v5;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  int v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  PGSceneAssetFilter *v57;
  PGSceneAssetFilter *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  PGSceneAssetFilter *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  int v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  uint8_t buf[4];
  int v100;
  uint64_t v101;

  v6 = a5;
  v101 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a3;
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "curationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "memoryFeatureNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphSceneFeatureNodeCollection, "subsetInCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "memoryMomentNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    v94 = v12;
    v87 = v9;
    v92 = v16;
    objc_msgSend(v16, "allRelevantAssetLocalIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "mutableCopy");

    -[PGTrendsMemoryGenerator _trendSceneFeatureLabelsToRequireKnownPeopleInCuration](self, "_trendSceneFeatureLabelsToRequireKnownPeopleInCuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v14;
    objc_msgSend(v14, "labels");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "intersectsSet:", v20);

    if (v21)
    {
      objc_msgSend(v15, "graph");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphPersonNodeCollection personNodesIncludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesIncludingMeInGraph:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v15, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allRelevantAssetLocalIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject intersectSet:](v18, "intersectSet:", v25);

    }
    v12 = v94;
    objc_msgSend(v94, "defaultAssetFetchOptionsForMemories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setIncludeGuestAssets:", v6);
    v27 = (void *)MEMORY[0x1E0CD1390];
    v28 = v18;
    -[NSObject allObjects](v18, "allObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v26;
    objc_msgSend(v27, "fetchAssetsWithLocalIdentifiers:options:", v29, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CD1390];
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "curationContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v30, 20, v33);
    v34 = objc_claimAutoreleasedReturnValue();

    +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationCityNodeCollection, "subsetInCollection:", v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");
    v37 = (void *)MEMORY[0x1E0C99E60];
    v85 = (void *)v34;
    if (v36)
    {
      +[PGCurationManager filterAssets:inMomentNodes:forCityNodes:withMaximumDistance:](PGCurationManager, "filterAssets:inMomentNodes:forCityNodes:withMaximumDistance:", v34, v15, v35, 5000.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setWithArray:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v13);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");
    v93 = v30;
    v89 = v28;
    v90 = v35;
    v88 = v42;
    if (!v43)
    {
      v59 = v39;
LABEL_30:
      v71 = objc_alloc(MEMORY[0x1E0CD1620]);
      objc_msgSend(v59, "allObjects");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "photoLibrary");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fetchType");
      v74 = v59;
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fetchPropertySets");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v71, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v72, v73, v75, v76, 0, 0);

      v59 = v74;
      -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v87;
      +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v45, v77, v87);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v94;
LABEL_31:
      v16 = v92;
      v67 = v85;
LABEL_32:

      v14 = v86;
LABEL_33:

      v40 = v89;
      goto LABEL_34;
    }
    v44 = v43;
    if (v43 != 1)
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v45 = objc_claimAutoreleasedReturnValue();
      v59 = v39;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v100 = v44;
        _os_log_error_impl(&dword_1CA237000, v45, OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] One featured person node expected, found %d", buf, 8u);
      }
      v41 = 0;
      v9 = v87;
      goto LABEL_31;
    }
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v15, v42);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject count](v45, "count"))
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v66, OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] No person moment feature edges found", buf, 2u);
      }

      v41 = 0;
      v9 = v87;
      v16 = v92;
      v67 = v85;
      v59 = v39;
      goto LABEL_32;
    }
    -[NSObject allRelevantAssetLocalIdentifiers](v45, "allRelevantAssetLocalIdentifiers");
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = -[NSObject mutableCopy](v28, "mutableCopy");
    v84 = (void *)v46;
    objc_msgSend(v47, "intersectSet:", v46);
    v48 = (void *)MEMORY[0x1E0CB3880];
    v49 = MEMORY[0x1E0C809B0];
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __101__PGTrendsMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke;
    v97[3] = &unk_1E8430EB8;
    v82 = v47;
    v98 = v82;
    objc_msgSend(v48, "predicateWithBlock:", v97);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "filteredSetUsingPredicate:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = v51;
    if ((unint64_t)objc_msgSend(v51, "count") < 3)
    {
      v59 = v51;

      v30 = v93;
      v12 = v94;
      v16 = v92;
    }
    else
    {
      v52 = -[NSObject mutableCopy](v28, "mutableCopy");
      objc_msgSend(v52, "minusSet:", v84);
      v53 = (void *)MEMORY[0x1E0CB3880];
      v95[0] = v49;
      v95[1] = 3221225472;
      v95[2] = __101__PGTrendsMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke_2;
      v95[3] = &unk_1E8430EB8;
      v81 = v52;
      v96 = v81;
      objc_msgSend(v53, "predicateWithBlock:", v95);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "filteredSetUsingPredicate:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 1);
      v57 = [PGSceneAssetFilter alloc];
      v80 = (void *)v56;
      v58 = -[PGSceneAssetFilter initWithPositiveScenes:negativeScenes:sceneTaxonomy:](v57, "initWithPositiveScenes:negativeScenes:sceneTaxonomy:", MEMORY[0x1E0C9AA60], &unk_1E84E9B80, v56);
      v59 = v39;
      if (v58)
      {
        objc_msgSend(v55, "allObjects");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGSceneAssetFilter filteredAssetsFromAssets:](v58, "filteredAssetsFromAssets:", v60);
        v61 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v83, "setByAddingObjectsFromArray:", v61);
        v62 = objc_claimAutoreleasedReturnValue();

        v63 = (void *)v61;
        v59 = (id)v62;
        v64 = v55;
        v16 = v92;
        v65 = v58;
        v30 = v93;
        v12 = v94;
      }
      else
      {
        v79 = v55;
        -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
        v68 = objc_claimAutoreleasedReturnValue();
        v30 = v93;
        v12 = v94;
        v16 = v92;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA237000, v68, OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] No-people scene asset filter is invalid, disabling", buf, 2u);
        }
        v63 = v68;
        v65 = 0;
        v64 = v79;
      }

      if (!v65)
      {
        v70 = 0;
        v69 = v84;
LABEL_29:

        if (!v70)
        {
          v41 = 0;
          v14 = v86;
          v9 = v87;
          v67 = v85;
          goto LABEL_33;
        }
        goto LABEL_30;
      }
    }
    v69 = v84;
    v70 = 1;
    goto LABEL_29;
  }
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v40, OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] No scene moment feature edges found", buf, 2u);
  }
  v41 = 0;
LABEL_34:

  return v41;
}

- (id)allTrendSceneFeatureNodesInGraph:(id)a3
{
  id v4;
  PGGraphSceneFeatureNodeCollection *allTrendsSceneFeatureNodesInGraph;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  PGGraphSceneFeatureNodeCollection *v19;
  PGGraphSceneFeatureNodeCollection *v20;
  PGGraphSceneFeatureNodeCollection *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  allTrendsSceneFeatureNodesInGraph = self->_allTrendsSceneFeatureNodesInGraph;
  if (!allTrendsSceneFeatureNodesInGraph)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    +[PGTrendsMemoryGenerator trendsConfigurations](PGTrendsMemoryGenerator, "trendsConfigurations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "featureLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    +[PGCLIPTrendsMemoryGenerator CLIPTrendsConfigurations](PGCLIPTrendsMemoryGenerator, "CLIPTrendsConfigurations", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "featureLabel");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v15);
    }

    if (objc_msgSend(v6, "count"))
    {
      +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneNames:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneNames:inGraph:", v6, v4);
      v19 = (PGGraphSceneFeatureNodeCollection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = -[MAElementCollection initWithGraph:]([PGGraphSceneFeatureNodeCollection alloc], "initWithGraph:", v4);
    }
    v20 = self->_allTrendsSceneFeatureNodesInGraph;
    self->_allTrendsSceneFeatureNodesInGraph = v19;

    allTrendsSceneFeatureNodesInGraph = self->_allTrendsSceneFeatureNodesInGraph;
  }
  v21 = allTrendsSceneFeatureNodesInGraph;

  return v21;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PGTimeTitleOptions *v22;
  void *v23;
  void *v24;
  void *v25;
  PGTrendsMemoryTitleGenerator *v26;
  void *v27;
  uint64_t v28;
  PGTrendsMemoryTitleGenerator *v29;
  uint64_t v30;
  PGTrendsMemoryTitleGenerator *v31;
  PGTrendsMemoryTitleGenerator *v32;
  void *v34;
  id v35;
  void *v36;
  uint8_t buf[16];

  v11 = a7;
  v12 = a8;
  v13 = a3;
  objc_msgSend(v13, "memoryFeatureNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "memoryMomentNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "temporarySet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphSceneFeatureNodeCollection, "subsetInCollection:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTrendsMemoryGenerator allTrendSceneFeatureNodesInGraph:](self, "allTrendSceneFeatureNodesInGraph:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "collectionByIntersecting:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count") == 1)
  {
    objc_msgSend(v19, "labels");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anyObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(PGTimeTitleOptions);
    v36 = v16;
    -[PGTimeTitleOptions setMomentNodes:](v22, "setMomentNodes:", v16);
    -[PGTimeTitleOptions setAllowedFormats:](v22, "setAllowedFormats:", 20);
    +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count") == 1)
      -[PGTimeTitleOptions setFeaturedYearNodes:](v22, "setFeaturedYearNodes:", v23);
    +[PGGraphNodeCollection subsetInCollection:](PGGraphOverTheYearsNodeCollection, "subsetInCollection:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTimeTitleOptions setFilterForSignificantDateNodes:](v22, "setFilterForSignificantDateNodes:", objc_msgSend(v24, "count") == 0);
    +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      v26 = [PGTrendsMemoryTitleGenerator alloc];
      objc_msgSend(v25, "anyNode");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PGTrendsMemoryTitleGenerator initWithMomentNodes:sceneFeatureLabel:personNode:titleGenerationContext:timeTitleOptions:](v26, "initWithMomentNodes:sceneFeatureLabel:personNode:titleGenerationContext:timeTitleOptions:", v36, v21, v27, v11, v22);
    }
    else
    {
      v35 = v11;
      +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationCityNodeCollection, "subsetInCollection:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v27, "count");
      v31 = [PGTrendsMemoryTitleGenerator alloc];
      v32 = v31;
      if (v30)
      {
        objc_msgSend(v27, "anyNode");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v35;
        v29 = -[PGTrendsMemoryTitleGenerator initWithMomentNodes:sceneFeatureLabel:cityNode:titleGenerationContext:timeTitleOptions:](v32, "initWithMomentNodes:sceneFeatureLabel:cityNode:titleGenerationContext:timeTitleOptions:", v36, v21, v34, v35, v22);

        goto LABEL_12;
      }
      v11 = v35;
      v28 = -[PGTrendsMemoryTitleGenerator initWithMomentNodes:sceneFeatureLabel:titleGenerationContext:timeTitleOptions:](v31, "initWithMomentNodes:sceneFeatureLabel:titleGenerationContext:timeTitleOptions:", v36, v21, v35, v22);
    }
    v29 = (PGTrendsMemoryTitleGenerator *)v28;
LABEL_12:

    v16 = v36;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to generate Trends title because sceneFeatureNodeCollection count is not equal to 1", buf, 2u);
  }
  v29 = 0;
LABEL_13:

  return v29;
}

- (id)_trendSceneFeatureLabelsToRequireKnownPeopleInCuration
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6[0] = CFSTR("Table");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  return v4;
}

- (NSArray)configurations
{
  return self->_configurations;
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

- (unint64_t)minimumNumberOfDefaultMemories
{
  return self->_minimumNumberOfDefaultMemories;
}

- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3
{
  self->_minimumNumberOfDefaultMemories = a3;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (id)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (id)fallbackOverTheYearsConfiguration
{
  return self->_fallbackOverTheYearsConfiguration;
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (id)fallbackFeaturedYearConfiguration
{
  return self->_fallbackFeaturedYearConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_restaurantMomentNodes, 0);
  objc_storeStrong((id *)&self->_winterSportMomentNodes, 0);
  objc_storeStrong((id *)&self->_allTrendsSceneFeatureNodesInGraph, 0);
}

uint64_t __101__PGTrendsMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __101__PGTrendsMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __81__PGTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(_QWORD *a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = (void *)a1[4];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v9, "labels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredMomentNodes:withSceneLabel:inGraph:", v8, v11, a1[5]);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v12 = a1[6];
  objc_msgSend(v9, "featureNodeCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, uint64_t))(v12 + 16))(v12, v14, v13, a4);
}

+ (id)trendsConfigurations
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PGDictionaryConfigurationSource *v13;
  PGTrendsConfiguration *v14;
  void *v15;
  PGTrendsConfiguration *v16;
  void *v17;
  PGRemoteConfiguration *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  PGDictionaryConfigurationSource *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)trendsConfigurations__trendsConfigurations;
  if (!trendsConfigurations__trendsConfigurations)
  {
    v19 = objc_alloc_init(PGRemoteConfiguration);
    -[PGRemoteConfiguration dictionaryValueForKey:withFallbackValue:](v19, "dictionaryValueForKey:withFallbackValue:", CFSTR("com.apple.photos.memories.trendsmemory.trendsscenes"), MEMORY[0x1E0C9AA70]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "loggingConnection");
      v5 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = CFSTR("com.apple.photos.memories.trendsmemory.trendsscenes");
        _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "PGTrendsMemoryGenerator: Couldn't load remote configuration dictionary from key: %@", buf, 0xCu);
      }

    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v12);
          v14 = [PGTrendsConfiguration alloc];
          v24 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[PGConfiguration initWithSources:version:](v14, "initWithSources:version:", v15, 1.0);

          objc_msgSend(v6, "addObject:", v16);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v9);
    }

    v17 = (void *)trendsConfigurations__trendsConfigurations;
    trendsConfigurations__trendsConfigurations = (uint64_t)v6;

    v2 = (void *)trendsConfigurations__trendsConfigurations;
  }
  return v2;
}

+ (id)allTrendSceneFeatureLabels
{
  _QWORD v3[18];

  v3[17] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Airplane");
  v3[1] = CFSTR("Bird");
  v3[2] = CFSTR("Cityscape");
  v3[3] = CFSTR("Coffee");
  v3[4] = CFSTR("Forest");
  v3[5] = CFSTR("Rainbow");
  v3[6] = CFSTR("Skateboarding");
  v3[7] = CFSTR("Snow");
  v3[8] = CFSTR("SunriseSunset");
  v3[9] = CFSTR("Surfing");
  v3[10] = CFSTR("Waterfall");
  v3[11] = CFSTR("Biking");
  v3[12] = CFSTR("Table");
  v3[13] = CFSTR("Cooking");
  v3[14] = CFSTR("SpringBloom");
  v3[15] = CFSTR("AutumnFoliage");
  v3[16] = CFSTR("PlayTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 17);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
