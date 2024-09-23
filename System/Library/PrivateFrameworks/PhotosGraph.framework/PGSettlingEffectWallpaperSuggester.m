@implementation PGSettlingEffectWallpaperSuggester

- (PGSettlingEffectWallpaperSuggester)initWithSession:(id)a3
{
  id v4;
  PGSettlingEffectWallpaperSuggester *v5;
  PGSettlingEffectWallpaperSuggesterFilteringContext *v6;
  PGSettlingEffectWallpaperSuggesterFilteringContext *filteringContext;
  PGWallpaperSuggestionAssetGater *v8;
  void *v9;
  uint64_t v10;
  PGWallpaperSuggestionAssetGater *assetGater;
  NSString *loggingPrefix;
  PGSettlingEffectWallpaperSuggesterLogger *v13;
  void *v14;
  uint64_t v15;
  PGSettlingEffectWallpaperSuggesterLogger *logger;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PGSettlingEffectWallpaperSuggester;
  v5 = -[PGAbstractSuggester initWithSession:](&v18, sel_initWithSession_, v4);
  if (v5)
  {
    v6 = -[PGSettlingEffectWallpaperSuggesterFilteringContext initInOrientation:]([PGSettlingEffectWallpaperSuggesterFilteringContext alloc], "initInOrientation:", objc_msgSend(MEMORY[0x1E0D77EF8], "primaryOrientation"));
    filteringContext = v5->_filteringContext;
    v5->_filteringContext = v6;

    v8 = [PGWallpaperSuggestionAssetGater alloc];
    objc_msgSend(v4, "loggingConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v8, "initWithType:loggingConnection:", 5, v9);
    assetGater = v5->_assetGater;
    v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v10;

    loggingPrefix = v5->_loggingPrefix;
    v5->_loggingPrefix = (NSString *)CFSTR("[PGSettlingEffectWallpaperSuggester]");

    v13 = [PGSettlingEffectWallpaperSuggesterLogger alloc];
    objc_msgSend(v4, "loggingConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PGSettlingEffectWallpaperSuggesterLogger initWithLoggingConnection:](v13, "initWithLoggingConnection:", v14);
    logger = v5->_logger;
    v5->_logger = (PGSettlingEffectWallpaperSuggesterLogger *)v15;

  }
  return v5;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  $6124076B947E0776AABD150FF484CB09 *p_filteringStatistics;
  NSObject *v11;
  const char *v12;
  int v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  PGSettlingEffectHighlightProcessor *v23;
  void *v24;
  PGSettlingEffectHighlightProcessor *v25;
  uint64_t v26;
  PGSettlingEffectHighlightProcessor *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  NSObject *v31;
  uint64_t v32;
  uint32_t denom;
  uint32_t numer;
  NSObject *v35;
  NSObject *v36;
  PGSettlingEffectWallpaperSuggesterLogger *logger;
  PGWallpaperSuggestionAssetGater *assetGater;
  PGSettlingEffectWallpaperSuggesterLogger *v39;
  PGWallpaperSuggestionAssetGater *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  NSObject *v47;
  const char *v48;
  uint32_t v49;
  uint64_t v50;
  uint32_t v51;
  uint32_t v52;
  NSObject *v53;
  NSObject *v54;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  os_signpost_id_t spid;
  unint64_t v65;
  uint64_t v66;
  PGSettlingEffectHighlightProcessor *v67;
  PGSettlingEffectHighlightProcessor *v68;
  void *v69;
  _OWORD v70[2];
  uint64_t v71;
  _OWORD v72[2];
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  int v76;
  mach_timebase_info info;
  _BYTE buf[32];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isCancelledWithProgress:", 0.0))
  {
    -[PGAbstractSuggester session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    p_filteringStatistics = &self->_filteringStatistics;
    *(_OWORD *)&self->_filteringStatistics.numberOfLivePhotos = 0u;
    *(_OWORD *)&self->_filteringStatistics.postfilteringStatistics.numberOfEliminationsThruSettlingEffectScore = 0u;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruResourceAvailability = 0u;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStabilization = 0u;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruVideoDecision = 0u;
    *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfEliminationsThruSettlingEffectScore = 0u;
    *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruCrop = 0u;
    *(_QWORD *)&self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates = 0;
    self->_filteringStatistics.numberOfLivePhotos = -[PGSettlingEffectWallpaperSuggester totalLivePhotos](self, "totalLivePhotos");
    if (objc_msgSend(v7, "isCancelledWithProgress:", 0.05))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 93;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        v11 = MEMORY[0x1E0C81028];
        v12 = "Cancelled at line %d in file %s";
LABEL_14:
        v14 = OS_LOG_TYPE_INFO;
        v15 = 18;
LABEL_17:
        _os_log_impl(&dword_1CA237000, v11, v14, v12, buf, v15);
        goto LABEL_70;
      }
      goto LABEL_70;
    }
    if ((objc_msgSend(MEMORY[0x1E0D71280], "currentDeviceSupportsSettlingEffect") & 1) == 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "[PGSettlingEffectWallpaperSuggester] The current device doesn't support SettlingEffect, returning 0 suggestions";
        v11 = v9;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 2;
        goto LABEL_17;
      }
      goto LABEL_70;
    }
    v13 = objc_msgSend(v6, "noLimitPerFeature");
    self->_noLimit = v13;
    if (v13 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] no limit mode: ON", buf, 2u);
    }
    -[PGSettlingEffectWallpaperSuggester deleteLegacySettlingEffectSuggestions](self, "deleteLegacySettlingEffectSuggestions");
    if (objc_msgSend(v7, "isCancelledWithProgress:", 0.1))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 110;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        v11 = MEMORY[0x1E0C81028];
        v12 = "Cancelled at line %d in file %s";
        goto LABEL_14;
      }
