@implementation PGSettlingEffectHighlightProcessor

- (PGSettlingEffectHighlightProcessor)initWithPhotoLibrary:(id)a3
{
  id v5;
  PGSettlingEffectHighlightProcessor *v6;
  PGSettlingEffectHighlightProcessor *v7;
  os_log_t v8;
  OS_os_log *loggingConnection;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSettlingEffectHighlightProcessor;
  v6 = -[PGSettlingEffectHighlightProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = os_log_create("com.apple.PhotosGraph", "suggestions");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v8;

  }
  return v7;
}

- (id)fetchHighlightCandidatesWithProgressReporter:(id)a3
{
  id v4;
  void *v5;
  OS_os_log *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *loggingConnection;
  NSObject *v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  PGSettlingEffectWallpaperSuggestionCandidate *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  NSObject *v38;
  NSObject *v40;
  int v41;
  uint64_t v42;
  uint32_t denom;
  uint32_t numer;
  NSObject *v45;
  NSObject *v46;
  __int128 v47;
  os_signpost_id_t spid;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  mach_timebase_info info;
  _BYTE v62[32];
  int v63;
  _BYTE v64[128];
  uint8_t buf[32];
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 44;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectHighlightProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v66 = 0;
    memset(buf, 0, sizeof(buf));
    v6 = self->_loggingConnection;
    v7 = os_signpost_id_generate((os_log_t)v6);
    v8 = v6;
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v62 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchHighlightCandidates", ", v62, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v10 = mach_absolute_time();
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFetchPropertySets:", v12);

    objc_msgSend(MEMORY[0x1E0D77EF8], "settlingEffectAssetInternalSortDescriptors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInternalSortDescriptors:", v13);

    objc_msgSend(MEMORY[0x1E0D77EF8], "fetchLivePhotoTabHighlightCandidateAssetsWithOptions:excludeExistingWallpapers:statistics:", v11, 1, (unint64_t)buf | 0xC);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      v16 = loggingConnection;
      v17 = objc_msgSend(v14, "count");
      *(_DWORD *)v62 = 67109120;
      *(_DWORD *)&v62[4] = v17;
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[PGSettlingEffectHighlightProcessor] Found %d highlight candidate assets", v62, 8u);

    }
    if (objc_msgSend(v4, "isCancelledWithProgress:", 0.2))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v62 = 67109378;
        *(_DWORD *)&v62[4] = 56;
        *(_WORD *)&v62[8] = 2080;
        *(_QWORD *)&v62[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectHighlightProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v62, 0x12u);
      }
      v5 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v49 = v7 - 1;
      spid = v7;
      v51 = v11;
      v52 = v9;
      v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = objc_msgSend(v14, "count");
      v19 = 0;
      v20 = 0;
      v50 = v18 / 0xC8;
      v21 = (1.0 / (double)v18 + 1.0) * 0.8;
      v22 = 0x1E0CB3000uLL;
      v54 = v14;
      do
      {
        v53 = v20;
        objc_msgSend(*(id *)(v22 + 1720), "indexSetWithIndexesInRange:");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectsAtIndexes:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v58;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v58 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
              v30 = (void *)MEMORY[0x1CAA4EB2C]();
              v31 = -[PGSettlingEffectWallpaperSuggestionCandidate initWithAsset:suggestion:]([PGSettlingEffectWallpaperSuggestionCandidate alloc], "initWithAsset:suggestion:", v29, 0);
              if (objc_msgSend((id)objc_opt_class(), "candidate:passesFilteringWithStatistics:", v31, buf))objc_msgSend(v56, "addObject:", v31);
              if (objc_msgSend(v4, "isCancelledWithProgress:", v21 * (double)(unint64_t)(v19 + i) + 0.2))
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v62 = 67109378;
                  *(_DWORD *)&v62[4] = 78;
                  *(_WORD *)&v62[8] = 2080;
                  *(_QWORD *)&v62[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffec"
                                        "tHighlightProcessor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v62, 0x12u);
                }

                objc_autoreleasePoolPop(v30);
                v5 = (void *)MEMORY[0x1E0C9AA60];
                v11 = v51;
                v9 = v52;
                v14 = v54;
                goto LABEL_32;
              }

              objc_autoreleasePoolPop(v30);
            }
            v19 += i;
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
            if (v26)
              continue;
            break;
          }
        }

        v32 = self->_loggingConnection;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = v32;
          v34 = objc_msgSend(v55, "firstIndex");
          v35 = objc_msgSend(v55, "lastIndex");
          *(_DWORD *)v62 = 134218240;
          *(_QWORD *)&v62[4] = v34;
          *(_WORD *)&v62[12] = 2048;
          *(_QWORD *)&v62[14] = v35;
          _os_log_debug_impl(&dword_1CA237000, v33, OS_LOG_TYPE_DEBUG, "[PGSettlingEffectHighlightProcessor] processed candidates from %lu to %lu", v62, 0x16u);

        }
        v14 = v54;
        v20 = v53 + 1;
        v22 = 0x1E0CB3000;
      }
      while (v53 != v50);
      +[PGSettlingEffectWallpaperSuggestionCandidate sortDescriptorsForProcessing](PGSettlingEffectWallpaperSuggestionCandidate, "sortDescriptorsForProcessing");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "sortedArrayUsingDescriptors:", v37);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = objc_msgSend(v5, "count");
      v38 = self->_loggingConnection;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v40 = v38;
        v41 = objc_msgSend(v56, "count");
        *(_DWORD *)v62 = 67109120;
        *(_DWORD *)&v62[4] = v41;
        _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "[PGSettlingEffectHighlightProcessor] Found %d candidates", v62, 8u);

      }
      v42 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v9 = v52;
      v45 = v52;
      v46 = v45;
      v11 = v51;
      if (v49 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)v62 = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v46, OS_SIGNPOST_INTERVAL_END, spid, "FetchHighlightCandidates", ", v62, 2u);
      }

      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v62 = 136315394;
        *(_QWORD *)&v62[4] = "FetchHighlightCandidates";
        *(_WORD *)&v62[12] = 2048;
        *(double *)&v62[14] = (float)((float)((float)((float)(v42 - v10) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v46, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v62, 0x16u);
      }
      *(_OWORD *)v62 = *(_OWORD *)buf;
      *(_OWORD *)&v62[16] = *(_OWORD *)&buf[16];
      v63 = v66;
      -[PGSettlingEffectHighlightProcessor logStatistics:](self, "logStatistics:", v62);
      v47 = *(_OWORD *)&buf[16];
      *(_OWORD *)&self->_statistics.numberOfHighlightCandidatesForFRC = *(_OWORD *)buf;
      *(_OWORD *)&self->_statistics.highlightStatistics.numberOfHighlightCandidates = v47;
      self->_statistics.highlightStatistics.numberOfEliminationsThruDeviceOwner = v66;
LABEL_32:

    }
  }

  return v5;
}

