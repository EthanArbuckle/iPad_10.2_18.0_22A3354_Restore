@implementation PGMemoryGenerationHelper

+ (id)feederForMemoriesWithAssetCollection:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "curationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultAssetFetchOptionsForMemories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIncludeGuestAssets:", v6);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v15, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)feederForMemoriesWithAssetLocalIdentifiers:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "curationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultAssetFetchOptionsForMemories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIncludeGuestAssets:", v6);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v15, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)feederForMemoriesWithAssetFetchResult:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "fetchPropertySets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v9, "curationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v8, 31, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "infoNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topTierAestheticScore");
    v17 = v16;
    objc_msgSend(v9, "curationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "prepareAssets:forMemoriesWithTopTierAestheticScore:curationContext:", v14, v18, v17);

    v19 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v8, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, v20, v21, v11, 0, 0);

    v23 = objc_alloc(MEMORY[0x1E0D4B1B8]);
    objc_msgSend(v9, "curationContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithAssetFetchResult:curationContext:", v22, v24);

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)feederForMemoriesWithFeeder:(id)a3 topTierAestheticScore:(double)a4 didFeederChange:(BOOL *)a5 curationContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;

  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "allItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "prepareAssets:forMemoriesWithTopTierAestheticScore:curationContext:", v12, v11, a4);

  if (a5)
    *a5 = v13;

  return v10;
}

+ (id)scoringContextForMemoriesWithAssets:(id)a3 withTopTierAestheticScore:(double)a4
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D77E18], "scoringContextWithAssets:aestheticScoreThresholdToBeAwesome:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldEmphasizePanorama:", 0);
  return v4;
}

+ (BOOL)prepareAssets:(id)a3 forMemoriesWithTopTierAestheticScore:(double)a4 curationContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "scoringContextForMemoriesWithAssets:withTopTierAestheticScore:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v11);
        v14 |= objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "prepareWithAlternateJunkingHeuristics:withContext:curationContext:", 1, v10, v9, (_QWORD)v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14 & 1;
}

+ (id)assetUUIDsFromAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uuid", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)assetLocalIdentifiersFromAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "localIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)keyAssetFetchResultForHighlightGroupUUIDs:(id)a3 curationManager:(id)a4 allowGuestAsset:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setInternalPredicate:", v11);
  objc_msgSend(MEMORY[0x1E0CD1708], "fetchHighlightsWithOptions:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultAssetFetchOptionsForMemories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setIncludeGuestAssets:", v5);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetByHighlightUUIDForHighlights:options:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(v14, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CD1B90];
  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "fetchPropertySets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v15, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v16, v9, v17, v20, 0, 0);

  return v21;
}

