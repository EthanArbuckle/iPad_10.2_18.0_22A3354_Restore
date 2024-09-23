@implementation PGCityscapeWallpaperSuggester

- (PGCityscapeWallpaperSuggester)initWithSession:(id)a3
{
  id v4;
  PGCityscapeWallpaperSuggester *v5;
  PGWallpaperSuggestionAssetGater *v6;
  void *v7;
  uint64_t v8;
  PGWallpaperSuggestionAssetGater *assetGater;
  uint64_t v10;
  CLSSceneConfidenceThresholdHelper *peopleSceneConfidenceThresholdHelper;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGCityscapeWallpaperSuggester;
  v5 = -[PGAbstractSuggester initWithSession:](&v13, sel_initWithSession_, v4);
  if (v5)
  {
    if (objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions"))
    {
      v6 = [PGWallpaperSuggestionAssetGater alloc];
      objc_msgSend(v4, "loggingConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v6, "initWithType:loggingConnection:", 4, v7);
      assetGater = v5->_assetGater;
      v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v8;

      -[PGWallpaperSuggestionAssetGater setEnableSettlingEffect:](v5->_assetGater, "setEnableSettlingEffect:", 0);
    }
    +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper](PGWallpaperSuggestionUtilities, "peopleSceneConfidenceThresholdHelper");
    v10 = objc_claimAutoreleasedReturnValue();
    peopleSceneConfidenceThresholdHelper = v5->_peopleSceneConfidenceThresholdHelper;
    v5->_peopleSceneConfidenceThresholdHelper = (CLSSceneConfidenceThresholdHelper *)v10;

    -[PGCityscapeWallpaperSuggester setupFilteringContexts](v5, "setupFilteringContexts");
  }

  return v5;
}

- (void)setupFilteringContexts
{
  PGCityscapeWallpaperSuggester *v2;
  objc_class *v3;
  int IsIPad;
  PGCityscapeWallpaperSuggesterFilteringContext *v5;
  uint64_t v6;
  PGCityscapeWallpaperSuggesterFilteringContext *primaryFilteringContext;
  PGCityscapeWallpaperSuggesterFilteringContext *v8;
  PGCityscapeWallpaperSuggesterFilteringContext *secondaryFilteringContext;
  uint64_t v10;
  PGCityscapeWallpaperSuggesterFilteringContext *v11;
  objc_class *v12;
  objc_class *v13;
  PGCityscapeWallpaperSuggester *v14;
  SEL v15;
  id v16;
  id v17;

  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  if (!v2)
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
LABEL_9:
    v14 = (PGCityscapeWallpaperSuggester *)_PFAssertFailHandler();
    -[PGCityscapeWallpaperSuggester suggestionsWithOptions:progress:](v14, v15, v16, v17);
    return;
  }
  if ((-[PGCityscapeWallpaperSuggester isMemberOfClass:](v2, "isMemberOfClass:", v3) & 1) == 0)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  IsIPad = PLPhysicalDeviceIsIPad();
  v5 = [PGCityscapeWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    v6 = -[PGCityscapeWallpaperSuggesterFilteringContext initForCityscapesInOrientation:](v5, "initForCityscapesInOrientation:", 2);
    primaryFilteringContext = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGCityscapeWallpaperSuggesterFilteringContext *)v6;

    v8 = -[PGCityscapeWallpaperSuggesterFilteringContext initForCityscapesInOrientation:]([PGCityscapeWallpaperSuggesterFilteringContext alloc], "initForCityscapesInOrientation:", 1);
    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = v8;
  }
  else
  {
    v10 = -[PGCityscapeWallpaperSuggesterFilteringContext initForCityscapesInOrientation:](v5, "initForCityscapesInOrientation:", 1);
    v11 = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGCityscapeWallpaperSuggesterFilteringContext *)v10;

    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = 0;
  }

}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  const char *v17;
  char v18;
  uint32_t v19;
  uint64_t v21;
  uint32_t numer;
  uint32_t denom;
  NSObject *v24;
  NSObject *v25;
  char v26;
  void *v27;
  unsigned __int16 v28;
  void *v29;
  unsigned __int16 v30;
  PGWallpaperSuggestionAssetGater *assetGater;
  PGWallpaperSuggestionAccumulator *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  __int128 v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  PGSingleAssetSuggestion *v43;
  void *v44;
  PGSingleAssetSuggestion *v45;
  PGWallpaperSuggestionAssetGater *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  char v50;
  NSObject *v51;
  int v52;
  int v53;
  void *v54;
  int v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  int v63;
  int v64;
  const __CFString *v65;
  void *v66;
  PGWallpaperSuggestionAssetGater *v67;
  NSObject *v68;
  _BOOL4 v69;
  int v70;
  int v71;
  const char *v72;
  NSObject *v73;
  uint32_t v74;
  int v75;
  char v76;
  uint64_t v77;
  uint32_t v78;
  uint32_t v79;
  NSObject *v80;
  NSObject *v81;
  __int128 v82;
  int v83;
  uint64_t v84;
  PGWallpaperSuggestionAccumulator *v85;
  int v86;
  void *v87;
  int v88;
  void *v89;
  id obj;
  unsigned int v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  os_signpost_id_t spid;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  _QWORD v103[4];
  id v104;
  uint64_t *v105;
  double v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  mach_timebase_info info;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  char v115;
  uint8_t buf[4];
  _BYTE v117[18];
  int v118;
  __int16 v119;
  int v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v102 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v112 = 0;
  v113 = &v112;
  v114 = 0x2020000000;
  v115 = 0;
  v8 = objc_msgSend(v7, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v113 + 24) = v8;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v117 = 124;
      *(_WORD *)&v117[4] = 2080;
      *(_QWORD *)&v117[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_25;
  }
  v10 = objc_msgSend(v102, "maximumNumberOfSuggestions");
  -[PGAbstractSuggester session](self, "session");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "loggingConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  v97 = v12 - 1;
  spid = v12;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PGCityscapeWallpaperSuggester", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v96 = mach_absolute_time();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v117 = v10;
    _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Starting to generate %d suggestions.", buf, 8u);
  }
  objc_msgSend(v7, "childProgressReporterFromStart:toEnd:", 0.0, 0.39);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCityscapeWallpaperSuggester fetchUnsortedCandidatesWithProgressReporter:](self, "fetchUnsortedCandidatesWithProgressReporter:");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v101, "count"))
  {
    if (*((_BYTE *)v113 + 24))
    {
      *((_BYTE *)v113 + 24) = 1;
    }
    else
    {
      v18 = objc_msgSend(v7, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v113 + 24) = v18;
      if ((v18 & 1) == 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Found 0 unsorted candidate.", buf, 2u);
        }
        v21 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v24 = v14;
        v25 = v24;
        if (v97 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v25, OS_SIGNPOST_INTERVAL_END, v12, "PGCityscapeWallpaperSuggester", ", buf, 2u);
        }

        if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v117 = "PGCityscapeWallpaperSuggester";
        *(_WORD *)&v117[8] = 2048;
        *(double *)&v117[10] = (float)((float)((float)((float)(v21 - v96) * (float)numer) / (float)denom) / 1000000.0);
        v17 = "[Performance] %s: %f ms";
        v16 = v25;
        v19 = 22;
        goto LABEL_22;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v117 = 138;
      *(_WORD *)&v117[4] = 2080;
      *(_QWORD *)&v117[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      v16 = MEMORY[0x1E0C81028];
      v17 = "Cancelled at line %d in file %s";
      goto LABEL_21;
    }
LABEL_23:
    v9 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_24;
  }
  if (*((_BYTE *)v113 + 24))
  {
    *((_BYTE *)v113 + 24) = 1;
    goto LABEL_16;
  }
  v15 = objc_msgSend(v7, "isCancelledWithProgress:", 0.4);
  *((_BYTE *)v113 + 24) = v15;
  if ((v15 & 1) != 0)
  {
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v117 = 145;
      *(_WORD *)&v117[4] = 2080;
      *(_QWORD *)&v117[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      v16 = MEMORY[0x1E0C81028];
      v17 = "Cancelled at line %d in file %s";
LABEL_21:
      v19 = 18;
LABEL_22:
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, v17, buf, v19);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  -[PGCityscapeWallpaperSuggester sortedDedupedCandidatesFromCandidates:](self, "sortedDedupedCandidatesFromCandidates:", v101);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v113 + 24))
  {
    *((_BYTE *)v113 + 24) = 1;
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v117 = 149;
      *(_WORD *)&v117[4] = 2080;
      *(_QWORD *)&v117[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_39;
  }
  v26 = objc_msgSend(v7, "isCancelledWithProgress:", 0.8);
  *((_BYTE *)v113 + 24) = v26;
  if ((v26 & 1) != 0)
    goto LABEL_36;
  objc_msgSend((id)objc_opt_class(), "suggestionTypes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "firstIndex");

  objc_msgSend((id)objc_opt_class(), "suggestionSubtypes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "firstIndex");

  assetGater = self->_assetGater;
  v32 = [PGWallpaperSuggestionAccumulator alloc];
  if (assetGater)
    v33 = 2 * v10;
  else
    v33 = 0;
  if (assetGater)
    v34 = 5;
  else
    v34 = 0;
  v85 = -[PGWallpaperSuggestionAccumulator initWithTargetNumberOfSuggestions:targetMinimumNumberOfGatedSuggestions:maximumNumberOfSuggestionsToTryForGating:loggingConnection:](v32, "initWithTargetNumberOfSuggestions:targetMinimumNumberOfGatedSuggestions:maximumNumberOfSuggestionsToTryForGating:loggingConnection:", v10, v34, v33, v14);
  v35 = objc_msgSend(v89, "count");
  if (v35 <= 1)
    v36 = 1;
  else
    v36 = v35;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v89;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
  if (!v37)
  {
    v88 = 0;
    v86 = 0;
    v84 = 0;
    v83 = 0;
    goto LABEL_92;
  }
  v88 = 0;
  v86 = 0;
  v84 = 0;
  v83 = 0;
  v95 = 0;
  v39 = 0.1 / (double)v36;
  v91 = v30;
  v92 = v28;
  v93 = *(_QWORD *)v108;
  *(_QWORD *)&v38 = 138412290;
  v82 = v38;
  while (2)
  {
    v40 = 0;
    v94 = v37;
    do
    {
      if (*(_QWORD *)v108 != v93)
        objc_enumerationMutation(obj);
      v41 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v40);
      v42 = (void *)MEMORY[0x1CAA4EB2C]();
      v43 = [PGSingleAssetSuggestion alloc];
      objc_msgSend(v41, "asset");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[PGSingleAssetSuggestion initWithType:subtype:asset:](v43, "initWithType:subtype:asset:", v92, v91, v44);

      v46 = self->_assetGater;
      if (v46)
      {
        objc_msgSend(v41, "asset");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __65__PGCityscapeWallpaperSuggester_suggestionsWithOptions_progress___block_invoke;
        v103[3] = &unk_1E8428630;
        v105 = &v112;
        v104 = v7;
        v106 = v39 * (double)(unint64_t)(v95 + v40);
        -[PGWallpaperSuggestionAssetGater gateAsset:progressBlock:](v46, "gateAsset:progressBlock:", v47, v103);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGSingleAssetSuggestion setAvailableFeatures:](v45, "setAvailableFeatures:", objc_msgSend(v48, "availableFeatures"));
        v49 = objc_msgSend(v48, "passesAnyGating");

      }
      else
      {
        v49 = 1;
      }
      if (*((_BYTE *)v113 + 24))
      {
        *((_BYTE *)v113 + 24) = 1;
LABEL_60:
        v51 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v117 = 177;
          *(_WORD *)&v117[4] = 2080;
          *(_QWORD *)&v117[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
          _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v52 = 0;
        v53 = 0;
        goto LABEL_63;
      }
      v50 = objc_msgSend(v7, "isCancelledWithProgress:", v39 * (double)(unint64_t)(v95 + v40) + 0.9);
      *((_BYTE *)v113 + 24) = v50;
      if ((v50 & 1) != 0)
        goto LABEL_60;
      ++v88;
      if ((v49 & 1) != 0)
        goto LABEL_77;
      objc_msgSend(v41, "cropResult");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "cropForOrientation:", -[PGCityscapeWallpaperSuggesterFilteringContext orientation](self->_primaryFilteringContext, "orientation"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = -[PGCityscapeWallpaperSuggesterFilteringContext ignoreClockOverlap](self->_primaryFilteringContext, "ignoreClockOverlap")? 1: objc_msgSend(v87, "passesClockOverlap");
      objc_msgSend(v87, "cropZoomRatio", v82);
      v57 = v56;
      -[PGCityscapeWallpaperSuggesterFilteringContext maximumCropZoomRatio](self->_primaryFilteringContext, "maximumCropZoomRatio");
      v59 = v58;
      objc_msgSend(v87, "cropScore");
      v61 = v60;
      -[PGCityscapeWallpaperSuggesterFilteringContext minimumCropScore](self->_primaryFilteringContext, "minimumCropScore");
      v63 = v57 <= v59 ? v55 : 0;
      v64 = v61 >= v62 ? v63 : 0;

      if (v64)
      {
LABEL_77:
        -[PGWallpaperSuggestionAccumulator addSuggestion:passingGating:](v85, "addSuggestion:passingGating:", v45, v49, v82);
        ++v86;
        if (-[PGWallpaperSuggestionAccumulator accumulationIsComplete](v85, "accumulationIsComplete"))
        {
          v52 = 0;
          v53 = 1;
          goto LABEL_63;
        }
      }
      else
      {
        if ((v55 & 1) != 0)
        {
          if (v57 > v59)
          {
            ++v83;
            v65 = CFSTR("low resolution");
          }
          else
          {
            LODWORD(v84) = v84 + 1;
            v65 = CFSTR("low cropScore");
          }
        }
        else
        {
          ++HIDWORD(v84);
          v65 = CFSTR("clock overlap");
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v82;
          *(_QWORD *)v117 = v65;
          _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Rejecting non-gated suggestion because of %@.", buf, 0xCu);
        }
      }
      v53 = 0;
      v52 = 1;
LABEL_63:

      objc_autoreleasePoolPop(v42);
      if (!v52)
      {

        if (v53)
          goto LABEL_93;
        v9 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_108;
      }
      ++v40;
    }
    while (v94 != v40);
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
    v95 += v40;
    if (v37)
      continue;
    break;
  }
LABEL_92:

LABEL_93:
  -[PGWallpaperSuggestionAccumulator suggestions](v85, "suggestions", v82);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = self->_assetGater;
  v68 = v14;
  v69 = os_log_type_enabled(v68, OS_LOG_TYPE_INFO);
  if (v67)
  {
    if (v69)
    {
      v70 = objc_msgSend(v66, "count");
      v71 = -[PGWallpaperSuggestionAccumulator numberOfGatedSuggestions](v85, "numberOfGatedSuggestions");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v117 = v70;
      *(_WORD *)&v117[4] = 1024;
      *(_DWORD *)&v117[6] = v71;
      v72 = "[PGCityscapeWallpaperSuggester] Generated %d suggestions (%d gated)";
      v73 = v68;
      v74 = 14;
      goto LABEL_98;
    }
  }
  else if (v69)
  {
    v75 = objc_msgSend(v66, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v117 = v75;
    v72 = "[PGCityscapeWallpaperSuggester] Generated %d suggestions";
    v73 = v68;
    v74 = 8;
LABEL_98:
    _os_log_impl(&dword_1CA237000, v73, OS_LOG_TYPE_INFO, v72, buf, v74);
  }

  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v117 = v88;
    *(_WORD *)&v117[4] = 1024;
    *(_DWORD *)&v117[6] = v86;
    *(_WORD *)&v117[10] = 1024;
    *(_DWORD *)&v117[12] = HIDWORD(v84);
    *(_WORD *)&v117[16] = 1024;
    v118 = v83;
    v119 = 1024;
    v120 = v84;
    _os_log_impl(&dword_1CA237000, v68, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Tried %d assets, %d passed, rejected %d for clock overlap, %d for low resolution, %d for low crop score.", buf, 0x20u);
  }
  if (*((_BYTE *)v113 + 24))
  {
    *((_BYTE *)v113 + 24) = 1;
    goto LABEL_104;
  }
  v76 = objc_msgSend(v7, "isCancelledWithProgress:", 1.0);
  *((_BYTE *)v113 + 24) = v76;
  if ((v76 & 1) != 0)
  {
LABEL_104:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v117 = 220;
      *(_WORD *)&v117[4] = 2080;
      *(_QWORD *)&v117[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v77 = mach_absolute_time();
    v78 = info.numer;
    v79 = info.denom;
    v80 = v68;
    v81 = v80;
    if (v97 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v81, OS_SIGNPOST_INTERVAL_END, spid, "PGCityscapeWallpaperSuggester", ", buf, 2u);
    }

    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v117 = "PGCityscapeWallpaperSuggester";
      *(_WORD *)&v117[8] = 2048;
      *(double *)&v117[10] = (float)((float)((float)((float)(v77 - v96) * (float)v78) / (float)v79) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v81, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v9 = v66;
  }

LABEL_108:
LABEL_39:

LABEL_24:
LABEL_25:
  _Block_object_dispose(&v112, 8);

  return v9;
}

- (id)fetchCandidateAssets
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t denom;
  uint32_t numer;
  NSObject *v22;
  NSObject *v23;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  double v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[PGAbstractSuggester session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggingConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGCityscapeWallpaperSuggesterFetchCandidates", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v7 = mach_absolute_time();
  objc_msgSend(v2, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCacheSizeForFetch:", 200);
  objc_msgSend(v9, "setChunkSizeForFetch:", 200);
  +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchPropertySets:", v10);

  v11 = (void *)objc_opt_class();
  objc_msgSend(v2, "forbiddenAssetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prefilteringInternalPredicateWithForbiddenAssetUUIDs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v15);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134217984;
    v27 = (const char *)v18;
    _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Fetched %lu candidate assets.", buf, 0xCu);
  }

  v19 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v22 = v17;
  v23 = v22;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, v4, "PGCityscapeWallpaperSuggesterFetchCandidates", ", buf, 2u);
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "PGCityscapeWallpaperSuggesterFetchCandidates";
    v28 = 2048;
    v29 = (float)((float)((float)((float)(v19 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v16;
}

- (id)fetchUnsortedCandidatesWithProgressReporter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  PGCityscapeWallpaperSuggestionCandidate *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint32_t numer;
  uint32_t denom;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  os_signpost_id_t spid;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  os_log_t oslog;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *context;
  id v48;
  void *v49;
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
  __int128 v60;
  __int128 v61;
  __int128 v62;
  mach_timebase_info info;
  _BYTE v64[32];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t buf[32];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 287;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PGAbstractSuggester session](self, "session");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "loggingConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCityscapeWallpaperSuggester fetchCandidateAssets](self, "fetchCandidateAssets");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isCancelledWithProgress:", 0.2))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 293;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v5 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v39 = v6;
      v7 = v6;
      v8 = os_signpost_id_generate(v7);
      v9 = v7;
      v10 = v9;
      v38 = v8 - 1;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGCityscapeWallpaperSuggesterFilterCandidates", ", buf, 2u);
      }
      spid = v8;

      info = 0;
      mach_timebase_info(&info);
      v37 = mach_absolute_time();
      v40 = objc_msgSend(v43, "count") / 0xC8uLL;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v74 = 0u;
      memset(buf, 0, sizeof(buf));
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v54 = 0u;
      objc_msgSend(v44, "curationContext");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v12 = 0;
      oslog = v10;
      v42 = v4;
      while (1)
      {
        v46 = v12;
        context = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectsAtIndexes:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CD1390];
        objc_msgSend(v44, "curationContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "prefetchOnAssets:options:curationContext:", v13, 14, v15);

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v16 = v13;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v51 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
              v22 = (void *)MEMORY[0x1CAA4EB2C]();
              if (objc_msgSend((id)objc_opt_class(), "isPositiveWithUrbanSceneLabelsForAsset:", v21))
              {
                v23 = -[PGCityscapeWallpaperSuggestionCandidate initWithAsset:]([PGCityscapeWallpaperSuggestionCandidate alloc], "initWithAsset:", v21);
                if (objc_msgSend((id)objc_opt_class(), "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v23, self->_primaryFilteringContext, v49, self->_peopleSceneConfidenceThresholdHelper, buf)&& (!self->_secondaryFilteringContext|| objc_msgSend((id)objc_opt_class(), "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v23, self->_secondaryFilteringContext, v49, self->_peopleSceneConfidenceThresholdHelper, &v54)))
                {
                  objc_msgSend(v48, "addObject:", v23);
                }
                ++v11;

              }
              objc_autoreleasePoolPop(v22);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
          }
          while (v18);
        }

        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          v24 = oslog;
          v25 = objc_msgSend(v45, "firstIndex");
          v26 = objc_msgSend(v45, "lastIndex");
          *(_DWORD *)v64 = 134218240;
          *(_QWORD *)&v64[4] = v25;
          *(_WORD *)&v64[12] = 2048;
          *(_QWORD *)&v64[14] = v26;
          _os_log_debug_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEBUG, "[PGCityscapeWallpaperSuggester] processed candidates from %lu to %lu", v64, 0x16u);

        }
        v4 = v42;
        if (objc_msgSend(v42, "isCancelledWithProgress:", 1.0 / (double)(v40 + 1) * 0.8 * (double)v46 + 0.2))break;

        objc_autoreleasePoolPop(context);
        v12 = v46 + 1;
        if (v46 == v40)
        {
          v28 = mach_absolute_time();
          numer = info.numer;
          denom = info.denom;
          v31 = oslog;
          v32 = v31;
          if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
          {
            *(_WORD *)v64 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PGCityscapeWallpaperSuggesterFilterCandidates", ", v64, 2u);
          }

          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v64 = 136315394;
            *(_QWORD *)&v64[4] = "PGCityscapeWallpaperSuggesterFilterCandidates";
            *(_WORD *)&v64[12] = 2048;
            *(double *)&v64[14] = (float)((float)((float)((float)(v28 - v37) * (float)numer) / (float)denom) / 1000000.0);
            _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v64, 0x16u);
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v64 = 67109120;
            *(_DWORD *)&v64[4] = v11;
            _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Found %d positive cityscape assets", v64, 8u);
          }
          v33 = v32;
          v6 = v39;
          v27 = v48;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = objc_msgSend(v48, "count");
            *(_DWORD *)v64 = 67109120;
            *(_DWORD *)&v64[4] = v34;
            _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Found %d candidates after postfiltering", v64, 8u);
          }

          v69 = v78;
          v70 = v79;
          v71 = v80;
          v65 = v74;
          v66 = v75;
          v67 = v76;
          v68 = v77;
          *(_OWORD *)v64 = *(_OWORD *)buf;
          *(_OWORD *)&v64[16] = *(_OWORD *)&buf[16];
          -[PGCityscapeWallpaperSuggester logPosterFilteringStatistics:](self, "logPosterFilteringStatistics:", v64);
          if (self->_secondaryFilteringContext)
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v64 = 0;
              _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Secondary filtering...", v64, 2u);
            }
            v69 = v60;
            v70 = v61;
            v71 = v62;
            v65 = v56;
            v66 = v57;
            v67 = v58;
            v68 = v59;
            *(_OWORD *)v64 = v54;
            *(_OWORD *)&v64[16] = v55;
            -[PGCityscapeWallpaperSuggester logPosterFilteringStatistics:](self, "logPosterFilteringStatistics:", v64);
          }
          if (*(int *)&buf[4] >= 1)
            objc_msgSend(MEMORY[0x1E0D77E10], "logInfo:prefix:avoidForKeyAssetStatistics:", v33, CFSTR("[PGCityscapeWallpaperSuggester]"), &v75);
          v5 = v48;
          goto LABEL_50;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v64 = 67109378;
        *(_DWORD *)&v64[4] = 333;
        *(_WORD *)&v64[8] = 2080;
        *(_QWORD *)&v64[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v64, 0x12u);
      }

      objc_autoreleasePoolPop(context);
      v5 = (id)MEMORY[0x1E0C9AA60];
      v6 = v39;
      v27 = v48;
