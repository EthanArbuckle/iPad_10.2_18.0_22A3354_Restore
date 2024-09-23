@implementation PGOverTimeMemoryGenerator

- (unint64_t)memoryCategory
{
  id v2;

  PGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  id v3;

  PGAbstractMethodException(self, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  PGAbstractMethodException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *, void *, _BYTE *);
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  PGOverTimeMemoryGenerator *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _BYTE *v46;
  uint64_t v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  _BYTE v52[24];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGOverTimeMemoryGenerator overTheYearsConfiguration](self, "overTheYearsConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (-[PGOverTimeMemoryGenerator featuredYearConfiguration](self, "featuredYearConfiguration"),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_4;
  }
  -[PGOverTimeMemoryGenerator featuredSeasonConfiguration](self, "featuredSeasonConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v52 = 0;
    *(_QWORD *)&v52[8] = v52;
    *(_QWORD *)&v52[16] = 0x2020000000;
    LOBYTE(v53) = 0;
    -[PGMemoryGenerator momentNodesWithBlockedFeatureCache](self, "momentNodesWithBlockedFeatureCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "momentNodesWithBlockedFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "momentNodesAtSensitiveLocationsInGraph:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphNodeCollection nodesInGraph:](PGGraphOverTheYearsNodeCollection, "nodesInGraph:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
    v37 = &unk_1E8432F68;
    v46 = v52;
    v17 = v9;
    v38 = v17;
    v47 = 0x3FE0000000000000;
    v18 = v11;
    v39 = v18;
    v19 = v13;
    v40 = v19;
    v41 = self;
    v20 = v14;
    v42 = v20;
    v21 = v15;
    v43 = v21;
    v22 = v16;
    v44 = v22;
    v45 = v6;
    -[PGOverTimeMemoryGenerator enumerateMomentNodesAndFeatureNodesInGraph:usingBlock:](self, "enumerateMomentNodesAndFeatureNodesInGraph:usingBlock:", v45, &v34);
    if (*(_BYTE *)(*(_QWORD *)&v52[8] + 24))
    {
      *(_BYTE *)(*(_QWORD *)&v52[8] + 24) = 1;
LABEL_7:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v49 = 135;
        v50 = 2080;
        v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/PGOverTimeMemoryGenerator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v24 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_10;
    }
    v23 = -[NSObject isCancelledWithProgress:](v17, "isCancelledWithProgress:", 1.0, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44);
    *(_BYTE *)(*(_QWORD *)&v52[8] + 24) = v23;
    if ((v23 & 1) != 0)
      goto LABEL_7;
    -[PGOverTimeMemoryGenerator fallbackOverTheYearsConfiguration](self, "fallbackOverTheYearsConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {

    }
    else
    {
      -[PGOverTimeMemoryGenerator fallbackFeaturedYearConfiguration](self, "fallbackFeaturedYearConfiguration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28 == 0;

      if (v29)
      {
LABEL_21:
        v24 = v21;
LABEL_10:

        _Block_object_dispose(v52, 8);
        goto LABEL_11;
      }
    }
    v30 = objc_msgSend(v21, "count");
    if (v30 < -[PGOverTimeMemoryGenerator minimumNumberOfDefaultMemories](self, "minimumNumberOfDefaultMemories"))
      objc_msgSend(v21, "addObjectsFromArray:", v22);
    goto LABEL_21;
  }
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    -[PGOverTimeMemoryGenerator overTheYearsConfiguration](self, "overTheYearsConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGOverTimeMemoryGenerator featuredYearConfiguration](self, "featuredYearConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGOverTimeMemoryGenerator featuredSeasonConfiguration](self, "featuredSeasonConfiguration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v52 = 138412802;
    *(_QWORD *)&v52[4] = v31;
    *(_WORD *)&v52[12] = 2112;
    *(_QWORD *)&v52[14] = v32;
    *(_WORD *)&v52[22] = 2112;
    v53 = v33;
    _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "[PGOverTimeMemoryGenerator] At least one of the overTheYearsConfiguration (%@), featuredYearConfiguration (%@), or featuredSeasonConfiguration (%@) must not be nil", v52, 0x20u);

  }
  v24 = (id)MEMORY[0x1E0C9AA60];
LABEL_11:

  return v24;
}