- (void)logStatistics:(id *)a3
{
  NSObject *loggingConnection;
  int var2;
  int var1;
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    var2 = a3->var2;
    v8 = 67109120;
    v9 = var2;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PGSettlingEffectHighlightProcessor] %d on-demand settling effect score requested", (uint8_t *)&v8, 8u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    var1 = a3->var1;
    v8 = 67109120;
    v9 = var1;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PGSettlingEffectHighlightProcessor] Filtered out %d for settlingEffectScore", (uint8_t *)&v8, 8u);
  }
}

- ($73521E83DDE933A243F96C25345BD8ED)statistics
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3.var3;
  *(_OWORD *)&retstr->var3.var1 = v3;
  retstr->var3.var5 = self[1].var3.var2;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

+ (BOOL)candidate:(id)a3 passesFilteringWithStatistics:(id *)a4
{
  void *v5;
  float v6;
  float v7;
  void *v8;
  double v9;
  double v10;
  char v12;

  objc_msgSend(a3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  +[PGSettlingEffectScoreHelper analyzedSettlingEffectScoreForAsset:requestedOnDemand:](PGSettlingEffectScoreHelper, "analyzedSettlingEffectScoreForAsset:requestedOnDemand:", v5, &v12);
  v7 = v6;
  if (v12)
    ++a4->var2;
  objc_msgSend(v5, "mediaAnalysisProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGSettlingEffectWallpaperSuggesterFilteringContext minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:](PGSettlingEffectWallpaperSuggesterFilteringContext, "minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:", 0, objc_msgSend(v8, "mediaAnalysisVersion"));
  v10 = v9;

  if (v10 > v7)
    ++a4->var1;

  return v10 <= v7;
}

@end