LABEL_50:

    }
  }

  return v5;
}

- (void)logPosterFilteringStatistics:(id *)a3
{
  void *v4;
  NSObject *v5;
  int var0;
  int var1;
  int var2;
  int var3;
  int var4;
  int var5;
  int var6;
  int var7;
  int var9;
  int var8;
  int var10;
  int var11;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PGAbstractSuggester session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    var3 = a3->var3;
    var4 = a3->var4;
    var5 = a3->var5;
    var6 = a3->var6;
    var7 = a3->var7;
    var8 = a3->var8;
    var9 = a3->var9;
    var10 = a3->var10;
    var11 = a3->var11;
    v18[0] = 67111936;
    v18[1] = var0;
    v19 = 1024;
    v20 = var1;
    v21 = 1024;
    v22 = var2;
    v23 = 1024;
    v24 = var3;
    v25 = 1024;
    v26 = var9;
    v27 = 1024;
    v28 = var4;
    v29 = 1024;
    v30 = var5;
    v31 = 1024;
    v32 = var6;
    v33 = 1024;
    v34 = var7;
    v35 = 1024;
    v36 = var8;
    v37 = 1024;
    v38 = var10;
    v39 = 1024;
    v40 = var11;
    _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthetics, %d for wallpaper score, %d for aesthetics+wallpaper, %d for clock overlap, %d for low resolution, %d for crop score, %d for not safe for display, %d for positive people scene, %d for low light, %d for sensitive location", (uint8_t *)v18, 0x4Au);
  }

}

