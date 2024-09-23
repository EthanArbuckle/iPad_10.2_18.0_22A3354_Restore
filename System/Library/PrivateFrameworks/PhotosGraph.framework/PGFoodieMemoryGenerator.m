@implementation PGFoodieMemoryGenerator

- (PGFoodieMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGFoodieMemoryGenerator *v3;
  PGFoodieMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGFoodieMemoryGenerator;
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
    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v4->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 2);
    +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "strictDefaultOverTheYearsMemoryConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_overTheYearsConfiguration, "setMinimumNumberOfRelevantAssets:", 15);
    +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "strictDefaultFeaturedYearMemoryConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_featuredYearConfiguration, "setMinimumNumberOfRelevantAssets:", 15);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 9;
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
    return 6001;
  v3 = a3;
  if (a3 == 3)
    return 6002;
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
  void (**v5)(id, void *, void *, _BYTE *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v5 = (void (**)(id, void *, void *, _BYTE *))a4;
  v6 = a3;
  +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneName:inGraph:", CFSTR("Food"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:](PGFoodieMemoryGenerator, "incompatibleMomentNodesInGraph:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "collectionBySubtracting:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v12 = 0;
    objc_msgSend(v7, "featureNodeCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v10, v11, &v12);

  }
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGFoodieMemoryGenerator;
  -[PGMemoryGenerator curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:](&v7, sel_curationOptionsWithRequiredAssetUUIDs_eligibleAssetUUIDs_triggeredMemory_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfItems:", 15);
  objc_msgSend(v5, "setFailIfMinimumDurationNotReached:", 1);
  return v5;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a7;
  v11 = a3;
  objc_msgSend(v11, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "memoryMomentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGFoodieMemoryGenerator _foodieTitleGeneratorWithMomentNodes:featureNodes:titleGenerationContext:](self, "_foodieTitleGeneratorWithMomentNodes:featureNodes:titleGenerationContext:", v13, v12, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") == 1)
    objc_msgSend(v14, "setFeaturedYearNodes:", v15);

  return v14;
}

- (id)_foodieTitleGeneratorWithMomentNodes:(id)a3 featureNodes:(id)a4 titleGenerationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PGFoodieMemoryTitleGenerator *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  PGFoodieMemoryTitleGenerator *v21;
  PGFoodieMemoryTitleGenerator *v22;
  PGFoodieMemoryTitleGenerator *v23;
  void *v24;
  uint64_t v25;
  PGFoodieMemoryTitleGenerator *v26;
  PGFoodieMemoryTitleGenerator *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  PGFoodieMemoryTitleGenerator *v33;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      +[PGGraphNodeCollection subsetInCollection:](PGGraphNamedLocationNodeCollection, "subsetInCollection:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "anyNode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqual:", CFSTR("City")) & 1) != 0)
      {
        v19 = 1;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("State")) & 1) != 0)
      {
        v19 = 2;
      }
      else if (objc_msgSend(v18, "isEqual:", CFSTR("Country")))
      {
        v19 = 3;
      }
      else
      {
        v19 = 0;
      }
      v26 = [PGFoodieMemoryTitleGenerator alloc];
      objc_msgSend(v8, "temporarySet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PGFoodieMemoryTitleGenerator initWithMomentNodes:tripLocationNode:tripTitleLocationType:titleGenerationContext:](v26, "initWithMomentNodes:tripLocationNode:tripTitleLocationType:titleGenerationContext:", v24, v17, v19, v10);
      goto LABEL_19;
    }
    +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationCityNodeCollection, "subsetInCollection:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v23 = [PGFoodieMemoryTitleGenerator alloc];
      objc_msgSend(v8, "temporarySet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "anyNode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PGFoodieMemoryTitleGenerator initWithMomentNodes:cityNode:titleGenerationContext:](v23, "initWithMomentNodes:cityNode:titleGenerationContext:", v18, v24, v10);
LABEL_19:
      v22 = (PGFoodieMemoryTitleGenerator *)v25;