- (id)_filteredMomentNodesFromMomentNodes:(id)a3 featureNodes:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, void *);
  void *v36;
  PGOverTimeMemoryGenerator *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "filterUninterestingWithAlternateJunking");

  v11 = v8;
  if (v10)
  {
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "interestingWithAlternateJunkingSubsetFromMomentNodes:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "filterUninterestingForMemories");

  if (v14)
  {
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interestingForMemoriesSubsetFromMomentNodes:", v11);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "minimumNumberOfRelevantAssets");

  -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "minimumNumberOfAssetsInExtendedCuration");

  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __78__PGOverTimeMemoryGenerator__filteredMomentNodesFromMomentNodes_featureNodes___block_invoke;
  v36 = &unk_1E8432F90;
  v39 = v20;
  v40 = v18;
  v37 = self;
  v38 = v7;
  v21 = v7;
  objc_msgSend(v11, "filteredCollectionUsingBlock:", &v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements", v33, v34, v35, v36, v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "aboveContentScoreThreshold");
  v25 = v24;

  if (v25 > 0.0)
  {
    -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "aboveContentScoreThreshold");
    objc_msgSend(v22, "momentNodesWithContentScoreAbove:");
    v27 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v27;
  }
  -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "minimumNumberOfPersons");

  if (v29)
  {
    -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "momentNodesWithMinimumNumberOfPersons:", objc_msgSend(v30, "minimumNumberOfPersons"));
    v31 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v31;
  }

  return v22;
}