LABEL_70:

      goto LABEL_71;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Starting to generate Settling Effect on existing wallpaper suggestions", buf, 2u);
    }
    v16 = v9;
    v17 = os_signpost_id_generate(v16);
    v18 = v16;
    v19 = v18;
    v65 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PGSettlingEffectWallpaperSuggester", ", buf, 2u);
    }
    spid = v17;

    info = 0;
    mach_timebase_info(&info);
    v20 = mach_absolute_time();
    objc_msgSend(v7, "childProgressReporterFromStart:toEnd:", 0.11, 0.19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSettlingEffectWallpaperSuggester fetchSortedWallpaperCandidatesWithProgressReporter:](self, "fetchSortedWallpaperCandidatesWithProgressReporter:", v21);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v69, "count");
    if (objc_msgSend(v7, "isCancelledWithProgress:", 0.2))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 122;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_69;
    }
    v59 = v20;
    v62 = v21;
    v63 = v19;
    objc_msgSend(v7, "childProgressReporterFromStart:toEnd:", 0.21, 0.29);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = [PGSettlingEffectHighlightProcessor alloc];
    objc_msgSend(v8, "photoLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PGSettlingEffectHighlightProcessor initWithPhotoLibrary:](v23, "initWithPhotoLibrary:", v24);

    v61 = (void *)v22;
    v26 = v22;
    v27 = v25;
    -[PGSettlingEffectHighlightProcessor fetchHighlightCandidatesWithProgressReporter:](v25, "fetchHighlightCandidatesWithProgressReporter:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");
    v76 = 0;
    v74 = 0u;
    v75 = 0u;
    if (v27)
      -[PGSettlingEffectHighlightProcessor statistics](v27, "statistics");
    v30 = v75;
    *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfHighlightCandidatesForFRC = v74;
    *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfHighlightCandidates = v30;
    self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruDeviceOwner = v76;
    v60 = v28;
    if (objc_msgSend(v7, "isCancelledWithProgress:", 0.3))
    {
      v21 = v62;
      v19 = v63;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 132;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        v31 = MEMORY[0x1E0C81028];
LABEL_35:
        _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_68;
      }
      goto LABEL_68;
    }
    if (!(v66 + v29))
    {
      v21 = v62;
      v19 = v63;
      if (!objc_msgSend(v7, "isCancelledWithProgress:", 1.0))
      {
        v67 = v27;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v63, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Found 0 candidates", buf, 2u);
        }
        v58 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v35 = v63;
        v36 = v35;
        if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v36, OS_SIGNPOST_INTERVAL_END, spid, "PGSettlingEffectWallpaperSuggester", ", buf, 2u);
        }

        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "PGSettlingEffectWallpaperSuggester";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (float)((float)((float)((float)(v58 - v59) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        logger = self->_logger;
        assetGater = self->_assetGater;
        if (assetGater)
        {
          -[PGWallpaperSuggestionAssetGater currentGatingStatistics](assetGater, "currentGatingStatistics");
        }
        else
        {
          v73 = 0;
          memset(v72, 0, sizeof(v72));
        }
        v41 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfEliminationsThruSettlingEffectScore;
        v81 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruVideoDecision;
        v82 = v41;
        v83 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruCrop;
        v84 = *(_QWORD *)&self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates;
        v42 = *(_OWORD *)&self->_filteringStatistics.postfilteringStatistics.numberOfEliminationsThruSettlingEffectScore;
        *(_OWORD *)buf = *(_OWORD *)&p_filteringStatistics->numberOfLivePhotos;
        *(_OWORD *)&buf[16] = v42;
        v43 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStabilization;
        v79 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruResourceAvailability;
        v80 = v43;
        -[PGSettlingEffectWallpaperSuggesterLogger logFilteringStatistics:assetGaterStatistics:](logger, "logFilteringStatistics:assetGaterStatistics:", buf, v72);
        v27 = v67;
        goto LABEL_68;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 135;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        v31 = MEMORY[0x1E0C81028];
        goto LABEL_35;
      }
LABEL_68:

LABEL_69:
      goto LABEL_70;
    }
    -[PGSettlingEffectWallpaperSuggester consolidatedCandidatesFromWallpaperCandidates:highlightCandidates:](self, "consolidatedCandidatesFromWallpaperCandidates:highlightCandidates:", v69, v28);
    v32 = objc_claimAutoreleasedReturnValue();
    v19 = v63;
    v57 = (void *)v32;
    if (objc_msgSend(v7, "isCancelledWithProgress:", 0.4))
    {
      v21 = v62;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 146;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_67;
    }
    v68 = v27;
    objc_msgSend(v7, "childProgressReporterFromStart:toEnd:", 0.41, 0.89);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSettlingEffectWallpaperSuggester processFRCFromCandidates:withProgressReporter:](self, "processFRCFromCandidates:withProgressReporter:", v32);
    v39 = self->_logger;
    v40 = self->_assetGater;
    v21 = v62;
    if (v40)
    {
      -[PGWallpaperSuggestionAssetGater currentGatingStatistics](v40, "currentGatingStatistics");
    }
    else
    {
      v71 = 0;
      memset(v70, 0, sizeof(v70));
    }
    v44 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfEliminationsThruSettlingEffectScore;
    v81 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruVideoDecision;
    v82 = v44;
    v83 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruCrop;
    v84 = *(_QWORD *)&self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates;
    v45 = *(_OWORD *)&self->_filteringStatistics.postfilteringStatistics.numberOfEliminationsThruSettlingEffectScore;
    *(_OWORD *)buf = *(_OWORD *)&p_filteringStatistics->numberOfLivePhotos;
    *(_OWORD *)&buf[16] = v45;
    v46 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStabilization;
    v79 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruResourceAvailability;
    v80 = v46;
    -[PGSettlingEffectWallpaperSuggesterLogger logFilteringStatistics:assetGaterStatistics:](v39, "logFilteringStatistics:assetGaterStatistics:", buf, v70);
    if (objc_msgSend(v7, "isCancelledWithProgress:", 0.9))
    {
      v27 = v68;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 153;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        v47 = MEMORY[0x1E0C81028];
        v48 = "Cancelled at line %d in file %s";
LABEL_59:
        v49 = 18;
LABEL_65:
        _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_INFO, v48, buf, v49);
      }
    }
    else
    {
      -[PGSettlingEffectWallpaperSuggester sendSettlingEffectStatisticsEvent](self, "sendSettlingEffectStatisticsEvent");
      v27 = v68;
      if (!objc_msgSend(v7, "isCancelledWithProgress:", 1.0))
      {
        v50 = mach_absolute_time();
        v52 = info.numer;
        v51 = info.denom;
        v53 = v63;
        v54 = v53;
        if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v54, OS_SIGNPOST_INTERVAL_END, spid, "PGSettlingEffectWallpaperSuggester", ", buf, 2u);
        }

        if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          goto LABEL_66;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "PGSettlingEffectWallpaperSuggester";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (float)((float)((float)((float)(v50 - v59) * (float)v52) / (float)v51) / 1000000.0);
        v48 = "[Performance] %s: %f ms";
        v47 = v54;
        v49 = 22;
        goto LABEL_65;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 158;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        v47 = MEMORY[0x1E0C81028];
        v48 = "Cancelled at line %d in file %s";
        goto LABEL_59;
      }
    }