- (id)sortedDedupedCandidatesFromCandidates:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint32_t numer;
  uint32_t denom;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t spid;
  uint64_t v40;
  NSObject *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  double v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _QWORD v67[8];

  v67[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "loggingConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  v42 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGCityscapeWallpaperSuggesterDedupeAndRank", ", buf, 2u);
  }
  spid = v6;

  info = 0;
  mach_timebase_info(&info);
  v40 = mach_absolute_time();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_307);
  -[PGCityscapeWallpaperSuggesterFilteringContext timeIntervalForCandidateDeduping](self->_primaryFilteringContext, "timeIntervalForCandidateDeduping");
  objc_msgSend(v9, "setMaximumDistance:");
  objc_msgSend(v9, "setMinimumNumberOfObjects:", 1);
  v43 = v9;
  v45 = v4;
  objc_msgSend(v9, "performWithDataset:progressBlock:", v4, &__block_literal_global_308);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = v8;
    v12 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v62 = (const char *)v12;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Deduped to %lu clusters", buf, 0xCu);

  }
  v41 = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.favorite"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.mediaAnalysisProperties.wallpaperScore"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v14;
  objc_msgSend(MEMORY[0x1E0D77F20], "cropScoreSortDescriptorForOrientation:", -[PGCityscapeWallpaperSuggesterFilteringContext orientation](self->_primaryFilteringContext, "orientation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.creationDate"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v16;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.uuid"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v67[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v10;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v57 != v48)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1CAA4EB2C]();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v20, "objects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        if (!v23)
        {
          v25 = v22;
          goto LABEL_21;
        }
        v24 = v23;
        v50 = v21;
        v51 = i;
        v25 = 0;
        v26 = *(_QWORD *)v53;
        do
        {
          v27 = 0;
          v28 = v25;
          do
          {
            if (*(_QWORD *)v53 != v26)
              objc_enumerationMutation(v22);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v27), v28, 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "sortedArrayUsingDescriptors:", v18);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "firstObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            ++v27;
            v28 = v25;
          }
          while (v24 != v27);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        }
        while (v24);

        v21 = v50;
        i = v51;
        if (v25)
        {
          objc_msgSend(v46, "addObject:", v25);
LABEL_21:

        }
        objc_autoreleasePoolPop(v21);
      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v49);
  }

  objc_msgSend(v46, "sortUsingDescriptors:", v18);
  v31 = v41;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = objc_msgSend(v46, "count");
    *(_DWORD *)buf = 134217984;
    v62 = (const char *)v32;
    _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Ranked & deduped to %lu candidates", buf, 0xCu);
  }

  v33 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v36 = v31;
  v37 = v36;
  if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v37, OS_SIGNPOST_INTERVAL_END, spid, "PGCityscapeWallpaperSuggesterDedupeAndRank", ", buf, 2u);
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v62 = "PGCityscapeWallpaperSuggesterDedupeAndRank";
    v63 = 2048;
    v64 = (float)((float)((float)((float)(v33 - v40) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v46;
}

- (PGCityscapeWallpaperSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFilteringContext, a3);
}

- (PGCityscapeWallpaperSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setSecondaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFilteringContext, a3);
}

