@implementation PGChildAndPersonMemoryGenerator

- (PGChildAndPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGChildAndPersonMemoryGenerator *v3;
  PGChildAndPersonMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  uint64_t v11;
  PGOverTheYearsMemoryConfiguration *fallbackOverTheYearsConfiguration;
  uint64_t v13;
  PGFeaturedTimePeriodMemoryConfiguration *fallbackFeaturedYearConfiguration;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PGChildAndPersonMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v16, sel_initWithMemoryGenerationContext_, a3);
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
    +[PGOverTheYearsMemoryConfiguration defaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultOverTheYearsMemoryConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_overTheYearsConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
    +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFeaturedYearMemoryConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v4->_featuredYearConfiguration, "setMinimumMomentSpreadicityTimeInterval:", 604800.0);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_featuredYearConfiguration, "setMinimumNumberOfRelevantAssets:", 13);
    v4->_intersectRelevantAssetsForFeatures = 1;
    v4->_minimumNumberOfDefaultMemories = 3;
    +[PGOverTheYearsMemoryConfiguration defaultFallbackOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultFallbackOverTheYearsMemoryConfiguration");
    v11 = objc_claimAutoreleasedReturnValue();
    fallbackOverTheYearsConfiguration = v4->_fallbackOverTheYearsConfiguration;
    v4->_fallbackOverTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v11;

    +[PGFeaturedTimePeriodMemoryConfiguration defaultFallbackFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFallbackFeaturedYearMemoryConfiguration");
    v13 = objc_claimAutoreleasedReturnValue();
    fallbackFeaturedYearConfiguration = v4->_fallbackFeaturedYearConfiguration;
    v4->_fallbackFeaturedYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v13;

  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 29;
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
    return 15003;
  v3 = a3;
  if (a3 == 3)
    return 15004;
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
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v18 = a3;
  v6 = a4;
  +[PGMemoryGeneratorUtils babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:](PGMemoryGeneratorUtils, "babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[PGChildAndPersonMemoryGenerator _twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph:](self, "_twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphNodeCollection nodesInGraph:](PGGraphPersonNodeCollection, "nodesInGraph:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", v10, v11, objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "intersectingSourcesWith:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__PGChildAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v19[3] = &unk_1E842F830;
    v20 = v14;
    v21 = v12;
    v22 = v8;
    v23 = v18;
    v24 = v6;
    v15 = v8;
    v16 = v12;
    v17 = v14;
    objc_msgSend(v13, "enumerateTargetsBySourceWithBlock:", v19);

  }
}

- (id)_twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph:(id)a3
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 6, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__PGChildAndPersonMemoryGenerator__twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph___block_invoke;
  v7[3] = &unk_1E84346C0;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateIdentifiersAsCollectionsWithBlock:", v7);

  return v5;
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
  v11.super_class = (Class)PGChildAndPersonMemoryGenerator;
  v5 = a3;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v11, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReferencePersonLocalIdentifiers:", v9);

  objc_msgSend(v6, "setMinimumNumberOfReferencePersons:", 0);
  return v6;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
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
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t j;
  void *v40;
  void *v41;
  int v42;
  int v43;
  double v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  os_log_t log;
  id v54;
  id v55;
  void *v56;
  os_log_t oslog;
  void *v59;
  id v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t i;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[8];
  _QWORD v76[4];
  os_log_t v77;
  PGChildAndPersonMemoryGenerator *v78;
  uint8_t *v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[8];
  uint8_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v55 = a4;
  v54 = a6;
  v56 = v8;
  objc_msgSend(v8, "memoryFeatureNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v9);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v59, "count") == 2)
  {
    objc_msgSend(v59, "localIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    oslog = (os_log_t)objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](oslog, "count") == 2)
    {
      objc_msgSend(v8, "memoryMomentNodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v83 = buf;
      v84 = 0x3032000000;
      v85 = __Block_byref_object_copy__47698;
      v86 = __Block_byref_object_dispose__47699;
      v87 = 0;
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __109__PGChildAndPersonMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke;
      v76[3] = &unk_1E842F858;
      log = v11;
      v77 = log;
      v78 = self;
      v79 = buf;
      objc_msgSend(v59, "enumerateIdentifiersAsCollectionsWithBlock:", v76);
      if (objc_msgSend(*((id *)v83 + 5), "count"))
      {
        -[NSObject firstObject](oslog, "firstObject");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject lastObject](oslog, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "curationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "defaultAssetFetchOptionsForMemories");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x1E0CD1390];
        objc_msgSend(*((id *)v83 + 5), "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fetchAssetsWithLocalIdentifiers:options:", v17, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x1E0CD1390];
        -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "curationContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v52, 8, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v55);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "anyObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        obj = v21;
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
        if (v63)
        {
          v62 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v63; ++i)
            {
              if (*(_QWORD *)v72 != v62)
                objc_enumerationMutation(obj);
              v64 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              objc_msgSend(v64, "clsFaceInformationSummary");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "faceInformationByPersonLocalIdentifier");
              v66 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v66, "objectForKeyedSubscript:", v12);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "faceSize");
              v27 = v26;

              objc_msgSend(v66, "objectForKeyedSubscript:", v13);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "faceSize");
              v30 = v29;

              if (v27 >= v30)
                v31 = v27;
              else
                v31 = v30;
              if (v23)
              {
                objc_msgSend(v66, "objectForKeyedSubscript:", v23);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "faceSize");
                v34 = v33;

              }
              else
              {
                v34 = 0.0;
              }
              if (v34 < v31 + v31)
              {
                if (v27 >= v30)
                  v27 = v30;
                v69 = 0u;
                v70 = 0u;
                v67 = 0u;
                v68 = 0u;
                v35 = v66;
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
                if (v36)
                {
                  v37 = *(_QWORD *)v68;
                  v38 = 0.0;
                  while (1)
                  {
                    for (j = 0; j != v36; ++j)
                    {
                      if (*(_QWORD *)v68 != v37)
                        objc_enumerationMutation(v35);
                      v40 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
                      objc_msgSend(v35, "objectForKeyedSubscript:", v40);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v40, "isEqualToString:", v12) & 1) != 0)
                      {
                        v42 = 1;
                        if (!v23)
                          goto LABEL_27;
                      }
                      else
                      {
                        v42 = objc_msgSend(v40, "isEqualToString:", v13);
                        if (!v23)
                        {
LABEL_27:
                          v43 = 0;
                          goto LABEL_28;
                        }
                      }
                      v43 = objc_msgSend(v40, "isEqualToString:", v23);
LABEL_28:
                      if (((v42 | v43) & 1) == 0)
                      {
                        objc_msgSend(v41, "faceSize");
                        if (v38 < v44)
                          v38 = v44;
                      }

                    }
                    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
                    if (!v36)
                      goto LABEL_35;
                  }
                }
                v38 = 0.0;
LABEL_35:

                if (v38 < v27 * 0.5)
                {
                  objc_msgSend(v64, "objectID");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "addObject:", v45);

                }
              }

            }
            v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
          }
          while (v63);
        }

        if (objc_msgSend(v60, "count"))
        {
          v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD1580]), "initWithExistingFetchResult:filteredObjectIDs:", v52, v60);
          -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v46, v47, v55);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v75 = 0;
            _os_log_error_impl(&dword_1CA237000, v46, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] Filtered out all relevant assets due to face sizes for memory", v75, 2u);
          }
          v48 = 0;
        }

      }
      else
      {
        -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v75 = 0;
          _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] No relevantAssetLocalIdentifiers found", v75, 2u);
        }
        v48 = 0;
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = -[NSObject count](oslog, "count");
        _os_log_error_impl(&dword_1CA237000, log, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] Two person node local identifiers expected, found %d", buf, 8u);
      }
      v48 = 0;
    }

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = objc_msgSend(v59, "count");
      _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] Two person nodes expected, found %d", buf, 8u);
    }
    v48 = 0;
  }

  return v48;
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGPeopleMemoryTitleGenerator *v17;
  void *v18;
  PGPeopleMemoryTitleGenerator *v19;

  v9 = a7;
  v10 = a3;
  objc_msgSend(v10, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "memoryMomentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "temporarySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGPeopleMemoryTitleGenerator peopleOverTimeTimeTitleOptionsWithMomentNodes:](PGPeopleMemoryTitleGenerator, "peopleOverTimeTimeTitleOptionsWithMomentNodes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") == 1)
    objc_msgSend(v14, "setFeaturedYearNodes:", v15);
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [PGPeopleMemoryTitleGenerator alloc];
  objc_msgSend(v16, "temporarySet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PGPeopleMemoryTitleGenerator initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:](v17, "initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:", v13, v18, v14, 5, v9);

  return v19;
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

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __109__PGChildAndPersonMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[16];

  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", *(_QWORD *)(a1 + 32), a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "allRelevantAssetLocalIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v7)
    {
      objc_msgSend(v7, "intersectSet:", v6);
    }
    else
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v6);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] No personMomentFeatureEdges found for person", buf, 2u);
    }

    *a4 = 1;
  }
}