+ (id)assetFetchResultForMomentNodes:(id)a3 inLocationOrAreaNode:(id)a4 requireInteresting:(BOOL)a5 curationManager:(id)a6 progressReporter:(id)a7
{
  id v11;
  id v12;
  id v13;
  int v14;
  id v15;
  void *v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  BOOL v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v14 = objc_msgSend(v13, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v47 + 24) = v14;
  if (!v14)
  {
    objc_msgSend(v11, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("City"));
    v18 = objc_msgSend(v16, "isEqualToString:", CFSTR("Area"));
    v19 = objc_msgSend(v16, "isEqualToString:", CFSTR("State"));
    objc_msgSend(v12, "defaultAssetFetchOptionsForMemories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __132__PGMemoryGenerationHelper_assetFetchResultForMomentNodes_inLocationOrAreaNode_requireInteresting_curationManager_progressReporter___block_invoke;
    v35[3] = &unk_1E842D568;
    v42 = a5;
    v22 = v20;
    v36 = v22;
    v43 = v17;
    v37 = v11;
    v44 = v18;
    v45 = v19;
    v23 = v16;
    v38 = v23;
    v24 = v21;
    v39 = v24;
    v41 = &v46;
    v25 = v13;
    v40 = v25;
    objc_msgSend(v34, "enumerateNodesUsingBlock:", v35);
    if (*((_BYTE *)v47 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v51 = 161;
        v52 = 2080;
        v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/PGMemoryGenerationHelper.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v15 = 0;
      goto LABEL_19;
    }
    if (objc_msgSend(v24, "count"))
    {
      v32 = objc_alloc(MEMORY[0x1E0CD1620]);
      objc_msgSend(v22, "photoLibrary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v22, "fetchPropertySets");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v24, v26, 0, v29, 0, 0);

    }
    else
    {
      v33 = 0;
    }
    if (*((_BYTE *)v47 + 24))
    {
      *((_BYTE *)v47 + 24) = 1;
    }
    else
    {
      v30 = objc_msgSend(v25, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v47 + 24) = v30;
      if ((v30 & 1) == 0)
      {
        v15 = v33;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v51 = 168;
      v52 = 2080;
      v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emory Generators/PGMemoryGenerationHelper.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v15 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v51 = 127;
    v52 = 2080;
    v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "ory Generators/PGMemoryGenerationHelper.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v15 = 0;
LABEL_20:
  _Block_object_dispose(&v46, 8);

  return v15;
}

+ (BOOL)dates:(id)a3 passSpreadicityWithMinimumCardinal:(unint64_t)a4 minimumTimeInterval:(double)a5
{
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  double v32;
  double v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  void *v50;
  void *v51;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  _BOOL4 v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "count") >= a4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D717F8]), "initWithNumericValueKeypaths:", &unk_1E84E9C70);
    objc_msgSend(v9, "setK:", a4);
    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performWithDataset:progressBlock:", v10, &__block_literal_global_33729);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") >= a4)
    {
      v53 = a4;
      v55 = v9;
      v56 = v7;
      v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v54 = v11;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v75;
        v16 = 1.79769313e308;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v75 != v15)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            objc_msgSend(v18, "objects");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
            if (v20)
            {
              v21 = v20;
              v22 = 0;
              v23 = *(_QWORD *)v71;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v71 != v23)
                    objc_enumerationMutation(v19);
                  v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                  if (v22)
                  {
                    objc_msgSend(v22, "earlierDate:", v25);
                    v26 = objc_claimAutoreleasedReturnValue();

                    v22 = (id)v26;
                  }
                  else
                  {
                    v22 = v25;
                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
              }
              while (v21);
            }
            else
            {
              v22 = 0;
            }

            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v27 = v57;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v67;
              do
              {
                for (k = 0; k != v29; ++k)
                {
                  if (*(_QWORD *)v67 != v30)
                    objc_enumerationMutation(v27);
                  objc_msgSend(v22, "timeIntervalSinceDate:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k));
                  v33 = fabs(v32);
                  if (v16 >= v33)
                    v16 = v33;
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
              }
              while (v29);
            }

            if (v22)
              objc_msgSend(v27, "addObject:", v22);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
        }
        while (v14);
      }
      else
      {
        v16 = 1.79769313e308;
      }

      v34 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v34, "setTimeStyle:", 0);
      objc_msgSend(v34, "setDateStyle:", 1);
      v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v57, "sortedArrayUsingSelector:", sel_compare_);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
      v7 = v56;
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v63;
        do
        {
          for (m = 0; m != v38; ++m)
          {
            if (*(_QWORD *)v63 != v39)
              objc_enumerationMutation(v36);
            objc_msgSend(v34, "stringFromDate:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v41);

          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
        }
        while (v38);
      }

      objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", "));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(v56, "allObjects");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sortedArrayUsingSelector:", sel_compare_);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v59;
        do
        {
          for (n = 0; n != v47; ++n)
          {
            if (*(_QWORD *)v59 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(v34, "stringFromDate:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * n));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addObject:", v50);

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
        }
        while (v47);
      }

      objc_msgSend(v43, "componentsJoinedByString:", CFSTR(", "));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v16 >= a5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67110146;
        v79 = v16 >= a5;
        v80 = 1024;
        v81 = v53;
        v82 = 1024;
        v83 = (int)(a5 / 86400.0);
        v84 = 2112;
        v85 = v42;
        v86 = 2112;
        v87 = v51;
        _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "passesSpreadicity %d for cardinal %d, interval %d days, with consolidated dates %@\n\toriginal dates %@", buf, 0x28u);
      }

      v11 = v54;
      v9 = v55;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __132__PGMemoryGenerationHelper_assetFetchResultForMomentNodes_inLocationOrAreaNode_requireInteresting_curationManager_progressReporter___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(a1 + 80) && !objc_msgSend(v5, "isInteresting"))
    goto LABEL_16;
  v7 = (void *)MEMORY[0x1CAA4EB2C]();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("moment.uuid = %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setInternalPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (*(_BYTE *)(a1 + 81))
  {
    objc_msgSend(v11, "fetchedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager filterAssets:inMomentNodes:forCityNodes:withMaximumDistance:](PGCurationManager, "filterAssets:inMomentNodes:forCityNodes:withMaximumDistance:", v13, v14, v15, 5000.0);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else if (*(_BYTE *)(a1 + 82))
  {
    objc_msgSend(v11, "fetchedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager filterAssets:inMomentNodes:forAreaNodes:withMaximumDistance:](PGCurationManager, "filterAssets:inMomentNodes:forAreaNodes:withMaximumDistance:", v13, v14, v15, 20000.0);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_BYTE *)(a1 + 83))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        v22 = "+[PGMemoryGenerationHelper assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curation"
              "Manager:progressReporter:]_block_invoke";
        v23 = 2112;
        v24 = v20;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s called for location node %@, see rdar://75269533", buf, 0x16u);
      }
      objc_msgSend(v12, "fetchedObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v11, "fetchedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager filterAssets:inMomentNodes:forStateNodes:withMaximumDistance:](PGCurationManager, "filterAssets:inMomentNodes:forStateNodes:withMaximumDistance:", v13, v14, v15, 5000.0);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;

LABEL_10:
  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v17);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v18 + 24))
  {
    v19 = 1;
  }
  else
  {
    v19 = objc_msgSend(*(id *)(a1 + 64), "isCancelledWithProgress:", 0.5);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  }
  *(_BYTE *)(v18 + 24) = v19;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    *a3 = 1;

  objc_autoreleasePoolPop(v7);
LABEL_16:

}

@end