LABEL_20:

      goto LABEL_21;
    }
    +[PGGraphNodeCollection subsetInCollection:](PGGraphAddressNodeCollection, "subsetInCollection:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v28 = [PGFoodieMemoryTitleGenerator alloc];
      objc_msgSend(v8, "temporarySet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyNode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[PGFoodieMemoryTitleGenerator initWithMomentNodes:addressNode:titleGenerationContext:](v28, "initWithMomentNodes:addressNode:titleGenerationContext:", v24, v29, v10);
    }
    else
    {
      +[PGGraphNodeCollection subsetInCollection:](PGGraphBusinessNodeCollection, "subsetInCollection:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v24, "count");
      v33 = [PGFoodieMemoryTitleGenerator alloc];
      objc_msgSend(v8, "temporarySet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_msgSend(v24, "anyNode");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[PGFoodieMemoryTitleGenerator initWithMomentNodes:businessNode:titleGenerationContext:](v33, "initWithMomentNodes:businessNode:titleGenerationContext:", v29, v32, v10);

        goto LABEL_27;
      }
      v30 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](v33, "initWithMomentNodes:type:titleGenerationContext:", v29, 0, v10);
    }
    v22 = (PGFoodieMemoryTitleGenerator *)v30;
LABEL_27:

    goto LABEL_20;
  }
  objc_msgSend(v11, "anyNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = [PGFoodieMemoryTitleGenerator alloc];
    objc_msgSend(v8, "temporarySet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PGFoodieMemoryTitleGenerator initWithMomentNodes:personNode:titleGenerationContext:](v13, "initWithMomentNodes:personNode:titleGenerationContext:", v14, v12, v10);
  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "person node is unexpectedly nil when our collection wasn't empty", buf, 2u);
    }

    v21 = [PGFoodieMemoryTitleGenerator alloc];
    objc_msgSend(v8, "temporarySet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](v21, "initWithMomentNodes:type:titleGenerationContext:", v14, 0, v10);
  }
  v22 = (PGFoodieMemoryTitleGenerator *)v15;

LABEL_21:
  return v22;
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
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "memoryFeatureNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "curationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "anyNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "curationCriteriaFactory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "foodieCurationCriteriaWithPersonLocalIdentifier:client:", v13, 1);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] Nil local identifier found for featured person, falling back to default key asset curation criteria", buf, 2u);
      }

      objc_msgSend(v11, "curationCriteriaFactory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "foodieCurationCriteriaWithClient:", 1);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;

  }
  else
  {
    objc_msgSend(v11, "curationCriteriaFactory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "foodieCurationCriteriaWithClient:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v20.receiver = self;
  v20.super_class = (Class)PGFoodieMemoryGenerator;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v20, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v7, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setComplete:", 1);
  objc_msgSend(v18, "setCurationCriteria:", v16);

  return v18;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  id v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  char v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  NSObject *v127;
  void *v128;
  id v129;
  void *v130;
  PGFoodieMemoryGenerator *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  id v137;
  void *v138;
  NSObject *log;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  id v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  CLLocationCoordinate2D v149;
  void *v150;
  uint8_t v151[128];
  uint8_t buf[8];
  uint64_t v153;
  uint64_t v154;
  CLLocationCoordinate2D v155;

  v7 = a5;
  v154 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "memoryFeatureNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphSceneFeatureNodeCollection, "subsetInCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v10, "memoryMomentNodes");
    v15 = objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "count"))
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, log, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] No moment feature edges for food found", buf, 2u);
      }
      v38 = 0;
      goto LABEL_65;
    }
    v125 = v14;
    v126 = v11;
    v128 = v13;
    v124 = v16;
    objc_msgSend(v16, "allRelevantAssetUUIDs");
    v17 = objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "curationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "defaultAssetFetchOptionsForMemories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setIncludeGuestAssets:", v7);
    v21 = (void *)MEMORY[0x1E0CD1390];
    -[NSObject allObjects](v17, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v20;
    objc_msgSend(v21, "fetchAssetsWithUUIDs:options:", v22, v20);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CD1390];
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "curationContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = (void *)v23;
    objc_msgSend(v24, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v23, 1, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "photoLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "librarySpecificFetchOptions");
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CD13B8];
    -[NSObject localIdentifiers](v15, "localIdentifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = (void *)v30;
    objc_msgSend(v31, "fetchAssetCollectionsWithLocalIdentifiers:options:", v33, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v34;
    v36 = objc_msgSend(v34, "count");
    v127 = v15;
    log = v17;
    if (v36 < -[NSObject count](v15, "count"))
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v37 = objc_claimAutoreleasedReturnValue();
      v13 = v128;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v37, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] Failed to fetch all momentNodes, graph is out-of-sync with the photo library.", buf, 2u);
      }
      v38 = 0;
      goto LABEL_64;
    }
    v131 = self;
    v13 = v128;
    +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v128);
    v39 = objc_claimAutoreleasedReturnValue();
    v142 = -[NSObject count](v39, "count");
    v121 = v39;
    if (v142)
    {
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v15, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v40, "count"))
      {
        v144 = v40;
        -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA237000, v68, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] No moment feature edges for person found", buf, 2u);
        }
        v38 = 0;
        v138 = (void *)MEMORY[0x1E0C9AA60];
        v37 = v121;
