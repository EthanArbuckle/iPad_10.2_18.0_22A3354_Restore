@implementation PGRecurrentTripMemoryGenerator

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  void *v6;
  double v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  double Current;
  char v32;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  char v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  PGRecurrentTripMemoryGenerator *v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *p_buf;
  uint64_t *v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  int v73;
  _QWORD v74[3];
  uint64_t buf;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v35 = a4;
  v6 = _Block_copy(v35);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x2020000000;
  v68 = 0;
  if (!v6
    || (v7 = CFAbsoluteTimeGetCurrent(), v7 - v66[3] < 0.01)
    || (v66[3] = v7,
        LOBYTE(v61) = 0,
        (*((void (**)(void *, uint64_t *, double))v6 + 2))(v6, &v61, 0.0),
        v8 = *((_BYTE *)v70 + 24) | v61,
        (*((_BYTE *)v70 + 24) = v8) == 0))
  {
    buf = 0;
    *(_QWORD *)&v76 = &buf;
    *((_QWORD *)&v76 + 1) = 0x2020000000;
    v77 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "concludedTripTypeNodesInGraph:", v39);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "highlightGroupNodes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphHighlightGroupNode momentInHighlight](PGGraphHighlightGroupNode, "momentInHighlight");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "adjacencyWithSources:relation:targetsClass:", v37, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "momentNodesAtSensitiveLocationsInGraph:", v39);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "subtractingTargetsWith:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator locationHelper](self, "locationHelper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
    v54[3] = &unk_1E842ED58;
    v18 = v16;
    v55 = v18;
    v19 = v10;
    v56 = v19;
    v20 = v6;
    v57 = v20;
    v58 = &v65;
    v59 = &v69;
    v60 = 0x3F847AE147AE147BLL;
    objc_msgSend(v38, "enumerateTargetsBySourceWithBlock:", v54);
    if (*((_BYTE *)v70 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v73 = 67109378;
        LODWORD(v74[0]) = 71;
        WORD2(v74[0]) = 2080;
        *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMemoryGen"
                                       "erators/PGRecurrentTripMemoryGenerator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v73, 0x12u);
      }
      v9 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_25;
    }
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PGMemoryGenerator momentNodesWithBlockedFeatureCache](self, "momentNodesWithBlockedFeatureCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "momentNodesWithBlockedFeature");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = v17;
    v41[1] = 3221225472;
    v41[2] = __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_176;
    v41[3] = &unk_1E842EDA8;
    v24 = v20;
    v48 = v24;
    v49 = &v65;
    v53 = 0x3F847AE147AE147BLL;
    v50 = &v69;
    v42 = v18;
    v43 = v38;
    v25 = v23;
    v44 = v25;
    v45 = self;
    p_buf = &buf;
    v46 = v39;
    v52 = &v61;
    v26 = v21;
    v47 = v26;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v41);
    if (*((_BYTE *)v70 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v73 = 67109378;
        LODWORD(v74[0]) = 128;
        WORD2(v74[0]) = 2080;
        *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMemoryGen"
                                       "erators/PGRecurrentTripMemoryGenerator.m";
        v27 = MEMORY[0x1E0C81028];
LABEL_14:
        _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v73, 0x12u);
      }
    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(_QWORD *)(v76 + 24);
        v30 = v62[3];
        v73 = 134218240;
        v74[0] = v29;
        LOWORD(v74[1]) = 2048;
        *(_QWORD *)((char *)&v74[1] + 2) = v30;
        _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: %lu not interesting, %lu no scenes processed", (uint8_t *)&v73, 0x16u);
      }

      if (!v6
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v66[3] < 0.01)
        || (v66[3] = Current,
            v40 = 0,
            (*((void (**)(id, char *, double))v24 + 2))(v24, &v40, 1.0),
            v32 = *((_BYTE *)v70 + 24) | v40,
            (*((_BYTE *)v70 + 24) = v32) == 0))
      {
        v9 = v26;
        goto LABEL_24;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v73 = 67109378;
        LODWORD(v74[0]) = 132;
        WORD2(v74[0]) = 2080;
        *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMemoryGen"
                                       "erators/PGRecurrentTripMemoryGenerator.m";
        v27 = MEMORY[0x1E0C81028];
        goto LABEL_14;
      }
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_24:

LABEL_25:
    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&buf, 8);
    goto LABEL_26;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x2104000202;
    LOWORD(v76) = 2080;
    *(_QWORD *)((char *)&v76 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMemoryGenerator"
                                    "s/PGRecurrentTripMemoryGenerator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_26:
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

  return v9;
}

- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  NSObject *v40;
  uint64_t v41;

  v6 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "uuids");
    v13 = objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "curationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper keyAssetFetchResultForHighlightGroupUUIDs:curationManager:allowGuestAsset:](PGMemoryGenerationHelper, "keyAssetFetchResultForHighlightGroupUUIDs:curationManager:allowGuestAsset:", v13, v15, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      v38 = v10;
      v17 = (void *)MEMORY[0x1E0CD1390];
      -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "curationContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v16, 16, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "memoryFeatureNodes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationNodeCollection, "subsetInCollection:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        objc_msgSend(v9, "memoryMomentNodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGCurationManager filterAssets:inMomentNodes:forLocationNodes:withMaximumDistance:](PGCurationManager, "filterAssets:inMomentNodes:forLocationNodes:withMaximumDistance:", v20, v23, v22, 5000.0);
        v24 = objc_claimAutoreleasedReturnValue();

        if (-[NSObject count](v24, "count"))
        {
          v25 = objc_alloc(MEMORY[0x1E0CD1620]);
          objc_msgSend(v16, "photoLibrary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "fetchType");
          v37 = v21;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "fetchPropertySets");
          v36 = v22;
          v28 = v24;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v25, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v28, v26, v27, v29, 0, 0);

          -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v37;
          v10 = v38;
          +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v30, v31, v38);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = v28;
          v22 = v36;
        }
        else
        {
          -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] No key assets found in locations featured by Recurrent Trip memory.", buf, 2u);
          }

          v32 = 0;
          v20 = v24;
          v10 = v38;
        }
      }
      else
      {
        -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
        v33 = objc_claimAutoreleasedReturnValue();
        v10 = v38;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA237000, v33, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] Location nodes expected in memory features, found none.", buf, 2u);
        }

        v32 = 0;
      }

    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v13;
        _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] No key assets found for trips %@", buf, 0xCu);
      }
      v32 = 0;
    }

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] Highlight group nodes expected in features, found none", buf, 2u);
    }
    v32 = 0;
  }

  return v32;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v9, "memoryMomentNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "curationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curationManager:progressReporter:](PGMemoryGenerationHelper, "assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curationManager:progressReporter:", v14, v15, 0, v17, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v18, v19, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 67109120;
      v23[1] = objc_msgSend(v13, "count");
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] One location node expected, found %d", (uint8_t *)v23, 8u);
    }

    v20 = 0;
  }

  return v20;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  void *v10;
  void *v11;
  PGRecurrentTripMemoryTitleGenerator *v12;
  void *v13;
  PGRecurrentTripMemoryTitleGenerator *v14;

  v9 = a7;
  objc_msgSend(a3, "memoryFeatureNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphNamedLocationNodeCollection, "subsetInCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PGRecurrentTripMemoryTitleGenerator alloc];
  objc_msgSend(v11, "temporarySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PGRecurrentTripMemoryTitleGenerator initWithLocationNodes:titleGenerationContext:](v12, "initWithLocationNodes:titleGenerationContext:", v13, v9);

  return v14;
}

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  PGYearChapterTitleGenerator *v12;

  v7 = a3;
  objc_msgSend(v7, "memoryMomentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "yearNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 < 2)
    v12 = 0;
  else
    v12 = -[PGYearChapterTitleGenerator initWithTriggeredMemory:]([PGYearChapterTitleGenerator alloc], "initWithTriggeredMemory:", v7);

  return v12;
}

void __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double Current;
  uint64_t v28;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "temporaryArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relevantLocationNodesForMomentNodes:applyDensestCloseLocationNode:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    v30 = v6;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v15 = *(void **)(a1 + 32);
        objc_msgSend(v14, "locationNodeCollection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addressNodesFromLocationNodes:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "momentNodesByAddressNode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "targetsForSources:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "collectionByIntersecting:", v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        if (objc_msgSend(v6, "count") <= (unint64_t)(2 * v21))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "collectionByFormingUnionWith:", v31);
            v24 = v11;
            v25 = v12;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v26, v14);

            v12 = v25;
            v11 = v24;
            v6 = v30;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v31, v14);
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (Current - *(double *)(v28 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v28 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.25);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *a4 = 1;
    }
  }

}

void __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_176(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  double Current;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  PGGraphMomentNodeCollection *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  PGGraphMemory *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  char v41;

  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  if (*(_QWORD *)(a1 + 80)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8),
        Current - *(double *)(v11 + 24) >= *(double *)(a1 + 120))
    && (*(double *)(v11 + 24) = Current,
        v41 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(0.5),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else if ((unint64_t)objc_msgSend(v8, "count") >= 3)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v7, "locationNodeCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addressNodesFromLocationNodes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "momentNodesByAddressNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "targetsForSources:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2;
    v35[3] = &unk_1E842ED80;
    v36 = *(id *)(a1 + 40);
    v18 = v16;
    v37 = v18;
    v19 = *(id *)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 56);
    v38 = v19;
    v39 = v20;
    v21 = v17;
    v40 = v21;
    objc_msgSend(v8, "filteredCollectionUsingBlock:", v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v22, "count") > 2)
    {
      v23 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMomentNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(a1 + 64), v21);
      -[PGGraphMomentNodeCollection universalDateInterval](v23, "universalDateInterval");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "duration");
      v26 = v25;

      if (v26 >= 31557600.0)
      {
        v34 = v14;
        objc_msgSend(*(id *)(a1 + 56), "processedScenesAndFacesCache");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "allMomentNodesInCollectionHaveScenesProcessed:", v23);

        if ((v28 & 1) != 0)
        {
          objc_msgSend(v22, "featureNodeCollection");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "locationNodeCollection");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "featureNodeCollection");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "collectionByFormingUnionWith:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", 18, 12002, v23, v33);
          objc_msgSend(*(id *)(a1 + 72), "addObject:", v31);

        }
        else
        {
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
        }
        v14 = v34;
      }

    }
    else
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    }

  }
  objc_autoreleasePoolPop(v9);

}

BOOL __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "targetsForSources:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "collectionByIntersecting:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionBySubtracting:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "memoryGenerationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interestingForMemoriesSubsetFromMomentNodes:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = *(void **)(a1 + 64);
    objc_msgSend(v5, "elementIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionWithIdentifierSet:", v10);

  }
  return v8 != 0;
}

@end