- (PGCityscapeWallpaperSuggesterScoringContext)scoringContext
{
  return self->_scoringContext;
}

- (void)setScoringContext:(id)a3
{
  objc_storeStrong((id *)&self->_scoringContext, a3);
}

- (PGCityscapeWallpaperSuggesterDistancingContext)distancingContext
{
  return self->_distancingContext;
}

- (void)setDistancingContext:(id)a3
{
  objc_storeStrong((id *)&self->_distancingContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_secondaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_primaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_peopleSceneConfidenceThresholdHelper, 0);
  objc_storeStrong((id *)&self->_assetGater, 0);
}

double __71__PGCityscapeWallpaperSuggester_sortedDedupedCandidatesFromCandidates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = fabs(v9);

  return v10;
}

uint64_t __65__PGCityscapeWallpaperSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(a1 + 48) * a2 + 0.9);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

+ (CLSSceneTaxonomyHierarchy)sceneTaxonomy
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)sceneTaxonomy_sceneTaxonomy;
  if (!sceneTaxonomy_sceneTaxonomy)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 0);
    v4 = (void *)sceneTaxonomy_sceneTaxonomy;
    sceneTaxonomy_sceneTaxonomy = v3;

    v2 = (void *)sceneTaxonomy_sceneTaxonomy;
  }
  return (CLSSceneTaxonomyHierarchy *)v2;
}