LABEL_63:

LABEL_64:
        v16 = v124;
        v14 = v125;
        v11 = v126;
        v15 = v127;
LABEL_65:

        goto LABEL_66;
      }
      objc_msgSend(v40, "allRelevantAssetUUIDs");
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "allObjects");
      v138 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v138 = (void *)MEMORY[0x1E0C9AA60];
    }
    v119 = v12;
    v120 = v10;
    v144 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v129 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v130 = v35;
    if (objc_msgSend(v35, "count"))
    {
      v43 = 0;
      do
      {
        v135 = (void *)MEMORY[0x1CAA4EB2C]();
        v136 = v43;
        objc_msgSend(v35, "objectAtIndexedSubscript:", v43);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:");
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0CD1390];
        -[PGMemoryGenerator memoryCurationSession](v131, "memoryCurationSession");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "curationContext");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = (void *)v44;
        objc_msgSend(v45, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v44, 1, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v137 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v140 = v49;
        if (objc_msgSend(v48, "count"))
        {
          v50 = 0;
          do
          {
            v51 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(v48, "objectAtIndexedSubscript:", v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "uuid");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addObject:", v53);
            if ((-[NSObject containsObject:](v17, "containsObject:", v53) & 1) == 0)
            {
              v54 = objc_msgSend(v52, "clsPeopleCount");
              if (v54)
              {
                if (!v142 || (v55 = v54, v56 = objc_msgSend(v138, "containsObject:", v53), v55 <= 2) && v56)
                {
                  objc_msgSend(v52, "creationDate", v119, v120);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "locationCoordinate");
                  *(_QWORD *)buf = v58;
                  v153 = v59;
                  if (objc_msgSend(v27, "count"))
                  {
                    v60 = 0;
                    while (1)
                    {
                      objc_msgSend(v27, "objectAtIndexedSubscript:", v60);
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v61, "creationDate");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "timeIntervalSinceDate:", v62);
                      v64 = fabs(v63);

                      if (v64 < 600.0)
                      {
                        objc_msgSend(v61, "locationCoordinate");
                        v149 = v155;
                        if (CLLocationCoordinate2DIsValid(v155))
                        {
                          CLLocationCoordinate2DGetDistanceFrom();
                          if (v65 < 200.0)
                            break;
                        }
                      }

                      if (++v60 >= (unint64_t)objc_msgSend(v27, "count"))
                        goto LABEL_34;
                    }
                    objc_msgSend(v137, "addObject:", v52);

                  }
LABEL_34:

                  v17 = log;
                  v49 = v140;
                }
              }
            }

            objc_autoreleasePoolPop(v51);
            ++v50;
          }
          while (v50 < objc_msgSend(v48, "count"));
        }
        if (v142 && !objc_msgSend(v137, "count"))
        {
          v66 = v144;
          v67 = v49;
        }
        else
        {
          v66 = v129;
          v67 = v137;
        }
        objc_msgSend(v66, "addObjectsFromArray:", v67, v119, v120);
        v35 = v130;

        objc_autoreleasePoolPop(v135);
        v43 = v136 + 1;
      }
      while (v136 + 1 < (unint64_t)objc_msgSend(v130, "count"));
    }
    v68 = v129;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v69 = v27;
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
    v37 = v121;
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v146;
      do
      {
        for (i = 0; i != v71; ++i)
        {
          if (*(_QWORD *)v146 != v72)
            objc_enumerationMutation(v69);
          v74 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
          objc_msgSend(v74, "uuid", v119, v120);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v144, "containsObject:", v75);

          if ((v76 & 1) == 0)
            -[NSObject addObject:](v68, "addObject:", v74);
        }
        v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
      }
      while (v71);
    }

    if (v142)
    {
      v77 = objc_alloc(MEMORY[0x1E0CD1620]);
      objc_msgSend(v132, "photoLibrary");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v132, "fetchPropertySets");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setWithArray:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v77, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v68, v78, 0, v81, 0, 0);

      -[PGMemoryGenerator memoryCurationSession](v131, "memoryCurationSession");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v82, v83, v126);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v119;
      v10 = v120;
    }
    else
    {
      +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", v128);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationCityNodeCollection, "subsetInCollection:", v128);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v82, "count") || objc_msgSend(v84, "count"))
      {
        if (objc_msgSend(v84, "count", v119, v120))
        {
          v85 = v127;
        }
        else
        {
          +[PGGraphNodeCollection subsetInCollection:](PGGraphNamedLocationNodeCollection, "subsetInCollection:", v128);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "addressNodes");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "cityNodes");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v127;
          -[NSObject cityNodes](v127, "cityNodes");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "collectionByIntersecting:", v89);
          v90 = objc_claimAutoreleasedReturnValue();

          v84 = (void *)v90;
        }
        v143 = v84;
        +[PGCurationManager filterAssets:inMomentNodes:forCityNodes:withMaximumDistance:](PGCurationManager, "filterAssets:inMomentNodes:forCityNodes:withMaximumDistance:", v68, v85, v84, 5000.0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_alloc(MEMORY[0x1E0CD1620]);
        objc_msgSend(v132, "photoLibrary");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v132, "fetchPropertySets");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setWithArray:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = (void *)objc_msgSend(v92, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v91, v93, 0, v96, 0, 0);

        -[PGMemoryGenerator memoryCurationSession](v131, "memoryCurationSession");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v97, v98, v126);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v121;
      }
      else
      {
        v143 = v84;
        +[PGGraphNodeCollection subsetInCollection:](PGGraphAddressNodeCollection, "subsetInCollection:", v128);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphNodeCollection subsetInCollection:](PGGraphBusinessNodeCollection, "subsetInCollection:", v128);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = v82;
        if (objc_msgSend(v100, "count") || objc_msgSend(v97, "count"))
        {
          objc_msgSend(v100, "locations", v119, v120);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v100;
          if (!objc_msgSend(v100, "count"))
          {
            objc_msgSend(v97, "anyNode");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "coordinates");
            v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v102, v103);
            v150 = v104;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
            v105 = objc_claimAutoreleasedReturnValue();

            v98 = (void *)v105;
          }
          +[PGCurationManager filterAssets:withLocations:maximumDistance:](PGCurationManager, "filterAssets:withLocations:maximumDistance:", v68, v98, 100.0);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_alloc(MEMORY[0x1E0CD1620]);
          objc_msgSend(v132, "photoLibrary");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v132, "fetchPropertySets");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "setWithArray:", v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = (void *)objc_msgSend(v107, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v106, v108, 0, v111, 0, 0);

          -[PGMemoryGenerator memoryCurationSession](v131, "memoryCurationSession");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v112, v113, v126);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = v121;
        }
        else
        {
          v91 = v100;
          v114 = objc_alloc(MEMORY[0x1E0CD1620]);
          objc_msgSend(v132, "photoLibrary");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v132, "fetchPropertySets");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "setWithArray:", v117);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = (void *)objc_msgSend(v114, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v68, v115, 0, v118, 0, 0);

          -[PGMemoryGenerator memoryCurationSession](v131, "memoryCurationSession");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v98, v106, v126);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v82 = v141;
      }

      v12 = v119;
      v10 = v120;
      v83 = v143;
    }

    v13 = v128;
    v35 = v130;
    goto LABEL_63;
  }
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v14, "count");
    _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] One food scene feature node expected, found %d", buf, 8u);
  }
  v38 = 0;
LABEL_66:

  return v38;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

+ (id)incompatibleMomentNodesInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PGGraphPOINodeCollection poiNodesForLabel:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabel:inGraph:", CFSTR("Hospital"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("Wedding");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionByFormingUnionWith:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