- (BOOL)_shouldCreateOverTheYearsMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    v16 = 0;
    goto LABEL_19;
  }
  v12 = objc_msgSend(v10, "minimumNumberOfMoments");
  -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "yearNodesForMomentNodes:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "count");
  if (v15 < objc_msgSend(v11, "minimumNumberOfYears"))
  {
    v16 = 0;
    if (!objc_msgSend(v11, "allowTwoConsecutiveYears") || v15 != 2)
      goto LABEL_17;
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "yearsForYearNodes:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");
    objc_msgSend(v18, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");
    if (v20 - v22 >= 0)
      v23 = v20 - v22;
    else
      v23 = v22 - v20;

    if (v23 != 1)
      goto LABEL_15;
    v12 = objc_msgSend(v11, "minimumNumberOfMomentsForTwoConsecutiveYears");

  }
  objc_msgSend(v8, "universalStartDates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minimumMomentSpreadicityTimeInterval");
  if (!+[PGMemoryGenerationHelper dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:](PGMemoryGenerationHelper, "dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:", v18, v12))goto LABEL_15;
  -[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "libraryHasEnoughScenesProcessed:andProcessedFaces:", -[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime"), -[PGOverTimeMemoryGenerator requireFaceProcessingMeetsThresholdOverTime](self, "requireFaceProcessingMeetsThresholdOverTime"));

  if (!v25
    || -[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime")&& (-[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v27 = objc_msgSend(v26, "libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:", -[PGOverTimeMemoryGenerator minimumSceneAnalysisVersion](self, "minimumSceneAnalysisVersion")), v26, !v27))
  {
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  v16 = -[PGOverTimeMemoryGenerator _shouldCreateMemoryForMomentNodes:featureNodes:withConfiguration:](self, "_shouldCreateMemoryForMomentNodes:featureNodes:withConfiguration:", v8, v9, v11);
LABEL_16:

LABEL_17:
LABEL_19:

  return v16;
}

- (BOOL)_shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:(id)a3 configuration:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;

  if (!a4)
    return 0;
  v5 = a4;
  v6 = objc_msgSend(a3, "count");
  v7 = objc_msgSend(v5, "minimumNumberOfMoments");

  return v6 >= v7;
}

- (BOOL)_shouldCreateFeaturedYearMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 inYear:(int64_t)a5 configuration:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL8 v22;
  _BOOL8 v23;
  void *v24;
  int v25;
  void *v26;
  int v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "universalDateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "duration");
  v15 = v14;
  objc_msgSend(v12, "minimumOverallTimeIntervalOfMoments");
  v17 = v16;

  if (v15 >= v17)
  {
    objc_msgSend(v10, "universalStartDates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v12, "minimumNumberOfMoments");
    objc_msgSend(v12, "minimumMomentSpreadicityTimeInterval");
    if (!+[PGMemoryGenerationHelper dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:](PGMemoryGenerationHelper, "dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:", v19, v20))goto LABEL_8;
    -[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime");
    v23 = -[PGOverTimeMemoryGenerator requireFaceProcessingMeetsThresholdOverTime](self, "requireFaceProcessingMeetsThresholdOverTime");
    objc_msgSend(v10, "graph");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v21, "libraryHasEnoughScenesProcessed:andProcessedFaces:forYear:inGraph:", v22, v23, a5, v24);

    if (!v25)
      goto LABEL_8;
    if (!-[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime")|| (-[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v27 = objc_msgSend(v26, "libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:", -[PGOverTimeMemoryGenerator minimumSceneAnalysisVersion](self, "minimumSceneAnalysisVersion")), v26, v27))
    {
      v18 = -[PGOverTimeMemoryGenerator _shouldCreateMemoryForMomentNodes:featureNodes:withConfiguration:](self, "_shouldCreateMemoryForMomentNodes:featureNodes:withConfiguration:", v10, v11, v12);
    }
    else
    {
LABEL_8:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_shouldCreateFeaturedSeasonMemoryForMomentNodes:(id)a3 featureNodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGOverTimeMemoryGenerator featuredSeasonConfiguration](self, "featuredSeasonConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalDateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "duration");
  v11 = v10;
  objc_msgSend(v8, "minimumOverallTimeIntervalOfMoments");
  v13 = v12;

  if (v11 >= v13)
  {
    v33 = v7;
    v34 = v8;
    objc_msgSend(v6, "graph");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v6;
    objc_msgSend(v16, "yearNodesForMomentNodes:", v6);
    v17 = objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v17;
    objc_msgSend(v18, "yearsForYearNodes:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "libraryHasEnoughScenesProcessed:andProcessedFaces:forYear:inGraph:", -[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime"), -[PGOverTimeMemoryGenerator requireFaceProcessingMeetsThresholdOverTime](self, "requireFaceProcessingMeetsThresholdOverTime"), objc_msgSend(v24, "integerValue"), v15);

          if (!v26)
          {
            v14 = 0;
            v8 = v34;
            v6 = v35;
            goto LABEL_16;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v21)
          continue;
        break;
      }
    }

    if (-[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime")&& (-[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache"), v27 = (void *)objc_claimAutoreleasedReturnValue(), v28 = objc_msgSend(v27, "libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:", -[PGOverTimeMemoryGenerator minimumSceneAnalysisVersion](self, "minimumSceneAnalysisVersion")), v27, !v28))
    {
      v14 = 0;
      v8 = v34;
      v6 = v35;
      v30 = v32;
      v7 = v33;
    }
    else
    {
      v6 = v35;
      objc_msgSend(v35, "universalStartDates");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v34;
      v29 = objc_msgSend(v34, "minimumNumberOfMoments");
      objc_msgSend(v34, "minimumMomentSpreadicityTimeInterval");
      if (+[PGMemoryGenerationHelper dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:](PGMemoryGenerationHelper, "dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:", v19, v29))
      {
        v7 = v33;
        v14 = -[PGOverTimeMemoryGenerator _shouldCreateMemoryForMomentNodes:featureNodes:withConfiguration:](self, "_shouldCreateMemoryForMomentNodes:featureNodes:withConfiguration:", v35, v33, v34);
      }
      else
      {
        v14 = 0;
LABEL_16:
        v7 = v33;
      }
      v30 = v32;

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldCreateMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 withConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  char v12;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  int v35;
  void *v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  if (v11 < objc_msgSend(v10, "minimumNumberOfMoments"))
    goto LABEL_2;
  -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "filterUninterestingWithAlternateJunking") & 1) != 0
    || !objc_msgSend(v10, "minimumNumberOfMomentsInterestingWithAlternateJunking"))
  {

  }
  else
  {
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interestingWithAlternateJunkingSubsetFromMomentNodes:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v18 = objc_msgSend(v10, "minimumNumberOfMomentsInterestingWithAlternateJunking");

    if (v17 < v18)
      goto LABEL_2;
  }
  -[PGOverTimeMemoryGenerator momentRequirements](self, "momentRequirements");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "filterUninterestingForMemories") & 1) != 0
    || !objc_msgSend(v10, "minimumNumberOfMomentsInterestingForMemories"))
  {

    goto LABEL_14;
  }
  -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "interestingForMemoriesSubsetFromMomentNodes:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  v23 = objc_msgSend(v10, "minimumNumberOfMomentsInterestingForMemories");

  if (v22 < v23)
  {
LABEL_2:
    v12 = 0;
    goto LABEL_3;
  }