+ (id)suggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 6);
}

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 655);
}

+ (BOOL)filtersForTopSuggestions
{
  return 0;
}

+ (BOOL)filtersForAmbientSuggestions
{
  return 0;
}

+ (id)prefilteringInternalPredicateWithForbiddenAssetUUIDs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kindSubtype"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToSceneVersion:", &unk_1E84E2978);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K > %d"), CFSTR("additionalAttributes"), CFSTR("faceAnalysisVersion"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count == %d"), CFSTR("detectedFaces"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("playbackStyle"), &unk_1E84E95C8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("uuid"), v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)candidatesFromAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PGCityscapeWallpaperSuggestionCandidate *v11;
  PGCityscapeWallpaperSuggestionCandidate *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PGCityscapeWallpaperSuggestionCandidate alloc];
        v12 = -[PGCityscapeWallpaperSuggestionCandidate initWithAsset:](v11, "initWithAsset:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)isPositiveWithUrbanSceneLabelsForAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PGSceneAssetFilter *v7;
  void *v8;
  id v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("cityscape");
  v12 = CFSTR("skyscraper");
  v13 = CFSTR("Q702492");
  v14 = CFSTR("Q200250");
  v15 = CFSTR("Q174782");
  v16 = CFSTR("Q18142");
  v17 = CFSTR("Q2997369");
  v18 = CFSTR("Q1050303");
  v19 = CFSTR("Q515");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [PGSceneAssetFilter alloc];
  objc_msgSend(a1, "sceneTaxonomy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGSceneAssetFilter initForEntityNetWithSceneNames:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:](v7, "initForEntityNetWithSceneNames:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:", v6, &__block_literal_global_6272, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v8, v11, v12, v13, v14, v15, v16, v17, v18,
         v19,
         v20);

  LOBYTE(v8) = objc_msgSend(v9, "passesWithAsset:", v5);
  return (char)v8;
}