LABEL_66:

LABEL_67:
    goto LABEL_68;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 86;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_71:

  return (id)MEMORY[0x1E0C9AA60];
}

- (void)deleteLegacySettlingEffectSuggestions
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PGAbstractSuggester session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), 680);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__PGSettlingEffectWallpaperSuggester_deleteLegacySettlingEffectSuggestions__block_invoke;
    v14[3] = &unk_1E8435668;
    v8 = v7;
    v15 = v8;
    v13 = 0;
    v9 = objc_msgSend(v4, "performChangesAndWait:error:", v14, &v13);
    v10 = v13;
    if ((v9 & 1) != 0)
    {
      v11 = v3;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v12;
        _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Deleted %d legacy settling effect suggestions", buf, 8u);
      }

    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_error_impl(&dword_1CA237000, v3, OS_LOG_TYPE_ERROR, "[PGSettlingEffectWallpaperSuggester] Error deleting legacy settling effect suggestions: %@", buf, 0xCu);
    }

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v3, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] No legacy settling effect suggestions to delete.", buf, 2u);
  }

}

- (void)setAvailableFeaturesForCandidates:(id)a3 pass:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  char v12;
  __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  int v16;
  id v17;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  BOOL v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGAbstractSuggester session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__PGSettlingEffectWallpaperSuggester_setAvailableFeaturesForCandidates_pass___block_invoke;
  v18[3] = &unk_1E8428560;
  v10 = v6;
  v19 = v10;
  v11 = v8;
  v20 = v11;
  v21 = v4;
  v17 = 0;
  v12 = objc_msgSend(v9, "performChangesAndWait:error:", v18, &v17);
  v13 = (__CFString *)v17;

  if ((v12 & 1) != 0)
  {
    v14 = v11;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (v4)
        v15 = CFSTR("Set");
      else
        v15 = CFSTR("Cleared");
      v16 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138412546;
      v23 = v15;
      v24 = 1024;
      v25 = v16;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] %@ settling effect for %d suggestions", buf, 0x12u);
    }

  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "[PGSettlingEffectWallpaperSuggester] Error updating availableFeatures: %@", buf, 0xCu);
  }

}