LABEL_14:
  if (objc_msgSend(v10, "minimumNumberOfAssetsInExtendedCuration"))
  {
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "numberOfAssetsInExtendedCurationForMomentNodes:", v8);
    v26 = objc_msgSend(v10, "minimumNumberOfAssetsInExtendedCuration");

    if (v25 < v26)
      goto LABEL_2;
  }
  if (objc_msgSend(v10, "minimumNumberOfRelevantAssets"))
  {
    v27 = -[PGOverTimeMemoryGenerator numberOfRelevantAssetsForMomentNodes:featureNodes:](self, "numberOfRelevantAssetsForMomentNodes:featureNodes:", v8, v9);
    if (v27 < objc_msgSend(v10, "minimumNumberOfRelevantAssets"))
      goto LABEL_2;
  }
  objc_msgSend(v10, "aboveMomentAverageContentScoreThreshold");
  if (v28 > 0.0)
  {
    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "averageContentScoreForMomentNodes:", v8);
    v31 = v30;
    objc_msgSend(v10, "aboveMomentAverageContentScoreThreshold");
    v33 = v32;

    if (v31 <= v33)
      goto LABEL_2;
  }
  if (objc_msgSend(v10, "allMomentsMustHaveScenesProcessed"))
  {
    -[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "allMomentNodesInCollectionHaveScenesProcessed:", v8);

    if (!v35)
      goto LABEL_2;
  }
  if (objc_msgSend(v10, "allMomentsMustHaveFacesProcessed"))
  {
    -[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v36, "allMomentNodesInCollectionHaveFacesProcessed:", v8);

  }
  else
  {
    v12 = 1;
  }
LABEL_3:

  return v12;
}

- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (-[PGOverTimeMemoryGenerator intersectRelevantAssetsForFeatures](self, "intersectRelevantAssetsForFeatures"))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__57767;
    v21 = __Block_byref_object_dispose__57768;
    v22 = 0;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __79__PGOverTimeMemoryGenerator_numberOfRelevantAssetsForMomentNodes_featureNodes___block_invoke;
    v14 = &unk_1E8432FB8;
    v15 = v6;
    v16 = &v17;
    objc_msgSend(v7, "enumerateIdentifiersAsCollectionsWithBlock:", &v11);
    v8 = objc_msgSend((id)v18[5], "count", v11, v12, v13, v14);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "numberOfRelevantAssets");

  }
  return v8;
}

- (id)allFeatureNodesForMemoryNodeWithFeatureNodes:(id)a3
{
  return a3;
}

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  id v7;
  void *v8;
  void *v9;
  PGYearChapterTitleGenerator *v10;

  v7 = a3;
  objc_msgSend(v7, "memoryFeatureNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphOverTheYearsNodeCollection, "subsetInCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    v10 = -[PGYearChapterTitleGenerator initWithTriggeredMemory:]([PGYearChapterTitleGenerator alloc], "initWithTriggeredMemory:", v7);
  else
    v10 = 0;

  return v10;
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

- (unint64_t)minimumSceneAnalysisVersion
{
  return self->_minimumSceneAnalysisVersion;
}

- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3
{
  self->_minimumSceneAnalysisVersion = a3;
}

- (unint64_t)minimumNumberOfDefaultMemories
{
  return self->_minimumNumberOfDefaultMemories;
}

- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3
{
  self->_minimumNumberOfDefaultMemories = a3;
}

- (PGMemoryMomentRequirements)momentRequirements
{
  return self->_momentRequirements;
}

- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (PGOverTheYearsMemoryConfiguration)fallbackOverTheYearsConfiguration
{
  return self->_fallbackOverTheYearsConfiguration;
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (PGFeaturedTimePeriodMemoryConfiguration)fallbackFeaturedYearConfiguration
{
  return self->_fallbackFeaturedYearConfiguration;
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_yearByYearNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_interestingForMemoriesMomentNodes, 0);
}

void __79__PGOverTimeMemoryGenerator_numberOfRelevantAssetsForMomentNodes_featureNodes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", *(_QWORD *)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allRelevantAssetUUIDs");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    objc_msgSend(v5, "intersectSet:", v9);
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v9);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