+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 thresholdHelper:(id)a6 statistics:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  float v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  float v35;
  char v36;
  double v37;
  double v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  float v48;
  double v49;
  char v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  int *p_var6;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  float v67;
  double v68;
  void *v70;
  _BOOL4 v71;
  int v72;
  double v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a5;
  objc_msgSend(v11, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "curationModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userFeedbackCalculator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = objc_msgSend(v16, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", v15, v17);
  if ((_DWORD)v14)
  {
    v18 = 0;
    ++a7->var0;
    goto LABEL_47;
  }
  if (objc_msgSend(v16, "avoidIfPossibleForKeyAssetWithAsset:statistics:", v15, &a7->var12))
  {
    v18 = 0;
    ++a7->var1;
    goto LABEL_47;
  }
  objc_msgSend(v16, "aestheticsModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "overallAestheticScoreNode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "highPrecisionOperatingPoint");
  v22 = v21;

  objc_msgSend(v15, "overallAestheticScore");
  if (v22 > v23)
  {
    v18 = 0;
    ++a7->var2;
    goto LABEL_47;
  }
  objc_msgSend(v12, "absoluteMinimumWallpaperScore");
  v25 = v24;
  if (v24 < 0.0)
  {
    objc_msgSend(v16, "wallpaperScoreModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "minimumWallpaperScoreNode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "operatingPoint");
    v25 = v28;

  }
  objc_msgSend(v15, "mediaAnalysisProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "wallpaperScore");
  v31 = v30;

  if (v25 > v31)
  {
    v18 = 0;
    ++a7->var3;
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleForKey:", CFSTR("PGCityscapeWallpaperSuggesterAestheticScore"));
  v34 = v33;

  if (v34 <= 0.0)
  {
    v36 = objc_msgSend(v16, "isAestheticallyPrettyGoodWithAsset:", v15);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v72 = 134217984;
      v73 = v34;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Using custom aesthetics score %.2f ", (uint8_t *)&v72, 0xCu);
    }
    objc_msgSend(v15, "overallAestheticScore");
    v36 = v34 <= v35;
  }
  objc_msgSend(v12, "minimumWallpaperScore");
  v38 = v37;
  if (v37 < 0.0)
  {
    v39 = objc_msgSend((id)objc_opt_class(), "filtersForAmbientSuggestions");
    objc_msgSend(v16, "wallpaperScoreModel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "cityscapeNode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v39)
      objc_msgSend(v41, "highRecallOperatingPoint");
    else
      objc_msgSend(v41, "highPrecisionOperatingPoint");
    v38 = v43;

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "doubleForKey:", CFSTR("PGCityscapeWallpaperSuggesterWallpaperScore"));
  v46 = v45;

  if (v46 > 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v72 = 134217984;
      v73 = v46;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Using custom wallpaper score %.2f ", (uint8_t *)&v72, 0xCu);
    }
    v38 = v46;
  }
  objc_msgSend(v15, "mediaAnalysisProperties");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "wallpaperScore");
  v49 = v48;

  if (v38 <= v49)
    v50 = 1;
  else
    v50 = v36;
  if ((v50 & 1) == 0)
  {
    v18 = 0;
    ++a7->var9;
    goto LABEL_47;
  }
  if ((objc_msgSend(v12, "bypassCropScoreCheck") & 1) == 0)
  {
    objc_msgSend(v11, "cropResult");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "cropForOrientation:", objc_msgSend(v12, "orientation"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "ignoreClockOverlap") & 1) != 0 || objc_msgSend(v52, "passesClockOverlap"))
    {
      objc_msgSend(v52, "cropZoomRatio");
      v54 = v53;
      objc_msgSend(v12, "maximumCropZoomRatio");
      if (v54 <= v55)
      {
        objc_msgSend(v52, "cropScore");
        v58 = v57;
        objc_msgSend(v12, "minimumCropScore");
        if (v58 >= v59)
        {

          goto LABEL_30;
        }
        p_var6 = &a7->var6;
      }
      else
      {
        p_var6 = &a7->var5;
      }
    }
    else
    {
      p_var6 = &a7->var4;
    }
    ++*p_var6;

    v18 = 0;
    goto LABEL_47;
  }