- (id)fetchCandidateSuggestions
{
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  $6124076B947E0776AABD150FF484CB09 *p_filteringStatistics;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint32_t denom;
  uint32_t numer;
  NSObject *v23;
  NSObject *v24;
  uint64_t v26;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  double v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  -[PGAbstractSuggester session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PGSettlingEffectWallpaperSuggesterFetchCandidateSuggestions", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v26 = mach_absolute_time();
  objc_msgSend(v3, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v11;
  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v14);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  p_filteringStatistics = &self->_filteringStatistics;
  self->_filteringStatistics.numberOfWallpaperSuggestions = objc_msgSend(v15, "count");
  v17 = v7;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134217984;
    v29 = (const char *)v18;
    _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Fetched %lu existing wallpaper suggestions.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D77EF8], "filterSuggestions:excludingSingleFeature:", v15, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  p_filteringStatistics->numberOfWallpaperSuggestionsWithoutSettlingEffect = objc_msgSend(v19, "count");

  v20 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v23 = v17;
  v24 = v23;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_END, v5, "PGSettlingEffectWallpaperSuggesterFetchCandidateSuggestions", ", buf, 2u);
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "PGSettlingEffectWallpaperSuggesterFetchCandidateSuggestions";
    v30 = 2048;
    v31 = (float)((float)((float)((float)(v20 - v26) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v15;
}

- (id)fetchSortedWallpaperCandidatesWithProgressReporter:(id)a3
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
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PGSettlingEffectWallpaperSuggestionCandidate *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  NSObject *v42;
  uint64_t v44;
  uint64_t v45;
  uint32_t denom;
  uint32_t numer;
  NSObject *v48;
  NSObject *v49;
  os_signpost_id_t spid;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  NSObject *v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  PGSettlingEffectWallpaperSuggester *v64;
  void *v65;
  id v66;
  id v67;
  $6124076B947E0776AABD150FF484CB09 *p_filteringStatistics;
  $8CB560107B2F2B4F0BC5A8630BA627C8 *p_postfilteringStatistics;
  uint64_t v70;
  void *v71;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v74[18];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v74 = 263;
      *(_WORD *)&v74[4] = 2080;
      *(_QWORD *)&v74[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v5 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_37;
  }
  -[PGAbstractSuggester session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loggingConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSettlingEffectWallpaperSuggester fetchCandidateSuggestions](self, "fetchCandidateSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCacheSizeForFetch:", 200);
  objc_msgSend(v10, "setChunkSizeForFetch:", 200);
  +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchPropertySets:", v11);

  v12 = (void *)objc_opt_class();
  objc_msgSend(v6, "forbiddenAssetUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "prefilteringInternalPredicateWithForbiddenAssetUUIDs:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInternalPredicate:", v14);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v8, v10);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  p_filteringStatistics = &self->_filteringStatistics;
  self->_filteringStatistics.numberOfLivePhotoWallpaperSuggestions = objc_msgSend(v71, "count");
  if (objc_msgSend(v4, "isCancelledWithProgress:", 0.2))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v74 = 281;
      *(_WORD *)&v74[4] = 2080;
      *(_QWORD *)&v74[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v5 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_36;
  }
  v64 = self;
  v54 = v10;
  v55 = v9;
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = v7;
  v15 = v7;
  v16 = os_signpost_id_generate(v15);
  v17 = v15;
  v18 = v17;
  v52 = v16 - 1;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PGSettlingEffectWallpaperSuggesterFilterCandidates", ", buf, 2u);
  }
  spid = v16;

  info = 0;
  mach_timebase_info(&info);
  v51 = mach_absolute_time();
  p_filteringStatistics->postfilteringStatistics = 0;
  p_postfilteringStatistics = &p_filteringStatistics->postfilteringStatistics;
  v53 = v6;
  objc_msgSend(v6, "curationContext");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_msgSend(v8, "count");
  v70 = 0;
  v20 = 0;
  v57 = v19 / 0xC8;
  v21 = 1.0 / (double)v19 * 0.8;
  v59 = v8;
  v60 = v19;
  v22 = v19;
  v58 = v18;
  while (1)
  {
    v61 = v22 - 200;
    v62 = v20;
    v23 = v22 >= 0xC8 ? 200 : v22;
    v24 = v60 - 200 * v20 >= 0xC8 ? 200 : v60 - 200 * v20;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsAtIndexes:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      break;
LABEL_28:
    v36 = v58;
    v37 = v58;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = objc_msgSend(v63, "firstIndex");
      v39 = objc_msgSend(v63, "lastIndex");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v74 = v38;
      *(_WORD *)&v74[8] = 2048;
      *(_QWORD *)&v74[10] = v39;
      _os_log_debug_impl(&dword_1CA237000, v37, OS_LOG_TYPE_DEBUG, "[PGSettlingEffectWallpaperSuggester] processed candidates from %lu to %lu", buf, 0x16u);
    }

    v70 += 200;
    v22 = v61;
    v20 = v62 + 1;
    v8 = v59;
    if (v62 == v57)
    {
      -[PGSettlingEffectWallpaperSuggester setAvailableFeaturesForCandidates:pass:](v64, "setAvailableFeaturesForCandidates:pass:", v66, 0);
      +[PGSettlingEffectWallpaperSuggestionCandidate sortDescriptorsForProcessing](PGSettlingEffectWallpaperSuggestionCandidate, "sortDescriptorsForProcessing");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "sortedArrayUsingDescriptors:", v41);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v37;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v44 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v74 = v44;
        _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Fetched %lu sorted wallpaper candidates.", buf, 0xCu);
      }

      v45 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v48 = v42;
      v49 = v48;
      v10 = v54;
      v9 = v55;
      if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v49, OS_SIGNPOST_INTERVAL_END, spid, "PGSettlingEffectWallpaperSuggesterFilterCandidates", ", buf, 2u);
      }

      v7 = v56;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v74 = "PGSettlingEffectWallpaperSuggesterFilterCandidates";
        *(_WORD *)&v74[8] = 2048;
        *(double *)&v74[10] = (float)((float)((float)((float)(v45 - v51) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v49, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v6 = v53;
      goto LABEL_35;
    }
  }
  v26 = 0;
  while (1)
  {
    v27 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      break;
LABEL_27:

    objc_autoreleasePoolPop(v27);
    if (v23 == ++v26)
      goto LABEL_28;
  }
  v31 = -[PGSettlingEffectWallpaperSuggestionCandidate initWithAsset:suggestion:]([PGSettlingEffectWallpaperSuggestionCandidate alloc], "initWithAsset:suggestion:", v30, v28);
  v32 = (void *)objc_opt_class();
  -[PGSettlingEffectWallpaperSuggester filteringContext](v64, "filteringContext");
  v33 = v4;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = objc_msgSend(v32, "candidate:passesFilteringWithContext:curationContext:statistics:", v31, v34, v65, p_postfilteringStatistics);

  v4 = v33;
  if ((_DWORD)v32)
    v35 = v67;
  else
    v35 = v66;
  objc_msgSend(v35, "addObject:", v31);
  if (!objc_msgSend(v33, "isCancelledWithProgress:", v21 * (double)(unint64_t)(v70 + v26) + 0.2))
  {

    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v74 = 318;
    *(_WORD *)&v74[4] = 2080;
    *(_QWORD *)&v74[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

  objc_autoreleasePoolPop(v27);
  v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v53;
  v10 = v54;
  v9 = v55;
  v7 = v56;
  v36 = v58;
  v8 = v59;
LABEL_35:

LABEL_36:
LABEL_37:

  return v5;
}

- (id)consolidatedCandidatesFromWallpaperCandidates:(id)a3 highlightCandidates:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t i;
  void *v33;
  void *v34;
  void *context;
  void *v37;
  id v38;
  NSObject *v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = a4;
  -[PGAbstractSuggester session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v10 = (void *)MEMORY[0x1E0D77EF8];
  objc_msgSend(v7, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchSettlingEffectSuggestionsInPhotoLibrary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  v14 = (void *)MEMORY[0x1E0D77EF8];
  v37 = v7;
  objc_msgSend(v7, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:excludeExistingWallpapers:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "count");
  v39 = v8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v19 = v8;
    *(_DWORD *)buf = 67109632;
    v41 = objc_msgSend(v12, "count");
    v42 = 1024;
    v43 = objc_msgSend(v17, "count");
    v44 = 1024;
    v45 = v13 - v18;
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Found %d settling effect suggestions and %d settling effect highlight assets. Priority count: %d", buf, 0x14u);

  }
  objc_autoreleasePoolPop(context);
  v20 = (void *)objc_msgSend(v38, "copy");
  v21 = v20;
  if (v13 != v18)
  {
    v22 = objc_msgSend(v20, "count");
    if (v13 - v18 >= v22)
      v23 = v22;
    else
      v23 = v13 - v18;
    objc_msgSend(v21, "subarrayWithRange:", 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v24);
    objc_msgSend(v21, "arrayByExcludingObjectsInArray:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v26 = v39;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 67109120;
      v41 = v27;
      _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Prioritize %d highlight candidates for processing.", buf, 8u);
    }

    v21 = (void *)v25;
  }
  v28 = objc_msgSend(v6, "count");
  v29 = objc_msgSend(v21, "count");
  if (v28 <= v29)
    v30 = v29;
  else
    v30 = v28;
  if (v30)
  {
    v31 = v29;
    for (i = 0; i != v30; ++i)
    {
      if (i < v28)
      {
        objc_msgSend(v6, "objectAtIndex:", i);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v33);

      }
      if (i < v31)
      {
        objc_msgSend(v21, "objectAtIndex:", i);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v34);

      }
    }
  }

  return v9;
}

