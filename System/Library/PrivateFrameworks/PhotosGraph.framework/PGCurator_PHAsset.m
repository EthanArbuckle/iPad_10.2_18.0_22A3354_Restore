@implementation PGCurator_PHAsset

- (id)bestAssetsForFeeder:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGCurator_PHAsset;
  -[PGCurator bestItemsForFeeder:options:debugInfo:progressBlock:](&v7, sel_bestItemsForFeeder_options_debugInfo_progressBlock_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSemanticalDeduperWithOptions:(id)a3
{
  id v3;
  PGSemanticalDeduper_PHAsset *v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_alloc_init(PGSemanticalDeduper_PHAsset);
  v5 = objc_msgSend(v3, "semanticalDedupingUsesAdaptiveSimilarStacking");

  -[PGSemanticalDeduper setUsesAdaptiveSimilarStacking:](v4, "setUsesAdaptiveSimilarStacking:", v5);
  return v4;
}

- (id)newMovieDeduperWithOptions:(id)a3
{
  return objc_alloc_init(PGMovieDeduper);
}

- (void)lastPassToCompleteItems:(id)a3 fromFeeder:(id)a4 options:(id)a5 maximumNumberOfItems:(unint64_t)a6 debugInfo:(id)a7
{
  id v12;
  id v13;
  id v14;

  v14 = a3;
  v12 = a4;
  v13 = a7;
  if (objc_msgSend(a5, "lastPassMovieAdditionIsEnabled"))
    -[PGCurator_PHAsset addMoviesToAssets:fromFeeder:maximumNumberOfAssets:debugInfo:](self, "addMoviesToAssets:fromFeeder:maximumNumberOfAssets:debugInfo:", v14, v12, a6, v13);

}

- (void)addMoviesToAssets:(id)a3 fromFeeder:(id)a4 maximumNumberOfAssets:(unint64_t)a5 debugInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  double v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  double v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  PGCurator_PHAsset *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  unint64_t v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v13)
  {
    v14 = v13;
    v15 = v11;
    v16 = 0;
    v17 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v57 != v17)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "mediaType") == 2)
          ++v16;
      }
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v14);
    v19 = (double)v16;
    v11 = v15;
  }
  else
  {
    v19 = 0.0;
  }
  v20 = objc_msgSend(v10, "count");
  v21 = (a5 - v20) & ~((uint64_t)(a5 - v20) >> 63);
  v22 = -(v19 - (double)a5 * 0.1);
  v23 = (uint64_t)v22 & ~((uint64_t)v22 >> 63);
  if (v23 <= v21)
    v24 = v21;
  else
    v24 = (uint64_t)v22 & ~((uint64_t)v22 >> 63);
  if (v24)
  {
    v51 = self;
    objc_msgSend(MEMORY[0x1E0D475C8], "sharedMediaAnalyzer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "curateMovieAssetsForCollection:withAlreadyCuratedAssets:andDesiredCount:allowOnDemand:", v26, v10, v24, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = *MEMORY[0x1E0D77DF0];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore > %f"), *MEMORY[0x1E0D77DF0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "filteredArrayUsingPredicate:", v29);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    if (v30 && objc_msgSend(v30, "count"))
    {
      objc_msgSend(v12, "setAgent:", CFSTR("PGManager"));
      objc_msgSend(v12, "setStage:", CFSTR("Last Pass to Add Movies"));
      v49 = v25;
      if (objc_msgSend(v30, "count") > v24)
      {
        objc_msgSend(v30, "subarrayWithRange:", 0, v24);
        v31 = objc_claimAutoreleasedReturnValue();

        v30 = (id)v31;
      }
      v32 = (void *)MEMORY[0x1E0C99E60];
      v50 = v11;
      objc_msgSend(v11, "allItems");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v30 = v30;
      v35 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v53 != v37)
              objc_enumerationMutation(v30);
            objc_msgSend(v34, "member:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v39;
            if (v39)
            {
              objc_msgSend(v39, "clsContentScore");
              if (v41 > v28)
                objc_msgSend(v10, "addObject:", v40);
            }

          }
          v36 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
        }
        while (v36);
      }

      -[PGCurator loggingConnection](v51, "loggingConnection");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = objc_msgSend(v30, "count");
        *(_DWORD *)buf = 134218496;
        v61 = v21;
        v62 = 2048;
        v63 = v23;
        v64 = 2048;
        v65 = v43;
        _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_DEFAULT, "Curated Assets: %lu slots left, minimum number of videos to add %lu, got %lu extra movie assets from MediaAnalysis", buf, 0x20u);
      }

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringValue");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("Adding "), "stringByAppendingString:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringByAppendingString:", CFSTR(" movies curated by MediaAnalyzer"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v30);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setState:ofItems:withReason:", 3, v48, v47);

      }
      v25 = v49;
      v11 = v50;
    }

  }
}

@end
