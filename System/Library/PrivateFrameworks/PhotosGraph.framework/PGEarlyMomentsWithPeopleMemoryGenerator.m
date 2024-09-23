@implementation PGEarlyMomentsWithPeopleMemoryGenerator

- (void)_enumerateEarlyMomentsWithPeopleForLocalDate:(id)a3 withGraph:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  PGGraphDateNodeCollection *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void (**v44)(id, id, uint64_t, unsigned __int8 *);
  id v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned __int8 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v44 = (void (**)(id, id, uint64_t, unsigned __int8 *))a5;
  v43 = v8;
  if (-[PGEarlyMomentsWithPeopleMemoryGenerator shouldGenerateAllMemories](self, "shouldGenerateAllMemories"))
  {
    objc_msgSend(v9, "momentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v8);
    v12 = objc_msgSend(MEMORY[0x1E0D4B130], "weekOfMonthFromDate:", v8);
    objc_msgSend(v9, "dateNodesForMonth:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateNodesForWeekOfMonth:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "intersectSet:", v13);
    v16 = -[MAElementCollection initWithSet:graph:]([PGGraphDateNodeCollection alloc], "initWithSet:graph:", v15, v9);
    -[PGGraphDateNodeCollection momentNodes](v16, "momentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "personNodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "meNodeCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "collectionBySubtracting:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v9;
  objc_msgSend(v20, "momentNodesAtSensitiveLocationsInGraph:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0;
  v41 = (void *)v19;
  objc_msgSend((id)objc_opt_class(), "earlyMomentNodesByPersonNodeWithPersonNodes:", v19);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v47)
  {
    v45 = v22;
    v46 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v57 != v46)
          objc_enumerationMutation(v22);
        v24 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v22, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v27)
        {
          v28 = v27;
          v29 = 0;
          v30 = *(_QWORD *)v53;
          while (2)
          {
            v31 = 0;
            v32 = v29 + v28;
            do
            {
              if (*(_QWORD *)v53 != v30)
                objc_enumerationMutation(v26);
              if (!objc_msgSend(v10, "containsNode:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v31)))
              {
                v32 = v29 + v31;
                goto LABEL_19;
              }
              ++v31;
            }
            while (v28 != v31);
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            v29 = v32;
            if (v28)
              continue;
            break;
          }
LABEL_19:

          if (v32)
          {
            if (v32 != objc_msgSend(v26, "count"))
            {
              objc_msgSend(v26, "subarrayWithRange:", 0, v32);
              v33 = objc_claimAutoreleasedReturnValue();

              v26 = (id)v33;
            }
            v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v26 = v26;
            v35 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v49;
              do
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v49 != v37)
                    objc_enumerationMutation(v26);
                  v39 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
                  if ((objc_msgSend(v21, "containsNode:", v39) & 1) == 0)
                    objc_msgSend(v34, "addObject:", v39);
                }
                v36 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
              }
              while (v36);
            }

            v44[2](v44, v34, v24, &v60);
            v40 = v60;

            if (v40)
            {

              v22 = v45;
              goto LABEL_38;
            }
          }
          v22 = v45;
        }
        else
        {

        }
      }
      v47 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v47)
        continue;
      break;
    }
  }
LABEL_38:

}

- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGMemoryGenerator controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "libraryHasEnoughProcessedScenes:andProcessedFaces:", 1, 1))
  {
    -[PGEarlyMomentsWithPeopleMemoryGenerator localDate](self, "localDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[PGEarlyMomentsWithPeopleMemoryGenerator localDate](self, "localDate");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__PGEarlyMomentsWithPeopleMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke;
    v20[3] = &unk_1E8427F20;
    v24 = &v40;
    v25 = &v36;
    v26 = &v32;
    v12 = v6;
    v21 = v12;
    v13 = v8;
    v22 = v13;
    v27 = &v28;
    v14 = v11;
    v23 = v14;
    -[PGEarlyMomentsWithPeopleMemoryGenerator _enumerateEarlyMomentsWithPeopleForLocalDate:withGraph:usingBlock:](self, "_enumerateEarlyMomentsWithPeopleForLocalDate:withGraph:usingBlock:", v10, v12, v20);
    objc_msgSend(v13, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v41[3];
      v17 = v37[3];
      v18 = v33[3];
      v19 = v29[3];
      *(_DWORD *)buf = 134219008;
      v45 = v16;
      v46 = 2048;
      v47 = v17;
      v48 = 2048;
      v49 = v18;
      v50 = 2048;
      v51 = 0;
      v52 = 2048;
      v53 = v19;
      _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: Found %lu, rejected %lu uninteresting, %lu too short, %lu insufficiently faced, %lu blocklisting", buf, 0x34u);
    }

    -[PGMemoryGenerator _enumerateBestScoringPotentialMemoriesInPotentialMemories:withGraph:attemptUpgradesBeforeSorting:usingBlock:](self, "_enumerateBestScoringPotentialMemoriesInPotentialMemories:withGraph:attemptUpgradesBeforeSorting:usingBlock:", v14, v12, 0, v7);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

  }
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v48;
  void *v49;
  PGEarlyMomentsWithPeopleMemoryGenerator *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t v67[128];
  uint8_t buf[4];
  int v69;
  __int16 v70;
  const char *v71;
  uint64_t v72;

  v7 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v54 = a6;
  v12 = objc_msgSend(v54, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v64 + 24) = v12;
  v52 = v11;
  v53 = v10;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v69 = 250;
      v70 = 2080;
      v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emory Generators/CurrentMemoryGenerators/PersonMemoryGenerators/PGEarlyMomentsWithPeopleMemoryGenerator.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v13 = 0;
    goto LABEL_38;
  }
  objc_msgSend(v54, "childProgressReporterFromStart:toEnd:", 0.0, 0.25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62.receiver = self;
  v62.super_class = (Class)PGEarlyMomentsWithPeopleMemoryGenerator;
  -[PGMemoryGenerator relevantFeederForTriggeredMemory:inGraph:allowGuestAsset:progressReporter:](&v62, sel_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter_, v10, v11, v7, v14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = self;

  if (*((_BYTE *)v64 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v69 = 253;
      v70 = 2080;
      v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emory Generators/CurrentMemoryGenerators/PersonMemoryGenerators/PGEarlyMomentsWithPeopleMemoryGenerator.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v13 = 0;
    goto LABEL_37;
  }
  objc_msgSend(v10, "memoryFeatureNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v15);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "memoryMomentNodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v16, v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v48, "count"))
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "[PGEarlyMomentsWithPeopleMemoryGenerator] No moment feature edges found", buf, 2u);
    }
    v13 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v49, "localIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v51, "allItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (!v21)
    goto LABEL_21;
  v22 = *(_QWORD *)v59;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v59 != v22)
        objc_enumerationMutation(v20);
      v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v24, "clsPersonLocalIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "containsObject:", v18))
      {

      }
      else
      {
        objc_msgSend(v24, "clsFaceInformationSummary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "numberOfFacesIncludingPets") == 0;

        if (!v27)
          continue;
      }
      objc_msgSend(v19, "addObject:", v24);
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  }
  while (v21);
LABEL_21:

  v28 = objc_alloc(MEMORY[0x1E0CD1620]);
  -[PGMemoryGenerator memoryCurationSession](v50, "memoryCurationSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "photoLibrary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v51, "assetFetchOptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "fetchPropertySets");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v28, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v19, v30, 0, v34, 0, 0);

  -[PGMemoryGenerator memoryCurationSession](v50, "memoryCurationSession");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "curationManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[PGMemoryGenerator durationForCuration](v50, "durationForCuration");
  objc_msgSend(v48, "allRelevantAssetLocalIdentifiers");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerator memoryCurationSession](v50, "memoryCurationSession");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "curationContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __117__PGEarlyMomentsWithPeopleMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke;
  v55[3] = &unk_1E84301E0;
  v57 = &v63;
  v42 = v54;
  v56 = v42;
  objc_msgSend(v37, "memoryCuratedAssetsForAssets:duration:withContextualAssetLocalIdentifiers:minimumProportion:graph:curationContext:progressBlock:", v35, v38, v39, v52, v41, v55, 0.7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*((_BYTE *)v64 + 24))
  {
    -[PGMemoryGenerator memoryCurationSession](v50, "memoryCurationSession");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v43, v44, v52);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v64 + 24))
    {
      *((_BYTE *)v64 + 24) = 1;
    }
    else
    {
      v46 = objc_msgSend(v42, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v64 + 24) = v46;
      if ((v46 & 1) == 0)
      {
        v13 = v45;
LABEL_34:

        goto LABEL_35;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v69 = 279;
      v70 = 2080;
      v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emory Generators/CurrentMemoryGenerators/PersonMemoryGenerators/PGEarlyMomentsWithPeopleMemoryGenerator.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v13 = 0;
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v69 = 275;
    v70 = 2080;
    v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "ory Generators/CurrentMemoryGenerators/PersonMemoryGenerators/PGEarlyMomentsWithPeopleMemoryGenerator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v13 = 0;
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
  _Block_object_dispose(&v63, 8);

  return v13;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "memoryFeatureNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PGEarlyMomentsWithPeopleMemoryGenerator;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v13, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setReferencePersonLocalIdentifiers:", v11);

  objc_msgSend(v10, "setMinimumNumberOfReferencePersons:", 0);
  return v10;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGPeopleMemoryTitleGenerator *v14;
  void *v15;
  void *v16;
  PGPeopleMemoryTitleGenerator *v17;

  v9 = a7;
  v10 = a3;
  objc_msgSend(v10, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "memoryMomentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [PGPeopleMemoryTitleGenerator alloc];
  objc_msgSend(v13, "temporarySet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "temporarySet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGPeopleMemoryTitleGenerator initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:](v14, "initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:", v15, v16, 0, 3, v9);

  return v17;
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (void)setLocalDate:(id)a3
{
  objc_storeStrong((id *)&self->_localDate, a3);
}

- (BOOL)shouldGenerateAllMemories
{
  return self->_shouldGenerateAllMemories;
}

- (void)setShouldGenerateAllMemories:(BOOL)a3
{
  self->_shouldGenerateAllMemories = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDate, 0);
}

uint64_t __117__PGEarlyMomentsWithPeopleMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.75 + 0.25);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

void __91__PGEarlyMomentsWithPeopleMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t j;
  PGGraphMomentNodeCollection *v18;
  void *v19;
  void *v20;
  PGPotentialEarlyMomentsWithPeopleMemory *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  PGPotentialEarlyMomentsWithPeopleMemory *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "isInterestingForMemories") & 1) == 0)
        {
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

          goto LABEL_36;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v9)
        continue;
      break;
    }
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (!v13)
  {

LABEL_21:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    goto LABEL_36;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v40;
  do
  {
    for (j = 0; j != v14; ++j)
    {
      if (*(_QWORD *)v40 != v16)
        objc_enumerationMutation(v12);
      v15 += objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "numberOfAssets");
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  }
  while (v14);

  if (v15 <= 0xC)
    goto LABEL_21;
  v18 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v12, *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "collection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v20, "numberOfRelevantAssets") > 8)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v21 = (PGPotentialEarlyMomentsWithPeopleMemory *)v12;
    v22 = -[PGPotentialEarlyMomentsWithPeopleMemory countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v36;
      while (2)
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v21);
          if (objc_msgSend(*(id *)(a1 + 40), "anyBlockedFeatureIsHitByEvent:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k), (_QWORD)v35))
          {
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
            goto LABEL_34;
          }
        }
        v23 = -[PGPotentialEarlyMomentsWithPeopleMemory countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (v23)
          continue;
        break;
      }
    }

    v26 = [PGPotentialEarlyMomentsWithPeopleMemory alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PGPotentialEarlyMomentsWithPeopleMemory initWithMomentNodes:personNodes:](v26, "initWithMomentNodes:personNodes:", v27, v28);

    objc_msgSend(v6, "personScore");
    -[PGPotentialMemory setScore:](v21, "setScore:", v29 + (double)(unint64_t)objc_msgSend(v6, "numberOfMomentNodes") * 0.01);
    v30 = (void *)MEMORY[0x1E0C99E60];
    +[PGFeature featureWithType:node:](PGFeature, "featureWithType:node:", 3, v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithObject:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPotentialMemory setFeatures:](v21, "setFeatures:", v32);

    -[PGPotentialMemory computeContentScore](v21, "computeContentScore");
    objc_msgSend(v6, "localIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGPotentialMemory setPeopleUUIDs:](v21, "setPeopleUUIDs:", v34);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v21, (_QWORD)v35);

LABEL_34:
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }

LABEL_36:
}

+ (unint64_t)numberOfPotentialMemoriesForGraph:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "earlyMomentNodesByPersonNodeWithPersonNodes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

+ (id)earlyMomentNodesByPersonNodeWithPersonNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  objc_msgSend(v3, "socialGroupNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionByIntersecting:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PGEarlyMomentsWithPeopleMemoryGenerator_earlyMomentNodesByPersonNodeWithPersonNodes___block_invoke;
  v10[3] = &unk_1E8427EF8;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateIdentifiersAsCollectionsWithBlock:", v10);

  return v8;
}

void __87__PGEarlyMomentsWithPeopleMemoryGenerator_earlyMomentNodesByPersonNodeWithPersonNodes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  BOOL v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "featureNodeCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "interestingSubset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    v18 = 0.0;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v17)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v19);
      if ((unint64_t)objc_msgSend(v20, "totalNumberOfPersons", (_QWORD)v26) <= 0x13)
      {
        objc_msgSend(v20, "timestampUTCStart");
        v22 = v21;
        if (v18 != 0.0)
        {
          v21 = v21 - v18;
          v23 = v22 - v18 <= 15552000.0;
          v22 = v18;
          if (!v23)
            break;
        }
        objc_msgSend(v13, "addObject:", v20, v21);
        v18 = v22;
        if ((unint64_t)objc_msgSend(v13, "count") > 4)
          break;
      }
      if (v16 == ++v19)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
          goto LABEL_3;
        break;
      }
    }
  }

  if (objc_msgSend(v13, "count"))
  {
    v24 = *(void **)(a1 + 32);
    objc_msgSend(v4, "anyNode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v13, v25);

  }
}

@end