- (void)processFRCFromCandidates:(id)a3 withProgressReporter:(id)a4
{
  int v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  PGSettlingEffectConfig *v13;
  void *v14;
  unint64_t v15;
  double v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  PGSettlingEffectWallpaperSuggester *v23;
  PGWallpaperSuggestionAssetGater *assetGater;
  int v25;
  PGWallpaperSuggestionAssetGater *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  PGWallpaperSuggestionAssetGater *v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  unsigned int v36;
  void *v37;
  double v38;
  double v39;
  char v40;
  int v41;
  NSObject *v42;
  PGWallpaperSuggestionAssetGater *v43;
  const char *v44;
  __int128 v45;
  NSObject *v46;
  int v47;
  uint64_t v48;
  uint32_t denom;
  uint32_t numer;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  os_signpost_id_t spid;
  unint64_t v55;
  void *v56;
  void *v57;
  int v58;
  PGSettlingEffectConfig *v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  unint64_t v63;
  id v64;
  int v65;
  id v66;
  int v67;
  NSObject *v68;
  id v69;
  id v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  void *context;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  _OWORD v78[3];
  int v79;
  _QWORD v80[4];
  id v81;
  uint64_t *v82;
  double v83;
  _OWORD v84[3];
  int v85;
  mach_timebase_info info;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  char v90;
  uint8_t buf[56];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v70 = a4;
  v6 = objc_msgSend(v70, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v88 + 24) = v6;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 499;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_74;
  }
  -[PGAbstractSuggester session](self, "session");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v69, "count");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "dateByAddingTimeInterval:", 900.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v8;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v56;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = &unk_1E84EB208;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v62;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Running L1 & FRC Gating for %d candidates. StartingDate: %@, MaxProcessingTime: %@s, MaxProcessingDate: %@", buf, 0x26u);
  }
  v60 = v8;
  v9 = v7;
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  spid = v10;
  v55 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGSettlingEffectWallpaperSuggesterFRCGating", ", buf, 2u);
  }
  v68 = v12;

  info = 0;
  mach_timebase_info(&info);
  v53 = mach_absolute_time();
  v13 = [PGSettlingEffectConfig alloc];
  objc_msgSend(v57, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[PGSettlingEffectConfig initWithPhotoLibrary:loggingConnection:](v13, "initWithPhotoLibrary:loggingConnection:", v14, v68);

  v63 = -[PGSettlingEffectConfig maxL1FailuresAllowed](v59, "maxL1FailuresAllowed");
  v61 = -[PGSettlingEffectConfig maxFRCRequestsAllowed](v59, "maxFRCRequestsAllowed");
  if (-[PGSettlingEffectWallpaperSuggester hasEnoughSettlingEffectAssets](self, "hasEnoughSettlingEffectAssets"))
  {
    v63 = -[PGSettlingEffectConfig defaultL1FailuresAllowed](v59, "defaultL1FailuresAllowed");
    v61 = -[PGSettlingEffectConfig defaultFRCRequestsAllowed](v59, "defaultFRCRequestsAllowed");
  }
  v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v60)
  {
    v75 = 0;
    v65 = 0;
    v58 = 0;
    goto LABEL_63;
  }
  v15 = 0;
  v67 = 0;
  v65 = 0;
  v72 = 0;
  v73 = 0;
  v58 = 0;
  v71 = 0;
  v75 = 0;
  v76 = v60 + 1;
  v16 = 1.0 / (double)v60;
  while (1)
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v69, "objectAtIndexedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "asset");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "suggestion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 != 0;

    if (v18)
      v20 = CFSTR("suggestion");
    else
      v20 = CFSTR("highlight");
    v21 = v68;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v77, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v15 + 1;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v60;
      *(_WORD *)&buf[14] = 2112;
      *(_QWORD *)&buf[16] = v20;
      *(_WORD *)&buf[24] = 2112;
      *(_QWORD *)&buf[26] = v22;
      _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Check FRC eligibility (%d/%d) for %@ asset: %@", buf, 0x22u);

    }
    v23 = self;
    assetGater = self->_assetGater;
    if (assetGater)
    {
      -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](assetGater, "settlingEffectGatingStatistics");
    }
    else
    {
      v85 = 0;
      memset(v84, 0, sizeof(v84));
    }
    v25 = +[PGWallpaperSuggestionAssetGater numberOfFailuresAfterStabilizationFromStatistics:](PGWallpaperSuggestionAssetGater, "numberOfFailuresAfterStabilizationFromStatistics:", v84);
    v26 = v23->_assetGater;
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __84__PGSettlingEffectWallpaperSuggester_processFRCFromCandidates_withProgressReporter___block_invoke;
    v80[3] = &unk_1E8428630;
    v82 = &v87;
    v27 = v70;
    v81 = v27;
    v83 = v16 * (double)v15;
    -[PGWallpaperSuggestionAssetGater gateAsset:progressBlock:](v26, "gateAsset:progressBlock:", v77, v80);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v18)
    {
      if (objc_msgSend(v28, "passesSettlingEffect"))
        v30 = v66;
      else
        v30 = v64;
      objc_msgSend(v30, "addObject:", v17);
    }
    else
    {
      v65 += objc_msgSend(v28, "passesSettlingEffect");
    }
    if (-[PGWallpaperSuggestionAssetGater isLastGatingCallingMediaAnalysis](v23->_assetGater, "isLastGatingCallingMediaAnalysis"))
    {
      v31 = v23->_assetGater;
      if (v31)
      {
        -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v31, "settlingEffectGatingStatistics");
      }
      else
      {
        v79 = 0;
        memset(v78, 0, sizeof(v78));
      }
      v32 = +[PGWallpaperSuggestionAssetGater numberOfFailuresAfterStabilizationFromStatistics:](PGWallpaperSuggestionAssetGater, "numberOfFailuresAfterStabilizationFromStatistics:", v78);
      if (v32 > v25)
        v33 = v72;
      else
        v33 = v72 + 1;
      v34 = v73;
      if (v32 > v25)
        v34 = v73 + 1;
      v72 = v33;
      v73 = v34;
      v35 = objc_msgSend(v29, "passesSettlingEffect");
      v36 = objc_msgSend(v29, "didTimeout");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "timeIntervalSinceDate:", v37);
      v39 = v38;
      v67 += v35;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)&buf[4] = v73 + v72;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v73;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v72 - v67;
        *(_WORD *)&buf[20] = 1024;
        *(_DWORD *)&buf[22] = v67;
        *(_WORD *)&buf[26] = 2048;
        *(double *)&buf[28] = v39;
        _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Attempted FRC for %d items, %d failed L1, %d failed FRC, %d passed. %.3fs processing time left.", buf, 0x24u);
      }
      v71 += v36;
      if (v73 >= v63 || v72 >= v61 || v71 > 1 || v39 < 0.0)
      {
        self = v23;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67110912;
          *(_DWORD *)&buf[4] = v73;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v63;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = v72;
          *(_WORD *)&buf[20] = 1024;
          *(_DWORD *)&buf[22] = v61;
          *(_WORD *)&buf[26] = 1024;
          *(_DWORD *)&buf[28] = v71;
          *(_WORD *)&buf[32] = 1024;
          *(_DWORD *)&buf[34] = 1;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = v76;
          *(_WORD *)&buf[44] = 2048;
          *(double *)&buf[46] = v39;
          _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Reached (%d/%d) MAD L1 failures OR (%d/%d) FRC requests OR (%d/%d) timeouts allowed. %d untried. %.3fs processing time left.", buf, 0x36u);
        }
        if (v23->_noLimit)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] no limit mode is enabled, continue generation", buf, 2u);
          }
          v41 = 4;
        }
        else
        {
          v41 = 2;
        }

        v58 = v76;
        goto LABEL_57;
      }

    }
    self = v23;
    if (*((_BYTE *)v88 + 24))
    {
      *((_BYTE *)v88 + 24) = 1;
    }
    else
    {
      v40 = objc_msgSend(v27, "isCancelledWithProgress:", v16 * (double)v15);
      *((_BYTE *)v88 + 24) = v40;
      self = v23;
      if ((v40 & 1) == 0)
      {
        v41 = 0;
        goto LABEL_57;
      }
    }
    v41 = 1;
    v42 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 608;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_57:

    objc_autoreleasePoolPop(context);
    LODWORD(v75) = v75 + v19;
    HIDWORD(v75) += !v19;
    if (v41)
    {
      if (v41 != 4)
        break;
    }
    ++v15;
    if (--v76 == 1)
      goto LABEL_63;
  }
  if (v41 == 2)
  {
LABEL_63:
    v43 = self->_assetGater;
    if (v43)
    {
      -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v43, "settlingEffectGatingStatistics");
      v44 = "MusicKitRequestFactoryError";
    }
    else
    {
      memset(buf, 0, 52);
      v44 = "MusicKitRequestFactoryError";
    }
    v45 = *(_OWORD *)&buf[16];
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruFeatureDisabled = *(_OWORD *)buf;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruGenericError = v45;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruMetadataIntegrity = *(_OWORD *)&buf[32];
    self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStillTransition = *(_DWORD *)&buf[48];
    -[PGWallpaperSuggestionAssetGater logCurrentSettlingEffectGatingStatisticsWithPrefix:](self->_assetGater, "logCurrentSettlingEffectGatingStatisticsWithPrefix:", self->_loggingPrefix);
    -[PGWallpaperSuggestionAssetGater logCurrentGatingStatisticsWithPrefix:](self->_assetGater, "logCurrentGatingStatisticsWithPrefix:", self->_loggingPrefix);
    -[PGSettlingEffectWallpaperSuggester setAvailableFeaturesForCandidates:pass:](self, "setAvailableFeaturesForCandidates:pass:", v66, 1);
    -[PGSettlingEffectWallpaperSuggester setAvailableFeaturesForCandidates:pass:](self, "setAvailableFeaturesForCandidates:pass:", v64, 0);
    self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates = objc_msgSend(v66, "count");
    self->_filteringStatistics.numberOfFRCEligibleAssetCandidates = v65;
    v46 = v68;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = objc_msgSend(v66, "count");
      *(_DWORD *)buf = *((_QWORD *)v44 + 258);
      *(_DWORD *)&buf[4] = v47;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v75;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v65;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = HIDWORD(v75);
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v58;
      _os_log_impl(&dword_1CA237000, v46, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Found %d FRC eligible wallpapers from %d wallpaper candidates, %d FRC eligible highlight assets from %d candidates, %d untried", buf, 0x20u);
    }

    v48 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v51 = v46;
    v52 = v51;
    if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v52, OS_SIGNPOST_INTERVAL_END, spid, "PGSettlingEffectWallpaperSuggesterFRCGating", ", buf, 2u);
    }

    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PGSettlingEffectWallpaperSuggesterFRCGating";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v48 - v53) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