uint64_t __78__PGOverTimeMemoryGenerator__filteredMomentNodesFromMomentNodes_featureNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  if (*(_QWORD *)(a1 + 48)
    && (objc_msgSend(*(id *)(a1 + 32), "memoryGenerationContext"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "numberOfAssetsInExtendedCurationForMomentNodes:", v3),
        v7 = *(_QWORD *)(a1 + 48),
        v5,
        v6 < v7)
    || *(_QWORD *)(a1 + 56)
    && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "numberOfRelevantAssetsForMomentNodes:featureNodes:", v3, *(_QWORD *)(a1 + 40)) < *(_QWORD *)(a1 + 56))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "momentRequirements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "filterMomentsWithNotEnoughScenesProcessed"))
    {
      objc_msgSend(*(id *)(a1 + 32), "processedScenesAndFacesCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "allMomentNodesInCollectionHaveScenesProcessed:", v3);

    }
    else
    {
      v8 = 1;
    }

  }
  objc_autoreleasePoolPop(v4);

  return v8;
}

void __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PGGraphMemory *v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  char v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  char v53;

  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  if (*(_BYTE *)(v10 + 24))
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(a1 + 104));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  }
  *(_BYTE *)(v10 + 24) = v11;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    *a4 = 1;
    goto LABEL_20;
  }
  objc_msgSend(v7, "collectionBySubtracting:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "collectionBySubtracting:", *(_QWORD *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v7, "count");
  objc_msgSend(*(id *)(a1 + 56), "overTheYearsConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 >= objc_msgSend(v14, "minimumNumberOfMoments"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "featuredYearConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "minimumNumberOfMoments");

    if (v13 < v16)
      goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 56), "_filteredMomentNodesFromMomentNodes:featureNodes:", v7, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(a1 + 56);
  objc_msgSend(v18, "overTheYearsConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v18, "_shouldCreateOverTheYearsMemoryForMomentNodes:featureNodes:configuration:", v17, v8, v19);

  if ((_DWORD)v18)
  {
    objc_msgSend(*(id *)(a1 + 64), "featureNodeCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionByFormingUnionWith:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "allFeatureNodesForMemoryNodeWithFeatureNodes:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", objc_msgSend(*(id *)(a1 + 56), "memoryCategory"), objc_msgSend(*(id *)(a1 + 56), "memoryCategorySubcategoryForOverTimeType:", 3), v17, v22);
    v24 = (id *)(a1 + 72);
LABEL_14:
    objc_msgSend(*v24, "addObject:", v23);

    goto LABEL_15;
  }
  v25 = *(void **)(a1 + 56);
  objc_msgSend(v25, "fallbackOverTheYearsConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = objc_msgSend(v25, "_shouldCreateOverTheYearsMemoryForMomentNodes:featureNodes:configuration:", v17, v8, v26);

  if ((_DWORD)v25)
  {
    objc_msgSend(*(id *)(a1 + 64), "featureNodeCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionByFormingUnionWith:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "allFeatureNodesForMemoryNodeWithFeatureNodes:", v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:", objc_msgSend(*(id *)(a1 + 56), "memoryCategory"), objc_msgSend(*(id *)(a1 + 56), "memoryCategorySubcategoryForOverTimeType:", 3), v17, v22, 1);
    v24 = (id *)(a1 + 80);
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 56), "featuredYearConfiguration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 56), "_shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:configuration:", v17, v29))
  {
    objc_msgSend(*(id *)(a1 + 56), "fallbackFeaturedYearConfiguration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(*(id *)(a1 + 56), "_shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:configuration:", v17, v30);
    objc_msgSend(*(id *)(a1 + 56), "memoryGenerationContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "yearNodesByMomentNodeInGraph:", *(_QWORD *)(a1 + 88));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "intersectingSourcesWith:", v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "transposed");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2;
    v47[3] = &unk_1E8432F18;
    v47[4] = *(_QWORD *)(a1 + 56);
    v48 = v8;
    v49 = v29;
    v35 = *(id *)(a1 + 72);
    v53 = v42;
    v50 = v35;
    v51 = v30;
    v52 = *(id *)(a1 + 80);
    v36 = v30;
    objc_msgSend(v34, "enumerateTargetsBySourceWithBlock:", v47);

  }
  v37 = *(void **)(a1 + 56);
  objc_msgSend(v37, "featuredSeasonConfiguration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = objc_msgSend(v37, "_shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:configuration:", v17, v38);

  if ((_DWORD)v37)
  {
    objc_msgSend(*(id *)(a1 + 56), "loggingConnection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_3;
    v43[3] = &unk_1E8432F40;
    v40 = v8;
    v41 = *(_QWORD *)(a1 + 56);
    v44 = v40;
    v45 = v41;
    v46 = *(id *)(a1 + 72);
    +[PGSeasonMemoryGenerator enumerateMomentNodesBySeasonInYearFromMomentNodes:loggingConnection:usingBlock:](PGSeasonMemoryGenerator, "enumerateMomentNodesBySeasonInYearFromMomentNodes:loggingConnection:usingBlock:", v17, v39, v43);

  }
LABEL_20:
  objc_autoreleasePoolPop(v9);

}

void __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PGGraphMemory *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "memoryGenerationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "yearsForYearNodes:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldCreateFeaturedYearMemoryForMomentNodes:featureNodes:inYear:configuration:", v5, *(_QWORD *)(a1 + 40), v9, *(_QWORD *)(a1 + 48)))
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v19, "featureNodeCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionByFormingUnionWith:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "allFeatureNodesForMemoryNodeWithFeatureNodes:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", objc_msgSend(*(id *)(a1 + 32), "memoryCategory"), objc_msgSend(*(id *)(a1 + 32), "memoryCategorySubcategoryForOverTimeType:", 1), v5, v13);
    v15 = (id *)(a1 + 56);
LABEL_6:
    objc_msgSend(*v15, "addObject:", v14);

    goto LABEL_7;
  }
  if (*(_BYTE *)(a1 + 80)
    && objc_msgSend(*(id *)(a1 + 32), "_shouldCreateFeaturedYearMemoryForMomentNodes:featureNodes:inYear:configuration:", v5, *(_QWORD *)(a1 + 40), v9, *(_QWORD *)(a1 + 64)))
  {
    v16 = *(void **)(a1 + 40);
    objc_msgSend(v19, "featureNodeCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionByFormingUnionWith:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "allFeatureNodesForMemoryNodeWithFeatureNodes:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:", objc_msgSend(*(id *)(a1 + 32), "memoryCategory"), objc_msgSend(*(id *)(a1 + 32), "memoryCategorySubcategoryForOverTimeType:", 1), v5, v13, 1);
    v15 = (id *)(a1 + 72);
    goto LABEL_6;
  }
LABEL_7:

}

void __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PGGraphMemory *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v7, "featureNodeCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureNodeCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionByFormingUnionWith:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "collectionByFormingUnionWith:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "_shouldCreateFeaturedSeasonMemoryForMomentNodes:featureNodes:", v16, v13))
  {
    objc_msgSend(*(id *)(a1 + 40), "allFeatureNodesForMemoryNodeWithFeatureNodes:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", objc_msgSend(*(id *)(a1 + 40), "memoryCategory"), objc_msgSend(*(id *)(a1 + 40), "memoryCategorySubcategoryForOverTimeType:", 2), v16, v14);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);

    v13 = (void *)v14;
  }

  objc_autoreleasePoolPop(v9);
}

@end