LABEL_30:
  if ((objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", v15) & 1) != 0)
  {
    if (+[PGWallpaperSuggestionUtilities foundDominantPeopleSceneInAsset:withConfidenceThresholdHelper:](PGWallpaperSuggestionUtilities, "foundDominantPeopleSceneInAsset:withConfidenceThresholdHelper:", v15, v13))
    {
      v18 = 0;
      ++a7->var8;
    }
    else
    {
      objc_msgSend(v12, "maximumLowLightScore");
      v61 = v60;
      if (v60 < 0.0)
      {
        objc_msgSend(v15, "curationModel");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "aestheticsModel");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "lowLightNode");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "operatingPoint");
        v61 = v65;

      }
      objc_msgSend(v15, "aestheticProperties");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "lowLight");
      v68 = v67;

      if (v61 >= v68)
      {
        objc_msgSend(v11, "asset");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = +[PGSensitiveLocationBlocklistConfiguration isAssetAtSensitiveLocationAndDate:](PGSensitiveLocationBlocklistConfiguration, "isAssetAtSensitiveLocationAndDate:", v70);

        if (v71)
        {
          v18 = 0;
          ++a7->var11;
        }
        else
        {
          v18 = 1;
        }
      }
      else
      {
        v18 = 0;
        ++a7->var10;
      }
    }
  }
  else
  {
    v18 = 0;
    ++a7->var7;
  }