LABEL_74:
  _Block_object_dispose(&v87, 8);

}

- (BOOL)hasEnoughSettlingEffectAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[PGAbstractSuggester session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 100);
  v18[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v5);

  objc_msgSend(MEMORY[0x1E0D77EF8], "settlingEffectAssetInternalSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0D77EF8], "fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:excludeExistingWallpapers:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = CFSTR("Not enough content");
  if (v8 > 0x63)
    v9 = CFSTR("Has enough content");
  v10 = v9;
  objc_msgSend(v2, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109634;
    v13[1] = objc_msgSend(v7, "count");
    v14 = 1024;
    v15 = 100;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Found %d (target:%d) FRC eligible highlight assets. %@", (uint8_t *)v13, 0x18u);
  }

  return v8 > 0x63;
}

- (unint64_t)totalLivePhotos
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[PGAbstractSuggester session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetCollectionsWithType:subtype:options:", 2, 213, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (void)sendSettlingEffectStatisticsEvent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PGAbstractSuggester session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfEliminationsThruSettlingEffectScore;
  v26 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruVideoDecision;
  v27 = v7;
  v28 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruCrop;
  v29 = *(_QWORD *)&self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates;
  v8 = *(_OWORD *)&self->_filteringStatistics.postfilteringStatistics.numberOfEliminationsThruSettlingEffectScore;
  v22 = *(_OWORD *)&self->_filteringStatistics.numberOfLivePhotos;
  v23 = v8;
  v9 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStabilization;
  v24 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruResourceAvailability;
  v25 = v9;
  objc_msgSend(v5, "analyticsPayloadFromFRCFilteringStatistics:photoLibrary:", &v22, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addEntriesFromDictionary:", v10);
  objc_msgSend((id)objc_opt_class(), "analyticsPayloadFromPostFilteringStatistics:", *(_QWORD *)&self->_filteringStatistics.postfilteringStatistics);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v11);
  v12 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruGenericError;
  v22 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruFeatureDisabled;
  v23 = v12;
  v24 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruMetadataIntegrity;
  LODWORD(v25) = self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStillTransition;
  PFPosterSettlingEffectGatingStatisticsAnalyticsPayload();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v13);
  v14 = (void *)objc_opt_class();
  v15 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfHighlightCandidates;
  v22 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfHighlightCandidatesForFRC;
  v23 = v15;
  LODWORD(v24) = self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruDeviceOwner;
  objc_msgSend(v14, "analyticsPayloadFromHighlightStatistics:", &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v16);
  objc_msgSend(v4, "workingContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "analytics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (uint64_t *)MEMORY[0x1E0D75870];
  objc_msgSend(v18, "sendEvent:withPayload:", *MEMORY[0x1E0D75870], v3);

  objc_msgSend(v4, "loggingConnection");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = *v19;
    LODWORD(v22) = 138412290;
    *(_QWORD *)((char *)&v22 + 4) = v21;
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Sent %@ event", (uint8_t *)&v22, 0xCu);
  }

}

