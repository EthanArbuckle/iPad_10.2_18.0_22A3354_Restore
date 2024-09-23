@implementation PNAmbientSuggestionUtilities

+ (int64_t)suggestionIsEligibleForDisplay:(id)a3 asset:(id)a4 modelSet:(id)a5
{
  id v8;
  id v9;
  PNAssetSafeForDisplayModelSet *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = (PNAssetSafeForDisplayModelSet *)a5;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDE3698], "allFeaturedStateEnabledSuggestionTypesForWidget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  objc_msgSend(v11, "addObject:", &unk_25149A288);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v8, "type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "containsObject:", v13);

  if (v14)
  {
    if (objc_msgSend(v8, "subtype") == 502 || objc_msgSend(v8, "type") == 8)
      goto LABEL_15;
    if (!v10)
    {
      objc_msgSend(v9, "sceneAnalysisProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "sceneAnalysisVersion");

      v10 = -[PNAssetSafeForDisplayModelSet initWithSceneAnalysisVersion:]([PNAssetSafeForDisplayModelSet alloc], "initWithSceneAnalysisVersion:", v16);
    }
    if (+[PNAssetCurationUtilities assetIsSafeForDisplay:modelSet:](PNAssetCurationUtilities, "assetIsSafeForDisplay:modelSet:", v9, v10))
    {
LABEL_15:
      if (objc_msgSend(a1, "_hasAcceptableCropScoreWithAsset:", v9))
        v17 = 0;
      else
        v17 = 2;
    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (int64_t)assetIsEligibleForDisplay:(id)a3 modelSet:(id)a4
{
  id v6;
  PNAssetSafeForDisplayModelSet *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = (PNAssetSafeForDisplayModelSet *)a4;
  if (!v7)
  {
    objc_msgSend(v6, "sceneAnalysisProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sceneAnalysisVersion");

    v7 = -[PNAssetSafeForDisplayModelSet initWithSceneAnalysisVersion:]([PNAssetSafeForDisplayModelSet alloc], "initWithSceneAnalysisVersion:", v9);
  }
  if (+[PNAssetCurationUtilities assetIsSafeForDisplay:modelSet:](PNAssetCurationUtilities, "assetIsSafeForDisplay:modelSet:", v6, v7))
  {
    if (objc_msgSend(a1, "_hasAcceptableCropScoreWithAsset:", v6))
      v10 = 0;
    else
      v10 = 2;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (id)fetchHighlightAssetsInPhotoLibrary:(id)a3 limit:(unint64_t)a4 randomSeed:(unint64_t)a5
{
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  uint32_t denom;
  uint32_t numer;
  NSObject *v44;
  NSObject *v45;
  os_signpost_id_t spid;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  double v65;
  uint64_t v66;
  _QWORD v67[4];

  v67[2] = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  PLAmbientPhotoFrameGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v63 = (const char *)a4;
    _os_log_impl(&dword_243C3E000, v7, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] fetchHighlightAssets with limit %lu", buf, 0xCu);
  }
  v8 = v7;
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  v54 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchHighlightAssets", ", buf, 2u);
  }
  spid = v9;

  v48 = mach_absolute_time();
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("highlightBeingSummaryAssets.kind"), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("highlightBeingSummaryAssets.enrichmentState"), 4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d AND %K = %d"), CFSTR("highlightBeingSummaryAssets.type"), 0, CFSTR("highlightBeingSummaryAssets.visibilityState"), 3);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("highlightBeingSummaryAssets.type"), 5);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD14C0];
  v56 = (void *)v14;
  v57 = (void *)v13;
  v67[0] = v13;
  v67[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "orPredicateWithSubpredicates:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v17;
  objc_msgSend(v12, "addObject:", v17);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K > %f"), CFSTR("highlightBeingSummaryAssets.promotionScore"), 0x3FD0000000000000);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:");
  v18 = objc_msgSend(MEMORY[0x24BE726F0], "latestVersion");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K.%K >= %lu"), CFSTR("additionalAttributes"), CFSTR("sceneAnalysisVersion"), v18);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:");
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE726F0]), "initWithSceneAnalysisVersion:", v18);
  objc_msgSend(v50, "minimumWallpaperScoreNode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "operatingPoint");
  v21 = v20;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K.%K > %f"), CFSTR("mediaAnalysisAttributes"), CFSTR("wallpaperScore"), v21);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:");
  objc_msgSend(v60, "librarySpecificFetchOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInternalPredicate:", v23);

  v66 = *MEMORY[0x24BDE3750];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFetchPropertySets:", v24);

  objc_msgSend(v22, "setSuppressSlowFetchReports:", 1);
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithOptions:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v63) = v27;
    _os_log_impl(&dword_243C3E000, v26, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Found %d highlight summary assets", buf, 8u);
  }

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72430]), "initWithSeed:", a5);
  v29 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v25, "fetchedObjectIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithArray:", v30);

  PFMutableArrayShuffleWithRandomNumberGenerator();
  v32 = objc_msgSend(v31, "count");
  if (v32 >= a4)
    v33 = a4;
  else
    v33 = v32;
  objc_msgSend(v31, "subarrayWithRange:", 0, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc(MEMORY[0x24BDE35B0]);
  v36 = *MEMORY[0x24BDE37D0];
  objc_msgSend(v25, "fetchPropertySets");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v35, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v34, v60, v36, v37, 0, 0);

  v39 = v26;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    v40 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v63) = v40;
    _os_log_impl(&dword_243C3E000, v39, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Return %d assets", buf, 8u);
  }

  v41 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v44 = v39;
  v45 = v44;
  if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v45, OS_SIGNPOST_INTERVAL_END, spid, "FetchHighlightAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "FetchHighlightAssets";
    v64 = 2048;
    v65 = (float)((float)((float)((float)(v41 - v48) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v38;
}

+ (id)fetchMemoryKeyAssetsInPhotoLibrary:(id)a3 limit:(unint64_t)a4 randomSeed:(unint64_t)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint32_t denom;
  uint32_t numer;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  uint32_t v47;
  uint32_t v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  void *v59;
  NSObject *v60;
  int v61;
  uint64_t v62;
  uint32_t v63;
  uint32_t v64;
  NSObject *v65;
  NSObject *v66;
  os_signpost_id_t spid;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  mach_timebase_info v76;
  mach_timebase_info v77;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  double v82;
  _QWORD v83[3];
  _QWORD v84[3];

  v84[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PLAmbientPhotoFrameGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v80 = (const char *)a4;
    _os_log_impl(&dword_243C3E000, v7, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] fetchMemoryKeyAssets with limit %lu", buf, 0xCu);
  }
  v70 = a4;
  v8 = v7;
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  v72 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchMemoryKeyAssets", ", buf, 2u);
  }
  spid = v9;

  v71 = mach_absolute_time();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", -63115200.0);
  v13 = objc_claimAutoreleasedReturnValue();

  v74 = v6;
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDE3750];
  v84[0] = *MEMORY[0x24BDE3750];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchPropertySets:", v16);

  v17 = (void *)MEMORY[0x24BDD14C0];
  v73 = (void *)v13;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("creationDate"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v18;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == NO"), CFSTR("rejected"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v19;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == NO"), CFSTR("userCreated"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v22);

  v23 = v11;
  v24 = os_signpost_id_generate(v23);
  v77 = 0;
  mach_timebase_info(&v77);
  v25 = v23;
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "FetchAmbientMemories", ", buf, 2u);
  }

  v27 = mach_absolute_time();
  objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v14);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = mach_absolute_time();
  numer = v77.numer;
  denom = v77.denom;
  v31 = v26;
  v32 = v31;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v32, OS_SIGNPOST_INTERVAL_END, v24, "FetchAmbientMemories", ", buf, 2u);
  }

  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v80 = "FetchAmbientMemories";
    v81 = 2048;
    v82 = (float)((float)((float)((float)(v28 - v27) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v33 = v32;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = objc_msgSend(v75, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v34;
    _os_log_impl(&dword_243C3E000, v33, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Found %d memories", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDE3710], v15, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "librarySpecificFetchOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setIncludeGuestAssets:", 1);
  objc_msgSend(v35, "allObjects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFetchPropertySets:", v37);

  v38 = v33;
  v39 = os_signpost_id_generate(v38);
  v76 = 0;
  mach_timebase_info(&v76);
  v40 = v38;
  v41 = v40;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "FetchAmbientMemoryKeyAssets", ", buf, 2u);
  }

  v42 = mach_absolute_time();
  objc_msgSend(MEMORY[0x24BDE3488], "fetchKeyAssetByMemoryUUIDForMemories:options:", v75, v36);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v41;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v45 = objc_msgSend(v43, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v45;
    _os_log_impl(&dword_243C3E000, v44, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Found %d memory key assets", buf, 8u);
  }

  v46 = mach_absolute_time();
  v48 = v76.numer;
  v47 = v76.denom;
  v49 = v44;
  v50 = v49;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v50, OS_SIGNPOST_INTERVAL_END, v39, "FetchAmbientMemoryKeyAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v80 = "FetchAmbientMemoryKeyAssets";
    v81 = 2048;
    v82 = (float)((float)((float)((float)(v46 - v42) * (float)v48) / (float)v47) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v50, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  objc_msgSend(v43, "allValues");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v51, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72430]), "initWithSeed:", a5);
    objc_msgSend(v52, "allObjects");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    PFShuffledArrayWithRandomNumberGenerator();
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = objc_msgSend(v55, "count");
    if (v56 >= v70)
      v57 = v70;
    else
      v57 = v56;
    objc_msgSend(v55, "subarrayWithRange:", 0, v57);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v58 = objc_alloc(MEMORY[0x24BDE35B0]);
  v59 = (void *)objc_msgSend(v58, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v51, v74, *MEMORY[0x24BDE37D0], v35, 0, 0);
  v60 = v50;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    v61 = objc_msgSend(v59, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v61;
    _os_log_impl(&dword_243C3E000, v60, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Return %d unique memory key assets", buf, 8u);
  }

  v62 = mach_absolute_time();
  v64 = info.numer;
  v63 = info.denom;
  v65 = v60;
  v66 = v65;
  if (v72 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v66, OS_SIGNPOST_INTERVAL_END, spid, "FetchMemoryKeyAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v80 = "FetchMemoryKeyAssets";
    v81 = 2048;
    v82 = (float)((float)((float)((float)(v62 - v71) * (float)v64) / (float)v63) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v66, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v59;
}

+ (BOOL)_hasAcceptableCropScoreWithAsset:(id)a3
{
  double v3;

  objc_msgSend(a1, "_cropScoreWithAsset:", a3);
  return v3 > 0.4;
}

+ (CGSize)_deviceScreenSize
{
  double v2;
  double v3;
  CGSize result;

  if (_deviceScreenSize_onceToken != -1)
    dispatch_once(&_deviceScreenSize_onceToken, &__block_literal_global_792);
  v2 = *(double *)&_deviceScreenSize_deviceSize_0;
  v3 = *(double *)&_deviceScreenSize_deviceSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)_cropScoreWithAsset:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v40;
  uint8_t buf[4];
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_deviceScreenSize");
  if (v5 <= v6)
    v7 = v5;
  else
    v7 = v6;
  if (v5 <= v6)
    v8 = v6;
  else
    v8 = v5;
  objc_msgSend(v4, "faceAreaMinX");
  v10 = v9;
  objc_msgSend(v4, "faceAreaMinY");
  v12 = v11;
  objc_msgSend(v4, "faceAreaMaxX");
  v14 = v13;
  objc_msgSend(v4, "faceAreaMaxY");
  v15 = v14 - v10;
  v17 = v16 - v12;
  if (v8 != 0.0 && v7 != 0.0 && (v8 != *MEMORY[0x24BE71BF0] || v7 != *(double *)(MEMORY[0x24BE71BF0] + 8)))
  {
    v19 = fabs(v8 / v7);
LABEL_15:
    v40 = v19;
    goto LABEL_16;
  }
  v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  v19 = 1.0;
  if (!v20)
    goto LABEL_15;
  v40 = 1.0;
  *(_DWORD *)buf = 134218496;
  v42 = v8;
  v43 = 2048;
  v44 = v7;
  v45 = 2048;
  v46 = 0x3FF0000000000000;
  _os_log_fault_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
LABEL_16:
  v21 = objc_msgSend(v4, "pixelWidth");
  v22 = objc_msgSend(v4, "pixelHeight");
  objc_msgSend(v4, "acceptableCropRect");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v4, "preferredCropRect");
  +[PNCropUtilitiesWrapper cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:](PNCropUtilitiesWrapper, "cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:", &unk_25149A6D0, v21, v22, MEMORY[0x24BDBD1A8], 1, v40, v24, v26, v28, v30, v31, v32, v33, v34, *(_QWORD *)&v10, *(_QWORD *)&v12,
    *(_QWORD *)&v15,
    *(_QWORD *)&v17,
    *MEMORY[0x24BDBF070],
    *(_QWORD *)(MEMORY[0x24BDBF070] + 8),
    *(_QWORD *)(MEMORY[0x24BDBF070] + 16),
    *(_QWORD *)(MEMORY[0x24BDBF070] + 24));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "cropScore");
    v38 = v37;

  }
  else
  {
    v38 = 0.0;
  }

  return v38;
}

uint64_t __49__PNAmbientSuggestionUtilities__deviceScreenSize__block_invoke()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = PFDeviceScreenSize();
  _deviceScreenSize_deviceSize_0 = v1;
  _deviceScreenSize_deviceSize_1 = v2;
  return result;
}

@end