void __94__PGChildAndPersonMemoryGenerator__twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  objc_msgSend(a3, "featureNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __89__PGChildAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  PGGraphPersonNodeCollection *v20;
  void *v21;
  id v22;
  void *context;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIdentifier:", objc_msgSend(v9, "firstElement"));

  objc_msgSend(*(id *)(a1 + 40), "intersectingTargetsWith:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtractingSourcesWith:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = *(id *)(a1 + 48);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v6, "isSubsetOfCollection:", v18))
        {
          objc_msgSend(v18, "elementIdentifiers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "unionWithIdentifierSet:", v19);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v20 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphPersonNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(a1 + 56), v12);
  objc_msgSend(v11, "subtractingSourcesWith:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__PGChildAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v25[3] = &unk_1E8434808;
  v27 = *(id *)(a1 + 64);
  v22 = v6;
  v26 = v22;
  v28 = a4;
  objc_msgSend(v21, "enumerateTargetsBySourceWithBlock:", v25);

  objc_autoreleasePoolPop(context);
}

void __89__PGChildAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = a3;
  objc_msgSend(v8, "collectionByFormingUnionWith:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featureNodeCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _BYTE *))(v7 + 16))(v7, v9, v11, a4);

  **(_BYTE **)(a1 + 48) = *a4;
}

@end