- (PGSettlingEffectWallpaperSuggesterFilteringContext)filteringContext
{
  return self->_filteringContext;
}

- (void)setFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_filteringContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteringContext, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong((id *)&self->_assetGater, 0);
}

uint64_t __84__PGSettlingEffectWallpaperSuggester_processFRCFromCandidates_withProgressReporter___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(a1 + 48));
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v1 + 24) = result;
  return result;
}

void __77__PGSettlingEffectWallpaperSuggester_setAvailableFeaturesForCandidates_pass___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v17;
    *(_QWORD *)&v4 = 138412290;
    v15 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        objc_msgSend(v8, "suggestion", v15, (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAvailableFeatures:", objc_msgSend(v9, "availableFeatures") & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(a1 + 48));
LABEL_8:

          goto LABEL_10;
        }
        v11 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = v11;
          objc_msgSend(v8, "asset");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v15;
          v21 = v13;
          _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[PGSettlingEffectWallpaperSuggester] Missing PHSuggestion for asset: %@, skip updating availableFeatures", buf, 0xCu);

          goto LABEL_8;
        }
LABEL_10:

        ++v7;
      }
      while (v5 != v7);
      v14 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      v5 = v14;
    }
    while (v14);
  }

}

uint64_t __75__PGSettlingEffectWallpaperSuggester_deleteLegacySettlingEffectSuggestions__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD17D8], "deleteSuggestions:", *(_QWORD *)(a1 + 32));
}

+ (id)suggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 6);
}

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 680);
}

+ (id)prefilteringInternalPredicateWithForbiddenAssetUUIDs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D77EF8], "settlingEffectLivePhotoPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("uuid"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 statistics:(id *)a6
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  float v13;
  float v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  char v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "subtype");
    v11 = (_DWORD)v10 != 655 && (_DWORD)v10 != 605;
    if ((_DWORD)v10 == 605)
      goto LABEL_17;
    v12 = v10;
    if ((_DWORD)v10 == 655)
      goto LABEL_17;
  }
  else
  {
    v12 = 0;
  }
  v20 = 0;
  +[PGSettlingEffectScoreHelper analyzedSettlingEffectScoreForAsset:requestedOnDemand:](PGSettlingEffectScoreHelper, "analyzedSettlingEffectScoreForAsset:requestedOnDemand:", v8, &v20);
  v14 = v13;
  if (v20)
    ++a6->var1;
  objc_msgSend(v8, "mediaAnalysisProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGSettlingEffectWallpaperSuggesterFilteringContext minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:](PGSettlingEffectWallpaperSuggesterFilteringContext, "minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:", v12, objc_msgSend(v15, "mediaAnalysisVersion"));
  v17 = v16;

  v18 = v14;
  if (v17 <= v18)
  {
    v11 = 1;
  }
  else if (+[PGUserDefaults wallpaperSkipSettlingEffectScoreGating](PGUserDefaults, "wallpaperSkipSettlingEffectScoreGating"))
  {
    v11 = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v22 = v18;
      v23 = 2048;
      v24 = v17;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] PGWallpaperSkipSettlingEffectScoreGating is ON. Skip gating settlingEffectScore (%.3f < %.3f)", buf, 0x16u);
    }
  }
  else
  {
    v11 = 0;
    ++a6->var0;
  }