LABEL_47:

  return v18;
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
  int v19;
  PGCityscapeWallpaperSuggestionCandidate *v20;
  PGCityscapeWallpaperSuggesterFilteringContext *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  PGWallpaperSuggestionAssetGater *v25;
  PGWallpaperSuggestionAssetGater *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v35;
  uint64_t v36;
  PGCityscapeWallpaperSuggestionCandidate *v37;
  void *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(a1, "isPositiveWithUrbanSceneLabelsForAsset:", v10) & 1) != 0)
  {
    objc_msgSend(v10, "photoLibrary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "prefilteringInternalPredicateWithForbiddenAssetUUIDs:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v13);

    v14 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v10, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchAssetsWithLocalIdentifiers:options:", v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v23 = 0;
      if (a6)
        *a6 = CFSTR("Fails Predicate");
      goto LABEL_29;
    }
    v19 = objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions");
    v20 = -[PGCityscapeWallpaperSuggestionCandidate initWithAsset:]([PGCityscapeWallpaperSuggestionCandidate alloc], "initWithAsset:", v10);
    v21 = [PGCityscapeWallpaperSuggesterFilteringContext alloc];
    if ((v19 & 1) != 0)
      v22 = -[PGCityscapeWallpaperSuggesterFilteringContext initForTopCityscapesInOrientation:](v21, "initForTopCityscapesInOrientation:", a5);
    else
      v22 = -[PGCityscapeWallpaperSuggesterFilteringContext initForCityscapesInOrientation:](v21, "initForCityscapesInOrientation:", a5);
    v24 = (void *)v22;
    +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper](PGWallpaperSuggestionUtilities, "peopleSceneConfidenceThresholdHelper");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v20;
    if ((objc_msgSend(a1, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v20, v24, v11) & 1) != 0)
    {
      if (v19)
      {
        v25 = [PGWallpaperSuggestionAssetGater alloc];
        v26 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v25, "initWithType:loggingConnection:", 4, MEMORY[0x1E0C81028]);
        v23 = 1;
        -[PGWallpaperSuggestionAssetGater setCoversTracks:](v26, "setCoversTracks:", 1);
        -[PGWallpaperSuggestionAssetGater setIsUserInitiated:](v26, "setIsUserInitiated:", 1);
        -[PGWallpaperSuggestionAssetGater gateAsset:progressBlock:](v26, "gateAsset:progressBlock:", v10, &__block_literal_global_298);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v35, "passesAnyGating") & 1) != 0)
        {
          v27 = CFSTR("Pass Segmented");
        }
        else
        {
          -[PGCityscapeWallpaperSuggestionCandidate cropResult](v20, "cropResult");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cropForOrientation:", a5);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v24, "ignoreClockOverlap") & 1) != 0
            || objc_msgSend(v29, "passesClockOverlap"))
          {
            objc_msgSend(v29, "cropScore");
            v31 = v30;
            objc_msgSend(v24, "minimumCropScore");
            v23 = v31 >= v32;
            if (v31 < v32)
              v27 = CFSTR("Low Crop Score");
            else
              v27 = CFSTR("Pass Unsegmented");
          }
          else
          {
            v23 = 0;
            v27 = CFSTR("Clock Overlap");
          }

        }
      }
      else
      {
        v27 = CFSTR("Pass");
        v23 = 1;
      }
      v33 = (void *)v36;
      if (!a6)
        goto LABEL_28;
    }
    else
    {
      if (!a6)
      {
        v23 = 0;
        v33 = (void *)v36;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      v23 = 0;
      v27 = CFSTR("Unknown Reason");
      v33 = (void *)v36;
    }
    *a6 = v27;
    goto LABEL_28;
  }
  v23 = 0;
  if (a6)
    *a6 = CFSTR("No Urban Scene");
LABEL_30:

  return v23;
}

uint64_t __72__PGCityscapeWallpaperSuggester_isPositiveWithUrbanSceneLabelsForAsset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trendsSceneModel");
}

@end