LABEL_17:

  return v11;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PGSettlingEffectWallpaperSuggestionCandidate *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  PGWallpaperSuggestionAssetGater *v24;
  PGWallpaperSuggestionAssetGater *v25;
  void *v26;
  char v27;
  void *v28;
  const __CFString *v29;
  BOOL v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  id *v35;
  void *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "photoLibrary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "prefilteringInternalPredicateWithForbiddenAssetUUIDs:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInternalPredicate:", v13);

  v14 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v10, "localIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchAssetsWithLocalIdentifiers:options:", v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = -[PGSettlingEffectWallpaperSuggestionCandidate initWithAsset:suggestion:]([PGSettlingEffectWallpaperSuggestionCandidate alloc], "initWithAsset:suggestion:", v10, 0);
    v20 = -[PGSettlingEffectWallpaperSuggesterFilteringContext initInOrientation:]([PGSettlingEffectWallpaperSuggesterFilteringContext alloc], "initInOrientation:", a5);
    v50 = 0;
    v21 = v11;
    if ((objc_msgSend(a1, "candidate:passesFilteringWithContext:curationContext:statistics:", v19, v20, v11, &v50) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLForKey:", *MEMORY[0x1E0D78178]);

      if (v23)
      {
        v24 = [PGWallpaperSuggestionAssetGater alloc];
        v25 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v24, "initWithType:loggingConnection:", 5, MEMORY[0x1E0C81028]);
        -[PGWallpaperSuggestionAssetGater setCoversTracks:](v25, "setCoversTracks:", 1);
        -[PGWallpaperSuggestionAssetGater setIsUserInitiated:](v25, "setIsUserInitiated:", 1);
        -[PGWallpaperSuggestionAssetGater gateAsset:progressBlock:](v25, "gateAsset:progressBlock:", v10, &__block_literal_global_5734);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "passesSettlingEffect");
        if (a6 && (v27 & 1) == 0)
        {
          v28 = v26;
          if (v25)
          {
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            v21 = v11;
            if (v49 > 0)
            {
              v29 = CFSTR("Failed feature enablement check");
LABEL_53:
              v35 = a6;
              goto LABEL_54;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v48 > 0)
            {
              v29 = CFSTR("Failed hardware support check");
              goto LABEL_53;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v47 > 0)
            {
              v29 = CFSTR("Failed to download resources");
              goto LABEL_53;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v46 > 0)
            {
              v29 = CFSTR("Failed supported adjustment check");
              goto LABEL_53;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v45 > 0)
            {
              v29 = CFSTR("Failed with generic failure");
              goto LABEL_53;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v44 > 0)
            {
              v29 = CFSTR("Failed metadata check");
              goto LABEL_53;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v43 > 0)
            {
              v29 = CFSTR("Failed stabilization");
              goto LABEL_53;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v42 > 0)
            {
              v29 = CFSTR("Failed video quality");
LABEL_52:
              v21 = v11;
              goto LABEL_53;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v41 > 0)
            {
              v29 = CFSTR("Failed metadata integrity");
              goto LABEL_52;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v40 > 0)
            {
              v29 = CFSTR("Failed FRC");
              goto LABEL_52;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v39 > 0)
            {
              v29 = CFSTR("Failed video decision");
              goto LABEL_52;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            if (v38 > 0)
            {
              v29 = CFSTR("Failed layout decision");
              goto LABEL_52;
            }
            -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](v25, "settlingEffectGatingStatistics");
            v21 = v11;
            v35 = a6;
            if (v37 > 0)
            {
              v29 = CFSTR("Failed still transition");
              goto LABEL_54;
            }
          }
          else
          {
            v35 = a6;
            v21 = v11;
          }
          v29 = CFSTR("Unknown Reason");
LABEL_54:
          v31 = v36;
          *v35 = (id)v29;

          v30 = 0;
          goto LABEL_26;
        }

      }
      if (a6)
      {
        if (v23)
          v33 = CFSTR("Pass");
        else
          v33 = CFSTR("Pass w/o FRC");
        *a6 = objc_retainAutorelease(v33);
      }
      v30 = 1;
      v21 = v11;
    }
    else if (a6)
    {
      v30 = 0;
      if ((int)v50 < 1)
        v32 = CFSTR("Unknown Reason");
      else
        v32 = CFSTR("Low Settling Effect Score");
      *a6 = v32;
    }
    else
    {
      v30 = 0;
    }
    v31 = v36;
LABEL_26:

    goto LABEL_27;
  }
  v30 = 0;
  if (a6)
    *a6 = CFSTR("Fails Predicate");
  v21 = v11;
  v31 = v36;
LABEL_27:

  return v30;
}

+ (id)analyticsPayloadFromFRCFilteringStatistics:(id *)a3 photoLibrary:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("LivePhotos"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("LivePhotoWallpaper"));

  objc_msgSend(MEMORY[0x1E0D77EF8], "fetchSettlingEffectSuggestionsInPhotoLibrary:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("CurrentWallpaperPassFRC"));

  v12 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fetchKeyAssetForEachSuggestion:options:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("CurrentWallpaperAssetPassFRC"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("ProcessedWallpaperFRCEligibleCandidates"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("ProcessedHighlightFRCEligibleCandidates"));

  return v7;
}

+ (id)analyticsPayloadFromPostFilteringStatistics:(id)a3
{
  uint64_t var1;
  id v5;
  void *v6;
  void *v7;

  var1 = a3.var1;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("WallpaperFailedSettlingEffectScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("WallpaperSettlingEffectScoreRequested"));

  return v5;
}

+ (id)analyticsPayloadFromHighlightStatistics:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t var0;
  uint64_t var1;
  uint64_t var3;
  uint64_t var2;
  uint64_t var5;
  uint64_t var4;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HighlightCandidatesForFRC"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HighlightFailedSettlingEffectScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("HighlightSettlingEffectScoreRequested"));

  var0 = a3->var3.var0;
  var1 = a3->var3.var1;
  var2 = a3->var3.var2;
  var3 = a3->var3.var3;
  var4 = a3->var3.var4;
  var5 = a3->var3.var5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("HighlightAssets"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("HighlightCandidates"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("HighlightFailedCrop"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("HighlightFailedNSFW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("HighlightKnownFRCFailures"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("HighlightFailedDeviceOwner"));

  return v4;
}

@end
